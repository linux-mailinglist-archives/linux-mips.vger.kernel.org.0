Return-Path: <linux-mips+bounces-12586-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0E4CDBED5
	for <lists+linux-mips@lfdr.de>; Wed, 24 Dec 2025 11:11:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 34E7D30213FC
	for <lists+linux-mips@lfdr.de>; Wed, 24 Dec 2025 10:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EB9B338F36;
	Wed, 24 Dec 2025 10:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iINA6ziD"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4AC3376A2;
	Wed, 24 Dec 2025 10:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766570877; cv=none; b=ayfeY+nEcSpjdjqGWlsRIMsF9gBgOKMgZdEzV9XIua4hhyGXuuHSRAmZmf1XXNNGnJQrB0qK79DZa/NtwFstVBFqVnPJ2QDangM7dHSWNF0oLVaK1lmk+5baaUplImkCy+SeGz5eDt8LJghZcfX9L/sImqwtTRZNKTtYPAM+AaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766570877; c=relaxed/simple;
	bh=BLD8W7ClmHDW/ZXycM/zlyhMswKAsP2V0GhTHkhbva8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lwMfRykGrcRInGusu+jAvbSVKVV3CZS0G9KZtvcceDsgbsa9rkgug8XjwOOkOOTb8tMuAakAQHQsF6yK7E+QlAeUGispDtGqhBPvQWwdKF0nZXoiWkT6uHMw+Irl/hlm02llPIiaeblqo45AEE81h8SfZcc0X9ZNIFWHpmqWIO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iINA6ziD; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DF7194E41D84;
	Wed, 24 Dec 2025 10:07:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B3E516073D;
	Wed, 24 Dec 2025 10:07:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 01B2B10AB1109;
	Wed, 24 Dec 2025 11:07:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766570871; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aVE7hnu1txQ+OMtXUHZgmd5s4b19QEw+eL/+H0f5ckk=;
	b=iINA6ziDkqMzH4ZbO9RJf5+AE1UDO/wWF70yyXCeMSecT3jeZasNps8jHbW9JP2u2/9JfT
	gpACxHtY4Tds0/Ow/S7S/WnXO9Zi2mwTInvxLUis3vggnMIvdjWmMOeZjjDMKKSbeIfhTG
	DDFs6n+NNt4d8wPczLcg2WeVAFpb1d4mZxF1joaq5A0KS/vMklDecAcswjn/Qo5B8A0m7c
	VoK/Sihsb+jVTC3vtLiJaQj58COxOTqWIL2AfjzzSwy9zfTHLaXX8G9hBQgCB5tX3FToyL
	S8xkD2MhC7sGm+y2dpfcxmShG26YQOR0X6DWJh0LWVgYXzlxISbrnK3MdQgu6A==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 24 Dec 2025 11:07:21 +0100
Subject: [PATCH v2 08/10] clk: eyeq: Drop PLL, dividers, and fixed factors
 structs
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251224-clk-eyeq7-v2-8-81744d1025d9@bootlin.com>
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


