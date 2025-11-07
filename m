Return-Path: <linux-mips+bounces-12123-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 261CEC40605
	for <lists+linux-mips@lfdr.de>; Fri, 07 Nov 2025 15:32:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50CD74216B1
	for <lists+linux-mips@lfdr.de>; Fri,  7 Nov 2025 14:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82D59328B77;
	Fri,  7 Nov 2025 14:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="Eu24rjwo"
X-Original-To: linux-mips@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943E3322C8A;
	Fri,  7 Nov 2025 14:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762525721; cv=none; b=s+r743WatjfkZ+uWsqf1qviU9aG5Xqiw1NWZ7WVu5b66V2mT0xItNDss5Xr6I/0tL3+/o5FgKQXwxwfHwwh4UGALAxI78jMsl57kjJLz6kpszfLQNfer8Ynv5Ev9tgRC/9RNO4zjzdR7c8FKuoCJXBK2Mlpi38TNLj/9XxaT5D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762525721; c=relaxed/simple;
	bh=akZxZj6QlYAoEHXyJH4ATER/62xKn5ONcjcUkP7FogU=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=l1PNLpo+9Qkl5GNr5JmHoJ7MBt51/U7k9PO33ON9Us+tyHPG8D3U2DE0gZ7JYPCaDgUtQVkO+QM4WgzUiqsQ7zyB+eqYHQE3KgJcMpGzTRJ62C/GDenzhbxI3Cmjdp+PYEI2cA4bIfQisYvgbbdrofkzj3gVXwBzVRo/5V9LFe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=Eu24rjwo; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HuEqlECWDCaNWgWH8z84uCmKw/NZbDZ8phBddxEwuWo=; b=Eu24rjwoegTIr2lQixyt7hGW59
	xFe3xP/ES/IuTB3Fszh4unq/1OlPqQJxWUay82NJfvZmrPDBUbzmr9Vl9VmV80HIj0LSfILZFGLtc
	IsdoPiA80bG7YiuSfLonkvQcalIm8lSQQ4skWzgy1BS30bEGaSj+N5TX1T9ebLnMx3AE7uRSuIBEA
	iBuDFe1Bu5kFKmaFDQK9ywVeqmUYBNcEkDLw1TKBn4WJZYaEbdtQodOTT1yIN/BwD5BNoJzt9AG77
	R4cH9MR9gCUFtsGK6AmEn089P5lYpZ2HIUdePGwje/NWz8PQV99V+g2THv2qRBtlxTHpa0gORM2oq
	9jJjV+mg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:49696 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vHNRy-000000006g7-070K;
	Fri, 07 Nov 2025 14:28:26 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vHNRw-0000000DkSJ-2AQ2;
	Fri, 07 Nov 2025 14:28:24 +0000
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
Subject: [PATCH net-next 05/16] net: stmmac: mediatek: use
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
Message-Id: <E1vHNRw-0000000DkSJ-2AQ2@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Fri, 07 Nov 2025 14:28:24 +0000

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


