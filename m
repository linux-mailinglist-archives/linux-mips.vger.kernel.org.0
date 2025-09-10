Return-Path: <linux-mips+bounces-11186-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB930B50F01
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 09:15:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B282548A30
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 07:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F391B30AACB;
	Wed, 10 Sep 2025 07:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="tKXpY7QH"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A302730EF89
	for <linux-mips@vger.kernel.org>; Wed, 10 Sep 2025 07:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757488403; cv=none; b=bR4+RVyKB6sC0uByHrTCSKG4NxOKk/myksOrXUu5kpUqOGo4gQ8mcCZioJ7MysgvmOWdJjDatIYtyezf3FHdSKglQkORoFow0clbiaI5hpl6RA/1EELgolJ4vgRDZpFR1ddLDw1QHNHoo19uPCZt4y3bKnD1VY4FNHPEv1hh/hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757488403; c=relaxed/simple;
	bh=KYT2MM2eVz+xsKeIZTdBgRIdYRz/XWsQ3pi86620Rd4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cbSzSp4PqBg6lLwfb1VPYtcPJUdjbuf81wzZbtih8EQSE1jYJ2tUAACEO5VXWbYmibnVIgjeWNZz3HYpGInXN1w1Bx3GjALg+4G38W1DvjM7qmDiFcnu3k6WejxgiNrkOKso+lCJp6WMRqZVFi6eZBUtoR3g8qEO9VEUO+6wnrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=tKXpY7QH; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3df726ecff3so3386189f8f.3
        for <linux-mips@vger.kernel.org>; Wed, 10 Sep 2025 00:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757488400; x=1758093200; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ltg8cFYbJHRlJhkC/eDYTc0LHBKn0iBfadbpYee4nfY=;
        b=tKXpY7QH328g9gDPcYQy7aYP24dn5PUNSLxRn5YQYSd57QY5y6sjEYVpwnsWNyQbUJ
         TMIOU/YyMPka9xmupFytpR9kV2MEDiwEFiyXZb7AG7rBmtKnAe1UY6Gxu/4w1iIdcrPM
         u//d5I3bWc1FIHSXg6CgdF2b1WxDSOJ4G4Xbj9jg73x/vGiz5dVaHmd10QqCVOUuqjbu
         fsjYMNpf8cQhDnJcMFrR5m+s3WGifI+WWFdaEaMQL9Id5FQGpny93QCtHjYyLin5GEyN
         BqBqCZYwfTOSwz1jyBt8DoDvQNlybhvUbOryJVU0kfMsj+hAhiEAGaarnwTiTPNZQYx5
         v6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757488400; x=1758093200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ltg8cFYbJHRlJhkC/eDYTc0LHBKn0iBfadbpYee4nfY=;
        b=iy0uSZ0PQb4/8w2wIW2dA2MeHlouxXVgDpOdZ4qyF5wAcfCALX7CuWSP37stsM0Ye/
         QRf75uLxok7JK/027xGRxfV+bayp96rq+4Zk8WGuIHgYzxmAgnVX27345/RmzrUyiuFY
         9NQCPxpuLL6GgY0Cl9PMcnR7Ly2EIoNq6rLNy541AxPRbROMCuasSyIipKz5FiRJ1lQT
         7i+SFuYyeczNd/FqHzZTaSVRIr9aduB/LQkQxwg3seAFCAmlz7PqY9vV7D5MJFnSQlh/
         n+iOy3i8RO60S2K7nCuX6BJKTQqJQa0SIR017owtWGXiXyUdky9qIWCnsBxj2o/ySUC3
         AUvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGne6v3GfbjSeQccEagGLrjcX3qQOXGjuRI5H8XyRsVVsCJP59r5TKsMTmJVcjprlLGRm8ns7mC+1e@vger.kernel.org
