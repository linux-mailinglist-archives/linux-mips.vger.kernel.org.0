Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 82BDF7E591A
	for <lists+linux-mips@lfdr.de>; Wed,  8 Nov 2023 15:34:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234372AbjKHOeI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 8 Nov 2023 09:34:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233066AbjKHOeG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 8 Nov 2023 09:34:06 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BDA7118
        for <linux-mips@vger.kernel.org>; Wed,  8 Nov 2023 06:34:04 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-507973f3b65so9460219e87.3
        for <linux-mips@vger.kernel.org>; Wed, 08 Nov 2023 06:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699454043; x=1700058843; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6aZ+kL6gh2ag7Dh1ER3v2H0746j7EioeKcGfv1Wufa4=;
        b=N6yMSwTq7/c28tYsHUxfi0R2bsSnql6+WM9eXw4ytb31QV4fGwcuTK9P9Lps0DksFN
         7VE0PDRlKW/6120k5wc5j+s6OLVwxcqIYrb8Jr3njq8v5PmCsxNf6/OdEeeZ9k1VQgt7
         40xjWPof9z5zHlxQCETB5dxP6Lu3vJsukEGvoKBaX/hmjQln5sVrMCXAWqDZeDfja/Yb
         7vTvM6KgxXiKTYYVK0Ffw/nS4bu5lDY9d/kVPb23ajd7JCVnlqaBbk/sMsEdjq2rJ3NZ
         8SLRoupeWmNi2m6vLeGmmG46V2VDdAspzsDMITcIaIuwblcVfW1ZL9HfbQvD89FI/4tq
         K2nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699454043; x=1700058843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6aZ+kL6gh2ag7Dh1ER3v2H0746j7EioeKcGfv1Wufa4=;
        b=h5mugtHAEi/D3gvTOGp9Vzbdf+LcN7865rg7MrXPI9QvjCfQo13WNL20yiiVtuvMYJ
         yy8dn4TpE27udUhIwQGbukdxCEi/vyT1fBuwqPhnH7Md3CBlhF0Ru5TnL2eEdKWheft1
         5BphOSuUquyon1LrqQ91XJfbtDJiZj8IFc8Mwk2E+uZl4HXrtVSXaEjea4/j3rHl8JtZ
         9wlTctGH1DED5kACQRPSsBaO1h1GzwOmimewwCtAnoJqbkHvRnw1fx+/65b1XEiwPCLH
         Xpbw24ZBedoEfp0kybU/uyvliom5qmnUUX1NNvwN+AX7IAxtGraOCVE0SZdRACv5euqh
         ISuA==
X-Gm-Message-State: AOJu0YzzsfSx6aLYhW8izKlVZolOZXsZ4y5gc0JxDxswXwXX+rGJXoZH
        tcMJ1EJXv96i1cvxUdog8HThxw==
X-Google-Smtp-Source: AGHT+IGG1GNNGOjw1MatPyldmMpT70TP+Kp6b0nAZsqC2/4coTaU8ePyebqXK5jpMs6jLsR4nk0Clg==
X-Received: by 2002:a05:6512:3d8f:b0:500:a66b:b189 with SMTP id k15-20020a0565123d8f00b00500a66bb189mr1999537lfv.51.1699454042830;
        Wed, 08 Nov 2023 06:34:02 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id q10-20020ac24a6a000000b00507a3b8b007sm686773lfp.110.2023.11.08.06.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 06:34:02 -0800 (PST)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 08 Nov 2023 15:33:52 +0100
Subject: [PATCH 4/6] mtd: rawnand: gpio: Use device properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231108-fix-mips-nand-v1-4-5fc5586d04de@linaro.org>
References: <20231108-fix-mips-nand-v1-0-5fc5586d04de@linaro.org>
In-Reply-To: <20231108-fix-mips-nand-v1-0-5fc5586d04de@linaro.org>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ben Dooks <ben.dooks@codethink.co.uk>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The platform data (struct gpio_nand_platdata) isn't really used
in any boardfile in the kernel: the only probe path is from
device tree.

Convert the driver to not use the platform data header at all
and read out the device tree properties using device
properties so we don't need to have the driver be exclusively
device tree either: ACPI or software nodes work fine if
need be. Drop the ifdeffery around CONFIG_OF as a consequence.

The code reads "bank-width" to plat->options flags and passes
it directly to the NAND chip struct, so just assign this
directly to the chip instead.

The code reads one property "chip-delay" that it stores
in pdata->delay and never use, so drop this altogether.
If timings should be supported this can probably be done in
a more detailed way using the new elaborate timings structs
that exist for NAND.

The platform data contains a callback to augment partitions,
but since there are no board files using this platform
data to define a gpio NAND device, this is never used so
the code handling it can be deleted.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/nand/raw/gpio.c | 72 ++++++++-------------------------------------
 1 file changed, 12 insertions(+), 60 deletions(-)

diff --git a/drivers/mtd/nand/raw/gpio.c b/drivers/mtd/nand/raw/gpio.c
index df6facf0ec9a..5553101c709c 100644
--- a/drivers/mtd/nand/raw/gpio.c
+++ b/drivers/mtd/nand/raw/gpio.c
@@ -22,9 +22,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/rawnand.h>
 #include <linux/mtd/partitions.h>
