Return-Path: <linux-mips+bounces-9380-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF76ADE952
	for <lists+linux-mips@lfdr.de>; Wed, 18 Jun 2025 12:42:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30F0D3A56DD
	for <lists+linux-mips@lfdr.de>; Wed, 18 Jun 2025 10:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75E3283FDC;
	Wed, 18 Jun 2025 10:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="i4DE1g+8"
X-Original-To: linux-mips@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CAE21578F;
	Wed, 18 Jun 2025 10:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750243326; cv=none; b=Sw2RzsXaecDiK7Dku+JjKI2dkUbIUd4frJP2APVM3VkE2oKPoIZC6K5kkL8b1vmKgwX+Nj1EO8I9MA4CgSo9rmS6JKnGktJzBuV8UpfZdHoUoi0z/IQxRLcXKcE0C36JEJC+W/1QWVumOCdvlhZsE7fQh6Fp4v/N7Tc+BfAZ0C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750243326; c=relaxed/simple;
	bh=5tDyHv0TRhrXWfWnQOFqPSvfRHoZHh6GNmgb/YdJgkU=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=mlu2QRVhMgVq0HfDOUNK1a2YgnpN5Q3FsFWXu3RWsjlQfG/AdhZ4SxP5TJ4JjM+K5r43e8+PdvLDy0oonbIAw9GdX7r/al/WFrKnbjbS9AGdZF8JaJgF4XGcPXpSvGhfMaj99fZFHHHpBj8r1zqZ5doTtcGqd7gVVmeTKJXW+T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=i4DE1g+8; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6mgaMI7KGD4pS6alDlp2sBmddfdxQnXyO5MWUiHeyco=; b=i4DE1g+8ScfscRCh/k2xpefEJ1
	UI6NDd71UiLzgRKm73RURSRGirlStEveQZyNdvhDwPLgiPndLJHSalVwCXDqVZr/5Qa36qNmZoaS+
	mvsl1uV/+VuSTUZRgYTqVdxwSR2s10Q+ZCe2Ot7uv8b/rwOwkjHQVG6FmqT6glt1GhjmUXfklWmaY
	Z8IKLbkGMxb6S2e12kPGuUxYXNGlbPt/5MvEc4QyIlpYd4qb2roG8M+PuJD8M9bfWiycjNBbJIIom
	A4EAWlVRVSfPLDIRuFBowBCYP+UjXVpzP3Nzb+JVtcVLZz4TiNzlP8HfFhDWMmhfokDqmHwF0aBpY
	wuxjfvYA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39068 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1uRqEt-0006In-02;
	Wed, 18 Jun 2025 11:41:55 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1uRqEE-004c7M-Go; Wed, 18 Jun 2025 11:41:14 +0100
In-Reply-To: <aFKXzlno7HkG-cNh@shell.armlinux.org.uk>
References: <aFKXzlno7HkG-cNh@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 2/2] net: stmmac: loongson1: get ls1b resource only
 once
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1uRqEE-004c7M-Go@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Wed, 18 Jun 2025 11:41:14 +0100

ls1b_dwmac_syscon_init() was getting the stmmac iomem resource to detect
which GMAC block is being used. Move this to a separate setup() function
that only runs at probe time, so it can sensibly behave with an
unrecognised resource adress. Use this to set a MAC index (id) which is
then used in place of testing the base address.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-loongson1.c | 49 ++++++++++++++-----
 1 file changed, 37 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
index 78d9540be10c..32b5d1492e2e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
@@ -44,28 +44,50 @@
 struct ls1x_dwmac {
 	struct plat_stmmacenet_data *plat_dat;
 	struct regmap *regmap;
+	unsigned int id;
 };
 
 struct ls1x_data {
+	int (*setup)(struct platform_device *pdev,
+		     struct plat_stmmacenet_data *plat_dat);
 	int (*init)(struct platform_device *pdev, void *bsp_priv);
 };
 
-static int ls1b_dwmac_syscon_init(struct platform_device *pdev, void *priv)
+static int ls1b_dwmac_setup(struct platform_device *pdev,
+			    struct plat_stmmacenet_data *plat_dat)
 {
-	struct ls1x_dwmac *dwmac = priv;
-	struct plat_stmmacenet_data *plat = dwmac->plat_dat;
-	struct regmap *regmap = dwmac->regmap;
+	struct ls1x_dwmac *dwmac = plat_dat->bsp_priv;
 	struct resource *res;
-	unsigned long reg_base;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
+		/* This shouldn't fail - stmmac_get_platform_resources()
+		 * already mapped this resource.
+		 */
 		dev_err(&pdev->dev, "Could not get IO_MEM resources\n");
 		return -EINVAL;
 	}
-	reg_base = (unsigned long)res->start;
 
-	if (reg_base == LS1B_GMAC0_BASE) {
+	if (res->start == LS1B_GMAC0_BASE) {
+		dwmac->id = 0;
+	} else if (res->start == LS1B_GMAC1_BASE) {
+		dwmac->id = 1;
+	} else {
+		dev_err(&pdev->dev, "Invalid Ethernet MAC base address %pR",
+			res);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int ls1b_dwmac_syscon_init(struct platform_device *pdev, void *priv)
+{
+	struct ls1x_dwmac *dwmac = priv;
+	struct plat_stmmacenet_data *plat = dwmac->plat_dat;
+	struct regmap *regmap = dwmac->regmap;
+
+	if (dwmac->id == 0) {
 		switch (plat->phy_interface) {
 		case PHY_INTERFACE_MODE_RGMII_ID:
 			regmap_update_bits(regmap, LS1X_SYSCON0,
@@ -84,7 +106,7 @@ static int ls1b_dwmac_syscon_init(struct platform_device *pdev, void *priv)
 		}
 
 		regmap_update_bits(regmap, LS1X_SYSCON0, GMAC0_SHUT, 0);
-	} else if (reg_base == LS1B_GMAC1_BASE) {
+	} else if (dwmac->id == 1) {
 		regmap_update_bits(regmap, LS1X_SYSCON0,
 				   GMAC1_USE_UART1 | GMAC1_USE_UART0,
 				   GMAC1_USE_UART1 | GMAC1_USE_UART0);
@@ -108,10 +130,6 @@ static int ls1b_dwmac_syscon_init(struct platform_device *pdev, void *priv)
 		}
 
 		regmap_update_bits(regmap, LS1X_SYSCON1, GMAC1_SHUT, 0);
-	} else {
-		dev_err(&pdev->dev, "Invalid Ethernet MAC base address %lx",
-			reg_base);
-		return -EINVAL;
 	}
 
 	return 0;
@@ -183,10 +201,17 @@ static int ls1x_dwmac_probe(struct platform_device *pdev)
 	dwmac->plat_dat = plat_dat;
 	dwmac->regmap = regmap;
 
+	if (data->setup) {
+		ret = data->setup(pdev, plat_dat);
+		if (ret)
+			return ret;
+	}
+
 	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
 }
 
 static const struct ls1x_data ls1b_dwmac_data = {
+	.setup = ls1b_dwmac_setup,
 	.init = ls1b_dwmac_syscon_init,
 };
 
-- 
2.30.2


