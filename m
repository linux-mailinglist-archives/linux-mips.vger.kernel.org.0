Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D3111DD8C7
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2020 22:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730389AbgEUUtT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 May 2020 16:49:19 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:40628 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730352AbgEUUtS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 21 May 2020 16:49:18 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id E46B2803078F;
        Thu, 21 May 2020 20:49:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 9Eyehe4cTvph; Thu, 21 May 2020 23:49:14 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, <linux-mips@vger.kernel.org>,
        <linux-rtc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Maarten ter Huurne <maarten@treewalker.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 8/8] clocksource: mips-gic-timer: Mark GIC timer as unstable if ref clock changes
Date:   Thu, 21 May 2020 23:48:17 +0300
Message-ID: <20200521204818.25436-9-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200521204818.25436-1-Sergey.Semin@baikalelectronics.ru>
References: <20200521204818.25436-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

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

---

Changelog v4:
- Mark clocksource as unstable instead of lowering its rating.

Changelog v5:
- Fix mistakenly added "git_" prefix.
---
 drivers/clocksource/Kconfig          |  1 +
 drivers/clocksource/mips-gic-timer.c | 19 ++++++++++++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index f2142e6bbea3..37a745f3ca91 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -572,6 +572,7 @@ config CLKSRC_VERSATILE
 config CLKSRC_MIPS_GIC
 	bool
 	depends on MIPS_GIC
+	select CLOCKSOURCE_WATCHDOG
 	select TIMER_OF
 
 config CLKSRC_TANGO_XTAL
diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index ef12c12c2432..be4175f415ba 100644
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
-- 
2.25.1

