Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F48033EDC3
	for <lists+linux-mips@lfdr.de>; Wed, 17 Mar 2021 10:59:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230284AbhCQJ6o (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Mar 2021 05:58:44 -0400
Received: from out28-73.mail.aliyun.com ([115.124.28.73]:36917 "EHLO
        out28-73.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230056AbhCQJ6a (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Mar 2021 05:58:30 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436282|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.204403-0.000801116-0.794796;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047212;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.JmJVfKa_1615975087;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.JmJVfKa_1615975087)
          by smtp.aliyun-inc.com(10.147.40.200);
          Wed, 17 Mar 2021 17:58:27 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linus.walleij@linaro.org, robh+dt@kernel.org, paul@crapouillou.net
Cc:     linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        hns@goldelico.com, paul@boddie.org.uk, andy.shevchenko@gmail.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        sernia.zhou@foxmail.com
Subject: [PATCH v3 08/10] pinctrl: Ingenic: Add pinctrl driver for JZ4755.
Date:   Wed, 17 Mar 2021 17:58:02 +0800
Message-Id: <1615975084-68203-9-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615975084-68203-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1615975084-68203-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add support for probing the pinctrl-ingenic driver on the
JZ4755 SoC from Ingenic.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v3:
    New patch.

 drivers/pinctrl/pinctrl-ingenic.c | 132 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index d98767b..d8b37fa 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -86,6 +86,7 @@ enum jz_version {
 	ID_JZ4740,
 	ID_JZ4725B,
 	ID_JZ4750,
+	ID_JZ4755,
 	ID_JZ4760,
 	ID_JZ4770,
 	ID_JZ4780,
@@ -557,6 +558,131 @@ static const struct ingenic_chip_info jz4750_chip_info = {
 	.pull_downs = jz4750_pull_downs,
 };
 
+static const u32 jz4755_pull_ups[6] = {
+	0xffffffff, 0xffffffff, 0x0fffffff, 0xffffffff, 0x33dc3fff, 0x0000fc00,
+};
+
+static const u32 jz4755_pull_downs[6] = {
+	0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
+};
+
+static int jz4755_uart0_data_pins[] = { 0x7c, 0x7d, };
+static int jz4755_uart0_hwflow_pins[] = { 0x7e, 0x7f, };
+static int jz4755_uart1_data_pins[] = { 0x97, 0x99, };
+static int jz4755_uart2_data_pins[] = { 0x9f, };
+static int jz4755_mmc0_1bit_pins[] = { 0x2f, 0x50, 0x5c, };
+static int jz4755_mmc0_4bit_pins[] = { 0x5d, 0x5b, 0x51, };
+static int jz4755_mmc1_1bit_pins[] = { 0x3a, 0x3d, 0x3c, };
+static int jz4755_mmc1_4bit_pins[] = { 0x3b, 0x3e, 0x3f, };
+static int jz4755_i2c_pins[] = { 0x8c, 0x8d, };
+static int jz4755_cim_pins[] = {
+	0x89, 0x8b, 0x8a, 0x88,
+	0x80, 0x81, 0x82, 0x83, 0x84, 0x85, 0x86, 0x87,
+};
+static int jz4755_lcd_24bit_pins[] = {
+	0x60, 0x61, 0x62, 0x63, 0x64, 0x65, 0x66, 0x67,
+	0x68, 0x69, 0x6a, 0x6b, 0x6c, 0x6d, 0x6e, 0x6f,
+	0x70, 0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77,
+	0x78, 0x79, 0x7a, 0x7b,
+};
+static int jz4755_nand_cs1_pins[] = { 0x55, };
+static int jz4755_nand_cs2_pins[] = { 0x56, };
+static int jz4755_nand_cs3_pins[] = { 0x57, };
+static int jz4755_nand_cs4_pins[] = { 0x58, };
+static int jz4755_nand_fre_fwe_pins[] = { 0x5c, 0x5d, };
+static int jz4755_pwm_pwm0_pins[] = { 0x94, };
+static int jz4755_pwm_pwm1_pins[] = { 0xab, };
+static int jz4755_pwm_pwm2_pins[] = { 0x96, };
+static int jz4755_pwm_pwm3_pins[] = { 0x97, };
+static int jz4755_pwm_pwm4_pins[] = { 0x98, };
+static int jz4755_pwm_pwm5_pins[] = { 0x99, };
+
+static u8 jz4755_mmc0_1bit_funcs[] = { 2, 2, 1, };
+static u8 jz4755_mmc0_4bit_funcs[] = { 1, 0, 1, };
+static u8 jz4755_lcd_24bit_funcs[] = {
+	0, 0, 0, 0, 0, 0, 0, 0,
+	0, 0, 0, 0, 0, 0, 0, 0,
+	0, 0, 0, 0, 0, 0, 1, 1,
+	1, 1, 0, 0,
+};
+
+static const struct group_desc jz4755_groups[] = {
+	INGENIC_PIN_GROUP("uart0-data", jz4755_uart0_data, 0),
+	INGENIC_PIN_GROUP("uart0-hwflow", jz4755_uart0_hwflow, 0),
+	INGENIC_PIN_GROUP("uart1-data", jz4755_uart1_data, 0),
+	INGENIC_PIN_GROUP("uart2-data", jz4755_uart2_data, 1),
+	INGENIC_PIN_GROUP_FUNCS("mmc0-1bit", jz4755_mmc0_1bit,
+				jz4755_mmc0_1bit_funcs),
+	INGENIC_PIN_GROUP_FUNCS("mmc0-4bit", jz4755_mmc0_4bit,
+				jz4755_mmc0_4bit_funcs),
+	INGENIC_PIN_GROUP("mmc1-1bit", jz4755_mmc1_1bit, 1),
+	INGENIC_PIN_GROUP("mmc1-4bit", jz4755_mmc1_4bit, 1),
+	INGENIC_PIN_GROUP("i2c-data", jz4755_i2c, 0),
+	INGENIC_PIN_GROUP("cim-data", jz4755_cim, 0),
+	INGENIC_PIN_GROUP_FUNCS("lcd-24bit", jz4755_lcd_24bit,
+				jz4755_lcd_24bit_funcs),
+	{ "lcd-no-pins", },
+	INGENIC_PIN_GROUP("nand-cs1", jz4755_nand_cs1, 0),
+	INGENIC_PIN_GROUP("nand-cs2", jz4755_nand_cs2, 0),
+	INGENIC_PIN_GROUP("nand-cs3", jz4755_nand_cs3, 0),
+	INGENIC_PIN_GROUP("nand-cs4", jz4755_nand_cs4, 0),
+	INGENIC_PIN_GROUP("nand-fre-fwe", jz4755_nand_fre_fwe, 0),
+	INGENIC_PIN_GROUP("pwm0", jz4755_pwm_pwm0, 0),
+	INGENIC_PIN_GROUP("pwm1", jz4755_pwm_pwm1, 1),
+	INGENIC_PIN_GROUP("pwm2", jz4755_pwm_pwm2, 0),
+	INGENIC_PIN_GROUP("pwm3", jz4755_pwm_pwm3, 0),
+	INGENIC_PIN_GROUP("pwm4", jz4755_pwm_pwm4, 0),
+	INGENIC_PIN_GROUP("pwm5", jz4755_pwm_pwm5, 0),
+};
+
+static const char *jz4755_uart0_groups[] = { "uart0-data", "uart0-hwflow", };
+static const char *jz4755_uart1_groups[] = { "uart1-data", };
+static const char *jz4755_uart2_groups[] = { "uart2-data", };
+static const char *jz4755_mmc0_groups[] = { "mmc0-1bit", "mmc0-4bit", };
+static const char *jz4755_mmc1_groups[] = { "mmc0-1bit", "mmc0-4bit", };
+static const char *jz4755_i2c_groups[] = { "i2c-data", };
+static const char *jz4755_cim_groups[] = { "cim-data", };
+static const char *jz4755_lcd_groups[] = { "lcd-24bit", "lcd-no-pins", };
+static const char *jz4755_nand_groups[] = {
+	"nand-cs1", "nand-cs2", "nand-cs3", "nand-cs4", "nand-fre-fwe",
+};
+static const char *jz4755_pwm0_groups[] = { "pwm0", };
+static const char *jz4755_pwm1_groups[] = { "pwm1", };
+static const char *jz4755_pwm2_groups[] = { "pwm2", };
+static const char *jz4755_pwm3_groups[] = { "pwm3", };
+static const char *jz4755_pwm4_groups[] = { "pwm4", };
+static const char *jz4755_pwm5_groups[] = { "pwm5", };
+
+static const struct function_desc jz4755_functions[] = {
+	{ "uart0", jz4755_uart0_groups, ARRAY_SIZE(jz4755_uart0_groups), },
+	{ "uart1", jz4755_uart1_groups, ARRAY_SIZE(jz4755_uart1_groups), },
+	{ "uart2", jz4755_uart2_groups, ARRAY_SIZE(jz4755_uart2_groups), },
+	{ "mmc0", jz4755_mmc0_groups, ARRAY_SIZE(jz4755_mmc0_groups), },
+	{ "mmc1", jz4755_mmc1_groups, ARRAY_SIZE(jz4755_mmc1_groups), },
+	{ "i2c", jz4755_i2c_groups, ARRAY_SIZE(jz4755_i2c_groups), },
+	{ "cim", jz4755_cim_groups, ARRAY_SIZE(jz4755_cim_groups), },
+	{ "lcd", jz4755_lcd_groups, ARRAY_SIZE(jz4755_lcd_groups), },
+	{ "nand", jz4755_nand_groups, ARRAY_SIZE(jz4755_nand_groups), },
+	{ "pwm0", jz4755_pwm0_groups, ARRAY_SIZE(jz4755_pwm0_groups), },
+	{ "pwm1", jz4755_pwm1_groups, ARRAY_SIZE(jz4755_pwm1_groups), },
+	{ "pwm2", jz4755_pwm2_groups, ARRAY_SIZE(jz4755_pwm2_groups), },
+	{ "pwm3", jz4755_pwm3_groups, ARRAY_SIZE(jz4755_pwm3_groups), },
+	{ "pwm4", jz4755_pwm4_groups, ARRAY_SIZE(jz4755_pwm4_groups), },
+	{ "pwm5", jz4755_pwm5_groups, ARRAY_SIZE(jz4755_pwm5_groups), },
+};
+
+static const struct ingenic_chip_info jz4755_chip_info = {
+	.num_chips = 6,
+	.reg_offset = 0x100,
+	.version = ID_JZ4755,
+	.groups = jz4755_groups,
+	.num_groups = ARRAY_SIZE(jz4755_groups),
+	.functions = jz4755_functions,
+	.num_functions = ARRAY_SIZE(jz4755_functions),
+	.pull_ups = jz4755_pull_ups,
+	.pull_downs = jz4755_pull_downs,
+};
+
 static const u32 jz4760_pull_ups[6] = {
 	0xffffffff, 0xfffcf3ff, 0xffffffff, 0xffffcfff, 0xfffffb7c, 0xfffff00f,
 };
@@ -2646,6 +2772,7 @@ static const struct of_device_id ingenic_gpio_of_match[] __initconst = {
 	{ .compatible = "ingenic,jz4740-gpio", },
 	{ .compatible = "ingenic,jz4725b-gpio", },
 	{ .compatible = "ingenic,jz4750-gpio", },
+	{ .compatible = "ingenic,jz4755-gpio", },
 	{ .compatible = "ingenic,jz4760-gpio", },
 	{ .compatible = "ingenic,jz4770-gpio", },
 	{ .compatible = "ingenic,jz4780-gpio", },
@@ -2853,6 +2980,11 @@ static const struct of_device_id ingenic_pinctrl_of_match[] = {
 		.compatible = "ingenic,jz4750-pinctrl",
 		.data = IF_ENABLED(CONFIG_MACH_JZ4750, &jz4750_chip_info)
 	},
+	{
+		.compatible = "ingenic,jz4755-pinctrl",
+		.data = IF_ENABLED(CONFIG_MACH_JZ4755, &jz4755_chip_info)
+	},
+	{
 		.compatible = "ingenic,jz4760-pinctrl",
 		.data = IF_ENABLED(CONFIG_MACH_JZ4760, &jz4760_chip_info)
 	},
-- 
2.7.4

