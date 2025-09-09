Return-Path: <linux-mips+bounces-11128-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 132C4B4A7CF
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 11:29:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C44D5E4212
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 09:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D47E3081A5;
	Tue,  9 Sep 2025 09:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="W9UkyFJ5"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8502B2F8BC5
	for <linux-mips@vger.kernel.org>; Tue,  9 Sep 2025 09:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757409356; cv=none; b=Y3SZYsNMUZBhtkPpyqBi8xV7/m8K6+jtznocXcfSP9Ns6KbCOWOugVwPXawz+wMHwDdoHCXCwbTik18al4mkcuKAxlvzRtXL33hReyYEckeCvT1eaqWwXGE3YrYilCPTd//01k0a4E2IwMHNAItk7n7OqN6LCI2sPMo5B0rhSis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757409356; c=relaxed/simple;
	bh=uqmvOvOfxF1o679wpIAUV6JzoYwqq817uSg3c0UoFGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sexd+Iy5FONOSswUV7uti3aln++tdzNGIzf5aPhCZAQXLLNWEWSmnL1utpxuGNMxUzSBRuE/M5UbgcRBLau0KQYfRleCh+jrqXoIOppDb4qOSOe11I3hksb253Zv2YcTLDWaWjmGY9o2jUy3a5nK2iBjLacM3oTg0Ap4TklZqiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=W9UkyFJ5; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45de6415102so16929115e9.1
        for <linux-mips@vger.kernel.org>; Tue, 09 Sep 2025 02:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409352; x=1758014152; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cNyb/s8rhsBAw5oMG7jCFkP07jFHaAfhwIfXxzBcLE0=;
        b=W9UkyFJ51dea0nnmj2k8qBOgtiK7Dlq9lsEMyH/Nt+p1E7tazm8eoAOzIZRAWwcseh
         7dIuOzwYKg2jO8NUGaLxbmI05R9G0roE7U+7JneMGqSlWrICzqOKkMYrjfP/47dTSjbu
         irOweBS0HVq+KWvGy0oEGiMcLu9CDCfVFeZIk+232e2A7XS4qMaLwLMXr8qoDAolcMlj
         AD9sMBYxUiATIz5onh192VfWetC90knWPwMAFLYW+vE6nj6LHc9UIgO5R8bFNJPkYCKg
         I0Y4eo46tXXKnzs6ps5uPphd9K+97/alBHFDbubt5VNdlnBnQ+Wgd9wuP/8h7a36qXUx
         ObXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409352; x=1758014152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cNyb/s8rhsBAw5oMG7jCFkP07jFHaAfhwIfXxzBcLE0=;
        b=GqSLe92e7BnHIncW7sPFiEzzd4DpWgqKER2YPPCxy+LFLCkgaw0DrjPEl5slAA58Dw
         rpc4BMldyx6ruz37LNQrsG5xn64l6CbyTy7BNohHhFN5qocaESIxv1WoMJsDrlkdY8DZ
         Ysi70uJ4IjfQDxZEJjMAmSAlxX/2RnY2FGirqZbyrmUFqyTvC4jrf/enGJe0os2YrVED
         4FyTu7Ba7+m6ORr9iZZvFfTIaF/yiixpKSHkWNqYZJAtGYAWG0z58gNV/MFoa/SrCcfi
         8Bqill+hBCHpV4SXLzgsnbgTJqWsEOSP1UE680zfZAfpYQh2ZNX7zHRKy1MCXRleAeGB
         u9UQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNOWw1WlgZ9Epwtg04kq6iid/oQjepOePaLzO4kvy5qGBvhrE2p6vITPXkYWZ+lre9KGgGh5bmz4Q6@vger.kernel.org
X-Gm-Message-State: AOJu0YyrgBLMDu/uv3NUYFW09/HcSKQO2czsBdec3P0pjSIrnrMTXZXp
	mTJewWckwNZeeEYZvOD9NtLaPEn5Dlrzk8B/pBYdfltUPciNuhrMHp1V6jeOndSyDHk=
X-Gm-Gg: ASbGncvD47POCe20OajYOxaEqsIBWskGb+J39x01jD4uW4q+xNxzORfsIkAa4Zagrza
	CT+jxFAv3KktNnv0MBvSf/HXZ6KpwYiJ0xlkOc6ns+BKcheJFGtIORGgMs1y3iJBalbYohrpZrm
	/eUtCYyosE2JQP8rtKCmW5HvvHQLhIKRl2L9BnEBnGrCwMliwhQk4xbNfEhdmwljQD1qvht/m1c
	wzPsuVizrZbR2b+DhNFuXi0TBtvqh5HcWMfQxJWwoVLX5QnkCyk+uXEI+DYVschbgwCZ88a4jAm
	F6HKkRqtK5sBgovC1Yhwzxh7/B+tP9HeKnKphUi16ibOqkY87wCI9ofefCHgoUjzN+nent4NjFJ
	TwT10HRDvz2V0sn2CkE0bgg+qBEL+CMDxXuZNFfs=
