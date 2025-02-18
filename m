Return-Path: <linux-mips+bounces-7837-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C60A3A791
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 20:32:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E9AA166A94
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 19:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D75A2356CB;
	Tue, 18 Feb 2025 19:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="G8YH15ZZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FFB1EFFA5
	for <linux-mips@vger.kernel.org>; Tue, 18 Feb 2025 19:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739907056; cv=none; b=iL2o/B1Ma9EfwdIR+YktO/zIPRTyrIhdnj/jtd9yIja6MueK5jYDCbHQMx/c8yX6RKV3Ow/5If/0CN4/GV+B/VPm2fYHlCSBsdDk8Z+ZifKc4+wo6iq9Aqt2dSi1nSB1Vj+6j+EVh9J5s+VLs0snd07LZya05SXXZKaeacd0XNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739907056; c=relaxed/simple;
	bh=ma6EXu0EtX44zpd7hqJ6kC+ikAUaUrZisGtu8UlCCLk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FgMzZuxPze2KN3fluAFukaf0kV9R/NTHl85HHJ9ckqgUl6wSC+nTiMWl/peHEJ+qqr23Vj5OWIrx4wz9ZBGSxEHgE7TnZnPlEj3sMINbh2HGsn78FHTyR+9mXWfEFUqrEzdqXt0J+DO3xobq8fi/0tfTLIFZwLbsltp42iEIaFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=G8YH15ZZ; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e0516e7a77so4059985a12.1
        for <linux-mips@vger.kernel.org>; Tue, 18 Feb 2025 11:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739907053; x=1740511853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rf7170qq7Y3fQ7uVc37Bv/W29DRyxfOGfDaN3M72oXs=;
        b=G8YH15ZZBqaCVp4firJutU6x52xqffbjzYDWrvpB7HXF+3PDOz51BXM7sSlHmHBTmt
         USTJctCjI2t57aHPWma9ZDed2ZkJfRov8zqjZL2UcU/qpuVlPg/bPVwJbBRwAc9XLiq1
         zouj0M5iDyrKWNyqr2GzCA14Ktu8ayYFflXN/qOdwxMOc373XoX8FhyCTYVsAarpkYrs
         nah1gRH4C6wWSHXUmsqfyZKtCfs6YxKrwIM89iDDwSX9/V9/MAkrKa7y5X/Afp6x0BpR
         KJjc10fYX5LMf7Ba0f6F8R9poCjzGRM3iLOchOVnJ9FRn/xCcJzkkWyT2GA7FYDfMaz9
         zZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739907053; x=1740511853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rf7170qq7Y3fQ7uVc37Bv/W29DRyxfOGfDaN3M72oXs=;
        b=O/LyCczH1WNWRWN7lBqcVfEYl4lToWKrsJCuMX6iv0hOtwRaKrXmlK05BrX8qYs5Z+
         q6ovr2qnPEUFXB9pxp0djKeo534zBvn1NRjMWbMrIF0y/7ADmL/7pJqnLS3OCor0IX0A
         tMFLJGctY2dYP4OjcSijFwfjIOSJ8vdO8nypK7PMfmARqpTuRNROO58y2YtOEUKH816c
         qDjlLMdFXs6aI+JzIuGs+nS5wwXAGQyfSOjFdZNEwVDtDcj/wtWUvGyFYRLzSQFPFlE5
         F1C65Sid8jlh5KKjmZQVy3WSYWjuBej+pykO4wslfgGM/aqolD6AHabm8FQ3EvsoNkvo
         dp3g==
X-Forwarded-Encrypted: i=1; AJvYcCVMlGf6KSwO/B0DZhe7MSYyvrI8W2VfHy+r3K+KopONco1Jc+jthOwDxeMjqZvytdVPNLiPIhyzDVKs@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6v8H3BhOqOhjCDG9TIOX2+qqkVUhEfUmiIsnSnSxSQI6aKQAE
	MyQ69PckIRF1ugkojfGXYZjz7rKoI9vOyP/iR4rNM/9tgIjwHgbw3+K+vLETVRE=
