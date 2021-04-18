Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14051363614
	for <lists+linux-mips@lfdr.de>; Sun, 18 Apr 2021 16:45:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236765AbhDROpX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 18 Apr 2021 10:45:23 -0400
Received: from out28-194.mail.aliyun.com ([115.124.28.194]:35647 "EHLO
        out28-194.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234846AbhDROpV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 18 Apr 2021 10:45:21 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436282|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_social|0.0363446-0.000285203-0.96337;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047208;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.K.sSkG._1618757074;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.K.sSkG._1618757074)
          by smtp.aliyun-inc.com(10.147.40.233);
          Sun, 18 Apr 2021 22:44:50 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linus.walleij@linaro.org, robh+dt@kernel.org, paul@crapouillou.net
Cc:     linux-gpio@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        hns@goldelico.com, paul@boddie.org.uk, andy.shevchenko@gmail.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sernia.zhou@foxmail.com
Subject: [PATCH v6 08/12] pinctrl: Ingenic: Add pinctrl driver for JZ4730.
Date:   Sun, 18 Apr 2021 22:44:29 +0800
Message-Id: <1618757073-1724-9-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618757073-1724-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1618757073-1724-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add support for probing the pinctrl-ingenic driver on the
JZ4730 SoC from Ingenic.

This driver is derived from Paul Boddie. It is worth to
noting that the JZ4730 SoC is special in having two control
registers (upper/lower), so add code to handle the JZ4730
specific register offsets and some register pairs which have
2 bits for each GPIO pin.

Tested-by: H. Nikolaus Schaller <hns@goldelico.com>  # on Letux400
Co-developed-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: Paul Boddie <paul@boddie.org.uk>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v3:
    New patch.
    
    v3->v4:
    1.Use "lcd-special" and "lcd-generic" instead "lcd-16bit-tft".
    2.Adjust function names to avoid confusion.
    3.Improve the structure of some functions.
    4.Modify the format of comment.
    5.Simplify code using GENMASK.
    6.Drop unnecessary mask.
    
    v4->v5:
    No change.
    
    v5->v6:
    Add Paul Cercueil's Reviewed-by.

 drivers/pinctrl/pinctrl-ingenic.c | 232 +++++++++++++++++++++++++++++++++++---
 1 file changed, 216 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index e78f144..19c3646 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -3,8 +3,8 @@
  * Ingenic SoCs pinctrl driver
  *
  * Copyright (c) 2017 Paul Cercueil <paul@crapouillou.net>
- * Copyright (c) 2019 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
  * Copyright (c) 2017, 2019 Paul Boddie <paul@boddie.org.uk>
+ * Copyright (c) 2019, 2020 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
  */
 
 #include <linux/compiler.h>
@@ -29,6 +29,17 @@
 #define GPIO_PIN					0x00
 #define GPIO_MSK					0x20
 
+#define JZ4730_GPIO_DATA			0x00
+#define JZ4730_GPIO_GPDIR			0x04
+#define JZ4730_GPIO_GPPUR			0x0c
+#define JZ4730_GPIO_GPALR			0x10
+#define JZ4730_GPIO_GPAUR			0x14
+#define JZ4730_GPIO_GPIDLR			0x18
+#define JZ4730_GPIO_GPIDUR			0x1c
+#define JZ4730_GPIO_GPIER			0x20
+#define JZ4730_GPIO_GPIMR			0x24
+#define JZ4730_GPIO_GPFR			0x28
+
 #define JZ4740_GPIO_DATA			0x10
 #define JZ4740_GPIO_PULL_DIS		0x30
 #define JZ4740_GPIO_FUNC			0x40
@@ -57,6 +68,7 @@
 #define GPIO_PULL_DOWN				2
 
 #define PINS_PER_GPIO_CHIP			32
