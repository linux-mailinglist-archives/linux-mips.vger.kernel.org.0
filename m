Return-Path: <linux-mips+bounces-7733-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E07A3130E
	for <lists+linux-mips@lfdr.de>; Tue, 11 Feb 2025 18:29:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B891D3A0755
	for <lists+linux-mips@lfdr.de>; Tue, 11 Feb 2025 17:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF24267B96;
	Tue, 11 Feb 2025 17:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="pmeYh9uc"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE48C26462B
	for <linux-mips@vger.kernel.org>; Tue, 11 Feb 2025 17:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739294922; cv=none; b=m+PAvnFKc1CcCDrQ+76SatbMnDh+UrX1k3wEBJ5W4UJ54bpchNokMfdLFEmcxq9NLvgmaTbX2B/HSY035AfsulIGlTeXforLOPAFyq52Y2C9RlIlXOaQx8F5y+1FTXo2X+Bbooey430wYU2+5/exlBY9UtE99K7mJbBVn+p/FiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739294922; c=relaxed/simple;
	bh=yh1X3NdDCdUsA9BLxtXchkn9/M7vIhxyVwRqzsjlThI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GWmvSj3zFfTo29Ifc6pThEBdeJjdiTM+NKs81VmfAPN8XyLJtNksxIJ/Ji+gS8nO1p6R8bRgBQUAQooSkC2AkTFedYbpc9VUeZixBO93kbv88ob6YwkrS/5kRNax9TDl4LD5UAPAz+h8fbYyZPboZUE3jW87VXdgqyBAP6AYNKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=pmeYh9uc; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38dd011ff8bso3384197f8f.0
        for <linux-mips@vger.kernel.org>; Tue, 11 Feb 2025 09:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739294919; x=1739899719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YiUH4lqEkZUY+Ysux6Yiqp87vOhypZIO5pd5GZP5Rxo=;
        b=pmeYh9uchp8yX2jMeFdpbUwqUjaBVVWOjCLw1EuEcUpkPssllSMiZvn+MKEWW8GUth
         e/dmIBaHjqw0Qi7I7XCFudMl7N8j0cB7dBZoMrQ/m/uDJaywbKE2ziJFt4gM6BYktOsw
         nSTcRmnqtiT6jFQBZ9q3vsKdHWWCyCQkQD3vCHvA9Rgufxw/SCxVnp07go8eRCM6Ka3E
         vw8/t5URK58CyTPNlbnnOA2rFhktA2pQHx85CaJ7JpTbp2GFMQxjcx8Dx0N4znhYbijA
         6uh6fLifTfFmj2C8SxeC63EaTIqptF8wmdHNnoN0tjqQbezzVYhRyh41w817z2TbgvcQ
         bVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739294919; x=1739899719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YiUH4lqEkZUY+Ysux6Yiqp87vOhypZIO5pd5GZP5Rxo=;
        b=GpHVpttOJSjts0sMYp5aevBSN65A/1jSoZlGvAjvzQvwRlmzDMiOYtLf9dRUBDAK7D
         UyCtbEOL53uX8oiGEok3NIbdQhdLlYI/LhkfGgLz5sUKIQV9jmsxckSo3P4Y5tC3GHMm
         kSxxkX5Ajtlkz6UYLv5paBP91VQyxGkaAZc5rYA2TldWE73owETxFX0xhOzBSJLEGlJ4
         BcbtaSY4z6MRtqPacuCS5hq0bQ8uVV/zrFmUS1jLvkYuFTqbDeV/hFxUEqX0RO6XS/en
         3dD8SwY3jA7kNr5P7VD4Vic2Ybl7+sCmBGP0i99bKUK3yugD05+vrjD8LXWE5LfscEzs
         ksBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdNgBZrG5TzefVg2vVH9XlmceFOrV7VTTo1m+e99lKY/kfN3QKQ68aHN+KIHZE3QkeOgZMQ5J9hIEr@vger.kernel.org
X-Gm-Message-State: AOJu0YxQMX+lp/92yGD7N2JHUnoqE91sAqHCjuac1CXyhJ2tWGP0xkAQ
	KzJEZW4kRMvziX8WbuOigD6O0L7SCK7rkVIXKDm5r7mgSCD59PBTQCNxheTdYeY=
X-Gm-Gg: ASbGncvkkZNhVUEqsVUI2tD4L5ArZwazYA9yCzgjHWnxMLe0wG67zD4xORWisqw/i6l
	rsXWbBhz1OCE0mpudMumJHEJfw69KinK+BMtbFUiZP2OC2XSAjC3GYecTpU0iKzpCWHJ43/qKby
	24N9BrSYjMoyUtGZ1uN2T9FZPzGtJQH9gL2Teed7NapWgUJ3EXrLHb5LL+JJxJWUB/EeiJ3PozI
	SAhf4jbbclRFyBwQz5qeKZkUSBOq1PNsjYRjdf0cphD5MSWKx/19l/s4YRHw1YVeG4CaOntAvhr
	p7STkjYAEXWS28Da+w==
