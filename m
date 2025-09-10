Return-Path: <linux-mips+bounces-11178-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCEFB50EE8
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 09:14:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F0911C22F62
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 07:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B7143093A8;
	Wed, 10 Sep 2025 07:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Xv8Y1X1T"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FE630BF5A
	for <linux-mips@vger.kernel.org>; Wed, 10 Sep 2025 07:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757488383; cv=none; b=qUwO/hYOwdZQdbGTGRbQnKFOvFwfVqeaRjWu0Zqx4gHDS+usuqtG2mguXk5dWZEDlIAkityEB8rK+fB7F6qLChTEnHFB5STdgjVs7G8IbIWwZ6YxF5QVdLdO4ZT+nSWFC2aIUCTxYaxnpqYAYRyJJvPoTeQxMu8JsMoNidlmODo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757488383; c=relaxed/simple;
	bh=0DGElTMkXyFW5Fefj64ChuRDRi8Lbw6CgTnExeQ+y7s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EhjiCT+rbiD9aFfBmoe2etnQIrTmA1BbIjSAPzKsDZ75t1xl/z4oWkfHHHkDS5kuJgfaE0584eJcNYhtmQkS3IsLDZChjgD24CnWwRWfzW4S6gkbQUydSG8UcWwvTHVwhTVdhNdxGeBOiklEisomob06lURtRGcA4sAVKvD9E0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Xv8Y1X1T; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45dde353b47so18457635e9.3
        for <linux-mips@vger.kernel.org>; Wed, 10 Sep 2025 00:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757488380; x=1758093180; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4UqewswoTYBEIcsMbZDgouz4c+DgJ88e6nymWd2RnwE=;
        b=Xv8Y1X1T+McHaBgOxZosXW/hUySY8+09Ag8QBPbsU0Yl0ZOPm514PQ1icn3aeOOM4q
         XITfoUfWTsiEDW3F7z8XChuZbZ+zKoc7Jl+Fd744MmsIZgHwvnZOh7wSDCpKceoR4Ugg
         jBHdu6y35a9mr0UrdCtMU44Qh2AIlNX6fhYebVxx2bB4vnx/fP5Absp8K+9dZXakv7gi
         eOkeyGjvBJHfge/0q2hQo+pjG6o7I1ThZ5hpCy/eJIsqahsM9fs4z1VXJa6BQgOpJCpj
         4U+3oWlJ0MMMq4Wvx6cqG6nhc3xRBDd6NR9h28FYJhDrXqJxou+R3dYXeqmV4xUQ3SXG
         prNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757488380; x=1758093180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4UqewswoTYBEIcsMbZDgouz4c+DgJ88e6nymWd2RnwE=;
        b=TuhBZQXRlD0Cc/invR6kgDcBZDg7SH8HCLaNyU3RzshpOtkGFcjZ8bHw281OEjY8nF
         hpOgf3dv6nXgT/z/scOymcsR4BAYh7luX47aEuIAWr26b2gfjIaJ4T/39C+Zx3kKwusK
         LFButkUFjMeI/7QwF3Vx44K1cDnG2gbuPSIl96BjQCS8iVW+VuMA+V663PfOV6wydSLE
         83jNxGKI7GPyuAb1LsLPeU37oq+UaUP9jp/PRW7wiC7+4B00YBUgj7jtThJVxfyh9Tgb
         U3G2vK5EycSju6KFdffwFvROA1DbI6lRzpS503psD82z2gOvmfAsZSVFp/fFkgoJeIHP
         2LoQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1GzJmZT8LeNA/7umKyeKTyOyW3DP9cRXojAmho/Ig1WkovoZH+x0j1lBtI3Hso9bJCyYPEKisQcTV@vger.kernel.org
X-Gm-Message-State: AOJu0YzdhHrQ3iVdP6l1CcQidpZ6eFYlJg5HrBY1yYuwNzw003td7jzK
	jmSmwmGqPQU1EP+B8tnhBLaif6/KUP8szp6/2XEU7LEblzWz+8InIhFn+rGRkwcZGpI=
