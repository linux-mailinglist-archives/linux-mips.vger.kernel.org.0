Return-Path: <linux-mips+bounces-12122-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C055C40599
	for <lists+linux-mips@lfdr.de>; Fri, 07 Nov 2025 15:28:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17ACB18977AE
	for <lists+linux-mips@lfdr.de>; Fri,  7 Nov 2025 14:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55EEF328B79;
	Fri,  7 Nov 2025 14:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="i4M8+Aix"
X-Original-To: linux-mips@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BC0285CBA;
	Fri,  7 Nov 2025 14:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762525715; cv=none; b=jYaL8UEcpgY4wxbewi91vJ3r/72733u0nCH60fsqPDc59Vu5813kmj0W708DUnSVwu3tuWumGIN47JW6MQ3p6SybkcP/xjj7IgungE31aP/91iSejLMISrYIS4cy3iXhVrBxaKM2qxxpsKkRjKC+h4ojHkAxpBaXvSBct7Y6oyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762525715; c=relaxed/simple;
	bh=i7yJuEhPfDGkw5B+8M4wqORcZWMVfW+Axz0S1fTXN2o=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=WQ1XS5Gm+AhCBZiTT/yUQ85Bphf5/3FLUm4Tay9w5/Rgzj73banEjGZP/9xZ+0Tnlpb+9JnDhGZH7uq9MUh06cfY5Lzy+699EoMheTmGCla5TT90DjJpynhSncg8UoN+tDFH2/EnJiHIs91cF1XSVpMo8u11ADNADvQGQ+s2ja0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=i4M8+Aix; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=H/rAGufk750DBlTCguDUu86O67RG1ULWAm11JqPmgqI=; b=i4M8+AixldyEAHwsKOahwPbiva
	CmmkvchIn32GoQ//xuqoBBjQEsI9BBj1JkiRkh821XQ38Cobcxln8EzbCEiKaWnSg/5FoSKxr6lX4
	FDFqMgODO9amFMYqyak9o5/5iajdYc1q6AqOojU6ToTkblfBlOjBBlGYpydve0jJNsrFaF9uJceP9
	hwj4rmZncpOEc4Jmd+BEjguqBEyySyQLTlJeYzu3lO+YGi8y8Kqo2gwX/GyOFylEO+wMWJLwCjWiO
	wMAcrRHajGgq+S2lvqwSo/cDoNtPuqcYvghxsz6v8WbDxC+LygpprCOCxI7P8t2XHji9/go8++VI8
	GZ9toTbg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:49690 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vHNRt-000000006fg-1OuK;
	Fri, 07 Nov 2025 14:28:21 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vHNRr-0000000DkSD-1fm9;
	Fri, 07 Nov 2025 14:28:19 +0000
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
Subject: [PATCH net-next 04/16] net: stmmac: mediatek: use PHY_INTF_SEL_xxx
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vHNRr-0000000DkSD-1fm9@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Fri, 07 Nov 2025 14:28:19 +0000

Use PHY_INTF_SEL_xxx definitions for the fields that correspond to the
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


