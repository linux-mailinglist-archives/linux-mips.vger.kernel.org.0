Return-Path: <linux-mips+bounces-11127-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A8EB4A7B6
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 11:27:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CD81188BDF8
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 09:23:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B35A03019C1;
	Tue,  9 Sep 2025 09:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Y43vgzqc"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AECF2D97A6
	for <linux-mips@vger.kernel.org>; Tue,  9 Sep 2025 09:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757409353; cv=none; b=TMTAg9Y/BXSl+skcjTvUfmRl4HLYYBhKP8w8qo8A8BD+o+BtW1dx12r564RQabIScpcNBMhO0WOB65VReX7DhevEDyUXq/BZg5UTaIrvt/Ohz764eoigZhiIVD58Z2UaemDX3abXBqdSU5naIOlrYsLC4emoJdM2QErMEL+E+1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757409353; c=relaxed/simple;
	bh=m3C6YMA5NpordnkRgnAsfsyx2uMyKsrWO0yN6UpIPP8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MqmWDwiIUux2TL6lD1CIP1q9mTSDG0ndc8lGNCl/MY52y1jZhDncTBnadEi65wyxDQZeyUTwF76zVyqavxBIyXzvK6C9777IN+4t4S+lqY1Mr4v5QbG8IKMCJ82VZf8SS5LcQsjYApJqEUH2Lxt7e+bT7wrjr3P+bGHFw4++erk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Y43vgzqc; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45deccb2c1eso5517485e9.1
        for <linux-mips@vger.kernel.org>; Tue, 09 Sep 2025 02:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1757409350; x=1758014150; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bfVsXcyRTPM0823GsALirp0A0UZxDbq+MOQO0Rm+6MM=;
        b=Y43vgzqcU8Qarv+KOPsEAj/DOnRwQ6o23H+Je3U77Z9Zc6irNpbooWFxaxOD6GbDcQ
         h27gDR98ysMvBDcXKinLu3ooLnennjAxASQuII3sdDZagHGTwKZ9i/VmM3ei2wFcOx5n
         Sjr6JfLvF+xUhbeEacj0D3IcC90+4BPuYBPoJKMfTdbiWL5NxowfNykflPW2ZYMvkqWT
         juDDaaFTMlG5r3HJ9e1r+/V0hhlu6fIMlKbh5avP/WkzIhcnY84ecOp/LC0RrrZAToYh
         eHzhxNKENiSFsqqwHpU6lzi/Tf2eMLQ+YR4NQj6fHPJZGqdc1IAbepp3d77usvFuOLck
         CL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757409350; x=1758014150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bfVsXcyRTPM0823GsALirp0A0UZxDbq+MOQO0Rm+6MM=;
        b=rkeSyO9M3Q0+EtMHUYc3Qf7JYdoRMyw6MkRPtbFx5mEhlbV+/yiP008rWlkzqPxrLn
         jsaI7GuOa9hrmyBaUmSJQ2qk3fBTpQyEhhavVp1WJ1hGJPC2lxwGp9X2OMEzy5090L1K
         obgZhMJcmJhpXtwfO5TJ2wA3R36lX28X7c1lUmsy6Z+WdXU68zRLVWkLuKym/4TyTcg5
         eDI5P+b38q2pkdHEyclwpwQ5Yss+uATuNj2z96AB/SJzYN2j8A7xO1SgCw54xk1EaTJ7
         e3jQ1VHWv5seqVSQ8U0KuP0v1pBHW1mrC9lhM8OxRydtduBFKXIPABeiKwJb8ZoY1Y1T
         qGzg==
X-Forwarded-Encrypted: i=1; AJvYcCXsR2WaoI/acVXOVP1K3bsR5rfKiaoDjgDVDk6YjMwe05SMyTeUQSWzz4p9GavgkqB6E9a691DapvJB@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl3GNJaSdI7qKcxeA3ENTqyi7na5FW+guYAkwLaZUB6Qx/BfGZ
	jqL94lSW9kI+2JMXR5r4zpw0sY5LVSv5lkW19Z7z47gA+NjxZdNQGxVlnR86buN+bxQ=
