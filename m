Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A25553D4557
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jul 2021 08:37:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234120AbhGXF4x (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Jul 2021 01:56:53 -0400
Received: from out28-1.mail.aliyun.com ([115.124.28.1]:52603 "EHLO
        out28-1.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234001AbhGXF4t (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 24 Jul 2021 01:56:49 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.08010397|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.308076-0.00040167-0.691522;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047213;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.Kpjyp2k_1627108627;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Kpjyp2k_1627108627)
          by smtp.aliyun-inc.com(10.147.43.95);
          Sat, 24 Jul 2021 14:37:19 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linus.walleij@linaro.org
Cc:     robh+dt@kernel.org, paul@crapouillou.net,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com
Subject: [PATCH 4/4] pinctrl: Ingenic: Add pinctrl driver for X2100.
Date:   Sat, 24 Jul 2021 14:36:44 +0800
Message-Id: <1627108604-91304-5-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627108604-91304-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1627108604-91304-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add support for probing the pinctrl-ingenic driver on the
X2100 SoC from Ingenic.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 216 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 216 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index f88bccf..cd296d9 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -104,6 +104,7 @@ enum jz_version {
 	ID_X1500,
 	ID_X1830,
 	ID_X2000,
+	ID_X2100,
 };
 
 struct ingenic_chip_info {
@@ -2980,6 +2981,216 @@ static const struct ingenic_chip_info x2000_chip_info = {
 	.pull_downs = x2000_pull_downs,
 };
 
+static const u32 x2100_pull_ups[5] = {
+	0x0003ffff, 0xffffffff, 0x1ff0ffff, 0xc7fe3f3f, 0x0fbf003f,
+};
+
+static const u32 x2100_pull_downs[5] = {
+	0x0003ffff, 0xffffffff, 0x1ff0ffff, 0x00000000, 0x0fbf003f,
+};
+
+static int x2100_mac_pins[] = {
+	0x4b, 0x47, 0x46, 0x4a, 0x43, 0x42, 0x4c, 0x4d, 0x4f, 0x41,
+};
+
+static const struct group_desc x2100_groups[] = {
+	INGENIC_PIN_GROUP("uart0-data", x2000_uart0_data, 2),
+	INGENIC_PIN_GROUP("uart0-hwflow", x2000_uart0_hwflow, 2),
+	INGENIC_PIN_GROUP("uart1-data", x2000_uart1_data, 1),
+	INGENIC_PIN_GROUP("uart1-hwflow", x2000_uart1_hwflow, 1),
+	INGENIC_PIN_GROUP("uart2-data", x2000_uart2_data, 0),
+	INGENIC_PIN_GROUP("uart3-data-c", x2000_uart3_data_c, 0),
+	INGENIC_PIN_GROUP("uart3-data-d", x2000_uart3_data_d, 1),
+	INGENIC_PIN_GROUP("uart3-hwflow-c", x2000_uart3_hwflow_c, 0),
+	INGENIC_PIN_GROUP("uart3-hwflow-d", x2000_uart3_hwflow_d, 1),
+	INGENIC_PIN_GROUP("uart4-data-a", x2000_uart4_data_a, 1),
+	INGENIC_PIN_GROUP("uart4-data-c", x2000_uart4_data_c, 3),
+	INGENIC_PIN_GROUP("uart4-hwflow-a", x2000_uart4_hwflow_a, 1),
+	INGENIC_PIN_GROUP("uart4-hwflow-c", x2000_uart4_hwflow_c, 3),
+	INGENIC_PIN_GROUP("uart5-data-a", x2000_uart5_data_a, 1),
+	INGENIC_PIN_GROUP("uart5-data-c", x2000_uart5_data_c, 3),
+	INGENIC_PIN_GROUP("uart6-data-a", x2000_uart6_data_a, 1),
+	INGENIC_PIN_GROUP("uart6-data-c", x2000_uart6_data_c, 3),
+	INGENIC_PIN_GROUP("uart7-data-a", x2000_uart7_data_a, 1),
+	INGENIC_PIN_GROUP("uart7-data-c", x2000_uart7_data_c, 3),
+	INGENIC_PIN_GROUP("uart8-data", x2000_uart8_data, 3),
+	INGENIC_PIN_GROUP("uart9-data", x2000_uart9_data, 3),
+	INGENIC_PIN_GROUP("sfc-data-if0-d", x2000_sfc_data_if0_d, 1),
+	INGENIC_PIN_GROUP("sfc-data-if0-e", x2000_sfc_data_if0_e, 0),
+	INGENIC_PIN_GROUP("sfc-data-if1", x2000_sfc_data_if1, 1),
+	INGENIC_PIN_GROUP("sfc-clk-d", x2000_sfc_clk_d, 1),
+	INGENIC_PIN_GROUP("sfc-clk-e", x2000_sfc_clk_e, 0),
+	INGENIC_PIN_GROUP("sfc-ce-d", x2000_sfc_ce_d, 1),
+	INGENIC_PIN_GROUP("sfc-ce-e", x2000_sfc_ce_e, 0),
+	INGENIC_PIN_GROUP("ssi0-dt-b", x2000_ssi0_dt_b, 1),
+	INGENIC_PIN_GROUP("ssi0-dt-d", x2000_ssi0_dt_d, 1),
+	INGENIC_PIN_GROUP("ssi0-dr-b", x2000_ssi0_dr_b, 1),
+	INGENIC_PIN_GROUP("ssi0-dr-d", x2000_ssi0_dr_d, 1),
+	INGENIC_PIN_GROUP("ssi0-clk-b", x2000_ssi0_clk_b, 1),
+	INGENIC_PIN_GROUP("ssi0-clk-d", x2000_ssi0_clk_d, 1),
+	INGENIC_PIN_GROUP("ssi0-ce-b", x2000_ssi0_ce_b, 1),
+	INGENIC_PIN_GROUP("ssi0-ce-d", x2000_ssi0_ce_d, 1),
+	INGENIC_PIN_GROUP("ssi1-dt-c", x2000_ssi1_dt_c, 2),
+	INGENIC_PIN_GROUP("ssi1-dt-d", x2000_ssi1_dt_d, 2),
+	INGENIC_PIN_GROUP("ssi1-dt-e", x2000_ssi1_dt_e, 1),
+	INGENIC_PIN_GROUP("ssi1-dr-c", x2000_ssi1_dr_c, 2),
+	INGENIC_PIN_GROUP("ssi1-dr-d", x2000_ssi1_dr_d, 2),
+	INGENIC_PIN_GROUP("ssi1-dr-e", x2000_ssi1_dr_e, 1),
+	INGENIC_PIN_GROUP("ssi1-clk-c", x2000_ssi1_clk_c, 2),
+	INGENIC_PIN_GROUP("ssi1-clk-d", x2000_ssi1_clk_d, 2),
+	INGENIC_PIN_GROUP("ssi1-clk-e", x2000_ssi1_clk_e, 1),
+	INGENIC_PIN_GROUP("ssi1-ce-c", x2000_ssi1_ce_c, 2),
+	INGENIC_PIN_GROUP("ssi1-ce-d", x2000_ssi1_ce_d, 2),
+	INGENIC_PIN_GROUP("ssi1-ce-e", x2000_ssi1_ce_e, 1),
+	INGENIC_PIN_GROUP("mmc0-1bit", x2000_mmc0_1bit, 0),
+	INGENIC_PIN_GROUP("mmc0-4bit", x2000_mmc0_4bit, 0),
+	INGENIC_PIN_GROUP("mmc0-8bit", x2000_mmc0_8bit, 0),
+	INGENIC_PIN_GROUP("mmc1-1bit", x2000_mmc1_1bit, 0),
+	INGENIC_PIN_GROUP("mmc1-4bit", x2000_mmc1_4bit, 0),
+	INGENIC_PIN_GROUP("mmc2-1bit", x2000_mmc2_1bit, 0),
+	INGENIC_PIN_GROUP("mmc2-4bit", x2000_mmc2_4bit, 0),
+	INGENIC_PIN_GROUP("emc-8bit-data", x2000_emc_8bit_data, 0),
+	INGENIC_PIN_GROUP("emc-16bit-data", x2000_emc_16bit_data, 0),
+	INGENIC_PIN_GROUP("emc-addr", x2000_emc_addr, 0),
+	INGENIC_PIN_GROUP("emc-rd-we", x2000_emc_rd_we, 0),
+	INGENIC_PIN_GROUP("emc-wait", x2000_emc_wait, 0),
+	INGENIC_PIN_GROUP("emc-cs1", x2000_emc_cs1, 3),
+	INGENIC_PIN_GROUP("emc-cs2", x2000_emc_cs2, 3),
+	INGENIC_PIN_GROUP("i2c0-data", x2000_i2c0, 3),
+	INGENIC_PIN_GROUP("i2c1-data-c", x2000_i2c1_c, 2),
+	INGENIC_PIN_GROUP("i2c1-data-d", x2000_i2c1_d, 1),
+	INGENIC_PIN_GROUP("i2c2-data-b", x2000_i2c2_b, 2),
+	INGENIC_PIN_GROUP("i2c2-data-d", x2000_i2c2_d, 2),
+	INGENIC_PIN_GROUP("i2c2-data-e", x2000_i2c2_e, 1),
+	INGENIC_PIN_GROUP("i2c3-data-a", x2000_i2c3_a, 0),
+	INGENIC_PIN_GROUP("i2c3-data-d", x2000_i2c3_d, 1),
+	INGENIC_PIN_GROUP("i2c4-data-c", x2000_i2c4_c, 1),
+	INGENIC_PIN_GROUP("i2c4-data-d", x2000_i2c4_d, 2),
+	INGENIC_PIN_GROUP("i2c5-data-c", x2000_i2c5_c, 1),
+	INGENIC_PIN_GROUP("i2c5-data-d", x2000_i2c5_d, 1),
+	INGENIC_PIN_GROUP("i2s1-data-tx", x2000_i2s1_data_tx, 2),
+	INGENIC_PIN_GROUP("i2s1-data-rx", x2000_i2s1_data_rx, 2),
+	INGENIC_PIN_GROUP("i2s1-clk-tx", x2000_i2s1_clk_tx, 2),
+	INGENIC_PIN_GROUP("i2s1-clk-rx", x2000_i2s1_clk_rx, 2),
+	INGENIC_PIN_GROUP("i2s1-sysclk-tx", x2000_i2s1_sysclk_tx, 2),
+	INGENIC_PIN_GROUP("i2s1-sysclk-rx", x2000_i2s1_sysclk_rx, 2),
+	INGENIC_PIN_GROUP("i2s2-data-rx0", x2000_i2s2_data_rx0, 2),
+	INGENIC_PIN_GROUP("i2s2-data-rx1", x2000_i2s2_data_rx1, 2),
+	INGENIC_PIN_GROUP("i2s2-data-rx2", x2000_i2s2_data_rx2, 2),
+	INGENIC_PIN_GROUP("i2s2-data-rx3", x2000_i2s2_data_rx3, 2),
+	INGENIC_PIN_GROUP("i2s2-clk-rx", x2000_i2s2_clk_rx, 2),
+	INGENIC_PIN_GROUP("i2s2-sysclk-rx", x2000_i2s2_sysclk_rx, 2),
+	INGENIC_PIN_GROUP("i2s3-data-tx0", x2000_i2s3_data_tx0, 2),
+	INGENIC_PIN_GROUP("i2s3-data-tx1", x2000_i2s3_data_tx1, 2),
+	INGENIC_PIN_GROUP("i2s3-data-tx2", x2000_i2s3_data_tx2, 2),
+	INGENIC_PIN_GROUP("i2s3-data-tx3", x2000_i2s3_data_tx3, 2),
+	INGENIC_PIN_GROUP("i2s3-clk-tx", x2000_i2s3_clk_tx, 2),
+	INGENIC_PIN_GROUP("i2s3-sysclk-tx", x2000_i2s3_sysclk_tx, 2),
+	INGENIC_PIN_GROUP("dmic-if0", x2000_dmic_if0, 0),
+	INGENIC_PIN_GROUP("dmic-if1", x2000_dmic_if1, 0),
+	INGENIC_PIN_GROUP("dmic-if2", x2000_dmic_if2, 0),
+	INGENIC_PIN_GROUP("dmic-if3", x2000_dmic_if3, 0),
+	INGENIC_PIN_GROUP_FUNCS("cim-data-8bit", x2000_cim_8bit,
+				x2000_cim_8bit_funcs),
+	INGENIC_PIN_GROUP("cim-data-12bit", x2000_cim_12bit, 0),
+	INGENIC_PIN_GROUP("lcd-tft-8bit", x2000_lcd_tft_8bit, 1),
+	INGENIC_PIN_GROUP("lcd-tft-16bit", x2000_lcd_tft_16bit, 1),
+	INGENIC_PIN_GROUP("lcd-tft-18bit", x2000_lcd_tft_18bit, 1),
+	INGENIC_PIN_GROUP("lcd-tft-24bit", x2000_lcd_tft_24bit, 1),
+	INGENIC_PIN_GROUP("lcd-slcd-8bit", x2000_lcd_slcd_8bit, 2),
+	INGENIC_PIN_GROUP("lcd-slcd-16bit", x2000_lcd_tft_16bit, 2),
+	INGENIC_PIN_GROUP("pwm0-c", x2000_pwm_pwm0_c, 0),
+	INGENIC_PIN_GROUP("pwm0-d", x2000_pwm_pwm0_d, 2),
+	INGENIC_PIN_GROUP("pwm1-c", x2000_pwm_pwm1_c, 0),
+	INGENIC_PIN_GROUP("pwm1-d", x2000_pwm_pwm1_d, 2),
+	INGENIC_PIN_GROUP("pwm2-c", x2000_pwm_pwm2_c, 0),
+	INGENIC_PIN_GROUP("pwm2-e", x2000_pwm_pwm2_e, 1),
+	INGENIC_PIN_GROUP("pwm3-c", x2000_pwm_pwm3_c, 0),
+	INGENIC_PIN_GROUP("pwm3-e", x2000_pwm_pwm3_e, 1),
+	INGENIC_PIN_GROUP("pwm4-c", x2000_pwm_pwm4_c, 0),
+	INGENIC_PIN_GROUP("pwm4-e", x2000_pwm_pwm4_e, 1),
+	INGENIC_PIN_GROUP("pwm5-c", x2000_pwm_pwm5_c, 0),
+	INGENIC_PIN_GROUP("pwm5-e", x2000_pwm_pwm5_e, 1),
+	INGENIC_PIN_GROUP("pwm6-c", x2000_pwm_pwm6_c, 0),
+	INGENIC_PIN_GROUP("pwm6-e", x2000_pwm_pwm6_e, 1),
+	INGENIC_PIN_GROUP("pwm7-c", x2000_pwm_pwm7_c, 0),
+	INGENIC_PIN_GROUP("pwm7-e", x2000_pwm_pwm7_e, 1),
+	INGENIC_PIN_GROUP("pwm8", x2000_pwm_pwm8, 0),
+	INGENIC_PIN_GROUP("pwm9", x2000_pwm_pwm9, 0),
+	INGENIC_PIN_GROUP("pwm10", x2000_pwm_pwm10, 0),
+	INGENIC_PIN_GROUP("pwm11", x2000_pwm_pwm11, 0),
+	INGENIC_PIN_GROUP("pwm12", x2000_pwm_pwm12, 0),
+	INGENIC_PIN_GROUP("pwm13", x2000_pwm_pwm13, 0),
+	INGENIC_PIN_GROUP("pwm14", x2000_pwm_pwm14, 0),
+	INGENIC_PIN_GROUP("pwm15", x2000_pwm_pwm15, 0),
+	INGENIC_PIN_GROUP("mac", x2100_mac, 1),
+};
+
+static const char *x2100_mac_groups[] = { "mac", };
+
+static const struct function_desc x2100_functions[] = {
+	{ "uart0", x2000_uart0_groups, ARRAY_SIZE(x2000_uart0_groups), },
+	{ "uart1", x2000_uart1_groups, ARRAY_SIZE(x2000_uart1_groups), },
+	{ "uart2", x2000_uart2_groups, ARRAY_SIZE(x2000_uart2_groups), },
+	{ "uart3", x2000_uart3_groups, ARRAY_SIZE(x2000_uart3_groups), },
+	{ "uart4", x2000_uart4_groups, ARRAY_SIZE(x2000_uart4_groups), },
+	{ "uart5", x2000_uart5_groups, ARRAY_SIZE(x2000_uart5_groups), },
+	{ "uart6", x2000_uart6_groups, ARRAY_SIZE(x2000_uart6_groups), },
+	{ "uart7", x2000_uart7_groups, ARRAY_SIZE(x2000_uart7_groups), },
+	{ "uart8", x2000_uart8_groups, ARRAY_SIZE(x2000_uart8_groups), },
+	{ "uart9", x2000_uart9_groups, ARRAY_SIZE(x2000_uart9_groups), },
+	{ "sfc", x2000_sfc_groups, ARRAY_SIZE(x2000_sfc_groups), },
+	{ "ssi0", x2000_ssi0_groups, ARRAY_SIZE(x2000_ssi0_groups), },
+	{ "ssi1", x2000_ssi1_groups, ARRAY_SIZE(x2000_ssi1_groups), },
+	{ "mmc0", x2000_mmc0_groups, ARRAY_SIZE(x2000_mmc0_groups), },
+	{ "mmc1", x2000_mmc1_groups, ARRAY_SIZE(x2000_mmc1_groups), },
+	{ "mmc2", x2000_mmc2_groups, ARRAY_SIZE(x2000_mmc2_groups), },
+	{ "emc", x2000_emc_groups, ARRAY_SIZE(x2000_emc_groups), },
+	{ "emc-cs1", x2000_cs1_groups, ARRAY_SIZE(x2000_cs1_groups), },
+	{ "emc-cs2", x2000_cs2_groups, ARRAY_SIZE(x2000_cs2_groups), },
+	{ "i2c0", x2000_i2c0_groups, ARRAY_SIZE(x2000_i2c0_groups), },
+	{ "i2c1", x2000_i2c1_groups, ARRAY_SIZE(x2000_i2c1_groups), },
+	{ "i2c2", x2000_i2c2_groups, ARRAY_SIZE(x2000_i2c2_groups), },
+	{ "i2c3", x2000_i2c3_groups, ARRAY_SIZE(x2000_i2c3_groups), },
+	{ "i2c4", x2000_i2c4_groups, ARRAY_SIZE(x2000_i2c4_groups), },
+	{ "i2c5", x2000_i2c5_groups, ARRAY_SIZE(x2000_i2c5_groups), },
+	{ "i2s1", x2000_i2s1_groups, ARRAY_SIZE(x2000_i2s1_groups), },
+	{ "i2s2", x2000_i2s2_groups, ARRAY_SIZE(x2000_i2s2_groups), },
+	{ "i2s3", x2000_i2s3_groups, ARRAY_SIZE(x2000_i2s3_groups), },
+	{ "dmic", x2000_dmic_groups, ARRAY_SIZE(x2000_dmic_groups), },
+	{ "cim", x2000_cim_groups, ARRAY_SIZE(x2000_cim_groups), },
+	{ "lcd", x2000_lcd_groups, ARRAY_SIZE(x2000_lcd_groups), },
+	{ "pwm0", x2000_pwm0_groups, ARRAY_SIZE(x2000_pwm0_groups), },
+	{ "pwm1", x2000_pwm1_groups, ARRAY_SIZE(x2000_pwm1_groups), },
+	{ "pwm2", x2000_pwm2_groups, ARRAY_SIZE(x2000_pwm2_groups), },
+	{ "pwm3", x2000_pwm3_groups, ARRAY_SIZE(x2000_pwm3_groups), },
+	{ "pwm4", x2000_pwm4_groups, ARRAY_SIZE(x2000_pwm4_groups), },
+	{ "pwm5", x2000_pwm5_groups, ARRAY_SIZE(x2000_pwm5_groups), },
+	{ "pwm6", x2000_pwm6_groups, ARRAY_SIZE(x2000_pwm6_groups), },
+	{ "pwm7", x2000_pwm7_groups, ARRAY_SIZE(x2000_pwm7_groups), },
+	{ "pwm8", x2000_pwm8_groups, ARRAY_SIZE(x2000_pwm8_groups), },
+	{ "pwm9", x2000_pwm9_groups, ARRAY_SIZE(x2000_pwm9_groups), },
+	{ "pwm10", x2000_pwm10_groups, ARRAY_SIZE(x2000_pwm10_groups), },
+	{ "pwm11", x2000_pwm11_groups, ARRAY_SIZE(x2000_pwm11_groups), },
+	{ "pwm12", x2000_pwm12_groups, ARRAY_SIZE(x2000_pwm12_groups), },
+	{ "pwm13", x2000_pwm13_groups, ARRAY_SIZE(x2000_pwm13_groups), },
+	{ "pwm14", x2000_pwm14_groups, ARRAY_SIZE(x2000_pwm14_groups), },
+	{ "pwm15", x2000_pwm15_groups, ARRAY_SIZE(x2000_pwm15_groups), },
+	{ "mac", x2100_mac_groups, ARRAY_SIZE(x2100_mac_groups), },
+};
+
+static const struct ingenic_chip_info x2100_chip_info = {
+	.num_chips = 5,
+	.reg_offset = 0x100,
+	.version = ID_X2100,
+	.groups = x2100_groups,
+	.num_groups = ARRAY_SIZE(x2100_groups),
+	.functions = x2100_functions,
+	.num_functions = ARRAY_SIZE(x2100_functions),
+	.pull_ups = x2100_pull_ups,
+	.pull_downs = x2100_pull_downs,
+};
+
 static u32 ingenic_gpio_read_reg(struct ingenic_gpio_chip *jzgc, u8 reg)
 {
 	unsigned int val;
@@ -3845,6 +4056,7 @@ static const struct of_device_id ingenic_gpio_of_matches[] __initconst = {
 	{ .compatible = "ingenic,x1000-gpio" },
 	{ .compatible = "ingenic,x1830-gpio" },
 	{ .compatible = "ingenic,x2000-gpio" },
+	{ .compatible = "ingenic,x2100-gpio" },
 	{},
 };
 
@@ -4100,6 +4312,10 @@ static const struct of_device_id ingenic_pinctrl_of_matches[] = {
 		.compatible = "ingenic,x2000e-pinctrl",
 		.data = IF_ENABLED(CONFIG_MACH_X2000, &x2000_chip_info)
 	},
+	{
+		.compatible = "ingenic,x2100-pinctrl",
+		.data = IF_ENABLED(CONFIG_MACH_X2100, &x2100_chip_info)
+	},
 	{ /* sentinel */ },
 };
 
-- 
2.7.4

