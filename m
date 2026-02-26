Return-Path: <linux-mips+bounces-13241-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMPoNvpMoGnvhwQAu9opvQ
	(envelope-from <linux-mips+bounces-13241-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 26 Feb 2026 14:39:06 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EE21A6C0C
	for <lists+linux-mips@lfdr.de>; Thu, 26 Feb 2026 14:39:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1DC753007654
	for <lists+linux-mips@lfdr.de>; Thu, 26 Feb 2026 13:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16C833563E5;
	Thu, 26 Feb 2026 13:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="09xEbVgS"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2053336A003;
	Thu, 26 Feb 2026 13:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772112862; cv=none; b=JoUx39VPIkTWPLwOvRHfUoGPgN5wWgXgO+vT9uv7/94pNFzFJVI9BF7KwKGFNZIDPnD46CIqpPLqcV6jx+x4muMl/SrpKTx4tEOjQLcNEWP7oDZyJOcNv8frKGppgZ/2tYwr8z32s6TIl+pl1B3GH86PDcsMkEDETLxuY78Ft50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772112862; c=relaxed/simple;
	bh=u+wfGz+ZhlOqDIFcuvwo7e0m/oVXO15SdKlZUWHkZto=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I+df4axX11JW8LvyelKS+60gG/5koUAQTJHviHQEOx+EkxXXBOnD8ZMtYg2m53S1ouXrZsK1sw06mS1N1a0uLKp3e1eaom4uQVOoI1rTgWyF+I6V56uA7zKnae0XrwzMG/tus5AbWMkSUku0DXmq2SgBA07o3cFa5JK+qHiiG58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=09xEbVgS; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A71621A1537;
	Thu, 26 Feb 2026 13:34:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 79EF85FDEB;
	Thu, 26 Feb 2026 13:34:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F2EA810369380;
	Thu, 26 Feb 2026 14:34:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772112856; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=urT9FxqkbCEkNGeBBD5kw+z5Njj8+58xUWhnzyNUo1M=;
	b=09xEbVgSo/F8HcG8XXQYkjUYy1ZlKeV0nbvuNUSv7aCSSutjNZdkcbQ91tmamT8wjGRinU
	6+fHO7sKPbVfgPzfiYiM1WrS/obIRm0RU5BEiFmiyri8iIPddwO7kQgtybgspWySgkiYuh
	acAd6ISd6eRTHTF013pxzxANwR1upy11ldYrLM1ulpTvwV/XCh0IbNl+hI8gCf1gUf00Kr
	+Ko+z3jIRXthcCZ6IoO+DyzhUQ5ZsMpu1tv/66I3oVPBrS+PqdB/taGlwzeFuooD9jLmrI
	Uhmzzx0w0FeSyFnC6cUDk66DQSoJNlLHfYL0MzyEoiyoRalKFhQPUtPkws4gXA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Thu, 26 Feb 2026 14:33:48 +0100
Subject: [PATCH v3 04/13] reset: eyeq: Add Mobileye EyeQ6Lplus OLB
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260226-eyeq6lplus-v3-4-9cbeb59268b0@bootlin.com>
References: <20260226-eyeq6lplus-v3-0-9cbeb59268b0@bootlin.com>
In-Reply-To: <20260226-eyeq6lplus-v3-0-9cbeb59268b0@bootlin.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13241-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benoit.monin@bootlin.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:mid,bootlin.com:dkim,bootlin.com:email,pengutronix.de:email]
X-Rspamd-Queue-Id: 77EE21A6C0C
X-Rspamd-Action: no action

Declare the two reset domains found in the EyeQ6Lplus OLB and add
them to the data matched by 'mobileye,eyeq6lplus-olb' compatible.

Those reset domains are identical to those present in the EyeQ5
OLB, so no changes are needed to support them.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/reset/Kconfig      |  4 ++--
 drivers/reset/reset-eyeq.c | 31 +++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 7ce151f6a7e4..0cf49495d814 100644
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
index 8018fa895427..1a3857983897 100644
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
@@ -501,6 +513,24 @@ static const struct eqr_match_data eqr_eyeq6l_data = {
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
@@ -535,6 +565,7 @@ static const struct eqr_match_data eqr_eyeq6h_acc_data = {
 static const struct of_device_id eqr_match_table[] = {
 	{ .compatible = "mobileye,eyeq5-olb", .data = &eqr_eyeq5_data },
 	{ .compatible = "mobileye,eyeq6l-olb", .data = &eqr_eyeq6l_data },
+	{ .compatible = "mobileye,eyeq6lplus-olb", .data = &eqr_eyeq6lplus_data },
 	{ .compatible = "mobileye,eyeq6h-west-olb", .data = &eqr_eyeq6h_we_data },
 	{ .compatible = "mobileye,eyeq6h-east-olb", .data = &eqr_eyeq6h_we_data },
 	{ .compatible = "mobileye,eyeq6h-acc-olb", .data = &eqr_eyeq6h_acc_data },

-- 
2.53.0