X-Gm-Gg: ASbGnct5++KHxhC92kHup112+cvKSkDtsQ3rNHquCMgBz0Cv5JzHIZf8NW8sayb4uqx
	wmDXY2Wto0Ja06wxfT4lHz2gxRthOZlNCA5I1ypi/D/u+8XgzbZYP4XBYeIQrZOoOF0F6TtkYPN
	RNyDfH8xZQMV7yBZcRdOWMsTIn7q9r4T1EJEfjGrAqlvsDUb5Q/6A8wAV7brMJl3BojNOwMewTP
	c4erkou8QZWvDnlOzogeiW6jKt4+3oqZUG7myflBoAooK98W8OM5nCa1lRe8Qk68HFMHUuAv//I
	qgRbQIVQ4uLHF2zFkwBjjLp1UM2AZmXSvBTv5HpB42M1MdAmp/XUzA/+SsrYI8Wt1KjSKcQjJFn
	ea49Zyr5miDCfO3FjEw==
X-Google-Smtp-Source: AGHT+IFWuFmitLzvuFEhGEXuEuX7h1gnAXktOXE047kf9ZXksjM66NyEnLgZClefDTe7m/DeVUPeow==
X-Received: by 2002:a05:600c:6304:b0:45b:43cc:e558 with SMTP id 5b1f17b1804b1-45dddef818cmr82339105e9.35.1757409349756;
        Tue, 09 Sep 2025 02:15:49 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c1ee:7be9:3ebb:6cc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7521c9caasm1900039f8f.19.2025.09.09.02.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 02:15:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 09 Sep 2025 11:15:31 +0200
Subject: [PATCH 04/15] gpio: ath79: use new generic GPIO chip API
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-gpio-mmio-gpio-conv-part4-v1-4-9f723dc3524a@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4596;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=KmFRStxrtBvgq9SHCuo+p5UvH6qsrW0hcSZujIjU2hM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBov/A3uBuQUbggrZea4yqPMYEhQc7SR2SyAu4FG
 dnGFptiCCCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaL/wNwAKCRARpy6gFHHX
 cn7KEAC75xLioRo7Kh1dAfxq+uodLO/+7Wk5UsHsHIvgNKgcWkuWxxBBlb5yTHgZY8lOfw01MAv
 HLoSw+kRGn25m6kndbzXFcCkeAazbboy8tacIA34T9zLdqqiwNpQ6savUwoWwvQkJCe0Zd1sqyI
 X0+vuDS5bIpm+F1QnjiLMe0Sbb5PdipzpKDn9Qwvnh9Q1eKdnSW7fzabnl+ZttJSyqO9c77+dlW
 vo0l5G1dhMiwMY22CWhQs+0Gf2yPiwTZNH2IZggwTy5Na4Y7W6g8ioYaRYaAVsV7JVE+2sagt1b
 7Z6NrRm51Mjd01e8i9/OaOH/o3nrWYM3/CETm+sekj8hOtYGtazwGUB8hHTtSy1++BBuRVvn1w5
 8rHU8b0ScSiXUkEMSJ+BcGNF15jH3HfKtRCJN3+oO9GO/zHO96i5/v9gIeW/n/B5ivuN9QYHj3H
 2A2/MveLQWeuYS6pJTiDY0LW+Ca84OmZDAL7rXXHxhhBR2GGAsU7R+G/J9V54uK7wxEpV29NbAJ
 ZhSbTRuR8KfbBPHNHz4dMXLnfg3POU4uZ9gTYS4Hj4W2nq7UIAFdcqefi4dcZ4isDmpX37sSQN9
 7tu6A1Uoe8feo2JitwhMJoDwuuxnvLFgCKh3IiC+gesr2EEf4/dOHoE2K9kLjL3LpOHzh3r2b96
 UGm1jx/g7L4nGcg==
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
index de4cc12e5e0399abcef61a89c8c91a1b203d20fb..1b2a59ddbec4088c95fb766277bb94ffff8692b2 100644
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
+	config = (typeof(config)){
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


