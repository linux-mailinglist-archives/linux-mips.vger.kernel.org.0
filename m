Return-Path: <linux-mips+bounces-13693-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CL3kGfwhuGmdZQEAu9opvQ
	(envelope-from <linux-mips+bounces-13693-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 16:30:04 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7B529C5DB
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 16:30:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CE96F303463D
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 15:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A903A75BF;
	Mon, 16 Mar 2026 15:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WhCakINY"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796223A6B84;
	Mon, 16 Mar 2026 15:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773674770; cv=none; b=WVe7cO/tz7MNOm4wvbEOtfi+6lEoaOTnrf/pUUytbZm8uwwTBLb7DnvBTqRULPKsvXlq6s+MMpq6os/UdLYECTtIO1UkMLh0KB33v/FQHJDrEmQnO8VR6wM7om167ltU9uZUGdqy6gJouodxnCIk/Blmq4l1TH7hc7qT+cF+vek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773674770; c=relaxed/simple;
	bh=POO5jZgBLxgudtTkfmz4w/k9zAm/3adMESWk60y0TP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YZhjiLn/juIjoXV8ukxB9dUabh2NFZPtuDpsCV1MDuZcQhfDiGVPdEOM6QpT8eA8K+XygNxyzk57JWxKXVKc3yhJsrWiuHNlNe/0KeyE5leUAKj1FHYg82J5NzRJ66wz9iT42UZDuooRHhBxGB0FWbzjQVDs8lhYP07hwtLgkY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WhCakINY; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DE204C55052;
	Mon, 16 Mar 2026 15:26:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 488A55FC4A;
	Mon, 16 Mar 2026 15:26:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EFD3B103721F5;
	Mon, 16 Mar 2026 16:26:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773674765; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Sca1IFjitSHaa3J34xhk9u93ly8rAo7mslu4a9/oRQE=;
	b=WhCakINYfaXM4jW3tt9AnNsricGv9NHO2gRQIiMnysCM9hDLx+ixpusyfl0g8dXHfslqN9
	WQJFkgr394SW8MuxqhVtwGiXKXw/GWs0jQdkndp7rjQAyXH1nShyiSX8FABE4YCQKy6B9T
	dleDOymNHrXC8asdMn3Cv97Tp72J7pGka5UfEnMpCmWLAHmXhTJ/+TgtjcInluVSzQ/nkz
	vKmaEghm4G2nZWB+1cgOVY42mPx7k/sVkEU4LmHV9qf9YK6aH+utYKn/aaXVzl4wm4tGXT
	K+qwAQdbuLQJDZH9q+WjX5bGKcSQuLqckHOtmFDyTLFv+FRu2O4NCIx+jOVZYw==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Mon, 16 Mar 2026 16:25:46 +0100
Subject: [PATCH v4 09/13] clk: eyeq: Add Mobileye EyeQ6Lplus OLB
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260316-eyeq6lplus-v4-9-bf44dfc7a261@bootlin.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13693-lists,linux-mips=lfdr.de];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benoit.monin@bootlin.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 2E7B529C5DB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Declare the PLLs and fixed factors found in the EyeQ6Lplus OLB as part
of the match data for the "mobileye,eyeq6lplus-olb" compatible.

The PLL and fixed factor of the CPU are registered in early init as they
are required during the boot by the GIC timer.

Also select clk-eyeq for all EYEQ SoCs instead of listing each one
individually, as it is needed by all Mobileye EyeQ SoC.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/clk/Kconfig    |  4 +--
 drivers/clk/clk-eyeq.c | 70 ++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 3d803b4cf5c1..240e9dbeff2b 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -236,9 +236,9 @@ config COMMON_CLK_EP93XX
 
 config COMMON_CLK_EYEQ
 	bool "Clock driver for the Mobileye EyeQ platform"
-	depends on MACH_EYEQ5 || MACH_EYEQ6H || COMPILE_TEST
+	depends on EYEQ || COMPILE_TEST
 	select AUXILIARY_BUS
-	default MACH_EYEQ5 || MACH_EYEQ6H
+	default EYEQ
 	help
 	  This driver provides clocks found on Mobileye EyeQ5, EyeQ6L and Eye6H
 	  SoCs. Controllers live in shared register regions called OLB. Driver
diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index abffa46364f5..d9303c2c7aa5 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -45,6 +45,7 @@
 #include <linux/types.h>
 
 #include <dt-bindings/clock/mobileye,eyeq5-clk.h>
+#include <dt-bindings/clock/mobileye,eyeq6lplus-clk.h>
 
 /* In frac mode, it enables fractional noise canceling DAC. Else, no function. */
 #define PCSR0_DAC_EN			BIT(0)
@@ -541,6 +542,68 @@ static const struct eqc_match_data eqc_eyeq6l_match_data = {
 	.reset_auxdev_name = "reset",
 };
 
