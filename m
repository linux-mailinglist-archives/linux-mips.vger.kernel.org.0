Return-Path: <linux-mips+bounces-12585-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 358F7CDBECA
	for <lists+linux-mips@lfdr.de>; Wed, 24 Dec 2025 11:10:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86C8D309B482
	for <lists+linux-mips@lfdr.de>; Wed, 24 Dec 2025 10:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7128F33890D;
	Wed, 24 Dec 2025 10:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="USKT8wxD"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0EA3370EA;
	Wed, 24 Dec 2025 10:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766570876; cv=none; b=K+7UeOuadl0w59hEHQB8DIQUZENBfLdbPJMktn4gKzn6rurMFec4jWQUU4eEkv1DNcQS7zgQOtWH8ItTjyjzKLZ/ju5QzJYDYBCsHe2fVCM0/k3uauCzHB+Fj3kFAB54Sl5LYs3JO18menpZ9TZ6nXzhWU47VDWFyh+6sz92of4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766570876; c=relaxed/simple;
	bh=svD+5KyAqkRFvnG2jJijODfAy18ad6nEqRjo3dRSip4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ip9tew5cR0RWMuEJ9kFVAbCtxehZmMsmnLGO/uHY6Mq9e4rY4gWdi4EbK+xlI61tfQYwKxKYDEw/7Vj35jSPNCnpa5j9izHiM99KvPRXTwAWurZOVmdcw9qA6rGpVdDaCA/fiTDG6pzrmpH9O+Vv+YBkR35LLnIbNGD6iTpb9YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=USKT8wxD; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E569C1A23D2;
	Wed, 24 Dec 2025 10:07:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B3CF66073D;
	Wed, 24 Dec 2025 10:07:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0A6E310AB1107;
	Wed, 24 Dec 2025 11:07:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766570869; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wABO3Fy8D5m/TOZY/gk+GKos+5kpgv17bjgRdHH8RIk=;
	b=USKT8wxDUmfEFzLPB/qU8liDYFQyeoal1bX/tB4jA+oth+Rk+V+8S4dWP4tl6zg1UEB3wb
	8XEXcUHOWgfIOgSbiB8E8pO/ue/8dcRf/n2wMS5FPTpwce87E1oE+e75WJ2268YG4QaAM/
	9shi1aCeRW+Vd+NenQMtYvD9ZZJJXmU/jcG3QYL17ZFFtfNgDdNWCPxDq7B6ynWdtOnboY
	gwqLlxUqqsVlUSWwTr97MMKt0C0/gisbHjvi3zIjev2Z+NmQaIzbvAe+YaegiBjBW1P2ky
	Wb67vfCB0Kjhv1IjodZYGE4bjuHn8EA2BwIqAqCYPX1GZlf9UXd7Dh7ZNV3XUw==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 24 Dec 2025 11:07:20 +0100
Subject: [PATCH v2 07/10] clk: eyeq: Convert clocks declaration to
 eqc_clock
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251224-clk-eyeq7-v2-7-81744d1025d9@bootlin.com>
References: <20251224-clk-eyeq7-v2-0-81744d1025d9@bootlin.com>
In-Reply-To: <20251224-clk-eyeq7-v2-0-81744d1025d9@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-mips@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Convert all declarations of PLLs, dividers, and fixed factors to struct
eqc_clock for the EyeQ5, EyeQ6H, EyeQ6L, and EyeQ6Lplus, both for the
match data used during probe and the early match data used in early
initialization.

Tested on the EyeQ5, EyeQ6H and EyeQ6Lplus evaluation boards. For the
EyeQ6Lplus and EyeQ6H, the clock tree is unchanged. For the EyeQ5,
this change allows us to set the parent of some probed dividers and
fixed factors by name as they refer to clocks registered in early
init. While these clocks were previously orphaned, they were not yet
used by a peripheral.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/clk/clk-eyeq.c | 354 +++++++++++++++++++------------------------------
 1 file changed, 135 insertions(+), 219 deletions(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index bcf36c434049..7a4b465d87fb 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -602,23 +602,6 @@ static int eqc_probe(struct platform_device *pdev)
 		.pll.reg = _reg,					\
 	}
 
