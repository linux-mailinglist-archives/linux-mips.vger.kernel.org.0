Return-Path: <linux-mips+bounces-8733-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBEAA9A645
	for <lists+linux-mips@lfdr.de>; Thu, 24 Apr 2025 10:38:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75B3C924FDC
	for <lists+linux-mips@lfdr.de>; Thu, 24 Apr 2025 08:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B72225A47;
	Thu, 24 Apr 2025 08:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RPtK9kC4"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172C72253EA
	for <linux-mips@vger.kernel.org>; Thu, 24 Apr 2025 08:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745483763; cv=none; b=QjFXBEBrz/WNDNG6PDE8/icu9Jo3AtWGGFSrAwtNPiCu4wxpkzY6gaInX+LqLSry3Z57FiWXeL9kPPTFm2mKCn+udeahe0wkmMUAz+8ohTXCDL10s/45OUQ9rOaNd2QtUCXz08AD2E6VZDNsbFvVlB09A++mjTWxBSRlISmXOmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745483763; c=relaxed/simple;
	bh=iJgBNsG6lNFWVLQiSa+DhOTeGMwUTZl4FTd44fGqDV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IrWJRfk5giEhv4H3VVAPfIFYzFnAr+KG++cZJksgEj51efs/SienKYrpjX2IkwIjGctuh2YU3WFc78e+Bc9Kx22MZR4Nqp4+LUFdUt6Hxc7/ZXtXDH2ITyxuijSConZiIGznv9nAwbqiSoCVmeMB7eyUtVIjivq9g+Ys4b+ykz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RPtK9kC4; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so4317355e9.2
        for <linux-mips@vger.kernel.org>; Thu, 24 Apr 2025 01:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745483760; x=1746088560; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wyD1ibYwZZNQjABTauO+kWeZmIcgNLsOAbjC6l1tSrA=;
        b=RPtK9kC4LjSXD1qQFOsA0rKWaD0QeJc64AIgG33BrCZCJmOAxZ52LrclzBfUqrrXtm
         mA9trdleq54MLvugQI59/uqHVrgHOnDwAJB26qU9VCLDSSbCyD9+SgMwVaH9UsRUK/uo
         u9H6AfGBahjDSZXIrVd0/owWqf8hLb5BwAHxEM8IAcbtNqx09s8NXM4/H2+uJomieZeV
         GcsN1KnhTxxjys9o1NYmtY26rvOd5IXOFSANNydM2cHpUWt+WUAVVbtA3u8CwGg1yRLg
         J6eLDLijB25QuitRErqmqkrM9HuU/ANu4Fvv40MMTU9yCUAEYgih6eSxdpcwdkPlgpNB
         Hu9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745483760; x=1746088560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wyD1ibYwZZNQjABTauO+kWeZmIcgNLsOAbjC6l1tSrA=;
        b=qwIg00mqJ+OANAv2lixlmEkWDcwQvcKvAnRxY+Cw36IOVsGgVfX/rb2ieMCrG0EDKK
         1KDB47ig4HGaVnJQzwOwdhevlaxZt9ic8fRktn6lQCqpw8xXtGFpw/ZbHrNbjdA17yeb
         JodMizYxm0hcO0Ro/VfNfzcat8YCUjqF6v4yhcaxqvrgz9pvFLDMsfjZpEjapeCaNOKR
         1gjdUQas07UB2P0QTwQ5ZsamJKDZWh0GE4QY6v5J2oxT0uZ3zRXdqII3Ue6LDkEM8yDG
         0bU4gwC3UCIv5slcKXOs8TJc3DeBj6ORor6dSf5ipVG/i5ZW8eJxx4An4YZHpsc6ozJC
         EvCw==
X-Forwarded-Encrypted: i=1; AJvYcCVcQbu6Q/w21CQMVKf0I2jpk7LKPWkPjkX8mdPS7C6MA/kuXRl5meB1OlrGRA+F/AOl07Q1Zh/fHYDI@vger.kernel.org
X-Gm-Message-State: AOJu0YzKgi71oXXOvBAn0W9p2rYnHV9mAWP2fMwqmz9thZ7Wm+03G4D/
	2gkSRBrUZyVplsrCRwb6gwwAnfTLX1ithQXKw2fQU99RSY418mKyduvkU96yHWI=
X-Gm-Gg: ASbGncvS7McVp7frIDiA1Ds1PXdDO086JGRHImUoaTlmWgsbuIs1uQWaUMbk8mRZy+W
	NDgFvSz0hXqUkv4n+mXavA9DQFYQVik67/YI/bvKfAN9vwfDeIbDS7f0/zeU+N7XqOz6k7XFyf5
	+XDl65MlQEb9WYxb/lL3HSieJbmcAf3tdB9EuFkUFQMspboX5C67hFV6BACxDfsa02EZUUV3VOX
	yXW58qQzkoocpVDs1Aw95ANIRRVSQZlNsak5cyrsIv/BsouVHG4BojvwIS/XjgD3ijUpuuNVn6I
	AVQeOQiTbflUq281MYrGXtj8MLFzT7JRJYITP2AOArsm
