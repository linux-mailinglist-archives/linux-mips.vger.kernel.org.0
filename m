Return-Path: <linux-mips+bounces-12564-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 04136CD8B34
	for <lists+linux-mips@lfdr.de>; Tue, 23 Dec 2025 11:04:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D301301FF53
	for <lists+linux-mips@lfdr.de>; Tue, 23 Dec 2025 10:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68F8032C301;
	Tue, 23 Dec 2025 10:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oSVcIUF8"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FB43126D2;
	Tue, 23 Dec 2025 10:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484162; cv=none; b=Rah5qn50WjCkjioGhDqvwKryZvMlvX+yAfn/OiLti364VY6VbEQutnMHTXhKa6MIUwEsH9RInsyq4PiASWrE8/4NcjMn8IwQT6XJ/User1gOVsc10nh29PW4qleqyfNqWpPT6c1spv93XXzQ0fEQaC4anxOe3CMQSNenQzIl+G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484162; c=relaxed/simple;
	bh=2Q3HzM8Ep6LTIZgG9bDmZgzbzklN9VtpKTP5zk6zWOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZXpwDlJpuZPpaUaR4liBX+r/MuOOyV+64oOdhWT1x8T4wS6VYipGWoraWFgmjclPqKHDNAwxUXJzJ5U0HYH9iCc0itBBE6lrctWcBLOhq5IO2sQZSLGRzSTJizzELkQjfwfgf5Md5XI/ftWddXji73BQkbE14QHEG3GoB7Ja1OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oSVcIUF8; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8404C1A23A4;
	Tue, 23 Dec 2025 10:02:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5B25F60716;
	Tue, 23 Dec 2025 10:02:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E8A1E10AB09BA;
	Tue, 23 Dec 2025 11:02:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766484156; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0Y+tQGhSIc+18rwkc77jRxXg5ppVm/uhiswoSWe+EN0=;
	b=oSVcIUF8pUgeIXh0QrfMQHFp10lrXat6F6MIkiGQIQp9JzPjfIgwZiIeizXTY/HgEd0jvf
	sePsW5d5qOxC7xU4Ksuq7cpYHGhSdLEzmdVlQDusEatQQOgJV1z8bb9LC5VlvVysKvriz7
	J1Q0sCMvXsSrJadxEN1RKZtEe7aPNzkASoNjI+As5j6KJKFWmh4Ij4XRZHhFOEo7MmkzC2
	ayf40Hs7JpvGcS7AGCyO520YmjOxBwth/tsWEbBMiSZwb42rcmEBE7JL7l7jZwszm5bVMh
	ZrJzkjONHbARE+zIv/M3uOFTsMzAblgUxNxOhOIGyvGyn+ma5SWh7CSHbg8hkQ==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Tue, 23 Dec 2025 11:02:20 +0100
Subject: [PATCH v2 05/13] pinctrl: eyeq5: Use match data
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-eyeq6lplus-v2-5-cd1fd21d182c@bootlin.com>
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

Instead of using the pin descriptions, pin functions and register offsets
of the EyeQ5 directly, access those via a pointer to a newly introduced
struct eq5p_match_data.

This structure contains, in addition to the pin descriptions and pin
functions, an array of pin banks. Each bank holds the number of pins
and the register offsets.

All functions accessing a pin now use a pointer to a bank structure and
an offset inside that bank. The conversion from a pin number to a bank
and an offset is done in the new function eq5p_pin_to_bank_offset(),
which replace eq5p_pin_to_bank() and eq5p_pin_to_offset().

All the data related to the EyeQ5 is declared with the eq5p_eyeq5_
prefix to distinguish it from the common code.

During the probe, we now get a reference to the parent OF node if we
don't already have it and use that node to get the match data. We cannot
directly use an OF node since pinctrl-eyeq5 is an auxiliary device
of clk-eyeq.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/pinctrl/pinctrl-eyeq5.c | 370 ++++++++++++++++++++++++++--------------
 1 file changed, 241 insertions(+), 129 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-eyeq5.c b/drivers/pinctrl/pinctrl-eyeq5.c
index 5f6af934a516..ff27d15e3d5b 100644
--- a/drivers/pinctrl/pinctrl-eyeq5.c
+++ b/drivers/pinctrl/pinctrl-eyeq5.c
@@ -26,6 +26,7 @@
 #include <linux/errno.h>
 #include <linux/io.h>
 #include <linux/mod_devicetable.h>
+#include <linux/of.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/types.h>
@@ -38,18 +39,6 @@
 #include "core.h"
 #include "pinctrl-utils.h"
 
