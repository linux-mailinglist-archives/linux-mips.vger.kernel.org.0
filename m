Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B69B163F19
	for <lists+linux-mips@lfdr.de>; Wed, 19 Feb 2020 09:30:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbgBSIa2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Feb 2020 03:30:28 -0500
Received: from out28-194.mail.aliyun.com ([115.124.28.194]:39163 "EHLO
        out28-194.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726638AbgBSIa2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 19 Feb 2020 03:30:28 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.2277531|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.422468-0.0186468-0.558885;DS=CONTINUE|ham_system_inform|0.00780425-0.000317574-0.991878;FP=0|0|0|0|0|-1|-1|-1;HT=e01a16367;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=16;RT=16;SR=0;TI=SMTPD_---.Gpe8RV3_1582100997;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Gpe8RV3_1582100997)
          by smtp.aliyun-inc.com(10.147.40.2);
          Wed, 19 Feb 2020 16:30:17 +0800
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
Subject: [PATCH 4/4] irqchip: Ingenic: Add support for TCU of X1000.
Date:   Wed, 19 Feb 2020 16:29:34 +0800
Message-Id: <1582100974-129559-6-git-send-email-zhouyanjie@wanyeetech.com>
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
 drivers/irqchip/irq-ingenic-tcu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-ingenic-tcu.c b/drivers/irqchip/irq-ingenic-tcu.c
index 6d05cef..7a7222d 100644
--- a/drivers/irqchip/irq-ingenic-tcu.c
+++ b/drivers/irqchip/irq-ingenic-tcu.c
@@ -180,3 +180,4 @@ static int __init ingenic_tcu_irq_init(struct device_node *np,
 IRQCHIP_DECLARE(jz4740_tcu_irq, "ingenic,jz4740-tcu", ingenic_tcu_irq_init);
 IRQCHIP_DECLARE(jz4725b_tcu_irq, "ingenic,jz4725b-tcu", ingenic_tcu_irq_init);
 IRQCHIP_DECLARE(jz4770_tcu_irq, "ingenic,jz4770-tcu", ingenic_tcu_irq_init);
+IRQCHIP_DECLARE(x1000_tcu_irq, "ingenic,x1000-tcu", ingenic_tcu_irq_init);
-- 
2.7.4

