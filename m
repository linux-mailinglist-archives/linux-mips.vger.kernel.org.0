Return-Path: <linux-mips+bounces-13690-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QB3iC28juGk8ZgEAu9opvQ
	(envelope-from <linux-mips+bounces-13690-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 16:36:15 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDEB29C7F8
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 16:36:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A8C0C30CF7AB
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2026 15:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 874E23A16B5;
	Mon, 16 Mar 2026 15:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hZ6Lp3xc"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DA33A0EA5;
	Mon, 16 Mar 2026 15:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773674764; cv=none; b=MD6BdoyTNWQK2OzhQinw8jHPS9MS965jIKlMNJEDPy+pjFVJMzQAz2i8voS9hrv3KcLLw1n0HEIHTgjfaJn0oTNzn9xRkL7/tpq6Hn5h869qzJeQrUk8/ZJT25ihrhnbvDg+SM3mvWPs5CpN9C6ndEQDOgwhumsuOcGdwmMnkz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773674764; c=relaxed/simple;
	bh=HhynoKS2vDDMBWgFPPPqayySyG68Lhu9Os1pt2Rq4OY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gHGdVYZ8Rr9hwi1vFGEHiiXldFTghMiNdhkaK62Npqm1ZSjRzSPOJOnzfJV8xhQ/Mxjw8i1UIsb8wxSsltOfI5af27MoY36h3319K41E9A8UqoVLl1tPDnv0a0+4uWCDo6wJkkwdIQC0iKwIDSdacZY0PUHUw/QphvbBvHT4TVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hZ6Lp3xc; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7E9414E426D1;
	Mon, 16 Mar 2026 15:26:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 535C55FC4A;
	Mon, 16 Mar 2026 15:26:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 778A3103721F1;
	Mon, 16 Mar 2026 16:25:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773674760; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8irxtQmFAKyzzxyCAyZaG+kfIE9cyeuAz9+GABROzAU=;
	b=hZ6Lp3xcB8UvHKIQGIilmVCGxY1o5HZ++5toLx9+5QTGlCelXSvjWBRlaZV5yETR1LEU+n
	pcoBMo7lx/KKmsNEzskPJY3XyB86DsgnB/QSVcyiu7102f9DiFUgqBO0yBein1ia7ObvBz
	MKMZIUmPJhzISyca7DTdtTWAkJsTHXV40/6DeeFrolzwr7XzcMtJStFCY/fH5SMRz7pT5I
	EGT+gXzYwT5tkc8TD5Z5NCzEuvIF3mGBIjKzg6qz9HI3lSOHhkHgB4kD96WnqCMfjeRdfa
	mU3BwVICNHdZc78EwEPLo26aXRwwY+843wKEyCcj8U1HxQnVi/bsG0HkDnON/Q==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Mon, 16 Mar 2026 16:25:43 +0100
Subject: [PATCH v4 06/13] pinctrl: eyeq5: Add Mobileye EyeQ6Lplus OLB
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260316-eyeq6lplus-v4-6-bf44dfc7a261@bootlin.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13690-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benoit.monin@bootlin.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:email,bootlin.com:mid]
X-Rspamd-Queue-Id: BCDEB29C7F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the match data for the pinctrl found in the EyeQ6Lplus OLB. The pin
control is identical in function to the one present in the EyeQ5 but
has a single bank of 32 pins.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/pinctrl/Kconfig         |  4 +-
 drivers/pinctrl/pinctrl-eyeq5.c | 95 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 97 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index afecd9407f53..72c7f21d81e4 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -254,11 +254,11 @@ config PINCTRL_EQUILIBRIUM
 config PINCTRL_EYEQ5
 	bool "Mobileye EyeQ5 pinctrl driver"
 	depends on OF
-	depends on MACH_EYEQ5 || COMPILE_TEST
+	depends on MACH_EYEQ5 || MACH_EYEQ6LPLUS || COMPILE_TEST
 	select PINMUX
 	select GENERIC_PINCONF
 	select AUXILIARY_BUS
-	default MACH_EYEQ5
+	default MACH_EYEQ5 || MACH_EYEQ6LPLUS
 	help
 	  Pin controller driver for the Mobileye EyeQ5 platform. It does both
 	  pin config & pin muxing. It does not handle GPIO.
diff --git a/drivers/pinctrl/pinctrl-eyeq5.c b/drivers/pinctrl/pinctrl-eyeq5.c
index c780af09cde9..dcdf80f07a90 100644
--- a/drivers/pinctrl/pinctrl-eyeq5.c
+++ b/drivers/pinctrl/pinctrl-eyeq5.c
@@ -229,6 +229,100 @@ static const struct eq5p_match_data eq5p_eyeq5_data = {
 	.banks = eq5p_eyeq5_banks,
 };
 
