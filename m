Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 464C817BD34
	for <lists+linux-mips@lfdr.de>; Fri,  6 Mar 2020 13:50:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726251AbgCFMtS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 6 Mar 2020 07:49:18 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:35726 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727291AbgCFMtS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 6 Mar 2020 07:49:18 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 20636803079F;
        Fri,  6 Mar 2020 12:49:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Y9qB47JrHVtj; Fri,  6 Mar 2020 15:49:15 +0300 (MSK)
From:   <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 19/22] mips: Add udelay lpj numbers adjustment
Date:   Fri, 6 Mar 2020 15:47:02 +0300
In-Reply-To: <20200306124705.6595-1-Sergey.Semin@baikalelectronics.ru>
References: <20200306124705.6595-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Message-Id: <20200306124916.20636803079F@mail.baikalelectronics.ru>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Serge Semin <Sergey.Semin@baikalelectronics.ru>

Loops-per-jiffies is a special number which represents a number of
noop-loop cycles per CPU-scheduler quantum - jiffies. As you
understand aside from CPU-specific implementation it depends on
the CPU frequency. So when a platform has the CPU frequency fixed,
we have no problem and the current udelay interface will work
just fine. But as soon as CPU-freq driver is enabled and the cores
frequency changes, we'll end up with distorted udelay's. In order
to fix this we have to accordinly adjust the per-CPU udelay_val
(the same as the global loops_per_jiffy) number. This can be done
in the CPU-freq transition event handler. We subscribe to that event
in the MIPS arch time-inititalization method.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
---
 arch/mips/kernel/time.c | 70 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/mips/kernel/time.c b/arch/mips/kernel/time.c
index 37e9413a393d..ce89e18af024 100644
--- a/arch/mips/kernel/time.c
+++ b/arch/mips/kernel/time.c
@@ -18,12 +18,82 @@
 #include <linux/smp.h>
 #include <linux/spinlock.h>
 #include <linux/export.h>
+#include <linux/cpufreq.h>
+#include <linux/delay.h>
 
 #include <asm/cpu-features.h>
 #include <asm/cpu-type.h>
 #include <asm/div64.h>
 #include <asm/time.h>
 
+#ifdef CONFIG_CPU_FREQ
+
+static DEFINE_PER_CPU(unsigned long, pcp_lpj_ref);
+static DEFINE_PER_CPU(unsigned long, pcp_lpj_ref_freq);
+static unsigned long glb_lpj_ref;
+static unsigned long glb_lpj_ref_freq;
+
+static int cpufreq_callback(struct notifier_block *nb,
+			    unsigned long val, void *data)
+{
+	struct cpufreq_freqs *freq = data;
+	struct cpumask *cpus = freq->policy->cpus;
+	unsigned long lpj;
+	int cpu;
+
+	/*
+	 * Skip lpj numbers adjustment if the CPU-freq transition is safe for
+	 * the loops delay. (Is this possible?)
+	 */
+	if (freq->flags & CPUFREQ_CONST_LOOPS)
+		return NOTIFY_OK;
+
+	/* Save the initial values of the lpjes for future scaling. */
+	if (!glb_lpj_ref) {
+		glb_lpj_ref = boot_cpu_data.udelay_val;
+		glb_lpj_ref_freq = freq->old;
+
+		for_each_online_cpu(cpu) {
+			per_cpu(pcp_lpj_ref, cpu) =
+				cpu_data[cpu].udelay_val;
+			per_cpu(pcp_lpj_ref_freq, cpu) = freq->old;
+		}
+	}
+
+	/*
+	 * Adjust global lpj variable and per-CPU udelay_val number in
+	 * accordance with the new CPU frequency.
+	 */
+	if ((val == CPUFREQ_PRECHANGE  && freq->old < freq->new) ||
+	    (val == CPUFREQ_POSTCHANGE && freq->old > freq->new)) {
+		loops_per_jiffy = cpufreq_scale(glb_lpj_ref,
+						glb_lpj_ref_freq,
+						freq->new);
+
+		for_each_cpu(cpu, cpus) {
+			lpj = cpufreq_scale(per_cpu(pcp_lpj_ref, cpu),
+					    per_cpu(pcp_lpj_ref_freq, cpu),
+					    freq->new);
+			cpu_data[cpu].udelay_val = (unsigned int)lpj;
+		}
+	}
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block cpufreq_notifier = {
+	.notifier_call  = cpufreq_callback,
+};
+
+static int __init register_cpufreq_notifier(void)
+{
+	return cpufreq_register_notifier(&cpufreq_notifier,
+					 CPUFREQ_TRANSITION_NOTIFIER);
+}
+core_initcall(register_cpufreq_notifier);
+
+#endif /* !CONFIG_CPU_FREQ */
+
 /*
  * forward reference
  */
-- 
2.25.1