X-Google-Smtp-Source: AGHT+IH7uav1IGVrER9dF4PIYsOMNVrb5nwXYkyZEzGGA0F6yjDXZab7m4d2f1saSDymZ1SvoB+UGw==
X-Received: by 2002:a05:600c:4f4e:b0:45d:d13f:6061 with SMTP id 5b1f17b1804b1-45df12e35efmr10405945e9.30.1757409351787;
        Tue, 09 Sep 2025 02:15:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:15:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 11:15:32 +0200
Subject: [PATCH 05/15] gpio: ath79: use the generic GPIO chip lock for IRQ
 handling
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-5-9f723dc3524a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5431;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=wEUGfBQ2UNxF7/X679yAoQw1e/9zTBMrjziqIk7+UbI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/A3rUn0axD0jqdCFa1rrDC0FyUulthioK0bV
 kzSvPlTeQiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wNwAKCRARpy6gFHHX
 cj5IEAC93Ew7Nap6XkKixHXb8mM7E7WAQwY12FXIbaAQ3/zHlili51XHOWjWy6W0b/hG+b3cdyz
 flhBhVFWTBh7gYvARJNn1QcUi8VMWqMd498eNSoKzxs/zcTYuqR/fz+YJLQTOIE1hI73iQiQNJz
 ACHbxiRCtfcv5xxo0k8Dr4LlKgxZ2yzEjXyCPBp8ba9QuZffZ46y5r3NNuIMUzEOwkJtU2nQ24p
 Ka39Mq10yb7hjNe9iAubmhlHN0Q5jFZKuK0UZ5rG6JGgnYfRSiwmLOFxXDeDCbgPHMLdwy5W3eH
 1DdThWaN3Alnc0POqBRA2LNuUrQkUp7plh7P0A9FUZTDNii7LGARLOkjyJm6iJKPFG/MzLB/uPd
 TNUtjyiOw0o4J2UM4bsHSvoWCZl/zK6Az0fppMrHEFrl9Xqk3mKZKp6H+JYu1xBUFzPDYBwyaEl
 VfyRFoeaR3XQAZzVvCXq3znCPJOQGzp8Y6nCMKSutM37jxi9VcUtr/fX46IagulYISBKOWl4+fq
 aa4+9tadu04IcOzyjmkAku8D+39RruxxdigQqZ9Ij+CQqEBHO5HKc/R/ExQZTaYdLMVAwdjZJ7T
 JSb7oJhUdEBGsKTnSxzrw6JLAGFtikjqEZ5jQy4QoE4OsgtPQI8VtFynvDHdyo6YHRHKGSS9+IB
 ibJ40dH4keBex6w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This driver uses its own raw spinlock in interrupt routines while the
generic GPIO chip callbacks use a separate one. This is, of course, racy
so use the fact that the lock in generic GPIO chip is also a raw
spinlock and convert the interrupt handling functions in this module to
using the provided generic GPIO chip locking API.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-ath79.c | 51 ++++++++++++++++++-----------------------------
 1 file changed, 19 insertions(+), 32 deletions(-)

diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index 1b2a59ddbec4088c95fb766277bb94ffff8692b2..75c9e3bf7db1b5fbfede960dd1c0b3a76d2ecb8f 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -31,7 +31,6 @@
 struct ath79_gpio_ctrl {
 	struct gpio_generic_chip chip;
 	void __iomem *base;
-	raw_spinlock_t lock;
 	unsigned long both_edges;
 };
 
@@ -72,23 +71,22 @@ static void ath79_gpio_irq_unmask(struct irq_data *data)
 {
 	struct ath79_gpio_ctrl *ctrl = irq_data_to_ath79_gpio(data);
 	u32 mask = BIT(irqd_to_hwirq(data));
-	unsigned long flags;
 
 	gpiochip_enable_irq(&ctrl->chip.gc, irqd_to_hwirq(data));
-	raw_spin_lock_irqsave(&ctrl->lock, flags);
+
+	guard(gpio_generic_lock_irqsave)(&ctrl->chip);
+
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, mask);
-	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
 }
 
 static void ath79_gpio_irq_mask(struct irq_data *data)
 {
 	struct ath79_gpio_ctrl *ctrl = irq_data_to_ath79_gpio(data);
 	u32 mask = BIT(irqd_to_hwirq(data));
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&ctrl->lock, flags);
-	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, 0);
-	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
+	scoped_guard(gpio_generic_lock_irqsave, &ctrl->chip)
+		ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, 0);
+
 	gpiochip_disable_irq(&ctrl->chip.gc, irqd_to_hwirq(data));
 }
 
