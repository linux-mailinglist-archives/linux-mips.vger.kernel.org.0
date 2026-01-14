Return-Path: <linux-mips+bounces-12923-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB94D1DD29
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 11:07:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 88C04305EF86
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 10:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A15EC38A723;
	Wed, 14 Jan 2026 10:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eTHpaZx9"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34A238B7A3;
	Wed, 14 Jan 2026 10:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768385148; cv=none; b=LakEHJDBTGWKVO9/f4GIt+yz2j0/PLUwysstkU+TFKEodC7/LoEhz0UQOYO/OWf7TRbUaPLs9nVZGCczUUrBU8BtI7uxQ4EXBiPV2rkapSHylbpypfh8cQ0nDHCj+8OLUQIfB+l4MVZyCXVrBQFHCBwKrwZVey6wuVXS4d6GJJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768385148; c=relaxed/simple;
	bh=lgk2/qGA0b1VR+HeBS6kRZx98XsK1BUY0rAJ3bstsd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t2evSfvB8TnC9iLU6S9oDHI9ac1FsgnfxLCTFyBA1xAzVTG7mmU+mnAKniG0XULoGX0YVUfvsXNY1AirHJIehNu9H7oVkECN7NMomyY9ISnOOZF67B6lhN17zJ8oIIG2h9hyQ/T0iASIRQ4LtH4rRb7IulYssACAIQcsKemKPkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eTHpaZx9; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E13551A285F;
	Wed, 14 Jan 2026 10:05:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B6D7E6074A;
	Wed, 14 Jan 2026 10:05:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F0370103C89EC;
	Wed, 14 Jan 2026 11:05:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768385140; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aQLX+1ngliWY6MSGKZYIJumX9M1R29gapzwXl6Cw1fM=;
	b=eTHpaZx9KOH1FLchHSLEXkFE1KL7o6DIfZYCoYxNqPoGgpeXbtX6Jq5gmzmXu+FzkyARIW
	u/w0O8+s33B4M+d98cNW3CKl1u/NXay2zFdXh+Kct4YKoHGRUBFNNBQHm1RPtoQ9WeOeC1
	dfmWGKPXT0GEpaOGXNAp7YKA8FLXBjPIuvoAV0GCAixKwZO/kCK9Q2BmxHpAVx6wt6Nhsf
	XJ5FPtpgv64VqZQ2qfC9qjn6kePtXDl5jEKLCPUVl1H3//bepKFT+MYSeQpWSWUZrFqUhQ
	7qF3ho7pCAzTVmc7D8QGVU/b3+nXd4RwLWGhtjdKwGUcpIfmoBjd6msk6385VQ==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 14 Jan 2026 11:05:09 +0100
Subject: [PATCH v3 05/10] clk: eyeq: Prefix the PLL registers with the PLL
 type
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260114-clk-eyeq7-v3-5-8ebdba7b0133@bootlin.com>
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

Rename the PLL registers to make room for other PLL types that are
present in the eyeQ7H.

