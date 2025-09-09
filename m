Return-Path: <linux-mips+bounces-11125-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3CAB4A7A8
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 11:26:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B321188980D
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 09:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 650442D8764;
	Tue,  9 Sep 2025 09:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BBcuVf72"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831DF2D6E4E
	for <linux-mips@vger.kernel.org>; Tue,  9 Sep 2025 09:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757409349; cv=none; b=ddgHR9NaMX5Zo73H8eEetPlmj48t8D//tz3xnHsCBbU2wpUHiFRcz0/RGzOIQzfAENTDz8arxn+cdam1njzStdulUlyyntUsTMxLzW+8EQVhLu6esSAoRNiTZFVkkKTv+/LrePx++1d2IMcPJy1rtDrRw6tzpC7KuTTYZ4dMZ/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757409349; c=relaxed/simple;
	bh=bx8vBpkb7lvohRakQejGfDmPX7Fn9KBNVicitmUoTmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IKh1sMjwVr3oWXgN705nVTKae0V89W0t+7fO8VgzGAv1JnjOtbv/rESsTJlxNKBPEXMpDKUVW5x0z8N/jTNSn6EtjbvDS4LPx5zD34ERstmzr4CWtkG3GbvjhqXixB/DJORxG0D/3EcgfbJ1nnTrjbOoe9Ye+77PaCTKRp4cTK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BBcuVf72; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3e34dbc38easo2255330f8f.1
        for <linux-mips@vger.kernel.org>; Tue, 09 Sep 2025 02:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409346; x=1758014146; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EIr9hr0mwMBxzADyBcOnBwlkdexYzwvomksGIS6w6RM=;
        b=BBcuVf7228sXKPDaRkc04Ieu/Q62CJABSC5ZHncJTfWOI2/rxP9AdXQTgxl5AejVLO
         uVaWwLCbX5mBPiI8RbleUMhzyAdgeIXXblHzLnElc5vTxufFlqmJq1I1DyYsK80Dw7SJ
         BMFmPefxWN8yZtTsS9F9hIrlYefBSHuDl+lkFr+kbxUWpARTkruOnEhTEp7JDtENn2LK
         rVd9cRUl4g8XZBvom7/IIgTwtI70q/u41xPdxCaBEl/ILsnYzjlCh8W1N5uKkJdiHvn1
         R01Im1CYzTriL3+Z6+0n07RAkW8e+lxrwbMkKvKkLA4eMS5A4x/IoKSo+v3AyX9aB6WU
         2U3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409346; x=1758014146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EIr9hr0mwMBxzADyBcOnBwlkdexYzwvomksGIS6w6RM=;
        b=ILctdLV3yYE8HK1RnG+HZVqPKvnhFZZokPIv/NaJ0BS6qwRxjlIxXZtkCaiZzbLBgU
         nVM3GgIvqH4zLcH7g3zSL8wN2NVDJpdpV+Op8zYsWwg3hEhj+x8x/sdYYe4kdYxRKyb5
         h3Ulo9rnvhXxp0s85SsV2quzrywK2fPf/bLaCs0rixXTEQcJobGlBGcJh9vVq7dMqEFr
         tw8kzCz7ppdHHkla5EeemhEnwtVo1bhZXHee4fob6M7/wlaNnbx3Pir9LsVxOyhouCyC
         XEpi5bdX1RGGqpA+nTOaTDgY63urEcPAbjarwf/nNi15nhvUODCStVqFtf5lrhfo8c8T
         2PAg==
X-Forwarded-Encrypted: i=1; AJvYcCUUSH8t8jHh8NH1YHfbWFB+3vlr7n7R0lSwI8ijhmHVNmijEo/W93LoBsgegrTjFGDVvGKNEX5odz1J@vger.kernel.org
X-Gm-Message-State: AOJu0YxMlwWJ+Zmt+DcqzoIt3hgl5blsRLs7HlWg845Yuk6tWZTUtUD6
	q3i3eWxccIEUoNFkP4ZVW3Td9W1N3X0a0sAm4Ic8PcGwPXGrpCAAMS9JWCCCnUdl6/U=