+static const struct pinctrl_pin_desc eq5p_eyeq6lplus_pins[] = {
+	PINCTRL_PIN(0,  "PA0"),  /* GPIO_A0_TIMER0_CK0 */
+	PINCTRL_PIN(1,  "PA1"),  /* GPIO_A1_TIMER0_EOC */
+	PINCTRL_PIN(2,  "PA2"),  /* GPIO_A2_TIMER1_CK */
+	PINCTRL_PIN(3,  "PA3"),  /* GPIO_A3_TIMER1_EOC1 */
+	PINCTRL_PIN(4,  "PA4"),  /* GPIO_A4_SSI_UART_RX */
+	PINCTRL_PIN(5,  "PA5"),  /* GPIO_A5_SSI_UART_TX */
+	PINCTRL_PIN(6,  "PA6"),  /* GPIO_A6_SPI_0_CS */
+	PINCTRL_PIN(7,  "PA7"),  /* GPIO_A7_SPI_0_DI */
+	PINCTRL_PIN(8,  "PA8"),  /* GPIO_A8_SPI_0_CK */
+	PINCTRL_PIN(9,  "PA9"),  /* GPIO_A9_SPI_0_DO */
+	PINCTRL_PIN(10, "PA10"), /* GPIO_A10_SPI_0_CS1 */
+	PINCTRL_PIN(11, "PA11"), /* GPIO_A11_UART_0_RX */
+	PINCTRL_PIN(12, "PA12"), /* GPIO_A12_UART_0_TX */
+	PINCTRL_PIN(13, "PA13"), /* GPIO_A13_TIMER2_CK */
+	PINCTRL_PIN(14, "PA14"), /* GPIO_A14_TIMER2_EOC */
+	PINCTRL_PIN(15, "PA15"), /* GPIO_A15_TIMER3_CK */
+	PINCTRL_PIN(16, "PA16"), /* GPIO_A16_TIMER_EOC */
+	PINCTRL_PIN(17, "PA17"), /* GPIO_A17_TIMER_EXT0_INCA P1 */
+	PINCTRL_PIN(18, "PA18"), /* GPIO_A18_TIMER_EXT0_INCA P2 */
+	PINCTRL_PIN(19, "PA19"), /* GPIO_A19_TIMER_EXT0_OUT CMP1 */
+	PINCTRL_PIN(20, "PA20"), /* GPIO_A20_TIMER_EXT0_OUT CMP2 */
+	PINCTRL_PIN(21, "PA21"), /* GPIO_A21_SPI_1_CS0 */
+	PINCTRL_PIN(22, "PA22"), /* GPIO_A22_SPI_1_DI */
+	PINCTRL_PIN(23, "PA23"), /* GPIO_A23_SPI_1_CK */
+	PINCTRL_PIN(24, "PA24"), /* GPIO_A24_SPI_1_DO */
+	PINCTRL_PIN(25, "PA25"), /* GPIO_A25_SPI_1_CS1 */
+	PINCTRL_PIN(26, "PA26"), /* GPIO_A26_TIMER_EXT1_INCA P1 */
+	PINCTRL_PIN(27, "PA27"), /* GPIO_A27_TIMER_EXT1_INCA P2 */
+	PINCTRL_PIN(28, "PA28"), /* GPIO_A28_TIMER_EXT1_OUTC MP1 */
+	PINCTRL_PIN(29, "PA29"), /* GPIO_A29_TIMER_EXT1_OUTC MP2 */
+	PINCTRL_PIN(30, "PA30"), /* GPIO_A30_EXT_CLK */
+	PINCTRL_PIN(31, "PA31"), /* GPIO_A31_VDI_MCLK */
+};
+
+static const char * const eq5p_eyeq6lplus_gpio_groups[] = {
+	/* Bank A */
+	"PA0",  "PA1",  "PA2",  "PA3",  "PA4",  "PA5",  "PA6",  "PA7",
+	"PA8",  "PA9",  "PA10", "PA11", "PA12", "PA13", "PA14", "PA15",
+	"PA16", "PA17", "PA18", "PA19", "PA20", "PA21", "PA22", "PA23",
+	"PA24", "PA25", "PA26", "PA27", "PA28", "PA29", "PA30", "PA31",
+};
+
+/* Groups of functions on bank A */
+static const char * const eq5p_eyeq6lplus_timer0_groups[] = { "PA0", "PA1" };
+static const char * const eq5p_eyeq6lplus_timer1_groups[] = { "PA2", "PA3" };
+static const char * const eq5p_eyeq6lplus_uart_ssi_groups[] = { "PA4", "PA5" };
+static const char * const eq5p_eyeq6lplus_spi0_groups[] = { "PA6", "PA7", "PA8", "PA9", "PA10" };
+static const char * const eq5p_eyeq6lplus_uart0_groups[] = { "PA11", "PA12" };
+static const char * const eq5p_eyeq6lplus_timer2_groups[] = { "PA13", "PA14" };
+static const char * const eq5p_eyeq6lplus_timer3_groups[] = { "PA15", "PA16" };
+static const char * const eq5p_eyeq6lplus_timer_ext0_groups[] = { "PA17", "PA18", "PA19", "PA20" };
+static const char * const eq5p_eyeq6lplus_spi1_groups[] = {
+	"PA21", "PA22", "PA23", "PA24", "PA25"
+};
+static const char * const eq5p_eyeq6lplus_timer_ext1_groups[] = { "PA26", "PA27", "PA28", "PA29" };
+static const char * const eq5p_eyeq6lplus_ext_ref_clk_groups[] = { "PA30" };
+static const char * const eq5p_eyeq6lplus_mipi_ref_clk_groups[] = { "PA31" };
+
+static const struct pinfunction eq5p_eyeq6lplus_functions[] = {
+	/* gpios function */
+	EQ5P_PINFUNCTION("gpio", eq5p_eyeq6lplus_gpio_groups),
+
+	/* Bank A alternate functions */
+	EQ5P_PINFUNCTION("timer0", eq5p_eyeq6lplus_timer0_groups),
+	EQ5P_PINFUNCTION("timer1", eq5p_eyeq6lplus_timer1_groups),
+	EQ5P_PINFUNCTION("uart_ssi", eq5p_eyeq6lplus_uart_ssi_groups),
+	EQ5P_PINFUNCTION("spi0", eq5p_eyeq6lplus_spi0_groups),
+	EQ5P_PINFUNCTION("uart0", eq5p_eyeq6lplus_uart0_groups),
+	EQ5P_PINFUNCTION("timer2", eq5p_eyeq6lplus_timer2_groups),
+	EQ5P_PINFUNCTION("timer3", eq5p_eyeq6lplus_timer3_groups),
+	EQ5P_PINFUNCTION("timer_ext0", eq5p_eyeq6lplus_timer_ext0_groups),
+	EQ5P_PINFUNCTION("spi1", eq5p_eyeq6lplus_spi1_groups),
+	EQ5P_PINFUNCTION("timer_ext1", eq5p_eyeq6lplus_timer_ext1_groups),
+	EQ5P_PINFUNCTION("ext_ref_clk", eq5p_eyeq6lplus_ext_ref_clk_groups),
+	EQ5P_PINFUNCTION("mipi_ref_clk", eq5p_eyeq6lplus_mipi_ref_clk_groups),
+};
+
+static const struct eq5p_bank eq5p_eyeq6lplus_banks[] = {
+	{
+		.npins = ARRAY_SIZE(eq5p_eyeq6lplus_pins),
+		.regs = {0x0C0, 0x0C4, 0x0D0, 0x0D4, 0x0B0},
+	},
+};
+
+static const struct eq5p_match_data eq5p_eyeq6lplus_data = {
+	.npins = ARRAY_SIZE(eq5p_eyeq6lplus_pins),
+	.nfunctions = ARRAY_SIZE(eq5p_eyeq6lplus_functions),
+	.nbanks = ARRAY_SIZE(eq5p_eyeq6lplus_banks),
+	.pins = eq5p_eyeq6lplus_pins,
+	.functions = eq5p_eyeq6lplus_functions,
+	.banks = eq5p_eyeq6lplus_banks,
+};
+
 static void eq5p_update_bits(const struct eq5p_pinctrl *pctrl,
 			     const struct eq5p_bank *bank,
 			     enum eq5p_regs reg, u32 mask, u32 val)
@@ -639,6 +733,7 @@ static int eq5p_probe(struct auxiliary_device *adev,
 
 static const struct of_device_id eq5p_match_table[] = {
 	{ .compatible = "mobileye,eyeq5-olb", .data = &eq5p_eyeq5_data },
+	{ .compatible = "mobileye,eyeq6lplus-olb", .data = &eq5p_eyeq6lplus_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, eq5p_match_table);

-- 
2.53.0


