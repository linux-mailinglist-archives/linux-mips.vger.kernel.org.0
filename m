Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4CF01DC3B4
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2020 02:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727867AbgEUAfp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 May 2020 20:35:45 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:33264 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727785AbgEUAff (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 May 2020 20:35:35 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id E6A5E8029EB7;
        Thu, 21 May 2020 00:35:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 282dDLsDfqmV; Thu, 21 May 2020 03:35:32 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Alexander Lobakin <alobakin@dlink.ru>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 13/14] mips: csrc-r4k: Mark R4K timer as unstable if CPU freq changes
Date:   Thu, 21 May 2020 03:34:42 +0300
Message-ID: <20200521003443.11385-14-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200521003443.11385-1-Sergey.Semin@baikalelectronics.ru>
References: <20200521003443.11385-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit 07d69579e7fe ("MIPS: Don't register r4k sched clock when CPUFREQ
enabled") disabled the r4k-clock usage for scheduler ticks counting due
to the scheduler being non-tolerant for unstable clocks sources. For the
same reason the clock should be used in the system clocksource framework
with care. As soon as CPU frequency changes the clocksource framework
should be notified about this by marking the R4K timer being unstable
(which it really is, since the ticks rate has been changed synchronously
with the CPU frequency).

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org

---

Changelog v3:
- Mark clocksource as unstable instead of lowering its rating.
---
 arch/mips/Kconfig           |  1 +
 arch/mips/kernel/csrc-r4k.c | 40 +++++++++++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index b0eff203fbd8..c2911864fee1 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1154,6 +1154,7 @@ config CSRC_IOASIC
 	bool
 
 config CSRC_R4K
+	select CLOCKSOURCE_WATCHDOG if CPU_FREQ
 	bool
 
 config CSRC_SB1250
diff --git a/arch/mips/kernel/csrc-r4k.c b/arch/mips/kernel/csrc-r4k.c
index 437dda64fd7a..edc4afc080fa 100644
--- a/arch/mips/kernel/csrc-r4k.c
+++ b/arch/mips/kernel/csrc-r4k.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2007 by Ralf Baechle
  */
 #include <linux/clocksource.h>
+#include <linux/cpufreq.h>
 #include <linux/init.h>
 #include <linux/sched_clock.h>
 
@@ -65,6 +66,45 @@ static bool rdhwr_count_usable(void)
 	return false;
 }
 
+#ifdef CONFIG_CPU_FREQ
+
+static bool __read_mostly r4k_clock_unstable;
+
+static void r4k_clocksource_unstable(char *reason)
+{
+	if (r4k_clock_unstable)
+		return;
+
+	r4k_clock_unstable = true;
+
+	pr_info("R4K timer is unstable due to %s\n", reason);
+
+	clocksource_mark_unstable(&clocksource_mips);
+}
+
+static int r4k_cpufreq_callback(struct notifier_block *nb,
+				unsigned long val, void *data)
+{
+	if (val == CPUFREQ_POSTCHANGE)
+		r4k_clocksource_unstable("CPU frequency change");
+
+	return 0;
+}
+
+static struct notifier_block r4k_cpufreq_notifier = {
+	.notifier_call  = r4k_cpufreq_callback,
+};
+
+static int __init r4k_register_cpufreq_notifier(void)
+{
+	return cpufreq_register_notifier(&r4k_cpufreq_notifier,
+					 CPUFREQ_TRANSITION_NOTIFIER);
+
+}
+core_initcall(r4k_register_cpufreq_notifier);
+
+#endif /* !CONFIG_CPU_FREQ */
+
 int __init init_r4k_clocksource(void)
 {
 	if (!cpu_has_counter || !mips_hpt_frequency)
-- 
2.25.1

