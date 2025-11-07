Return-Path: <linux-mips+bounces-12127-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4FBC405F9
	for <lists+linux-mips@lfdr.de>; Fri, 07 Nov 2025 15:31:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 674434F562E
	for <lists+linux-mips@lfdr.de>; Fri,  7 Nov 2025 14:29:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 308022D062F;
	Fri,  7 Nov 2025 14:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="jUmQWNV8"
X-Original-To: linux-mips@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB602D4B77;
	Fri,  7 Nov 2025 14:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762525751; cv=none; b=BmZpaUZIhSQGRzTLwtwlDrs1jO7J3+9GeEXwDuTT1vLzoGyO3UNezBucq6lBTtMAtBfe2DnKEYp4Bda+Fyi/Cal0YsyNLBn8RgGS/AfV/h2Tc9VFsKqtMEAbL2fVDJYtUMGY37wObEF8V/ksFT+piLGspEzS3tW6g/7E8fosE9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762525751; c=relaxed/simple;
	bh=cDBQ3khpHZA3siw29WOefY62ZL2DVW3QdOtwwtDMYRk=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=E+edgIcbmlmkSbNRvtnoG29Wkg+hU4BYRF5TaWqNq5KMoZ+GH8895L2+UfRUvRZpqh4dl7L2hyjEghuvAiusrgnPufXcI2/pxTSnm5KFAr+El/etSOmpdv7Run+BB6b3xJ0228kerqQyUT682/FzWEHiMS7QvGujcIZ0uTkxv8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=jUmQWNV8; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bHiUKbo/EJ0H+zKzdJO+2QHlu85wivo4qPxxyW/Gktk=; b=jUmQWNV8nGO14D/HKoZVBBBv0P
	khGIDTO/DR4TgipSFk3KQe7jsn2VKToss/ANzual3+1WmEOOvOFzuz48yVtZ2BTUNw6OyU1eiBPbM
	uHy4z4UdJsSjA45ErzIs+1xoqTBczY2E4AtQxQGKxBjj4a5YSAmrwwYpKJXyqZaLwVDSA6szk7/23
	yA3wV/xc34UvVwxIGx7VP7eIMmRGFziaN7LyyK9i+RlfbzJQDRN5Ze+hQsx0nFHoTmoUwbuMgSSka
	Mdv/uQcAcweighx62jogkWjoiOQoTybIU+yDEiuWCGmK0rQa6AYBRFhlg7FYE2GSQf7Qq3G+lN4q8
	8/28PhtQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56086 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vHNSK-000000006hh-3oRP;
	Fri, 07 Nov 2025 14:28:49 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vHNSG-0000000DkSh-4BIj;
	Fri, 07 Nov 2025 14:28:45 +0000
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
Subject: [PATCH net-next 09/16] net: stmmac: meson8b: use
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
Message-Id: <E1vHNSG-0000000DkSh-4BIj@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Fri, 07 Nov 2025 14:28:44 +0000

Use stmmac_get_phy_intf_sel() to decode the PHY interface mode to the
phy_intf_sel value, validate the result and use that to set the
control register to select the operating mode for the DWMAC core.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c    | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 865cd6166134..e4d5c41294f4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -238,22 +238,12 @@ static int meson_axg_set_phy_mode(struct meson8b_dwmac *dwmac)
 {
 	int phy_intf_sel;
 
-	switch (dwmac->phy_mode) {
-	case PHY_INTERFACE_MODE_RGMII:
-	case PHY_INTERFACE_MODE_RGMII_RXID:
-	case PHY_INTERFACE_MODE_RGMII_ID:
-	case PHY_INTERFACE_MODE_RGMII_TXID:
-		/* enable RGMII mode */
-		phy_intf_sel = PHY_INTF_SEL_RGMII;
-		break;
-	case PHY_INTERFACE_MODE_RMII:
-		/* disable RGMII mode -> enables RMII mode */
-		phy_intf_sel = PHY_INTF_SEL_RMII;
-		break;
-	default:
+	phy_intf_sel = stmmac_get_phy_intf_sel(dwmac->phy_mode);
+	if (phy_intf_sel != PHY_INTF_SEL_RGMII &&
+	    phy_intf_sel != PHY_INTF_SEL_RMII) {
 		dev_err(dwmac->dev, "fail to set phy-mode %s\n",
 			phy_modes(dwmac->phy_mode));
-		return -EINVAL;
+		return phy_intf_sel < 0 ? phy_intf_sel : -EINVAL;
 	}
 
 	meson8b_dwmac_mask_bits(dwmac, PRG_ETH0, PRG_ETH0_EXT_PHY_MODE_MASK,
-- 
2.47.3


