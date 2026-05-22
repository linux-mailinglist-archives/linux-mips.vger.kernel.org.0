Return-Path: <linux-mips+bounces-14715-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MI5RGHpPEGq5VwYAu9opvQ
	(envelope-from <linux-mips+bounces-14715-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 22 May 2026 14:43:38 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 170CD5B454A
	for <lists+linux-mips@lfdr.de>; Fri, 22 May 2026 14:43:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7FED230A22E1
	for <lists+linux-mips@lfdr.de>; Fri, 22 May 2026 12:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CDD33B52EF;
	Fri, 22 May 2026 12:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="vWLseihx"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1A73B4432
	for <linux-mips@vger.kernel.org>; Fri, 22 May 2026 12:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779453109; cv=none; b=CvX99YB1UFz0vON8SAXUFsk+aUx3qSQn/TvKeam3S8WWA3ySZRuL7RqsE+5eQNt4nspWiXxtl2gvQj1cK7ysEFCohAl2AxOP2JlAtmlpNe1BDfRKFuDUrML3DnVv+6/iCKkQvAN51PUyRE28sJClezTE/CDgYpVyPpTYcRJm5No=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779453109; c=relaxed/simple;
	bh=xEojNvh9wcGXsaLfvfjpd534NWtxI2Qm7gWmBUbYltI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RtMVbKbtgmP7GW6JpNQqL5Nb+/Hx//qiyojaEeSsZVuil5syo6R+p+aCzUNeAHypEbgHcXYvLgjfeOLIcQOAnybMaKxuNv9cw4AgU8LtGIMnBYU7VAmUYPg+WQwDQyi/8AMy51/BGk0PKBS2UrEVpOpUsDoL61BNpXpJdm/goTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=vWLseihx; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id ED8C74E42D29;
	Fri, 22 May 2026 12:31:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C09536003C;
	Fri, 22 May 2026 12:31:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 22B9D10811372;
	Fri, 22 May 2026 14:31:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779453104; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p9kbywf1m6jX1K1F70xwsWcy5sEuN2hpYCNYcBnjz9k=;
	b=vWLseihx8QskeuP2xGDxptCrQO9WboyKTeqGNJOKJheSqW3VomEmLZMH9Tq4nEZRJRrRhw
	9WIKJUxtk5jVoa/RySIhLYDiaTd0D+LEMPlD3bmtfClDJK0WmT7KzDTexb8fB6jmOcb8hH
	AGNQkJaJVD+anGwmzA3EuWSxs7b07O190RNd8V8WEmnURiycFiag7nw3bQ5GlVvYnlGTnh
	FB8rOu982WOrqFMugTvRJuD1rKNrPWlsA1QsXJJmLpaDOnI/wRdRVdqueig2NmIwvpdFOh
	rh/GLMYEjpMr+XNdG2quG6ZTBW3B721J5mXac+zBcOz3sE093KCQrI1M/KpwDw==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Fri, 22 May 2026 14:31:17 +0200
Subject: [PATCH v7 8/9] clk: eyeq: Drop PLL, dividers, and fixed factors
 structs
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260522-clk-eyeq7-v7-8-14ad6c2c5213@bootlin.com>
References: <20260522-clk-eyeq7-v7-0-14ad6c2c5213@bootlin.com>
In-Reply-To: <20260522-clk-eyeq7-v7-0-14ad6c2c5213@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14715-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benoit.monin@bootlin.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,bootlin.com:mid,bootlin.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 170CD5B454A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Now that there are no users of the eqc_pll, eqc_div, and eqc_fixed_factor
structures since they have been converted to eqc_clock, remove these
structs and the code related to their parsing in probe and early
initialization.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/clk/clk-eyeq.c | 192 +------------------------------------------------
 1 file changed, 3 insertions(+), 189 deletions(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index 8a38ad9afb5e..5200d5f0ff06 100644
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
@@ -133,15 +106,6 @@ struct eqc_clock {
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
 
@@ -153,12 +117,6 @@ struct eqc_match_data {
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
 
@@ -271,97 +229,6 @@ static int eqc_pll_parse_fracg(void __iomem *base, unsigned long *mult,
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
 static void eqc_auxdev_create_optional(struct device *dev, void __iomem *base,
 				       const char *name)
 {
@@ -500,12 +367,10 @@ static int eqc_probe(struct platform_device *pdev)
 	eqc_auxdev_create_optional(dev, base, data->pinctrl_auxdev_name);
 	eqc_auxdev_create_optional(dev, base, data->eth_phy_auxdev_name);
 
-	if (data->pll_count + data->div_count + data->fixed_factor_count + data->clk_count == 0)
+	if (data->clk_count == 0)
 		return 0; /* Zero clocks, we are done. */
 
-	clk_count = data->pll_count + data->div_count +
-		    data->fixed_factor_count + data->clk_count +
-		    data->early_clk_count;
+	clk_count = data->clk_count + data->early_clk_count;
 	cells = kzalloc_flex(*cells, hws, clk_count);
 	if (!cells)
 		return -ENOMEM;
@@ -516,12 +381,6 @@ static int eqc_probe(struct platform_device *pdev)
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
 
@@ -872,8 +731,7 @@ static void __init eqc_early_init(struct device_node *np,
 	void __iomem *base;
 	int ret;
 
-	clk_count = early_data->early_pll_count + early_data->early_fixed_factor_count +
-		    early_data->early_clk_count + early_data->late_clk_count;
+	clk_count = early_data->early_clk_count + early_data->late_clk_count;
 	cells = kzalloc_flex(*cells, hws, clk_count);
 	if (!cells) {
 		ret = -ENOMEM;
@@ -899,42 +757,6 @@ static void __init eqc_early_init(struct device_node *np,
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
 
@@ -969,14 +791,6 @@ static void __init eqc_early_init(struct device_node *np,
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
2.54.0