+#define JZ4730_PINS_PER_PAIRED_REG	16
 
 #define INGENIC_PIN_GROUP_FUNCS(name, id, funcs)		\
 	{						\
@@ -70,6 +82,7 @@
 	INGENIC_PIN_GROUP_FUNCS(name, id, (void *)(func))
 
 enum jz_version {
+	ID_JZ4730,
 	ID_JZ4740,
 	ID_JZ4725B,
 	ID_JZ4760,
@@ -110,6 +123,99 @@ struct ingenic_gpio_chip {
 	unsigned int irq, reg_base;
 };
 
+static const u32 jz4730_pull_ups[4] = {
+	0x3fa3320f, 0xf200ffff, 0xffffffff, 0xffffffff,
+};
+
+static const u32 jz4730_pull_downs[4] = {
+	0x00000df0, 0x0dff0000, 0x00000000, 0x00000000,
+};
+
+static int jz4730_mmc_1bit_pins[] = { 0x27, 0x26, 0x22, };
+static int jz4730_mmc_4bit_pins[] = { 0x23, 0x24, 0x25, };
+static int jz4730_uart0_data_pins[] = { 0x7e, 0x7f, };
+static int jz4730_uart1_data_pins[] = { 0x18, 0x19, };
+static int jz4730_uart2_data_pins[] = { 0x6f, 0x7d, };
+static int jz4730_uart3_data_pins[] = { 0x10, 0x15, };
+static int jz4730_uart3_hwflow_pins[] = { 0x11, 0x17, };
+static int jz4730_lcd_8bit_pins[] = {
+	0x28, 0x29, 0x2a, 0x2b, 0x2c, 0x2d, 0x2e, 0x2f,
+	0x3a, 0x39, 0x38,
+};
+static int jz4730_lcd_16bit_pins[] = {
+	0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37,
+};
+static int jz4730_lcd_special_pins[] = { 0x3d, 0x3c, 0x3e, 0x3f, };
+static int jz4730_lcd_generic_pins[] = { 0x3b, };
+static int jz4730_nand_cs1_pins[] = { 0x53, };
+static int jz4730_nand_cs2_pins[] = { 0x54, };
+static int jz4730_nand_cs3_pins[] = { 0x55, };
+static int jz4730_nand_cs4_pins[] = { 0x56, };
+static int jz4730_nand_cs5_pins[] = { 0x57, };
+static int jz4730_pwm_pwm0_pins[] = { 0x5e, };
+static int jz4730_pwm_pwm1_pins[] = { 0x5f, };
+
+static u8 jz4730_lcd_8bit_funcs[] = { 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, };
+
+static const struct group_desc jz4730_groups[] = {
+	INGENIC_PIN_GROUP("mmc-1bit", jz4730_mmc_1bit, 1),
+	INGENIC_PIN_GROUP("mmc-4bit", jz4730_mmc_4bit, 1),
+	INGENIC_PIN_GROUP("uart0-data", jz4730_uart0_data, 1),
+	INGENIC_PIN_GROUP("uart1-data", jz4730_uart1_data, 1),
+	INGENIC_PIN_GROUP("uart2-data", jz4730_uart2_data, 1),
+	INGENIC_PIN_GROUP("uart3-data", jz4730_uart3_data, 1),
+	INGENIC_PIN_GROUP("uart3-hwflow", jz4730_uart3_hwflow, 1),
+	INGENIC_PIN_GROUP_FUNCS("lcd-8bit", jz4730_lcd_8bit, jz4730_lcd_8bit_funcs),
+	INGENIC_PIN_GROUP("lcd-16bit", jz4730_lcd_16bit, 1),
+	INGENIC_PIN_GROUP("lcd-special", jz4730_lcd_special, 1),
+	INGENIC_PIN_GROUP("lcd-generic", jz4730_lcd_generic, 1),
+	INGENIC_PIN_GROUP("nand-cs1", jz4730_nand_cs1, 1),
+	INGENIC_PIN_GROUP("nand-cs2", jz4730_nand_cs2, 1),
+	INGENIC_PIN_GROUP("nand-cs3", jz4730_nand_cs3, 1),
+	INGENIC_PIN_GROUP("nand-cs4", jz4730_nand_cs4, 1),
+	INGENIC_PIN_GROUP("nand-cs5", jz4730_nand_cs5, 1),
+	INGENIC_PIN_GROUP("pwm0", jz4730_pwm_pwm0, 1),
+	INGENIC_PIN_GROUP("pwm1", jz4730_pwm_pwm1, 1),
+};
+
+static const char *jz4730_mmc_groups[] = { "mmc-1bit", "mmc-4bit", };
+static const char *jz4730_uart0_groups[] = { "uart0-data", };
+static const char *jz4730_uart1_groups[] = { "uart1-data", };
+static const char *jz4730_uart2_groups[] = { "uart2-data", };
+static const char *jz4730_uart3_groups[] = { "uart3-data", "uart3-hwflow", };
+static const char *jz4730_lcd_groups[] = {
+	"lcd-8bit", "lcd-16bit", "lcd-special", "lcd-generic",
+};
+static const char *jz4730_nand_groups[] = {
+	"nand-cs1", "nand-cs2", "nand-cs3", "nand-cs4", "nand-cs5",
+};
+static const char *jz4730_pwm0_groups[] = { "pwm0", };
+static const char *jz4730_pwm1_groups[] = { "pwm1", };
+
+static const struct function_desc jz4730_functions[] = {
+	{ "mmc", jz4730_mmc_groups, ARRAY_SIZE(jz4730_mmc_groups), },
+	{ "uart0", jz4730_uart0_groups, ARRAY_SIZE(jz4730_uart0_groups), },
+	{ "uart1", jz4730_uart1_groups, ARRAY_SIZE(jz4730_uart1_groups), },
+	{ "uart2", jz4730_uart2_groups, ARRAY_SIZE(jz4730_uart2_groups), },
+	{ "uart3", jz4730_uart3_groups, ARRAY_SIZE(jz4730_uart3_groups), },
+	{ "lcd", jz4730_lcd_groups, ARRAY_SIZE(jz4730_lcd_groups), },
+	{ "nand", jz4730_nand_groups, ARRAY_SIZE(jz4730_nand_groups), },
+	{ "pwm0", jz4730_pwm0_groups, ARRAY_SIZE(jz4730_pwm0_groups), },
+	{ "pwm1", jz4730_pwm1_groups, ARRAY_SIZE(jz4730_pwm1_groups), },
+};
+
+static const struct ingenic_chip_info jz4730_chip_info = {
+	.num_chips = 4,
+	.reg_offset = 0x30,
+	.version = ID_JZ4730,
+	.groups = jz4730_groups,
+	.num_groups = ARRAY_SIZE(jz4730_groups),
+	.functions = jz4730_functions,
+	.num_functions = ARRAY_SIZE(jz4730_functions),
+	.pull_ups = jz4730_pull_ups,
+	.pull_downs = jz4730_pull_downs,
+};
+
 static const u32 jz4740_pull_ups[4] = {
 	0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
 };
@@ -1703,6 +1809,12 @@ static u32 ingenic_gpio_read_reg(struct ingenic_gpio_chip *jzgc, u8 reg)
 static void ingenic_gpio_set_bit(struct ingenic_gpio_chip *jzgc,
 		u8 reg, u8 offset, bool set)
 {
+	if (jzgc->jzpc->info->version == ID_JZ4730) {
+		regmap_update_bits(jzgc->jzpc->map, jzgc->reg_base + reg,
+				BIT(offset), set ? BIT(offset) : 0);
+		return;
+	}
+
 	if (set)
 		reg = REG_SET(reg);
 	else
@@ -1730,6 +1842,20 @@ static void ingenic_gpio_shadow_set_bit_load(struct ingenic_gpio_chip *jzgc)
 			jzgc->gc.base / PINS_PER_GPIO_CHIP);
 }
 
+static void jz4730_gpio_set_bits(struct ingenic_gpio_chip *jzgc,
+		u8 reg_upper, u8 reg_lower, u8 offset, u8 value)
+{
+	/*
+	 * JZ4730 function and IRQ registers support two-bits-per-pin
+	 * definitions, split into two groups of 16.
+	 */
+	u8 reg = offset < JZ4730_PINS_PER_PAIRED_REG ? reg_lower : reg_upper;
+	unsigned int idx = offset % JZ4730_PINS_PER_PAIRED_REG;
+	unsigned int mask = GENMASK(1, 0) << idx * 2;
+
+	regmap_update_bits(jzgc->jzpc->map, jzgc->reg_base + reg, mask, value << (idx * 2));
+}
+
 static inline bool ingenic_gpio_get_value(struct ingenic_gpio_chip *jzgc,
 					  u8 offset)
 {
@@ -1743,8 +1869,10 @@ static void ingenic_gpio_set_value(struct ingenic_gpio_chip *jzgc,
 {
 	if (jzgc->jzpc->info->version >= ID_JZ4770)
 		ingenic_gpio_set_bit(jzgc, JZ4770_GPIO_PAT0, offset, !!value);
-	else
+	else if (jzgc->jzpc->info->version >= ID_JZ4740)
 		ingenic_gpio_set_bit(jzgc, JZ4740_GPIO_DATA, offset, !!value);
+	else
+		ingenic_gpio_set_bit(jzgc, JZ4730_GPIO_DATA, offset, !!value);
 }
 
 static void irq_set_type(struct ingenic_gpio_chip *jzgc,
@@ -1774,9 +1902,14 @@ static void irq_set_type(struct ingenic_gpio_chip *jzgc,
 	if (jzgc->jzpc->info->version >= ID_JZ4770) {
 		reg1 = JZ4770_GPIO_PAT1;
 		reg2 = JZ4770_GPIO_PAT0;
-	} else {
+	} else if (jzgc->jzpc->info->version >= ID_JZ4740) {
 		reg1 = JZ4740_GPIO_TRIG;
 		reg2 = JZ4740_GPIO_DIR;
+	} else {
+		ingenic_gpio_set_bit(jzgc, JZ4730_GPIO_GPDIR, offset, false);
+		jz4730_gpio_set_bits(jzgc, JZ4730_GPIO_GPIDUR,
+				JZ4730_GPIO_GPIDLR, offset, (val2 << 1) | val1);
+		return;
 	}
 
 	if (jzgc->jzpc->info->version >= ID_X1000) {
@@ -1793,16 +1926,24 @@ static void ingenic_gpio_irq_mask(struct irq_data *irqd)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
 	struct ingenic_gpio_chip *jzgc = gpiochip_get_data(gc);
+	int irq = irqd->hwirq;
 
-	ingenic_gpio_set_bit(jzgc, GPIO_MSK, irqd->hwirq, true);
+	if (jzgc->jzpc->info->version >= ID_JZ4740)
+		ingenic_gpio_set_bit(jzgc, GPIO_MSK, irq, true);
+	else
+		ingenic_gpio_set_bit(jzgc, JZ4730_GPIO_GPIMR, irq, true);
 }
 
 static void ingenic_gpio_irq_unmask(struct irq_data *irqd)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
 	struct ingenic_gpio_chip *jzgc = gpiochip_get_data(gc);
+	int irq = irqd->hwirq;
 
-	ingenic_gpio_set_bit(jzgc, GPIO_MSK, irqd->hwirq, false);
+	if (jzgc->jzpc->info->version >= ID_JZ4740)
+		ingenic_gpio_set_bit(jzgc, GPIO_MSK, irq, false);
+	else
+		ingenic_gpio_set_bit(jzgc, JZ4730_GPIO_GPIMR, irq, false);
 }
 
 static void ingenic_gpio_irq_enable(struct irq_data *irqd)
@@ -1813,8 +1954,10 @@ static void ingenic_gpio_irq_enable(struct irq_data *irqd)
 
 	if (jzgc->jzpc->info->version >= ID_JZ4770)
 		ingenic_gpio_set_bit(jzgc, JZ4770_GPIO_INT, irq, true);
-	else
+	else if (jzgc->jzpc->info->version >= ID_JZ4740)
 		ingenic_gpio_set_bit(jzgc, JZ4740_GPIO_SELECT, irq, true);
+	else
+		ingenic_gpio_set_bit(jzgc, JZ4730_GPIO_GPIER, irq, true);
 
 	ingenic_gpio_irq_unmask(irqd);
 }
@@ -1829,8 +1972,10 @@ static void ingenic_gpio_irq_disable(struct irq_data *irqd)
 
 	if (jzgc->jzpc->info->version >= ID_JZ4770)
 		ingenic_gpio_set_bit(jzgc, JZ4770_GPIO_INT, irq, false);
-	else
+	else if (jzgc->jzpc->info->version >= ID_JZ4740)
 		ingenic_gpio_set_bit(jzgc, JZ4740_GPIO_SELECT, irq, false);
+	else
+		ingenic_gpio_set_bit(jzgc, JZ4730_GPIO_GPIER, irq, false);
 }
 
 static void ingenic_gpio_irq_ack(struct irq_data *irqd)
@@ -1854,8 +1999,10 @@ static void ingenic_gpio_irq_ack(struct irq_data *irqd)
 
 	if (jzgc->jzpc->info->version >= ID_JZ4770)
 		ingenic_gpio_set_bit(jzgc, JZ4770_GPIO_FLAG, irq, false);
-	else
+	else if (jzgc->jzpc->info->version >= ID_JZ4740)
 		ingenic_gpio_set_bit(jzgc, JZ4740_GPIO_DATA, irq, true);
+	else
+		ingenic_gpio_set_bit(jzgc, JZ4730_GPIO_GPFR, irq, false);
 }
 
 static int ingenic_gpio_irq_set_type(struct irq_data *irqd, unsigned int type)
@@ -1911,8 +2058,10 @@ static void ingenic_gpio_irq_handler(struct irq_desc *desc)
 
 	if (jzgc->jzpc->info->version >= ID_JZ4770)
 		flag = ingenic_gpio_read_reg(jzgc, JZ4770_GPIO_FLAG);
-	else
+	else if (jzgc->jzpc->info->version >= ID_JZ4740)
 		flag = ingenic_gpio_read_reg(jzgc, JZ4740_GPIO_FLAG);
+	else
+		flag = ingenic_gpio_read_reg(jzgc, JZ4730_GPIO_GPFR);
 
 	for_each_set_bit(i, &flag, 32)
 		generic_handle_irq(irq_linear_revmap(gc->irq.domain, i));
@@ -1953,8 +2102,21 @@ static inline void ingenic_config_pin(struct ingenic_pinctrl *jzpc,
 	unsigned int idx = pin % PINS_PER_GPIO_CHIP;
 	unsigned int offt = pin / PINS_PER_GPIO_CHIP;
 
-	regmap_write(jzpc->map, offt * jzpc->info->reg_offset +
-			(set ? REG_SET(reg) : REG_CLEAR(reg)), BIT(idx));
+	if (set) {
+		if (jzpc->info->version >= ID_JZ4740)
+			regmap_write(jzpc->map, offt * jzpc->info->reg_offset +
+					REG_SET(reg), BIT(idx));
+		else
+			regmap_set_bits(jzpc->map, offt * jzpc->info->reg_offset +
+					reg, BIT(idx));
+	} else {
+		if (jzpc->info->version >= ID_JZ4740)
+			regmap_write(jzpc->map, offt * jzpc->info->reg_offset +
+					REG_CLEAR(reg), BIT(idx));
+		else
+			regmap_clear_bits(jzpc->map, offt * jzpc->info->reg_offset +
+					reg, BIT(idx));
+	}
 }
 
 static inline void ingenic_shadow_config_pin(struct ingenic_pinctrl *jzpc,
@@ -1973,6 +2135,22 @@ static inline void ingenic_shadow_config_pin_load(struct ingenic_pinctrl *jzpc,
 			pin / PINS_PER_GPIO_CHIP);
 }
 
+static inline void jz4730_config_pin_function(struct ingenic_pinctrl *jzpc,
+		unsigned int pin, u8 reg_upper, u8 reg_lower, u8 value)
+{
+	/*
+	 * JZ4730 function and IRQ registers support two-bits-per-pin
+	 * definitions, split into two groups of 16.
+	 */
+	unsigned int idx = pin % JZ4730_PINS_PER_PAIRED_REG;
+	unsigned int mask = GENMASK(1, 0) << idx * 2;
+	unsigned int offt = pin / PINS_PER_GPIO_CHIP;
+	u8 reg = (pin % PINS_PER_GPIO_CHIP) < JZ4730_PINS_PER_PAIRED_REG ? reg_lower : reg_upper;
+
+	regmap_update_bits(jzpc->map, offt * jzpc->info->reg_offset + reg,
+			mask, value << (idx * 2));
+}
+
 static inline bool ingenic_get_pin_config(struct ingenic_pinctrl *jzpc,
 		unsigned int pin, u8 reg)
 {
@@ -1996,6 +2174,10 @@ static int ingenic_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 		    ingenic_get_pin_config(jzpc, pin, JZ4770_GPIO_PAT1))
 			return GPIO_LINE_DIRECTION_IN;
 		return GPIO_LINE_DIRECTION_OUT;
+	} else if (jzpc->info->version == ID_JZ4730) {
+		if (!ingenic_get_pin_config(jzpc, pin, JZ4730_GPIO_GPDIR))
+			return GPIO_LINE_DIRECTION_IN;
+		return GPIO_LINE_DIRECTION_OUT;
 	}
 
 	if (ingenic_get_pin_config(jzpc, pin, JZ4740_GPIO_SELECT))
