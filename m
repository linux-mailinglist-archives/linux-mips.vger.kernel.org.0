Return-Path: <linux-mips+bounces-10998-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 155E6B41FB4
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 14:49:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6120206B12
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 12:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A5C302776;
	Wed,  3 Sep 2025 12:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ukmIk4/k"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85297303CAF
	for <linux-mips@vger.kernel.org>; Wed,  3 Sep 2025 12:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756903671; cv=none; b=ssG4iKX+XFsZFZ2QpoxEY1uTImkRLhCnKcOWE03Bm4gOi5w7gH42DdQvnGvSoFnm6ZlI1ry4+bk1fnrqGPu1JhouCnnOetRF04Se8Xs3cAv6dJMTN2Tg5VzQ6RsMjA3aki1+GWTl6flqst04/6Kmatvp3459n7jKIE0r5DJrUXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756903671; c=relaxed/simple;
	bh=kGI9vrMnZ8OMv3ozZlNZdXDHDwL02sNWL/GPUnr19TA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fNkQoefN/M+MZN0ZgB7XeSVFCKh8K/UMjDJVDjpdFl6bJGY0I8BgBm1MUh1X96smGtzOsnR7G86CqLJHUmGiD2wUIlK2tRvPr3ntQayQ9/nlAWsyW+l/NIjzrez5Xc8FrHF82/XNmeYCeqjsuclfX81XuKNP6M+2rEa+EALYiyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ukmIk4/k; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 39BBC4E40C09;
	Wed,  3 Sep 2025 12:47:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 11D7D606C3;
	Wed,  3 Sep 2025 12:47:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 712381C22CD91;
	Wed,  3 Sep 2025 14:47:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756903666; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=hIuBi/1rFuUwp8AeM1BPzxwcWp+eQE6OQjarXfBjdmM=;
	b=ukmIk4/koyR30YSdaO1nYxVxYMNGFrNvT2+sFAsgltlhws0uBsYVv4rqN3KUNQkcJyprVy
	fWyVQlGSEZmUa3vWfPxYl5l5FtxHZLbht//vyiIJzyWpA7HjQ3jXBrWni4qKZHtjWQIPDW
	9CUJCeV71MflVeFxC2Pj+0UnVdTpb4JSMs9i1G4RcUtzGw3THToW9seuHgVPEtms4WVugE
	pLOZvCmtFkVW1bHXdPgt+gbrjekVPdiHttxjnQGKg354NdfmI7cReiGZDbG8vwzpERe7tQ
	ccRYbL03l7eTHTNFVlCAS6jYJ/XUeFuZpUca7adx208p68553P8by27oBmB2ew==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 03 Sep 2025 14:47:13 +0200
Subject: [PATCH 06/19] reset: eyeq: add eyeQ7H compatibles
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250903-clk-eyeq7-v1-6-3f5024b5d6e2@bootlin.com>
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

Add support for the reset controllers found in the eyeQ7H OLB. For
this, three new types of reset domain are added to the driver.

The EQR_EYEQ7H_ACRP reset domain is similar to the EQR_EYEQ5_ACRP
domain with a different registers layout.

The EQR_EYEQ7H_CFG reset domain is similar to the EQR_EYEQ5_PCIE
domain, again with a different registers layout.

The EQR_EYEQ7H_ACC reset domain is similar to the EQR_EYEQ6H_SARCR
domain, with a different registers layout and no busy waiting.

Signed-off-by: Sari Khoury <sari.khoury@mobileye.com>
Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/reset/reset-eyeq.c | 248 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 246 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-eyeq.c b/drivers/reset/reset-eyeq.c
index 02d50041048b42921e3e511148cd29f215b5fc5e..322c05d7e6b818e5b0d395787c69ad91616820e0 100644
--- a/drivers/reset/reset-eyeq.c
+++ b/drivers/reset/reset-eyeq.c
@@ -1,10 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Reset driver for the Mobileye EyeQ5, EyeQ6L and EyeQ6H platforms.
+ * Reset driver for the Mobileye EyeQ5, EyeQ6L, EyeQ6H and EyeQ7H platforms.
  *
  * Controllers live in a shared register region called OLB. EyeQ5 and EyeQ6L
  * have a single OLB instance for a single reset controller. EyeQ6H has seven
