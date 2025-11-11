Return-Path: <linux-mips+bounces-12182-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FF0C4C54D
	for <lists+linux-mips@lfdr.de>; Tue, 11 Nov 2025 09:17:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 55F244F7709
	for <lists+linux-mips@lfdr.de>; Tue, 11 Nov 2025 08:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77932DC76C;
	Tue, 11 Nov 2025 08:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="R+ncjn/T"
X-Original-To: linux-mips@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49272E6CA4;
	Tue, 11 Nov 2025 08:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762848741; cv=none; b=HvvH2POlb30x9FGkwhoQQCPyxPNWaxVPGFTG0gMTIH1++HxB7dPMZ/E+5rWx1PHQntLPrP6acvYnYG5vGnfWI/RHiy95LBQqpMDB25FAgIe0P2xzWb5vIOInSp9s4lBXDJlTRPXYM2CYgiqHWbhNqDlLnFMt6Vxq+yMRQdt+bZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762848741; c=relaxed/simple;
	bh=akZxZj6QlYAoEHXyJH4ATER/62xKn5ONcjcUkP7FogU=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=WW0qcvja0aHycjvXwtxm+U9XmS+a5D7xalhpXa2JtYo0/+pEXFK7lGuXTmdHa1lo6s4vcfW0lElDrLC68grOnfzJutapgSrf3nXqtZFbLG0WsOJil8D5EnAXE5grhVMu0S9WiKZwZV1l7cYb7FQ2TiJ84jYGd3EOEF0G+skDfEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=R+ncjn/T; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HuEqlECWDCaNWgWH8z84uCmKw/NZbDZ8phBddxEwuWo=; b=R+ncjn/TVMVN8wHgGcuWZwhWak
	9Q966o7o4AJIX8PfPfKDJmahmj5zHrc99yH7X5zsPjUtmVe/+i6hPAIsuOhd8IoXPNceRWnJiV45D
	3hyrsLfogn20B0CsWUY4YWDaUGprrQJpTDDbBScphejt/cxqu+etXynStUcPLOA62wtjZR5y8HSq2
	6JVYz6vxAB8d3Jr3qeLbTjpoZ3Iw0Q9KBkHxLdwicWQmoRIwxw0Li0sjstMyzxC2+F6RdEGN8MYiV
	Jl+poRU34unsV6kGaXhq0Kehls4mMEz00FV97MybysVTXxneuahWlBGH38jT75EFI8ox6mZ0c/tDQ
	v1JV67lg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51550 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vIjU0-000000002AZ-3MPk;
	Tue, 11 Nov 2025 08:12:09 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vIjTz-0000000DqtP-3N9v;
	Tue, 11 Nov 2025 08:12:07 +0000
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
Subject: [PATCH net-next v2 05/13] net: stmmac: mediatek: use
 stmmac_get_phy_intf_sel()
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vIjTz-0000000DqtP-3N9v@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Tue, 11 Nov 2025 08:12:07 +0000

Use stmmac_get_phy_intf_sel() to decode the PHY interface mode to the
phy_intf_sel value, validate the result, and pass that into the
implementation specific ->dwmac_set_phy_interface() method. Use this
to configure the PHY interface selection field.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 43 +++++++++++--------
 1 file changed, 25 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index dcdf28418fec..0f32732efb75 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -85,7 +85,8 @@ struct mediatek_dwmac_plat_data {
 };
 
 struct mediatek_dwmac_variant {
-	int (*dwmac_set_phy_interface)(struct mediatek_dwmac_plat_data *plat);
+	int (*dwmac_set_phy_interface)(struct mediatek_dwmac_plat_data *plat,
+				       u8 phy_intf_sel);
 	int (*dwmac_set_delay)(struct mediatek_dwmac_plat_data *plat);
 
 	/* clock ids to be requested */
@@ -106,25 +107,25 @@ static const char * const mt8195_dwmac_clk_l[] = {
 	"axi", "apb", "mac_cg", "mac_main", "ptp_ref"
 };
 
-static int mt2712_set_interface(struct mediatek_dwmac_plat_data *plat)
+static int mt2712_set_interface(struct mediatek_dwmac_plat_data *plat,
+				u8 phy_intf_sel)
 {
 	int rmii_clk_from_mac = plat->rmii_clk_from_mac ? RMII_CLK_SRC_INTERNAL : 0;
 	int rmii_rxc = plat->rmii_rxc ? RMII_CLK_SRC_RXC : 0;
-	u32 intf_val = 0;
+	u32 intf_val;
+
+	intf_val = phy_intf_sel;
 
 	/* select phy interface in top control domain */
 	switch (plat->phy_mode) {
-	case PHY_INTERFACE_MODE_MII:
-		intf_val |= PHY_INTF_SEL_GMII_MII;
-		break;
 	case PHY_INTERFACE_MODE_RMII:
-		intf_val |= PHY_INTF_SEL_RMII | rmii_rxc | rmii_clk_from_mac;
+		intf_val |= rmii_rxc | rmii_clk_from_mac;
 		break;
+	case PHY_INTERFACE_MODE_MII:
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_ID:
-		intf_val |= PHY_INTF_SEL_RGMII;
 		break;
 	default:
 		dev_err(plat->dev, "phy interface not supported\n");
@@ -285,27 +286,25 @@ static const struct mediatek_dwmac_variant mt2712_gmac_variant = {
 		.tx_delay_max = 17600,
 };
 
-static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat)
+static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat,
+				u8 phy_intf_sel)
 {
 	int rmii_clk_from_mac = plat->rmii_clk_from_mac ? MT8195_RMII_CLK_SRC_INTERNAL : 0;
 	int rmii_rxc = plat->rmii_rxc ? MT8195_RMII_CLK_SRC_RXC : 0;
-	u32 intf_val = 0;
+	u32 intf_val;
+
+	intf_val = FIELD_PREP(MT8195_ETH_INTF_SEL, phy_intf_sel);
 
 	/* select phy interface in top control domain */
 	switch (plat->phy_mode) {
-	case PHY_INTERFACE_MODE_MII:
-		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL,
-				       PHY_INTF_SEL_GMII_MII);
-		break;
 	case PHY_INTERFACE_MODE_RMII:
 		intf_val |= rmii_rxc | rmii_clk_from_mac;
-		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_SEL_RMII);
 		break;
+	case PHY_INTERFACE_MODE_MII:
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_ID:
-		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_SEL_RGMII);
 		break;
 	default:
 		dev_err(plat->dev, "phy interface not supported\n");
@@ -525,10 +524,18 @@ static int mediatek_dwmac_init(struct device *dev, void *priv)
 {
 	struct mediatek_dwmac_plat_data *plat = priv;
 	const struct mediatek_dwmac_variant *variant = plat->variant;
-	int ret;
+	int phy_intf_sel, ret;
 
 	if (variant->dwmac_set_phy_interface) {
-		ret = variant->dwmac_set_phy_interface(plat);
+		phy_intf_sel = stmmac_get_phy_intf_sel(plat->phy_mode);
+		if (phy_intf_sel != PHY_INTF_SEL_GMII_MII &&
+		    phy_intf_sel != PHY_INTF_SEL_RGMII &&
+		    phy_intf_sel != PHY_INTF_SEL_RMII) {
+			dev_err(plat->dev, "phy interface not supported\n");
+			return phy_intf_sel < 0 ? phy_intf_sel : -EINVAL;
+		}
+
+		ret = variant->dwmac_set_phy_interface(plat, phy_intf_sel);
 		if (ret) {
 			dev_err(dev, "failed to set phy interface, err = %d\n", ret);
 			return ret;
-- 
2.47.3