X-Gm-Gg: ASbGncsUGbaloem6MhQ6ihrCva2V22E8NmlS/S2D1OSZGQhFe8yGtzmNeo69U3TwbPA
	jB3J0K3ajHYgN6eOO7d2qEXH4HSvm+jftSGMDeOSl3ovX1iz+C2nJSwShSFzkI6OxRfaA4vIIRP
	ioKhYV+um0XeDz/SsfiBqnJ+Gdz8+m+N/N47+AUZYbKpm9ikOEiwtHH2b43cdjUQrfF3/WoZbyr
	o+IwPXGbxIGp78FI0DHG9669LO6NzVnSeAhWmu5QmBTVQE0+dTcYyhx1jHeXITzX7q/E1RKtzo/
	2S+tqRKutDY6imRqYxd6Xmr8szU2FyyBxM8ylyYnLfHKD94tcpxg6Y4x+Gxcktgdt7KgNhyilSM
	t1ic8IeNZ97D/LFlH
X-Google-Smtp-Source: AGHT+IHM/EcqsUNxHTRDkv3Ro2FU5tTwnI8xZ82Dg6C6xAUM9mtRb1fnf1sXNkjM+VFNWYNXfmhjXA==
X-Received: by 2002:a05:600c:46d0:b0:45d:d96e:6176 with SMTP id 5b1f17b1804b1-45ddded62d8mr122670245e9.25.1757488379615;
        Wed, 10 Sep 2025 00:12:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81d20d2sm16357035e9.8.2025.09.10.00.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:12:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:12:40 +0200
Subject: [PATCH v2 04/15] gpio: ath79: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-gpio-mmio-gpio-conv-part4-v2-4-f3d1a4c57124@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4614;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=wGzsLYe28KPZB1pzrH+XgxKm5KCqfN9J0bmBOYG+Gco=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSTtTmv5xyvHuwcosTc3gy9UW+bEpZ2dbIBYT
 Hnhg3cEry2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEk7QAKCRARpy6gFHHX
 cucUD/9omit0rOIo7nBUQp1NY+g0m23ZYDVTkrv8PDFLBqip9QIN/E0Spw9mgMF8EFWu2Abra3A
 kgdXX56x/EVzo9LbQIESlljovTDZm7Kaad+0tYhXkLavji5TvvbVKE4gGIEEnWgCjHsuDpotfkt
 7EFf5Ivegc5pt84kcej+0R9OyLEm4p2jSYuCJ5Rpb02LInCEsYKmFB3R21MdNMk0awkxQ1FMVNm
 hF/CTynqUlN9oSrMDHE1X7Q/aoqRa3q+tzz2xdoIaozvpYW7UxeHSVYb33VoCUpGRgKkxqGZ6CP
 GKyiYuOBY+sbyf3vytebxAEYEj3fREBnHdkwLz8kFxybTumob3zF34bsvwdYMEAGYBqUEw5C5RV
 UFH1zeKrl8v7nzA6ZCTccLXIfQ6WIwZcRd3oopG5T0DCvnSf8hJS8dKVFdcjyjXJDjtBVKfVPAi
 zGOrbFBfjKJRd57SJaF7NrggN/dQEQDD+qEz/qwmG9tc7K74RRz3Oqu26LsTsnWOob4Ui2LYzG3
 +vpBkmrptSnD+UFq9Kq723eYPGASKDYy4xDNeyqN93oRYUajGSY3+gEIyyC44G0Zi9cET4kMax0
 rJhd1rC8QMyTxVq6dxlrTwJ4S85Ps6elhTCItk2in8SfWBDNoeVORRP4fawfgjCy5B+5ShyIjAu
 Keme0RB5lGm0H1w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ath79.c | 39 ++++++++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index de4cc12e5e0399abcef61a89c8c91a1b203d20fb..8879f23f1871ed323513082f4d2ebb2c40544cde 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -10,6 +10,7 @@
 
 #include <linux/device.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/mod_devicetable.h>
