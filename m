Return-Path: <linux-mips+bounces-6595-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E94A9B7F44
	for <lists+linux-mips@lfdr.de>; Thu, 31 Oct 2024 16:54:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EA1428237A
	for <lists+linux-mips@lfdr.de>; Thu, 31 Oct 2024 15:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 066B81C6F59;
	Thu, 31 Oct 2024 15:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="j3dDhg6A"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8541BBBE5;
	Thu, 31 Oct 2024 15:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730389991; cv=none; b=sqJFFScX5kQkMqaY2hbtKJEsVhG6KJo+jPGloyWRFnhKVuOV16uaLBJnbvvgI4ApWw5EPHywt1QFtyAPp6ZcuVJRJfIyZ99oW3+djejHbo0O6rBit5+aof7LUC3h4tcKKUG87XOzn8r/W56JlYaxBAl60os9kjP49/Vh7os6sWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730389991; c=relaxed/simple;
	bh=D6YiasuUdXolLDdfIbpCPcpZZypNlcg3gn0qVUQ+fA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MRI1ZBvxxFGwAxkiDausi7yp0EjqE4D3fKq/d4YnCGSSfIjAPWCKm7CQf3Sq+wG0sJzfE8O3d0Am+a9fQhPzVbp1O9AW0RCmR/JmdAiXpWmNCCc3bGwKNf6VhSKeNBqQemkZd3fXyN2GXa0aRIYiLTQSXUTx8QLRiGuNZdtbYMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=j3dDhg6A; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 119DF1C000B;
	Thu, 31 Oct 2024 15:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730389981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G518BfRB+SDjVWzkdrr74EZK8dQU+mBfUeQH9gtkcWs=;
	b=j3dDhg6AN1+BOWCX2cKiYnOgVLpxzw9POFt+P0Vyuwv3sqXPYURKFd9f8TouCNTsYiqgMx
	0kFDa/Y2r26IeY18/2QPoXcqXGqdoWTWp0WhVwJBqfh+K9shXuVinDrG1sSxNrwr9IGzhS
	GN0OWxlgJra4qW8Kos1sZbFQ2bWE+sbkfpUlU3G+sc6msK99Y/f5ADl/CuG7K5TOKA50RM
	Bl8kicnGo4jJ5b6IlX5o6O8rsqCTFelE6DAygMr3mvxylpXzpzFP9l61RKvWpRS8pnJo4R
	k/BueSPIqJb8E1La1+6oWpa/DadPyXYqwZZiyUgtpg6u4OBXFplQLZbKs4gx3Q==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 31 Oct 2024 16:52:58 +0100
Subject: [PATCH 08/13] clk: eyeq: add fixed factor clocks infrastructure
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241031-mbly-clk-v1-8-89d8b28e3006@bootlin.com>
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

Driver can currently host two types of clocks:
 - PLLs derived directly from the main crystal (taken using a fwhandle).
 - Divider clocks derived from those PLLs.

PLLs can be instantiated from of_clk_init() or platform device probe,
using two separate clock providers. Divider clocks are all instantiated
at platform device probe.

