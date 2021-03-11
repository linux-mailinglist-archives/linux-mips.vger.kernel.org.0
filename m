Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D076E337703
	for <lists+linux-mips@lfdr.de>; Thu, 11 Mar 2021 16:23:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234167AbhCKPWs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 11 Mar 2021 10:22:48 -0500
Received: from out28-77.mail.aliyun.com ([115.124.28.77]:54383 "EHLO
        out28-77.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234114AbhCKPWj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 11 Mar 2021 10:22:39 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1001583|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0274045-9.70754e-05-0.972498;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047206;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.JjZCudb_1615476138;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.JjZCudb_1615476138)
          by smtp.aliyun-inc.com(10.147.41.120);
          Thu, 11 Mar 2021 23:22:27 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linus.walleij@linaro.org, robh+dt@kernel.org, paul@crapouillou.net
Cc:     linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        hns@goldelico.com, paul@boddie.org.uk, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, sernia.zhou@foxmail.com
Subject: [PATCH v2 2/6] pinctrl: Ingenic: Add support for read the pin configuration of X1830.
Date:   Thu, 11 Mar 2021 23:21:48 +0800
Message-Id: <1615476112-113101-3-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615476112-113101-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1615476112-113101-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add X1830 support in "ingenic_pinconf_get()", so that it can read the
configuration of X1830 SoC correctly.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v2:
    New patch.

 drivers/pinctrl/pinctrl-ingenic.c | 76 +++++++++++++++++++++++++++++----------
 1 file changed, 57 insertions(+), 19 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 05dfa0a..0a88aab 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -2109,31 +2109,69 @@ static int ingenic_pinconf_get(struct pinctrl_dev *pctldev,
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

