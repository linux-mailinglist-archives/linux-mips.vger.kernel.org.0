Return-Path: <linux-mips+bounces-11003-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DB1B41FCA
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 14:50:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4EFDC4E4D2A
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 12:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E3733074B4;
	Wed,  3 Sep 2025 12:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MDKetlJE"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B50302CAC
	for <linux-mips@vger.kernel.org>; Wed,  3 Sep 2025 12:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756903682; cv=none; b=uDov076nQzMS3qZCk8ofzVY5877f4eNcY99X8tePJqL7iSH0c4BkhMyrYEFFqrvSBNtmoQZ1G/jW/8KrPEdbU1Zb7M+krXROTNxBWvOUYG+xSdaQ3+cH+wVuYTaB4AEwW4+H4tgzajMAN8BYnoIgARqEcwLIfwXDt+LxMvGAmSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756903682; c=relaxed/simple;
	bh=t9Cj2vsk9A2IypF0ZbhgnScvYQTKAJSuu1sLgL93Sw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TrtN6P4htfyHBIGYzVXquymiYBDEdXkMcNfuti0SmSY7PDULztwGl8s4n0eZ5VWFoi2td7lPHWAD2iVHSrXobDFKFnF+ESMDyRV/Obc/tcYNERhDLISN9tL2reMbCz7dOwcns7GPWoKSBXwgHMW89HRK4rAQT3WGK/U+D2TX/dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MDKetlJE; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 61200C8EC77;
	Wed,  3 Sep 2025 12:47:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 72788606C3;
	Wed,  3 Sep 2025 12:47:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 100511C228A5D;
	Wed,  3 Sep 2025 14:47:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756903675; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cG4E+ChNi7Pq9aaCdZ3+CMHo9z6hvO9a8YfEiX5GW9w=;
	b=MDKetlJEgtj5kCgTTIDxg7bUP//0qIPgaS2Y99jXiJ4vb9v0pATsiERS2r8tFnY4Ifxnry
	gQV58rNFDRbX9gxdlPbOzhvdYV3NyoV5oCbRAfyaoYbbDc7MtrXjnEn4Xqrdt/NThvfLvf
	Q/XNBsp3z5m4PCrtPo54D315K+lmO4zjzaDY57JR8ObJ9ujozEUo74UjEyTtL/A0v8C6JS
	ixFPTehfn7wlegKeOtmTc78AcIGLHGkrvAZOKDCnTfhLZAEKStzdcuZ8pruJBnIyEnPmCM
	pJnKCpbxiLEy5SK0Nvgia3I8Xcr28Xe88lonYnKtmXvK3017XH4And8R5UjiwA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 03 Sep 2025 14:47:18 +0200
Subject: [PATCH 11/19] clk: eyeq: rename the parent field to parent_idx
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250903-clk-eyeq7-v1-11-3f5024b5d6e2@bootlin.com>
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

Make some room for introducing a new field to refer to the parent clock
by its name for divisors and fixed factors.

