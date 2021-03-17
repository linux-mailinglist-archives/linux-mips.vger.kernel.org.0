Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18EA233EDBC
	for <lists+linux-mips@lfdr.de>; Wed, 17 Mar 2021 10:59:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230166AbhCQJ6m (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Mar 2021 05:58:42 -0400
Received: from out28-77.mail.aliyun.com ([115.124.28.77]:38524 "EHLO
        out28-77.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229730AbhCQJ6Z (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Mar 2021 05:58:25 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07638787|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.0210386-0.000128823-0.978833;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047213;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.JmJVfKa_1615975087;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.JmJVfKa_1615975087)
          by smtp.aliyun-inc.com(10.147.40.200);
          Wed, 17 Mar 2021 17:58:21 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linus.walleij@linaro.org, robh+dt@kernel.org, paul@crapouillou.net
Cc:     linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        hns@goldelico.com, paul@boddie.org.uk, andy.shevchenko@gmail.com,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        sernia.zhou@foxmail.com
Subject: [PATCH v3 04/10] pinctrl: Ingenic: Reformat the code.
Date:   Wed, 17 Mar 2021 17:57:58 +0800
Message-Id: <1615975084-68203-5-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615975084-68203-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1615975084-68203-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.Move the "INGENIC_PIN_GROUP_FUNCS" to the macro definition section.
2.Add tabs before values to align the code in the macro definition section.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2:
    New patch.
    
    v2->v3:
    Add Paul Cercueil's Reviewed-by.

 drivers/pinctrl/pinctrl-ingenic.c | 71 +++++++++++++++++++--------------------
 1 file changed, 35 insertions(+), 36 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 7179fd8..b8165f5 100644
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
-- 
2.7.4

