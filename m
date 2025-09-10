Return-Path: <linux-mips+bounces-11177-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9AFB50EE7
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 09:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2F3554833F
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 07:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BAD030ACF6;
	Wed, 10 Sep 2025 07:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cgzbEGOF"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF003090F7
	for <linux-mips@vger.kernel.org>; Wed, 10 Sep 2025 07:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757488382; cv=none; b=XZ6V/sFMGlUwXh7En0TNR+IsgcuZrBXS8bkTOCNBp3gyZ7RBftGai2ofZNC02Wb/e8XzDc8paHaG9rcQIq4cmdwkMfDu6Gk2hhEWayS0O1WDqPrZfyd40YVrLVCipQU42a7Y/loV3E8s7+LGmFWW/1G7gMdj4OFOO4rf+0GZ0rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757488382; c=relaxed/simple;
	bh=sLiLoiA8MtxxGlgaeWQ1BpDRjHUd8R+DKwAFxbkABOc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OarH79P93RY1dySY9i/KOTwt2aWFzoJnQvRBkWDAymQoNG/AlaHEtk1WQAZRCi+BzpQ5I/m9T3gTG4B8lczoNN3sQj+my2Q1A9ChyWXwTEWo8yKqTgm1/Vj+wRSZQcJQdKi0Z23u28s01GK4akdouLJyWNpvZv+9CmkcpbHXqZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cgzbEGOF; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45b9c35bc0aso56729025e9.2
        for <linux-mips@vger.kernel.org>; Wed, 10 Sep 2025 00:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757488378; x=1758093178; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2LgKNcxsdLsFnLguR4L7e69gd1tme3quh6qNbEycm/0=;
        b=cgzbEGOFv93QAD95tRhefGHsuaQmWpwADLkEQy3qYKuEx/6QsXBPR7OMhlYKuWJ7rH
         sk3y42u5tQDu+GwTSE/umauwy3LjwvueVtxT8DRfmTgmbTaTC8HX5zbqxZchQ++9p2rW
         OJh1sfX8IJ93bYRnMcgNGw3oUfzT8Vw0PKx1vAdt/Y10zP//ONRcaUfu0tYGXtcfxcQw
         Paw44jMJtWT6AmtzxRwabAETckZPDQKzkUwk/TXmJvGKO1uc+K9zBIA+cO+5tJ67jJOh
         992ZhZBy/Fj3+YzzqIxyDi0S2BLQm45nMMxBe1icYWslbrRw5R0IWpcHsWN3zIyTlBmv
         GUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757488378; x=1758093178;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2LgKNcxsdLsFnLguR4L7e69gd1tme3quh6qNbEycm/0=;
        b=kCh2k+EnxIjzTK1PZqlnRqti6m31L4ExMXlrohCOLpP6ZFnyjlF9X0WYnitKGhfJG1
         wrxXsKDVN22jzrjs0zSNiDg17HxD9jpyuSex6OArPDMhMn3L6yAYuzCjOSgsorjC1EZe
         d/qxl3bvGYCG0e29tUfgpl+bzakvFOjYiz/yHxEb8LTBQZn7KxPi4PMcGvgpj96iSsVV
         K10THGPTI96bRghkiEHLvbI43A0KDYGLQwEGSQyfC25bPO6v8AIEv12YPsOaVj3j0NpV
         N9acDrKC2JgImb30g94qpINjnlPb4VY7zw4F9U0rs0AACc7Eflunpex4ZNu51tYUPjMb
         HrOg==
X-Forwarded-Encrypted: i=1; AJvYcCWIHAPOYRNAidG+GZ/LYB4dPPCAoBSGKDStbfXfOIUPWTQwR+FLJRDcSSCxSypiEhbmFCgwmDpGNyJa@vger.kernel.org
X-Gm-Message-State: AOJu0YwK+X01CzoWElC1gpj0DOjs38oKC310pA3efd+nMSnspXqvpLZH
	NAuBdlt0vxh2caP1IjXuYyAnyWRVwW8EAc4Np7cOxzY06FgFaqcp9WHjslhrIbed0Bo=
X-Gm-Gg: ASbGnctMs6S3SNNQAZxN2yQugJEYcyEK10BfxbSO/Mfcm2jQFAzBBMTXgzXPPEL0iow
	VZHbqdE5Fap05eba7cE3FCAksEfq/U9fL2VSA0Vf+sMs87Z9Fb7/+areoKJkctTAi0q9p2y3ukS
	+v3NATjuSB69fvx4azvytEwo/o2T7yJTCDIw1hWeDcNx4jFbLP5aYEQINmtMTenJYHDoHh0Qr76
	n+nm9wQwdqpuN3+IPmZYAgu+LhvMapThaRQrXXDEuIhQsapI6RG2QFFdF+KGbCgInO9P8rK9Fop
	zb6jxdQTiCfipMbUzk9krUIkyOuYPoiwDrQujx/iHnMnUeSuIrZNIguE/vssGgmV6SgfChB8OwR
	Yv4zqeCC6RAyhcEU7w5ZthAqhaSw=
