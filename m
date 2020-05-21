Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46F0A1DC44C
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2020 02:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727068AbgEUAyO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 May 2020 20:54:14 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:33586 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727927AbgEUAyM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 May 2020 20:54:12 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id DCBD280005C9;
        Thu, 21 May 2020 00:54:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id GVLJ1IN06VAq; Thu, 21 May 2020 03:54:07 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Paul Burton <paulburton@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Ralf Baechle <ralf@linux-mips.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, <linux-mips@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 6/7] clocksource: mips-gic-timer: Register as sched_clock
Date:   Thu, 21 May 2020 03:53:19 +0300
Message-ID: <20200521005321.12129-7-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200521005321.12129-1-Sergey.Semin@baikalelectronics.ru>
References: <20200521005321.12129-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Paul Burton <paulburton@kernel.org>

The MIPS GIC timer is well suited for use as sched_clock, so register it
as such.

Whilst the existing gic_read_count() function matches the prototype
needed by sched_clock_register() already, we split it into 2 functions
in order to remove the need to evaluate the mips_cm_is64 condition
within each call since sched_clock should be as fast as possible.

Note the sched clock framework needs the clock source being stable in
order to rely on it. So we register the MIPS GIC timer as schedule clocks
only if it's, if either the system doesn't have CPU-frequency enabled or
the CPU frequency is changed by means of the CPC core clock divider
available on the platforms with CM3 or newer.

Signed-off-by: Paul Burton <paulburton@kernel.org>
Co-developed-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
[Sergey.Semin@baikalelectronics.ru: Register sched-clock if CM3 or !CPU-freq]
Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: linux-mips@vger.kernel.org
Cc: linux-rtc@vger.kernel.org
Cc: devicetree@vger.kernel.org

---

Changelog v3:
- Register sched clocks only if MIPS GIC belongs to CM3 or if CPU-freq
  isn't supported.
---
 drivers/clocksource/mips-gic-timer.c | 31 ++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index 8b5f8ae723cb..ef12c12c2432 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -16,6 +16,7 @@
 #include <linux/notifier.h>
 #include <linux/of_irq.h>
 #include <linux/percpu.h>
+#include <linux/sched_clock.h>
 #include <linux/smp.h>
 #include <linux/time.h>
 #include <asm/mips-cps.h>
@@ -24,13 +25,10 @@ static DEFINE_PER_CPU(struct clock_event_device, gic_clockevent_device);
 static int gic_timer_irq;
 static unsigned int gic_frequency;
 
-static u64 notrace gic_read_count(void)
+static u64 notrace gic_read_count_2x32(void)
 {
 	unsigned int hi, hi2, lo;
 
-	if (mips_cm_is64)
-		return read_gic_counter();
-
 	do {
 		hi = read_gic_counter_32h();
 		lo = read_gic_counter_32l();
@@ -40,6 +38,19 @@ static u64 notrace gic_read_count(void)
 	return (((u64) hi) << 32) + lo;
 }
 
+static u64 notrace gic_read_count_64(void)
+{
+	return read_gic_counter();
+}
+
+static u64 notrace gic_read_count(void)
+{
+	if (mips_cm_is64)
+		return gic_read_count_64();
+
+	return gic_read_count_2x32();
+}
+
 static int gic_next_event(unsigned long delta, struct clock_event_device *evt)
 {
 	int cpu = cpumask_first(evt->cpumask);
@@ -228,6 +239,18 @@ static int __init gic_clocksource_of_init(struct device_node *node)
 	/* And finally start the counter */
 	clear_gic_config(GIC_CONFIG_COUNTSTOP);
 
+	/*
+	 * It's safe to use the MIPS GIC timer as a sched clock source only if
+	 * its ticks are stable, which is true on either the platforms with
+	 * stable CPU frequency or on the platforms with CM3 and CPU frequency
+	 * change performed by the CPC core clocks divider.
+	 */
+	if (mips_cm_revision() >= CM_REV_CM3 || !IS_ENABLED(CONFIG_CPU_FREQ)) {
+		sched_clock_register(mips_cm_is64 ?
+				     gic_read_count_64 : gic_read_count_2x32,
+				     64, gic_frequency);
+	}
+
 	return 0;
 }
 TIMER_OF_DECLARE(mips_gic_timer, "mti,gic-timer",
-- 
2.25.1

