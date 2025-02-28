Return-Path: <linux-mips+bounces-8042-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C01FA49A9D
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2025 14:35:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 516701731C8
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2025 13:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54AFF26E959;
	Fri, 28 Feb 2025 13:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="PdvrMNUf";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="braxl6Vu"
X-Original-To: linux-mips@vger.kernel.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F17026E16B;
	Fri, 28 Feb 2025 13:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740749675; cv=pass; b=GeGd1gHci8U4yOppbEb/Hkkm6MmtetGO/kpfOFo5QD2Z4SoEaD3GGuO1tNr8KUq1yeuaucRbK/iamRM0myugWjMfWe5qnoGKjUeUunMP6ne467gRtL2uj4JmOleM/WQGA69PnItmpO98QMGXmng312VwKkVE+CeRA9xYLDu/sD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740749675; c=relaxed/simple;
	bh=tm43yHO8SClaUKCV4rG6k3SdfFoHZmSSBMg/C8tjY8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MtE8baAlOAScqAqJqzHVDMlH05/dMq+ciT440+uAb3UKrgcwUN8aGp+QKyceflBqh10gwvLg1z0WFqrJTl5JMideFEIulgChQtiCLQ8QOIrnBv+96MhKqV+fiyHHV35i3deUH8USDzl4hu0+ivPHPFqgGFs+EcXMVJwTdiMV8Tc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=PdvrMNUf; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=braxl6Vu; arc=pass smtp.client-ip=81.169.146.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1740749647; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=bBqUZe+tH3W9tipMOcpwbSlGvGdzAL4WP1DQsS4/E1WrGO0Hw3vrAJn0Law8ZrR25K
    D4wu6FuIjBKC4Czd2TMr7NrxAeTCmV1OOJjmD+0QQctGRUhpwpunVX/SbjKm6OaQ6MQa
    v8+l1VX83yTEr5rx3YCk0EerwXCrodjRvEtuBFohlTt7AJg1gM38vAWj1MkJGHNXzRc9
    abpyCSRSJDTGV0OvO8HuROk5++0hRngGrd/NSM0x6wmW0T3sB7JCbjifuSi8T3l742+V
    oP3B3VyPyB1wCptmSduxV0CgGcvv+r22xAgE901XEN1SE1VWkc0cIj9EcDtgrDgioPb2
    heFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1740749647;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=agTeAQGhxzolD1sC1pDXWjtNMIAu7gjtLJg2lzHewgw=;
    b=IOmDRwYd86HMMuic92ZLlFvRd3i9F3EEv2JkaLQ17/jJ6lhXH8dxHRb+bMSyc7+D77
    mbgNqpWrgzvAogz+ljZfQwCwrIYmv851ii6iSp1TDsUje/e7MwymWbtjsechn/u+7vnC
    WgF1djbDRBXDjK7kAmQV3858aQRCnmNksvIw4X/Gx5O/nhh2eEVVkWTUY9P9fqVd0vaH
    PYtJheYVHwTUC2OsLv/uWASEGH0pB9/6T/EtqL+tD5I/FdTdc0457uD0P7EhnQp6M1mL
    ztbevrsEOQXi3tPj8DjP0ScXJBe2Yn7qhpt09yCXyIXLrvgo2KyhLY6NpQl8gbHyqYEq
    Qa3g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1740749647;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=agTeAQGhxzolD1sC1pDXWjtNMIAu7gjtLJg2lzHewgw=;
    b=PdvrMNUfnw3uzqJRZsA1AcTSR9sBdOGpHgLHfqmA3C2Ul7lHOUftU/e0Osny3rjYwi
    EnAKrCJeu9LaxfNflLxS9th8xlNLQ9u83X4j1aeBgpsWR/jq2/SKbpNXP/fHQPZAcVKU
    rhTeBL3AEvX1ngPzQaj/2L7Vz9X+TBvLMwnByE872K+7FgJDY8XZgZHmMOVFbPGFzbjJ
    aqdmXjFYx4BhQ9jWO0wAd1e6YR5wxsUGuJ2Mmgi13odhrcCIZmOG1MWhadcAXqdDXDci
    ZyaF5KeAP56L+tYcLBaDjUd8BLPgA408fyVY7fanQc9Wny3UVqEnMGMdxO6VgiwEVbvB
    v5gQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1740749647;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=agTeAQGhxzolD1sC1pDXWjtNMIAu7gjtLJg2lzHewgw=;
    b=braxl6VurVmWJi8gIbVk77DAbETGjuPvksQFomJVdjXGOOL313rpX6mXpIOrou8Ohc
    aG3O5n//46RuNs1S/nBg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yeTkZ"
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 51.3.0 DYNA|AUTH)
    with ESMTPSA id Q56adc11SDY6L5Y
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 28 Feb 2025 14:34:06 +0100 (CET)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>
Cc: Andreas Kemnade <andreas@kemnade.info>,
	Paul Boddie <paul@boddie.org.uk>,
	Tim Bysun <tim.bysun@ingenic.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	letux-kernel@openphoenux.org,
	kernel@pyra-handheld.com,
	"H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v2 2/4] pinctrl: ingenic: add x1600 support