+static const struct eqc_pll eqc_eyeq6lplus_early_plls[] = {
+	{ .index = EQ6LPC_PLL_CPU, .name = "pll-cpu", .reg64 = 0x058 },
+};
+
+static const struct eqc_pll eqc_eyeq6lplus_plls[] = {
+	{ .index = EQ6LPC_PLL_DDR, .name = "pll-ddr", .reg64 = 0x02C },
+	{ .index = EQ6LPC_PLL_ACC, .name = "pll-acc", .reg64 = 0x034 },
+	{ .index = EQ6LPC_PLL_PER, .name = "pll-per", .reg64 = 0x03C },
+	{ .index = EQ6LPC_PLL_VDI, .name = "pll-vdi", .reg64 = 0x044 },
+};
+
+static const struct eqc_fixed_factor eqc_eyeq6lplus_early_fixed_factors[] = {
+	{ EQ6LPC_CPU_OCC,	"occ-cpu",	1, 1,	EQ6LPC_PLL_CPU },
+};
+
+static const struct eqc_fixed_factor eqc_eyeq6lplus_fixed_factors[] = {
+	{ EQ6LPC_DDR_OCC,	"occ-ddr",	1, 1,	EQ6LPC_PLL_DDR },
+
+	{ EQ6LPC_ACC_VDI,	"vdi-div",	1, 10,	EQ6LPC_PLL_ACC },
+	{ EQ6LPC_ACC_OCC,	"occ-acc",	1, 1,	EQ6LPC_PLL_ACC },
+	{ EQ6LPC_ACC_FCMU,	"fcmu-a-clk",	1, 10,	EQ6LPC_ACC_OCC },
+
+	{ EQ6LPC_PER_OCC,	"occ-per",	1, 1,	EQ6LPC_PLL_PER },
+	{ EQ6LPC_PER_I2C_SER,	"i2c-ser-clk",	1, 10,	EQ6LPC_PER_OCC },
+	{ EQ6LPC_PER_PCLK,	"pclk",		1, 4,	EQ6LPC_PER_OCC },
+	{ EQ6LPC_PER_TSU,	"tsu-clk",	1, 8,	EQ6LPC_PER_OCC },
+	{ EQ6LPC_PER_OSPI,	"ospi-ref-clk",	1, 10,	EQ6LPC_PER_OCC },
+	{ EQ6LPC_PER_GPIO,	"gpio-clk",	1, 4,	EQ6LPC_PER_OCC },
+	{ EQ6LPC_PER_TIMER,	"timer-clk",	1, 4,	EQ6LPC_PER_OCC },
+	{ EQ6LPC_PER_I2C,	"i2c-clk",	1, 4,	EQ6LPC_PER_OCC },
+	{ EQ6LPC_PER_UART,	"uart-clk",	1, 4,	EQ6LPC_PER_OCC },
+	{ EQ6LPC_PER_SPI,	"spi-clk",	1, 4,	EQ6LPC_PER_OCC },
+	{ EQ6LPC_PER_PERIPH,	"periph-clk",	1, 1,	EQ6LPC_PER_OCC },
+
+	{ EQ6LPC_VDI_OCC,	"occ-vdi",	1, 1,	EQ6LPC_PLL_VDI },
+};
+
+static const struct eqc_early_match_data eqc_eyeq6lplus_early_match_data __initconst = {
+	.early_pll_count        = ARRAY_SIZE(eqc_eyeq6lplus_early_plls),
+	.early_plls             = eqc_eyeq6lplus_early_plls,
+
+	.early_fixed_factor_count       = ARRAY_SIZE(eqc_eyeq6lplus_early_fixed_factors),
+	.early_fixed_factors            = eqc_eyeq6lplus_early_fixed_factors,
+
+	.late_clk_count         = ARRAY_SIZE(eqc_eyeq6lplus_plls) +
+	ARRAY_SIZE(eqc_eyeq6lplus_fixed_factors),
+};
+
+static const struct eqc_match_data eqc_eyeq6lplus_match_data = {
+	.pll_count      = ARRAY_SIZE(eqc_eyeq6lplus_plls),
+	.plls           = eqc_eyeq6lplus_plls,
+
+	.fixed_factor_count     = ARRAY_SIZE(eqc_eyeq6lplus_fixed_factors),
+	.fixed_factors          = eqc_eyeq6lplus_fixed_factors,
+
+	.reset_auxdev_name = "reset",
+	.pinctrl_auxdev_name = "pinctrl",
+
+	.early_clk_count = ARRAY_SIZE(eqc_eyeq6lplus_early_plls) +
+	ARRAY_SIZE(eqc_eyeq6lplus_early_fixed_factors),
+};
+
 static const struct eqc_match_data eqc_eyeq6h_west_match_data = {
 	.reset_auxdev_name = "reset_west",
 };
@@ -642,6 +705,7 @@ static const struct eqc_match_data eqc_eyeq6h_acc_match_data = {
 static const struct of_device_id eqc_match_table[] = {
 	{ .compatible = "mobileye,eyeq5-olb", .data = &eqc_eyeq5_match_data },
 	{ .compatible = "mobileye,eyeq6l-olb", .data = &eqc_eyeq6l_match_data },
+	{ .compatible = "mobileye,eyeq6lplus-olb", .data = &eqc_eyeq6lplus_match_data },
 	{ .compatible = "mobileye,eyeq6h-west-olb", .data = &eqc_eyeq6h_west_match_data },
 	{ .compatible = "mobileye,eyeq6h-east-olb", .data = &eqc_eyeq6h_east_match_data },
 	{ .compatible = "mobileye,eyeq6h-south-olb", .data = &eqc_eyeq6h_south_match_data },
@@ -825,3 +889,9 @@ static void __init eqc_eyeq6h_west_early_init(struct device_node *np)
 }
 CLK_OF_DECLARE_DRIVER(eqc_eyeq6h_west, "mobileye,eyeq6h-west-olb",
 		      eqc_eyeq6h_west_early_init);
+
+static void __init eqc_eyeq6lplus_early_init(struct device_node *np)
+{
+	eqc_early_init(np, &eqc_eyeq6lplus_early_match_data);
+}
+CLK_OF_DECLARE_DRIVER(eqc_eyeq6lplus, "mobileye,eyeq6lplus-olb", eqc_eyeq6lplus_early_init);

-- 
2.53.0


