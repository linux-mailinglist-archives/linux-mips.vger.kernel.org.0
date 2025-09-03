Return-Path: <linux-mips+bounces-11007-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CD8B41FEB
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 14:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF6BB17C228
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 12:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D9B03093DF;
	Wed,  3 Sep 2025 12:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="n9RWs/Gw"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988713093CB;
	Wed,  3 Sep 2025 12:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756903689; cv=none; b=klrUeYdtdMx7St4wbYLVQpklM0RO0WpUk4OHxDcWVBejebyOrkYQo49u8sLlCcmk5AdD6XVbrDZDW4RYfmirUHBzc7gs7hNd+rgEkppen7AikjfyYDY424Qm+j9YibObSkiWSeQKTBEUV/FASykF0Yvt2Km8DAjghrXcBYW4//s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756903689; c=relaxed/simple;
	bh=ibQJG3yzlt3LNvhxoq6oseOsLckktboWe/oUHYYLRC4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F5bWLE5bMGy++SS881R7zItHtvEL+6qiSRjLRAqJpW6tFlB6/mmA3a8LRFHcKanuCHovOohjYfjuGxGmLxREQuyyZ/vCFX+yZzf8pag5PXFyW6LWc/YMmQ2htTpobx6yXZCfYpb3Ip0buuqEt4swOJTVu+4Ru38xMvbafTtNE3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=n9RWs/Gw; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4A5BB4E40C09;
	Wed,  3 Sep 2025 12:48:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 21230606C3;
	Wed,  3 Sep 2025 12:48:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 872C51C22DE01;
	Wed,  3 Sep 2025 14:48:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756903684; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dpAK/zu2XKNS6eGJFjWeRaO0v0/Xw6/7WiQfH/TyBKE=;
	b=n9RWs/Gw3UqUf9CzzaUIPw9BtWQXHpRb/KcL+6kma7/nl5pqldrhECAmqnjb4rvkGimvep
	exeKImtlfteD7cmtuMWOkuCzH7UFVxtWx77aVnu1rQU+CJ4f6oJjtPA/USXgSrJvEcHMFN
	wGm3wA4a2fMBNIHcR8dbehHaWuLNJIy8TrVoDKcCDjrz/rVGKzIBKc1/0KaWZ8RokZ0U0E
	ldDmWIz7b75JqSwlKDBO7EPL0l6lU3X72tdgRX7fYFPjrxyK30ARML5OqkaXJJGiCMFHKB
	T/1siUjymnRX3UFpDTT9wKm66oS+wd6Ow1NjGp3DU0pNerYXUWJjeYVxYD9vOg==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 03 Sep 2025 14:47:22 +0200
Subject: [PATCH 15/19] clk: eyeq: add a type for the PLL
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250903-clk-eyeq7-v1-15-3f5024b5d6e2@bootlin.com>
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

Add a type field to the eqc_pll structure and parse the registers of
the PLL depending on its type. This makes room for adding new PLL types
found in the eyeQ7H OLB.

Each PLL type now comes with its own registers parsing function that is
called based on the type.

