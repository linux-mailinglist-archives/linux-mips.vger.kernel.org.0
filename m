Return-Path: <linux-mips+bounces-6587-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7198C9B7F25
	for <lists+linux-mips@lfdr.de>; Thu, 31 Oct 2024 16:53:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 009A31F229FA
	for <lists+linux-mips@lfdr.de>; Thu, 31 Oct 2024 15:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2D8D1B5ED4;
	Thu, 31 Oct 2024 15:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bHaux5D4"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE57713AA5F;
	Thu, 31 Oct 2024 15:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730389987; cv=none; b=UoUPgL0ZGywCNQj/MI6ovBJHUYkjnH7idP19E8GvG5m6amdm69mynvp3HLmp4TiTvRUaApVJkdKuBiBpTt7VhO1oYoWOJdmKXI1XZ7ysfUPLDenASf4oSHax/1BVrN5M9veBN4gGTmBXh+lHeHmmWB996lkhwE/1ZO7/XophhLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730389987; c=relaxed/simple;
	bh=942KXGk9KU2l6XngHmhM8TH1TqQhOAurPqvWY8iXuZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y2TnPLNsPiWblsPZjnLh12GPJxSjXEWYD1V54QAWM2barvvVYhT3h1FXpHJ68twOR1262KqQe/4Qf0FYfblhcVV49ilRWbAdvxVOqBFtawMjgkeKBglcxphWfn0K8F9tOCX+x5ar2gYQU+mk0NhJ1Fdd1HS5oXUM4/snoJhqLEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bHaux5D4; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BF0C51C000E;
	Thu, 31 Oct 2024 15:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730389982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sSwt+cxcfS7jbQKfYXSNlyiiZCMiLyAs/aVWPNKz9/A=;
	b=bHaux5D4f9ssnE+NEuS4PwONADFJuJiRO9RQsdOX5mZwtv0RqGUACgE0Bmcp+okEI7p0Su
	IlvaGbFQ3y+BEVP0YSqom7/lTbf+l2gRGhX/sul4dAvcHN1r9TThv76LNHi+HVbgOLoWYT
	MykS2Npbhm2Dy1v/RJ63PQrDnhSE7TbJFnq8F5qopb1w2EO8KX84ASAaIZUx/52XCw3fu8
	UHIhVlrqeI5t9fztlL5de7Kf81/fZ7P4es3tyj1vsH2GWrMLQkLtYry5dd4sXD9TDkIt/Z
	bAemGNrIHrpqso/Ng8K+clDrDGFNkV2X/iTbii9a8h07EHTTnMVUvMyDyDIg1w==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 31 Oct 2024 16:52:59 +0100
Subject: [PATCH 09/13] clk: eyeq: add EyeQ5 fixed factor clocks
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241031-mbly-clk-v1-9-89d8b28e3006@bootlin.com>
References: <20241031-mbly-clk-v1-0-89d8b28e3006@bootlin.com>
In-Reply-To: <20241031-mbly-clk-v1-0-89d8b28e3006@bootlin.com>
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
 drivers/clk/clk-eyeq.c | 92 ++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 90 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index dcd1d996255fc97449ac1bccb6a7c810d6e4c9db..6337736ef0ccb963fc16f66b1c78c33fdff0f99f 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -436,6 +436,86 @@ static const struct eqc_pll eqc_eyeq5_plls[] = {
 	{ .index = EQ5C_PLL_DDR1, .name = "pll-ddr1", .reg64 = 0x074 },
 };
 
+/* EQ5C_PLL_CPU children */
+#define EQ5C_CPU_OCC		17
+#define EQ5C_CPU_SI_CSS0	18
+#define EQ5C_CPU_CPC		19
+#define EQ5C_CPU_CM		20
+#define EQ5C_CPU_MEM		21
+#define EQ5C_CPU_OCC_ISRAM	22
+#define EQ5C_CPU_ISRAM		23
+#define EQ5C_CPU_OCC_DBU	24
+#define EQ5C_CPU_SI_DBU_TP	25
+
+/* EQ5C_PLL_VDI children */
+#define EQ5C_VDI_OCC_VDI	26
+#define EQ5C_VDI_VDI		27
+#define EQ5C_VDI_OCC_CAN_SER	28
+#define EQ5C_VDI_CAN_SER	29
+#define EQ5C_VDI_I2C_SER	30
+
+/* EQ5C_PLL_PER children */
+#define EQ5C_PER_PERIPH		31
+#define EQ5C_PER_CAN		32
+#define EQ5C_PER_SPI		33
+#define EQ5C_PER_I2C		34
+#define EQ5C_PER_TIMER		35
+#define EQ5C_PER_GPIO		36
+#define EQ5C_PER_EMMC		37
+#define EQ5C_PER_CCF		38
+#define EQ5C_PER_OCC_MJPEG	39
+#define EQ5C_PER_HSM		40
+#define EQ5C_PER_MJPEG		41
+#define EQ5C_PER_FCMU_A		42
+#define EQ5C_PER_OCC_PCI	43
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
@@ -451,7 +531,11 @@ static const struct eqc_early_match_data eqc_eyeq5_early_match_data __initconst
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
@@ -461,10 +545,14 @@ static const struct eqc_match_data eqc_eyeq5_match_data = {
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


