Return-Path: <linux-mips+bounces-12183-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E90C4C552
	for <lists+linux-mips@lfdr.de>; Tue, 11 Nov 2025 09:17:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BDA534F7A3B
	for <lists+linux-mips@lfdr.de>; Tue, 11 Nov 2025 08:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DD0E2F83C2;
	Tue, 11 Nov 2025 08:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="ArH964ZS"
X-Original-To: linux-mips@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55D12BE051;
	Tue, 11 Nov 2025 08:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762848748; cv=none; b=USDuLfpEIqPXt68dcy3grQHhavZofomGViZ4n8EalFMC+jXhfkpM/X/CfSCsXQ4KV3JBjhLld1mLUAjAhQlm+ehBNQcLitvCHExetT5DqVgYZClDa66QBZFTTSexpx11OZRGmeQh41McPqgACQ276SExjzONVPJ85L2gLeB/T1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762848748; c=relaxed/simple;
	bh=LUPHmW2dj2/jScFI7wOAA5jGAL81SwvuWmF4mLE1dmc=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=UnDi1p8VE9JzdTeFOG+VtvOcIZwz85cgQG8+p6atAkdhdmcRg2FT+yQXKPJWjlEBKGeKV9FrO8PPrd1yci3DoNAKPMP96XegZWwNkfalzS2vwtju6B5a3EtBjWj2hHPRG0QvRC+QWNPo72ETGpO24Olrv/yx6JVI9ihU83+B2II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=ArH964ZS; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bgClGoRUUCExaga3kY1+xG8HW2a8/5Ewtov/asu0Kgc=; b=ArH964ZSq1X08IIjUFO51Dqx0A
	Bpc8gI/LywhRwzKGqzaT5dmp3zNWFHSjdv+MAKJxoji4GL/mjwoPLJQjgSuAIuUpGkhfgbKS1uyFy
	zud9yKIWiD0uH3IcV8VyXF+asM0hK9nw1b2aNtgF+vDOwKehFuiAqnJ2JAQo4jBu19HMWoiSuK/Cj
	LF0EBQUzsaDEWcYmflNz1AJ+96scbsC5OSgOgiVujxsFmQDU+1U4/MmNnKpemE/CrPkkfA+vjLqp2
	VbgSBxFg5unE1cMCjfX6jn2y3Hrq8N7gZbDRKwRIZEGTCDj4ebibjaZzEfgUYJ1LP+JV6RORV0S60
	rZfI1TKg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56306 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vIjU7-000000002Az-2D3g;
	Tue, 11 Nov 2025 08:12:15 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vIjU4-0000000DqtV-3qsX;
	Tue, 11 Nov 2025 08:12:12 +0000
In-Reply-To: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
References: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
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
	Keguang Zhang <keguang.zhang@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	netdev@vger.kernel.org,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 06/13] net: stmmac: mediatek: simplify
 set_interface() methods
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vIjU4-0000000DqtV-3qsX@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Tue, 11 Nov 2025 08:12:12 +0000

Use the phy_intf_sel field value when deciding what other options to
apply for the configuration register.

Note that this will allow GMII as well as MII as the phy_intf_sel
value is the same for both.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 50 +++++--------------
 1 file changed, 12 insertions(+), 38 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index 0f32732efb75..1f2d7d19ca56 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -110,26 +110,13 @@ static const char * const mt8195_dwmac_clk_l[] = {
 static int mt2712_set_interface(struct mediatek_dwmac_plat_data *plat,
 				u8 phy_intf_sel)
 {
-	int rmii_clk_from_mac = plat->rmii_clk_from_mac ? RMII_CLK_SRC_INTERNAL : 0;
-	int rmii_rxc = plat->rmii_rxc ? RMII_CLK_SRC_RXC : 0;
-	u32 intf_val;
+	u32 intf_val = phy_intf_sel;
 
-	intf_val = phy_intf_sel;
-
-	/* select phy interface in top control domain */
-	switch (plat->phy_mode) {
-	case PHY_INTERFACE_MODE_RMII:
-		intf_val |= rmii_rxc | rmii_clk_from_mac;
-		break;
-	case PHY_INTERFACE_MODE_MII:
-	case PHY_INTERFACE_MODE_RGMII:
-	case PHY_INTERFACE_MODE_RGMII_TXID:
-	case PHY_INTERFACE_MODE_RGMII_RXID:
-	case PHY_INTERFACE_MODE_RGMII_ID:
-		break;
-	default:
-		dev_err(plat->dev, "phy interface not supported\n");
-		return -EINVAL;
+	if (phy_intf_sel == PHY_INTF_SEL_RMII) {
+		if (plat->rmii_clk_from_mac)
+			intf_val |= RMII_CLK_SRC_INTERNAL;
+		if (plat->rmii_rxc)
+			intf_val |= RMII_CLK_SRC_RXC;
 	}
 
 	regmap_write(plat->peri_regmap, PERI_ETH_PHY_INTF_SEL, intf_val);
@@ -289,26 +276,13 @@ static const struct mediatek_dwmac_variant mt2712_gmac_variant = {
 static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat,
 				u8 phy_intf_sel)
 {
-	int rmii_clk_from_mac = plat->rmii_clk_from_mac ? MT8195_RMII_CLK_SRC_INTERNAL : 0;
-	int rmii_rxc = plat->rmii_rxc ? MT8195_RMII_CLK_SRC_RXC : 0;
-	u32 intf_val;
+	u32 intf_val = FIELD_PREP(MT8195_ETH_INTF_SEL, phy_intf_sel);
 
-	intf_val = FIELD_PREP(MT8195_ETH_INTF_SEL, phy_intf_sel);
-
-	/* select phy interface in top control domain */
-	switch (plat->phy_mode) {
-	case PHY_INTERFACE_MODE_RMII:
-		intf_val |= rmii_rxc | rmii_clk_from_mac;
-		break;
-	case PHY_INTERFACE_MODE_MII:
-	case PHY_INTERFACE_MODE_RGMII:
-	case PHY_INTERFACE_MODE_RGMII_TXID:
-	case PHY_INTERFACE_MODE_RGMII_RXID:
-	case PHY_INTERFACE_MODE_RGMII_ID:
-		break;
-	default:
-		dev_err(plat->dev, "phy interface not supported\n");
-		return -EINVAL;
+	if (phy_intf_sel == PHY_INTF_SEL_RMII) {
+		if (plat->rmii_clk_from_mac)
+			intf_val |= MT8195_RMII_CLK_SRC_INTERNAL;
+		if (plat->rmii_rxc)
+			intf_val |= MT8195_RMII_CLK_SRC_RXC;
 	}
 
 	/* MT8195 only support external PHY */
-- 
2.47.3


