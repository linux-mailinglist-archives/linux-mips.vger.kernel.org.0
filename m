Return-Path: <linux-mips+bounces-9252-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9AFAD5609
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 14:54:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06ABC7A9655
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 12:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9662B283CA0;
	Wed, 11 Jun 2025 12:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zZypCxPm"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B737283144
	for <linux-mips@vger.kernel.org>; Wed, 11 Jun 2025 12:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749646459; cv=none; b=K3gg4RwtA/k2GDk8nILXEhmWlhHWDHq5Thup6BJBnJJnL3GgXRbIx4mWtedZWQH19wdbwUIyyQb9t9Mrs75u7oMYZ/rri3U2ZXEu5TmjGx3Zh27vSBRcJ7+ZEH2/hio7UdmVygQ/ZqtE730ZTZh3igDdI2v1GKu8wnOqbgXQsEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749646459; c=relaxed/simple;
	bh=911xKOJApKviZC+11zfPOxyXIb2TukqSX6c3EVx5nkQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tKHuYZnFsaEbzyEQJLyv9bEJLBUkdCFzycwtqSCuSkIhj+Z/MS8iflB0UuGX1ILlLucL56KKFragi71DX0A3JjHgthraVmAYSM3uOBk+nPeywGyYQKtxq2NA3fL0XLbkLRxkjHMX6HQDmf0iXcfpiTtBK47moljYqEQ8FlG435I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=zZypCxPm; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so56315685e9.0
        for <linux-mips@vger.kernel.org>; Wed, 11 Jun 2025 05:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749646456; x=1750251256; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q1Cool/KkGodX8Z3AKXl7cQge0BzoVtk/glY1zU+OpQ=;
        b=zZypCxPmbOj+AYdhYZaTBdz1yzlk63Y5cw0pP1/IcJBfrU9gKZLrhL2Ka1G9d9ZQia
         ohzkt+EAwz4rujF9WGN2V+QTUUh0yR8/NuRWkngzFiseaGgSoa8hBufBlJ6X+SMcby2Q
         w5NJt6oxPXhGIEnuPq2HUHgFK6/gjdkkMTuhkVTnKfJ3iXP4L6xd3kLb8ajDikqvUQVY
         IwZuucMo/WdNKXXcavQSTTOn8k4enHsT7laRG/HzQzstYVx/SdVXCJZAuQ+HCcZI5fDe
         i8IezpOajE/5TDUg8N6AdFsPGVeLiO+ZHxi9jz+tPrkZ3lyd8P8gUaTGbI67JQncK2am
         f4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646456; x=1750251256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q1Cool/KkGodX8Z3AKXl7cQge0BzoVtk/glY1zU+OpQ=;
        b=WpZdSP9ZZkV9fc7kaCW+CfbiLTE6EpcU+qXZqeOjPR+rbDyCY7PYzkZkhKVMD5rFbV
         4cfjqOJj3uZSssbD2KwWBaQC7GLqAo4XFuGoRDZFpxT7KqXZu59tvjURzZgOi8k8AHP9
         1AlpcNOkuJJQhE8P2oEy5CQKoRPf7FLdN0SrsRUraFlJWFXBQnvm4B65Owjimvqd49yW
         B2NuKsc55Y/H87lbrR72zMyoCzkaO3JVKNtjDpiP7Cb1Bc3I0FZgKJLgnRaAiyBFjREL
         x5JslQeR+0arjTyZCBNWlXsQNbJ76d3qDLiMi+hhFc0sUH2ga4tnWNf2ohdK7jQOsJZV
         WePA==
X-Gm-Message-State: AOJu0Yxo+VABjvETfd4D7dEcmyusRE8pCSw70hxzeBOFRa7RgvI/II0S
	p0zVcQ489TiiGqZzWCCJUf3SRYgr2zEZMr36a+7NN1N4G+q3ARLL+PsBZPFlnAdcXwY=
X-Gm-Gg: ASbGncs6HVhq95SD4N9A9i15J1EJIP5LXc+LUeA704A1+TPFW+EKMzAZgsjJsf7xth+
	0AeXytjZBlLTGF/REq3DbU1NFok+gfNwHEqKNTuSAUndI/dJmxkk3/qGXyeJo7rrtcxRTTbJHom
	ixq+ytf8n6xTjyLIy4l4ZL5JGzjJxPEyt7y4rVKqMOqp0JA7xCx7WdMLkYPaacv1VNKqQKDAken
	EyFJsLdHMn9ifmQjVGA7CkypskPwCzeKpGAQyjA3OGg/vN8icf2FwRFWsWlKmU58yR1L36vAc2x
	iLz2fQFmJPwt7CWV0xcanbIMJMWPOfiNc3jPNTvUwS6Ef07cEuqlt/FPVom7bJR1Wgy1TjjmTbX
	Ids6PPKDTbNY=
X-Google-Smtp-Source: AGHT+IEndovK5i60dXofmzfCQEmqHj9LiO/Bu6tcHs2EUY63JiHkYLaL474UbWr6R/p7cwzGJjwkKA==
X-Received: by 2002:a05:6000:4202:b0:3a4:c9d4:2fb2 with SMTP id ffacd0b85a97d-3a558aff029mr2487239f8f.46.1749646455662;
        Wed, 11 Jun 2025 05:54:15 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:8ef3:a82f:ccaa:91b5])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a53245275esm15225486f8f.76.2025.06.11.05.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:54:15 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 11 Jun 2025 14:53:56 +0200