-/* Required early for GIC timer (pll-cpu) and UARTs (pll-per). */
-static const struct eqc_pll eqc_eyeq5_early_plls[] = {
-	{ .index = EQ5C_PLL_CPU, .name = "pll-cpu",  .reg64 = 0x02C },
-	{ .index = EQ5C_PLL_PER, .name = "pll-per",  .reg64 = 0x05C },
-};
-
-static const struct eqc_pll eqc_eyeq5_plls[] = {
-	{ .index = EQ5C_PLL_VMP,  .name = "pll-vmp",  .reg64 = 0x034 },
-	{ .index = EQ5C_PLL_PMA,  .name = "pll-pma",  .reg64 = 0x03C },
-	{ .index = EQ5C_PLL_VDI,  .name = "pll-vdi",  .reg64 = 0x044 },
-	{ .index = EQ5C_PLL_DDR0, .name = "pll-ddr0", .reg64 = 0x04C },
-	{ .index = EQ5C_PLL_PCI,  .name = "pll-pci",  .reg64 = 0x054 },
-	{ .index = EQ5C_PLL_PMAC, .name = "pll-pmac", .reg64 = 0x064 },
-	{ .index = EQ5C_PLL_MPC,  .name = "pll-mpc",  .reg64 = 0x06C },
-	{ .index = EQ5C_PLL_DDR1, .name = "pll-ddr1", .reg64 = 0x074 },
-};
-
 enum {
 	/*
 	 * EQ5C_PLL_CPU children.
@@ -656,262 +639,205 @@ enum {
 	EQ5C_PER_FCMU_A,
 };
 
-static const struct eqc_fixed_factor eqc_eyeq5_early_fixed_factors[] = {
-	/* EQ5C_PLL_CPU children */
-	{ EQ5C_CPU_OCC,		"occ-cpu",	1, 1,	EQ5C_PLL_CPU },
-	{ EQ5C_CPU_SI_CSS0,	"si-css0",	1, 1,	EQ5C_CPU_OCC },
-	{ EQ5C_CPU_CORE0,	"core0",	1, 1,	EQ5C_CPU_SI_CSS0 },
-	{ EQ5C_CPU_CORE1,	"core1",	1, 1,	EQ5C_CPU_SI_CSS0 },
-	{ EQ5C_CPU_CORE2,	"core2",	1, 1,	EQ5C_CPU_SI_CSS0 },
-	{ EQ5C_CPU_CORE3,	"core3",	1, 1,	EQ5C_CPU_SI_CSS0 },
+/* Required early for GIC timer (pll-cpu) and UARTs (pll-per). */
+static const struct eqc_clock eqc_eyeq5_early_clks[] = {
+	PLL_FRACG(EQ5C_PLL_CPU, PARENT_BY_FWNAME, "pll-cpu", "ref", 0x02C),
+	PLL_FRACG(EQ5C_PLL_PER, PARENT_BY_FWNAME, "pll-per", "ref", 0x05C),
 
-	/* EQ5C_PLL_PER children */
-	{ EQ5C_PER_OCC,		"occ-periph",	1, 16,	EQ5C_PLL_PER },
-	{ EQ5C_PER_UART,	"uart",		1, 1,	EQ5C_PER_OCC },
+	FF(EQ5C_CPU_OCC, EQ5C_PLL_CPU, "occ-cpu", NULL, 1, 1),
+	FF(EQ5C_CPU_SI_CSS0, EQ5C_CPU_OCC, "si-css0", NULL, 1, 1),
+	FF(EQ5C_CPU_CORE0, EQ5C_CPU_SI_CSS0, "core0", NULL, 1, 1),
+	FF(EQ5C_CPU_CORE1, EQ5C_CPU_SI_CSS0, "core1", NULL, 1, 1),
+	FF(EQ5C_CPU_CORE2, EQ5C_CPU_SI_CSS0, "core2", NULL, 1, 1),
+	FF(EQ5C_CPU_CORE3, EQ5C_CPU_SI_CSS0, "core3", NULL, 1, 1),
+
+	FF(EQ5C_PER_OCC, EQ5C_PLL_PER, "occ-periph", NULL, 1, 16),
+	FF(EQ5C_PER_UART, EQ5C_PER_OCC, "uart", NULL, 1, 1),
 };
 
-static const struct eqc_fixed_factor eqc_eyeq5_fixed_factors[] = {
-	/* EQ5C_PLL_CPU children */
-	{ EQ5C_CPU_CPC,		"cpc",		1, 1,	EQ5C_CPU_SI_CSS0 },
-	{ EQ5C_CPU_CM,		"cm",		1, 1,	EQ5C_CPU_SI_CSS0 },
-	{ EQ5C_CPU_MEM,		"mem",		1, 1,	EQ5C_CPU_SI_CSS0 },
-	{ EQ5C_CPU_OCC_ISRAM,	"occ-isram",	1, 2,	EQ5C_PLL_CPU },
-	{ EQ5C_CPU_ISRAM,	"isram",	1, 1,	EQ5C_CPU_OCC_ISRAM },
-	{ EQ5C_CPU_OCC_DBU,	"occ-dbu",	1, 10,	EQ5C_PLL_CPU },
-	{ EQ5C_CPU_SI_DBU_TP,	"si-dbu-tp",	1, 1,	EQ5C_CPU_OCC_DBU },
+static const struct eqc_clock eqc_eyeq5_clks[] = {
+	PLL_FRACG(EQ5C_PLL_VMP, PARENT_BY_FWNAME, "pll-vmp", "ref", 0x034),
+	PLL_FRACG(EQ5C_PLL_PMA, PARENT_BY_FWNAME, "pll-pma", "ref", 0x03C),
+	PLL_FRACG(EQ5C_PLL_VDI, PARENT_BY_FWNAME, "pll-vdi", "ref", 0x044),
+	PLL_FRACG(EQ5C_PLL_DDR0, PARENT_BY_FWNAME, "pll-ddr0", "ref", 0x04C),
+	PLL_FRACG(EQ5C_PLL_PCI, PARENT_BY_FWNAME, "pll-pci", "ref", 0x054),
+	PLL_FRACG(EQ5C_PLL_PMAC, PARENT_BY_FWNAME, "pll-pmac", "ref", 0x064),
+	PLL_FRACG(EQ5C_PLL_MPC, PARENT_BY_FWNAME, "pll-mpc", "ref", 0x06C),
+	PLL_FRACG(EQ5C_PLL_DDR1, PARENT_BY_FWNAME, "pll-ddr1", "ref", 0x074),
 
-	/* EQ5C_PLL_VDI children */
-	{ EQ5C_VDI_OCC_VDI,	"occ-vdi",	1, 2,	EQ5C_PLL_VDI },
-	{ EQ5C_VDI_VDI,		"vdi",		1, 1,	EQ5C_VDI_OCC_VDI },
-	{ EQ5C_VDI_OCC_CAN_SER,	"occ-can-ser",	1, 16,	EQ5C_PLL_VDI },
-	{ EQ5C_VDI_CAN_SER,	"can-ser",	1, 1,	EQ5C_VDI_OCC_CAN_SER },
-	{ EQ5C_VDI_I2C_SER,	"i2c-ser",	1, 20,	EQ5C_PLL_VDI },
+	DIV(EQ5C_DIV_OSPI, PARENT_BY_NAME, "div-ospi", "pll-per", 0x11C, 0, 4, NULL),
 
-	/* EQ5C_PLL_PER children */
-	{ EQ5C_PER_PERIPH,	"periph",	1, 1,	EQ5C_PER_OCC },
-	{ EQ5C_PER_CAN,		"can",		1, 1,	EQ5C_PER_OCC },
-	{ EQ5C_PER_SPI,		"spi",		1, 1,	EQ5C_PER_OCC },
-	{ EQ5C_PER_I2C,		"i2c",		1, 1,	EQ5C_PER_OCC },
-	{ EQ5C_PER_TIMER,	"timer",	1, 1,	EQ5C_PER_OCC },
-	{ EQ5C_PER_GPIO,	"gpio",		1, 1,	EQ5C_PER_OCC },
-	{ EQ5C_PER_EMMC,	"emmc-sys",	1, 10,	EQ5C_PLL_PER },
-	{ EQ5C_PER_CCF,		"ccf-ctrl",	1, 4,	EQ5C_PLL_PER },
-	{ EQ5C_PER_OCC_MJPEG,	"occ-mjpeg",	1, 2,	EQ5C_PLL_PER },
-	{ EQ5C_PER_HSM,		"hsm",		1, 1,	EQ5C_PER_OCC_MJPEG },
-	{ EQ5C_PER_MJPEG,	"mjpeg",	1, 1,	EQ5C_PER_OCC_MJPEG },
-	{ EQ5C_PER_FCMU_A,	"fcmu-a",	1, 20,	EQ5C_PLL_PER },
-	{ EQ5C_PER_OCC_PCI,	"occ-pci-sys",	1, 8,	EQ5C_PLL_PER },
-};
+	FF(EQ5C_CPU_CPC, PARENT_BY_NAME, "cpc", "si-css0", 1, 1),
+	FF(EQ5C_CPU_CM, PARENT_BY_NAME, "cm", "si-css0", 1, 1),
+	FF(EQ5C_CPU_MEM, PARENT_BY_NAME, "mem", "si-css0", 1, 1),
+	FF(EQ5C_CPU_OCC_ISRAM, PARENT_BY_NAME, "occ-isram", "pll-cpu", 1, 2),
+	FF(EQ5C_CPU_ISRAM, EQ5C_CPU_OCC_ISRAM, "isram", NULL, 1, 1),
+	FF(EQ5C_CPU_OCC_DBU, PARENT_BY_NAME, "occ-dbu", "pll-cpu", 1, 10),
+	FF(EQ5C_CPU_SI_DBU_TP, EQ5C_CPU_OCC_DBU, "si-dbu-tp", NULL, 1, 1),
 
-static const struct eqc_div eqc_eyeq5_divs[] = {
-	{
-		.index = EQ5C_DIV_OSPI,
-		.name = "div-ospi",
-		.parent = EQ5C_PLL_PER,
-		.reg = 0x11C,
-		.shift = 0,
-		.width = 4,
-	},
+	FF(EQ5C_VDI_OCC_VDI, PARENT_BY_NAME, "occ-vdi", "pll-vdi", 1, 2),
+	FF(EQ5C_VDI_VDI, EQ5C_VDI_OCC_VDI, "vdi", NULL, 1, 1),
+	FF(EQ5C_VDI_OCC_CAN_SER, PARENT_BY_NAME, "occ-can-ser", "pll-vdi", 1, 16),
+	FF(EQ5C_VDI_CAN_SER, EQ5C_VDI_OCC_CAN_SER, "can-ser", NULL, 1, 1),
+	FF(EQ5C_VDI_I2C_SER, PARENT_BY_NAME, "i2c-ser", "pll-vdi", 1, 20),
+
+	FF(EQ5C_PER_PERIPH, PARENT_BY_NAME, "periph", "occ-periph", 1, 1),
+	FF(EQ5C_PER_CAN, PARENT_BY_NAME, "can", "occ-periph", 1, 1),
+	FF(EQ5C_PER_SPI, PARENT_BY_NAME, "spi", "occ-periph", 1, 1),
+	FF(EQ5C_PER_I2C, PARENT_BY_NAME, "i2c", "occ-periph", 1, 1),
+	FF(EQ5C_PER_TIMER, PARENT_BY_NAME, "timer", "occ-periph", 1, 1),
+	FF(EQ5C_PER_GPIO, PARENT_BY_NAME, "gpio", "occ-periph", 1, 1),
+	FF(EQ5C_PER_EMMC, PARENT_BY_NAME, "emmc-sys", "pll-per", 1, 10),
+	FF(EQ5C_PER_CCF, PARENT_BY_NAME, "ccf-ctrl", "pll-per", 1, 4),
+	FF(EQ5C_PER_OCC_MJPEG, PARENT_BY_NAME, "occ-mjpeg", "pll-per", 1, 2),
+	FF(EQ5C_PER_HSM, EQ5C_PER_OCC_MJPEG, "hsm", NULL, 1, 1),
+	FF(EQ5C_PER_MJPEG, EQ5C_PER_OCC_MJPEG, "mjpeg", NULL, 1, 1),
+	FF(EQ5C_PER_FCMU_A, PARENT_BY_NAME, "fcmu-a", "pll-per", 1, 20),
+	FF(EQ5C_PER_OCC_PCI, PARENT_BY_NAME, "occ-pci-sys", "pll-per", 1, 8),
 };
 
 static const struct eqc_early_match_data eqc_eyeq5_early_match_data __initconst = {
-	.early_pll_count	= ARRAY_SIZE(eqc_eyeq5_early_plls),
-	.early_plls		= eqc_eyeq5_early_plls,
+	.early_clk_count	= ARRAY_SIZE(eqc_eyeq5_early_clks),
+	.early_clks		= eqc_eyeq5_early_clks,
 
-	.early_fixed_factor_count	= ARRAY_SIZE(eqc_eyeq5_early_fixed_factors),
-	.early_fixed_factors		= eqc_eyeq5_early_fixed_factors,
-
-	.late_clk_count		= ARRAY_SIZE(eqc_eyeq5_plls) + ARRAY_SIZE(eqc_eyeq5_divs) +
-				  ARRAY_SIZE(eqc_eyeq5_fixed_factors),
+	.late_clk_count		= ARRAY_SIZE(eqc_eyeq5_clks),
 };
 
 static const struct eqc_match_data eqc_eyeq5_match_data = {
-	.pll_count	= ARRAY_SIZE(eqc_eyeq5_plls),
-	.plls		= eqc_eyeq5_plls,
-
-	.div_count	= ARRAY_SIZE(eqc_eyeq5_divs),
-	.divs		= eqc_eyeq5_divs,
-
-	.fixed_factor_count	= ARRAY_SIZE(eqc_eyeq5_fixed_factors),
-	.fixed_factors		= eqc_eyeq5_fixed_factors,
+	.clk_count	= ARRAY_SIZE(eqc_eyeq5_clks),
+	.clks		= eqc_eyeq5_clks,
 
 	.reset_auxdev_name = "reset",
 	.pinctrl_auxdev_name = "pinctrl",
 
-	.early_clk_count = ARRAY_SIZE(eqc_eyeq5_early_plls) +
-			   ARRAY_SIZE(eqc_eyeq5_early_fixed_factors),
+	.early_clk_count = ARRAY_SIZE(eqc_eyeq5_early_clks),
 };
 
-static const struct eqc_pll eqc_eyeq6l_plls[] = {
-	{ .index = EQ6LC_PLL_DDR, .name = "pll-ddr", .reg64 = 0x02C },
-	{ .index = EQ6LC_PLL_CPU, .name = "pll-cpu", .reg64 = 0x034 }, /* also acc */
-	{ .index = EQ6LC_PLL_PER, .name = "pll-per", .reg64 = 0x03C },
-	{ .index = EQ6LC_PLL_VDI, .name = "pll-vdi", .reg64 = 0x044 },
+static const struct eqc_clock eqc_eyeq6l_clks[] = {
+	PLL_FRACG(EQ6LC_PLL_DDR, PARENT_BY_FWNAME, "pll-ddr", "ref", 0x02C),
+	PLL_FRACG(EQ6LC_PLL_CPU, PARENT_BY_FWNAME, "pll-cpu", "ref", 0x034),
+	PLL_FRACG(EQ6LC_PLL_PER, PARENT_BY_FWNAME, "pll-per", "ref", 0x03C),
+	PLL_FRACG(EQ6LC_PLL_VDI, PARENT_BY_FWNAME, "pll-vdi", "ref", 0x044),
 };
 
 static const struct eqc_match_data eqc_eyeq6l_match_data = {
-	.pll_count	= ARRAY_SIZE(eqc_eyeq6l_plls),
-	.plls		= eqc_eyeq6l_plls,
+	.clk_count	= ARRAY_SIZE(eqc_eyeq6l_clks),
+	.clks		= eqc_eyeq6l_clks,
 
 	.reset_auxdev_name = "reset",
 };
 
-static const struct eqc_pll eqc_eyeq6lplus_early_plls[] = {
-	{ .index = EQ6LPC_PLL_CPU, .name = "pll-cpu", .reg64 = 0x058 },
+static const struct eqc_clock eqc_eyeq6lplus_early_clks[] = {
+	PLL_FRACG(EQ6LPC_PLL_CPU, PARENT_BY_FWNAME, "pll-cpu", "ref", 0x058),
+
+	FF(EQ6LPC_CPU_OCC, EQ6LPC_PLL_CPU, "occ-cpu", NULL, 1, 1),
 };
 
-static const struct eqc_pll eqc_eyeq6lplus_plls[] = {
-	{ .index = EQ6LPC_PLL_DDR, .name = "pll-ddr", .reg64 = 0x02C },
-	{ .index = EQ6LPC_PLL_ACC, .name = "pll-acc", .reg64 = 0x034 },
-	{ .index = EQ6LPC_PLL_PER, .name = "pll-per", .reg64 = 0x03C },
-	{ .index = EQ6LPC_PLL_VDI, .name = "pll-vdi", .reg64 = 0x044 },
-};
+static const struct eqc_clock eqc_eyeq6lplus_clks[] = {
+	PLL_FRACG(EQ6LPC_PLL_DDR, PARENT_BY_FWNAME, "pll-ddr", "ref", 0x02C),
+	PLL_FRACG(EQ6LPC_PLL_ACC, PARENT_BY_FWNAME, "pll-acc", "ref", 0x034),
+	PLL_FRACG(EQ6LPC_PLL_PER, PARENT_BY_FWNAME, "pll-per", "ref", 0x03C),
+	PLL_FRACG(EQ6LPC_PLL_VDI, PARENT_BY_FWNAME, "pll-vdi", "ref", 0x044),
 
-static const struct eqc_fixed_factor eqc_eyeq6lplus_early_fixed_factors[] = {
-	{ EQ6LPC_CPU_OCC,	"occ-cpu",	1, 1,	EQ6LPC_PLL_CPU },
-};
+	FF(EQ6LPC_DDR_OCC, EQ6LPC_PLL_DDR, "occ-ddr", NULL, 1, 1),
 
-static const struct eqc_fixed_factor eqc_eyeq6lplus_fixed_factors[] = {
-	{ EQ6LPC_DDR_OCC,	"occ-ddr",	1, 1,	EQ6LPC_PLL_DDR },
+	FF(EQ6LPC_ACC_VDI, EQ6LPC_PLL_ACC, "vdi-div", NULL, 1, 10),
+	FF(EQ6LPC_ACC_OCC, EQ6LPC_PLL_ACC, "occ-acc", NULL, 1, 1),
+	FF(EQ6LPC_ACC_FCMU, EQ6LPC_ACC_OCC, "fcmu-a-clk", NULL, 1, 10),
 
-	{ EQ6LPC_ACC_VDI,	"vdi-div",	1, 10,	EQ6LPC_PLL_ACC },
-	{ EQ6LPC_ACC_OCC,	"occ-acc",	1, 1,	EQ6LPC_PLL_ACC },
-	{ EQ6LPC_ACC_FCMU,	"fcmu-a-clk",	1, 10,	EQ6LPC_ACC_OCC },
+	FF(EQ6LPC_PER_OCC, EQ6LPC_PLL_PER, "occ-per", NULL, 1, 1),
+	FF(EQ6LPC_PER_I2C_SER, EQ6LPC_PER_OCC, "i2c-ser-clk", NULL, 1, 10),
+	FF(EQ6LPC_PER_PCLK, EQ6LPC_PER_OCC, "pclk", NULL, 1, 4),
+	FF(EQ6LPC_PER_TSU, EQ6LPC_PER_OCC, "tsu-clk", NULL, 1, 8),
+	FF(EQ6LPC_PER_OSPI, EQ6LPC_PER_OCC, "ospi-ref-clk", NULL, 1, 10),
+	FF(EQ6LPC_PER_GPIO, EQ6LPC_PER_OCC, "gpio-clk", NULL, 1, 4),
+	FF(EQ6LPC_PER_TIMER, EQ6LPC_PER_OCC, "timer-clk", NULL, 1, 4),
+	FF(EQ6LPC_PER_I2C, EQ6LPC_PER_OCC, "i2c-clk", NULL, 1, 4),
+	FF(EQ6LPC_PER_UART, EQ6LPC_PER_OCC, "uart-clk", NULL, 1, 4),
+	FF(EQ6LPC_PER_SPI, EQ6LPC_PER_OCC, "spi-clk", NULL, 1, 4),
+	FF(EQ6LPC_PER_PERIPH, EQ6LPC_PER_OCC, "periph-clk", NULL, 1, 1),
 
-	{ EQ6LPC_PER_OCC,	"occ-per",	1, 1,	EQ6LPC_PLL_PER },
-	{ EQ6LPC_PER_I2C_SER,	"i2c-ser-clk",	1, 10,	EQ6LPC_PER_OCC },
-	{ EQ6LPC_PER_PCLK,	"pclk",		1, 4,	EQ6LPC_PER_OCC },
-	{ EQ6LPC_PER_TSU,	"tsu-clk",	1, 8,	EQ6LPC_PER_OCC },
-	{ EQ6LPC_PER_OSPI,	"ospi-ref-clk",	1, 10,	EQ6LPC_PER_OCC },
-	{ EQ6LPC_PER_GPIO,	"gpio-clk",	1, 4,	EQ6LPC_PER_OCC },
-	{ EQ6LPC_PER_TIMER,	"timer-clk",	1, 4,	EQ6LPC_PER_OCC },
-	{ EQ6LPC_PER_I2C,	"i2c-clk",	1, 4,	EQ6LPC_PER_OCC },
-	{ EQ6LPC_PER_UART,	"uart-clk",	1, 4,	EQ6LPC_PER_OCC },
-	{ EQ6LPC_PER_SPI,	"spi-clk",	1, 4,	EQ6LPC_PER_OCC },
-	{ EQ6LPC_PER_PERIPH,	"periph-clk",	1, 1,	EQ6LPC_PER_OCC },
-
-	{ EQ6LPC_VDI_OCC,	"occ-vdi",	1, 1,	EQ6LPC_PLL_VDI },
+	FF(EQ6LPC_VDI_OCC, EQ6LPC_PLL_VDI, "occ-vdi", NULL, 1, 1),
 };
 
 static const struct eqc_early_match_data eqc_eyeq6lplus_early_match_data __initconst = {
-	.early_pll_count        = ARRAY_SIZE(eqc_eyeq6lplus_early_plls),
-	.early_plls             = eqc_eyeq6lplus_early_plls,
+	.early_clk_count	= ARRAY_SIZE(eqc_eyeq6lplus_early_clks),
+	.early_clks		= eqc_eyeq6lplus_early_clks,
 
-	.early_fixed_factor_count       = ARRAY_SIZE(eqc_eyeq6lplus_early_fixed_factors),
-	.early_fixed_factors            = eqc_eyeq6lplus_early_fixed_factors,
-
-	.late_clk_count         = ARRAY_SIZE(eqc_eyeq6lplus_plls) +
-	ARRAY_SIZE(eqc_eyeq6lplus_fixed_factors),
+	.late_clk_count		= ARRAY_SIZE(eqc_eyeq6lplus_clks),
 };
 
 static const struct eqc_match_data eqc_eyeq6lplus_match_data = {
-	.pll_count      = ARRAY_SIZE(eqc_eyeq6lplus_plls),
-	.plls           = eqc_eyeq6lplus_plls,
-
-	.fixed_factor_count     = ARRAY_SIZE(eqc_eyeq6lplus_fixed_factors),
-	.fixed_factors          = eqc_eyeq6lplus_fixed_factors,
+	.clk_count	= ARRAY_SIZE(eqc_eyeq6lplus_clks),
+	.clks		= eqc_eyeq6lplus_clks,
 
 	.reset_auxdev_name = "reset",
 	.pinctrl_auxdev_name = "pinctrl",
 
-	.early_clk_count = ARRAY_SIZE(eqc_eyeq6lplus_early_plls) +
-	ARRAY_SIZE(eqc_eyeq6lplus_early_fixed_factors),
+	.early_clk_count = ARRAY_SIZE(eqc_eyeq6lplus_early_clks),
 };
 
 static const struct eqc_match_data eqc_eyeq6h_west_match_data = {
 	.reset_auxdev_name = "reset_west",
 };
 
-static const struct eqc_pll eqc_eyeq6h_east_plls[] = {
-	{ .index = 0, .name = "pll-east", .reg64 = 0x074 },
+static const struct eqc_clock eqc_eyeq6h_east_clks[] = {
+	PLL_FRACG(0, PARENT_BY_FWNAME, "pll-east", "ref", 0x074),
 };
 
 static const struct eqc_match_data eqc_eyeq6h_east_match_data = {
-	.pll_count	= ARRAY_SIZE(eqc_eyeq6h_east_plls),
-	.plls		= eqc_eyeq6h_east_plls,
+	.clk_count	= ARRAY_SIZE(eqc_eyeq6h_east_clks),
+	.clks		= eqc_eyeq6h_east_clks,
 
 	.reset_auxdev_name = "reset_east",
 };
 
-static const struct eqc_pll eqc_eyeq6h_south_plls[] = {
-	{ .index = EQ6HC_SOUTH_PLL_VDI,  .name = "pll-vdi",  .reg64 = 0x000 },
-	{ .index = EQ6HC_SOUTH_PLL_PCIE, .name = "pll-pcie", .reg64 = 0x008 },
-	{ .index = EQ6HC_SOUTH_PLL_PER,  .name = "pll-per",  .reg64 = 0x010 },
-	{ .index = EQ6HC_SOUTH_PLL_ISP,  .name = "pll-isp",  .reg64 = 0x018 },
-};
+static const struct eqc_clock eqc_eyeq6h_south_clks[] = {
+	PLL_FRACG(EQ6HC_SOUTH_PLL_VDI, PARENT_BY_FWNAME, "pll-vdi", "ref", 0x000),
+	PLL_FRACG(EQ6HC_SOUTH_PLL_PCIE, PARENT_BY_FWNAME, "pll-pcie", "ref", 0x008),
+	PLL_FRACG(EQ6HC_SOUTH_PLL_PER, PARENT_BY_FWNAME, "pll-per", "ref", 0x010),
+	PLL_FRACG(EQ6HC_SOUTH_PLL_ISP, PARENT_BY_FWNAME, "pll-isp", "ref", 0x018),
 
-static const struct eqc_div eqc_eyeq6h_south_divs[] = {
-	{
-		.index = EQ6HC_SOUTH_DIV_EMMC,
-		.name = "div-emmc",
-		.parent = EQ6HC_SOUTH_PLL_PER,
-		.reg = 0x070,
-		.shift = 4,
-		.width = 4,
-	},
-	{
-		.index = EQ6HC_SOUTH_DIV_OSPI_REF,
-		.name = "div-ospi-ref",
-		.parent = EQ6HC_SOUTH_PLL_PER,
-		.reg = 0x090,
-		.shift = 4,
-		.width = 4,
-	},
-	{
-		.index = EQ6HC_SOUTH_DIV_OSPI_SYS,
-		.name = "div-ospi-sys",
-		.parent = EQ6HC_SOUTH_PLL_PER,
-		.reg = 0x090,
-		.shift = 8,
-		.width = 1,
-	},
-	{
-		.index = EQ6HC_SOUTH_DIV_TSU,
-		.name = "div-tsu",
-		.parent = EQ6HC_SOUTH_PLL_PCIE,
-		.reg = 0x098,
-		.shift = 4,
-		.width = 8,
-	},
+	DIV(EQ6HC_SOUTH_DIV_EMMC, EQ6HC_SOUTH_PLL_PER, "div-emmc", NULL, 0x070, 4, 4, NULL),
+	DIV(EQ6HC_SOUTH_DIV_OSPI_REF, EQ6HC_SOUTH_PLL_PER, "div-ospi-ref", NULL, 0x090, 4, 4, NULL),
+	DIV(EQ6HC_SOUTH_DIV_OSPI_SYS, EQ6HC_SOUTH_PLL_PER, "div-ospi-sys", NULL, 0x090, 8, 1, NULL),
+	DIV(EQ6HC_SOUTH_DIV_TSU, EQ6HC_SOUTH_PLL_PCIE, "div-tsu", NULL, 0x098, 4, 8, NULL),
 };
 
 static const struct eqc_match_data eqc_eyeq6h_south_match_data = {
-	.pll_count	= ARRAY_SIZE(eqc_eyeq6h_south_plls),
-	.plls		= eqc_eyeq6h_south_plls,
-
-	.div_count	= ARRAY_SIZE(eqc_eyeq6h_south_divs),
-	.divs		= eqc_eyeq6h_south_divs,
+	.clk_count	= ARRAY_SIZE(eqc_eyeq6h_south_clks),
+	.clks		= eqc_eyeq6h_south_clks,
 };
 
-static const struct eqc_pll eqc_eyeq6h_ddr0_plls[] = {
-	{ .index = 0, .name = "pll-ddr0", .reg64 = 0x074 },
+static const struct eqc_clock eqc_eyeq6h_ddr0_clks[] = {
+	PLL_FRACG(0, PARENT_BY_FWNAME, "pll-ddr0", "ref", 0x074),
 };
 
 static const struct eqc_match_data eqc_eyeq6h_ddr0_match_data = {
-	.pll_count	= ARRAY_SIZE(eqc_eyeq6h_ddr0_plls),
-	.plls		= eqc_eyeq6h_ddr0_plls,
+	.clk_count	= ARRAY_SIZE(eqc_eyeq6h_ddr0_clks),
+	.clks		= eqc_eyeq6h_ddr0_clks,
 };
 
-static const struct eqc_pll eqc_eyeq6h_ddr1_plls[] = {
-	{ .index = 0, .name = "pll-ddr1", .reg64 = 0x074 },
+static const struct eqc_clock eqc_eyeq6h_ddr1_clks[] = {
+	PLL_FRACG(0, PARENT_BY_FWNAME, "pll-ddr1", "ref", 0x074),
 };
 
 static const struct eqc_match_data eqc_eyeq6h_ddr1_match_data = {
-	.pll_count	= ARRAY_SIZE(eqc_eyeq6h_ddr1_plls),
-	.plls		= eqc_eyeq6h_ddr1_plls,
+	.clk_count	= ARRAY_SIZE(eqc_eyeq6h_ddr1_clks),
+	.clks		= eqc_eyeq6h_ddr1_clks,
 };
 
-static const struct eqc_pll eqc_eyeq6h_acc_plls[] = {
-	{ .index = EQ6HC_ACC_PLL_XNN, .name = "pll-xnn", .reg64 = 0x040 },
-	{ .index = EQ6HC_ACC_PLL_VMP, .name = "pll-vmp", .reg64 = 0x050 },
-	{ .index = EQ6HC_ACC_PLL_PMA, .name = "pll-pma", .reg64 = 0x05C },
-	{ .index = EQ6HC_ACC_PLL_MPC, .name = "pll-mpc", .reg64 = 0x068 },
-	{ .index = EQ6HC_ACC_PLL_NOC, .name = "pll-noc", .reg64 = 0x070 },
+static const struct eqc_clock eqc_eyeq6h_acc_clks[] = {
+	PLL_FRACG(EQ6HC_ACC_PLL_XNN, PARENT_BY_FWNAME, "pll-xnn", "ref", 0x040),
+	PLL_FRACG(EQ6HC_ACC_PLL_VMP, PARENT_BY_FWNAME, "pll-vmp", "ref", 0x050),
+	PLL_FRACG(EQ6HC_ACC_PLL_PMA, PARENT_BY_FWNAME, "pll-pma", "ref", 0x05C),
+	PLL_FRACG(EQ6HC_ACC_PLL_MPC, PARENT_BY_FWNAME, "pll-mpc", "ref", 0x068),
+	PLL_FRACG(EQ6HC_ACC_PLL_NOC, PARENT_BY_FWNAME, "pll-noc", "ref", 0x070),
 };
 
 static const struct eqc_match_data eqc_eyeq6h_acc_match_data = {
-	.pll_count	= ARRAY_SIZE(eqc_eyeq6h_acc_plls),
-	.plls		= eqc_eyeq6h_acc_plls,
+	.clk_count	= ARRAY_SIZE(eqc_eyeq6h_acc_clks),
+	.clks		= eqc_eyeq6h_acc_clks,
 
 	.reset_auxdev_name = "reset_acc",
 };
@@ -940,38 +866,28 @@ static struct platform_driver eqc_driver = {
 builtin_platform_driver(eqc_driver);
 
 /* Required early for GIC timer. */
-static const struct eqc_pll eqc_eyeq6h_central_early_plls[] = {
-	{ .index = EQ6HC_CENTRAL_PLL_CPU, .name = "pll-cpu", .reg64 = 0x02C },
-};
+static const struct eqc_clock eqc_eyeq6h_central_early_clks[] = {
+	PLL_FRACG(EQ6HC_CENTRAL_PLL_CPU, PARENT_BY_FWNAME, "pll-cpu", "ref", 0x02C),
 
-static const struct eqc_fixed_factor eqc_eyeq6h_central_early_fixed_factors[] = {
-	{ EQ6HC_CENTRAL_CPU_OCC, "occ-cpu", 1, 1, EQ6HC_CENTRAL_PLL_CPU },
+	FF(EQ6HC_CENTRAL_CPU_OCC, EQ6HC_CENTRAL_PLL_CPU, "occ-cpu", NULL, 1, 1),
 };
 
 static const struct eqc_early_match_data eqc_eyeq6h_central_early_match_data __initconst = {
-	.early_pll_count	= ARRAY_SIZE(eqc_eyeq6h_central_early_plls),
-	.early_plls		= eqc_eyeq6h_central_early_plls,
-
-	.early_fixed_factor_count = ARRAY_SIZE(eqc_eyeq6h_central_early_fixed_factors),
-	.early_fixed_factors = eqc_eyeq6h_central_early_fixed_factors,
+	.early_clk_count	= ARRAY_SIZE(eqc_eyeq6h_central_early_clks),
+	.early_clks		= eqc_eyeq6h_central_early_clks,
 };
 
 /* Required early for UART. */
-static const struct eqc_pll eqc_eyeq6h_west_early_plls[] = {
-	{ .index = EQ6HC_WEST_PLL_PER, .name = "pll-west", .reg64 = 0x074 },
-};
+static const struct eqc_clock eqc_eyeq6h_west_early_clks[] = {
+	PLL_FRACG(EQ6HC_WEST_PLL_PER, PARENT_BY_FWNAME, "pll-west", "ref", 0x074),
 
-static const struct eqc_fixed_factor eqc_eyeq6h_west_early_fixed_factors[] = {
-	{ EQ6HC_WEST_PER_OCC,  "west-per-occ",  1, 10, EQ6HC_WEST_PLL_PER },
-	{ EQ6HC_WEST_PER_UART, "west-per-uart", 1, 1,  EQ6HC_WEST_PER_OCC },
+	FF(EQ6HC_WEST_PER_OCC, EQ6HC_WEST_PLL_PER, "west-per-occ", NULL, 1, 10),
+	FF(EQ6HC_WEST_PER_UART, EQ6HC_WEST_PER_OCC, "west-per-uart", NULL, 1, 1),
 };
 
 static const struct eqc_early_match_data eqc_eyeq6h_west_early_match_data __initconst = {
-	.early_pll_count	= ARRAY_SIZE(eqc_eyeq6h_west_early_plls),
-	.early_plls		= eqc_eyeq6h_west_early_plls,
-
-	.early_fixed_factor_count = ARRAY_SIZE(eqc_eyeq6h_west_early_fixed_factors),
-	.early_fixed_factors = eqc_eyeq6h_west_early_fixed_factors,
+	.early_clk_count	= ARRAY_SIZE(eqc_eyeq6h_west_early_clks),
+	.early_clks		= eqc_eyeq6h_west_early_clks,
 };
 
 static void __init eqc_early_init(struct device_node *np,

-- 
2.52.0


