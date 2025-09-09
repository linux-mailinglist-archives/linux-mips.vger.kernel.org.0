Return-Path: <linux-mips+bounces-11130-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEC5B4A7D1
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 11:29:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 036CC188B708
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 09:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D9630AD10;
	Tue,  9 Sep 2025 09:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WAyENct7"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F210D308F08
	for <linux-mips@vger.kernel.org>; Tue,  9 Sep 2025 09:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757409361; cv=none; b=cHktWZK8nntcw+ii4g7zicRSzzSxxYj9bU/+FEw/ywc5Z4+OKV97g4lKwksT2KWn8CA30G4xjY7RYiG5tRhTi8wTQ/obMYtvFItU9P2YMrkAJChU5FKyuaGZhJiwynIxHzMndbgQZCWePa7Ses8WHdfGWBDVyv8dcqVjEEx4BvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757409361; c=relaxed/simple;
	bh=DHIwykEQPa3w881W4iGI+NVdGDSXAEuIFPzLyCbBCB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i5sXRBzloUOVP1U2DWQ85SPqLeYOC+3Un0vEk+MaDp7CfzW5Fbt8xWi+nLoqjPMIGHn6ut/LWUNKJShHpJEINFOHf/6pjt/HtJabF9bIM6i3edEDsquXtyOBieX1XBa0m+zGIPoH2Le0qH0Zmy2N1yA9lVmlN32MyVfWvw8X/7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WAyENct7; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3da4c14a5f9so3925378f8f.0
        for <linux-mips@vger.kernel.org>; Tue, 09 Sep 2025 02:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409356; x=1758014156; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+6XI455PiNr81zZH6BtcUTDH3erDPhGkBmwL0UjtiA8=;
        b=WAyENct7zsMeiHPwC0bSoB3JDvYJwSl5Ye/C3GgdrCLJ60EnE4UsVHYdTeyI0G+uiE
         VNAzFcEAu7wEYcf5J5If3/Kqef2apyIH0w8uNqM6nqkMMamUI+0W5RDEVeUSNmQli/+b
         epUITlXQgTFn8XU9nAyropT1jqQpqk0oSbIDkTLlKxyL6qTmssqILCADVAJYOHG6yH1q
         UTFfS3Em4X3JCx0+F20x5c7BGXHehtFHYRgepyDdO5W5BRrvk2rjO/Ph6MigQEwqDVzi
         u65MIvU/Z6Z9QVW88OO3NDH14xM98vA3C/MNQ3Z4vICHKRf0gqUcXFXrC/mLQ4J7QdOG
         vmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409356; x=1758014156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+6XI455PiNr81zZH6BtcUTDH3erDPhGkBmwL0UjtiA8=;
        b=o1hbmiDwid+GZIi2Lc7jb5pxUjFss9urC2u006TBGLOK8bou3Z/DF0PEaDaZbSkmcU
         LjHtsMswSfBABS4CCIpcMPQ57Ur3vFqnOgvd9YJjk7CvtwHcQv9RU1wIFbzK8sFe8mk3
         sdAa+hS6VYmWECaKseG6OgOcUfpuOjbPREkGPLz5eHM/hWh3Cj8f5kaOJGMRdIUmC+TK
         O7fRXQvV15cMQpubcEEUGDwdJWxSQ0yFRfq4M/VUAc474zguHi4tQHxk9wWrJLDo6gq1
         1hn5PmpjBThTdfxYcLYYXQQeypjPegIcicm+HCX8CFhSf+YCdNr4wCyfcWL+nCJ2t61Q
         c3fw==
X-Forwarded-Encrypted: i=1; AJvYcCUqKzOnN3bJxHOPi6CjJlhGS4xQSqzcYiWQwkICxnuM7z2ZeHG2tOreXteIPLyl1wikCp+RdJGMgRH8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3HR42C10FqNID7n8xG95mCO1MlWu3TjUace0uXjiQBbR0IKJI
	VVCgUzKLOkVlu9d5rohG/hOOh8ooEwB2EHAZRgkOakhT1RZwXC4Cn0+mtMltOmSbLrg=
