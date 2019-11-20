Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0A2D103CD7
	for <lists+linux-mips@lfdr.de>; Wed, 20 Nov 2019 15:00:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730565AbfKTOAk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 Nov 2019 09:00:40 -0500
Received: from sender4-pp-o98.zoho.com ([136.143.188.98]:25867 "EHLO
        sender4-pp-o98.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727988AbfKTOAk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 Nov 2019 09:00:40 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1574258400; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=YYLtCYA2qgvEfAgM5moO8VR/XMhk7N6Ok3zvQQ9MquT4j5nDGGzqhyY6dFmHbcq9FaGqA/14KMxSYyGOtMJMzZfWWUPbzCSoqSz+mAiWR7NH8t03bMLX9j0pSpvRLGGy6z+MwRQr8zGhuoHyzG9RPSs9Jq03FsQ5/01yEv8Jge0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1574258400; h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To; 
        bh=t2lhFpkqd5698+2WbfNipy/3xTYR78xDHIcfmYxuKEg=; 
        b=HqcmNfMw2MFuAEothV7Zw7u7nJfZANnr2jt+43ewVz/uWJHUhbMvvxBMI4NLRCtUa4HfAf5xKMNZgf/E2PcxT0vvWkVxKjV3llkzBmvXNz8ZKxNDpFrUvWMTWOSsct2NJ80xK4uVTgqTq2oeYPvDjYQqSqWSRVoRWkLTN2ASpnQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=zoho.com;
        spf=pass  smtp.mailfrom=zhouyanjie@zoho.com;
        dmarc=pass header.from=<zhouyanjie@zoho.com> header.from=<zhouyanjie@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; 
  s=zapps768; d=zoho.com; 
  h=from:to:cc:subject:date:message-id:in-reply-to:references; 
  b=a/pF+8cHEq+SuJMZYnjtzfd979b69kEDacf4q0zIJ17ITLTWKcTKEveIKz7vu2vQhn2lbW/dMGH6
    vhpzhp6vpwrt0DLSJYSiDR5gIG9dn9JZg1HzBnE5geUKO43ITATS  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1574258400;
        s=zm2019; d=zoho.com; i=zhouyanjie@zoho.com;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        l=15782; bh=t2lhFpkqd5698+2WbfNipy/3xTYR78xDHIcfmYxuKEg=;
        b=KAVtHAy6ilSmJM/VdPk3wZkp/Dx+Awc4wyHy+xbl3nG0Dilmgk3ReE8H9Sv1AYCO
        q7QenzyNw6kF5WLmZ2CiFj0IpVA5UqWtjYQ5janRxsTrFr3FdMkImLg7SXiniVP7xTI
        Iv+qXSkPhjuBVi/Ma0I7aUC0Gn1iAGiHDWrDgflY=
Received: from zhouyanjie-virtual-machine.localdomain (171.221.112.99 [171.221.112.99]) by mx.zohomail.com
        with SMTPS id 1574258399968775.0086655390869; Wed, 20 Nov 2019 05:59:59 -0800 (PST)
From:   Zhou Yanjie <zhouyanjie@zoho.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, paulburton@kernel.org,
        paul.burton@mips.com, linus.walleij@linaro.org,
        paul@crapouillou.net, robh+dt@kernel.org, mark.rutland@arm.com,
        syq@debian.org
Subject: [PATCH v2 4/4] pinctrl: Ingenic: Add pinctrl driver for X1830.
Date:   Wed, 20 Nov 2019 21:59:03 +0800
Message-Id: <1574258343-122458-5-git-send-email-zhouyanjie@zoho.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574258343-122458-1-git-send-email-zhouyanjie@zoho.com>
References: <1573804011-2176-1-git-send-email-zhouyanjie@zoho.com>
 <1574258343-122458-1-git-send-email-zhouyanjie@zoho.com>
X-ZohoMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add support for probing the pinctrl-ingenic driver on the
X1830 Soc from Ingenic.

Signed-off-by: Zhou Yanjie <zhouyanjie@zoho.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 263 +++++++++++++++++++++++++++++++++++---
 1 file changed, 245 insertions(+), 18 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index d578a74..554bc2c 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -28,6 +28,10 @@
 #define GPIO_PIN	0x00
 #define GPIO_MSK	0x20
 
+#define GPIO_HIZ		0x00
+#define GPIO_PULLUP		0x01
+#define GPIO_PULLDOWN	0x10
+
 #define JZ4740_GPIO_DATA	0x10
 #define JZ4740_GPIO_PULL_DIS	0x30
 #define JZ4740_GPIO_FUNC	0x40
@@ -45,6 +49,11 @@
 #define X1000_GPIO_PZ_BASE		0x700
 #define X1000_GPIO_PZ_GID2LD	0x7f0
 
+#define X1830_GPIO_PEL0			0x110
+#define X1830_GPIO_PEL1			0x120
+#define X1830_GPIO_PZ_BASE		0x7000
+#define X1830_GPIO_PZ_GID2LD	0x70f0
+
 #define REG_SET(x) ((x) + 0x4)
 #define REG_CLEAR(x) ((x) + 0x8)
 
@@ -60,6 +69,7 @@ enum jz_version {
 	ID_X1000,
 	ID_X1000E,
 	ID_X1500,
+	ID_X1830,
 };
 
 struct ingenic_chip_info {
@@ -1394,6 +1404,156 @@ static const struct ingenic_chip_info x1500_chip_info = {
 	.pull_downs = x1000_pull_downs,
 };
 
+static const u32 x1830_pull_ups[4] = {
+	0x5fdfffc0, 0xffffefff, 0x1ffffbff, 0x0fcff3fc,
+};
+
+static const u32 x1830_pull_downs[4] = {
+	0x5fdfffc0, 0xffffefff, 0x1ffffbff, 0x0fcff3fc,
+};
+
+static int x1830_uart0_data_pins[] = { 0x33, 0x36, };
+static int x1830_uart0_hwflow_pins[] = { 0x34, 0x35, };
+static int x1830_uart1_data_pins[] = { 0x38, 0x37, };
+static int x1830_sfc_pins[] = { 0x17, 0x18, 0x1a, 0x19, 0x1b, 0x1c, };
+static int x1830_ssi0_dt_pins[] = { 0x4c, };
+static int x1830_ssi0_dr_pins[] = { 0x4b, };
+static int x1830_ssi0_clk_pins[] = { 0x4f, };
+static int x1830_ssi0_gpc_pins[] = { 0x4d, };
+static int x1830_ssi0_ce0_pins[] = { 0x50, };
+static int x1830_ssi0_ce1_pins[] = { 0x4e, };
+static int x1830_ssi1_dt_c_pins[] = { 0x53, };
+static int x1830_ssi1_dr_c_pins[] = { 0x54, };
+static int x1830_ssi1_clk_c_pins[] = { 0x57, };
+static int x1830_ssi1_gpc_c_pins[] = { 0x55, };
+static int x1830_ssi1_ce0_c_pins[] = { 0x58, };
+static int x1830_ssi1_ce1_c_pins[] = { 0x56, };
+static int x1830_ssi1_dt_d_pins[] = { 0x62, };
+static int x1830_ssi1_dr_d_pins[] = { 0x63, };
+static int x1830_ssi1_clk_d_pins[] = { 0x66, };
+static int x1830_ssi1_gpc_d_pins[] = { 0x64, };
+static int x1830_ssi1_ce0_d_pins[] = { 0x67, };
+static int x1830_ssi1_ce1_d_pins[] = { 0x65, };
+static int x1830_mmc0_1bit_pins[] = { 0x24, 0x25, 0x20, };
+static int x1830_mmc0_4bit_pins[] = { 0x21, 0x22, 0x23, };
+static int x1830_mmc1_1bit_pins[] = { 0x42, 0x43, 0x44, };
+static int x1830_mmc1_4bit_pins[] = { 0x45, 0x46, 0x47, };
+static int x1830_i2c0_pins[] = { 0x0c, 0x0d, };
+static int x1830_i2c1_pins[] = { 0x39, 0x3a, };
+static int x1830_i2c2_pins[] = { 0x5b, 0x5c, };
+static int x1830_mac_pins[] = {
+	0x29, 0x30, 0x2f, 0x28, 0x2e, 0x2d, 0x2a, 0x2b, 0x26, 0x27,
+};
+
+static int x1830_uart0_data_funcs[] = { 0, 0, };
+static int x1830_uart0_hwflow_funcs[] = { 0, 0, };
+static int x1830_uart1_data_funcs[] = { 0, 0, };
+static int x1830_sfc_funcs[] = { 1, 1, 1, 1, 1, 1, };
+static int x1830_ssi0_dt_funcs[] = { 0, };
+static int x1830_ssi0_dr_funcs[] = { 0, };
+static int x1830_ssi0_clk_funcs[] = { 0, };
+static int x1830_ssi0_gpc_funcs[] = { 0, };
+static int x1830_ssi0_ce0_funcs[] = { 0, };
+static int x1830_ssi0_ce1_funcs[] = { 0, };
+static int x1830_ssi1_dt_c_funcs[] = { 1, };
+static int x1830_ssi1_dr_c_funcs[] = { 1, };
+static int x1830_ssi1_clk_c_funcs[] = { 1, };
+static int x1830_ssi1_gpc_c_funcs[] = { 1, };
+static int x1830_ssi1_ce0_c_funcs[] = { 1, };
+static int x1830_ssi1_ce1_c_funcs[] = { 1, };
+static int x1830_ssi1_dt_d_funcs[] = { 2, };
+static int x1830_ssi1_dr_d_funcs[] = { 2, };
+static int x1830_ssi1_clk_d_funcs[] = { 2, };
+static int x1830_ssi1_gpc_d_funcs[] = { 2, };
+static int x1830_ssi1_ce0_d_funcs[] = { 2, };
+static int x1830_ssi1_ce1_d_funcs[] = { 2, };
+static int x1830_mmc0_1bit_funcs[] = { 0, 0, 0, };
+static int x1830_mmc0_4bit_funcs[] = { 0, 0, 0, };
+static int x1830_mmc1_1bit_funcs[] = { 0, 0, 0, };
+static int x1830_mmc1_4bit_funcs[] = { 0, 0, 0, };
+static int x1830_i2c0_funcs[] = { 1, 1, };
+static int x1830_i2c1_funcs[] = { 0, 0, };
+static int x1830_i2c2_funcs[] = { 1, 1, };
+static int x1830_mac_funcs[] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, };
+
+static const struct group_desc x1830_groups[] = {
+	INGENIC_PIN_GROUP("uart0-data", x1830_uart0_data),
+	INGENIC_PIN_GROUP("uart0-hwflow", x1830_uart0_hwflow),
+	INGENIC_PIN_GROUP("uart1-data", x1830_uart1_data),
+	INGENIC_PIN_GROUP("sfc", x1830_sfc),
+	INGENIC_PIN_GROUP("ssi0_dt", x1830_ssi0_dt),
+	INGENIC_PIN_GROUP("ssi0_dr", x1830_ssi0_dr),
+	INGENIC_PIN_GROUP("ssi0_clk", x1830_ssi0_clk),
+	INGENIC_PIN_GROUP("ssi0_gpc", x1830_ssi0_gpc),
+	INGENIC_PIN_GROUP("ssi0_ce0", x1830_ssi0_ce0),
+	INGENIC_PIN_GROUP("ssi0_ce1", x1830_ssi0_ce1),
+	INGENIC_PIN_GROUP("ssi1_dt_c", x1830_ssi1_dt_c),
+	INGENIC_PIN_GROUP("ssi1_dr_c", x1830_ssi1_dr_c),
+	INGENIC_PIN_GROUP("ssi1_clk_c", x1830_ssi1_clk_c),
+	INGENIC_PIN_GROUP("ssi1_gpc_c", x1830_ssi1_gpc_c),
+	INGENIC_PIN_GROUP("ssi1_ce0_c", x1830_ssi1_ce0_c),
+	INGENIC_PIN_GROUP("ssi1_ce1_c", x1830_ssi1_ce1_c),
+	INGENIC_PIN_GROUP("ssi1_dt_d", x1830_ssi1_dt_d),
+	INGENIC_PIN_GROUP("ssi1_dr_d", x1830_ssi1_dr_d),
+	INGENIC_PIN_GROUP("ssi1_clk_d", x1830_ssi1_clk_d),
+	INGENIC_PIN_GROUP("ssi1_gpc_d", x1830_ssi1_gpc_d),
+	INGENIC_PIN_GROUP("ssi1_ce0_d", x1830_ssi1_ce0_d),
+	INGENIC_PIN_GROUP("ssi1_ce1_d", x1830_ssi1_ce1_d),
+	INGENIC_PIN_GROUP("mmc0-1bit", x1830_mmc0_1bit),
+	INGENIC_PIN_GROUP("mmc0-4bit", x1830_mmc0_4bit),
+	INGENIC_PIN_GROUP("mmc1-1bit", x1830_mmc1_1bit),
+	INGENIC_PIN_GROUP("mmc1-4bit", x1830_mmc1_4bit),
+	INGENIC_PIN_GROUP("i2c0-data", x1830_i2c0),
+	INGENIC_PIN_GROUP("i2c1-data", x1830_i2c1),
+	INGENIC_PIN_GROUP("i2c2-data", x1830_i2c2),
+	INGENIC_PIN_GROUP("mac", x1830_mac),
+};
+
+static const char *x1830_uart0_groups[] = { "uart0-data", "uart0-hwflow", };
+static const char *x1830_uart1_groups[] = { "uart1-data", };
+static const char *x1830_sfc_groups[] = { "sfc", };
+static const char *x1830_ssi0_groups[] = {
+	"ssi0_dt", "ssi0_dr", "ssi0_clk", "ssi0_gpc", "ssi0_ce0", "ssi0_ce1",
+};
+static const char *x1830_ssi1_groups[] = {
+	"ssi1_dt_c", "ssi1_dt_d",
+	"ssi1_dr_c", "ssi1_dr_d",
+	"ssi1_clk_c", "ssi1_clk_d",
+	"ssi1_gpc_c", "ssi1_gpc_d",
+	"ssi1_ce0_c", "ssi1_ce0_d",
+	"ssi1_ce1_c", "ssi1_ce1_d",
+};
+static const char *x1830_mmc0_groups[] = { "mmc0-1bit", "mmc0-4bit", };
+static const char *x1830_mmc1_groups[] = { "mmc1-1bit", "mmc1-4bit", };
+static const char *x1830_i2c0_groups[] = { "i2c0-data", };
+static const char *x1830_i2c1_groups[] = { "i2c1-data", };
+static const char *x1830_i2c2_groups[] = { "i2c2-data", };
+static const char *x1830_mac_groups[] = { "mac", };
+
+static const struct function_desc x1830_functions[] = {
+	{ "uart0", x1830_uart0_groups, ARRAY_SIZE(x1830_uart0_groups), },
+	{ "uart1", x1830_uart1_groups, ARRAY_SIZE(x1830_uart1_groups), },
+	{ "sfc", x1830_sfc_groups, ARRAY_SIZE(x1830_sfc_groups), },
+	{ "ssi0", x1830_ssi0_groups, ARRAY_SIZE(x1830_ssi0_groups), },
+	{ "ssi1", x1830_ssi1_groups, ARRAY_SIZE(x1830_ssi1_groups), },
+	{ "mmc0", x1830_mmc0_groups, ARRAY_SIZE(x1830_mmc0_groups), },
+	{ "mmc1", x1830_mmc1_groups, ARRAY_SIZE(x1830_mmc1_groups), },
+	{ "i2c0", x1830_i2c0_groups, ARRAY_SIZE(x1830_i2c0_groups), },
+	{ "i2c1", x1830_i2c1_groups, ARRAY_SIZE(x1830_i2c1_groups), },
+	{ "i2c2", x1830_i2c2_groups, ARRAY_SIZE(x1830_i2c2_groups), },
+	{ "mac", x1830_mac_groups, ARRAY_SIZE(x1830_mac_groups), },
+};
+
+static const struct ingenic_chip_info x1830_chip_info = {
+	.num_chips = 4,
+	.groups = x1830_groups,
+	.num_groups = ARRAY_SIZE(x1830_groups),
+	.functions = x1830_functions,
+	.num_functions = ARRAY_SIZE(x1830_functions),
+	.pull_ups = x1830_pull_ups,
+	.pull_downs = x1830_pull_downs,
+};
+
 static u32 ingenic_gpio_read_reg(struct ingenic_gpio_chip *jzgc, u8 reg)
 {
 	unsigned int val;
@@ -1422,13 +1582,20 @@ static void ingenic_gpio_shadow_set_bit(struct ingenic_gpio_chip *jzgc,
 	else
 		reg = REG_CLEAR(reg);
 
-	regmap_write(jzgc->jzpc->map, X1000_GPIO_PZ_BASE + reg, BIT(offset));
+	if (jzgc->jzpc->version >= ID_X1830)
+		regmap_write(jzgc->jzpc->map, X1830_GPIO_PZ_BASE + reg, BIT(offset));
+	else
+		regmap_write(jzgc->jzpc->map, X1000_GPIO_PZ_BASE + reg, BIT(offset));
 }
 
 static void ingenic_gpio_shadow_set_bit_load(struct ingenic_gpio_chip *jzgc)
 {
-	regmap_write(jzgc->jzpc->map, X1000_GPIO_PZ_GID2LD,
-			jzgc->gc.base / PINS_PER_GPIO_CHIP);
+	if (jzgc->jzpc->version >= ID_X1830)
+		regmap_write(jzgc->jzpc->map, X1830_GPIO_PZ_GID2LD,
+				jzgc->gc.base / PINS_PER_GPIO_CHIP);
+	else
+		regmap_write(jzgc->jzpc->map, X1000_GPIO_PZ_GID2LD,
+				jzgc->gc.base / PINS_PER_GPIO_CHIP);
 }
 
 static inline bool ingenic_gpio_get_value(struct ingenic_gpio_chip *jzgc,
@@ -1670,8 +1837,12 @@ static inline void ingenic_config_pin(struct ingenic_pinctrl *jzpc,
 	unsigned int idx = pin % PINS_PER_GPIO_CHIP;
 	unsigned int offt = pin / PINS_PER_GPIO_CHIP;
 
-	regmap_write(jzpc->map, offt * 0x100 +
-			(set ? REG_SET(reg) : REG_CLEAR(reg)), BIT(idx));
+	if (jzpc->version >= ID_X1830)
+		regmap_write(jzpc->map, offt * 0x1000 +
+				(set ? REG_SET(reg) : REG_CLEAR(reg)), BIT(idx));
+	else
+		regmap_write(jzpc->map, offt * 0x100 +
+				(set ? REG_SET(reg) : REG_CLEAR(reg)), BIT(idx));
 }
 
 static inline void ingenic_shadow_config_pin(struct ingenic_pinctrl *jzpc,
@@ -1679,14 +1850,23 @@ static inline void ingenic_shadow_config_pin(struct ingenic_pinctrl *jzpc,
 {
 	unsigned int idx = pin % PINS_PER_GPIO_CHIP;
 
-	regmap_write(jzpc->map, X1000_GPIO_PZ_BASE +
-			(set ? REG_SET(reg) : REG_CLEAR(reg)), BIT(idx));
+	if (jzpc->version >= ID_X1830)
+		regmap_write(jzpc->map, X1830_GPIO_PZ_BASE +
+				(set ? REG_SET(reg) : REG_CLEAR(reg)), BIT(idx));
+	else
+		regmap_write(jzpc->map, X1000_GPIO_PZ_BASE +
+				(set ? REG_SET(reg) : REG_CLEAR(reg)), BIT(idx));
 }
 
 static inline void ingenic_shadow_config_pin_load(struct ingenic_pinctrl *jzpc,
 		unsigned int pin)
 {
-	regmap_write(jzpc->map, X1000_GPIO_PZ_GID2LD, pin / PINS_PER_GPIO_CHIP);
+	if (jzpc->version >= ID_X1830)
+		regmap_write(jzpc->map, X1830_GPIO_PZ_GID2LD,
+				pin / PINS_PER_GPIO_CHIP);
+	else
+		regmap_write(jzpc->map, X1000_GPIO_PZ_GID2LD,
+				pin / PINS_PER_GPIO_CHIP);
 }
 
 static inline bool ingenic_get_pin_config(struct ingenic_pinctrl *jzpc,
@@ -1696,7 +1876,10 @@ static inline bool ingenic_get_pin_config(struct ingenic_pinctrl *jzpc,
 	unsigned int offt = pin / PINS_PER_GPIO_CHIP;
 	unsigned int val;
 
-	regmap_read(jzpc->map, offt * 0x100 + reg, &val);
+	if (jzpc->version >= ID_X1830)
+		regmap_read(jzpc->map, offt * 0x1000 + reg, &val);
+	else
+		regmap_read(jzpc->map, offt * 0x100 + reg, &val);
 
 	return val & BIT(idx);
 }
@@ -1857,12 +2040,48 @@ static int ingenic_pinconf_get(struct pinctrl_dev *pctldev,
 }
 
 static void ingenic_set_bias(struct ingenic_pinctrl *jzpc,
-		unsigned int pin, bool enabled)
+		unsigned int pin, unsigned int bias)
 {
-	if (jzpc->version >= ID_JZ4760)
-		ingenic_config_pin(jzpc, pin, JZ4760_GPIO_PEN, !enabled);
+	if (jzpc->version >= ID_X1830) {
+		unsigned int idx = pin % PINS_PER_GPIO_CHIP;
+		unsigned int offt = pin / PINS_PER_GPIO_CHIP;
+
+		if (bias == GPIO_HIZ) {
+			if (idx < (PINS_PER_GPIO_CHIP / 2))
+				regmap_write(jzpc->map, offt * 0x1000 +
+						REG_CLEAR(X1830_GPIO_PEL0), BIT(idx * 2) * 3);
+			else
+				regmap_write(jzpc->map, offt * 0x1000 +
+						REG_CLEAR(X1830_GPIO_PEL1), BIT(idx % 16 * 2) * 3);
+		} else if (bias == GPIO_PULLUP) {
+			if (idx < (PINS_PER_GPIO_CHIP / 2)) {
+				regmap_write(jzpc->map, offt * 0x1000 +
+						REG_SET(X1830_GPIO_PEL0), BIT(idx * 2));
+				regmap_write(jzpc->map, offt * 0x1000 +
+						REG_CLEAR(X1830_GPIO_PEL0), BIT(idx * 2) * 2);
+			} else {
+				regmap_write(jzpc->map, offt * 0x1000 +
+						REG_SET(X1830_GPIO_PEL1), BIT(idx % 16 * 2));
+				regmap_write(jzpc->map, offt * 0x1000 +
+						REG_CLEAR(X1830_GPIO_PEL1), BIT(idx % 16 * 2) * 2);
+			}
+		} else {
+			if (idx < (PINS_PER_GPIO_CHIP / 2)) {
+				regmap_write(jzpc->map, offt * 0x1000 +
+						REG_CLEAR(X1830_GPIO_PEL0), BIT(idx * 2));
+				regmap_write(jzpc->map, offt * 0x1000 +
+						REG_SET(X1830_GPIO_PEL0), BIT(idx * 2) * 2);
+			} else {
+				regmap_write(jzpc->map, offt * 0x1000 +
+						REG_CLEAR(X1830_GPIO_PEL1), BIT(idx % 16 * 2));
+				regmap_write(jzpc->map, offt * 0x1000 +
+						REG_SET(X1830_GPIO_PEL1), BIT(idx % 16 * 2) * 2);
+			}
+		}
+	} else if (jzpc->version >= ID_JZ4760)
+		ingenic_config_pin(jzpc, pin, JZ4760_GPIO_PEN, !bias);
 	else
-		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_PULL_DIS, !enabled);
+		ingenic_config_pin(jzpc, pin, JZ4740_GPIO_PULL_DIS, !bias);
 }
 
 static int ingenic_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
@@ -1889,7 +2108,7 @@ static int ingenic_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 		case PIN_CONFIG_BIAS_DISABLE:
 			dev_dbg(jzpc->dev, "disable pull-over for pin P%c%u\n",
 					'A' + offt, idx);
-			ingenic_set_bias(jzpc, pin, false);
+			ingenic_set_bias(jzpc, pin, GPIO_HIZ);
 			break;
 
 		case PIN_CONFIG_BIAS_PULL_UP:
@@ -1897,7 +2116,7 @@ static int ingenic_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 				return -EINVAL;
 			dev_dbg(jzpc->dev, "set pull-up for pin P%c%u\n",
 					'A' + offt, idx);
-			ingenic_set_bias(jzpc, pin, true);
+			ingenic_set_bias(jzpc, pin, GPIO_PULLUP);
 			break;
 
 		case PIN_CONFIG_BIAS_PULL_DOWN:
@@ -1905,7 +2124,7 @@ static int ingenic_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 				return -EINVAL;
 			dev_dbg(jzpc->dev, "set pull-down for pin P%c%u\n",
 					'A' + offt, idx);
-			ingenic_set_bias(jzpc, pin, true);
+			ingenic_set_bias(jzpc, pin, GPIO_PULLDOWN);
 			break;
 
 		default:
@@ -1987,6 +2206,7 @@ static const struct of_device_id ingenic_pinctrl_of_match[] = {
 	{ .compatible = "ingenic,x1000-pinctrl", .data = (void *) ID_X1000 },
 	{ .compatible = "ingenic,x1000e-pinctrl", .data = (void *) ID_X1000E },
 	{ .compatible = "ingenic,x1500-pinctrl", .data = (void *) ID_X1500 },
+	{ .compatible = "ingenic,x1830-pinctrl", .data = (void *) ID_X1830 },
 	{},
 };
 
@@ -1996,6 +2216,7 @@ static const struct of_device_id ingenic_gpio_of_match[] __initconst = {
 	{ .compatible = "ingenic,jz4770-gpio", },
 	{ .compatible = "ingenic,jz4780-gpio", },
 	{ .compatible = "ingenic,x1000-gpio", },
+	{ .compatible = "ingenic,x1830-gpio", },
 	{},
 };
 
@@ -2018,7 +2239,10 @@ static int __init ingenic_gpio_probe(struct ingenic_pinctrl *jzpc,
 		return -ENOMEM;
 
 	jzgc->jzpc = jzpc;
-	jzgc->reg_base = bank * 0x100;
+	if (jzpc->version >= ID_X1830)
+		jzgc->reg_base = bank * 0x1000;
+	else
+		jzgc->reg_base = bank * 0x100;
 
 	jzgc->gc.label = devm_kasprintf(dev, GFP_KERNEL, "GPIO%c", 'A' + bank);
 	if (!jzgc->gc.label)
@@ -2111,7 +2335,9 @@ static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
 	else
 		jzpc->version = (enum jz_version)id->driver_data;
 
-	if (jzpc->version >= ID_X1500)
+	if (jzpc->version >= ID_X1830)
+		chip_info = &x1830_chip_info;
+	else if (jzpc->version >= ID_X1500)
 		chip_info = &x1500_chip_info;
 	else if (jzpc->version >= ID_X1000E)
 		chip_info = &x1000e_chip_info;
@@ -2208,6 +2434,7 @@ static const struct platform_device_id ingenic_pinctrl_ids[] = {
 	{ "x1000-pinctrl", ID_X1000 },
 	{ "x1000e-pinctrl", ID_X1000E },
 	{ "x1500-pinctrl", ID_X1500 },
+	{ "x1830-pinctrl", ID_X1830 },
 	{},
 };
 
-- 
2.7.4


