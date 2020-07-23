Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5631322AB49
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jul 2020 11:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbgGWJEb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 23 Jul 2020 05:04:31 -0400
Received: from crapouillou.net ([89.234.176.41]:33872 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725858AbgGWJEb (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 23 Jul 2020 05:04:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1595495069; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=TYMZhUeqb4kLMBHI5Bg+wdG6iFDhsEv1Qqr48Y5oSQQ=;
        b=Xo9Ko8ZB+HVzfQadnqehdcnNjlti4gfIPdefBZqrmDVhE45yVobNZtBF0DYl+1zMdAxqvE
        dvxYRriK0fu1D1F8YoGwRsLrxVbCZ7NL8V6DK+RogHz3gJ2DOZ790PIERZfz53KiO8ogC4
        FEXVplu44N6cSBmyUFHnjNuTSae8PLY=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     od@zcrc.me,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH RESEND] memory: jz4780_nemc: Only request IO memory the driver will use
Date:   Thu, 23 Jul 2020 11:04:14 +0200
Message-Id: <20200723090414.5824-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The driver only uses the registers up to offset 0x54. Since the EFUSE
registers are in the middle of the NEMC registers, we only request
the registers we will use for now - that way the EFUSE driver can
probe too.

Tested-by: H. Nikolaus Schaller <hns@goldelico.com>
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    Thomas:
    
    drivers/memory/ has no dedicated maintainer, so sending this
    patch upstream is like sending a bottle to the sea. Since it
    touches a driver for a Ingenic SoC, if Greg doesn't take it
    (I don't blame him - he's a busy man), could you take it in
    your tree?
    
    Thanks,
    -Paul

 drivers/memory/jz4780-nemc.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/memory/jz4780-nemc.c b/drivers/memory/jz4780-nemc.c
index b232ed279fc3..647267ea8c63 100644
--- a/drivers/memory/jz4780-nemc.c
+++ b/drivers/memory/jz4780-nemc.c
@@ -8,6 +8,7 @@
 
 #include <linux/clk.h>
 #include <linux/init.h>
+#include <linux/io.h>
 #include <linux/math64.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -288,7 +289,19 @@ static int jz4780_nemc_probe(struct platform_device *pdev)
 	nemc->dev = dev;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	nemc->base = devm_ioremap_resource(dev, res);
+
+	/*
+	 * The driver only uses the registers up to offset 0x54. Since the EFUSE
+	 * registers are in the middle of the NEMC registers, we only request
+	 * the registers we will use for now - that way the EFUSE driver can
+	 * probe too.
+	 */
+	if (!devm_request_mem_region(dev, res->start, 0x54, dev_name(dev))) {
+		dev_err(dev, "unable to request I/O memory region\n");
+		return -EBUSY;
+	}
+
+	nemc->base = devm_ioremap(dev, res->start, resource_size(res));
 	if (IS_ERR(nemc->base)) {
 		dev_err(dev, "failed to get I/O memory\n");
 		return PTR_ERR(nemc->base);
-- 
2.27.0