Subject: [PATCH 1/4] clk: eyeq: use the auxiliary device creation helper
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250611-clk-aux-v1-1-fb6575ed86a7@baylibre.com>
References: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
In-Reply-To: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3080; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=911xKOJApKviZC+11zfPOxyXIb2TukqSX6c3EVx5nkQ=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoSXxyS4LF2NgHh6lDt4HtpPg68/w9OJYyIIHRQ
 pbd31+wpYGJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaEl8cgAKCRDm/A8cN/La
 ha5hD/wLniXN/Wdk0lE+moFPoRY5SqMESsaeB9W5MEi4ILxdPOGqiWLOjtZpsU9xfWIUaT0GO8I
 402HkOAnI8/gcBsBz7Xo663TN8FIChB/+plsclM8Yx4h0wjbZGA7O8FWT5mqDZkJ6QAKCtxftz8
 Y9JTHm7P2e4hGrVO+P6xiUkSQj8QZx9CRlcqpXA2JLlWA8t0WY6f3/5Q5ikgkK9AQpxmg3d/SbI
 F4eykgdy83+m7Sar8XsrSvwnbQMQ/eJU5PQewYVOOnkDHjss7jsdCU7aTxJHcD8WrrcnjzrqlSX
 pNybSBpRETU1JpLH9FOuV+dXTP5hBw3WB9whiYRoSWNjOdGuyk52zeSbNbmR1KK4Kp0Qx7kJ4hx
 CNFIDJ8/oBf3MMRjVa8TWO6zYa4ZvuH854db0sOivyrMS6Xxml3if+HpTAqQ6R+McVG0j4sBxec
 OzQ+QOTvaGsyZ/vuvnIT9ymNpzYNW2X4eqZOim4IFhXWs03rm+/9BKSMAj+WpwQT1SKIB2+/BHM
 Z1syPc2I4UnlAheE2uHP1Tkuo6SBUbfIvs3+43BU/e72C0UdNSQ+Ec2aGSdqiR/+Epsi0IZhKcE
 sMWbJC6gfc1WYr4Ua9VFkaoa+EOU2aYylmYQpq0CRPCmNfYsfOKs0KfHY/2e7Z7TAAGyb59FQ36
 LgtNe3dkZbYLE/w==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The auxiliary device creation of this driver is simple enough to
use the available auxiliary device creation helper.

Use it and remove some boilerplate code.

Tested-by: Théo Lebrun <theo.lebrun@bootlin.com>  # On Mobileye EyeQ5
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk-eyeq.c | 57 +++++++++++---------------------------------------
 1 file changed, 12 insertions(+), 45 deletions(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index 640c25788487f8cf6fb4431ed6fb612cf099f114..4094f34af05b488545cc87043fb3352968515a78 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -322,38 +322,18 @@ static void eqc_probe_init_fixed_factors(struct device *dev,
 	}
 }
 
-static void eqc_auxdev_release(struct device *dev)
-{
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
-
-	kfree(adev);
-}
-
-static int eqc_auxdev_create(struct device *dev, void __iomem *base,
-			     const char *name, u32 id)
+static void eqc_auxdev_create_optional(struct device *dev, void __iomem *base,
+				       const char *name)
 {
 	struct auxiliary_device *adev;
-	int ret;
-
-	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
-	if (!adev)
-		return -ENOMEM;
-
-	adev->name = name;
-	adev->dev.parent = dev;
-	adev->dev.platform_data = (void __force *)base;
-	adev->dev.release = eqc_auxdev_release;
-	adev->id = id;
 
-	ret = auxiliary_device_init(adev);
-	if (ret)
-		return ret;
-
-	ret = auxiliary_device_add(adev);
-	if (ret)
-		auxiliary_device_uninit(adev);
-
-	return ret;
+	if (name) {
+		adev = devm_auxiliary_device_create(dev, name,
+						    (void __force *)base);
+		if (!adev)
+			dev_warn(dev, "failed creating auxiliary device %s.%s\n",
+				 KBUILD_MODNAME, name);
+	}
 }
 
 static int eqc_probe(struct platform_device *pdev)
@@ -365,7 +345,6 @@ static int eqc_probe(struct platform_device *pdev)
 	unsigned int i, clk_count;
 	struct resource *res;
 	void __iomem *base;
-	int ret;
 
 	data = device_get_match_data(dev);
 	if (!data)
@@ -379,21 +358,9 @@ static int eqc_probe(struct platform_device *pdev)
 	if (!base)
 		return -ENOMEM;
 
-	/* Init optional reset auxiliary device. */
-	if (data->reset_auxdev_name) {
-		ret = eqc_auxdev_create(dev, base, data->reset_auxdev_name, 0);
-		if (ret)
-			dev_warn(dev, "failed creating auxiliary device %s.%s: %d\n",
-				 KBUILD_MODNAME, data->reset_auxdev_name, ret);
-	}
-
-	/* Init optional pinctrl auxiliary device. */
-	if (data->pinctrl_auxdev_name) {
-		ret = eqc_auxdev_create(dev, base, data->pinctrl_auxdev_name, 0);
-		if (ret)
-			dev_warn(dev, "failed creating auxiliary device %s.%s: %d\n",
-				 KBUILD_MODNAME, data->pinctrl_auxdev_name, ret);
-	}
+	/* Init optional auxiliary devices. */
+	eqc_auxdev_create_optional(dev, base, data->reset_auxdev_name);
+	eqc_auxdev_create_optional(dev, base, data->pinctrl_auxdev_name);
 
 	if (data->pll_count + data->div_count + data->fixed_factor_count == 0)
 		return 0; /* Zero clocks, we are done. */

-- 
2.47.2


