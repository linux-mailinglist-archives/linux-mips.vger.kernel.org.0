Return-Path: <linux-mips+bounces-12584-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B08CDBEBE
	for <lists+linux-mips@lfdr.de>; Wed, 24 Dec 2025 11:09:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5B33306A534
	for <lists+linux-mips@lfdr.de>; Wed, 24 Dec 2025 10:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B66B03375CF;
	Wed, 24 Dec 2025 10:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="EyQissBp"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0824E334C1B;
	Wed, 24 Dec 2025 10:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766570873; cv=none; b=KVc4cO3jrwY8B1uiA8AJWRG5mySgK+6pdlR0ezRUsKKWd9Gz1jIDz33iyDw0zPLKlSLRFnippW2yNokvJNOqpolTr2OXON1YWntZguGyTkT7YSfsI1DHpHQnF8bzDKvmLsnXZcocN32Q8DfkYz/kpnEhCZmigar8WD97vzpsuCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766570873; c=relaxed/simple;
	bh=3y7N2kmP84LrzRCn7KASbw7y1n4t0D5QagCtuBBNiTI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kmrZ3UC2kkzSJiTCn/gcbWvzDLltqSEeqO1/qQnOWG41qDHr2mIk3Pae3ra5NAS+pWRjpjbtIwBSaSMAuryaPvZV+iA7sfzBJTIh3WiDzPRGAaUlfmIpbH+qXUFUEUWdp0r4iU4aVNwM4RDLvlotspVz0tXYw3FXpSlcBCkfhcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=EyQissBp; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 800DDC1A59E;
	Wed, 24 Dec 2025 10:07:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A34936073D;
	Wed, 24 Dec 2025 10:07:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 248D610AB1106;
	Wed, 24 Dec 2025 11:07:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766570867; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0u8zn5SVsgsbUW22/EktpM9DDoj4XnL9G6kWR7e+CuM=;
	b=EyQissBpvcxPa4hYpqXrbTVU5bmvL696NYmIyu+ApwxxFlp7Rl/Bt1yRqSsApFC4oBemBK
	7oF3kcnIGA3sttzRH6p6g1vJNl5MlwsRSHWDWul08fsNC+iw8cUxrJcX9IjfoIPYCHPQDn
	CgSdMSgYWPe2xGpvcOBZzd1g0dpb4sGdQ78FXNXMMfLUj67ykS6gV7hIIdwz5TQDV9+tLR
	6Knq6VHXGX6q1d1bNQ2wq/XqWrMmoDE2fzaw98YudwjcLnSAQuhIxO09hqmCiUxJpVHTae
	VcTHYAJdFHBinPXVi6fgF3rn6gduuPXDZk9HzkP098Ld1/d8WkXlFW60abhTgw==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 24 Dec 2025 11:07:19 +0100
Subject: [PATCH v2 06/10] clk: eyeq: Introduce a generic clock type
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251224-clk-eyeq7-v2-6-81744d1025d9@bootlin.com>
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

Currently, the clocks contained in the OLB are represented as three
separate structures: PLL, dividers and fixed factors. These clock objects
are stored in three separate arrays in the match data and registered in
a fixed order: first the PLL, then the dividers, and finally the fixed
factors. While this is sufficient for the clocks found in the OLB of
the EyeQ5 and EyeQ6, it does not allow declaring the more complex clock
interdependencies for those found in the OLB of the EyeQ7H.

We add a new type of clock represented by the struct eqc_clock that covers
all types of clocks found in OLB. It contains the clock index and its
name, alongside the parent clock index and name. The index refers to
the position in the array of clk_hw in the struct clk_hw_onecell_data
that is filled when registering the clocks. The parent name is optional
and can refer to the parent clock either via the device tree or via
its globally unique name. Two special index values are used to select
which type of lookup is done. The function eqc_fill_parent_data() fill
a clk_parent_data structure based on the parent index and name values.

The struct eqc_clock also contains two function pointers: .probe()
and .unregister(). The probe() function parses the eqc_clock structure,
registers a new clock as a clk_hw and adds it to the clk_hw_onecell_data
structure. It can be called during probe and early init.  The unregister()
function unregisters the clk_hw. This patch adds the probe functions
for the PLLs, the dividers and the fixed factors found in the EyeQ OLB.

Finally, a union is also part of the eqc_clock structure to store the
data specific to each type of clock.

To help in declaring struct eqc_clock, three macros are added. They set
the correct function pointers for .probe() and .unregister() based on
the type of clock being declared.

An array of eqc_clock is added to the match data and early match
data. They are parsed during probe and early initialization respectively.

There is no user yet of the eqc_clock structure.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/clk/clk-eyeq.c | 211 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 208 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index 20046e8d4713..bcf36c434049 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -71,6 +71,13 @@
 #define FRACG_PCSR1_DOWN_SPREAD			BIT(11)
 #define FRACG_PCSR1_FRAC_IN			GENMASK(31, 12)
 
