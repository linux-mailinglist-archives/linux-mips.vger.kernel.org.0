Return-Path: <linux-mips+bounces-12565-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6ADCD8B37
	for <lists+linux-mips@lfdr.de>; Tue, 23 Dec 2025 11:04:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E571305654B
	for <lists+linux-mips@lfdr.de>; Tue, 23 Dec 2025 10:02:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB2A31ED62;
	Tue, 23 Dec 2025 10:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AI40zhbJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8326D32B9BB;
	Tue, 23 Dec 2025 10:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484163; cv=none; b=ZkihJ4V3v+RwxYSJeuUeW5uWoItDrwTBT3juNXEIrHutW+fegArlLqEudf25RI5BmtH/NpDpR/inaRG0X6wWW1/LbWi/PjyPt88X67iGIfBLgcmcvnSwqCAOknEN9gsSYy5ttdX6JB9pcpzNYvtaDKSNMPTIBwVkA0tFmX5243Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484163; c=relaxed/simple;
	bh=tkdKoWscDd8jGm/ZjEHdtkDrTV4KwMpdcupmfcQa1Cs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VlNTjeMs/EReYhiEdIMkjf7rtoJVnTWCi+wVbsNfXEnAKWP64GnXZFfMudCeIiD8JTPCRJlg3bFOv9xhbY5OL8t0MXNzMbsQ4zwFqQmCN2heDIkGvoc35dkJxIlZgH0A3vlHG1ZVIE3MBSWhtBPksSXYq4NImnwroii448raIhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AI40zhbJ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2EE221A23A0;
	Tue, 23 Dec 2025 10:02:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0528960716;
	Tue, 23 Dec 2025 10:02:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BC62F10AB09BB;
	Tue, 23 Dec 2025 11:02:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766484158; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RW1X9fngQUHieAgoSatY4oZPeAqxZ6NHLxpQr5c2zx4=;
	b=AI40zhbJuRLI3xOzYpAuBodWs0gGBwuXKj0gXSHnQDBtN8do9huiW7+wzBqQyT6+w2eDH4
	y1fV2+AlFbQcFBopCNbODGYvTRWXnhYvio6OExu1/iW2ukIRVzon/41eMJ8LpkeGgMgfu5
	FtyXTXHPtVmoEOxflIDlLK0g6e9AP0JP6bZh/C7wQ/5Kh6gnGEHw4EvCQvq502FwkTgwpL
	aVBQdQ5lIV6MwQU4btduXDwMJ9rCizUToW9cx/daOdlI1EXtPf0GDPM+AdX0yReH2oUtdl
	jGZBQvkns9eya1mJ+rR4dPifXX8m3AmMn+8aWKUrGkT2YEhOb9dAHcu7JhVUCg==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Tue, 23 Dec 2025 11:02:21 +0100
Subject: [PATCH v2 06/13] pinctrl: eyeq5: Add Mobileye EyeQ6Lplus OLB
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-eyeq6lplus-v2-6-cd1fd21d182c@bootlin.com>
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

Add the match data for the pinctrl found in the EyeQ6Lplus OLB. The pin
control is identical in function to the one present in the EyeQ5 but
has a single bank of 32 pins.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/pinctrl/Kconfig         |  4 +-
 drivers/pinctrl/pinctrl-eyeq5.c | 95 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 97 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index bc7f37afc48b..c81568d835e6 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -248,11 +248,11 @@ config PINCTRL_EQUILIBRIUM
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
index ff27d15e3d5b..d59d5049b13b 100644
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
@@ -667,6 +761,7 @@ static int eq5p_probe(struct auxiliary_device *adev,
 
 static const struct of_device_id eq5p_match_table[] = {
 	{ .compatible = "mobileye,eyeq5-olb", .data = &eq5p_eyeq5_data },
+	{ .compatible = "mobileye,eyeq6lplus-olb", .data = &eq5p_eyeq6lplus_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, eq5p_match_table);

-- 
2.52.0


