Return-Path: <linux-mips+bounces-11008-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D640EB41FEC
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 14:51:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C1C41A8668E
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 12:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFFBA30AACD;
	Wed,  3 Sep 2025 12:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oEn+P8eU"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85599309DDD;
	Wed,  3 Sep 2025 12:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756903691; cv=none; b=Yr7YqzZlYVm8IXeWhLR7HyPbQPtnrl6U9DBRoaQV0r5ixu3GF/MrUYCObrgKLL9fwG1zgcGUu3MO7slgp45xl7hf6rOUzJ9v/iQ7j9XYdHVBBu4ff8KAbTgRYH6Tbh5ZVbVjgUabm/vc8LUgtBFCLlLmcmOVKrqB+ReDaqsDiP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756903691; c=relaxed/simple;
	bh=W4Ta+ycjb4QCLgW02FiMWVfiz5MCgzdDYWA7YCly94w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PF0DdVJPwsgH9rd1mJULpSwfVuTRcKtegvlVd3DnTa0GtOH61S0Bcd/Ci6rj3tua4uPIsKjIkT7N0BQyXhOy+empOu9X4BEq6K70p7wUSoR/j4Vh+XsyjRHSkjSVuu0hmhy3+buBBa/mdOMO76QvI1ynRi5i7GaIKgPqCMeuAgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oEn+P8eU; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 0D55CC8EC56;
	Wed,  3 Sep 2025 12:47:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1E6ED606C3;
	Wed,  3 Sep 2025 12:48:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 031EA1C22C3F8;
	Wed,  3 Sep 2025 14:48:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756903686; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0wxZt/suAs12evWL3lnT9+Z1yeWU0cypzlWRzlgafgY=;
	b=oEn+P8eUGsBESsg/56v4rbCZsIviEdBIhoCdgmr/qkSZR8gDDQZvm6aGdAc0GG7pGB2Pjt
	+Rddl84zplPWl4wzW6JGryHtbreCd71fc1GVQhuyvem0I0BjCjkBML9JogBIfJQbRsMm9j
	9L8w3ukRyRFzaatPkECaheWuRWzY1H75jHCaIoTVyJ5fp41cnGlEbpNWZPxo/Jqzzr7oNU
	uMYjjOMMopj9P4Yu9d0cdjs+RrSrw3HO54dvtxriRZLm5QwsdwuvGYQaq9NX+kSTRTdhFe
	tudDhOIA1uqO90sE7l1CFJKu5NvIXlu7AP9ctpPOyXO0nOavH39ZXRG2C58v/A==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 03 Sep 2025 14:47:23 +0200
Subject: [PATCH 16/19] clk: eyeq: add two PLL types
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250903-clk-eyeq7-v1-16-3f5024b5d6e2@bootlin.com>
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

Add the handling of the two types of PLL found in the eyeQ7H OLB.

The JFRACR PLL have similar properties as the FRACG PLL, but its
configuration is spread on three registers instead of two.

The AINTP PLL does not support spread spectrum and uses a single
register.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/clk/clk-eyeq.c | 117 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index 07a205fefd93eed8f9c2c6b88fbf5b8b6a39a92c..cf745671d86a5fc770ec3599561eb3468e13bd58 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -70,8 +70,44 @@
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
+#define AINTP_PCSR_PLL_LOCKED			GENMASK(31, 30)
+
 enum eqc_pll_type {
 	EQC_PLL_FRACG,
+	EQC_PLL_JFRACR,
+	EQC_PLL_AINTP,
 };
 
 struct eqc_pll {
@@ -236,12 +272,93 @@ static int eqc_pll_parse_fracg(void __iomem *base, unsigned long *mult,
 	return 0;
 }
 
+static int eqc_pll_parse_jfracr(void __iomem *base, unsigned long *mult,
+				unsigned long *div, unsigned long *acc)
+{
+	u64 val;
+	u32 r0, r1, r2;
+	u32 spread;
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
+	if (r1 & JFRACR_PCSR1_DSM_EN) {
+		*div *= (1ULL << 20);
+		*mult = *mult * (1ULL << 20) + FIELD_GET(JFRACR_PCSR1_FRAC_IN, r1);
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
+	spread = FIELD_GET(JFRACR_PCSR2_SPREAD, r2);
+	*acc = spread * 500000;
+
+	if (r2 & JFRACR_PCSR2_DOWN_SPREAD) {
+		*mult *= 2000 - spread;
+		*div *= 2000;
+		eqc_pll_downshift_factors(mult, div);
+	}
+
+	return 0;
+}
+
+static int eqc_pll_parse_aintp(void __iomem *base, unsigned long *mult,
+			       unsigned long *div, unsigned long *acc)
+{
+	u32 r0;
+
+	/* no spread spectrum */
+	*acc = 0;
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
 static int eqc_parse_one_pll(void __iomem *base, enum eqc_pll_type type, unsigned long *mult,
 			     unsigned long *div, unsigned long *acc)
 {
 	switch (type) {
 	case EQC_PLL_FRACG:
 		return eqc_pll_parse_fracg(base, mult, div, acc);
+	case EQC_PLL_JFRACR:
+		return eqc_pll_parse_jfracr(base, mult, div, acc);
+	case EQC_PLL_AINTP:
+		return eqc_pll_parse_aintp(base, mult, div, acc);
 	}
 	return -EINVAL;
 }

-- 
2.51.0


