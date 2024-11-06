Return-Path: <linux-mips+bounces-6698-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E269BF29E
	for <lists+linux-mips@lfdr.de>; Wed,  6 Nov 2024 17:06:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25A57281F50
	for <lists+linux-mips@lfdr.de>; Wed,  6 Nov 2024 16:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 564EB20967E;
	Wed,  6 Nov 2024 16:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bFNf7IoA"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A58A20697C;
	Wed,  6 Nov 2024 16:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730909046; cv=none; b=frVb4b8BZk9Zm77AMJ+gPPSZBNl7d+faH8pAmXJUp5gfme4E6aleMyaaE6whonmvRsmQFTKN/R3vTj1F2R3o5dtge8ycMxYZo4XA9r6pO2CcvhHdYoCmsiDrxSTMNmAalYwAe260oY8xa5XcHG2OhJsU8d0kwvSaGOKWt67yTYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730909046; c=relaxed/simple;
	bh=ezivdMOwL56jx4hU3gMd+wcd99ZFYOZ2H3N8iScPe5M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZKgjdh7U4S4fE5TEXDcVo+zXfh+xmReMEu2lkwyO0XzcAuvvbsRyd+/SFvBO5woRNFGOAq242isT3wev+GMgtQV6f/yfTfO/7Q3XVqMpPy/jYtkRYEaWIdEcgsYqvTsQ2qC/xpsa3ueHFgWwb3vU8+Ma0ht7s5PW33QGy6zyeVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bFNf7IoA; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1AB1340014;
	Wed,  6 Nov 2024 16:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730909041;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5T4Fcf8pDe/s97a+8Luzm6fLDVba2rh+YE341LO5Rh8=;
	b=bFNf7IoAG9Faeos4HL8Ix7tzbq61ap2OqpU2vgHb6yTozkeIH+RZ654vzrSBi7Gw8rUOYb
	yS5Ub6PAAoRGWYY6lYm4eSJdTOHI5y4QG4iyXYTmAk4vZfgX+VtZkuh1/IduJdIpLWfpd2
	Wob6mcVom6eHKk9SQb1W1dPnIU313I5zsmE5N/L7f2mMXhlPLT6r1CjPct5ubOUtSqyuhl
	xEqhgqK/gEvCivMsxqUP0KV+D0g1ODaJdG1D3Ys11DctiokHyhAGIaJu5KhOQeYkLcddKZ
	SUUCnnrO7MOUvgdIwt2lX5hs+O6fDO9MozwQp6yVMZ+rQHlobzUQksGDNQF2sg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 06 Nov 2024 17:03:57 +0100
Subject: [PATCH v2 06/10] clk: eyeq: add EyeQ5 fixed factor clocks
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241106-mbly-clk-v2-6-84cfefb3f485@bootlin.com>
References: <20241106-mbly-clk-v2-0-84cfefb3f485@bootlin.com>
In-Reply-To: <20241106-mbly-clk-v2-0-84cfefb3f485@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: theo.lebrun@bootlin.com

Expose additional clocks on EyeQ5. Some indexes come from dt-bindings
headers, others are private to the driver.

Few clocks are early (of_clk_init() stage: core clocks and UART clock),
others can wait until platform device probe. The source for this list
is downstream Mobileye kernel and some internal documentation.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/clk/clk-eyeq.c | 96 ++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 94 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index 85beec6b5b46f2d3485042bf1aa3e395a29f84b1..542909085bcedb0f6b5b3cffbdb5761da9981cbc 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -436,6 +436,90 @@ static const struct eqc_pll eqc_eyeq5_plls[] = {
 	{ .index = EQ5C_PLL_DDR1, .name = "pll-ddr1", .reg64 = 0x074 },
 };
 