X-Google-Smtp-Source: AGHT+IGJB3PQIUYZyiw6+3o8Sn4R39vuxJ9NIx24EQd1RwwSDB8q/LrrapFJhvdDKRaEZQ28E4N+3A==
X-Received: by 2002:a05:600c:1ca4:b0:45d:edf6:367c with SMTP id 5b1f17b1804b1-45dfa19b7a9mr3614415e9.30.1757488377653;
        Wed, 10 Sep 2025 00:12:57 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3936:709a:82c4:3e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81d20d2sm16357035e9.8.2025.09.10.00.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 00:12:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 10 Sep 2025 09:12:39 +0200
Subject: [PATCH v2 03/15] gpio: hlwd: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-gpio-mmio-gpio-conv-part4-v2-3-f3d1a4c57124@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8099;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=GIo9/S93VPUBfQ6xvrpidEregjsP7FkaGPkWmJwT4jo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBowSTsnxh40ocSMjnMrnX6+YmVvuhxetveQ9JD2
 RuxrOMz/veJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaMEk7AAKCRARpy6gFHHX
 ckv9D/4nLHThrlKEMZ2arKcEEyQC039F8gSblcrmQ1yb2JUPD1XxFGc6cwT7H6+DHECz9C7YhOn
 0ly3riecS1q0hqBTBBP7u1DGllHh5KNSLjSOD2npeqgYC4x2N7vWzOF6LwOYtXpsw95jB2RDx6t
 UxvVJwyXW7XEzBqexP3qUDzvGDMYXIHHVYQU65xT2xHsJNKGeChGVFKpvuGA9UvLEl3HGgOXUND
 cvB4L4rs5s+vh+yhOG+Ewn4lk++UDQCCAFk7+SsrQcux2I8uEon/iDlr6VA/iAn4nUlC02vylRE
 tu1OTxkHfTwn4LtLFDZfm5xYJ00r5EkvTD1nzch0qvWzgJHdcNRkXtX7ZTui2MyCGAVvRzUAoAJ
 dy+xABlcqRSZKYihMHMg1xFCKbUAtWGAAFv1K0rikut9lS/0ixaIdeuARtf6hwnZPFqLmhIjd8J
 35og3KjICmSzjp4S7SbXrZVCh8G9NiyaBkNHc9tfU6r7BBgC750h1nhYn0kO9mUC1Tn6tywYsgp
 M28kKTTkG2zcCOO6IP9VLtTWrfop7PplC9LZP0ZYCaDbnTcPXcdP/vPPc1jihj//nCCEdgqVuXU
 T60AjrsNtiLJElv/spQQiqoj6hONaUMrbozWw4rV6qzWxQtpod1QvyCtpRaakB3I9RJHyDUVLXX
 QoxyFu/BJLo3MKg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Convert the driver to using the new generic GPIO chip interfaces from
linux/gpio/generic.h.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-hlwd.c | 105 ++++++++++++++++++++++++-----------------------
 1 file changed, 54 insertions(+), 51 deletions(-)

diff --git a/drivers/gpio/gpio-hlwd.c b/drivers/gpio/gpio-hlwd.c
index 0580f6712bea9a4d510bd332645982adbc5c6a32..a395f87436ac4df386ce2ee345fc0a7cc34c843d 100644
--- a/drivers/gpio/gpio-hlwd.c
+++ b/drivers/gpio/gpio-hlwd.c
@@ -6,6 +6,7 @@
 // Nintendo Wii (Hollywood) GPIO driver
 
 #include <linux/gpio/driver.h>
