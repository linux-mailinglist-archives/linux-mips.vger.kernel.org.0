Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 736622B2D50
	for <lists+linux-mips@lfdr.de>; Sat, 14 Nov 2020 14:17:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbgKNNQn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 14 Nov 2020 08:16:43 -0500
Received: from vultr.net.flygoat.com ([149.28.68.211]:49248 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726791AbgKNNQm (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 14 Nov 2020 08:16:42 -0500
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 79E461FEB5;
        Sat, 14 Nov 2020 13:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1605359381; bh=kOdxqmTeFNrIu40ucROytLRPFSIT56o9VQ3JPCTlUeU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hYLAsYvwOQlPdCFH8kdxJ8TIwTI5SlK1PshKwQpI9AZ9Izn5bC4en/GmeSM531N4x
         rm9/pxZTaXIMJgPNk+SSySNAXzyIertzGuVc9cSen0P9Z3lcMWxRb6WxiXeGwKfZLB
         +XVrlrCsJoZCH2Z0EM2Q9v3V2X4Ooc/RBkp47Zg4eIaNRCM/aM42GgfKY/ywr1brei
         npYih3I025r9GaiR2R/qz7rwBYFBOPZQyZkFtYgmN+cPOir9rcFV0xinKMFQdsECEx
         F00ijTlRR+2Csjdrls34QUw86eVBpr/MTwUwQ3Z1m15Q6PlDrqouAQlv16wjJa+ccC
         Y84E8ItfUyYZQ==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Miodrag Dinic <Miodrag.Dinic@syrmia.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH 2/2] MAINTAINERS: Set myself as Goldfish RTC maintainer
Date:   Sat, 14 Nov 2020 21:09:21 +0800
Message-Id: <20201114130921.651882-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201114130921.651882-1-jiaxun.yang@flygoat.com>
References: <20201114130921.651882-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

While Gildfish platform is dusted, the RTC driver remains
valuable for us.

I'm volunteering to maintain goldfish RTC driver onward.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Miodrag Dinic <Miodrag.Dinic@syrmia.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e73636b75f29..b576544264e6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1168,7 +1168,7 @@ F:	Documentation/devicetree/bindings/interrupt-controller/google,goldfish-pic.tx
 F:	drivers/irqchip/irq-goldfish-pic.c
 
 ANDROID GOLDFISH RTC DRIVER
-M:	Miodrag Dinic <miodrag.dinic@mips.com>
+M:	Jiaxun Yang <jiaxun.yang@flygoat.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/rtc/google,goldfish-rtc.txt
 F:	drivers/rtc/rtc-goldfish.c
-- 
2.29.2

