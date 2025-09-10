Return-Path: <linux-mips+bounces-11185-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2CBB50EFF
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 09:15:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0A7954896E
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 07:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33A5130EF82;
	Wed, 10 Sep 2025 07:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="f0Ezy43k"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DA330E84D
	for <linux-mips@vger.kernel.org>; Wed, 10 Sep 2025 07:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757488401; cv=none; b=bxc6ViIYmDrdx/+Arw2gLVrcF87ghtIs97UN1QIRLX9QZBqo9I56SKTCX4GJJrwBRsNsBI8sz6gz/erOQ3PSUa7ETvqH9Z8ylT90qJZ+3noPOBsK/JZ2DobTBMm+YMFVklbkq9ZzNO/Xy9tacJNHP5AKFEdJJpSLGIwxWguYQMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757488401; c=relaxed/simple;
	bh=oe9bAeoGWCMCwkLnMRWtGAnRdXE9hqmBjJUdIhg/PLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JbLuK1PRTKv3L1RCyxDdYAV4qOhf8AgVMriVnEPVAUPgtRz4Ts4fMNqs9TqSJ1lgUc69eZgwd7cVupIXjG1Rqe7Wy3FUFjRtpim7wVljHPhNT6KWaWWcjrIdmdcfhmuVCHP5eGjxk5cyG8NAaKDdMl93R2a0/lAyeeWHP/CQrrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=f0Ezy43k; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3c6abcfd142so3218186f8f.2
        for <linux-mips@vger.kernel.org>; Wed, 10 Sep 2025 00:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757488397; x=1758093197; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=An6+hM66t3JeEzdqXYRIZViBfBwfWXQ86Ivlv8SMd0o=;
        b=f0Ezy43kAyYlTote8MS7qXkL0kvHu/3JzqGIVo6pX3Z/VLxxtc3UPDeDQRSEhhuZ6k
         SGoX1/IsKwH37dWUcxgiMVg4EHoW26QHHIbFTc4CYzdwxaS3nUN7j98xfwDd025EiyFE
         YFhdjIluOedT1WdoQ7TX48OaqdHYw8YysO4ZyU3JOflz930dQrS07xjMMPfgWs8YhD+g
         iLUQ1FVzYq64gHI3gPIsu+z9xmROu0jsBRJH1sFjFnTuZm0IsGFRvrGKm6QIy9dpxPvH
         L1cOW7WNIlZL+SP0dXa6BqUgPOloARNS+NXjSDV2oPDQkdzJYldurAgM1ejnwi7ZNyw2
         dqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757488397; x=1758093197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=An6+hM66t3JeEzdqXYRIZViBfBwfWXQ86Ivlv8SMd0o=;
        b=Ee1jv8DqZsZoZ33IMivNLMRGHuTaqpOFCFg5DDrYN0IZjkB5PCgD3vMBMpf2I6FYw7
         gUqtR0lpfSGLnJ6Xsnm5z1VtVcsWSprj/ALU+nWdscA9cJGTLLWogJpoUlajAI+jrp8G
         077a+sNgQTllkDlbp89V828wTiB8M2A2+r8h2EHjyvaYmS17G3S98Z5JzYhQNGw5DFM1
         a0dO++trHI+duNB+rdLGEMu07YJut0Qt+p6IP2W6nd9zglW6qdpmCJqOSHiJisH2L1PB
         0VIMuTsTWL9kuSdUsGxVnFkrxQZJn3AqKpPqkWA9lu2Kw/hB/EHn/UpiGxxzdTIfiB/y
         AC/w==
X-Forwarded-Encrypted: i=1; AJvYcCW1jcoe66aNpLGjBmnVZgHrtrmJwi+JHmjHbmb3nWAXVwLjPz0uouHlCak/+RVo21KJk5sLvf5+R9uR@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1diSXsWj9N1FWG6HvjmizxNaA+HAJ1wgGkLmucBfoSZ6bIYmm
	pRNSewQWfraKSC0zWqeHpXkw67TTsCdFx+WFkuKuQCnzuKExVWjHo+Od5ektC6n+KKQ=
