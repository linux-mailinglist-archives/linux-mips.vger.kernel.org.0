Return-Path: <linux-mips+bounces-11006-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A2FB41FE0
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 14:51:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4177F5408B7
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 12:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E1863093A5;
	Wed,  3 Sep 2025 12:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="N2H2I/zY"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0349D3074AF;
	Wed,  3 Sep 2025 12:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756903686; cv=none; b=ZGP1SxAy8b4clsvDKfzQKnnrBoyXHDhy4cVu//AxN+4IPzIPWh3KkwLh1WaQR0S2qQVk2b3l0+AOWDBdLlEyc6u7z8JwNOMIAHT8IZLp5C2DSS9KoC+SGbss8YgCHnkDHlG8O+LdMXHp5xUEtpV2bxU84giiHix2ba6IDKDVpfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756903686; c=relaxed/simple;
	bh=EPqmwwZ0f90bOzU8V5eQYfHIX7JI0YJEm0PuKVv+4Pw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lN9x/wURblg1j91NVhxUretDxE8zMFaasV1I8oLR4PbBb9NDFxfSWlZBS9tzOd7awyuXhVdlYFnTOMXFhyqG8cg/FC/yk3VUvmiwQtFWr1vXW1D6WVIxzqzrhji4KT1uMLopIqxkKpnr2XMexS9LSr9CJqGxYJrz0OYpYsxaWJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=N2H2I/zY; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 838EB4E40C12;
	Wed,  3 Sep 2025 12:48:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5BF2E606C3;
	Wed,  3 Sep 2025 12:48:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A17131C22DDD0;
	Wed,  3 Sep 2025 14:48:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756903682; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DJ1DuDyv3KQPQ4Ddd0dIiiyvMJY53s+wrB6U+LwgtA0=;
	b=N2H2I/zY0L63M0PS1CHma/SUEbnQBdKalT5Xw4uZ/8DnzisuylKoi9gOsKNRvzHQWKY2eV
	CKjHzHvxDZaBQGVYs6/U9l37n57gVW5Jk/RAhlneqrPt3MqAt4RowKsYxpzSPfuiq6gUPm
	iKp9KBpE8f4JuUZVJ6wn3IsgoZitYYAUD3NnkBpT4kKofn5wB2/ELKGaWynEWcZS9Z2x23
	q64bdsR9Ao8ztNK7k0ZZe6teZvX/XaOEqKN0eMLvUlJHqQJHsoUAyDAHV+3V8Qrt6hBNWI
	E9Ks6dWzmEuFKsyplISPhHLD4xKK+u1th0w5l3gmonF8zAln9/xDOKKs4wat/g==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 03 Sep 2025 14:47:21 +0200
Subject: [PATCH 14/19] clk: eyeq: rename the reg64 field of eqc_pll
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250903-clk-eyeq7-v1-14-3f5024b5d6e2@bootlin.com>
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

