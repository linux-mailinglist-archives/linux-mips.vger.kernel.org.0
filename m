Return-Path: <linux-mips+bounces-8725-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A43A9A61D
	for <lists+linux-mips@lfdr.de>; Thu, 24 Apr 2025 10:36:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7F2A1B84FA1
	for <lists+linux-mips@lfdr.de>; Thu, 24 Apr 2025 08:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA7D521CC6C;
	Thu, 24 Apr 2025 08:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="USNKkTdd"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F4A21480E
	for <linux-mips@vger.kernel.org>; Thu, 24 Apr 2025 08:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745483752; cv=none; b=Akb+I3VYrg8CgRMkY4VsdWj9JhX7pXoIC/Zjvcz9wPnkzNWiVQ+RKIOjlwv8KUWeU/GUHnNHPbW9AgQXRrKxDvnJyIlkUqPj+7rUNJZQjtINusGoqkoY/hMXZ929gG2TUWd8KvMq+kvgpi0Xc6LWmU8Z/zhUxRHJrACr3J87PJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745483752; c=relaxed/simple;
	bh=XHXxaJjw+L2SDuyGGQioHVSFb0imiEXoavVU0ev3U3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uJd41/TzF0SfG6HzDVZPmxlmWMUA0Ft8djEkV2bgGR2DhKKEY2N4o7uCbiyOXRO1eqMd4eCPpf5fx3S2niXtcI6oA55UbwRwIbR4yyMzE/Nyn76Xqv4GRmXu/1p1aaUPc6jgKLOTiE9C7nqC9L03Q1Nq8bDzLnocdXC97JcEVT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=USNKkTdd; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39ee57c0b8cso695392f8f.0
        for <linux-mips@vger.kernel.org>; Thu, 24 Apr 2025 01:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745483749; x=1746088549; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e1nhd4aLppAWi4+bVzlCUpCnUz+WYC5fdznaksvHJEk=;
        b=USNKkTddu2E5yQZkja4nzsO/GHs1Ae9FBAS1QddzHG1W1XXbSTyAfeg9nGToFQ5uzm
         elqnGOueYQxEfJQ+Ml86CGK/BJsOwsunT7CVL0aCpKiNhjk93oDqC2A4kPM2JI8WH9/x
         f7EVYA328Lhl9FSMJM6RIj9AeYNWEnQMkWSBSapztFcgWnggCJ9Pf9eUwJYEVlHGL5HW
         KkchQULv/f1TG7XG+ZDkCZanTvDNWuF4AoUvoTjKjIgr2A1j/EkO/aJm2BA9n213+/gU
         YeEfvHv+tla1QkCbQpLXfZRkiL8J6g4hjyK/lTR2SslM0+8SSTTw+jo2oOauPtTZhddJ
         cJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745483749; x=1746088549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e1nhd4aLppAWi4+bVzlCUpCnUz+WYC5fdznaksvHJEk=;
        b=Ak7kyLWBJDUZXxfP/85Pb40W6GlIFncKP4E7vwbTj+WcHZ2L4ToWJcE0NNbspPbFEy
         M/cxdiLTgd/UsWcxz7f60QGesCmav1x+L0FTvuVKlf3IDP4bX0Bmuy85YW7G76NOQ1fo
         QsGNFu0QZdznBW/Sos1zun0qvT3QhFCoGOHCptsmNZb9iJRFuBW2/XuGuwmFnnuBzi8v
         Zxu6BGZqGzkxohymYygbS//VNH88PfJXMTQ/C4huXilsoDOTybTIVOqOaIpclHW6/k61
         qiaIx+F2js3kbNl2o0/n03ccXg+MmF4QGYpZC0nFejIVCg7mC5A/HwuGGJx6YNYO+U7g
         Np5w==
X-Forwarded-Encrypted: i=1; AJvYcCWl8gcd4yJoAiQPYcJiSdpNfZeAsX9Flnn5Tcaf8GwL4yKKs0W7NKS/DTyDXo9YY9NAOoaf+3Imx3zi@vger.kernel.org
X-Gm-Message-State: AOJu0YxEQtF31clAd4EBNCLdcfxIm8Js49ltbFg8i/76Dd0F/2z/2C8T
	40IY2lGzbhojkNFqr1aZ5+ZnWS655ODMl8dz/+0kkd8kzJ5oGZj+YB+4yFWX6Tc=
X-Gm-Gg: ASbGncvotWX3ZgWWk5ssbHDspn1dZPlA7Z3RMYarYCsrBSK3CAqS+nryjMMkbXWr3Kp
	33oT/OIwGx5ZvMrBl8uzMRWDu9K42zC6rFk+0elUV2hGdxDwHdgxTCDBJLVMWBJR2zpdfBxxA0A
	cO6rm0qzXOiMtI/DxomeYSog/EypEglIOgzkQXBxi4QF4ZLaKE5njakydv9Ts1cGI0PeZvBuUPI
	XqSMUm5ee5poQFIhVM8bSkDRE7FLh1lsSqIVytqijo8AQ6Qcl5DD1qeQKQUE/KN8sYjAa2hbd3/
	Xj8AKTIH9TpoJ+CofQlcLF1CFL7wTIUrHQ==