Date: Fri, 28 Feb 2025 14:33:56 +0100
Message-ID: <02a0b42f3f3102eba14f976f938e9c92ff8591e0.1740749637.git.hns@goldelico.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1740749637.git.hns@goldelico.com>
References: <cover.1740749637.git.hns@goldelico.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit

From: Paul Boddie <paul@boddie.org.uk>

Add support for the Lumissil/Ingenic X1600 SoC.

It uses shadow registers to commit changes to multiple pinctrl
registers in parallel.

Define specific Chip ID, register offsets, pin tables etc.

Handling the unique X1600_GPIO_PU only for the x1600 but
not for x1830 and above must be carefully taken into account.

Co-authored-by: Andreas Kemnade <andreas@kemnade.info>
Co-authored-by: H. Nikolaus Schaller <hns@goldelico.com>
Signed-off-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 244 +++++++++++++++++++++++++++++-
 1 file changed, 242 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index bc7ee54e062b5..8413cb8bd355e 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -3,7 +3,7 @@
  * Ingenic SoCs pinctrl driver
  *
  * Copyright (c) 2017 Paul Cercueil <paul@crapouillou.net>
- * Copyright (c) 2017, 2019 Paul Boddie <paul@boddie.org.uk>
+ * Copyright (c) 2017, 2019, 2020, 2023 Paul Boddie <paul@boddie.org.uk>
  * Copyright (c) 2019, 2020 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
  */
 
@@ -58,6 +58,8 @@
 #define JZ4770_GPIO_FLAG			0x50
 #define JZ4770_GPIO_PEN				0x70
 
+#define X1600_GPIO_PU				0x80
+
 #define X1830_GPIO_PEL				0x110
 #define X1830_GPIO_PEH				0x120
 #define X1830_GPIO_SR				0x150