+enum {
+	/*
+	 * EQ5C_PLL_CPU children.
+	 * EQ5C_PER_OCC_PCI is the last clock exposed in dt-bindings.
+	 */
+	EQ5C_CPU_OCC = EQ5C_PER_OCC_PCI + 1,
+	EQ5C_CPU_SI_CSS0,
+	EQ5C_CPU_CPC,
+	EQ5C_CPU_CM,
+	EQ5C_CPU_MEM,
+	EQ5C_CPU_OCC_ISRAM,
+	EQ5C_CPU_ISRAM,
+	EQ5C_CPU_OCC_DBU,
+	EQ5C_CPU_SI_DBU_TP,
+
+	/*
+	 * EQ5C_PLL_VDI children.
+	 */
+	EQ5C_VDI_OCC_VDI,
+	EQ5C_VDI_VDI,
+	EQ5C_VDI_OCC_CAN_SER,
+	EQ5C_VDI_CAN_SER,
+	EQ5C_VDI_I2C_SER,
+
+	/*
+	 * EQ5C_PLL_PER children.
+	 */
+	EQ5C_PER_PERIPH,
+	EQ5C_PER_CAN,
+	EQ5C_PER_TIMER,
+	EQ5C_PER_CCF,
+	EQ5C_PER_OCC_MJPEG,
+	EQ5C_PER_HSM,
+	EQ5C_PER_MJPEG,
+	EQ5C_PER_FCMU_A,
+};
+
+static const struct eqc_fixed_factor eqc_eyeq5_early_fixed_factors[] = {
+	/* EQ5C_PLL_CPU children */
+	{ EQ5C_CPU_OCC,		"occ-cpu",	1, 1,	EQ5C_PLL_CPU },
+	{ EQ5C_CPU_SI_CSS0,	"si-css0",	1, 1,	EQ5C_CPU_OCC },
+	{ EQ5C_CPU_CORE0,	"core0",	1, 1,	EQ5C_CPU_SI_CSS0 },
+	{ EQ5C_CPU_CORE1,	"core1",	1, 1,	EQ5C_CPU_SI_CSS0 },
+	{ EQ5C_CPU_CORE2,	"core2",	1, 1,	EQ5C_CPU_SI_CSS0 },
+	{ EQ5C_CPU_CORE3,	"core3",	1, 1,	EQ5C_CPU_SI_CSS0 },
+
+	/* EQ5C_PLL_PER children */
+	{ EQ5C_PER_OCC,		"occ-periph",	1, 16,	EQ5C_PLL_PER },
+	{ EQ5C_PER_UART,	"uart",		1, 1,	EQ5C_PER_OCC },
+};
+
+static const struct eqc_fixed_factor eqc_eyeq5_fixed_factors[] = {
+	/* EQ5C_PLL_CPU children */
+	{ EQ5C_CPU_CPC,		"cpc",		1, 1,	EQ5C_CPU_SI_CSS0 },
+	{ EQ5C_CPU_CM,		"cm",		1, 1,	EQ5C_CPU_SI_CSS0 },
+	{ EQ5C_CPU_MEM,		"mem",		1, 1,	EQ5C_CPU_SI_CSS0 },
+	{ EQ5C_CPU_OCC_ISRAM,	"occ-isram",	1, 2,	EQ5C_PLL_CPU },
+	{ EQ5C_CPU_ISRAM,	"isram",	1, 1,	EQ5C_CPU_OCC_ISRAM },
+	{ EQ5C_CPU_OCC_DBU,	"occ-dbu",	1, 10,	EQ5C_PLL_CPU },
+	{ EQ5C_CPU_SI_DBU_TP,	"si-dbu-tp",	1, 1,	EQ5C_CPU_OCC_DBU },
+
+	/* EQ5C_PLL_VDI children */
+	{ EQ5C_VDI_OCC_VDI,	"occ-vdi",	1, 2,	EQ5C_PLL_VDI },
+	{ EQ5C_VDI_VDI,		"vdi",		1, 1,	EQ5C_VDI_OCC_VDI },
+	{ EQ5C_VDI_OCC_CAN_SER,	"occ-can-ser",	1, 16,	EQ5C_PLL_VDI },
+	{ EQ5C_VDI_CAN_SER,	"can-ser",	1, 1,	EQ5C_VDI_OCC_CAN_SER },
+	{ EQ5C_VDI_I2C_SER,	"i2c-ser",	1, 20,	EQ5C_PLL_VDI },
+
+	/* EQ5C_PLL_PER children */
+	{ EQ5C_PER_PERIPH,	"periph",	1, 1,	EQ5C_PER_OCC },
+	{ EQ5C_PER_CAN,		"can",		1, 1,	EQ5C_PER_OCC },
+	{ EQ5C_PER_SPI,		"spi",		1, 1,	EQ5C_PER_OCC },
+	{ EQ5C_PER_I2C,		"i2c",		1, 1,	EQ5C_PER_OCC },
+	{ EQ5C_PER_TIMER,	"timer",	1, 1,	EQ5C_PER_OCC },
+	{ EQ5C_PER_GPIO,	"gpio",		1, 1,	EQ5C_PER_OCC },
+	{ EQ5C_PER_EMMC,	"emmc-sys",	1, 10,	EQ5C_PLL_PER },
+	{ EQ5C_PER_CCF,		"ccf-ctrl",	1, 4,	EQ5C_PLL_PER },
+	{ EQ5C_PER_OCC_MJPEG,	"occ-mjpeg",	1, 2,	EQ5C_PLL_PER },
+	{ EQ5C_PER_HSM,		"hsm",		1, 1,	EQ5C_PER_OCC_MJPEG },
+	{ EQ5C_PER_MJPEG,	"mjpeg",	1, 1,	EQ5C_PER_OCC_MJPEG },
+	{ EQ5C_PER_FCMU_A,	"fcmu-a",	1, 20,	EQ5C_PLL_PER },
+	{ EQ5C_PER_OCC_PCI,	"occ-pci-sys",	1, 8,	EQ5C_PLL_PER },
+};
+
 static const struct eqc_div eqc_eyeq5_divs[] = {
 	{
 		.index = EQ5C_DIV_OSPI,
@@ -451,7 +535,11 @@ static const struct eqc_early_match_data eqc_eyeq5_early_match_data __initconst
 	.early_pll_count	= ARRAY_SIZE(eqc_eyeq5_early_plls),
 	.early_plls		= eqc_eyeq5_early_plls,
 
-	.late_clk_count		= ARRAY_SIZE(eqc_eyeq5_plls) + ARRAY_SIZE(eqc_eyeq5_divs),
+	.early_fixed_factor_count	= ARRAY_SIZE(eqc_eyeq5_early_fixed_factors),
+	.early_fixed_factors		= eqc_eyeq5_early_fixed_factors,
+
+	.late_clk_count		= ARRAY_SIZE(eqc_eyeq5_plls) + ARRAY_SIZE(eqc_eyeq5_divs) +
+				  ARRAY_SIZE(eqc_eyeq5_fixed_factors),
 };
 
 static const struct eqc_match_data eqc_eyeq5_match_data = {
@@ -461,10 +549,14 @@ static const struct eqc_match_data eqc_eyeq5_match_data = {
 	.div_count	= ARRAY_SIZE(eqc_eyeq5_divs),
 	.divs		= eqc_eyeq5_divs,
 
+	.fixed_factor_count	= ARRAY_SIZE(eqc_eyeq5_fixed_factors),
+	.fixed_factors		= eqc_eyeq5_fixed_factors,
+
 	.reset_auxdev_name = "reset",
 	.pinctrl_auxdev_name = "pinctrl",
 
-	.early_clk_count = ARRAY_SIZE(eqc_eyeq5_early_plls),
+	.early_clk_count = ARRAY_SIZE(eqc_eyeq5_early_plls) +
+			   ARRAY_SIZE(eqc_eyeq5_early_fixed_factors),
 };
 
 static const struct eqc_pll eqc_eyeq6l_plls[] = {

-- 
2.47.0


