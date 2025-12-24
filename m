Return-Path: <linux-mips+bounces-12587-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFD7CDBE8E
	for <lists+linux-mips@lfdr.de>; Wed, 24 Dec 2025 11:08:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EB53930121B5
	for <lists+linux-mips@lfdr.de>; Wed, 24 Dec 2025 10:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3312335BBB;
	Wed, 24 Dec 2025 10:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nZmgQcYM"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E3F33468A
	for <linux-mips@vger.kernel.org>; Wed, 24 Dec 2025 10:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766570879; cv=none; b=UGsLzzwCgDQATrfzb7aBLNhE+zvNCe4sBKyKKpIZuNFWLBoYpU78EJnyeM3ky3nec6Bk07fRSSlquEQ7O2zEoriA+otFVDVRARiO6ac6PGtC6rpJIw62VVM1LRIuXc5nNrYwgoktDGAdxtwfALXDJ79HitLZNsGlA8kXFtyZkRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766570879; c=relaxed/simple;
	bh=BbURIiZY46GxEL5Y1Wcc8+DtjIs2CQpM+K8yiac2jvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GhWty+ZgjCkR4VOjyiB0DDCN+Cevw6+zrKBGbLSJp6hw28azaSKGVH9igCQQ2YC7KvC72JHF49sy70TIr7AKnLvdQbGGfDoSnQ/nkDf9QruVSy2DGvI3BnCxrEqgjO7xl047vWRYxG7dv7u2tMAa9r0ouNZ1WBHN0EzmzKEpkRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nZmgQcYM; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3D51E4E41D85;
	Wed, 24 Dec 2025 10:07:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 12BC36073D;
	Wed, 24 Dec 2025 10:07:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 194B010AB110A;
	Wed, 24 Dec 2025 11:07:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766570873; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TJhjKcsiz0Gu1wluUbfKT08L4DEsVxc2BF0oj9+w4Kg=;
	b=nZmgQcYMPR7yAAPIVvcEmEPWF4JsuyMnzZ0jUY7O1rv+GYKp0EET6VAqUd7QROx3bsDOm0
	KFyAYQZpZFIJwnzuc6LsEPXcbv534GPxbvn+ksqPPlXdnPWKdneWVY9wiQInJzwSsM/7P7
	Yk3kp8nvhpxEggAb5qQag850XIhAwZ2QhvZZkfnK7bSrfRcP07NlOZOzkwUIFhu6RU9AY0
	uDq5+A0hAqfeJrSVYk+X8xkZTWO71TRhtLoKEgOR5Kh7ea+p9i/CchUVeUSLizjYrj+V3N
	XAMX1OHn/3hPF7NjYXSHih9W7K73rbO9PMYafPGp4l11X0BrFO89kf08rMtyiA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 24 Dec 2025 11:07:22 +0100
Subject: [PATCH v2 09/10] clk: eyeq: Add EyeQ7H compatibles
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251224-clk-eyeq7-v2-9-81744d1025d9@bootlin.com>
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

Add the entries for the 14 Other Logic Blocks found in the EyeQ7H SoC. The
clock tree is more complex than the previous generation of SoC, as some
OLB depend on the clock output of other OLB instead of all referring to
the main oscillator.

The OLB south, east and west generate those reference clocks used by other
blocks. They also use the reference clock internally. The reference clock
provided by OLB south is named "ref_100p0", "ref_106p6_e" by OLB east and
"ref_106p6_w" by OLB west.

For the OLB with a single parent clock, We use the same logic as the
blocks found in previous SoC and refer to it with the name "ref".

The OLB with two parent clocks use the reference clock provided by the
OLB south, east and west as "ref_100p0" and "ref_106p6" and the main
oscillator as "ref".

The reset controllers found is 11 of the OLB are declared as auxiliary
device attached to the clock device.

Also add the functions to parse the registers of the two types of PLL
in the EyeQ7H OLB.

The JFRACR PLL have similar properties as the FRACG PLL, but its
configuration is spread on three registers instead of two. It also have
a wider fractional part for the multiplier on 24 bits instead of 20.

The AINTP PLL does not support spread spectrum and uses a single
register. It is registered as a fixed factor without the flag
CLK_FIXED_FACTOR_FIXED_ACCURACY and thus inherit the accuracy of its
parent clock.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/clk/clk-eyeq.c | 495 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 494 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index a1221f30c16b..4ae3e8ba63d9 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * PLL clock driver for the Mobileye EyeQ5, EyeQ6L and EyeQ6H platforms.
+ * PLL clock driver for the Mobileye EyeQ platforms.
  *
  * This controller handles:
  *  - Read-only PLLs, all derived from the same main crystal clock.
@@ -46,6 +46,7 @@
 
 #include <dt-bindings/clock/mobileye,eyeq5-clk.h>
 #include <dt-bindings/clock/mobileye,eyeq6lplus-clk.h>
+#include <dt-bindings/clock/mobileye,eyeq7h-clk.h>
 
 /* In frac mode, it enables fractional noise canceling DAC. Else, no function. */
 #define FRACG_PCSR0_DAC_EN			BIT(0)
@@ -71,6 +72,41 @@
 #define FRACG_PCSR1_DOWN_SPREAD			BIT(11)
 #define FRACG_PCSR1_FRAC_IN			GENMASK(31, 12)
 
