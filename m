Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDBED3376F4
	for <lists+linux-mips@lfdr.de>; Thu, 11 Mar 2021 16:23:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234144AbhCKPWn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 11 Mar 2021 10:22:43 -0500
Received: from out28-97.mail.aliyun.com ([115.124.28.97]:39246 "EHLO
        out28-97.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234120AbhCKPWg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 11 Mar 2021 10:22:36 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07680888|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.0212975-0.000128512-0.978574;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047209;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.JjZCudb_1615476138;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.JjZCudb_1615476138)
          by smtp.aliyun-inc.com(10.147.41.120);
          Thu, 11 Mar 2021 23:22:29 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linus.walleij@linaro.org, robh+dt@kernel.org, paul@crapouillou.net
Cc:     linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        hns@goldelico.com, paul@boddie.org.uk, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, sernia.zhou@foxmail.com
Subject: [PATCH v2 4/6] pinctrl: Ingenic: Reformat the code.
Date:   Thu, 11 Mar 2021 23:21:50 +0800
Message-Id: <1615476112-113101-5-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615476112-113101-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1615476112-113101-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.Move the "INGENIC_PIN_GROUP_FUNCS" to the macro definition section.
2.Add tabs before values to align the code in the macro definition section.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v2:
    New patch.

 drivers/pinctrl/pinctrl-ingenic.c | 71 +++++++++++++++++++--------------------
 1 file changed, 35 insertions(+), 36 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 607ba0b..ac5ad8a 100644
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

