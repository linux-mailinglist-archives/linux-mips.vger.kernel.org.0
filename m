Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A094E3B685B
	for <lists+linux-mips@lfdr.de>; Mon, 28 Jun 2021 20:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236002AbhF1SXe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 28 Jun 2021 14:23:34 -0400
Received: from out28-49.mail.aliyun.com ([115.124.28.49]:48553 "EHLO
        out28-49.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234329AbhF1SX1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 28 Jun 2021 14:23:27 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07608247|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0330205-0.000718331-0.966261;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047188;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.KZOO9TY_1624904444;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KZOO9TY_1624904444)
          by smtp.aliyun-inc.com(10.147.42.253);
          Tue, 29 Jun 2021 02:20:56 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org
Cc:     linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        paul@crapouillou.net, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com
Subject: [PATCH v5 06/11] clk: Ingenic: Clean up and reformat the code.
Date:   Tue, 29 Jun 2021 02:20:39 +0800
Message-Id: <1624904444-2618-7-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1624904444-2618-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1624904444-2618-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

1.When the clock does not have "CGU_CLK_MUX", the 2/3/4 bits in
  parents do not need to be filled with -1. When the clock have
  a "CGU_CLK_MUX" has only one bit, the 3/4 bits of parents do
  not need to be filled with -1. Clean up these unnecessary -1
  from all the xxxx-cgu.c files.
2.Reformat code, add missing blank lines, remove unnecessary
  commas and tabs, and align code.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v1->v2:
    Remove unnecessary -1 and commas.
    
    v2->v3:
    No change.
    
    v3->v4:
    1.The -1 used for placeholders on the unused bits of the
      parents in the custom clock should not be removed.
    2.Move "JZ4780_CLK_CORE1" from the "Gate-only clocks"
      class to the "Custom (SoC-specific)" class, because
      it belongs to the custom clock.
    
    v4->v5:
    No change.

 drivers/clk/ingenic/jz4725b-cgu.c |  48 +++++++-------
 drivers/clk/ingenic/jz4740-cgu.c  |  48 +++++++-------
 drivers/clk/ingenic/jz4760-cgu.c  | 106 ++++++++++++++++++++-----------
 drivers/clk/ingenic/jz4770-cgu.c  |  83 +++++++++++++------------
 drivers/clk/ingenic/jz4780-cgu.c  | 127 +++++++++++++++++++-------------------
 drivers/clk/ingenic/x1000-cgu.c   | 116 +++++++++++++++++-----------------
 drivers/clk/ingenic/x1830-cgu.c   | 112 ++++++++++++++++-----------------
 7 files changed, 338 insertions(+), 302 deletions(-)

diff --git a/drivers/clk/ingenic/jz4725b-cgu.c b/drivers/clk/ingenic/jz4725b-cgu.c
index 5154b0c..f1a23e1 100644
--- a/drivers/clk/ingenic/jz4725b-cgu.c
+++ b/drivers/clk/ingenic/jz4725b-cgu.c
@@ -17,7 +17,7 @@
 
 /* CGU register offsets */
 #define CGU_REG_CPCCR		0x00
-#define CGU_REG_LCR		0x04
+#define CGU_REG_LCR			0x04
 #define CGU_REG_CPPCR		0x10
 #define CGU_REG_CLKGR		0x20
 #define CGU_REG_OPCR		0x24
@@ -28,7 +28,7 @@
 #define CGU_REG_CIMCDR		0x78
 
 /* bits within the LCR register */
-#define LCR_SLEEP		BIT(0)
+#define LCR_SLEEP			BIT(0)
 
 static struct ingenic_cgu *cgu;
 
