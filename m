Return-Path: <linux-mips+bounces-12134-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 8353BC407C1
	for <lists+linux-mips@lfdr.de>; Fri, 07 Nov 2025 15:59:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 056AD3517D0
	for <lists+linux-mips@lfdr.de>; Fri,  7 Nov 2025 14:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF5730DED5;
	Fri,  7 Nov 2025 14:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="CPnkQ/JK"
X-Original-To: linux-mips@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347D22DC76B;
	Fri,  7 Nov 2025 14:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762527564; cv=none; b=lZB8wMynvbCG+2fojZqR0UkGnf6MXvBkW5wCgjMGGc870ismo1Qq8IRxYkKzFiGhCDdUIXq6v31NrtBwiskL7UL4DcUFiZXWGEzNHTtzZ6dorUOucGciBlu8R6eyKQUSgdRGLPEznC7jk1ZQNHSXS82YD2FHnYfvXeoUIsfTyqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762527564; c=relaxed/simple;
	bh=ZMo/zWDd6QxRNxwjfW/wYpKbCYbvBN1L6gZq4juYIH8=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=cyq/Ew6/8KdEZ/fiJ8NnXmZigAkij+cSOimpjwgEPffGI2nAPUB27Z8YXH84xvSXJpSZBPilalAw0X4y4ahkMHfYgqVhBXLFahTbXMBzK+WpAFOVodVolBrB4ttbIF8SQJ5r9ZpSkAM2MX+tcXjrhjhdewaoHqJUkl2EssILeUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=CPnkQ/JK; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nxKxjy/C3oPWob4dBvPPL6F8jhZxW9+kJIyvEtBbh7A=; b=CPnkQ/JKGlnhsZP7olTVHXoO56
	ZtNRVW5PrJWImlfI+MZDhkWVn7VIaCAgmep0krm9sBkoCgWXCHbEaUaVR0MT84q98R4L/ghHWUhPs
	FJ+Qh32UwhEcAtJVfgQeT3QJyYTrLQYKJq0lh3PGtuDxsx7qYup3jQM8NM5pnqUc3LJdk44jY4A2M
	wd3t8p7v8gqZNGaBa7g/hSOD1KjSdsbjevxpvO/bY5pg3I4z91TbmxORLGXyJPK9xSCcxClue8hId
	JGfee8ETjXeLLl20zbI0CNPgDMVcS516BVuGcGNn06nujeWe00Oh0hwtjxscycfUACiQFXEsf2rWP
	ZSchN2qA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47708 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vHNSg-000000006j5-2SUq;
	Fri, 07 Nov 2025 14:29:10 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vHNSb-0000000DkT4-1s8G;
	Fri, 07 Nov 2025 14:29:05 +0000
In-Reply-To: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 13/16] net: stmmac: stm32: use PHY_INTF_SEL_x
 directly
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vHNSb-0000000DkT4-1s8G@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Fri, 07 Nov 2025 14:29:05 +0000

Rather than defining separate constants for each, use the
PHY_INTF_SEL_x definitions in the switch()es configuring the
control register, and use one FIELD_PREP() to convert phy_intf_sel
to the register value.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../net/ethernet/stmicro/stmmac/dwmac-stm32.c | 32 ++++++++-----------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index 1545772419d5..18d26f096f5f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -48,30 +48,17 @@
  */
 #define SYSCFG_PMCR_ETH_SEL_MII		BIT(20)
 #define SYSCFG_PMCR_PHY_INTF_SEL_MASK	GENMASK(23, 21)
-#define SYSCFG_PMCR_ETH_SEL_RGMII	\
-	FIELD_PREP(SYSCFG_PMCR_PHY_INTF_SEL_MASK, PHY_INTF_SEL_RGMII)
-#define SYSCFG_PMCR_ETH_SEL_RMII	\
-	FIELD_PREP(SYSCFG_PMCR_PHY_INTF_SEL_MASK, PHY_INTF_SEL_RMII)
-#define SYSCFG_PMCR_ETH_SEL_GMII	\
-	FIELD_PREP(SYSCFG_PMCR_PHY_INTF_SEL_MASK, PHY_INTF_SEL_GMII_MII)
 #define SYSCFG_MCU_ETH_SEL_MII		0
 #define SYSCFG_MCU_ETH_SEL_RMII		1
 
 /* STM32MP2 register definitions */
 #define SYSCFG_MP2_ETH_MASK		GENMASK(31, 0)
 
+#define SYSCFG_ETHCR_ETH_SEL_MASK	GENMASK(6, 4)
 #define SYSCFG_ETHCR_ETH_PTP_CLK_SEL	BIT(2)
 #define SYSCFG_ETHCR_ETH_CLK_SEL	BIT(1)
 #define SYSCFG_ETHCR_ETH_REF_CLK_SEL	BIT(0)
 
