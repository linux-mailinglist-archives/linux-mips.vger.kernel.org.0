Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C20C3015DC
	for <lists+linux-mips@lfdr.de>; Sat, 23 Jan 2021 15:30:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725923AbhAWO2e (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 23 Jan 2021 09:28:34 -0500
Received: from aposti.net ([89.234.176.197]:33882 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726021AbhAWO2d (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 23 Jan 2021 09:28:33 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Tony Lindgren <tony@atomide.com>, od@zcrc.me,
        linux-mips@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [RE-RESEND PATCH 4/4] usb: musb: jz4740: Add missing CR to error strings
Date:   Sat, 23 Jan 2021 14:25:02 +0000
Message-Id: <20210123142502.16980-4-paul@crapouillou.net>
In-Reply-To: <20210123142502.16980-1-paul@crapouillou.net>
References: <20210123142502.16980-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

If you pass a string that is not terminated with a carriage return to
dev_err(), it will eventually be printed with a carriage return, but
not right away, since the kernel will wait for a pr_cont().

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/usb/musb/jz4740.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
index c4fe1f4cd17a..5b7d576bf6ee 100644
--- a/drivers/usb/musb/jz4740.c
+++ b/drivers/usb/musb/jz4740.c
@@ -116,13 +116,13 @@ static int jz4740_musb_init(struct musb *musb)
 	if (IS_ERR(musb->xceiv)) {
 		err = PTR_ERR(musb->xceiv);
 		if (err != -EPROBE_DEFER)
-			dev_err(dev, "No transceiver configured: %d", err);
+			dev_err(dev, "No transceiver configured: %d\n", err);
 		return err;
 	}
 
 	glue->role_sw = usb_role_switch_register(dev, &role_sw_desc);
 	if (IS_ERR(glue->role_sw)) {
-		dev_err(dev, "Failed to register USB role switch");
+		dev_err(dev, "Failed to register USB role switch\n");
 		return PTR_ERR(glue->role_sw);
 	}
 
@@ -205,26 +205,26 @@ static int jz4740_probe(struct platform_device *pdev)
 
 	pdata = of_device_get_match_data(dev);
 	if (!pdata) {
-		dev_err(dev, "missing platform data");
+		dev_err(dev, "missing platform data\n");
 		return -EINVAL;
 	}
 
 	musb = platform_device_alloc("musb-hdrc", PLATFORM_DEVID_AUTO);
 	if (!musb) {
-		dev_err(dev, "failed to allocate musb device");
+		dev_err(dev, "failed to allocate musb device\n");
 		return -ENOMEM;
 	}
 
 	clk = devm_clk_get(dev, "udc");
 	if (IS_ERR(clk)) {
-		dev_err(dev, "failed to get clock");
+		dev_err(dev, "failed to get clock\n");
 		ret = PTR_ERR(clk);
 		goto err_platform_device_put;
 	}
 
 	ret = clk_prepare_enable(clk);
 	if (ret) {
-		dev_err(dev, "failed to enable clock");
+		dev_err(dev, "failed to enable clock\n");
 		goto err_platform_device_put;
 	}
 
@@ -240,19 +240,19 @@ static int jz4740_probe(struct platform_device *pdev)
 	ret = platform_device_add_resources(musb, pdev->resource,
 					    pdev->num_resources);
 	if (ret) {
-		dev_err(dev, "failed to add resources");
+		dev_err(dev, "failed to add resources\n");
 		goto err_clk_disable;
 	}
 
 	ret = platform_device_add_data(musb, pdata, sizeof(*pdata));
 	if (ret) {
-		dev_err(dev, "failed to add platform_data");
+		dev_err(dev, "failed to add platform_data\n");
 		goto err_clk_disable;
 	}
 
 	ret = platform_device_add(musb);
 	if (ret) {
-		dev_err(dev, "failed to register musb device");
+		dev_err(dev, "failed to register musb device\n");
 		goto err_clk_disable;
 	}
 
-- 
2.29.2