X-Gm-Gg: ASbGncsVTe4J/US58Ly5jfmfjw12CaQvyZfY+5B5vS8f1UGh6pzNFtp4MMDNfVGSSOp
	DZRwkZcpA4H6Q5Qb0M0rLCllAf/FJVV1VPhBKdhsUwQAULeyfaO89bCLjERYcsisDre9IKv9g5j
	+y2mab9K4i2sSWH/T5UWn3amrK1BhoA7Xa9Bv1ygcHB0TahEEnMazqoYK/YWi6fy/4UniTotPHD
	vfNKrcuc8ug3Rj4Whsx4ILXgVkGTLznAqLb6SI98Fjmd2e8cSWc6rU49OKA8JOeG7iUqURMSiGH
	od2Xpu9ihgBd+56WOkADy4hqRDG3
X-Google-Smtp-Source: AGHT+IHpHIYxB4dVNZ3LyzCs91SySOLLXWjws+ryoYBHtygC8Wxu6MzjUCPyJSfIFH4a8C/yd6uRcA==
X-Received: by 2002:a05:6402:51cb:b0:5e0:82a0:50dd with SMTP id 4fb4d7f45d1cf-5e082a05797mr2098352a12.27.1739907052712;
        Tue, 18 Feb 2025 11:30:52 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:cbaf:af0:839d:fb4a])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c3ce5sm9338985a12.17.2025.02.18.11.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 11:30:52 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 18 Feb 2025 20:29:52 +0100
Subject: [PATCH v4 7/8] clk: clk-imx8mp-audiomix: use the auxiliary device
 creation helper
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-aux-device-create-helper-v4-7-c3d7dfdea2e6@baylibre.com>
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
In-Reply-To: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Douglas Anderson <dianders@chromium.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2798; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=ma6EXu0EtX44zpd7hqJ6kC+ikAUaUrZisGtu8UlCCLk=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBntN/VIh7m+Cn8Gx+R/npCxGvJH4NCUefaxFlhn
 gu0IqWnjBiJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ7Tf1QAKCRDm/A8cN/La
 hYVyD/90MBlzLttiipSPEDV3EdUFxIRifW8CB/ozE3YsCyj2v/DltrmPk563MQ5pa8itqfo5hkU
 4A8uKNAUHs14NclRLizOGn6E2OBZW/tn4ElVBMO65CtqbYyOtqBnsWDcaS758f/TBsB/KzwIRqe
 u/MdB86COXZ7E0Yx33885Shus9RahC6bGdvoBax0KzyWXB28Zfs56Dpy4haxed1jB0YzQnGrtWx
 pZ6HQxrdNKrS1V4FWGSzPl5f1oazL81zZnYpSBz200B7CNxKcAEEAMCMMIANqSAhDDxXaynOTSp
 WYqRQirSRpdrRSgogove/vJqlyJQEvkEoP08xVSBRUH0k8jPl8AyeIy1RrwvPiTPgoekvpMSb+8
 DMkOah/WLuym+3gJnOq9dtIg+X/ZPE7iPKreaC4TIHkCRQ4enqoO0BaYy2G/W5t+uDGBzxhsqFH
 CpQYATnH9X7aGhTIgcEatDE5NENzgl26jip0Dl2U6fTkcbRiYzRHwqdqqqlwsbZ6l9EooZL+6f4
 5kPCwJXOzUKfvTD8tNkD/GUpx8I1zc3pQ7R7KzzLxiiOG6oyQqm+HLCl/Bzr+afc+t51LbakoAm
 t6Qd2Q3tmZH1iA0sds5miFLH45OdqHtXeqrKPzPI+3W8oH37DOBtnvGssDoHjB8HiBJ1Bx4Xdg9
 OxcTaNJ3Vo552uA==
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
index c409fc7e061869988f83c7df3ef7860500426323..fa15a5ed59e304687317b5a23c845a0588890bee 100644
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