X-Google-Smtp-Source: AGHT+IGWxF7f1yWAujS2u+KdxRxs6BCZ2vWSSXW9ul24NRbBrNVcf/bzFVrq/LcbH1iHWIudtU2p/Q==
X-Received: by 2002:a5d:5f42:0:b0:38d:e250:d962 with SMTP id ffacd0b85a97d-38de937cef8mr592405f8f.30.1739294919069;
        Tue, 11 Feb 2025 09:28:39 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:fc0c:6c04:7ae0:c5c2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dc6c80df2sm13691082f8f.18.2025.02.11.09.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 09:28:38 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Danilo Krummrich <dakr@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Douglas Anderson <dianders@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Hans de Goede <hdegoede@redhat.com>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v3 6/7] clk: clk-imx8mp-audiomix: use the auxiliary device creation helper
Date: Tue, 11 Feb 2025 18:28:03 +0100
Message-ID: <20250211-aux-device-create-helper-v3-6-7edb50524909@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2845; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=yh1X3NdDCdUsA9BLxtXchkn9/M7vIhxyVwRqzsjlThI=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnq4g60PKNni6dfU5BjvUnV/GlJm8Z/Gp+nsWrU
 9ZnwgOS2NiJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ6uIOgAKCRDm/A8cN/La
 hbC0EACdDyfv4ruNFNCmp9zrJN9GhUKhduy0uDZfmX9xFwkj19yNB791PVovwlCxBtsVN+6iC4q
 rwLI3P4vdZ1EwlqCmVrmNdGoLnghwRNHwHALo5QxefOPT4NljAxW1vZtixroQfv2C49vYyO6W4P
 kJzYPrSQ5gCAhV9vK40Lrk3hKz6idlpK6fP6E452DnIlVkMEuBRhoWIYcW3UYiHeM8GZVGnhBCD
 gSJilnljJ5OTQH+GOh4JJ+ljp3eDNfLB8W4KHF0CAyQTUEMe8AcjK03WlL/wYkVKOkgcGkEcQp9
 BIY3F82Fe2CRnNyNNI0avHJK4Dow3qn7iDNJJpC3ovn48iYglF/d0jXmcEMhXhQpSbeKMeTqa7J
 fP6G9puoFGrvGncXPPVDyslRM/0C+t+9jrKuXcFKpUC6JEFDzD6J5ZEVwY4UiSURMnLq30q2O/b
 Ji2uLCAtXuMOhYX2lnsQA5d17uDRDdwUJp8XCH4Oz6Dnb2S55Fsz9tvBGlSUODkUiKV8l+xyrVc
 1dbrvgTF+WDlDaLoybOYZRNVsuxR6nnuPg843dEMXQ4KBAAvubECmtqd3Rp4YaM5ppqsxBeoFzV
 cuZaX5kv0Po8QUX3SAVM7K3Fpx7ZYg1fo5142KlYv+iDGalSNmwxlsLmgMTIAr8JL2LCqw+Y9jn uIY7Dp1qPMaPorQ==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp; fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Content-Transfer-Encoding: 8bit

The auxiliary device creation of this driver is simple enough to
use the available auxiliary device creation helper.

Use it and remove some boilerplate code.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/imx/clk-imx8mp-audiomix.c | 56 ++++-------------------------------
 1 file changed, 6 insertions(+), 50 deletions(-)

diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-imx8mp-audiomix.c
index c409fc7e061869988f83c7df3ef7860500426323..988a5fffeb4e0e481ec57038d9d1f1b43432fc98 100644
--- a/drivers/clk/imx/clk-imx8mp-audiomix.c
+++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
@@ -228,64 +228,20 @@ struct clk_imx8mp_audiomix_priv {
 	struct clk_hw_onecell_data clk_data;
 };
 
-#if IS_ENABLED(CONFIG_RESET_CONTROLLER)
-
-static void clk_imx8mp_audiomix_reset_unregister_adev(void *_adev)
-{
-	struct auxiliary_device *adev = _adev;
-
-	auxiliary_device_delete(adev);
-	auxiliary_device_uninit(adev);
-}
-
-static void clk_imx8mp_audiomix_reset_adev_release(struct device *dev)
+static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev)
 {
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
-	if (!adev)
-		return -ENOMEM;
-
-	adev->name = "reset";
-	adev->dev.parent = dev;
-	adev->dev.release = clk_imx8mp_audiomix_reset_adev_release;
-
-	ret = auxiliary_device_init(adev);
-	if (ret)
-		return ret;
-
-	ret = auxiliary_device_add(adev);
-	if (ret) {
-		auxiliary_device_uninit(adev);
-		return ret;
-	}
-
-	return devm_add_action_or_reset(dev, clk_imx8mp_audiomix_reset_unregister_adev,
-					no_free_ptr(adev));
-}
-
-#else /* !CONFIG_RESET_CONTROLLER */
+	adev = devm_auxiliary_device_create(dev, "reset", NULL, 0);
+	if (IS_ERR_OR_NULL(adev))
+		return PTR_ERR(adev);
 
-static int clk_imx8mp_audiomix_reset_controller_register(struct device *dev,
-							 struct clk_imx8mp_audiomix_priv *priv)
-{
 	return 0;
 }
 
-#endif /* !CONFIG_RESET_CONTROLLER */
-
 static void clk_imx8mp_audiomix_save_restore(struct device *dev, bool save)
 {
 	struct clk_imx8mp_audiomix_priv *priv = dev_get_drvdata(dev);
@@ -408,7 +364,7 @@ static int clk_imx8mp_audiomix_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_clk_register;
 
-	ret = clk_imx8mp_audiomix_reset_controller_register(dev, priv);
+	ret = clk_imx8mp_audiomix_reset_controller_register(dev);
 	if (ret)
 		goto err_clk_register;
 

-- 
2.45.2