X-Gm-Gg: ASbGncu8KBKKGiEYAjuj5XX/UaYYQKxprflvi9J3nyk/SNa7kcKBICpRIY2wwOHJQCw
	Ke0VYtbgMPGR4rfY8AjTwTaz9FBAedXWMlB1fYA/I4lBvPJaAcafY7PlmzX81Ex+4NJRIgMGw1u
	0ztoiXOGsEW2ZzNM+f+rmBtcmNYDcssVcpuSpbzH1I/KcjTk/qptDPlDELGGnf8jjJmPEN02cem
	64OW9UApM2LiBjisGuuQhg+j9huKYbX85IC4fzl4kgbSufJ2lfaHaKT5gwicC2HdhGO3KluMzp0
	SMNO4yQoaEBbVfiJVY0lhnyqvwEcJumDqjCzdF9yOxe2SS70oanRFjmXfU92afnjHpHDv6Yy/5M
	6Yr/RRqxMyCnDu50u
X-Google-Smtp-Source: AGHT+IHy5XKSyXs/1DRcnMNeVAy+4d6fp/JMB1+I8xVYdcyACU25uMeyY9vbA5I7O3QW/9RpEY4Hkg==
X-Received: by 2002:a05:6000:1885:b0:3ca:83e2:6339 with SMTP id ffacd0b85a97d-3e643ff3728mr7633649f8f.49.1757488396985;
        Wed, 10 Sep 2025 00:13:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81d20d2sm16357035e9.8.2025.09.10.00.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:13:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:12:47 +0200