@@ -28,7 +29,7 @@
 #define AR71XX_GPIO_REG_INT_MASK	0x24
 
 struct ath79_gpio_ctrl {
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 	void __iomem *base;
 	raw_spinlock_t lock;
 	unsigned long both_edges;
@@ -37,8 +38,9 @@ struct ath79_gpio_ctrl {
 static struct ath79_gpio_ctrl *irq_data_to_ath79_gpio(struct irq_data *data)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct gpio_generic_chip *gen_gc = to_gpio_generic_chip(gc);
 
-	return container_of(gc, struct ath79_gpio_ctrl, gc);
+	return container_of(gen_gc, struct ath79_gpio_ctrl, chip);
 }
 
 static u32 ath79_gpio_read(struct ath79_gpio_ctrl *ctrl, unsigned reg)
@@ -72,7 +74,7 @@ static void ath79_gpio_irq_unmask(struct irq_data *data)
 	u32 mask = BIT(irqd_to_hwirq(data));
 	unsigned long flags;
 
-	gpiochip_enable_irq(&ctrl->gc, irqd_to_hwirq(data));
+	gpiochip_enable_irq(&ctrl->chip.gc, irqd_to_hwirq(data));
 	raw_spin_lock_irqsave(&ctrl->lock, flags);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, mask);
 	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
@@ -87,7 +89,7 @@ static void ath79_gpio_irq_mask(struct irq_data *data)
 	raw_spin_lock_irqsave(&ctrl->lock, flags);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, 0);
 	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
-	gpiochip_disable_irq(&ctrl->gc, irqd_to_hwirq(data));
+	gpiochip_disable_irq(&ctrl->chip.gc, irqd_to_hwirq(data));
 }
 
 static void ath79_gpio_irq_enable(struct irq_data *data)
@@ -187,8 +189,9 @@ static void ath79_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct irq_chip *irqchip = irq_desc_get_chip(desc);
+	struct gpio_generic_chip *gen_gc = to_gpio_generic_chip(gc);
 	struct ath79_gpio_ctrl *ctrl =
-		container_of(gc, struct ath79_gpio_ctrl, gc);
+		container_of(gen_gc, struct ath79_gpio_ctrl, chip);
 	unsigned long flags, pending;
 	u32 both_edges, state;
 	int irq;
@@ -224,6 +227,7 @@ MODULE_DEVICE_TABLE(of, ath79_gpio_of_match);
 
 static int ath79_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
 	struct ath79_gpio_ctrl *ctrl;
 	struct gpio_irq_chip *girq;
@@ -253,21 +257,26 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 		return PTR_ERR(ctrl->base);
 
 	raw_spin_lock_init(&ctrl->lock);
-	err = bgpio_init(&ctrl->gc, dev, 4,
-			ctrl->base + AR71XX_GPIO_REG_IN,
-			ctrl->base + AR71XX_GPIO_REG_SET,
-			ctrl->base + AR71XX_GPIO_REG_CLEAR,
-			oe_inverted ? NULL : ctrl->base + AR71XX_GPIO_REG_OE,
-			oe_inverted ? ctrl->base + AR71XX_GPIO_REG_OE : NULL,
-			0);
+
+	config = (struct gpio_generic_chip_config) {
+		.dev = dev,
+		.sz = 4,
+		.dat = ctrl->base + AR71XX_GPIO_REG_IN,
+		.set = ctrl->base + AR71XX_GPIO_REG_SET,
+		.clr = ctrl->base + AR71XX_GPIO_REG_CLEAR,
+		.dirout = oe_inverted ? NULL : ctrl->base + AR71XX_GPIO_REG_OE,
+		.dirin = oe_inverted ? ctrl->base + AR71XX_GPIO_REG_OE : NULL,
+	};
+
+	err = gpio_generic_chip_init(&ctrl->chip, &config);
 	if (err) {
-		dev_err(dev, "bgpio_init failed\n");
+		dev_err(dev, "failed to initialize generic GPIO chip\n");
 		return err;
 	}
 
 	/* Optional interrupt setup */
 	if (device_property_read_bool(dev, "interrupt-controller")) {
-		girq = &ctrl->gc.irq;
+		girq = &ctrl->chip.gc.irq;
 		gpio_irq_chip_set_chip(girq, &ath79_gpio_irqchip);
 		girq->parent_handler = ath79_gpio_irq_handler;
 		girq->num_parents = 1;
@@ -280,7 +289,7 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 		girq->handler = handle_simple_irq;
 	}
 
-	return devm_gpiochip_add_data(dev, &ctrl->gc, ctrl);
+	return devm_gpiochip_add_data(dev, &ctrl->chip.gc, ctrl);
 }
 
 static struct platform_driver ath79_gpio_driver = {

-- 
2.48.1


