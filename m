Return-Path: <linux-mips+bounces-11004-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DADCB41FD3
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 14:50:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3B1C54117A
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 12:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD776301472;
	Wed,  3 Sep 2025 12:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LqP0HypL"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3F33074AB
	for <linux-mips@vger.kernel.org>; Wed,  3 Sep 2025 12:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756903684; cv=none; b=WudgdqINNcn8OSgfxCYMwbdm0LJHOE7lFEO65H9MwNVPX3GHLF2+NoPNcSZo4VUpBDhKx1OlsxhLK7JqdNUJoin1w6VCg5iUjUpxrkrqnWzZjXyB4vV2U76QunC+hPZx5/SQSuAcF2fabw8ASzi2pl6R1eBc8TXQfaA0iDqrXFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756903684; c=relaxed/simple;
	bh=RkW5y4rZ49JdAHh0nxP4TIpnjzpp214s3igwWvMZVFE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PDkr6oWO8MYk0wzR6Ort/Iwu7drSv8kAYBqxhfUXmDtJ8C9bx2EENDYPM6YQphnD1h/eXBYzQncU6ZakrODjZQtyLJQ2aBufXi+lrhh/Sc5RRCDWvZ+AhFF2uDoLeFB73LRN41g7r8/DeI/snWO/1cqaQMkZH0HusIiu7d8+7UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LqP0HypL; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B0A521A08EC;
	Wed,  3 Sep 2025 12:47:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 89D2C606C3;
	Wed,  3 Sep 2025 12:47:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A4A8A1C22C3F8;
	Wed,  3 Sep 2025 14:47:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756903678; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/VSLyI+Ovanq4kgxvJjgjN4r0Yaa6e1OA7Uan/Os3TY=;
	b=LqP0HypLLhdL+74Ib7TF+9WC3yi5nvcCu1q0lhfqVCfNNA3oifrSourQlUhDKzQ1pBcE2U
	wqyF5VH0EESeOxh6hBctpY5THV2/eJaG+8tZCffnD/AoQgGgdud/42lT5kmgTBQuRFXlC4
	7tVUcJR3d8Lhw6AuVARir4lelSdGoXPLdFVLeAlqKFhwGG1miYdIizRjDM6NRCwlUHym9I
	OLDAN40w9cIfk6aXn6gQJ8MDiSMiuwnUMD9qjkXYdgaplNbtCSKyHcpdNKdwk4NTwUcgJZ
	pp6GY9GMnteBf5o4dfnJzq7rnbLHXsFVDgoToswlhBd4hDYgWU1o+QqaYFC2Xg==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 03 Sep 2025 14:47:19 +0200
Subject: [PATCH 12/19] clk: eyeq: lookup parent clock by name
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250903-clk-eyeq7-v1-12-3f5024b5d6e2@bootlin.com>
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

When registering a divider or a fixed factor during probe, lookup its
parent by name if the parent clock was registered early. Looking up the
parent clock by index in this case leads to orphaned clocks or clocks
with the wrong parent, since the index refers to clocks from the device
tree.

