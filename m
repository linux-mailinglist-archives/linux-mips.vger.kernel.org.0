Return-Path: <linux-mips+bounces-11182-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D488B50EFA
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 09:15:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 29AEC188364E
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 07:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4158308F0B;
	Wed, 10 Sep 2025 07:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DD5SSpnO"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F07530CDAF
	for <linux-mips@vger.kernel.org>; Wed, 10 Sep 2025 07:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757488391; cv=none; b=mmLAQPGNeYjP9Es2Xg+TG5Kz8+USKZZnvBEGnYlYuGE+TdySwtkf/meZSnQkZRYWDtv6fc5Aut1jB01dhkowuVxfXg+sB6TS59gY9jj9VbmGtqFNzaKZ3vmdP6TzC3Qrz7sizLOEAjDtA1lNUMnkVhYmsZx7lEaK6gay9TQfI9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757488391; c=relaxed/simple;
	bh=JGgOh1WzhuJPudXduwjvGbOUGoItLMg8VZGskrCTK5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FIB5iz7ArHmtak9+NAZWXhO9x7iYgyunipYcfZMPsZ2PG9+oltXvRmWcL7hWBR7roYtRWq16Xm/A2HFVEE1ybgn7j9Fv+ZDbDQZKN7vO3Jr2L7mB7mRfpyxEwBYAhuIyc+eXH9GmjGnOPXeGHQ2gkKMRZzaYtsuuyfy2puK2D6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DD5SSpnO; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3dae49b1293so3271257f8f.1
        for <linux-mips@vger.kernel.org>; Wed, 10 Sep 2025 00:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757488388; x=1758093188; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NplkbxcOuSv0sFTn0nVn4XecH51jDagN9K/FkQXgFyQ=;
        b=DD5SSpnOuIDWa8M7tnY93/ywUjfiC420FGcEgGN8QGwOV9219OzQPzp5RDWyre6zWu
         KEY4dxi51fnP/7V+qtsw7mjBA12mpbOoJxuV0j70ivuWDQH6SOGo0wkc7rpev4upnmGf
         bZU19pbmwU8MaLgujQF7b8hx9IlXnWdpDlMJPTzcVUrYlz6LAwo6jVADsGKhE4K1SlvX
         r3ZeY+xfvw4rAsYjfluXDZfu+rTeby0dRlmCPww1UIryc/xp5jgt10Sw+sUTfj52p1gc
         CCIAkDUOZSkmJcuvXoKbU3D1XqzcM8z7C6B+wsHRVoSsVTshgVYG5nD96CRJTW54qBFU
         vgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757488388; x=1758093188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NplkbxcOuSv0sFTn0nVn4XecH51jDagN9K/FkQXgFyQ=;
        b=kUqxVKPHj2TVL2rgxQYBTeWI0Lc85YwrPGQfBAJ3NYoyrwZjuA0NrkTNr2mU7yMSK5
         lOcUMZOH9TFQ9h2RYbq1rG+juJZc1vXm72rqVxgMjlUE9RYcA3D90VaesTjuGc0D6t8P
         LIH4dT97/h6zgslCHv5hYsa+4fuNkvoQkMOWcArSEdL7CogFTcrNxSiqN7swvfqNsUO1
         rq5bFu2v0MgGu5St/E+v8qvXT3z0RJKFpA1JxbzKcPpMCJwefPi50zrzXnixDwjcM4c+
         x7xNvynuHIOl9SGp9ys4KgmIMzkqrrUAURH+tbVijrgdFb/Awe+izmtSIV/Y2EbD6ku3
         jNuw==
X-Forwarded-Encrypted: i=1; AJvYcCVbPTYd+2Mw9G8iMYlRmvc+0s1lRGSm+0cdKCETzd/15mY2j4jkDtBJ0Jb6MtmW9i+h/BatDlcplox4@vger.kernel.org
X-Gm-Message-State: AOJu0YwMGljyIoeEsL9Avf88POzP2Lv2skG0YJYwcUvim06sW17VNEvW
	X9bxX9XFvLjRKSM3G6eUlP/Ay+3U85Zc7R5KtftewyK6TcM4cYkoKVRAtQJRD2Wveqk=