+#include <linux/gpio/generic.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -48,7 +49,7 @@
 #define HW_GPIO_OWNER		0x3c
 
 struct hlwd_gpio {
-	struct gpio_chip gpioc;
+	struct gpio_generic_chip gpioc;
 	struct device *dev;
 	void __iomem *regs;
 	int irq;
@@ -61,45 +62,44 @@ static void hlwd_gpio_irqhandler(struct irq_desc *desc)
 	struct hlwd_gpio *hlwd =
 		gpiochip_get_data(irq_desc_get_handler_data(desc));
 	struct irq_chip *chip = irq_desc_get_chip(desc);
-	unsigned long flags;
 	unsigned long pending;
 	int hwirq;
 	u32 emulated_pending;
 
-	raw_spin_lock_irqsave(&hlwd->gpioc.bgpio_lock, flags);
-	pending = ioread32be(hlwd->regs + HW_GPIOB_INTFLAG);
-	pending &= ioread32be(hlwd->regs + HW_GPIOB_INTMASK);
+	scoped_guard(gpio_generic_lock_irqsave, &hlwd->gpioc) {
+		pending = ioread32be(hlwd->regs + HW_GPIOB_INTFLAG);
+		pending &= ioread32be(hlwd->regs + HW_GPIOB_INTMASK);
 
-	/* Treat interrupts due to edge trigger emulation separately */
-	emulated_pending = hlwd->edge_emulation & pending;
-	pending &= ~emulated_pending;
-	if (emulated_pending) {
-		u32 level, rising, falling;
+		/* Treat interrupts due to edge trigger emulation separately */
+		emulated_pending = hlwd->edge_emulation & pending;
+		pending &= ~emulated_pending;
+		if (emulated_pending) {
+			u32 level, rising, falling;
 
-		level = ioread32be(hlwd->regs + HW_GPIOB_INTLVL);
-		rising = level & emulated_pending;
-		falling = ~level & emulated_pending;
+			level = ioread32be(hlwd->regs + HW_GPIOB_INTLVL);
+			rising = level & emulated_pending;
+			falling = ~level & emulated_pending;
 
-		/* Invert the levels */
-		iowrite32be(level ^ emulated_pending,
-			    hlwd->regs + HW_GPIOB_INTLVL);
+			/* Invert the levels */
+			iowrite32be(level ^ emulated_pending,
+				    hlwd->regs + HW_GPIOB_INTLVL);
 
-		/* Ack all emulated-edge interrupts */
-		iowrite32be(emulated_pending, hlwd->regs + HW_GPIOB_INTFLAG);
+			/* Ack all emulated-edge interrupts */
+			iowrite32be(emulated_pending, hlwd->regs + HW_GPIOB_INTFLAG);
 
-		/* Signal interrupts only on the correct edge */
-		rising &= hlwd->rising_edge;
-		falling &= hlwd->falling_edge;
+			/* Signal interrupts only on the correct edge */
+			rising &= hlwd->rising_edge;
+			falling &= hlwd->falling_edge;
 
-		/* Mark emulated interrupts as pending */
-		pending |= rising | falling;
+			/* Mark emulated interrupts as pending */
+			pending |= rising | falling;
+		}
 	}
-	raw_spin_unlock_irqrestore(&hlwd->gpioc.bgpio_lock, flags);
 
 	chained_irq_enter(chip, desc);
 
 	for_each_set_bit(hwirq, &pending, 32)
-		generic_handle_domain_irq(hlwd->gpioc.irq.domain, hwirq);
+		generic_handle_domain_irq(hlwd->gpioc.gc.irq.domain, hwirq);
 
 	chained_irq_exit(chip, desc);
 }
@@ -116,30 +116,29 @@ static void hlwd_gpio_irq_mask(struct irq_data *data)
 {
 	struct hlwd_gpio *hlwd =
 		gpiochip_get_data(irq_data_get_irq_chip_data(data));
-	unsigned long flags;
 	u32 mask;
 
-	raw_spin_lock_irqsave(&hlwd->gpioc.bgpio_lock, flags);
-	mask = ioread32be(hlwd->regs + HW_GPIOB_INTMASK);
-	mask &= ~BIT(data->hwirq);
-	iowrite32be(mask, hlwd->regs + HW_GPIOB_INTMASK);
-	raw_spin_unlock_irqrestore(&hlwd->gpioc.bgpio_lock, flags);
-	gpiochip_disable_irq(&hlwd->gpioc, irqd_to_hwirq(data));
+	scoped_guard(gpio_generic_lock_irqsave, &hlwd->gpioc) {
+		mask = ioread32be(hlwd->regs + HW_GPIOB_INTMASK);
+		mask &= ~BIT(data->hwirq);
+		iowrite32be(mask, hlwd->regs + HW_GPIOB_INTMASK);
+	}
+	gpiochip_disable_irq(&hlwd->gpioc.gc, irqd_to_hwirq(data));
 }
 
 static void hlwd_gpio_irq_unmask(struct irq_data *data)
 {
 	struct hlwd_gpio *hlwd =
 		gpiochip_get_data(irq_data_get_irq_chip_data(data));
-	unsigned long flags;
 	u32 mask;
 
-	gpiochip_enable_irq(&hlwd->gpioc, irqd_to_hwirq(data));
-	raw_spin_lock_irqsave(&hlwd->gpioc.bgpio_lock, flags);
+	gpiochip_enable_irq(&hlwd->gpioc.gc, irqd_to_hwirq(data));
+
+	guard(gpio_generic_lock_irqsave)(&hlwd->gpioc);
+
 	mask = ioread32be(hlwd->regs + HW_GPIOB_INTMASK);
 	mask |= BIT(data->hwirq);
 	iowrite32be(mask, hlwd->regs + HW_GPIOB_INTMASK);
-	raw_spin_unlock_irqrestore(&hlwd->gpioc.bgpio_lock, flags);
 }
 
 static void hlwd_gpio_irq_enable(struct irq_data *data)
@@ -173,10 +172,9 @@ static int hlwd_gpio_irq_set_type(struct irq_data *data, unsigned int flow_type)
 {
 	struct hlwd_gpio *hlwd =
 		gpiochip_get_data(irq_data_get_irq_chip_data(data));
-	unsigned long flags;
 	u32 level;
 
-	raw_spin_lock_irqsave(&hlwd->gpioc.bgpio_lock, flags);
+	guard(gpio_generic_lock_irqsave)(&hlwd->gpioc);
 
 	hlwd->edge_emulation &= ~BIT(data->hwirq);
 
@@ -197,11 +195,9 @@ static int hlwd_gpio_irq_set_type(struct irq_data *data, unsigned int flow_type)
 		hlwd_gpio_irq_setup_emulation(hlwd, data->hwirq, flow_type);
 		break;
 	default:
-		raw_spin_unlock_irqrestore(&hlwd->gpioc.bgpio_lock, flags);
 		return -EINVAL;
 	}
 
-	raw_spin_unlock_irqrestore(&hlwd->gpioc.bgpio_lock, flags);
 	return 0;
 }
 
