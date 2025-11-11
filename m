Return-Path: <linux-mips+bounces-12179-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F96C4C539
	for <lists+linux-mips@lfdr.de>; Tue, 11 Nov 2025 09:16:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B43D14F552B
	for <lists+linux-mips@lfdr.de>; Tue, 11 Nov 2025 08:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA73E2F5479;
	Tue, 11 Nov 2025 08:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="XKIEJh58"
X-Original-To: linux-mips@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF5C2BE051;
	Tue, 11 Nov 2025 08:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762848725; cv=none; b=KkHpl6dIPJyjM2bE1wmVFoZ2rSNjgm99YG89DVxC8DxNLbP7FmiTgGqLIc+AzCC+1MGbSNe7RVu/qpZgQIVoPL4OiKnErcJLWHObgXBR1i9CKZGb/S8uT1+sIrK5rqslm7l3+lVoO2KstmU7D5/UxMZU3qA36ZiV3S/wTw8MxHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762848725; c=relaxed/simple;
	bh=MIi8PfLZASkUCPzQH1RsvuxhvEJW2ax7JW64yaW891Q=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=Aoho1ragOQVeuDNL9pbm9zbAMx0pvil8WF9LRYMZBMOsnY2DPNe2o1+XIcB7Md0eF+6uzd/PURGCpCsC4iwtofPMYiNY2xU3/QHXln7joph8w/j5HmCm7z6JL+ZDyd5B6TuKI2RcE8gTBtL5h2CrYRpmi1F2MFDmgI74xURrQY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=XKIEJh58; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bzAz2OSqG2eLqXJWaxdsurWbDprdWOWwtQP4/q9dLmg=; b=XKIEJh58qiAfVHoZ6znBkdHuWB
	mIbZAiAZ307xxV7aF2oZI9sXnDRpDnJusSOAiXOhaAWr724+06CpmJZZNbir/TX+mBgNoXSkhOU64
	Jv4qR9TJL/kDoN46BWs1qqV9fIlQ6pAyG3lEQMhZHeXGZwpaFA2QHPQaWFqF1Ojpr15uS6MRHHlPt
	XLznOKk3oo3HkOG99rJsRMq/bVPWOKpR+sTvrL/RI4rJOZVSoOYsIMGQXRu9MDGvsWM0ui8zi471E
	MFkK7jG/7btiVO+V0bOWVKsyZYGulUQGbmHF0PBH77l90VcOsf158gVa1s3cnVyv7iX6HbbGJqhYa
	wNt2rZrw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56896 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vIjTl-0000000029i-1F95;
	Tue, 11 Nov 2025 08:11:53 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vIjTk-0000000Dqt6-1gN9;
	Tue, 11 Nov 2025 08:11:52 +0000
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
Subject: [PATCH net-next v2 02/13] net: stmmac: loongson1: use PHY_INTF_SEL_x
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
Message-Id: <E1vIjTk-0000000Dqt6-1gN9@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Tue, 11 Nov 2025 08:11:52 +0000

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


