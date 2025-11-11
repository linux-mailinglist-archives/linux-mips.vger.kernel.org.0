Return-Path: <linux-mips+bounces-12180-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F202C4C55E
	for <lists+linux-mips@lfdr.de>; Tue, 11 Nov 2025 09:18:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80ADA3A4399
	for <lists+linux-mips@lfdr.de>; Tue, 11 Nov 2025 08:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D6BA2D7398;
	Tue, 11 Nov 2025 08:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="Nhv1qS7i"
X-Original-To: linux-mips@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9220A18C008;
	Tue, 11 Nov 2025 08:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762848732; cv=none; b=rPJh4NIisRZ2V9S2u0+sdtGg+xEnP4aVmrRbsMrJsGrdgJ1yLJJ46MASx2OlqnqT0uvC3uEus+UMPwxX5K1gzOrQh7g8peaJN539qGMlKYULPAwU1LtrbbSL28FtGUsNjfvvSANrSfk7UH0fkehiAf96ngg6bf8zBtSryovS9DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762848732; c=relaxed/simple;
	bh=ZwqN7biJztbhxZ6kKNHj1TcmVUm5q9RD6WSSJNO1sbI=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=oCSNG9/H3/aYtBytZ77pUtQShlT1lJHRm/f/kO3o6+je7RAIoVzDqcrXfTGH9KJ3qaL7JlgNnlohp2zfSg4R4jjxh1LH+ogFDBnR5jyBMTcptqnWbgwFF0/p5WLYIWBLWIl0in16XANaMJyW+0tPHY1+rETiax9Pphro4/8KOVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=Nhv1qS7i; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Vidd5Mwuud0O74OKZ9sShwKBhSuUdh8tZ63bfpDXEkw=; b=Nhv1qS7iyrCJh4QAbtgUFQ+jMt
	+OtyvyZDuNkK9jULhYYhPxsG88mAcsl8xBkJCWMBkVQFAgHjNPHWi3yzKkBdNYb8pQAD2zPuU6fXs
	WhQuIRmGnj0uLEie84/VoIZYQ7lt6kP+cee8mTVAuRBZ64RgiqAlPLP9HGZ2ORjHeTk4/qHw4eSI+
	nagqoLhCZvR/hom91aVbfoCju2MP2gWA8jwh7IvCDlLmyE8rErsDKnmFRdwmW009KuJQGuy85eWmb
	+kFIaVl85LqXvmB0KM5gsGzo9xWL6RT9PNWRyFAuv1o8hMT7z/y+KWIjQ+ysdmbIPzq+4FRtIlI33
	c1gc94Yg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:56912 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vIjTq-0000000029x-3ADd;
	Tue, 11 Nov 2025 08:11:58 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vIjTp-0000000DqtC-2DmI;
	Tue, 11 Nov 2025 08:11:57 +0000
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
Subject: [PATCH net-next v2 03/13] net: stmmac: loongson1: use
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
Message-Id: <E1vIjTp-0000000DqtC-2DmI@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Tue, 11 Nov 2025 08:11:57 +0000

Use stmmac_get_phy_intf_sel() to decode the PHY interface mode to the
phy_intf_sel value, validate the result and use that to set the
control register to select the operating mode for the DWMAC core.

Note that this will allow GMII as well as MII as the phy_intf_sel
value is the same for both.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
index 5f9f66fbc191..894ee66f5c9b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
@@ -140,14 +140,9 @@ static int ls1c_dwmac_syscon_init(struct platform_device *pdev, void *priv)
 	struct regmap *regmap = dwmac->regmap;
 	int phy_intf_sel;
 
-	switch (plat->phy_interface) {
-	case PHY_INTERFACE_MODE_MII:
-		phy_intf_sel = PHY_INTF_SEL_GMII_MII;
-		break;
-	case PHY_INTERFACE_MODE_RMII:
-		phy_intf_sel = PHY_INTF_SEL_RMII;
-		break;
-	default:
+	phy_intf_sel = stmmac_get_phy_intf_sel(plat->phy_interface);
+	if (phy_intf_sel != PHY_INTF_SEL_GMII_MII &&
+	    phy_intf_sel != PHY_INTF_SEL_RMII) {
 		dev_err(&pdev->dev, "Unsupported PHY-mode %u\n",
 			plat->phy_interface);
 		return -EOPNOTSUPP;
-- 
2.47.3


