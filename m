Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46B3411E66E
	for <lists+linux-mips@lfdr.de>; Fri, 13 Dec 2019 16:22:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727943AbfLMPV5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Dec 2019 10:21:57 -0500
Received: from out28-217.mail.aliyun.com ([115.124.28.217]:42213 "EHLO
        out28-217.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726908AbfLMPV4 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Dec 2019 10:21:56 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.2455975|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.271369-0.00538365-0.723248;DS=CONTINUE|ham_system_inform|0.0408236-0.00028572-0.958891;FP=12605485605373645991|1|1|1|0|-1|-1|-1;HT=e02c03308;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=13;RT=13;SR=0;TI=SMTPD_---.GGSxanS_1576250475;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GGSxanS_1576250475)
          by smtp.aliyun-inc.com(10.147.40.233);
          Fri, 13 Dec 2019 23:21:25 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     linux-mips@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        paul.burton@mips.com, paulburton@kernel.org, paul@crapouillou.net,
        mturquette@baylibre.com, sboyd@kernel.org, mark.rutland@arm.com,
        sernia.zhou@foxmail.com, zhenwenjin@gmail.com
Subject: [PATCH v2 2/5] clk: Ingenic: Adjust code to make it compatible with new cgu code.
Date:   Fri, 13 Dec 2019 23:21:09 +0800
Message-Id: <1576250472-124315-4-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576250472-124315-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1576250472-124315-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Adjust the code in jz47xx-cgu.c and x1000-cgu.c, make it to be
compatible with the new cgu code.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v1->v2:
    1.Use two fields (pll_reg & bypass_reg) instead of the 2-values
      array (reg[2]).
    2.Remove the "pll_info->version" and add a "pll_info->rate_multiplier".
    3.Change my Signed-off-by from "Zhou Yanjie <zhouyanjie@zoho.com>"
      to "周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>" because
      the old mailbox is in an unstable state.

 drivers/clk/ingenic/jz4725b-cgu.c | 4 +++-
 drivers/clk/ingenic/jz4740-cgu.c  | 4 +++-
 drivers/clk/ingenic/jz4770-cgu.c  | 8 ++++++--
 drivers/clk/ingenic/jz4780-cgu.c  | 4 +++-
 drivers/clk/ingenic/x1000-cgu.c   | 8 ++++++--
 5 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/ingenic/jz4725b-cgu.c b/drivers/clk/ingenic/jz4725b-cgu.c