-struct eq5p_pinctrl {
-	struct pinctrl_desc	desc;
-	void __iomem		*base;
-};
-
-enum eq5p_bank {
-	EQ5P_BANK_A,
-	EQ5P_BANK_B,
-
-	EQ5P_BANK_COUNT,
-};
-
 enum eq5p_regs {
 	EQ5P_PD,
 	EQ5P_PU,
@@ -60,9 +49,24 @@ enum eq5p_regs {
 	EQ5P_REG_COUNT,
 };
 
-static const unsigned int eq5p_regs[EQ5P_BANK_COUNT][EQ5P_REG_COUNT] = {
-	[EQ5P_BANK_A] = {0x0C0, 0x0C4, 0x0D0, 0x0D4, 0x0B0},
-	[EQ5P_BANK_B] = {0x0C8, 0x0CC, 0x0D8, 0x0DC, 0x0B4},
+struct eq5p_bank {
+	const unsigned int npins;
+	const unsigned int regs[EQ5P_REG_COUNT];
+};
+
+struct eq5p_match_data {
+	const unsigned int npins;
+	const unsigned int nfunctions;
+	const unsigned int nbanks;
+	const struct pinctrl_pin_desc *pins;
+	const struct pinfunction *functions;
+	const struct eq5p_bank *banks;
+};
+
+struct eq5p_pinctrl {
+	struct pinctrl_desc		desc;
+	void __iomem			*base;
+	const struct eq5p_match_data	*data;
 };
 
 /*
@@ -70,10 +74,18 @@ static const unsigned int eq5p_regs[EQ5P_BANK_COUNT][EQ5P_REG_COUNT] = {
  */
 #define EQ5P_DS_MASK	GENMASK(1, 0)
 
+/*
+ * The GPIO function is always the first function
+ */
+#define EQ5P_GPIO_FUNC_SELECTOR 0
+
+/* Helper to declare pinfunction */
+#define EQ5P_PINFUNCTION(func, groups) PINCTRL_PINFUNCTION(func, groups, ARRAY_SIZE(groups))
+
 /*
  * Comments to the right of each pin are the "signal name" in the datasheet.
  */
-static const struct pinctrl_pin_desc eq5p_pins[] = {
+static const struct pinctrl_pin_desc eq5p_eyeq5_pins[] = {
 	/* Bank A */
 	PINCTRL_PIN(0,  "PA0"),  /* A0_TIMER0_CK */
 	PINCTRL_PIN(1,  "PA1"),  /* A1_TIMER0_EOC */
@@ -105,35 +117,35 @@ static const struct pinctrl_pin_desc eq5p_pins[] = {
 	PINCTRL_PIN(27, "PA27"), /* A27_SPI_1_CS1 */
 	PINCTRL_PIN(28, "PA28"), /* A28_REF_CLK0 */
 
-#define EQ5P_PIN_OFFSET_BANK_B	29
+#define EQ5P_EYEQ5_PIN_OFFSET_BANK_B	29
 
 	/* Bank B */
-	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 0,  "PB0"),  /* B0_TIMER3_CK */
-	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 1,  "PB1"),  /* B1_TIMER3_EOC */
-	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 2,  "PB2"),  /* B2_TIMER4_CK */
-	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 3,  "PB3"),  /* B3_TIMER4_EOC */
-	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 4,  "PB4"),  /* B4_TIMER6_EXT_INCAP1 */
-	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 5,  "PB5"),  /* B5_TIMER6_EXT_INCAP2 */
-	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 6,  "PB6"),  /* B6_TIMER6_EXT_OUTCMP1 */
-	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 7,  "PB7"),  /* B7_TIMER6_EXT_OUTCMP2 */
-	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 8,  "PB8"),  /* B8_UART_2_TX */
-	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 9,  "PB9"),  /* B9_UART_2_RX */
-	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 10, "PB10"), /* B10_CAN_2_TX */
-	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 11, "PB11"), /* B11_CAN_2_RX */
-	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 12, "PB12"), /* B12_SPI_2_DO */
-	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 13, "PB13"), /* B13_SPI_2_DI */
-	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 14, "PB14"), /* B14_SPI_2_CK */
-	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 15, "PB15"), /* B15_SPI_2_CS0 */
-	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 16, "PB16"), /* B16_SPI_2_CS1 */
-	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 17, "PB17"), /* B17_SPI_3_DO */
-	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 18, "PB18"), /* B18_SPI_3_DI */
-	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 19, "PB19"), /* B19_SPI_3_CK */
-	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 20, "PB20"), /* B20_SPI_3_CS0 */
-	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 21, "PB21"), /* B21_SPI_3_CS1 */
-	PINCTRL_PIN(EQ5P_PIN_OFFSET_BANK_B + 22, "PB22"), /* B22_MCLK0 */
+	PINCTRL_PIN(EQ5P_EYEQ5_PIN_OFFSET_BANK_B + 0,  "PB0"),  /* B0_TIMER3_CK */
+	PINCTRL_PIN(EQ5P_EYEQ5_PIN_OFFSET_BANK_B + 1,  "PB1"),  /* B1_TIMER3_EOC */
+	PINCTRL_PIN(EQ5P_EYEQ5_PIN_OFFSET_BANK_B + 2,  "PB2"),  /* B2_TIMER4_CK */
+	PINCTRL_PIN(EQ5P_EYEQ5_PIN_OFFSET_BANK_B + 3,  "PB3"),  /* B3_TIMER4_EOC */
+	PINCTRL_PIN(EQ5P_EYEQ5_PIN_OFFSET_BANK_B + 4,  "PB4"),  /* B4_TIMER6_EXT_INCAP1 */
+	PINCTRL_PIN(EQ5P_EYEQ5_PIN_OFFSET_BANK_B + 5,  "PB5"),  /* B5_TIMER6_EXT_INCAP2 */
+	PINCTRL_PIN(EQ5P_EYEQ5_PIN_OFFSET_BANK_B + 6,  "PB6"),  /* B6_TIMER6_EXT_OUTCMP1 */
+	PINCTRL_PIN(EQ5P_EYEQ5_PIN_OFFSET_BANK_B + 7,  "PB7"),  /* B7_TIMER6_EXT_OUTCMP2 */
+	PINCTRL_PIN(EQ5P_EYEQ5_PIN_OFFSET_BANK_B + 8,  "PB8"),  /* B8_UART_2_TX */
+	PINCTRL_PIN(EQ5P_EYEQ5_PIN_OFFSET_BANK_B + 9,  "PB9"),  /* B9_UART_2_RX */
+	PINCTRL_PIN(EQ5P_EYEQ5_PIN_OFFSET_BANK_B + 10, "PB10"), /* B10_CAN_2_TX */
+	PINCTRL_PIN(EQ5P_EYEQ5_PIN_OFFSET_BANK_B + 11, "PB11"), /* B11_CAN_2_RX */
+	PINCTRL_PIN(EQ5P_EYEQ5_PIN_OFFSET_BANK_B + 12, "PB12"), /* B12_SPI_2_DO */
+	PINCTRL_PIN(EQ5P_EYEQ5_PIN_OFFSET_BANK_B + 13, "PB13"), /* B13_SPI_2_DI */
+	PINCTRL_PIN(EQ5P_EYEQ5_PIN_OFFSET_BANK_B + 14, "PB14"), /* B14_SPI_2_CK */
+	PINCTRL_PIN(EQ5P_EYEQ5_PIN_OFFSET_BANK_B + 15, "PB15"), /* B15_SPI_2_CS0 */
+	PINCTRL_PIN(EQ5P_EYEQ5_PIN_OFFSET_BANK_B + 16, "PB16"), /* B16_SPI_2_CS1 */
+	PINCTRL_PIN(EQ5P_EYEQ5_PIN_OFFSET_BANK_B + 17, "PB17"), /* B17_SPI_3_DO */
+	PINCTRL_PIN(EQ5P_EYEQ5_PIN_OFFSET_BANK_B + 18, "PB18"), /* B18_SPI_3_DI */
+	PINCTRL_PIN(EQ5P_EYEQ5_PIN_OFFSET_BANK_B + 19, "PB19"), /* B19_SPI_3_CK */
+	PINCTRL_PIN(EQ5P_EYEQ5_PIN_OFFSET_BANK_B + 20, "PB20"), /* B20_SPI_3_CS0 */
+	PINCTRL_PIN(EQ5P_EYEQ5_PIN_OFFSET_BANK_B + 21, "PB21"), /* B21_SPI_3_CS1 */
+	PINCTRL_PIN(EQ5P_EYEQ5_PIN_OFFSET_BANK_B + 22, "PB22"), /* B22_MCLK0 */
 };
 