X-Gm-Gg: ASbGnctu0EgiAmkohOaOTb/VOcye8QD0ilgfRLxWJMWPPQwiqe1PQMRWlUiIwbJsoQ9
	V0lrvcQ6mmQF55K6IeurVBP5FynRm1UO3s5snSmXGDPYh/3utLHnpkFEcyee/+Q/dtCRfQjuIWe
	ssVZgcpMBzVeVTbd3hwGJSmSMSxlVDpJCjDcOj1f6XZqNVaN8CDvctjG98ZlG6XK6qbNh1WsPB/
	ip/Pz5Dt2DQ/7dPGe2et4OuA12pnh4P/nEn4J2S/cV/N/XdTCp4GmK72p5kZ0hdtr/5FLBJR/Bv
	IS7k+vQm+4ZXrJrmUOVcAt6UllUo+m+0lnBC+XvRwOc6FKm2uZutS+SPWqZmFmnuJUEM2WODdS4
	guf9t6uA9ZkAM+PcUtA==
X-Google-Smtp-Source: AGHT+IGhdNQDTQ/G062FzoKjkwVDoXK1StiDr7oBbkv9KofrVmt1JYjUhLT/5CSNVFCfr9+qyLMbkg==
X-Received: by 2002:a05:6000:40dd:b0:3d8:8f86:7afc with SMTP id ffacd0b85a97d-3e62a10b2f3mr10508011f8f.21.1757409356188;
        Tue, 09 Sep 2025 02:15:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:15:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 11:15:34 +0200
