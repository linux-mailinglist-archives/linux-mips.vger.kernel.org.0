Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C9B667E07
	for <lists+linux-mips@lfdr.de>; Sun, 14 Jul 2019 09:13:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbfGNHNM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 14 Jul 2019 03:13:12 -0400
Received: from sender4-pp-o95.zoho.com ([136.143.188.95]:25561 "EHLO
        sender4-pp-o95.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726756AbfGNHNM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 14 Jul 2019 03:13:12 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1563087481; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=nOxFUJDAerAM6KJ3+GgS/GfzNzLAPi88Vij71x+lIXhQhe05S1B6B5iRufPoE5rnISFPvWh+yB8jToQ8NAJBH+Pjxd33b8KYsbQAAH34Yae8ojotCd1idzsSazO8MFMEKmmT+dUJtdWgIcu2GKQhRIdeCXBKTMURPj6drY/71hg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1563087481; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=ysjuo3aAVjPUj4LLv/F92GLnhhr6hh0rIgJybioLgJg=; 
        b=A+/dhqS3ufoauMaXjryJdPJa1lRSuTS2uFiDLsz2VumWX5XVJgeqkternNSqpP4rPBpp/px+5VhfYwB4/RaK6fPjfQUtffw/M5+VcTpdjW3je5BtdF/nEUYEHU1qc8LQ9ebN9FsW/7BR4fLGhvcirb+AYs+bzXbkFxnUUHcmZZA=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=s1y70j5tKr5wxXHsEijl7lzJMgHA80tjbP10n/lla9MSXWmF7izwvUmJ8PzuP2TgvJA+XiZ9UIa7
    3+8Z2vQ0nW1UIhZe1z12qFbXLtHHfDIDRiBDKG2Sadp0HtgcLfQB  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1563087481;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=16698; bh=ysjuo3aAVjPUj4LLv/F92GLnhhr6hh0rIgJybioLgJg=;
        b=cztYgTEsGrDrdVVN2e6Mu5MpZyW8Xf+ZNHlzbHwAoYjW4l5kxtVibhzhxMF2fxEF
        MJXqsqxE/EGEw9TJxSW3EuaJ/eDOlGl74GuZFfpvKXI/Q4BWay7Le+dCNQgFJE6Pl8O
        OwNSkQyc3zPWAd/EKlvM+OQuJt8I0tnACH12+JGU=
Received: from zhouyanjie-virtual-machine.localdomain (125.71.5.36 [125.71.5.36]) by mx.zohomail.com
        with SMTPS id 1563087480222262.04018488072404; Sat, 13 Jul 2019 23:58:00 -0700 (PDT)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, paul.burton@mips.com,
        linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Subject: [PATCH 4/6] pinctrl: Ingenic: Add pinctrl driver for X1000 and X1000E.
Date:   Sun, 14 Jul 2019 11:53:54 +0800
Message-Id: <1563076436-5338-5-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563076436-5338-1-git-send-email-zhouyanjie@zoho.com>
References: <1563076436-5338-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add support for probing the pinctrl-ingenic driver on the
X1000 Soc and the X1000E Soc from Ingenic.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 307 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 296 insertions(+), 11 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index ec61b083..5bb4ae5 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -41,6 +41,9 @@
 #define JZ4760_GPIO_FLAG	0x50
 #define JZ4760_GPIO_PEN		0x70
 
+#define X1000_GPIO_PZ_BASE		0x700
+#define X1000_GPIO_PZ_GID2LD	0x7f0
+
 #define REG_SET(x) ((x) + 0x4)
 #define REG_CLEAR(x) ((x) + 0x8)
 
@@ -53,6 +56,8 @@ enum jz_version {
 	ID_JZ4760B,
 	ID_JZ4770,
 	ID_JZ4780,
+	ID_X1000,
+	ID_X1000E,
 };
 
 struct ingenic_chip_info {
@@ -1009,6 +1014,210 @@ static const struct ingenic_chip_info jz4780_chip_info = {
 	.pull_downs = jz4770_pull_downs,
 };
 
+static const u32 x1000_pull_ups[4] = {
+	0xffffffff, 0x8dffffff, 0x7d3fffff, 0xffffffff,
+};
+
+static const u32 x1000_pull_downs[4] = {
+	0x00000000, 0x02000000, 0x02000000, 0x00000000,
+};
+
+static int x1000_uart0_data_pins[] = { 0x4a, 0x4b, };
+static int x1000_uart0_hwflow_pins[] = { 0x4c, 0x4d, };
+static int x1000_uart1_data_a_pins[] = { 0x04, 0x05, };
+static int x1000_uart1_data_d_pins[] = { 0x62, 0x63, };
+static int x1000_uart1_hwflow_d_pins[] = { 0x64, 0x65, };
+static int x1000_uart2_data_a_pins[] = { 0x02, 0x03, };
+static int x1000_uart2_data_d_pins[] = { 0x65, 0x64, };
+static int x1000_mmc0_1bit_pins[] = { 0x18, 0x19, 0x17, };
+static int x1000_mmc0_4bit_pins[] = { 0x16, 0x15, 0x14, };
+static int x1000_mmc0_8bit_pins[] = { 0x13, 0x12, 0x11, 0x10, };
+static int x1000_mmc1_1bit_pins[] = { 0x40, 0x41, 0x42, };
+static int x1000_mmc1_4bit_pins[] = { 0x43, 0x44, 0x45, };
+static int x1000_nemc_8bit_data_pins[] = {
+	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
+};
+static int x1000_nemc_16bit_data_pins[] = {
+	0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
+};
+static int x1000_nemc_addr_pins[] = {
+	0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27,
+	0x28, 0x29, 0x2a, 0x2b, 0x2c, 0x2d, 0x2e, 0x2f,
+};
+static int x1000_nemc_rd_we_pins[] = { 0x30, 0x31, };
+static int x1000_nemc_wait_pins[] = { 0x34, };
+static int x1000_nemc_cs1_pins[] = { 0x32, };
+static int x1000_nemc_cs2_pins[] = { 0x33, };
+static int x1000_i2c0_pins[] = { 0x38, 0x37, };
+static int x1000_i2c1_a_pins[] = { 0x01, 0x00, };
+static int x1000_i2c1_c_pins[] = { 0x5b, 0x5a, };
+static int x1000_i2c2_pins[] = { 0x61, 0x60, };
+static int x1000_cim_pins[] = {
+	0x08, 0x09, 0x0a, 0x0b,
+	0x13, 0x12, 0x11, 0x10, 0x0f, 0x0e, 0x0d, 0x0c,
+};
+static int x1000_lcd_8bit_pins[] = {
+	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
+	0x30, 0x31, 0x32, 0x33, 0x34,
+};
+static int x1000_lcd_16bit_pins[] = {
+	0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
+};
+static int x1000_pwm_pwm0_pins[] = { 0x59, };
+static int x1000_pwm_pwm1_pins[] = { 0x5a, };
+static int x1000_pwm_pwm2_pins[] = { 0x5b, };
+static int x1000_pwm_pwm3_pins[] = { 0x26, };
+static int x1000_pwm_pwm4_pins[] = { 0x58, };
+static int x1000_mac_pins[] = {
+	0x27, 0x28, 0x29, 0x2a, 0x2b, 0x2c, 0x2d, 0x2e, 0x2f, 0x26,
+};
+
+static int x1000_uart0_data_funcs[] = { 0, 0, };
+static int x1000_uart0_hwflow_funcs[] = { 0, 0, };
+static int x1000_uart1_data_a_funcs[] = { 2, 2, };
+static int x1000_uart1_data_d_funcs[] = { 1, 1, };
+static int x1000_uart1_hwflow_d_funcs[] = { 1, 1, };
+static int x1000_uart2_data_a_funcs[] = { 2, 2, };
+static int x1000_uart2_data_d_funcs[] = { 0, 0, };
+static int x1000_mmc0_1bit_funcs[] = { 1, 1, 1, };
+static int x1000_mmc0_4bit_funcs[] = { 1, 1, 1, };
+static int x1000_mmc0_8bit_funcs[] = { 1, 1, 1, 1, 1, };
+static int x1000_mmc1_1bit_funcs[] = { 0, 0, 0, };
+static int x1000_mmc1_4bit_funcs[] = { 0, 0, 0, };
+static int x1000_nemc_8bit_data_funcs[] = { 0, 0, 0, 0, 0, 0, 0, 0, };
+static int x1000_nemc_16bit_data_funcs[] = { 0, 0, 0, 0, 0, 0, 0, 0, };
+static int x1000_nemc_addr_funcs[] = {
+	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
+};
+static int x1000_nemc_rd_we_funcs[] = { 0, 0, };
+static int x1000_nemc_wait_funcs[] = { 0, };
+static int x1000_nemc_cs1_funcs[] = { 0, };
+static int x1000_nemc_cs2_funcs[] = { 0, };
+static int x1000_i2c0_funcs[] = { 0, 0, };
+static int x1000_i2c1_a_funcs[] = { 2, 2, };
+static int x1000_i2c1_c_funcs[] = { 0, 0, };
+static int x1000_i2c2_funcs[] = { 1, 1, };
+static int x1000_cim_funcs[] = { 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, };
+static int x1000_lcd_8bit_funcs[] = {
+	1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
+};
+static int x1000_lcd_16bit_funcs[] = { 1, 1, 1, 1, 1, 1, 1, 1, };
+static int x1000_pwm_pwm0_funcs[] = { 0, };
+static int x1000_pwm_pwm1_funcs[] = { 1, };
+static int x1000_pwm_pwm2_funcs[] = { 1, };
+static int x1000_pwm_pwm3_funcs[] = { 2, };
+static int x1000_pwm_pwm4_funcs[] = { 0, };
+static int x1000_mac_funcs[] = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, };
+
+static const struct group_desc x1000_groups[] = {
+	INGENIC_PIN_GROUP("uart0-data", x1000_uart0_data),
+	INGENIC_PIN_GROUP("uart0-hwflow", x1000_uart0_hwflow),
+	INGENIC_PIN_GROUP("uart1-data-a", x1000_uart1_data_a),
+	INGENIC_PIN_GROUP("uart1-data-d", x1000_uart1_data_d),
+	INGENIC_PIN_GROUP("uart1-hwflow-d", x1000_uart1_hwflow_d),
+	INGENIC_PIN_GROUP("uart2-data-a", x1000_uart2_data_a),
+	INGENIC_PIN_GROUP("uart2-data-d", x1000_uart2_data_d),
+	INGENIC_PIN_GROUP("mmc0-1bit", x1000_mmc0_1bit),
+	INGENIC_PIN_GROUP("mmc0-4bit", x1000_mmc0_4bit),
+	INGENIC_PIN_GROUP("mmc0-8bit", x1000_mmc0_8bit),
+	INGENIC_PIN_GROUP("mmc1-1bit", x1000_mmc1_1bit),
+	INGENIC_PIN_GROUP("mmc1-4bit", x1000_mmc1_4bit),
+	INGENIC_PIN_GROUP("nemc-8bit-data", x1000_nemc_8bit_data),
+	INGENIC_PIN_GROUP("nemc-16bit-data", x1000_nemc_16bit_data),
+	INGENIC_PIN_GROUP("nemc-addr", x1000_nemc_addr),
+	INGENIC_PIN_GROUP("nemc-rd-we", x1000_nemc_rd_we),
+	INGENIC_PIN_GROUP("nemc-wait", x1000_nemc_wait),
+	INGENIC_PIN_GROUP("nemc-cs1", x1000_nemc_cs1),
+	INGENIC_PIN_GROUP("nemc-cs2", x1000_nemc_cs2),
+	INGENIC_PIN_GROUP("i2c0-data", x1000_i2c0),
+	INGENIC_PIN_GROUP("i2c1-data-a", x1000_i2c1_a),
+	INGENIC_PIN_GROUP("i2c1-data-c", x1000_i2c1_c),
+	INGENIC_PIN_GROUP("i2c2-data", x1000_i2c2),
+	INGENIC_PIN_GROUP("cim-data", x1000_cim),
+	INGENIC_PIN_GROUP("lcd-8bit", x1000_lcd_8bit),
+	INGENIC_PIN_GROUP("lcd-16bit", x1000_lcd_16bit),
+	{ "lcd-no-pins", },
+	INGENIC_PIN_GROUP("pwm0", x1000_pwm_pwm0),
+	INGENIC_PIN_GROUP("pwm1", x1000_pwm_pwm1),
+	INGENIC_PIN_GROUP("pwm2", x1000_pwm_pwm2),
+	INGENIC_PIN_GROUP("pwm3", x1000_pwm_pwm3),
+	INGENIC_PIN_GROUP("pwm4", x1000_pwm_pwm4),
+	INGENIC_PIN_GROUP("mac", x1000_mac),
+};
+
+static const char *x1000_uart0_groups[] = { "uart0-data", "uart0-hwflow", };
+static const char *x1000_uart1_groups[] = {
+	"uart1-data-a", "uart1-data-d", "uart1-hwflow-d",
+};
+static const char *x1000_uart2_groups[] = { "uart2-data-a", "uart2-data-d", };
+static const char *x1000_mmc0_groups[] = {
+	"mmc0-1bit", "mmc0-4bit", "mmc0-8bit",
+};
+static const char *x1000_mmc1_groups[] = {
+	"mmc1-1bit-e", "mmc1-4bit-e",
+};
+static const char *x1000_nemc_groups[] = {
+	"nemc-8bit-data", "nemc-16bit-data",
+	"nemc-addr", "nemc-rd-we", "nemc-wait",
+};
+static const char *x1000_cs1_groups[] = { "nemc-cs1", };
+static const char *x1000_cs2_groups[] = { "nemc-cs2", };
+static const char *x1000_i2c0_groups[] = { "i2c0-data", };
+static const char *x1000_i2c1_groups[] = { "i2c1-data-a", "i2c1-data-c", };
+static const char *x1000_i2c2_groups[] = { "i2c2-data", };
+static const char *x1000_cim_groups[] = { "cim-data", };
+static const char *x1000_lcd_groups[] = {
+	"lcd-8bit", "lcd-16bit", "lcd-no-pins",
+};
+static const char *x1000_pwm0_groups[] = { "pwm0", };
+static const char *x1000_pwm1_groups[] = { "pwm1", };
+static const char *x1000_pwm2_groups[] = { "pwm2", };
+static const char *x1000_pwm3_groups[] = { "pwm3", };
+static const char *x1000_pwm4_groups[] = { "pwm4", };
+static const char *x1000_mac_groups[] = { "mac", };
+
+static const struct function_desc x1000_functions[] = {
+	{ "uart0", x1000_uart0_groups, ARRAY_SIZE(x1000_uart0_groups), },
+	{ "uart1", x1000_uart1_groups, ARRAY_SIZE(x1000_uart1_groups), },
+	{ "uart2", x1000_uart2_groups, ARRAY_SIZE(x1000_uart2_groups), },
+	{ "mmc0", x1000_mmc0_groups, ARRAY_SIZE(x1000_mmc0_groups), },
+	{ "mmc1", x1000_mmc1_groups, ARRAY_SIZE(x1000_mmc1_groups), },
+	{ "nemc", x1000_nemc_groups, ARRAY_SIZE(x1000_nemc_groups), },
+	{ "nemc-cs1", x1000_cs1_groups, ARRAY_SIZE(x1000_cs1_groups), },
+	{ "nemc-cs2", x1000_cs2_groups, ARRAY_SIZE(x1000_cs2_groups), },
+	{ "i2c0", x1000_i2c0_groups, ARRAY_SIZE(x1000_i2c0_groups), },
+	{ "i2c1", x1000_i2c1_groups, ARRAY_SIZE(x1000_i2c1_groups), },
+	{ "i2c2", x1000_i2c2_groups, ARRAY_SIZE(x1000_i2c2_groups), },
+	{ "cim", x1000_cim_groups, ARRAY_SIZE(x1000_cim_groups), },
+	{ "lcd", x1000_lcd_groups, ARRAY_SIZE(x1000_lcd_groups), },
+	{ "pwm0", x1000_pwm0_groups, ARRAY_SIZE(x1000_pwm0_groups), },
+	{ "pwm1", x1000_pwm1_groups, ARRAY_SIZE(x1000_pwm1_groups), },
+	{ "pwm2", x1000_pwm2_groups, ARRAY_SIZE(x1000_pwm2_groups), },
+	{ "pwm3", x1000_pwm3_groups, ARRAY_SIZE(x1000_pwm3_groups), },
+	{ "pwm4", x1000_pwm4_groups, ARRAY_SIZE(x1000_pwm4_groups), },
+	{ "mac", x1000_mac_groups, ARRAY_SIZE(x1000_mac_groups), },
+};
+
+static const struct ingenic_chip_info x1000_chip_info = {
+	.num_chips = 4,
+	.groups = x1000_groups,
+	.num_groups = ARRAY_SIZE(x1000_groups),
+	.functions = x1000_functions,
+	.num_functions = ARRAY_SIZE(x1000_functions),
+	.pull_ups = x1000_pull_ups,
+	.pull_downs = x1000_pull_downs,
+};
+
+static const struct ingenic_chip_info x1000e_chip_info = {
+	.num_chips = 4,
+	.groups = x1000_groups,
+	.num_groups = ARRAY_SIZE(x1000_groups),
+	.functions = x1000_functions,
+	.num_functions = ARRAY_SIZE(x1000_functions),
+	.pull_ups = x1000_pull_ups,
+	.pull_downs = x1000_pull_downs,
+};
+
 static u32 ingenic_gpio_read_reg(struct ingenic_gpio_chip *jzgc, u8 reg)
 {
 	unsigned int val;
@@ -1029,6 +1238,23 @@ static void ingenic_gpio_set_bit(struct ingenic_gpio_chip *jzgc,
 	regmap_write(jzgc->jzpc->map, jzgc->reg_base + reg, BIT(offset));
 }
 
+static void ingenic_gpio_shadow_set_bit(struct ingenic_gpio_chip *jzgc,
+		u8 reg, u8 offset, bool set)
+{
+	if (set)
+		reg = REG_SET(reg);
+	else
+		reg = REG_CLEAR(reg);
+
+	regmap_write(jzgc->jzpc->map, X1000_GPIO_PZ_BASE + reg, BIT(offset));
+}
+
+static void ingenic_gpio_shadow_set_bit_load(struct ingenic_gpio_chip *jzgc)
+{
+	regmap_write(jzgc->jzpc->map, X1000_GPIO_PZ_GID2LD,
+			jzgc->gc.base / PINS_PER_GPIO_CHIP);
+}
+
 static inline bool ingenic_gpio_get_value(struct ingenic_gpio_chip *jzgc,
 					  u8 offset)
 {
@@ -1061,21 +1287,45 @@ static void irq_set_type(struct ingenic_gpio_chip *jzgc,
 
 	switch (type) {
 	case IRQ_TYPE_EDGE_RISING:
-		ingenic_gpio_set_bit(jzgc, reg2, offset, true);
-		ingenic_gpio_set_bit(jzgc, reg1, offset, true);
+		if (jzgc->jzpc->version >= ID_X1000) {
+			ingenic_gpio_shadow_set_bit(jzgc, reg2, offset, true);
+			ingenic_gpio_shadow_set_bit(jzgc, reg1, offset, true);
+			ingenic_gpio_shadow_set_bit_load(jzgc);
+		} else {
+			ingenic_gpio_set_bit(jzgc, reg2, offset, true);
+			ingenic_gpio_set_bit(jzgc, reg1, offset, true);
+		}
 		break;
 	case IRQ_TYPE_EDGE_FALLING:
-		ingenic_gpio_set_bit(jzgc, reg2, offset, false);
-		ingenic_gpio_set_bit(jzgc, reg1, offset, true);
+		if (jzgc->jzpc->version >= ID_X1000) {
+			ingenic_gpio_shadow_set_bit(jzgc, reg2, offset, false);
+			ingenic_gpio_shadow_set_bit(jzgc, reg1, offset, true);
+			ingenic_gpio_shadow_set_bit_load(jzgc);
+		} else {
+			ingenic_gpio_set_bit(jzgc, reg2, offset, false);
+			ingenic_gpio_set_bit(jzgc, reg1, offset, true);
+		}
 		break;
 	case IRQ_TYPE_LEVEL_HIGH:
-		ingenic_gpio_set_bit(jzgc, reg2, offset, true);
-		ingenic_gpio_set_bit(jzgc, reg1, offset, false);
+		if (jzgc->jzpc->version >= ID_X1000) {
+			ingenic_gpio_shadow_set_bit(jzgc, reg2, offset, true);
+			ingenic_gpio_shadow_set_bit(jzgc, reg1, offset, false);
+			ingenic_gpio_shadow_set_bit_load(jzgc);
+		} else {
+			ingenic_gpio_set_bit(jzgc, reg2, offset, true);
+			ingenic_gpio_set_bit(jzgc, reg1, offset, false);
+		}
 		break;
 	case IRQ_TYPE_LEVEL_LOW:
 	default:
-		ingenic_gpio_set_bit(jzgc, reg2, offset, false);
-		ingenic_gpio_set_bit(jzgc, reg1, offset, false);
+		if (jzgc->jzpc->version >= ID_X1000) {
+			ingenic_gpio_shadow_set_bit(jzgc, reg2, offset, false);
+			ingenic_gpio_shadow_set_bit(jzgc, reg1, offset, false);
+			ingenic_gpio_shadow_set_bit_load(jzgc);
+		} else {
+			ingenic_gpio_set_bit(jzgc, reg2, offset, false);
+			ingenic_gpio_set_bit(jzgc, reg1, offset, false);
+		}
 		break;
 	}
 }
@@ -1248,6 +1498,21 @@ static inline void ingenic_config_pin(struct ingenic_pinctrl *jzpc,
 			(set ? REG_SET(reg) : REG_CLEAR(reg)), BIT(idx));
 }
 
+static inline void ingenic_shadow_config_pin(struct ingenic_pinctrl *jzpc,
+		unsigned int pin, u8 reg, bool set)
+{
+	unsigned int idx = pin % PINS_PER_GPIO_CHIP;
+
+	regmap_write(jzpc->map, X1000_GPIO_PZ_BASE +
+			(set ? REG_SET(reg) : REG_CLEAR(reg)), BIT(idx));
+}
+
+static inline void ingenic_shadow_config_pin_load(struct ingenic_pinctrl *jzpc,
+		unsigned int pin)
+{
+	regmap_write(jzpc->map, X1000_GPIO_PZ_GID2LD, pin / PINS_PER_GPIO_CHIP);
+}
+
 static inline bool ingenic_get_pin_config(struct ingenic_pinctrl *jzpc,
 		unsigned int pin, u8 reg)
 {
@@ -1292,7 +1557,13 @@ static int ingenic_pinmux_set_pin_fn(struct ingenic_pinctrl *jzpc,
 	dev_dbg(jzpc->dev, "set pin P%c%u to function %u\n",
 			'A' + offt, idx, func);
 
-	if (jzpc->version >= ID_JZ4760) {
+	if (jzpc->version >= ID_X1000) {
+		ingenic_shadow_config_pin(jzpc, pin, JZ4760_GPIO_INT, false);
+		ingenic_shadow_config_pin(jzpc, pin, GPIO_MSK, false);
+		ingenic_shadow_config_pin(jzpc, pin, JZ4760_GPIO_PAT1, func & 0x2);
+		ingenic_shadow_config_pin(jzpc, pin, JZ4760_GPIO_PAT0, func & 0x1);
+		ingenic_shadow_config_pin_load(jzpc, pin);
+	} else if (jzpc->version >= ID_JZ4760) {
 		ingenic_config_pin(jzpc, pin, JZ4760_GPIO_INT, false);
 		ingenic_config_pin(jzpc, pin, GPIO_MSK, false);
 		ingenic_config_pin(jzpc, pin, JZ4760_GPIO_PAT1, func & 0x2);
@@ -1345,7 +1616,12 @@ static int ingenic_pinmux_gpio_set_direction(struct pinctrl_dev *pctldev,
 	dev_dbg(pctldev->dev, "set pin P%c%u to %sput\n",
 			'A' + offt, idx, input ? "in" : "out");
 
-	if (jzpc->version >= ID_JZ4760) {
+	if (jzpc->version >= ID_X1000) {
+		ingenic_shadow_config_pin(jzpc, pin, JZ4760_GPIO_INT, false);
+		ingenic_shadow_config_pin(jzpc, pin, GPIO_MSK, true);
+		ingenic_shadow_config_pin(jzpc, pin, JZ4760_GPIO_PAT1, input);
+		ingenic_shadow_config_pin_load(jzpc, pin);
+	} else if (jzpc->version >= ID_JZ4760) {
 		ingenic_config_pin(jzpc, pin, JZ4760_GPIO_INT, false);
 		ingenic_config_pin(jzpc, pin, GPIO_MSK, true);
 		ingenic_config_pin(jzpc, pin, JZ4760_GPIO_PAT1, input);
@@ -1532,6 +1808,8 @@ static const struct of_device_id ingenic_pinctrl_of_match[] = {
 	{ .compatible = "ingenic,jz4760b-pinctrl", .data = (void *) ID_JZ4760B },
 	{ .compatible = "ingenic,jz4770-pinctrl", .data = (void *) ID_JZ4770 },
 	{ .compatible = "ingenic,jz4780-pinctrl", .data = (void *) ID_JZ4780 },
+	{ .compatible = "ingenic,x1000-pinctrl", .data = (void *) ID_X1000 },
+	{ .compatible = "ingenic,x1000e-pinctrl", .data = (void *) ID_X1000E },
 	{},
 };
 
@@ -1540,6 +1818,7 @@ static const struct of_device_id ingenic_gpio_of_match[] __initconst = {
 	{ .compatible = "ingenic,jz4760-gpio", },
 	{ .compatible = "ingenic,jz4770-gpio", },
 	{ .compatible = "ingenic,jz4780-gpio", },
+	{ .compatible = "ingenic,x1000-gpio", },
 	{},
 };
 
@@ -1655,7 +1934,11 @@ static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
 	else
 		jzpc->version = (enum jz_version)id->driver_data;
 
-	if (jzpc->version >= ID_JZ4780)
+	if (jzpc->version >= ID_X1000E)
+		chip_info = &x1000e_chip_info;
+	else if (jzpc->version >= ID_X1000)
+		chip_info = &x1000_chip_info;
+	else if (jzpc->version >= ID_JZ4780)
 		chip_info = &jz4780_chip_info;
 	else if (jzpc->version >= ID_JZ4770)
 		chip_info = &jz4770_chip_info;
@@ -1743,6 +2026,8 @@ static const struct platform_device_id ingenic_pinctrl_ids[] = {
 	{ "jz4760b-pinctrl", ID_JZ4760B },
 	{ "jz4770-pinctrl", ID_JZ4770 },
 	{ "jz4780-pinctrl", ID_JZ4780 },
+	{ "x1000-pinctrl", ID_X1000 },
+	{ "x1000e-pinctrl", ID_X1000E },
 	{},
 };
 
-- 
2.7.4