X-Gm-Gg: ASbGncv8x0KapJ/UHJAph7jeczqHQGa9JwFlFcj7I965qxSMj43SyfLq9StzWVKOKEW
	RUwqxb7Ww/jELxNcW5uPIrdWPHZq13hXr9at3UDhkD5sabBIVLZBgXU1JOAVylNgWuQcswVQB27
	Qayl0brK+xLC86pdOkxRDxSL/gMt8Kvec9wKY09Ioy+2BLyk1Hye0BsNwHVij9GHGaruSILcnRE
	3l9IoComJWGloCtrbSlQVZ36ZjYnej1skyTzL4uwSBLYkoj4DIdLrdKhmOA+/BSXqJx2i8mvPJd
	UzcRjTBXRKCP0BZHbyLuD66Nd/tNYwRp1F2FXaigGFSHMqsfZaGcOzJLettcIiCCnAesGrwy825
	kiG4ppkeQWniNyqJUyeXJylCcvrJ9
X-Google-Smtp-Source: AGHT+IGd8DWD9arGkUNKw4zJ2AP1gSmpXBaa6sBHZKQ/RTRSGAXz+ZKk9uFvPaqtbHsYLxTfFq0lRA==
X-Received: by 2002:a05:6000:178e:b0:3ce:a06e:f24e with SMTP id ffacd0b85a97d-3e64c87e0a1mr7050570f8f.52.1757409345752;
        Tue, 09 Sep 2025 02:15:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:15:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 11:15:29 +0200
Subject: [PATCH 02/15] gpio: loongson1: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-2-9f723dc3524a@linaro.org>
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
In-Reply-To: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, 
 Doug Berger <opendmb@gmail.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3630;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Wea5gLwd4IgFMNwzQvk4gQjcgC/QooQl4cu1eZu3y4s=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/A2FKDJ33HmmJ4TKcUEs6Wb765qwJ9kORopw
 zGH1aPIi9SJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wNgAKCRARpy6gFHHX
 cotBEACZHjEmFye/YUWwEG1t9JNn7F/QEqvztKESvvpKpdb/j36lRUnsQOK4I6o/CYNKwADuv7s
 lJtwq4Aq3yb08HIvTrVcbalTGGCc8sVoeuhwj45v3RDkH4kzFvlk7x11cEf8jfdhgAc/4L51iqL
 I870Hq3jyRB1Hcx6bStvRB6GpYEwP6haihYpjfK1LAeW5/TG2WggxKlRRQIKNu76uQ3AH8imb/y
 KoMf6QAY+kOGIgAR/0H7X+IUYMNkNbgaTmFWqs1oIIRnoJ8UyCy9CvbgcGqiljfaUozPOa0oSsB
 fAFQyT83ymZOswP7v7fi7xnuPRMyXOYliGC7ezpF1jVIBqS0FNjienW1XJA4U2l/o3BhnWDS0vF
 cvIdcKk19kIZ4S/3gtalBPcjMImvQ+7p+L/JZo7tsnnQrQE5kQKRbXCysmcy/M702tnvS3Wh7QF
 opbm3qz+aJf8Hutpc/M0iDUsSrHBjc/sO9R7FDQOT1qRL7yX5NHIS5HpWEHxHfOTN+48ZReWpBq
 m2X9CLyXoO6+KEdbs/VrnoTNxsz4JBY6hdbCb8BwS2GPyDX92FyQOiOAK5Ab4JweDvoBsuCqUmK
 5mlxO3bM4EweAjJXKZyOhyPpbA5GqJudG82pFFHg5ZJVPRhrpAESFdJ8zebzlGQERDhxTwQiqm4
 pS73JMaWn3/C1Ng==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-loongson1.c | 40 +++++++++++++++++++++++-----------------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-loongson1.c b/drivers/gpio/gpio-loongson1.c
