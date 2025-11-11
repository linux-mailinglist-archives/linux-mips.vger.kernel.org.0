Return-Path: <linux-mips+bounces-12181-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFE2C4C564
	for <lists+linux-mips@lfdr.de>; Tue, 11 Nov 2025 09:18:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D5FD3B7CB0
	for <lists+linux-mips@lfdr.de>; Tue, 11 Nov 2025 08:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E76E2F49E0;
	Tue, 11 Nov 2025 08:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="kuAcRjKn"
X-Original-To: linux-mips@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440D018C008;
	Tue, 11 Nov 2025 08:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762848736; cv=none; b=IvHp6w+UFjC3Ymu+K5ryN40IUx39vY3Q3bpeTJ58AU135rQQYqZrOysOrbxPcsxtkUXfCNUp9NODCTYSXfQSC0esTBTYuOU7pWiNw4qAdpbmtkHw7MsM7rkPEvAspNvq/+hEATZd43t+c6iHZoL0R8WGUR0VXINgLgt6Mx8KOmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762848736; c=relaxed/simple;
	bh=N7B2kvhKI1DPkLYDgkOsO2kiP1VXRX+o9848DZy344A=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=lOh4Jok8Cg31GmkbqO/vn4y7Lkm0gtQ0GcWBmibfQJUjYrj6KeCZxxWi9K+mKwq3GHj7+Dd9DlTqLA/Kzewo5UaKLpeCpKlFa0tNK16VkUJn+33jkShjmfRXwiCxPtD4j8qLz9CeyuX9UOr/NufJQd/cbqhcoTTKRmdfQFnOraA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=kuAcRjKn; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=l0Abh9lLLwfL7lAUCr8RNuqbq4RKwi0tJuH6+FQmA70=; b=kuAcRjKn+nJhvGxn5fVDaofP1I
	4WlCgghYIMdCaLTJMGrbrMhmvCs4XF6hkSWEPSzQcREddgAaYdIfAzqD1b8nsxmHwoRiaHX4ZYpln
	7ywRdm5aWvxbBRh18pDLZ9ZEnbfn/8CEHuuSqAV2H0UuLOux0nTqp/VINLm14N/Z+k731tHu8UmVO
	9KHXZsQhgNbS7HW9wv3VYyV4kf1n2F/ktiOnvaVcZossP8X/R0Y3GdbazmP7tLNZVKwiZyYJ0bXME
	d9T/FiyiNgq9NSjMuf1VXdV7fmFf1IYvTysUHyAaWFOxYqyNIYZx9KHuVbpA4PKobaPuHvqPzxXWK
	m3xCAiNQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51548 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vIjTw-000000002AH-16xO;
	Tue, 11 Nov 2025 08:12:04 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vIjTu-0000000DqtI-2sUB;
	Tue, 11 Nov 2025 08:12:02 +0000
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
Subject: [PATCH net-next v2 04/13] net: stmmac: mediatek: use PHY_INTF_SEL_x
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vIjTu-0000000DqtI-2sUB@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Tue, 11 Nov 2025 08:12:02 +0000

Use PHY_INTF_SEL_x definitions for the fields that correspond to the
phy_intf_sel inputs to the dwmac core.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-mediatek.c   | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index f1b36f0a401d..dcdf28418fec 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -17,9 +17,6 @@
 
 /* Peri Configuration register for mt2712 */
 #define PERI_ETH_PHY_INTF_SEL	0x418
-#define PHY_INTF_MII		0
-#define PHY_INTF_RGMII		1
-#define PHY_INTF_RMII		4
 #define RMII_CLK_SRC_RXC	BIT(4)
 #define RMII_CLK_SRC_INTERNAL	BIT(5)
 
@@ -118,16 +115,16 @@ static int mt2712_set_interface(struct mediatek_dwmac_plat_data *plat)
 	/* select phy interface in top control domain */
 	switch (plat->phy_mode) {
 	case PHY_INTERFACE_MODE_MII:
-		intf_val |= PHY_INTF_MII;
+		intf_val |= PHY_INTF_SEL_GMII_MII;
 		break;
 	case PHY_INTERFACE_MODE_RMII:
-		intf_val |= (PHY_INTF_RMII | rmii_rxc | rmii_clk_from_mac);
+		intf_val |= PHY_INTF_SEL_RMII | rmii_rxc | rmii_clk_from_mac;
 		break;
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_ID:
-		intf_val |= PHY_INTF_RGMII;
+		intf_val |= PHY_INTF_SEL_RGMII;
 		break;
 	default:
 		dev_err(plat->dev, "phy interface not supported\n");
@@ -297,17 +294,18 @@ static int mt8195_set_interface(struct mediatek_dwmac_plat_data *plat)
 	/* select phy interface in top control domain */
 	switch (plat->phy_mode) {
 	case PHY_INTERFACE_MODE_MII:
-		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_MII);
+		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL,
+				       PHY_INTF_SEL_GMII_MII);
 		break;
 	case PHY_INTERFACE_MODE_RMII:
-		intf_val |= (rmii_rxc | rmii_clk_from_mac);
-		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_RMII);
+		intf_val |= rmii_rxc | rmii_clk_from_mac;
+		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_SEL_RMII);
 		break;
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_ID:
-		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_RGMII);
+		intf_val |= FIELD_PREP(MT8195_ETH_INTF_SEL, PHY_INTF_SEL_RGMII);
 		break;
 	default:
 		dev_err(plat->dev, "phy interface not supported\n");
-- 
2.47.3


