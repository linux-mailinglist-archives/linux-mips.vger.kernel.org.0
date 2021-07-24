Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46CE13D46C2
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jul 2021 11:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235126AbhGXIyx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Jul 2021 04:54:53 -0400
Received: from out28-145.mail.aliyun.com ([115.124.28.145]:33431 "EHLO
        out28-145.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235069AbhGXIyw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 24 Jul 2021 04:54:52 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07437014|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0041116-0.000363272-0.995525;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047199;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.KprUvTZ_1627119307;
Received: from zhouyanjie-virtual-machine.localdomain(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KprUvTZ_1627119307)
          by smtp.aliyun-inc.com(10.147.40.233);
          Sat, 24 Jul 2021 17:35:22 +0800
From:   =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        paul@crapouillou.net
Cc:     linux-clk@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com,
        rick.tyliu@ingenic.com, sihui.liu@ingenic.com,
        jun.jiang@ingenic.com, sernia.zhou@foxmail.com
Subject: [PATCH v7 05/11] clk: Ingenic: Add missing clocks for Ingenic SoCs.
Date:   Sat, 24 Jul 2021 17:34:40 +0800
Message-Id: <1627119286-125821-6-git-send-email-zhouyanjie@wanyeetech.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627119286-125821-1-git-send-email-zhouyanjie@wanyeetech.com>
References: <1627119286-125821-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add CIM, AIC, DMIC, I2S clocks for the X1000 SoC and the
X1830 SoC from Ingenic.

Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
---

Notes:
    v1->v2:
    Add I2S clock for X1000.
    
    v2->v3:
    Correct the comment in x1000-cgu.c, change it from
    "Custom (SoC-specific) OTG PHY" to "Custom (SoC-specific)",
    since there is more than just the "OTG PHY" clock.
    
    v3->v4:
    No change.
    
    v4->v5:
    1.Change X1000's I2S clock to CGU_CLK_PLL as Paul Cercueil's suggestion
    2.Add I2S clock for X1830.
    
    v5->v6:
    No change.
    
    v6->v7:
    No change.

 drivers/clk/ingenic/x1000-cgu.c | 88 ++++++++++++++++++++++++++++++++++++++++
 drivers/clk/ingenic/x1830-cgu.c | 90 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 178 insertions(+)

diff --git a/drivers/clk/ingenic/x1000-cgu.c b/drivers/clk/ingenic/x1000-cgu.c
index 53e5fe0..59b16a6 100644
--- a/drivers/clk/ingenic/x1000-cgu.c
+++ b/drivers/clk/ingenic/x1000-cgu.c
@@ -60,6 +60,54 @@
 
 static struct ingenic_cgu *cgu;
 
+static void x1000_i2s_calc_m_n(const struct ingenic_cgu_pll_info *pll_info,
+		       unsigned long rate, unsigned long parent_rate,
+		       unsigned int *pm, unsigned int *pn, unsigned int *pod)
+{
+	unsigned int delta, m, n;
+	u64 curr_delta, curr_m, curr_n;
+
+	if ((parent_rate % rate == 0) && ((parent_rate / rate) > 1)) {
+		m = 1;
+		n = parent_rate / rate;
+		goto out;
+	}
+
+	delta = rate;
+
+	/*
+	 * The length of M is 9 bits, its value must be between 1 and 511.
+	 * The length of N is 13 bits, its value must be between 2 and 8191,
+	 * and must not be less than 2 times of the value of M.
+	 */
+	for (curr_m = 511; curr_m >= 1; curr_m--) {
+		curr_n = parent_rate * curr_m;
+		curr_delta = do_div(curr_n, rate);
+
+		if (curr_n < 2 * curr_m || curr_n > 8191)
+			continue;
+
+		if (curr_delta == 0)
+			break;
+
+		if (curr_delta < delta) {
+			m = curr_m;
+			n = curr_n;
+			delta = curr_delta;
+		}
+	}
+
+out:
+	*pm = m;
+	*pn = n;
+
+	/*
+	 * The I2S PLL does not have OD bits, so set the *pod to 1 to ensure
+	 * that the ingenic_pll_calc() in cgu.c can run properly.
+	 */
+	*pod = 1;
+}
+
 static unsigned long x1000_otg_phy_recalc_rate(struct clk_hw *hw,
 						unsigned long parent_rate)
 {
@@ -227,6 +275,27 @@ static const struct ingenic_cgu_clk_info x1000_cgu_clocks[] = {
 		},
 	},
 
+	[X1000_CLK_I2S] = {
+		"i2s", CGU_CLK_PLL,
+		.parents = { X1000_CLK_EXCLK, X1000_CLK_SCLKA, -1, X1000_CLK_MPLL },
+		.pll = {
+			.reg = CGU_REG_I2SCDR,
+			.rate_multiplier = 1,
+			.mux_shift = 30,
+			.mux_bits = 2,
+			.m_shift = 13,
+			.m_bits = 9,
+			.m_offset = 0,
+			.n_shift = 0,
+			.n_bits = 13,
+			.n_offset = 0,
+			.bypass_bit = -1,
+			.enable_bit = 29,
+			.stable_bit = -1,
+			.calc_m_n_od = x1000_i2s_calc_m_n,
+		},
+	},
+
 	/* Custom (SoC-specific) OTG PHY */
 
 	[X1000_CLK_OTGPHY] = {
@@ -359,6 +428,13 @@ static const struct ingenic_cgu_clk_info x1000_cgu_clocks[] = {
 		.mux = { CGU_REG_SSICDR, 30, 1 },
 	},
 
+	[X1000_CLK_CIM] = {
+		"cim", CGU_CLK_MUX | CGU_CLK_DIV,
+		.parents = { X1000_CLK_SCLKA, X1000_CLK_MPLL, -1, -1 },
+		.mux = { CGU_REG_CIMCDR, 31, 1 },
+		.div = { CGU_REG_CIMCDR, 0, 1, 8, 29, 28, 27 },
+	},
+
 	[X1000_CLK_EXCLK_DIV512] = {
 		"exclk_div512", CGU_CLK_FIXDIV,
 		.parents = { X1000_CLK_EXCLK },
@@ -410,6 +486,12 @@ static const struct ingenic_cgu_clk_info x1000_cgu_clocks[] = {
 		.gate = { CGU_REG_CLKGR, 9 },
 	},
 
+	[X1000_CLK_AIC] = {
+		"aic", CGU_CLK_GATE,
+		.parents = { X1000_CLK_EXCLK, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR, 11 },
+	},
+
 	[X1000_CLK_UART0] = {
 		"uart0", CGU_CLK_GATE,
 		.parents = { X1000_CLK_EXCLK, -1, -1, -1 },
@@ -428,6 +510,12 @@ static const struct ingenic_cgu_clk_info x1000_cgu_clocks[] = {
 		.gate = { CGU_REG_CLKGR, 16 },
 	},
 
+	[X1000_CLK_DMIC] = {
+		"dmic", CGU_CLK_GATE,
+		.parents = { X1000_CLK_PCLK, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR, 17 },
+	},
+
 	[X1000_CLK_TCU] = {
 		"tcu", CGU_CLK_GATE,
 		.parents = { X1000_CLK_EXCLK, -1, -1, -1 },
diff --git a/drivers/clk/ingenic/x1830-cgu.c b/drivers/clk/ingenic/x1830-cgu.c
index 59342bc..cfb0314 100644
--- a/drivers/clk/ingenic/x1830-cgu.c
+++ b/drivers/clk/ingenic/x1830-cgu.c
@@ -54,6 +54,54 @@
 
 static struct ingenic_cgu *cgu;
 
+static void x1830_i2s_calc_m_n(const struct ingenic_cgu_pll_info *pll_info,
+		       unsigned long rate, unsigned long parent_rate,
+		       unsigned int *pm, unsigned int *pn, unsigned int *pod)
+{
+	unsigned int delta, m, n;
+	u64 curr_delta, curr_m, curr_n;
+
+	if ((parent_rate % rate == 0) && ((parent_rate / rate) > 1)) {
+		m = 1;
+		n = parent_rate / rate;
+		goto out;
+	}
+
+	delta = rate;
+
+	/*
+	 * The length of M is 9 bits, its value must be between 1 and 511.
+	 * The length of N is 20 bits, its value must be between 2 and 1048575,
+	 * and must not be less than 2 times of the value of M.
+	 */
+	for (curr_m = 511; curr_m >= 1; curr_m--) {
+		curr_n = parent_rate * curr_m;
+		curr_delta = do_div(curr_n, rate);
+
+		if (curr_n < 2 * curr_m || curr_n > 1048575)
+			continue;
+
+		if (curr_delta == 0)
+			break;
+
+		if (curr_delta < delta) {
+			m = curr_m;
+			n = curr_n;
+			delta = curr_delta;
+		}
+	}
+
+out:
+	*pm = m;
+	*pn = n;
+
+	/*
+	 * The I2S PLL does not have OD bits, so set the *pod to 1 to ensure
+	 * that the ingenic_pll_calc() in cgu.c can run properly.
+	 */
+	*pod = 1;
+}
+
 static int x1830_usb_phy_enable(struct clk_hw *hw)
 {
 	void __iomem *reg_opcr		= cgu->base + CGU_REG_OPCR;
@@ -201,6 +249,28 @@ static const struct ingenic_cgu_clk_info x1830_cgu_clocks[] = {
 		},
 	},
 
+	[X1830_CLK_I2S] = {
+		"i2s", CGU_CLK_PLL,
+		.parents = { X1830_CLK_SCLKA, X1830_CLK_MPLL,
+					 X1830_CLK_VPLL, X1830_CLK_EPLL },
+		.pll = {
+			.reg = CGU_REG_I2SCDR,
+			.rate_multiplier = 1,
+			.mux_shift = 30,
+			.mux_bits = 2,
+			.m_shift = 20,
+			.m_bits = 9,
+			.m_offset = 0,
+			.n_shift = 0,
+			.n_bits = 20,
+			.n_offset = 0,
+			.bypass_bit = -1,
+			.enable_bit = 29,
+			.stable_bit = -1,
+			.calc_m_n_od = x1830_i2s_calc_m_n,
+		},
+	},
+
 	/* Custom (SoC-specific) OTG PHY */
 
 	[X1830_CLK_OTGPHY] = {
@@ -328,6 +398,14 @@ static const struct ingenic_cgu_clk_info x1830_cgu_clocks[] = {
 		.mux = { CGU_REG_SSICDR, 29, 1 },
 	},
 
+	[X1830_CLK_CIM] = {
+		"cim", CGU_CLK_MUX | CGU_CLK_DIV,
+		.parents = { X1830_CLK_SCLKA, X1830_CLK_MPLL,
+					 X1830_CLK_VPLL, X1830_CLK_EPLL },
+		.mux = { CGU_REG_CIMCDR, 30, 2 },
+		.div = { CGU_REG_CIMCDR, 0, 1, 8, 29, 28, 27 },
+	},
+
 	[X1830_CLK_EXCLK_DIV512] = {
 		"exclk_div512", CGU_CLK_FIXDIV,
 		.parents = { X1830_CLK_EXCLK },
@@ -385,6 +463,18 @@ static const struct ingenic_cgu_clk_info x1830_cgu_clocks[] = {
 		.gate = { CGU_REG_CLKGR0, 9 },
 	},
 
+	[X1830_CLK_AIC] = {
+		"aic", CGU_CLK_GATE,
+		.parents = { X1830_CLK_EXCLK, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR0, 11 },
+	},
+
+	[X1830_CLK_DMIC] = {
+		"dmic", CGU_CLK_GATE,
+		.parents = { X1830_CLK_PCLK, -1, -1, -1 },
+		.gate = { CGU_REG_CLKGR0, 12 },
+	},
+
 	[X1830_CLK_UART0] = {
 		"uart0", CGU_CLK_GATE,
 		.parents = { X1830_CLK_EXCLK, -1, -1, -1 },
-- 
2.7.4