+#define JFRACR_PCSR0_BYPASS			BIT(0)
+#define JFRACR_PCSR0_PLL_EN			BIT(1)
+#define JFRACR_PCSR0_FOUTVCO_EN			BIT(2)
+#define JFRACR_PCSR0_FOUTPOSTDIV_EN		BIT(3)
+#define JFRACR_PCSR0_POST_DIV1			GENMASK(6, 4)
+#define JFRACR_PCSR0_POST_DIV2			GENMASK(9, 7)
+#define JFRACR_PCSR0_REF_DIV			GENMASK(15, 10)
+#define JFRACR_PCSR0_FB_DIV			GENMASK(27, 16)
+#define JFRACR_PCSR0_VCO_SEL			GENMASK(29, 28)
+#define JFRACR_PCSR0_PLL_LOCKED			GENMASK(31, 30)
+
+#define JFRACR_PCSR1_FRAC_IN			GENMASK(23, 0)
+#define JFRACR_PCSR1_FOUT4PHASE_EN		BIT(24)
+#define JFRACR_PCSR1_DAC_EN			BIT(25)
+#define JFRACR_PCSR1_DSM_EN			BIT(26)
+/* Bits 31..27 are reserved */
+#define JFRACR_PCSR2_RESET			BIT(0)
+#define JFRACR_PCSR2_DIS_SSCG			BIT(1)
+#define JFRACR_PCSR2_DOWN_SPREAD		BIT(2)
+#define JFRACR_PCSR2_SSGC_DIV			GENMASK(7, 4)
+#define JFRACR_PCSR2_SPREAD			GENMASK(12, 8)
+/* Bits 31..13 are reserved */
+
+#define AINTP_PCSR_BYPASS			BIT(0)
+#define AINTP_PCSR_PLL_EN			BIT(1)
+#define AINTP_PCSR_FOUTVCO_EN			BIT(2)
+#define AINTP_PCSR_FOUTPOSTDIV_EN		BIT(3)
+#define AINTP_PCSR_POST_DIV1			GENMASK(6, 4)
+#define AINTP_PCSR_POST_DIV2			GENMASK(9, 7)
+#define AINTP_PCSR_REF_DIV			GENMASK(15, 10)
+#define AINTP_PCSR_FB_DIV			GENMASK(27, 16)
+#define AINTP_PCSR_VCO_SEL			GENMASK(29, 28)
+/* bit 30 is reserved */
+#define AINTP_PCSR_PLL_LOCKED			BIT(31)
+
 /*
  * Special index values to lookup a parent clock by its name
  * from the device tree or by its globally unique name.
@@ -158,6 +194,29 @@ static void eqc_pll_downshift_factors(unsigned long *mult, unsigned long *div)
 	*div >>= shift;
 }
 
+static int eqc_pll_parse_aintp(void __iomem *base, unsigned long *mult, unsigned long *div)
+{
+	u32 r0;
+
+	r0 = readl(base);
+	if (r0 & AINTP_PCSR_BYPASS) {
+		*mult = 1;
+		*div = 1;
+		return 0;
+	}
+
+	if (!(r0 & AINTP_PCSR_PLL_LOCKED))
+		return -EINVAL;
+
+	*mult = FIELD_GET(AINTP_PCSR_FB_DIV, r0);
+	*div = FIELD_GET(AINTP_PCSR_REF_DIV, r0);
+
+	if (!*mult || !*div)
+		return -EINVAL;
+
+	return 0;
+}
+
 static int eqc_pll_parse_fracg(void __iomem *base, unsigned long *mult,
 			       unsigned long *div, unsigned long *acc)
 {
@@ -227,6 +286,60 @@ static int eqc_pll_parse_fracg(void __iomem *base, unsigned long *mult,
 	return 0;
 }
 
+static int eqc_pll_parse_jfracr(void __iomem *base, unsigned long *mult,
+				unsigned long *div, unsigned long *acc)
+{
+	unsigned long spread;
+	u32 r0, r1, r2;
+	u64 val;
+
+	val = readq(base);
+	r0 = val;
+	r1 = val >> 32;
+	r2 = readl(base + 8);
+
+	if (r0 & JFRACR_PCSR0_BYPASS) {
+		*mult = 1;
+		*div = 1;
+		*acc = 0;
+		return 0;
+	}
+
+	if (!(r0 & JFRACR_PCSR0_PLL_LOCKED))
+		return -EINVAL;
+
+	*mult = FIELD_GET(JFRACR_PCSR0_FB_DIV, r0);
+	*div = FIELD_GET(JFRACR_PCSR0_REF_DIV, r0);
+
+	/* fractional part on 24 bits */
+	if (r1 & JFRACR_PCSR1_DSM_EN) {
+		*div *= (1ULL << 24);
+		*mult = *mult * (1ULL << 24) + FIELD_GET(JFRACR_PCSR1_FRAC_IN, r1);
+	}
+
+	if (!*mult || !*div)
+		return -EINVAL;
+
+	if (r2 & (JFRACR_PCSR2_RESET | JFRACR_PCSR2_DIS_SSCG)) {
+		*acc = 0;
+		return 0;
+	}
+
+	/* spread spectrum is identical to FRACG PLL */
+	spread = FIELD_GET(JFRACR_PCSR2_SPREAD, r2);
+	*acc = DIV_ROUND_CLOSEST(spread * 1000000000, 1024 * 2);
+
+	if (r2 & JFRACR_PCSR2_DOWN_SPREAD) {
+		*mult *= 2048 - spread;
+		*div *= 2048;
+	}
+
+	/* make sure mult and div fit in 32 bits */
+	eqc_pll_downshift_factors(mult, div);
+
+	return 0;
+}
+
 static void eqc_auxdev_release(struct device *dev)
 {
 	struct auxiliary_device *adev = to_auxiliary_dev(dev);
@@ -330,6 +443,33 @@ static int eqc_probe_fixed_factor(struct device *dev, struct device_node *np,
 	return 0;
 }
 
+static int eqc_probe_pll_aintp(struct device *dev, struct device_node *np,
+			       const struct eqc_clock *clk, void __iomem *base,
+			       struct clk_hw_onecell_data *cells)
+{
+	struct clk_parent_data parent_data = { };
+	unsigned long mult, div;
+	struct clk_hw *hw;
+	int ret;
+
+	ret = eqc_pll_parse_aintp(base + clk->pll.reg, &mult, &div);
+	if (ret)
+		return ret;
+
+	ret = eqc_fill_parent_data(clk, cells, &parent_data);
+	if (ret)
+		return ret;
+
+	hw = clk_hw_register_fixed_factor_pdata(dev, np, clk->name, &parent_data,
+						0, mult, div, 0, 0);
+
+	if (IS_ERR(hw))
+		return IS_ERR(hw);
+
+	cells->hws[clk->index] = hw;
+	return 0;
+}
+
 static int eqc_probe_pll_fracg(struct device *dev, struct device_node *np,
 			       const struct eqc_clock *clk, void __iomem *base,
 			       struct clk_hw_onecell_data *cells)
@@ -356,6 +496,32 @@ static int eqc_probe_pll_fracg(struct device *dev, struct device_node *np,
 	return 0;
 }
 
+static int eqc_probe_pll_jfracr(struct device *dev, struct device_node *np,
+				const struct eqc_clock *clk, void __iomem *base,
+				struct clk_hw_onecell_data *cells)
+{
+	struct clk_parent_data parent_data = { };
+	unsigned long mult, div, acc;
+	struct clk_hw *hw;
+	int ret;
+
+	ret = eqc_pll_parse_jfracr(base + clk->pll.reg, &mult, &div, &acc);
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
@@ -450,6 +616,17 @@ static int eqc_probe(struct platform_device *pdev)
 		.ff.div = _div,						\
 	}
 
+#define PLL_AINTP(_index, _parent_idx, _name, _parent_name, _reg)	\
+	{								\
+		.index = _index,					\
+		.parent_idx = _parent_idx,				\
+		.name = _name,						\
+		.parent_name = _parent_name,				\
+		.probe = eqc_probe_pll_aintp,				\
+		.unregister = clk_hw_unregister_fixed_factor,		\
+		.pll.reg = _reg,					\
+	}
+
 #define PLL_FRACG(_index, _parent_idx, _name, _parent_name, _reg)	\
 	{								\
 		.index = _index,					\
@@ -461,6 +638,17 @@ static int eqc_probe(struct platform_device *pdev)
 		.pll.reg = _reg,					\
 	}
 
+#define PLL_JFRACR(_index, _parent_idx, _name, _parent_name, _reg)	\
+	{								\
+		.index = _index,					\
+		.parent_idx = _parent_idx,				\
+		.name = _name,						\
+		.parent_name = _parent_name,				\
+		.probe = eqc_probe_pll_jfracr,				\
+		.unregister = clk_hw_unregister_fixed_factor,		\
+		.pll.reg = _reg,					\
+	}
+
 enum {
 	/*
 	 * EQ5C_PLL_CPU children.
@@ -701,6 +889,295 @@ static const struct eqc_match_data eqc_eyeq6h_acc_match_data = {
 	.reset_auxdev_name = "reset_acc",
 };
 
+static const struct eqc_clock eqc_eyeq7h_acc0_clks[] = {
+	PLL_AINTP(EQ7HC_ACC_PLL_VMP, PARENT_BY_FWNAME, "pll-acc0-vmp", "ref_100p0", 0x400),
+	PLL_AINTP(EQ7HC_ACC_PLL_MPC, PARENT_BY_FWNAME, "pll-acc0-mpc", "ref_100p0", 0x404),
+	PLL_AINTP(EQ7HC_ACC_PLL_PMA, PARENT_BY_FWNAME, "pll-acc0-pma", "ref_100p0", 0x408),
+	PLL_AINTP(EQ7HC_ACC_PLL_NOC, PARENT_BY_FWNAME, "pll-acc0-noc-acc", "ref_106p6", 0x40c),
+
+	FF(EQ7HC_ACC_DIV_PMA, EQ7HC_ACC_PLL_PMA, "acc0_pma", NULL, 1, 2),
+	FF(EQ7HC_ACC_DIV_NCORE, EQ7HC_ACC_PLL_NOC, "acc0_ncore", NULL, 1, 2),
+	FF(EQ7HC_ACC_DIV_CFG, EQ7HC_ACC_PLL_NOC, "acc0_cfg", NULL, 1, 8),
+};
+
+static const struct eqc_match_data eqc_eyeq7h_acc0_match_data = {
+	.clk_count	= ARRAY_SIZE(eqc_eyeq7h_acc0_clks),
+	.clks		= eqc_eyeq7h_acc0_clks,
+
+	.reset_auxdev_name = "reset_acc0",
+};
+
+static const struct eqc_clock eqc_eyeq7h_acc1_clks[] = {
+	PLL_AINTP(EQ7HC_ACC_PLL_VMP, PARENT_BY_FWNAME, "pll-acc1-vmp", "ref_100p0", 0x400),
+	PLL_AINTP(EQ7HC_ACC_PLL_MPC, PARENT_BY_FWNAME, "pll-acc1-mpc", "ref_100p0", 0x404),
+	PLL_AINTP(EQ7HC_ACC_PLL_PMA, PARENT_BY_FWNAME, "pll-acc1-pma", "ref_100p0", 0x408),
+	PLL_AINTP(EQ7HC_ACC_PLL_NOC, PARENT_BY_FWNAME, "pll-acc1-noc-acc", "ref_106p6", 0x40c),
+};
+
+static const struct eqc_match_data eqc_eyeq7h_acc1_match_data = {
+	.clk_count	= ARRAY_SIZE(eqc_eyeq7h_acc1_clks),
+	.clks		= eqc_eyeq7h_acc1_clks,
+
+	.reset_auxdev_name = "reset_acc1",
+};
+
+static const struct clk_div_table eqc_eyeq7h_ddr_apb_div_table[] = {
+	{ .val = 0, .div = 8 },
+	{ .val = 1, .div = 128 },
+	{ .val = 0, .div = 0 },
+};
+
+static const struct clk_div_table eqc_eyeq7h_ddr_ref_div_table[] = {
+	{ .val = 0, .div = 2 },
+	{ .val = 1, .div = 8 },
+	{ .val = 0, .div = 0 },
+};
+
+static const struct clk_div_table eqc_eyeq7h_ddr_dfi_div_table[] = {
+	{ .val = 0, .div = 2 },
+	{ .val = 1, .div = 32 },
+	{ .val = 0, .div = 0 },
+};
+
+static const struct eqc_clock eqc_eyeq7h_ddr0_clks[] = {
+	PLL_AINTP(EQ7HC_DDR_PLL, PARENT_BY_FWNAME, "pll-ddr0", "ref", 0x0),
+
+	DIV(EQ7HC_DDR_DIV_APB, EQ7HC_DDR_PLL, "div-ddr0_apb", NULL,
+	    0x08, 10, 1, eqc_eyeq7h_ddr_apb_div_table),
+	DIV(EQ7HC_DDR_DIV_PLLREF, EQ7HC_DDR_PLL, "div-ddr0_pllref", NULL,
+	    0x08, 10, 1, eqc_eyeq7h_ddr_ref_div_table),
+	DIV(EQ7HC_DDR_DIV_DFI, EQ7HC_DDR_PLL, "div-ddr0-dfi", NULL,
+	    0x08, 10, 1, eqc_eyeq7h_ddr_dfi_div_table),
+};
+
+static const struct eqc_match_data eqc_eyeq7h_ddr0_match_data = {
+	.clk_count	= ARRAY_SIZE(eqc_eyeq7h_ddr0_clks),
+	.clks		= eqc_eyeq7h_ddr0_clks,
+
+	.reset_auxdev_name = "reset_ddr0",
+};
+
+static const struct eqc_clock eqc_eyeq7h_ddr1_clks[] = {
+	PLL_AINTP(EQ7HC_DDR_PLL, PARENT_BY_FWNAME, "pll-ddr1", "ref", 0x0),
+
+	DIV(EQ7HC_DDR_DIV_APB, EQ7HC_DDR_PLL, "div-ddr1_apb", NULL,
+	    0x08, 10, 1, eqc_eyeq7h_ddr_apb_div_table),
+	DIV(EQ7HC_DDR_DIV_PLLREF, EQ7HC_DDR_PLL, "div-ddr1_pllref", NULL,
+	    0x08, 10, 1, eqc_eyeq7h_ddr_ref_div_table),
+	DIV(EQ7HC_DDR_DIV_DFI, EQ7HC_DDR_PLL, "div-ddr1-dfi", NULL,
+	    0x08, 10, 1, eqc_eyeq7h_ddr_dfi_div_table),
+};
+
+static const struct eqc_match_data eqc_eyeq7h_ddr1_match_data = {
+	.clk_count	= ARRAY_SIZE(eqc_eyeq7h_ddr1_clks),
+	.clks		= eqc_eyeq7h_ddr1_clks,
+
+	.reset_auxdev_name = "reset_ddr1",
+};
+
+static const struct eqc_clock eqc_eyeq7h_east_clocks[] = {
+	PLL_JFRACR(EQ7HC_EAST_PLL_106P6, PARENT_BY_FWNAME, "pll-106p6-e", "ref", 0x00),
+
+	FF(EQ7HC_EAST_DIV_REF_106P6, EQ7HC_EAST_PLL_106P6, "ref_106p6_e", NULL, 1, 40),
+
+	PLL_AINTP(EQ7HC_EAST_PLL_NOC, EQ7HC_EAST_DIV_REF_106P6, "pll-noc-e", NULL, 0x30),
+	PLL_AINTP(EQ7HC_EAST_PLL_ISP, PARENT_BY_FWNAME, "pll-isp", "ref_100p0", 0x38),
+	PLL_AINTP(EQ7HC_EAST_PLL_VEU, PARENT_BY_FWNAME, "pll-veu", "ref_100p0", 0x40),
+
+	FF(EQ7HC_EAST_DIV_REF_DDR_PHY, EQ7HC_EAST_PLL_106P6, "ref_ddr_phy_e", NULL, 1, 2),
+
+	FF(EQ7HC_EAST_DIV_CORE, EQ7HC_EAST_PLL_NOC, "core_e", NULL, 1, 2),
+	FF(EQ7HC_EAST_DIV_CORE_MBIST, EQ7HC_EAST_PLL_NOC, "core_mbist_e", NULL, 1, 2),
+	FF(EQ7HC_EAST_DIV_ISRAM_MBIST, EQ7HC_EAST_PLL_NOC, "isram_mbist_e", NULL, 1, 2),
+	FF(EQ7HC_EAST_DIV_CFG, EQ7HC_EAST_PLL_NOC, "cfg_e", NULL, 1, 4),
+
+	FF(EQ7HC_EAST_DIV_VEU_CORE, EQ7HC_EAST_PLL_VEU, "veu_core", NULL, 1, 4),
+	FF(EQ7HC_EAST_DIV_VEU_MBIST, EQ7HC_EAST_PLL_VEU, "veu_mbist", NULL, 1, 4),
+	FF(EQ7HC_EAST_DIV_VEU_OCP, EQ7HC_EAST_PLL_VEU, "veu_ocp", NULL, 1, 16),
+
+	FF(EQ7HC_EAST_DIV_LBITS, EQ7HC_EAST_PLL_ISP, "lbits_e", NULL, 1, 48),
+	FF(EQ7HC_EAST_DIV_ISP0_CORE, EQ7HC_EAST_PLL_ISP, "isp0_core", NULL, 1, 2),
+};
+
+static const struct eqc_match_data eqc_eyeq7h_east_match_data = {
+	.clk_count = ARRAY_SIZE(eqc_eyeq7h_east_clocks),
+	.clks = eqc_eyeq7h_east_clocks,
+
+	.reset_auxdev_name = "reset_east",
+};
+
+static const struct eqc_clock eqc_eyeq7h_mips0_clks[] = {
+	PLL_AINTP(EQ7HC_MIPS_PLL_CPU, PARENT_BY_FWNAME, "pll-cpu0", "ref", 0x0),
+
+	FF(EQ7HC_MIPS_DIV_CM, EQ7HC_MIPS_PLL_CPU, "mips0_cm", NULL, 1, 2),
+};
+
+static const struct eqc_match_data eqc_eyeq7h_mips0_match_data = {
+	.clk_count	= ARRAY_SIZE(eqc_eyeq7h_mips0_clks),
+	.clks		= eqc_eyeq7h_mips0_clks,
+};
+
+static const struct eqc_clock eqc_eyeq7h_mips1_clks[] = {
+	PLL_AINTP(EQ7HC_MIPS_PLL_CPU, PARENT_BY_FWNAME, "pll-cpu1", "ref", 0x0),
+
+	FF(EQ7HC_MIPS_DIV_CM, EQ7HC_MIPS_PLL_CPU, "mips1_cm", NULL, 1, 2),
+};
+
+static const struct eqc_match_data eqc_eyeq7h_mips1_match_data = {
+	.clk_count	= ARRAY_SIZE(eqc_eyeq7h_mips1_clks),
+	.clks		= eqc_eyeq7h_mips1_clks,
+};
+
+static const struct eqc_clock eqc_eyeq7h_mips2_clks[] = {
+	PLL_AINTP(EQ7HC_MIPS_PLL_CPU, PARENT_BY_FWNAME, "pll-cpu2", "ref", 0x0),
+
+	FF(EQ7HC_MIPS_DIV_CM, EQ7HC_MIPS_PLL_CPU, "mips2_cm", NULL, 1, 2),
+};
+
+static const struct eqc_match_data eqc_eyeq7h_mips2_match_data = {
+	.clk_count	= ARRAY_SIZE(eqc_eyeq7h_mips2_clks),
+	.clks		= eqc_eyeq7h_mips2_clks,
+};
+
+static const struct eqc_clock eqc_eyeq7h_periph_east_clks[] = {
+	PLL_AINTP(EQ7HC_PERIPH_EAST_PLL_PER, PARENT_BY_FWNAME, "pll-periph_east_per", "ref", 0x0),
+
+	FF(EQ7HC_PERIPH_EAST_DIV_PER, EQ7HC_PERIPH_EAST_PLL_PER, "periph_e", NULL, 1, 10),
+};
+
+static const struct eqc_match_data eqc_eyeq7h_periph_east_match_data = {
+	.clk_count	= ARRAY_SIZE(eqc_eyeq7h_periph_east_clks),
+	.clks		= eqc_eyeq7h_periph_east_clks,
+
+	.reset_auxdev_name = "reset_periph_east",
+};
+
+static const struct eqc_clock eqc_eyeq7h_periph_west_clks[] = {
+	PLL_AINTP(EQ7HC_PERIPH_WEST_PLL_PER, PARENT_BY_FWNAME,
+		  "pll-periph_west_per", "ref_100p0", 0x0),
+	PLL_AINTP(EQ7HC_PERIPH_WEST_PLL_I2S, PARENT_BY_FWNAME,
+		  "pll-periph_west_i2s", "ref_106p6", 0x4),
+
+	FF(EQ7HC_PERIPH_WEST_DIV_PER, EQ7HC_PERIPH_WEST_PLL_PER, "periph_w", NULL, 1, 10),
+	FF(EQ7HC_PERIPH_WEST_DIV_I2S, EQ7HC_PERIPH_WEST_PLL_I2S, "periph_i2s_ser_w", NULL, 1, 100),
+};
+
+static const struct eqc_match_data eqc_eyeq7h_periph_west_match_data = {
+	.clk_count	= ARRAY_SIZE(eqc_eyeq7h_periph_west_clks),
+	.clks		= eqc_eyeq7h_periph_west_clks,
+
+	.reset_auxdev_name = "reset_periph_west",
+};
+
+static const struct eqc_clock eqc_eyeq7h_south_clks[] = {
+	PLL_JFRACR(EQ7HC_SOUTH_PLL_100P0, PARENT_BY_FWNAME, "pll-100p0", "ref", 0x40),
+
+	FF(EQ7HC_SOUTH_DIV_REF_100P0, EQ7HC_SOUTH_PLL_100P0, "ref_100p0", NULL, 1, 48),
+
+	PLL_AINTP(EQ7HC_SOUTH_PLL_XSPI, EQ7HC_SOUTH_DIV_REF_100P0, "pll-xspi", NULL, 0x10),
+	PLL_AINTP(EQ7HC_SOUTH_PLL_VDIO, EQ7HC_SOUTH_DIV_REF_100P0, "pll-vdio", NULL, 0x18),
+	PLL_AINTP(EQ7HC_SOUTH_PLL_PER, EQ7HC_SOUTH_DIV_REF_100P0, "pll-per-s", NULL, 0x20),
+
+	FF(EQ7HC_SOUTH_DIV_VDO_DSI_SYS, EQ7HC_SOUTH_PLL_100P0, "vdo_dsi_sys", NULL, 1, 9),
+	FF(EQ7HC_SOUTH_DIV_PMA_CMN_REF, EQ7HC_SOUTH_PLL_100P0, "pma_cmn_ref", NULL, 1, 48),
+	FF(EQ7HC_SOUTH_DIV_REF_UFS, EQ7HC_SOUTH_PLL_100P0, "ref_ufs", NULL, 1, 250),
+	FF(EQ7HC_SOUTH_DIV_XSPI_SYS, EQ7HC_SOUTH_PLL_XSPI, "xspi_sys", NULL, 1, 8),
+	FF(EQ7HC_SOUTH_DIV_XSPI_MBIST, EQ7HC_SOUTH_PLL_XSPI, "xspi_mbist", NULL, 1, 8),
+	FF(EQ7HC_SOUTH_DIV_NOC_S, EQ7HC_SOUTH_PLL_PER, "noc_s", NULL, 1, 2),
+	FF(EQ7HC_SOUTH_DIV_PCIE_SYS, EQ7HC_SOUTH_PLL_PER, "pcie_sys", NULL, 1, 4),
+	FF(EQ7HC_SOUTH_DIV_PCIE_SYS_MBIST, EQ7HC_SOUTH_PLL_PER, "pcie_sys_mbist", NULL, 1, 4),
+	FF(EQ7HC_SOUTH_DIV_PCIE_GBE_PHY, EQ7HC_SOUTH_PLL_PER, "pcie_gbe_phy_apb", NULL, 1, 16),
+	FF(EQ7HC_SOUTH_DIV_UFS_CORE, EQ7HC_SOUTH_PLL_PER, "ufs_core", NULL, 1, 8),
+	FF(EQ7HC_SOUTH_DIV_UFS_SMS, EQ7HC_SOUTH_PLL_PER, "ufs_sms", NULL, 1, 5),
+	FF(EQ7HC_SOUTH_DIV_UFS_ROM_SMS, EQ7HC_SOUTH_PLL_PER, "ufs_rom_sms", NULL, 1, 5),
+	FF(EQ7HC_SOUTH_DIV_ETH_SYS, EQ7HC_SOUTH_PLL_PER, "eth_sys", NULL, 1, 8),
+	FF(EQ7HC_SOUTH_DIV_ETH_MBIST, EQ7HC_SOUTH_PLL_PER, "eth_mbist", NULL, 1, 8),
+	FF(EQ7HC_SOUTH_DIV_CFG_S, EQ7HC_SOUTH_PLL_PER, "cfg_s", NULL, 1, 8),
+	FF(EQ7HC_SOUTH_DIV_TSU, EQ7HC_SOUTH_PLL_PER, "tsu", NULL, 1, 64),
+	FF(EQ7HC_SOUTH_DIV_VDIO, EQ7HC_SOUTH_PLL_VDIO, "vdio", NULL, 1, 4),
+	FF(EQ7HC_SOUTH_DIV_VDIO_CORE, EQ7HC_SOUTH_PLL_VDIO, "vdio_core", NULL, 1, 4),
+	FF(EQ7HC_SOUTH_DIV_VDIO_CORE_MBIST, EQ7HC_SOUTH_PLL_VDIO, "vdio_core_mbist", NULL, 1, 4),
+	FF(EQ7HC_SOUTH_DIV_VDO_CORE_MBIST, EQ7HC_SOUTH_PLL_VDIO, "vdo_core_mbist", NULL, 1, 4),
+	FF(EQ7HC_SOUTH_DIV_VDO_P, EQ7HC_SOUTH_PLL_VDIO, "vdo_p", NULL, 1, 40),
+	FF(EQ7HC_SOUTH_DIV_VDIO_CFG, EQ7HC_SOUTH_PLL_VDIO, "vdio_cfg", NULL, 1, 150),
+	FF(EQ7HC_SOUTH_DIV_VDIO_TXCLKESC, EQ7HC_SOUTH_PLL_VDIO, "vdio_txclkesc", NULL, 1, 8),
+};
+
+static const struct eqc_match_data eqc_eyeq7h_south_match_data = {
+	.clk_count	= ARRAY_SIZE(eqc_eyeq7h_south_clks),
+	.clks		= eqc_eyeq7h_south_clks,
+
+	.reset_auxdev_name = "reset_south",
+};
+
+static const struct eqc_clock eqc_eyeq7h_west_clks[] = {
+	PLL_JFRACR(EQ7HC_WEST_PLL_106P6, PARENT_BY_FWNAME, "pll-106p6-w", "ref", 0x0),
+
+	FF(EQ7HC_WEST_DIV_REF_106P6, EQ7HC_WEST_PLL_106P6, "ref_106p6_w", NULL, 1, 40),
+
+	PLL_AINTP(EQ7HC_WEST_PLL_NOC, EQ7HC_WEST_DIV_REF_106P6, "pll-noc-w", NULL, 0x30),
+	PLL_AINTP(EQ7HC_WEST_PLL_GPU, PARENT_BY_FWNAME, "pll-gpu", "ref_100p0", 0x38),
+	PLL_AINTP(EQ7HC_WEST_PLL_SSI, PARENT_BY_FWNAME, "pll-ssi", "ref_100p0", 0x40),
+
+	FF(EQ7HC_WEST_DIV_GPU, EQ7HC_WEST_PLL_GPU, "gpu", NULL, 1, 2),
+	FF(EQ7HC_WEST_DIV_GPU_MBIST, EQ7HC_WEST_PLL_GPU, "gpu_mbist", NULL, 1, 2),
+	FF(EQ7HC_WEST_DIV_LBITS, EQ7HC_WEST_PLL_GPU, "lbits_w", NULL, 1, 40),
+	FF(EQ7HC_WEST_DIV_MIPS_TIMER, EQ7HC_WEST_PLL_SSI, "mips_timer", NULL, 1, 24),
+	FF(EQ7HC_WEST_DIV_SSI_CORE, EQ7HC_WEST_PLL_SSI, "ssi_core", NULL, 1, 2),
+	FF(EQ7HC_WEST_DIV_SSI_CORE_MBIST, EQ7HC_WEST_PLL_SSI, "ssi_core_mbist", NULL, 1, 2),
+	FF(EQ7HC_WEST_DIV_SSI_ROM, EQ7HC_WEST_PLL_SSI, "ssi_rom", NULL, 1, 8),
+	FF(EQ7HC_WEST_DIV_SSI_ROM_MBIST, EQ7HC_WEST_PLL_SSI, "ssi_rom_mbist", NULL, 1, 8),
+	FF(EQ7HC_WEST_DIV_REF_DDR_PHY, EQ7HC_WEST_PLL_106P6, "ref_ddr_phy_w", NULL, 1, 2),
+	FF(EQ7HC_WEST_DIV_CORE, EQ7HC_WEST_PLL_NOC, "core_w", NULL, 1, 2),
+	FF(EQ7HC_WEST_DIV_CORE_MBIST, EQ7HC_WEST_PLL_NOC, "core_mbist_w", NULL, 1, 2),
+	FF(EQ7HC_WEST_DIV_CFG, EQ7HC_WEST_PLL_NOC, "cfg_w", NULL, 1, 4),
+	FF(EQ7HC_WEST_DIV_CAU, EQ7HC_WEST_PLL_NOC, "cau_w", NULL, 1, 8),
+	FF(EQ7HC_WEST_DIV_CAU_MBIST, EQ7HC_WEST_PLL_NOC, "cau_mbist_w", NULL, 1, 8),
+};
+
+static const struct eqc_match_data eqc_eyeq7h_west_match_data = {
+	.clk_count	= ARRAY_SIZE(eqc_eyeq7h_west_clks),
+	.clks		= eqc_eyeq7h_west_clks,
+
+	.reset_auxdev_name = "reset_west",
+};
+
+static const struct eqc_clock eqc_eyeq7h_xnn0_clks[] = {
+	PLL_AINTP(EQ7HC_XNN_PLL_XNN0, PARENT_BY_FWNAME, "pll-xnn0-0", "ref_100p0", 0x400),
+	PLL_AINTP(EQ7HC_XNN_PLL_XNN1, PARENT_BY_FWNAME, "pll-xnn0-1", "ref_100p0", 0x404),
+	PLL_AINTP(EQ7HC_XNN_PLL_XNN2, PARENT_BY_FWNAME, "pll-xnn0-2", "ref_100p0", 0x408),
+	PLL_AINTP(EQ7HC_XNN_PLL_CLSTR, PARENT_BY_FWNAME, "pll-xnn0-clstr", "ref_106p6", 0x410),
+
+	FF(EQ7HC_XNN_DIV_XNN0, EQ7HC_XNN_PLL_XNN0, "xnn0", NULL, 1, 2),
+	FF(EQ7HC_XNN_DIV_XNN1, EQ7HC_XNN_PLL_XNN1, "xnn1", NULL, 1, 2),
+	FF(EQ7HC_XNN_DIV_XNN2, EQ7HC_XNN_PLL_XNN2, "xnn2", NULL, 1, 2),
+	FF(EQ7HC_XNN_DIV_CLSTR, EQ7HC_XNN_PLL_CLSTR, "xnn0_clstr", NULL, 1, 2),
+	FF(EQ7HC_XNN_DIV_I2, EQ7HC_XNN_PLL_CLSTR, "xnn0_i2", NULL, 1, 4),
+	FF(EQ7HC_XNN_DIV_I2_SMS, EQ7HC_XNN_PLL_CLSTR, "xnn0_i2_sms", NULL, 1, 4),
+	FF(EQ7HC_XNN_DIV_CFG, EQ7HC_XNN_PLL_CLSTR, "xnn0_cfg", NULL, 1, 8),
+};
+
+static const struct eqc_match_data eqc_eyeq7h_xnn0_match_data = {
+	.clk_count	= ARRAY_SIZE(eqc_eyeq7h_xnn0_clks),
+	.clks		= eqc_eyeq7h_xnn0_clks,
+
+	.reset_auxdev_name = "reset_xnn0",
+};
+
+static const struct eqc_clock eqc_eyeq7h_xnn1_clks[] = {
+	PLL_AINTP(EQ7HC_XNN_PLL_XNN0, PARENT_BY_FWNAME, "pll-xnn1-0", "ref_100p0", 0x400),
+	PLL_AINTP(EQ7HC_XNN_PLL_XNN1, PARENT_BY_FWNAME, "pll-xnn1-1", "ref_100p0", 0x404),
+	PLL_AINTP(EQ7HC_XNN_PLL_XNN2, PARENT_BY_FWNAME, "pll-xnn1-2", "ref_100p0", 0x408),
+	PLL_AINTP(EQ7HC_XNN_PLL_CLSTR, PARENT_BY_FWNAME, "pll-xnn1-clstr", "ref_106p6", 0x410),
+};
+
+static const struct eqc_match_data eqc_eyeq7h_xnn1_match_data = {
+	.clk_count	= ARRAY_SIZE(eqc_eyeq7h_xnn1_clks),
+	.clks		= eqc_eyeq7h_xnn1_clks,
+
+	.reset_auxdev_name = "reset_xnn1",
+};
+
 static const struct of_device_id eqc_match_table[] = {
 	{ .compatible = "mobileye,eyeq5-olb", .data = &eqc_eyeq5_match_data },
 	{ .compatible = "mobileye,eyeq6l-olb", .data = &eqc_eyeq6l_match_data },
@@ -711,6 +1188,22 @@ static const struct of_device_id eqc_match_table[] = {
 	{ .compatible = "mobileye,eyeq6h-ddr0-olb", .data = &eqc_eyeq6h_ddr0_match_data },
 	{ .compatible = "mobileye,eyeq6h-ddr1-olb", .data = &eqc_eyeq6h_ddr1_match_data },
 	{ .compatible = "mobileye,eyeq6h-acc-olb", .data = &eqc_eyeq6h_acc_match_data },
+	{ .compatible = "mobileye,eyeq7h-acc0-olb", .data = &eqc_eyeq7h_acc0_match_data },
+	{ .compatible = "mobileye,eyeq7h-acc1-olb", .data = &eqc_eyeq7h_acc1_match_data },
+	{ .compatible = "mobileye,eyeq7h-ddr0-olb", .data = &eqc_eyeq7h_ddr0_match_data },
+	{ .compatible = "mobileye,eyeq7h-ddr1-olb", .data = &eqc_eyeq7h_ddr1_match_data },
+	{ .compatible = "mobileye,eyeq7h-east-olb", .data = &eqc_eyeq7h_east_match_data },
+	{ .compatible = "mobileye,eyeq7h-mips0-olb", .data = &eqc_eyeq7h_mips0_match_data },
+	{ .compatible = "mobileye,eyeq7h-mips1-olb", .data = &eqc_eyeq7h_mips1_match_data },
+	{ .compatible = "mobileye,eyeq7h-mips2-olb", .data = &eqc_eyeq7h_mips2_match_data },
+	{ .compatible = "mobileye,eyeq7h-periph-east-olb",
+	  .data = &eqc_eyeq7h_periph_east_match_data },
+	{ .compatible = "mobileye,eyeq7h-periph-west-olb",
+	  .data = &eqc_eyeq7h_periph_west_match_data },
+	{ .compatible = "mobileye,eyeq7h-south-olb", .data = &eqc_eyeq7h_south_match_data },
+	{ .compatible = "mobileye,eyeq7h-west-olb", .data = &eqc_eyeq7h_west_match_data },
+	{ .compatible = "mobileye,eyeq7h-xnn0-olb", .data = &eqc_eyeq7h_xnn0_match_data },
+	{ .compatible = "mobileye,eyeq7h-xnn1-olb", .data = &eqc_eyeq7h_xnn1_match_data },
 	{}
 };
 

-- 
2.52.0


