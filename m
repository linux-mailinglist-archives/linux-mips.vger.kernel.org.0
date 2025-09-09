Return-Path: <linux-mips+bounces-11135-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A37B4A7AE
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 11:27:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4944E7B089D
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 09:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A1C30FF10;
	Tue,  9 Sep 2025 09:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3EwAnowM"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238DD30E0ED
	for <linux-mips@vger.kernel.org>; Tue,  9 Sep 2025 09:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757409371; cv=none; b=Nt+AZ/ohSkqw56Y+N5MJhBFkhgiI1jHCVfjMb5Znx56hvJoPCXjShOsuSjbFEqRGQb83J6cxVZDL+jPb36O1JpWGPpp/1jbkieAhvMkszWUvuXPkHh+bpzPhoRHGNkyDbv/eTQDssn12IJSRVF5t8TLTuUG4e33MWmNwbkLDJNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757409371; c=relaxed/simple;
	bh=WzOuOUVW/PK4C/KdQteZogzTY0jTW+cVxZMD5hyi8vs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cz3GjXIehW/B9lb5uoDHLAX6PQQlzgbo4H/fIvDD0plofOFwldYw8DdH+K+Hk/GOQwTblCaIbeiP9xN2YP7LCC+glAB++sM0p+0B/sVSivHm7iwDl38OI8WqhV7x8qK/Ney/TEh9uWXw5qmVmL8lGBzm/BuDm1UaopNHeuFmDO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3EwAnowM; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b9edf4cf6cso4588437f8f.3
        for <linux-mips@vger.kernel.org>; Tue, 09 Sep 2025 02:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409366; x=1758014166; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JnL5avCI1+j0l6tAuop7k471BoLkt0UX61ObHkL7ebw=;
        b=3EwAnowMrjFzEq3S77Td+QP5AMw2JfmcE72xQNVCkRfw47LiULzQu22UNxsyciLVPl
         pfqxNB+PeT3PwvZvv1t3sNkGzGVpScEnKVVquLNhZsMvLVhYiYc2iJWeaMaFbMkt7ooP
         9agrsDevZiVkDBW5DOJVNZ4g8pIgXDGA9mlcf4glM3PtCCKiqdLhZc8ug4V7NWQehX3Y
         6+8eby7ya1EdfOEPtMs0UOn49DHyMLzwh8lj9/x5BfyetaByWo3ud2Ayj0QyLJvTk64d
         Nq0cGXRwJhRamU/O73KIPME6fagA1SdY4qdyrzl861YFQd5Fr52BjWjTgDvgUdvmRYxX
         ABsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409366; x=1758014166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JnL5avCI1+j0l6tAuop7k471BoLkt0UX61ObHkL7ebw=;
        b=TW11twvRXtDRMQRyySBQdx7QNuXlClIv6E4Hym6XzsWtbQpMx8PEVcYCNGXwlhYTE/
         f6n36RVN2vLk0e49GiZ2PdFuhch48lEsw1twlS8jCbinbpWwTrWUJWpSEASWXwUqVJp8
         Uy6D6n9aCwrlyCVVAEruuFx0cm2ofc0qJMh4wZUuZm2B6vJjs0uQhV8eGI2kOJuSBqzv
         ENn3Z9OUX65SVVcHdBBSP8/Ml5S7sMO22ib4aKnzF83V5/pu2xVwc1gMGOlI3OWUOk5n
         obk54HgXMGGPBnU4KAzw8TPf/LwwWeX//JQ+Ii+gREP70yNs9BFp0fGZxQGg+45hbs2/
         ddmA==
X-Forwarded-Encrypted: i=1; AJvYcCXIUJ+yUcc1aITyA09D0A8Go6yMV2KVwXE2BeAEz/bi1ORuJ6bPwftKt0NuzohoGQKoo8WTInFrIVjm@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+Ys+ubzNe/S9E1xNvk4PCCbrRsHlA3esoBdcisbdAp432015k
	ApOw1Gr8u8WP6o/qhPjb8lLwk6RL/88v7kacwjXahib/2EAlDa6JgRXVz0W7rF5+Cyw=
