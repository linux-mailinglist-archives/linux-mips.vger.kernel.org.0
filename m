Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23A9917BD38
	for <lists+linux-mips@lfdr.de>; Fri,  6 Mar 2020 13:50:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727366AbgCFMtX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 6 Mar 2020 07:49:23 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:35752 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727387AbgCFMtW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 6 Mar 2020 07:49:22 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 228448030794;
        Fri,  6 Mar 2020 12:49:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id msL3ZZHxO_QW; Fri,  6 Mar 2020 15:49:20 +0300 (MSK)
From:   <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 21/22] mips: cevt-r4k: Update the r4k-clockevent frequency in sync with CPU
Date:   Fri, 6 Mar 2020 15:47:04 +0300
In-Reply-To: <20200306124705.6595-1-Sergey.Semin@baikalelectronics.ru>
References: <20200306124705.6595-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Message-Id: <20200306124921.228448030794@mail.baikalelectronics.ru>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Serge Semin <Sergey.Semin@baikalelectronics.ru>

Due to being embedded into the CPU cores MIPS count/compare timer
frequency is changed together with the CPU clocks alteration.
In case if frequency really changes the kernel clockevent framework
must be notified, otherwise the kernel timers won't work correctly.
Fix this by calling clockevents_update_freq() for each r4k clockevent
handlers registered per available CPUs.

Traditionally MIPS r4k-clock are clocked with CPU frequency divided by 2.
But this isn't true for some of the platforms. Due to this we have to save
the basic CPU frequency, so then use it to scale the initial timer
frequency (mips_hpt_frequency) and pass the updated value further to the
clockevent framework.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
---
 arch/mips/kernel/cevt-r4k.c | 44 +++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/mips/kernel/cevt-r4k.c b/arch/mips/kernel/cevt-r4k.c
index dd6a18bc10ab..f24377c1e8d7 100644
--- a/arch/mips/kernel/cevt-r4k.c
+++ b/arch/mips/kernel/cevt-r4k.c
@@ -8,6 +8,7 @@
  */
 #include <linux/clockchips.h>
 #include <linux/interrupt.h>
+#include <linux/cpufreq.h>
 #include <linux/percpu.h>
 #include <linux/smp.h>
 #include <linux/irq.h>
@@ -250,6 +251,49 @@ unsigned int __weak get_c0_compare_int(void)
 	return MIPS_CPU_IRQ_BASE + cp0_compare_irq;
 }
 
+#ifdef CONFIG_CPU_FREQ
+
+static unsigned long mips_ref_freq;
+
+static int cpufreq_callback(struct notifier_block *nb,
+			    unsigned long val, void *data)
+{
+	struct cpufreq_freqs *freq = data;
+	struct clock_event_device *cd;
+	unsigned long rate;
+	int cpu;
+
+	if (!mips_ref_freq)
+		mips_ref_freq = freq->old;
+
+	if (val == CPUFREQ_POSTCHANGE) {
+		rate = cpufreq_scale(mips_hpt_frequency, mips_ref_freq,
+				     freq->new);
+
+		for_each_cpu(cpu, freq->policy->cpus) {
+			cd = &per_cpu(mips_clockevent_device, cpu);
+
+			clockevents_update_freq(cd, rate);
+		}
+	}
+
+	return 0;
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
+
+}
+core_initcall(register_cpufreq_notifier);
+
+#endif /* !CONFIG_CPU_FREQ */
+
 int r4k_clockevent_init(void)
 {
 	unsigned int cpu = smp_processor_id();
-- 
2.25.1