@@ -225,6 +221,7 @@ static const struct irq_chip hlwd_gpio_irq_chip = {
 
 static int hlwd_gpio_probe(struct platform_device *pdev)
 {
+	struct gpio_generic_chip_config config;
 	struct hlwd_gpio *hlwd;
 	u32 ngpios;
 	int res;
@@ -244,25 +241,31 @@ static int hlwd_gpio_probe(struct platform_device *pdev)
 	 * systems where the AHBPROT memory firewall hasn't been configured to
 	 * permit PPC access to HW_GPIO_*.
 	 *
-	 * Note that this has to happen before bgpio_init reads the
-	 * HW_GPIOB_OUT and HW_GPIOB_DIR, because otherwise it reads the wrong
-	 * values.
+	 * Note that this has to happen before gpio_generic_chip_init() reads
+	 * the HW_GPIOB_OUT and HW_GPIOB_DIR, because otherwise it reads the
+	 * wrong values.
 	 */
 	iowrite32be(0xffffffff, hlwd->regs + HW_GPIO_OWNER);
 
-	res = bgpio_init(&hlwd->gpioc, &pdev->dev, 4,
-			hlwd->regs + HW_GPIOB_IN, hlwd->regs + HW_GPIOB_OUT,
-			NULL, hlwd->regs + HW_GPIOB_DIR, NULL,
-			BGPIOF_BIG_ENDIAN_BYTE_ORDER);
+	config = (struct gpio_generic_chip_config) {
+		.dev = &pdev->dev,
+		.sz = 4,
+		.dat = hlwd->regs + HW_GPIOB_IN,
+		.set = hlwd->regs + HW_GPIOB_OUT,
+		.dirout = hlwd->regs + HW_GPIOB_DIR,
+		.flags = BGPIOF_BIG_ENDIAN_BYTE_ORDER,
+	};
+
+	res = gpio_generic_chip_init(&hlwd->gpioc, &config);
 	if (res < 0) {
-		dev_warn(&pdev->dev, "bgpio_init failed: %d\n", res);
+		dev_warn(&pdev->dev, "failed to initialize generic GPIO chip: %d\n", res);
 		return res;
 	}
 
 	res = of_property_read_u32(pdev->dev.of_node, "ngpios", &ngpios);
 	if (res)
 		ngpios = 32;
-	hlwd->gpioc.ngpio = ngpios;
+	hlwd->gpioc.gc.ngpio = ngpios;
 
 	/* Mask and ack all interrupts */
 	iowrite32be(0, hlwd->regs + HW_GPIOB_INTMASK);
@@ -282,7 +285,7 @@ static int hlwd_gpio_probe(struct platform_device *pdev)
 			return hlwd->irq;
 		}
 
-		girq = &hlwd->gpioc.irq;
+		girq = &hlwd->gpioc.gc.irq;
 		gpio_irq_chip_set_chip(girq, &hlwd_gpio_irq_chip);
 		girq->parent_handler = hlwd_gpio_irqhandler;
 		girq->num_parents = 1;
@@ -296,7 +299,7 @@ static int hlwd_gpio_probe(struct platform_device *pdev)
 		girq->handler = handle_level_irq;
 	}
 
-	return devm_gpiochip_add_data(&pdev->dev, &hlwd->gpioc, hlwd);
+	return devm_gpiochip_add_data(&pdev->dev, &hlwd->gpioc.gc, hlwd);
 }
 
 static const struct of_device_id hlwd_gpio_match[] = {

-- 
2.48.1


