Return-Path: <linux-mips+bounces-9255-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B70AD560D
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 14:54:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E2073A62A4
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 12:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D1728466D;
	Wed, 11 Jun 2025 12:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="yaSyfnk7"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E92F2836A4
	for <linux-mips@vger.kernel.org>; Wed, 11 Jun 2025 12:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749646461; cv=none; b=ffSbagdae/GKxi5WwBWWBaxRKW66K88ISl7vbdzUZEocuCDAEtfxjaUuBh0w5PaR7Hw4xSC+TdhvTuT/zvO4NnvyZinfcLsIKkEw7jP59ONOcqGICLy9isrIyIzRL9WFrMiiWt8H17iWJsEfIAcRtiOK6RqRyDSQeOSpFeXSKCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749646461; c=relaxed/simple;
	bh=ojLJe2tP2Vz209foMJ0Lu2S+h70I7DXs1+HhM6dEcXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FimPyyfiok3U8b12ujnPIsj5xEyAm2MsS7SfgYC5xTt80ta9Wh+wovdjlW3TDspBU/9cz2WjbadajKeQUg2vxNLT6rOpr4ylomyhbVARF1SXBdTbOA3UE6e33PACiHwb/Ctk29nH3ID+gxoDMDjxAHNap2R4Qt6ES/C3XFY2itM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=yaSyfnk7; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-450cfb6a794so43303505e9.1
        for <linux-mips@vger.kernel.org>; Wed, 11 Jun 2025 05:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749646458; x=1750251258; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HFpwfaBk9Zi/05ZHLg2kQwpAQr276eZe2gpjdnyEXsw=;
        b=yaSyfnk7IcLtQf6x/rBb729BUr+rJVcN0iujnb4SaNdwMdoTUnC7uuH8keqXn5b1wS
         affppTOMaHLH/yzIYDjkF3cz9oeBLAPy5bOKyW/siNR/wB8V1SU1pKuYHXMhYuK+EBGj
         8SwP8lCE27gs40RmLPKucDbURwbqVzgQCNHB5toc56CS7NK+iq2tt9XWeqsAxuNyFY+v
         YIapGvWlO7cmcR7X5/BsIb9PWyeLNPqc/bOGLWLDZwM/tvMg7Pw+tEXENDPr0XFjRkUH
         6m4hDFAtWY3dYYXbJoMbMxTOdEbVWwqj0imf+1M3hY5b5NgLRhVtIuDiJjDchNj62KVG
         JuEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646458; x=1750251258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HFpwfaBk9Zi/05ZHLg2kQwpAQr276eZe2gpjdnyEXsw=;
        b=u6YrSaA20VRuiY9NqvFVO9om8iefJQhPCs77in7V7UInf/XYUEdzfGN5lJhbkmjXeR
         xZSUoZAm8fArfZwHqgHGgXUGHmqfDCA4/HOclsTFpMO32MCYSVXiOnAZ0zh7o8yRpe9j
         DM43lu7WiTGHJyQBevlY8dHcVehOcPjw/9Py0gza95L03CvCh0SVEiiqP4TOn9Pp174g
         ZemBQ5uSILUh3GJkJYIhNDfCEwhK+O6eynfIcPdy7bqURQ5semFNcA61pLwg3eek1x0d
         qZoP0EvvNRb3gtZNtMCNPVVIXqbNYdUFlxiw1lL8B4fJShs18dBvj7g6YdiEFkePX7zX
         m1rg==
X-Gm-Message-State: AOJu0YwCzBVRQ9cKCrUGDk30ubsi5vkQOOfO75yo+mL5y5Ltorm6YgnJ
	qzPNQqv36zOfipcHw+4DwDoQkvQANu/z4mnO1mpA/W3TWrGVvx+LZC0Q/uG5JUWsH0g=
X-Gm-Gg: ASbGncuUTmrngvQYzlfDXvt4n4NrmCVGUqCRaPxoQjS7/kc8ckDV3RDp6aUlhZHOFGU
	NYzObdTYegDWyggcl6qXbOpAlAPeH0QvgWjy9vvKQAWYE7sxmP/xmN+z/UaRKohAVYKfl3EAN+F
	uAu+anZ+KIq7xmrSKkGDj14CQUR14hQfmRAvuR79W5rYdEMDONF0Y4czYDmCEgDKOVomwpavdpY
	NAnD5Y0RuJDcA+F8F/1F7hU3Y3n9iMFhFUOB5/UYw/yNXatKQLSujZu+qAtWLr9nChD87ylUt0A
	MKUlOOi3JOsn9lm/RcdR6gKvnf2VPByULe5yiEwOTaswfcBCPfUrRpw8K42f26F+Atd+/+o288e
	HgY+53gWVWmc=
X-Google-Smtp-Source: AGHT+IGIlwjD38JS//yUBEcvXlmN2huAOqXtp/YJa3YDrL38fHSYMCV1TEIKntX391ju7QlDra2xEA==
X-Received: by 2002:a05:6000:2586:b0:3a4:d939:62f8 with SMTP id ffacd0b85a97d-3a5586cb2a6mr2093860f8f.32.1749646457670;
        Wed, 11 Jun 2025 05:54:17 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:8ef3:a82f:ccaa:91b5])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a53245275esm15225486f8f.76.2025.06.11.05.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:54:17 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 11 Jun 2025 14:53:58 +0200
