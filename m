Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C89D51EA4AB
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jun 2020 15:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728368AbgFANNW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Jun 2020 09:13:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbgFANLl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Jun 2020 09:11:41 -0400
Received: from Galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22561C061A0E;
        Mon,  1 Jun 2020 06:11:41 -0700 (PDT)
Received: from [5.158.153.53] (helo=tip-bot2.lab.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tip-bot2@linutronix.de>)
        id 1jfkE4-0006z9-Uk; Mon, 01 Jun 2020 15:11:37 +0200
Received: from [127.0.1.1] (localhost [IPv6:::1])
        by tip-bot2.lab.linutronix.de (Postfix) with ESMTP id 93E701C0481;
        Mon,  1 Jun 2020 15:11:36 +0200 (CEST)
Date:   Mon, 01 Jun 2020 13:11:36 -0000
From:   "tip-bot2 for Paul Burton" <tip-bot2@linutronix.de>
Reply-to: linux-kernel@vger.kernel.org
To:     linux-tip-commits@vger.kernel.org
Subject: [tip: timers/core] clocksource: mips-gic-timer: Register as sched_clock
Cc:     Paul Burton <paulburton@kernel.org>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ralf Baechle <ralf@linux-mips.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        x86 <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <20200521204818.25436-8-Sergey.Semin@baikalelectronics.ru>
References: <20200521204818.25436-8-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Message-ID: <159101709641.17951.17143096075240874128.tip-bot2@tip-bot2>
X-Mailer: tip-git-log-daemon
Robot-ID: <tip-bot2.linutronix.de>
Robot-Unsubscribe: Contact <mailto:tglx@linutronix.de> to get blacklisted from these emails
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     48016e78d328998b1f00bcfb639adeabca51abe5
Gitweb:        https://git.kernel.org/tip/48016e78d328998b1f00bcfb639adeabca51abe5
Author:        Paul Burton <paulburton@kernel.org>
AuthorDate:    Thu, 21 May 2020 23:48:16 +03:00
Committer:     Daniel Lezcano <daniel.lezcano@linaro.org>
CommitterDate: Sat, 23 May 2020 00:03:08 +02:00

clocksource: mips-gic-timer: Register as sched_clock

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
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Link: https://lore.kernel.org/r/20200521204818.25436-8-Sergey.Semin@baikalelectronics.ru
---
 drivers/clocksource/mips-gic-timer.c | 31 +++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index 8b5f8ae..ef12c12 100644
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
