Return-Path: <linux-mips+bounces-8727-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D309A9A627
	for <lists+linux-mips@lfdr.de>; Thu, 24 Apr 2025 10:37:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBCFB46555A
	for <lists+linux-mips@lfdr.de>; Thu, 24 Apr 2025 08:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94E23221562;
	Thu, 24 Apr 2025 08:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="b8smx0Vh"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C15D22069A
	for <linux-mips@vger.kernel.org>; Thu, 24 Apr 2025 08:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745483755; cv=none; b=sCMRXU6Antef+88FvBMJw/yzm/gyL5BLPo3uLQ5txnNHuk5cQDyfPZ2ENs35jjU38f6GQY6LVhlSEV5ivYx1lpKKequfTOFbQg1m/rqHG5XFzlD+cIEfx7i9h7Odn1kBvIdgTAl7Nmg5eRCHpidwL9xiSQKKXKN4Tz0iFbuaxoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745483755; c=relaxed/simple;
	bh=gr4j3Jwm5V4eo0S2WRVkEBQvxzFKQLytZ1nLPQ/vxUc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TMtLoMR7feS/6qZyUVJZjz31toz+EMel8Aodwq301MXg3sVCO/7TbV/CUeQ5VIPFD2HpsQhSsIRXLZSwHtZENVEW15jzQ9tOw2RJXzr4J9/QeAiHj36tI3MDMft/+zHqiOPIUtYiPTEDM4vtpNbDvLnTJOuEdJAe6uFK02OywEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=b8smx0Vh; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39c0dfba946so489522f8f.3
        for <linux-mips@vger.kernel.org>; Thu, 24 Apr 2025 01:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745483751; x=1746088551; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JgPwII0oaN/xr9K9Qpbpi6zJX/PK55qb5SnnE9vGitI=;
        b=b8smx0Vh8aB50Wlo7uCvrFV88cy8pSA6Egakgx5xu8SxDYv5qAegPACeHJYY4lsFWo
         pu5SrwB500HESSjviStShC8IHVm6DRyyZ5YC+9vZoYObYQmg5HdL4V7v9emyAY1J/dZK
         NQTnDknKRP0jjpyOt7xKfiZ3/SsrLrxsdhD17/6xh7SVfLfyFwWZ4UVNJq5Aw4G+zxi2
         FimJfZsQLNNA2nwZSp//5dl47LNc5E7XlGhK4kMiiJ6LCDj/krQ8LoBIe/2cQQDbGMdN
         K6MXSEUL/CuPkVGFyTCzq3Nhphh7tkBmwnIuVotB3N4zLwzq4JWghYb7JFRn8eZpzPbP
         oi1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745483751; x=1746088551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JgPwII0oaN/xr9K9Qpbpi6zJX/PK55qb5SnnE9vGitI=;
        b=Yqt5Ws7agv83jUFjCEb8gXTAKovry0eQYoGQYJ3KgqkAhqzJYujvRi3lJ4iGoIJMs/
         sGHkbcBti5e96ExezdawSqX0Xz4jGnlAHAVgSsqaZiZJiYXwsdpIEiU1a+AE+mS0D46b
         gchRCKs532BdouojIz7D3ztRHe3iK1FBEyHVcFjVZAnKum8s5JvZSh0iM0qUJFElmow5
         26CeL5Q1PIjJDKr4KssgellpJvQv3LuCeTasHKxnUUJxgz1F4GBcxvq7poiks4YMnFrz
         ZbSRnyfvNidb1DgDyS2aXHpqctzIj1SiGvZrqwzkNBTc2hDflOeaKXFHFrBTXpUUOQLk
         Djiw==
X-Forwarded-Encrypted: i=1; AJvYcCXr5N+bU9RLY7XBKWbKtjIXSxAlxarPHK9EWqpuHgmDW07tmopw1mUadyIMOOOsUaKAkla22GrjFO2O@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6Nk/All7ILwiEiHePLAE9kiANvj6sgPWW2y/DmbvdxD5z49ud
	BC88SAhVJHv/xd2jd1Eb/WSyCmWYq4HNI2eEnDrKwPHytbL+h0BBSu41yO5MVC0=
