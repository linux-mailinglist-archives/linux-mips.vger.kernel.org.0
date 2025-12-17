Return-Path: <linux-mips+bounces-12500-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFA0CC8003
	for <lists+linux-mips@lfdr.de>; Wed, 17 Dec 2025 14:55:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 132513005ABF
	for <lists+linux-mips@lfdr.de>; Wed, 17 Dec 2025 13:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3665F34A3DA;
	Wed, 17 Dec 2025 13:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TqeC4OSd"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B41433D6D9
	for <linux-mips@vger.kernel.org>; Wed, 17 Dec 2025 13:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765978583; cv=none; b=PGdSaHVYQ4UwAHnkIJre/EWoNFeftvKOq/tZfJkDP784JtjszaaEDzGhdWvCpMJCVwpzt9J48NaC5X93yuBw4y/7VMn2nWM4JVCoD2OC7B+YPfDDMbFRCRgxUviKBRkud+m6nBHHq79YrK1WZYH71XNXP/tqYI/dWP10fXNU3Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765978583; c=relaxed/simple;
	bh=m590nntX4ppviCCDPhndoQX+FPzbzQg/sWseHpjS0L8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UXLuzCtryxXpRdUdfxpJrp6k0488+4tlQdrHWvpjcly1uXMo1S/Qa/CPOPIuVNqnu9OpYYinq/Kc6XlZ35pJwF5qSacSovdcJxjhReDV5rIM9APPyd6kUZXh6RGIbikJQ6XFjn0cXI81ikQijWBN2XjwQsmJa73LxJyy3u0oiWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TqeC4OSd; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 49519C1A5A2;
	Wed, 17 Dec 2025 13:35:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BF49D60739;
	Wed, 17 Dec 2025 13:36:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3FEDF102F0ACC;
	Wed, 17 Dec 2025 14:36:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765978578; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WwV71J+GvRMt5S0XG+Cm4p0MxsmS37VCZZFJasiab4A=;
	b=TqeC4OSdnDjevGbgfw36YEThRNqhpgcbFPx5spAQ64JHmdgP72jUOfUanqeFZxiNlCWsip
	hzTDtAWXw/bx2k2uc5HjDV91Ip87u6WJmkjP3EA+0Tdv4i3+50i7yM8RdynzkWWxP280Oy
	85KpN+wXQCDKM+TdcUDiWczaEiti7FA60kTktUYWslt7o0BBrbmECTw0bnTBkUkm+Yn77t
	nnrDTN3XauRKrkR+DQpcftQlVAFSLvLfxZ86lbvD+Cc96lPQWHpNTqdo40TlMxCY8QWRG/
	lfpZRVYoBu0wLdvfh+d8Oc4pLMhSM79PtVH0FzcuHWAiPq7y5zK7dA+jScLPNA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 17 Dec 2025 14:35:54 +0100
Subject: [PATCH 04/13] reset: eyeq: Add Mobileye EyeQ6Lplus OLB
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251217-eyeq6lplus-v1-4-e9cdbd3af4c2@bootlin.com>
References: <20251217-eyeq6lplus-v1-0-e9cdbd3af4c2@bootlin.com>
In-Reply-To: <20251217-eyeq6lplus-v1-0-e9cdbd3af4c2@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linusw@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Declare the two reset domains found in the EyeQ6Lplus OLB and add
them to the data matched by 'mobileye,eyeq6lplus-olb' compatible.

Those reset domains are identical to those present in the EyeQ5
OLB, so no changes are needed to support them.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/reset/Kconfig      |  4 ++--
 drivers/reset/reset-eyeq.c | 31 +++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 6e5d6deffa7d..ba0814f0f292 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -85,9 +85,9 @@ config RESET_EIC7700
 
 config RESET_EYEQ
 	bool "Mobileye EyeQ reset controller"
