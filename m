Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A8B636360A
	for <lists+linux-mips@lfdr.de>; Sun, 18 Apr 2021 16:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236809AbhDROpW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 18 Apr 2021 10:45:22 -0400
Received: from out28-2.mail.aliyun.com ([115.124.28.2]:45517 "EHLO
        out28-2.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233754AbhDROpT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 18 Apr 2021 10:45:19 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436282|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0882317-0.013957-0.897811;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047211;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.K.sSkG._1618757074;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.K.sSkG._1618757074)
          by smtp.aliyun-inc.com(10.147.40.233);
          Sun, 18 Apr 2021 22:44:46 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linus.walleij@linaro.org, robh+dt@kernel.org, paul@crapouillou.net
Cc:     linux-gpio@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        hns@goldelico.com, paul@boddie.org.uk, andy.shevchenko@gmail.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sernia.zhou@foxmail.com
Subject: [PATCH v6 05/12] pinctrl: Ingenic: Add DMIC pins support for Ingenic SoCs.
Date:   Sun, 18 Apr 2021 22:44:26 +0800
Message-Id: <1618757073-1724-6-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618757073-1724-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1618757073-1724-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.Add DMIC pins support for the JZ4780 SoC.
2.Add DMIC pins support for the X1000 SoC.
3.Add DMIC pins support for the X1500 SoC.
4.Add DMIC pins support for the X1830 SoC.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v6:
    New patch.

 drivers/pinctrl/pinctrl-ingenic.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 8ed62a4..b57433d 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -941,6 +941,7 @@ static int jz4780_i2s_data_rx_pins[] = { 0x86, };
 static int jz4780_i2s_clk_txrx_pins[] = { 0x6c, 0x6d, };
 static int jz4780_i2s_clk_rx_pins[] = { 0x88, 0x89, };
 static int jz4780_i2s_sysclk_pins[] = { 0x85, };
+static int jz4780_dmic_pins[] = { 0x32, 0x33, };
 static int jz4780_hdmi_ddc_pins[] = { 0xb9, 0xb8, };
 
 static u8 jz4780_i2s_clk_txrx_funcs[] = { 1, 0, };
@@ -1039,6 +1040,7 @@ static const struct group_desc jz4780_groups[] = {
 				jz4780_i2s_clk_txrx_funcs),
 	INGENIC_PIN_GROUP("i2s-clk-rx", jz4780_i2s_clk_rx, 1),
 	INGENIC_PIN_GROUP("i2s-sysclk", jz4780_i2s_sysclk, 2),
+	INGENIC_PIN_GROUP("dmic", jz4780_dmic, 1),
 	INGENIC_PIN_GROUP("hdmi-ddc", jz4780_hdmi_ddc, 0),
 	INGENIC_PIN_GROUP("cim-data", jz4770_cim_8bit, 0),
 	INGENIC_PIN_GROUP("cim-data-12bit", jz4770_cim_12bit, 0),
@@ -1095,6 +1097,7 @@ static const char *jz4780_i2c4_groups[] = { "i2c4-data-e", "i2c4-data-f", };
 static const char *jz4780_i2s_groups[] = {
 	"i2s-data-tx", "i2s-data-rx", "i2s-clk-txrx", "i2s-clk-rx", "i2s-sysclk",
 };
+static const char *jz4780_dmic_groups[] = { "dmic", };
 static const char *jz4780_cim_groups[] = { "cim-data", };
 static const char *jz4780_hdmi_ddc_groups[] = { "hdmi-ddc", };
 
