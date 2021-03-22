Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B6503447E4
	for <lists+linux-mips@lfdr.de>; Mon, 22 Mar 2021 15:50:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231157AbhCVOtc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Mar 2021 10:49:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230374AbhCVOtB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 22 Mar 2021 10:49:01 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9383C0617A7
        for <linux-mips@vger.kernel.org>; Mon, 22 Mar 2021 07:48:55 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:250b:f16c:c5e2:505d])
        by michel.telenet-ops.be with bizsmtp
        id jSot2400W2HDxaV06SotqG; Mon, 22 Mar 2021 15:48:53 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lOLrQ-009ZWD-Qt; Mon, 22 Mar 2021 15:48:52 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lOLrP-004T5q-HL; Mon, 22 Mar 2021 15:48:51 +0100
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 04/17] auxdisplay: img-ascii-lcd: Add helper variable dev
Date:   Mon, 22 Mar 2021 15:48:35 +0100
Message-Id: <20210322144848.1065067-5-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210322144848.1065067-1-geert@linux-m68k.org>
References: <20210322144848.1065067-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

img_ascii_lcd_probe() has many users of "pdev->dev".  Add a shorthand to
simplify the code.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/auxdisplay/img-ascii-lcd.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/auxdisplay/img-ascii-lcd.c b/drivers/auxdisplay/img-ascii-lcd.c
index e33ce0151cdfd150..2b6e41ec57544faa 100644
--- a/drivers/auxdisplay/img-ascii-lcd.c
+++ b/drivers/auxdisplay/img-ascii-lcd.c
@@ -365,26 +365,25 @@ static int img_ascii_lcd_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *match;
 	const struct img_ascii_lcd_config *cfg;
+	struct device *dev = &pdev->dev;
 	struct img_ascii_lcd_ctx *ctx;
 	int err;
 
-	match = of_match_device(img_ascii_lcd_matches, &pdev->dev);
+	match = of_match_device(img_ascii_lcd_matches, dev);
 	if (!match)
 		return -ENODEV;
 
 	cfg = match->data;
-	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx) + cfg->num_chars,
-			   GFP_KERNEL);
+	ctx = devm_kzalloc(dev, sizeof(*ctx) + cfg->num_chars, GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
 
 	if (cfg->external_regmap) {
-		ctx->regmap = syscon_node_to_regmap(pdev->dev.parent->of_node);
+		ctx->regmap = syscon_node_to_regmap(dev->parent->of_node);
 		if (IS_ERR(ctx->regmap))
 			return PTR_ERR(ctx->regmap);
 
-		if (of_property_read_u32(pdev->dev.of_node, "offset",
-					 &ctx->offset))
+		if (of_property_read_u32(dev->of_node, "offset", &ctx->offset))
 			return -EINVAL;
 	} else {
 		ctx->base = devm_platform_ioremap_resource(pdev, 0);
@@ -408,7 +407,7 @@ static int img_ascii_lcd_probe(struct platform_device *pdev)
 	if (err)
 		goto out_del_timer;
 
-	err = device_create_file(&pdev->dev, &dev_attr_message);
+	err = device_create_file(dev, &dev_attr_message);
 	if (err)
 		goto out_del_timer;
 
-- 
2.25.1