@@ -2054,10 +2236,13 @@ static int ingenic_pinmux_set_pin_fn(struct ingenic_pinctrl *jzpc,
 		ingenic_config_pin(jzpc, pin, GPIO_MSK, false);
 		ingenic_config_pin(jzpc, pin, JZ4770_GPIO_PAT1, func & 0x2);
 		ingenic_config_pin(jzpc, pin, JZ4770_GPIO_PAT0, func & 0x1);
-	} else {
+	} else if (jzpc->info->version >= ID_JZ4740) {
 		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_FUNC, true);
 		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_TRIG, func & 0x2);
 		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_SELECT, func & 0x1);
+	} else {
+		ingenic_config_pin(jzpc, pin, JZ4730_GPIO_GPIER, false);
+		jz4730_config_pin_function(jzpc, pin, JZ4730_GPIO_GPAUR, JZ4730_GPIO_GPALR, func);
 	}
 
 	return 0;
@@ -2118,10 +2303,14 @@ static int ingenic_pinmux_gpio_set_direction(struct pinctrl_dev *pctldev,
 		ingenic_config_pin(jzpc, pin, JZ4770_GPIO_INT, false);
 		ingenic_config_pin(jzpc, pin, GPIO_MSK, true);
 		ingenic_config_pin(jzpc, pin, JZ4770_GPIO_PAT1, input);
-	} else {
+	} else if (jzpc->info->version >= ID_JZ4740) {
 		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_SELECT, false);
 		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_DIR, !input);
 		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_FUNC, false);