No functional code change in this patch, this is a rename only.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/clk/clk-eyeq.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index cbba4a21cca47efb8ab554ecf7322e47437c9c6a..89e0782b5cbe16a7c2010d9d441ace139fd0deb5 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -83,7 +83,7 @@ struct eqc_pll {
 struct eqc_div {
 	unsigned int	index;
 	const char	*name;
-	unsigned int	parent;
+	unsigned int	parent_idx;
 	unsigned int	reg;
 	u8		shift;
 	u8		width;
@@ -94,7 +94,7 @@ struct eqc_fixed_factor {
 	const char	*name;
 	unsigned int	mult;
 	unsigned int	div;
-	unsigned int	parent;
+	unsigned int	parent_idx;
 };
 
 struct eqc_match_data {
@@ -269,11 +269,11 @@ static void eqc_probe_init_divs(struct device *dev, const struct eqc_match_data
 	for (i = 0; i < data->div_count; i++) {
 		div = &data->divs[i];
 		reg = base + div->reg;
-		parent = cells->hws[div->parent];
+		parent = cells->hws[div->parent_idx];
 
 		if (IS_ERR(parent)) {
 			/* Parent is in early clk provider. */
-			parent_data.index = div->parent;
+			parent_data.index = div->parent_idx;
 			parent_data.hw = NULL;
 		} else {
 			/* Avoid clock lookup when we already have the hw reference. */
@@ -301,12 +301,12 @@ static void eqc_probe_init_fixed_factors(struct device *dev,
 
 	for (i = 0; i < data->fixed_factor_count; i++) {
 		ff = &data->fixed_factors[i];
-		parent_hw = cells->hws[ff->parent];
+		parent_hw = cells->hws[ff->parent_idx];
 
 		if (IS_ERR(parent_hw)) {
 			/* Parent is in early clk provider. */
 			hw = clk_hw_register_fixed_factor_index(dev, ff->name,
-					ff->parent, 0, ff->mult, ff->div);
+					ff->parent_idx, 0, ff->mult, ff->div);
 		} else {
 			/* Avoid clock lookup when we already have the hw reference. */
 			hw = clk_hw_register_fixed_factor_parent_hw(dev, ff->name,
@@ -522,7 +522,7 @@ static const struct eqc_div eqc_eyeq5_divs[] = {
 	{
 		.index = EQ5C_DIV_OSPI,
 		.name = "div-ospi",
-		.parent = EQ5C_PLL_PER,
+		.parent_idx = EQ5C_PLL_PER,
 		.reg = 0x11C,
 		.shift = 0,
 		.width = 4,
@@ -597,7 +597,7 @@ static const struct eqc_div eqc_eyeq6h_south_divs[] = {
 	{
 		.index = EQ6HC_SOUTH_DIV_EMMC,
 		.name = "div-emmc",
-		.parent = EQ6HC_SOUTH_PLL_PER,
+		.parent_idx = EQ6HC_SOUTH_PLL_PER,
 		.reg = 0x070,
 		.shift = 4,
 		.width = 4,
@@ -605,7 +605,7 @@ static const struct eqc_div eqc_eyeq6h_south_divs[] = {
 	{
 		.index = EQ6HC_SOUTH_DIV_OSPI_REF,
 		.name = "div-ospi-ref",
-		.parent = EQ6HC_SOUTH_PLL_PER,
+		.parent_idx = EQ6HC_SOUTH_PLL_PER,
 		.reg = 0x090,
 		.shift = 4,
 		.width = 4,
@@ -613,7 +613,7 @@ static const struct eqc_div eqc_eyeq6h_south_divs[] = {
 	{
 		.index = EQ6HC_SOUTH_DIV_OSPI_SYS,
 		.name = "div-ospi-sys",
-		.parent = EQ6HC_SOUTH_PLL_PER,
+		.parent_idx = EQ6HC_SOUTH_PLL_PER,
 		.reg = 0x090,
 		.shift = 8,
 		.width = 1,
@@ -621,7 +621,7 @@ static const struct eqc_div eqc_eyeq6h_south_divs[] = {
 	{
 		.index = EQ6HC_SOUTH_DIV_TSU,
 		.name = "div-tsu",
-		.parent = EQ6HC_SOUTH_PLL_PCIE,
+		.parent_idx = EQ6HC_SOUTH_PLL_PCIE,
 		.reg = 0x098,
 		.shift = 4,
 		.width = 8,
@@ -790,7 +790,7 @@ static void __init eqc_early_init(struct device_node *np,
 
 	for (i = 0; i < early_data->early_fixed_factor_count; i++) {
 		const struct eqc_fixed_factor *ff = &early_data->early_fixed_factors[i];
-		struct clk_hw *parent_hw = cells->hws[ff->parent];
+		struct clk_hw *parent_hw = cells->hws[ff->parent_idx];
 		struct clk_hw *hw;
 
 		hw = clk_hw_register_fixed_factor_parent_hw(NULL, ff->name,

-- 
2.51.0


