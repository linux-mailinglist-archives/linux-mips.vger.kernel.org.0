Return-Path: <linux-mips+bounces-14716-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0O+FFI1WEGocWgYAu9opvQ
	(envelope-from <linux-mips+bounces-14716-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 22 May 2026 15:13:49 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CD85B4E6C
	for <lists+linux-mips@lfdr.de>; Fri, 22 May 2026 15:13:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B184C30CAC86
	for <lists+linux-mips@lfdr.de>; Fri, 22 May 2026 12:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DE5E3B5F5D;
	Fri, 22 May 2026 12:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hkHKfAUF"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D46838D41E
	for <linux-mips@vger.kernel.org>; Fri, 22 May 2026 12:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779453111; cv=none; b=dajKcJVflfB+AxYL29WWs8EGPbtbMdakxGA4r7zW3jIqwfPuR73FnOWoMxdA008bqjJIKInXzy3zvZ22yNtZD3nKAScM7pvOd0TgOkOuGsX/gUVzCsD7B82qpPasQbjLSMVBaHt81SRfoIcrucHSAEIYyt8xc5UHuu0ngltQptg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779453111; c=relaxed/simple;
	bh=w8/Kz2DIXKwU7BCQEntoub1ge2nFEZPoCd6eLFPoHNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T+NrXo/BAFjgQ3d2bgffhL4RFL6hWawuOMBzIZWzmT5QR5Vv+1Z0Z/MMNVOfeVmbhIoMimCwXsouaSq113f1oOoH7cCd+hNcxY6B8FHKIJ5+a/T4b4NUMfmbvzeykVXXff6subbvKNpAF83huOjjv4pI+VZ43OhnOdh/hcJeG8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hkHKfAUF; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 06E0DC2C65A;
	Fri, 22 May 2026 12:32:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6E7DC6003C;
	Fri, 22 May 2026 12:31:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0A82710811314;
	Fri, 22 May 2026 14:31:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779453106; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/Pas3wmwqNqSrG6Yka6CBNL9ug52Nenp3SywcLBkARw=;
	b=hkHKfAUFyCJ4r66tXTTwHKZrhuGWLGKNteah4AyGi4L3jrIXZf/bE2IQwIcDzEsuE4z6Kp
	NCx4j5Zfui7LXE34irbwl/HCej8Br9TxMHv0OtqwtneNyngfaB7ka/m+9/tndPmQI29uZF
	lUiO8DfmWxsVbPveTKphBWzl6+uPoyYfiLDNI6l5C8AkEDF1CgGqV7O6WSZVIUB2ENbPW1
	hzR60SO2iL7eZjteQU9MWFGQ4ioOAi/5AzbnhxDSk1gTEfIrlSqIm8ViAi62oKqER577sC
	7EeuPxRS5lBvZ0CwQLg8SUJ/XfVmm0xG3AmyT87T+FXrowJ9w/ew/cH3AQ6G2g==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Fri, 22 May 2026 14:31:18 +0200
Subject: [PATCH v7 9/9] clk: eyeq: Add EyeQ7H compatibles
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260522-clk-eyeq7-v7-9-14ad6c2c5213@bootlin.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14716-lists,linux-mips=lfdr.de];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benoit.monin@bootlin.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 52CD85B4E6C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