+	} else {
+		ingenic_config_pin(jzpc, pin, JZ4730_GPIO_GPIER, false);
+		ingenic_config_pin(jzpc, pin, JZ4730_GPIO_GPDIR, !input);
+		jz4730_config_pin_function(jzpc, pin, JZ4730_GPIO_GPAUR, JZ4730_GPIO_GPALR, 0);
 	}
 
 	return 0;
@@ -2164,8 +2353,10 @@ static int ingenic_pinconf_get(struct pinctrl_dev *pctldev,
 	} else {
 		if (jzpc->info->version >= ID_JZ4770)
 			pull = !ingenic_get_pin_config(jzpc, pin, JZ4770_GPIO_PEN);
-		else
+		else if (jzpc->info->version >= ID_JZ4740)
 			pull = !ingenic_get_pin_config(jzpc, pin, JZ4740_GPIO_PULL_DIS);
+		else
+			pull = ingenic_get_pin_config(jzpc, pin, JZ4730_GPIO_GPPUR);
 
 		pullup = pull && (jzpc->info->pull_ups[offt] & BIT(idx));
 		pulldown = pull && (jzpc->info->pull_downs[offt] & BIT(idx));
@@ -2218,8 +2409,10 @@ static void ingenic_set_bias(struct ingenic_pinctrl *jzpc,
 
 	} else if (jzpc->info->version >= ID_JZ4770) {
 		ingenic_config_pin(jzpc, pin, JZ4770_GPIO_PEN, !bias);
-	} else {
+	} else if (jzpc->info->version >= ID_JZ4740) {
 		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_PULL_DIS, !bias);
+	} else {
+		ingenic_config_pin(jzpc, pin, JZ4730_GPIO_GPPUR, bias);
 	}
 }
 
