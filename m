Return-Path: <linux-mips+bounces-12132-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCB3C407AF
	for <lists+linux-mips@lfdr.de>; Fri, 07 Nov 2025 15:59:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 356C835181D
	for <lists+linux-mips@lfdr.de>; Fri,  7 Nov 2025 14:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A9F9238D54;
	Fri,  7 Nov 2025 14:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="SEHbXuVu"
X-Original-To: linux-mips@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0FCD1F5437;
	Fri,  7 Nov 2025 14:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762527535; cv=none; b=r+K6wxec5YLTo3P7TcqRxGNZquWtNsJaEMeIVlfWl5M4JnQpXtt8ugnrAAIHEWjI7RNxtpMPKOlirnzhGBjgIw56ELpuTg4MiLIYjqousjCjlDYQ7DTUaid1OmdV7LspDF+ypUFyqJxFG4ESjyNC5O+J71mhE4GSUPTmHtHigbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762527535; c=relaxed/simple;
	bh=CuvEsihijR3QuzpWK00WdOgefjLnGEunZdgoMgRV66c=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=k1KV8CxWZ9RBNPu1JiYRxJ/haFhck5yrWBnPJHZE5nFZE+z5xKnDiNNVUXyP7PbMVujry5aZ6hBhOAa9eRIDtVutNjg7Ns2+HjG4XCo4Y/ew7K1y+NDIQkGb64ckmib5+Smuk/Q8Y9OYGOyTJslIm6AchlSNTFIl1QiHoIn9Tao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=SEHbXuVu; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QXDtOKkim8POljbcAQyTq0idiW82SeDw3CP0xiWbbjs=; b=SEHbXuVupLYiD/8DgJh771/mTn
	BHMkaVIsg3dSqAzRK1eeF+puMDB1xJNOP1UNtJRd0gNUT5BrNnSW3Z4lX//2EIoxLP3V9b8blGCo3
	wnj/RMVCulgnJeusNQ2LBglt6j9z/aUkxFPZpMTRUneul7zLlBP7phAqZFi4F19XcBBX8lqX0QqcQ
	GrJI1po8SR2Qj/0HsC0+XbCmCA0dJmYwB/b/B3XauF87RNWKVwJarZOWeCjhjc/BoSLXOEq0ejuiE
	2HdgRHVWECM73wHYoKM4Je2g7QS886X8v1MyNbwpBaYo8R178qnE1ztvWIwvLloHMKFCZChMZk7Hl
	6M71pzig==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:45234 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vHNSs-000000006k2-06U6;
	Fri, 07 Nov 2025 14:29:22 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vHNSq-0000000DkTN-3RoV;
	Fri, 07 Nov 2025 14:29:20 +0000
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
Subject: [PATCH net-next 16/16] net: stmmac: visconti: use
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
Message-Id: <E1vHNSq-0000000DkTN-3RoV@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Fri, 07 Nov 2025 14:29:20 +0000

Use stmmac_get_phy_intf_sel() to decode the PHY interface mode to the
phy_intf_sel value, validate the result and use that to set the
control register to select the operating mode for the DWMAC core.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-visconti.c  | 26 +++++--------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
index 7b6b048e1be0..9497b13a5753 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
@@ -42,10 +42,6 @@
 
 #define ETHER_CLK_SEL_RX_TX_CLK_EN (ETHER_CLK_SEL_RX_CLK_EN | ETHER_CLK_SEL_TX_CLK_EN)
 
-#define ETHER_CONFIG_INTF_MII	PHY_INTF_SEL_GMII_MII
-#define ETHER_CONFIG_INTF_RGMII	PHY_INTF_SEL_RGMII
-#define ETHER_CONFIG_INTF_RMII	PHY_INTF_SEL_RMII
-
 struct visconti_eth {
 	void __iomem *reg;
 	struct clk *phy_ref_clk;
@@ -150,22 +146,12 @@ static int visconti_eth_init_hw(struct platform_device *pdev, struct plat_stmmac
 {
 	struct visconti_eth *dwmac = plat_dat->bsp_priv;
 	unsigned int clk_sel_val;
-	u32 phy_intf_sel;
-
-	switch (plat_dat->phy_interface) {
-	case PHY_INTERFACE_MODE_RGMII:
-	case PHY_INTERFACE_MODE_RGMII_ID:
-	case PHY_INTERFACE_MODE_RGMII_RXID:
-	case PHY_INTERFACE_MODE_RGMII_TXID:
-		phy_intf_sel = ETHER_CONFIG_INTF_RGMII;
-		break;
-	case PHY_INTERFACE_MODE_MII:
-		phy_intf_sel = ETHER_CONFIG_INTF_MII;
-		break;
-	case PHY_INTERFACE_MODE_RMII:
-		phy_intf_sel = ETHER_CONFIG_INTF_RMII;
-		break;
-	default:
+	int phy_intf_sel;
+
+	phy_intf_sel = stmmac_get_phy_intf_sel(plat_dat->phy_interface);
+	if (phy_intf_sel != PHY_INTF_SEL_GMII_MII &&
+	    phy_intf_sel != PHY_INTF_SEL_RGMII &&
+	    phy_intf_sel != PHY_INTF_SEL_RMII) {
 		dev_err(&pdev->dev, "Unsupported phy-mode (%d)\n", plat_dat->phy_interface);
 		return -EOPNOTSUPP;
 	}
-- 
2.47.3