X-Gm-Message-State: AOJu0YzeETg25vOD3xY8GAEJ2aKt/qIYYlcJNP1Em6wYdjrJI/qimHSF
	UXIAPuQ8++PQLqwERZSwwsgW8PselI3lSeLYsYYI8jaxd9Yb6ZACegR5h7JN8dtMj0k=
X-Gm-Gg: ASbGnctbnGCbJMoLsCvUVRO8ro+vBFqypPC7F0b1/lFGjDds5aHKwkYzNyy+jCk5KfU
	56QJ7UK/i1AaTbCdsrDkD5Fw5lbjcdTl41FHBtTmzs4ZVaTxKXV9H5En45a9jeHD4deaaxoT261
	VNClu/yNrcR4KO7FJPTQ3pPeeFbFsOY8g1TprWpdLWlnAca7YoCImAjjby3tneB0i2A3y0yZByt
	g4oQ+7UDSyL3NnENvuG/VSmKc2HUR+ACe/TYu38W1NplBmNZymMpaPv/Rpb6o/ycxgpb0Mq4QiU
	kOIEhos6Aqc8MQy4hl5RviFlF5VMRm3X3x9G/Vb7QMxPjkMCmFqbZ5+jZjgaG0hNDH5igNwGeOU
	i3a2+cxVnW56mW7nM2nL47e/O8ZI=
X-Google-Smtp-Source: AGHT+IHpXLfO1ittXeyoewlb0wbUWJJJJnWemocWkzf48CPBUxjPhZlMWV3u+kku9wzJ4x9qVOMXsQ==
X-Received: by 2002:a05:6000:2912:b0:3e3:f332:7414 with SMTP id ffacd0b85a97d-3e6440f05b0mr10423515f8f.58.1757488399749;
        Wed, 10 Sep 2025 00:13:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81d20d2sm16357035e9.8.2025.09.10.00.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:13:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:12:48 +0200
Subject: [PATCH v2 12/15] gpio: spacemit-k1: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-gpio-mmio-gpio-conv-part4-v2-12-f3d1a4c57124@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3464;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=7HljN5YhPsu8emlMa5P74agbwl9gGUa+HLvxmV4i1uQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSTvGObIqzCZRhNIWnvmsGIXqUuwrXRy1NLnq
 x9/w4JZh+GJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEk7wAKCRARpy6gFHHX
 cmEKD/0Sb0BUjgIMEsCZyVuxoagIRtAeniWoPwPxhUft/dqMT3ZJvidAdyX3l9nSsFcHyE/DaM2
 f2D8tR0Gjv62Sy/ELwhCFO6/+SRfz0pSHms21Jh2fyujS5hrPZp/zhyeNj74YxzJLOsXKjRq4sb
 xjcbJKyExsFwlts9hFC5suLEpGDm878AvzMubLbwx3FMKpXQW5cPV6zUgIXj5n+u+Gztyj3sIdc
 zhP0OBL22izM5RLAHirBeShtjXJxMh9tDz3dOcVEy1Il+s+9s2yChjuStp7cVXCkaoUgnAjs1id
 4NUQJBbK4WjAXtrxwJiqvbHDp23AdWcCw+Ebr6S6TV6iNEwqKSlYndYj15LZdgYnY1rOARrsIML
 ib2ac92qQBa7FI+BA+4jJ4EENCATWB1AsNCrNf1EjEKPIZrfBWCaLXCeIEWEMSYUPfKZf4Zy+/n
 oq15989/GwlzA9bb0bH6s7xStvFJKDv8dHMJohlyIu4XYoZU6RCJwvILAzdiH1010OOsOHqR5ka
 hongG1UtzTdmiNm7gdqkGfxG4uzqal9yKQ1xDFcNyhY2jTUWYYNyjpnL4crYiLmhIECZ+miVMFi
 KRzvytADA+lCkRldOPrfOcaV2fOJkLfDzs0J7aO+ZdXnbBtFZQwgC5lEARZMMG+pAAT9hlTFefp
 oEpxcj8b5NUhK9g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Reviewed-by: Yixun Lan <dlan@gentoo.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-spacemit-k1.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-spacemit-k1.c b/drivers/gpio/gpio-spacemit-k1.c
