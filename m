Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B3E71DD8C4
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2020 22:49:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730325AbgEUUtO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 May 2020 16:49:14 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:40534 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730130AbgEUUtN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 21 May 2020 16:49:13 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 2C9D880005EE;
        Thu, 21 May 2020 20:49:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id V3W7VpCXuOqi; Thu, 21 May 2020 23:49:07 +0300 (MSK)
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
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alexios Zavras <alexios.zavras@intel.com>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 5/8] clocksource: dw_apb_timer: Affiliate of-based timer with any CPU
Date:   Thu, 21 May 2020 23:48:14 +0300
Message-ID: <20200521204818.25436-6-Sergey.Semin@baikalelectronics.ru>
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

Currently any DW APB Timer device detected in OF is bound to CPU #0.
Doing so is redundant since DW APB Timer isn't CPU-local timer, but as
having APB interface is normally accessible from any CPU in the system. By
artificially affiliating the DW timer to the very first CPU we may and in
our case will make the clockevent subsystem to decline the more performant
real CPU-local timers selection in favor of in fact non-local and
accessible over a slow bus - DW APB Timers.

Let's not affiliate the of-detected DW APB Timers to any CPU. By doing so
the clockevent framework would prefer to select the real CPU-local timer
instead of DW APB one. Otherwise if there is no other than DW APB device
for clockevents tracking then it will be selected.

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
- This is a new patch created after reconsidering the solution of the DW
  APB Timer CPU-affiliation problem.
---
 drivers/clocksource/dw_apb_timer_of.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/dw_apb_timer_of.c b/drivers/clocksource/dw_apb_timer_of.c
index 8c28b127759f..2db490f35c20 100644
--- a/drivers/clocksource/dw_apb_timer_of.c
+++ b/drivers/clocksource/dw_apb_timer_of.c
@@ -73,7 +73,7 @@ static void __init add_clockevent(struct device_node *event_timer)
 
 	timer_get_base_and_rate(event_timer, &iobase, &rate);
 
-	ced = dw_apb_clockevent_init(0, event_timer->name, 300, iobase, irq,
+	ced = dw_apb_clockevent_init(-1, event_timer->name, 300, iobase, irq,
 				     rate);
 	if (!ced)
 		panic("Unable to initialise clockevent device");
-- 
2.25.1

