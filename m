Return-Path: <linux-mips+bounces-12560-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 43460CD8B0A
	for <lists+linux-mips@lfdr.de>; Tue, 23 Dec 2025 11:03:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD3EC30111A5
	for <lists+linux-mips@lfdr.de>; Tue, 23 Dec 2025 10:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1019B2DCF61;
	Tue, 23 Dec 2025 10:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dgPE4CA4"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1A42DE70B
	for <linux-mips@vger.kernel.org>; Tue, 23 Dec 2025 10:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484159; cv=none; b=PfYcWQ8vdgkEO1hAJO3WVtgTZAG5RY41ueKU9YuR66jBonRX+deo0FH0cRuUBZhzp99Ib6xyMdUGGiiLmfQT5QAl+LGb9jRNyVy6QMthQ0TVoGIlmB+WjUDmAZ6qXfJ4ChKpFQhyTS0K87xxy0P8l3Vh3Fc7tnvvd95nl/Q5KIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484159; c=relaxed/simple;
	bh=m590nntX4ppviCCDPhndoQX+FPzbzQg/sWseHpjS0L8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X0IHhJH9WissBwYT8Caxs6iK/tozVhiftoEa3FfEJbuVrR+3JS2oZ30Gh2tcnuO64pnPZHUJ9XoxeHMIedjkDXCM79VS3TvSbFjtAO9ZZcgr2vkohhrXMrWsSt5wo5L6PYHF2LnXarBmS5Bf51Os/ujckHZM18kd//pnBjQMIUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dgPE4CA4; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B82D64E41D5E;
	Tue, 23 Dec 2025 10:02:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8CCA460716;
	Tue, 23 Dec 2025 10:02:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2CC0710AB09B9;
	Tue, 23 Dec 2025 11:02:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766484154; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WwV71J+GvRMt5S0XG+Cm4p0MxsmS37VCZZFJasiab4A=;
	b=dgPE4CA4NJiyvD+3zMHVMZ6uKxsSeRg90J/e4AImqxYW4msGNW57yhhYz6Cmee86G0kAKT
	DKQw5vw3zwX1zvvycmMKC80ra98a1XoWIK4XaPNugZThGVIGc+SWT9leqexzOoz9uMUwIQ
	ZcU/+hhII+SgxJadAE74LNOL+gPMdhogL1JI0XSg/JgRTrej47jrPA21vgsRkadjDQrly9
	bXqN/uZ8wRtgjJN1soHdFXAFwRQIx6GpMRFAvQj28Zu1f/xa8od5JoXQ1iRvM211w3GDoo
	SXbekO2VoQaexJn0sSc4ijOcdmn/nQDDHUphfZfRs+8ERzLBTSG1PCKjUrnyDQ==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Tue, 23 Dec 2025 11:02:19 +0100
Subject: [PATCH v2 04/13] reset: eyeq: Add Mobileye EyeQ6Lplus OLB
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-eyeq6lplus-v2-4-cd1fd21d182c@bootlin.com>
References: <20251223-eyeq6lplus-v2-0-cd1fd21d182c@bootlin.com>
In-Reply-To: <20251223-eyeq6lplus-v2-0-cd1fd21d182c@bootlin.com>
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


