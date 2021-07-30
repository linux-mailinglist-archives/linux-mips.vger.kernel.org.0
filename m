Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D7E23DB636
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jul 2021 11:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238219AbhG3JnX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Jul 2021 05:43:23 -0400
Received: from out28-147.mail.aliyun.com ([115.124.28.147]:37663 "EHLO
        out28-147.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238230AbhG3JnW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 30 Jul 2021 05:43:22 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07504555|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0876566-0.00178738-0.910556;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047206;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=11;RT=11;SR=0;TI=SMTPD_---.Kt0th7w_1627638189;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Kt0th7w_1627638189)
          by smtp.aliyun-inc.com(10.147.42.198);
          Fri, 30 Jul 2021 17:43:16 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     daniel.lezcano@linaro.org, tglx@linutronix.de
Cc:     paul@crapouillou.net, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com
Subject: [PATCH v2] clocksource: Ingenic: Improve the code.
Date:   Fri, 30 Jul 2021 17:43:08 +0800
Message-Id: <1627638188-116163-1-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use "FIELD_GET()" and "FIELD_PREP()" to simplify the code.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v1->v2:
    Split "val = (val & ~OSTCCR_PRESCALEx_MASK) | FIELD_PREP(OSTCCR_PRESCALEx_MASK, prescale)"
    into "val &= ~OSTCCR_PRESCALEx_MASK" and "val |= FIELD_PREP(OSTCCR_PRESCALEx_MASK, prescale)"
    as Paul Cercueil's suggestion.

 drivers/clocksource/ingenic-sysost.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/clocksource/ingenic-sysost.c b/drivers/clocksource/ingenic-sysost.c
index a129840..cb6fc2f 100644
--- a/drivers/clocksource/ingenic-sysost.c
+++ b/drivers/clocksource/ingenic-sysost.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2020 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
@@ -34,8 +35,6 @@
 /* bits within the OSTCCR register */
 #define OSTCCR_PRESCALE1_MASK	0x3
 #define OSTCCR_PRESCALE2_MASK	0xc
-#define OSTCCR_PRESCALE1_LSB	0
-#define OSTCCR_PRESCALE2_LSB	2
 
 /* bits within the OSTCR register */
 #define OSTCR_OST1CLR			BIT(0)
@@ -98,7 +97,7 @@ static unsigned long ingenic_ost_percpu_timer_recalc_rate(struct clk_hw *hw,
 
 	prescale = readl(ost_clk->ost->base + info->ostccr_reg);
 
-	prescale = (prescale & OSTCCR_PRESCALE1_MASK) >> OSTCCR_PRESCALE1_LSB;
+	prescale = FIELD_GET(OSTCCR_PRESCALE1_MASK, prescale);
 
 	return parent_rate >> (prescale * 2);
 }
@@ -112,7 +111,7 @@ static unsigned long ingenic_ost_global_timer_recalc_rate(struct clk_hw *hw,
 
 	prescale = readl(ost_clk->ost->base + info->ostccr_reg);
 
-	prescale = (prescale & OSTCCR_PRESCALE2_MASK) >> OSTCCR_PRESCALE2_LSB;
+	prescale = FIELD_GET(OSTCCR_PRESCALE2_MASK, prescale);
 
 	return parent_rate >> (prescale * 2);
 }
@@ -151,7 +150,8 @@ static int ingenic_ost_percpu_timer_set_rate(struct clk_hw *hw, unsigned long re
 	int val;
 
 	val = readl(ost_clk->ost->base + info->ostccr_reg);
-	val = (val & ~OSTCCR_PRESCALE1_MASK) | (prescale << OSTCCR_PRESCALE1_LSB);
+	val &= ~OSTCCR_PRESCALE1_MASK;
+	val |= FIELD_PREP(OSTCCR_PRESCALE1_MASK, prescale);
 	writel(val, ost_clk->ost->base + info->ostccr_reg);
 
 	return 0;
@@ -166,7 +166,8 @@ static int ingenic_ost_global_timer_set_rate(struct clk_hw *hw, unsigned long re
 	int val;
 
 	val = readl(ost_clk->ost->base + info->ostccr_reg);
-	val = (val & ~OSTCCR_PRESCALE2_MASK) | (prescale << OSTCCR_PRESCALE2_LSB);
+	val &= ~OSTCCR_PRESCALE2_MASK;
+	val |= FIELD_PREP(OSTCCR_PRESCALE2_MASK, prescale);
 	writel(val, ost_clk->ost->base + info->ostccr_reg);
 
 	return 0;
-- 
2.7.4