X-Gm-Gg: ASbGnctQUgGaspSyRgBooMe/XZzcil01DSEJTfNe0kFzNNWM8lqxGLaJNOYNAN1jVyD
	kvXRZna23qOGrJ0k8bLkDCkf64j/H3aAJW6wi2ORweOSBPzLyD4mdQCIlFNWgm/d8KlHl9UMY8R
	EJ25yVtRgfqazCtzo5dku8KowfrYq0WPfyquNzYUElxGnBgHKgT+jky0YsItD0YgYSGn+PcBltZ
	6GZOmMTPxGHMcathEMGV/QNHaiI1UPRrPN45AUFeyjJv0ic8TD+LReVD/blRXFWLy5FhIPJuemL
	RDS2iqW3HmSxSSjzySOt2FTo5olFTH2xqg==
X-Google-Smtp-Source: AGHT+IEVNUQ6vip2brhi39nvtk6MkVQTh+2bIVjwhO/bWPyTJvPXnQpR+hxBTWqkmpl4+az5f4M2GQ==
X-Received: by 2002:a05:6000:18a2:b0:391:4ca:490 with SMTP id ffacd0b85a97d-3a06cf61b5bmr1267744f8f.29.1745483751476;
        Thu, 24 Apr 2025 01:35:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54ee11sm1295376f8f.97.2025.04.24.01.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:35:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 10:35:29 +0200
Subject: [PATCH 06/12] pinctrl: ingenic: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gpiochip-set-rv-pinctrl-part2-v1-6-504f91120b99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1459;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=EpaHLTvHgujEi7qKfzUhgTml3Oo3ftuzcWIJ8X5naTs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCffcqRFqMqwDfrINHgXeUxjJc+Heti6mMqltZ
 WXN9WyQbmWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAn33AAKCRARpy6gFHHX
 cofZEAC+M87Cf+K0esqTbzfza67g3hY5z0YJwPkX2vXvmZuWICpN8P5imK8RtM9vESiUtCN0ybB
 hTNiizbnx9EY0sYuvoh714dAmY5WntJSjg+lKkHxYaFY6O+kKPcQks2ESZNLsGfxCIwbDjx8UE4
 dnA7N2MMnPS8EHdw7onAjS5gytn0XfnCyma6MvFGEEirp8OC/7UTcsEttr5kLpIOt4qze7JZETn
 c2Yla5eOk3uSZp0IWQDbBkMnxMJvqSA4uUuiD32PERh/cGH6Oi9u9nkcYojNbnhFVUnNgxAow3j
 GIWL6FS33qlbPsXXexga1/6/bHbdKgDL3kcsbJfT7ROdq+AhtedMoKE3uUnu6SID+u7yy1aIrMV
 u1VfeW00/l2wDrmsXSb99WtG8SonrP0w5jQe/uKxq/lUdKqkdDL/K048p/84bM/K2FaTXS5PqMa
 LQYoovAMpXR7KiqLnNlvPkXUcMQbmXmJ9w7sfdj0tIrsds/fklzsW00FLM20w/UWRnBoPwkgcsU
 s5fKhyEWdbM8MraopZYWx0OkbqIL05w24OOAcEymloFAxHQMBJEDkM9JKO0iPMkeECvZ79w/syz
 fjW9mwYO4qG30U3wUD9519EqOnbGP4olbfbcmmkC7HSPkHjZzbmWs+VYwUqCBTxWMAUIsCaLlbk
 hX+zipAXZL6tN2A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-ingenic.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index a9e48eac15f6..3c660471ec69 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -3800,12 +3800,14 @@ static void ingenic_gpio_irq_handler(struct irq_desc *desc)
 	chained_irq_exit(irq_chip, desc);
 }
 
-static void ingenic_gpio_set(struct gpio_chip *gc,
-		unsigned int offset, int value)
+static int ingenic_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			    int value)
 {
 	struct ingenic_gpio_chip *jzgc = gpiochip_get_data(gc);
 
 	ingenic_gpio_set_value(jzgc, offset, value);
+
+	return 0;
 }
 
 static int ingenic_gpio_get(struct gpio_chip *gc, unsigned int offset)
@@ -4449,7 +4451,7 @@ static int __init ingenic_gpio_probe(struct ingenic_pinctrl *jzpc,
 	jzgc->gc.fwnode = fwnode;
 	jzgc->gc.owner = THIS_MODULE;
 
-	jzgc->gc.set = ingenic_gpio_set;
+	jzgc->gc.set_rv = ingenic_gpio_set;
 	jzgc->gc.get = ingenic_gpio_get;
 	jzgc->gc.direction_input = pinctrl_gpio_direction_input;
 	jzgc->gc.direction_output = ingenic_gpio_direction_output;

-- 
2.45.2