-#define SYSCFG_ETHCR_ETH_SEL_MASK	GENMASK(6, 4)
-#define SYSCFG_ETHCR_ETH_SEL_MII	FIELD_PREP(SYSCFG_ETHCR_ETH_SEL_MASK, \
-						   PHY_INTF_SEL_GMII_MII)
-#define SYSCFG_ETHCR_ETH_SEL_RGMII	FIELD_PREP(SYSCFG_ETHCR_ETH_SEL_MASK, \
-						   PHY_INTF_SEL_RGMII)
-#define SYSCFG_ETHCR_ETH_SEL_RMII	FIELD_PREP(SYSCFG_ETHCR_ETH_SEL_MASK, \
-						   PHY_INTF_SEL_RMII)
-
 /* STM32MPx register definitions
  *
  * Below table summarizes the clock requirement and clock sources for
@@ -244,10 +231,12 @@ static int stm32mp1_configure_pmcr(struct plat_stmmacenet_data *plat_dat)
 {
 	struct stm32_dwmac *dwmac = plat_dat->bsp_priv;
 	u32 reg = dwmac->mode_reg;
+	u8 phy_intf_sel;
 	int val = 0;
 
 	switch (plat_dat->phy_interface) {
 	case PHY_INTERFACE_MODE_MII:
+		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
 		/*
 		 * STM32MP15xx supports both MII and GMII, STM32MP13xx MII only.
 		 * SYSCFG_PMCSETR ETH_SELMII is present only on STM32MP15xx and
@@ -258,12 +247,12 @@ static int stm32mp1_configure_pmcr(struct plat_stmmacenet_data *plat_dat)
 			val |= SYSCFG_PMCR_ETH_SEL_MII;
 		break;
 	case PHY_INTERFACE_MODE_GMII:
-		val = SYSCFG_PMCR_ETH_SEL_GMII;
+		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
 		if (dwmac->enable_eth_ck)
 			val |= SYSCFG_PMCR_ETH_CLK_SEL;
 		break;
 	case PHY_INTERFACE_MODE_RMII:
-		val = SYSCFG_PMCR_ETH_SEL_RMII;
+		phy_intf_sel = PHY_INTF_SEL_RMII;
 		if (dwmac->enable_eth_ck)
 			val |= SYSCFG_PMCR_ETH_REF_CLK_SEL;
 		break;
@@ -271,7 +260,7 @@ static int stm32mp1_configure_pmcr(struct plat_stmmacenet_data *plat_dat)
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
-		val = SYSCFG_PMCR_ETH_SEL_RGMII;
+		phy_intf_sel = PHY_INTF_SEL_RGMII;
 		if (dwmac->enable_eth_ck)
 			val |= SYSCFG_PMCR_ETH_CLK_SEL;
 		break;
@@ -284,6 +273,8 @@ static int stm32mp1_configure_pmcr(struct plat_stmmacenet_data *plat_dat)
 
 	dev_dbg(dwmac->dev, "Mode %s", phy_modes(plat_dat->phy_interface));
 
+	val |= FIELD_PREP(SYSCFG_PMCR_PHY_INTF_SEL_MASK, phy_intf_sel);
+
 	/* Shift value at correct ethernet MAC offset in SYSCFG_PMCSETR */
 	val <<= ffs(dwmac->mode_mask) - ffs(SYSCFG_MP1_ETH_MASK);
 
@@ -299,6 +290,7 @@ static int stm32mp1_configure_pmcr(struct plat_stmmacenet_data *plat_dat)
 static int stm32mp2_configure_syscfg(struct plat_stmmacenet_data *plat_dat)
 {
 	struct stm32_dwmac *dwmac = plat_dat->bsp_priv;
+	u8 phy_intf_sel = PHY_INTF_SEL_GMII_MII;
 	u32 reg = dwmac->mode_reg;
 	int val = 0;
 
@@ -307,7 +299,7 @@ static int stm32mp2_configure_syscfg(struct plat_stmmacenet_data *plat_dat)
 		/* ETH_REF_CLK_SEL bit in SYSCFG register is not applicable in MII mode */
 		break;
 	case PHY_INTERFACE_MODE_RMII:
-		val = SYSCFG_ETHCR_ETH_SEL_RMII;
+		phy_intf_sel = PHY_INTF_SEL_RMII;
 		if (dwmac->enable_eth_ck) {
 			/* Internal clock ETH_CLK of 50MHz from RCC is used */
 			val |= SYSCFG_ETHCR_ETH_REF_CLK_SEL;
@@ -317,7 +309,7 @@ static int stm32mp2_configure_syscfg(struct plat_stmmacenet_data *plat_dat)
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
-		val = SYSCFG_ETHCR_ETH_SEL_RGMII;
+		phy_intf_sel = PHY_INTF_SEL_RGMII;
 		fallthrough;
 	case PHY_INTERFACE_MODE_GMII:
 		if (dwmac->enable_eth_ck) {
@@ -334,6 +326,8 @@ static int stm32mp2_configure_syscfg(struct plat_stmmacenet_data *plat_dat)
 
 	dev_dbg(dwmac->dev, "Mode %s", phy_modes(plat_dat->phy_interface));
 
+	val |= FIELD_PREP(SYSCFG_ETHCR_ETH_SEL_MASK, phy_intf_sel);
+
 	/* Select PTP (IEEE1588) clock selection from RCC (ck_ker_ethxptp) */
 	val |= SYSCFG_ETHCR_ETH_PTP_CLK_SEL;
 
-- 
2.47.3


