Return-Path: <linux-mips+bounces-9256-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD135AD5612
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 14:54:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C6B53A50BA
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 12:54:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8194E28640D;
	Wed, 11 Jun 2025 12:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="JL0yfBlE"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6086A283CAC
	for <linux-mips@vger.kernel.org>; Wed, 11 Jun 2025 12:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749646462; cv=none; b=ZReUrRrFtbL+kwWkmWBkGDBQLfIRtFxpbSG9HOumhdTg9/M9DjhiPkEE7cmfzt+GoG26eeKMgOHP00vXfBFcuXRVuVbWOQvISv52wC0wt6ZBHM1G6mWGGUNCxxfSiyi9NxUCR/n1/g4jkXPb/3O+spNiogEtqqNrVE7Z6+H3B6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749646462; c=relaxed/simple;
	bh=huEY8ThqIGGefkr+NwFuL0lRYACFVhJDRBYG4OTx8VY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VcvdqcRrIkxaSWfUTRQHUOmZfxwTAbQ+wXjpjmGYKwblk2VSfPj8iuFEVKsL0CeavF8C5pb88JykXaZJPf9NCchhz6tzOPzKIetGY0jgpWjyrsgy5UWva9nKggCtIfxbmF96N0Zu8bbKvxuEgi1NFfjnVG3Ls9PZmKFbjX+ogSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=JL0yfBlE; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso56771675e9.2
        for <linux-mips@vger.kernel.org>; Wed, 11 Jun 2025 05:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749646459; x=1750251259; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KdZFjl2fccvj0QADc8xzOcmXiXilDJiFfw1wc4K1F9g=;
        b=JL0yfBlE8SFZkGTxO9+B5b02EO2HNe+V2TM+L02MzMqeE3jx8XUD8iK8W7iYspt+Tc
         B7ri9gRSs93wiM4plxIkmdfqRvERhWYBCpFP4W7PfD1XrNL8Ma3tTuEFKhLO9Z/5cO9d
         PEwMImk2DtDCW9+wrd0/gz8CtKvl8Yl0Vq1pbbdkOEipg5llHrasO8iwYILA+43iXC9S
         F+4C2yNbdeBi54oIVqxcoWBY68zUJ1yN2GlfrKEoMfcCRPdpO7jGRCc2j3Lc82lGcgNy
         HkSe0S3mtrHH4t+N6Gnmf8g+rvN3XcOwWw8Q0b0QjedVg7JBHf10ZRk2xozM+bVFe8rM
         9U4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646459; x=1750251259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KdZFjl2fccvj0QADc8xzOcmXiXilDJiFfw1wc4K1F9g=;
        b=ayun5FIWb+4WHUpbOUb8SChxq4/23bTyp1GrAAUsO9IDED2exTb4785eMTJPSRIm6q
         IIUB4A9F6SzWzRY93VcvOqJRfEDnUllNSb4/mxo8YhkpfFXql4YB06qVC/Es/DM5Bh7C
         U7KztAX75ug2hMFGJ81wIMx6Beuq1gcs/eZNAC5bpXxAESpDlz2oM6cQNpMoAgL00arq
         tR2VUaMjt9xr0gCl3DKaso/nwWJ3csxx+/awHqdCnIQN+grgF8TpINYdOXHLwqcuKi2n
         JOO1xPkhQxyQ10Q6n7qz20omNjGm8gHK1xowXui4qYWi/lWV3zs/yn2fYAvgdrfE922E
         70SQ==
X-Gm-Message-State: AOJu0YzASR1iIQU+arSIHsc5ZY4wrz/zrRfY5+DtV/DFlTrAPZqAPvPw
	SNtwSRWnckSZLZQIaemxI4SotrT6vgnTjL6s5JCVN2czWXrClfFfvCVRle2a28HlSVo=
X-Gm-Gg: ASbGncvnyNOB5Qt14VwKDeFHmYPj0WFme1FeZodq/fFEPUm9CVvtPEp4UO4+EsSMtl7
	1tsSUFctEqA4PyfZe+12sH0+wzeFWzqjgu1wZA0nwr6FxEk+/zUdM/j+hdikR07pslxK01M+eIv
	ZTn0/My4++oCjVeVhF3A89hwW72q56s9fMkb+s19LmqAOW+JJPc2yBe6W2wnong7RmghleqejsY
	Et4bpX3GcrsaRna4zjuxiAOgDB3zQWTJb/m+Ye26N84WghaxLT+aGcYmQ8yeMjxUxcmC+rX9jmd
	/LjNsqzFF7y1zAPito7WIfqIOhMUvoeAJPQFTPdNtOvBkesPZ42qjDZzUuaT+JuhR9UW2bKybY9
	S
