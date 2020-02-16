Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D90B61603D2
	for <lists+linux-mips@lfdr.de>; Sun, 16 Feb 2020 12:17:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728078AbgBPLRx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 16 Feb 2020 06:17:53 -0500
Received: from out28-147.mail.aliyun.com ([115.124.28.147]:33014 "EHLO
        out28-147.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726651AbgBPLRw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 16 Feb 2020 06:17:52 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436282|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.60061-0.00204115-0.397349;DS=CONTINUE|ham_regular_dialog|0.144715-0.000279746-0.855005;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03293;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=8;RT=8;SR=0;TI=SMTPD_---.GodzYLk_1581851850;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GodzYLk_1581851850)
          by smtp.aliyun-inc.com(10.147.41.121);
          Sun, 16 Feb 2020 19:17:39 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        paul@crapouillou.net, linus.walleij@linaro.org,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com,
        dongsheng.qiu@ingenic.com
Subject: [PATCH] pinctrl: Ingenic: Add missing parts for X1830.
Date:   Sun, 16 Feb 2020 19:17:08 +0800
Message-Id: <1581851828-3493-3-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581851828-3493-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1581851828-3493-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add lcd pinctrl driver for X1830.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 96f04d1..f4b415e 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -1437,6 +1437,19 @@ static int x1830_mmc1_4bit_pins[] = { 0x45, 0x46, 0x47, };
 static int x1830_i2c0_pins[] = { 0x0c, 0x0d, };
 static int x1830_i2c1_pins[] = { 0x39, 0x3a, };
 static int x1830_i2c2_pins[] = { 0x5b, 0x5c, };
+static int x1830_lcd_rgb_18bit_pins[] = {
+	0x62, 0x63, 0x64, 0x65, 0x66, 0x67,
+	0x68, 0x69, 0x6c, 0x6d, 0x6e, 0x6f,
+	0x70, 0x71, 0x72, 0x73, 0x76, 0x77,
+	0x78, 0x79, 0x7a, 0x7b,
+};
+static int x1830_lcd_slcd_8bit_pins[] = {
+	0x62, 0x63, 0x64, 0x65, 0x66, 0x67, 0x6c, 0x6d,
+	0x69, 0x72, 0x73, 0x7b, 0x7a,
+};
+static int x1830_lcd_slcd_16bit_pins[] = {
+	0x6e, 0x6f, 0x70, 0x71, 0x76, 0x77, 0x78, 0x79,
+};
 static int x1830_pwm_pwm0_b_pins[] = { 0x31, };
 static int x1830_pwm_pwm0_c_pins[] = { 0x4b, };
 static int x1830_pwm_pwm1_b_pins[] = { 0x32, };
@@ -1486,6 +1499,16 @@ static int x1830_mmc1_4bit_funcs[] = { 0, 0, 0, };
 static int x1830_i2c0_funcs[] = { 1, 1, };
 static int x1830_i2c1_funcs[] = { 0, 0, };
 static int x1830_i2c2_funcs[] = { 1, 1, };
+static int x1830_lcd_rgb_18bit_funcs[] = {
+	0, 0, 0, 0, 0, 0,
+	0, 0, 0, 0, 0, 0,
+	0, 0, 0, 0, 0, 0,
+	0, 0, 0, 0,
+};
+static int x1830_lcd_slcd_8bit_funcs[] = {
+	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+};
+static int x1830_lcd_slcd_16bit_funcs[] = { 1, 1, 1, 1, 1, 1, 1, 1, };
 static int x1830_pwm_pwm0_b_funcs[] = { 0, };
 static int x1830_pwm_pwm0_c_funcs[] = { 1, };
 static int x1830_pwm_pwm1_b_funcs[] = { 0, };
@@ -1534,6 +1557,10 @@ static const struct group_desc x1830_groups[] = {
 	INGENIC_PIN_GROUP("i2c0-data", x1830_i2c0),
 	INGENIC_PIN_GROUP("i2c1-data", x1830_i2c1),
 	INGENIC_PIN_GROUP("i2c2-data", x1830_i2c2),
+	INGENIC_PIN_GROUP("lcd-rgb-18bit", x1830_lcd_rgb_18bit),
+	INGENIC_PIN_GROUP("lcd-slcd-8bit", x1830_lcd_slcd_8bit),
+	INGENIC_PIN_GROUP("lcd-slcd-16bit", x1830_lcd_slcd_16bit),
+	{ "lcd-no-pins", },
 	INGENIC_PIN_GROUP("pwm0-b", x1830_pwm_pwm0_b),
 	INGENIC_PIN_GROUP("pwm0-c", x1830_pwm_pwm0_c),
 	INGENIC_PIN_GROUP("pwm1-b", x1830_pwm_pwm1_b),
@@ -1572,6 +1599,9 @@ static const char *x1830_mmc1_groups[] = { "mmc1-1bit", "mmc1-4bit", };
 static const char *x1830_i2c0_groups[] = { "i2c0-data", };
 static const char *x1830_i2c1_groups[] = { "i2c1-data", };
 static const char *x1830_i2c2_groups[] = { "i2c2-data", };
+static const char *x1830_lcd_groups[] = {
+	"lcd-rgb-18bit", "lcd-slcd-8bit", "lcd-slcd-16bit", "lcd-no-pins",
+};
 static const char *x1830_pwm0_groups[] = { "pwm0-b", "pwm0-c", };
 static const char *x1830_pwm1_groups[] = { "pwm1-b", "pwm1-c", };
 static const char *x1830_pwm2_groups[] = { "pwm2-c-8", "pwm2-c-13", };
@@ -1593,6 +1623,7 @@ static const struct function_desc x1830_functions[] = {
 	{ "i2c0", x1830_i2c0_groups, ARRAY_SIZE(x1830_i2c0_groups), },
 	{ "i2c1", x1830_i2c1_groups, ARRAY_SIZE(x1830_i2c1_groups), },
 	{ "i2c2", x1830_i2c2_groups, ARRAY_SIZE(x1830_i2c2_groups), },
+	{ "lcd", x1830_lcd_groups, ARRAY_SIZE(x1830_lcd_groups), },
 	{ "pwm0", x1830_pwm0_groups, ARRAY_SIZE(x1830_pwm0_groups), },
 	{ "pwm1", x1830_pwm1_groups, ARRAY_SIZE(x1830_pwm1_groups), },
 	{ "pwm2", x1830_pwm2_groups, ARRAY_SIZE(x1830_pwm2_groups), },
-- 
2.7.4

