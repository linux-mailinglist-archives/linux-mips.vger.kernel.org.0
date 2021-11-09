Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 280CE44B0E3
	for <lists+linux-mips@lfdr.de>; Tue,  9 Nov 2021 17:12:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236660AbhKIQPm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Nov 2021 11:15:42 -0500
Received: from mail-ot1-f42.google.com ([209.85.210.42]:41759 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231161AbhKIQPl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Nov 2021 11:15:41 -0500
Received: by mail-ot1-f42.google.com with SMTP id o15-20020a9d410f000000b0055c942cc7a0so8897965ote.8;
        Tue, 09 Nov 2021 08:12:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Sht9zwJOrkmePAF9bm1xzmO//0hu+9FWnDz72EV95/4=;
        b=qnxvW15rXk5K39+99/3wK5nyyqIwOMVdZ2VB3utYfUitWNGCkOysIZg1l+564cUGpF
         oiDXZ930uVwS+/XVgXODVS4LEhOaljTKr4gWm7C8BcMNoYuF9IO5i7TU7VFtfs3+a4KT
         t8jZneEuaSAQejr8/+/BsnpFloofR8hpXqQ40ELSPRJ5MERobbPKhVrTr8CE12/xNAui
         vu74dFp5MMlOUmMxxPT8bIqh+SDtgePGqOtTnSnQkFKt7PWO465bF5UPZ0iWjLsOjGAH
         DEeJcVjFYY9bo+/rUFgUY972a7dhWQzrMST+3ntLUjvcK6CyvzM8EPsr1Xy1VOGY+Fau
         HhRw==
X-Gm-Message-State: AOAM532dpUKdaHdnhTmV/b8+ObmraFW43jsM5T6hNc2Y5AP3Lz+BK5GW
        K2i5F/EJ/zr7U7ZuyuZ7+g==
X-Google-Smtp-Source: ABdhPJx+oLFTMwkGFEdE/j4fDWdGcWFckegV8OoQAvXdOkiEurM1RCzvu8NiceDcxidFzrul6eXSaw==
X-Received: by 2002:a05:6830:928:: with SMTP id v40mr6799065ott.223.1636474375113;
        Tue, 09 Nov 2021 08:12:55 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id p10sm3568964otp.53.2021.11.09.08.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 08:12:54 -0800 (PST)
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-kernel@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: xlp: Remove Netlogic XLP variants
Date:   Tue,  9 Nov 2021 10:12:53 -0600
Message-Id: <20211109161253.2202108-1-robh@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Netlogic XLP was removed in commit 95b8a5e0111a ("MIPS: Remove NETLOGIC
support"). With those gone, the single platform left to support is
Cavium ThunderX2. Remove all the Netlogic variants and DT support.

For simplicity, the existing kconfig name is retained.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/gpio/Kconfig    |  10 ++-
 drivers/gpio/gpio-xlp.c | 142 +++-------------------------------------
 2 files changed, 13 insertions(+), 139 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 072ed610f9c6..e05f226b3d5d 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -730,14 +730,12 @@ config GPIO_XILINX
 	  Say yes here to support the Xilinx FPGA GPIO device.
 
 config GPIO_XLP
-	tristate "Netlogic XLP GPIO support"
-	depends on OF_GPIO && (CPU_XLP || ARCH_THUNDER2 || COMPILE_TEST)
+	tristate "Cavium ThunderX2 GPIO support"
+	depends on ARCH_THUNDER2 || COMPILE_TEST
 	select GPIOLIB_IRQCHIP
 	help
-	  This driver provides support for GPIO interface on Netlogic XLP MIPS64
-	  SoCs. Currently supported XLP variants are XLP8XX, XLP3XX, XLP2XX,
-	  XLP9XX and XLP5XX. The same GPIO controller block is also present in
-	  Cavium's ThunderX2 CN99XX SoCs.
+	  This driver provides support for GPIO interface on Cavium's ThunderX2
+	  CN99XX SoCs (Originally from Netlogic XLP).
 
 	  If unsure, say N.
 
diff --git a/drivers/gpio/gpio-xlp.c b/drivers/gpio/gpio-xlp.c
index 0d94d3aef752..814cc34aef97 100644
--- a/drivers/gpio/gpio-xlp.c
+++ b/drivers/gpio/gpio-xlp.c
@@ -6,7 +6,6 @@
 
 #include <linux/gpio/driver.h>
 #include <linux/platform_device.h>
-#include <linux/of_device.h>
 #include <linux/module.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
@@ -26,16 +25,6 @@
  *
  * where addr is base address of the that feature register and gpio is the pin.
  */
-#define GPIO_OUTPUT_EN		0x00
-#define GPIO_PADDRV		0x08
-#define GPIO_INT_EN00		0x18
-#define GPIO_INT_EN10		0x20
-#define GPIO_INT_EN20		0x28
-#define GPIO_INT_EN30		0x30
-#define GPIO_INT_POL		0x38
-#define GPIO_INT_TYPE		0x40
-#define GPIO_INT_STAT		0x48
-
 #define GPIO_9XX_BYTESWAP	0X00
 #define GPIO_9XX_CTRL		0X04
 #define GPIO_9XX_OUTPUT_EN	0x14
@@ -52,14 +41,6 @@
 #define GPIO_9XX_INT_TYPE	0x114
 #define GPIO_9XX_INT_STAT	0x124
 
-#define GPIO_3XX_INT_EN00	0x18
-#define GPIO_3XX_INT_EN10	0x20
-#define GPIO_3XX_INT_EN20	0x28
-#define GPIO_3XX_INT_EN30	0x30
-#define GPIO_3XX_INT_POL	0x78
-#define GPIO_3XX_INT_TYPE	0x80
-#define GPIO_3XX_INT_STAT	0x88
-
 /* Interrupt type register mask */
 #define XLP_GPIO_IRQ_TYPE_LVL	0x0
 #define XLP_GPIO_IRQ_TYPE_EDGE	0x1
@@ -72,16 +53,6 @@
 #define XLP_GPIO_IRQ_BASE	768
 #define XLP_MAX_NR_GPIO		96
 
-/* XLP variants supported by this driver */
-enum {
-	XLP_GPIO_VARIANT_XLP832 = 1,
-	XLP_GPIO_VARIANT_XLP316,
-	XLP_GPIO_VARIANT_XLP208,
-	XLP_GPIO_VARIANT_XLP980,
-	XLP_GPIO_VARIANT_XLP532,
-	GPIO_VARIANT_VULCAN
-};
-
 struct xlp_gpio_priv {
 	struct gpio_chip chip;
 	DECLARE_BITMAP(gpio_enabled_mask, XLP_MAX_NR_GPIO);
@@ -257,44 +228,13 @@ static void xlp_gpio_set(struct gpio_chip *gc, unsigned gpio, int state)
 	xlp_gpio_set_reg(priv->gpio_paddrv, gpio, state);
 }
 
-static const struct of_device_id xlp_gpio_of_ids[] = {
-	{
-		.compatible = "netlogic,xlp832-gpio",
-		.data	    = (void *)XLP_GPIO_VARIANT_XLP832,
-	},
-	{
-		.compatible = "netlogic,xlp316-gpio",
-		.data	    = (void *)XLP_GPIO_VARIANT_XLP316,
-	},
-	{
-		.compatible = "netlogic,xlp208-gpio",
-		.data	    = (void *)XLP_GPIO_VARIANT_XLP208,
-	},
-	{
-		.compatible = "netlogic,xlp980-gpio",
-		.data	    = (void *)XLP_GPIO_VARIANT_XLP980,
-	},
-	{
-		.compatible = "netlogic,xlp532-gpio",
-		.data	    = (void *)XLP_GPIO_VARIANT_XLP532,
-	},
-	{
-		.compatible = "brcm,vulcan-gpio",
-		.data	    = (void *)GPIO_VARIANT_VULCAN,
-	},
-	{ /* sentinel */ },
-};
-MODULE_DEVICE_TABLE(of, xlp_gpio_of_ids);
-
 static int xlp_gpio_probe(struct platform_device *pdev)
 {
 	struct gpio_chip *gc;
 	struct gpio_irq_chip *girq;
 	struct xlp_gpio_priv *priv;
 	void __iomem *gpio_base;
-	int irq_base, irq, err;
-	int ngpio;
-	u32 soc_type;
+	int irq, err;
 
 	priv = devm_kzalloc(&pdev->dev,	sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -308,62 +248,12 @@ static int xlp_gpio_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	if (pdev->dev.of_node) {
-		soc_type = (uintptr_t)of_device_get_match_data(&pdev->dev);
-	} else {
-		const struct acpi_device_id *acpi_id;
-
-		acpi_id = acpi_match_device(pdev->dev.driver->acpi_match_table,
-						&pdev->dev);
-		if (!acpi_id || !acpi_id->driver_data) {
-			dev_err(&pdev->dev, "Unable to match ACPI ID\n");
-			return -ENODEV;
-		}
-		soc_type = (uintptr_t) acpi_id->driver_data;
-	}
-
-	switch (soc_type) {
-	case XLP_GPIO_VARIANT_XLP832:
-		priv->gpio_out_en = gpio_base + GPIO_OUTPUT_EN;
-		priv->gpio_paddrv = gpio_base + GPIO_PADDRV;
-		priv->gpio_intr_stat = gpio_base + GPIO_INT_STAT;
-		priv->gpio_intr_type = gpio_base + GPIO_INT_TYPE;
-		priv->gpio_intr_pol = gpio_base + GPIO_INT_POL;
-		priv->gpio_intr_en = gpio_base + GPIO_INT_EN00;
-		ngpio = 41;
-		break;
-	case XLP_GPIO_VARIANT_XLP208:
-	case XLP_GPIO_VARIANT_XLP316:
-		priv->gpio_out_en = gpio_base + GPIO_OUTPUT_EN;
-		priv->gpio_paddrv = gpio_base + GPIO_PADDRV;
-		priv->gpio_intr_stat = gpio_base + GPIO_3XX_INT_STAT;
-		priv->gpio_intr_type = gpio_base + GPIO_3XX_INT_TYPE;
-		priv->gpio_intr_pol = gpio_base + GPIO_3XX_INT_POL;
-		priv->gpio_intr_en = gpio_base + GPIO_3XX_INT_EN00;
-
-		ngpio = (soc_type == XLP_GPIO_VARIANT_XLP208) ? 42 : 57;
-		break;
-	case XLP_GPIO_VARIANT_XLP980:
-	case XLP_GPIO_VARIANT_XLP532:
-	case GPIO_VARIANT_VULCAN:
-		priv->gpio_out_en = gpio_base + GPIO_9XX_OUTPUT_EN;
-		priv->gpio_paddrv = gpio_base + GPIO_9XX_PADDRV;
-		priv->gpio_intr_stat = gpio_base + GPIO_9XX_INT_STAT;
-		priv->gpio_intr_type = gpio_base + GPIO_9XX_INT_TYPE;
-		priv->gpio_intr_pol = gpio_base + GPIO_9XX_INT_POL;
-		priv->gpio_intr_en = gpio_base + GPIO_9XX_INT_EN00;
-
-		if (soc_type == XLP_GPIO_VARIANT_XLP980)
-			ngpio = 66;
-		else if (soc_type == XLP_GPIO_VARIANT_XLP532)
-			ngpio = 67;
-		else
-			ngpio = 70;
-		break;
-	default:
-		dev_err(&pdev->dev, "Unknown Processor type!\n");
-		return -ENODEV;
-	}
+	priv->gpio_out_en = gpio_base + GPIO_9XX_OUTPUT_EN;
+	priv->gpio_paddrv = gpio_base + GPIO_9XX_PADDRV;
+	priv->gpio_intr_stat = gpio_base + GPIO_9XX_INT_STAT;
+	priv->gpio_intr_type = gpio_base + GPIO_9XX_INT_TYPE;
+	priv->gpio_intr_pol = gpio_base + GPIO_9XX_INT_POL;
+	priv->gpio_intr_en = gpio_base + GPIO_9XX_INT_EN00;
 
 	bitmap_zero(priv->gpio_enabled_mask, XLP_MAX_NR_GPIO);
 
@@ -373,7 +263,7 @@ static int xlp_gpio_probe(struct platform_device *pdev)
 	gc->label = dev_name(&pdev->dev);
 	gc->base = 0;
 	gc->parent = &pdev->dev;
-	gc->ngpio = ngpio;
+	gc->ngpio = 70;
 	gc->of_node = pdev->dev.of_node;
 	gc->direction_output = xlp_gpio_dir_output;
 	gc->direction_input = xlp_gpio_dir_input;
@@ -382,19 +272,6 @@ static int xlp_gpio_probe(struct platform_device *pdev)
 
 	spin_lock_init(&priv->lock);
 
-	/* XLP(MIPS) has fixed range for GPIO IRQs, Vulcan(ARM64) does not */
-	if (soc_type != GPIO_VARIANT_VULCAN) {
-		irq_base = devm_irq_alloc_descs(&pdev->dev, -1,
-						XLP_GPIO_IRQ_BASE,
-						gc->ngpio, 0);
-		if (irq_base < 0) {
-			dev_err(&pdev->dev, "Failed to allocate IRQ numbers\n");
-			return irq_base;
-		}
-	} else {
-		irq_base = 0;
-	}
-
 	girq = &gc->irq;
 	girq->chip = &xlp_gpio_irq_chip;
 	girq->parent_handler = xlp_gpio_generic_handler;
@@ -405,7 +282,7 @@ static int xlp_gpio_probe(struct platform_device *pdev)
 	if (!girq->parents)
 		return -ENOMEM;
 	girq->parents[0] = irq;
-	girq->first = irq_base;
+	girq->first = 0;
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_level_irq;
 
@@ -430,7 +307,6 @@ MODULE_DEVICE_TABLE(acpi, xlp_gpio_acpi_match);
 static struct platform_driver xlp_gpio_driver = {
 	.driver		= {
 		.name	= "xlp-gpio",
-		.of_match_table = xlp_gpio_of_ids,
 		.acpi_match_table = ACPI_PTR(xlp_gpio_acpi_match),
 	},
 	.probe		= xlp_gpio_probe,
-- 
2.32.0