@@ -2228,8 +2421,10 @@ static void ingenic_set_output_level(struct ingenic_pinctrl *jzpc,
 {
 	if (jzpc->info->version >= ID_JZ4770)
 		ingenic_config_pin(jzpc, pin, JZ4770_GPIO_PAT0, high);
-	else
+	else if (jzpc->info->version >= ID_JZ4740)
 		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_DATA, high);
+	else
+		ingenic_config_pin(jzpc, pin, JZ4730_GPIO_DATA, high);
 }
 
 static int ingenic_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
@@ -2358,6 +2553,7 @@ static const struct regmap_config ingenic_pinctrl_regmap_config = {
 };
 
 static const struct of_device_id ingenic_gpio_of_match[] __initconst = {
+	{ .compatible = "ingenic,jz4730-gpio", },
 	{ .compatible = "ingenic,jz4740-gpio", },
 	{ .compatible = "ingenic,jz4725b-gpio", },
 	{ .compatible = "ingenic,jz4760-gpio", },
@@ -2552,6 +2748,10 @@ static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
 
 static const struct of_device_id ingenic_pinctrl_of_match[] = {
 	{
+		.compatible = "ingenic,jz4730-pinctrl",
+		.data = IF_ENABLED(CONFIG_MACH_JZ4730, &jz4730_chip_info)
+	},
+	{
 		.compatible = "ingenic,jz4740-pinctrl",
 		.data = IF_ENABLED(CONFIG_MACH_JZ4740, &jz4740_chip_info)
 	},
-- 
2.7.4