index 3cc75c701ec40194e602b80d3f96f23204ce3b4d..a0af23f732819be9329af1cb62887dc6eb100ac9 100644
--- a/drivers/gpio/gpio-spacemit-k1.c
+++ b/drivers/gpio/gpio-spacemit-k1.c
@@ -6,6 +6,7 @@
 
 #include <linux/clk.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -38,7 +39,7 @@
 struct spacemit_gpio;
 
 struct spacemit_gpio_bank {
-	struct gpio_chip gc;
+	struct gpio_generic_chip chip;
 	struct spacemit_gpio *sg;
 	void __iomem *base;
 	u32 irq_mask;
@@ -72,7 +73,7 @@ static irqreturn_t spacemit_gpio_irq_handler(int irq, void *dev_id)
 		return IRQ_NONE;
 
 	for_each_set_bit(n, &pending, BITS_PER_LONG)
-		handle_nested_irq(irq_find_mapping(gb->gc.irq.domain, n));
+		handle_nested_irq(irq_find_mapping(gb->chip.gc.irq.domain, n));
 
 	return IRQ_HANDLED;
 }
@@ -143,7 +144,7 @@ static void spacemit_gpio_irq_print_chip(struct irq_data *data, struct seq_file
 {
 	struct spacemit_gpio_bank *gb = irq_data_get_irq_chip_data(data);
 
-	seq_printf(p, "%s-%d", dev_name(gb->gc.parent), spacemit_gpio_bank_index(gb));
+	seq_printf(p, "%s-%d", dev_name(gb->chip.gc.parent), spacemit_gpio_bank_index(gb));
 }
 
 static struct irq_chip spacemit_gpio_chip = {
@@ -165,7 +166,7 @@ static bool spacemit_of_node_instance_match(struct gpio_chip *gc, unsigned int i
 	if (i >= SPACEMIT_NR_BANKS)
 		return false;
 
-	return (gc == &sg->sgb[i].gc);
+	return (gc == &sg->sgb[i].chip.gc);
 }
 
 static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
@@ -173,7 +174,8 @@ static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
 				  int index, int irq)
 {
 	struct spacemit_gpio_bank *gb = &sg->sgb[index];
-	struct gpio_chip *gc = &gb->gc;
+	struct gpio_generic_chip_config config;
+	struct gpio_chip *gc = &gb->chip.gc;
 	struct device *dev = sg->dev;
 	struct gpio_irq_chip *girq;
 	void __iomem *dat, *set, *clr, *dirin, *dirout;
@@ -187,9 +189,19 @@ static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
 	dirin	= gb->base + SPACEMIT_GCDR;
 	dirout	= gb->base + SPACEMIT_GSDR;
 
+	config = (struct gpio_generic_chip_config) {
+		.dev = dev,
+		.sz = 4,
+		.dat = dat,
+		.set = set,
+		.clr = clr,
+		.dirout = dirout,
+		.dirin = dirin,
+		.flags = BGPIOF_UNREADABLE_REG_SET | BGPIOF_UNREADABLE_REG_DIR,
+	};
+
 	/* This registers 32 GPIO lines per bank */
-	ret = bgpio_init(gc, dev, 4, dat, set, clr, dirout, dirin,
-			 BGPIOF_UNREADABLE_REG_SET | BGPIOF_UNREADABLE_REG_DIR);
+	ret = gpio_generic_chip_init(&gb->chip, &config);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to init gpio chip\n");
 
@@ -221,7 +233,7 @@ static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
 	ret = devm_request_threaded_irq(dev, irq, NULL,
 					spacemit_gpio_irq_handler,
 					IRQF_ONESHOT | IRQF_SHARED,
-					gb->gc.label, gb);
+					gb->chip.gc.label, gb);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "failed to register IRQ\n");
 

-- 
2.48.1