-	depends on MACH_EYEQ5 || MACH_EYEQ6H || COMPILE_TEST
+	depends on MACH_EYEQ5 || MACH_EYEQ6H || MACH_EYEQ6LPLUS || COMPILE_TEST
 	select AUXILIARY_BUS
-	default MACH_EYEQ5 || MACH_EYEQ6H
+	default MACH_EYEQ5 || MACH_EYEQ6H || MACH_EYEQ6LPLUS
 	help
 	  This enables the Mobileye EyeQ reset controller, used in EyeQ5, EyeQ6L
 	  and EyeQ6H SoCs.
diff --git a/drivers/reset/reset-eyeq.c b/drivers/reset/reset-eyeq.c
index 2d3998368a1c..791b7283111e 100644
--- a/drivers/reset/reset-eyeq.c
+++ b/drivers/reset/reset-eyeq.c
@@ -49,6 +49,18 @@
  *  8. MPC0	 9. MPC1	10. MPC2	11. MPC3
  * 12. MPC4
  *
+ * Known resets in EyeQ6Lplus domain 0 (type EQR_EYEQ5_PCIE):
+ *  0. SPI0	 1. SPI1	 2. UART0	 3. I2C0
+ *  4. I2C1	 5. TIMER0	 6. TIMER1	 7. TIMER2
+ *  8. TIMER3	 9. WD0		10. WD1		11. EXT0
+ * 12. EXT1	13. GPIO
+ *
+ * Known resets in EyeQ6Lplus domain 1 (type EQR_EYEQ5_ACRP):
+ *  0. VMP0	 1. VMP1	 2. VMP2	 3. VMP3
+ *  4. PMA0	 5. PMA1	 6. PMAC0	 7. PMAC1
+ *  8. MPC0	 9. MPC1	10. MPC2	11. MPC3
+ * 12. MPC4
+ *
  * Known resets in EyeQ6H west/east (type EQR_EYEQ6H_SARCR):
  *  0. CAN	 1. SPI0	 2. SPI1	 3. UART0
  *  4. UART1	 5. I2C0	 6. I2C1	 7. -hole-
@@ -521,6 +533,24 @@ static const struct eqr_match_data eqr_eyeq6l_data = {
 	.domains	= eqr_eyeq6l_domains,
 };
 
+static const struct eqr_domain_descriptor eqr_eyeq6lplus_domains[] = {
+	{
+		.type = EQR_EYEQ5_PCIE,
+		.valid_mask = 0x3FFF,
+		.offset = 0x004,
+	},
+	{
+		.type = EQR_EYEQ5_ACRP,
+		.valid_mask = 0x00FF,
+		.offset = 0x200,
+	},
+};
+
+static const struct eqr_match_data eqr_eyeq6lplus_data = {
+	.domain_count	= ARRAY_SIZE(eqr_eyeq6lplus_domains),
+	.domains	= eqr_eyeq6lplus_domains,
+};
+
 /* West and east OLBs each have an instance. */
 static const struct eqr_domain_descriptor eqr_eyeq6h_we_domains[] = {
 	{
@@ -555,6 +585,7 @@ static const struct eqr_match_data eqr_eyeq6h_acc_data = {
 static const struct of_device_id eqr_match_table[] = {
 	{ .compatible = "mobileye,eyeq5-olb", .data = &eqr_eyeq5_data },
 	{ .compatible = "mobileye,eyeq6l-olb", .data = &eqr_eyeq6l_data },
+	{ .compatible = "mobileye,eyeq6lplus-olb", .data = &eqr_eyeq6lplus_data },
 	{ .compatible = "mobileye,eyeq6h-west-olb", .data = &eqr_eyeq6h_we_data },
 	{ .compatible = "mobileye,eyeq6h-east-olb", .data = &eqr_eyeq6h_we_data },
 	{ .compatible = "mobileye,eyeq6h-acc-olb", .data = &eqr_eyeq6h_acc_data },

-- 
2.52.0


