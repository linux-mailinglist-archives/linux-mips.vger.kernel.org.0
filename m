Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4717615EC89
	for <lists+linux-mips@lfdr.de>; Fri, 14 Feb 2020 18:28:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403971AbgBNR2a (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Feb 2020 12:28:30 -0500
Received: from out28-122.mail.aliyun.com ([115.124.28.122]:41993 "EHLO
        out28-122.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394636AbgBNR22 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 Feb 2020 12:28:28 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1018745|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.231591-0.0044768-0.763932;DS=CONTINUE|ham_regular_dialog|0.00503353-1.34513e-05-0.994953;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03279;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=9;RT=9;SR=0;TI=SMTPD_---.Go9djQb_1581701284;
Received: from localhost.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Go9djQb_1581701284)
          by smtp.aliyun-inc.com(10.147.41.231);
          Sat, 15 Feb 2020 01:28:22 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, paul@crapouillou.net,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com
Subject: [PATCH v5 6/6] clk: X1000: Add FIXDIV for SSI clock of X1000.
Date:   Sat, 15 Feb 2020 01:27:42 +0800
Message-Id: <1581701262-110556-8-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581701262-110556-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1581701262-110556-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The SSI clock of X1000 not like JZ4770 and JZ4780, they are not
directly derived from the output of SSIPLL, but from the clock
obtained by dividing the frequency by 2. "X1000_CLK_SSIPLL_DIV2"
is added for this purpose, and ensure that it initialized before
"X1000_CLK_SSIMUX" when initializing the clocks.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v5:
    New patch.

 drivers/clk/ingenic/x1000-cgu.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/ingenic/x1000-cgu.c b/drivers/clk/ingenic/x1000-cgu.c
index d6fe28f..a3bbe70 100644
--- a/drivers/clk/ingenic/x1000-cgu.c
+++ b/drivers/clk/ingenic/x1000-cgu.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
  * X1000 SoC CGU driver
- * Copyright (c) 2019 Zhou Yanjie <zhouyanjie@zoho.com>
+ * Copyright (c) 2019 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
  */
 
 #include <linux/clk-provider.h>
@@ -18,6 +18,7 @@
 #define CGU_REG_CLKGR		0x20
 #define CGU_REG_OPCR		0x24
 #define CGU_REG_DDRCDR		0x2c
+#define CGU_REG_USBCDR		0x50
 #define CGU_REG_MACCDR		0x54
 #define CGU_REG_I2SCDR		0x60
 #define CGU_REG_LPCDR		0x64
@@ -186,6 +187,15 @@ static const struct ingenic_cgu_clk_info x1000_cgu_clocks[] = {
 		.gate = { CGU_REG_CLKGR, 5 },
 	},
 
+	[X1000_CLK_OTG] = {
+		"otg", CGU_CLK_DIV | CGU_CLK_GATE | CGU_CLK_MUX,
+		.parents = { X1000_CLK_EXCLK, -1,
+					 X1000_CLK_APLL, X1000_CLK_MPLL },
+		.mux = { CGU_REG_USBCDR, 30, 2 },
+		.div = { CGU_REG_USBCDR, 0, 1, 8, 29, 28, 27 },
+		.gate = { CGU_REG_CLKGR, 3 },
+	},
+
 	[X1000_CLK_SSIPLL] = {
 		"ssi_pll", CGU_CLK_MUX | CGU_CLK_DIV,
 		.parents = { X1000_CLK_SCLKA, X1000_CLK_MPLL, -1, -1 },
@@ -193,9 +203,15 @@ static const struct ingenic_cgu_clk_info x1000_cgu_clocks[] = {
 		.div = { CGU_REG_SSICDR, 0, 1, 8, 29, 28, 27 },
 	},
 
+	[X1000_CLK_SSIPLL_DIV2] = {
+		"ssi_pll_div2", CGU_CLK_FIXDIV,
+		.parents = { X1000_CLK_SSIPLL },
+		.fixdiv = { 2 },
+	},
+
 	[X1000_CLK_SSIMUX] = {
 		"ssi_mux", CGU_CLK_MUX,
-		.parents = { X1000_CLK_EXCLK, X1000_CLK_SSIPLL, -1, -1 },
+		.parents = { X1000_CLK_EXCLK, X1000_CLK_SSIPLL_DIV2, -1, -1 },
 		.mux = { CGU_REG_SSICDR, 30, 1 },
 	},
 
-- 
2.7.4