Subject: [PATCH 07/15] gpio: brcmstb: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-7-9f723dc3524a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10410;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=zh+dbaYfNDf7FOmStJJaYhI936mnW1RBjpO4BgoCwfY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/A4mNwDK6jTB0asDLFnuBHDFAYdY5VCwV9Zd
 0KgU+qodwqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wOAAKCRARpy6gFHHX
 ciZGD/96sA5hvRG/EKxfHse55GCoj86m/FiF71CbJ3ZBRNaYYl/gIpIqfj/Jtyr6jzKJISpSdVP
 HEmDoVGMpsrsyBYTZV38rOLfkVWALRlNO0PHPiMCbSsbVjaUNjtn+9VSlrZeUgS/RQlA7BXOMOe
 gfldbXTsD1UcY6yMRw2PAQ3Ltbc3zhu0NXzhd35CEc3VY5TqlLt8dULxT8CbQMHWxqE2zFY0JGI
 zqMvOxJaMPE4MqBMiwO9aheYemrGCnO2W+t7fMsGJuu0mPtfJ/2j3IqibWCa4IIsEQty4dgpCf5
 UELR3jidqIAfxoY0JgsrbWn9Gt+/Wcltifr84Fisu/WBbUdr9GndT1ztvVs57Ozrd3sNOkiYZkp
 9HdjZHiqIlKxwErdmQWIAONG+oUhUCt0SiOT+M0zjqTjQKoAIT7pyOvxYutinQw4mG7T3wpsSPi
 2zSwUKU9kMY4KDz1MNuRKsWkNK9UZOC0TQFYvVwyQMiB3ldpzrNZyIS2sTBddrsHiATe1wPzV1p
 L2bqgPjv9dy8m+ZdBn7br20wSoMbMXFzZZzfTf5//yI3B+Foo05RP2GMYwQ5Z2vGkNLNKPei6wf
 /CYk5x0j3nXr8fUtL5Kw8fa66GX22SL3cz6tos9jwLPMXjg0RyccXN07KGbUw3JMDeiGzo7hGVu
 5jFwNdL/mMWh++g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-brcmstb.c | 112 ++++++++++++++++++++++++--------------------
 1 file changed, 60 insertions(+), 52 deletions(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index e29a9589b3ccbd17d10f6671088dca3e76537927..d03ff4ed9ef4c9d75f3e8c9c6fcb39bc577bcb79 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -3,6 +3,7 @@
 
 #include <linux/bitops.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/of.h>
 #include <linux/module.h>
 #include <linux/irqdomain.h>
@@ -37,7 +38,7 @@ enum gio_reg_index {
 struct brcmstb_gpio_bank {
 	struct list_head node;
 	int id;
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 	struct brcmstb_gpio_priv *parent_priv;
 	u32 width;
 	u32 wake_active;
@@ -72,19 +73,18 @@ __brcmstb_gpio_get_active_irqs(struct brcmstb_gpio_bank *bank)
 {
 	void __iomem *reg_base = bank->parent_priv->reg_base;
 
-	return bank->gc.read_reg(reg_base + GIO_STAT(bank->id)) &
-	       bank->gc.read_reg(reg_base + GIO_MASK(bank->id));
+	return gpio_generic_read_reg(&bank->chip, reg_base + GIO_STAT(bank->id)) &
+	       gpio_generic_read_reg(&bank->chip, reg_base + GIO_MASK(bank->id));
 }
 
 static unsigned long
 brcmstb_gpio_get_active_irqs(struct brcmstb_gpio_bank *bank)
 {
 	unsigned long status;
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&bank->gc.bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(&bank->chip);
+
 	status = __brcmstb_gpio_get_active_irqs(bank);
-	raw_spin_unlock_irqrestore(&bank->gc.bgpio_lock, flags);
 
 	return status;
 }
@@ -92,26 +92,26 @@ brcmstb_gpio_get_active_irqs(struct brcmstb_gpio_bank *bank)
 static int brcmstb_gpio_hwirq_to_offset(irq_hw_number_t hwirq,
 					struct brcmstb_gpio_bank *bank)
 {
-	return hwirq - bank->gc.offset;
+	return hwirq - bank->chip.gc.offset;
 }
 
 static void brcmstb_gpio_set_imask(struct brcmstb_gpio_bank *bank,
 		unsigned int hwirq, bool enable)
 {
-	struct gpio_chip *gc = &bank->gc;
 	struct brcmstb_gpio_priv *priv = bank->parent_priv;
 	u32 mask = BIT(brcmstb_gpio_hwirq_to_offset(hwirq, bank));
 	u32 imask;
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&gc->bgpio_lock, flags);
-	imask = gc->read_reg(priv->reg_base + GIO_MASK(bank->id));
+	guard(gpio_generic_lock_irqsave)(&bank->chip);
+
+	imask = gpio_generic_read_reg(&bank->chip,
+				      priv->reg_base + GIO_MASK(bank->id));
 	if (enable)
 		imask |= mask;
 	else
 		imask &= ~mask;
-	gc->write_reg(priv->reg_base + GIO_MASK(bank->id), imask);
-	raw_spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+	gpio_generic_write_reg(&bank->chip,
+			       priv->reg_base + GIO_MASK(bank->id), imask);
 }
 
 static int brcmstb_gpio_to_irq(struct gpio_chip *gc, unsigned offset)
@@ -150,7 +150,8 @@ static void brcmstb_gpio_irq_ack(struct irq_data *d)
 	struct brcmstb_gpio_priv *priv = bank->parent_priv;
 	u32 mask = BIT(brcmstb_gpio_hwirq_to_offset(d->hwirq, bank));
 
-	gc->write_reg(priv->reg_base + GIO_STAT(bank->id), mask);
+	gpio_generic_write_reg(&bank->chip,
+			       priv->reg_base + GIO_STAT(bank->id), mask);
 }
 
 static int brcmstb_gpio_irq_set_type(struct irq_data *d, unsigned int type)
@@ -162,7 +163,6 @@ static int brcmstb_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	u32 edge_insensitive, iedge_insensitive;
 	u32 edge_config, iedge_config;
 	u32 level, ilevel;
-	unsigned long flags;
 
 	switch (type) {
 	case IRQ_TYPE_LEVEL_LOW:
@@ -194,23 +194,25 @@ static int brcmstb_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 		return -EINVAL;
 	}
 
-	raw_spin_lock_irqsave(&bank->gc.bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(&bank->chip);
 
-	iedge_config = bank->gc.read_reg(priv->reg_base +
-			GIO_EC(bank->id)) & ~mask;
-	iedge_insensitive = bank->gc.read_reg(priv->reg_base +
-			GIO_EI(bank->id)) & ~mask;
-	ilevel = bank->gc.read_reg(priv->reg_base +
-			GIO_LEVEL(bank->id)) & ~mask;
+	iedge_config = gpio_generic_read_reg(&bank->chip,
+				priv->reg_base + GIO_EC(bank->id)) & ~mask;
+	iedge_insensitive = gpio_generic_read_reg(&bank->chip,
+				priv->reg_base + GIO_EI(bank->id)) & ~mask;
+	ilevel = gpio_generic_read_reg(&bank->chip,
+				priv->reg_base + GIO_LEVEL(bank->id)) & ~mask;
 
-	bank->gc.write_reg(priv->reg_base + GIO_EC(bank->id),
-			iedge_config | edge_config);
-	bank->gc.write_reg(priv->reg_base + GIO_EI(bank->id),
-			iedge_insensitive | edge_insensitive);
-	bank->gc.write_reg(priv->reg_base + GIO_LEVEL(bank->id),
-			ilevel | level);
+	gpio_generic_write_reg(&bank->chip,
+			       priv->reg_base + GIO_EC(bank->id),
+			       iedge_config | edge_config);
+	gpio_generic_write_reg(&bank->chip,
+			       priv->reg_base + GIO_EI(bank->id),
+			       iedge_insensitive | edge_insensitive);
+	gpio_generic_write_reg(&bank->chip,
+			       priv->reg_base + GIO_LEVEL(bank->id),
+			       ilevel | level);
 
-	raw_spin_unlock_irqrestore(&bank->gc.bgpio_lock, flags);
 	return 0;
 }
 
@@ -263,7 +265,7 @@ static void brcmstb_gpio_irq_bank_handler(struct brcmstb_gpio_bank *bank)
 {
 	struct brcmstb_gpio_priv *priv = bank->parent_priv;
 	struct irq_domain *domain = priv->irq_domain;
-	int hwbase = bank->gc.offset;
+	int hwbase = bank->chip.gc.offset;
 	unsigned long status;
 
 	while ((status = brcmstb_gpio_get_active_irqs(bank))) {
@@ -303,7 +305,7 @@ static struct brcmstb_gpio_bank *brcmstb_gpio_hwirq_to_bank(
 
 	/* banks are in descending order */
 	list_for_each_entry_reverse(bank, &priv->bank_list, node) {
-		i += bank->gc.ngpio;
+		i += bank->chip.gc.ngpio;
 		if (hwirq < i)
 			return bank;
 	}
@@ -332,7 +334,7 @@ static int brcmstb_gpio_irq_map(struct irq_domain *d, unsigned int irq,
 
 	dev_dbg(&pdev->dev, "Mapping irq %d for gpio line %d (bank %d)\n",
 		irq, (int)hwirq, bank->id);
-	ret = irq_set_chip_data(irq, &bank->gc);
+	ret = irq_set_chip_data(irq, &bank->chip.gc);
 	if (ret < 0)
 		return ret;
 	irq_set_lockdep_class(irq, &brcmstb_gpio_irq_lock_class,
@@ -394,7 +396,7 @@ static void brcmstb_gpio_remove(struct platform_device *pdev)
 	 * more important to actually perform all of the steps.
 	 */
 	list_for_each_entry(bank, &priv->bank_list, node)
-		gpiochip_remove(&bank->gc);
+		gpiochip_remove(&bank->chip.gc);
 }
 
 static int brcmstb_gpio_of_xlate(struct gpio_chip *gc,
@@ -412,7 +414,7 @@ static int brcmstb_gpio_of_xlate(struct gpio_chip *gc,
 	if (WARN_ON(gpiospec->args_count < gc->of_gpio_n_cells))
 		return -EINVAL;
 
-	offset = gpiospec->args[0] - bank->gc.offset;
+	offset = gpiospec->args[0] - bank->chip.gc.offset;
 	if (offset >= gc->ngpio || offset < 0)
 		return -EINVAL;
 
@@ -493,19 +495,17 @@ static int brcmstb_gpio_irq_setup(struct platform_device *pdev,
 static void brcmstb_gpio_bank_save(struct brcmstb_gpio_priv *priv,
 				   struct brcmstb_gpio_bank *bank)
 {
-	struct gpio_chip *gc = &bank->gc;
 	unsigned int i;
 
 	for (i = 0; i < GIO_REG_STAT; i++)
-		bank->saved_regs[i] = gc->read_reg(priv->reg_base +
-						   GIO_BANK_OFF(bank->id, i));
+		bank->saved_regs[i] = gpio_generic_read_reg(&bank->chip,
+					priv->reg_base + GIO_BANK_OFF(bank->id, i));
 }
 
 static void brcmstb_gpio_quiesce(struct device *dev, bool save)
 {
 	struct brcmstb_gpio_priv *priv = dev_get_drvdata(dev);
 	struct brcmstb_gpio_bank *bank;
-	struct gpio_chip *gc;
 	u32 imask;
 
 	/* disable non-wake interrupt */
@@ -513,8 +513,6 @@ static void brcmstb_gpio_quiesce(struct device *dev, bool save)
 		disable_irq(priv->parent_irq);
 
 	list_for_each_entry(bank, &priv->bank_list, node) {
-		gc = &bank->gc;
-
 		if (save)
 			brcmstb_gpio_bank_save(priv, bank);
 
@@ -523,8 +521,9 @@ static void brcmstb_gpio_quiesce(struct device *dev, bool save)
 			imask = bank->wake_active;
 		else
 			imask = 0;
-		gc->write_reg(priv->reg_base + GIO_MASK(bank->id),
-			       imask);
+		gpio_generic_write_reg(&bank->chip,
+				       priv->reg_base + GIO_MASK(bank->id),
+				       imask);
 	}
 }
 
@@ -538,12 +537,12 @@ static void brcmstb_gpio_shutdown(struct platform_device *pdev)
 static void brcmstb_gpio_bank_restore(struct brcmstb_gpio_priv *priv,
 				      struct brcmstb_gpio_bank *bank)
 {
-	struct gpio_chip *gc = &bank->gc;
 	unsigned int i;
 
 	for (i = 0; i < GIO_REG_STAT; i++)
-		gc->write_reg(priv->reg_base + GIO_BANK_OFF(bank->id, i),
-			      bank->saved_regs[i]);
+		gpio_generic_write_reg(&bank->chip,
+				       priv->reg_base + GIO_BANK_OFF(bank->id, i),
+				       bank->saved_regs[i]);
 }
 
 static int brcmstb_gpio_suspend(struct device *dev)
@@ -585,6 +584,7 @@ static const struct dev_pm_ops brcmstb_gpio_pm_ops = {
 
 static int brcmstb_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	void __iomem *reg_base;
@@ -665,17 +665,24 @@ static int brcmstb_gpio_probe(struct platform_device *pdev)
 			bank->width = bank_width;
 		}
 
+		gc = &bank->chip.gc;
+
 		/*
 		 * Regs are 4 bytes wide, have data reg, no set/clear regs,
 		 * and direction bits have 0 = output and 1 = input
 		 */
-		gc = &bank->gc;
-		err = bgpio_init(gc, dev, 4,
-				reg_base + GIO_DATA(bank->id),
-				NULL, NULL, NULL,
-				reg_base + GIO_IODIR(bank->id), flags);
+
+		config = (typeof(config)){
+			.dev = dev,
+			.sz = 4,
+			.dat = reg_base + GIO_DATA(bank->id),
+			.dirin = reg_base + GIO_IODIR(bank->id),
+			.flags = flags,
+		};
+
+		err = gpio_generic_chip_init(&bank->chip, &config);
 		if (err) {
-			dev_err(dev, "bgpio_init() failed\n");
+			dev_err(dev, "failed to initialize generic GPIO chip\n");
 			goto fail;
 		}
 
@@ -700,7 +707,8 @@ static int brcmstb_gpio_probe(struct platform_device *pdev)
 		 * be retained from S5 cold boot
 		 */
 		need_wakeup_event |= !!__brcmstb_gpio_get_active_irqs(bank);
-		gc->write_reg(reg_base + GIO_MASK(bank->id), 0);
+		gpio_generic_write_reg(&bank->chip,
+				       reg_base + GIO_MASK(bank->id), 0);
 
 		err = gpiochip_add_data(gc, bank);
 		if (err) {

-- 
2.48.1


