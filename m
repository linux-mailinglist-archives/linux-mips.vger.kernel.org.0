Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D73911C7CB9
	for <lists+linux-mips@lfdr.de>; Wed,  6 May 2020 23:42:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730286AbgEFVlz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 6 May 2020 17:41:55 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:34040 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730206AbgEFVlt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 6 May 2020 17:41:49 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 473318030790;
        Wed,  6 May 2020 21:41:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 055dqCR3uwT0; Thu,  7 May 2020 00:41:44 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
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
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 7/7] clocksource: mips-gic-timer: Set limitations on clocksource/sched-clocks usage
Date:   Thu, 7 May 2020 00:41:07 +0300
Message-ID: <20200506214107.25956-8-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200506214107.25956-1-Sergey.Semin@baikalelectronics.ru>
References: <20200324174325.14213-1-Sergey.Semin@baikalelectronics.ru>
 <20200506214107.25956-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Currently neither clocksource nor scheduler clock kernel framework
support the clocks with variable frequency. Needless to say how many
problems may cause the sudden base clocks frequency change. In a
simplest case the system time will either slow down or speed up.
Since on CM2.5 and earlier MIPS GIC timer is synchronously clocked
with CPU we must set some limitations on using it for these frameworks
if CPU frequency may change. First of all it's not safe to have the
MIPS GIC used for scheduler timings. So we shouldn't proceed with
the clocks registration in the sched-subsystem. Secondly we must
significantly decrease the MIPS GIC clocksource rating. This will let
the system to use it only as a last resort.

Note CM3.x-based systems may also experience the problems with MIPS GIC
if the CPU-frequency change is activated for the whole CPU cluster
instead of using the individual CPC core clocks divider.

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
 drivers/clocksource/mips-gic-timer.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/clocksource/mips-gic-timer.c b/drivers/clocksource/mips-gic-timer.c
index 802b93fe3ae7..095d65b48920 100644
--- a/drivers/clocksource/mips-gic-timer.c
+++ b/drivers/clocksource/mips-gic-timer.c
@@ -185,7 +185,10 @@ static int __init __gic_clocksource_init(void)
 	gic_clocksource.mask = CLOCKSOURCE_MASK(count_width);
 
 	/* Calculate a somewhat reasonable rating value. */
-	gic_clocksource.rating = 200 + gic_frequency / 10000000;
+	if (mips_cm_revision() >= CM_REV_CM3 || !IS_ENABLED(CONFIG_CPU_FREQ))
+		gic_clocksource.rating = 200 + gic_frequency / 10000000;
+	else
+		gic_clocksource.rating = 99;
 
 	ret = clocksource_register_hz(&gic_clocksource, gic_frequency);
 	if (ret < 0)
@@ -239,9 +242,11 @@ static int __init gic_clocksource_of_init(struct device_node *node)
 	/* And finally start the counter */
 	clear_gic_config(GIC_CONFIG_COUNTSTOP);
 
-	sched_clock_register(mips_cm_is64 ?
-			     gic_read_count_64 : gic_read_count_2x32,
-			     64, gic_frequency);
+	if (mips_cm_revision() >= CM_REV_CM3 || !IS_ENABLED(CONFIG_CPU_FREQ)) {
+		sched_clock_register(mips_cm_is64 ?
+				     gic_read_count_64 : gic_read_count_2x32,
+				     64, gic_frequency);
+	}
 
 	return 0;
 }
-- 
2.25.1

