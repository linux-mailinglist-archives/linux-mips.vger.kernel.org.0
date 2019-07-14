Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A65667E10
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jul 2019 09:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbfGNHO2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 14 Jul 2019 03:14:28 -0400
Received: from sender-pp-o92.zoho.com ([135.84.80.237]:25441 "EHLO
        sender-pp-o92.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726756AbfGNHO2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 14 Jul 2019 03:14:28 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1563087559; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=L4Z/fBDUVft6JdVEF8oEsDur7LnICzpsTtIIOjT67oja0IaZm86Sqw2YXtlmWcDfv7BHzklvNpbKLvgq92/+z/jHovg1uLLdZYjRNhk6QKvo06dwwZiSsr8ZRT81rRdgsw1EkEUCzArZQLZQ/v+o8p4b8ZQkO3PR4zpFpVLg8wY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1563087559; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=c5cG3HXWY3IylMLOLUOUc1HqbW9QEvHahf5tChUYxzs=; 
        b=eUhLTZT9l6S5JG3tSwsfrRF2orXq9AFlkwCdSCE8vtuytNEGDvJN660Uf3dYHyN3jVOt4hsZ1ti/IOJQsKvemilkpg3wEmTBBFrZ4HxzOQwjm9qAMSieFJRoIwkDES+sA9ovUhww0RCpsF8qL5OGj8ETdnVoWRJ8IbSTEdYFrGw=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=HEe2jCuWq06EtjV3EnfsG0TUWQOReMut8EnjBRrexIq+uihm57SQWkh9mzdetRGQMHP194Ce/Kri
    /mqJjNn2SLN5ig1a168A9pyFdNecFwYRg/FOjC6B/yDeMdY3yX4P  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1563087559;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=7433; bh=c5cG3HXWY3IylMLOLUOUc1HqbW9QEvHahf5tChUYxzs=;
        b=gJdFpe52wHcW+FA7n9eoJHZYUSqH6mVJmlu5zLFyv1b0kLWhw+wNFWBJ/+J4DJu9
        8/eid/UZa6EPMUKzZxJae+6EHbD5mvK+0yBU1ZCHn0Iyh2pwtwS/DXJofOPlDQrfqGF
        o+1ULTEKjXmkcWkqMsFX5bARRN2aUOgv1mpzLmpM=
Received: from zhouyanjie-virtual-machine.localdomain (125.71.5.36 [125.71.5.36]) by mx.zohomail.com
        with SMTPS id 1563087558238275.29348659637753; Sat, 13 Jul 2019 23:59:18 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, paul.burton@mips.com,
        linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Subject: [PATCH 6/6] pinctrl: Ingenic: Add pinctrl driver for X1500.
Date:   Sun, 14 Jul 2019 11:53:56 +0800
Message-Id: <1563076436-5338-7-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563076436-5338-1-git-send-email-zhouyanjie@zoho.com>
References: <1563076436-5338-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add support for probing the pinctrl-ingenic driver on the
X1500 Soc from Ingenic.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 118 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 117 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 5bb4ae5..6e26830 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -3,6 +3,7 @@
  * Ingenic SoCs pinctrl driver
  *
  * Copyright (c) 2017 Paul Cercueil <paul@crapouillou.net>
+ * Copyright (c) 2019 Zhou Yanjie <zhouyanjie@zoho.com>
  */
 
 #include <linux/compiler.h>
@@ -58,6 +59,7 @@ enum jz_version {
 	ID_JZ4780,
 	ID_X1000,
 	ID_X1000E,
+	ID_X1500,
 };
 
 struct ingenic_chip_info {
@@ -1218,6 +1220,116 @@ static const struct ingenic_chip_info x1000e_chip_info = {
 	.pull_downs = x1000_pull_downs,
 };
 
+static int x1500_uart0_data_pins[] = { 0x4a, 0x4b, };
+static int x1500_uart0_hwflow_pins[] = { 0x4c, 0x4d, };
+static int x1500_uart1_data_a_pins[] = { 0x04, 0x05, };
+static int x1500_uart1_data_d_pins[] = { 0x62, 0x63, };
+static int x1500_uart1_hwflow_d_pins[] = { 0x64, 0x65, };
+static int x1500_uart2_data_a_pins[] = { 0x02, 0x03, };
+static int x1500_uart2_data_d_pins[] = { 0x65, 0x64, };
+static int x1500_mmc0_1bit_pins[] = { 0x18, 0x19, 0x17, };
+static int x1500_mmc0_4bit_pins[] = { 0x16, 0x15, 0x14, };
+static int x1500_i2c0_pins[] = { 0x38, 0x37, };
+static int x1500_i2c1_a_pins[] = { 0x01, 0x00, };
+static int x1500_i2c1_c_pins[] = { 0x5b, 0x5a, };
+static int x1500_i2c2_pins[] = { 0x61, 0x60, };
+static int x1500_cim_pins[] = {
+	0x08, 0x09, 0x0a, 0x0b,
+	0x13, 0x12, 0x11, 0x10, 0x0f, 0x0e, 0x0d, 0x0c,
+};
+static int x1500_pwm_pwm0_pins[] = { 0x59, };
+static int x1500_pwm_pwm1_pins[] = { 0x5a, };
+static int x1500_pwm_pwm2_pins[] = { 0x5b, };
+static int x1500_pwm_pwm3_pins[] = { 0x26, };
+static int x1500_pwm_pwm4_pins[] = { 0x58, };
+
+static int x1500_uart0_data_funcs[] = { 0, 0, };
+static int x1500_uart0_hwflow_funcs[] = { 0, 0, };
+static int x1500_uart1_data_a_funcs[] = { 2, 2, };
+static int x1500_uart1_data_d_funcs[] = { 1, 1, };
+static int x1500_uart1_hwflow_d_funcs[] = { 1, 1, };
+static int x1500_uart2_data_a_funcs[] = { 2, 2, };
+static int x1500_uart2_data_d_funcs[] = { 0, 0, };
+static int x1500_mmc0_1bit_funcs[] = { 1, 1, 1, };
+static int x1500_mmc0_4bit_funcs[] = { 1, 1, 1, };
+static int x1500_i2c0_funcs[] = { 0, 0, };
+static int x1500_i2c1_a_funcs[] = { 2, 2, };
+static int x1500_i2c1_c_funcs[] = { 0, 0, };
+static int x1500_i2c2_funcs[] = { 1, 1, };
+static int x1500_cim_funcs[] = { 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, };
+static int x1500_pwm_pwm0_funcs[] = { 0, };
+static int x1500_pwm_pwm1_funcs[] = { 1, };
+static int x1500_pwm_pwm2_funcs[] = { 1, };
+static int x1500_pwm_pwm3_funcs[] = { 2, };
+static int x1500_pwm_pwm4_funcs[] = { 0, };
+
+static const struct group_desc x1500_groups[] = {
+	INGENIC_PIN_GROUP("uart0-data", x1500_uart0_data),
+	INGENIC_PIN_GROUP("uart0-hwflow", x1500_uart0_hwflow),
+	INGENIC_PIN_GROUP("uart1-data-a", x1500_uart1_data_a),
+	INGENIC_PIN_GROUP("uart1-data-d", x1500_uart1_data_d),
+	INGENIC_PIN_GROUP("uart1-hwflow-d", x1500_uart1_hwflow_d),
+	INGENIC_PIN_GROUP("uart2-data-a", x1500_uart2_data_a),
+	INGENIC_PIN_GROUP("uart2-data-d", x1500_uart2_data_d),
+	INGENIC_PIN_GROUP("mmc0-1bit", x1500_mmc0_1bit),
+	INGENIC_PIN_GROUP("mmc0-4bit", x1500_mmc0_4bit),
+	INGENIC_PIN_GROUP("i2c0-data", x1500_i2c0),
+	INGENIC_PIN_GROUP("i2c1-data-a", x1500_i2c1_a),
+	INGENIC_PIN_GROUP("i2c1-data-c", x1500_i2c1_c),
+	INGENIC_PIN_GROUP("i2c2-data", x1500_i2c2),
+	INGENIC_PIN_GROUP("cim-data", x1500_cim),
+	{ "lcd-no-pins", },
+	INGENIC_PIN_GROUP("pwm0", x1500_pwm_pwm0),
+	INGENIC_PIN_GROUP("pwm1", x1500_pwm_pwm1),
+	INGENIC_PIN_GROUP("pwm2", x1500_pwm_pwm2),
+	INGENIC_PIN_GROUP("pwm3", x1500_pwm_pwm3),
+	INGENIC_PIN_GROUP("pwm4", x1500_pwm_pwm4),
+};
+
+static const char *x1500_uart0_groups[] = { "uart0-data", "uart0-hwflow", };
+static const char *x1500_uart1_groups[] = {
+	"uart1-data-a", "uart1-data-d", "uart1-hwflow-d",
+};
+static const char *x1500_uart2_groups[] = { "uart2-data-a", "uart2-data-d", };
+static const char *x1500_mmc0_groups[] = { "mmc0-1bit", "mmc0-4bit", };
+static const char *x1500_i2c0_groups[] = { "i2c0-data", };
+static const char *x1500_i2c1_groups[] = { "i2c1-data-a", "i2c1-data-c", };
+static const char *x1500_i2c2_groups[] = { "i2c2-data", };
+static const char *x1500_cim_groups[] = { "cim-data", };
+static const char *x1500_lcd_groups[] = { "lcd-no-pins", };
+static const char *x1500_pwm0_groups[] = { "pwm0", };
+static const char *x1500_pwm1_groups[] = { "pwm1", };
+static const char *x1500_pwm2_groups[] = { "pwm2", };
+static const char *x1500_pwm3_groups[] = { "pwm3", };
+static const char *x1500_pwm4_groups[] = { "pwm4", };
+
+static const struct function_desc x1500_functions[] = {
+	{ "uart0", x1500_uart0_groups, ARRAY_SIZE(x1500_uart0_groups), },
+	{ "uart1", x1500_uart1_groups, ARRAY_SIZE(x1500_uart1_groups), },
+	{ "uart2", x1500_uart2_groups, ARRAY_SIZE(x1500_uart2_groups), },
+	{ "mmc0", x1500_mmc0_groups, ARRAY_SIZE(x1500_mmc0_groups), },
+	{ "i2c0", x1500_i2c0_groups, ARRAY_SIZE(x1500_i2c0_groups), },
+	{ "i2c1", x1500_i2c1_groups, ARRAY_SIZE(x1500_i2c1_groups), },
+	{ "i2c2", x1500_i2c2_groups, ARRAY_SIZE(x1500_i2c2_groups), },
+	{ "cim", x1500_cim_groups, ARRAY_SIZE(x1500_cim_groups), },
+	{ "lcd", x1500_lcd_groups, ARRAY_SIZE(x1500_lcd_groups), },
+	{ "pwm0", x1500_pwm0_groups, ARRAY_SIZE(x1500_pwm0_groups), },
+	{ "pwm1", x1500_pwm1_groups, ARRAY_SIZE(x1500_pwm1_groups), },
+	{ "pwm2", x1500_pwm2_groups, ARRAY_SIZE(x1500_pwm2_groups), },
+	{ "pwm3", x1500_pwm3_groups, ARRAY_SIZE(x1500_pwm3_groups), },
+	{ "pwm4", x1500_pwm4_groups, ARRAY_SIZE(x1500_pwm4_groups), },
+};
+
+static const struct ingenic_chip_info x1500_chip_info = {
+	.num_chips = 4,
+	.groups = x1500_groups,
+	.num_groups = ARRAY_SIZE(x1500_groups),
+	.functions = x1500_functions,
+	.num_functions = ARRAY_SIZE(x1500_functions),
+	.pull_ups = x1000_pull_ups,
+	.pull_downs = x1000_pull_downs,
+};
+
 static u32 ingenic_gpio_read_reg(struct ingenic_gpio_chip *jzgc, u8 reg)
 {
 	unsigned int val;
@@ -1810,6 +1922,7 @@ static const struct of_device_id ingenic_pinctrl_of_match[] = {
 	{ .compatible = "ingenic,jz4780-pinctrl", .data = (void *) ID_JZ4780 },
 	{ .compatible = "ingenic,x1000-pinctrl", .data = (void *) ID_X1000 },
 	{ .compatible = "ingenic,x1000e-pinctrl", .data = (void *) ID_X1000E },
+	{ .compatible = "ingenic,x1500-pinctrl", .data = (void *) ID_X1500 },
 	{},
 };
 
@@ -1934,7 +2047,9 @@ static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
 	else
 		jzpc->version = (enum jz_version)id->driver_data;
 
-	if (jzpc->version >= ID_X1000E)
+	if (jzpc->version >= ID_X1500)
+		chip_info = &x1500_chip_info;
+	else if (jzpc->version >= ID_X1000E)
 		chip_info = &x1000e_chip_info;
 	else if (jzpc->version >= ID_X1000)
 		chip_info = &x1000_chip_info;
@@ -2028,6 +2143,7 @@ static const struct platform_device_id ingenic_pinctrl_ids[] = {
 	{ "jz4780-pinctrl", ID_JZ4780 },
 	{ "x1000-pinctrl", ID_X1000 },
 	{ "x1000e-pinctrl", ID_X1000E },
+	{ "x1500-pinctrl", ID_X1500 },
 	{},
 };
 
-- 
2.7.4


