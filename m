Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C36C2332C5B
	for <lists+linux-mips@lfdr.de>; Tue,  9 Mar 2021 17:42:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230492AbhCIQli (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 9 Mar 2021 11:41:38 -0500
Received: from out28-172.mail.aliyun.com ([115.124.28.172]:48736 "EHLO
        out28-172.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231386AbhCIQlb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 9 Mar 2021 11:41:31 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07436282|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0321826-0.000113673-0.967704;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047198;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.JibD5S0_1615308080;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.JibD5S0_1615308080)
          by smtp.aliyun-inc.com(10.147.40.44);
          Wed, 10 Mar 2021 00:41:27 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linus.walleij@linaro.org, robh+dt@kernel.org, paul@crapouillou.net
Cc:     linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        hns@goldelico.com, paul@boddie.org.uk, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, sernia.zhou@foxmail.com
Subject: [PATCH 1/3] pinctrl: Ingenic: Fix bug and reformat the code.
Date:   Wed, 10 Mar 2021 00:40:55 +0800
Message-Id: <1615308057-88387-2-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615308057-88387-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1615308057-88387-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.Add tabs before values to align the code in the macro definition section.
2.Fix bugs related to the MAC of JZ4770, add missing pins to the MII group.
3.Adjust the sequence of X1830's SSI related codes to make it consistent
  with other Ingenic SoCs.
4.Fix bug in "ingenic_pinconf_get()", so that it can read the configuration
  of X1830 SoC correctly.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---
 drivers/pinctrl/pinctrl-ingenic.c | 161 +++++++++++++++++++++++---------------
 1 file changed, 100 insertions(+), 61 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index f274612..ac5ad8a 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -26,37 +26,48 @@
 #include "pinconf.h"
 #include "pinmux.h"
 
-#define GPIO_PIN	0x00
-#define GPIO_MSK	0x20
+#define GPIO_PIN					0x00
+#define GPIO_MSK					0x20
 
-#define JZ4740_GPIO_DATA	0x10
-#define JZ4740_GPIO_PULL_DIS	0x30
-#define JZ4740_GPIO_FUNC	0x40
-#define JZ4740_GPIO_SELECT	0x50
-#define JZ4740_GPIO_DIR		0x60
-#define JZ4740_GPIO_TRIG	0x70
-#define JZ4740_GPIO_FLAG	0x80
+#define JZ4740_GPIO_DATA			0x10
+#define JZ4740_GPIO_PULL_DIS		0x30
+#define JZ4740_GPIO_FUNC			0x40
+#define JZ4740_GPIO_SELECT			0x50
+#define JZ4740_GPIO_DIR				0x60
+#define JZ4740_GPIO_TRIG			0x70
+#define JZ4740_GPIO_FLAG			0x80
 
-#define JZ4770_GPIO_INT		0x10
-#define JZ4770_GPIO_PAT1	0x30
-#define JZ4770_GPIO_PAT0	0x40
-#define JZ4770_GPIO_FLAG	0x50
-#define JZ4770_GPIO_PEN		0x70
+#define JZ4770_GPIO_INT				0x10
+#define JZ4770_GPIO_PAT1			0x30
+#define JZ4770_GPIO_PAT0			0x40
+#define JZ4770_GPIO_FLAG			0x50
+#define JZ4770_GPIO_PEN				0x70
 
-#define X1830_GPIO_PEL			0x110
-#define X1830_GPIO_PEH			0x120
+#define X1830_GPIO_PEL				0x110
+#define X1830_GPIO_PEH				0x120
 
-#define REG_SET(x) ((x) + 0x4)
-#define REG_CLEAR(x) ((x) + 0x8)
+#define REG_SET(x)					((x) + 0x4)
+#define REG_CLEAR(x)				((x) + 0x8)
 
-#define REG_PZ_BASE(x) ((x) * 7)
-#define REG_PZ_GID2LD(x) ((x) * 7 + 0xf0)
+#define REG_PZ_BASE(x)				((x) * 7)
+#define REG_PZ_GID2LD(x)			((x) * 7 + 0xf0)
 
-#define GPIO_PULL_DIS	0
-#define GPIO_PULL_UP	1
-#define GPIO_PULL_DOWN	2
+#define GPIO_PULL_DIS				0
+#define GPIO_PULL_UP				1
+#define GPIO_PULL_DOWN				2
 
-#define PINS_PER_GPIO_CHIP 32
+#define PINS_PER_GPIO_CHIP			32
+
+#define INGENIC_PIN_GROUP_FUNCS(name, id, funcs)		\
+	{						\
+		name,					\
+		id##_pins,				\
+		ARRAY_SIZE(id##_pins),			\
+		funcs,					\
+	}
+
+#define INGENIC_PIN_GROUP(name, id, func)		\
+	INGENIC_PIN_GROUP_FUNCS(name, id, (void *)(func))
 
 enum jz_version {
 	ID_JZ4740,
@@ -134,18 +145,6 @@ static int jz4740_pwm_pwm5_pins[] = { 0x7c, };
 static int jz4740_pwm_pwm6_pins[] = { 0x7e, };
 static int jz4740_pwm_pwm7_pins[] = { 0x7f, };
 
-
-#define INGENIC_PIN_GROUP_FUNCS(name, id, funcs)		\
-	{						\
-		name,					\
-		id##_pins,				\
-		ARRAY_SIZE(id##_pins),			\
-		funcs,					\
-	}
-
-#define INGENIC_PIN_GROUP(name, id, func)		\
-	INGENIC_PIN_GROUP_FUNCS(name, id, (void *)(func))
-
 static const struct group_desc jz4740_groups[] = {
 	INGENIC_PIN_GROUP("mmc-1bit", jz4740_mmc_1bit, 0),
 	INGENIC_PIN_GROUP("mmc-4bit", jz4740_mmc_4bit, 0),
@@ -667,7 +666,9 @@ static int jz4770_pwm_pwm7_pins[] = { 0x6b, };
 static int jz4770_mac_rmii_pins[] = {
 	0xa9, 0xab, 0xaa, 0xac, 0xa5, 0xa4, 0xad, 0xae, 0xa6, 0xa8,
 };
-static int jz4770_mac_mii_pins[] = { 0xa7, 0xaf, };
+static int jz4770_mac_mii_pins[] = {
+	0x7b, 0x7a, 0x7d, 0x7c, 0xa7, 0x24, 0xaf,
+};
 
 static const struct group_desc jz4770_groups[] = {
 	INGENIC_PIN_GROUP("uart0-data", jz4770_uart0_data, 0),
@@ -1471,16 +1472,16 @@ static int x1830_ssi0_gpc_pins[] = { 0x4d, };
 static int x1830_ssi0_ce0_pins[] = { 0x50, };
 static int x1830_ssi0_ce1_pins[] = { 0x4e, };
 static int x1830_ssi1_dt_c_pins[] = { 0x53, };
-static int x1830_ssi1_dr_c_pins[] = { 0x54, };
-static int x1830_ssi1_clk_c_pins[] = { 0x57, };
-static int x1830_ssi1_gpc_c_pins[] = { 0x55, };
-static int x1830_ssi1_ce0_c_pins[] = { 0x58, };
-static int x1830_ssi1_ce1_c_pins[] = { 0x56, };
 static int x1830_ssi1_dt_d_pins[] = { 0x62, };
+static int x1830_ssi1_dr_c_pins[] = { 0x54, };
 static int x1830_ssi1_dr_d_pins[] = { 0x63, };
+static int x1830_ssi1_clk_c_pins[] = { 0x57, };
 static int x1830_ssi1_clk_d_pins[] = { 0x66, };
+static int x1830_ssi1_gpc_c_pins[] = { 0x55, };
 static int x1830_ssi1_gpc_d_pins[] = { 0x64, };
+static int x1830_ssi1_ce0_c_pins[] = { 0x58, };
 static int x1830_ssi1_ce0_d_pins[] = { 0x67, };
+static int x1830_ssi1_ce1_c_pins[] = { 0x56, };
 static int x1830_ssi1_ce1_d_pins[] = { 0x65, };
 static int x1830_mmc0_1bit_pins[] = { 0x24, 0x25, 0x20, };
 static int x1830_mmc0_4bit_pins[] = { 0x21, 0x22, 0x23, };
@@ -2107,31 +2108,69 @@ static int ingenic_pinconf_get(struct pinctrl_dev *pctldev,
 	enum pin_config_param param = pinconf_to_config_param(*config);
 	unsigned int idx = pin % PINS_PER_GPIO_CHIP;
 	unsigned int offt = pin / PINS_PER_GPIO_CHIP;
+	unsigned int bias;
 	bool pull;
 
-	if (jzpc->info->version >= ID_JZ4770)
-		pull = !ingenic_get_pin_config(jzpc, pin, JZ4770_GPIO_PEN);
-	else
-		pull = !ingenic_get_pin_config(jzpc, pin, JZ4740_GPIO_PULL_DIS);
+	if (jzpc->info->version >= ID_X1830) {
+		unsigned int half = PINS_PER_GPIO_CHIP / 2;
+		unsigned int idxh = pin % half * 2;
 
-	switch (param) {
-	case PIN_CONFIG_BIAS_DISABLE:
-		if (pull)
-			return -EINVAL;
-		break;
+		if (idx < half)
+			regmap_read(jzpc->map, offt * jzpc->info->reg_offset +
+					X1830_GPIO_PEL, &bias);
+		else
+			regmap_read(jzpc->map, offt * jzpc->info->reg_offset +
+					X1830_GPIO_PEH, &bias);
 
-	case PIN_CONFIG_BIAS_PULL_UP:
-		if (!pull || !(jzpc->info->pull_ups[offt] & BIT(idx)))
-			return -EINVAL;
-		break;
+		bias = (bias >> idxh) & 3;
 
-	case PIN_CONFIG_BIAS_PULL_DOWN:
-		if (!pull || !(jzpc->info->pull_downs[offt] & BIT(idx)))
-			return -EINVAL;
-		break;
+		switch (param) {
+		case PIN_CONFIG_BIAS_DISABLE:
+			if (bias)
+				return -EINVAL;
+			break;
 
-	default:
-		return -ENOTSUPP;
+		case PIN_CONFIG_BIAS_PULL_UP:
+			if ((bias != PIN_CONFIG_BIAS_PULL_UP) ||
+					!(jzpc->info->pull_ups[offt] & BIT(idx)))
+				return -EINVAL;
+			break;
+
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			if ((bias != PIN_CONFIG_BIAS_PULL_DOWN) ||
+					!(jzpc->info->pull_downs[offt] & BIT(idx)))
+				return -EINVAL;
+			break;
+
+		default:
+			return -ENOTSUPP;
+		}
+
+	} else {
+		if (jzpc->info->version >= ID_JZ4770)
+			pull = !ingenic_get_pin_config(jzpc, pin, JZ4770_GPIO_PEN);
+		else
+			pull = !ingenic_get_pin_config(jzpc, pin, JZ4740_GPIO_PULL_DIS);
+
+		switch (param) {
+		case PIN_CONFIG_BIAS_DISABLE:
+			if (pull)
+				return -EINVAL;
+			break;
+
+		case PIN_CONFIG_BIAS_PULL_UP:
+			if (!pull || !(jzpc->info->pull_ups[offt] & BIT(idx)))
+				return -EINVAL;
+			break;
+
+		case PIN_CONFIG_BIAS_PULL_DOWN:
+			if (!pull || !(jzpc->info->pull_downs[offt] & BIT(idx)))
+				return -EINVAL;
+			break;
+
+		default:
+			return -ENOTSUPP;
+		}
 	}
 
 	*config = pinconf_to_config_packed(param, 1);
-- 
2.7.4