Not all PLL types need a 64 bits access, make the field name more
generic by renaming it to reg.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/clk/clk-eyeq.c | 64 +++++++++++++++++++++++++-------------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index 63093a3099261e6798a6752651d25efa1b3e7592..0379fe7593453e72dd8983c743561caa385a3fbd 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -73,7 +73,7 @@
 struct eqc_pll {
 	unsigned int	index;
 	const char	*name;
-	unsigned int	reg64;
+	unsigned int	reg;
 };
 
 /*
@@ -239,7 +239,7 @@ static void eqc_probe_init_plls(struct device *dev, const struct eqc_match_data
 	for (i = 0; i < data->pll_count; i++) {
 		pll = &data->plls[i];
 
-		val = readq(base + pll->reg64);
+		val = readq(base + pll->reg);
 		r0 = val;
 		r1 = val >> 32;
 
@@ -422,19 +422,19 @@ static int eqc_probe(struct platform_device *pdev)
 
 /* Required early for GIC timer (pll-cpu) and UARTs (pll-per). */
 static const struct eqc_pll eqc_eyeq5_early_plls[] = {
-	{ .index = EQ5C_PLL_CPU, .name = "pll-cpu",  .reg64 = 0x02C },
-	{ .index = EQ5C_PLL_PER, .name = "pll-per",  .reg64 = 0x05C },
+	{ .index = EQ5C_PLL_CPU, .name = "pll-cpu",  .reg = 0x02C },
+	{ .index = EQ5C_PLL_PER, .name = "pll-per",  .reg = 0x05C },
 };
 
 static const struct eqc_pll eqc_eyeq5_plls[] = {
-	{ .index = EQ5C_PLL_VMP,  .name = "pll-vmp",  .reg64 = 0x034 },
-	{ .index = EQ5C_PLL_PMA,  .name = "pll-pma",  .reg64 = 0x03C },
-	{ .index = EQ5C_PLL_VDI,  .name = "pll-vdi",  .reg64 = 0x044 },
-	{ .index = EQ5C_PLL_DDR0, .name = "pll-ddr0", .reg64 = 0x04C },
-	{ .index = EQ5C_PLL_PCI,  .name = "pll-pci",  .reg64 = 0x054 },
-	{ .index = EQ5C_PLL_PMAC, .name = "pll-pmac", .reg64 = 0x064 },
-	{ .index = EQ5C_PLL_MPC,  .name = "pll-mpc",  .reg64 = 0x06C },
-	{ .index = EQ5C_PLL_DDR1, .name = "pll-ddr1", .reg64 = 0x074 },
+	{ .index = EQ5C_PLL_VMP,  .name = "pll-vmp",  .reg = 0x034 },
+	{ .index = EQ5C_PLL_PMA,  .name = "pll-pma",  .reg = 0x03C },
+	{ .index = EQ5C_PLL_VDI,  .name = "pll-vdi",  .reg = 0x044 },
+	{ .index = EQ5C_PLL_DDR0, .name = "pll-ddr0", .reg = 0x04C },
+	{ .index = EQ5C_PLL_PCI,  .name = "pll-pci",  .reg = 0x054 },
+	{ .index = EQ5C_PLL_PMAC, .name = "pll-pmac", .reg = 0x064 },
+	{ .index = EQ5C_PLL_MPC,  .name = "pll-mpc",  .reg = 0x06C },
+	{ .index = EQ5C_PLL_DDR1, .name = "pll-ddr1", .reg = 0x074 },
 };
 
 enum {
@@ -562,10 +562,10 @@ static const struct eqc_match_data eqc_eyeq5_match_data = {
 };
 
 static const struct eqc_pll eqc_eyeq6l_plls[] = {
-	{ .index = EQ6LC_PLL_DDR, .name = "pll-ddr", .reg64 = 0x02C },
-	{ .index = EQ6LC_PLL_CPU, .name = "pll-cpu", .reg64 = 0x034 }, /* also acc */
-	{ .index = EQ6LC_PLL_PER, .name = "pll-per", .reg64 = 0x03C },
-	{ .index = EQ6LC_PLL_VDI, .name = "pll-vdi", .reg64 = 0x044 },
+	{ .index = EQ6LC_PLL_DDR, .name = "pll-ddr", .reg = 0x02C },
+	{ .index = EQ6LC_PLL_CPU, .name = "pll-cpu", .reg = 0x034 }, /* also acc */
+	{ .index = EQ6LC_PLL_PER, .name = "pll-per", .reg = 0x03C },
+	{ .index = EQ6LC_PLL_VDI, .name = "pll-vdi", .reg = 0x044 },
 };
 
 static const struct eqc_match_data eqc_eyeq6l_match_data = {
@@ -580,7 +580,7 @@ static const struct eqc_match_data eqc_eyeq6h_west_match_data = {
 };
 
 static const struct eqc_pll eqc_eyeq6h_east_plls[] = {
-	{ .index = 0, .name = "pll-east", .reg64 = 0x074 },
+	{ .index = 0, .name = "pll-east", .reg = 0x074 },
 };
 
 static const struct eqc_match_data eqc_eyeq6h_east_match_data = {
@@ -591,10 +591,10 @@ static const struct eqc_match_data eqc_eyeq6h_east_match_data = {
 };
 
 static const struct eqc_pll eqc_eyeq6h_south_plls[] = {
-	{ .index = EQ6HC_SOUTH_PLL_VDI,  .name = "pll-vdi",  .reg64 = 0x000 },
-	{ .index = EQ6HC_SOUTH_PLL_PCIE, .name = "pll-pcie", .reg64 = 0x008 },
-	{ .index = EQ6HC_SOUTH_PLL_PER,  .name = "pll-per",  .reg64 = 0x010 },
-	{ .index = EQ6HC_SOUTH_PLL_ISP,  .name = "pll-isp",  .reg64 = 0x018 },
+	{ .index = EQ6HC_SOUTH_PLL_VDI,  .name = "pll-vdi",  .reg = 0x000 },
+	{ .index = EQ6HC_SOUTH_PLL_PCIE, .name = "pll-pcie", .reg = 0x008 },
+	{ .index = EQ6HC_SOUTH_PLL_PER,  .name = "pll-per",  .reg = 0x010 },
+	{ .index = EQ6HC_SOUTH_PLL_ISP,  .name = "pll-isp",  .reg = 0x018 },
 };
 
 static const struct eqc_div eqc_eyeq6h_south_divs[] = {
@@ -641,7 +641,7 @@ static const struct eqc_match_data eqc_eyeq6h_south_match_data = {
 };
 
 static const struct eqc_pll eqc_eyeq6h_ddr0_plls[] = {
-	{ .index = 0, .name = "pll-ddr0", .reg64 = 0x074 },
+	{ .index = 0, .name = "pll-ddr0", .reg = 0x074 },
 };
 
 static const struct eqc_match_data eqc_eyeq6h_ddr0_match_data = {
@@ -650,7 +650,7 @@ static const struct eqc_match_data eqc_eyeq6h_ddr0_match_data = {
 };
 
 static const struct eqc_pll eqc_eyeq6h_ddr1_plls[] = {
-	{ .index = 0, .name = "pll-ddr1", .reg64 = 0x074 },
+	{ .index = 0, .name = "pll-ddr1", .reg = 0x074 },
 };
 
 static const struct eqc_match_data eqc_eyeq6h_ddr1_match_data = {
@@ -659,11 +659,11 @@ static const struct eqc_match_data eqc_eyeq6h_ddr1_match_data = {
 };
 
 static const struct eqc_pll eqc_eyeq6h_acc_plls[] = {
-	{ .index = EQ6HC_ACC_PLL_XNN, .name = "pll-xnn", .reg64 = 0x040 },
-	{ .index = EQ6HC_ACC_PLL_VMP, .name = "pll-vmp", .reg64 = 0x050 },
-	{ .index = EQ6HC_ACC_PLL_PMA, .name = "pll-pma", .reg64 = 0x05C },
-	{ .index = EQ6HC_ACC_PLL_MPC, .name = "pll-mpc", .reg64 = 0x068 },
-	{ .index = EQ6HC_ACC_PLL_NOC, .name = "pll-noc", .reg64 = 0x070 },
+	{ .index = EQ6HC_ACC_PLL_XNN, .name = "pll-xnn", .reg = 0x040 },
+	{ .index = EQ6HC_ACC_PLL_VMP, .name = "pll-vmp", .reg = 0x050 },
+	{ .index = EQ6HC_ACC_PLL_PMA, .name = "pll-pma", .reg = 0x05C },
+	{ .index = EQ6HC_ACC_PLL_MPC, .name = "pll-mpc", .reg = 0x068 },
+	{ .index = EQ6HC_ACC_PLL_NOC, .name = "pll-noc", .reg = 0x070 },
 };
 
 static const struct eqc_match_data eqc_eyeq6h_acc_match_data = {
@@ -697,7 +697,7 @@ builtin_platform_driver(eqc_driver);
 
 /* Required early for GIC timer. */
 static const struct eqc_pll eqc_eyeq6h_central_early_plls[] = {
-	{ .index = EQ6HC_CENTRAL_PLL_CPU, .name = "pll-cpu", .reg64 = 0x02C },
+	{ .index = EQ6HC_CENTRAL_PLL_CPU, .name = "pll-cpu", .reg = 0x02C },
 };
 
 static const struct eqc_fixed_factor eqc_eyeq6h_central_early_fixed_factors[] = {
@@ -714,7 +714,7 @@ static const struct eqc_early_match_data eqc_eyeq6h_central_early_match_data __i
 
 /* Required early for UART. */
 static const struct eqc_pll eqc_eyeq6h_west_early_plls[] = {
-	{ .index = EQ6HC_WEST_PLL_PER, .name = "pll-west", .reg64 = 0x074 },
+	{ .index = EQ6HC_WEST_PLL_PER, .name = "pll-west", .reg = 0x074 },
 };
 
 static const struct eqc_fixed_factor eqc_eyeq6h_west_early_fixed_factors[] = {
@@ -758,7 +758,7 @@ static void __init eqc_early_init(struct device_node *np,
 	for (i = 0; i < clk_count; i++)
 		cells->hws[i] = ERR_PTR(-EPROBE_DEFER);
 
-	/* Offsets (reg64) of early PLLs are relative to OLB block. */
+	/* Offsets (reg) of early PLLs are relative to OLB block. */
 	base = of_iomap(np, 0);
 	if (!base) {
 		ret = -ENODEV;
@@ -772,7 +772,7 @@ static void __init eqc_early_init(struct device_node *np,
 		u32 r0, r1;
 		u64 val;
 
-		val = readq(base + pll->reg64);
+		val = readq(base + pll->reg);
 		r0 = val;
 		r1 = val >> 32;
 

-- 
2.51.0


