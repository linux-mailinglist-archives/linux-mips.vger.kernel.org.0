Return-Path: <linux-mips+bounces-14558-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGWqIJUtA2qN1QEAu9opvQ
	(envelope-from <linux-mips+bounces-14558-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 12 May 2026 15:39:33 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 001D252163E
	for <lists+linux-mips@lfdr.de>; Tue, 12 May 2026 15:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8CE4130FC89E
	for <lists+linux-mips@lfdr.de>; Tue, 12 May 2026 13:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0F553905F8;
	Tue, 12 May 2026 13:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="23fGMuR2"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5F83812E9;
	Tue, 12 May 2026 13:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778592462; cv=none; b=SQObXrYGdWXxoIMpbpEsrKmuLvXPT0L8587rDrotrIaNmbR4Tcjd6mL+aJpiOk8XdfjRYe1+x8liGnHOmoPOicrOnNySaTiTQPKyY7kbvjxUmlcQsNaFjo7H7SJ5at5xVoRlwSmfVW2Hsg6G6Sl84bYuvX6sZ+TEjpMrB+N+Kok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778592462; c=relaxed/simple;
	bh=S5UHUET9y13JLO6FULt8Jy3ftt57RDYZGzcdbd4Exig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jdqt0ihGdiio1g8DzIz/MqVAdNZZETsqgazK40bpfBEwplZIlfD/QbeIDkF3mPOU0gXbxFlUyQnEWK2rRQjhKPqtVP9jLhX4REXbik0MzDBvG1grJ7ibTFqVBTTtevkrZnxQ75QN44XOk+2IrsZyt+Qo9uNGyN4R1vQ4dxLh/oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=23fGMuR2; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 445381A3588;
	Tue, 12 May 2026 13:27:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 12C2360646;
	Tue, 12 May 2026 13:27:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 88C9911AF8CE2;
	Tue, 12 May 2026 15:27:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778592457; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3b/maRC5laBeCO2vBRrfyTCWCOlfsiBs/MaFuJdndqw=;
	b=23fGMuR2U8opOitUOzqltB8pie4Dy/0LNp3qEzyAqWdWWgEOWGV9Kmdutj52he1IyasTJ9
	Mdr7Imnh+CU/YoIFdsztIOQzsp5f3gIOQb8aeIOdBuFBbMwn9ZtAp9jT52BFlPYIAJQERW
	Pok9tNif9mraF+Llzef+de8PDuAngcZsdi/HvQL4UJFHAj7oysn67yxULjiNn204klXUTT
	10MP5g30wTu8fQNqW+ZIEr94kpQQ6vD0LLjfc1070MaKsXAenhGLUhDjiTIOX9HGHf8osz
	kRJTehqRg8L+c/rmVmMNNVYrwmAOrDwTNwDL/Sar8jiAWbIAa9ubaKtH/bLQ8Q==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Tue, 12 May 2026 15:27:01 +0200
Subject: [PATCH v6 2/9] reset: eyeq: Add EyeQ7H compatibles
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260512-clk-eyeq7-v6-2-0540cce18fb2@bootlin.com>
References: <20260512-clk-eyeq7-v6-0-0540cce18fb2@bootlin.com>
In-Reply-To: <20260512-clk-eyeq7-v6-0-0540cce18fb2@bootlin.com>
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
 linux-clk@vger.kernel.org, Sari Khoury <sari.khoury@mobileye.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 001D252163E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14558-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benoit.monin@bootlin.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:email,bootlin.com:email,bootlin.com:mid,bootlin.com:dkim,mobileye.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Add support for the reset controllers found in the EyeQ7H OLB. For
this, three new types of reset domain are added to the driver.

The EQR_EYEQ7H_ACRP reset domain is similar to the EQR_EYEQ5_ACRP domain,
sharing the same register address calculation but featuring a different
register layout. When writing to the register, MBIST bits are set to
zero to ensure normal device operation.

The EQR_EYEQ7H_CFG reset domain is similar to the EQR_EYEQ5_PCIE domain,
with two bits per device instead of one. These two bits, clock enable and
nreset, are kept in sync when asserting and deasserting the device reset.

The EQR_EYEQ7H_ACC reset domain is similar to the EQR_EYEQ6H_SARCR domain,
with a different registers layout and no busy waiting.

Alongside these new reset domains, add EQR_NB_DOM_TYPES at the end of the
eqr_domain_type enumeration and use it to declare the eqr_timings array.
This ensures that we have the expected number of entries when using the
timings in eqr_busy_wait_locked().

Add and order the auxiliary_device_id entries in eqr_id_table.

Originally-by: Sari Khoury <sari.khoury@mobileye.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/reset/reset-eyeq.c | 268 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 259 insertions(+), 9 deletions(-)

diff --git a/drivers/reset/reset-eyeq.c b/drivers/reset/reset-eyeq.c
index 1a3857983897..ce758a1757fc 100644
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
@@ -73,6 +74,40 @@
  *  9. PMA0	10. PMA1	11. MPC0	12. MPC1
  * 13. MPC2	14. MPC3	15. PERIPH
  *
+ * Known resets in EyeQ7H acc domain 0 (type EQR_EYEQ7H_ACRP)
+ *  1. VMP0	2. XVMP1	3. VMP2		4. VMP3
+ *  5. MPC0	6. MPC1		7. PMA0		8. PMA1
+ *
+ * Known resets in EyeQ7H acc domain 1 (type EQR_EYEQ7H_ACC)
+ *  1. NCORE0	 2. NCORE1	3. NCORE0_M	4. NCORE1_M
+ *  5. NCORE_NOC 6. VMP_NOC	7. MPC_NOC	8. PMA_NOC
+ *
+ * Known resets in EyeQ7H ddr (type EQR_EYEQ7H_CFG)
+ *  0. APB	2. DMI		3. DFI		4. PHY_SMS
+ *  5. CTL_SMS
+ *
+ * Known resets in EyeQ7H east (type EQR_EYEQ7H_CFG)
+ *  0. ISP	2. VEU		3. LBIST
+ *
+ * Known resets in EyeQ7H periph (type EQR_EYEQ6H_SARCR)
+ *  0. gpio	1.EXT TIMER	3.UART		4. SPI
+ *  5. I2C0	6. I2C1		7.I2C2		8. I2S
+ *
+ * Known resets in EyeQ7H south (type EQR_EYEQ7H_CFG)
+ *  0. PCI_PHY	1. PCI_CTL	2. S_NOC	3. GBE_PHY
+ *  4. GBE_CTL	5. XSPI		6. UFS		7. VDIO
+ *
+ * Known resets in EyeQ7H west (type EQR_EYEQ7H_CFG)
+ *  0. GPU	2. CAU		3. LBIST	4. GPU_LBIST
+ *
+ * Known resets in EyeQ7H xnn domain 0 (type EQR_EYEQ7H_ACRP)
+ *  1. XNN0	2. XNN1		3.XNN2
+ *
+ * Known resets in EyeQ7H xnn domain 1 (type EQR_EYEQ7H_ACC)
+ *  1. XNN0	2. XNN1		3. XNN2		4. XNN3
+ *  5. NCORE	6. I2_0		7. I2_1		8. SMS_0
+ *  9. SMS_1
+ *
  * Abbreviations:
  *  - PMA: Programmable Macro Array
  *  - MPC: Multi-threaded Processing Clusters
@@ -114,6 +149,11 @@ enum eqr_domain_type {
 	EQR_EYEQ5_ACRP,
 	EQR_EYEQ5_PCIE,
 	EQR_EYEQ6H_SARCR,
+	EQR_EYEQ7H_ACC,
+	EQR_EYEQ7H_ACRP,
+	EQR_EYEQ7H_CFG,
+
+	EQR_NB_DOM_TYPES /* number of domain types, keep at the end */
 };
 
 /*
@@ -138,16 +178,34 @@ enum eqr_domain_type {
 #define EQR_EYEQ6H_SARCR_RST_STATUS	(0x008)
 #define EQR_EYEQ6H_SARCR_CLK_REQUEST	(0x00C)
 
+/*
+ * Domain type EQR_EYEQ7H_ACC register offsets.
+ */
+#define EQR_EYEQ7H_ACC_CLK_EN		(0x000)
+#define EQR_EYEQ7H_ACC_RST_EN		(0x004)
+
+/*
+ * Domain type EQR_EYEQ7H_ACRP register masks.
+ * Registers are: base + 4 * offset.
+ */
+#define EQR_EYEQ7H_ACRP_PD_REQ		BIT(0)
+#define EQR_EYEQ7H_ACRP_MBIST_CFG	GENMASK(3, 1)
+#define EQR_EYEQ7H_ACRP_ST_POWER_DOWN	BIT(13)
+#define EQR_EYEQ7H_ACRP_ST_ACTIVE	BIT(14)
+
 struct eqr_busy_wait_timings {
 	unsigned long sleep_us;
 	unsigned long timeout_us;
 };
 
-static const struct eqr_busy_wait_timings eqr_timings[] = {
+static const struct eqr_busy_wait_timings eqr_timings[EQR_NB_DOM_TYPES] = {
 	[EQR_EYEQ5_SARCR]	= {1, 10},
 	[EQR_EYEQ5_ACRP]	= {1, 40 * USEC_PER_MSEC}, /* LBIST implies long timeout. */
 	/* EQR_EYEQ5_PCIE does no busy waiting. */
 	[EQR_EYEQ6H_SARCR]	= {1, 400},
+	/* EQR_EYEQ7H_ACC does no busy waiting. */
+	[EQR_EYEQ7H_ACRP]	= {1, 40 * USEC_PER_MSEC},
+	/* EQR_EYEQ7H_CFG does no busy waiting. */
 };
 
 #define EQR_MAX_DOMAIN_COUNT 3
@@ -221,10 +279,6 @@ static int eqr_busy_wait_locked(struct eqr_private *priv, struct device *dev,
 					 sleep_us, timeout_us);
 		break;
 
-	case EQR_EYEQ5_PCIE:
-		ret = 0; /* No busy waiting. */
-		break;
-
 	case EQR_EYEQ6H_SARCR:
 		/*
 		 * Wait until both bits change:
@@ -241,6 +295,23 @@ static int eqr_busy_wait_locked(struct eqr_private *priv, struct device *dev,
 					&rst_status, &clk_status);
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
+	case EQR_EYEQ5_PCIE:
+	case EQR_EYEQ7H_ACC:
+	case EQR_EYEQ7H_CFG:
+		ret = 0; /* No busy waiting. */
+		break;
+
 	default:
 		WARN_ON(1);
 		ret = -EINVAL;
@@ -285,6 +356,28 @@ static void eqr_assert_locked(struct eqr_private *priv, u32 domain, u32 offset)
 		writel(val, base + EQR_EYEQ6H_SARCR_CLK_REQUEST);
 		break;
 
+	case EQR_EYEQ7H_ACC:
+		/* RST_REQUEST and CLK_REQUEST must be kept in sync. */
+		val = readl(base + EQR_EYEQ7H_ACC_RST_EN);
+		val &= ~BIT(offset);
+		writel(val, base + EQR_EYEQ7H_ACC_RST_EN);
+		writel(val, base + EQR_EYEQ7H_ACC_CLK_EN);
+		break;
+
+	case EQR_EYEQ7H_ACRP:
+		/* set powerdown and leave MBIST bits at zero */
+		reg = base + 4 * offset;
+		val = readl(reg) & ~EQR_EYEQ7H_ACRP_MBIST_CFG;
+		writel(val | EQR_EYEQ7H_ACRP_PD_REQ, reg);
+		break;
+
+	case EQR_EYEQ7H_CFG:
+		/* clear clock enable and NRESET bits */
+		val = readl(base);
+		val &= ~GENMASK(2 * offset + 1, 2 * offset);
+		writel(val, base);
+		break;
+
 	default:
 		WARN_ON(1);
 		break;
@@ -339,6 +432,28 @@ static void eqr_deassert_locked(struct eqr_private *priv, u32 domain,
 		writel(val, base + EQR_EYEQ6H_SARCR_CLK_REQUEST);
 		break;
 
+	case EQR_EYEQ7H_ACC:
+		/* RST_REQUEST and CLK_REQUEST must be kept in sync. */
+		val = readl(base + EQR_EYEQ7H_ACC_RST_EN);
+		val |= BIT(offset);
+		writel(val, base + EQR_EYEQ7H_ACC_RST_EN);
+		writel(val, base + EQR_EYEQ7H_ACC_CLK_EN);
+		break;
+
+	case EQR_EYEQ7H_ACRP:
+		/* clear powerdown and leave MBIST bits at zero */
+		reg = base + 4 * offset;
+		val = readl(reg) & ~EQR_EYEQ7H_ACRP_MBIST_CFG;
+		writel(val & ~EQR_EYEQ7H_ACRP_PD_REQ, reg);
+		break;
+
+	case EQR_EYEQ7H_CFG:
+		/* set clock enable and NRESET bits */
+		val = readl(base);
+		val |= GENMASK(2 * offset + 1, 2 * offset);
+		writel(val, base);
+		break;
+
 	default:
 		WARN_ON(1);
 		break;
@@ -385,6 +500,14 @@ static int eqr_status(struct reset_controller_dev *rcdev, unsigned long id)
 	case EQR_EYEQ6H_SARCR:
 		reg = base + EQR_EYEQ6H_SARCR_RST_STATUS;
 		return !(readl(reg) & BIT(offset));
+	case EQR_EYEQ7H_ACC:
+		reg = base + EQR_EYEQ7H_ACC_RST_EN;
+		return !(readl(reg) & BIT(offset));
+	case EQR_EYEQ7H_ACRP:
+		reg = base + 4 * offset;
+		return !(readl(reg) & EQR_EYEQ7H_ACRP_ST_ACTIVE);
+	case EQR_EYEQ7H_CFG:
+		return !(readl(base) & BIT(2 * offset));
 	default:
 		return -EINVAL;
 	}
@@ -558,6 +681,113 @@ static const struct eqr_match_data eqr_eyeq6h_acc_data = {
 	.domains	= eqr_eyeq6h_acc_domains,
 };
 
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
@@ -569,15 +799,35 @@ static const struct of_device_id eqr_match_table[] = {
 	{ .compatible = "mobileye,eyeq6h-west-olb", .data = &eqr_eyeq6h_we_data },
 	{ .compatible = "mobileye,eyeq6h-east-olb", .data = &eqr_eyeq6h_we_data },
 	{ .compatible = "mobileye,eyeq6h-acc-olb", .data = &eqr_eyeq6h_acc_data },
+	{ .compatible = "mobileye,eyeq7h-acc0-olb", .data = &eqr_eyeq7h_acc_data },
+	{ .compatible = "mobileye,eyeq7h-acc1-olb", .data = &eqr_eyeq7h_acc_data },
+	{ .compatible = "mobileye,eyeq7h-ddr0-olb", .data = &eqr_eyeq7h_ddr_data },
+	{ .compatible = "mobileye,eyeq7h-ddr1-olb", .data = &eqr_eyeq7h_ddr_data },
+	{ .compatible = "mobileye,eyeq7h-east-olb", .data = &eqr_eyeq7h_east_data },
+	{ .compatible = "mobileye,eyeq7h-periph-east-olb", .data = &eqr_eyeq7h_per_data },
+	{ .compatible = "mobileye,eyeq7h-periph-west-olb", .data = &eqr_eyeq7h_per_data },
+	{ .compatible = "mobileye,eyeq7h-south-olb", .data = &eqr_eyeq7h_south_data },
+	{ .compatible = "mobileye,eyeq7h-west-olb", .data = &eqr_eyeq7h_west_data },
+	{ .compatible = "mobileye,eyeq7h-xnn0-olb", .data = &eqr_eyeq7h_xnn_data },
+	{ .compatible = "mobileye,eyeq7h-xnn1-olb", .data = &eqr_eyeq7h_xnn_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, eqr_match_table);
 
 static const struct auxiliary_device_id eqr_id_table[] = {
 	{ .name = "clk_eyeq.reset" },
-	{ .name = "clk_eyeq.reset_west" },
-	{ .name = "clk_eyeq.reset_east" },
 	{ .name = "clk_eyeq.reset_acc" },
+	{ .name = "clk_eyeq.reset_acc0" },
+	{ .name = "clk_eyeq.reset_acc1" },
+	{ .name = "clk_eyeq.reset_ddr0" },
+	{ .name = "clk_eyeq.reset_ddr1" },
+	{ .name = "clk_eyeq.reset_east" },
+	{ .name = "clk_eyeq.reset_periph_east" },
+	{ .name = "clk_eyeq.reset_periph_west" },
+	{ .name = "clk_eyeq.reset_south" },
+	{ .name = "clk_eyeq.reset_west" },
+	{ .name = "clk_eyeq.reset_xnn0" },
+	{ .name = "clk_eyeq.reset_xnn1" },
 	{}
 };
 MODULE_DEVICE_TABLE(auxiliary, eqr_id_table);

-- 
2.54.0


