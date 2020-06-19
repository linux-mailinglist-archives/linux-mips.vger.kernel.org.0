Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F808200F82
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jun 2020 17:23:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392605AbgFSPTV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 19 Jun 2020 11:19:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:49280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392599AbgFSPS5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 19 Jun 2020 11:18:57 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5428E21582;
        Fri, 19 Jun 2020 15:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592579936;
        bh=/wDY0J7ZCbV+kbdSd0PMHEoJW6LCkYfxvOWL2ZHCfxE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=O5tyz6STXmq78tTBVtX5iSciO9R+0WnOUU3WxzoIFzYOkdi4x44b0ffc/hpRQ0BEs
         +9MxvJPNY8tr//1TLCnwjpBOCN7KusbExJt+F5hhRMbGGieKsKNyr9M9Pkg/KkXNQ8
         WdcXJCYuuyeTjqQ4k6C79OKIb0VIocNtA2tMIH3k=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
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
        Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.7 061/376] clocksource: dw_apb_timer_of: Fix missing clockevent timers
Date:   Fri, 19 Jun 2020 16:29:39 +0200
Message-Id: <20200619141713.244213447@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200619141710.350494719@linuxfoundation.org>
References: <20200619141710.350494719@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Serge Semin <Sergey.Semin@baikalelectronics.ru>

[ Upstream commit 6d2e16a3181bafb77b535095c39ad1c8b9558c8c ]

Commit 100214889973 ("clocksource: dw_apb_timer_of: use
clocksource_of_init") replaced a publicly available driver
initialization method with one called by the timer_probe() method
available after CLKSRC_OF. In current implementation it traverses
all the timers available in the system and calls their initialization
methods if corresponding devices were either in dtb or in acpi. But
if before the commit any number of available timers would be installed
as clockevent and clocksource devices, after that there would be at most
two. The rest are just ignored since default case branch doesn't do
anything. I don't see a reason of such behaviour, neither the commit
message explains it. Moreover this might be wrong if on some platforms
these timers might be used for different purpose, as virtually CPU-local
clockevent timers and as an independent broadcast timer. So in order
to keep the compatibility with the platforms where the order of the
timers detection has some meaning, lets add the secondly discovered
timer to be of clocksource/sched_clock type, while the very first and
the others would provide the clockevents service.

Fixes: 100214889973 ("clocksource: dw_apb_timer_of: use clocksource_of_init")
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
Link: https://lore.kernel.org/r/20200521204818.25436-7-Sergey.Semin@baikalelectronics.ru
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clocksource/dw_apb_timer_of.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clocksource/dw_apb_timer_of.c b/drivers/clocksource/dw_apb_timer_of.c
index 8c28b127759f..6921b91b61ef 100644
--- a/drivers/clocksource/dw_apb_timer_of.c
+++ b/drivers/clocksource/dw_apb_timer_of.c
@@ -147,10 +147,6 @@ static int num_called;
 static int __init dw_apb_timer_init(struct device_node *timer)
 {
 	switch (num_called) {
-	case 0:
-		pr_debug("%s: found clockevent timer\n", __func__);
-		add_clockevent(timer);
-		break;
 	case 1:
 		pr_debug("%s: found clocksource timer\n", __func__);
 		add_clocksource(timer);
@@ -161,6 +157,8 @@ static int __init dw_apb_timer_init(struct device_node *timer)
 #endif
 		break;
 	default:
+		pr_debug("%s: found clockevent timer\n", __func__);
+		add_clockevent(timer);
 		break;
 	}
 
-- 
2.25.1