X-Google-Smtp-Source: AGHT+IH6QOMYk+VJrhRN0zGGVgIfy1D2k+1MN8UGZUw2MzoHJ3Lm78KvUsSoh9H7JaBXZAa1kpHpxw==
X-Received: by 2002:a05:600c:1d02:b0:43c:fbbf:7bf1 with SMTP id 5b1f17b1804b1-4409bdb032cmr18240795e9.30.1745483760212;
        Thu, 24 Apr 2025 01:36:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:6266:7750:57ce:7cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54ee11sm1295376f8f.97.2025.04.24.01.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:35:59 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Apr 2025 10:35:35 +0200
Subject: [PATCH 12/12] pinctrl: samsung: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-gpiochip-set-rv-pinctrl-part2-v1-12-504f91120b99@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1963;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=eG2KW5x0cqyXDN96Y9D3KPo3rE0JJ5CGRPpl+iXxy5M=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoCffdVG5Ygxdkgp3G4S/J2z4z5Tlan+vD7V30h
 TZ7h0V/5sqJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAn33QAKCRARpy6gFHHX
 cjrUD/4wlY3EyRbxHX7pcMIAP/3DRyfsZNReCKH3ZrZK01gpg0foFUc8R9H0I7tpjEjSAcAY76v
 HT6Cav5kSBB36HXaJHFnbS5jDeLX1My/AARxYsg4hUeZMPsEdhdyug5NLPV4v9U5qGYyscWQJyQ
 IwWtL5S1/tZAIxzE73GS7fBnvaLvxdKHbO+ihsBKDN+CICZsABKHeqmX8HC/mpf/Pn3VZDLdxw/
 v370ttF11vBuDqxQFqucfxlUgG44NsRTH7slXcpLFqsmYFiyQ+60Kr8qtR4uG0wjgcD84YTAWTA
 jnMOBMJyWoX60aJoqOu+7ntHGuUA7AfUId1TflJw4qGZZhayvH7YZWSFpZChBh+R4GzP2lrJnH1
 /l3WSICXjyuCbO00KEg0M/ETEdHzDfqcXsC++m0uUp+XVVbx+NvevmZ076l6BhVpake9w8udGP+
 Y6lwhiWZ8sd+/nec1W16T+R/feEwjS3Uv+zzSP+uImKmEA6Rt/EFeZ0kppvf1XgXTXagAHYRfnq
 AX4Z1SXHpFfCHXYrPNMxv8w2uM1/eIljOwRAW3Xye5WYWe5bWWR/tmOB8O64R331D1+UTdeTv/x
 ZuaGKlVB7ySPckXnPWzWBP1UHZQiR7DAHXC2juTTX1w+v4NAGx137CcqLE/rrfEgbdhjBoA9iFy
 +HWM7daAr7IScLg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/samsung/pinctrl-samsung.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/samsung/pinctrl-samsung.c
index ef557217e173..fe1ac82b9d79 100644
--- a/drivers/pinctrl/samsung/pinctrl-samsung.c
+++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
@@ -570,15 +570,18 @@ static void samsung_gpio_set_value(struct gpio_chip *gc,
 }
 
 /* gpiolib gpio_set callback function */
-static void samsung_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
+static int samsung_gpio_set(struct gpio_chip *gc, unsigned int offset,
+			    int value)
 {
 	struct samsung_pin_bank *bank = gpiochip_get_data(gc);
 	struct samsung_pinctrl_drv_data *drvdata = bank->drvdata;
 	unsigned long flags;
+	int ret;
 
-	if (clk_enable(drvdata->pclk)) {
+	ret = clk_enable(drvdata->pclk);
+	if (ret) {
 		dev_err(drvdata->dev, "failed to enable clock\n");
-		return;
+		return ret;
 	}
 
 	raw_spin_lock_irqsave(&bank->slock, flags);
@@ -586,6 +589,8 @@ static void samsung_gpio_set(struct gpio_chip *gc, unsigned offset, int value)
 	raw_spin_unlock_irqrestore(&bank->slock, flags);
 
 	clk_disable(drvdata->pclk);
+
+	return 0;
 }
 
 /* gpiolib gpio_get callback function */
@@ -1062,7 +1067,7 @@ static int samsung_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 static const struct gpio_chip samsung_gpiolib_chip = {
 	.request = gpiochip_generic_request,
 	.free = gpiochip_generic_free,
-	.set = samsung_gpio_set,
+	.set_rv = samsung_gpio_set,
 	.get = samsung_gpio_get,
 	.direction_input = samsung_gpio_direction_input,
 	.direction_output = samsung_gpio_direction_output,

-- 
2.45.2