+/*
+ * Special index values to lookup a parent clock by its name
+ * from the device tree or by its globally unique name.
+ */
+#define PARENT_BY_FWNAME			(-1)
+#define PARENT_BY_NAME				(-2)
+
 struct eqc_pll {
 	unsigned int	index;
 	const char	*name;
@@ -98,6 +105,32 @@ struct eqc_fixed_factor {
 	unsigned int	parent;
 };
 
+struct eqc_clock {
+	int		index;
+	int		parent_idx;
+	const char	*name;
+	const char	*parent_name;
+	int		(*probe)(struct device *dev, struct device_node *np,
+				 const struct eqc_clock *clk, void __iomem *base,
+				 struct clk_hw_onecell_data *cells);
+	void		(*unregister)(struct clk_hw *hw);
+	union {
+		struct {
+			unsigned int			reg;
+			u8				shift;
+			u8				width;
+			const struct clk_div_table	*table;
+		} div;
+		struct {
+			unsigned int			mult;
+			unsigned int			div;
+		} ff;
+		struct {
+			unsigned int			reg;
+		} pll;
+	};
+};
+
 struct eqc_match_data {
 	unsigned int		pll_count;
 	const struct eqc_pll	*plls;
@@ -108,6 +141,9 @@ struct eqc_match_data {
 	unsigned int			fixed_factor_count;
 	const struct eqc_fixed_factor	*fixed_factors;
 
+	unsigned int		clk_count;
+	const struct eqc_clock	*clks;
+
 	const char		*reset_auxdev_name;
 	const char		*pinctrl_auxdev_name;
 
@@ -121,6 +157,9 @@ struct eqc_early_match_data {
 	unsigned int			early_fixed_factor_count;
 	const struct eqc_fixed_factor	*early_fixed_factors;
 
+	unsigned int		early_clk_count;
+	const struct eqc_clock	*early_clks;
+
 	/*
 	 * We want our of_xlate callback to EPROBE_DEFER instead of dev_err()
 	 * and EINVAL. For that, we must know the total clock count.
@@ -355,6 +394,101 @@ static int eqc_auxdev_create(struct device *dev, void __iomem *base,
 	return ret;
 }
 
+static int eqc_fill_parent_data(const struct eqc_clock *clk,
+				struct clk_hw_onecell_data *cells,
+				struct clk_parent_data *parent_data)
+{
+	int pidx = clk->parent_idx;
+
+	memset(parent_data, 0, sizeof(struct clk_parent_data));
+
+	if (pidx == PARENT_BY_FWNAME) {
+		/* lookup the parent clock by its fw_name */
+		parent_data->index = -1;
+		parent_data->fw_name = clk->parent_name;
+	} else if (pidx == PARENT_BY_NAME) {
+		/* lookup the parent clock by its global name */
+		parent_data->index = -1;
+		parent_data->name = clk->parent_name;
+	} else if (pidx >= 0 && pidx < cells->num && !IS_ERR(cells->hws[pidx])) {
+		/* get the parent hw directly */
+		parent_data->hw = cells->hws[pidx];
+	} else {
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int eqc_probe_divider(struct device *dev, struct device_node *np,
+			     const struct eqc_clock *clk, void __iomem *base,
+			     struct clk_hw_onecell_data *cells)
+{
+	struct clk_parent_data parent_data;
+	struct clk_hw *hw;
+	int ret;
+
+	ret = eqc_fill_parent_data(clk, cells, &parent_data);
+	if (ret)
+		return ret;
+
+	hw = clk_hw_register_divider_table_parent_data(dev, clk->name,
+			&parent_data, 0, base + clk->div.reg, clk->div.shift, clk->div.width,
+			clk->div.table ? 0 : CLK_DIVIDER_EVEN_INTEGERS, clk->div.table, NULL);
+	if (IS_ERR(hw))
+		return IS_ERR(hw);
+
+	cells->hws[clk->index] = hw;
+	return 0;
+}
+
+static int eqc_probe_fixed_factor(struct device *dev, struct device_node *np,
+				  const struct eqc_clock *clk, void __iomem *base,
+				  struct clk_hw_onecell_data *cells)
+{
+	struct clk_parent_data parent_data;
+	struct clk_hw *hw;
+	int ret;
+
+	ret = eqc_fill_parent_data(clk, cells, &parent_data);
+	if (ret)
+		return ret;
+
+	hw = clk_hw_register_fixed_factor_pdata(dev, np, clk->name, &parent_data, 0,
+						clk->ff.mult, clk->ff.div, 0, 0);
+	if (IS_ERR(hw))
+		return IS_ERR(hw);
+
+	cells->hws[clk->index] = hw;
+	return 0;
+}
+
+static int eqc_probe_pll_fracg(struct device *dev, struct device_node *np,
+			       const struct eqc_clock *clk, void __iomem *base,
+			       struct clk_hw_onecell_data *cells)
+{
+	struct clk_parent_data parent_data;
+	unsigned long mult, div, acc;
+	struct clk_hw *hw;
+	int ret;
+
+	ret = eqc_pll_parse_fracg(base + clk->pll.reg, &mult, &div, &acc);
+	if (ret)
+		return ret;
+
+	ret = eqc_fill_parent_data(clk, cells, &parent_data);
+	if (ret)
+		return ret;
+
+	hw = clk_hw_register_fixed_factor_pdata(dev, np, clk->name, &parent_data, 0, mult,
+						div, acc, CLK_FIXED_FACTOR_FIXED_ACCURACY);
+	if (IS_ERR(hw))
+		return IS_ERR(hw);
+
+	cells->hws[clk->index] = hw;
+	return 0;
+}
+
 static int eqc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -394,11 +528,12 @@ static int eqc_probe(struct platform_device *pdev)
 				 KBUILD_MODNAME, data->pinctrl_auxdev_name, ret);
 	}
 
-	if (data->pll_count + data->div_count + data->fixed_factor_count == 0)
+	if (data->pll_count + data->div_count + data->fixed_factor_count + data->clk_count == 0)
 		return 0; /* Zero clocks, we are done. */
 
 	clk_count = data->pll_count + data->div_count +
-		    data->fixed_factor_count + data->early_clk_count;
+		    data->fixed_factor_count + data->clk_count
+		    + data->early_clk_count;
 	cells = kzalloc(struct_size(cells, hws, clk_count), GFP_KERNEL);
 	if (!cells)
 		return -ENOMEM;
@@ -415,9 +550,58 @@ static int eqc_probe(struct platform_device *pdev)
 
 	eqc_probe_init_fixed_factors(dev, data, cells);
 
+	for (i = 0; i < data->clk_count; i++) {
+		const struct eqc_clock *clk = &data->clks[i];
+
+		if (clk->probe)
+			ret = clk->probe(dev, NULL, clk, base, cells);
+		else
+			ret = -EINVAL;
+		if (ret)
+			dev_warn(dev, "failed probing clock %s: %d\n", clk->name, ret);
+	}
+
 	return of_clk_add_hw_provider(np, of_clk_hw_onecell_get, cells);
 }
 
+#define DIV(_index, _parent_idx, _name, _parent_name,			\
+		_reg, _shift, _width, _table)				\
+	{								\
+		.index = _index,					\
+		.parent_idx = _parent_idx,				\
+		.name = _name,						\
+		.parent_name = _parent_name,				\
+		.probe = eqc_probe_divider,				\
+		.unregister = clk_hw_unregister_divider,		\
+		.div.reg = _reg,					\
+		.div.shift = _shift,					\
+		.div.width = _width,					\
+		.div.table = _table,					\
+	}
+
+#define FF(_index, _parent_idx, _name, _parent_name, _mult, _div)	\
+	{								\
+		.index = _index,					\
+		.parent_idx = _parent_idx,				\
+		.name = _name,						\
+		.parent_name = _parent_name,				\
+		.probe = eqc_probe_fixed_factor,			\
+		.unregister = clk_hw_unregister_fixed_factor,		\
+		.ff.mult = _mult,					\
+		.ff.div = _div,						\
+	}
+
+#define PLL_FRACG(_index, _parent_idx, _name, _parent_name, _reg)	\
+	{								\
+		.index = _index,					\
+		.parent_idx = _parent_idx,				\
+		.name = _name,						\
+		.parent_name = _parent_name,				\
+		.probe = eqc_probe_pll_fracg,				\
+		.unregister = clk_hw_unregister_fixed_factor,		\
+		.pll.reg = _reg,					\
+	}
+
 /* Required early for GIC timer (pll-cpu) and UARTs (pll-per). */
 static const struct eqc_pll eqc_eyeq5_early_plls[] = {
 	{ .index = EQ5C_PLL_CPU, .name = "pll-cpu",  .reg64 = 0x02C },
@@ -799,7 +983,7 @@ static void __init eqc_early_init(struct device_node *np,
 	int ret;
 
 	clk_count = early_data->early_pll_count + early_data->early_fixed_factor_count +
-		    early_data->late_clk_count;
+		    early_data->early_clk_count + early_data->late_clk_count;
 	cells = kzalloc(struct_size(cells, hws, clk_count), GFP_KERNEL);
 	if (!cells) {
 		ret = -ENOMEM;
@@ -861,6 +1045,19 @@ static void __init eqc_early_init(struct device_node *np,
 		}
 	}
 
+	for (i = 0; i < early_data->early_clk_count; i++) {
+		const struct eqc_clock *clk = &early_data->early_clks[i];
+
+		if (clk->probe)
+			ret = clk->probe(NULL, np, clk, base, cells);
+		else
+			ret = -EINVAL;
+		if (ret) {
+			pr_err("failed registering %s\n", clk->name);
+			goto err;
+		}
+	}
+
 	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, cells);
 	if (ret) {
 		pr_err("failed registering clk provider: %d\n", ret);
@@ -890,6 +1087,14 @@ static void __init eqc_early_init(struct device_node *np,
 				clk_hw_unregister_fixed_factor(hw);
 		}
 
+		for (i = 0; i < early_data->early_clk_count; i++) {
+			const struct eqc_clock *clk = &early_data->early_clks[i];
+			struct clk_hw *hw = cells->hws[clk->index];
+
+			if (!IS_ERR_OR_NULL(hw) && clk->unregister)
+				clk->unregister(hw);
+		}
+
 		kfree(cells);
 	}
 }

-- 
2.52.0