-static const char * const gpio_groups[] = {
+static const char * const eq5p_eyeq5_gpio_groups[] = {
 	/* Bank A */
 	"PA0",  "PA1",  "PA2",  "PA3",  "PA4",  "PA5",  "PA6",  "PA7",
 	"PA8",  "PA9",  "PA10", "PA11", "PA12", "PA13", "PA14", "PA15",
@@ -147,70 +159,90 @@ static const char * const gpio_groups[] = {
 };
 
 /* Groups of functions on bank A */
-static const char * const timer0_groups[] = { "PA0", "PA1" };
-static const char * const timer1_groups[] = { "PA2", "PA3" };
-static const char * const timer2_groups[] = { "PA4", "PA5" };
-static const char * const timer5_groups[] = { "PA6", "PA7", "PA8", "PA9" };
-static const char * const uart0_groups[] = { "PA10", "PA11" };
-static const char * const uart1_groups[] = { "PA12", "PA13" };
-static const char * const can0_groups[] = { "PA14", "PA15" };
-static const char * const can1_groups[] = { "PA16", "PA17" };
-static const char * const spi0_groups[] = { "PA18", "PA19", "PA20", "PA21", "PA22" };
-static const char * const spi1_groups[] = { "PA23", "PA24", "PA25", "PA26", "PA27" };
-static const char * const refclk0_groups[] = { "PA28" };
+static const char * const eq5p_eyeq5_timer0_groups[] = { "PA0", "PA1" };
+static const char * const eq5p_eyeq5_timer1_groups[] = { "PA2", "PA3" };
+static const char * const eq5p_eyeq5_timer2_groups[] = { "PA4", "PA5" };
+static const char * const eq5p_eyeq5_timer5_groups[] = { "PA6", "PA7", "PA8", "PA9" };
+static const char * const eq5p_eyeq5_uart0_groups[] = { "PA10", "PA11" };
+static const char * const eq5p_eyeq5_uart1_groups[] = { "PA12", "PA13" };
+static const char * const eq5p_eyeq5_can0_groups[] = { "PA14", "PA15" };
+static const char * const eq5p_eyeq5_can1_groups[] = { "PA16", "PA17" };
+static const char * const eq5p_eyeq5_spi0_groups[] = { "PA18", "PA19", "PA20", "PA21", "PA22" };
+static const char * const eq5p_eyeq5_spi1_groups[] = { "PA23", "PA24", "PA25", "PA26", "PA27" };
+static const char * const eq5p_eyeq5_refclk0_groups[] = { "PA28" };
 
 /* Groups of functions on bank B */
-static const char * const timer3_groups[] = { "PB0", "PB1" };
-static const char * const timer4_groups[] = { "PB2", "PB3" };
-static const char * const timer6_groups[] = { "PB4", "PB5", "PB6", "PB7" };
-static const char * const uart2_groups[] = { "PB8", "PB9" };
-static const char * const can2_groups[] = { "PB10", "PB11" };
-static const char * const spi2_groups[] = { "PB12", "PB13", "PB14", "PB15", "PB16" };
-static const char * const spi3_groups[] = { "PB17", "PB18", "PB19", "PB20", "PB21" };
-static const char * const mclk0_groups[] = { "PB22" };
+static const char * const eq5p_eyeq5_timer3_groups[] = { "PB0", "PB1" };
+static const char * const eq5p_eyeq5_timer4_groups[] = { "PB2", "PB3" };
+static const char * const eq5p_eyeq5_timer6_groups[] = { "PB4", "PB5", "PB6", "PB7" };
+static const char * const eq5p_eyeq5_uart2_groups[] = { "PB8", "PB9" };
+static const char * const eq5p_eyeq5_can2_groups[] = { "PB10", "PB11" };
+static const char * const eq5p_eyeq5_spi2_groups[] = { "PB12", "PB13", "PB14", "PB15", "PB16" };
+static const char * const eq5p_eyeq5_spi3_groups[] = { "PB17", "PB18", "PB19", "PB20", "PB21" };
+static const char * const eq5p_eyeq5_mclk0_groups[] = { "PB22" };
 
-static const struct pinfunction eq5p_functions[] = {
-	/* GPIO having a fixed index is depended upon, see GPIO_FUNC_SELECTOR. */
-	PINCTRL_PINFUNCTION("gpio", gpio_groups, ARRAY_SIZE(gpio_groups)),
-#define GPIO_FUNC_SELECTOR 0
+static const struct pinfunction eq5p_eyeq5_functions[] = {
+	/* GPIO having a fixed index is depended upon, see EQ5P_GPIO_FUNC_SELECTOR. */
+	EQ5P_PINFUNCTION("gpio", eq5p_eyeq5_gpio_groups),
 
 	/* Bank A functions */
-	PINCTRL_PINFUNCTION("timer0", timer0_groups, ARRAY_SIZE(timer0_groups)),
-	PINCTRL_PINFUNCTION("timer1", timer1_groups, ARRAY_SIZE(timer1_groups)),
-	PINCTRL_PINFUNCTION("timer2", timer2_groups, ARRAY_SIZE(timer2_groups)),
-	PINCTRL_PINFUNCTION("timer5", timer5_groups, ARRAY_SIZE(timer5_groups)),
-	PINCTRL_PINFUNCTION("uart0", uart0_groups, ARRAY_SIZE(uart0_groups)),
-	PINCTRL_PINFUNCTION("uart1", uart1_groups, ARRAY_SIZE(uart1_groups)),
-	PINCTRL_PINFUNCTION("can0", can0_groups, ARRAY_SIZE(can0_groups)),
-	PINCTRL_PINFUNCTION("can1", can1_groups, ARRAY_SIZE(can1_groups)),
-	PINCTRL_PINFUNCTION("spi0", spi0_groups, ARRAY_SIZE(spi0_groups)),
-	PINCTRL_PINFUNCTION("spi1", spi1_groups, ARRAY_SIZE(spi1_groups)),
-	PINCTRL_PINFUNCTION("refclk0", refclk0_groups, ARRAY_SIZE(refclk0_groups)),
+	EQ5P_PINFUNCTION("timer0", eq5p_eyeq5_timer0_groups),
+	EQ5P_PINFUNCTION("timer1", eq5p_eyeq5_timer1_groups),
+	EQ5P_PINFUNCTION("timer2", eq5p_eyeq5_timer2_groups),
+	EQ5P_PINFUNCTION("timer5", eq5p_eyeq5_timer5_groups),
+	EQ5P_PINFUNCTION("uart0", eq5p_eyeq5_uart0_groups),
+	EQ5P_PINFUNCTION("uart1", eq5p_eyeq5_uart1_groups),
+	EQ5P_PINFUNCTION("can0", eq5p_eyeq5_can0_groups),
+	EQ5P_PINFUNCTION("can1", eq5p_eyeq5_can1_groups),
+	EQ5P_PINFUNCTION("spi0", eq5p_eyeq5_spi0_groups),
+	EQ5P_PINFUNCTION("spi1", eq5p_eyeq5_spi1_groups),
+	EQ5P_PINFUNCTION("refclk0", eq5p_eyeq5_refclk0_groups),
 
 	/* Bank B functions */
-	PINCTRL_PINFUNCTION("timer3", timer3_groups, ARRAY_SIZE(timer3_groups)),
-	PINCTRL_PINFUNCTION("timer4", timer4_groups, ARRAY_SIZE(timer4_groups)),
-	PINCTRL_PINFUNCTION("timer6", timer6_groups, ARRAY_SIZE(timer6_groups)),
-	PINCTRL_PINFUNCTION("uart2", uart2_groups, ARRAY_SIZE(uart2_groups)),
-	PINCTRL_PINFUNCTION("can2", can2_groups, ARRAY_SIZE(can2_groups)),
-	PINCTRL_PINFUNCTION("spi2", spi2_groups, ARRAY_SIZE(spi2_groups)),
-	PINCTRL_PINFUNCTION("spi3", spi3_groups, ARRAY_SIZE(spi3_groups)),
-	PINCTRL_PINFUNCTION("mclk0", mclk0_groups, ARRAY_SIZE(mclk0_groups)),
+	EQ5P_PINFUNCTION("timer3", eq5p_eyeq5_timer3_groups),
+	EQ5P_PINFUNCTION("timer4", eq5p_eyeq5_timer4_groups),
+	EQ5P_PINFUNCTION("timer6", eq5p_eyeq5_timer6_groups),
+	EQ5P_PINFUNCTION("uart2", eq5p_eyeq5_uart2_groups),
+	EQ5P_PINFUNCTION("can2", eq5p_eyeq5_can2_groups),
+	EQ5P_PINFUNCTION("spi2", eq5p_eyeq5_spi2_groups),
+	EQ5P_PINFUNCTION("spi3", eq5p_eyeq5_spi3_groups),
+	EQ5P_PINFUNCTION("mclk0", eq5p_eyeq5_mclk0_groups),
+};
+
+static const struct eq5p_bank eq5p_eyeq5_banks[] = {
+	{
+		.npins = EQ5P_EYEQ5_PIN_OFFSET_BANK_B,
+		.regs = {0x0C0, 0x0C4, 0x0D0, 0x0D4, 0x0B0},
+	},
+	{
+		.npins = ARRAY_SIZE(eq5p_eyeq5_pins) - EQ5P_EYEQ5_PIN_OFFSET_BANK_B,
+		.regs = {0x0C8, 0x0CC, 0x0D8, 0x0DC, 0x0B4},
+	},
+};
+
+static const struct eq5p_match_data eq5p_eyeq5_data = {
+	.npins = ARRAY_SIZE(eq5p_eyeq5_pins),
+	.nfunctions = ARRAY_SIZE(eq5p_eyeq5_functions),
+	.nbanks = ARRAY_SIZE(eq5p_eyeq5_banks),
+	.pins = eq5p_eyeq5_pins,
+	.functions = eq5p_eyeq5_functions,
+	.banks = eq5p_eyeq5_banks,
 };
 
 static void eq5p_update_bits(const struct eq5p_pinctrl *pctrl,
-			     enum eq5p_bank bank, enum eq5p_regs reg,
-			     u32 mask, u32 val)
+			     const struct eq5p_bank *bank,
+			     enum eq5p_regs reg, u32 mask, u32 val)
 {
-	void __iomem *ptr = pctrl->base + eq5p_regs[bank][reg];
+	void __iomem *ptr = pctrl->base + bank->regs[reg];
 
 	writel((readl(ptr) & ~mask) | (val & mask), ptr);
 }
 
 static bool eq5p_test_bit(const struct eq5p_pinctrl *pctrl,
-			  enum eq5p_bank bank, enum eq5p_regs reg, int offset)
+			  const struct eq5p_bank *bank,
+			  enum eq5p_regs reg, int offset)
 {
-	u32 val = readl(pctrl->base + eq5p_regs[bank][reg]);
+	u32 val = readl(pctrl->base + bank->regs[reg]);
 
 	if (WARN_ON(offset > 31))
 		return false;
@@ -218,25 +250,29 @@ static bool eq5p_test_bit(const struct eq5p_pinctrl *pctrl,
 	return (val & BIT(offset)) != 0;
 }
 
-static enum eq5p_bank eq5p_pin_to_bank(unsigned int pin)
+static int eq5p_pin_to_bank_offset(const struct eq5p_pinctrl *pctrl, unsigned int pin,
+				   const struct eq5p_bank **bank, unsigned int *offset)
 {
-	if (pin < EQ5P_PIN_OFFSET_BANK_B)
-		return EQ5P_BANK_A;
-	else
-		return EQ5P_BANK_B;
-}
+	for (unsigned int i = 0; i < pctrl->data->nbanks; i++) {
+		const struct eq5p_bank *_bank = &pctrl->data->banks[i];
+		unsigned int npins = _bank->npins;
 
-static unsigned int eq5p_pin_to_offset(unsigned int pin)
-{
-	if (pin < EQ5P_PIN_OFFSET_BANK_B)
-		return pin;
-	else
-		return pin - EQ5P_PIN_OFFSET_BANK_B;
+		if (pin < npins) {
+			*bank = _bank;
+			*offset = pin;
+			return 0;
+		}
+		pin -= npins;
+	}
+
+	return -EINVAL;
 }
 
 static int eq5p_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
 {
-	return ARRAY_SIZE(eq5p_pins);
+	struct eq5p_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	return pctrl->data->npins;
 }
 
 static const char *eq5p_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
@@ -260,10 +296,15 @@ static int eq5p_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
 {
 	enum pin_config_param param = pinconf_to_config_param(*config);
 	struct eq5p_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-	unsigned int offset = eq5p_pin_to_offset(pin);
-	enum eq5p_bank bank = eq5p_pin_to_bank(pin);
+	const struct eq5p_bank *bank;
+	unsigned int offset;
 	u32 val_ds, arg;
 	bool pd, pu;
+	int ret;
+
+	ret = eq5p_pin_to_bank_offset(pctrl, pin, &bank, &offset);
+	if (ret)
+		return ret;
 
 	pd = eq5p_test_bit(pctrl, bank, EQ5P_PD, offset);
 	pu = eq5p_test_bit(pctrl, bank, EQ5P_PU, offset);
@@ -281,10 +322,10 @@ static int eq5p_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
 	case PIN_CONFIG_DRIVE_STRENGTH:
 		offset *= 2; /* two bits per pin */
 		if (offset >= 32) {
-			val_ds = readl(pctrl->base + eq5p_regs[bank][EQ5P_DS_HIGH]);
+			val_ds = readl(pctrl->base + bank->regs[EQ5P_DS_HIGH]);
 			offset -= 32;
 		} else {
-			val_ds = readl(pctrl->base + eq5p_regs[bank][EQ5P_DS_LOW]);
+			val_ds = readl(pctrl->base + bank->regs[EQ5P_DS_LOW]);
 		}
 		arg = (val_ds >> offset) & EQ5P_DS_MASK;
 		break;
@@ -302,30 +343,35 @@ static void eq5p_pinctrl_pin_dbg_show(struct pinctrl_dev *pctldev,
 {
 	struct eq5p_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	const char *pin_name = pctrl->desc.pins[pin].name;
-	unsigned int offset = eq5p_pin_to_offset(pin);
-	enum eq5p_bank bank = eq5p_pin_to_bank(pin);
+	const struct eq5p_bank *bank;
 	const char *func_name, *bias;
 	unsigned long ds_config;
+	unsigned int offset;
 	u32 drive_strength;
 	bool pd, pu;
 	int i, j;
 
+	if (eq5p_pin_to_bank_offset(pctrl, pin, &bank, &offset)) {
+		seq_puts(s, "unknown pin");
+		return;
+	}
+
 	/*
 	 * First, let's get the function name. All pins have only two functions:
 	 * GPIO (IOCR == 0) and something else (IOCR == 1).
 	 */
 	if (eq5p_test_bit(pctrl, bank, EQ5P_IOCR, offset)) {
 		func_name = NULL;
-		for (i = 0; i < ARRAY_SIZE(eq5p_functions); i++) {
-			if (i == GPIO_FUNC_SELECTOR)
+		for (i = 0; i < pctrl->data->nfunctions; i++) {
+			if (i == EQ5P_GPIO_FUNC_SELECTOR)
 				continue;
 
-			for (j = 0; j < eq5p_functions[i].ngroups; j++) {
+			for (j = 0; j < pctrl->data->functions[i].ngroups; j++) {
 				/* Groups and pins are the same thing for us. */
-				const char *x = eq5p_functions[i].groups[j];
+				const char *x = pctrl->data->functions[i].groups[j];
 
 				if (strcmp(x, pin_name) == 0) {
-					func_name = eq5p_functions[i].name;
+					func_name = pctrl->data->functions[i].name;
 					break;
 				}
 			}
@@ -341,7 +387,7 @@ static void eq5p_pinctrl_pin_dbg_show(struct pinctrl_dev *pctldev,
 		if (!func_name)
 			func_name = "unknown";
 	} else {
-		func_name = eq5p_functions[GPIO_FUNC_SELECTOR].name;
+		func_name = pctrl->data->functions[EQ5P_GPIO_FUNC_SELECTOR].name;
 	}
 
 	/* Second, we retrieve the bias. */
@@ -376,13 +422,17 @@ static const struct pinctrl_ops eq5p_pinctrl_ops = {
 
 static int eq5p_pinmux_get_functions_count(struct pinctrl_dev *pctldev)
 {
-	return ARRAY_SIZE(eq5p_functions);
+	struct eq5p_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	return pctrl->data->nfunctions;
 }
 
 static const char *eq5p_pinmux_get_function_name(struct pinctrl_dev *pctldev,
 						 unsigned int selector)
 {
-	return eq5p_functions[selector].name;
+	struct eq5p_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	return pctrl->data->functions[selector].name;
 }
 
 static int eq5p_pinmux_get_function_groups(struct pinctrl_dev *pctldev,
@@ -390,8 +440,10 @@ static int eq5p_pinmux_get_function_groups(struct pinctrl_dev *pctldev,
 					   const char * const **groups,
 					   unsigned int *num_groups)
 {
-	*groups = eq5p_functions[selector].groups;
-	*num_groups = eq5p_functions[selector].ngroups;
+	struct eq5p_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
+
+	*groups = pctrl->data->functions[selector].groups;
+	*num_groups = pctrl->data->functions[selector].ngroups;
 	return 0;
 }
 
@@ -399,12 +451,17 @@ static int eq5p_pinmux_set_mux(struct pinctrl_dev *pctldev,
 			       unsigned int func_selector, unsigned int pin)
 {
 	struct eq5p_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-	const char *func_name = eq5p_functions[func_selector].name;
+	const char *func_name = pctrl->data->functions[func_selector].name;
 	const char *group_name = pctldev->desc->pins[pin].name;
-	bool is_gpio = func_selector == GPIO_FUNC_SELECTOR;
-	unsigned int offset = eq5p_pin_to_offset(pin);
-	enum eq5p_bank bank = eq5p_pin_to_bank(pin);
+	bool is_gpio = func_selector == EQ5P_GPIO_FUNC_SELECTOR;
+	const struct eq5p_bank *bank;
+	unsigned int offset;
 	u32 mask, val;
+	int ret;
+
+	ret = eq5p_pin_to_bank_offset(pctrl, pin, &bank, &offset);
+	if (ret)
+		return ret;
 
 	dev_dbg(pctldev->dev, "func=%s group=%s\n", func_name, group_name);
 
@@ -419,7 +476,7 @@ static int eq5p_pinmux_gpio_request_enable(struct pinctrl_dev *pctldev,
 					   unsigned int pin)
 {
 	/* Pin numbers and group selectors are the same thing in our case. */
-	return eq5p_pinmux_set_mux(pctldev, GPIO_FUNC_SELECTOR, pin);
+	return eq5p_pinmux_set_mux(pctldev, EQ5P_GPIO_FUNC_SELECTOR, pin);
 }
 
 static const struct pinmux_ops eq5p_pinmux_ops = {
@@ -435,10 +492,15 @@ static int eq5p_pinconf_set_drive_strength(struct pinctrl_dev *pctldev,
 					   unsigned int pin, u32 arg)
 {
 	struct eq5p_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-	unsigned int offset = eq5p_pin_to_offset(pin);
-	enum eq5p_bank bank = eq5p_pin_to_bank(pin);
+	const struct eq5p_bank *bank;
+	unsigned int offset;
 	unsigned int reg;
 	u32 mask, val;
+	int ret;
+
+	ret = eq5p_pin_to_bank_offset(pctrl, pin, &bank, &offset);
+	if (ret)
+		return ret;
 
 	if (arg & ~EQ5P_DS_MASK) {
 		dev_err(pctldev->dev, "Unsupported drive strength: %u\n", arg);
@@ -465,12 +527,18 @@ static int eq5p_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 {
 	struct eq5p_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	const char *pin_name = pctldev->desc->pins[pin].name;
-	unsigned int offset = eq5p_pin_to_offset(pin);
-	enum eq5p_bank bank = eq5p_pin_to_bank(pin);
 	struct device *dev = pctldev->dev;
-	u32 val = BIT(offset);
+	const struct eq5p_bank *bank;
+	unsigned int offset;
 	unsigned int i;
+	u32 val;
+	int ret;
 
+	ret = eq5p_pin_to_bank_offset(pctrl, pin, &bank, &offset);
+	if (ret)
+		return ret;
+
+	val = BIT(offset);
 	for (i = 0; i < num_configs; i++) {
 		enum pin_config_param param = pinconf_to_config_param(configs[i]);
 		u32 arg = pinconf_to_config_argument(configs[i]);
@@ -530,22 +598,57 @@ static const struct pinconf_ops eq5p_pinconf_ops = {
 	.pin_config_group_set = eq5p_pinconf_set,
 };
 
+static void eq5p_of_node_put(void *_dev)
+{
+	struct device *dev = _dev;
+
+	of_node_put(dev->of_node);
+}
+
 static int eq5p_probe(struct auxiliary_device *adev,
 		      const struct auxiliary_device_id *id)
 {
+	const struct of_device_id *match;
 	struct device *dev = &adev->dev;
 	struct pinctrl_dev *pctldev;
 	struct eq5p_pinctrl *pctrl;
+	bool need_of_put = false;
 	int ret;
 
+	/*
+	 * We are an auxiliary device of clk-eyeq. We do not have an OF node by
+	 * default; let's reuse our parent's OF node if not already set.
+	 */
+	if (!dev->of_node) {
+		device_set_of_node_from_dev(dev, dev->parent);
+		need_of_put = true;
+	}
+	if (!dev->of_node)
+		return -ENODEV;
+
+	if (need_of_put) {
+		ret = devm_add_action_or_reset(dev, eq5p_of_node_put, dev);
+		if (ret)
+			return ret;
+	}
+
+	/*
+	 * Using our newfound OF node, we can get match data. We cannot use
+	 * device_get_match_data() because it does not match reused OF nodes.
+	 */
+	match = of_match_node(dev->driver->of_match_table, dev->of_node);
+	if (!match || !match->data)
+		return -ENODEV;
+
 	pctrl = devm_kzalloc(dev, sizeof(*pctrl), GFP_KERNEL);
 	if (!pctrl)
 		return -ENOMEM;
 
 	pctrl->base = (void __iomem *)dev_get_platdata(dev);
+	pctrl->data = match->data;
 	pctrl->desc.name = dev_name(dev);
-	pctrl->desc.pins = eq5p_pins;
-	pctrl->desc.npins = ARRAY_SIZE(eq5p_pins);
+	pctrl->desc.pins = pctrl->data->pins;
+	pctrl->desc.npins = pctrl->data->npins;
 	pctrl->desc.pctlops = &eq5p_pinctrl_ops;
 	pctrl->desc.pmxops = &eq5p_pinmux_ops;
 	pctrl->desc.confops = &eq5p_pinconf_ops;
@@ -562,6 +665,12 @@ static int eq5p_probe(struct auxiliary_device *adev,
 	return 0;
 }
 
+static const struct of_device_id eq5p_match_table[] = {
+	{ .compatible = "mobileye,eyeq5-olb", .data = &eq5p_eyeq5_data },
+	{}
+};
+MODULE_DEVICE_TABLE(of, eq5p_match_table);
+
 static const struct auxiliary_device_id eq5p_id_table[] = {
 	{ .name = "clk_eyeq.pinctrl" },
 	{}
@@ -571,5 +680,8 @@ MODULE_DEVICE_TABLE(auxiliary, eq5p_id_table);
 static struct auxiliary_driver eq5p_driver = {
 	.probe = eq5p_probe,
 	.id_table = eq5p_id_table,
+	.driver = {
+		.of_match_table = eq5p_match_table,
+	}
 };
 module_auxiliary_driver(eq5p_driver);

-- 
2.52.0


