Return-Path: <linux-mips+bounces-7989-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F3EA467E9
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 18:22:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB5853A875C
	for <lists+linux-mips@lfdr.de>; Wed, 26 Feb 2025 17:22:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5E18224B04;
	Wed, 26 Feb 2025 17:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="Y8G+gimK";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="wnNPM06g"
X-Original-To: linux-mips@vger.kernel.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943C018BC3F;
	Wed, 26 Feb 2025 17:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740590548; cv=pass; b=W+O2wDjaROGpoDPqBcMe/FT52mUb9OVmQEqTxJARonnGUQrbYcgKFVD3WevsvkjkGTCm0we8BOCvKZaqdNt3CoLRAqOWc3sBaIJi1OFz+8XAt+vLWTHQOZBzxZmU5P5Ruw6kD7HeY7uTl8k7qPHK+PNfU3aKybtG5u43jfa6htQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740590548; c=relaxed/simple;
	bh=Z9Hfm+K+FyGeBDvkxVyT2jNql2DeA3wYrpX34ASqRkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TsqtOzuUU0kqFk2rgU0t/lljlwv7WsoU6GIAZTZdFsLNjol6elBBPITtmH4s6pEOtkdcGiM89uzOtuqqQw1euKyoWY5Ia2ufGTPeMw2R17D/vYUy1EeasHGYNBHRv0tqiQ+OMNc2D4cbBmxsq2ao6XpooIatnSRuc8e/styJ++g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=Y8G+gimK; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=wnNPM06g; arc=pass smtp.client-ip=81.169.146.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1740590184; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Z7piE03izeU4J66COYaOW0yVmv6GVgLG1JwmATkLQpkV79uhxVrBknytYAx+MtYAPa
    8C7hn28ak7OPIu8kMxnbrq+xshXYKkEeBO0aC2SPa85+9wfEzF2LbiByUKJtfehDm1og
    mcrtEB+MQxl9t3gNjLsBQoMIN6nWMYYDHKhbzFuKnSVYx4NZy2Vkrc5omAnZTnbPFDKr
    4FC79PO5zWgNsgFF8ci6W/3AU6wKiRIIGhKY677y1K5ZxwbEhRx/ZWm2xcVuAe73LJYV
    zruP1TW6qhk0h8ssUvPjNSvwokFcuNyJIETwI394tUzb9BbuoHTFluJu0awT1buM3IX/
    ++4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1740590184;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=mzJicuxq0bsDoSs0nOJMdT++dH4St9t3Mw/42pJpC4I=;
    b=SRuKi2j7mDo6gritv+gceG7r7Dj/CbZRGtOzzvml02AQWo5/JULinrngyeHi+quYl+
    DRlwR4MZPVIpz5tj3cBWXgEBPQrK/10R9YVL2KgFDE25T1T+Bi2T+ul28Mae2+3kabVM
    6C7SNeJR4yf5pE3gCXYO6I6Rsz3ik9XM5eeVByKhd/5Yqw62fRu/jegnYYhPzRNpoOOY
    F18sFN6VIJPkcEqXBSTtRn5j7tXru8ghVRN8QZpWZnE0NIpLG+5aP4OSZIaUXnbtQB1C
    C431hkXuFaBiBA5I6l72tlunnOZajncFOjOacGUJIuqWFtP5aN6lddA+EmXZ85rx+sPy
    6KEg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1740590184;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=mzJicuxq0bsDoSs0nOJMdT++dH4St9t3Mw/42pJpC4I=;
    b=Y8G+gimKDuzvQB1TqPG6Qx/bSyNyWD6cDl71yZfe6omXKo1WcRAJfo744QZI5iIQ3I
    hkqBD6IKL7UNaO4SC7Fy9d5fNO/ESJvT+0m4xhT66ADIm5Z1V+igRoIVa+LDOf+4MUni
    Mq5vBFfVG1flJSNWxgxPkJ2ymnk+hFJ1lTtT5BSlfhv5TUSGOOxKiyFbp/JNi0xlgNxE
    LOtJpMcrvoWIzmQQKvmMPMqvUhkN1i2kyTIHGTvQeP1DFWSE+/1ikpLGPCBd6cDezDm6
    iE6G8m9UIt78nbTMwa2P6Htx69FiFtJUIZvsvoz9sJJ1vpW9oWOsdSsZn8FkL6ZdRpXO
    jqEg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1740590184;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=mzJicuxq0bsDoSs0nOJMdT++dH4St9t3Mw/42pJpC4I=;
    b=wnNPM06gTjW6+Y6/z8fPsVaGHXG7Bcm5CIw8BF51KW4DmOJ7pZaudN8LZ9d4qGgBjn
    laR5OM70OKcdGftCVRAg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yeD0Z"
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 51.2.23 DYNA|AUTH)
    with ESMTPSA id Qe5b2211QHGOfpy
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 26 Feb 2025 18:16:24 +0100 (CET)
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
	"H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH 2/4] pinctrl: ingenic: add x1600 support