The three dividers found in the DDR OLBs are configured by the same
register and are declared read-only.

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
 drivers/clk/clk-eyeq.c | 513 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 512 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index 5200d5f0ff06..d55be678c597 100644
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
@@ -160,6 +196,29 @@ static void eqc_pll_downshift_factors(unsigned long *mult, unsigned long *div)
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
@@ -229,6 +288,60 @@ static int eqc_pll_parse_fracg(void __iomem *base, unsigned long *mult,
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
+	/* Consider the PLL locked if either the phase or the frequency is locked */
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
+	} else {
+		/* spread spectrum is identical to FRACG PLL */
+		spread = FIELD_GET(JFRACR_PCSR2_SPREAD, r2);
+		*acc = DIV_ROUND_CLOSEST(spread * 1000000000, 1024 * 2);
+
+		if (r2 & JFRACR_PCSR2_DOWN_SPREAD) {
+			*mult *= 2048 - spread;
+			*div *= 2048;
+		}
+	}
+
+	/* make sure mult and div fit in 32 bits */
+	eqc_pll_downshift_factors(mult, div);
+
+	return 0;
+}
+
 static void eqc_auxdev_create_optional(struct device *dev, void __iomem *base,
 				       const char *name)
 {
@@ -313,6 +426,33 @@ static int eqc_probe_fixed_factor(struct device *dev, struct device_node *np,
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
+		return PTR_ERR(hw);
+
+	cells->hws[clk->index] = hw;
+	return 0;
+}
+
 static int eqc_probe_pll_fracg(struct device *dev, struct device_node *np,
 			       const struct eqc_clock *clk, void __iomem *base,
 			       struct clk_hw_onecell_data *cells)
@@ -339,6 +479,32 @@ static int eqc_probe_pll_fracg(struct device *dev, struct device_node *np,
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
+		return PTR_ERR(hw);
+
+	cells->hws[clk->index] = hw;
+	return 0;
+}
+
 static int eqc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -411,6 +577,22 @@ static int eqc_probe(struct platform_device *pdev)
 		.div.table = NULL,					\
 	}
 
+#define DIV_TABLE_RO(_index, _parent_idx, _name, _parent_name,		\
+		     _reg, _shift, _width, _table)			\
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
+		.div.flags = CLK_DIVIDER_READ_ONLY,			\
+		.div.table = _table,					\
+	}
+
 #define FF(_index, _parent_idx, _name, _parent_name, _mult, _div)	\
 	{								\
 		.index = _index,					\
@@ -423,6 +605,17 @@ static int eqc_probe(struct platform_device *pdev)
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
@@ -434,6 +627,17 @@ static int eqc_probe(struct platform_device *pdev)
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
@@ -675,6 +879,297 @@ static const struct eqc_match_data eqc_eyeq6h_acc_match_data = {
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
+	/* A single bit configures the 3 dividers below */
+	DIV_TABLE_RO(EQ7HC_DDR_DIV_APB, EQ7HC_DDR_PLL, "div-ddr0_apb", NULL,
+		     0x08, 10, 1, eqc_eyeq7h_ddr_apb_div_table),
+	DIV_TABLE_RO(EQ7HC_DDR_DIV_PLLREF, EQ7HC_DDR_PLL, "div-ddr0_pllref", NULL,
+		     0x08, 10, 1, eqc_eyeq7h_ddr_ref_div_table),
+	DIV_TABLE_RO(EQ7HC_DDR_DIV_DFI, EQ7HC_DDR_PLL, "div-ddr0-dfi", NULL,
+		     0x08, 10, 1, eqc_eyeq7h_ddr_dfi_div_table),
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
+	/* A single bit configures the 3 dividers below */
+	DIV_TABLE_RO(EQ7HC_DDR_DIV_APB, EQ7HC_DDR_PLL, "div-ddr1_apb", NULL,
+		     0x08, 10, 1, eqc_eyeq7h_ddr_apb_div_table),
+	DIV_TABLE_RO(EQ7HC_DDR_DIV_PLLREF, EQ7HC_DDR_PLL, "div-ddr1_pllref", NULL,
+		     0x08, 10, 1, eqc_eyeq7h_ddr_ref_div_table),
+	DIV_TABLE_RO(EQ7HC_DDR_DIV_DFI, EQ7HC_DDR_PLL, "div-ddr1-dfi", NULL,
+		     0x08, 10, 1, eqc_eyeq7h_ddr_dfi_div_table),
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
@@ -685,6 +1180,22 @@ static const struct of_device_id eqc_match_table[] = {
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
2.54.0