@@ -1122,6 +1125,7 @@ static const struct function_desc jz4780_functions[] = {
 	{ "i2c3", jz4780_i2c3_groups, ARRAY_SIZE(jz4780_i2c3_groups), },
 	{ "i2c4", jz4780_i2c4_groups, ARRAY_SIZE(jz4780_i2c4_groups), },
 	{ "i2s", jz4780_i2s_groups, ARRAY_SIZE(jz4780_i2s_groups), },
+	{ "dmic", jz4780_dmic_groups, ARRAY_SIZE(jz4780_dmic_groups), },
 	{ "cim", jz4780_cim_groups, ARRAY_SIZE(jz4780_cim_groups), },
 	{ "lcd", jz4770_lcd_groups, ARRAY_SIZE(jz4770_lcd_groups), },
 	{ "pwm0", jz4770_pwm0_groups, ARRAY_SIZE(jz4770_pwm0_groups), },
@@ -1207,6 +1211,8 @@ static int x1000_i2s_data_tx_pins[] = { 0x24, };
 static int x1000_i2s_data_rx_pins[] = { 0x23, };
 static int x1000_i2s_clk_txrx_pins[] = { 0x21, 0x22, };
 static int x1000_i2s_sysclk_pins[] = { 0x20, };
+static int x1000_dmic0_pins[] = { 0x35, 0x36, };
+static int x1000_dmic1_pins[] = { 0x25, };
 static int x1000_cim_pins[] = {
 	0x08, 0x09, 0x0a, 0x0b,
 	0x13, 0x12, 0x11, 0x10, 0x0f, 0x0e, 0x0d, 0x0c,
@@ -1272,6 +1278,8 @@ static const struct group_desc x1000_groups[] = {
 	INGENIC_PIN_GROUP("i2s-data-rx", x1000_i2s_data_rx, 1),
 	INGENIC_PIN_GROUP("i2s-clk-txrx", x1000_i2s_clk_txrx, 1),
 	INGENIC_PIN_GROUP("i2s-sysclk", x1000_i2s_sysclk, 1),
+	INGENIC_PIN_GROUP("dmic0", x1000_dmic0, 0),
+	INGENIC_PIN_GROUP("dmic1", x1000_dmic1, 1),
 	INGENIC_PIN_GROUP("cim-data", x1000_cim, 2),
 	INGENIC_PIN_GROUP("lcd-8bit", x1000_lcd_8bit, 1),
 	INGENIC_PIN_GROUP("lcd-16bit", x1000_lcd_16bit, 1),
@@ -1315,6 +1323,7 @@ static const char *x1000_i2c2_groups[] = { "i2c2-data", };
 static const char *x1000_i2s_groups[] = {
 	"i2s-data-tx", "i2s-data-rx", "i2s-clk-txrx", "i2s-sysclk",
 };
+static const char *x1000_dmic_groups[] = { "dmic0", "dmic1", };
 static const char *x1000_cim_groups[] = { "cim-data", };
 static const char *x1000_lcd_groups[] = { "lcd-8bit", "lcd-16bit", };
 static const char *x1000_pwm0_groups[] = { "pwm0", };
@@ -1339,6 +1348,7 @@ static const struct function_desc x1000_functions[] = {
 	{ "i2c1", x1000_i2c1_groups, ARRAY_SIZE(x1000_i2c1_groups), },
 	{ "i2c2", x1000_i2c2_groups, ARRAY_SIZE(x1000_i2c2_groups), },
 	{ "i2s", x1000_i2s_groups, ARRAY_SIZE(x1000_i2s_groups), },
+	{ "dmic", x1000_dmic_groups, ARRAY_SIZE(x1000_dmic_groups), },
 	{ "cim", x1000_cim_groups, ARRAY_SIZE(x1000_cim_groups), },
 	{ "lcd", x1000_lcd_groups, ARRAY_SIZE(x1000_lcd_groups), },
 	{ "pwm0", x1000_pwm0_groups, ARRAY_SIZE(x1000_pwm0_groups), },
@@ -1378,6 +1388,8 @@ static int x1500_i2s_data_tx_pins[] = { 0x24, };
 static int x1500_i2s_data_rx_pins[] = { 0x23, };
 static int x1500_i2s_clk_txrx_pins[] = { 0x21, 0x22, };
 static int x1500_i2s_sysclk_pins[] = { 0x20, };
+static int x1500_dmic0_pins[] = { 0x35, 0x36, };
+static int x1500_dmic1_pins[] = { 0x25, };
 static int x1500_cim_pins[] = {
 	0x08, 0x09, 0x0a, 0x0b,
 	0x13, 0x12, 0x11, 0x10, 0x0f, 0x0e, 0x0d, 0x0c,
@@ -1407,6 +1419,8 @@ static const struct group_desc x1500_groups[] = {
 	INGENIC_PIN_GROUP("i2s-data-rx", x1500_i2s_data_rx, 1),
 	INGENIC_PIN_GROUP("i2s-clk-txrx", x1500_i2s_clk_txrx, 1),
 	INGENIC_PIN_GROUP("i2s-sysclk", x1500_i2s_sysclk, 1),
+	INGENIC_PIN_GROUP("dmic0", x1500_dmic0, 0),
+	INGENIC_PIN_GROUP("dmic1", x1500_dmic1, 1),
 	INGENIC_PIN_GROUP("cim-data", x1500_cim, 2),
 	INGENIC_PIN_GROUP("pwm0", x1500_pwm_pwm0, 0),
 	INGENIC_PIN_GROUP("pwm1", x1500_pwm_pwm1, 1),
@@ -1427,6 +1441,7 @@ static const char *x1500_i2c2_groups[] = { "i2c2-data", };
 static const char *x1500_i2s_groups[] = {
 	"i2s-data-tx", "i2s-data-rx", "i2s-clk-txrx", "i2s-sysclk",
 };
+static const char *x1500_dmic_groups[] = { "dmic0", "dmic1", };
 static const char *x1500_cim_groups[] = { "cim-data", };
 static const char *x1500_pwm0_groups[] = { "pwm0", };
 static const char *x1500_pwm1_groups[] = { "pwm1", };
@@ -1444,6 +1459,7 @@ static const struct function_desc x1500_functions[] = {
 	{ "i2c1", x1500_i2c1_groups, ARRAY_SIZE(x1500_i2c1_groups), },
 	{ "i2c2", x1500_i2c2_groups, ARRAY_SIZE(x1500_i2c2_groups), },
 	{ "i2s", x1500_i2s_groups, ARRAY_SIZE(x1500_i2s_groups), },
+	{ "dmic", x1500_dmic_groups, ARRAY_SIZE(x1500_dmic_groups), },
 	{ "cim", x1500_cim_groups, ARRAY_SIZE(x1500_cim_groups), },
 	{ "pwm0", x1500_pwm0_groups, ARRAY_SIZE(x1500_pwm0_groups), },
 	{ "pwm1", x1500_pwm1_groups, ARRAY_SIZE(x1500_pwm1_groups), },
@@ -1506,6 +1522,8 @@ static int x1830_i2s_data_rx_pins[] = { 0x54, };
 static int x1830_i2s_clk_txrx_pins[] = { 0x58, 0x52, };
 static int x1830_i2s_clk_rx_pins[] = { 0x56, 0x55, };
 static int x1830_i2s_sysclk_pins[] = { 0x57, };
+static int x1830_dmic0_pins[] = { 0x48, 0x59, };
+static int x1830_dmic1_pins[] = { 0x5a, };
 static int x1830_lcd_tft_8bit_pins[] = {
 	0x62, 0x63, 0x64, 0x65, 0x66, 0x67,
 	0x68, 0x73, 0x72, 0x69,
@@ -1576,6 +1594,8 @@ static const struct group_desc x1830_groups[] = {
 	INGENIC_PIN_GROUP("i2s-clk-txrx", x1830_i2s_clk_txrx, 0),
 	INGENIC_PIN_GROUP("i2s-clk-rx", x1830_i2s_clk_rx, 0),
 	INGENIC_PIN_GROUP("i2s-sysclk", x1830_i2s_sysclk, 0),
+	INGENIC_PIN_GROUP("dmic0", x1830_dmic0, 2),
+	INGENIC_PIN_GROUP("dmic1", x1830_dmic1, 2),
 	INGENIC_PIN_GROUP("lcd-tft-8bit", x1830_lcd_tft_8bit, 0),
 	INGENIC_PIN_GROUP("lcd-tft-24bit", x1830_lcd_tft_24bit, 0),
 	INGENIC_PIN_GROUP("lcd-slcd-8bit", x1830_lcd_slcd_8bit, 1),
@@ -1621,6 +1641,7 @@ static const char *x1830_i2c2_groups[] = { "i2c2-data", };
 static const char *x1830_i2s_groups[] = {
 	"i2s-data-tx", "i2s-data-rx", "i2s-clk-txrx", "i2s-clk-rx", "i2s-sysclk",
 };
+static const char *x1830_dmic_groups[] = { "dmic0", "dmic1", };
 static const char *x1830_lcd_groups[] = {
 	"lcd-tft-8bit", "lcd-tft-24bit", "lcd-slcd-8bit", "lcd-slcd-16bit",
 };
@@ -1646,6 +1667,7 @@ static const struct function_desc x1830_functions[] = {
 	{ "i2c1", x1830_i2c1_groups, ARRAY_SIZE(x1830_i2c1_groups), },
 	{ "i2c2", x1830_i2c2_groups, ARRAY_SIZE(x1830_i2c2_groups), },
 	{ "i2s", x1830_i2s_groups, ARRAY_SIZE(x1830_i2s_groups), },
+	{ "dmic", x1830_dmic_groups, ARRAY_SIZE(x1830_dmic_groups), },
 	{ "lcd", x1830_lcd_groups, ARRAY_SIZE(x1830_lcd_groups), },
 	{ "pwm0", x1830_pwm0_groups, ARRAY_SIZE(x1830_pwm0_groups), },
 	{ "pwm1", x1830_pwm1_groups, ARRAY_SIZE(x1830_pwm1_groups), },
-- 
2.7.4

