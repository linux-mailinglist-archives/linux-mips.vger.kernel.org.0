Return-Path: <linux-mips+bounces-7734-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 393D7A31312
	for <lists+linux-mips@lfdr.de>; Tue, 11 Feb 2025 18:30:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDCA7164AB7
	for <lists+linux-mips@lfdr.de>; Tue, 11 Feb 2025 17:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96ED3267B93;
	Tue, 11 Feb 2025 17:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Bf5vE+q+"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287CE267B9A
	for <linux-mips@vger.kernel.org>; Tue, 11 Feb 2025 17:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739294925; cv=none; b=EL73Pt2LoNS9r3MKIcnLwfb9+61aYSjKzxCqpFTSyp5vQicIl+alE+M+Cgq+dp2HHZdhO/aRaQquenN8M0vnzaDZ1Ba3g3nJ27M6rWrVPzdHMFHaOnXnmcQbP1bUVl21a9XTaDRC51JRCSyWwQ51XiEnB8mFqnF5GuKxzwT561w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739294925; c=relaxed/simple;
	bh=gtTXUBCRQBXsYqOe/++F6w9kWmBkT08mx5TkDgNzKIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KkgWg+x/0bu43ymtOQdBgc4LsRcSbqosP+adAvG/39f1TPKlN+Hw8vM7oh8KIRKdR8mz41kc1JG49H1y9FLma/fgpuKensjm+oqhmgqIFoSJ6XeIEeTPZXVaR7a8unJ4G/BJUqmI5+dd0KHnm3E1bWVnOPsuZHPN3zB9P7JkxeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Bf5vE+q+; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38dd93a6f0aso2178499f8f.0
        for <linux-mips@vger.kernel.org>; Tue, 11 Feb 2025 09:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739294921; x=1739899721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kX3ghmSADof/fdYKGzDtB/q8+rQu9IUcD4dmFIXduMs=;
        b=Bf5vE+q+TaB9apdWcW0z7yfuxvW2t8JRMueh6XaLnzbghBrKyPFI485w9QZiXbviZ/
         gMrT3wj0tEUFTBw7rsDs/g5G+Rhfu2U3hpz2X0XtgGWwNtEAOeSCi/74YBaH16j0otxW
         CqbLVIJMDqmzGbYKFOS5tBQieA0OQfVn3BZRff3MdzO2rvvxL9ZXg3sUxE3DnGNn3IHq
         cygNpCA1IKKWFf4zzl87yRT6puon0vHdZDtnotxNYp8zqjYk+ZFH1l+auFQILOQV8g0K
         fwiT1dGSosjTKZ381zcU6/Xj3ARxJL7d86gqoAAFlIUvNo7Z1McIKDD8JRiRmm5AE2jQ
         JlWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739294921; x=1739899721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kX3ghmSADof/fdYKGzDtB/q8+rQu9IUcD4dmFIXduMs=;
        b=DdaME9rbTp1xNbVg/Ja5LrjO/Itpo2mY68RUTNHVfhKTybzbPLdAKv3jEi8orIc9zL
         llk137KDJPYEl6AZGI9d79/ve5UHGLQAjG4c/KdspCs1tsu3bQSWDzKbJkimwHjluqWy
         6uJonQ2YWEjG2nFKpZUjN5CctVM9NLI64IpXBnOk1dpIC2iWlIBnTWB5l95aQ21uf9+3
         df/Y8ax9tHIEB8TZZQsngRqgCGOgX2amlC8M/IpqvzIRf9CKSje+2zBbXphmdI6O7MWX
         bE41DIE1UtPKjEP/18LwWR/FHdC+vgFIZ61QYv8wZpvcoHfTht9yzKClNVBIz+Nl6U2l
         lRSg==
