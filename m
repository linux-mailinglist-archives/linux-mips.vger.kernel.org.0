Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01F3B1EA4B4
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jun 2020 15:13:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728388AbgFANNb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Jun 2020 09:13:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726201AbgFANLl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Jun 2020 09:11:41 -0400
Received: from Galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BFF8C08C5C0;
        Mon,  1 Jun 2020 06:11:41 -0700 (PDT)
Received: from [5.158.153.53] (helo=tip-bot2.lab.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tip-bot2@linutronix.de>)
        id 1jfkE4-0006yq-FJ; Mon, 01 Jun 2020 15:11:36 +0200
Received: from [127.0.1.1] (localhost [IPv6:::1])
        by tip-bot2.lab.linutronix.de (Postfix) with ESMTP id 0BA3F1C0244;
        Mon,  1 Jun 2020 15:11:36 +0200 (CEST)
Date:   Mon, 01 Jun 2020 13:11:35 -0000
From:   "tip-bot2 for Serge Semin" <tip-bot2@linutronix.de>
Reply-to: linux-kernel@vger.kernel.org
To:     linux-tip-commits@vger.kernel.org
Subject: [tip: timers/core] clocksource: mips-gic-timer: Mark GIC timer as
 unstable if ref clock changes
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        x86 <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <20200521204818.25436-9-Sergey.Semin@baikalelectronics.ru>
References: <20200521204818.25436-9-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Message-ID: <159101709590.17951.10382391604771292137.tip-bot2@tip-bot2>
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

Commit-ID:     7d7de1a65349811b24971c5e8e040e6aac192dd4
Gitweb:        https://git.kernel.org/tip/7d7de1a65349811b24971c5e8e040e6aac192dd4
Author:        Serge Semin <Sergey.Semin@baikalelectronics.ru>
AuthorDate:    Thu, 21 May 2020 23:48:17 +03:00
Committer:     Daniel Lezcano <daniel.lezcano@linaro.org>
CommitterDate: Sat, 23 May 2020 00:03:16 +02:00

clocksource: mips-gic-timer: Mark GIC timer as unstable if ref clock changes

Currently clocksource framework doesn't support the clocks with variable
frequency. Since MIPS GIC timer ticks rate might be unstable on some
platforms, we must make sure that it justifies the clocksource
requirements. MIPS GIC timer is incremented with the CPU cluster reference
clocks rate. So in case if CPU frequency changes, the MIPS GIC tick rate
changes synchronously. Due to this the clocksource subsystem can't rely on
the timer to measure system clocks anymore. This commit marks the MIPS GIC
based clocksource as unstable if reference clock (normally it's a CPU
reference clocks) rate changes. The clocksource will execute a watchdog
thread, which lowers the MIPS GIC timer rating to zero and fallbacks to a
new stable one.

Note we don't need to set the CLOCK_SOURCE_MUST_VERIFY flag to the MIPS
GIC clocksource since normally the timer is stable. The only reason why
it gets unstable is due to the ref clock rate change, which event we
detect here in the driver by means of the clocks event notifier.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Alessandro Zummo <a.zummo@towertech.it>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: linux-mips@vger.kernel.org
Cc: linux-rtc@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Link: https://lore.kernel.org/r/20200521204818.25436-9-Sergey.Semin@baikalelectronics.ru
---
 drivers/clocksource/Kconfig          |  1 +
 drivers/clocksource/mips-gic-timer.c | 19 ++++++++++++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index c824002..9141838 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -570,6 +570,7 @@ config CLKSRC_VERSATILE
 config CLKSRC_MIPS_GIC
 	bool
 	depends on MIPS_GIC
+	select CLOCKSOURCE_WATCHDOG
 	select TIMER_OF
 
 config CLKSRC_TANGO_XTAL
diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index ef12c12..be4175f 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -24,6 +24,9 @@
 static DEFINE_PER_CPU(struct clock_event_device, gic_clockevent_device);
 static int gic_timer_irq;
 static unsigned int gic_frequency;
+static bool __read_mostly gic_clock_unstable;
+
+static void gic_clocksource_unstable(char *reason);
 
 static u64 notrace gic_read_count_2x32(void)
 {
@@ -125,8 +128,10 @@ static int gic_clk_notifier(struct notifier_block *nb, unsigned long action,
 {
 	struct clk_notifier_data *cnd = data;
 
-	if (action == POST_RATE_CHANGE)
+	if (action == POST_RATE_CHANGE) {
+		gic_clocksource_unstable("ref clock rate change");
 		on_each_cpu(gic_update_frequency, (void *)cnd->new_rate, 1);
+	}
 
 	return NOTIFY_OK;
 }
@@ -172,6 +177,18 @@ static struct clocksource gic_clocksource = {
 	.vdso_clock_mode	= VDSO_CLOCKMODE_GIC,
 };
 
+static void gic_clocksource_unstable(char *reason)
+{
+	if (gic_clock_unstable)
+		return;
+
+	gic_clock_unstable = true;
+
+	pr_info("GIC timer is unstable due to %s\n", reason);
+
+	clocksource_mark_unstable(&gic_clocksource);
+}
+
 static int __init __gic_clocksource_init(void)
 {
 	unsigned int count_width;
