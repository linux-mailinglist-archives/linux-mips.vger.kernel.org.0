Return-Path: <linux-mips+bounces-13586-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UO7WK+/osmljQwAAu9opvQ
	(envelope-from <linux-mips+bounces-13586-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 17:25:19 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 672E12758C7
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 17:25:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DD9DD3029766
	for <lists+linux-mips@lfdr.de>; Thu, 12 Mar 2026 16:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 616783F7E72;
	Thu, 12 Mar 2026 16:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="MGMIhj8W"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3503F7AA3;
	Thu, 12 Mar 2026 16:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773332703; cv=none; b=m3EsW97NM+GZ82C4B1hp73GFEK4iK5iyw+NdU8GPWKED5zc/hnOZQzEfRsvtA/EEC4IK9dmutQF4uJPcYBIyRIovv+EoOvvp3NaRrcgyq5TTEYHy+ppoSSWb37friI5MI7ywTFrKWlUUmx0nCcCy/SwR+SeAdLeMH8h4QU+7flE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773332703; c=relaxed/simple;
	bh=xuzbQyAwqIvUp7NscSWc93J4tTW3A8u2qAL+dSf9IdQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g1w9fJoR0pk2/tU3v5qkaXle/kUjHUE8K/qw6oEqJ1GKmC6xqj9elGqlwXUwxEycxuaWXBJ88nUAFjgDED85zj7XwOrJeEr1fOr5xQLZUG7ggcsp37ZFb1xLC2I0UReF0SPPVahF8ZvmieZwNGCTiVonha1MngWDFHygHCRwqkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=MGMIhj8W; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9F7362C6047;
	Thu, 12 Mar 2026 17:24:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1773332699; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=uqXg1qFFJwjUGiZWh/9+2YxQUK5LQWX64utFZmNsNY8=;
	b=MGMIhj8WdNgb5OVrI3LCDo+NnNTVY+DbcT74kUdW53FtjOSkB2Mp6wO24SHu/rgMtMm1XU
	QXlWLeQUBuIZxmC62cYp2LP3h4CuG8Nz4xOHmiJID4iFvbP1PBep/3ZNN57uIqYkVfdOJW
	ILBvfxkeMwSr7vtCbRG7HzMJbtHM1FrZVZ/WcZrdpBxDImQWbUyGWYRU394zASVUzwrbll
	6V9v3zafzqcFx0B9ZyfQ+7VqW+rjo3FswRe520p9B97wFO9feqkKIhgur03DGD2GdgrbxR
	WxUK80CJ2ZwSha4AeS5k8qunvHYxn0WL4oSk+oYi9lzUb82O+Ht1AnXGGubUdA==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-clk@vger.kernel.org
Cc: linux-mips@vger.kernel.org,
	naseefkm@gmail.com,
	bmasney@redhat.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	p.zabel@pengutronix.de,
	nbd@nbd.name,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH 2/2] clk: airoha: Add econet EN751221 clock/reset support to en7523-scu
