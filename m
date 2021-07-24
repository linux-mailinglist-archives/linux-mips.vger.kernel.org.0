Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B41723D4550
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jul 2021 08:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234049AbhGXF4s (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Jul 2021 01:56:48 -0400
Received: from out28-3.mail.aliyun.com ([115.124.28.3]:48487 "EHLO
        out28-3.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbhGXF4r (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 24 Jul 2021 01:56:47 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436282|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.00449875-0.000606777-0.994895;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047199;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.Kpjyp2k_1627108627;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Kpjyp2k_1627108627)
          by smtp.aliyun-inc.com(10.147.43.95);
          Sat, 24 Jul 2021 14:37:15 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linus.walleij@linaro.org
Cc:     robh+dt@kernel.org, paul@crapouillou.net,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com
Subject: [PATCH 1/4] pinctrl: Ingenic: Improve the code.
Date:   Sat, 24 Jul 2021 14:36:41 +0800
Message-Id: <1627108604-91304-2-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627108604-91304-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1627108604-91304-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.Rename the original "dmicx" ABIs to "dmic-ifx", since these devices
  have only one DMIC module which has multiple input interfaces. The
  original naming is easy to make users mistakenly think that the
  device has multiple dmic modules. Currently, in the mainline, no
  other devicetree out there is using the "sfc" ABI, so we should be
  able to replace it safely.
2.Rename the original "ssix-ce0" ABIs to "ssix-ce", since the X2000
  have only one ce pin. The original naming is easy to make users
  mistakenly think that the device has multiple ce pins. Currently,
  in the mainline, no other devicetree out there is using the
  "ssix-ce0" ABIs, so we should be able to replace it safely.
3.Split the original "sfc" ABI into "sfc-data", "sfc-ce", "sfc-clk"
  to increase the flexibility when configuring the pins. Currently,
  in the mainline, no other devicetree out there is using the "sfc"
  ABI, so we should be able to replace it safely.
4.There is more than one compatible string in the match table, so
  renaming "ingenic_xxxx_of_match[]" to "ingenic_xxxx_of_matches"
  is more reasonable, and remove the unnecessary commas in
  "ingenic_gpio_of_matches[]" to reduce code size as much as possible.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 155 ++++++++++++++++++++++----------------
 1 file changed, 89 insertions(+), 66 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 983ba98..1ec05ee 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -1827,7 +1827,9 @@ static int x1000_uart1_data_d_pins[] = { 0x62, 0x63, };
 static int x1000_uart1_hwflow_pins[] = { 0x64, 0x65, };
 static int x1000_uart2_data_a_pins[] = { 0x02, 0x03, };
 static int x1000_uart2_data_d_pins[] = { 0x65, 0x64, };
-static int x1000_sfc_pins[] = { 0x1d, 0x1c, 0x1e, 0x1f, 0x1a, 0x1b, };
+static int x1000_sfc_data_pins[] = { 0x1d, 0x1c, 0x1e, 0x1f, };
+static int x1000_sfc_clk_pins[] = { 0x1a, };
+static int x1000_sfc_ce_pins[] = { 0x1b, };
 static int x1000_ssi_dt_a_22_pins[] = { 0x16, };
 static int x1000_ssi_dt_a_29_pins[] = { 0x1d, };
 static int x1000_ssi_dt_d_pins[] = { 0x62, };
@@ -1871,8 +1873,8 @@ static int x1000_i2s_data_tx_pins[] = { 0x24, };
 static int x1000_i2s_data_rx_pins[] = { 0x23, };
 static int x1000_i2s_clk_txrx_pins[] = { 0x21, 0x22, };
 static int x1000_i2s_sysclk_pins[] = { 0x20, };
-static int x1000_dmic0_pins[] = { 0x35, 0x36, };
-static int x1000_dmic1_pins[] = { 0x25, };
+static int x1000_dmic_if0_pins[] = { 0x35, 0x36, };
+static int x1000_dmic_if1_pins[] = { 0x25, };
 static int x1000_cim_pins[] = {
 	0x08, 0x09, 0x0a, 0x0b,
 	0x13, 0x12, 0x11, 0x10, 0x0f, 0x0e, 0x0d, 0x0c,
@@ -1901,7 +1903,9 @@ static const struct group_desc x1000_groups[] = {
 	INGENIC_PIN_GROUP("uart1-hwflow", x1000_uart1_hwflow, 1),
 	INGENIC_PIN_GROUP("uart2-data-a", x1000_uart2_data_a, 2),
 	INGENIC_PIN_GROUP("uart2-data-d", x1000_uart2_data_d, 0),
-	INGENIC_PIN_GROUP("sfc", x1000_sfc, 1),
+	INGENIC_PIN_GROUP("sfc-data", x1000_sfc_data, 1),
+	INGENIC_PIN_GROUP("sfc-clk", x1000_sfc_clk, 1),
+	INGENIC_PIN_GROUP("sfc-ce", x1000_sfc_ce, 1),
 	INGENIC_PIN_GROUP("ssi-dt-a-22", x1000_ssi_dt_a_22, 2),
 	INGENIC_PIN_GROUP("ssi-dt-a-29", x1000_ssi_dt_a_29, 2),
 	INGENIC_PIN_GROUP("ssi-dt-d", x1000_ssi_dt_d, 0),
@@ -1938,8 +1942,8 @@ static const struct group_desc x1000_groups[] = {
 	INGENIC_PIN_GROUP("i2s-data-rx", x1000_i2s_data_rx, 1),
 	INGENIC_PIN_GROUP("i2s-clk-txrx", x1000_i2s_clk_txrx, 1),
 	INGENIC_PIN_GROUP("i2s-sysclk", x1000_i2s_sysclk, 1),
-	INGENIC_PIN_GROUP("dmic0", x1000_dmic0, 0),
-	INGENIC_PIN_GROUP("dmic1", x1000_dmic1, 1),
+	INGENIC_PIN_GROUP("dmic-if0", x1000_dmic_if0, 0),
+	INGENIC_PIN_GROUP("dmic-if1", x1000_dmic_if1, 1),
 	INGENIC_PIN_GROUP("cim-data", x1000_cim, 2),
 	INGENIC_PIN_GROUP("lcd-8bit", x1000_lcd_8bit, 1),
 	INGENIC_PIN_GROUP("lcd-16bit", x1000_lcd_16bit, 1),
@@ -1956,7 +1960,7 @@ static const char *x1000_uart1_groups[] = {
 	"uart1-data-a", "uart1-data-d", "uart1-hwflow",
 };
 static const char *x1000_uart2_groups[] = { "uart2-data-a", "uart2-data-d", };
-static const char *x1000_sfc_groups[] = { "sfc", };
+static const char *x1000_sfc_groups[] = { "sfc-data", "sfc-clk", "sfc-ce", };
 static const char *x1000_ssi_groups[] = {
 	"ssi-dt-a-22", "ssi-dt-a-29", "ssi-dt-d",
 	"ssi-dr-a-23", "ssi-dr-a-28", "ssi-dr-d",
@@ -1983,7 +1987,7 @@ static const char *x1000_i2c2_groups[] = { "i2c2-data", };
 static const char *x1000_i2s_groups[] = {
 	"i2s-data-tx", "i2s-data-rx", "i2s-clk-txrx", "i2s-sysclk",
 };
-static const char *x1000_dmic_groups[] = { "dmic0", "dmic1", };
+static const char *x1000_dmic_groups[] = { "dmic-if0", "dmic-if1", };
 static const char *x1000_cim_groups[] = { "cim-data", };
 static const char *x1000_lcd_groups[] = { "lcd-8bit", "lcd-16bit", };
 static const char *x1000_pwm0_groups[] = { "pwm0", };
@@ -2048,8 +2052,8 @@ static int x1500_i2s_data_tx_pins[] = { 0x24, };
 static int x1500_i2s_data_rx_pins[] = { 0x23, };
 static int x1500_i2s_clk_txrx_pins[] = { 0x21, 0x22, };
 static int x1500_i2s_sysclk_pins[] = { 0x20, };
-static int x1500_dmic0_pins[] = { 0x35, 0x36, };
-static int x1500_dmic1_pins[] = { 0x25, };
+static int x1500_dmic_if0_pins[] = { 0x35, 0x36, };
+static int x1500_dmic_if1_pins[] = { 0x25, };
 static int x1500_cim_pins[] = {
 	0x08, 0x09, 0x0a, 0x0b,
 	0x13, 0x12, 0x11, 0x10, 0x0f, 0x0e, 0x0d, 0x0c,
@@ -2068,7 +2072,9 @@ static const struct group_desc x1500_groups[] = {
 	INGENIC_PIN_GROUP("uart1-hwflow", x1500_uart1_hwflow, 1),
 	INGENIC_PIN_GROUP("uart2-data-a", x1500_uart2_data_a, 2),
 	INGENIC_PIN_GROUP("uart2-data-d", x1500_uart2_data_d, 0),
-	INGENIC_PIN_GROUP("sfc", x1000_sfc, 1),
+	INGENIC_PIN_GROUP("sfc-data", x1000_sfc_data, 1),
+	INGENIC_PIN_GROUP("sfc-clk", x1000_sfc_clk, 1),
+	INGENIC_PIN_GROUP("sfc-ce", x1000_sfc_ce, 1),
 	INGENIC_PIN_GROUP("mmc-1bit", x1500_mmc_1bit, 1),
 	INGENIC_PIN_GROUP("mmc-4bit", x1500_mmc_4bit, 1),
 	INGENIC_PIN_GROUP("i2c0-data", x1500_i2c0, 0),
@@ -2079,8 +2085,8 @@ static const struct group_desc x1500_groups[] = {
 	INGENIC_PIN_GROUP("i2s-data-rx", x1500_i2s_data_rx, 1),
 	INGENIC_PIN_GROUP("i2s-clk-txrx", x1500_i2s_clk_txrx, 1),
 	INGENIC_PIN_GROUP("i2s-sysclk", x1500_i2s_sysclk, 1),
-	INGENIC_PIN_GROUP("dmic0", x1500_dmic0, 0),
-	INGENIC_PIN_GROUP("dmic1", x1500_dmic1, 1),
+	INGENIC_PIN_GROUP("dmic-if0", x1500_dmic_if0, 0),
+	INGENIC_PIN_GROUP("dmic-if1", x1500_dmic_if1, 1),
 	INGENIC_PIN_GROUP("cim-data", x1500_cim, 2),
 	INGENIC_PIN_GROUP("pwm0", x1500_pwm_pwm0, 0),
 	INGENIC_PIN_GROUP("pwm1", x1500_pwm_pwm1, 1),
@@ -2101,7 +2107,7 @@ static const char *x1500_i2c2_groups[] = { "i2c2-data", };
 static const char *x1500_i2s_groups[] = {
 	"i2s-data-tx", "i2s-data-rx", "i2s-clk-txrx", "i2s-sysclk",
 };
-static const char *x1500_dmic_groups[] = { "dmic0", "dmic1", };
+static const char *x1500_dmic_groups[] = { "dmic-if0", "dmic-if1", };
 static const char *x1500_cim_groups[] = { "cim-data", };
 static const char *x1500_pwm0_groups[] = { "pwm0", };
 static const char *x1500_pwm1_groups[] = { "pwm1", };
@@ -2151,7 +2157,9 @@ static const u32 x1830_pull_downs[4] = {
 static int x1830_uart0_data_pins[] = { 0x33, 0x36, };
 static int x1830_uart0_hwflow_pins[] = { 0x34, 0x35, };
 static int x1830_uart1_data_pins[] = { 0x38, 0x37, };
-static int x1830_sfc_pins[] = { 0x17, 0x18, 0x1a, 0x19, 0x1b, 0x1c, };
+static int x1830_sfc_data_pins[] = { 0x17, 0x18, 0x1a, 0x19, };
+static int x1830_sfc_clk_pins[] = { 0x1b, };
+static int x1830_sfc_ce_pins[] = { 0x1c, };
 static int x1830_ssi0_dt_pins[] = { 0x4c, };
 static int x1830_ssi0_dr_pins[] = { 0x4b, };
 static int x1830_ssi0_clk_pins[] = { 0x4f, };
@@ -2182,8 +2190,8 @@ static int x1830_i2s_data_rx_pins[] = { 0x54, };
 static int x1830_i2s_clk_txrx_pins[] = { 0x58, 0x52, };
 static int x1830_i2s_clk_rx_pins[] = { 0x56, 0x55, };
 static int x1830_i2s_sysclk_pins[] = { 0x57, };
-static int x1830_dmic0_pins[] = { 0x48, 0x59, };
-static int x1830_dmic1_pins[] = { 0x5a, };
+static int x1830_dmic_if0_pins[] = { 0x48, 0x59, };
+static int x1830_dmic_if1_pins[] = { 0x5a, };
 static int x1830_lcd_tft_8bit_pins[] = {
 	0x62, 0x63, 0x64, 0x65, 0x66, 0x67,
 	0x68, 0x73, 0x72, 0x69,
@@ -2223,7 +2231,9 @@ static const struct group_desc x1830_groups[] = {
 	INGENIC_PIN_GROUP("uart0-data", x1830_uart0_data, 0),
 	INGENIC_PIN_GROUP("uart0-hwflow", x1830_uart0_hwflow, 0),
 	INGENIC_PIN_GROUP("uart1-data", x1830_uart1_data, 0),
-	INGENIC_PIN_GROUP("sfc", x1830_sfc, 1),
+	INGENIC_PIN_GROUP("sfc-data", x1830_sfc_data, 1),
+	INGENIC_PIN_GROUP("sfc-clk", x1830_sfc_clk, 1),
+	INGENIC_PIN_GROUP("sfc-ce", x1830_sfc_ce, 1),
 	INGENIC_PIN_GROUP("ssi0-dt", x1830_ssi0_dt, 0),
 	INGENIC_PIN_GROUP("ssi0-dr", x1830_ssi0_dr, 0),
 	INGENIC_PIN_GROUP("ssi0-clk", x1830_ssi0_clk, 0),
@@ -2254,8 +2264,8 @@ static const struct group_desc x1830_groups[] = {
 	INGENIC_PIN_GROUP("i2s-clk-txrx", x1830_i2s_clk_txrx, 0),
 	INGENIC_PIN_GROUP("i2s-clk-rx", x1830_i2s_clk_rx, 0),
 	INGENIC_PIN_GROUP("i2s-sysclk", x1830_i2s_sysclk, 0),
-	INGENIC_PIN_GROUP("dmic0", x1830_dmic0, 2),
-	INGENIC_PIN_GROUP("dmic1", x1830_dmic1, 2),
+	INGENIC_PIN_GROUP("dmic-if0", x1830_dmic_if0, 2),
+	INGENIC_PIN_GROUP("dmic-if1", x1830_dmic_if1, 2),
 	INGENIC_PIN_GROUP("lcd-tft-8bit", x1830_lcd_tft_8bit, 0),
 	INGENIC_PIN_GROUP("lcd-tft-24bit", x1830_lcd_tft_24bit, 0),
 	INGENIC_PIN_GROUP("lcd-slcd-8bit", x1830_lcd_slcd_8bit, 1),
@@ -2281,7 +2291,7 @@ static const struct group_desc x1830_groups[] = {
 
 static const char *x1830_uart0_groups[] = { "uart0-data", "uart0-hwflow", };
 static const char *x1830_uart1_groups[] = { "uart1-data", };
-static const char *x1830_sfc_groups[] = { "sfc", };
+static const char *x1830_sfc_groups[] = { "sfc-data", "sfc-clk", "sfc-ce", };
 static const char *x1830_ssi0_groups[] = {
 	"ssi0-dt", "ssi0-dr", "ssi0-clk", "ssi0-gpc", "ssi0-ce0", "ssi0-ce1",
 };
@@ -2301,7 +2311,7 @@ static const char *x1830_i2c2_groups[] = { "i2c2-data", };
 static const char *x1830_i2s_groups[] = {
 	"i2s-data-tx", "i2s-data-rx", "i2s-clk-txrx", "i2s-clk-rx", "i2s-sysclk",
 };
-static const char *x1830_dmic_groups[] = { "dmic0", "dmic1", };
+static const char *x1830_dmic_groups[] = { "dmic-if0", "dmic-if1", };
 static const char *x1830_lcd_groups[] = {
 	"lcd-tft-8bit", "lcd-tft-24bit", "lcd-slcd-8bit", "lcd-slcd-16bit",
 };
@@ -2381,17 +2391,21 @@ static int x2000_uart7_data_a_pins[] = { 0x08, 0x09, };
 static int x2000_uart7_data_c_pins[] = { 0x41, 0x42, };
 static int x2000_uart8_data_pins[] = { 0x3c, 0x3d, };
 static int x2000_uart9_data_pins[] = { 0x3e, 0x3f, };
-static int x2000_sfc0_d_pins[] = { 0x73, 0x74, 0x75, 0x76, 0x71, 0x72, };
-static int x2000_sfc0_e_pins[] = { 0x92, 0x93, 0x94, 0x95, 0x90, 0x91, };
-static int x2000_sfc1_pins[] = { 0x77, 0x78, 0x79, 0x7a, };
+static int x2000_sfc_data_if0_d_pins[] = { 0x73, 0x74, 0x75, 0x76, };
+static int x2000_sfc_data_if0_e_pins[] = { 0x92, 0x93, 0x94, 0x95, };
+static int x2000_sfc_data_if1_pins[] = { 0x77, 0x78, 0x79, 0x7a, };
+static int x2000_sfc_clk_d_pins[] = { 0x71, };
+static int x2000_sfc_clk_e_pins[] = { 0x90, };
+static int x2000_sfc_ce_d_pins[] = { 0x72, };
+static int x2000_sfc_ce_e_pins[] = { 0x91, };
 static int x2000_ssi0_dt_b_pins[] = { 0x3e, };
 static int x2000_ssi0_dt_d_pins[] = { 0x69, };
 static int x2000_ssi0_dr_b_pins[] = { 0x3d, };
 static int x2000_ssi0_dr_d_pins[] = { 0x6a, };
 static int x2000_ssi0_clk_b_pins[] = { 0x3f, };
 static int x2000_ssi0_clk_d_pins[] = { 0x68, };
-static int x2000_ssi0_ce0_b_pins[] = { 0x3c, };
-static int x2000_ssi0_ce0_d_pins[] = { 0x6d, };
+static int x2000_ssi0_ce_b_pins[] = { 0x3c, };
+static int x2000_ssi0_ce_d_pins[] = { 0x6d, };
 static int x2000_ssi1_dt_c_pins[] = { 0x4b, };
 static int x2000_ssi1_dt_d_pins[] = { 0x72, };
 static int x2000_ssi1_dt_e_pins[] = { 0x91, };
@@ -2401,9 +2415,9 @@ static int x2000_ssi1_dr_e_pins[] = { 0x92, };
 static int x2000_ssi1_clk_c_pins[] = { 0x4c, };
 static int x2000_ssi1_clk_d_pins[] = { 0x71, };
 static int x2000_ssi1_clk_e_pins[] = { 0x90, };
-static int x2000_ssi1_ce0_c_pins[] = { 0x49, };
-static int x2000_ssi1_ce0_d_pins[] = { 0x76, };
-static int x2000_ssi1_ce0_e_pins[] = { 0x95, };
+static int x2000_ssi1_ce_c_pins[] = { 0x49, };
+static int x2000_ssi1_ce_d_pins[] = { 0x76, };
+static int x2000_ssi1_ce_e_pins[] = { 0x95, };
 static int x2000_mmc0_1bit_pins[] = { 0x71, 0x72, 0x73, };
 static int x2000_mmc0_4bit_pins[] = { 0x74, 0x75, 0x75, };
 static int x2000_mmc0_8bit_pins[] = { 0x77, 0x78, 0x79, 0x7a, };
@@ -2455,10 +2469,10 @@ static int x2000_i2s3_data_tx2_pins[] = { 0x05, };
 static int x2000_i2s3_data_tx3_pins[] = { 0x06, };
 static int x2000_i2s3_clk_tx_pins[] = { 0x10, 0x02, };
 static int x2000_i2s3_sysclk_tx_pins[] = { 0x00, };
-static int x2000_dmic0_pins[] = { 0x54, 0x55, };
-static int x2000_dmic1_pins[] = { 0x56, };
-static int x2000_dmic2_pins[] = { 0x57, };
-static int x2000_dmic3_pins[] = { 0x58, };
+static int x2000_dmic_if0_pins[] = { 0x54, 0x55, };
+static int x2000_dmic_if1_pins[] = { 0x56, };
+static int x2000_dmic_if2_pins[] = { 0x57, };
+static int x2000_dmic_if3_pins[] = { 0x58, };
 static int x2000_cim_8bit_pins[] = {
 	0x0e, 0x0c, 0x0d, 0x4f,
 	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
@@ -2545,17 +2559,21 @@ static const struct group_desc x2000_groups[] = {
 	INGENIC_PIN_GROUP("uart7-data-c", x2000_uart7_data_c, 3),
 	INGENIC_PIN_GROUP("uart8-data", x2000_uart8_data, 3),
 	INGENIC_PIN_GROUP("uart9-data", x2000_uart9_data, 3),
-	INGENIC_PIN_GROUP("sfc0-d", x2000_sfc0_d, 1),
-	INGENIC_PIN_GROUP("sfc0-e", x2000_sfc0_e, 0),
-	INGENIC_PIN_GROUP("sfc1", x2000_sfc1, 1),
+	INGENIC_PIN_GROUP("sfc-data-if0-d", x2000_sfc_data_if0_d, 1),
+	INGENIC_PIN_GROUP("sfc-data-if0-e", x2000_sfc_data_if0_e, 0),
+	INGENIC_PIN_GROUP("sfc-data-if1", x2000_sfc_data_if1, 1),
+	INGENIC_PIN_GROUP("sfc-clk-d", x2000_sfc_clk_d, 1),
+	INGENIC_PIN_GROUP("sfc-clk-e", x2000_sfc_clk_e, 0),
+	INGENIC_PIN_GROUP("sfc-ce-d", x2000_sfc_ce_d, 1),
+	INGENIC_PIN_GROUP("sfc-ce-e", x2000_sfc_ce_e, 0),
 	INGENIC_PIN_GROUP("ssi0-dt-b", x2000_ssi0_dt_b, 1),
 	INGENIC_PIN_GROUP("ssi0-dt-d", x2000_ssi0_dt_d, 1),
 	INGENIC_PIN_GROUP("ssi0-dr-b", x2000_ssi0_dr_b, 1),
 	INGENIC_PIN_GROUP("ssi0-dr-d", x2000_ssi0_dr_d, 1),
 	INGENIC_PIN_GROUP("ssi0-clk-b", x2000_ssi0_clk_b, 1),
 	INGENIC_PIN_GROUP("ssi0-clk-d", x2000_ssi0_clk_d, 1),
-	INGENIC_PIN_GROUP("ssi0-ce0-b", x2000_ssi0_ce0_b, 1),
-	INGENIC_PIN_GROUP("ssi0-ce0-d", x2000_ssi0_ce0_d, 1),
+	INGENIC_PIN_GROUP("ssi0-ce-b", x2000_ssi0_ce_b, 1),
+	INGENIC_PIN_GROUP("ssi0-ce-d", x2000_ssi0_ce_d, 1),
 	INGENIC_PIN_GROUP("ssi1-dt-c", x2000_ssi1_dt_c, 2),
 	INGENIC_PIN_GROUP("ssi1-dt-d", x2000_ssi1_dt_d, 2),
 	INGENIC_PIN_GROUP("ssi1-dt-e", x2000_ssi1_dt_e, 1),
@@ -2565,9 +2583,9 @@ static const struct group_desc x2000_groups[] = {
 	INGENIC_PIN_GROUP("ssi1-clk-c", x2000_ssi1_clk_c, 2),
 	INGENIC_PIN_GROUP("ssi1-clk-d", x2000_ssi1_clk_d, 2),
 	INGENIC_PIN_GROUP("ssi1-clk-e", x2000_ssi1_clk_e, 1),
-	INGENIC_PIN_GROUP("ssi1-ce0-c", x2000_ssi1_ce0_c, 2),
-	INGENIC_PIN_GROUP("ssi1-ce0-d", x2000_ssi1_ce0_d, 2),
-	INGENIC_PIN_GROUP("ssi1-ce0-e", x2000_ssi1_ce0_e, 1),
+	INGENIC_PIN_GROUP("ssi1-ce-c", x2000_ssi1_ce_c, 2),
+	INGENIC_PIN_GROUP("ssi1-ce-d", x2000_ssi1_ce_d, 2),
+	INGENIC_PIN_GROUP("ssi1-ce-e", x2000_ssi1_ce_e, 1),
 	INGENIC_PIN_GROUP("mmc0-1bit", x2000_mmc0_1bit, 0),
 	INGENIC_PIN_GROUP("mmc0-4bit", x2000_mmc0_4bit, 0),
 	INGENIC_PIN_GROUP("mmc0-8bit", x2000_mmc0_8bit, 0),
@@ -2612,10 +2630,10 @@ static const struct group_desc x2000_groups[] = {
 	INGENIC_PIN_GROUP("i2s3-data-tx3", x2000_i2s3_data_tx3, 2),
 	INGENIC_PIN_GROUP("i2s3-clk-tx", x2000_i2s3_clk_tx, 2),
 	INGENIC_PIN_GROUP("i2s3-sysclk-tx", x2000_i2s3_sysclk_tx, 2),
-	INGENIC_PIN_GROUP("dmic0", x2000_dmic0, 0),
-	INGENIC_PIN_GROUP("dmic1", x2000_dmic1, 0),
-	INGENIC_PIN_GROUP("dmic2", x2000_dmic2, 0),
-	INGENIC_PIN_GROUP("dmic3", x2000_dmic3, 0),
+	INGENIC_PIN_GROUP("dmic-if0", x2000_dmic_if0, 0),
+	INGENIC_PIN_GROUP("dmic-if1", x2000_dmic_if1, 0),
+	INGENIC_PIN_GROUP("dmic-if2", x2000_dmic_if2, 0),
+	INGENIC_PIN_GROUP("dmic-if3", x2000_dmic_if3, 0),
 	INGENIC_PIN_GROUP_FUNCS("cim-data-8bit", x2000_cim_8bit,
 				x2000_cim_8bit_funcs),
 	INGENIC_PIN_GROUP("cim-data-12bit", x2000_cim_12bit, 0),
@@ -2670,18 +2688,21 @@ static const char *x2000_uart6_groups[] = { "uart6-data-a", "uart6-data-c", };
 static const char *x2000_uart7_groups[] = { "uart7-data-a", "uart7-data-c", };
 static const char *x2000_uart8_groups[] = { "uart8-data", };
 static const char *x2000_uart9_groups[] = { "uart9-data", };
-static const char *x2000_sfc_groups[] = { "sfc0-d", "sfc0-e", "sfc1", };
+static const char *x2000_sfc_groups[] = {
+	"sfc-data-if0-d", "sfc-data-if0-e", "sfc-data-if1",
+	"sfc-clk-d", "sfc-clk-e", "sfc-ce-d", "sfc-ce-e",
+};
 static const char *x2000_ssi0_groups[] = {
 	"ssi0-dt-b", "ssi0-dt-d",
 	"ssi0-dr-b", "ssi0-dr-d",
 	"ssi0-clk-b", "ssi0-clk-d",
-	"ssi0-ce0-b", "ssi0-ce0-d",
+	"ssi0-ce-b", "ssi0-ce-d",
 };
 static const char *x2000_ssi1_groups[] = {
 	"ssi1-dt-c", "ssi1-dt-d", "ssi1-dt-e",
 	"ssi1-dr-c", "ssi1-dr-d", "ssi1-dr-e",
 	"ssi1-clk-c", "ssi1-clk-d", "ssi1-clk-e",
-	"ssi1-ce0-c", "ssi1-ce0-d", "ssi1-ce0-e",
+	"ssi1-ce-c", "ssi1-ce-d", "ssi1-ce-e",
 };
 static const char *x2000_mmc0_groups[] = { "mmc0-1bit", "mmc0-4bit", "mmc0-8bit", };
 static const char *x2000_mmc1_groups[] = { "mmc1-1bit", "mmc1-4bit", };
@@ -2711,7 +2732,9 @@ static const char *x2000_i2s3_groups[] = {
 	"i2s3-data-tx0", "i2s3-data-tx1", "i2s3-data-tx2", "i2s3-data-tx3",
 	"i2s3-clk-tx", "i2s3-sysclk-tx",
 };
-static const char *x2000_dmic_groups[] = { "dmic0", "dmic1", "dmic2", "dmic3", };
+static const char *x2000_dmic_groups[] = {
+	"dmic-if0", "dmic-if1", "dmic-if2", "dmic-if3",
+};
 static const char *x2000_cim_groups[] = { "cim-data-8bit", "cim-data-12bit", };
 static const char *x2000_lcd_groups[] = {
 	"lcd-tft-8bit", "lcd-tft-16bit", "lcd-tft-18bit", "lcd-tft-24bit",
@@ -3654,19 +3677,19 @@ static const struct regmap_config ingenic_pinctrl_regmap_config = {
 	.reg_stride = 4,
 };
 
-static const struct of_device_id ingenic_gpio_of_match[] __initconst = {
-	{ .compatible = "ingenic,jz4730-gpio", },
-	{ .compatible = "ingenic,jz4740-gpio", },
-	{ .compatible = "ingenic,jz4725b-gpio", },
-	{ .compatible = "ingenic,jz4750-gpio", },
-	{ .compatible = "ingenic,jz4755-gpio", },
-	{ .compatible = "ingenic,jz4760-gpio", },
-	{ .compatible = "ingenic,jz4770-gpio", },
-	{ .compatible = "ingenic,jz4775-gpio", },
-	{ .compatible = "ingenic,jz4780-gpio", },
-	{ .compatible = "ingenic,x1000-gpio", },
-	{ .compatible = "ingenic,x1830-gpio", },
-	{ .compatible = "ingenic,x2000-gpio", },
+static const struct of_device_id ingenic_gpio_of_matches[] __initconst = {
+	{ .compatible = "ingenic,jz4730-gpio" },
+	{ .compatible = "ingenic,jz4740-gpio" },
+	{ .compatible = "ingenic,jz4725b-gpio" },
+	{ .compatible = "ingenic,jz4750-gpio" },
+	{ .compatible = "ingenic,jz4755-gpio" },
+	{ .compatible = "ingenic,jz4760-gpio" },
+	{ .compatible = "ingenic,jz4770-gpio" },
+	{ .compatible = "ingenic,jz4775-gpio" },
+	{ .compatible = "ingenic,jz4780-gpio" },
+	{ .compatible = "ingenic,x1000-gpio" },
+	{ .compatible = "ingenic,x1830-gpio" },
+	{ .compatible = "ingenic,x2000-gpio" },
 	{},
 };
 
@@ -3843,7 +3866,7 @@ static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, jzpc->map);
 
 	for_each_child_of_node(dev->of_node, node) {
-		if (of_match_node(ingenic_gpio_of_match, node)) {
+		if (of_match_node(ingenic_gpio_of_matches, node)) {
 			err = ingenic_gpio_probe(jzpc, node);
 			if (err) {
 				of_node_put(node);
@@ -3857,7 +3880,7 @@ static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
 
 #define IF_ENABLED(cfg, ptr)	PTR_IF(IS_ENABLED(cfg), (ptr))
 
-static const struct of_device_id ingenic_pinctrl_of_match[] = {
+static const struct of_device_id ingenic_pinctrl_of_matches[] = {
 	{
 		.compatible = "ingenic,jz4730-pinctrl",
 		.data = IF_ENABLED(CONFIG_MACH_JZ4730, &jz4730_chip_info)
@@ -3928,7 +3951,7 @@ static const struct of_device_id ingenic_pinctrl_of_match[] = {
 static struct platform_driver ingenic_pinctrl_driver = {
 	.driver = {
 		.name = "pinctrl-ingenic",
-		.of_match_table = ingenic_pinctrl_of_match,
+		.of_match_table = ingenic_pinctrl_of_matches,
 	},
 };
 
-- 
2.7.4

