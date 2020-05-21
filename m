Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D24871DD8C0
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2020 22:49:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730120AbgEUUtN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 May 2020 16:49:13 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:40492 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730104AbgEUUtM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 21 May 2020 16:49:12 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 97C218029EB7;
        Thu, 21 May 2020 20:49:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id eqm94qBrncaw; Thu, 21 May 2020 23:49:05 +0300 (MSK)
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
        afzal mohammed <afzal.mohd.ma@gmail.com>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 4/8] clocksource: dw_apb_timer: Make CPU-affiliation being optional
Date:   Thu, 21 May 2020 23:48:13 +0300
Message-ID: <20200521204818.25436-5-Sergey.Semin@baikalelectronics.ru>
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

Currently the DW APB Timer driver binds each clockevent timers to a
particular CPU. This isn't good for multiple reasons. First of all seeing
the device is placed on APB bus (which makes it accessible from any CPU
core), accessible over MMIO and having the DYNIRQ flag set we can be sure
that manually binding the timer to any CPU just isn't correct. By doing
so we just set an extra limitation on device usage. This also doesn't
reflect the device actual capability, since by setting the IRQ affinity
we can make it virtually local to any CPU. Secondly imagine if you had a
real CPU-local timer with the same rating and the same CPU-affinity.
In this case if DW APB timer was registered first, then due to the
clockevent framework tick-timer selection procedure we'll end up with the
real CPU-local timer being left unselected for clock-events tracking. But
on most of the platforms (MIPS/ARM/etc) such timers are normally embedded
into the CPU core and are accessible with much better performance then
devices placed on APB. For instance in MIPS architectures there is
r4k-timer, which is CPU-local, assigned with the same rating, and normally
its clockevent device is registered after the platform-specific one.

So in order to fix all of these issues let's make the DW APB Timer CPU
affinity being optional and deactivated by passing a negative CPU id,
which will effectively set the DW APB clockevent timer cpumask to
'cpu_possible_mask'.

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

Changelog v5:
- Don't discard CPU affiliation functionality, but allow it being optional.
  If CPU id passed to the clockevent registration method is negative, then
  don't assign the timer events to any particular CPU.
- Discard the OF-based DW APB Timer CPU-affiliation setting change. It'll
  be moved to a dedicated patch.
---
 drivers/clocksource/dw_apb_timer.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/dw_apb_timer.c b/drivers/clocksource/dw_apb_timer.c
index b207a77b0831..f5f24a95ee82 100644
--- a/drivers/clocksource/dw_apb_timer.c
+++ b/drivers/clocksource/dw_apb_timer.c
@@ -222,7 +222,8 @@ static int apbt_next_event(unsigned long delta,
 /**
  * dw_apb_clockevent_init() - use an APB timer as a clock_event_device
  *
- * @cpu:	The CPU the events will be targeted at.
+ * @cpu:	The CPU the events will be targeted at or -1 if CPU affiliation
+ *		isn't required.
  * @name:	The name used for the timer and the IRQ for it.
  * @rating:	The rating to give the timer.
  * @base:	I/O base for the timer registers.
@@ -257,7 +258,7 @@ dw_apb_clockevent_init(int cpu, const char *name, unsigned rating,
 	dw_ced->ced.max_delta_ticks = 0x7fffffff;
 	dw_ced->ced.min_delta_ns = clockevent_delta2ns(5000, &dw_ced->ced);
 	dw_ced->ced.min_delta_ticks = 5000;
-	dw_ced->ced.cpumask = cpumask_of(cpu);
+	dw_ced->ced.cpumask = cpu < 0 ? cpu_possible_mask : cpumask_of(cpu);
 	dw_ced->ced.features = CLOCK_EVT_FEAT_PERIODIC |
 				CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_DYNIRQ;
 	dw_ced->ced.set_state_shutdown = apbt_shutdown;
-- 
2.25.1

