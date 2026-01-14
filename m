Return-Path: <linux-mips+bounces-12926-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26260D1DD5C
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 11:08:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9240B30445E3
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 10:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0647D38B9B3;
	Wed, 14 Jan 2026 10:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="I3F5Oj7L"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D858E38A735
	for <linux-mips@vger.kernel.org>; Wed, 14 Jan 2026 10:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768385152; cv=none; b=BgtUerkqgdwrnwr1iFa3j10Z98lhn16DUaRBslZ3vwIFYwDhdDyukpisJMywPAas+OHrN5qcg4nUzjlQbaBsCaUfxalWZw8NEC27+vgDubnEOXgoinbLYTMakc3bp9jdqdtBphlftVeu/ffzG1JJWkx9HBHc/D57F9zZRpBa74s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768385152; c=relaxed/simple;
	bh=BLD8W7ClmHDW/ZXycM/zlyhMswKAsP2V0GhTHkhbva8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nzmMqqiFKsW8Rekx9aYBUrk3x+MxUor4vkwbdF8HGv2iPgDBt5u7ZAp+kgBqrSCKjJrfhNZLKA6m9maJj61IK7nuW+T7425fHQ9Z+lFSPtJZZRK7UqBY/aHEzO1YMm2NTOluiywLwJ7aMaPeoNUz+rWLBi0NikHR9uhK/+nOHBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=I3F5Oj7L; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1E93A4E420B6;
	Wed, 14 Jan 2026 10:05:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E2B9E6074A;
	Wed, 14 Jan 2026 10:05:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 45CAB103C89F1;
	Wed, 14 Jan 2026 11:05:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768385147; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aVE7hnu1txQ+OMtXUHZgmd5s4b19QEw+eL/+H0f5ckk=;
	b=I3F5Oj7LRIgtjuwauCPzjv31mQW/LC6bqM43oot1YAoujmwUEsVOkyMWuPU8+WkeNIc7GJ
	9Sx4Ov3ENoBPC5TbT/1uKfcErjMlbYtjRHDa3hiueWE4u4dNTym5wVXGnwkCD/nDTosCgp
	MfS0VTVyW+wqd3fOqN1aSQOLH7Th/EkMxxJAHf1s3C6Len4qbqZtHuuODuHQle+vfrNXsl
	H+5q1j6jBapbC9n2mdoBA+UceATrp6socnxR+Fq6rwuUhKTNB9Sr9bywBPKdkwlujGOu+j
	4IpRpm3P3QNGchiTbrcu4GsJVrzc1f4vbdUbP4nQ0fzcshWQDKpXmTjXvXjVKQ==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 14 Jan 2026 11:05:12 +0100
Subject: [PATCH v3 08/10] clk: eyeq: Drop PLL, dividers, and fixed factors
 structs
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260114-clk-eyeq7-v3-8-8ebdba7b0133@bootlin.com>
References: <20260114-clk-eyeq7-v3-0-8ebdba7b0133@bootlin.com>
In-Reply-To: <20260114-clk-eyeq7-v3-0-8ebdba7b0133@bootlin.com>
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

