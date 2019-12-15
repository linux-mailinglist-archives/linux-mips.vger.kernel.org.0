Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4991511F8DE
	for <lists+linux-mips@lfdr.de>; Sun, 15 Dec 2019 17:23:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbfLOQVZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 15 Dec 2019 11:21:25 -0500
Received: from out28-195.mail.aliyun.com ([115.124.28.195]:40092 "EHLO
        out28-195.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726380AbfLOQVX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 15 Dec 2019 11:21:23 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07874978|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.377827-0.0269437-0.595229;DS=CONTINUE|ham_regular_dialog|0.0263372-0.00108787-0.972575;FP=0|0|0|0|0|-1|-1|-1;HT=e01a16378;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.GHgOK.D_1576426866;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GHgOK.D_1576426866)
          by smtp.aliyun-inc.com(10.147.41.143);
          Mon, 16 Dec 2019 00:21:16 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, paul@crapouillou.net,
        mark.rutland@arm.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, linus.walleij@linaro.org
Subject: [PATCH v8 3/5] pinctrl: Ingenic: Introduce reg_offset and use it instead hard code.
Date:   Mon, 16 Dec 2019 00:21:02 +0800
Message-Id: <1576426864-35348-5-git-send-email-zhouyanjie@wanyeetech.com>
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

Introduce "reg_offset", use it instead hard code "0x100",
it will also be used for subsequent X1830 pinctrl driver.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v8:
    New patch.

 drivers/pinctrl/pinctrl-ingenic.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index ca947fa..1644160 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -64,6 +64,7 @@ enum jz_version {
 
 struct ingenic_chip_info {
 	unsigned int num_chips;
+	unsigned int reg_offset;
 
 	const struct group_desc *groups;
 	unsigned int num_groups;
@@ -216,6 +217,7 @@ static const struct function_desc jz4740_functions[] = {
 
 static const struct ingenic_chip_info jz4740_chip_info = {
 	.num_chips = 4,
+	.reg_offset = 0x100,
 	.groups = jz4740_groups,
 	.num_groups = ARRAY_SIZE(jz4740_groups),
 	.functions = jz4740_functions,
@@ -339,6 +341,7 @@ static const struct function_desc jz4725b_functions[] = {
 
 static const struct ingenic_chip_info jz4725b_chip_info = {
 	.num_chips = 4,
+	.reg_offset = 0x100,
 	.groups = jz4725b_groups,
 	.num_groups = ARRAY_SIZE(jz4725b_groups),
 	.functions = jz4725b_functions,
@@ -592,6 +595,7 @@ static const struct function_desc jz4760_functions[] = {
 
 static const struct ingenic_chip_info jz4760_chip_info = {
 	.num_chips = 6,
+	.reg_offset = 0x100,
 	.groups = jz4760_groups,
 	.num_groups = ARRAY_SIZE(jz4760_groups),
 	.functions = jz4760_functions,
@@ -602,6 +606,7 @@ static const struct ingenic_chip_info jz4760_chip_info = {
 
 static const struct ingenic_chip_info jz4760b_chip_info = {
 	.num_chips = 6,
+	.reg_offset = 0x100,
 	.groups = jz4760_groups,
 	.num_groups = ARRAY_SIZE(jz4760_groups),
 	.functions = jz4760_functions,
@@ -880,6 +885,7 @@ static const struct function_desc jz4770_functions[] = {
 
 static const struct ingenic_chip_info jz4770_chip_info = {
 	.num_chips = 6,
+	.reg_offset = 0x100,
 	.groups = jz4770_groups,
 	.num_groups = ARRAY_SIZE(jz4770_groups),
 	.functions = jz4770_functions,
@@ -1013,6 +1019,7 @@ static const struct function_desc jz4780_functions[] = {
 
 static const struct ingenic_chip_info jz4780_chip_info = {
 	.num_chips = 6,
+	.reg_offset = 0x100,
 	.groups = jz4780_groups,
 	.num_groups = ARRAY_SIZE(jz4780_groups),
 	.functions = jz4780_functions,
@@ -1269,6 +1276,7 @@ static const struct function_desc x1000_functions[] = {
 
 static const struct ingenic_chip_info x1000_chip_info = {
 	.num_chips = 4,
+	.reg_offset = 0x100,
 	.groups = x1000_groups,
 	.num_groups = ARRAY_SIZE(x1000_groups),
 	.functions = x1000_functions,
@@ -1279,6 +1287,7 @@ static const struct ingenic_chip_info x1000_chip_info = {
 
 static const struct ingenic_chip_info x1000e_chip_info = {
 	.num_chips = 4,
+	.reg_offset = 0x100,
 	.groups = x1000_groups,
 	.num_groups = ARRAY_SIZE(x1000_groups),
 	.functions = x1000_functions,
@@ -1391,6 +1400,7 @@ static const struct function_desc x1500_functions[] = {
 
 static const struct ingenic_chip_info x1500_chip_info = {
 	.num_chips = 4,
+	.reg_offset = 0x100,
 	.groups = x1500_groups,
 	.num_groups = ARRAY_SIZE(x1500_groups),
 	.functions = x1500_functions,
@@ -1675,7 +1685,7 @@ static inline void ingenic_config_pin(struct ingenic_pinctrl *jzpc,
 	unsigned int idx = pin % PINS_PER_GPIO_CHIP;
 	unsigned int offt = pin / PINS_PER_GPIO_CHIP;
 
-	regmap_write(jzpc->map, offt * 0x100 +
+	regmap_write(jzpc->map, offt * jzpc->info->reg_offset +
 			(set ? REG_SET(reg) : REG_CLEAR(reg)), BIT(idx));
 }
 
@@ -1684,7 +1694,7 @@ static inline void ingenic_shadow_config_pin(struct ingenic_pinctrl *jzpc,
 {
 	unsigned int idx = pin % PINS_PER_GPIO_CHIP;
 
-	regmap_write(jzpc->map, X1000_GPIO_PZ_BASE +
+	regmap_write(jzpc->map, REG_PZ_BASE(jzpc->info->reg_offset) +
 			(set ? REG_SET(reg) : REG_CLEAR(reg)), BIT(idx));
 }
 
@@ -1701,7 +1711,7 @@ static inline bool ingenic_get_pin_config(struct ingenic_pinctrl *jzpc,
 	unsigned int offt = pin / PINS_PER_GPIO_CHIP;
 	unsigned int val;
 
-	regmap_read(jzpc->map, offt * 0x100 + reg, &val);
+	regmap_read(jzpc->map, offt * jzpc->info->reg_offset + reg, &val);
 
 	return val & BIT(idx);
 }
@@ -2045,7 +2055,7 @@ static int __init ingenic_gpio_probe(struct ingenic_pinctrl *jzpc,
 		return -ENOMEM;
 
 	jzgc->jzpc = jzpc;
-	jzgc->reg_base = bank * 0x100;
+	jzgc->reg_base = bank * jzpc->info->reg_offset;
 
 	jzgc->gc.label = devm_kasprintf(dev, GFP_KERNEL, "GPIO%c", 'A' + bank);
 	if (!jzgc->gc.label)
-- 
2.7.4