Subject: [PATCH 3/4] clk: clk-imx8mp-audiomix: use the auxiliary device
 creation helper
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-clk-aux-v1-3-fb6575ed86a7@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2798; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=ojLJe2tP2Vz209foMJ0Lu2S+h70I7DXs1+HhM6dEcXA=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoSXx0XZWnNZ1AgTV5+LghlbWYLZmdaCeetdFuI
 qp+F7j2WVaJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaEl8dAAKCRDm/A8cN/La
 hb16D/wP9KqqBEL7B0U8B0WK3yPhG6P25gSKeMgOS5rbf0shnJGcVbdMZrh5wm9fTchQpnEmZCz
 D2n4bKvAkLeTU4ydkqcJ269ydY7GRX313GINYYGI8Vg+zmRD8n52Kb7Stu2lxt/0RX81QLy/2vE
 UdgZmzXLrQ2p7vQFa+B/AAU02dJwd0jzeD6TTYstyr7Vt22QGmMBtRTl8MUiRbzFn0UTGfsNFxN
 wLGmBduWVn0u+WPHyEatcPAogHrnl78ggZsxkNmDNlLHJVlsjCYMKbOq4m2XV4NacsNVmG5G8dp
 GfaM8mfrSlogZpEL5Zbhz7PoJCcUjHf+NcnI35LMc53E30vHuphLQjdsUzJuDn3jsUO4FvCyUfA
 lom1Lz7f5BY4l3cojZXX+fHtCnp3Rjx736PDJxmvmXUNQM48ymIwr1jNh9XzYHP/6ZdnaTFXPT0
 iLNQEC7PVi55LOyqA3Qh0Q4OTu0SXEL0Up0aCmi9hwUbtnsn8Hcnl2Ici1abYub+Us8WzOQVJT1
 AeckT54HKRMGKNqpj/OQ4rMW8woe2BBCfkRgubAj13myhy1nI05lTUzV3LAtolCUdR3iSGT9htf
 iTexlX/QOC4yKNXuJoKwrB9N2TTIu2a9Jj0O/jNY3tem+RlQF7wWF88v6oSJ0sGAoHiCXLPtX8D
 rA4jtMmEVS0/N7w==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The auxiliary device creation of this driver is simple enough to
use the available auxiliary device creation helper.

Use it and remove some boilerplate code.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/imx/clk-imx8mp-audiomix.c | 49 ++++++-----------------------------
 1 file changed, 8 insertions(+), 41 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
index 775f62dddb11d8cfd17a4ebf7a677ef399c5e617..765fb1f5bd4fa2b039d7414abd89471438ee41dd 100644
--- a/drivers/clk/imx/clk-imx8mp-audiomix.c
+++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
@@ -230,61 +230,28 @@ struct clk_imx8mp_audiomix_priv {
 
 #if IS_ENABLED(CONFIG_RESET_CONTROLLER)
 
-static void clk_imx8mp_audiomix_reset_unregister_adev(void *_adev)
+static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev)
 {
-	struct auxiliary_device *adev = _adev;
-
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
-}
-
-static void clk_imx8mp_audiomix_reset_adev_release(struct device *dev)
-{
-	struct auxiliary_device *adev = to_auxiliary_dev(dev);
-
-	kfree(adev);
-}
-
-static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev,
-							 struct clk_imx8mp_audiomix_priv *priv)
-{
-	struct auxiliary_device *adev __free(kfree) = NULL;
-	int ret;
+	struct auxiliary_device *adev;
 
 	if (!of_property_present(dev->of_node, "#reset-cells"))
 		return 0;
 
-	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
+	adev = devm_auxiliary_device_create(dev, "reset", NULL);
 	if (!adev)
-		return -ENOMEM;
-
-	adev->name = "reset";
-	adev->dev.parent = dev;
-	adev->dev.release = clk_imx8mp_audiomix_reset_adev_release;
-
-	ret = auxiliary_device_init(adev);
-	if (ret)
-		return ret;
+		return -ENODEV;
 
-	ret = auxiliary_device_add(adev);
-	if (ret) {
-		auxiliary_device_uninit(adev);
-		return ret;
-	}
-
-	return devm_add_action_or_reset(dev, clk_imx8mp_audiomix_reset_unregister_adev,
-					no_free_ptr(adev));
+	return 0;
 }
 
 #else /* !CONFIG_RESET_CONTROLLER */
 
-static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev,
-							 struct clk_imx8mp_audiomix_priv *priv)
+static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev)
 {
 	return 0;
 }
 
-#endif /* !CONFIG_RESET_CONTROLLER */
+#endif
 
 static void clk_imx8mp_audiomix_save_restore(struct device *dev, bool save)
 {
@@ -408,7 +375,7 @@ static int clk_imx8mp_audiomix_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_clk_register;
 
-	ret = clk_imx8mp_audiomix_reset_controller_register(dev, priv);
+	ret = clk_imx8mp_audiomix_reset_controller_register(dev);
 	if (ret)
 		goto err_clk_register;
 

-- 
2.47.2