Now that there are no users of the eqc_pll, eqc_div, and eqc_fixed_factor
structures since they have been converted to eqc_clock, remove these
structs and the code related to their parsing in probe and early
initialization.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/clk/clk-eyeq.c | 192 +------------------------------------------------
 1 file changed, 3 insertions(+), 189 deletions(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index 7a4b465d87fb..a1221f30c16b 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -78,33 +78,6 @@
 #define PARENT_BY_FWNAME			(-1)
 #define PARENT_BY_NAME				(-2)
 
-struct eqc_pll {
-	unsigned int	index;
-	const char	*name;
-	unsigned int	reg64;
-};
-
-/*
- * Divider clock. Divider is 2*(v+1), with v the register value.
- * Min divider is 2, max is 2*(2^width).
- */
-struct eqc_div {
-	unsigned int	index;
-	const char	*name;
-	unsigned int	parent;
-	unsigned int	reg;
-	u8		shift;
-	u8		width;
-};
-
-struct eqc_fixed_factor {
-	unsigned int	index;
-	const char	*name;
-	unsigned int	mult;
-	unsigned int	div;
-	unsigned int	parent;
-};
-
 struct eqc_clock {
 	int		index;
 	int		parent_idx;
@@ -132,15 +105,6 @@ struct eqc_clock {
 };
 
 struct eqc_match_data {
-	unsigned int		pll_count;
-	const struct eqc_pll	*plls;
-
-	unsigned int		div_count;
-	const struct eqc_div	*divs;
-
-	unsigned int			fixed_factor_count;
-	const struct eqc_fixed_factor	*fixed_factors;
-
 	unsigned int		clk_count;
 	const struct eqc_clock	*clks;
 
@@ -151,12 +115,6 @@ struct eqc_match_data {
 };
 
 struct eqc_early_match_data {
-	unsigned int		early_pll_count;
-	const struct eqc_pll	*early_plls;
-
-	unsigned int			early_fixed_factor_count;
-	const struct eqc_fixed_factor	*early_fixed_factors;
-
 	unsigned int		early_clk_count;
 	const struct eqc_clock	*early_clks;
 
@@ -269,97 +227,6 @@ static int eqc_pll_parse_fracg(void __iomem *base, unsigned long *mult,
 	return 0;
 }
 
-static void eqc_probe_init_plls(struct device *dev, const struct eqc_match_data *data,
-				void __iomem *base, struct clk_hw_onecell_data *cells)
-{
-	unsigned long mult, div, acc;
-	const struct eqc_pll *pll;
-	struct clk_hw *hw;
-	unsigned int i;
-	int ret;
-
-	for (i = 0; i < data->pll_count; i++) {
-		pll = &data->plls[i];
-
-		ret = eqc_pll_parse_fracg(base + pll->reg64, &mult, &div, &acc);
-		if (ret) {
-			dev_warn(dev, "failed parsing state of %s\n", pll->name);
-			cells->hws[pll->index] = ERR_PTR(ret);
-			continue;
-		}
-
-		hw = clk_hw_register_fixed_factor_with_accuracy_fwname(dev,
-				dev->of_node, pll->name, "ref", 0, mult, div, acc);
-		cells->hws[pll->index] = hw;
-		if (IS_ERR(hw))
-			dev_warn(dev, "failed registering %s: %pe\n", pll->name, hw);
-	}
-}
-
-static void eqc_probe_init_divs(struct device *dev, const struct eqc_match_data *data,
-				void __iomem *base, struct clk_hw_onecell_data *cells)
-{
-	struct clk_parent_data parent_data = { };
-	const struct eqc_div *div;
-	struct clk_hw *parent;
-	void __iomem *reg;
-	struct clk_hw *hw;
-	unsigned int i;
-
-	for (i = 0; i < data->div_count; i++) {
-		div = &data->divs[i];
-		reg = base + div->reg;
-		parent = cells->hws[div->parent];
-
-		if (IS_ERR(parent)) {
-			/* Parent is in early clk provider. */
-			parent_data.index = div->parent;
-			parent_data.hw = NULL;
-		} else {
-			/* Avoid clock lookup when we already have the hw reference. */
-			parent_data.index = 0;
-			parent_data.hw = parent;
-		}
-
-		hw = clk_hw_register_divider_table_parent_data(dev, div->name,
-				&parent_data, 0, reg, div->shift, div->width,
-				CLK_DIVIDER_EVEN_INTEGERS, NULL, NULL);
-		cells->hws[div->index] = hw;
-		if (IS_ERR(hw))
-			dev_warn(dev, "failed registering %s: %pe\n",
-				 div->name, hw);
-	}
-}
-
-static void eqc_probe_init_fixed_factors(struct device *dev,
-					 const struct eqc_match_data *data,
-					 struct clk_hw_onecell_data *cells)
-{
-	const struct eqc_fixed_factor *ff;
-	struct clk_hw *hw, *parent_hw;
-	unsigned int i;
-
-	for (i = 0; i < data->fixed_factor_count; i++) {
-		ff = &data->fixed_factors[i];
-		parent_hw = cells->hws[ff->parent];
-
-		if (IS_ERR(parent_hw)) {
-			/* Parent is in early clk provider. */
-			hw = clk_hw_register_fixed_factor_index(dev, ff->name,
-					ff->parent, 0, ff->mult, ff->div);
-		} else {
-			/* Avoid clock lookup when we already have the hw reference. */
-			hw = clk_hw_register_fixed_factor_parent_hw(dev, ff->name,
-					parent_hw, 0, ff->mult, ff->div);
-		}
-
-		cells->hws[ff->index] = hw;
-		if (IS_ERR(hw))
-			dev_warn(dev, "failed registering %s: %pe\n",
-				 ff->name, hw);
-	}
-}
-
 static void eqc_auxdev_release(struct device *dev)
 {
 	struct auxiliary_device *adev = to_auxiliary_dev(dev);
@@ -528,12 +395,10 @@ static int eqc_probe(struct platform_device *pdev)
 				 KBUILD_MODNAME, data->pinctrl_auxdev_name, ret);
 	}
 
-	if (data->pll_count + data->div_count + data->fixed_factor_count + data->clk_count == 0)
+	if (data->clk_count == 0)
 		return 0; /* Zero clocks, we are done. */
 
-	clk_count = data->pll_count + data->div_count +
-		    data->fixed_factor_count + data->clk_count
-		    + data->early_clk_count;
+	clk_count = data->clk_count + data->early_clk_count;
 	cells = kzalloc(struct_size(cells, hws, clk_count), GFP_KERNEL);
 	if (!cells)
 		return -ENOMEM;
@@ -544,12 +409,6 @@ static int eqc_probe(struct platform_device *pdev)
 	for (i = 0; i < clk_count; i++)
 		cells->hws[i] = ERR_PTR(-EINVAL);
 
-	eqc_probe_init_plls(dev, data, base, cells);
-
-	eqc_probe_init_divs(dev, data, base, cells);
-
-	eqc_probe_init_fixed_factors(dev, data, cells);
-
 	for (i = 0; i < data->clk_count; i++) {
 		const struct eqc_clock *clk = &data->clks[i];
 
@@ -898,8 +757,7 @@ static void __init eqc_early_init(struct device_node *np,
 	void __iomem *base;
 	int ret;
 
-	clk_count = early_data->early_pll_count + early_data->early_fixed_factor_count +
-		    early_data->early_clk_count + early_data->late_clk_count;
+	clk_count = early_data->early_clk_count + early_data->late_clk_count;
 	cells = kzalloc(struct_size(cells, hws, clk_count), GFP_KERNEL);
 	if (!cells) {
 		ret = -ENOMEM;
@@ -925,42 +783,6 @@ static void __init eqc_early_init(struct device_node *np,
 		goto err;
 	}
 
-	for (i = 0; i < early_data->early_pll_count; i++) {
-		const struct eqc_pll *pll = &early_data->early_plls[i];
-		unsigned long mult, div, acc;
-		struct clk_hw *hw;
-
-		ret = eqc_pll_parse_fracg(base + pll->reg64, &mult, &div, &acc);
-		if (ret) {
-			pr_err("failed parsing state of %s\n", pll->name);
-			goto err;
-		}
-
-		hw = clk_hw_register_fixed_factor_with_accuracy_fwname(NULL,
-				np, pll->name, "ref", 0, mult, div, acc);
-		cells->hws[pll->index] = hw;
-		if (IS_ERR(hw)) {
-			pr_err("failed registering %s: %pe\n", pll->name, hw);
-			ret = PTR_ERR(hw);
-			goto err;
-		}
-	}
-
-	for (i = 0; i < early_data->early_fixed_factor_count; i++) {
-		const struct eqc_fixed_factor *ff = &early_data->early_fixed_factors[i];
-		struct clk_hw *parent_hw = cells->hws[ff->parent];
-		struct clk_hw *hw;
-
-		hw = clk_hw_register_fixed_factor_parent_hw(NULL, ff->name,
-				parent_hw, 0, ff->mult, ff->div);
-		cells->hws[ff->index] = hw;
-		if (IS_ERR(hw)) {
-			pr_err("failed registering %s: %pe\n", ff->name, hw);
-			ret = PTR_ERR(hw);
-			goto err;
-		}
-	}
-
 	for (i = 0; i < early_data->early_clk_count; i++) {
 		const struct eqc_clock *clk = &early_data->early_clks[i];
 
@@ -995,14 +817,6 @@ static void __init eqc_early_init(struct device_node *np,
 	if (cells) {
 		of_clk_del_provider(np);
 
-		for (i = 0; i < early_data->early_pll_count; i++) {
-			const struct eqc_pll *pll = &early_data->early_plls[i];
-			struct clk_hw *hw = cells->hws[pll->index];
-
-			if (!IS_ERR_OR_NULL(hw))
-				clk_hw_unregister_fixed_factor(hw);
-		}
-
 		for (i = 0; i < early_data->early_clk_count; i++) {
 			const struct eqc_clock *clk = &early_data->early_clks[i];
 			struct clk_hw *hw = cells->hws[clk->index];

-- 
2.52.0


