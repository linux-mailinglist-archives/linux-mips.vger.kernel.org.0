Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 981A03D46BB
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jul 2021 11:35:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235066AbhGXIyv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Jul 2021 04:54:51 -0400
Received: from out28-74.mail.aliyun.com ([115.124.28.74]:37945 "EHLO
        out28-74.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235032AbhGXIyu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 24 Jul 2021 04:54:50 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1123445|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00555304-0.000439856-0.994007;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047198;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.KprUvTZ_1627119307;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KprUvTZ_1627119307)
          by smtp.aliyun-inc.com(10.147.40.233);
          Sat, 24 Jul 2021 17:35:19 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        paul@crapouillou.net
Cc:     linux-clk@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com
Subject: [PATCH v7 03/11] dt-bindings: clock: Add missing clocks for Ingenic SoCs.
Date:   Sat, 24 Jul 2021 17:34:38 +0800
Message-Id: <1627119286-125821-4-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627119286-125821-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1627119286-125821-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add MACPHY, CIM, AIC, DMIC, I2S clocks bindings for the X1000 SoC
and the X1830 SoC from Ingenic.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Acked-by: Rob Herring <robh@kernel.org>
---

Notes:
    v1->v2:
    1.Add MACPHY and I2S for X1000, and add MACPHY for X1830.
    2.Add Paul Cercueil's Reviewed-by and Rob Herring's Acked-by.
    
    v2->v3:
    No change.
    
    v3->v4:
    No change.
    
    v4->v5:
    Add CIM, AIC, DMIC for X1000, and add CIM, AIC, DMIC, I2S for X1830.
    
    v5->v6:
    No change.
    
    v6->v7:
    No change.

 include/dt-bindings/clock/x1000-cgu.h | 5 +++++
 include/dt-bindings/clock/x1830-cgu.h | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/include/dt-bindings/clock/x1000-cgu.h b/include/dt-bindings/clock/x1000-cgu.h
index f187e07..3e79f36 100644
--- a/include/dt-bindings/clock/x1000-cgu.h
+++ b/include/dt-bindings/clock/x1000-cgu.h
@@ -50,5 +50,10 @@
 #define X1000_CLK_PDMA			35
 #define X1000_CLK_EXCLK_DIV512	36
 #define X1000_CLK_RTC			37
+#define X1000_CLK_MACPHY		38
+#define X1000_CLK_CIM			39
+#define X1000_CLK_AIC			40
+#define X1000_CLK_DMIC			41
+#define X1000_CLK_I2S			42
 
 #endif /* __DT_BINDINGS_CLOCK_X1000_CGU_H__ */
diff --git a/include/dt-bindings/clock/x1830-cgu.h b/include/dt-bindings/clock/x1830-cgu.h
index 8845537..8da2997 100644
--- a/include/dt-bindings/clock/x1830-cgu.h
+++ b/include/dt-bindings/clock/x1830-cgu.h
@@ -53,5 +53,10 @@
 #define X1830_CLK_OST			38
 #define X1830_CLK_EXCLK_DIV512	39
 #define X1830_CLK_RTC			40
+#define X1830_CLK_MACPHY		41
+#define X1830_CLK_CIM			42
+#define X1830_CLK_AIC			43
+#define X1830_CLK_DMIC			44
+#define X1830_CLK_I2S			45
 
 #endif /* __DT_BINDINGS_CLOCK_X1830_CGU_H__ */
-- 
2.7.4

