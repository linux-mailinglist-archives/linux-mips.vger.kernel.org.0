Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABE0F33EDB8
	for <lists+linux-mips@lfdr.de>; Wed, 17 Mar 2021 10:59:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbhCQJ6l (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Mar 2021 05:58:41 -0400
Received: from out28-149.mail.aliyun.com ([115.124.28.149]:36438 "EHLO
        out28-149.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230032AbhCQJ6W (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Mar 2021 05:58:22 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.2338176|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0278291-0.000114168-0.972057;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047207;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.JmJVfKa_1615975087;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.JmJVfKa_1615975087)
          by smtp.aliyun-inc.com(10.147.40.200);
          Wed, 17 Mar 2021 17:58:19 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linus.walleij@linaro.org, robh+dt@kernel.org, paul@crapouillou.net
Cc:     linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        hns@goldelico.com, paul@boddie.org.uk, andy.shevchenko@gmail.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        sernia.zhou@foxmail.com
Subject: [PATCH v3 02/10] pinctrl: Ingenic: Add support for read the pin configuration of X1830.
Date:   Wed, 17 Mar 2021 17:57:56 +0800
Message-Id: <1615975084-68203-3-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615975084-68203-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1615975084-68203-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add X1830 support in "ingenic_pinconf_get()", so that it can read the
configuration of X1830 SoC correctly.

Fixes: d7da2a1e4e08 ("pinctrl: Ingenic: Add pinctrl driver for X1830.")

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v2:
    New patch.
    
    v2->v3:
    1.Add fixes tag.
    2.Adjust the code, simplify the ingenic_pinconf_get() function.

 drivers/pinctrl/pinctrl-ingenic.c | 38 ++++++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 05dfa0a..1d43b98 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -2109,26 +2109,48 @@ static int ingenic_pinconf_get(struct pinctrl_dev *pctldev,
 	enum pin_config_param param = pinconf_to_config_param(*config);
 	unsigned int idx = pin % PINS_PER_GPIO_CHIP;
 	unsigned int offt = pin / PINS_PER_GPIO_CHIP;
-	bool pull;
+	unsigned int bias;
+	bool pull, pullup, pulldown;
 
-	if (jzpc->info->version >= ID_JZ4770)
-		pull = !ingenic_get_pin_config(jzpc, pin, JZ4770_GPIO_PEN);
-	else
-		pull = !ingenic_get_pin_config(jzpc, pin, JZ4740_GPIO_PULL_DIS);
+	if (jzpc->info->version >= ID_X1830) {
+		unsigned int half = PINS_PER_GPIO_CHIP / 2;
+		unsigned int idxh = pin % half * 2;
+
+		if (idx < half)
+			regmap_read(jzpc->map, offt * jzpc->info->reg_offset +
+					X1830_GPIO_PEL, &bias);
+		else
+			regmap_read(jzpc->map, offt * jzpc->info->reg_offset +
+					X1830_GPIO_PEH, &bias);
+
+		bias = (bias >> idxh) & (GPIO_PULL_UP | GPIO_PULL_DOWN);
+
+		pullup = (bias == GPIO_PULL_UP) && (jzpc->info->pull_ups[offt] & BIT(idx));
+		pulldown = (bias == GPIO_PULL_DOWN) && (jzpc->info->pull_downs[offt] & BIT(idx));
+
+	} else {
+		if (jzpc->info->version >= ID_JZ4770)
+			pull = !ingenic_get_pin_config(jzpc, pin, JZ4770_GPIO_PEN);
+		else
+			pull = !ingenic_get_pin_config(jzpc, pin, JZ4740_GPIO_PULL_DIS);
+
+		pullup = pull && (jzpc->info->pull_ups[offt] & BIT(idx));
+		pulldown = pull && (jzpc->info->pull_downs[offt] & BIT(idx));
+	}
 
 	switch (param) {
 	case PIN_CONFIG_BIAS_DISABLE:
-		if (pull)
+		if (pullup || pulldown)
 			return -EINVAL;
 		break;
 
 	case PIN_CONFIG_BIAS_PULL_UP:
-		if (!pull || !(jzpc->info->pull_ups[offt] & BIT(idx)))
+		if (!pullup)
 			return -EINVAL;
 		break;
 
 	case PIN_CONFIG_BIAS_PULL_DOWN:
-		if (!pull || !(jzpc->info->pull_downs[offt] & BIT(idx)))
+		if (!pulldown)
 			return -EINVAL;
 		break;
 
-- 
2.7.4