Add a third type of clocks: fixed factors. Those can be instantiated at
both stages. They can be parented to any clock from the driver. Early
match data and match data store the list of fixed factor clocks.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/clk/clk-eyeq.c | 81 +++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 73 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index ed4dab303d9121cd8bf453448b4c86547ea9244c..dcd1d996255fc97449ac1bccb6a7c810d6e4c9db 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -2,11 +2,14 @@
 /*
  * PLL clock driver for the Mobileye EyeQ5, EyeQ6L and EyeQ6H platforms.
  *
- * This controller handles read-only PLLs, all derived from the same main
- * crystal clock. It also exposes divider clocks, those are children to PLLs.
- * Parent clock is expected to be constant. This driver's registers live in
- * a shared region called OLB. Some PLLs are initialised early by of_clk_init();
- * if so, two clk providers are registered.
+ * This controller handles:
+ *  - Read-only PLLs, all derived from the same main crystal clock.
+ *  - It also exposes divider clocks, those are children to PLLs.
+ *  - Fixed factor clocks, children to PLLs.
+ *
+ * Parent clock is expected to be constant. This driver's registers live in a
+ * shared region called OLB. Some PLLs and fixed-factors are initialised early
+ * by of_clk_init(); if so, two clk providers are registered.
  *
  * We use eqc_ as prefix, as-in "EyeQ Clock", but way shorter.
  *
@@ -86,6 +89,14 @@ struct eqc_div {
 	u8		width;
 };
 
+struct eqc_fixed_factor {
+	unsigned int	index;
+	const char	*name;
+	unsigned int	mult;
+	unsigned int	div;
+	unsigned int	parent;
+};
+
 struct eqc_match_data {
 	unsigned int		pll_count;
 	const struct eqc_pll	*plls;
@@ -93,6 +104,9 @@ struct eqc_match_data {
 	unsigned int		div_count;
 	const struct eqc_div	*divs;
 
+	unsigned int			fixed_factor_count;
+	const struct eqc_fixed_factor	*fixed_factors;
+
 	const char		*reset_auxdev_name;
 	const char		*pinctrl_auxdev_name;
 
@@ -103,6 +117,9 @@ struct eqc_early_match_data {
 	unsigned int		early_pll_count;
 	const struct eqc_pll	*early_plls;
 
+	unsigned int			early_fixed_factor_count;
+	const struct eqc_fixed_factor	*early_fixed_factors;
+
 	/*
 	 * We want our of_xlate callback to EPROBE_DEFER instead of dev_err()
 	 * and EINVAL. For that, we must know the total clock count.
@@ -276,6 +293,35 @@ static void eqc_probe_init_divs(struct device *dev, const struct eqc_match_data
 	}
 }
 
+static void eqc_probe_init_fixed_factors(struct device *dev,
+					 const struct eqc_match_data *data,
+					 struct clk_hw_onecell_data *cells)
+{
+	const struct eqc_fixed_factor *ff;
+	struct clk_hw *hw, *parent_hw;
+	unsigned int i;
+
+	for (i = 0; i < data->fixed_factor_count; i++) {
+		ff = &data->fixed_factors[i];
+		parent_hw = cells->hws[ff->parent];
+
+		if (IS_ERR(parent_hw)) {
+			/* Parent is in early clk provider. */
+			hw = clk_hw_register_fixed_factor_index(dev, ff->name,
+					ff->parent, 0, ff->mult, ff->div);
+		} else {
+			/* Avoid clock lookup when we already have the hw reference. */
+			hw = clk_hw_register_fixed_factor_parent_hw(dev, ff->name,
+					parent_hw, 0, ff->mult, ff->div);
+		}
+
+		cells->hws[ff->index] = hw;
+		if (IS_ERR(hw))
+			dev_warn(dev, "failed registering %s: %pe\n",
+				 ff->name, hw);
+	}
+}
+
 static void eqc_auxdev_release(struct device *dev)
 {
 	struct auxiliary_device *adev = to_auxiliary_dev(dev);
@@ -349,10 +395,11 @@ static int eqc_probe(struct platform_device *pdev)
 				 KBUILD_MODNAME, data->pinctrl_auxdev_name, ret);
 	}
 
-	if (data->pll_count + data->div_count == 0)
+	if (data->pll_count + data->div_count + data->fixed_factor_count == 0)
 		return 0; /* Zero clocks, we are done. */
 
-	clk_count = data->pll_count + data->div_count + data->early_clk_count;
+	clk_count = data->pll_count + data->div_count +
+		    data->fixed_factor_count + data->early_clk_count;
 	cells = kzalloc(struct_size(cells, hws, clk_count), GFP_KERNEL);
 	if (!cells)
 		return -ENOMEM;
@@ -367,6 +414,8 @@ static int eqc_probe(struct platform_device *pdev)
 
 	eqc_probe_init_divs(dev, data, base, cells);
 
+	eqc_probe_init_fixed_factors(dev, data, cells);
+
 	return of_clk_add_hw_provider(np, of_clk_hw_onecell_get, cells);
 }
 
@@ -580,7 +629,8 @@ static void __init eqc_early_init(struct device_node *np,
 	void __iomem *base;
 	int ret;
 
-	clk_count = early_data->early_pll_count + early_data->late_clk_count;
+	clk_count = early_data->early_pll_count + early_data->early_fixed_factor_count +
+		    early_data->late_clk_count;
 	cells = kzalloc(struct_size(cells, hws, clk_count), GFP_KERNEL);
 	if (!cells) {
 		ret = -ENOMEM;
@@ -633,6 +683,21 @@ static void __init eqc_early_init(struct device_node *np,
 		}
 	}
 
+	for (i = 0; i < early_data->early_fixed_factor_count; i++) {
+		const struct eqc_fixed_factor *ff = &early_data->early_fixed_factors[i];
+		struct clk_hw *parent_hw = cells->hws[ff->parent];
+		struct clk_hw *hw;
+
+		hw = clk_hw_register_fixed_factor_parent_hw(NULL,
+				ff->name, parent_hw, 0, ff->mult, ff->div);
+		cells->hws[ff->index] = hw;
+		if (IS_ERR(hw)) {
+			pr_err("failed registering %s: %pe\n", ff->name, hw);
+			ret = PTR_ERR(hw);
+			goto err;
+		}
+	}
+
 	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, cells);
 	if (ret) {
 		pr_err("failed registering clk provider: %d\n", ret);

-- 
2.47.0


