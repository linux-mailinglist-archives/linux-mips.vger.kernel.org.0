Return-Path: <linux-mips+bounces-11131-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A83CB4A793
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 11:25:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 246037ABD20
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 09:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9532B30BB9A;
	Tue,  9 Sep 2025 09:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="FOdwJ9Nm"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E3D309DDF
	for <linux-mips@vger.kernel.org>; Tue,  9 Sep 2025 09:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757409363; cv=none; b=V7vbJ78FVuxxluDsgM/aYx7mcoRxidTgB5Pi/w0SSbd7Hc94alswregCgOdPbfKisTHIb1ewEZy3eM2suHIg/GUM67LyBY1iejPkZFYRNbgAGni1Cl0v1O2rwyC1dtuJApiVGCTlvcs2DVJnt2/F++V2OvYEIcvDnpkvOo9kSks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757409363; c=relaxed/simple;
	bh=1FEcQAUswumhuSrIfLEzKyEKnEkv//ILIT58TzKEylA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EjWH+MS1qhKyv+mJ3zPbVsvPBbmyEkqtisGvPo69sSLrGIoPMW8k/BnZRqRBSypFk8ccgHU5JHnX3iy/LPTYkprk6ZmDc91oGGEaa7HSD3/TctFRYJMsLUoaaSUUkfxPB+EQphktMsQhDfVK85TSraCQmCQi1WOvumFD7gbAIy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=FOdwJ9Nm; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3dae49b117bso4690554f8f.1
        for <linux-mips@vger.kernel.org>; Tue, 09 Sep 2025 02:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409358; x=1758014158; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=imvYh5lR/dHX9OHCZw7SQaMxZ7ezZGMquKjwxXrqu/k=;
        b=FOdwJ9Nm3infU61sOR3jK0/8Ifb8O0QmEAy3wNpfwfZbIpoFmadwo7lXEZXuwWKjmJ
         aqPnZsjmNLjr0GbsFNaRxFuFdFuKcUVJqwMU00Z7eHCKOY1iQzsKeVBGTgnYCOY6dWgI
         eZcfc/7mIWeKINxQwfvfg3/bQ1d/VuXMHG7HEiBD/4bwMMrRb9j0/ZkVZYGbQAUsu6sq
         GWmtikHtLii4bzA5CYZJs4OdZzHVyIk9pVIO/V3wOYrKR9dJGSK1fcQx78x0EXrEBk3d
         U4FnNhgPjH61gxu3titlot7VLdhFgqAMdHon9LvzqUmKZ2DNEY4Z1DIC0rkQQvV8OHZR
         3eQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409358; x=1758014158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=imvYh5lR/dHX9OHCZw7SQaMxZ7ezZGMquKjwxXrqu/k=;
        b=KQfZGc2wc4c9gAIAfzaWgC/hJD51K2BnUPbttcntUD5SKdyFGFG54r7ZtYUR2h0lXP
         tQrPYKsZuvGNVizmBHSMxt9SfxXrQoOG6kzWFIZsc7vYZL5u6G1bGRWaO6lpBLAt9kge
         YqXYbeDEMoq/QY2Cc4cftVnRAv9nnii3G5ppY6919mZ3D6bPVbROBH4mDb9jZ+Wj/MgF
         d7GA3UKwCLfh5+qPoymSIcrndgbFN9QH8JaDnuBniO3mHNa0v5hk6BL++RnkJVhDI7vc
         Ds9L4s3y4CuBCXLKwHaA3GLF75hnX2JFg1QeG+sgOezvcfnsiI71tDcESTvWSdOo3cKW
         SJWA==
X-Forwarded-Encrypted: i=1; AJvYcCWVXOl3aTMaVwjMsQFL10S+7suhc62n2Ea6ST/arTecEFo3cGm37Pm4lk2huE0/Vt0I+Z/wOnw5PP7I@vger.kernel.org
X-Gm-Message-State: AOJu0YyiZk2V7nHf/VZ3HaDAQsqTybG8olE9m4tVR63OA4yLgmHY5I6S
	V+2ng/bHJDwvMzqY74rPvxqissjXtzvFHjxvw3l69qQ/umyPrKI3yUnwuxOUBDx2lyk=
X-Gm-Gg: ASbGncto9iPgzHDYzQ7uMfLWpENezuSEZSJIWByzFK5Sf7OSSkZ5AwkeajlMnff7+Mw
	aloB/l4MEkFOa8r+6jkauXjw0o60+rilwKsMNbjnV572SmixAhvz6M/PMcSLqScnlMtkVjbCqYB
	wZguss0praiWhO6ebWqYkeHJveeIuwSNnMREC7AJ2ypSSUg+5dz3kCsWztZHt2xpQvUuyvCUynz
	cSHjpExrXnTzJZ4DHCrAh0/bGEN8EdcvDzFsQdGgRDeoc3smIuAfaH3JnmKyMxLc4G0sU+dFJPf
	jiJNChvryP/3senXtNGMzP2MYXHWyk6wvZJMEuUfwna8mcN7X7fGH2074NceegcG2GzEdQn4ave
	kDr94evUExI1RUwZd4Q==
