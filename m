Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D84E2163F20
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2020 09:30:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbgBSIaw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Feb 2020 03:30:52 -0500
Received: from out28-219.mail.aliyun.com ([115.124.28.219]:59149 "EHLO
        out28-219.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726354AbgBSIaw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 19 Feb 2020 03:30:52 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1408996|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.658155-0.00392559-0.337919;DS=CONTINUE|ham_system_inform|0.00908082-0.000152978-0.990766;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03299;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=16;RT=16;SR=0;TI=SMTPD_---.Gpe8RV3_1582100997;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Gpe8RV3_1582100997)
          by smtp.aliyun-inc.com(10.147.40.2);
          Wed, 19 Feb 2020 16:30:16 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, tglx@linutronix.de, maz@kernel.org,
        jason@lakedaemon.net, sboyd@kernel.org, mturquette@baylibre.com,
        mark.rutland@arm.com, robh+dt@kernel.org,
        daniel.lezcano@linaro.org, paul@crapouillou.net,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com,
        dongsheng.qiu@ingenic.com
Subject: [PATCH 3/4] clocksource: Ingenic: Add support for TCU of X1000.
Date:   Wed, 19 Feb 2020 16:29:33 +0800
Message-Id: <1582100974-129559-5-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582100974-129559-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1582100974-129559-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

X1000 has a different TCU containing OST, since X1000, OST has been
independent of TCU. This patch is prepare for later OST driver.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---
 drivers/clocksource/ingenic-timer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/ingenic-timer.c b/drivers/clocksource/ingenic-timer.c
index 4bbdb3d..4963336 100644
--- a/drivers/clocksource/ingenic-timer.c
+++ b/drivers/clocksource/ingenic-timer.c
@@ -230,6 +230,7 @@ static const struct of_device_id ingenic_tcu_of_match[] = {
 	{ .compatible = "ingenic,jz4740-tcu", .data = &jz4740_soc_info, },
 	{ .compatible = "ingenic,jz4725b-tcu", .data = &jz4725b_soc_info, },
 	{ .compatible = "ingenic,jz4770-tcu", .data = &jz4740_soc_info, },
+	{ .compatible = "ingenic,x1000-tcu", .data = &jz4740_soc_info, },
 	{ /* sentinel */ }
 };
 
@@ -302,7 +303,7 @@ static int __init ingenic_tcu_init(struct device_node *np)
 TIMER_OF_DECLARE(jz4740_tcu_intc,  "ingenic,jz4740-tcu",  ingenic_tcu_init);
 TIMER_OF_DECLARE(jz4725b_tcu_intc, "ingenic,jz4725b-tcu", ingenic_tcu_init);
 TIMER_OF_DECLARE(jz4770_tcu_intc,  "ingenic,jz4770-tcu",  ingenic_tcu_init);
-
+TIMER_OF_DECLARE(x1000_tcu_intc,  "ingenic,x1000-tcu",  ingenic_tcu_init);
 
 static int __init ingenic_tcu_probe(struct platform_device *pdev)
 {
-- 
2.7.4