Move the access to the PLL register inside the function parsing it
as both call sites were doing the same thing.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/clk/clk-eyeq.c | 76 +++++++++++++++++++++++---------------------------
 1 file changed, 35 insertions(+), 41 deletions(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index 239ddcb59383..20046e8d4713 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -48,28 +48,28 @@
 #include <dt-bindings/clock/mobileye,eyeq6lplus-clk.h>
 
 /* In frac mode, it enables fractional noise canceling DAC. Else, no function. */
-#define PCSR0_DAC_EN			BIT(0)
+#define FRACG_PCSR0_DAC_EN			BIT(0)
 /* Fractional or integer mode */
-#define PCSR0_DSM_EN			BIT(1)
-#define PCSR0_PLL_EN			BIT(2)
+#define FRACG_PCSR0_DSM_EN			BIT(1)
+#define FRACG_PCSR0_PLL_EN			BIT(2)
 /* All clocks output held at 0 */
-#define PCSR0_FOUTPOSTDIV_EN		BIT(3)
-#define PCSR0_POST_DIV1			GENMASK(6, 4)
-#define PCSR0_POST_DIV2			GENMASK(9, 7)
-#define PCSR0_REF_DIV			GENMASK(15, 10)
-#define PCSR0_INTIN			GENMASK(27, 16)
-#define PCSR0_BYPASS			BIT(28)
+#define FRACG_PCSR0_FOUTPOSTDIV_EN		BIT(3)
+#define FRACG_PCSR0_POST_DIV1			GENMASK(6, 4)
+#define FRACG_PCSR0_POST_DIV2			GENMASK(9, 7)
+#define FRACG_PCSR0_REF_DIV			GENMASK(15, 10)
+#define FRACG_PCSR0_INTIN			GENMASK(27, 16)
+#define FRACG_PCSR0_BYPASS			BIT(28)
 /* Bits 30..29 are reserved */
-#define PCSR0_PLL_LOCKED		BIT(31)
+#define FRACG_PCSR0_PLL_LOCKED			BIT(31)
 
-#define PCSR1_RESET			BIT(0)
-#define PCSR1_SSGC_DIV			GENMASK(4, 1)
+#define FRACG_PCSR1_RESET			BIT(0)
+#define FRACG_PCSR1_SSGC_DIV			GENMASK(4, 1)
 /* Spread amplitude (% = 0.1 * SPREAD[4:0]) */
-#define PCSR1_SPREAD			GENMASK(9, 5)
-#define PCSR1_DIS_SSCG			BIT(10)
+#define FRACG_PCSR1_SPREAD			GENMASK(9, 5)
+#define FRACG_PCSR1_DIS_SSCG			BIT(10)
 /* Down-spread or center-spread */
-#define PCSR1_DOWN_SPREAD		BIT(11)
-#define PCSR1_FRAC_IN			GENMASK(31, 12)
+#define FRACG_PCSR1_DOWN_SPREAD			BIT(11)
+#define FRACG_PCSR1_FRAC_IN			GENMASK(31, 12)
 
 struct eqc_pll {
 	unsigned int	index;
@@ -161,34 +161,40 @@ static void eqc_pll_downshift_factors(unsigned long *mult, unsigned long *div)
 	*div >>= shift;
 }
 
-static int eqc_pll_parse_registers(u32 r0, u32 r1, unsigned long *mult,
-				   unsigned long *div, unsigned long *acc)
+static int eqc_pll_parse_fracg(void __iomem *base, unsigned long *mult,
+			       unsigned long *div, unsigned long *acc)
 {
 	unsigned long spread;
+	u32 r0, r1;
+	u64 val;
 
-	if (r0 & PCSR0_BYPASS) {
+	val = readq(base);
+	r0 = val;
+	r1 = val >> 32;
+
+	if (r0 & FRACG_PCSR0_BYPASS) {
 		*mult = 1;
 		*div = 1;
 		*acc = 0;
 		return 0;
 	}
 
-	if (!(r0 & PCSR0_PLL_LOCKED))
+	if (!(r0 & FRACG_PCSR0_PLL_LOCKED))
 		return -EINVAL;
 
-	*mult = FIELD_GET(PCSR0_INTIN, r0);
-	*div = FIELD_GET(PCSR0_REF_DIV, r0);
+	*mult = FIELD_GET(FRACG_PCSR0_INTIN, r0);
+	*div = FIELD_GET(FRACG_PCSR0_REF_DIV, r0);
 
 	/* Fractional mode, in 2^20 (0x100000) parts. */
-	if (r0 & PCSR0_DSM_EN) {
+	if (r0 & FRACG_PCSR0_DSM_EN) {
 		*div *= (1ULL << 20);
-		*mult = *mult * (1ULL << 20) + FIELD_GET(PCSR1_FRAC_IN, r1);
+		*mult = *mult * (1ULL << 20) + FIELD_GET(FRACG_PCSR1_FRAC_IN, r1);
 	}
 
 	if (!*mult || !*div)
 		return -EINVAL;
 
-	if (r1 & (PCSR1_RESET | PCSR1_DIS_SSCG)) {
+	if (r1 & (FRACG_PCSR1_RESET | FRACG_PCSR1_DIS_SSCG)) {
 		*acc = 0;
 		return 0;
 	}
@@ -203,10 +209,10 @@ static int eqc_pll_parse_registers(u32 r0, u32 r1, unsigned long *mult,
 	 *
 	 * Care is taken to avoid overflowing or losing precision.
 	 */
-	spread = FIELD_GET(PCSR1_SPREAD, r1);
+	spread = FIELD_GET(FRACG_PCSR1_SPREAD, r1);
 	*acc = DIV_ROUND_CLOSEST(spread * 1000000000, 1024 * 2);
 
-	if (r1 & PCSR1_DOWN_SPREAD) {
+	if (r1 & FRACG_PCSR1_DOWN_SPREAD) {
 		/*
 		 * Downspreading: the central frequency is half a
 		 * spread lower.
@@ -231,18 +237,12 @@ static void eqc_probe_init_plls(struct device *dev, const struct eqc_match_data
 	const struct eqc_pll *pll;
 	struct clk_hw *hw;
 	unsigned int i;
-	u32 r0, r1;
-	u64 val;
 	int ret;
 
 	for (i = 0; i < data->pll_count; i++) {
 		pll = &data->plls[i];
 
-		val = readq(base + pll->reg64);
-		r0 = val;
-		r1 = val >> 32;
-
-		ret = eqc_pll_parse_registers(r0, r1, &mult, &div, &acc);
+		ret = eqc_pll_parse_fracg(base + pll->reg64, &mult, &div, &acc);
 		if (ret) {
 			dev_warn(dev, "failed parsing state of %s\n", pll->name);
 			cells->hws[pll->index] = ERR_PTR(ret);
@@ -829,14 +829,8 @@ static void __init eqc_early_init(struct device_node *np,
 		const struct eqc_pll *pll = &early_data->early_plls[i];
 		unsigned long mult, div, acc;
 		struct clk_hw *hw;
-		u32 r0, r1;
-		u64 val;
 
-		val = readq(base + pll->reg64);
-		r0 = val;
-		r1 = val >> 32;
-
-		ret = eqc_pll_parse_registers(r0, r1, &mult, &div, &acc);
+		ret = eqc_pll_parse_fracg(base + pll->reg64, &mult, &div, &acc);
 		if (ret) {
 			pr_err("failed parsing state of %s\n", pll->name);
 			goto err;

-- 
2.52.0


