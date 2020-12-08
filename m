Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB2E12D3034
	for <lists+linux-mips@lfdr.de>; Tue,  8 Dec 2020 17:50:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730398AbgLHQuR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Dec 2020 11:50:17 -0500
Received: from aposti.net ([89.234.176.197]:32890 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726703AbgLHQuR (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 8 Dec 2020 11:50:17 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Arnd Bergmann <arnd@kernel.org>, od@zcrc.me,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 2/2] pinctrl: ingenic: Only support SoCs enabled in config
Date:   Tue,  8 Dec 2020 16:48:21 +0000
Message-Id: <20201208164821.2686082-2-paul@crapouillou.net>
In-Reply-To: <20201208164821.2686082-1-paul@crapouillou.net>
References: <20201208164821.2686082-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Tested on a JZ4740 system (ARCH=mips make qi_lb60_defconfig), this saves
about 14 KiB, by allowing the compiler to garbage-collect all the
functions and tables that correspond to SoCs that were disabled in the
config.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/pinctrl/pinctrl-ingenic.c | 61 +++++++++++++++++++++++++------
 1 file changed, 49 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index a14938a7cc30..11f1bc90632d 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -9,6 +9,7 @@
 
 #include <linux/compiler.h>
 #include <linux/gpio/driver.h>
+#include <linux/if_enabled.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/of_device.h>
@@ -2384,6 +2385,12 @@ static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
 	unsigned int i;
 	int err;
 
+	chip_info = of_device_get_match_data(dev);
+	if (!chip_info) {
+		dev_err(dev, "Unsupported SoC\n");
+		return -EINVAL;
+	}
+
 	jzpc = devm_kzalloc(dev, sizeof(*jzpc), GFP_KERNEL);
 	if (!jzpc)
 		return -ENOMEM;
@@ -2400,7 +2407,7 @@ static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
 	}
 
 	jzpc->dev = dev;
-	jzpc->info = chip_info = of_device_get_match_data(dev);
+	jzpc->info = chip_info;
 
 	pctl_desc = devm_kzalloc(&pdev->dev, sizeof(*pctl_desc), GFP_KERNEL);
 	if (!pctl_desc)
@@ -2470,17 +2477,47 @@ static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id ingenic_pinctrl_of_match[] = {
-	{ .compatible = "ingenic,jz4740-pinctrl", .data = &jz4740_chip_info },
-	{ .compatible = "ingenic,jz4725b-pinctrl", .data = &jz4725b_chip_info },
-	{ .compatible = "ingenic,jz4760-pinctrl", .data = &jz4760_chip_info },
-	{ .compatible = "ingenic,jz4760b-pinctrl", .data = &jz4760_chip_info },
-	{ .compatible = "ingenic,jz4770-pinctrl", .data = &jz4770_chip_info },
-	{ .compatible = "ingenic,jz4780-pinctrl", .data = &jz4780_chip_info },
-	{ .compatible = "ingenic,x1000-pinctrl", .data = &x1000_chip_info },
-	{ .compatible = "ingenic,x1000e-pinctrl", .data = &x1000_chip_info },
-	{ .compatible = "ingenic,x1500-pinctrl", .data = &x1500_chip_info },
-	{ .compatible = "ingenic,x1830-pinctrl", .data = &x1830_chip_info },
-	{},
+	{
+		.compatible = "ingenic,jz4740-pinctrl",
+		.data = IF_ENABLED(CONFIG_MACH_JZ4740, &jz4740_chip_info)
+	},
+	{
+		.compatible = "ingenic,jz4725b-pinctrl",
+		.data = IF_ENABLED(CONFIG_MACH_JZ4725B, &jz4725b_chip_info)
+	},
+	{
+		.compatible = "ingenic,jz4760-pinctrl",
+		.data = IF_ENABLED(CONFIG_MACH_JZ4760, &jz4760_chip_info)
+	},
+	{
+		.compatible = "ingenic,jz4760b-pinctrl",
+		.data = IF_ENABLED(CONFIG_MACH_JZ4760, &jz4760_chip_info)
+	},
+	{
+		.compatible = "ingenic,jz4770-pinctrl",
+		.data = IF_ENABLED(CONFIG_MACH_JZ4770, &jz4770_chip_info)
+	},
+	{
+		.compatible = "ingenic,jz4780-pinctrl",
+		.data = IF_ENABLED(CONFIG_MACH_JZ4780, &jz4780_chip_info)
+	},
+	{
+		.compatible = "ingenic,x1000-pinctrl",
+		.data = IF_ENABLED(CONFIG_MACH_X1000, &x1000_chip_info)
+	},
+	{
+		.compatible = "ingenic,x1000e-pinctrl",
+		.data = IF_ENABLED(CONFIG_MACH_X1000, &x1000_chip_info)
+	},
+	{
+		.compatible = "ingenic,x1500-pinctrl",
+		.data = IF_ENABLED(CONFIG_MACH_X1500, &x1500_chip_info)
+	},
+	{
+		.compatible = "ingenic,x1830-pinctrl",
+		.data = IF_ENABLED(CONFIG_MACH_X1830, &x1830_chip_info)
+	},
+	{ /* sentinel */ },
 };
 
 static struct platform_driver ingenic_pinctrl_driver = {
-- 
2.29.2

