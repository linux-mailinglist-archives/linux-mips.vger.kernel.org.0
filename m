Return-Path: <linux-mips+bounces-12185-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0565C4C588
	for <lists+linux-mips@lfdr.de>; Tue, 11 Nov 2025 09:19:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E23E63BF71C
	for <lists+linux-mips@lfdr.de>; Tue, 11 Nov 2025 08:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A11E321F5E;
	Tue, 11 Nov 2025 08:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="GpTBojM3"
X-Original-To: linux-mips@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B024D31196F;
	Tue, 11 Nov 2025 08:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762848758; cv=none; b=fb48NhYe+3i28/wEu8anXhRQpSXdkEvFHvMvLnT1EtxEK8kzmIV7im9JyvSSU330dCndOhM5fPSw7FoWcnOBG0VKph4BawUiFB2WZTFPPDF6z9U8jUVZgyBhTX/3/ECN9HdhQYtrr9UeDMANJbfQf+fK1hm6NfnayxNHDT68Ckw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762848758; c=relaxed/simple;
	bh=wudoMpjXT23Xr4ai6zX5DVhTvESjygDIyIcxa8Cj5yc=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=bQljthRfe0zUL5DUW8WTeiNEn/C4HE/4oJsgVUHv+58jR073lDPyHRzpaUhAutvO4ELsa/P7SscQKvPzOn5ZIPhD9RLj5MD6APv5KwTwOHGnXzMkno0fxxcwmjeJ6+cWhsfc+BIMQ3w59nTVbZRUXlBJ5CTguMUPhqHDXZPKLZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=GpTBojM3; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=azUidkZnPCh9Mafb2lBwoV+zJ7JDUMj3PRcpXOZ0GqQ=; b=GpTBojM3bk8m3Wsj/lsgOXV5nm
	tyO/7KGNbs0fZaKrXFGSmWEjB+eycVFDJA3fVqtZM+11xXwgQeRGEpP+Dhcv6jQG+jFewql4JM/0l
	jNP6YhfsvUt6bTgxNXJhUcceC1TYwCFlL/rONv6ap+PedlYTDo0Hjgy2B6iY28ChWdZLtgUBm0ac8
	3ZB8EGP057qPA4gdpshfz8jt08xDbZUQkEi1rXZgXqPi7XD5XwqgqisakG5IL6n2QwUzm67sGpfTg
	oq54wA/9BRuUoDjkSNMdZDnPbANYcPhJPLRQ5dIpyhEVJuSS9hevZBXhgGdJ+uQws+GmcevCvZNzo
	nmLYRaew==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53550 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vIjUG-000000002Bi-3khQ;
	Tue, 11 Nov 2025 08:12:25 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vIjUF-0000000Dqth-0gwD;
	Tue, 11 Nov 2025 08:12:23 +0000
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
Subject: [PATCH net-next v2 08/13] net: stmmac: starfive: use
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
Message-Id: <E1vIjUF-0000000Dqth-0gwD@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Tue, 11 Nov 2025 08:12:23 +0000

Use stmmac_get_phy_intf_sel() to decode the PHY interface mode to the
phy_intf_sel value, validate the result and use that to set the
control register to select the operating mode for the DWMAC core.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 24 +++++--------------
 1 file changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
index 1ef72576c6f1..16b955a6d77b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
@@ -15,8 +15,6 @@
 
 #include "stmmac_platform.h"
 
-#define STARFIVE_DWMAC_PHY_INFT_RGMII		PHY_INTF_SEL_RGMII
-#define STARFIVE_DWMAC_PHY_INFT_RMII		PHY_INTF_SEL_RMII
 #define STARFIVE_DWMAC_PHY_INFT_FIELD		0x7U
 
 #define JH7100_SYSMAIN_REGISTER49_DLYCHAIN	0xc8
@@ -35,25 +33,15 @@ static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	struct starfive_dwmac *dwmac = plat_dat->bsp_priv;
 	struct regmap *regmap;
 	unsigned int args[2];
-	unsigned int mode;
+	int phy_intf_sel;
 	int err;
 
-	switch (plat_dat->phy_interface) {
-	case PHY_INTERFACE_MODE_RMII:
-		mode = STARFIVE_DWMAC_PHY_INFT_RMII;
-		break;
-
-	case PHY_INTERFACE_MODE_RGMII:
-	case PHY_INTERFACE_MODE_RGMII_ID:
-	case PHY_INTERFACE_MODE_RGMII_RXID:
-	case PHY_INTERFACE_MODE_RGMII_TXID:
-		mode = STARFIVE_DWMAC_PHY_INFT_RGMII;
-		break;
-
-	default:
+	phy_intf_sel = stmmac_get_phy_intf_sel(plat_dat->phy_interface);
+	if (phy_intf_sel != PHY_INTF_SEL_RGMII &&
+	    phy_intf_sel != PHY_INTF_SEL_RMII) {
 		dev_err(dwmac->dev, "unsupported interface %s\n",
 			phy_modes(plat_dat->phy_interface));
-		return -EINVAL;
+		return phy_intf_sel < 0 ? phy_intf_sel : -EINVAL;
 	}
 
 	regmap = syscon_regmap_lookup_by_phandle_args(dwmac->dev->of_node,
@@ -65,7 +53,7 @@ static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
 	/* args[0]:offset  args[1]: shift */
 	err = regmap_update_bits(regmap, args[0],
 				 STARFIVE_DWMAC_PHY_INFT_FIELD << args[1],
-				 mode << args[1]);
+				 phy_intf_sel << args[1]);
 	if (err)
 		return dev_err_probe(dwmac->dev, err, "error setting phy mode\n");
 
-- 
2.47.3


