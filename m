Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDE2111F8DD
	for <lists+linux-mips@lfdr.de>; Sun, 15 Dec 2019 17:23:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726445AbfLOQVW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 15 Dec 2019 11:21:22 -0500
Received: from out28-1.mail.aliyun.com ([115.124.28.1]:34691 "EHLO
        out28-1.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726135AbfLOQVW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 15 Dec 2019 11:21:22 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436282|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.517458-0.00300237-0.479539;DS=CONTINUE|ham_system_inform|0.17236-0.000220336-0.82742;FP=0|0|0|0|0|-1|-1|-1;HT=e01a16370;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.GHgOK.D_1576426866;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GHgOK.D_1576426866)
          by smtp.aliyun-inc.com(10.147.41.143);
          Mon, 16 Dec 2019 00:21:14 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, paul@crapouillou.net,
        mark.rutland@arm.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, linus.walleij@linaro.org
Subject: [PATCH v8 1/5] pinctrl: Ingenic: Fix bugs in X1000 and X1500.
Date:   Mon, 16 Dec 2019 00:21:00 +0800
Message-Id: <1576426864-35348-3-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576426864-35348-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1576426864-35348-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.Fix the pullup parameter of X1000.
2.X1000 and X1500 have only one set of uart1 hwflow pin mapping,
  so modify "uart1_hwflow_d" to "uart1_hwflow".
3.X1000 has only one set of mmc1 pin mapping, so modify
  "mmc1-1bit-e/mmc1-4bit-e" to "mmc1-1bit/mmc1-4bit".
4.X1000 has only one regular externel memory controller that
  does not support nand flash, so change "nemc_" to "emc_".
