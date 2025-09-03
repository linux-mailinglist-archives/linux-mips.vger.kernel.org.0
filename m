Return-Path: <linux-mips+bounces-11011-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A670B41FF6
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 14:52:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6275A1BA7027
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 12:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA8F30E0F2;
	Wed,  3 Sep 2025 12:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KDCHjsqz"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66AD30DD34;
	Wed,  3 Sep 2025 12:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756903698; cv=none; b=P8RkXi0lX4D/qDSWRC3VT8mp5HLeIiph8ezzEQ4blu6GV9UAtbf3F0AgBIZXJOolpNRMkczJk2g7eTptLBruTcudz/bAj0nPzTZRfTsMGxWnl2PXrO6bfP5qh3+UirsOLbin+3TC0x+j4Egxx6j1zj9Ig7CoJMtKlJnKzSnzJCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756903698; c=relaxed/simple;
	bh=cqH0VxNb5n7kxL+3crRI7+cRuPrafE9H8Exy5gWNGZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q9bO97k0y1mYbP48O4H0icusEvemG0R4T2zK7zthYbQI8px9qMIZD2euiNZIge+LmvWuiqVzEDZq3qyFdH6Hfn6YpN/DL28MaMboiZscAekERvJ1zH1UeXuGfSrMD1wHdF+nRFHaGivbbh2e/qAlkkMNe1Apc7P2agK6vGvRf/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KDCHjsqz; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 37A474E40C0A;
	Wed,  3 Sep 2025 12:48:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 10C8F606C3;
	Wed,  3 Sep 2025 12:48:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E61C01C22D6E3;
	Wed,  3 Sep 2025 14:48:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756903693; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9DyI7fqJU5vfPrO1NrCHiyZ+Zl33oMOjd4I66nyHHWA=;
	b=KDCHjsqzqlPsp8N0CZmjWjfBpxCLf8bVRqKDtAYxdKIClcvSyoe/mcLiuAT7o/608D4KCi
	DxW/ukwX+Rc7ULCN4dtltj67anmHkFeAh9SzXJ7f/FhfyEqQBgozrAIHJoWwsDKYHIL2ma
	wE4e/TdR+nBOtXuIAXgPj3qzr5D6Hxdv+6hKqzMCZPW7Ch8Qs5Ke96Hz+oQ8jVNoz3LqVA
	Esc7UOCryEXzYT8owFvIYslIRRh0pTiErPgFW73N8TnnHN0irtX+yt3XEszWel15spGZ3Y
	NoBsZFkxI9GG6SotXNiD/P4g8Ba8ILWcgrtuYT/d7c0ikYlFmXYWK/acuSnMRg==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 03 Sep 2025 14:47:26 +0200
Subject: [PATCH 19/19] clk: eyeq: add eyeQ7H compatibles
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250903-clk-eyeq7-v1-19-3f5024b5d6e2@bootlin.com>
References: <20250903-clk-eyeq7-v1-0-3f5024b5d6e2@bootlin.com>
In-Reply-To: <20250903-clk-eyeq7-v1-0-3f5024b5d6e2@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Sari Khoury <sari.khoury@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3

Add the entries for the 14 Other Logic Blocks found in the eyeQ7H SoC. The
clock tree is more complex than the previous generation of SoC, as some
OLB depend on the clock output of other OLB instead of all referring to
the main oscillator.

The OLB south, east and west generate those reference clocks used by
other blocks. They also use the reference clock internally. To avoid
creating a reference loop, we register those reference clocks early then
refer to them at probe time. This is the same approach that is used for
the clocks of the eyeQ5 OLB. The reference clock provided by OLB south
is named "ref_100p0", "ref_106p6_e" by OLB east and "ref_106p6_w" by
OLB west.

For the OLB with a single parent clock, We use the same logic as the
blocks found in previous SoC and refer to it with the implied name
"ref".

The OLB with two parent clocks use the reference clock names provided
by the OLB south, east and west and the main oscillator as "ref".

The reset controllers found is 11 of the OLB are declared as auxiliary
device attached to the clock device.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/clk/clk-eyeq.c | 495 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 495 insertions(+)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index 8d5e194215e9d3d13b334a5ebf004499050e84b9..b9437003024fd0766fb1bd5d3e4916263f9cc854 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -824,6 +824,464 @@ static const struct eqc_match_data eqc_eyeq6h_acc_match_data = {
 	.reset_auxdev_name = "reset_acc",
 };
 
