Return-Path: <linux-mips+bounces-12190-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 573E2C4C524
	for <lists+linux-mips@lfdr.de>; Tue, 11 Nov 2025 09:16:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09E4E1891559
	for <lists+linux-mips@lfdr.de>; Tue, 11 Nov 2025 08:14:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6AD30276E;
	Tue, 11 Nov 2025 08:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="oqR3/Wsd"
X-Original-To: linux-mips@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AE62EC54A;
	Tue, 11 Nov 2025 08:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762848784; cv=none; b=WRuemWAe8CQU7yiMEjEdZIqPnXfSaZe7D8uipmP5cxJfMEYCroUSYl7I/miiKsOsPUhhLsP2pB+1+5py99T29WvbiSNjbo1XrExujEWV11DSE/aR1V1jDs7jMIcEfqIgi/u2mD4BORxE7O8qxKGxisLC0OkkMfF8mUK3ZwLy3Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762848784; c=relaxed/simple;
	bh=BSnHCWtNGCsB4IRZUuulxMnJu4hOw0SfW2UgZLVzAVM=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=mrBNn5lwNY1wZBQ5BUmaR6JxI0yIHfusAcGM5JDIIcjYuBaUy4JHGQ9MilQjeSSihP9y1q2edA/Kj4axzks1Fx5Fq6cRR8+aRmLiCQzXlriNB4gdzwAAn68m1nOhP4YW3Pj5ppDNAWcIky3v2qQhgFBjv6p9nmbqULtm+oCLkms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=oqR3/Wsd; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=n+f2vnS/DsYTAF+aCbY0rqGLNCQaEV2shwak8otAGeo=; b=oqR3/Wsd8N0S/3HfZbMbmvWL3j
	d7tO7FSkJl45JDD9AOLv1j9Ha402wc4sTtZvB3jMFc1rf/pr60y1RHESw8CgFJrG1SbuSawksAtSr
	DX4bS1e6LoA5pAC6ZhwUtNzmTBtoytDvJnxblGJ7IStzwr8yLfmsYGJCyy3+2SsE/qQ5iau7hMIY/
	r2dlFbF6VYauGcpjC9Z59DLb5F2+EqcavYLSlanhI6MTihq2nX0bp0edHEom1w6pni/BxidNA6zR3
	26A7EOR8OCno4U++jV0ZFWlSXgzowF+JXyhxo9VBPpv+IT+tyOvtnpEm4VvIiJ+LP0wJmDH5bQhGm
	8eONkoHw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:48894 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vIjUg-000000002DZ-2AyO;
	Tue, 11 Nov 2025 08:12:50 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vIjUe-0000000DquB-3JDY;
	Tue, 11 Nov 2025 08:12:48 +0000
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
Subject: [PATCH net-next v2 13/13] net: stmmac: visconti: use
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
Message-Id: <E1vIjUe-0000000DquB-3JDY@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Tue, 11 Nov 2025 08:12:48 +0000

Use stmmac_get_phy_intf_sel() to decode the PHY interface mode to the
phy_intf_sel value, validate the result and use that to set the
control register to select the operating mode for the DWMAC core.

Note that this will allow GMII as well as MII as the phy_intf_sel
value is the same for both.

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


