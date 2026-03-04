Return-Path: <linux-mips+bounces-13372-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMpVKLJQqGmztAAAu9opvQ
	(envelope-from <linux-mips+bounces-13372-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 04 Mar 2026 16:33:06 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A73202C6C
	for <lists+linux-mips@lfdr.de>; Wed, 04 Mar 2026 16:33:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31F2F3196920
	for <lists+linux-mips@lfdr.de>; Wed,  4 Mar 2026 15:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12FA13446BC;
	Wed,  4 Mar 2026 15:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="DyupQBc0"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C44634404E
	for <linux-mips@vger.kernel.org>; Wed,  4 Mar 2026 15:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772637974; cv=none; b=iq2wh12/BAuzyBVTGzOg/uBrTa2fLMcs237hrINRtKz+WPsbfTwjQEckI/DGLtiVxgUn5iRaPtJfoqfHVaAaPCrzB0ye1brC1RNgQRX0RYpHBIL1S772UElTxCz6l6zaU6/VD9yujjP7+h8vomtL4yQKAcC5Q90fFFXoBqctAVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772637974; c=relaxed/simple;
	bh=o4qp6WUuV4LHrbII8qU/PE+pMKeT1feoWvuDb/iatfs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PT+N6VJz6Mb0lVN59Jy9jgwsx0RuG2HN0ZBqk08KULVLXBrQbpuJZzeQdyze+kGuswsPm8xd3imJMjyKB1jCSqkhbQddMC3FfH8lwNQU6GdjEnPovmGbHxQyQ2vJm+3L4hdNpYTbD5cx6sHdx+HUqgKt3K4qmBrJpMZGZhKwi6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=DyupQBc0; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D0E001A2C98;
	Wed,  4 Mar 2026 15:26:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A64535FF5C;
	Wed,  4 Mar 2026 15:26:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C6EDA1036978F;
	Wed,  4 Mar 2026 16:26:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772637969; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=g5RyB84br9O66OgklXBq77NxLESBFcuM+UEIlDGX0DY=;
	b=DyupQBc0bzqsj93luN05B8yiWi0mhq5oKv9mmJJxFyd/s348H5lTXaYgqVwNalu/DwQEV+
	24NYhcoZEWZSj0wtID+e00YikW6wqKhFKbbh4nF1Y740C2nMwRsMl37hYRskov7dgfVJ7v
	ksdw4PMYRtAArJcxkJpxYuR6WK6Vq+YZhQztI3q1M2o4B+JzGeqLUlEKfCf8KTFl+4pEdL
	R0H0j+wYGrPpxAQHUGG9oMtL1pdZK9XVbZJMDyi5m2zwtvhu7gGSBvN46dlutLQP1Mwvxs
	2Z8vQP/To9o0kuUUGiutR4I5CvVeZRMVFxtCRX6vPUwzJUlyNk67NHh3WFMULg==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 04 Mar 2026 16:25:20 +0100
Subject: [PATCH v4 06/10] clk: eyeq: Introduce a generic clock type
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260304-clk-eyeq7-v4-6-9d6bd9d24bec@bootlin.com>
References: <20260304-clk-eyeq7-v4-0-9d6bd9d24bec@bootlin.com>
In-Reply-To: <20260304-clk-eyeq7-v4-0-9d6bd9d24bec@bootlin.com>
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
X-Rspamd-Queue-Id: 46A73202C6C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13372-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benoit.monin@bootlin.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid]
X-Rspamd-Action: no action

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
 drivers/clk/clk-eyeq.c | 212 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 209 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index e4e690a12a23..623b1d3f041d 100644
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
 	const char		*eth_phy_auxdev_name;
@@ -122,6 +158,9 @@ struct eqc_early_match_data {
 	unsigned int			early_fixed_factor_count;
 	const struct eqc_fixed_factor	*early_fixed_factors;
 
+	unsigned int		early_clk_count;
+	const struct eqc_clock	*early_clks;
+
 	/*
 	 * We want our of_xlate callback to EPROBE_DEFER instead of dev_err()
 	 * and EINVAL. For that, we must know the total clock count.
@@ -336,6 +375,101 @@ static void eqc_auxdev_create_optional(struct device *dev, void __iomem *base,
 	}
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
@@ -345,6 +479,7 @@ static int eqc_probe(struct platform_device *pdev)
 	unsigned int i, clk_count;
 	struct resource *res;
 	void __iomem *base;
+	int ret;
 
 	data = device_get_match_data(dev);
 	if (!data)
@@ -363,11 +498,12 @@ static int eqc_probe(struct platform_device *pdev)
 	eqc_auxdev_create_optional(dev, base, data->pinctrl_auxdev_name);
 	eqc_auxdev_create_optional(dev, base, data->eth_phy_auxdev_name);
 
-	if (data->pll_count + data->div_count + data->fixed_factor_count == 0)
+	if (data->pll_count + data->div_count + data->fixed_factor_count + data->clk_count == 0)
 		return 0; /* Zero clocks, we are done. */
 
 	clk_count = data->pll_count + data->div_count +
-		    data->fixed_factor_count + data->early_clk_count;
+		    data->fixed_factor_count + data->clk_count +
+		    data->early_clk_count;
 	cells = kzalloc_flex(*cells, hws, clk_count);
 	if (!cells)
 		return -ENOMEM;
@@ -384,9 +520,58 @@ static int eqc_probe(struct platform_device *pdev)
 
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
@@ -769,7 +954,7 @@ static void __init eqc_early_init(struct device_node *np,
 	int ret;
 
 	clk_count = early_data->early_pll_count + early_data->early_fixed_factor_count +
-		    early_data->late_clk_count;
+		    early_data->early_clk_count + early_data->late_clk_count;
 	cells = kzalloc_flex(*cells, hws, clk_count);
 	if (!cells) {
 		ret = -ENOMEM;
@@ -831,6 +1016,19 @@ static void __init eqc_early_init(struct device_node *np,
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
@@ -860,6 +1058,14 @@ static void __init eqc_early_init(struct device_node *np,
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
2.53.0