X-Forwarded-Encrypted: i=1; AJvYcCVgWIKeCqor/flR6RBRxBNI0ARxAhFUgTvXa6E0nBQSIqWtwu0uVsWqIFbQH0YH25qEVogbHu/d+t1i@vger.kernel.org
X-Gm-Message-State: AOJu0YzAx9a+Kjf2EWNVkfTFogwMDTKX+D0u19LUP+xvzhTtnspppXcm
	WHejii6T3PYQlo0IqfSav/csZ5beJyiIFtZ/53Pxafx1sSuKcEl6k1T+UTWCjqU=
X-Gm-Gg: ASbGncu/hNjnn/nAY7uPJdoJ/0LLraCoQ/U5pWG5uPcA7I18tRQtvQ2NBOTA182Hob3
	wAysvNdv52hQwldp3sChtxqQbKKfuVFNwUBtbfOLcak6T9GHcDrua54q4p63aheY7DqREJDDQ1v
	m3+oIiEX8pxdz6JJ78UUlKFKSkbO8kQsTbcxENfYsnn5htgxS4QEKMAGRb+nvGI0lYH0630we/v
	MzNaI+t/3aSxmUGH1OBEFFtlri2gg43oUY6bubMz5UPUED7LKJdYnfCgnTp9IL+g0j+t68xl47O
	NxtDv7Yq3aY6LCbThQ==
X-Google-Smtp-Source: AGHT+IHNZKomgYXqcV4iueNtMWjdqrJCqK18R/l4YoIndkgvWwENIn/juV5TQLvLjyHtq/y8uwbzbg==
X-Received: by 2002:a05:6000:154d:b0:38d:e481:c680 with SMTP id ffacd0b85a97d-38de481c6d6mr3134750f8f.18.1739294921265;
        Tue, 11 Feb 2025 09:28:41 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:fc0c:6c04:7ae0:c5c2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dc6c80df2sm13691082f8f.18.2025.02.11.09.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 09:28:40 -0800 (PST)
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
Subject: [PATCH v3 7/7] clk: amlogic: axg-audio: use the auxiliary reset driver - take 2
Date: Tue, 11 Feb 2025 18:28:04 +0100
Message-ID: <20250211-aux-device-create-helper-v3-7-7edb50524909@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5921; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=TI3PyQ4RBlsYvn/3ym2zOR51oxwz92ZVC/TIhelLgEk=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnq4g7rK2qbvDSMWo7y7IKYVc4VNag+NKBkBwBX
 7AivAacwaKJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ6uIOwAKCRDm/A8cN/La
 hbzVD/0aQSeKG38/WN0LzdAbQTHjP8c2dJCCutKqih2e3zHr0RKjaYamy5oVuPOh498VVAmF9cn
 JeAalYPQoR3MZ8oiPIpwNYFmdLz9SdTLYUF+PKdNWbORrKgBWRKu2ivLUtegcvaJUMhHO5Ix5bG
 CrQz74Dt9ScsD6/j3QRGph2BODHh8TbsywwrMIS5K/urLzgDSwanjOPXFfQzQfbJMYU09h3YUDs
 e3xEkGsqD9aIqFiYJHTVPTMJ/+vbqp334Lqc9hnPqgNJcOoDO193NJiXYa1yVU95vo/72i38MBq
 3crANEecIqg7ti6Gz60LNk2WTZAFJ3gZqhxhQr/imfzRiZ7siLD3ZjmPJPZ1b4owNJscGsqQG2/
 PswDJyFP788jPnd1LdniQrVQWuYG5yUzBu7jJyinlYAY+MgUcgelAC9bt7VKJNydWJLWbheq1O1
 JVY2z1C35EIyV8hU1Gd4eAUofbzasGlOz8CjvwQrMAv+ip84NLLoqzvnvJGgRFm1igRtkHWw96X
 oHd1iR7mYoTUtOPuC+NQWLoZ7FhdSXsAbCawy/ai4kYIx0SwT/S8WQV+WfxcSxkir99fqoEjLso
 XAYvea00nIRJBgjfT5Kl03ruc1yRSK0CM6ZpO6eN7w1Kf14T+sfeD13r5XgO16wfSNJVWGktDas GH37TQ7hJz+6o9g==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp; fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