X-Google-Smtp-Source: AGHT+IFwVwM1VBdaMyjnvhb9KUvhpjuoSTMLyxFLI5Ds1mjnS+Tvk4Fdx9g7hYxsolgprYuijG/Grg==
X-Received: by 2002:a05:600c:83c6:b0:442:ccf0:41e6 with SMTP id 5b1f17b1804b1-45324879755mr33205135e9.3.1749646458645;
        Wed, 11 Jun 2025 05:54:18 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:8ef3:a82f:ccaa:91b5])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a53245275esm15225486f8f.76.2025.06.11.05.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:54:18 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 11 Jun 2025 14:53:59 +0200
Subject: [PATCH 4/4] clk: amlogic: axg-audio: use the auxiliary reset
 driver
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-clk-aux-v1-4-fb6575ed86a7@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5930; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=huEY8ThqIGGefkr+NwFuL0lRYACFVhJDRBYG4OTx8VY=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoSXx0TIJvPb4pFL/m7UQSR8q8Mbmnm6OXPs6eY
 BlR75emBm6JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaEl8dAAKCRDm/A8cN/La
 hYBdD/4q4nR6sR3pGrG2npIFVDhtrUeD2xlhg3MU+t88JlBrPmoOz41y1Wf/bedDpP/faKO/bBr
 TOoSV5jth7KOZPGgyHqDPHAsKRsHJbhqNCunHDD2lrgPZ1G5sFpWda3g4iTBjdRcQA/hejB/ms+
 k5kKyGyh2k5q+aslEn26t+PeUGNpnURdMTXra3MoWA5iNFxnRyBwh/kYcv/SxH7xOvYdjSuuQ8E
 3O/rX23FNPho4XyEsvHCxK6eNI8G/drzYrSTR7x0ho6tYHGXQyO8kiVyz6X4VNpDaxSjhFZgtVs
 27d3xyfPLL9D3gANvpytNJ2TDCZsxI/bnxBzvX3PWBNnqFEsMtzQL3AbbDXmszrQ7KZoWmYGgIr
 kol4jbVM1bYwt1uW7lFipMrRLaPUOBp0ZgU8cEXKBdjBEbvBTNPYPiONQgGcjLC5wORPH0Tx/bX
 EOgo9478Bt3rTMhrDtnvInIoRkS/hWafp/2eyaerWzpsG2CT7gPmDEgGPCFYpEeDbmxUgFSDaPu
 gaPRwD8xreYmjOVrY8ouBs8ZP5hRfRPj99j8QNqli0LMOWUgollWYlxxCg176YGEd1Ahlod6wdZ
 VlYbRSa049s3x8nrmijC9a0qHqGHNlDHhkm9JTN8P+uDvgj4y+wuGe+UNy3WC/9xpve12kAEbiW
 Zd2BjFIZ3ZYGjVA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Remove the implementation of the reset driver in axg audio
clock driver and migrate to the one provided by reset framework
on the auxiliary bus.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/Kconfig     |   3 +-
 drivers/clk/meson/axg-audio.c | 114 +++++-------------------------------------
 2 files changed, 15 insertions(+), 102 deletions(-)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index ff003dc5ab20d904c91fc34c701ba499a11d0b63..5c669b2e2f268c7608c8d9c64bba3c5b54da39b2 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -106,7 +106,8 @@ config COMMON_CLK_AXG_AUDIO
 	select COMMON_CLK_MESON_SCLK_DIV
 	select COMMON_CLK_MESON_CLKC_UTILS
 	select REGMAP_MMIO
-	select RESET_CONTROLLER
+	select AUXILIARY_BUS
+	imply RESET_MESON_AUX
 	help
 	  Support for the audio clock controller on AmLogic A113D devices,
 	  aka axg, Say Y if you want audio subsystem to work.
diff --git a/drivers/clk/meson/axg-audio.c b/drivers/clk/meson/axg-audio.c
index 9df627b142f89788966ede0262aaaf39e13f0b49..3948f5d0faca372dd5cc4ed6dc95f9c89fe5bae8 100644
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
+		if (!auxdev)
+			return -ENODEV;
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
2.47.2