@@ -78,7 +78,7 @@ static const struct ingenic_cgu_clk_info jz4725b_cgu_clocks[] = {
 
 	[JZ4725B_CLK_PLL_HALF] = {
 		"pll half", CGU_CLK_DIV,
-		.parents = { JZ4725B_CLK_PLL, -1, -1, -1 },
+		.parents = { JZ4725B_CLK_PLL },
 		.div = {
 			CGU_REG_CPCCR, 21, 1, 1, -1, -1, -1, 0,
 			jz4725b_cgu_pll_half_div_table,
@@ -87,7 +87,7 @@ static const struct ingenic_cgu_clk_info jz4725b_cgu_clocks[] = {
 
 	[JZ4725B_CLK_CCLK] = {
 		"cclk", CGU_CLK_DIV,
-		.parents = { JZ4725B_CLK_PLL, -1, -1, -1 },
+		.parents = { JZ4725B_CLK_PLL },
 		.div = {
 			CGU_REG_CPCCR, 0, 1, 4, 22, -1, -1, 0,
 			jz4725b_cgu_cpccr_div_table,
@@ -96,7 +96,7 @@ static const struct ingenic_cgu_clk_info jz4725b_cgu_clocks[] = {
 
 	[JZ4725B_CLK_HCLK] = {
 		"hclk", CGU_CLK_DIV,
-		.parents = { JZ4725B_CLK_PLL, -1, -1, -1 },
+		.parents = { JZ4725B_CLK_PLL },
 		.div = {
 			CGU_REG_CPCCR, 4, 1, 4, 22, -1, -1, 0,
 			jz4725b_cgu_cpccr_div_table,
@@ -105,7 +105,7 @@ static const struct ingenic_cgu_clk_info jz4725b_cgu_clocks[] = {
 
 	[JZ4725B_CLK_PCLK] = {
 		"pclk", CGU_CLK_DIV,
-		.parents = { JZ4725B_CLK_PLL, -1, -1, -1 },
+		.parents = { JZ4725B_CLK_PLL },
 		.div = {
 			CGU_REG_CPCCR, 8, 1, 4, 22, -1, -1, 0,
 			jz4725b_cgu_cpccr_div_table,
@@ -114,7 +114,7 @@ static const struct ingenic_cgu_clk_info jz4725b_cgu_clocks[] = {
 
 	[JZ4725B_CLK_MCLK] = {
 		"mclk", CGU_CLK_DIV,
-		.parents = { JZ4725B_CLK_PLL, -1, -1, -1 },
+		.parents = { JZ4725B_CLK_PLL },
 		.div = {
 			CGU_REG_CPCCR, 12, 1, 4, 22, -1, -1, 0,
 			jz4725b_cgu_cpccr_div_table,
@@ -123,7 +123,7 @@ static const struct ingenic_cgu_clk_info jz4725b_cgu_clocks[] = {
 
 	[JZ4725B_CLK_IPU] = {
 		"ipu", CGU_CLK_DIV | CGU_CLK_GATE,
-		.parents = { JZ4725B_CLK_PLL, -1, -1, -1 },
+		.parents = { JZ4725B_CLK_PLL },
 		.div = {
 			CGU_REG_CPCCR, 16, 1, 4, 22, -1, -1, 0,
 			jz4725b_cgu_cpccr_div_table,
@@ -133,14 +133,14 @@ static const struct ingenic_cgu_clk_info jz4725b_cgu_clocks[] = {
 
 	[JZ4725B_CLK_LCD] = {
 		"lcd", CGU_CLK_DIV | CGU_CLK_GATE,
-		.parents = { JZ4725B_CLK_PLL_HALF, -1, -1, -1 },
+		.parents = { JZ4725B_CLK_PLL_HALF },
 		.div = { CGU_REG_LPCDR, 0, 1, 11, -1, -1, -1 },
 		.gate = { CGU_REG_CLKGR, 9 },
 	},
 
 	[JZ4725B_CLK_I2S] = {
 		"i2s", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
-		.parents = { JZ4725B_CLK_EXT, JZ4725B_CLK_PLL_HALF, -1, -1 },
+		.parents = { JZ4725B_CLK_EXT, JZ4725B_CLK_PLL_HALF },
 		.mux = { CGU_REG_CPCCR, 31, 1 },
 		.div = { CGU_REG_I2SCDR, 0, 1, 9, -1, -1, -1 },
 		.gate = { CGU_REG_CLKGR, 6 },
@@ -148,7 +148,7 @@ static const struct ingenic_cgu_clk_info jz4725b_cgu_clocks[] = {
 
 	[JZ4725B_CLK_SPI] = {
 		"spi", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
-		.parents = { JZ4725B_CLK_EXT, JZ4725B_CLK_PLL, -1, -1 },
+		.parents = { JZ4725B_CLK_EXT, JZ4725B_CLK_PLL },
 		.mux = { CGU_REG_SSICDR, 31, 1 },
 		.div = { CGU_REG_SSICDR, 0, 1, 4, -1, -1, -1 },
 		.gate = { CGU_REG_CLKGR, 4 },
@@ -156,13 +156,13 @@ static const struct ingenic_cgu_clk_info jz4725b_cgu_clocks[] = {
 
 	[JZ4725B_CLK_MMC_MUX] = {
 		"mmc_mux", CGU_CLK_DIV,
-		.parents = { JZ4725B_CLK_PLL_HALF, -1, -1, -1 },
+		.parents = { JZ4725B_CLK_PLL_HALF },
 		.div = { CGU_REG_MSCCDR, 0, 1, 5, -1, -1, -1 },
 	},
 
 	[JZ4725B_CLK_UDC] = {
 		"udc", CGU_CLK_MUX | CGU_CLK_DIV,
-		.parents = { JZ4725B_CLK_EXT, JZ4725B_CLK_PLL_HALF, -1, -1 },
+		.parents = { JZ4725B_CLK_EXT, JZ4725B_CLK_PLL_HALF },
 		.mux = { CGU_REG_CPCCR, 29, 1 },
 		.div = { CGU_REG_CPCCR, 23, 1, 6, -1, -1, -1 },
 	},
@@ -171,55 +171,55 @@ static const struct ingenic_cgu_clk_info jz4725b_cgu_clocks[] = {
 
 	[JZ4725B_CLK_UART] = {
 		"uart", CGU_CLK_GATE,
-		.parents = { JZ4725B_CLK_EXT, -1, -1, -1 },
+		.parents = { JZ4725B_CLK_EXT },
 		.gate = { CGU_REG_CLKGR, 0 },
 	},
 
 	[JZ4725B_CLK_DMA] = {
 		"dma", CGU_CLK_GATE,
-		.parents = { JZ4725B_CLK_PCLK, -1, -1, -1 },
+		.parents = { JZ4725B_CLK_PCLK },
 		.gate = { CGU_REG_CLKGR, 12 },
 	},
 
 	[JZ4725B_CLK_ADC] = {
 		"adc", CGU_CLK_GATE,
-		.parents = { JZ4725B_CLK_EXT, -1, -1, -1 },
+		.parents = { JZ4725B_CLK_EXT },
 		.gate = { CGU_REG_CLKGR, 7 },
 	},
 
 	[JZ4725B_CLK_I2C] = {
 		"i2c", CGU_CLK_GATE,
-		.parents = { JZ4725B_CLK_EXT, -1, -1, -1 },
+		.parents = { JZ4725B_CLK_EXT },
 		.gate = { CGU_REG_CLKGR, 3 },
 	},
 
 	[JZ4725B_CLK_AIC] = {
 		"aic", CGU_CLK_GATE,
-		.parents = { JZ4725B_CLK_EXT, -1, -1, -1 },
+		.parents = { JZ4725B_CLK_EXT },
 		.gate = { CGU_REG_CLKGR, 5 },
 	},
 
 	[JZ4725B_CLK_MMC0] = {
 		"mmc0", CGU_CLK_GATE,
-		.parents = { JZ4725B_CLK_MMC_MUX, -1, -1, -1 },
+		.parents = { JZ4725B_CLK_MMC_MUX },
 		.gate = { CGU_REG_CLKGR, 6 },
 	},
 
 	[JZ4725B_CLK_MMC1] = {
 		"mmc1", CGU_CLK_GATE,
-		.parents = { JZ4725B_CLK_MMC_MUX, -1, -1, -1 },
+		.parents = { JZ4725B_CLK_MMC_MUX },
 		.gate = { CGU_REG_CLKGR, 16 },
 	},
 
 	[JZ4725B_CLK_BCH] = {
 		"bch", CGU_CLK_GATE,
-		.parents = { JZ4725B_CLK_MCLK/* not sure */, -1, -1, -1 },
+		.parents = { JZ4725B_CLK_MCLK/* not sure */ },
 		.gate = { CGU_REG_CLKGR, 11 },
 	},
 
 	[JZ4725B_CLK_TCU] = {
 		"tcu", CGU_CLK_GATE,
-		.parents = { JZ4725B_CLK_EXT/* not sure */, -1, -1, -1 },
+		.parents = { JZ4725B_CLK_EXT/* not sure */ },
 		.gate = { CGU_REG_CLKGR, 1 },
 	},
 
@@ -233,13 +233,13 @@ static const struct ingenic_cgu_clk_info jz4725b_cgu_clocks[] = {
 
 	[JZ4725B_CLK_RTC] = {
 		"rtc", CGU_CLK_MUX,
-		.parents = { JZ4725B_CLK_EXT512, JZ4725B_CLK_OSC32K, -1, -1 },
+		.parents = { JZ4725B_CLK_EXT512, JZ4725B_CLK_OSC32K },
 		.mux = { CGU_REG_OPCR, 2, 1},
 	},
 
 	[JZ4725B_CLK_UDC_PHY] = {
 		"udc_phy", CGU_CLK_GATE,
-		.parents = { JZ4725B_CLK_EXT, -1, -1, -1 },
+		.parents = { JZ4725B_CLK_EXT },
 		.gate = { CGU_REG_OPCR, 6, true },
 	},
 };
diff --git a/drivers/clk/ingenic/jz4740-cgu.c b/drivers/clk/ingenic/jz4740-cgu.c
index cd878f0..a4b7683 100644
--- a/drivers/clk/ingenic/jz4740-cgu.c
+++ b/drivers/clk/ingenic/jz4740-cgu.c
@@ -18,10 +18,10 @@
 
 /* CGU register offsets */
 #define CGU_REG_CPCCR		0x00
-#define CGU_REG_LCR		0x04
+#define CGU_REG_LCR			0x04
 #define CGU_REG_CPPCR		0x10
 #define CGU_REG_CLKGR		0x20
-#define CGU_REG_SCR		0x24
+#define CGU_REG_SCR			0x24
 #define CGU_REG_I2SCDR		0x60
 #define CGU_REG_LPCDR		0x64
 #define CGU_REG_MSCCDR		0x68
@@ -40,10 +40,10 @@
 #define PLLCTL_ENABLE		(1 << 8)
 
 /* bits within the LCR register */
-#define LCR_SLEEP		(1 << 0)
+#define LCR_SLEEP			(1 << 0)
 
 /* bits within the CLKGR register */
-#define CLKGR_UDC		(1 << 11)
+#define CLKGR_UDC			(1 << 11)
 
 static struct ingenic_cgu *cgu;
 
@@ -93,7 +93,7 @@ static const struct ingenic_cgu_clk_info jz4740_cgu_clocks[] = {
 
 	[JZ4740_CLK_PLL_HALF] = {
 		"pll half", CGU_CLK_DIV,
-		.parents = { JZ4740_CLK_PLL, -1, -1, -1 },
+		.parents = { JZ4740_CLK_PLL },
 		.div = {
 			CGU_REG_CPCCR, 21, 1, 1, -1, -1, -1, 0,
 			jz4740_cgu_pll_half_div_table,
@@ -102,7 +102,7 @@ static const struct ingenic_cgu_clk_info jz4740_cgu_clocks[] = {
 
 	[JZ4740_CLK_CCLK] = {
 		"cclk", CGU_CLK_DIV,
-		.parents = { JZ4740_CLK_PLL, -1, -1, -1 },
+		.parents = { JZ4740_CLK_PLL },
 		.div = {
 			CGU_REG_CPCCR, 0, 1, 4, 22, -1, -1, 0,
 			jz4740_cgu_cpccr_div_table,
@@ -111,7 +111,7 @@ static const struct ingenic_cgu_clk_info jz4740_cgu_clocks[] = {
 
 	[JZ4740_CLK_HCLK] = {
 		"hclk", CGU_CLK_DIV,
-		.parents = { JZ4740_CLK_PLL, -1, -1, -1 },
+		.parents = { JZ4740_CLK_PLL },
 		.div = {
 			CGU_REG_CPCCR, 4, 1, 4, 22, -1, -1, 0,
 			jz4740_cgu_cpccr_div_table,
@@ -120,7 +120,7 @@ static const struct ingenic_cgu_clk_info jz4740_cgu_clocks[] = {
 
 	[JZ4740_CLK_PCLK] = {
 		"pclk", CGU_CLK_DIV,
-		.parents = { JZ4740_CLK_PLL, -1, -1, -1 },
+		.parents = { JZ4740_CLK_PLL },
 		.div = {
 			CGU_REG_CPCCR, 8, 1, 4, 22, -1, -1, 0,
 			jz4740_cgu_cpccr_div_table,
@@ -129,7 +129,7 @@ static const struct ingenic_cgu_clk_info jz4740_cgu_clocks[] = {
 
 	[JZ4740_CLK_MCLK] = {
 		"mclk", CGU_CLK_DIV,
-		.parents = { JZ4740_CLK_PLL, -1, -1, -1 },
+		.parents = { JZ4740_CLK_PLL },
 		.div = {
 			CGU_REG_CPCCR, 12, 1, 4, 22, -1, -1, 0,
 			jz4740_cgu_cpccr_div_table,
@@ -138,7 +138,7 @@ static const struct ingenic_cgu_clk_info jz4740_cgu_clocks[] = {
 
 	[JZ4740_CLK_LCD] = {
 		"lcd", CGU_CLK_DIV | CGU_CLK_GATE,
-		.parents = { JZ4740_CLK_PLL_HALF, -1, -1, -1 },
+		.parents = { JZ4740_CLK_PLL_HALF },
 		.div = {
 			CGU_REG_CPCCR, 16, 1, 5, 22, -1, -1, 0,
 			jz4740_cgu_cpccr_div_table,
@@ -148,13 +148,13 @@ static const struct ingenic_cgu_clk_info jz4740_cgu_clocks[] = {
 
 	[JZ4740_CLK_LCD_PCLK] = {
 		"lcd_pclk", CGU_CLK_DIV,
-		.parents = { JZ4740_CLK_PLL_HALF, -1, -1, -1 },
+		.parents = { JZ4740_CLK_PLL_HALF },
 		.div = { CGU_REG_LPCDR, 0, 1, 11, -1, -1, -1 },
 	},
 
 	[JZ4740_CLK_I2S] = {
 		"i2s", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
-		.parents = { JZ4740_CLK_EXT, JZ4740_CLK_PLL_HALF, -1, -1 },
+		.parents = { JZ4740_CLK_EXT, JZ4740_CLK_PLL_HALF },
 		.mux = { CGU_REG_CPCCR, 31, 1 },
 		.div = { CGU_REG_I2SCDR, 0, 1, 9, -1, -1, -1 },
 		.gate = { CGU_REG_CLKGR, 6 },
@@ -162,7 +162,7 @@ static const struct ingenic_cgu_clk_info jz4740_cgu_clocks[] = {
 
 	[JZ4740_CLK_SPI] = {
 		"spi", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
-		.parents = { JZ4740_CLK_EXT, JZ4740_CLK_PLL, -1, -1 },
+		.parents = { JZ4740_CLK_EXT, JZ4740_CLK_PLL },
 		.mux = { CGU_REG_SSICDR, 31, 1 },
 		.div = { CGU_REG_SSICDR, 0, 1, 4, -1, -1, -1 },
 		.gate = { CGU_REG_CLKGR, 4 },
@@ -170,21 +170,21 @@ static const struct ingenic_cgu_clk_info jz4740_cgu_clocks[] = {
 
 	[JZ4740_CLK_MMC] = {
 		"mmc", CGU_CLK_DIV | CGU_CLK_GATE,
-		.parents = { JZ4740_CLK_PLL_HALF, -1, -1, -1 },
+		.parents = { JZ4740_CLK_PLL_HALF },
 		.div = { CGU_REG_MSCCDR, 0, 1, 5, -1, -1, -1 },
 		.gate = { CGU_REG_CLKGR, 7 },
 	},
 
 	[JZ4740_CLK_UHC] = {
 		"uhc", CGU_CLK_DIV | CGU_CLK_GATE,
-		.parents = { JZ4740_CLK_PLL_HALF, -1, -1, -1 },
+		.parents = { JZ4740_CLK_PLL_HALF },
 		.div = { CGU_REG_UHCCDR, 0, 1, 4, -1, -1, -1 },
 		.gate = { CGU_REG_CLKGR, 14 },
 	},
 
 	[JZ4740_CLK_UDC] = {
 		"udc", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
-		.parents = { JZ4740_CLK_EXT, JZ4740_CLK_PLL_HALF, -1, -1 },
+		.parents = { JZ4740_CLK_EXT, JZ4740_CLK_PLL_HALF },
 		.mux = { CGU_REG_CPCCR, 29, 1 },
 		.div = { CGU_REG_CPCCR, 23, 1, 6, -1, -1, -1 },
 		.gate = { CGU_REG_SCR, 6, true },
@@ -194,49 +194,49 @@ static const struct ingenic_cgu_clk_info jz4740_cgu_clocks[] = {
 
 	[JZ4740_CLK_UART0] = {
 		"uart0", CGU_CLK_GATE,
-		.parents = { JZ4740_CLK_EXT, -1, -1, -1 },
+		.parents = { JZ4740_CLK_EXT },
 		.gate = { CGU_REG_CLKGR, 0 },
 	},
 
 	[JZ4740_CLK_UART1] = {
 		"uart1", CGU_CLK_GATE,
-		.parents = { JZ4740_CLK_EXT, -1, -1, -1 },
+		.parents = { JZ4740_CLK_EXT },
 		.gate = { CGU_REG_CLKGR, 15 },
 	},
 
 	[JZ4740_CLK_DMA] = {
 		"dma", CGU_CLK_GATE,
-		.parents = { JZ4740_CLK_PCLK, -1, -1, -1 },
+		.parents = { JZ4740_CLK_PCLK },
 		.gate = { CGU_REG_CLKGR, 12 },
 	},
 
 	[JZ4740_CLK_IPU] = {
 		"ipu", CGU_CLK_GATE,
-		.parents = { JZ4740_CLK_PCLK, -1, -1, -1 },
+		.parents = { JZ4740_CLK_PCLK },
 		.gate = { CGU_REG_CLKGR, 13 },
 	},
 
 	[JZ4740_CLK_ADC] = {
 		"adc", CGU_CLK_GATE,
-		.parents = { JZ4740_CLK_EXT, -1, -1, -1 },
+		.parents = { JZ4740_CLK_EXT },
 		.gate = { CGU_REG_CLKGR, 8 },
 	},
 
 	[JZ4740_CLK_I2C] = {
 		"i2c", CGU_CLK_GATE,
-		.parents = { JZ4740_CLK_EXT, -1, -1, -1 },
+		.parents = { JZ4740_CLK_EXT },
 		.gate = { CGU_REG_CLKGR, 3 },
 	},
 
 	[JZ4740_CLK_AIC] = {
 		"aic", CGU_CLK_GATE,
-		.parents = { JZ4740_CLK_EXT, -1, -1, -1 },
+		.parents = { JZ4740_CLK_EXT },
 		.gate = { CGU_REG_CLKGR, 5 },
 	},
 
 	[JZ4740_CLK_TCU] = {
 		"tcu", CGU_CLK_GATE,
-		.parents = { JZ4740_CLK_EXT, -1, -1, -1 },
+		.parents = { JZ4740_CLK_EXT },
 		.gate = { CGU_REG_CLKGR, 1 },
 	},
 };
diff --git a/drivers/clk/ingenic/jz4760-cgu.c b/drivers/clk/ingenic/jz4760-cgu.c
index a45327c..0629ce7 100644
--- a/drivers/clk/ingenic/jz4760-cgu.c
+++ b/drivers/clk/ingenic/jz4760-cgu.c
@@ -23,7 +23,7 @@
  * CPM registers offset address definition
  */
 #define CGU_REG_CPCCR		0x00
-#define CGU_REG_LCR		0x04
+#define CGU_REG_LCR			0x04
 #define CGU_REG_CPPCR0		0x10
 #define CGU_REG_CLKGR0		0x20
 #define CGU_REG_OPCR		0x24
@@ -98,7 +98,7 @@ static const struct ingenic_cgu_clk_info jz4760_cgu_clocks[] = {
 
 	[JZ4760_CLK_PLL0] = {
 		"pll0", CGU_CLK_PLL,
-		.parents = { JZ4760_CLK_EXT },
+		.parents = { JZ4760_CLK_EXT, -1, -1, -1 },
 		.pll = {
 			.reg = CGU_REG_CPPCR0,
 			.rate_multiplier = 1,
@@ -123,7 +123,7 @@ static const struct ingenic_cgu_clk_info jz4760_cgu_clocks[] = {
 	[JZ4760_CLK_PLL1] = {
 		/* TODO: PLL1 can depend on PLL0 */
 		"pll1", CGU_CLK_PLL,
-		.parents = { JZ4760_CLK_EXT },
+		.parents = { JZ4760_CLK_EXT, -1, -1, -1 },
 		.pll = {
 			.reg = CGU_REG_CPPCR1,
 			.rate_multiplier = 1,
@@ -148,47 +148,52 @@ static const struct ingenic_cgu_clk_info jz4760_cgu_clocks[] = {
 
 	[JZ4760_CLK_CCLK] = {
 		"cclk", CGU_CLK_DIV,
-		.parents = { JZ4760_CLK_PLL0, },
+		.parents = { JZ4760_CLK_PLL0 },
 		.div = {
 			CGU_REG_CPCCR, 0, 1, 4, 22, -1, -1, 0,
 			jz4760_cgu_cpccr_div_table,
 		},
 	},
+
 	[JZ4760_CLK_HCLK] = {
 		"hclk", CGU_CLK_DIV,
-		.parents = { JZ4760_CLK_PLL0, },
+		.parents = { JZ4760_CLK_PLL0 },
 		.div = {
 			CGU_REG_CPCCR, 4, 1, 4, 22, -1, -1, 0,
 			jz4760_cgu_cpccr_div_table,
 		},
 	},
+
 	[JZ4760_CLK_SCLK] = {
 		"sclk", CGU_CLK_DIV,
-		.parents = { JZ4760_CLK_PLL0, },
+		.parents = { JZ4760_CLK_PLL0 },
 		.div = {
 			CGU_REG_CPCCR, 24, 1, 4, 22, -1, -1, 0,
 			jz4760_cgu_cpccr_div_table,
 		},
 	},
+
 	[JZ4760_CLK_H2CLK] = {
 		"h2clk", CGU_CLK_DIV,
-		.parents = { JZ4760_CLK_PLL0, },
+		.parents = { JZ4760_CLK_PLL0 },
 		.div = {
 			CGU_REG_CPCCR, 16, 1, 4, 22, -1, -1, 0,
 			jz4760_cgu_cpccr_div_table,
 		},
 	},
+
 	[JZ4760_CLK_MCLK] = {
 		"mclk", CGU_CLK_DIV,
-		.parents = { JZ4760_CLK_PLL0, },
+		.parents = { JZ4760_CLK_PLL0 },
 		.div = {
 			CGU_REG_CPCCR, 12, 1, 4, 22, -1, -1, 0,
 			jz4760_cgu_cpccr_div_table,
 		},
 	},
+
 	[JZ4760_CLK_PCLK] = {
 		"pclk", CGU_CLK_DIV,
-		.parents = { JZ4760_CLK_PLL0, },
+		.parents = { JZ4760_CLK_PLL0 },
 		.div = {
 			CGU_REG_CPCCR, 8, 1, 4, 22, -1, -1, 0,
 			jz4760_cgu_cpccr_div_table,
@@ -210,39 +215,44 @@ static const struct ingenic_cgu_clk_info jz4760_cgu_clocks[] = {
 
 	[JZ4760_CLK_UHC] = {
 		"uhc", CGU_CLK_DIV | CGU_CLK_GATE | CGU_CLK_MUX,
-		.parents = { JZ4760_CLK_PLL0_HALF, JZ4760_CLK_PLL1, },
+		.parents = { JZ4760_CLK_PLL0_HALF, JZ4760_CLK_PLL1 },
 		.mux = { CGU_REG_UHCCDR, 31, 1 },
 		.div = { CGU_REG_UHCCDR, 0, 1, 4, -1, -1, -1 },
 		.gate = { CGU_REG_CLKGR0, 24 },
 	},
+
 	[JZ4760_CLK_GPU] = {
 		"gpu", CGU_CLK_DIV | CGU_CLK_GATE | CGU_CLK_MUX,
-		.parents = { JZ4760_CLK_PLL0_HALF, JZ4760_CLK_PLL1, },
+		.parents = { JZ4760_CLK_PLL0_HALF, JZ4760_CLK_PLL1 },
 		.mux = { CGU_REG_GPUCDR, 31, 1 },
 		.div = { CGU_REG_GPUCDR, 0, 1, 3, -1, -1, -1 },
 		.gate = { CGU_REG_CLKGR1, 9 },
 	},
+
 	[JZ4760_CLK_LPCLK_DIV] = {
 		"lpclk_div", CGU_CLK_DIV | CGU_CLK_MUX,
-		.parents = { JZ4760_CLK_PLL0_HALF, JZ4760_CLK_PLL1, },
+		.parents = { JZ4760_CLK_PLL0_HALF, JZ4760_CLK_PLL1 },
 		.mux = { CGU_REG_LPCDR, 29, 1 },
 		.div = { CGU_REG_LPCDR, 0, 1, 11, -1, -1, -1 },
 	},
+
 	[JZ4760_CLK_TVE] = {
 		"tve", CGU_CLK_GATE | CGU_CLK_MUX,
-		.parents = { JZ4760_CLK_LPCLK_DIV, JZ4760_CLK_EXT, },
+		.parents = { JZ4760_CLK_LPCLK_DIV, JZ4760_CLK_EXT },
 		.mux = { CGU_REG_LPCDR, 31, 1 },
 		.gate = { CGU_REG_CLKGR0, 27 },
 	},
+
 	[JZ4760_CLK_LPCLK] = {
 		"lpclk", CGU_CLK_GATE | CGU_CLK_MUX,
-		.parents = { JZ4760_CLK_LPCLK_DIV, JZ4760_CLK_TVE, },
+		.parents = { JZ4760_CLK_LPCLK_DIV, JZ4760_CLK_TVE },
 		.mux = { CGU_REG_LPCDR, 30, 1 },
 		.gate = { CGU_REG_CLKGR0, 28 },
 	},
+
 	[JZ4760_CLK_GPS] = {
 		"gps", CGU_CLK_DIV | CGU_CLK_GATE | CGU_CLK_MUX,
-		.parents = { JZ4760_CLK_PLL0_HALF, JZ4760_CLK_PLL1, },
+		.parents = { JZ4760_CLK_PLL0_HALF, JZ4760_CLK_PLL1 },
 		.mux = { CGU_REG_GPSCDR, 31, 1 },
 		.div = { CGU_REG_GPSCDR, 0, 1, 4, -1, -1, -1 },
 		.gate = { CGU_REG_CLKGR0, 22 },
@@ -258,6 +268,7 @@ static const struct ingenic_cgu_clk_info jz4760_cgu_clocks[] = {
 		.div = { CGU_REG_PCMCDR, 0, 1, 9, -1, -1, -1, BIT(0) },
 		.gate = { CGU_REG_CLKGR1, 8 },
 	},
+
 	[JZ4760_CLK_I2S] = {
 		"i2s", CGU_CLK_DIV | CGU_CLK_MUX,
 		.parents = { JZ4760_CLK_EXT, -1,
@@ -265,6 +276,7 @@ static const struct ingenic_cgu_clk_info jz4760_cgu_clocks[] = {
 		.mux = { CGU_REG_I2SCDR, 30, 2 },
 		.div = { CGU_REG_I2SCDR, 0, 1, 9, -1, -1, -1, BIT(0) },
 	},
+
 	[JZ4760_CLK_OTG] = {
 		"usb", CGU_CLK_DIV | CGU_CLK_GATE | CGU_CLK_MUX,
 		.parents = { JZ4760_CLK_EXT, -1,
@@ -277,13 +289,14 @@ static const struct ingenic_cgu_clk_info jz4760_cgu_clocks[] = {
 	/* Those divided clocks can connect to EXT or PLL0 */
 	[JZ4760_CLK_MMC_MUX] = {
 		"mmc_mux", CGU_CLK_MUX | CGU_CLK_DIV,
-		.parents = { JZ4760_CLK_EXT, JZ4760_CLK_PLL0_HALF, },
+		.parents = { JZ4760_CLK_EXT, JZ4760_CLK_PLL0_HALF },
 		.mux = { CGU_REG_MSCCDR, 31, 1 },
 		.div = { CGU_REG_MSCCDR, 0, 1, 6, -1, -1, -1, BIT(0) },
 	},
+
 	[JZ4760_CLK_SSI_MUX] = {
 		"ssi_mux", CGU_CLK_DIV | CGU_CLK_MUX,
-		.parents = { JZ4760_CLK_EXT, JZ4760_CLK_PLL0_HALF, },
+		.parents = { JZ4760_CLK_EXT, JZ4760_CLK_PLL0_HALF },
 		.mux = { CGU_REG_SSICDR, 31, 1 },
 		.div = { CGU_REG_SSICDR, 0, 1, 6, -1, -1, -1, BIT(0) },
 	},
@@ -300,94 +313,112 @@ static const struct ingenic_cgu_clk_info jz4760_cgu_clocks[] = {
 
 	[JZ4760_CLK_SSI0] = {
 		"ssi0", CGU_CLK_GATE,
-		.parents = { JZ4760_CLK_SSI_MUX, },
+		.parents = { JZ4760_CLK_SSI_MUX },
 		.gate = { CGU_REG_CLKGR0, 4 },
 	},
+
 	[JZ4760_CLK_SSI1] = {
 		"ssi1", CGU_CLK_GATE,
-		.parents = { JZ4760_CLK_SSI_MUX, },
+		.parents = { JZ4760_CLK_SSI_MUX },
 		.gate = { CGU_REG_CLKGR0, 19 },
 	},
+
 	[JZ4760_CLK_SSI2] = {
 		"ssi2", CGU_CLK_GATE,
-		.parents = { JZ4760_CLK_SSI_MUX, },
+		.parents = { JZ4760_CLK_SSI_MUX },
 		.gate = { CGU_REG_CLKGR0, 20 },
 	},
+
 	[JZ4760_CLK_DMA] = {
 		"dma", CGU_CLK_GATE,
-		.parents = { JZ4760_CLK_H2CLK, },
+		.parents = { JZ4760_CLK_H2CLK },
 		.gate = { CGU_REG_CLKGR0, 21 },
 	},
+
 	[JZ4760_CLK_I2C0] = {
 		"i2c0", CGU_CLK_GATE,
-		.parents = { JZ4760_CLK_EXT, },
+		.parents = { JZ4760_CLK_EXT },
 		.gate = { CGU_REG_CLKGR0, 5 },
 	},
+
 	[JZ4760_CLK_I2C1] = {
 		"i2c1", CGU_CLK_GATE,
-		.parents = { JZ4760_CLK_EXT, },
+		.parents = { JZ4760_CLK_EXT },
 		.gate = { CGU_REG_CLKGR0, 6 },
 	},
+
 	[JZ4760_CLK_UART0] = {
 		"uart0", CGU_CLK_GATE,
-		.parents = { JZ4760_CLK_EXT, },
+		.parents = { JZ4760_CLK_EXT },
 		.gate = { CGU_REG_CLKGR0, 15 },
 	},
+
 	[JZ4760_CLK_UART1] = {
 		"uart1", CGU_CLK_GATE,
-		.parents = { JZ4760_CLK_EXT, },
+		.parents = { JZ4760_CLK_EXT },
 		.gate = { CGU_REG_CLKGR0, 16 },
 	},
+
 	[JZ4760_CLK_UART2] = {
 		"uart2", CGU_CLK_GATE,
-		.parents = { JZ4760_CLK_EXT, },
+		.parents = { JZ4760_CLK_EXT },
 		.gate = { CGU_REG_CLKGR0, 17 },
 	},
+
 	[JZ4760_CLK_UART3] = {
 		"uart3", CGU_CLK_GATE,
-		.parents = { JZ4760_CLK_EXT, },
+		.parents = { JZ4760_CLK_EXT },
 		.gate = { CGU_REG_CLKGR0, 18 },
 	},
+
 	[JZ4760_CLK_IPU] = {
 		"ipu", CGU_CLK_GATE,
-		.parents = { JZ4760_CLK_HCLK, },
+		.parents = { JZ4760_CLK_HCLK },
 		.gate = { CGU_REG_CLKGR0, 29 },
 	},
+
 	[JZ4760_CLK_ADC] = {
 		"adc", CGU_CLK_GATE,
-		.parents = { JZ4760_CLK_EXT, },
+		.parents = { JZ4760_CLK_EXT },
 		.gate = { CGU_REG_CLKGR0, 14 },
 	},
+
 	[JZ4760_CLK_AIC] = {
 		"aic", CGU_CLK_GATE,
-		.parents = { JZ4760_CLK_EXT, },
+		.parents = { JZ4760_CLK_EXT },
 		.gate = { CGU_REG_CLKGR0, 8 },
 	},
+
 	[JZ4760_CLK_VPU] = {
 		"vpu", CGU_CLK_GATE,
-		.parents = { JZ4760_CLK_HCLK, },
+		.parents = { JZ4760_CLK_HCLK },
 		.gate = { CGU_REG_LCR, 30, false, 150 },
 	},
+
 	[JZ4760_CLK_MMC0] = {
 		"mmc0", CGU_CLK_GATE,
-		.parents = { JZ4760_CLK_MMC_MUX, },
+		.parents = { JZ4760_CLK_MMC_MUX },
 		.gate = { CGU_REG_CLKGR0, 3 },
 	},
+
 	[JZ4760_CLK_MMC1] = {
 		"mmc1", CGU_CLK_GATE,
-		.parents = { JZ4760_CLK_MMC_MUX, },
+		.parents = { JZ4760_CLK_MMC_MUX },
 		.gate = { CGU_REG_CLKGR0, 11 },
 	},
+
 	[JZ4760_CLK_MMC2] = {
 		"mmc2", CGU_CLK_GATE,
-		.parents = { JZ4760_CLK_MMC_MUX, },
+		.parents = { JZ4760_CLK_MMC_MUX },
 		.gate = { CGU_REG_CLKGR0, 12 },
 	},
+
 	[JZ4760_CLK_UHC_PHY] = {
 		"uhc_phy", CGU_CLK_GATE,
-		.parents = { JZ4760_CLK_UHC, },
+		.parents = { JZ4760_CLK_UHC },
 		.gate = { CGU_REG_OPCR, 5 },
 	},
+
 	[JZ4760_CLK_OTG_PHY] = {
 		"usb_phy", CGU_CLK_GATE,
 		.parents = { JZ4760_CLK_OTG },
@@ -400,10 +431,11 @@ static const struct ingenic_cgu_clk_info jz4760_cgu_clocks[] = {
 		.parents = { JZ4760_CLK_EXT },
 		.fixdiv = { 512 },
 	},
+
 	[JZ4760_CLK_RTC] = {
 		"rtc", CGU_CLK_MUX,
-		.parents = { JZ4760_CLK_EXT512, JZ4760_CLK_OSC32K, },
-		.mux = { CGU_REG_OPCR, 2, 1},
+		.parents = { JZ4760_CLK_EXT512, JZ4760_CLK_OSC32K },
+		.mux = { CGU_REG_OPCR, 2, 1 },
 	},
 };
 
diff --git a/drivers/clk/ingenic/jz4770-cgu.c b/drivers/clk/ingenic/jz4770-cgu.c
index 2321742..315caa0 100644
--- a/drivers/clk/ingenic/jz4770-cgu.c
+++ b/drivers/clk/ingenic/jz4770-cgu.c
@@ -19,7 +19,7 @@
  * CPM registers offset address definition
  */
 #define CGU_REG_CPCCR		0x00
-#define CGU_REG_LCR		0x04
+#define CGU_REG_LCR			0x04
 #define CGU_REG_CPPCR0		0x10
 #define CGU_REG_CLKGR0		0x20
 #define CGU_REG_OPCR		0x24
@@ -41,7 +41,7 @@
 #define CGU_REG_BCHCDR		0xAC
 
 /* bits within the OPCR register */
-#define OPCR_SPENDH		BIT(5)		/* UHC PHY suspend */
+#define OPCR_SPENDH			BIT(5)		/* UHC PHY suspend */
 
 /* bits within the USBPCR1 register */
 #define USBPCR1_UHC_POWER	BIT(5)		/* UHC PHY power down */
@@ -55,6 +55,7 @@ static int jz4770_uhc_phy_enable(struct clk_hw *hw)
 
 	writel(readl(reg_opcr) & ~OPCR_SPENDH, reg_opcr);
 	writel(readl(reg_usbpcr1) | USBPCR1_UHC_POWER, reg_usbpcr1);
+
 	return 0;
 }
 
@@ -101,7 +102,7 @@ static const struct ingenic_cgu_clk_info jz4770_cgu_clocks[] = {
 
 	[JZ4770_CLK_PLL0] = {
 		"pll0", CGU_CLK_PLL,
-		.parents = { JZ4770_CLK_EXT },
+		.parents = { JZ4770_CLK_EXT, -1, -1, -1 },
 		.pll = {
 			.reg = CGU_REG_CPPCR0,
 			.rate_multiplier = 1,
@@ -125,7 +126,7 @@ static const struct ingenic_cgu_clk_info jz4770_cgu_clocks[] = {
 	[JZ4770_CLK_PLL1] = {
 		/* TODO: PLL1 can depend on PLL0 */
 		"pll1", CGU_CLK_PLL,
-		.parents = { JZ4770_CLK_EXT },
+		.parents = { JZ4770_CLK_EXT, -1, -1, -1 },
 		.pll = {
 			.reg = CGU_REG_CPPCR1,
 			.rate_multiplier = 1,
@@ -149,7 +150,7 @@ static const struct ingenic_cgu_clk_info jz4770_cgu_clocks[] = {
 
 	[JZ4770_CLK_CCLK] = {
 		"cclk", CGU_CLK_DIV,
-		.parents = { JZ4770_CLK_PLL0, },
+		.parents = { JZ4770_CLK_PLL0 },
 		.div = {
 			CGU_REG_CPCCR, 0, 1, 4, 22, -1, -1, 0,
 			jz4770_cgu_cpccr_div_table,
@@ -157,7 +158,7 @@ static const struct ingenic_cgu_clk_info jz4770_cgu_clocks[] = {
 	},
 	[JZ4770_CLK_H0CLK] = {
 		"h0clk", CGU_CLK_DIV,
-		.parents = { JZ4770_CLK_PLL0, },
+		.parents = { JZ4770_CLK_PLL0 },
 		.div = {
 			CGU_REG_CPCCR, 4, 1, 4, 22, -1, -1, 0,
 			jz4770_cgu_cpccr_div_table,
@@ -165,7 +166,7 @@ static const struct ingenic_cgu_clk_info jz4770_cgu_clocks[] = {
 	},
 	[JZ4770_CLK_H1CLK] = {
 		"h1clk", CGU_CLK_DIV | CGU_CLK_GATE,
-		.parents = { JZ4770_CLK_PLL0, },
+		.parents = { JZ4770_CLK_PLL0 },
 		.div = {
 			CGU_REG_CPCCR, 24, 1, 4, 22, -1, -1, 0,
 			jz4770_cgu_cpccr_div_table,
@@ -174,7 +175,7 @@ static const struct ingenic_cgu_clk_info jz4770_cgu_clocks[] = {
 	},
 	[JZ4770_CLK_H2CLK] = {
 		"h2clk", CGU_CLK_DIV,
-		.parents = { JZ4770_CLK_PLL0, },
+		.parents = { JZ4770_CLK_PLL0 },
 		.div = {
 			CGU_REG_CPCCR, 16, 1, 4, 22, -1, -1, 0,
 			jz4770_cgu_cpccr_div_table,
@@ -182,7 +183,7 @@ static const struct ingenic_cgu_clk_info jz4770_cgu_clocks[] = {
 	},
 	[JZ4770_CLK_C1CLK] = {
 		"c1clk", CGU_CLK_DIV | CGU_CLK_GATE,
-		.parents = { JZ4770_CLK_PLL0, },
+		.parents = { JZ4770_CLK_PLL0 },
 		.div = {
 			CGU_REG_CPCCR, 12, 1, 4, 22, -1, -1, 0,
 			jz4770_cgu_cpccr_div_table,
@@ -191,7 +192,7 @@ static const struct ingenic_cgu_clk_info jz4770_cgu_clocks[] = {
 	},
 	[JZ4770_CLK_PCLK] = {
 		"pclk", CGU_CLK_DIV,
-		.parents = { JZ4770_CLK_PLL0, },
+		.parents = { JZ4770_CLK_PLL0 },
 		.div = {
 			CGU_REG_CPCCR, 8, 1, 4, 22, -1, -1, 0,
 			jz4770_cgu_cpccr_div_table,
@@ -202,63 +203,63 @@ static const struct ingenic_cgu_clk_info jz4770_cgu_clocks[] = {
 
 	[JZ4770_CLK_MMC0_MUX] = {
 		"mmc0_mux", CGU_CLK_DIV | CGU_CLK_GATE | CGU_CLK_MUX,
-		.parents = { JZ4770_CLK_PLL0, JZ4770_CLK_PLL1, },
+		.parents = { JZ4770_CLK_PLL0, JZ4770_CLK_PLL1 },
 		.mux = { CGU_REG_MSC0CDR, 30, 1 },
 		.div = { CGU_REG_MSC0CDR, 0, 1, 7, -1, -1, 31 },
 		.gate = { CGU_REG_MSC0CDR, 31 },
 	},
 	[JZ4770_CLK_MMC1_MUX] = {
 		"mmc1_mux", CGU_CLK_DIV | CGU_CLK_GATE | CGU_CLK_MUX,
-		.parents = { JZ4770_CLK_PLL0, JZ4770_CLK_PLL1, },
+		.parents = { JZ4770_CLK_PLL0, JZ4770_CLK_PLL1 },
 		.mux = { CGU_REG_MSC1CDR, 30, 1 },
 		.div = { CGU_REG_MSC1CDR, 0, 1, 7, -1, -1, 31 },
 		.gate = { CGU_REG_MSC1CDR, 31 },
 	},
 	[JZ4770_CLK_MMC2_MUX] = {
 		"mmc2_mux", CGU_CLK_DIV | CGU_CLK_GATE | CGU_CLK_MUX,
-		.parents = { JZ4770_CLK_PLL0, JZ4770_CLK_PLL1, },
+		.parents = { JZ4770_CLK_PLL0, JZ4770_CLK_PLL1 },
 		.mux = { CGU_REG_MSC2CDR, 30, 1 },
 		.div = { CGU_REG_MSC2CDR, 0, 1, 7, -1, -1, 31 },
 		.gate = { CGU_REG_MSC2CDR, 31 },
 	},
 	[JZ4770_CLK_CIM] = {
 		"cim", CGU_CLK_DIV | CGU_CLK_GATE | CGU_CLK_MUX,
-		.parents = { JZ4770_CLK_PLL0, JZ4770_CLK_PLL1, },
+		.parents = { JZ4770_CLK_PLL0, JZ4770_CLK_PLL1 },
 		.mux = { CGU_REG_CIMCDR, 31, 1 },
 		.div = { CGU_REG_CIMCDR, 0, 1, 8, -1, -1, -1 },
 		.gate = { CGU_REG_CLKGR0, 26 },
 	},
 	[JZ4770_CLK_UHC] = {
 		"uhc", CGU_CLK_DIV | CGU_CLK_GATE | CGU_CLK_MUX,
-		.parents = { JZ4770_CLK_PLL0, JZ4770_CLK_PLL1, },
+		.parents = { JZ4770_CLK_PLL0, JZ4770_CLK_PLL1 },
 		.mux = { CGU_REG_UHCCDR, 29, 1 },
 		.div = { CGU_REG_UHCCDR, 0, 1, 4, -1, -1, -1 },
 		.gate = { CGU_REG_CLKGR0, 24 },
 	},
 	[JZ4770_CLK_GPU] = {
 		"gpu", CGU_CLK_DIV | CGU_CLK_GATE | CGU_CLK_MUX,
-		.parents = { JZ4770_CLK_PLL0, JZ4770_CLK_PLL1, -1 },
+		.parents = { JZ4770_CLK_PLL0, JZ4770_CLK_PLL1 },
 		.mux = { CGU_REG_GPUCDR, 31, 1 },
 		.div = { CGU_REG_GPUCDR, 0, 1, 3, -1, -1, -1 },
 		.gate = { CGU_REG_CLKGR1, 9 },
 	},
 	[JZ4770_CLK_BCH] = {
 		"bch", CGU_CLK_DIV | CGU_CLK_GATE | CGU_CLK_MUX,
-		.parents = { JZ4770_CLK_PLL0, JZ4770_CLK_PLL1, },
+		.parents = { JZ4770_CLK_PLL0, JZ4770_CLK_PLL1 },
 		.mux = { CGU_REG_BCHCDR, 31, 1 },
 		.div = { CGU_REG_BCHCDR, 0, 1, 3, -1, -1, -1 },
 		.gate = { CGU_REG_CLKGR0, 1 },
 	},
 	[JZ4770_CLK_LPCLK_MUX] = {
 		"lpclk", CGU_CLK_DIV | CGU_CLK_GATE | CGU_CLK_MUX,
-		.parents = { JZ4770_CLK_PLL0, JZ4770_CLK_PLL1, },
+		.parents = { JZ4770_CLK_PLL0, JZ4770_CLK_PLL1 },
 		.mux = { CGU_REG_LPCDR, 29, 1 },
 		.div = { CGU_REG_LPCDR, 0, 1, 11, -1, -1, -1 },
 		.gate = { CGU_REG_CLKGR0, 28 },
 	},
 	[JZ4770_CLK_GPS] = {
 		"gps", CGU_CLK_DIV | CGU_CLK_GATE | CGU_CLK_MUX,
-		.parents = { JZ4770_CLK_PLL0, JZ4770_CLK_PLL1, },
+		.parents = { JZ4770_CLK_PLL0, JZ4770_CLK_PLL1 },
 		.mux = { CGU_REG_GPSCDR, 31, 1 },
 		.div = { CGU_REG_GPSCDR, 0, 1, 4, -1, -1, -1 },
 		.gate = { CGU_REG_CLKGR0, 22 },
@@ -301,107 +302,107 @@ static const struct ingenic_cgu_clk_info jz4770_cgu_clocks[] = {
 
 	[JZ4770_CLK_SSI0] = {
 		"ssi0", CGU_CLK_GATE,
-		.parents = { JZ4770_CLK_SSI_MUX, },
+		.parents = { JZ4770_CLK_SSI_MUX },
 		.gate = { CGU_REG_CLKGR0, 4 },
 	},
 	[JZ4770_CLK_SSI1] = {
 		"ssi1", CGU_CLK_GATE,
-		.parents = { JZ4770_CLK_SSI_MUX, },
+		.parents = { JZ4770_CLK_SSI_MUX },
 		.gate = { CGU_REG_CLKGR0, 19 },
 	},
 	[JZ4770_CLK_SSI2] = {
 		"ssi2", CGU_CLK_GATE,
-		.parents = { JZ4770_CLK_SSI_MUX, },
+		.parents = { JZ4770_CLK_SSI_MUX },
 		.gate = { CGU_REG_CLKGR0, 20 },
 	},
 	[JZ4770_CLK_PCM0] = {
 		"pcm0", CGU_CLK_GATE,
-		.parents = { JZ4770_CLK_PCM_MUX, },
+		.parents = { JZ4770_CLK_PCM_MUX },
 		.gate = { CGU_REG_CLKGR1, 8 },
 	},
 	[JZ4770_CLK_PCM1] = {
 		"pcm1", CGU_CLK_GATE,
-		.parents = { JZ4770_CLK_PCM_MUX, },
+		.parents = { JZ4770_CLK_PCM_MUX },
 		.gate = { CGU_REG_CLKGR1, 10 },
 	},
 	[JZ4770_CLK_DMA] = {
 		"dma", CGU_CLK_GATE,
-		.parents = { JZ4770_CLK_H2CLK, },
+		.parents = { JZ4770_CLK_H2CLK },
 		.gate = { CGU_REG_CLKGR0, 21 },
 	},
 	[JZ4770_CLK_I2C0] = {
 		"i2c0", CGU_CLK_GATE,
-		.parents = { JZ4770_CLK_EXT, },
+		.parents = { JZ4770_CLK_EXT },
 		.gate = { CGU_REG_CLKGR0, 5 },
 	},
 	[JZ4770_CLK_I2C1] = {
 		"i2c1", CGU_CLK_GATE,
-		.parents = { JZ4770_CLK_EXT, },
+		.parents = { JZ4770_CLK_EXT },
 		.gate = { CGU_REG_CLKGR0, 6 },
 	},
 	[JZ4770_CLK_I2C2] = {
 		"i2c2", CGU_CLK_GATE,
-		.parents = { JZ4770_CLK_EXT, },
+		.parents = { JZ4770_CLK_EXT },
 		.gate = { CGU_REG_CLKGR1, 15 },
 	},
 	[JZ4770_CLK_UART0] = {
 		"uart0", CGU_CLK_GATE,
-		.parents = { JZ4770_CLK_EXT, },
+		.parents = { JZ4770_CLK_EXT },
 		.gate = { CGU_REG_CLKGR0, 15 },
 	},
 	[JZ4770_CLK_UART1] = {
 		"uart1", CGU_CLK_GATE,
-		.parents = { JZ4770_CLK_EXT, },
+		.parents = { JZ4770_CLK_EXT },
 		.gate = { CGU_REG_CLKGR0, 16 },
 	},
 	[JZ4770_CLK_UART2] = {
 		"uart2", CGU_CLK_GATE,
-		.parents = { JZ4770_CLK_EXT, },
+		.parents = { JZ4770_CLK_EXT },
 		.gate = { CGU_REG_CLKGR0, 17 },
 	},
 	[JZ4770_CLK_UART3] = {
 		"uart3", CGU_CLK_GATE,
-		.parents = { JZ4770_CLK_EXT, },
+		.parents = { JZ4770_CLK_EXT },
 		.gate = { CGU_REG_CLKGR0, 18 },
 	},
 	[JZ4770_CLK_IPU] = {
 		"ipu", CGU_CLK_GATE,
-		.parents = { JZ4770_CLK_H0CLK, },
+		.parents = { JZ4770_CLK_H0CLK },
 		.gate = { CGU_REG_CLKGR0, 29 },
 	},
 	[JZ4770_CLK_ADC] = {
 		"adc", CGU_CLK_GATE,
-		.parents = { JZ4770_CLK_EXT, },
+		.parents = { JZ4770_CLK_EXT },
 		.gate = { CGU_REG_CLKGR0, 14 },
 	},
 	[JZ4770_CLK_AIC] = {
 		"aic", CGU_CLK_GATE,
-		.parents = { JZ4770_CLK_EXT, },
+		.parents = { JZ4770_CLK_EXT },
 		.gate = { CGU_REG_CLKGR0, 8 },
 	},
 	[JZ4770_CLK_AUX] = {
 		"aux", CGU_CLK_GATE,
-		.parents = { JZ4770_CLK_C1CLK, },
+		.parents = { JZ4770_CLK_C1CLK },
 		.gate = { CGU_REG_CLKGR1, 14 },
 	},
 	[JZ4770_CLK_VPU] = {
 		"vpu", CGU_CLK_GATE,
-		.parents = { JZ4770_CLK_H1CLK, },
+		.parents = { JZ4770_CLK_H1CLK },
 		.gate = { CGU_REG_LCR, 30, false, 150 },
 	},
 	[JZ4770_CLK_MMC0] = {
 		"mmc0", CGU_CLK_GATE,
-		.parents = { JZ4770_CLK_MMC0_MUX, },
+		.parents = { JZ4770_CLK_MMC0_MUX },
 		.gate = { CGU_REG_CLKGR0, 3 },
 	},
 	[JZ4770_CLK_MMC1] = {
 		"mmc1", CGU_CLK_GATE,
-		.parents = { JZ4770_CLK_MMC1_MUX, },
+		.parents = { JZ4770_CLK_MMC1_MUX },
 		.gate = { CGU_REG_CLKGR0, 11 },
 	},
 	[JZ4770_CLK_MMC2] = {
 		"mmc2", CGU_CLK_GATE,
-		.parents = { JZ4770_CLK_MMC2_MUX, },
+		.parents = { JZ4770_CLK_MMC2_MUX },
 		.gate = { CGU_REG_CLKGR0, 12 },
 	},
 	[JZ4770_CLK_OTG_PHY] = {
@@ -426,7 +427,7 @@ static const struct ingenic_cgu_clk_info jz4770_cgu_clocks[] = {
 
 	[JZ4770_CLK_RTC] = {
 		"rtc", CGU_CLK_MUX,
-		.parents = { JZ4770_CLK_EXT512, JZ4770_CLK_OSC32K, },
+		.parents = { JZ4770_CLK_EXT512, JZ4770_CLK_OSC32K },
 		.mux = { CGU_REG_OPCR, 2, 1},
 	},
 };
diff --git a/drivers/clk/ingenic/jz4780-cgu.c b/drivers/clk/ingenic/jz4780-cgu.c
index dcca74e..94bc76b 100644
--- a/drivers/clk/ingenic/jz4780-cgu.c
+++ b/drivers/clk/ingenic/jz4780-cgu.c
@@ -178,6 +178,7 @@ static int jz4780_otg_phy_set_rate(struct clk_hw *hw, unsigned long req_rate,
 	writel(usbpcr1, cgu->base + CGU_REG_USBPCR1);
 
 	spin_unlock_irqrestore(&cgu->lock, flags);
+
 	return 0;
 }
 
@@ -188,6 +189,7 @@ static int jz4780_otg_phy_enable(struct clk_hw *hw)
 
 	writel(readl(reg_opcr) | OPCR_SPENDN0, reg_opcr);
 	writel(readl(reg_usbpcr) & ~USBPCR_OTG_DISABLE & ~USBPCR_SIDDQ, reg_usbpcr);
+
 	return 0;
 }
 
@@ -215,9 +217,9 @@ static const struct clk_ops jz4780_otg_phy_ops = {
 	.round_rate = jz4780_otg_phy_round_rate,
 	.set_rate = jz4780_otg_phy_set_rate,
 
-	.enable		= jz4780_otg_phy_enable,
-	.disable	= jz4780_otg_phy_disable,
-	.is_enabled	= jz4780_otg_phy_is_enabled,
+	.enable = jz4780_otg_phy_enable,
+	.disable = jz4780_otg_phy_disable,
+	.is_enabled = jz4780_otg_phy_is_enabled,
 };
 
 static int jz4780_core1_enable(struct clk_hw *hw)
@@ -336,11 +338,17 @@ static const struct ingenic_cgu_clk_info jz4780_cgu_clocks[] = {
 
 #undef DEF_PLL
 
-	/* Custom (SoC-specific) OTG PHY */
+	/* Custom (SoC-specific) */
+
+	[JZ4780_CLK_CORE1] = {
+		"core1", CGU_CLK_CUSTOM,
+		.parents = { JZ4780_CLK_CPU, -1, -1, -1 },
+		.custom = { &jz4780_core1_ops },
+	},
 
 	[JZ4780_CLK_OTGPHY] = {
 		"otg_phy", CGU_CLK_CUSTOM,
-		.parents = { -1, -1, JZ4780_CLK_EXCLK, -1 },
+		.parents = { JZ4780_CLK_EXCLK, -1, -1, -1 },
 		.custom = { &jz4780_otg_phy_ops },
 	},
 
@@ -362,13 +370,13 @@ static const struct ingenic_cgu_clk_info jz4780_cgu_clocks[] = {
 
 	[JZ4780_CLK_CPU] = {
 		"cpu", CGU_CLK_DIV,
-		.parents = { JZ4780_CLK_CPUMUX, -1, -1, -1 },
+		.parents = { JZ4780_CLK_CPUMUX },
 		.div = { CGU_REG_CLOCKCONTROL, 0, 1, 4, 22, -1, -1 },
 	},
 
 	[JZ4780_CLK_L2CACHE] = {
 		"l2cache", CGU_CLK_DIV,
-		.parents = { JZ4780_CLK_CPUMUX, -1, -1, -1 },
+		.parents = { JZ4780_CLK_CPUMUX },
 		.div = { CGU_REG_CLOCKCONTROL, 4, 1, 4, -1, -1, -1 },
 	},
 
@@ -389,13 +397,13 @@ static const struct ingenic_cgu_clk_info jz4780_cgu_clocks[] = {
 
 	[JZ4780_CLK_AHB2] = {
 		"ahb2", CGU_CLK_DIV,
-		.parents = { JZ4780_CLK_AHB2PMUX, -1, -1, -1 },
+		.parents = { JZ4780_CLK_AHB2PMUX },
 		.div = { CGU_REG_CLOCKCONTROL, 12, 1, 4, 20, -1, -1 },
 	},
 
 	[JZ4780_CLK_PCLK] = {
 		"pclk", CGU_CLK_DIV,
-		.parents = { JZ4780_CLK_AHB2PMUX, -1, -1, -1 },
+		.parents = { JZ4780_CLK_AHB2PMUX },
 		.div = { CGU_REG_CLOCKCONTROL, 16, 1, 4, 20, -1, -1 },
 	},
 
@@ -417,14 +425,14 @@ static const struct ingenic_cgu_clk_info jz4780_cgu_clocks[] = {
 
 	[JZ4780_CLK_I2SPLL] = {
 		"i2s_pll", CGU_CLK_MUX | CGU_CLK_DIV,
-		.parents = { JZ4780_CLK_SCLKA, JZ4780_CLK_EPLL, -1, -1 },
+		.parents = { JZ4780_CLK_SCLKA, JZ4780_CLK_EPLL },
 		.mux = { CGU_REG_I2SCDR, 30, 1 },
 		.div = { CGU_REG_I2SCDR, 0, 1, 8, 29, 28, 27 },
 	},
 
 	[JZ4780_CLK_I2S] = {
 		"i2s", CGU_CLK_MUX,
-		.parents = { JZ4780_CLK_EXCLK, JZ4780_CLK_I2SPLL, -1, -1 },
+		.parents = { JZ4780_CLK_EXCLK, JZ4780_CLK_I2SPLL },
 		.mux = { CGU_REG_I2SCDR, 31, 1 },
 	},
 
@@ -452,21 +460,21 @@ static const struct ingenic_cgu_clk_info jz4780_cgu_clocks[] = {
 
 	[JZ4780_CLK_MSC0] = {
 		"msc0", CGU_CLK_DIV | CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_MSCMUX, -1, -1, -1 },
+		.parents = { JZ4780_CLK_MSCMUX },
 		.div = { CGU_REG_MSC0CDR, 0, 2, 8, 29, 28, 27 },
 		.gate = { CGU_REG_CLKGR0, 3 },
 	},
 
 	[JZ4780_CLK_MSC1] = {
 		"msc1", CGU_CLK_DIV | CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_MSCMUX, -1, -1, -1 },
+		.parents = { JZ4780_CLK_MSCMUX },
 		.div = { CGU_REG_MSC1CDR, 0, 2, 8, 29, 28, 27 },
 		.gate = { CGU_REG_CLKGR0, 11 },
 	},
 
 	[JZ4780_CLK_MSC2] = {
 		"msc2", CGU_CLK_DIV | CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_MSCMUX, -1, -1, -1 },
+		.parents = { JZ4780_CLK_MSCMUX },
 		.div = { CGU_REG_MSC2CDR, 0, 2, 8, 29, 28, 27 },
 		.gate = { CGU_REG_CLKGR0, 12 },
 	},
@@ -482,20 +490,20 @@ static const struct ingenic_cgu_clk_info jz4780_cgu_clocks[] = {
 
 	[JZ4780_CLK_SSIPLL] = {
 		"ssi_pll", CGU_CLK_MUX | CGU_CLK_DIV,
-		.parents = { JZ4780_CLK_SCLKA, JZ4780_CLK_MPLL, -1, -1 },
+		.parents = { JZ4780_CLK_SCLKA, JZ4780_CLK_MPLL },
 		.mux = { CGU_REG_SSICDR, 30, 1 },
 		.div = { CGU_REG_SSICDR, 0, 1, 8, 29, 28, 27 },
 	},
 
 	[JZ4780_CLK_SSI] = {
 		"ssi", CGU_CLK_MUX,
-		.parents = { JZ4780_CLK_EXCLK, JZ4780_CLK_SSIPLL, -1, -1 },
+		.parents = { JZ4780_CLK_EXCLK, JZ4780_CLK_SSIPLL },
 		.mux = { CGU_REG_SSICDR, 31, 1 },
 	},
 
 	[JZ4780_CLK_CIMMCLK] = {
 		"cim_mclk", CGU_CLK_MUX | CGU_CLK_DIV,
-		.parents = { JZ4780_CLK_SCLKA, JZ4780_CLK_MPLL, -1, -1 },
+		.parents = { JZ4780_CLK_SCLKA, JZ4780_CLK_MPLL },
 		.mux = { CGU_REG_CIMCDR, 31, 1 },
 		.div = { CGU_REG_CIMCDR, 0, 1, 8, 30, 29, 28 },
 	},
@@ -510,7 +518,7 @@ static const struct ingenic_cgu_clk_info jz4780_cgu_clocks[] = {
 
 	[JZ4780_CLK_PCM] = {
 		"pcm", CGU_CLK_MUX | CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_EXCLK, JZ4780_CLK_PCMPLL, -1, -1 },
+		.parents = { JZ4780_CLK_EXCLK, JZ4780_CLK_PCMPLL },
 		.mux = { CGU_REG_PCMCDR, 31, 1 },
 		.gate = { CGU_REG_CLKGR1, 3 },
 	},
@@ -558,238 +566,231 @@ static const struct ingenic_cgu_clk_info jz4780_cgu_clocks[] = {
 
 	[JZ4780_CLK_NEMC] = {
 		"nemc", CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_AHB2, -1, -1, -1 },
+		.parents = { JZ4780_CLK_AHB2 },
 		.gate = { CGU_REG_CLKGR0, 0 },
 	},
 
 	[JZ4780_CLK_OTG0] = {
 		"otg0", CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_EXCLK, -1, -1, -1 },
+		.parents = { JZ4780_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR0, 2 },
 	},
 
 	[JZ4780_CLK_SSI0] = {
 		"ssi0", CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_SSI, -1, -1, -1 },
+		.parents = { JZ4780_CLK_SSI },
 		.gate = { CGU_REG_CLKGR0, 4 },
 	},
 
 	[JZ4780_CLK_SMB0] = {
 		"smb0", CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_PCLK, -1, -1, -1 },
+		.parents = { JZ4780_CLK_PCLK },
 		.gate = { CGU_REG_CLKGR0, 5 },
 	},
 
 	[JZ4780_CLK_SMB1] = {
 		"smb1", CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_PCLK, -1, -1, -1 },
+		.parents = { JZ4780_CLK_PCLK },
 		.gate = { CGU_REG_CLKGR0, 6 },
 	},
 
 	[JZ4780_CLK_SCC] = {
 		"scc", CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_EXCLK, -1, -1, -1 },
+		.parents = { JZ4780_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR0, 7 },
 	},
 
 	[JZ4780_CLK_AIC] = {
 		"aic", CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_EXCLK, -1, -1, -1 },
+		.parents = { JZ4780_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR0, 8 },
 	},
 
 	[JZ4780_CLK_TSSI0] = {
 		"tssi0", CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_EXCLK, -1, -1, -1 },
+		.parents = { JZ4780_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR0, 9 },
 	},
 
 	[JZ4780_CLK_OWI] = {
 		"owi", CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_EXCLK, -1, -1, -1 },
+		.parents = { JZ4780_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR0, 10 },
 	},
 
 	[JZ4780_CLK_KBC] = {
 		"kbc", CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_EXCLK, -1, -1, -1 },
+		.parents = { JZ4780_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR0, 13 },
 	},
 
 	[JZ4780_CLK_SADC] = {
 		"sadc", CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_EXCLK, -1, -1, -1 },
+		.parents = { JZ4780_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR0, 14 },
 	},
 
 	[JZ4780_CLK_UART0] = {
 		"uart0", CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_EXCLK, -1, -1, -1 },
+		.parents = { JZ4780_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR0, 15 },
 	},
 
 	[JZ4780_CLK_UART1] = {
 		"uart1", CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_EXCLK, -1, -1, -1 },
+		.parents = { JZ4780_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR0, 16 },
 	},
 
 	[JZ4780_CLK_UART2] = {
 		"uart2", CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_EXCLK, -1, -1, -1 },
+		.parents = { JZ4780_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR0, 17 },
 	},
 
 	[JZ4780_CLK_UART3] = {
 		"uart3", CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_EXCLK, -1, -1, -1 },
+		.parents = { JZ4780_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR0, 18 },
 	},
 
 	[JZ4780_CLK_SSI1] = {
 		"ssi1", CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_SSI, -1, -1, -1 },
+		.parents = { JZ4780_CLK_SSI },
 		.gate = { CGU_REG_CLKGR0, 19 },
 	},
 
 	[JZ4780_CLK_SSI2] = {
 		"ssi2", CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_SSI, -1, -1, -1 },
+		.parents = { JZ4780_CLK_SSI },
 		.gate = { CGU_REG_CLKGR0, 20 },
 	},
 
 	[JZ4780_CLK_PDMA] = {
 		"pdma", CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_EXCLK, -1, -1, -1 },
+		.parents = { JZ4780_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR0, 21 },
 	},
 
 	[JZ4780_CLK_GPS] = {
 		"gps", CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_EXCLK, -1, -1, -1 },
+		.parents = { JZ4780_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR0, 22 },
 	},
 
 	[JZ4780_CLK_MAC] = {
 		"mac", CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_EXCLK, -1, -1, -1 },
+		.parents = { JZ4780_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR0, 23 },
 	},
 
 	[JZ4780_CLK_SMB2] = {
 		"smb2", CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_PCLK, -1, -1, -1 },
+		.parents = { JZ4780_CLK_PCLK },
 		.gate = { CGU_REG_CLKGR0, 24 },
 	},
 
 	[JZ4780_CLK_CIM] = {
 		"cim", CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_EXCLK, -1, -1, -1 },
+		.parents = { JZ4780_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR0, 26 },
 	},
 
 	[JZ4780_CLK_LCD] = {
 		"lcd", CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_EXCLK, -1, -1, -1 },
+		.parents = { JZ4780_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR0, 28 },
 	},
 
 	[JZ4780_CLK_TVE] = {
 		"tve", CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_LCD, -1, -1, -1 },
+		.parents = { JZ4780_CLK_LCD },
 		.gate = { CGU_REG_CLKGR0, 27 },
 	},
 
 	[JZ4780_CLK_IPU] = {
 		"ipu", CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_EXCLK, -1, -1, -1 },
+		.parents = { JZ4780_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR0, 29 },
 	},
 
 	[JZ4780_CLK_DDR0] = {
 		"ddr0", CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_DDR, -1, -1, -1 },
+		.parents = { JZ4780_CLK_DDR },
 		.gate = { CGU_REG_CLKGR0, 30 },
 	},
 
 	[JZ4780_CLK_DDR1] = {
 		"ddr1", CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_DDR, -1, -1, -1 },
+		.parents = { JZ4780_CLK_DDR },
 		.gate = { CGU_REG_CLKGR0, 31 },
 	},
 
 	[JZ4780_CLK_SMB3] = {
 		"smb3", CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_PCLK, -1, -1, -1 },
+		.parents = { JZ4780_CLK_PCLK },
 		.gate = { CGU_REG_CLKGR1, 0 },
 	},
 
 	[JZ4780_CLK_TSSI1] = {
 		"tssi1", CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_EXCLK, -1, -1, -1 },
+		.parents = { JZ4780_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR1, 1 },
 	},
 
 	[JZ4780_CLK_COMPRESS] = {
 		"compress", CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_EXCLK, -1, -1, -1 },
+		.parents = { JZ4780_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR1, 5 },
 	},
 
 	[JZ4780_CLK_AIC1] = {
 		"aic1", CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_EXCLK, -1, -1, -1 },
+		.parents = { JZ4780_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR1, 6 },
 	},
 
 	[JZ4780_CLK_GPVLC] = {
 		"gpvlc", CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_EXCLK, -1, -1, -1 },
+		.parents = { JZ4780_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR1, 7 },
 	},
 
 	[JZ4780_CLK_OTG1] = {
 		"otg1", CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_EXCLK, -1, -1, -1 },
+		.parents = { JZ4780_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR1, 8 },
 	},
 
 	[JZ4780_CLK_UART4] = {
 		"uart4", CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_EXCLK, -1, -1, -1 },
+		.parents = { JZ4780_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR1, 10 },
 	},
 
 	[JZ4780_CLK_AHBMON] = {
 		"ahb_mon", CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_EXCLK, -1, -1, -1 },
+		.parents = { JZ4780_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR1, 11 },
 	},
 
 	[JZ4780_CLK_SMB4] = {
 		"smb4", CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_PCLK, -1, -1, -1 },
+		.parents = { JZ4780_CLK_PCLK },
 		.gate = { CGU_REG_CLKGR1, 12 },
 	},
 
 	[JZ4780_CLK_DES] = {
 		"des", CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_EXCLK, -1, -1, -1 },
+		.parents = { JZ4780_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR1, 13 },
 	},
 
 	[JZ4780_CLK_X2D] = {
 		"x2d", CGU_CLK_GATE,
-		.parents = { JZ4780_CLK_EXCLK, -1, -1, -1 },
+		.parents = { JZ4780_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR1, 14 },
 	},
-
-	[JZ4780_CLK_CORE1] = {
-		"core1", CGU_CLK_CUSTOM,
-		.parents = { JZ4780_CLK_CPU, -1, -1, -1 },
-		.custom = { &jz4780_core1_ops },
-	},
-
 };
 
 static void __init jz4780_cgu_init(struct device_node *np)
diff --git a/drivers/clk/ingenic/x1000-cgu.c b/drivers/clk/ingenic/x1000-cgu.c
index 59b16a6..41b2c2e 100644
--- a/drivers/clk/ingenic/x1000-cgu.c
+++ b/drivers/clk/ingenic/x1000-cgu.c
@@ -15,38 +15,38 @@
 #include "pm.h"
 
 /* CGU register offsets */
-#define CGU_REG_CPCCR		0x00
-#define CGU_REG_APLL		0x10
-#define CGU_REG_MPLL		0x14
-#define CGU_REG_CLKGR		0x20
-#define CGU_REG_OPCR		0x24
-#define CGU_REG_DDRCDR		0x2c
-#define CGU_REG_USBPCR		0x3c
-#define CGU_REG_USBPCR1		0x48
-#define CGU_REG_USBCDR		0x50
-#define CGU_REG_MACCDR		0x54
-#define CGU_REG_I2SCDR		0x60
-#define CGU_REG_LPCDR		0x64
-#define CGU_REG_MSC0CDR		0x68
-#define CGU_REG_I2SCDR1		0x70
-#define CGU_REG_SSICDR		0x74
-#define CGU_REG_CIMCDR		0x7c
-#define CGU_REG_PCMCDR		0x84
-#define CGU_REG_MSC1CDR		0xa4
-#define CGU_REG_CMP_INTR	0xb0
-#define CGU_REG_CMP_INTRE	0xb4
-#define CGU_REG_DRCG		0xd0
-#define CGU_REG_CPCSR		0xd4
-#define CGU_REG_PCMCDR1		0xe0
-#define CGU_REG_MACPHYC		0xe8
+#define CGU_REG_CPCCR			0x00
+#define CGU_REG_APLL			0x10
+#define CGU_REG_MPLL			0x14
+#define CGU_REG_CLKGR			0x20
+#define CGU_REG_OPCR			0x24
+#define CGU_REG_DDRCDR			0x2c
+#define CGU_REG_USBPCR			0x3c
+#define CGU_REG_USBPCR1			0x48
+#define CGU_REG_USBCDR			0x50
+#define CGU_REG_MACCDR			0x54
+#define CGU_REG_I2SCDR			0x60
+#define CGU_REG_LPCDR			0x64
+#define CGU_REG_MSC0CDR			0x68
+#define CGU_REG_I2SCDR1			0x70
+#define CGU_REG_SSICDR			0x74
+#define CGU_REG_CIMCDR			0x7c
+#define CGU_REG_PCMCDR			0x84
+#define CGU_REG_MSC1CDR			0xa4
+#define CGU_REG_CMP_INTR		0xb0
+#define CGU_REG_CMP_INTRE		0xb4
+#define CGU_REG_DRCG			0xd0
+#define CGU_REG_CPCSR			0xd4
+#define CGU_REG_PCMCDR1			0xe0
+#define CGU_REG_MACPHYC			0xe8
 
 /* bits within the OPCR register */
-#define OPCR_SPENDN0		BIT(7)
-#define OPCR_SPENDN1		BIT(6)
+#define OPCR_SPENDN0			BIT(7)
+#define OPCR_SPENDN1			BIT(6)
 
 /* bits within the USBPCR register */
-#define USBPCR_SIDDQ		BIT(21)
-#define USBPCR_OTG_DISABLE	BIT(20)
+#define USBPCR_SIDDQ			BIT(21)
+#define USBPCR_OTG_DISABLE		BIT(20)
 
 /* bits within the USBPCR1 register */
 #define USBPCR1_REFCLKSEL_SHIFT	26
@@ -174,6 +174,7 @@ static int x1000_otg_phy_set_rate(struct clk_hw *hw, unsigned long req_rate,
 	writel(usbpcr1, cgu->base + CGU_REG_USBPCR1);
 
 	spin_unlock_irqrestore(&cgu->lock, flags);
+
 	return 0;
 }
 
@@ -184,6 +185,7 @@ static int x1000_usb_phy_enable(struct clk_hw *hw)
 
 	writel(readl(reg_opcr) | OPCR_SPENDN0, reg_opcr);
 	writel(readl(reg_usbpcr) & ~USBPCR_OTG_DISABLE & ~USBPCR_SIDDQ, reg_usbpcr);
+
 	return 0;
 }
 
@@ -211,9 +213,9 @@ static const struct clk_ops x1000_otg_phy_ops = {
 	.round_rate = x1000_otg_phy_round_rate,
 	.set_rate = x1000_otg_phy_set_rate,
 
-	.enable		= x1000_usb_phy_enable,
-	.disable	= x1000_usb_phy_disable,
-	.is_enabled	= x1000_usb_phy_is_enabled,
+	.enable = x1000_usb_phy_enable,
+	.disable = x1000_usb_phy_disable,
+	.is_enabled = x1000_usb_phy_is_enabled,
 };
 
 static const s8 pll_od_encoding[8] = {
@@ -300,7 +302,7 @@ static const struct ingenic_cgu_clk_info x1000_cgu_clocks[] = {
 
 	[X1000_CLK_OTGPHY] = {
 		"otg_phy", CGU_CLK_CUSTOM,
-		.parents = { -1, -1, X1000_CLK_EXCLK, -1 },
+		.parents = { X1000_CLK_EXCLK, -1, -1, -1 },
 		.custom = { &x1000_otg_phy_ops },
 	},
 
@@ -320,14 +322,14 @@ static const struct ingenic_cgu_clk_info x1000_cgu_clocks[] = {
 
 	[X1000_CLK_CPU] = {
 		"cpu", CGU_CLK_DIV | CGU_CLK_GATE,
-		.parents = { X1000_CLK_CPUMUX, -1, -1, -1 },
+		.parents = { X1000_CLK_CPUMUX },
 		.div = { CGU_REG_CPCCR, 0, 1, 4, 22, -1, -1 },
 		.gate = { CGU_REG_CLKGR, 30 },
 	},
 
 	[X1000_CLK_L2CACHE] = {
 		"l2cache", CGU_CLK_DIV,
-		.parents = { X1000_CLK_CPUMUX, -1, -1, -1 },
+		.parents = { X1000_CLK_CPUMUX },
 		.div = { CGU_REG_CPCCR, 4, 1, 4, 22, -1, -1 },
 	},
 
@@ -346,13 +348,13 @@ static const struct ingenic_cgu_clk_info x1000_cgu_clocks[] = {
 
 	[X1000_CLK_AHB2] = {
 		"ahb2", CGU_CLK_DIV,
-		.parents = { X1000_CLK_AHB2PMUX, -1, -1, -1 },
+		.parents = { X1000_CLK_AHB2PMUX },
 		.div = { CGU_REG_CPCCR, 12, 1, 4, 20, -1, -1 },
 	},
 
 	[X1000_CLK_PCLK] = {
 		"pclk", CGU_CLK_DIV | CGU_CLK_GATE,
-		.parents = { X1000_CLK_AHB2PMUX, -1, -1, -1 },
+		.parents = { X1000_CLK_AHB2PMUX },
 		.div = { CGU_REG_CPCCR, 16, 1, 4, 20, -1, -1 },
 		.gate = { CGU_REG_CLKGR, 28 },
 	},
@@ -382,20 +384,20 @@ static const struct ingenic_cgu_clk_info x1000_cgu_clocks[] = {
 
 	[X1000_CLK_MSCMUX] = {
 		"msc_mux", CGU_CLK_MUX,
-		.parents = { X1000_CLK_SCLKA, X1000_CLK_MPLL},
+		.parents = { X1000_CLK_SCLKA, X1000_CLK_MPLL },
 		.mux = { CGU_REG_MSC0CDR, 31, 1 },
 	},
 
 	[X1000_CLK_MSC0] = {
 		"msc0", CGU_CLK_DIV | CGU_CLK_GATE,
-		.parents = { X1000_CLK_MSCMUX, -1, -1, -1 },
+		.parents = { X1000_CLK_MSCMUX },
 		.div = { CGU_REG_MSC0CDR, 0, 2, 8, 29, 28, 27 },
 		.gate = { CGU_REG_CLKGR, 4 },
 	},
 
 	[X1000_CLK_MSC1] = {
 		"msc1", CGU_CLK_DIV | CGU_CLK_GATE,
-		.parents = { X1000_CLK_MSCMUX, -1, -1, -1 },
+		.parents = { X1000_CLK_MSCMUX },
 		.div = { CGU_REG_MSC1CDR, 0, 2, 8, 29, 28, 27 },
 		.gate = { CGU_REG_CLKGR, 5 },
 	},
@@ -411,7 +413,7 @@ static const struct ingenic_cgu_clk_info x1000_cgu_clocks[] = {
 
 	[X1000_CLK_SSIPLL] = {
 		"ssi_pll", CGU_CLK_MUX | CGU_CLK_DIV,
-		.parents = { X1000_CLK_SCLKA, X1000_CLK_MPLL, -1, -1 },
+		.parents = { X1000_CLK_SCLKA, X1000_CLK_MPLL },
 		.mux = { CGU_REG_SSICDR, 31, 1 },
 		.div = { CGU_REG_SSICDR, 0, 1, 8, 29, 28, 27 },
 	},
@@ -424,13 +426,13 @@ static const struct ingenic_cgu_clk_info x1000_cgu_clocks[] = {
 
 	[X1000_CLK_SSIMUX] = {
 		"ssi_mux", CGU_CLK_MUX,
-		.parents = { X1000_CLK_EXCLK, X1000_CLK_SSIPLL_DIV2, -1, -1 },
+		.parents = { X1000_CLK_EXCLK, X1000_CLK_SSIPLL_DIV2 },
 		.mux = { CGU_REG_SSICDR, 30, 1 },
 	},
 
 	[X1000_CLK_CIM] = {
 		"cim", CGU_CLK_MUX | CGU_CLK_DIV,
-		.parents = { X1000_CLK_SCLKA, X1000_CLK_MPLL, -1, -1 },
+		.parents = { X1000_CLK_SCLKA, X1000_CLK_MPLL },
 		.mux = { CGU_REG_CIMCDR, 31, 1 },
 		.div = { CGU_REG_CIMCDR, 0, 1, 8, 29, 28, 27 },
 	},
@@ -452,91 +454,91 @@ static const struct ingenic_cgu_clk_info x1000_cgu_clocks[] = {
 
 	[X1000_CLK_EMC] = {
 		"emc", CGU_CLK_GATE,
-		.parents = { X1000_CLK_AHB2, -1, -1, -1 },
+		.parents = { X1000_CLK_AHB2 },
 		.gate = { CGU_REG_CLKGR, 0 },
 	},
 
 	[X1000_CLK_EFUSE] = {
 		"efuse", CGU_CLK_GATE,
-		.parents = { X1000_CLK_AHB2, -1, -1, -1 },
+		.parents = { X1000_CLK_AHB2 },
 		.gate = { CGU_REG_CLKGR, 1 },
 	},
 
 	[X1000_CLK_SFC] = {
 		"sfc", CGU_CLK_GATE,
-		.parents = { X1000_CLK_SSIPLL, -1, -1, -1 },
+		.parents = { X1000_CLK_SSIPLL },
 		.gate = { CGU_REG_CLKGR, 2 },
 	},
 
 	[X1000_CLK_I2C0] = {
 		"i2c0", CGU_CLK_GATE,
-		.parents = { X1000_CLK_PCLK, -1, -1, -1 },
+		.parents = { X1000_CLK_PCLK },
 		.gate = { CGU_REG_CLKGR, 7 },
 	},
 
 	[X1000_CLK_I2C1] = {
 		"i2c1", CGU_CLK_GATE,
-		.parents = { X1000_CLK_PCLK, -1, -1, -1 },
+		.parents = { X1000_CLK_PCLK },
 		.gate = { CGU_REG_CLKGR, 8 },
 	},
 
 	[X1000_CLK_I2C2] = {
 		"i2c2", CGU_CLK_GATE,
-		.parents = { X1000_CLK_PCLK, -1, -1, -1 },
+		.parents = { X1000_CLK_PCLK },
 		.gate = { CGU_REG_CLKGR, 9 },
 	},
 
 	[X1000_CLK_AIC] = {
 		"aic", CGU_CLK_GATE,
-		.parents = { X1000_CLK_EXCLK, -1, -1, -1 },
+		.parents = { X1000_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR, 11 },
 	},
 
 	[X1000_CLK_UART0] = {
 		"uart0", CGU_CLK_GATE,
-		.parents = { X1000_CLK_EXCLK, -1, -1, -1 },
+		.parents = { X1000_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR, 14 },
 	},
 
 	[X1000_CLK_UART1] = {
 		"uart1", CGU_CLK_GATE,
-		.parents = { X1000_CLK_EXCLK, -1, -1, -1 },
+		.parents = { X1000_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR, 15 },
 	},
 
 	[X1000_CLK_UART2] = {
 		"uart2", CGU_CLK_GATE,
-		.parents = { X1000_CLK_EXCLK, -1, -1, -1 },
+		.parents = { X1000_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR, 16 },
 	},
 
 	[X1000_CLK_DMIC] = {
 		"dmic", CGU_CLK_GATE,
-		.parents = { X1000_CLK_PCLK, -1, -1, -1 },
+		.parents = { X1000_CLK_PCLK },
 		.gate = { CGU_REG_CLKGR, 17 },
 	},
 
 	[X1000_CLK_TCU] = {
 		"tcu", CGU_CLK_GATE,
-		.parents = { X1000_CLK_EXCLK, -1, -1, -1 },
+		.parents = { X1000_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR, 18 },
 	},
 
 	[X1000_CLK_SSI] = {
 		"ssi", CGU_CLK_GATE,
-		.parents = { X1000_CLK_SSIMUX, -1, -1, -1 },
+		.parents = { X1000_CLK_SSIMUX },
 		.gate = { CGU_REG_CLKGR, 19 },
 	},
 
 	[X1000_CLK_OST] = {
 		"ost", CGU_CLK_GATE,
-		.parents = { X1000_CLK_EXCLK, -1, -1, -1 },
+		.parents = { X1000_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR, 20 },
 	},
 
 	[X1000_CLK_PDMA] = {
 		"pdma", CGU_CLK_GATE,
-		.parents = { X1000_CLK_EXCLK, -1, -1, -1 },
+		.parents = { X1000_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR, 21 },
 	},
 
diff --git a/drivers/clk/ingenic/x1830-cgu.c b/drivers/clk/ingenic/x1830-cgu.c
index cfb0314..9f463fe 100644
--- a/drivers/clk/ingenic/x1830-cgu.c
+++ b/drivers/clk/ingenic/x1830-cgu.c
@@ -15,42 +15,42 @@
 #include "pm.h"
 
 /* CGU register offsets */
-#define CGU_REG_CPCCR		0x00
-#define CGU_REG_CPPCR		0x0c
-#define CGU_REG_APLL		0x10
-#define CGU_REG_MPLL		0x14
-#define CGU_REG_CLKGR0		0x20
-#define CGU_REG_OPCR		0x24
-#define CGU_REG_CLKGR1		0x28
-#define CGU_REG_DDRCDR		0x2c
-#define CGU_REG_USBPCR		0x3c
-#define CGU_REG_USBRDT		0x40
-#define CGU_REG_USBVBFIL	0x44
-#define CGU_REG_USBPCR1		0x48
-#define CGU_REG_MACCDR		0x54
-#define CGU_REG_EPLL		0x58
-#define CGU_REG_I2SCDR		0x60
-#define CGU_REG_LPCDR		0x64
-#define CGU_REG_MSC0CDR		0x68
-#define CGU_REG_I2SCDR1		0x70
-#define CGU_REG_SSICDR		0x74
-#define CGU_REG_CIMCDR		0x7c
-#define CGU_REG_MSC1CDR		0xa4
-#define CGU_REG_CMP_INTR	0xb0
-#define CGU_REG_CMP_INTRE	0xb4
-#define CGU_REG_DRCG		0xd0
-#define CGU_REG_CPCSR		0xd4
-#define CGU_REG_VPLL		0xe0
-#define CGU_REG_MACPHYC		0xe8
+#define CGU_REG_CPCCR			0x00
+#define CGU_REG_CPPCR			0x0c
+#define CGU_REG_APLL			0x10
+#define CGU_REG_MPLL			0x14
+#define CGU_REG_CLKGR0			0x20
+#define CGU_REG_OPCR			0x24
+#define CGU_REG_CLKGR1			0x28
+#define CGU_REG_DDRCDR			0x2c
+#define CGU_REG_USBPCR			0x3c
+#define CGU_REG_USBRDT			0x40
+#define CGU_REG_USBVBFIL		0x44
+#define CGU_REG_USBPCR1			0x48
+#define CGU_REG_MACCDR			0x54
+#define CGU_REG_EPLL			0x58
+#define CGU_REG_I2SCDR			0x60
+#define CGU_REG_LPCDR			0x64
+#define CGU_REG_MSC0CDR			0x68
+#define CGU_REG_I2SCDR1			0x70
+#define CGU_REG_SSICDR			0x74
+#define CGU_REG_CIMCDR			0x7c
+#define CGU_REG_MSC1CDR			0xa4
+#define CGU_REG_CMP_INTR		0xb0
+#define CGU_REG_CMP_INTRE		0xb4
+#define CGU_REG_DRCG			0xd0
+#define CGU_REG_CPCSR			0xd4
+#define CGU_REG_VPLL			0xe0
+#define CGU_REG_MACPHYC			0xe8
 
 /* bits within the OPCR register */
-#define OPCR_GATE_USBPHYCLK	BIT(23)
-#define OPCR_SPENDN0		BIT(7)
-#define OPCR_SPENDN1		BIT(6)
+#define OPCR_GATE_USBPHYCLK		BIT(23)
+#define OPCR_SPENDN0			BIT(7)
+#define OPCR_SPENDN1			BIT(6)
 
 /* bits within the USBPCR register */
-#define USBPCR_SIDDQ		BIT(21)
-#define USBPCR_OTG_DISABLE	BIT(20)
+#define USBPCR_SIDDQ			BIT(21)
+#define USBPCR_OTG_DISABLE		BIT(20)
 
 static struct ingenic_cgu *cgu;
 
@@ -295,14 +295,14 @@ static const struct ingenic_cgu_clk_info x1830_cgu_clocks[] = {
 
 	[X1830_CLK_CPU] = {
 		"cpu", CGU_CLK_DIV | CGU_CLK_GATE,
-		.parents = { X1830_CLK_CPUMUX, -1, -1, -1 },
+		.parents = { X1830_CLK_CPUMUX },
 		.div = { CGU_REG_CPCCR, 0, 1, 4, 22, -1, -1 },
 		.gate = { CGU_REG_CLKGR1, 15 },
 	},
 
 	[X1830_CLK_L2CACHE] = {
 		"l2cache", CGU_CLK_DIV,
-		.parents = { X1830_CLK_CPUMUX, -1, -1, -1 },
+		.parents = { X1830_CLK_CPUMUX },
 		.div = { CGU_REG_CPCCR, 4, 1, 4, 22, -1, -1 },
 	},
 
@@ -321,13 +321,13 @@ static const struct ingenic_cgu_clk_info x1830_cgu_clocks[] = {
 
 	[X1830_CLK_AHB2] = {
 		"ahb2", CGU_CLK_DIV,
-		.parents = { X1830_CLK_AHB2PMUX, -1, -1, -1 },
+		.parents = { X1830_CLK_AHB2PMUX },
 		.div = { CGU_REG_CPCCR, 12, 1, 4, 20, -1, -1 },
 	},
 
 	[X1830_CLK_PCLK] = {
 		"pclk", CGU_CLK_DIV | CGU_CLK_GATE,
-		.parents = { X1830_CLK_AHB2PMUX, -1, -1, -1 },
+		.parents = { X1830_CLK_AHB2PMUX },
 		.div = { CGU_REG_CPCCR, 16, 1, 4, 20, -1, -1 },
 		.gate = { CGU_REG_CLKGR1, 14 },
 	},
@@ -366,14 +366,14 @@ static const struct ingenic_cgu_clk_info x1830_cgu_clocks[] = {
 
 	[X1830_CLK_MSC0] = {
 		"msc0", CGU_CLK_DIV | CGU_CLK_GATE,
-		.parents = { X1830_CLK_MSCMUX, -1, -1, -1 },
+		.parents = { X1830_CLK_MSCMUX },
 		.div = { CGU_REG_MSC0CDR, 0, 2, 8, 29, 28, 27 },
 		.gate = { CGU_REG_CLKGR0, 4 },
 	},
 
 	[X1830_CLK_MSC1] = {
 		"msc1", CGU_CLK_DIV | CGU_CLK_GATE,
-		.parents = { X1830_CLK_MSCMUX, -1, -1, -1 },
+		.parents = { X1830_CLK_MSCMUX },
 		.div = { CGU_REG_MSC1CDR, 0, 2, 8, 29, 28, 27 },
 		.gate = { CGU_REG_CLKGR0, 5 },
 	},
@@ -394,7 +394,7 @@ static const struct ingenic_cgu_clk_info x1830_cgu_clocks[] = {
 
 	[X1830_CLK_SSIMUX] = {
 		"ssi_mux", CGU_CLK_MUX,
-		.parents = { X1830_CLK_EXCLK, X1830_CLK_SSIPLL_DIV2, -1, -1 },
+		.parents = { X1830_CLK_EXCLK, X1830_CLK_SSIPLL_DIV2 },
 		.mux = { CGU_REG_SSICDR, 29, 1 },
 	},
 
@@ -423,97 +423,97 @@ static const struct ingenic_cgu_clk_info x1830_cgu_clocks[] = {
 
 	[X1830_CLK_EMC] = {
 		"emc", CGU_CLK_GATE,
-		.parents = { X1830_CLK_AHB2, -1, -1, -1 },
+		.parents = { X1830_CLK_AHB2 },
 		.gate = { CGU_REG_CLKGR0, 0 },
 	},
 
 	[X1830_CLK_EFUSE] = {
 		"efuse", CGU_CLK_GATE,
-		.parents = { X1830_CLK_AHB2, -1, -1, -1 },
+		.parents = { X1830_CLK_AHB2 },
 		.gate = { CGU_REG_CLKGR0, 1 },
 	},
 
 	[X1830_CLK_OTG] = {
 		"otg", CGU_CLK_GATE,
-		.parents = { X1830_CLK_EXCLK, -1, -1, -1 },
+		.parents = { X1830_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR0, 3 },
 	},
 
 	[X1830_CLK_SSI0] = {
 		"ssi0", CGU_CLK_GATE,
-		.parents = { X1830_CLK_SSIMUX, -1, -1, -1 },
+		.parents = { X1830_CLK_SSIMUX },
 		.gate = { CGU_REG_CLKGR0, 6 },
 	},
 
 	[X1830_CLK_SMB0] = {
 		"smb0", CGU_CLK_GATE,
-		.parents = { X1830_CLK_PCLK, -1, -1, -1 },
+		.parents = { X1830_CLK_PCLK },
 		.gate = { CGU_REG_CLKGR0, 7 },
 	},
 
 	[X1830_CLK_SMB1] = {
 		"smb1", CGU_CLK_GATE,
-		.parents = { X1830_CLK_PCLK, -1, -1, -1 },
+		.parents = { X1830_CLK_PCLK },
 		.gate = { CGU_REG_CLKGR0, 8 },
 	},
 
 	[X1830_CLK_SMB2] = {
 		"smb2", CGU_CLK_GATE,
-		.parents = { X1830_CLK_PCLK, -1, -1, -1 },
+		.parents = { X1830_CLK_PCLK },
 		.gate = { CGU_REG_CLKGR0, 9 },
 	},
 
 	[X1830_CLK_AIC] = {
 		"aic", CGU_CLK_GATE,
-		.parents = { X1830_CLK_EXCLK, -1, -1, -1 },
+		.parents = { X1830_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR0, 11 },
 	},
 
 	[X1830_CLK_DMIC] = {
 		"dmic", CGU_CLK_GATE,
-		.parents = { X1830_CLK_PCLK, -1, -1, -1 },
+		.parents = { X1830_CLK_PCLK },
 		.gate = { CGU_REG_CLKGR0, 12 },
 	},
 
 	[X1830_CLK_UART0] = {
 		"uart0", CGU_CLK_GATE,
-		.parents = { X1830_CLK_EXCLK, -1, -1, -1 },
+		.parents = { X1830_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR0, 14 },
 	},
 
 	[X1830_CLK_UART1] = {
 		"uart1", CGU_CLK_GATE,
-		.parents = { X1830_CLK_EXCLK, -1, -1, -1 },
+		.parents = { X1830_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR0, 15 },
 	},
 
 	[X1830_CLK_SSI1] = {
 		"ssi1", CGU_CLK_GATE,
-		.parents = { X1830_CLK_SSIMUX, -1, -1, -1 },
+		.parents = { X1830_CLK_SSIMUX },
 		.gate = { CGU_REG_CLKGR0, 19 },
 	},
 
 	[X1830_CLK_SFC] = {
 		"sfc", CGU_CLK_GATE,
-		.parents = { X1830_CLK_SSIPLL, -1, -1, -1 },
+		.parents = { X1830_CLK_SSIPLL },
 		.gate = { CGU_REG_CLKGR0, 20 },
 	},
 
 	[X1830_CLK_PDMA] = {
 		"pdma", CGU_CLK_GATE,
-		.parents = { X1830_CLK_EXCLK, -1, -1, -1 },
+		.parents = { X1830_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR0, 21 },
 	},
 
 	[X1830_CLK_TCU] = {
 		"tcu", CGU_CLK_GATE,
-		.parents = { X1830_CLK_EXCLK, -1, -1, -1 },
+		.parents = { X1830_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR0, 30 },
 	},
 
 	[X1830_CLK_DTRNG] = {
 		"dtrng", CGU_CLK_GATE,
-		.parents = { X1830_CLK_PCLK, -1, -1, -1 },
+		.parents = { X1830_CLK_PCLK },
 		.gate = { CGU_REG_CLKGR1, 1 },
 	},
 
@@ -525,7 +525,7 @@ static const struct ingenic_cgu_clk_info x1830_cgu_clocks[] = {
 
 	[X1830_CLK_OST] = {
 		"ost", CGU_CLK_GATE,
-		.parents = { X1830_CLK_EXCLK, -1, -1, -1 },
+		.parents = { X1830_CLK_EXCLK },
 		.gate = { CGU_REG_CLKGR1, 11 },
 	},
 };
-- 
2.7.4

