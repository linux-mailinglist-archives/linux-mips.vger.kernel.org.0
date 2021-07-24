Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 321883D454D
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jul 2021 08:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233993AbhGXF4r (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Jul 2021 01:56:47 -0400
Received: from out28-1.mail.aliyun.com ([115.124.28.1]:52395 "EHLO
        out28-1.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233965AbhGXF4r (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 24 Jul 2021 01:56:47 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436282|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0896506-0.000217129-0.910132;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047203;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.Kpjyp2k_1627108627;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Kpjyp2k_1627108627)
          by smtp.aliyun-inc.com(10.147.43.95);
          Sat, 24 Jul 2021 14:37:16 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linus.walleij@linaro.org
Cc:     robh+dt@kernel.org, paul@crapouillou.net,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com
Subject: [PATCH 2/4] pinctrl: Ingenic: Add SSI pins support for JZ4755 and JZ4760.
Date:   Sat, 24 Jul 2021 14:36:42 +0800
Message-Id: <1627108604-91304-3-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627108604-91304-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1627108604-91304-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add SSI pins support for the JZ4755 SoC and the
JZ4760 SoC from Ingenic.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 155 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 155 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 1ec05ee..f88bccf 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -589,6 +589,18 @@ static int jz4755_uart0_data_pins[] = { 0x7c, 0x7d, };
 static int jz4755_uart0_hwflow_pins[] = { 0x7e, 0x7f, };
 static int jz4755_uart1_data_pins[] = { 0x97, 0x99, };
 static int jz4755_uart2_data_pins[] = { 0x9f, };
+static int jz4755_ssi_dt_b_pins[] = { 0x3b, };
+static int jz4755_ssi_dt_f_pins[] = { 0xa1, };
+static int jz4755_ssi_dr_b_pins[] = { 0x3c, };
+static int jz4755_ssi_dr_f_pins[] = { 0xa2, };
+static int jz4755_ssi_clk_b_pins[] = { 0x3a, };
+static int jz4755_ssi_clk_f_pins[] = { 0xa0, };
+static int jz4755_ssi_gpc_b_pins[] = { 0x3e, };
+static int jz4755_ssi_gpc_f_pins[] = { 0xa4, };
+static int jz4755_ssi_ce0_b_pins[] = { 0x3d, };
+static int jz4755_ssi_ce0_f_pins[] = { 0xa3, };
+static int jz4755_ssi_ce1_b_pins[] = { 0x3f, };
+static int jz4755_ssi_ce1_f_pins[] = { 0xa5, };
 static int jz4755_mmc0_1bit_pins[] = { 0x2f, 0x50, 0x5c, };
 static int jz4755_mmc0_4bit_pins[] = { 0x5d, 0x5b, 0x51, };
 static int jz4755_mmc1_1bit_pins[] = { 0x3a, 0x3d, 0x3c, };
@@ -630,6 +642,18 @@ static const struct group_desc jz4755_groups[] = {
 	INGENIC_PIN_GROUP("uart0-hwflow", jz4755_uart0_hwflow, 0),
 	INGENIC_PIN_GROUP("uart1-data", jz4755_uart1_data, 0),
 	INGENIC_PIN_GROUP("uart2-data", jz4755_uart2_data, 1),
+	INGENIC_PIN_GROUP("ssi-dt-b", jz4755_ssi_dt_b, 0),
+	INGENIC_PIN_GROUP("ssi-dt-f", jz4755_ssi_dt_f, 0),
+	INGENIC_PIN_GROUP("ssi-dr-b", jz4755_ssi_dr_b, 0),
+	INGENIC_PIN_GROUP("ssi-dr-f", jz4755_ssi_dr_f, 0),
+	INGENIC_PIN_GROUP("ssi-clk-b", jz4755_ssi_clk_b, 0),
+	INGENIC_PIN_GROUP("ssi-clk-f", jz4755_ssi_clk_f, 0),
+	INGENIC_PIN_GROUP("ssi-gpc-b", jz4755_ssi_gpc_b, 0),
+	INGENIC_PIN_GROUP("ssi-gpc-f", jz4755_ssi_gpc_f, 0),
+	INGENIC_PIN_GROUP("ssi-ce0-b", jz4755_ssi_ce0_b, 0),
+	INGENIC_PIN_GROUP("ssi-ce0-f", jz4755_ssi_ce0_f, 0),
+	INGENIC_PIN_GROUP("ssi-ce1-b", jz4755_ssi_ce1_b, 0),
+	INGENIC_PIN_GROUP("ssi-ce1-f", jz4755_ssi_ce1_f, 0),
 	INGENIC_PIN_GROUP_FUNCS("mmc0-1bit", jz4755_mmc0_1bit,
 				jz4755_mmc0_1bit_funcs),
 	INGENIC_PIN_GROUP_FUNCS("mmc0-4bit", jz4755_mmc0_4bit,
@@ -661,6 +685,14 @@ static const struct group_desc jz4755_groups[] = {
 static const char *jz4755_uart0_groups[] = { "uart0-data", "uart0-hwflow", };
 static const char *jz4755_uart1_groups[] = { "uart1-data", };
 static const char *jz4755_uart2_groups[] = { "uart2-data", };
+static const char *jz4755_ssi_groups[] = {
+	"ssi-dt-b", "ssi-dt-f",
+	"ssi-dr-b", "ssi-dr-f",
+	"ssi-clk-b", "ssi-clk-f",
+	"ssi-gpc-b", "ssi-gpc-f",
+	"ssi-ce0-b", "ssi-ce0-f",
+	"ssi-ce1-b", "ssi-ce1-f",
+};
 static const char *jz4755_mmc0_groups[] = { "mmc0-1bit", "mmc0-4bit", };
 static const char *jz4755_mmc1_groups[] = { "mmc0-1bit", "mmc0-4bit", };
 static const char *jz4755_i2c_groups[] = { "i2c-data", };
@@ -683,6 +715,7 @@ static const struct function_desc jz4755_functions[] = {
 	{ "uart0", jz4755_uart0_groups, ARRAY_SIZE(jz4755_uart0_groups), },
 	{ "uart1", jz4755_uart1_groups, ARRAY_SIZE(jz4755_uart1_groups), },
 	{ "uart2", jz4755_uart2_groups, ARRAY_SIZE(jz4755_uart2_groups), },
+	{ "ssi", jz4755_ssi_groups, ARRAY_SIZE(jz4755_ssi_groups), },
 	{ "mmc0", jz4755_mmc0_groups, ARRAY_SIZE(jz4755_mmc0_groups), },
 	{ "mmc1", jz4755_mmc1_groups, ARRAY_SIZE(jz4755_mmc1_groups), },
 	{ "i2c", jz4755_i2c_groups, ARRAY_SIZE(jz4755_i2c_groups), },
@@ -725,6 +758,58 @@ static int jz4760_uart2_data_pins[] = { 0x5c, 0x5e, };
 static int jz4760_uart2_hwflow_pins[] = { 0x5d, 0x5f, };
 static int jz4760_uart3_data_pins[] = { 0x6c, 0x85, };
 static int jz4760_uart3_hwflow_pins[] = { 0x88, 0x89, };
+static int jz4760_ssi0_dt_a_pins[] = { 0x15, };
+static int jz4760_ssi0_dt_b_pins[] = { 0x35, };
+static int jz4760_ssi0_dt_d_pins[] = { 0x75, };
+static int jz4760_ssi0_dt_e_pins[] = { 0x91, };
+static int jz4760_ssi0_dr_a_pins[] = { 0x14, };
+static int jz4760_ssi0_dr_b_pins[] = { 0x34, };
+static int jz4760_ssi0_dr_d_pins[] = { 0x74, };
+static int jz4760_ssi0_dr_e_pins[] = { 0x8e, };
+static int jz4760_ssi0_clk_a_pins[] = { 0x12, };
+static int jz4760_ssi0_clk_b_pins[] = { 0x3c, };
+static int jz4760_ssi0_clk_d_pins[] = { 0x78, };
+static int jz4760_ssi0_clk_e_pins[] = { 0x8f, };
+static int jz4760_ssi0_gpc_b_pins[] = { 0x3e, };
+static int jz4760_ssi0_gpc_d_pins[] = { 0x76, };
+static int jz4760_ssi0_gpc_e_pins[] = { 0x93, };
+static int jz4760_ssi0_ce0_a_pins[] = { 0x13, };
+static int jz4760_ssi0_ce0_b_pins[] = { 0x3d, };
+static int jz4760_ssi0_ce0_d_pins[] = { 0x79, };
+static int jz4760_ssi0_ce0_e_pins[] = { 0x90, };
+static int jz4760_ssi0_ce1_b_pins[] = { 0x3f, };
+static int jz4760_ssi0_ce1_d_pins[] = { 0x77, };
+static int jz4760_ssi0_ce1_e_pins[] = { 0x92, };
+static int jz4760_ssi1_dt_b_9_pins[] = { 0x29, };
+static int jz4760_ssi1_dt_b_21_pins[] = { 0x35, };
+static int jz4760_ssi1_dt_d_12_pins[] = { 0x6c, };
+static int jz4760_ssi1_dt_d_21_pins[] = { 0x75, };
+static int jz4760_ssi1_dt_e_pins[] = { 0x91, };
+static int jz4760_ssi1_dt_f_pins[] = { 0xa3, };
+static int jz4760_ssi1_dr_b_6_pins[] = { 0x26, };
+static int jz4760_ssi1_dr_b_20_pins[] = { 0x34, };
+static int jz4760_ssi1_dr_d_13_pins[] = { 0x6d, };
+static int jz4760_ssi1_dr_d_20_pins[] = { 0x74, };
+static int jz4760_ssi1_dr_e_pins[] = { 0x8e, };
+static int jz4760_ssi1_dr_f_pins[] = { 0xa0, };
+static int jz4760_ssi1_clk_b_7_pins[] = { 0x27, };
+static int jz4760_ssi1_clk_b_28_pins[] = { 0x3c, };
+static int jz4760_ssi1_clk_d_pins[] = { 0x78, };
+static int jz4760_ssi1_clk_e_7_pins[] = { 0x87, };
+static int jz4760_ssi1_clk_e_15_pins[] = { 0x8f, };
+static int jz4760_ssi1_clk_f_pins[] = { 0xa2, };
+static int jz4760_ssi1_gpc_b_pins[] = { 0x3e, };
+static int jz4760_ssi1_gpc_d_pins[] = { 0x76, };
+static int jz4760_ssi1_gpc_e_pins[] = { 0x93, };
+static int jz4760_ssi1_ce0_b_8_pins[] = { 0x28, };
+static int jz4760_ssi1_ce0_b_29_pins[] = { 0x3d, };
+static int jz4760_ssi1_ce0_d_pins[] = { 0x79, };
+static int jz4760_ssi1_ce0_e_6_pins[] = { 0x86, };
+static int jz4760_ssi1_ce0_e_16_pins[] = { 0x90, };
+static int jz4760_ssi1_ce0_f_pins[] = { 0xa1, };
+static int jz4760_ssi1_ce1_b_pins[] = { 0x3f, };
+static int jz4760_ssi1_ce1_d_pins[] = { 0x77, };
+static int jz4760_ssi1_ce1_e_pins[] = { 0x92, };
 static int jz4760_mmc0_1bit_a_pins[] = { 0x12, 0x13, 0x14, };
 static int jz4760_mmc0_4bit_a_pins[] = { 0x15, 0x16, 0x17, };
 static int jz4760_mmc0_1bit_e_pins[] = { 0x9c, 0x9d, 0x94, };
@@ -801,6 +886,58 @@ static const struct group_desc jz4760_groups[] = {
 	INGENIC_PIN_GROUP_FUNCS("uart3-data", jz4760_uart3_data,
 				jz4760_uart3_data_funcs),
 	INGENIC_PIN_GROUP("uart3-hwflow", jz4760_uart3_hwflow, 0),
+	INGENIC_PIN_GROUP("ssi0-dt-a", jz4760_ssi0_dt_a, 2),
+	INGENIC_PIN_GROUP("ssi0-dt-b", jz4760_ssi0_dt_b, 1),
+	INGENIC_PIN_GROUP("ssi0-dt-d", jz4760_ssi0_dt_d, 1),
+	INGENIC_PIN_GROUP("ssi0-dt-e", jz4760_ssi0_dt_e, 0),
+	INGENIC_PIN_GROUP("ssi0-dr-a", jz4760_ssi0_dr_a, 1),
+	INGENIC_PIN_GROUP("ssi0-dr-b", jz4760_ssi0_dr_b, 1),
+	INGENIC_PIN_GROUP("ssi0-dr-d", jz4760_ssi0_dr_d, 1),
+	INGENIC_PIN_GROUP("ssi0-dr-e", jz4760_ssi0_dr_e, 0),
+	INGENIC_PIN_GROUP("ssi0-clk-a", jz4760_ssi0_clk_a, 2),
+	INGENIC_PIN_GROUP("ssi0-clk-b", jz4760_ssi0_clk_b, 1),
+	INGENIC_PIN_GROUP("ssi0-clk-d", jz4760_ssi0_clk_d, 1),
+	INGENIC_PIN_GROUP("ssi0-clk-e", jz4760_ssi0_clk_e, 0),
+	INGENIC_PIN_GROUP("ssi0-gpc-b", jz4760_ssi0_gpc_b, 1),
+	INGENIC_PIN_GROUP("ssi0-gpc-d", jz4760_ssi0_gpc_d, 1),
+	INGENIC_PIN_GROUP("ssi0-gpc-e", jz4760_ssi0_gpc_e, 0),
+	INGENIC_PIN_GROUP("ssi0-ce0-a", jz4760_ssi0_ce0_a, 2),
+	INGENIC_PIN_GROUP("ssi0-ce0-b", jz4760_ssi0_ce0_b, 1),
+	INGENIC_PIN_GROUP("ssi0-ce0-d", jz4760_ssi0_ce0_d, 1),
+	INGENIC_PIN_GROUP("ssi0-ce0-e", jz4760_ssi0_ce0_e, 0),
+	INGENIC_PIN_GROUP("ssi0-ce1-b", jz4760_ssi0_ce1_b, 1),
+	INGENIC_PIN_GROUP("ssi0-ce1-d", jz4760_ssi0_ce1_d, 1),
+	INGENIC_PIN_GROUP("ssi0-ce1-e", jz4760_ssi0_ce1_e, 0),
+	INGENIC_PIN_GROUP("ssi1-dt-b-9", jz4760_ssi1_dt_b_9, 2),
+	INGENIC_PIN_GROUP("ssi1-dt-b-21", jz4760_ssi1_dt_b_21, 2),
+	INGENIC_PIN_GROUP("ssi1-dt-d-12", jz4760_ssi1_dt_d_12, 2),
+	INGENIC_PIN_GROUP("ssi1-dt-d-21", jz4760_ssi1_dt_d_21, 2),
+	INGENIC_PIN_GROUP("ssi1-dt-e", jz4760_ssi1_dt_e, 1),
+	INGENIC_PIN_GROUP("ssi1-dt-f", jz4760_ssi1_dt_f, 2),
+	INGENIC_PIN_GROUP("ssi1-dr-b-6", jz4760_ssi1_dr_b_6, 2),
+	INGENIC_PIN_GROUP("ssi1-dr-b-20", jz4760_ssi1_dr_b_20, 2),
+	INGENIC_PIN_GROUP("ssi1-dr-d-13", jz4760_ssi1_dr_d_13, 2),
+	INGENIC_PIN_GROUP("ssi1-dr-d-20", jz4760_ssi1_dr_d_20, 2),
+	INGENIC_PIN_GROUP("ssi1-dr-e", jz4760_ssi1_dr_e, 1),
+	INGENIC_PIN_GROUP("ssi1-dr-f", jz4760_ssi1_dr_f, 2),
+	INGENIC_PIN_GROUP("ssi1-clk-b-7", jz4760_ssi1_clk_b_7, 2),
+	INGENIC_PIN_GROUP("ssi1-clk-b-28", jz4760_ssi1_clk_b_28, 2),
+	INGENIC_PIN_GROUP("ssi1-clk-d", jz4760_ssi1_clk_d, 2),
+	INGENIC_PIN_GROUP("ssi1-clk-e-7", jz4760_ssi1_clk_e_7, 2),
+	INGENIC_PIN_GROUP("ssi1-clk-e-15", jz4760_ssi1_clk_e_15, 1),
+	INGENIC_PIN_GROUP("ssi1-clk-f", jz4760_ssi1_clk_f, 2),
+	INGENIC_PIN_GROUP("ssi1-gpc-b", jz4760_ssi1_gpc_b, 2),
+	INGENIC_PIN_GROUP("ssi1-gpc-d", jz4760_ssi1_gpc_d, 2),
+	INGENIC_PIN_GROUP("ssi1-gpc-e", jz4760_ssi1_gpc_e, 1),
+	INGENIC_PIN_GROUP("ssi1-ce0-b-8", jz4760_ssi1_ce0_b_8, 2),
+	INGENIC_PIN_GROUP("ssi1-ce0-b-29", jz4760_ssi1_ce0_b_29, 2),
+	INGENIC_PIN_GROUP("ssi1-ce0-d", jz4760_ssi1_ce0_d, 2),
+	INGENIC_PIN_GROUP("ssi1-ce0-e-6", jz4760_ssi1_ce0_e_6, 2),
+	INGENIC_PIN_GROUP("ssi1-ce0-e-16", jz4760_ssi1_ce0_e_16, 1),
+	INGENIC_PIN_GROUP("ssi1-ce0-f", jz4760_ssi1_ce0_f, 2),
+	INGENIC_PIN_GROUP("ssi1-ce1-b", jz4760_ssi1_ce1_b, 2),
+	INGENIC_PIN_GROUP("ssi1-ce1-d", jz4760_ssi1_ce1_d, 2),
+	INGENIC_PIN_GROUP("ssi1-ce1-e", jz4760_ssi1_ce1_e, 1),
 	INGENIC_PIN_GROUP_FUNCS("mmc0-1bit-a", jz4760_mmc0_1bit_a,
 				jz4760_mmc0_1bit_a_funcs),
 	INGENIC_PIN_GROUP("mmc0-4bit-a", jz4760_mmc0_4bit_a, 1),
@@ -854,6 +991,22 @@ static const char *jz4760_uart0_groups[] = { "uart0-data", "uart0-hwflow", };
 static const char *jz4760_uart1_groups[] = { "uart1-data", "uart1-hwflow", };
 static const char *jz4760_uart2_groups[] = { "uart2-data", "uart2-hwflow", };
 static const char *jz4760_uart3_groups[] = { "uart3-data", "uart3-hwflow", };
+static const char *jz4760_ssi0_groups[] = {
+	"ssi0-dt-a", "ssi0-dt-b", "ssi0-dt-d", "ssi0-dt-e",
+	"ssi0-dr-a", "ssi0-dr-b", "ssi0-dr-d", "ssi0-dr-e",
+	"ssi0-clk-a", "ssi0-clk-b", "ssi0-clk-d", "ssi0-clk-e",
+	"ssi0-gpc-b", "ssi0-gpc-d", "ssi0-gpc-e",
+	"ssi0-ce0-a", "ssi0-ce0-b", "ssi0-ce0-d", "ssi0-ce0-e",
+	"ssi0-ce1-b", "ssi0-ce1-d", "ssi0-ce1-e",
+};
+static const char *jz4760_ssi1_groups[] = {
+	"ssi1-dt-b-9", "ssi1-dt-b-21", "ssi1-dt-d-12", "ssi1-dt-d-21", "ssi1-dt-e", "ssi1-dt-f",
+	"ssi1-dr-b-6", "ssi1-dr-b-20", "ssi1-dr-d-13", "ssi1-dr-d-20", "ssi1-dr-e", "ssi1-dr-f",
+	"ssi1-clk-b-7", "ssi1-clk-b-28", "ssi1-clk-d", "ssi1-clk-e-7", "ssi1-clk-e-15", "ssi1-clk-f",
+	"ssi1-gpc-b", "ssi1-gpc-d", "ssi1-gpc-e",
+	"ssi1-ce0-b-8", "ssi1-ce0-b-29", "ssi1-ce0-d", "ssi1-ce0-e-6", "ssi1-ce0-e-16", "ssi1-ce0-f",
+	"ssi1-ce1-b", "ssi1-ce1-d", "ssi1-ce1-e",
+};
 static const char *jz4760_mmc0_groups[] = {
 	"mmc0-1bit-a", "mmc0-4bit-a",
 	"mmc0-1bit-e", "mmc0-4bit-e", "mmc0-8bit-e",
@@ -898,6 +1051,8 @@ static const struct function_desc jz4760_functions[] = {
 	{ "uart1", jz4760_uart1_groups, ARRAY_SIZE(jz4760_uart1_groups), },
 	{ "uart2", jz4760_uart2_groups, ARRAY_SIZE(jz4760_uart2_groups), },
 	{ "uart3", jz4760_uart3_groups, ARRAY_SIZE(jz4760_uart3_groups), },
+	{ "ssi0", jz4760_ssi0_groups, ARRAY_SIZE(jz4760_ssi0_groups), },
+	{ "ssi1", jz4760_ssi1_groups, ARRAY_SIZE(jz4760_ssi1_groups), },
 	{ "mmc0", jz4760_mmc0_groups, ARRAY_SIZE(jz4760_mmc0_groups), },
 	{ "mmc1", jz4760_mmc1_groups, ARRAY_SIZE(jz4760_mmc1_groups), },
 	{ "mmc2", jz4760_mmc2_groups, ARRAY_SIZE(jz4760_mmc2_groups), },
-- 
2.7.4