X-Gm-Gg: ASbGncvlLpKVkCBqxmcmqag8bdi4QWkLg4Q7EdY9aYFkktU4pgMpuZwQfm6fNLALNSB
	Li0NHm+WT/AnuRCvTNiQsBfV6Nn5V+1VbDiYuvVLMHv1flQstEeuNxMe8504cuNhDJXv74Iol7C
	QHLB/Ixjxu5yAMYAY/0YTX20lIYVCEdpYcdHOkxxU81rTSUFo/JCmem3jzAAOjl63emrG+3Zu3D
	09LRSCaKdFw/5TLpjwJFhqbFA0Jg3lqeem4pRacOutEoPGysovSeSBDFVNRupB2J18x/8r+IF/Q
	ky7ZWNLU50VgmqXaazCMuJH7ftc/zZLOOOcN5VNnKTbVgyRLL0hlK9XZD41DbPCumjUUiWxiuq9
	4mYbMbZyMmujBOpmPYH0qSBfaWSg8p2EO5i0/YA==
X-Google-Smtp-Source: AGHT+IHcvhZZzP4TZN8dDM2cz7gIErp9PBji/Vm3N8fCFTA9CGkIGjusChs87EXSmOouxgrha6RBMg==
X-Received: by 2002:a05:6000:3101:b0:3e3:59cc:65ba with SMTP id ffacd0b85a97d-3e64374208dmr5090711f8f.50.1757488387704;
        Wed, 10 Sep 2025 00:13:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81d20d2sm16357035e9.8.2025.09.10.00.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:13:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:12:44 +0200
Subject: [PATCH v2 08/15] gpio: mt7621: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-gpio-mmio-gpio-conv-part4-v2-8-f3d1a4c57124@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4781;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=sm2OibAFBIz+8HL11qXL3Wby/ipKKdaG0xSU+4Tx1Ws=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSTuMKok5DESPFbhymqYsolQEfeTgC5P2l4ck
 1ZZifwJvnSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEk7gAKCRARpy6gFHHX
 ckp4EACxMivANhAd7XZ3l9scDS+B5YYyLmSQ3Ny+BN657qboxkz35tdtCqo9RM2p4vwJoj4F58n
 rjt9YIZ8WE8dMVbEfz3YWyz2izu1kYq5xHXgyIZll+ttlgAkxUJMWsuOBlNE/mEv8eqfcVyE9kB
 fhGVUoTUQXe2kClwurlIT/uqlyREzW7/hE/AmyHfiJlKDOqTSymNVLaciZ1m628rEw3f3mkY6x3
 1VN/jTKqn0fwwlzZos29x0Jjyfc1cnUDSugp+Uc15e9NHBZ8057+Tqkyj5rulMP7p/pBDGXQfKr
 E3xP1G5ACUTJrVHiWsG60aO8/ouvgevz7upK4Sjv5n2qXzPBDaUUUVY9ntkMfsDBb5aTP1KXKev
 SE8ZtNSNtnUncL/Fo/N//pBIkDpXL/pSZJZvi4YAeO8SaOwCBnOdJlP53HJ7L83zzuNpBUjEW/i
 ksoRPc05p8Mymr1HGMs4h4dnZg6ZPQ7HCxgcHCK6ciFupdOexJxm49Lf73Pum5dSOOYzlkP3gM8
 5gUvz/9RvDf5rIDYx7tCSpJC+y7e48f8iuJnObLNJPVt9uQtnS8fDEF0Ol7dfs/dvCRKjERzjOZ
 SK7mIZEGfXac9o9DC5lg3H2DAUewgoXaHy9WqzS6wO39syN8uA85mWEaWEZGA2YQP+7a9pIumwe
 1hvajsW11qzliiQ==
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
index 93facbebb80efadbdd3fb4500e0db14936287f1a..e56812a1721151c8f3b32b5093aee5c74bb798bc 100644
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
+	config = (struct gpio_generic_chip_config) {
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


