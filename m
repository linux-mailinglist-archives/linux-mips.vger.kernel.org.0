Return-Path: <linux-mips+bounces-3363-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F119F8D2520
	for <lists+linux-mips@lfdr.de>; Tue, 28 May 2024 21:50:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A87E0284073
	for <lists+linux-mips@lfdr.de>; Tue, 28 May 2024 19:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03E7C179203;
	Tue, 28 May 2024 19:50:05 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from fgw22-7.mail.saunalahti.fi (fgw22-7.mail.saunalahti.fi [62.142.5.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B30179663
	for <linux-mips@vger.kernel.org>; Tue, 28 May 2024 19:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716925804; cv=none; b=ROVi2hDZdbz+spRqOgwZ5Brq4LmBkLz63/9DMSKBc/E7v9uZQ5ObnpAFgyHirDt3vkxOTbMkGaCSPL7Y1Lz73ayW3vhvgHVl/Agcd2f+57SoOVhymYTODqlHEh4e1xihtc3r+/Z2W80azsnzP79SnlScXC/MsUPMKQEfv1yvGgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716925804; c=relaxed/simple;
	bh=t+ehcVfGahZGEav7XkU387Fhpuej8V/hFbTNTqiJBkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CuyVdGDXdTmY1frrspl3Wy0GGD1pDZ/0KG/5LLu5hSDst3+q11RXtlOh0aYWHXGe5U28mzLVXDJdXGF1XfsX1QNMK+7neLcwPgdS8iwh/+qlNffvuSC77aNv7T9jidUeTIyT08sBlu//5uPME1VPdCEVSQz7ySVSegW2NQ1u1uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id 777b4686-1d2b-11ef-8e2b-005056bdf889;
	Tue, 28 May 2024 22:50:00 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Daniel Golle <daniel@makrotopia.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2 04/11] pinctrl: mediatek: Provide a helper macro PINCTRL_PIN_FUNCTION()
Date: Tue, 28 May 2024 22:44:55 +0300
Message-ID: <20240528194951.1489887-5-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240528194951.1489887-1-andy.shevchenko@gmail.com>
References: <20240528194951.1489887-1-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide a helper macro to assign the struct function_desc entries.
This helps further refactoring.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-moore.h  |  8 +++++
 drivers/pinctrl/mediatek/pinctrl-mt7622.c | 32 ++++++++---------
 drivers/pinctrl/mediatek/pinctrl-mt7623.c | 42 +++++++++++------------
 drivers/pinctrl/mediatek/pinctrl-mt7629.c | 20 +++++------
 drivers/pinctrl/mediatek/pinctrl-mt7981.c | 34 +++++++++---------
 drivers/pinctrl/mediatek/pinctrl-mt7986.c | 24 ++++++-------
 6 files changed, 84 insertions(+), 76 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.h b/drivers/pinctrl/mediatek/pinctrl-moore.h
index e0313e7a1fe0..5945e4fe021f 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.h
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.h
@@ -43,6 +43,14 @@
 		.data = id##_funcs,							\
 	}
 