- * OLB instances; three host reset controllers.
+ * OLB instances; three host reset controllers. EyeQ7H has fourteen OLB instances;
+ * eleven host reset controllers.
  *
  * Each reset controller has one or more domain. Domains are of a given type
  * (see enum eqr_domain_type), with a valid offset mask (up to 32 resets per
@@ -61,6 +62,40 @@
  *  9. PMA0	10. PMA1	11. MPC0	12. MPC1
  * 13. MPC2	14. MPC3	15. PERIPH
  *
+ * Known resets in EyeQ7H south (type EQR_EYEQ7H_CFG)
+ *  0. PCI_PHY	1. PCI_CTL	2. S_NOC	3. GBE_PHY
+ *  4. GBE_CTL	5. XSPI		6. UFS		7. VDIO
+ *
+ * Known resets in EyeQ7H east (type EQR_EYEQ7H_CFG)
+ *  0. ISP	2. VEU		3. LBIST
+ *
+ * Known resets in EyeQ7H west (type EQR_EYEQ7H_CFG)
+ *  0. GPU	2. CAU		3. LBIST	4. GPU_LBIST
+ *
+ * Known resets in EyeQ7H periph (type EQR_EYEQ5_SARCR)
+ *  0. gpio	1.EXT TIMER	3.UART		4. SPI
+ *  5. I2C0	6. I2C1		7.I2C2		8. I2S
+ *
+ * Known resets in EyeQ7H ddr (type EQR_EYEQ7H_CFG)
+ *  0. APB	2. DMI		3. DFI		4. PHY_SMS
+ *  5. CTL_SMS
+ *
+ * Known resets in EyeQ7H acc (type EQR_EYEQ7H_ACRP)
+ *  1. VMP0	2. XVMP1	3. VMP2		4. VMP3
+ *  5. MPC0	6. MPC1		7. PMA0		8. PMA1
+ *
+ * Known resets in EyeQ7H acc (type EQR_EYEQ7H_ACC)
+ *  1. NCORE0	 2. NCORE1	3. NCORE0_M	4. NCORE1_M
+ *  5. NCORE_NOC 6. VMP_NOC	7. MPC_NOC	8. PMA_NOC
+ *
+ * Known resets in EyeQ7H xnn (type EQR_EYEQ7H_ACRP)
+ *  1. XNN0	2. XNN1		3.XNN2
+ *
+ * Known resets in EyeQ7H xnn (type EQR_EYEQ7H_ACC)
+ *  1. XNN0	2. XNN1		3. XNN2		4. XNN3
+ *  5. NCORE	6. I2_0		7. I2_1		8. SMS_0
+ *  9. SMS_1
+ *
  * Abbreviations:
  *  - PMA: Programmable Macro Array
  *  - MPC: Multi-threaded Processing Clusters
@@ -102,6 +137,9 @@ enum eqr_domain_type {
 	EQR_EYEQ5_ACRP,
 	EQR_EYEQ5_PCIE,
 	EQR_EYEQ6H_SARCR,
+	EQR_EYEQ7H_ACRP,
+	EQR_EYEQ7H_CFG,
+	EQR_EYEQ7H_ACC
 };
 
 /*
@@ -126,6 +164,21 @@ enum eqr_domain_type {
 #define EQR_EYEQ6H_SARCR_RST_STATUS	(0x008)
 #define EQR_EYEQ6H_SARCR_CLK_REQUEST	(0x00C)
 
+/*
+ * Domain type EQR_EYEQ7H_ACRP register masks.
+ * Registers are: base + 4 * offset.
+ */
+#define EQR_EYEQ7H_ACRP_PD_REQ		BIT(0)
+#define EQR_EYEQ7H_ACRP_MBIST_CFG	GENMASK(3, 1)
+#define EQR_EYEQ7H_ACRP_ST_POWER_DOWN	BIT(13)
+#define EQR_EYEQ7H_ACRP_ST_ACTIVE	BIT(14)
+
+/*
+ * Domain type EQR_EYEQ7H_ACC register masks.
+ */
+#define EQR_EYEQ7H_ACC_CLK_EN		(0x000)
+#define EQR_EYEQ7H_ACC_RST_EN		(0x004)
+
 struct eqr_busy_wait_timings {
 	unsigned long sleep_us;
 	unsigned long timeout_us;
@@ -134,7 +187,10 @@ struct eqr_busy_wait_timings {
 static const struct eqr_busy_wait_timings eqr_timings[] = {
 	[EQR_EYEQ5_SARCR]	= {1, 10},
 	[EQR_EYEQ5_ACRP]	= {1, 40 * USEC_PER_MSEC}, /* LBIST implies long timeout. */
+	[EQR_EYEQ7H_ACRP]	= {1, 40 * USEC_PER_MSEC},
 	/* EQR_EYEQ5_PCIE does no busy waiting. */
+	/* EQR_EYEQ7H_CFG does no busy waiting. */
+	/* EQR_EYEQ7H_ACC does no busy waiting. */
 	[EQR_EYEQ6H_SARCR]	= {1, 400},
 };
 
@@ -209,6 +265,17 @@ static int eqr_busy_wait_locked(struct eqr_private *priv, struct device *dev,
 					 sleep_us, timeout_us);
 		break;
 
+	case EQR_EYEQ7H_ACRP:
+		reg = base + 4 * offset;
+		if (assert)
+			mask = EQR_EYEQ7H_ACRP_ST_POWER_DOWN;
+		else
+			mask = EQR_EYEQ7H_ACRP_ST_ACTIVE;
+
+		ret = readl_poll_timeout(reg, val, !!(val & mask),
+					 sleep_us, timeout_us);
+		break;
+
 	case EQR_EYEQ5_PCIE:
 		ret = 0; /* No busy waiting. */
 		break;
@@ -229,6 +296,14 @@ static int eqr_busy_wait_locked(struct eqr_private *priv, struct device *dev,
 					&rst_status, &clk_status);
 		break;
 
+	case EQR_EYEQ7H_CFG:
+		ret = 0; /* No busy waiting. */
+		break;
+
+	case EQR_EYEQ7H_ACC:
+		ret = 0; /* No busy waiting. */
+		break;
+
 	default:
 		WARN_ON(1);
 		ret = -EINVAL;
@@ -261,6 +336,11 @@ static void eqr_assert_locked(struct eqr_private *priv, u32 domain, u32 offset)
 		writel(readl(reg) | EQR_EYEQ5_ACRP_PD_REQ, reg);
 		break;
 
+	case EQR_EYEQ7H_ACRP:
+		reg = base + 4 * offset;
+		writel((readl(reg) & ~EQR_EYEQ7H_ACRP_MBIST_CFG) | EQR_EYEQ7H_ACRP_PD_REQ, reg);
+		break;
+
 	case EQR_EYEQ5_PCIE:
 		writel(readl(base) & ~BIT(offset), base);
 		break;
@@ -273,6 +353,18 @@ static void eqr_assert_locked(struct eqr_private *priv, u32 domain, u32 offset)
 		writel(val, base + EQR_EYEQ6H_SARCR_CLK_REQUEST);
 		break;
 
+	case EQR_EYEQ7H_CFG:
+		writel(readl(base) & ~BIT(2 * offset) & ~BIT(2 * offset + 1), base);
+		break;
+
+	case EQR_EYEQ7H_ACC:
+		/* RST_REQUEST and CLK_REQUEST must be kept in sync. */
+		val = readl(base + EQR_EYEQ7H_ACC_RST_EN);
+		val &= ~BIT(offset);
+		writel(val, base + EQR_EYEQ7H_ACC_RST_EN);
+		writel(val, base + EQR_EYEQ7H_ACC_CLK_EN);
+		break;
+
 	default:
 		WARN_ON(1);
 		break;
@@ -315,6 +407,11 @@ static void eqr_deassert_locked(struct eqr_private *priv, u32 domain,
 		writel(readl(reg) & ~EQR_EYEQ5_ACRP_PD_REQ, reg);
 		break;
 
+	case EQR_EYEQ7H_ACRP:
+		reg = base + 4 * offset;
+		writel((readl(reg) & ~EQR_EYEQ7H_ACRP_MBIST_CFG) & ~EQR_EYEQ7H_ACRP_PD_REQ, reg);
+		break;
+
 	case EQR_EYEQ5_PCIE:
 		writel(readl(base) | BIT(offset), base);
 		break;
@@ -327,6 +424,18 @@ static void eqr_deassert_locked(struct eqr_private *priv, u32 domain,
 		writel(val, base + EQR_EYEQ6H_SARCR_CLK_REQUEST);
 		break;
 
+	case EQR_EYEQ7H_CFG:
+		writel(readl(base) | BIT(2 * offset) | BIT(2 * offset + 1), base);
+		break;
+
+	case EQR_EYEQ7H_ACC:
+		/* RST_REQUEST and CLK_REQUEST must be kept in sync. */
+		val = readl(base + EQR_EYEQ7H_ACC_RST_EN);
+		val |= BIT(offset);
+		writel(val, base + EQR_EYEQ7H_ACC_RST_EN);
+		writel(val, base + EQR_EYEQ7H_ACC_CLK_EN);
+		break;
+
 	default:
 		WARN_ON(1);
 		break;
@@ -368,11 +477,19 @@ static int eqr_status(struct reset_controller_dev *rcdev, unsigned long id)
 	case EQR_EYEQ5_ACRP:
 		reg = base + 4 * offset;
 		return !(readl(reg) & EQR_EYEQ5_ACRP_ST_ACTIVE);
+	case EQR_EYEQ7H_ACRP:
+		reg = base + 4 * offset;
+		return !(readl(reg) & EQR_EYEQ7H_ACRP_ST_ACTIVE);
 	case EQR_EYEQ5_PCIE:
 		return !(readl(base) & BIT(offset));
 	case EQR_EYEQ6H_SARCR:
 		reg = base + EQR_EYEQ6H_SARCR_RST_STATUS;
 		return !(readl(reg) & BIT(offset));
+	case EQR_EYEQ7H_CFG:
+		return !(readl(base) & BIT(2 * offset));
+	case EQR_EYEQ7H_ACC:
+		reg = base + EQR_EYEQ7H_ACC_RST_EN;
+		return !(readl(reg) & BIT(offset));
 	default:
 		return -EINVAL;
 	}
@@ -537,6 +654,113 @@ static const struct eqr_match_data eqr_eyeq6h_acc_data = {
 	.domains	= eqr_eyeq6h_acc_domains,
 };
 
+static const struct eqr_domain_descriptor eqr_eyeq7h_south_domains[] = {
+	{
+		.type = EQR_EYEQ7H_CFG,
+		.valid_mask = 0x1F,
+		.offset = 0x070,
+	},
+	{
+		.type = EQR_EYEQ7H_CFG,
+		.valid_mask = 0x7,
+		.offset = 0x074,
+	},
+};
+
+static const struct eqr_match_data eqr_eyeq7h_south_data = {
+	.domain_count	= ARRAY_SIZE(eqr_eyeq7h_south_domains),
+	.domains	= eqr_eyeq7h_south_domains,
+};
+
+static const struct eqr_domain_descriptor eqr_eyeq7h_east_domains[] = {
+	{
+		.type = EQR_EYEQ7H_CFG,
+		.valid_mask = 0x7,
+		.offset = 0x060,
+	},
+};
+
+static const struct eqr_match_data eqr_eyeq7h_east_data = {
+	.domain_count	= ARRAY_SIZE(eqr_eyeq7h_east_domains),
+	.domains	= eqr_eyeq7h_east_domains,
+};
+
+static const struct eqr_domain_descriptor eqr_eyeq7h_west_domains[] = {
+	{
+		.type = EQR_EYEQ7H_CFG,
+		.valid_mask = 0xf,
+		.offset = 0x068,
+	},
+};
+
+static const struct eqr_match_data eqr_eyeq7h_west_data = {
+	.domain_count	= ARRAY_SIZE(eqr_eyeq7h_west_domains),
+	.domains	= eqr_eyeq7h_west_domains,
+};
+
+/* Periph OLBs each have an instance. */
+static const struct eqr_domain_descriptor eqr_eyeq7h_per_domains[] = {
+	{
+		.type = EQR_EYEQ6H_SARCR,
+		.valid_mask = 0xFF,
+		.offset = 0x030,
+	},
+};
+
+static const struct eqr_match_data eqr_eyeq7h_per_data = {
+	.domain_count	= ARRAY_SIZE(eqr_eyeq7h_per_domains),
+	.domains	= eqr_eyeq7h_per_domains,
+};
+
+static const struct eqr_domain_descriptor eqr_eyeq7h_ddr_domains[] = {
+	{
+		.type = EQR_EYEQ7H_ACRP,
+		.valid_mask = 0x1F,
+		.offset = 0x008,
+	},
+};
+
+static const struct eqr_match_data eqr_eyeq7h_ddr_data = {
+	.domain_count	= ARRAY_SIZE(eqr_eyeq7h_ddr_domains),
+	.domains	= eqr_eyeq7h_ddr_domains,
+};
+
+static const struct eqr_domain_descriptor eqr_eyeq7h_acc_domains[] = {
+	{
+		.type = EQR_EYEQ7H_ACRP,
+		.valid_mask = 0xFF,
+		.offset = 0x000,
+	},
+	{
+		.type = EQR_EYEQ7H_ACC,
+		.valid_mask = 0xFF,
+		.offset = 0x060,
+	},
+};
+
+static const struct eqr_match_data eqr_eyeq7h_acc_data = {
+	.domain_count	= ARRAY_SIZE(eqr_eyeq7h_acc_domains),
+	.domains	= eqr_eyeq7h_acc_domains,
+};
+
+static const struct eqr_domain_descriptor eqr_eyeq7h_xnn_domains[] = {
+	{
+		.type = EQR_EYEQ7H_ACRP,
+		.valid_mask = 0x7,
+		.offset = 0x000,
+	},
+	{
+		.type = EQR_EYEQ7H_ACC,
+		.valid_mask = 0x1FF,
+		.offset = 0x060,
+	},
+};
+
+static const struct eqr_match_data eqr_eyeq7h_xnn_data = {
+	.domain_count	= ARRAY_SIZE(eqr_eyeq7h_xnn_domains),
+	.domains	= eqr_eyeq7h_xnn_domains,
+};
+
 /*
  * Table describes OLB system-controller compatibles.
  * It does not get used to match against devicetree node.
@@ -547,6 +771,17 @@ static const struct of_device_id eqr_match_table[] = {
 	{ .compatible = "mobileye,eyeq6h-west-olb", .data = &eqr_eyeq6h_we_data },
 	{ .compatible = "mobileye,eyeq6h-east-olb", .data = &eqr_eyeq6h_we_data },
 	{ .compatible = "mobileye,eyeq6h-acc-olb", .data = &eqr_eyeq6h_acc_data },
+	{ .compatible = "mobileye,eyeq7h-south-olb", .data = &eqr_eyeq7h_south_data },
+	{ .compatible = "mobileye,eyeq7h-east-olb", .data = &eqr_eyeq7h_east_data },
+	{ .compatible = "mobileye,eyeq7h-west-olb", .data = &eqr_eyeq7h_west_data },
+	{ .compatible = "mobileye,eyeq7h-periph-east-olb", .data = &eqr_eyeq7h_per_data },
+	{ .compatible = "mobileye,eyeq7h-periph-west-olb", .data = &eqr_eyeq7h_per_data },
+	{ .compatible = "mobileye,eyeq7h-ddr0-olb", .data = &eqr_eyeq7h_ddr_data },
+	{ .compatible = "mobileye,eyeq7h-ddr1-olb", .data = &eqr_eyeq7h_ddr_data },
+	{ .compatible = "mobileye,eyeq7h-acc0-olb", .data = &eqr_eyeq7h_acc_data },
+	{ .compatible = "mobileye,eyeq7h-acc1-olb", .data = &eqr_eyeq7h_acc_data },
+	{ .compatible = "mobileye,eyeq7h-xnn0-olb", .data = &eqr_eyeq7h_xnn_data },
+	{ .compatible = "mobileye,eyeq7h-xnn1-olb", .data = &eqr_eyeq7h_xnn_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, eqr_match_table);
@@ -556,6 +791,15 @@ static const struct auxiliary_device_id eqr_id_table[] = {
 	{ .name = "clk_eyeq.reset_west" },
 	{ .name = "clk_eyeq.reset_east" },
 	{ .name = "clk_eyeq.reset_acc" },
+	{ .name = "clk_eyeq.reset_south" },
+	{ .name = "clk_eyeq.reset_periph_east" },
+	{ .name = "clk_eyeq.reset_periph_west" },
+	{ .name = "clk_eyeq.reset_ddr0" },
+	{ .name = "clk_eyeq.reset_ddr1" },
+	{ .name = "clk_eyeq.reset_acc0" },
+	{ .name = "clk_eyeq.reset_acc1" },
+	{ .name = "clk_eyeq.reset_xnn0" },
+	{ .name = "clk_eyeq.reset_xnn1" },
 	{}
 };
 MODULE_DEVICE_TABLE(auxiliary, eqr_id_table);

-- 
2.51.0