5.X1500 has only one set of mmc, so modify "mmc0_" to "mmc_".

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v1->v2:
    Modify "nemc_" to "emc_" because X1000 has only one regular externel
    memory controller that does not support nand flash.
    
    v2->v3:
    No change.
    
    v3->v4:
    No change.
    
    v4->v5:
    No change.
    
    v5->v6:
    No change.
    
    v6->v7:
    Change my Signed-off-by from "Zhou Yanjie <zhouyanjie@zoho.com>"
    to "周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>" because
    the old mailbox is in an unstable state.
    
    v7->v8:
    No change.

 drivers/pinctrl/pinctrl-ingenic.c | 94 +++++++++++++++++++--------------------
 1 file changed, 47 insertions(+), 47 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 24e0e2e..87643e4 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -1022,7 +1022,7 @@ static const struct ingenic_chip_info jz4780_chip_info = {
 };
 
 static const u32 x1000_pull_ups[4] = {
-	0xffffffff, 0x8dffffff, 0x7d3fffff, 0xffffffff,
+	0xffffffff, 0xfdffffff, 0x0dffffff, 0x0000003f,
 };
 
 static const u32 x1000_pull_downs[4] = {
@@ -1033,7 +1033,7 @@ static int x1000_uart0_data_pins[] = { 0x4a, 0x4b, };
 static int x1000_uart0_hwflow_pins[] = { 0x4c, 0x4d, };
 static int x1000_uart1_data_a_pins[] = { 0x04, 0x05, };
 static int x1000_uart1_data_d_pins[] = { 0x62, 0x63, };
-static int x1000_uart1_hwflow_d_pins[] = { 0x64, 0x65, };
+static int x1000_uart1_hwflow_pins[] = { 0x64, 0x65, };
 static int x1000_uart2_data_a_pins[] = { 0x02, 0x03, };
 static int x1000_uart2_data_d_pins[] = { 0x65, 0x64, };
 static int x1000_mmc0_1bit_pins[] = { 0x18, 0x19, 0x17, };
@@ -1041,20 +1041,20 @@ static int x1000_mmc0_4bit_pins[] = { 0x16, 0x15, 0x14, };
 static int x1000_mmc0_8bit_pins[] = { 0x13, 0x12, 0x11, 0x10, };
 static int x1000_mmc1_1bit_pins[] = { 0x40, 0x41, 0x42, };
 static int x1000_mmc1_4bit_pins[] = { 0x43, 0x44, 0x45, };
-static int x1000_nemc_8bit_data_pins[] = {
+static int x1000_emc_8bit_data_pins[] = {
 	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
 };
-static int x1000_nemc_16bit_data_pins[] = {
+static int x1000_emc_16bit_data_pins[] = {
 	0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
 };
-static int x1000_nemc_addr_pins[] = {
+static int x1000_emc_addr_pins[] = {
 	0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27,
 	0x28, 0x29, 0x2a, 0x2b, 0x2c, 0x2d, 0x2e, 0x2f,
 };
-static int x1000_nemc_rd_we_pins[] = { 0x30, 0x31, };
-static int x1000_nemc_wait_pins[] = { 0x34, };
-static int x1000_nemc_cs1_pins[] = { 0x32, };
-static int x1000_nemc_cs2_pins[] = { 0x33, };
+static int x1000_emc_rd_we_pins[] = { 0x30, 0x31, };
+static int x1000_emc_wait_pins[] = { 0x34, };
+static int x1000_emc_cs1_pins[] = { 0x32, };
+static int x1000_emc_cs2_pins[] = { 0x33, };
 static int x1000_i2c0_pins[] = { 0x38, 0x37, };
 static int x1000_i2c1_a_pins[] = { 0x01, 0x00, };
 static int x1000_i2c1_c_pins[] = { 0x5b, 0x5a, };
@@ -1083,7 +1083,7 @@ static int x1000_uart0_data_funcs[] = { 0, 0, };
 static int x1000_uart0_hwflow_funcs[] = { 0, 0, };
 static int x1000_uart1_data_a_funcs[] = { 2, 2, };
 static int x1000_uart1_data_d_funcs[] = { 1, 1, };
-static int x1000_uart1_hwflow_d_funcs[] = { 1, 1, };
+static int x1000_uart1_hwflow_funcs[] = { 1, 1, };
 static int x1000_uart2_data_a_funcs[] = { 2, 2, };
 static int x1000_uart2_data_d_funcs[] = { 0, 0, };
 static int x1000_mmc0_1bit_funcs[] = { 1, 1, 1, };
@@ -1091,15 +1091,15 @@ static int x1000_mmc0_4bit_funcs[] = { 1, 1, 1, };
 static int x1000_mmc0_8bit_funcs[] = { 1, 1, 1, 1, 1, };
 static int x1000_mmc1_1bit_funcs[] = { 0, 0, 0, };
 static int x1000_mmc1_4bit_funcs[] = { 0, 0, 0, };
-static int x1000_nemc_8bit_data_funcs[] = { 0, 0, 0, 0, 0, 0, 0, 0, };
-static int x1000_nemc_16bit_data_funcs[] = { 0, 0, 0, 0, 0, 0, 0, 0, };
-static int x1000_nemc_addr_funcs[] = {
+static int x1000_emc_8bit_data_funcs[] = { 0, 0, 0, 0, 0, 0, 0, 0, };
+static int x1000_emc_16bit_data_funcs[] = { 0, 0, 0, 0, 0, 0, 0, 0, };
+static int x1000_emc_addr_funcs[] = {
 	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
 };
-static int x1000_nemc_rd_we_funcs[] = { 0, 0, };
-static int x1000_nemc_wait_funcs[] = { 0, };
-static int x1000_nemc_cs1_funcs[] = { 0, };
-static int x1000_nemc_cs2_funcs[] = { 0, };
+static int x1000_emc_rd_we_funcs[] = { 0, 0, };
+static int x1000_emc_wait_funcs[] = { 0, };
+static int x1000_emc_cs1_funcs[] = { 0, };
+static int x1000_emc_cs2_funcs[] = { 0, };
 static int x1000_i2c0_funcs[] = { 0, 0, };
 static int x1000_i2c1_a_funcs[] = { 2, 2, };
 static int x1000_i2c1_c_funcs[] = { 0, 0, };
@@ -1121,7 +1121,7 @@ static const struct group_desc x1000_groups[] = {
 	INGENIC_PIN_GROUP("uart0-hwflow", x1000_uart0_hwflow),
 	INGENIC_PIN_GROUP("uart1-data-a", x1000_uart1_data_a),
 	INGENIC_PIN_GROUP("uart1-data-d", x1000_uart1_data_d),
-	INGENIC_PIN_GROUP("uart1-hwflow-d", x1000_uart1_hwflow_d),
+	INGENIC_PIN_GROUP("uart1-hwflow", x1000_uart1_hwflow),
 	INGENIC_PIN_GROUP("uart2-data-a", x1000_uart2_data_a),
 	INGENIC_PIN_GROUP("uart2-data-d", x1000_uart2_data_d),
 	INGENIC_PIN_GROUP("mmc0-1bit", x1000_mmc0_1bit),
@@ -1129,13 +1129,13 @@ static const struct group_desc x1000_groups[] = {
 	INGENIC_PIN_GROUP("mmc0-8bit", x1000_mmc0_8bit),
 	INGENIC_PIN_GROUP("mmc1-1bit", x1000_mmc1_1bit),
 	INGENIC_PIN_GROUP("mmc1-4bit", x1000_mmc1_4bit),
-	INGENIC_PIN_GROUP("nemc-8bit-data", x1000_nemc_8bit_data),
-	INGENIC_PIN_GROUP("nemc-16bit-data", x1000_nemc_16bit_data),
-	INGENIC_PIN_GROUP("nemc-addr", x1000_nemc_addr),
-	INGENIC_PIN_GROUP("nemc-rd-we", x1000_nemc_rd_we),
-	INGENIC_PIN_GROUP("nemc-wait", x1000_nemc_wait),
-	INGENIC_PIN_GROUP("nemc-cs1", x1000_nemc_cs1),
-	INGENIC_PIN_GROUP("nemc-cs2", x1000_nemc_cs2),
+	INGENIC_PIN_GROUP("emc-8bit-data", x1000_emc_8bit_data),
+	INGENIC_PIN_GROUP("emc-16bit-data", x1000_emc_16bit_data),
+	INGENIC_PIN_GROUP("emc-addr", x1000_emc_addr),
+	INGENIC_PIN_GROUP("emc-rd-we", x1000_emc_rd_we),
+	INGENIC_PIN_GROUP("emc-wait", x1000_emc_wait),
+	INGENIC_PIN_GROUP("emc-cs1", x1000_emc_cs1),
+	INGENIC_PIN_GROUP("emc-cs2", x1000_emc_cs2),
 	INGENIC_PIN_GROUP("i2c0-data", x1000_i2c0),
 	INGENIC_PIN_GROUP("i2c1-data-a", x1000_i2c1_a),
 	INGENIC_PIN_GROUP("i2c1-data-c", x1000_i2c1_c),
@@ -1154,21 +1154,21 @@ static const struct group_desc x1000_groups[] = {
 
 static const char *x1000_uart0_groups[] = { "uart0-data", "uart0-hwflow", };
 static const char *x1000_uart1_groups[] = {
-	"uart1-data-a", "uart1-data-d", "uart1-hwflow-d",
+	"uart1-data-a", "uart1-data-d", "uart1-hwflow",
 };
 static const char *x1000_uart2_groups[] = { "uart2-data-a", "uart2-data-d", };
 static const char *x1000_mmc0_groups[] = {
 	"mmc0-1bit", "mmc0-4bit", "mmc0-8bit",
 };
 static const char *x1000_mmc1_groups[] = {
-	"mmc1-1bit-e", "mmc1-4bit-e",
+	"mmc1-1bit", "mmc1-4bit",
 };
-static const char *x1000_nemc_groups[] = {
-	"nemc-8bit-data", "nemc-16bit-data",
-	"nemc-addr", "nemc-rd-we", "nemc-wait",
+static const char *x1000_emc_groups[] = {
+	"emc-8bit-data", "emc-16bit-data",
+	"emc-addr", "emc-rd-we", "emc-wait",
 };
-static const char *x1000_cs1_groups[] = { "nemc-cs1", };
-static const char *x1000_cs2_groups[] = { "nemc-cs2", };
+static const char *x1000_cs1_groups[] = { "emc-cs1", };
+static const char *x1000_cs2_groups[] = { "emc-cs2", };
 static const char *x1000_i2c0_groups[] = { "i2c0-data", };
 static const char *x1000_i2c1_groups[] = { "i2c1-data-a", "i2c1-data-c", };
 static const char *x1000_i2c2_groups[] = { "i2c2-data", };
@@ -1189,9 +1189,9 @@ static const struct function_desc x1000_functions[] = {
 	{ "uart2", x1000_uart2_groups, ARRAY_SIZE(x1000_uart2_groups), },
 	{ "mmc0", x1000_mmc0_groups, ARRAY_SIZE(x1000_mmc0_groups), },
 	{ "mmc1", x1000_mmc1_groups, ARRAY_SIZE(x1000_mmc1_groups), },
-	{ "nemc", x1000_nemc_groups, ARRAY_SIZE(x1000_nemc_groups), },
-	{ "nemc-cs1", x1000_cs1_groups, ARRAY_SIZE(x1000_cs1_groups), },
-	{ "nemc-cs2", x1000_cs2_groups, ARRAY_SIZE(x1000_cs2_groups), },
+	{ "emc", x1000_emc_groups, ARRAY_SIZE(x1000_emc_groups), },
+	{ "emc-cs1", x1000_cs1_groups, ARRAY_SIZE(x1000_cs1_groups), },
+	{ "emc-cs2", x1000_cs2_groups, ARRAY_SIZE(x1000_cs2_groups), },
 	{ "i2c0", x1000_i2c0_groups, ARRAY_SIZE(x1000_i2c0_groups), },
 	{ "i2c1", x1000_i2c1_groups, ARRAY_SIZE(x1000_i2c1_groups), },
 	{ "i2c2", x1000_i2c2_groups, ARRAY_SIZE(x1000_i2c2_groups), },
@@ -1229,11 +1229,11 @@ static int x1500_uart0_data_pins[] = { 0x4a, 0x4b, };
 static int x1500_uart0_hwflow_pins[] = { 0x4c, 0x4d, };
 static int x1500_uart1_data_a_pins[] = { 0x04, 0x05, };
 static int x1500_uart1_data_d_pins[] = { 0x62, 0x63, };
-static int x1500_uart1_hwflow_d_pins[] = { 0x64, 0x65, };
+static int x1500_uart1_hwflow_pins[] = { 0x64, 0x65, };
 static int x1500_uart2_data_a_pins[] = { 0x02, 0x03, };
 static int x1500_uart2_data_d_pins[] = { 0x65, 0x64, };
-static int x1500_mmc0_1bit_pins[] = { 0x18, 0x19, 0x17, };
-static int x1500_mmc0_4bit_pins[] = { 0x16, 0x15, 0x14, };
+static int x1500_mmc_1bit_pins[] = { 0x18, 0x19, 0x17, };
+static int x1500_mmc_4bit_pins[] = { 0x16, 0x15, 0x14, };
 static int x1500_i2c0_pins[] = { 0x38, 0x37, };
 static int x1500_i2c1_a_pins[] = { 0x01, 0x00, };
 static int x1500_i2c1_c_pins[] = { 0x5b, 0x5a, };
@@ -1252,11 +1252,11 @@ static int x1500_uart0_data_funcs[] = { 0, 0, };
 static int x1500_uart0_hwflow_funcs[] = { 0, 0, };
 static int x1500_uart1_data_a_funcs[] = { 2, 2, };
 static int x1500_uart1_data_d_funcs[] = { 1, 1, };
-static int x1500_uart1_hwflow_d_funcs[] = { 1, 1, };
+static int x1500_uart1_hwflow_funcs[] = { 1, 1, };
 static int x1500_uart2_data_a_funcs[] = { 2, 2, };
 static int x1500_uart2_data_d_funcs[] = { 0, 0, };
-static int x1500_mmc0_1bit_funcs[] = { 1, 1, 1, };
-static int x1500_mmc0_4bit_funcs[] = { 1, 1, 1, };
+static int x1500_mmc_1bit_funcs[] = { 1, 1, 1, };
+static int x1500_mmc_4bit_funcs[] = { 1, 1, 1, };
 static int x1500_i2c0_funcs[] = { 0, 0, };
 static int x1500_i2c1_a_funcs[] = { 2, 2, };
 static int x1500_i2c1_c_funcs[] = { 0, 0, };
@@ -1273,11 +1273,11 @@ static const struct group_desc x1500_groups[] = {
 	INGENIC_PIN_GROUP("uart0-hwflow", x1500_uart0_hwflow),
 	INGENIC_PIN_GROUP("uart1-data-a", x1500_uart1_data_a),
 	INGENIC_PIN_GROUP("uart1-data-d", x1500_uart1_data_d),
-	INGENIC_PIN_GROUP("uart1-hwflow-d", x1500_uart1_hwflow_d),
+	INGENIC_PIN_GROUP("uart1-hwflow", x1500_uart1_hwflow),
 	INGENIC_PIN_GROUP("uart2-data-a", x1500_uart2_data_a),
 	INGENIC_PIN_GROUP("uart2-data-d", x1500_uart2_data_d),
-	INGENIC_PIN_GROUP("mmc0-1bit", x1500_mmc0_1bit),
-	INGENIC_PIN_GROUP("mmc0-4bit", x1500_mmc0_4bit),
+	INGENIC_PIN_GROUP("mmc-1bit", x1500_mmc_1bit),
+	INGENIC_PIN_GROUP("mmc-4bit", x1500_mmc_4bit),
 	INGENIC_PIN_GROUP("i2c0-data", x1500_i2c0),
 	INGENIC_PIN_GROUP("i2c1-data-a", x1500_i2c1_a),
 	INGENIC_PIN_GROUP("i2c1-data-c", x1500_i2c1_c),
@@ -1293,10 +1293,10 @@ static const struct group_desc x1500_groups[] = {
 
 static const char *x1500_uart0_groups[] = { "uart0-data", "uart0-hwflow", };
 static const char *x1500_uart1_groups[] = {
-	"uart1-data-a", "uart1-data-d", "uart1-hwflow-d",
+	"uart1-data-a", "uart1-data-d", "uart1-hwflow",
 };
 static const char *x1500_uart2_groups[] = { "uart2-data-a", "uart2-data-d", };
-static const char *x1500_mmc0_groups[] = { "mmc0-1bit", "mmc0-4bit", };
+static const char *x1500_mmc_groups[] = { "mmc-1bit", "mmc-4bit", };
 static const char *x1500_i2c0_groups[] = { "i2c0-data", };
 static const char *x1500_i2c1_groups[] = { "i2c1-data-a", "i2c1-data-c", };
 static const char *x1500_i2c2_groups[] = { "i2c2-data", };
@@ -1312,7 +1312,7 @@ static const struct function_desc x1500_functions[] = {
 	{ "uart0", x1500_uart0_groups, ARRAY_SIZE(x1500_uart0_groups), },
 	{ "uart1", x1500_uart1_groups, ARRAY_SIZE(x1500_uart1_groups), },
 	{ "uart2", x1500_uart2_groups, ARRAY_SIZE(x1500_uart2_groups), },
-	{ "mmc0", x1500_mmc0_groups, ARRAY_SIZE(x1500_mmc0_groups), },
+	{ "mmc", x1500_mmc_groups, ARRAY_SIZE(x1500_mmc_groups), },
 	{ "i2c0", x1500_i2c0_groups, ARRAY_SIZE(x1500_i2c0_groups), },
 	{ "i2c1", x1500_i2c1_groups, ARRAY_SIZE(x1500_i2c1_groups), },
 	{ "i2c2", x1500_i2c2_groups, ARRAY_SIZE(x1500_i2c2_groups), },
-- 
2.7.4