+#define PINCTRL_PIN_FUNCTION(_name_, id)							\
+	{											\
+		.name = _name_,									\
+		.group_names = id##_groups,							\
+		.num_group_names = ARRAY_SIZE(id##_groups),					\
+		.data = NULL,									\
+	}
+
 int mtk_moore_pinctrl_probe(struct platform_device *pdev,
 			    const struct mtk_pin_soc *soc);
 
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7622.c b/drivers/pinctrl/mediatek/pinctrl-mt7622.c
index 3c1148d59eff..2dc101991066 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7622.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7622.c
@@ -823,22 +823,22 @@ static const char *mt7622_uart_groups[] = { "uart0_0_tx_rx",
 static const char *mt7622_wdt_groups[] = { "watchdog", };
 
 static const struct function_desc mt7622_functions[] = {
-	{"antsel", mt7622_antsel_groups, ARRAY_SIZE(mt7622_antsel_groups)},
-	{"emmc", mt7622_emmc_groups, ARRAY_SIZE(mt7622_emmc_groups)},
-	{"eth",	mt7622_ethernet_groups, ARRAY_SIZE(mt7622_ethernet_groups)},
-	{"i2c", mt7622_i2c_groups, ARRAY_SIZE(mt7622_i2c_groups)},
-	{"i2s",	mt7622_i2s_groups, ARRAY_SIZE(mt7622_i2s_groups)},
-	{"ir", mt7622_ir_groups, ARRAY_SIZE(mt7622_ir_groups)},
-	{"led",	mt7622_led_groups, ARRAY_SIZE(mt7622_led_groups)},
-	{"flash", mt7622_flash_groups, ARRAY_SIZE(mt7622_flash_groups)},
-	{"pcie", mt7622_pcie_groups, ARRAY_SIZE(mt7622_pcie_groups)},
-	{"pmic", mt7622_pmic_bus_groups, ARRAY_SIZE(mt7622_pmic_bus_groups)},
-	{"pwm",	mt7622_pwm_groups, ARRAY_SIZE(mt7622_pwm_groups)},
-	{"sd", mt7622_sd_groups, ARRAY_SIZE(mt7622_sd_groups)},
-	{"spi",	mt7622_spic_groups, ARRAY_SIZE(mt7622_spic_groups)},
-	{"tdm",	mt7622_tdm_groups, ARRAY_SIZE(mt7622_tdm_groups)},
-	{"uart", mt7622_uart_groups, ARRAY_SIZE(mt7622_uart_groups)},
-	{"watchdog", mt7622_wdt_groups, ARRAY_SIZE(mt7622_wdt_groups)},
+	PINCTRL_PIN_FUNCTION("antsel", mt7622_antsel),
+	PINCTRL_PIN_FUNCTION("emmc", mt7622_emmc),
+	PINCTRL_PIN_FUNCTION("eth", mt7622_ethernet),
+	PINCTRL_PIN_FUNCTION("i2c", mt7622_i2c),
+	PINCTRL_PIN_FUNCTION("i2s", mt7622_i2s),
+	PINCTRL_PIN_FUNCTION("ir", mt7622_ir),
+	PINCTRL_PIN_FUNCTION("led", mt7622_led),
+	PINCTRL_PIN_FUNCTION("flash", mt7622_flash),
+	PINCTRL_PIN_FUNCTION("pcie", mt7622_pcie),
+	PINCTRL_PIN_FUNCTION("pmic", mt7622_pmic_bus),
+	PINCTRL_PIN_FUNCTION("pwm", mt7622_pwm),
+	PINCTRL_PIN_FUNCTION("sd", mt7622_sd),
+	PINCTRL_PIN_FUNCTION("spi", mt7622_spic),
+	PINCTRL_PIN_FUNCTION("tdm", mt7622_tdm),
+	PINCTRL_PIN_FUNCTION("uart", mt7622_uart),
+	PINCTRL_PIN_FUNCTION("watchdog", mt7622_wdt),
 };
 
 static const struct mtk_eint_hw mt7622_eint_hw = {
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7623.c b/drivers/pinctrl/mediatek/pinctrl-mt7623.c
index 699977074697..3e59eada2825 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7623.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7623.c
@@ -1341,27 +1341,27 @@ static const char *mt7623_uart_groups[] = { "uart0_0_txd_rxd",
 static const char *mt7623_wdt_groups[] = { "watchdog_0", "watchdog_1", };
 
 static const struct function_desc mt7623_functions[] = {
-	{"audck", mt7623_aud_clk_groups, ARRAY_SIZE(mt7623_aud_clk_groups)},
-	{"disp", mt7623_disp_pwm_groups, ARRAY_SIZE(mt7623_disp_pwm_groups)},
-	{"eth",	mt7623_ethernet_groups, ARRAY_SIZE(mt7623_ethernet_groups)},
-	{"sdio", mt7623_ext_sdio_groups, ARRAY_SIZE(mt7623_ext_sdio_groups)},
-	{"hdmi", mt7623_hdmi_groups, ARRAY_SIZE(mt7623_hdmi_groups)},
-	{"i2c", mt7623_i2c_groups, ARRAY_SIZE(mt7623_i2c_groups)},
-	{"i2s",	mt7623_i2s_groups, ARRAY_SIZE(mt7623_i2s_groups)},
-	{"ir",	mt7623_ir_groups, ARRAY_SIZE(mt7623_ir_groups)},
-	{"lcd", mt7623_lcd_groups, ARRAY_SIZE(mt7623_lcd_groups)},
-	{"msdc", mt7623_msdc_groups, ARRAY_SIZE(mt7623_msdc_groups)},
-	{"nand", mt7623_nandc_groups, ARRAY_SIZE(mt7623_nandc_groups)},
-	{"otg", mt7623_otg_groups, ARRAY_SIZE(mt7623_otg_groups)},
-	{"pcie", mt7623_pcie_groups, ARRAY_SIZE(mt7623_pcie_groups)},
-	{"pcm",	mt7623_pcm_groups, ARRAY_SIZE(mt7623_pcm_groups)},
-	{"pwm",	mt7623_pwm_groups, ARRAY_SIZE(mt7623_pwm_groups)},
-	{"pwrap", mt7623_pwrap_groups, ARRAY_SIZE(mt7623_pwrap_groups)},
-	{"rtc", mt7623_rtc_groups, ARRAY_SIZE(mt7623_rtc_groups)},
-	{"spi",	mt7623_spi_groups, ARRAY_SIZE(mt7623_spi_groups)},
-	{"spdif", mt7623_spdif_groups, ARRAY_SIZE(mt7623_spdif_groups)},
-	{"uart", mt7623_uart_groups, ARRAY_SIZE(mt7623_uart_groups)},
-	{"watchdog", mt7623_wdt_groups, ARRAY_SIZE(mt7623_wdt_groups)},
+	PINCTRL_PIN_FUNCTION("audck", mt7623_aud_clk),
+	PINCTRL_PIN_FUNCTION("disp", mt7623_disp_pwm),
+	PINCTRL_PIN_FUNCTION("eth", mt7623_ethernet),
+	PINCTRL_PIN_FUNCTION("sdio", mt7623_ext_sdio),
+	PINCTRL_PIN_FUNCTION("hdmi", mt7623_hdmi),
+	PINCTRL_PIN_FUNCTION("i2c", mt7623_i2c),
+	PINCTRL_PIN_FUNCTION("i2s", mt7623_i2s),
+	PINCTRL_PIN_FUNCTION("ir", mt7623_ir),
+	PINCTRL_PIN_FUNCTION("lcd", mt7623_lcd),
+	PINCTRL_PIN_FUNCTION("msdc", mt7623_msdc),
+	PINCTRL_PIN_FUNCTION("nand", mt7623_nandc),
+	PINCTRL_PIN_FUNCTION("otg", mt7623_otg),
+	PINCTRL_PIN_FUNCTION("pcie", mt7623_pcie),
+	PINCTRL_PIN_FUNCTION("pcm", mt7623_pcm),
+	PINCTRL_PIN_FUNCTION("pwm", mt7623_pwm),
+	PINCTRL_PIN_FUNCTION("pwrap", mt7623_pwrap),
+	PINCTRL_PIN_FUNCTION("rtc", mt7623_rtc),
+	PINCTRL_PIN_FUNCTION("spi", mt7623_spi),
+	PINCTRL_PIN_FUNCTION("spdif", mt7623_spdif),
+	PINCTRL_PIN_FUNCTION("uart", mt7623_uart),
+	PINCTRL_PIN_FUNCTION("watchdog", mt7623_wdt),
 };
 
 static const struct mtk_eint_hw mt7623_eint_hw = {
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7629.c b/drivers/pinctrl/mediatek/pinctrl-mt7629.c
index 2ce411cb9c6e..98142e8c9801 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7629.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7629.c
@@ -385,16 +385,16 @@ static const char *mt7629_wifi_groups[] = { "wf0_5g", "wf0_2g", };
 static const char *mt7629_flash_groups[] = { "snfi", "spi_nor" };
 
 static const struct function_desc mt7629_functions[] = {
-	{"eth",	mt7629_ethernet_groups, ARRAY_SIZE(mt7629_ethernet_groups)},
-	{"i2c", mt7629_i2c_groups, ARRAY_SIZE(mt7629_i2c_groups)},
-	{"led",	mt7629_led_groups, ARRAY_SIZE(mt7629_led_groups)},
-	{"pcie", mt7629_pcie_groups, ARRAY_SIZE(mt7629_pcie_groups)},
-	{"pwm",	mt7629_pwm_groups, ARRAY_SIZE(mt7629_pwm_groups)},
-	{"spi",	mt7629_spi_groups, ARRAY_SIZE(mt7629_spi_groups)},
-	{"uart", mt7629_uart_groups, ARRAY_SIZE(mt7629_uart_groups)},
-	{"watchdog", mt7629_wdt_groups, ARRAY_SIZE(mt7629_wdt_groups)},
-	{"wifi", mt7629_wifi_groups, ARRAY_SIZE(mt7629_wifi_groups)},
-	{"flash", mt7629_flash_groups, ARRAY_SIZE(mt7629_flash_groups)},
+	PINCTRL_PIN_FUNCTION("eth", mt7629_ethernet),
+	PINCTRL_PIN_FUNCTION("i2c", mt7629_i2c),
+	PINCTRL_PIN_FUNCTION("led", mt7629_led),
+	PINCTRL_PIN_FUNCTION("pcie", mt7629_pcie),
+	PINCTRL_PIN_FUNCTION("pwm", mt7629_pwm),
+	PINCTRL_PIN_FUNCTION("spi", mt7629_spi),
+	PINCTRL_PIN_FUNCTION("uart", mt7629_uart),
+	PINCTRL_PIN_FUNCTION("watchdog", mt7629_wdt),
+	PINCTRL_PIN_FUNCTION("wifi", mt7629_wifi),
+	PINCTRL_PIN_FUNCTION("flash", mt7629_flash),
 };
 
 static const struct mtk_eint_hw mt7629_eint_hw = {
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7981.c b/drivers/pinctrl/mediatek/pinctrl-mt7981.c
index ef6123765885..83092be5b614 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7981.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7981.c
@@ -978,23 +978,23 @@ static const char *mt7981_ethernet_groups[] = { "smi_mdc_mdio", "gbe_ext_mdc_mdi
 static const char *mt7981_ant_groups[] = { "ant_sel", };
 
 static const struct function_desc mt7981_functions[] = {
-	{"wa_aice",	mt7981_wa_aice_groups, ARRAY_SIZE(mt7981_wa_aice_groups)},
-	{"dfd",	mt7981_dfd_groups, ARRAY_SIZE(mt7981_dfd_groups)},
-	{"jtag", mt7981_jtag_groups, ARRAY_SIZE(mt7981_jtag_groups)},
-	{"pta", mt7981_pta_groups, ARRAY_SIZE(mt7981_pta_groups)},
-	{"pcm", mt7981_pcm_groups, ARRAY_SIZE(mt7981_pcm_groups)},
-	{"udi", mt7981_udi_groups, ARRAY_SIZE(mt7981_udi_groups)},
-	{"usb", mt7981_usb_groups, ARRAY_SIZE(mt7981_usb_groups)},
-	{"ant", mt7981_ant_groups, ARRAY_SIZE(mt7981_ant_groups)},
-	{"eth",	mt7981_ethernet_groups, ARRAY_SIZE(mt7981_ethernet_groups)},
-	{"i2c", mt7981_i2c_groups, ARRAY_SIZE(mt7981_i2c_groups)},
-	{"led",	mt7981_led_groups, ARRAY_SIZE(mt7981_led_groups)},
-	{"pwm",	mt7981_pwm_groups, ARRAY_SIZE(mt7981_pwm_groups)},
-	{"spi",	mt7981_spi_groups, ARRAY_SIZE(mt7981_spi_groups)},
-	{"uart", mt7981_uart_groups, ARRAY_SIZE(mt7981_uart_groups)},
-	{"watchdog", mt7981_wdt_groups, ARRAY_SIZE(mt7981_wdt_groups)},
-	{"flash", mt7981_flash_groups, ARRAY_SIZE(mt7981_flash_groups)},
-	{"pcie", mt7981_pcie_groups, ARRAY_SIZE(mt7981_pcie_groups)},
+	PINCTRL_PIN_FUNCTION("wa_aice", mt7981_wa_aice),
+	PINCTRL_PIN_FUNCTION("dfd", mt7981_dfd),
+	PINCTRL_PIN_FUNCTION("jtag", mt7981_jtag),
+	PINCTRL_PIN_FUNCTION("pta", mt7981_pta),
+	PINCTRL_PIN_FUNCTION("pcm", mt7981_pcm),
+	PINCTRL_PIN_FUNCTION("udi", mt7981_udi),
+	PINCTRL_PIN_FUNCTION("usb", mt7981_usb),
+	PINCTRL_PIN_FUNCTION("ant", mt7981_ant),
+	PINCTRL_PIN_FUNCTION("eth", mt7981_ethernet),
+	PINCTRL_PIN_FUNCTION("i2c", mt7981_i2c),
+	PINCTRL_PIN_FUNCTION("led", mt7981_led),
+	PINCTRL_PIN_FUNCTION("pwm", mt7981_pwm),
+	PINCTRL_PIN_FUNCTION("spi", mt7981_spi),
+	PINCTRL_PIN_FUNCTION("uart", mt7981_uart),
+	PINCTRL_PIN_FUNCTION("watchdog", mt7981_wdt),
+	PINCTRL_PIN_FUNCTION("flash", mt7981_flash),
+	PINCTRL_PIN_FUNCTION("pcie", mt7981_pcie),
 };
 
 static const struct mtk_eint_hw mt7981_eint_hw = {
diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7986.c b/drivers/pinctrl/mediatek/pinctrl-mt7986.c
index 39e80fa644c1..5816b5fdb7ca 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7986.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7986.c
@@ -879,18 +879,18 @@ static const char *mt7986_wdt_groups[] = { "watchdog", };
 static const char *mt7986_wf_groups[] = { "wf_2g", "wf_5g", "wf_dbdc", };
 
 static const struct function_desc mt7986_functions[] = {
-	{"audio", mt7986_audio_groups, ARRAY_SIZE(mt7986_audio_groups)},
-	{"emmc", mt7986_emmc_groups, ARRAY_SIZE(mt7986_emmc_groups)},
-	{"eth", mt7986_ethernet_groups, ARRAY_SIZE(mt7986_ethernet_groups)},
-	{"i2c", mt7986_i2c_groups, ARRAY_SIZE(mt7986_i2c_groups)},
-	{"led", mt7986_led_groups, ARRAY_SIZE(mt7986_led_groups)},
-	{"flash", mt7986_flash_groups, ARRAY_SIZE(mt7986_flash_groups)},
-	{"pcie", mt7986_pcie_groups, ARRAY_SIZE(mt7986_pcie_groups)},
-	{"pwm", mt7986_pwm_groups, ARRAY_SIZE(mt7986_pwm_groups)},
-	{"spi", mt7986_spi_groups, ARRAY_SIZE(mt7986_spi_groups)},
-	{"uart", mt7986_uart_groups, ARRAY_SIZE(mt7986_uart_groups)},
-	{"watchdog", mt7986_wdt_groups, ARRAY_SIZE(mt7986_wdt_groups)},
-	{"wifi", mt7986_wf_groups, ARRAY_SIZE(mt7986_wf_groups)},
+	PINCTRL_PIN_FUNCTION("audio", mt7986_audio),
+	PINCTRL_PIN_FUNCTION("emmc", mt7986_emmc),
+	PINCTRL_PIN_FUNCTION("eth", mt7986_ethernet),
+	PINCTRL_PIN_FUNCTION("i2c", mt7986_i2c),
+	PINCTRL_PIN_FUNCTION("led", mt7986_led),
+	PINCTRL_PIN_FUNCTION("flash", mt7986_flash),
+	PINCTRL_PIN_FUNCTION("pcie", mt7986_pcie),
+	PINCTRL_PIN_FUNCTION("pwm", mt7986_pwm),
+	PINCTRL_PIN_FUNCTION("spi", mt7986_spi),
+	PINCTRL_PIN_FUNCTION("uart", mt7986_uart),
+	PINCTRL_PIN_FUNCTION("watchdog", mt7986_wdt),
+	PINCTRL_PIN_FUNCTION("wifi", mt7986_wf),
 };
 
 static const struct mtk_eint_hw mt7986a_eint_hw = {
-- 
2.45.1