X-Google-Smtp-Source: AGHT+IFrT2ryKEI3Ak4fYWyfabnfpp9zOPWj4dcFDB84T+QE4vp8znh03ePvPXvInmYkhFQ+6kA3Rg==
X-Received: by 2002:a5d:64a4:0:b0:39c:12f2:2f86 with SMTP id ffacd0b85a97d-3a06cf4ebe9mr1139766f8f.8.1745483748680;
        Thu, 24 Apr 2025 01:35:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54ee11sm1295376f8f.97.2025.04.24.01.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:35:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 10:35:27 +0200
Subject: [PATCH 04/12] pinctrl: owl: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gpiochip-set-rv-pinctrl-part2-v1-4-504f91120b99@linaro.org>
References: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
In-Reply-To: <20250424-gpiochip-set-rv-pinctrl-part2-v1-0-504f91120b99@linaro.org>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1877;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ksmfNK84GDabb7cwbZBiry3j0gjxGVa4nXCuGXvLQ78=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCffbDmQjLh72fMV3yjWxABGClwjTKpZiO6lYE
 y+xV5eR9zyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAn32wAKCRARpy6gFHHX
 ck42D/9i5222ivEDPuYJfJramTA21Dz/Si68PgQJKw8MP+/dYK04nS1HRUrhy2s/f5d8l3IQEyk
 SUw/nOJGPKcElQSgK5wfrcMdUf7QTLJdRhNCw8QSOsu8zgxG8mnO+kDL73zSCj6UrZYmSzbhsQr
 pLOonJY5NYn594guZmHYpKLwBRDzKanJB7jvdjlw0gfszSTVxk/hzhG8hUUCM/bfQZHPvJyefFV
 FQWRoGvs+4NzTr9vn6xCSUlbAFUGj2Hw/cBz3FfnpjjVnJobvJq6q524MdE7u0OO8X036gIDGan
 xzcN7fRgoRrCbXwXa+LdihYAqRJf6pbYHO06I8Vwr5qdHcoqzVxfF9LmTzJNsfRDxxLrCM6cT1b
 FntYtKNgMc1nEQbTRPPydtniG4qQtDZFcqj4J987kdEUq13zTzmnlHQwWOdxPYYR9VZ2THuI9Ko
 MI8jq3GiGSDkzR4kaJE3UKV+F5xJUGt3WHBDLWuJdOXqyQhfPQCIia6p964VATg0i0vjN5SlAY0
 Qc9XtlyHZLnVy4JPaB5SFmuulMcufAUongkqc0xwxfysH14nptwQOJE3fGE8gSpOgw/sMxJA59O
 47YrddaVzPY6+L7+huekZiruLx/0uoSG7JOMh5rxj8TEAQoIYDan1o14/46KQbYbsl45o04l1dT
 liTVfyVG+QGKJ9w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/actions/pinctrl-owl.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/actions/pinctrl-owl.c b/drivers/pinctrl/actions/pinctrl-owl.c
index d49b77dcfcff..86f3d5c69e36 100644
--- a/drivers/pinctrl/actions/pinctrl-owl.c
+++ b/drivers/pinctrl/actions/pinctrl-owl.c
@@ -598,7 +598,7 @@ static int owl_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	return !!(val & BIT(offset));
 }
 
-static void owl_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
+static int owl_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct owl_pinctrl *pctrl = gpiochip_get_data(chip);
 	const struct owl_gpio_port *port;
@@ -607,13 +607,15 @@ static void owl_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 
 	port = owl_gpio_get_port(pctrl, &offset);
 	if (WARN_ON(port == NULL))
-		return;
+		return -ENODEV;
 
 	gpio_base = pctrl->base + port->offset;
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 	owl_gpio_update_reg(gpio_base + port->dat, offset, value);
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
+
+	return 0;
 }
 
 static int owl_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
@@ -960,7 +962,7 @@ int owl_pinctrl_probe(struct platform_device *pdev,
 	pctrl->chip.direction_input  = owl_gpio_direction_input;
 	pctrl->chip.direction_output = owl_gpio_direction_output;
 	pctrl->chip.get = owl_gpio_get;
-	pctrl->chip.set = owl_gpio_set;
+	pctrl->chip.set_rv = owl_gpio_set;
 	pctrl->chip.request = owl_gpio_request;
 	pctrl->chip.free = owl_gpio_free;
 

-- 
2.45.2