Subject: [PATCH v2 11/15] gpio: sifive: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-gpio-mmio-gpio-conv-part4-v2-11-f3d1a4c57124@linaro.org>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6438;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=L9aoU0ZGQa8gL+sSeYrRjJ8TqRkxJOj7hf8fiLSe9SE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSTuKjz20PIfcAJYy/3UtT6a+XtkG6jfEExyI
 gswS7XTTeGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEk7gAKCRARpy6gFHHX
 cloaEADZ2SEEt7cXVpgjknBnw5IHqSuj6lTOrPKBK8Lr2EkodE/C/OaI6mRz5VdlRvFj6h44udf
 GLx3gv+Tnaqv5iqBiLjhkgBJesZ8qoqxJUc42erOqPSeCiUjmpwjCVVjPjEqYLHOvr0SQvhGOhu
 wY7l3m/pY5VkGxEcMbpQe7BBTH505Rn9/Joe1Vn6zPGPtnqWzh5KBK4hjq4vwuavMtC9QKnYdta
 QP8e8hCBnzYwcXBfWWliG25g3SDhflNooMMGYLGgn0lo1iM5OAMaIucc3NafxImhUk4tAfYdqZ7
 /aiVuU6QyVrkuEwBqbyz0ZhLrLJB+NWt5jaYQt5myVXRjuld4IqvoOZtipKTNQyHhGqcQeqgH2H
 DEMwhcsxlcev5f/gQP/9ysB37pCJ4jS+3HPTiVXKoazO9Iv0CTBHeReDOosklbvyMOYLzJwSqji
 RPZy+JVqJ4OOEr2F3Jy5lteGB4ga8cw8bDDD74HJwxrqHyaz2G0ydSXBwzPA5dT6wI898tKZ/O+
 HumCwDRTDXtGtCRzomWwhHVuQ/M+WhVviUjFmRFOJWVNrJql4a/NaiJWqjMEWweur8ZbuUmSb9/
 qL5w+/g1kUAkOdX6ILdODDMizAIapj4Zv7qjiHp9U+/VAC8uCT+nOLvu4BRVfJzrJJ1PQ2eqj2t
 BjL1Uly2BWAgKbQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-sifive.c | 73 ++++++++++++++++++++++++----------------------
 1 file changed, 38 insertions(+), 35 deletions(-)

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index 98ef975c44d9a6c9238605cfd1d5820fd70a66ca..2ced87ffd3bbf219c11857391eb4ea808adc0527 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -7,6 +7,7 @@
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
@@ -32,7 +33,7 @@
 
 struct sifive_gpio {
 	void __iomem		*base;
-	struct gpio_chip	gc;
+	struct gpio_generic_chip gen_gc;
 	struct regmap		*regs;
 	unsigned long		irq_state;
 	unsigned int		trigger[SIFIVE_GPIO_MAX];
@@ -41,10 +42,10 @@ struct sifive_gpio {
 
 static void sifive_gpio_set_ie(struct sifive_gpio *chip, unsigned int offset)
 {
-	unsigned long flags;
 	unsigned int trigger;
 
-	raw_spin_lock_irqsave(&chip->gc.bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(&chip->gen_gc);
+
 	trigger = (chip->irq_state & BIT(offset)) ? chip->trigger[offset] : 0;
 	regmap_update_bits(chip->regs, SIFIVE_GPIO_RISE_IE, BIT(offset),
 			   (trigger & IRQ_TYPE_EDGE_RISING) ? BIT(offset) : 0);
@@ -54,7 +55,6 @@ static void sifive_gpio_set_ie(struct sifive_gpio *chip, unsigned int offset)
 			   (trigger & IRQ_TYPE_LEVEL_HIGH) ? BIT(offset) : 0);
 	regmap_update_bits(chip->regs, SIFIVE_GPIO_LOW_IE, BIT(offset),
 			   (trigger & IRQ_TYPE_LEVEL_LOW) ? BIT(offset) : 0);
-	raw_spin_unlock_irqrestore(&chip->gc.bgpio_lock, flags);
 }
 
 static int sifive_gpio_irq_set_type(struct irq_data *d, unsigned int trigger)
@@ -72,13 +72,12 @@ static int sifive_gpio_irq_set_type(struct irq_data *d, unsigned int trigger)
 }
 
 static void sifive_gpio_irq_enable(struct irq_data *d)
-{
+	{
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct sifive_gpio *chip = gpiochip_get_data(gc);
 	irq_hw_number_t hwirq = irqd_to_hwirq(d);
 	int offset = hwirq % SIFIVE_GPIO_MAX;
 	u32 bit = BIT(offset);
-	unsigned long flags;
 
 	gpiochip_enable_irq(gc, hwirq);
 	irq_chip_enable_parent(d);
@@ -86,13 +85,13 @@ static void sifive_gpio_irq_enable(struct irq_data *d)
 	/* Switch to input */
 	gc->direction_input(gc, offset);
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
-	/* Clear any sticky pending interrupts */
-	regmap_write(chip->regs, SIFIVE_GPIO_RISE_IP, bit);
-	regmap_write(chip->regs, SIFIVE_GPIO_FALL_IP, bit);
-	regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IP, bit);
-	regmap_write(chip->regs, SIFIVE_GPIO_LOW_IP, bit);
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+	scoped_guard(gpio_generic_lock_irqsave, &chip->gen_gc) {
+		/* Clear any sticky pending interrupts */
+		regmap_write(chip->regs, SIFIVE_GPIO_RISE_IP, bit);
+		regmap_write(chip->regs, SIFIVE_GPIO_FALL_IP, bit);
+		regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IP, bit);
+		regmap_write(chip->regs, SIFIVE_GPIO_LOW_IP, bit);
+	}
 
 	/* Enable interrupts */
 	assign_bit(offset, &chip->irq_state, 1);
@@ -118,15 +117,14 @@ static void sifive_gpio_irq_eoi(struct irq_data *d)
 	struct sifive_gpio *chip = gpiochip_get_data(gc);
 	int offset = irqd_to_hwirq(d) % SIFIVE_GPIO_MAX;
 	u32 bit = BIT(offset);
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
-	/* Clear all pending interrupts */
-	regmap_write(chip->regs, SIFIVE_GPIO_RISE_IP, bit);
-	regmap_write(chip->regs, SIFIVE_GPIO_FALL_IP, bit);
-	regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IP, bit);
-	regmap_write(chip->regs, SIFIVE_GPIO_LOW_IP, bit);
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+	scoped_guard(gpio_generic_lock_irqsave, &chip->gen_gc) {
+		/* Clear all pending interrupts */
+		regmap_write(chip->regs, SIFIVE_GPIO_RISE_IP, bit);
+		regmap_write(chip->regs, SIFIVE_GPIO_FALL_IP, bit);
+		regmap_write(chip->regs, SIFIVE_GPIO_HIGH_IP, bit);
+		regmap_write(chip->regs, SIFIVE_GPIO_LOW_IP, bit);
+	}
 
 	irq_chip_eoi_parent(d);
 }
