Return-Path: <linux-mips+bounces-13688-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eH0IDHwhuGmdZQEAu9opvQ
	(envelope-from <linux-mips+bounces-13688-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 16:27:56 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AA029C54E
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 16:27:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7C6B030391D9
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 15:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0AB23A4528;
	Mon, 16 Mar 2026 15:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QIfFkmA1"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04A93A3833;
	Mon, 16 Mar 2026 15:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773674760; cv=none; b=kQ5frj7oItIOVzWyizkFZVBm141IlFYc3Fks990LlRNYz2j3x1yoi0/blxKmjeFbE3rmw20IYT2ccWc4EZy9vku6R+lfa9NzIw/smfu0nm91EiEXSD7bYHj7nvS5vaBPOZomIhAFf058QxzTryhyFHnkBKzL5uLfKkDOlnU3qY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773674760; c=relaxed/simple;
	bh=d7xzJ/Zdl4XUqWXeHp3gMAa9bQJQznI63W9v0R6XiC8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Aq+cei6l13zd9vRkBHP5xjSufJkQizrMeA1kvmPOyHOm00OrNpshQuQGm+TAe6oumtA6lzLS5AViC3LybXdX7NlmqW2sQvvZD8PFgBFTH0pGVaSr0FTJ20MswlGHQuyc4ZsOWiSbNOkLehEs/AjCT8b/afPgpwyt40RJPhGzFJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QIfFkmA1; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5917CC5504F;
	Mon, 16 Mar 2026 15:26:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B7D4C5FC4A;
	Mon, 16 Mar 2026 15:25:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ED6B8103721EB;
	Mon, 16 Mar 2026 16:25:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773674756; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qhsMzWBsOebiFYIKgHn4CikkhxD3WYEUDe0coVF4nXQ=;
	b=QIfFkmA1KhSYmzttxzn9uMG2jDmhnXu6X3tvtNN7UZhRkyy2WQmxfHcesvsO116AOsmBRP
	7s/UrZTUvdCaQpGhSlasXvDZNWpB9Ew6z/w25VkFqSt9ONsGsAC9URgIIWWbS620Hdlc6L
	DJeJ4f/gGwaMbl2ddKKRycR/sDP/afjgWs1h8Kbg7N4n6pkuvb2VBYKVZupHlhGBTKnXdC
	EdGmM1Zs+tAuC4cyQrJbxcpMTP16uSxjkjO5BqOOWqyn+z6v281EVp2VOExequTP36ekeW
	D13NDxwQD14YzeYTyaehaWXcR0vqXP/lP1t8lQtputB8RSO+Gmc6i2u40XGFFA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Mon, 16 Mar 2026 16:25:41 +0100
Subject: [PATCH v4 04/13] reset: eyeq: Add Mobileye EyeQ6Lplus OLB
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260316-eyeq6lplus-v4-4-bf44dfc7a261@bootlin.com>
References: <20260316-eyeq6lplus-v4-0-bf44dfc7a261@bootlin.com>
In-Reply-To: <20260316-eyeq6lplus-v4-0-bf44dfc7a261@bootlin.com>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13688-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benoit.monin@bootlin.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid]
X-Rspamd-Queue-Id: F0AA029C54E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Declare the two reset domains found in the EyeQ6Lplus OLB and add
them to the data matched by 'mobileye,eyeq6lplus-olb' compatible.

Those reset domains are identical to those present in the EyeQ5
OLB, so no changes are needed to support them.

Also select reset-eyeq for all EYEQ SoCs instead of listing each one
individually, as it is needed by all Mobileye EyeQ SoC.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/reset/Kconfig      |  4 ++--
 drivers/reset/reset-eyeq.c | 31 +++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 7ce151f6a7e4..67057248c810 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -85,9 +85,9 @@ config RESET_EIC7700
 
 config RESET_EYEQ
 	bool "Mobileye EyeQ reset controller"
-	depends on MACH_EYEQ5 || MACH_EYEQ6H || COMPILE_TEST
+	depends on EYEQ || COMPILE_TEST
 	select AUXILIARY_BUS
-	default MACH_EYEQ5 || MACH_EYEQ6H
+	default EYEQ
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


