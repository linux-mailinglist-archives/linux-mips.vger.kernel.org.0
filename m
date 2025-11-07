Return-Path: <linux-mips+bounces-12120-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3224C40590
	for <lists+linux-mips@lfdr.de>; Fri, 07 Nov 2025 15:28:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32EE6188E07E
	for <lists+linux-mips@lfdr.de>; Fri,  7 Nov 2025 14:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 857CD329C66;
	Fri,  7 Nov 2025 14:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="bbtIfqnc"
X-Original-To: linux-mips@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915D2285CBA;
	Fri,  7 Nov 2025 14:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762525699; cv=none; b=Amryd59w2xnzWEASP17Zm5JrjGmN9JMQFUfGiCkNYFif4RTsSVHUoUKYbn2V0ugTWFzBpjoOQtlU+doY2Q8intCHQbv7JbX2UnuGEF3oTjXkfsdur/z4KGJwBLNhiNi3m6FEOcL0BhbUu6FFS7SfbGyykrFzx7FrU9+SlSzqQjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762525699; c=relaxed/simple;
	bh=MIi8PfLZASkUCPzQH1RsvuxhvEJW2ax7JW64yaW891Q=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=ob5T6lVDEIKwF7hs1spQJ/LC1hsaBybH7QJXcJLTu8+77yHCRc/mx0De10zm45TwVe/Xv8ovCrKsFrfm+10hVke3OelGFueB59aNO7TCqPaTH2kBLeyJE5mQ2C2783Bf0J6hYhn153OtjNET2nU3Ysup10egzF71gvvexp2NMT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=bbtIfqnc; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bzAz2OSqG2eLqXJWaxdsurWbDprdWOWwtQP4/q9dLmg=; b=bbtIfqncB6v4yv+kZZ3WAE3NNM
	dmGVwl2QOAEYbA7duVnU4ykCpRBqRWhFDVsRJ2py5yA6hD+x/Wo4xu5wbls23NKQ19dRB+f1VVPr+
	EiITc7Hu5BzM0AUdziWI2X0pQwEXSMgFMayYCsa7IUaDDVlad1kI43QYJxWGIYyJWwiaDAIdQp+kh
	+3sWI54VdfIncpKwrgKtbABt8KC3d0DoXEXvWRS7fA7PGt5ER6MJAHN0vjjk5Qjsr820G2Cj+Ymzl
	/vHA1x963+3uoEg3zYHFH2LqX6qvnyqbqrZthQs8s/QNirKiQjjx8qY7WhTsxbwGtoeSpsdWWYYNO
	AAfFKv0g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42702 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vHNRi-000000006ev-0Mjd;
	Fri, 07 Nov 2025 14:28:10 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vHNRh-0000000DkS1-0fl2;
	Fri, 07 Nov 2025 14:28:09 +0000
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
Subject: [PATCH net-next 02/16] net: stmmac: loongson1: use PHY_INTF_SEL_x
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
Message-Id: <E1vHNRh-0000000DkS1-0fl2@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Fri, 07 Nov 2025 14:28:09 +0000

Use the PHY_INTF_SEL_xx values directly in ls1c_dwmac_syscon_init(),
converting them to the PHY_INTF_SELI bitfield when calling
regmap_update_bits().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
index 09e2af1d778a..5f9f66fbc191 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
@@ -38,8 +38,6 @@
 #define GMAC_SHUT		BIT(6)
 
 #define PHY_INTF_SELI		GENMASK(30, 28)
-#define PHY_INTF_MII		FIELD_PREP(PHY_INTF_SELI, PHY_INTF_SEL_GMII_MII)
-#define PHY_INTF_RMII		FIELD_PREP(PHY_INTF_SELI, PHY_INTF_SEL_RMII)
 
 struct ls1x_dwmac {
 	struct plat_stmmacenet_data *plat_dat;
@@ -140,15 +138,14 @@ static int ls1c_dwmac_syscon_init(struct platform_device *pdev, void *priv)
 	struct ls1x_dwmac *dwmac = priv;
 	struct plat_stmmacenet_data *plat = dwmac->plat_dat;
 	struct regmap *regmap = dwmac->regmap;
+	int phy_intf_sel;
 
 	switch (plat->phy_interface) {
 	case PHY_INTERFACE_MODE_MII:
-		regmap_update_bits(regmap, LS1X_SYSCON1, PHY_INTF_SELI,
-				   PHY_INTF_MII);
+		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
 		break;
 	case PHY_INTERFACE_MODE_RMII:
-		regmap_update_bits(regmap, LS1X_SYSCON1, PHY_INTF_SELI,
-				   PHY_INTF_RMII);
+		phy_intf_sel = PHY_INTF_SEL_RMII;
 		break;
 	default:
 		dev_err(&pdev->dev, "Unsupported PHY-mode %u\n",
@@ -156,6 +153,8 @@ static int ls1c_dwmac_syscon_init(struct platform_device *pdev, void *priv)
 		return -EOPNOTSUPP;
 	}
 
+	regmap_update_bits(regmap, LS1X_SYSCON1, PHY_INTF_SELI,
+			   FIELD_PREP(PHY_INTF_SELI, phy_intf_sel));
 	regmap_update_bits(regmap, LS1X_SYSCON0, GMAC0_SHUT, 0);
 
 	return 0;
-- 
2.47.3