Content-Transfer-Encoding: 8bit

Remove the implementation of the reset driver in axg audio
clock driver and migrate to the one provided by reset framework
on the auxiliary bus.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 There has been a discussion about the use on imply here.
 After re-reading the documentation I've sticked with imply in this
 version:

 > This is useful e.g. with multiple drivers that want to indicate their
 > ability to hook into a secondary subsystem while allowing the user to
 > configure that subsystem out without also having to unset these drivers.

 IMO, this is a pretty accurate description of the use case in this change.

 The pitfall mentioned in the doc does not apply as there is not link error
 regardless of the config of RESET_MESON_AUX.

 I also think this is more readeable and maintainable than a bunch of
 'default CONFIG_FOO if CONFIG_FOO' for CONFIG_RESET_MESON_AUX. This approach
 also would have several pitfall, such as picking the value of the first config
 set or the config of RESET_MESON_AUX staying to 'n' if CONFIG_FOO is turned on
 with menuconfig.

 drivers/clk/meson/Kconfig     |   2 +-
 drivers/clk/meson/axg-audio.c | 114 +++++-------------------------------------
 2 files changed, 14 insertions(+), 102 deletions(-)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index be2e3a5f83363b07cdcec2601acf15780ff24892..7cb21fc223b063cb93812643f02f192343981ed8 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -106,7 +106,7 @@ config COMMON_CLK_AXG_AUDIO
 	select COMMON_CLK_MESON_SCLK_DIV
 	select COMMON_CLK_MESON_CLKC_UTILS
 	select REGMAP_MMIO
-	select RESET_CONTROLLER
+	imply RESET_MESON_AUX
 	help
 	  Support for the audio clock controller on AmLogic A113D devices,
 	  aka axg, Say Y if you want audio subsystem to work.
diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index 9df627b142f89788966ede0262aaaf39e13f0b49..6d798705c5fd1e6190192294783c955fc9be1e21 100644
--- a/drivers/clk/meson/axg-audio.c
+++ b/drivers/clk/meson/axg-audio.c
@@ -4,6 +4,7 @@
  * Author: Jerome Brunet <jbrunet@baylibre.com>
  */
 
+#include <linux/auxiliary_bus.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/init.h>
@@ -12,7 +13,6 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
-#include <linux/reset-controller.h>
 #include <linux/slab.h>
 
 #include "meson-clkc-utils.h"
@@ -1678,84 +1678,6 @@ static struct clk_regmap *const sm1_clk_regmaps[] = {
 	&sm1_earcrx_dmac_clk,
 };
 