index a3b4635..0b05167 100644
--- a/drivers/clk/ingenic/jz4725b-cgu.c
+++ b/drivers/clk/ingenic/jz4725b-cgu.c
@@ -53,7 +53,9 @@ static const struct ingenic_cgu_clk_info jz4725b_cgu_clocks[] = {
 		"pll", CGU_CLK_PLL,
 		.parents = { JZ4725B_CLK_EXT, -1, -1, -1 },
 		.pll = {
-			.reg = CGU_REG_CPPCR,
+			.pll_reg = CGU_REG_CPPCR,
+			.bypass_reg = CGU_REG_CPPCR,
+			.rate_multiplier = 1,
 			.m_shift = 23,
 			.m_bits = 9,
 			.m_offset = 2,
diff --git a/drivers/clk/ingenic/jz4740-cgu.c b/drivers/clk/ingenic/jz4740-cgu.c
index 4f0e92c..78f31df 100644
--- a/drivers/clk/ingenic/jz4740-cgu.c
+++ b/drivers/clk/ingenic/jz4740-cgu.c
@@ -68,7 +68,9 @@ static const struct ingenic_cgu_clk_info jz4740_cgu_clocks[] = {
 		"pll", CGU_CLK_PLL,
 		.parents = { JZ4740_CLK_EXT, -1, -1, -1 },
 		.pll = {
-			.reg = CGU_REG_CPPCR,
+			.pll_reg = CGU_REG_CPPCR,
+			.bypass_reg = CGU_REG_CPPCR,
+			.rate_multiplier = 1,
 			.m_shift = 23,
 			.m_bits = 9,
 			.m_offset = 2,
diff --git a/drivers/clk/ingenic/jz4770-cgu.c b/drivers/clk/ingenic/jz4770-cgu.c
index 956dd65..32e476d 100644
--- a/drivers/clk/ingenic/jz4770-cgu.c
+++ b/drivers/clk/ingenic/jz4770-cgu.c
@@ -101,7 +101,9 @@ static const struct ingenic_cgu_clk_info jz4770_cgu_clocks[] = {
 		"pll0", CGU_CLK_PLL,
 		.parents = { JZ4770_CLK_EXT },
 		.pll = {
-			.reg = CGU_REG_CPPCR0,
+			.pll_reg = CGU_REG_CPPCR0,
+			.bypass_reg = CGU_REG_CPPCR0,
+			.rate_multiplier = 1,
 			.m_shift = 24,
 			.m_bits = 7,
 			.m_offset = 1,
@@ -123,7 +125,9 @@ static const struct ingenic_cgu_clk_info jz4770_cgu_clocks[] = {
 		"pll1", CGU_CLK_PLL,
 		.parents = { JZ4770_CLK_EXT },
 		.pll = {
-			.reg = CGU_REG_CPPCR1,
+			.pll_reg = CGU_REG_CPPCR1,
+			.bypass_reg = CGU_REG_CPPCR1,
+			.rate_multiplier = 1,
 			.m_shift = 24,
 			.m_bits = 7,
 			.m_offset = 1,
diff --git a/drivers/clk/ingenic/jz4780-cgu.c b/drivers/clk/ingenic/jz4780-cgu.c
index ea905ff..d07fff1 100644
--- a/drivers/clk/ingenic/jz4780-cgu.c
+++ b/drivers/clk/ingenic/jz4780-cgu.c
@@ -220,7 +220,9 @@ static const struct ingenic_cgu_clk_info jz4780_cgu_clocks[] = {
 	/* PLLs */
 
 #define DEF_PLL(name) { \
-	.reg = CGU_REG_ ## name, \
+	.pll_reg = CGU_REG_ ## name, \
+	.bypass_reg = CGU_REG_ ## name, \
+	.rate_multiplier = 1, \
 	.m_shift = 19, \
 	.m_bits = 13, \
 	.m_offset = 1, \
diff --git a/drivers/clk/ingenic/x1000-cgu.c b/drivers/clk/ingenic/x1000-cgu.c
index b22d87b..d6fe28f 100644
--- a/drivers/clk/ingenic/x1000-cgu.c
+++ b/drivers/clk/ingenic/x1000-cgu.c
@@ -57,7 +57,9 @@ static const struct ingenic_cgu_clk_info x1000_cgu_clocks[] = {
 		"apll", CGU_CLK_PLL,
 		.parents = { X1000_CLK_EXCLK, -1, -1, -1 },
 		.pll = {
-			.reg = CGU_REG_APLL,
+			.pll_reg = CGU_REG_APLL,
+			.bypass_reg = CGU_REG_APLL,
+			.rate_multiplier = 1,
 			.m_shift = 24,
 			.m_bits = 7,
 			.m_offset = 1,
@@ -78,7 +80,9 @@ static const struct ingenic_cgu_clk_info x1000_cgu_clocks[] = {
 		"mpll", CGU_CLK_PLL,
 		.parents = { X1000_CLK_EXCLK, -1, -1, -1 },
 		.pll = {
-			.reg = CGU_REG_MPLL,
+			.pll_reg = CGU_REG_MPLL,
+			.bypass_reg = CGU_REG_MPLL,
+			.rate_multiplier = 1,
 			.m_shift = 24,
 			.m_bits = 7,
 			.m_offset = 1,
-- 
2.7.4