@@ -112,6 +114,7 @@ enum jz_version {
 	ID_JZ4780,
 	ID_X1000,
 	ID_X1500,
+	ID_X1600,
 	ID_X1830,
 	ID_X2000,
 	ID_X2100,
@@ -162,6 +165,7 @@ static const unsigned long enabled_socs =
 	IS_ENABLED(CONFIG_MACH_JZ4780) << ID_JZ4780 |
 	IS_ENABLED(CONFIG_MACH_X1000) << ID_X1000 |
 	IS_ENABLED(CONFIG_MACH_X1500) << ID_X1500 |
+	IS_ENABLED(CONFIG_MACH_X1600) << ID_X1600 |
 	IS_ENABLED(CONFIG_MACH_X1830) << ID_X1830 |
 	IS_ENABLED(CONFIG_MACH_X2000) << ID_X2000 |
 	IS_ENABLED(CONFIG_MACH_X2100) << ID_X2100;
@@ -2351,6 +2355,233 @@ static const struct ingenic_chip_info x1500_chip_info = {
 	.access_table = &x1000_access_table,
 };
 
+static const u32 x1600_pull_ups[4] = {
+	0xffffffff, 0xdffbf7bf, 0x987e0000, 0x0000003f,
+};
+
+static const u32 x1600_pull_downs[4] = {
+	0x00000000, 0x00000000, 0x07000007, 0x00000000,
+};
+
+static int x1600_uart0_data_pins[] = { 0x27, 0x28, };
+static int x1600_uart0_hwflow_pins[] = { 0x29, 0x2a, };
+static int x1600_uart1_data_pins[] = { 0x23, 0x22, };
+static int x1600_uart1_hwflow_pins[] = { 0x25, 0x24, };
+static int x1600_uart2_data_a_pins[] = { 0x1f, 0x1e, };
+static int x1600_uart2_data_b_pins[] = { 0x21, 0x20, };
+static int x1600_uart3_data_b_pins[] = { 0x25, 0x24, };
+static int x1600_uart3_data_d_pins[] = { 0x65, 0x64, };
+static int x1600_sfc_pins[] = { 0x53, 0x54, 0x55, 0x56, 0x51, 0x52, 0x24, };
+static int x1600_ssi_dt_a_pins[] = { 0x1e, };
+static int x1600_ssi_dt_b_pins[] = { 0x2d, };
+static int x1600_ssi_dr_a_pins[] = { 0x1d, };
+static int x1600_ssi_dr_b_pins[] = { 0x2e, };
+static int x1600_ssi_clk_a_pins[] = { 0x1f, };
+static int x1600_ssi_clk_b_pins[] = { 0x2c, };
+static int x1600_ssi_ce0_a_pins[] = { 0x1c, };
+static int x1600_ssi_ce0_b_pins[] = { 0x31, };
+static int x1600_ssi_ce1_a_pins[] = { 0x22, };
+static int x1600_ssi_ce1_b_pins[] = { 0x30, };
+static int x1600_mmc0_1bit_b_pins[] = { 0x2c, 0x2d, 0x2e, };
+static int x1600_mmc0_4bit_b_pins[] = { 0x2f, 0x30, 0x31, };
+static int x1600_mmc0_1bit_c_pins[] = { 0x51, 0x53, 0x54, };
+static int x1600_mmc0_4bit_c_pins[] = { 0x56, 0x55, 0x52, };
+static int x1600_mmc1_1bit_pins[] = { 0x60, 0x61, 0x62, };
+static int x1600_mmc1_4bit_pins[] = { 0x63, 0x64, 0x65, };
+static int x1600_i2c0_a_pins[] = { 0x1d, 0x1c, };
+static int x1600_i2c0_b_pins[] = { 0x3f, 0x3e, };
+static int x1600_i2c1_b_15_pins[] = { 0x30, 0x2f, };
+static int x1600_i2c1_b_19_pins[] = { 0x34, 0x33, };
+static int x1600_i2s_data_tx_pins[] = { 0x39, };
+static int x1600_i2s_data_rx_pins[] = { 0x35, };
+static int x1600_i2s_clk_rx_pins[] = { 0x37, 0x38, };
+static int x1600_i2s_clk_tx_pins[] = { 0x3b, 0x3c, };
+static int x1600_i2s_sysclk_pins[] = { 0x36, 0x3a, };
+
+static int x1600_cim_pins[] = {
+	0x14, 0x16, 0x15, 0x18, 0x13,
+	0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
+};
+
+static int x1600_slcd_8bit_pins[] = {
+	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
+	0x17, 0x19, 0x1a, 0x1b,
+};
+
+static int x1600_slcd_16bit_pins[] = {
+	0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
+};
+
+static int x1600_lcd_16bit_pins[] = {
+	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
+	0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
+	0x18, 0x19, 0x1a, 0x1b,
+};
+
+static int x1600_lcd_18bit_pins[] = {
+	0x10, 0x11,
+};
+
+static int x1600_lcd_24bit_pins[] = {
+	0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
+};
+
+static int x1600_pwm_pwm0_pins[] = { 0x40, };
+static int x1600_pwm_pwm1_pins[] = { 0x41, };
+static int x1600_pwm_pwm2_pins[] = { 0x42, };
+static int x1600_pwm_pwm3_pins[] = { 0x58, };
+static int x1600_pwm_pwm4_pins[] = { 0x59, };
+static int x1600_pwm_pwm5_b_pins[] = { 0x33, };
+static int x1600_pwm_pwm5_c_pins[] = { 0x5a, };
+static int x1600_pwm_pwm6_b9_pins[] = { 0x29, };
+static int x1600_pwm_pwm6_b20_pins[] = { 0x34, };
+static int x1600_pwm_pwm7_b10_pins[] = { 0x2a, };
+static int x1600_pwm_pwm7_b21_pins[] = { 0x35, };
+
+static int x1600_mac_pins[] = {
+	0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x3a, 0x3b, 0x3c,
+};
+
+static int x1600_sfc_funcs[] = { 0, 0, 0, 0, 0, 0, 2, };
+
+static const struct group_desc x1600_groups[] = {
+	INGENIC_PIN_GROUP("uart0-data", x1600_uart0_data, 0),
+	INGENIC_PIN_GROUP("uart0-hwflow", x1600_uart0_hwflow, 0),
+	INGENIC_PIN_GROUP("uart1-data", x1600_uart1_data, 1),
+	INGENIC_PIN_GROUP("uart1-hwflow", x1600_uart1_hwflow, 1),
+	INGENIC_PIN_GROUP("uart2-data-a", x1600_uart2_data_a, 2),
+	INGENIC_PIN_GROUP("uart2-data-b", x1600_uart2_data_b, 1),
+	INGENIC_PIN_GROUP("uart3-data-b", x1600_uart3_data_b, 0),
+	INGENIC_PIN_GROUP("uart3-data-d", x1600_uart3_data_d, 2),
+	INGENIC_PIN_GROUP_FUNCS("sfc", x1600_sfc, x1600_sfc_funcs),
+	INGENIC_PIN_GROUP("ssi-dt-a", x1600_ssi_dt_a, 0),
+	INGENIC_PIN_GROUP("ssi-dt-b", x1600_ssi_dt_b, 1),
+	INGENIC_PIN_GROUP("ssi-dr-a", x1600_ssi_dr_a, 0),
+	INGENIC_PIN_GROUP("ssi-dr-b", x1600_ssi_dr_b, 1),
+	INGENIC_PIN_GROUP("ssi-clk-a", x1600_ssi_clk_a, 0),
+	INGENIC_PIN_GROUP("ssi-clk-b", x1600_ssi_clk_b, 1),
+	INGENIC_PIN_GROUP("ssi-ce0-a", x1600_ssi_ce0_a, 0),
+	INGENIC_PIN_GROUP("ssi-ce0-b", x1600_ssi_ce0_b, 1),
+	INGENIC_PIN_GROUP("ssi-ce1-a", x1600_ssi_ce1_a, 2),
+	INGENIC_PIN_GROUP("ssi-ce1-b", x1600_ssi_ce1_b, 1),
+	INGENIC_PIN_GROUP("mmc0-1bit-b", x1600_mmc0_1bit_b, 0),
+	INGENIC_PIN_GROUP("mmc0-4bit-b", x1600_mmc0_4bit_b, 0),
+	INGENIC_PIN_GROUP("mmc0-1bit-c", x1600_mmc0_1bit_c, 1),
+	INGENIC_PIN_GROUP("mmc0-4bit-c", x1600_mmc0_4bit_c, 1),
+	INGENIC_PIN_GROUP("mmc1-1bit", x1600_mmc1_1bit, 0),
+	INGENIC_PIN_GROUP("mmc1-4bit", x1600_mmc1_4bit, 0),
+	INGENIC_PIN_GROUP("i2c0-data-a", x1600_i2c0_a, 2),
+	INGENIC_PIN_GROUP("i2c0-data-b", x1600_i2c0_b, 0),
+	INGENIC_PIN_GROUP("i2c1-data-b-15", x1600_i2c1_b_15, 2),
+	INGENIC_PIN_GROUP("i2c1-data-b-19", x1600_i2c1_b_19, 0),
+	INGENIC_PIN_GROUP("i2s-data-tx", x1600_i2s_data_tx, 0),
+	INGENIC_PIN_GROUP("i2s-data-rx", x1600_i2s_data_rx, 0),
+	INGENIC_PIN_GROUP("i2s-clk-rx", x1600_i2s_clk_rx, 0),
+	INGENIC_PIN_GROUP("i2s-clk-tx", x1600_i2s_clk_tx, 0),
+	INGENIC_PIN_GROUP("i2s-sysclk", x1600_i2s_sysclk, 0),
+	INGENIC_PIN_GROUP("cim-data", x1600_cim, 2),
+	INGENIC_PIN_GROUP("slcd-8bit", x1600_slcd_8bit, 1),
+	INGENIC_PIN_GROUP("slcd-16bit", x1600_slcd_16bit, 1),
+	INGENIC_PIN_GROUP("lcd-16bit", x1600_lcd_16bit, 0),
+	INGENIC_PIN_GROUP("lcd-18bit", x1600_lcd_18bit, 0),
+	INGENIC_PIN_GROUP("lcd-24bit", x1600_lcd_24bit, 0),
+	INGENIC_PIN_GROUP("pwm0", x1600_pwm_pwm0, 0),
+	INGENIC_PIN_GROUP("pwm1", x1600_pwm_pwm1, 0),
+	INGENIC_PIN_GROUP("pwm2", x1600_pwm_pwm2, 0),
+	INGENIC_PIN_GROUP("pwm3", x1600_pwm_pwm3, 1),
+	INGENIC_PIN_GROUP("pwm4", x1600_pwm_pwm4, 1),
+	INGENIC_PIN_GROUP("pwm5-b", x1600_pwm_pwm5_b, 2),
+	INGENIC_PIN_GROUP("pwm5-c", x1600_pwm_pwm5_c, 1),
+	INGENIC_PIN_GROUP("pwm6-b9", x1600_pwm_pwm6_b9, 1),
+	INGENIC_PIN_GROUP("pwm6-b20", x1600_pwm_pwm6_b20, 2),
+	INGENIC_PIN_GROUP("pwm7-b10", x1600_pwm_pwm7_b10, 1),
+	INGENIC_PIN_GROUP("pwm7-b21", x1600_pwm_pwm7_b21, 2),
+	INGENIC_PIN_GROUP("mac", x1600_mac, 1),
+};
+
+static const char * const x1600_uart0_groups[] = { "uart0-data", "uart0-hwflow", };
+static const char * const x1600_uart1_groups[] = { "uart1-data", "uart1-hwflow", };
+static const char * const x1600_uart2_groups[] = { "uart2-data-a", "uart2-data-b", };
+static const char * const x1600_uart3_groups[] = { "uart3-data-b", "uart3-data-d", };
+
+static const char * const x1600_sfc_groups[] = { "sfc", };
+
+static const char * const x1600_ssi_groups[] = {
+	"ssi-dt-a", "ssi-dt-b",
+	"ssi-dr-a", "ssi-dr-b",
+	"ssi-clk-a", "ssi-clk-b",
+	"ssi-ce0-a", "ssi-ce0-b",
+	"ssi-ce1-a", "ssi-ce1-b",
+};
+
+static const char * const x1600_mmc0_groups[] = { "mmc0-1bit-b", "mmc0-4bit-b",
+	"mmc0-1bit-c", "mmc0-4bit-c",
+};
+
+static const char * const x1600_mmc1_groups[] = { "mmc1-1bit", "mmc1-4bit", };
+
+static const char * const x1600_i2c0_groups[] = { "i2c0-data-a", "i2c0-data-b", };
+static const char * const x1600_i2c1_groups[] = { "i2c1-data-b-15", "i2c1-data-b-19", };
+
+static const char * const x1600_i2s_groups[] = {
+	"i2s-data-tx", "i2s-data-rx", "i2s-clk-rx", "i2s-clk-tx", "i2s-sysclk",
+};
+
+static const char * const x1600_cim_groups[] = { "cim-data", };
+
+static const char * const x1600_lcd_groups[] = { "slcd-8bit", "slcd-16bit",
+	"lcd-16bit", "lcd-18bit", "lcd-24bit", "lcd-no-pins",
+};
+
+static const char * const x1600_pwm0_groups[] = { "pwm0", };
+static const char * const x1600_pwm1_groups[] = { "pwm1", };
+static const char * const x1600_pwm2_groups[] = { "pwm2", };
+static const char * const x1600_pwm3_groups[] = { "pwm3", };
+static const char * const x1600_pwm4_groups[] = { "pwm4", };
+static const char * const x1600_pwm5_groups[] = { "pwm5-b", "pwm5-c", };
+static const char * const x1600_pwm6_groups[] = { "pwm6-b9", "pwm6-b20", };
+static const char * const x1600_pwm7_groups[] = { "pwm7-b10", "pwm7-b21", };
+
+static const char * const x1600_mac_groups[] = { "mac", };
+
+static const struct function_desc x1600_functions[] = {
+	INGENIC_PIN_FUNCTION("uart0", x1600_uart0),
+	INGENIC_PIN_FUNCTION("uart1", x1600_uart1),
+	INGENIC_PIN_FUNCTION("uart2", x1600_uart2),
+	INGENIC_PIN_FUNCTION("uart3", x1600_uart3),
+	INGENIC_PIN_FUNCTION("sfc", x1600_sfc),
+	INGENIC_PIN_FUNCTION("ssi", x1600_ssi),
+	INGENIC_PIN_FUNCTION("mmc0", x1600_mmc0),
+	INGENIC_PIN_FUNCTION("mmc1", x1600_mmc1),
+	INGENIC_PIN_FUNCTION("i2c0", x1600_i2c0),
+	INGENIC_PIN_FUNCTION("i2c1", x1600_i2c1),
+	INGENIC_PIN_FUNCTION("i2s", x1600_i2s),
+	INGENIC_PIN_FUNCTION("cim", x1600_cim),
+	INGENIC_PIN_FUNCTION("lcd", x1600_lcd),
+	INGENIC_PIN_FUNCTION("pwm0", x1600_pwm0),
+	INGENIC_PIN_FUNCTION("pwm1", x1600_pwm1),
+	INGENIC_PIN_FUNCTION("pwm2", x1600_pwm2),
+	INGENIC_PIN_FUNCTION("pwm3", x1600_pwm3),
+	INGENIC_PIN_FUNCTION("pwm4", x1600_pwm4),
+	INGENIC_PIN_FUNCTION("pwm5", x1600_pwm5),
+	INGENIC_PIN_FUNCTION("pwm6", x1600_pwm6),
+	INGENIC_PIN_FUNCTION("pwm7", x1600_pwm7),
+	INGENIC_PIN_FUNCTION("mac", x1600_mac),
+};
+
+static const struct ingenic_chip_info x1600_chip_info = {
+	.num_chips = 4,
+	.reg_offset = 0x100,
+	.version = ID_X1600,
+	.groups = x1600_groups,
+	.num_groups = ARRAY_SIZE(x1600_groups),
+	.functions = x1600_functions,
+	.num_functions = ARRAY_SIZE(x1600_functions),
+	.pull_ups = x1600_pull_ups,
+	.pull_downs = x1600_pull_downs,
+	.access_table = &x1000_access_table,
+};
+
 static const u32 x1830_pull_ups[4] = {
 	0x5fdfffc0, 0xffffefff, 0x1ffffbff, 0x0fcff3fc,
 };
@@ -3860,7 +4091,9 @@ static int ingenic_pinconf_get(struct pinctrl_dev *pctldev,
 		pulldown = (bias == GPIO_PULL_DOWN) && (jzpc->info->pull_downs[offt] & BIT(idx));
 
 	} else {
-		if (is_soc_or_above(jzpc, ID_JZ4770))
+		if (is_soc_or_above(jzpc, ID_X1600))
+			pull = ingenic_get_pin_config(jzpc, pin, X1600_GPIO_PU);
+		else if (is_soc_or_above(jzpc, ID_JZ4770))
 			pull = !ingenic_get_pin_config(jzpc, pin, JZ4770_GPIO_PEN);
 		else if (is_soc_or_above(jzpc, ID_JZ4740))
 			pull = !ingenic_get_pin_config(jzpc, pin, JZ4740_GPIO_PULL_DIS);
@@ -3959,6 +4192,8 @@ static void ingenic_set_bias(struct ingenic_pinctrl *jzpc,
 					REG_SET(X1830_GPIO_PEH), bias << idxh);
 		}
 
+	} else if (is_soc_or_above(jzpc, ID_X1600)) {
+		ingenic_config_pin(jzpc, pin, X1600_GPIO_PU, bias);
 	} else if (is_soc_or_above(jzpc, ID_JZ4770)) {
 		ingenic_config_pin(jzpc, pin, JZ4770_GPIO_PEN, !bias);
 	} else if (is_soc_or_above(jzpc, ID_JZ4740)) {
@@ -4150,6 +4385,7 @@ static const struct of_device_id ingenic_gpio_of_matches[] __initconst = {
 	{ .compatible = "ingenic,jz4775-gpio" },
 	{ .compatible = "ingenic,jz4780-gpio" },
 	{ .compatible = "ingenic,x1000-gpio" },
+	{ .compatible = "ingenic,x1600-gpio" },
 	{ .compatible = "ingenic,x1830-gpio" },
 	{ .compatible = "ingenic,x2000-gpio" },
 	{ .compatible = "ingenic,x2100-gpio" },
@@ -4397,6 +4633,10 @@ static const struct of_device_id ingenic_pinctrl_of_matches[] = {
 		.compatible = "ingenic,x1500-pinctrl",
 		.data = IF_ENABLED(CONFIG_MACH_X1500, &x1500_chip_info)
 	},
+	{
+		.compatible = "ingenic,x1600-pinctrl",
+		.data = IF_ENABLED(CONFIG_MACH_X1600, &x1600_chip_info)
+	},
 	{
 		.compatible = "ingenic,x1830-pinctrl",
 		.data = IF_ENABLED(CONFIG_MACH_X1830, &x1830_chip_info)
-- 
2.47.0