For now, only the FRACG type is implemented.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/clk/clk-eyeq.c | 104 +++++++++++++++++++++++++++----------------------
 1 file changed, 57 insertions(+), 47 deletions(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index 0379fe7593453e72dd8983c743561caa385a3fbd..07a205fefd93eed8f9c2c6b88fbf5b8b6a39a92c 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -70,10 +70,15 @@
 #define FRACG_PCSR1_DOWN_SPREAD			BIT(11)
 #define FRACG_PCSR1_FRAC_IN			GENMASK(31, 12)
 
+enum eqc_pll_type {
+	EQC_PLL_FRACG,
+};
+
 struct eqc_pll {
-	unsigned int	index;
-	const char	*name;
-	unsigned int	reg;
+	unsigned int		index;
+	const char		*name;
+	unsigned int		reg;
+	enum eqc_pll_type	type;
 };
 
 /*
@@ -162,11 +167,17 @@ static void eqc_pll_downshift_factors(unsigned long *mult, unsigned long *div)
 	*div >>= shift;
 }
 
-static int eqc_pll_parse_registers(u32 r0, u32 r1, unsigned long *mult,
-				   unsigned long *div, unsigned long *acc)
+static int eqc_pll_parse_fracg(void __iomem *base, unsigned long *mult,
+			       unsigned long *div, unsigned long *acc)
 {
+	u64 val;
+	u32 r0, r1;
 	u32 spread;
 
+	val = readq(base);
+	r0 = val;
+	r1 = val >> 32;
+
 	if (r0 & FRACG_PCSR0_BYPASS) {
 		*mult = 1;
 		*div = 1;
@@ -225,6 +236,16 @@ static int eqc_pll_parse_registers(u32 r0, u32 r1, unsigned long *mult,
 	return 0;
 }
 
+static int eqc_parse_one_pll(void __iomem *base, enum eqc_pll_type type, unsigned long *mult,
+			     unsigned long *div, unsigned long *acc)
+{
+	switch (type) {
+	case EQC_PLL_FRACG:
+		return eqc_pll_parse_fracg(base, mult, div, acc);
+	}
+	return -EINVAL;
+}
+
 static void eqc_probe_init_plls(struct device *dev, const struct eqc_match_data *data,
 				void __iomem *base, struct clk_hw_onecell_data *cells)
 {
@@ -232,18 +253,12 @@ static void eqc_probe_init_plls(struct device *dev, const struct eqc_match_data
 	const struct eqc_pll *pll;
 	struct clk_hw *hw;
 	unsigned int i;
-	u32 r0, r1;
-	u64 val;
 	int ret;
 
 	for (i = 0; i < data->pll_count; i++) {
 		pll = &data->plls[i];
 
-		val = readq(base + pll->reg);
-		r0 = val;
-		r1 = val >> 32;
-
-		ret = eqc_pll_parse_registers(r0, r1, &mult, &div, &acc);
+		ret = eqc_parse_one_pll(base + pll->reg, pll->type, &mult, &div, &acc);
 		if (ret) {
 			dev_warn(dev, "failed parsing state of %s\n", pll->name);
 			cells->hws[pll->index] = ERR_PTR(ret);
@@ -422,19 +437,19 @@ static int eqc_probe(struct platform_device *pdev)
 
 /* Required early for GIC timer (pll-cpu) and UARTs (pll-per). */
 static const struct eqc_pll eqc_eyeq5_early_plls[] = {
-	{ .index = EQ5C_PLL_CPU, .name = "pll-cpu",  .reg = 0x02C },
-	{ .index = EQ5C_PLL_PER, .name = "pll-per",  .reg = 0x05C },
+	{ .index = EQ5C_PLL_CPU, .name = "pll-cpu",  .reg = 0x02C, .type = EQC_PLL_FRACG },
+	{ .index = EQ5C_PLL_PER, .name = "pll-per",  .reg = 0x05C, .type = EQC_PLL_FRACG },
 };
 
 static const struct eqc_pll eqc_eyeq5_plls[] = {
-	{ .index = EQ5C_PLL_VMP,  .name = "pll-vmp",  .reg = 0x034 },
-	{ .index = EQ5C_PLL_PMA,  .name = "pll-pma",  .reg = 0x03C },
-	{ .index = EQ5C_PLL_VDI,  .name = "pll-vdi",  .reg = 0x044 },
-	{ .index = EQ5C_PLL_DDR0, .name = "pll-ddr0", .reg = 0x04C },
-	{ .index = EQ5C_PLL_PCI,  .name = "pll-pci",  .reg = 0x054 },
-	{ .index = EQ5C_PLL_PMAC, .name = "pll-pmac", .reg = 0x064 },
-	{ .index = EQ5C_PLL_MPC,  .name = "pll-mpc",  .reg = 0x06C },
-	{ .index = EQ5C_PLL_DDR1, .name = "pll-ddr1", .reg = 0x074 },
+	{ .index = EQ5C_PLL_VMP,  .name = "pll-vmp",  .reg = 0x034, .type = EQC_PLL_FRACG },
+	{ .index = EQ5C_PLL_PMA,  .name = "pll-pma",  .reg = 0x03C, .type = EQC_PLL_FRACG },
+	{ .index = EQ5C_PLL_VDI,  .name = "pll-vdi",  .reg = 0x044, .type = EQC_PLL_FRACG },
+	{ .index = EQ5C_PLL_DDR0, .name = "pll-ddr0", .reg = 0x04C, .type = EQC_PLL_FRACG },
+	{ .index = EQ5C_PLL_PCI,  .name = "pll-pci",  .reg = 0x054, .type = EQC_PLL_FRACG },
+	{ .index = EQ5C_PLL_PMAC, .name = "pll-pmac", .reg = 0x064, .type = EQC_PLL_FRACG },
+	{ .index = EQ5C_PLL_MPC,  .name = "pll-mpc",  .reg = 0x06C, .type = EQC_PLL_FRACG },
+	{ .index = EQ5C_PLL_DDR1, .name = "pll-ddr1", .reg = 0x074, .type = EQC_PLL_FRACG },
 };
 
 enum {
@@ -562,10 +577,11 @@ static const struct eqc_match_data eqc_eyeq5_match_data = {
 };
 
 static const struct eqc_pll eqc_eyeq6l_plls[] = {
-	{ .index = EQ6LC_PLL_DDR, .name = "pll-ddr", .reg = 0x02C },
-	{ .index = EQ6LC_PLL_CPU, .name = "pll-cpu", .reg = 0x034 }, /* also acc */
-	{ .index = EQ6LC_PLL_PER, .name = "pll-per", .reg = 0x03C },
-	{ .index = EQ6LC_PLL_VDI, .name = "pll-vdi", .reg = 0x044 },
+	{ .index = EQ6LC_PLL_DDR, .name = "pll-ddr", .reg = 0x02C, .type = EQC_PLL_FRACG },
+	/* pll-cpu also for acc */
+	{ .index = EQ6LC_PLL_CPU, .name = "pll-cpu", .reg = 0x034, .type = EQC_PLL_FRACG },
+	{ .index = EQ6LC_PLL_PER, .name = "pll-per", .reg = 0x03C, .type = EQC_PLL_FRACG },
+	{ .index = EQ6LC_PLL_VDI, .name = "pll-vdi", .reg = 0x044, .type = EQC_PLL_FRACG },
 };
 
 static const struct eqc_match_data eqc_eyeq6l_match_data = {
@@ -580,7 +596,7 @@ static const struct eqc_match_data eqc_eyeq6h_west_match_data = {
 };
 
 static const struct eqc_pll eqc_eyeq6h_east_plls[] = {
-	{ .index = 0, .name = "pll-east", .reg = 0x074 },
+	{ .index = 0, .name = "pll-east", .reg = 0x074, .type = EQC_PLL_FRACG },
 };
 
 static const struct eqc_match_data eqc_eyeq6h_east_match_data = {
@@ -591,10 +607,10 @@ static const struct eqc_match_data eqc_eyeq6h_east_match_data = {
 };
 
 static const struct eqc_pll eqc_eyeq6h_south_plls[] = {
-	{ .index = EQ6HC_SOUTH_PLL_VDI,  .name = "pll-vdi",  .reg = 0x000 },
-	{ .index = EQ6HC_SOUTH_PLL_PCIE, .name = "pll-pcie", .reg = 0x008 },
-	{ .index = EQ6HC_SOUTH_PLL_PER,  .name = "pll-per",  .reg = 0x010 },
-	{ .index = EQ6HC_SOUTH_PLL_ISP,  .name = "pll-isp",  .reg = 0x018 },
+	{ .index = EQ6HC_SOUTH_PLL_VDI,  .name = "pll-vdi",  .reg = 0x000, .type = EQC_PLL_FRACG },
+	{ .index = EQ6HC_SOUTH_PLL_PCIE, .name = "pll-pcie", .reg = 0x008, .type = EQC_PLL_FRACG },
+	{ .index = EQ6HC_SOUTH_PLL_PER,  .name = "pll-per",  .reg = 0x010, .type = EQC_PLL_FRACG },
+	{ .index = EQ6HC_SOUTH_PLL_ISP,  .name = "pll-isp",  .reg = 0x018, .type = EQC_PLL_FRACG },
 };
 
 static const struct eqc_div eqc_eyeq6h_south_divs[] = {
@@ -641,7 +657,7 @@ static const struct eqc_match_data eqc_eyeq6h_south_match_data = {
 };
 
 static const struct eqc_pll eqc_eyeq6h_ddr0_plls[] = {
-	{ .index = 0, .name = "pll-ddr0", .reg = 0x074 },
+	{ .index = 0, .name = "pll-ddr0", .reg = 0x074, .type = EQC_PLL_FRACG },
 };
 
 static const struct eqc_match_data eqc_eyeq6h_ddr0_match_data = {
@@ -650,7 +666,7 @@ static const struct eqc_match_data eqc_eyeq6h_ddr0_match_data = {
 };
 
 static const struct eqc_pll eqc_eyeq6h_ddr1_plls[] = {
-	{ .index = 0, .name = "pll-ddr1", .reg = 0x074 },
+	{ .index = 0, .name = "pll-ddr1", .reg = 0x074, .type = EQC_PLL_FRACG },
 };
 
 static const struct eqc_match_data eqc_eyeq6h_ddr1_match_data = {
@@ -659,11 +675,11 @@ static const struct eqc_match_data eqc_eyeq6h_ddr1_match_data = {
 };
 
 static const struct eqc_pll eqc_eyeq6h_acc_plls[] = {
-	{ .index = EQ6HC_ACC_PLL_XNN, .name = "pll-xnn", .reg = 0x040 },
-	{ .index = EQ6HC_ACC_PLL_VMP, .name = "pll-vmp", .reg = 0x050 },
-	{ .index = EQ6HC_ACC_PLL_PMA, .name = "pll-pma", .reg = 0x05C },
-	{ .index = EQ6HC_ACC_PLL_MPC, .name = "pll-mpc", .reg = 0x068 },
-	{ .index = EQ6HC_ACC_PLL_NOC, .name = "pll-noc", .reg = 0x070 },
+	{ .index = EQ6HC_ACC_PLL_XNN, .name = "pll-xnn", .reg = 0x040, .type = EQC_PLL_FRACG },
+	{ .index = EQ6HC_ACC_PLL_VMP, .name = "pll-vmp", .reg = 0x050, .type = EQC_PLL_FRACG },
+	{ .index = EQ6HC_ACC_PLL_PMA, .name = "pll-pma", .reg = 0x05C, .type = EQC_PLL_FRACG },
+	{ .index = EQ6HC_ACC_PLL_MPC, .name = "pll-mpc", .reg = 0x068, .type = EQC_PLL_FRACG },
+	{ .index = EQ6HC_ACC_PLL_NOC, .name = "pll-noc", .reg = 0x070, .type = EQC_PLL_FRACG },
 };
 
 static const struct eqc_match_data eqc_eyeq6h_acc_match_data = {
@@ -697,7 +713,7 @@ builtin_platform_driver(eqc_driver);
 
 /* Required early for GIC timer. */
 static const struct eqc_pll eqc_eyeq6h_central_early_plls[] = {
-	{ .index = EQ6HC_CENTRAL_PLL_CPU, .name = "pll-cpu", .reg = 0x02C },
+	{ .index = EQ6HC_CENTRAL_PLL_CPU, .name = "pll-cpu", .reg = 0x02C, .type = EQC_PLL_FRACG },
 };
 
 static const struct eqc_fixed_factor eqc_eyeq6h_central_early_fixed_factors[] = {
@@ -714,7 +730,7 @@ static const struct eqc_early_match_data eqc_eyeq6h_central_early_match_data __i
 
 /* Required early for UART. */
 static const struct eqc_pll eqc_eyeq6h_west_early_plls[] = {
-	{ .index = EQ6HC_WEST_PLL_PER, .name = "pll-west", .reg = 0x074 },
+	{ .index = EQ6HC_WEST_PLL_PER, .name = "pll-west", .reg = 0x074, .type = EQC_PLL_FRACG },
 };
 
 static const struct eqc_fixed_factor eqc_eyeq6h_west_early_fixed_factors[] = {
@@ -769,14 +785,8 @@ static void __init eqc_early_init(struct device_node *np,
 		const struct eqc_pll *pll = &early_data->early_plls[i];
 		unsigned long mult, div, acc;
 		struct clk_hw *hw;
-		u32 r0, r1;
-		u64 val;
 
-		val = readq(base + pll->reg);
-		r0 = val;
-		r1 = val >> 32;
-
-		ret = eqc_pll_parse_registers(r0, r1, &mult, &div, &acc);
+		ret = eqc_parse_one_pll(base + pll->reg, pll->type, &mult, &div, &acc);
 		if (ret) {
 			pr_err("failed parsing state of %s\n", pll->name);
 			goto err;

-- 
2.51.0