X-Gm-Gg: ASbGncvjjd8hymLUU4uqCan/kiDVrXhpQ5vYLDwT33x+t3iNU8u77UCZ3lxyIyKZN4s
	HdOMLudQ0MVFTN+TvLsKYhH8Tke+mR1xpqHeypm8x52ACAcd0hO4r+5B5PebmeQdPorgV8x3+kI
	ADm531HA8GbtaILbslKAk5FFR5cIJFtibgzs0sEkyicKSiDb1BcNJtyveg/NzA7VmgfZiKFAd8X
	Bh5521stomgPmB+NDBDRp8Yn4+JLnp3lV+j4pb6ZOjbGdsQBoRIQaDyuwoRWXaOoTnmoczLVv8F
	euFEM8GTa92x6BUs+wX51fNyi86tQnYGqPhpxtjzYvIh5K25YB0kOdFm/luJTFwmoyV1aWzMcCI
	vwlkx0usya++vBYVKcw==
X-Google-Smtp-Source: AGHT+IE94R1Oy4E8DYu1vi5/MQwSSBtXsOK388TX3Bsmqin3tuFYremvz9spe63crlhiuLWMz4c6HA==
X-Received: by 2002:a05:6000:dc7:b0:3d8:9bf9:7c0b with SMTP id ffacd0b85a97d-3e643555f94mr8126974f8f.47.1757409366047;
        Tue, 09 Sep 2025 02:16:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:16:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 11:15:39 +0200
Subject: [PATCH 12/15] gpio: spacemit-k1: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-12-9f723dc3524a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3404;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=gNo32+ptzHzNQ0FF1qmlz+3Zqph7O2GD4/GEGfsM86c=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/A6nAxdBHOjeyAM5pmmPsB62m3XhnRxXkrE2
 U8RABVAM8mJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wOgAKCRARpy6gFHHX
 cme7D/93u69p4SavcMfdgj06qig7Tkoa0eMfEjm9IPYT1ykfvFQhNDSGoOj5iutXRMOLR9LLr99
 IlHQqBPMKer9ht2ThaRDHXbsDDAEPSS+jANLAOWaKygPteu4Suqo4pbDL7cxkdJcgjbdbHAH9Zk
 zl6xAUgDU6jfmPvcO2VhJr75owb7CGZp5a1Dnag35fFfRISG+pgOiAwhAMivHpcgpGn3EwmeaTP
 LfGkDAj4ulgpkjsaxwo20vLHJ2wSq0mfKheltSCFdiS0+aok/Rbl3mhu1McHriCqmlvKAyx8IAv
 7lC5qZsAWcBUG1VqNe5aycf3coJ/g6KMy0i8g//fr/txxRCIjdHyTcfJ6t13JKQGqQdCTM4chQz
 /+XMHuKfpZ/Q4YDs5n2SOREbvZSSNuT6QTeWHDX+6wXH/ATSEYsVIsLd9L+c1wI7a6PsyV63P/I
 tvIzyK39lt2Z2dBxc+oAlhSwj0mAIQdG9XCVXavR4vOS8AdP0gT0xlExujH+Omuw0g5KWNawhRJ
 T/ikz1yOTq3wDGN3oZ1XYESu56a3iGgC7de9FThTX64Nyag3JpJ+NL7w3pWFdIppgGkim4hUCGR
 HCm9ppak+GXo8YQgBBZ5fHJDeF/Pj24TnRZOWwbCoJlmgMzRCVZPV/2mEWll6esXcxeseLt41r5
 XEg1x+7SuLj8WOA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-spacemit-k1.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-spacemit-k1.c b/drivers/gpio/gpio-spacemit-k1.c
index 3cc75c701ec40194e602b80d3f96f23204ce3b4d..9e57f43d3d13ad28fcd3327ecdc3f359691a44c9 100644
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
 
+	config = (typeof(config)){
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


