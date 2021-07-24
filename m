Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 359773D4707
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jul 2021 12:10:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234978AbhGXJ3p (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Jul 2021 05:29:45 -0400
Received: from out29-145.mail.aliyun.com ([115.124.29.145]:50203 "EHLO
        out29-145.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234853AbhGXJ3p (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 24 Jul 2021 05:29:45 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07481855|-1;CH=blue;DM=|OVERLOAD|false|;DS=CONTINUE|ham_regular_dialog|0.0611293-0.00105596-0.937815;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047190;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=11;RT=11;SR=0;TI=SMTPD_---.Kps-MyK_1627121408;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Kps-MyK_1627121408)
          by smtp.aliyun-inc.com(10.147.42.241);
          Sat, 24 Jul 2021 18:10:14 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     daniel.lezcano@linaro.org, tglx@linutronix.de
Cc:     paul@crapouillou.net, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com
Subject: [PATCH] clocksource: Ingenic: Improve the code.
Date:   Sat, 24 Jul 2021 18:10:07 +0800
Message-Id: <1627121407-131028-1-git-send-email-zhouyanjie@wanyeetech.com>
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
 drivers/clocksource/ingenic-sysost.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/clocksource/ingenic-sysost.c b/drivers/clocksource/ingenic-sysost.c
index a129840..1fbea59 100644
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
@@ -151,7 +150,7 @@ static int ingenic_ost_percpu_timer_set_rate(struct clk_hw *hw, unsigned long re
 	int val;
 
 	val = readl(ost_clk->ost->base + info->ostccr_reg);
-	val = (val & ~OSTCCR_PRESCALE1_MASK) | (prescale << OSTCCR_PRESCALE1_LSB);
+	val = (val & ~OSTCCR_PRESCALE1_MASK) | FIELD_PREP(OSTCCR_PRESCALE1_MASK, prescale);
 	writel(val, ost_clk->ost->base + info->ostccr_reg);
 
 	return 0;
@@ -166,7 +165,7 @@ static int ingenic_ost_global_timer_set_rate(struct clk_hw *hw, unsigned long re
 	int val;
 
 	val = readl(ost_clk->ost->base + info->ostccr_reg);
-	val = (val & ~OSTCCR_PRESCALE2_MASK) | (prescale << OSTCCR_PRESCALE2_LSB);
+	val = (val & ~OSTCCR_PRESCALE2_MASK) | FIELD_PREP(OSTCCR_PRESCALE2_MASK, prescale);
 	writel(val, ost_clk->ost->base + info->ostccr_reg);
 
 	return 0;
-- 
2.7.4