+/* Required early as reference for other PLL in OLB south */
+static const struct eqc_pll eqc_eyeq7h_south_early_plls[] = {
+	{ EQ7HC_SOUTH_PLL_100P0, "pll-100p0", 0x40, EQC_PLL_JFRACR },
+};
+
+static const struct eqc_fixed_factor eqc_eyeq7h_south_early_fixed_factors[] = {
+	{ EQ7HC_SOUTH_DIV_REF_100P0, "ref_100p0", 1, 48, EQ7HC_SOUTH_PLL_100P0 },
+};
+
+static const struct eqc_pll eqc_eyeq7h_south_plls[] = {
+	//{index, name, reg, type, parent}
+	{ EQ7HC_SOUTH_PLL_XSPI, "pll-xspi",  0x10, EQC_PLL_AINTP, "ref_100p0" },
+	{ EQ7HC_SOUTH_PLL_VDIO, "pll-vdio",  0x18, EQC_PLL_AINTP, "ref_100p0" },
+	{ EQ7HC_SOUTH_PLL_PER,  "pll-per-s", 0x20, EQC_PLL_AINTP, "ref_100p0" },
+};
+
+static const struct eqc_fixed_factor eqc_eyeq7h_south_fixed_factors[] = {
+	{ EQ7HC_SOUTH_DIV_VDO_DSI_SYS,    "vdo_dsi_sys",      1, 9,   EQ7HC_SOUTH_PLL_100P0,
+	  "pll-100p0" },
+	{ EQ7HC_SOUTH_DIV_PMA_CMN_REF,    "pma_cmn_ref",      1, 48,  EQ7HC_SOUTH_PLL_100P0,
+	  "pll-100p0" },
+	{ EQ7HC_SOUTH_DIV_REF_UFS,        "ref_ufs",          1, 250, EQ7HC_SOUTH_PLL_100P0,
+	  "pll-100p0" },
+	{ EQ7HC_SOUTH_DIV_XSPI_SYS,       "xspi_sys",         1, 8,   EQ7HC_SOUTH_PLL_XSPI },
+	{ EQ7HC_SOUTH_DIV_XSPI_MBITS,     "xspi_mbits",       1, 8,   EQ7HC_SOUTH_PLL_XSPI },
+	{ EQ7HC_SOUTH_DIV_NOC_S,          "noc_s",            1, 2,   EQ7HC_SOUTH_PLL_PER },
+	{ EQ7HC_SOUTH_DIV_PCIE_SYS,       "pcie_sys",         1, 4,   EQ7HC_SOUTH_PLL_PER },
+	{ EQ7HC_SOUTH_DIV_PCIE_SYS_MBITS, "pcie_sys_mbits",   1, 4,   EQ7HC_SOUTH_PLL_PER },
+	{ EQ7HC_SOUTH_DIV_PCIE_GBE_PHY,   "pcie_gbe_phy_apb", 1, 16,  EQ7HC_SOUTH_PLL_PER },
+	{ EQ7HC_SOUTH_DIV_UFS_CORE,       "ufs_core",         1, 8,   EQ7HC_SOUTH_PLL_PER },
+	{ EQ7HC_SOUTH_DIV_UFS_SMS,        "ufs_sms",          1, 5,   EQ7HC_SOUTH_PLL_PER },
+	{ EQ7HC_SOUTH_DIV_UFS_ROM_SMS,    "ufs_rom_sms",      1, 5,   EQ7HC_SOUTH_PLL_PER },
+	{ EQ7HC_SOUTH_DIV_ETH_SYS,        "eth_sys",          1, 8,   EQ7HC_SOUTH_PLL_PER },
+	{ EQ7HC_SOUTH_DIV_ETH_MBITS,      "eth_mbits",        1, 8,   EQ7HC_SOUTH_PLL_PER },
+	{ EQ7HC_SOUTH_DIV_CFG_S,          "cfg_s",            1, 8,   EQ7HC_SOUTH_PLL_PER },
+	{ EQ7HC_SOUTH_DIV_TSU,            "tsu",              1, 64,  EQ7HC_SOUTH_PLL_PER },
+	{ EQ7HC_SOUTH_DIV_VDIO,           "vdio",             1, 4,   EQ7HC_SOUTH_PLL_VDIO },
+	{ EQ7HC_SOUTH_DIV_VDIO_CORE,      "vdio_core",        1, 4,   EQ7HC_SOUTH_PLL_VDIO },
+	{ EQ7HC_SOUTH_DIV_VDIO_CORE_MBIT, "vdio_core_mbit",   1, 4,   EQ7HC_SOUTH_PLL_VDIO },
+	{ EQ7HC_SOUTH_DIV_VDO_CORE_MBITS, "vdo_core_mbits",   1, 4,   EQ7HC_SOUTH_PLL_VDIO },
+	{ EQ7HC_SOUTH_DIV_VDO_P,          "vdo_p",            1, 40,  EQ7HC_SOUTH_PLL_VDIO },
+	{ EQ7HC_SOUTH_DIV_VDIO_CFG,       "vdio_cfg",         1, 150, EQ7HC_SOUTH_PLL_VDIO },
+	{ EQ7HC_SOUTH_DIV_VDIO_TXCLKESC,  "vdio_txclkesc",    1, 8,   EQ7HC_SOUTH_PLL_VDIO },
+};
+
+static const struct eqc_early_match_data eqc_eyeq7h_south_early_match_data __initconst = {
+	.early_pll_count	= ARRAY_SIZE(eqc_eyeq7h_south_early_plls),
+	.early_plls		= eqc_eyeq7h_south_early_plls,
+
+	.early_fixed_factor_count	= ARRAY_SIZE(eqc_eyeq7h_south_early_fixed_factors),
+	.early_fixed_factors		= eqc_eyeq7h_south_early_fixed_factors,
+
+	.late_clk_count		= ARRAY_SIZE(eqc_eyeq7h_south_plls) +
+				  ARRAY_SIZE(eqc_eyeq7h_south_fixed_factors),
+};
+
+static const struct eqc_match_data eqc_eyeq7h_south_match_data = {
+	.pll_count	= ARRAY_SIZE(eqc_eyeq7h_south_plls),
+	.plls		= eqc_eyeq7h_south_plls,
+
+	.fixed_factor_count	= ARRAY_SIZE(eqc_eyeq7h_south_fixed_factors),
+	.fixed_factors		= eqc_eyeq7h_south_fixed_factors,
+
+	.reset_auxdev_name = "reset_south",
+
+	.early_clk_count = ARRAY_SIZE(eqc_eyeq7h_south_early_plls) +
+			   ARRAY_SIZE(eqc_eyeq7h_south_early_fixed_factors),
+};
+
+/* Required early as reference for other PLL in OLB east */
+static const struct eqc_pll eqc_eyeq7h_east_early_plls[] = {
+	{ EQ7HC_EAST_PLL_106P6, "pll-106p6-e", 0x0, EQC_PLL_JFRACR },
+};
+
+static const struct eqc_fixed_factor eqc_eyeq7h_east_early_fixed_factors[] = {
+	{ EQ7HC_EAST_DIV_REF_106P6, "ref_106p6_e", 1, 40, EQ7HC_EAST_PLL_106P6 },
+};
+
+static const struct eqc_pll eqc_eyeq7h_east_plls[] = {
+	//{index, name, reg, type, parent}
+	{ EQ7HC_EAST_PLL_NOC, "pll-noc-e", 0x30, EQC_PLL_AINTP, "ref_106p6_e" },
+	{ EQ7HC_EAST_PLL_ISP, "pll-isp",   0x38, EQC_PLL_AINTP, "ref_100p0" },
+	{ EQ7HC_EAST_PLL_VEU, "pll-veu",   0x40, EQC_PLL_AINTP, "ref_100p0" },
+};
+
+static const struct eqc_fixed_factor eqc_eyeq7h_east_fixed_factors[] = {
+	{ EQ7HC_EAST_DIV_REF_DDR_PHY, "ref_ddr_phy_e", 1, 2,  EQ7HC_EAST_PLL_106P6, "pll-106p6-e" },
+	{ EQ7HC_EAST_DIV_CORE,        "core_e",        1, 2,  EQ7HC_EAST_PLL_NOC },
+	{ EQ7HC_EAST_DIV_CORE_MBITS,  "core_mbits_e",  1, 2,  EQ7HC_EAST_PLL_NOC },
+	{ EQ7HC_EAST_DIV_ISRAM_MBITS, "isram_mbits_e", 1, 2,  EQ7HC_EAST_PLL_NOC },
+	{ EQ7HC_EAST_DIV_CFG,         "cfg_e",         1, 4,  EQ7HC_EAST_PLL_NOC },
+	{ EQ7HC_EAST_DIV_VEU_CORE,    "veu_core",      1, 4,  EQ7HC_EAST_PLL_VEU },
+	{ EQ7HC_EAST_DIV_VEU_MBITS,   "veu_mbits",     1, 4,  EQ7HC_EAST_PLL_VEU },
+	{ EQ7HC_EAST_DIV_VEU_OCP,     "veu_ocp",       1, 16, EQ7HC_EAST_PLL_VEU },
+	{ EQ7HC_EAST_DIV_LBITS,       "lbits_e",       1, 48, EQ7HC_EAST_PLL_ISP },
+	{ EQ7HC_EAST_DIV_ISP0_CORE,   "isp0_core",     1, 2,  EQ7HC_EAST_PLL_ISP },
+};
+
+static const struct eqc_early_match_data eqc_eyeq7h_east_early_match_data __initconst = {
+	.early_pll_count	= ARRAY_SIZE(eqc_eyeq7h_east_early_plls),
+	.early_plls		= eqc_eyeq7h_east_early_plls,
+
+	.early_fixed_factor_count	= ARRAY_SIZE(eqc_eyeq7h_east_early_fixed_factors),
+	.early_fixed_factors		= eqc_eyeq7h_east_early_fixed_factors,
+
+	.late_clk_count		= ARRAY_SIZE(eqc_eyeq7h_east_plls) +
+	ARRAY_SIZE(eqc_eyeq7h_east_fixed_factors),
+};
+
+static const struct eqc_match_data eqc_eyeq7h_east_match_data = {
+	.pll_count	= ARRAY_SIZE(eqc_eyeq7h_east_plls),
+	.plls		= eqc_eyeq7h_east_plls,
+
+	.fixed_factor_count	= ARRAY_SIZE(eqc_eyeq7h_east_fixed_factors),
+	.fixed_factors		= eqc_eyeq7h_east_fixed_factors,
+
+	.reset_auxdev_name = "reset_east",
+
+	.early_clk_count = ARRAY_SIZE(eqc_eyeq7h_east_early_plls) +
+	ARRAY_SIZE(eqc_eyeq7h_east_early_fixed_factors),
+};
+
+/* Required early as reference for other PLL in OLB west */
+static const struct eqc_pll eqc_eyeq7h_west_early_plls[] = {
+	{ EQ7HC_WEST_PLL_106P6, "pll-106p6-w", 0x0, EQC_PLL_JFRACR },
+};
+
+static const struct eqc_fixed_factor eqc_eyeq7h_west_early_fixed_factors[] = {
+	{ EQ7HC_WEST_DIV_REF_106P6, "ref_106p6_w", 1, 40, EQ7HC_WEST_PLL_106P6 },
+};
+
+static const struct eqc_pll eqc_eyeq7h_west_plls[] = {
+	//{index, name, reg, type, parent}
+	{ EQ7HC_WEST_PLL_NOC, "pll-noc-w", 0x30, EQC_PLL_AINTP, "ref_106p6_w" },
+	{ EQ7HC_WEST_PLL_GPU, "pll-gpu",   0x38, EQC_PLL_AINTP, "ref_100p0" },
+	{ EQ7HC_WEST_PLL_SSI, "pll-ssi",   0x40, EQC_PLL_AINTP, "ref_100p0" },
+};
+
+static const struct eqc_fixed_factor eqc_eyeq7h_west_fixed_factors[] = {
+	{ EQ7HC_WEST_DIV_GPU,            "gpu",            1, 2,  EQ7HC_WEST_PLL_GPU },
+	{ EQ7HC_WEST_DIV_GPU_MBITS,      "gpu_mbits",      1, 2,  EQ7HC_WEST_PLL_GPU },
+	{ EQ7HC_WEST_DIV_LBITS,          "lbits_w",        1, 40, EQ7HC_WEST_PLL_GPU },
+	{ EQ7HC_WEST_DIV_MIPS_TIMER,     "mips_timer",     1, 24, EQ7HC_WEST_PLL_SSI },
+	{ EQ7HC_WEST_DIV_SSI_CORE,       "ssi_core",       1, 2,  EQ7HC_WEST_PLL_SSI },
+	{ EQ7HC_WEST_DIV_SSI_CORE_MBITS, "ssi_core_mbits", 1, 2,  EQ7HC_WEST_PLL_SSI },
+	{ EQ7HC_WEST_DIV_SSI_ROM,        "ssi_rom",        1, 8,  EQ7HC_WEST_PLL_SSI },
+	{ EQ7HC_WEST_DIV_SSI_ROM_MBITS,  "ssi_rom_mbits",  1, 8,  EQ7HC_WEST_PLL_SSI },
+	{ EQ7HC_WEST_DIV_REF_DDR_PHY,    "ref_ddr_phy_w",  1, 2,  EQ7HC_WEST_PLL_106P6,
+	  "pll-106p6-w" },
+	{ EQ7HC_WEST_DIV_CORE,           "core_w",         1, 2,  EQ7HC_WEST_PLL_NOC },
+	{ EQ7HC_WEST_DIV_CORE_MBIT,      "core_mbit_w",    1, 2,  EQ7HC_WEST_PLL_NOC },
+	{ EQ7HC_WEST_DIV_CFG,            "cfg_w",          1, 4,  EQ7HC_WEST_PLL_NOC },
+	{ EQ7HC_WEST_DIV_CAU,            "cau_w",          1, 8,  EQ7HC_WEST_PLL_NOC },
+	{ EQ7HC_WEST_DIV_CAU_MBITS,      "cau_mbits_w",    1, 8,  EQ7HC_WEST_PLL_NOC },
+};
+
+static const struct eqc_early_match_data eqc_eyeq7h_west_early_match_data __initconst = {
+	.early_pll_count	= ARRAY_SIZE(eqc_eyeq7h_west_early_plls),
+	.early_plls		= eqc_eyeq7h_west_early_plls,
+
+	.early_fixed_factor_count	= ARRAY_SIZE(eqc_eyeq7h_west_early_fixed_factors),
+	.early_fixed_factors		= eqc_eyeq7h_west_early_fixed_factors,
+
+	.late_clk_count		= ARRAY_SIZE(eqc_eyeq7h_west_plls) +
+				  ARRAY_SIZE(eqc_eyeq7h_west_fixed_factors),
+};
+
+static const struct eqc_match_data eqc_eyeq7h_west_match_data = {
+	.pll_count	= ARRAY_SIZE(eqc_eyeq7h_west_plls),
+	.plls		= eqc_eyeq7h_west_plls,
+
+	.fixed_factor_count	= ARRAY_SIZE(eqc_eyeq7h_west_fixed_factors),
+	.fixed_factors		= eqc_eyeq7h_west_fixed_factors,
+
+	.reset_auxdev_name = "reset_west",
+
+	.early_clk_count = ARRAY_SIZE(eqc_eyeq7h_west_early_plls) +
+			   ARRAY_SIZE(eqc_eyeq7h_west_early_fixed_factors),
+};
+
+static const struct eqc_pll eqc_eyeq7h_periph_east_plls[] = {
+	//{index, name, reg, type, parent}
+	{ EQ7HC_PERIPH_EAST_PLL_PER, "pll-periph_east_per", 0x0, EQC_PLL_AINTP },
+};
+
+static const struct eqc_fixed_factor eqc_eyeq7h_periph_east_fixed_factors[] = {
+	{ EQ7HC_PERIPH_EAST_DIV_PER, "periph_e", 1, 10, EQ7HC_PERIPH_EAST_PLL_PER },
+};
+
+static const struct eqc_match_data eqc_eyeq7h_periph_east_match_data = {
+	.pll_count	= ARRAY_SIZE(eqc_eyeq7h_periph_east_plls),
+	.plls		= eqc_eyeq7h_periph_east_plls,
+
+	.fixed_factor_count	= ARRAY_SIZE(eqc_eyeq7h_periph_east_fixed_factors),
+	.fixed_factors		= eqc_eyeq7h_periph_east_fixed_factors,
+
+	.reset_auxdev_name = "reset_periph_east",
+};
+
+static const struct eqc_pll eqc_eyeq7h_periph_west_plls[] = {
+	//{index, name, reg, type, parent}
+	{ EQ7HC_PERIPH_WEST_PLL_PER, "pll-periph_west_per", 0x0, EQC_PLL_AINTP, "ref_100p0" },
+	{ EQ7HC_PERIPH_WEST_PLL_I2S, "pll-periph_west_i2s", 0x4, EQC_PLL_AINTP, "ref_106p6_w" },
+};
+
+static const struct eqc_fixed_factor eqc_eyeq7h_periph_west_fixed_factors[] = {
+	{ EQ7HC_PERIPH_WEST_DIV_PER, "periph_w",         1, 10, EQ7HC_PERIPH_WEST_PLL_PER },
+	{ EQ7HC_PERIPH_WEST_DIV_I2S, "periph_i2s_ser_w", 1, 100, EQ7HC_PERIPH_WEST_PLL_I2S },
+};
+
+static const struct eqc_match_data eqc_eyeq7h_periph_west_match_data = {
+	.pll_count	= ARRAY_SIZE(eqc_eyeq7h_periph_west_plls),
+	.plls		= eqc_eyeq7h_periph_west_plls,
+
+	.fixed_factor_count	= ARRAY_SIZE(eqc_eyeq7h_periph_west_fixed_factors),
+	.fixed_factors		= eqc_eyeq7h_periph_west_fixed_factors,
+
+	.reset_auxdev_name = "reset_periph_west",
+};
+
+static const struct clk_div_table eqc_eyeq7h_ddr_apb_div_table[] = {
+	{ .val = 0, .div = 8 },
+	{ .val = 1, .div = 128 },
+	{ .val = 0, .div = 0 },
+};
+
+static const struct clk_div_table eqc_eyeq7h_ddr_ref_div_table[] = {
+	{ .val = 0, .div = 2 },
+	{ .val = 1, .div = 8 },
+	{ .val = 0, .div = 0 },
+};
+
+static const struct clk_div_table eqc_eyeq7h_ddr_dfi_div_table[] = {
+	{ .val = 0, .div = 2 },
+	{ .val = 1, .div = 32 },
+	{ .val = 0, .div = 0 },
+};
+
+static const struct eqc_div eqc_eyeq7h_ddr0_divs[] = {
+	{
+		.index = EQ7HC_DDR_DIV_APB,
+		.name = "div-ddr0_apb",
+		.parent_idx = EQ7HC_DDR_PLL,
+		.reg = 0x08,
+		.shift = 10,
+		.width = 1,
+		.table = eqc_eyeq7h_ddr_apb_div_table,
+	},
+	{
+		.index = EQ7HC_DDR_DIV_PLLREF,
+		.name = "div-ddr0_pllref",
+		.parent_idx = EQ7HC_DDR_PLL,
+		.reg = 0x08,
+		.shift = 10,
+		.width = 1,
+		.table = eqc_eyeq7h_ddr_ref_div_table,
+	},
+	{
+		.index = EQ7HC_DDR_DIV_DFI,
+		.name = "div-ddr0-dfi",
+		.parent_idx = EQ7HC_DDR_PLL,
+		.reg = 0x08,
+		.shift = 10,
+		.width = 1,
+		.table = eqc_eyeq7h_ddr_dfi_div_table,
+	},
+};
+
+static const struct eqc_pll eqc_eyeq7h_ddr0_plls[] = {
+	//{index, name, reg, type, parent}
+	{ EQ7HC_DDR_PLL, "pll-ddr0", 0x0, EQC_PLL_AINTP },
+};
+
+static const struct eqc_match_data eqc_eyeq7h_ddr0_match_data = {
+	.pll_count	= ARRAY_SIZE(eqc_eyeq7h_ddr0_plls),
+	.plls		= eqc_eyeq7h_ddr0_plls,
+
+	.div_count	= ARRAY_SIZE(eqc_eyeq7h_ddr0_divs),
+	.divs		= eqc_eyeq7h_ddr0_divs,
+
+	.reset_auxdev_name = "reset_ddr0",
+};
+
+static const struct eqc_div eqc_eyeq7h_ddr1_divs[] = {
+	{
+		.index = EQ7HC_DDR_DIV_APB,
+		.name = "div-ddr1_apb",
+		.parent_idx = EQ7HC_DDR_PLL,
+		.reg = 0x08,
+		.shift = 10,
+		.width = 1,
+		.table = eqc_eyeq7h_ddr_apb_div_table,
+	},
+	{
+		.index = EQ7HC_DDR_DIV_PLLREF,
+		.name = "div-ddr1_pllref",
+		.parent_idx = EQ7HC_DDR_PLL,
+		.reg = 0x08,
+		.shift = 10,
+		.width = 1,
+		.table = eqc_eyeq7h_ddr_ref_div_table,
+	},
+	{
+		.index = EQ7HC_DDR_DIV_DFI,
+		.name = "div-ddr1-dfi",
+		.parent_idx = EQ7HC_DDR_PLL,
+		.reg = 0x08,
+		.shift = 10,
+		.width = 1,
+		.table = eqc_eyeq7h_ddr_dfi_div_table,
+	},
+};
+
+static const struct eqc_pll eqc_eyeq7h_ddr1_plls[] = {
+	//{index, name, reg, type, parent}
+	{ EQ7HC_DDR_PLL, "pll-ddr1", 0x0, EQC_PLL_AINTP },
+};
+
+static const struct eqc_match_data eqc_eyeq7h_ddr1_match_data = {
+	.pll_count	= ARRAY_SIZE(eqc_eyeq7h_ddr1_plls),
+	.plls		= eqc_eyeq7h_ddr1_plls,
+
+	.div_count	= ARRAY_SIZE(eqc_eyeq7h_ddr1_divs),
+	.divs		= eqc_eyeq7h_ddr1_divs,
+
+	.reset_auxdev_name = "reset_ddr1",
+};
+
+static const struct eqc_pll eqc_eyeq7h_mips0_plls[] = {
+	{ EQ7HC_MIPS_PLL_CPU, "pll-cpu0", 0x0, EQC_PLL_AINTP },
+};
+
+static const struct eqc_fixed_factor eqc_eyeq7h_mips0_fixed_factors[] = {
+	{ EQ7HC_MIPS_DIV_CM, "mips0_cm", 1, 2, EQ7HC_MIPS_PLL_CPU },
+};
+
+static const struct eqc_match_data eqc_eyeq7h_mips0_match_data = {
+	.pll_count	= ARRAY_SIZE(eqc_eyeq7h_mips0_plls),
+	.plls		= eqc_eyeq7h_mips0_plls,
+
+	.fixed_factor_count	= ARRAY_SIZE(eqc_eyeq7h_mips0_fixed_factors),
+	.fixed_factors		= eqc_eyeq7h_mips0_fixed_factors,
+};
+
+static const struct eqc_pll eqc_eyeq7h_mips1_plls[] = {
+	{ EQ7HC_MIPS_PLL_CPU, "pll-cpu1", 0x0, EQC_PLL_AINTP },
+};
+
+static const struct eqc_fixed_factor eqc_eyeq7h_mips1_fixed_factors[] = {
+	{ EQ7HC_MIPS_DIV_CM, "mips1_cm", 1, 2, EQ7HC_MIPS_PLL_CPU },
+};
+
+static const struct eqc_match_data eqc_eyeq7h_mips1_match_data = {
+	.pll_count	= ARRAY_SIZE(eqc_eyeq7h_mips1_plls),
+	.plls		= eqc_eyeq7h_mips1_plls,
+
+	.fixed_factor_count	= ARRAY_SIZE(eqc_eyeq7h_mips1_fixed_factors),
+	.fixed_factors		= eqc_eyeq7h_mips1_fixed_factors,
+};
+
+static const struct eqc_pll eqc_eyeq7h_mips2_plls[] = {
+	{ EQ7HC_MIPS_PLL_CPU, "pll-cpu2", 0x0, EQC_PLL_AINTP },
+};
+
+static const struct eqc_fixed_factor eqc_eyeq7h_mips2_fixed_factors[] = {
+	{ EQ7HC_MIPS_DIV_CM, "mips2_cm", 1, 2, EQ7HC_MIPS_PLL_CPU },
+};
+
+static const struct eqc_match_data eqc_eyeq7h_mips2_match_data = {
+	.pll_count	= ARRAY_SIZE(eqc_eyeq7h_mips2_plls),
+	.plls		= eqc_eyeq7h_mips2_plls,
+
+	.fixed_factor_count	= ARRAY_SIZE(eqc_eyeq7h_mips2_fixed_factors),
+	.fixed_factors		= eqc_eyeq7h_mips2_fixed_factors,
+};
+
+static const struct eqc_pll eqc_eyeq7h_acc0_plls[] = {
+	//{index, name, reg, type, parent}
+	{ EQ7HC_ACC_PLL_VMP, "pll-acc0-vmp",     0x400, EQC_PLL_AINTP, "ref_100p0" },
+	{ EQ7HC_ACC_PLL_MPC, "pll-acc0-mpc",     0x404, EQC_PLL_AINTP, "ref_100p0" },
+	{ EQ7HC_ACC_PLL_PMA, "pll-acc0-pma",     0x408, EQC_PLL_AINTP, "ref_100p0" },
+	{ EQ7HC_ACC_PLL_NOC, "pll-acc0-noc-acc", 0x40c, EQC_PLL_AINTP, "ref_106p6_e" },
+};
+
+static const struct eqc_fixed_factor eqc_eyeq7h_acc0_fixed_factors[] = {
+	{ EQ7HC_ACC_DIV_PMA,   "acc0_pma",   1, 2, EQ7HC_ACC_PLL_PMA },
+	{ EQ7HC_ACC_DIV_NCORE, "acc0_ncore", 1, 2, EQ7HC_ACC_PLL_NOC },
+	{ EQ7HC_ACC_DIV_CFG,   "acc0_cfg",   1, 8, EQ7HC_ACC_PLL_NOC },
+};
+
+static const struct eqc_match_data eqc_eyeq7h_acc0_match_data = {
+	.pll_count	= ARRAY_SIZE(eqc_eyeq7h_acc0_plls),
+	.plls		= eqc_eyeq7h_acc0_plls,
+
+	.fixed_factor_count	= ARRAY_SIZE(eqc_eyeq7h_acc0_fixed_factors),
+	.fixed_factors		= eqc_eyeq7h_acc0_fixed_factors,
+
+	.reset_auxdev_name = "reset_acc0",
+};
+
+static const struct eqc_pll eqc_eyeq7h_acc1_plls[] = {
+	//{index, name, reg, type, parent}
+	{ EQ7HC_ACC_PLL_VMP, "pll-acc1-vmp",     0x400, EQC_PLL_AINTP, "ref_100p0" },
+	{ EQ7HC_ACC_PLL_MPC, "pll-acc1-mpc",     0x404, EQC_PLL_AINTP, "ref_100p0" },
+	{ EQ7HC_ACC_PLL_PMA, "pll-acc1-pma",     0x408, EQC_PLL_AINTP, "ref_100p0" },
+	{ EQ7HC_ACC_PLL_NOC, "pll-acc1-noc-acc", 0x40c, EQC_PLL_AINTP, "ref_106p6_e" },
+};
+
+static const struct eqc_match_data eqc_eyeq7h_acc1_match_data = {
+	.pll_count	= ARRAY_SIZE(eqc_eyeq7h_acc1_plls),
+	.plls		= eqc_eyeq7h_acc1_plls,
+
+	.reset_auxdev_name = "reset_acc1",
+};
+
+static const struct eqc_pll eqc_eyeq7h_xnn0_plls[] = {
+	//{index, name, reg, type, parent}
+	{ EQ7HC_XNN_PLL_XNN0,  "pll-xnn0-0",     0x400, EQC_PLL_AINTP, "ref_100p0" },
+	{ EQ7HC_XNN_PLL_XNN1,  "pll-xnn0-1",     0x404, EQC_PLL_AINTP, "ref_100p0" },
+	{ EQ7HC_XNN_PLL_XNN2,  "pll-xnn0-2",     0x408, EQC_PLL_AINTP, "ref_100p0" },
+	{ EQ7HC_XNN_PLL_CLSTR, "pll-xnn0-clstr", 0x410, EQC_PLL_AINTP, "ref_106p6_e" },
+};
+
+static const struct eqc_fixed_factor eqc_eyeq7h_xnn0_fixed_factors[] = {
+	{ EQ7HC_XNN_DIV_XNN0,   "xnn0",        1, 2, EQ7HC_XNN_PLL_XNN0 },
+	{ EQ7HC_XNN_DIV_XNN1,   "xnn1",        1, 2, EQ7HC_XNN_PLL_XNN1 },
+	{ EQ7HC_XNN_DIV_XNN2,   "xnn2",        1, 2, EQ7HC_XNN_PLL_XNN2 },
+	{ EQ7HC_XNN_DIV_CLSTR,  "xnn0_clstr",  1, 2, EQ7HC_XNN_PLL_CLSTR },
+	{ EQ7HC_XNN_DIV_I2,     "xnn0_i2",     1, 4, EQ7HC_XNN_PLL_CLSTR },
+	{ EQ7HC_XNN_DIV_I2_SMS, "xnn0_i2_sms", 1, 4, EQ7HC_XNN_PLL_CLSTR },
+	{ EQ7HC_XNN_DIV_CFG,    "xnn0_cfg",    1, 8, EQ7HC_XNN_PLL_CLSTR },
+};
+
+static const struct eqc_match_data eqc_eyeq7h_xnn0_match_data = {
+	.pll_count	= ARRAY_SIZE(eqc_eyeq7h_xnn0_plls),
+	.plls		= eqc_eyeq7h_xnn0_plls,
+
+	.fixed_factor_count	= ARRAY_SIZE(eqc_eyeq7h_xnn0_fixed_factors),
+	.fixed_factors		= eqc_eyeq7h_xnn0_fixed_factors,
+
+	.reset_auxdev_name = "reset_xnn0",
+};
+
+static const struct eqc_pll eqc_eyeq7h_xnn1_plls[] = {
+	//{index, name, reg, type, parent}
+	{ EQ7HC_XNN_PLL_XNN0,  "pll-xnn1-0",     0x400, EQC_PLL_AINTP, "ref_100p0" },
+	{ EQ7HC_XNN_PLL_XNN1,  "pll-xnn1-1",     0x404, EQC_PLL_AINTP, "ref_100p0" },
+	{ EQ7HC_XNN_PLL_XNN2,  "pll-xnn1-2",     0x408, EQC_PLL_AINTP, "ref_100p0" },
+	{ EQ7HC_XNN_PLL_CLSTR, "pll-xnn1-clstr", 0x410, EQC_PLL_AINTP, "ref_106p6_e" },
+};
+
+static const struct eqc_match_data eqc_eyeq7h_xnn1_match_data = {
+	.pll_count	= ARRAY_SIZE(eqc_eyeq7h_xnn1_plls),
+	.plls		= eqc_eyeq7h_xnn1_plls,
+
+	.reset_auxdev_name = "reset_xnn1",
+};
+
 static const struct of_device_id eqc_match_table[] = {
 	{ .compatible = "mobileye,eyeq5-olb", .data = &eqc_eyeq5_match_data },
 	{ .compatible = "mobileye,eyeq6l-olb", .data = &eqc_eyeq6l_match_data },
@@ -833,6 +1291,22 @@ static const struct of_device_id eqc_match_table[] = {
 	{ .compatible = "mobileye,eyeq6h-ddr0-olb", .data = &eqc_eyeq6h_ddr0_match_data },
 	{ .compatible = "mobileye,eyeq6h-ddr1-olb", .data = &eqc_eyeq6h_ddr1_match_data },
 	{ .compatible = "mobileye,eyeq6h-acc-olb", .data = &eqc_eyeq6h_acc_match_data },
+	{ .compatible = "mobileye,eyeq7h-periph-west-olb",
+	  .data = &eqc_eyeq7h_periph_west_match_data },
+	{ .compatible = "mobileye,eyeq7h-periph-east-olb",
+	  .data = &eqc_eyeq7h_periph_east_match_data },
+	{ .compatible = "mobileye,eyeq7h-west-olb", .data = &eqc_eyeq7h_west_match_data },
+	{ .compatible = "mobileye,eyeq7h-east-olb", .data = &eqc_eyeq7h_east_match_data },
+	{ .compatible = "mobileye,eyeq7h-south-olb", .data = &eqc_eyeq7h_south_match_data },
+	{ .compatible = "mobileye,eyeq7h-mips0-olb", .data = &eqc_eyeq7h_mips0_match_data },
+	{ .compatible = "mobileye,eyeq7h-mips1-olb", .data = &eqc_eyeq7h_mips1_match_data },
+	{ .compatible = "mobileye,eyeq7h-mips2-olb", .data = &eqc_eyeq7h_mips2_match_data },
+	{ .compatible = "mobileye,eyeq7h-ddr0-olb", .data = &eqc_eyeq7h_ddr0_match_data },
+	{ .compatible = "mobileye,eyeq7h-ddr1-olb", .data = &eqc_eyeq7h_ddr1_match_data },
+	{ .compatible = "mobileye,eyeq7h-acc0-olb", .data = &eqc_eyeq7h_acc0_match_data },
+	{ .compatible = "mobileye,eyeq7h-acc1-olb", .data = &eqc_eyeq7h_acc1_match_data },
+	{ .compatible = "mobileye,eyeq7h-xnn0-olb", .data = &eqc_eyeq7h_xnn0_match_data },
+	{ .compatible = "mobileye,eyeq7h-xnn1-olb", .data = &eqc_eyeq7h_xnn1_match_data },
 	{}
 };
 
@@ -1004,3 +1478,24 @@ static void __init eqc_eyeq6h_west_early_init(struct device_node *np)
 }
 CLK_OF_DECLARE_DRIVER(eqc_eyeq6h_west, "mobileye,eyeq6h-west-olb",
 		      eqc_eyeq6h_west_early_init);
+
+static void __init eqc_eyeq7h_south_early_init(struct device_node *np)
+{
+	eqc_early_init(np, &eqc_eyeq7h_south_early_match_data);
+}
+CLK_OF_DECLARE_DRIVER(eqc_eyeq7h_south, "mobileye,eyeq7h-south-olb",
+		      eqc_eyeq7h_south_early_init);
+
+static void __init eqc_eyeq7h_east_early_init(struct device_node *np)
+{
+	eqc_early_init(np, &eqc_eyeq7h_east_early_match_data);
+}
+CLK_OF_DECLARE_DRIVER(eqc_eyeq7h_east, "mobileye,eyeq7h-east-olb",
+		      eqc_eyeq7h_east_early_init);
+
+static void __init eqc_eyeq7h_west_early_init(struct device_node *np)
+{
+	eqc_early_init(np, &eqc_eyeq7h_west_early_match_data);
+}
+CLK_OF_DECLARE_DRIVER(eqc_eyeq7h_west, "mobileye,eyeq7h-west-olb",
+		      eqc_eyeq7h_west_early_init);

-- 
2.51.0