-#include <linux/mtd/nand-gpio.h>
-#include <linux/of.h>
-#include <linux/of_address.h>
+#include <linux/property.h>
 #include <linux/delay.h>
 
 struct gpiomtd {
@@ -32,7 +30,6 @@ struct gpiomtd {
 	void __iomem		*io;
 	void __iomem		*io_sync;
 	struct nand_chip	nand_chip;
-	struct gpio_nand_platdata plat;
 	struct gpio_desc *ce; /* Optional chip enable */
 	struct gpio_desc *cle;
 	struct gpio_desc *ale;
@@ -175,46 +172,38 @@ static const struct nand_controller_ops gpio_nand_ops = {
 	.attach_chip = gpio_nand_attach_chip,
 };
 
-#ifdef CONFIG_OF
 static const struct of_device_id gpio_nand_id_table[] = {
 	{ .compatible = "gpio-control-nand" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, gpio_nand_id_table);
 
-static int gpio_nand_get_config_of(const struct device *dev,
-				   struct gpio_nand_platdata *plat)
+static int gpio_nand_get_config(struct device *dev,
+				struct nand_chip *chip)
 {
 	u32 val;
 
-	if (!dev->of_node)
-		return -ENODEV;
-
-	if (!of_property_read_u32(dev->of_node, "bank-width", &val)) {
+	if (!device_property_read_u32(dev, "bank-width", &val)) {
 		if (val == 2) {
-			plat->options |= NAND_BUSWIDTH_16;
+			chip->options |= NAND_BUSWIDTH_16;
 		} else if (val != 1) {
 			dev_err(dev, "invalid bank-width %u\n", val);
 			return -EINVAL;
 		}
 	}
 
-	if (!of_property_read_u32(dev->of_node, "chip-delay", &val))
-		plat->chip_delay = val;
-
 	return 0;
 }
 
-static struct resource *gpio_nand_get_io_sync_of(struct platform_device *pdev)
+static struct resource *gpio_nand_get_io_sync_prop(struct device *dev)
 {
 	struct resource *r;
 	u64 addr;
 
-	if (of_property_read_u64(pdev->dev.of_node,
-				       "gpio-control-nand,io-sync-reg", &addr))
+	if (device_property_read_u64(dev, "gpio-control-nand,io-sync-reg", &addr))
 		return NULL;
 
-	r = devm_kzalloc(&pdev->dev, sizeof(*r), GFP_KERNEL);
+	r = devm_kzalloc(dev, sizeof(*r), GFP_KERNEL);
 	if (!r)
 		return NULL;
 
@@ -224,40 +213,11 @@ static struct resource *gpio_nand_get_io_sync_of(struct platform_device *pdev)
 
 	return r;
 }
-#else /* CONFIG_OF */
-static inline int gpio_nand_get_config_of(const struct device *dev,
-					  struct gpio_nand_platdata *plat)
-{
-	return -ENOSYS;
-}
-
-static inline struct resource *
-gpio_nand_get_io_sync_of(struct platform_device *pdev)
-{
-	return NULL;
-}
-#endif /* CONFIG_OF */
-
-static inline int gpio_nand_get_config(const struct device *dev,
-				       struct gpio_nand_platdata *plat)
-{
-	int ret = gpio_nand_get_config_of(dev, plat);
-
-	if (!ret)
-		return ret;
-
-	if (dev_get_platdata(dev)) {
-		memcpy(plat, dev_get_platdata(dev), sizeof(*plat));
-		return 0;
-	}
-
-	return -EINVAL;
-}
 
 static inline struct resource *
 gpio_nand_get_io_sync(struct platform_device *pdev)
 {
-	struct resource *r = gpio_nand_get_io_sync_of(pdev);
+	struct resource *r = gpio_nand_get_io_sync_prop(&pdev->dev);
 
 	if (r)
 		return r;
@@ -291,9 +251,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	int ret = 0;
 
-	if (!dev->of_node && !dev_get_platdata(dev))
-		return -EINVAL;
-
 	gpiomtd = devm_kzalloc(dev, sizeof(*gpiomtd), GFP_KERNEL);
 	if (!gpiomtd)
 		return -ENOMEM;
@@ -311,7 +268,7 @@ static int gpio_nand_probe(struct platform_device *pdev)
 			return PTR_ERR(gpiomtd->io_sync);
 	}
 
-	ret = gpio_nand_get_config(dev, &gpiomtd->plat);
+	ret = gpio_nand_get_config(dev, chip);
 	if (ret)
 		return ret;
 
@@ -349,7 +306,6 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	gpiomtd->base.ops = &gpio_nand_ops;
 
 	nand_set_flash_node(chip, pdev->dev.of_node);
-	chip->options		= gpiomtd->plat.options;
 	chip->controller	= &gpiomtd->base;
 
 	mtd			= nand_to_mtd(chip);
@@ -372,11 +328,7 @@ static int gpio_nand_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_wp;
 
-	if (gpiomtd->plat.adjust_parts)
-		gpiomtd->plat.adjust_parts(&gpiomtd->plat, mtd->size);
-
-	ret = mtd_device_register(mtd, gpiomtd->plat.parts,
-				  gpiomtd->plat.num_parts);
+	ret = mtd_device_register(mtd, NULL, 0);
 	if (!ret)
 		return 0;
 
@@ -395,7 +347,7 @@ static struct platform_driver gpio_nand_driver = {
 	.remove_new	= gpio_nand_remove,
 	.driver		= {
 		.name	= "gpio-nand",
-		.of_match_table = of_match_ptr(gpio_nand_id_table),
+		.of_match_table = gpio_nand_id_table,
 	},
 };
 

-- 
2.34.1