Date: Thu, 12 Mar 2026 16:24:49 +0000
Message-Id: <20260312162449.569359-3-cjd@cjdns.fr>
In-Reply-To: <20260312162449.569359-1-cjd@cjdns.fr>
References: <20260312162449.569359-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-13586-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,redhat.com,baylibre.com,kernel.org,pengutronix.de,nbd.name,cjdns.fr];
	DKIM_TRACE(0.00)[cjdns.fr:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cjd@cjdns.fr,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 672E12758C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

EcoNet EN751221 clock/reset driver is significantly similar to the
EN7523 / EN7581, however the EN751221 does not have a neat batch of clock
divider registers so there are fewer known clocks, and the frequency of
each clock is derived differently. This clock driver will probably work
correctly on EN751627, EN7528, and EN7580.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/clk/Kconfig      |   6 +-
 drivers/clk/clk-en7523.c | 223 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 221 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 3d803b4cf5c1..47df6073a72b 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -218,13 +218,13 @@ config COMMON_CLK_CS2000_CP
 	  If you say yes here you get support for the CS2000 clock multiplier.
 
 config COMMON_CLK_EN7523
-	bool "Clock driver for Airoha EN7523 SoC system clocks"
+	bool "Clock driver for Airoha/EcoNet SoC system clocks"
 	depends on OF
-	depends on ARCH_AIROHA || COMPILE_TEST
+	depends on ARCH_AIROHA || ECONET || COMPILE_TEST
 	default ARCH_AIROHA
 	help
 	  This driver provides the fixed clocks and gates present on Airoha
-	  ARM silicon.
+	  and EcoNet silicon.
 
 config COMMON_CLK_EP93XX
 	tristate "Clock driver for Cirrus Logic ep93xx SoC"
diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 08cc8e5acf43..1ab0e2eca5d3 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
+#include <linux/bitfield.h>
 #include <linux/delay.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
@@ -11,6 +12,8 @@
 #include <dt-bindings/clock/en7523-clk.h>
 #include <dt-bindings/reset/airoha,en7523-reset.h>
 #include <dt-bindings/reset/airoha,en7581-reset.h>
+#include <dt-bindings/clock/econet,en751221-scu.h>
+#include <dt-bindings/reset/econet,en751221-scu.h>
 
 #define RST_NR_PER_BANK			32
 
@@ -33,15 +36,50 @@
 #define   REG_RESET_CONTROL_PCIEHB	BIT(29)
 #define   REG_RESET_CONTROL_PCIE1	BIT(27)
 #define   REG_RESET_CONTROL_PCIE2	BIT(26)
+#define REG_HIR				0x064
+#define   REG_HIR_MASK			GENMASK(31, 16)
 /* EN7581 */
 #define REG_NP_SCU_PCIC			0x88
 #define REG_NP_SCU_SSTR			0x9c
 #define REG_PCIE_XSI0_SEL_MASK		GENMASK(14, 13)
 #define REG_PCIE_XSI1_SEL_MASK		GENMASK(12, 11)
 #define REG_CRYPTO_CLKSRC2		0x20c
+/* EN751221 */
+#define EN751221_REG_SPI_DIV		0x0cc
+#define EN751221_REG_SPI_DIV_MASK	GENMASK(31, 8)
+#define EN751221_SPI_BASE		500000000
+#define EN751221_SPI_BASE_EN7526C	400000000
+#define EN751221_SPI_DIV_DEFAULT	40
+#define EN751221_REG_BUS		0x284
+#define EN751221_REG_BUS_MASK		GENMASK(21, 12)
+#define EN751221_REG_SSR3		0x094
+#define EN751221_REG_SSR3_GSW_MASK	GENMASK(9, 8)
 
 #define REG_RST_CTRL2			0x830
 #define REG_RST_CTRL1			0x834
+#define EN751221_REG_RST_DMT		0x84
+#define EN751221_REG_RST_USB		0xec
+
+#define EN751221_MAX_CLKS		5
+
+enum en_hir {
+	HIR_UNKNOWN	= -1,
+	HIR_TC3169	= 0,
+	HIR_TC3182	= 1,
+	HIR_RT65168	= 2,
+	HIR_RT63165	= 3,
+	HIR_RT63365	= 4,
+	HIR_MT751020	= 5,
+	HIR_MT7505	= 6,
+	HIR_EN751221	= 7,
+	HIR_EN7526C	= 8,
+	HIR_EN751627	= 9,
+	HIR_EN7580	= 10,
+	HIR_EN7528	= 11,
+	HIR_EN7523	= 12,
+	HIR_EN7581	= 13,
+	HIR_MAX		= 14,
+};
 
 struct en_clk_desc {
 	int id;
@@ -93,6 +131,8 @@ static const u32 bus7581_base[] = { 600000000, 540000000 };
 static const u32 npu7581_base[] = { 800000000, 750000000, 720000000, 600000000 };
 static const u32 crypto_base[] = { 540000000, 480000000 };
 static const u32 emmc7581_base[] = { 200000000, 150000000 };
+/* EN751221 */
+static const u32 gsw751221_base[] = { 500000000, 250000000, 400000000, 200000000 };
 
 static const struct en_clk_desc en7523_base_clks[] = {
 	{
@@ -300,6 +340,13 @@ static const u16 en7581_rst_ofs[] = {
 	REG_RST_CTRL1,
 };
 
+static const u16 en751221_rst_ofs[] = {
+	REG_RST_CTRL2,
+	REG_RST_CTRL1,
+	EN751221_REG_RST_DMT,
+	EN751221_REG_RST_USB,
+};
+
 static const u16 en7523_rst_map[] = {
 	/* RST_CTRL2 */
 	[EN7523_XPON_PHY_RST]		= 0,
@@ -405,8 +452,61 @@ static const u16 en7581_rst_map[] = {
 	[EN7581_XPON_MAC_RST]		= RST_NR_PER_BANK + 31,
 };
 
+static const u16 en751221_rst_map[] = {
+	/* RST_CTRL2 */
+	[EN751221_XPON_PHY_RST]		= 0,
+	[EN751221_GFAST_RST]		= 1,
+	[EN751221_CPU_TIMER2_RST]	= 2,
+	[EN751221_UART3_RST]		= 3,
+	[EN751221_UART4_RST]		= 4,
+	[EN751221_UART5_RST]		= 5,
+	[EN751221_I2C2_RST]		= 6,
+	[EN751221_XSI_MAC_RST]		= 7,
+	[EN751221_XSI_PHY_RST]		= 8,
+
+	/* RST_CTRL1 */
+	[EN751221_PCM1_ZSI_ISI_RST]	= RST_NR_PER_BANK + 0,
+	[EN751221_FE_QDMA1_RST]		= RST_NR_PER_BANK + 1,
+	[EN751221_FE_QDMA2_RST]		= RST_NR_PER_BANK + 2,
+	[EN751221_FE_UNZIP_RST]		= RST_NR_PER_BANK + 3,
+	[EN751221_PCM2_RST]		= RST_NR_PER_BANK + 4,
+	[EN751221_PTM_MAC_RST]		= RST_NR_PER_BANK + 5,
+	[EN751221_CRYPTO_RST]		= RST_NR_PER_BANK + 6,
+	[EN751221_SAR_RST]		= RST_NR_PER_BANK + 7,
+	[EN751221_TIMER_RST]		= RST_NR_PER_BANK + 8,
+	[EN751221_INTC_RST]		= RST_NR_PER_BANK + 9,
+	[EN751221_BONDING_RST]		= RST_NR_PER_BANK + 10,
+	[EN751221_PCM1_RST]		= RST_NR_PER_BANK + 11,
+	[EN751221_UART_RST]		= RST_NR_PER_BANK + 12,
+	[EN751221_GPIO_RST]		= RST_NR_PER_BANK + 13,
+	[EN751221_GDMA_RST]		= RST_NR_PER_BANK + 14,
+	[EN751221_I2C_MASTER_RST]	= RST_NR_PER_BANK + 16,
+	[EN751221_PCM2_ZSI_ISI_RST]	= RST_NR_PER_BANK + 17,
+	[EN751221_SFC_RST]		= RST_NR_PER_BANK + 18,
+	[EN751221_UART2_RST]		= RST_NR_PER_BANK + 19,
+	[EN751221_GDMP_RST]		= RST_NR_PER_BANK + 20,
+	[EN751221_FE_RST]		= RST_NR_PER_BANK + 21,
+	[EN751221_USB_HOST_P0_RST]	= RST_NR_PER_BANK + 22,
+	[EN751221_GSW_RST]		= RST_NR_PER_BANK + 23,
+	[EN751221_SFC2_PCM_RST]		= RST_NR_PER_BANK + 25,
+	[EN751221_PCIE0_RST]		= RST_NR_PER_BANK + 26,
+	[EN751221_PCIE1_RST]		= RST_NR_PER_BANK + 27,
+	[EN751221_CPU_TIMER_RST]	= RST_NR_PER_BANK + 28,
+	[EN751221_PCIE_HB_RST]		= RST_NR_PER_BANK + 29,
+	[EN751221_SIMIF_RST]		= RST_NR_PER_BANK + 30,
+	[EN751221_XPON_MAC_RST]		= RST_NR_PER_BANK + 31,
+
+	/* RST_DMT */
+	[EN751221_DMT_RST]		= 2 * RST_NR_PER_BANK + 0,
+
+	/* RST_USB */
+	[EN751221_USB_PHY_P0_RST]	= 3 * RST_NR_PER_BANK + 6,
+	[EN751221_USB_PHY_P1_RST]	= 3 * RST_NR_PER_BANK + 7,
+};
+
 static int en7581_reset_register(struct device *dev, void __iomem *base,
-				 const u16 *rst_map, int nr_resets);
+				 const u16 *rst_map, int nr_resets,
+				 const u16 *rst_reg_ofs);
 
 static u32 en7523_get_base_rate(const struct en_clk_desc *desc, u32 val)
 {
@@ -604,7 +704,8 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
 	en7523_register_clocks(&pdev->dev, clk_data, base, np_base);
 
 	return en7581_reset_register(&pdev->dev, np_base, en7523_rst_map,
-				     ARRAY_SIZE(en7523_rst_map));
+				     ARRAY_SIZE(en7523_rst_map),
+				     en7581_rst_ofs);
 }
 
 static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
@@ -705,7 +806,8 @@ static const struct reset_control_ops en7581_reset_ops = {
 };
 
 static int en7581_reset_register(struct device *dev, void __iomem *base,
-				 const u16 *rst_map, int nr_resets)
+				 const u16 *rst_map, int nr_resets,
+				 const u16 *rst_reg_ofs)
 {
 	struct en_rst_data *rst_data;
 
@@ -713,7 +815,7 @@ static int en7581_reset_register(struct device *dev, void __iomem *base,
 	if (!rst_data)
 		return -ENOMEM;
 
-	rst_data->bank_ofs = en7581_rst_ofs;
+	rst_data->bank_ofs = rst_reg_ofs;
 	rst_data->idx_map = rst_map;
 	rst_data->base = base;
 
@@ -752,7 +854,107 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
 	writel(val | 3, base + REG_NP_SCU_PCIC);
 
 	return en7581_reset_register(&pdev->dev, base, en7581_rst_map,
-				     ARRAY_SIZE(en7581_rst_map));
+				     ARRAY_SIZE(en7581_rst_map),
+				     en7581_rst_ofs);
+}
+
+static enum en_hir get_hw_id(void __iomem *np_base)
+{
+	u32 val = FIELD_GET(REG_HIR_MASK, readl(np_base + REG_HIR));
+
+	if (val < HIR_MAX)
+		return (enum en_hir)val;
+
+	pr_warn("Unable to determine EcoNet SoC\n");
+
+	return HIR_UNKNOWN;
+}
+
+static void en751221_try_register_clk(struct device *dev, int key,
+				      struct clk_hw_onecell_data *clk_data,
+				      const char *name, u32 rate)
+{
+	struct clk_hw *hw;
+
+	if (WARN_ON_ONCE(key >= EN751221_MAX_CLKS))
+		return;
+
+	hw = clk_hw_register_fixed_rate(dev, name, NULL, 0, rate);
+	if (IS_ERR(hw))
+		pr_err("Failed to register clk %s: %pe\n", name, hw);
+	else
+		clk_data->hws[key] = hw;
+}
+
+static void en751221_register_clocks(struct device *dev,
+				     struct clk_hw_onecell_data *clk_data,
+				     struct regmap *map, void __iomem *np_base)
+{
+	enum en_hir hid = get_hw_id(np_base);
+	struct clk_hw *hw;
+	u32 rate;
+	u32 div;
+	int err;
+
+	/* PCI */
+	hw = en7523_register_pcie_clk(dev, np_base);
+	clk_data->hws[EN751221_CLK_PCIE] = hw;
+
+	/* SPI */
+	rate = EN751221_SPI_BASE;
+	if (hid == HIR_EN7526C)
+		rate = EN751221_SPI_BASE_EN7526C;
+
+	err = regmap_read(map, EN751221_REG_SPI_DIV, &div);
+	if (err) {
+		pr_err("Failed reading fixed clk div %s: %d\n",
+		       "spi", err);
+	} else {
+		div = FIELD_GET(EN751221_REG_SPI_DIV_MASK, div) * 2;
+		if (!div)
+			div = EN751221_SPI_DIV_DEFAULT;
+
+		en751221_try_register_clk(dev, EN751221_CLK_SPI, clk_data,
+					  "spi", rate / div);
+	}
+
+	/* BUS */
+	rate = FIELD_GET(EN751221_REG_BUS_MASK,
+			 readl(np_base + EN751221_REG_BUS));
+	rate *= 1000000;
+	en751221_try_register_clk(dev, EN751221_CLK_BUS, clk_data, "bus",
+				  rate);
+
+	/* CPU */
+	en751221_try_register_clk(dev, EN751221_CLK_CPU, clk_data, "cpu",
+				  rate * 4);
+
+	/* GSW */
+	rate = FIELD_GET(EN751221_REG_SSR3_GSW_MASK,
+			 readl(np_base + EN751221_REG_SSR3));
+	en751221_try_register_clk(dev, EN751221_CLK_GSW, clk_data, "gsw",
+				  gsw751221_base[rate]);
+}
+
+static int en751221_clk_hw_init(struct platform_device *pdev,
+				struct clk_hw_onecell_data *clk_data)
+{
+	struct regmap *map;
+	void __iomem *base;
+
+	map = syscon_regmap_lookup_by_compatible("econet,en751221-chip-scu");
+	if (IS_ERR(map))
+		return PTR_ERR(map);
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	en751221_register_clocks(&pdev->dev, clk_data, map, base);
+
+	return en7581_reset_register(&pdev->dev, base, en751221_rst_map,
+				     ARRAY_SIZE(en751221_rst_map),
+				     en751221_rst_ofs);
 }
 
 static int en7523_clk_probe(struct platform_device *pdev)
@@ -799,9 +1001,20 @@ static const struct en_clk_soc_data en7581_data = {
 	.hw_init = en7581_clk_hw_init,
 };
 
+static const struct en_clk_soc_data en751221_data = {
+	.num_clocks = EN751221_MAX_CLKS,
+	.pcie_ops = {
+		.is_enabled = en7523_pci_is_enabled,
+		.prepare = en7523_pci_prepare,
+		.unprepare = en7523_pci_unprepare,
+	},
+	.hw_init = en751221_clk_hw_init,
+};
+
 static const struct of_device_id of_match_clk_en7523[] = {
 	{ .compatible = "airoha,en7523-scu", .data = &en7523_data },
 	{ .compatible = "airoha,en7581-scu", .data = &en7581_data },
+	{ .compatible = "econet,en751221-scu", .data = &en751221_data },
 	{ /* sentinel */ }
 };
 
-- 
2.39.5