@@ -96,24 +94,20 @@ static void ath79_gpio_irq_enable(struct irq_data *data)
 {
 	struct ath79_gpio_ctrl *ctrl = irq_data_to_ath79_gpio(data);
 	u32 mask = BIT(irqd_to_hwirq(data));
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&ctrl->lock, flags);
+	guard(gpio_generic_lock_irqsave)(&ctrl->chip);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_ENABLE, mask, mask);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, mask);
-	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
 }
 
 static void ath79_gpio_irq_disable(struct irq_data *data)
 {
 	struct ath79_gpio_ctrl *ctrl = irq_data_to_ath79_gpio(data);
 	u32 mask = BIT(irqd_to_hwirq(data));
-	unsigned long flags;
 
-	raw_spin_lock_irqsave(&ctrl->lock, flags);
+	guard(gpio_generic_lock_irqsave)(&ctrl->chip);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_MASK, mask, 0);
 	ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_ENABLE, mask, 0);
-	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
 }
 
 static int ath79_gpio_irq_set_type(struct irq_data *data,
@@ -122,7 +116,6 @@ static int ath79_gpio_irq_set_type(struct irq_data *data,
 	struct ath79_gpio_ctrl *ctrl = irq_data_to_ath79_gpio(data);
 	u32 mask = BIT(irqd_to_hwirq(data));
 	u32 type = 0, polarity = 0;
-	unsigned long flags;
 	bool disabled;
 
 	switch (flow_type) {
@@ -144,7 +137,7 @@ static int ath79_gpio_irq_set_type(struct irq_data *data,
 		return -EINVAL;
 	}
 
-	raw_spin_lock_irqsave(&ctrl->lock, flags);
+	guard(gpio_generic_lock_irqsave)(&ctrl->chip);
 
 	if (flow_type == IRQ_TYPE_EDGE_BOTH) {
 		ctrl->both_edges |= mask;
@@ -169,8 +162,6 @@ static int ath79_gpio_irq_set_type(struct irq_data *data,
 		ath79_gpio_update_bits(
 			ctrl, AR71XX_GPIO_REG_INT_ENABLE, mask, mask);
 
-	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
-
 	return 0;
 }
 
@@ -192,26 +183,24 @@ static void ath79_gpio_irq_handler(struct irq_desc *desc)
 	struct gpio_generic_chip *gen_gc = to_gpio_generic_chip(gc);
 	struct ath79_gpio_ctrl *ctrl =
 		container_of(gen_gc, struct ath79_gpio_ctrl, chip);
-	unsigned long flags, pending;
+	unsigned long pending;
 	u32 both_edges, state;
 	int irq;
 
 	chained_irq_enter(irqchip, desc);
 
-	raw_spin_lock_irqsave(&ctrl->lock, flags);
+	scoped_guard(gpio_generic_lock_irqsave, &ctrl->chip) {
+		pending = ath79_gpio_read(ctrl, AR71XX_GPIO_REG_INT_PENDING);
 
-	pending = ath79_gpio_read(ctrl, AR71XX_GPIO_REG_INT_PENDING);
-
-	/* Update the polarity of the both edges irqs */
-	both_edges = ctrl->both_edges & pending;
-	if (both_edges) {
-		state = ath79_gpio_read(ctrl, AR71XX_GPIO_REG_IN);
-		ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_POLARITY,
-				both_edges, ~state);
+		/* Update the polarity of the both edges irqs */
+		both_edges = ctrl->both_edges & pending;
+		if (both_edges) {
+			state = ath79_gpio_read(ctrl, AR71XX_GPIO_REG_IN);
+			ath79_gpio_update_bits(ctrl, AR71XX_GPIO_REG_INT_POLARITY,
+					       both_edges, ~state);
+		}
 	}
 
-	raw_spin_unlock_irqrestore(&ctrl->lock, flags);
-
 	for_each_set_bit(irq, &pending, gc->ngpio)
 		generic_handle_domain_irq(gc->irq.domain, irq);
 
@@ -256,8 +245,6 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(ctrl->base))
 		return PTR_ERR(ctrl->base);
 
-	raw_spin_lock_init(&ctrl->lock);
-
 	config = (typeof(config)){
 		.dev = dev,
 		.sz = 4,

-- 
2.48.1