@@ -179,6 +177,7 @@ static const struct regmap_config sifive_gpio_regmap_config = {
 
 static int sifive_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
 	struct irq_domain *parent;
 	struct gpio_irq_chip *girq;
@@ -217,13 +216,17 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 	 */
 	parent = irq_get_irq_data(chip->irq_number[0])->domain;
 
-	ret = bgpio_init(&chip->gc, dev, 4,
-			 chip->base + SIFIVE_GPIO_INPUT_VAL,
-			 chip->base + SIFIVE_GPIO_OUTPUT_VAL,
-			 NULL,
-			 chip->base + SIFIVE_GPIO_OUTPUT_EN,
-			 chip->base + SIFIVE_GPIO_INPUT_EN,
-			 BGPIOF_READ_OUTPUT_REG_SET);
+	config = (struct gpio_generic_chip_config) {
+		.dev = dev,
+		.sz = 4,
+		.dat = chip->base + SIFIVE_GPIO_INPUT_VAL,
+		.set = chip->base + SIFIVE_GPIO_OUTPUT_VAL,
+		.dirout = chip->base + SIFIVE_GPIO_OUTPUT_EN,
+		.dirin = chip->base + SIFIVE_GPIO_INPUT_EN,
+		.flags = BGPIOF_READ_OUTPUT_REG_SET,
+	};
+
+	ret = gpio_generic_chip_init(&chip->gen_gc, &config);
 	if (ret) {
 		dev_err(dev, "unable to init generic GPIO\n");
 		return ret;
@@ -236,12 +239,12 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 	regmap_write(chip->regs, SIFIVE_GPIO_LOW_IE, 0);
 	chip->irq_state = 0;
 
-	chip->gc.base = -1;
-	chip->gc.ngpio = ngpio;
-	chip->gc.label = dev_name(dev);
-	chip->gc.parent = dev;
-	chip->gc.owner = THIS_MODULE;
-	girq = &chip->gc.irq;
+	chip->gen_gc.gc.base = -1;
+	chip->gen_gc.gc.ngpio = ngpio;
+	chip->gen_gc.gc.label = dev_name(dev);
+	chip->gen_gc.gc.parent = dev;
+	chip->gen_gc.gc.owner = THIS_MODULE;
+	girq = &chip->gen_gc.gc.irq;
 	gpio_irq_chip_set_chip(girq, &sifive_gpio_irqchip);
 	girq->fwnode = dev_fwnode(dev);
 	girq->parent_domain = parent;
@@ -249,7 +252,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
 	girq->handler = handle_bad_irq;
 	girq->default_type = IRQ_TYPE_NONE;
 
-	return gpiochip_add_data(&chip->gc, chip);
+	return gpiochip_add_data(&chip->gen_gc.gc, chip);
 }
 
 static const struct of_device_id sifive_gpio_match[] = {

-- 
2.48.1


