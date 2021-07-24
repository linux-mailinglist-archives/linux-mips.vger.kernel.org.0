Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F227F3D46C1
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jul 2021 11:36:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235104AbhGXIyx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Jul 2021 04:54:53 -0400
Received: from out28-53.mail.aliyun.com ([115.124.28.53]:57298 "EHLO
        out28-53.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235062AbhGXIyv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 24 Jul 2021 04:54:51 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.09245799|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.00100954-1.46352e-05-0.998976;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047187;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.KprUvTZ_1627119307;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KprUvTZ_1627119307)
          by smtp.aliyun-inc.com(10.147.40.233);
          Sat, 24 Jul 2021 17:35:20 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        paul@crapouillou.net
Cc:     linux-clk@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com
Subject: [PATCH v7 04/11] clk: Ingenic: Fix problem of MAC clock in Ingenic X1000 and X1830.
Date:   Sat, 24 Jul 2021 17:34:39 +0800
Message-Id: <1627119286-125821-5-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627119286-125821-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1627119286-125821-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

X1000 and X1830 have two MAC related clocks, one is MACPHY, which is
controlled by MACCDR register, the other is MAC, which is controlled
by the MAC bit in the CLKGR register (with CLK_AHB2 as the parent).
The original driver mistakenly mixed the two clocks together.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
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

 drivers/clk/ingenic/x1000-cgu.c | 11 ++++++++---
 drivers/clk/ingenic/x1830-cgu.c | 11 ++++++++---
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/ingenic/x1000-cgu.c b/drivers/clk/ingenic/x1000-cgu.c
index 9aa20b5..53e5fe0 100644
--- a/drivers/clk/ingenic/x1000-cgu.c
+++ b/drivers/clk/ingenic/x1000-cgu.c
@@ -296,12 +296,11 @@ static const struct ingenic_cgu_clk_info x1000_cgu_clocks[] = {
 		.gate = { CGU_REG_CLKGR, 31 },
 	},
 
-	[X1000_CLK_MAC] = {
-		"mac", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
+	[X1000_CLK_MACPHY] = {
+		"mac_phy", CGU_CLK_MUX | CGU_CLK_DIV,
 		.parents = { X1000_CLK_SCLKA, X1000_CLK_MPLL },
 		.mux = { CGU_REG_MACCDR, 31, 1 },
 		.div = { CGU_REG_MACCDR, 0, 1, 8, 29, 28, 27 },
-		.gate = { CGU_REG_CLKGR, 25 },
 	},
 
 	[X1000_CLK_LCD] = {
@@ -452,6 +451,12 @@ static const struct ingenic_cgu_clk_info x1000_cgu_clocks[] = {
 		.parents = { X1000_CLK_EXCLK, -1, -1, -1 },
 		.gate = { CGU_REG_CLKGR, 21 },
 	},
+
+	[X1000_CLK_MAC] = {
+		"mac", CGU_CLK_GATE,
+		.parents = { X1000_CLK_AHB2 },
+		.gate = { CGU_REG_CLKGR, 25 },
+	},
 };
 
 static void __init x1000_cgu_init(struct device_node *np)
diff --git a/drivers/clk/ingenic/x1830-cgu.c b/drivers/clk/ingenic/x1830-cgu.c
index 950aee2..59342bc 100644
--- a/drivers/clk/ingenic/x1830-cgu.c
+++ b/drivers/clk/ingenic/x1830-cgu.c
@@ -270,13 +270,12 @@ static const struct ingenic_cgu_clk_info x1830_cgu_clocks[] = {
 		.gate = { CGU_REG_CLKGR0, 31 },
 	},
 
-	[X1830_CLK_MAC] = {
-		"mac", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
+	[X1830_CLK_MACPHY] = {
+		"mac_phy", CGU_CLK_MUX | CGU_CLK_DIV,
 		.parents = { X1830_CLK_SCLKA, X1830_CLK_MPLL,
 					 X1830_CLK_VPLL, X1830_CLK_EPLL },
 		.mux = { CGU_REG_MACCDR, 30, 2 },
 		.div = { CGU_REG_MACCDR, 0, 1, 8, 29, 28, 27 },
-		.gate = { CGU_REG_CLKGR1, 4 },
 	},
 
 	[X1830_CLK_LCD] = {
@@ -428,6 +427,12 @@ static const struct ingenic_cgu_clk_info x1830_cgu_clocks[] = {
 		.gate = { CGU_REG_CLKGR1, 1 },
 	},
 
+	[X1830_CLK_MAC] = {
+		"mac", CGU_CLK_GATE,
+		.parents = { X1830_CLK_AHB2 },
+		.gate = { CGU_REG_CLKGR1, 4 },
+	},
+
 	[X1830_CLK_OST] = {
 		"ost", CGU_CLK_GATE,
 		.parents = { X1830_CLK_EXCLK, -1, -1, -1 },
-- 
2.7.4

