Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03B391EA46E
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jun 2020 15:11:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbgFANLo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Jun 2020 09:11:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726322AbgFANLm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Jun 2020 09:11:42 -0400
Received: from Galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75A3CC08C5C0;
        Mon,  1 Jun 2020 06:11:42 -0700 (PDT)
Received: from [5.158.153.53] (helo=tip-bot2.lab.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tip-bot2@linutronix.de>)
        id 1jfkE6-000719-E3; Mon, 01 Jun 2020 15:11:38 +0200
Received: from [127.0.1.1] (localhost [IPv6:::1])
        by tip-bot2.lab.linutronix.de (Postfix) with ESMTP id 0BA921C0244;
        Mon,  1 Jun 2020 15:11:38 +0200 (CEST)
Date:   Mon, 01 Jun 2020 13:11:37 -0000
From:   "tip-bot2 for Serge Semin" <tip-bot2@linutronix.de>
Reply-to: linux-kernel@vger.kernel.org
To:     linux-tip-commits@vger.kernel.org
Subject: [tip: timers/core] clocksource: dw_apb_timer: Make CPU-affiliation
 being optional
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
In-Reply-To: <20200521204818.25436-5-Sergey.Semin@baikalelectronics.ru>
References: <20200521204818.25436-5-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Message-ID: <159101709789.17951.16751811441888475534.tip-bot2@tip-bot2>
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

Commit-ID:     cee43dbf2ee3f430434e2b66994eff8a1aeda889
Gitweb:        https://git.kernel.org/tip/cee43dbf2ee3f430434e2b66994eff8a1aeda889
Author:        Serge Semin <Sergey.Semin@baikalelectronics.ru>
AuthorDate:    Thu, 21 May 2020 23:48:13 +03:00
Committer:     Daniel Lezcano <daniel.lezcano@linaro.org>
CommitterDate: Sat, 23 May 2020 00:02:41 +02:00

clocksource: dw_apb_timer: Make CPU-affiliation being optional

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
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Link: https://lore.kernel.org/r/20200521204818.25436-5-Sergey.Semin@baikalelectronics.ru
---
 drivers/clocksource/dw_apb_timer.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/dw_apb_timer.c b/drivers/clocksource/dw_apb_timer.c
index b207a77..f5f24a9 100644
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