X-Google-Smtp-Source: AGHT+IFXdZbV4+FiR+g1iDJ8jJCYsBpu7n34tdX+VbMu0cFX2kWCDQk+M9AJM+qd4ppleGeZ928X+w==
X-Received: by 2002:a05:6000:2f86:b0:3da:484a:3109 with SMTP id ffacd0b85a97d-3e6462581b8mr10915610f8f.38.1757409358327;
        Tue, 09 Sep 2025 02:15:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:15:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 11:15:35 +0200
Subject: [PATCH 08/15] gpio: mt7621: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-8-9f723dc3524a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4763;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=M1OC3OhNMgxsP5tAU1lwG6NLBHcwqFdL7D8NR7XeUHg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/A4aZdax70K5uQfOmnaoQXt7HkrYee5gxJRb
 6C6qpw21tGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wOAAKCRARpy6gFHHX
 crGMEACO4tQW9r/dZEd11av+YA6qbWLWsdG+wUB7P/ckV/W+L99g0jDIZ8ZxwasnJyqD7RyZ00E
 2DEUCCF/TkBEvZF7s7iZfVuIKwjGb27+59KWDM0loRrPE0MNZSmAB1lxSKe9LglSlOINSmKRTXw
 cRa4kQ/Df8O9mz3y7wSQ41HUnv62dRhoaPmREqSENbZMGTSumq463FnVOI60KiaL5I1eICCWVd/
 uPU3dDiBTgtU9/QSsR2NEXM0jV8X4U86r+jVKCTkP30c13kD5l2fQq6XQe5YCWE9Ltd9meCLkFK
 laYeyO1mk6xHPgr9mik32wx/m9wbwoSgyyRotGrxmOgZCWMrk86iSx9nilpAFuSW2KBcaGpWEQo
 AZ0hPY2YNCR3BivREbh9xKPwPn0e5MxKFJLGzHnSnVFCw1J87ALf7Djs1Eh+HWDd9LF2rg+Vjo4
 8VXPgfe37EZHRKPe1Bw6mosIGM0U4CpTYk6VY+HYU6rM7lJios/x3nfhWnOFj526OHEdDCooA0f
 m/W8+zKBpULtaJbckno/1b1OdvacZ/zfYHxVMjlL7ihR1hCRkFvw7sCzJIE3pDfPQuMv2u3cc+o
 4kVW5zkUcdATe1gdK8LcNb1p4slcV1povBGAcHVdWCWUYcyLHMknJ7ZOgvxFCP4hDT2g9MO5N5u
 v0s8Kkc0/dHTi4w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mt7621.c | 51 +++++++++++++++++++++++++++++-----------------
 1 file changed, 32 insertions(+), 19 deletions(-)

diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
index 93facbebb80efadbdd3fb4500e0db14936287f1a..ed444cc8bc7c2b921be6588ce850027a2e3088b4 100644
--- a/drivers/gpio/gpio-mt7621.c
+++ b/drivers/gpio/gpio-mt7621.c
@@ -6,6 +6,7 @@
 
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -30,7 +31,7 @@
 
 struct mtk_gc {
 	struct irq_chip irq_chip;
-	struct gpio_chip chip;
+	struct gpio_generic_chip chip;
 	spinlock_t lock;
 	int bank;
 	u32 rising;
@@ -59,27 +60,29 @@ struct mtk {
 static inline struct mtk_gc *
 to_mediatek_gpio(struct gpio_chip *chip)
 {
-	return container_of(chip, struct mtk_gc, chip);
+	struct gpio_generic_chip *gen_gc = to_gpio_generic_chip(chip);
+
+	return container_of(gen_gc, struct mtk_gc, chip);
 }
 
 static inline void
 mtk_gpio_w32(struct mtk_gc *rg, u32 offset, u32 val)
 {
-	struct gpio_chip *gc = &rg->chip;
+	struct gpio_chip *gc = &rg->chip.gc;
 	struct mtk *mtk = gpiochip_get_data(gc);
 
 	offset = (rg->bank * GPIO_BANK_STRIDE) + offset;
-	gc->write_reg(mtk->base + offset, val);
+	gpio_generic_write_reg(&rg->chip, mtk->base + offset, val);
 }
 
 static inline u32
 mtk_gpio_r32(struct mtk_gc *rg, u32 offset)
 {
-	struct gpio_chip *gc = &rg->chip;
+	struct gpio_chip *gc = &rg->chip.gc;
 	struct mtk *mtk = gpiochip_get_data(gc);
 
 	offset = (rg->bank * GPIO_BANK_STRIDE) + offset;
-	return gc->read_reg(mtk->base + offset);
+	return gpio_generic_read_reg(&rg->chip, mtk->base + offset);
 }
 
 static irqreturn_t
@@ -220,6 +223,7 @@ static const struct irq_chip mt7621_irq_chip = {
 static int
 mediatek_gpio_bank_probe(struct device *dev, int bank)
 {
+	struct gpio_generic_chip_config config;
 	struct mtk *mtk = dev_get_drvdata(dev);
 	struct mtk_gc *rg;
 	void __iomem *dat, *set, *ctrl, *diro;
@@ -236,21 +240,30 @@ mediatek_gpio_bank_probe(struct device *dev, int bank)
 	ctrl = mtk->base + GPIO_REG_DCLR + (rg->bank * GPIO_BANK_STRIDE);
 	diro = mtk->base + GPIO_REG_CTRL + (rg->bank * GPIO_BANK_STRIDE);
 
-	ret = bgpio_init(&rg->chip, dev, 4, dat, set, ctrl, diro, NULL,
-			 BGPIOF_NO_SET_ON_INPUT);
+	config = (typeof(config)){
+		.dev = dev,
+		.sz = 4,
+		.dat = dat,
+		.set = set,
+		.clr = ctrl,
+		.dirout = diro,
+		.flags = BGPIOF_NO_SET_ON_INPUT,
+	};
+
+	ret = gpio_generic_chip_init(&rg->chip, &config);
 	if (ret) {
-		dev_err(dev, "bgpio_init() failed\n");
+		dev_err(dev, "failed to initialize generic GPIO chip\n");
 		return ret;
 	}
 
-	rg->chip.of_gpio_n_cells = 2;
-	rg->chip.of_xlate = mediatek_gpio_xlate;
-	rg->chip.label = devm_kasprintf(dev, GFP_KERNEL, "%s-bank%d",
+	rg->chip.gc.of_gpio_n_cells = 2;
+	rg->chip.gc.of_xlate = mediatek_gpio_xlate;
+	rg->chip.gc.label = devm_kasprintf(dev, GFP_KERNEL, "%s-bank%d",
 					dev_name(dev), bank);
-	if (!rg->chip.label)
+	if (!rg->chip.gc.label)
 		return -ENOMEM;
 
-	rg->chip.offset = bank * MTK_BANK_WIDTH;
+	rg->chip.gc.offset = bank * MTK_BANK_WIDTH;
 
 	if (mtk->gpio_irq) {
 		struct gpio_irq_chip *girq;
@@ -261,7 +274,7 @@ mediatek_gpio_bank_probe(struct device *dev, int bank)
 		 */
 		ret = devm_request_irq(dev, mtk->gpio_irq,
 				       mediatek_gpio_irq_handler, IRQF_SHARED,
-				       rg->chip.label, &rg->chip);
+				       rg->chip.gc.label, &rg->chip.gc);
 
 		if (ret) {
 			dev_err(dev, "Error requesting IRQ %d: %d\n",
@@ -269,7 +282,7 @@ mediatek_gpio_bank_probe(struct device *dev, int bank)
 			return ret;
 		}
 
-		girq = &rg->chip.irq;
+		girq = &rg->chip.gc.irq;
 		gpio_irq_chip_set_chip(girq, &mt7621_irq_chip);
 		/* This will let us handle the parent IRQ in the driver */
 		girq->parent_handler = NULL;
@@ -279,17 +292,17 @@ mediatek_gpio_bank_probe(struct device *dev, int bank)
 		girq->handler = handle_simple_irq;
 	}
 
-	ret = devm_gpiochip_add_data(dev, &rg->chip, mtk);
+	ret = devm_gpiochip_add_data(dev, &rg->chip.gc, mtk);
 	if (ret < 0) {
 		dev_err(dev, "Could not register gpio %d, ret=%d\n",
-			rg->chip.ngpio, ret);
+			rg->chip.gc.ngpio, ret);
 		return ret;
 	}
 
 	/* set polarity to low for all gpios */
 	mtk_gpio_w32(rg, GPIO_REG_POL, 0);
 
-	dev_info(dev, "registering %d gpios\n", rg->chip.ngpio);
+	dev_info(dev, "registering %d gpios\n", rg->chip.gc.ngpio);
 
 	return 0;
 }

-- 
2.48.1