-struct axg_audio_reset_data {
-	struct reset_controller_dev rstc;
-	struct regmap *map;
-	unsigned int offset;
-};
-
-static void axg_audio_reset_reg_and_bit(struct axg_audio_reset_data *rst,
-					unsigned long id,
-					unsigned int *reg,
-					unsigned int *bit)
-{
-	unsigned int stride = regmap_get_reg_stride(rst->map);
-
-	*reg = (id / (stride * BITS_PER_BYTE)) * stride;
-	*reg += rst->offset;
-	*bit = id % (stride * BITS_PER_BYTE);
-}
-
-static int axg_audio_reset_update(struct reset_controller_dev *rcdev,
-				unsigned long id, bool assert)
-{
-	struct axg_audio_reset_data *rst =
-		container_of(rcdev, struct axg_audio_reset_data, rstc);
-	unsigned int offset, bit;
-
-	axg_audio_reset_reg_and_bit(rst, id, &offset, &bit);
-
-	regmap_update_bits(rst->map, offset, BIT(bit),
-			assert ? BIT(bit) : 0);
-
-	return 0;
-}
-
-static int axg_audio_reset_status(struct reset_controller_dev *rcdev,
-				unsigned long id)
-{
-	struct axg_audio_reset_data *rst =
-		container_of(rcdev, struct axg_audio_reset_data, rstc);
-	unsigned int val, offset, bit;
-
-	axg_audio_reset_reg_and_bit(rst, id, &offset, &bit);
-
-	regmap_read(rst->map, offset, &val);
-
-	return !!(val & BIT(bit));
-}
-
-static int axg_audio_reset_assert(struct reset_controller_dev *rcdev,
-				unsigned long id)
-{
-	return axg_audio_reset_update(rcdev, id, true);
-}
-
-static int axg_audio_reset_deassert(struct reset_controller_dev *rcdev,
-				unsigned long id)
-{
-	return axg_audio_reset_update(rcdev, id, false);
-}
-
-static int axg_audio_reset_toggle(struct reset_controller_dev *rcdev,
-				unsigned long id)
-{
-	int ret;
-
-	ret = axg_audio_reset_assert(rcdev, id);
-	if (ret)
-		return ret;
-
-	return axg_audio_reset_deassert(rcdev, id);
-}
-
-static const struct reset_control_ops axg_audio_rstc_ops = {
-	.assert = axg_audio_reset_assert,
-	.deassert = axg_audio_reset_deassert,
-	.reset = axg_audio_reset_toggle,
-	.status = axg_audio_reset_status,
-};
-
 static struct regmap_config axg_audio_regmap_cfg = {
 	.reg_bits	= 32,
 	.val_bits	= 32,
@@ -1766,8 +1688,7 @@ struct audioclk_data {
 	struct clk_regmap *const *regmap_clks;
 	unsigned int regmap_clk_num;
 	struct meson_clk_hw_data hw_clks;
-	unsigned int reset_offset;
-	unsigned int reset_num;
+	const char *rst_drvname;
 	unsigned int max_register;
 };
 
@@ -1775,7 +1696,7 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	const struct audioclk_data *data;
-	struct axg_audio_reset_data *rst;
+	struct auxiliary_device *auxdev;
 	struct regmap *map;
 	void __iomem *regs;
 	struct clk_hw *hw;
@@ -1834,22 +1755,15 @@ static int axg_audio_clkc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	/* Stop here if there is no reset */
-	if (!data->reset_num)
-		return 0;
-
-	rst = devm_kzalloc(dev, sizeof(*rst), GFP_KERNEL);
-	if (!rst)
-		return -ENOMEM;
-
-	rst->map = map;
-	rst->offset = data->reset_offset;
-	rst->rstc.nr_resets = data->reset_num;
-	rst->rstc.ops = &axg_audio_rstc_ops;
-	rst->rstc.of_node = dev->of_node;
-	rst->rstc.owner = THIS_MODULE;
+	/* Register auxiliary reset driver when applicable */
+	if (data->rst_drvname) {
+		auxdev = __devm_auxiliary_device_create(dev, dev->driver->name,
+							data->rst_drvname, NULL, 0);
+		if (IS_ERR(auxdev))
+			return PTR_ERR(auxdev);
+	}
 
-	return devm_reset_controller_register(dev, &rst->rstc);
+	return 0;
 }
 
 static const struct audioclk_data axg_audioclk_data = {
@@ -1869,8 +1783,7 @@ static const struct audioclk_data g12a_audioclk_data = {
 		.hws = g12a_audio_hw_clks,
 		.num = ARRAY_SIZE(g12a_audio_hw_clks),
 	},
-	.reset_offset = AUDIO_SW_RESET,
-	.reset_num = 26,
+	.rst_drvname = "rst-g12a",
 	.max_register = AUDIO_CLK_SPDIFOUT_B_CTRL,
 };
 
@@ -1881,8 +1794,7 @@ static const struct audioclk_data sm1_audioclk_data = {
 		.hws = sm1_audio_hw_clks,
 		.num = ARRAY_SIZE(sm1_audio_hw_clks),
 	},
-	.reset_offset = AUDIO_SM1_SW_RESET0,
-	.reset_num = 39,
+	.rst_drvname = "rst-sm1",
 	.max_register = AUDIO_EARCRX_DMAC_CLK_CTRL,
 };
 

-- 
2.45.2