index 6ca3b969db4df231517d021a7b4b5e3ddcf626f7..bb0e101e920889522aa4bbc69e5d6d2c49586cee 100644
--- a/drivers/gpio/gpio-loongson1.c
+++ b/drivers/gpio/gpio-loongson1.c
@@ -5,10 +5,11 @@
  * Copyright (C) 2015-2023 Keguang Zhang <keguang.zhang@gmail.com>
  */
 
+#include <linux/bitops.h>
 #include <linux/module.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/platform_device.h>
-#include <linux/bitops.h>
 
 /* Loongson 1 GPIO Register Definitions */
 #define GPIO_CFG		0x0
@@ -17,19 +18,18 @@
 #define GPIO_OUTPUT		0x30
 
 struct ls1x_gpio_chip {
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 	void __iomem *reg_base;
 };
 
 static int ls1x_gpio_request(struct gpio_chip *gc, unsigned int offset)
 {
 	struct ls1x_gpio_chip *ls1x_gc = gpiochip_get_data(gc);
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(&ls1x_gc->chip);
+
 	__raw_writel(__raw_readl(ls1x_gc->reg_base + GPIO_CFG) | BIT(offset),
 		     ls1x_gc->reg_base + GPIO_CFG);
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 
 	return 0;
 }
@@ -37,16 +37,16 @@ static int ls1x_gpio_request(struct gpio_chip *gc, unsigned int offset)
 static void ls1x_gpio_free(struct gpio_chip *gc, unsigned int offset)
 {
 	struct ls1x_gpio_chip *ls1x_gc = gpiochip_get_data(gc);
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(&ls1x_gc->chip);
+
 	__raw_writel(__raw_readl(ls1x_gc->reg_base + GPIO_CFG) & ~BIT(offset),
 		     ls1x_gc->reg_base + GPIO_CFG);
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 }
 
 static int ls1x_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
 	struct ls1x_gpio_chip *ls1x_gc;
 	int ret;
@@ -59,29 +59,35 @@ static int ls1x_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(ls1x_gc->reg_base))
 		return PTR_ERR(ls1x_gc->reg_base);
 
-	ret = bgpio_init(&ls1x_gc->gc, dev, 4, ls1x_gc->reg_base + GPIO_DATA,
-			 ls1x_gc->reg_base + GPIO_OUTPUT, NULL,
-			 NULL, ls1x_gc->reg_base + GPIO_DIR, 0);
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = ls1x_gc->reg_base + GPIO_DATA,
+		.set = ls1x_gc->reg_base + GPIO_OUTPUT,
+		.dirin = ls1x_gc->reg_base + GPIO_DIR,
+	};
+
+	ret = gpio_generic_chip_init(&ls1x_gc->chip, &config);
 	if (ret)
 		goto err;
 
-	ls1x_gc->gc.owner = THIS_MODULE;
-	ls1x_gc->gc.request = ls1x_gpio_request;
-	ls1x_gc->gc.free = ls1x_gpio_free;
+	ls1x_gc->chip.gc.owner = THIS_MODULE;
+	ls1x_gc->chip.gc.request = ls1x_gpio_request;
+	ls1x_gc->chip.gc.free = ls1x_gpio_free;
 	/*
 	 * Clear ngpio to let gpiolib get the correct number
 	 * by reading ngpios property
 	 */
-	ls1x_gc->gc.ngpio = 0;
+	ls1x_gc->chip.gc.ngpio = 0;
 
-	ret = devm_gpiochip_add_data(dev, &ls1x_gc->gc, ls1x_gc);
+	ret = devm_gpiochip_add_data(dev, &ls1x_gc->chip.gc, ls1x_gc);
 	if (ret)
 		goto err;
 
 	platform_set_drvdata(pdev, ls1x_gc);
 
 	dev_info(dev, "GPIO controller registered with %d pins\n",
-		 ls1x_gc->gc.ngpio);
+		 ls1x_gc->chip.gc.ngpio);
 
 	return 0;
 err:

-- 
2.48.1


