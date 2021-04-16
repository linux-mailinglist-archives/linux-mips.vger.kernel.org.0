Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A17B36255D
	for <lists+linux-mips@lfdr.de>; Fri, 16 Apr 2021 18:14:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240521AbhDPQOr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Apr 2021 12:14:47 -0400
Received: from out28-101.mail.aliyun.com ([115.124.28.101]:54694 "EHLO
        out28-101.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240249AbhDPQOp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 16 Apr 2021 12:14:45 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.0760372|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.0190463-8.67368e-05-0.980867;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047209;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.K.1zIuN_1618589646;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.K.1zIuN_1618589646)
          by smtp.aliyun-inc.com(10.147.42.197);
          Sat, 17 Apr 2021 00:14:16 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linus.walleij@linaro.org, robh+dt@kernel.org, paul@crapouillou.net
Cc:     linux-gpio@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        hns@goldelico.com, paul@boddie.org.uk, andy.shevchenko@gmail.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sernia.zhou@foxmail.com,
        siyanteng@loongson.cn
Subject: [PATCH v5 05/11] pinctrl: Ingenic: Reformat the code.
Date:   Sat, 17 Apr 2021 00:13:59 +0800
Message-Id: <1618589645-96504-6-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618589645-96504-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1618589645-96504-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.Move the "INGENIC_PIN_GROUP_FUNCS" to the macro definition section.
2.Add tabs before values to align the code in the macro definition section.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2:
    New patch.
    
    v2->v3:
    Add Paul Cercueil's Reviewed-by.
    
    v3->v4:
    Add Andy Shevchenko's Reviewed-by.
    
    v4->v5:
    No change.

 drivers/pinctrl/pinctrl-ingenic.c | 71 +++++++++++++++++++--------------------
 1 file changed, 35 insertions(+), 36 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 8ed62a4..009901b 100644
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
@@ -136,18 +147,6 @@ static int jz4740_pwm_pwm5_pins[] = { 0x7c, };
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
-- 
2.7.4