Date: Wed, 26 Feb 2025 18:16:05 +0100
Message-ID: <f633a14ccafc596e4611a1fae3e1c958ddfac2dc.1740590093.git.hns@goldelico.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1740590093.git.hns@goldelico.com>
References: <cover.1740590093.git.hns@goldelico.com>
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
 drivers/pinctrl/pinctrl-ingenic.c | 242 +++++++++++++++++++++++++++++-
 1 file changed, 240 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index bc7ee54e062b5..dfdc89ece9b8a 100644
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
 
+#define X1600_GPIO_PU				 0x80
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
@@ -2351,6 +2355,231 @@ static const struct ingenic_chip_info x1500_chip_info = {
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
+static int x1600_pwm_pwm5_pins[] = { 0x33, 0x5a, };
+static int x1600_pwm_pwm6_pins[] = { 0x29, 0x34, };
+static int x1600_pwm_pwm7_pins[] = { 0x2a, 0x35, };
+
+static int x1600_mac_pins[] = {
+	0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x3a, 0x3b, 0x3c,
+};
+
+static int x1600_sfc_funcs[] = { 0, 0, 0, 0, 0, 0, 2, };
+
+static int x1600_pwm_pwm5_funcs[] = { 2, 1, };
+static int x1600_pwm_pwm6_funcs[] = { 1, 2, };
+static int x1600_pwm_pwm7_funcs[] = { 1, 2, };
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
+	INGENIC_PIN_GROUP_FUNCS("pwm5", x1600_pwm_pwm5, x1600_pwm_pwm5_funcs),
+	INGENIC_PIN_GROUP_FUNCS("pwm6", x1600_pwm_pwm6, x1600_pwm_pwm6_funcs),
+	INGENIC_PIN_GROUP_FUNCS("pwm7", x1600_pwm_pwm7, x1600_pwm_pwm7_funcs),
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
+static const char * const x1600_pwm5_groups[] = { "pwm5", };
+static const char * const x1600_pwm6_groups[] = { "pwm6", };
+static const char * const x1600_pwm7_groups[] = { "pwm7", };
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
@@ -3860,7 +4089,9 @@ static int ingenic_pinconf_get(struct pinctrl_dev *pctldev,
 		pulldown = (bias == GPIO_PULL_DOWN) && (jzpc->info->pull_downs[offt] & BIT(idx));
 
 	} else {
-		if (is_soc_or_above(jzpc, ID_JZ4770))
+		if (is_soc_or_above(jzpc, ID_X1600))
+			pull = ingenic_get_pin_config(jzpc, pin, X1600_GPIO_PU);
+		else if (is_soc_or_above(jzpc, ID_JZ4770))
 			pull = !ingenic_get_pin_config(jzpc, pin, JZ4770_GPIO_PEN);
 		else if (is_soc_or_above(jzpc, ID_JZ4740))
 			pull = !ingenic_get_pin_config(jzpc, pin, JZ4740_GPIO_PULL_DIS);
@@ -3959,6 +4190,8 @@ static void ingenic_set_bias(struct ingenic_pinctrl *jzpc,
 					REG_SET(X1830_GPIO_PEH), bias << idxh);
 		}
 
+	} else if (is_soc_or_above(jzpc, ID_X1600)) {
+		ingenic_config_pin(jzpc, pin, X1600_GPIO_PU, bias);
 	} else if (is_soc_or_above(jzpc, ID_JZ4770)) {
 		ingenic_config_pin(jzpc, pin, JZ4770_GPIO_PEN, !bias);
 	} else if (is_soc_or_above(jzpc, ID_JZ4740)) {
@@ -4150,6 +4383,7 @@ static const struct of_device_id ingenic_gpio_of_matches[] __initconst = {
 	{ .compatible = "ingenic,jz4775-gpio" },
 	{ .compatible = "ingenic,jz4780-gpio" },
 	{ .compatible = "ingenic,x1000-gpio" },
+	{ .compatible = "ingenic,x1600-gpio" },
 	{ .compatible = "ingenic,x1830-gpio" },
 	{ .compatible = "ingenic,x2000-gpio" },
 	{ .compatible = "ingenic,x2100-gpio" },
@@ -4397,6 +4631,10 @@ static const struct of_device_id ingenic_pinctrl_of_matches[] = {
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


