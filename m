Return-Path: <linux-mips+bounces-12147-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC5EC42909
	for <lists+linux-mips@lfdr.de>; Sat, 08 Nov 2025 08:58:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6F1E54E0432
	for <lists+linux-mips@lfdr.de>; Sat,  8 Nov 2025 07:58:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 796BD28B407;
	Sat,  8 Nov 2025 07:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="Rv2wxtoh"
X-Original-To: linux-mips@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68C24A07;
	Sat,  8 Nov 2025 07:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762588722; cv=none; b=X0XEdnH9X2jriM+JF811bdsFhD6rwINPx7h8YsH0/PXexhtvbXfh6ZlfalRKQt7PQsWpW9GiRRFq+mkgjaIPGFwcvwfDCY6DukVazLNlxZi5HdrsXg4RaijnVGfq0lgfEX55n1B/hP4MhzPq21V+UbnbJkQxP9Z0otMu9jdJZ3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762588722; c=relaxed/simple;
	bh=ZXBkkkwvzKwb/Ha1NZvhSVCO6KAj+CY5jBPvpesBOwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ASxRmxQyYhJIqRiKwzIkNAHRnlk57J5U7lFjGFE0Nv0MUfF3NQ+Ni+necWFwbDgyKjS6tf+kONond9s/HbB0bPQ16sQsZSMYmhe6Jzz9ctUfz4VgUH7NrJgCmNg314EVVenDW/+Y2Q+KStMow1DA9W+Xw81XVeqja+iDzqdN340=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=Rv2wxtoh; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=13csuvQtsJof1dOcx8aG6Jr6ZCLtdjpsnRWnJo51I84=; b=Rv2wxtohwqYJPfuCefjstYazhS
	J7sVL69bsh133ujRSUUL9rrB0a/kzxTXGGikUf2yKLeg7SmIMIT8UuJNoKhzCvfyGAAWz5Pe+EeEm
	h2Q3xUXo+zHXfnRbj7Qyw+yNd1OHpPxkgHGUi0HVF6jlGu4p8MUsSzzkzdi1BfcZ8nJ49iFCq6/se
	ZFmURo5WkmDkDgxbjYGaHpgr5UnQva3gNUyY8WgIrCVrLxhKy+ZdWv2qrhTCFKDvav2VUb6zLH+VB
	pr2JJLW3b4SiifkY32GzQxiS7P334PO84sQOHxisN0vvi52hhb/G8h9REWWVIxAKPkvD8a139wNRt
	Mb4K10Ng==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41096)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vHdq8-000000007Vz-3J1j;
	Sat, 08 Nov 2025 07:58:28 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vHdpz-000000008Nb-48sV;
	Sat, 08 Nov 2025 07:58:20 +0000
Date: Sat, 8 Nov 2025 07:58:19 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
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
	linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 16/16] net: stmmac: visconti: use
 stmmac_get_phy_intf_sel()
Message-ID: <aQ74G_WqoAusC2wd@shell.armlinux.org.uk>
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
 <E1vHNSq-0000000DkTN-3RoV@rmk-PC.armlinux.org.uk>
 <14f80863-5766-437a-8e38-8991a1a725f9@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14f80863-5766-437a-8e38-8991a1a725f9@bootlin.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Fri, Nov 07, 2025 at 07:23:26PM +0100, Maxime Chevallier wrote:
> Hi Russell,
> 
> On 07/11/2025 15:29, Russell King (Oracle) wrote:
> > -	switch (plat_dat->phy_interface) {
> > -	case PHY_INTERFACE_MODE_RGMII:
> > -	case PHY_INTERFACE_MODE_RGMII_ID:
> > -	case PHY_INTERFACE_MODE_RGMII_RXID:
> > -	case PHY_INTERFACE_MODE_RGMII_TXID:
> > -		phy_intf_sel = ETHER_CONFIG_INTF_RGMII;
> > -		break;
> > -	case PHY_INTERFACE_MODE_MII:
> > -		phy_intf_sel = ETHER_CONFIG_INTF_MII;
> > -		break;
> > -	case PHY_INTERFACE_MODE_RMII:
> > -		phy_intf_sel = ETHER_CONFIG_INTF_RMII;
> > -		break;
> > -	default:
> > +	int phy_intf_sel;
> > +
> > +	phy_intf_sel = stmmac_get_phy_intf_sel(plat_dat->phy_interface);
> > +	if (phy_intf_sel != PHY_INTF_SEL_GMII_MII &&
> > +	    phy_intf_sel != PHY_INTF_SEL_RGMII &&
> > +	    phy_intf_sel != PHY_INTF_SEL_RMII) {
> >  		dev_err(&pdev->dev, "Unsupported phy-mode (%d)\n", plat_dat->phy_interface);
> >  		return -EOPNOTSUPP;
> >  	}
> 
> Probably not too big of a deal, but don't we now incorrectly accept the
> "gmii" mode ?

We will accept GMII mode, but (a) does that matter, and (b) shouldn't
the DT binding be checking the phy-mode (we have some bindings that do.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