This is applicable to the eyeQ5 where some probed dividers and fixed
factors refer to PLL and fixed factors registered in early init.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/clk/clk-eyeq.c | 48 ++++++++++++++++++++++++++----------------------
 1 file changed, 26 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index 89e0782b5cbe16a7c2010d9d441ace139fd0deb5..a0581016100c7367efb373a3fb3b7c6d51b49912 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -84,6 +84,7 @@ struct eqc_div {
 	unsigned int	index;
 	const char	*name;
 	unsigned int	parent_idx;
+	const char	*parent_name;
 	unsigned int	reg;
 	u8		shift;
 	u8		width;
@@ -95,6 +96,7 @@ struct eqc_fixed_factor {
 	unsigned int	mult;
 	unsigned int	div;
 	unsigned int	parent_idx;
+	const char	*parent_name;
 };
 
 struct eqc_match_data {
@@ -273,7 +275,8 @@ static void eqc_probe_init_divs(struct device *dev, const struct eqc_match_data
 
 		if (IS_ERR(parent)) {
 			/* Parent is in early clk provider. */
-			parent_data.index = div->parent_idx;
+			parent_data.index = -1;
+			parent_data.name = div->parent_name;
 			parent_data.hw = NULL;
 		} else {
 			/* Avoid clock lookup when we already have the hw reference. */
@@ -305,8 +308,8 @@ static void eqc_probe_init_fixed_factors(struct device *dev,
 
 		if (IS_ERR(parent_hw)) {
 			/* Parent is in early clk provider. */
-			hw = clk_hw_register_fixed_factor_index(dev, ff->name,
-					ff->parent_idx, 0, ff->mult, ff->div);
+			hw = clk_hw_register_fixed_factor(dev, ff->name,
+					ff->parent_name, 0, ff->mult, ff->div);
 		} else {
 			/* Avoid clock lookup when we already have the hw reference. */
 			hw = clk_hw_register_fixed_factor_parent_hw(dev, ff->name,
@@ -487,35 +490,35 @@ static const struct eqc_fixed_factor eqc_eyeq5_early_fixed_factors[] = {
 
 static const struct eqc_fixed_factor eqc_eyeq5_fixed_factors[] = {
 	/* EQ5C_PLL_CPU children */
-	{ EQ5C_CPU_CPC,		"cpc",		1, 1,	EQ5C_CPU_SI_CSS0 },
-	{ EQ5C_CPU_CM,		"cm",		1, 1,	EQ5C_CPU_SI_CSS0 },
-	{ EQ5C_CPU_MEM,		"mem",		1, 1,	EQ5C_CPU_SI_CSS0 },
-	{ EQ5C_CPU_OCC_ISRAM,	"occ-isram",	1, 2,	EQ5C_PLL_CPU },
+	{ EQ5C_CPU_CPC,		"cpc",		1, 1,	EQ5C_CPU_SI_CSS0,	"si-css0" },
+	{ EQ5C_CPU_CM,		"cm",		1, 1,	EQ5C_CPU_SI_CSS0,	"si-css0" },
+	{ EQ5C_CPU_MEM,		"mem",		1, 1,	EQ5C_CPU_SI_CSS0,	"si-css0" },
+	{ EQ5C_CPU_OCC_ISRAM,	"occ-isram",	1, 2,	EQ5C_PLL_CPU,		"pll-cpu" },
 	{ EQ5C_CPU_ISRAM,	"isram",	1, 1,	EQ5C_CPU_OCC_ISRAM },
-	{ EQ5C_CPU_OCC_DBU,	"occ-dbu",	1, 10,	EQ5C_PLL_CPU },
+	{ EQ5C_CPU_OCC_DBU,	"occ-dbu",	1, 10,	EQ5C_PLL_CPU,		"pll-cpu" },
 	{ EQ5C_CPU_SI_DBU_TP,	"si-dbu-tp",	1, 1,	EQ5C_CPU_OCC_DBU },
 
 	/* EQ5C_PLL_VDI children */
-	{ EQ5C_VDI_OCC_VDI,	"occ-vdi",	1, 2,	EQ5C_PLL_VDI },
+	{ EQ5C_VDI_OCC_VDI,	"occ-vdi",	1, 2,	EQ5C_PLL_VDI,		"pll-vdi" },
 	{ EQ5C_VDI_VDI,		"vdi",		1, 1,	EQ5C_VDI_OCC_VDI },
-	{ EQ5C_VDI_OCC_CAN_SER,	"occ-can-ser",	1, 16,	EQ5C_PLL_VDI },
+	{ EQ5C_VDI_OCC_CAN_SER,	"occ-can-ser",	1, 16,	EQ5C_PLL_VDI,		"pll-vdi" },
 	{ EQ5C_VDI_CAN_SER,	"can-ser",	1, 1,	EQ5C_VDI_OCC_CAN_SER },
-	{ EQ5C_VDI_I2C_SER,	"i2c-ser",	1, 20,	EQ5C_PLL_VDI },
+	{ EQ5C_VDI_I2C_SER,	"i2c-ser",	1, 20,	EQ5C_PLL_VDI,		"pll-vdi" },
 
 	/* EQ5C_PLL_PER children */
-	{ EQ5C_PER_PERIPH,	"periph",	1, 1,	EQ5C_PER_OCC },
-	{ EQ5C_PER_CAN,		"can",		1, 1,	EQ5C_PER_OCC },
-	{ EQ5C_PER_SPI,		"spi",		1, 1,	EQ5C_PER_OCC },
-	{ EQ5C_PER_I2C,		"i2c",		1, 1,	EQ5C_PER_OCC },
-	{ EQ5C_PER_TIMER,	"timer",	1, 1,	EQ5C_PER_OCC },
-	{ EQ5C_PER_GPIO,	"gpio",		1, 1,	EQ5C_PER_OCC },
-	{ EQ5C_PER_EMMC,	"emmc-sys",	1, 10,	EQ5C_PLL_PER },
-	{ EQ5C_PER_CCF,		"ccf-ctrl",	1, 4,	EQ5C_PLL_PER },
-	{ EQ5C_PER_OCC_MJPEG,	"occ-mjpeg",	1, 2,	EQ5C_PLL_PER },
+	{ EQ5C_PER_PERIPH,	"periph",	1, 1,	EQ5C_PER_OCC,		 "occ-periph" },
+	{ EQ5C_PER_CAN,		"can",		1, 1,	EQ5C_PER_OCC,		 "occ-periph" },
+	{ EQ5C_PER_SPI,		"spi",		1, 1,	EQ5C_PER_OCC,		 "occ-periph" },
+	{ EQ5C_PER_I2C,		"i2c",		1, 1,	EQ5C_PER_OCC,		 "occ-periph" },
+	{ EQ5C_PER_TIMER,	"timer",	1, 1,	EQ5C_PER_OCC,		 "occ-periph" },
+	{ EQ5C_PER_GPIO,	"gpio",		1, 1,	EQ5C_PER_OCC,		 "occ-periph" },
+	{ EQ5C_PER_EMMC,	"emmc-sys",	1, 10,	EQ5C_PLL_PER,		 "pll-per" },
+	{ EQ5C_PER_CCF,		"ccf-ctrl",	1, 4,	EQ5C_PLL_PER,		 "pll-per" },
+	{ EQ5C_PER_OCC_MJPEG,	"occ-mjpeg",	1, 2,	EQ5C_PLL_PER,		 "pll-per" },
 	{ EQ5C_PER_HSM,		"hsm",		1, 1,	EQ5C_PER_OCC_MJPEG },
 	{ EQ5C_PER_MJPEG,	"mjpeg",	1, 1,	EQ5C_PER_OCC_MJPEG },
-	{ EQ5C_PER_FCMU_A,	"fcmu-a",	1, 20,	EQ5C_PLL_PER },
-	{ EQ5C_PER_OCC_PCI,	"occ-pci-sys",	1, 8,	EQ5C_PLL_PER },
+	{ EQ5C_PER_FCMU_A,	"fcmu-a",	1, 20,	EQ5C_PLL_PER,		 "pll-per" },
+	{ EQ5C_PER_OCC_PCI,	"occ-pci-sys",	1, 8,	EQ5C_PLL_PER,		 "pll-per" },
 };
 
 static const struct eqc_div eqc_eyeq5_divs[] = {
@@ -523,6 +526,7 @@ static const struct eqc_div eqc_eyeq5_divs[] = {
 		.index = EQ5C_DIV_OSPI,
 		.name = "div-ospi",
 		.parent_idx = EQ5C_PLL_PER,
+		.parent_name = "pll-per",
 		.reg = 0x11C,
 		.shift = 0,
 		.width = 4,

-- 
2.51.0


