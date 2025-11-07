Return-Path: <linux-mips+bounces-12136-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B10C40C8D
	for <lists+linux-mips@lfdr.de>; Fri, 07 Nov 2025 17:10:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8A2774F368E
	for <lists+linux-mips@lfdr.de>; Fri,  7 Nov 2025 16:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9DCB2F362F;
	Fri,  7 Nov 2025 16:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="vn3cbOu+"
X-Original-To: linux-mips@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB41D2DAFBE;
	Fri,  7 Nov 2025 16:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762531759; cv=none; b=txfsWlyYR6L3YwY+Ek44gAV8kC1O2w6KYJ3/VNYzQaOGyWCzrb1hOF0B8FyqYqH6T/He5B0JKk3tU22GwuacO9qlnoHqmgaUFx20xXj/I9dWrCEO0YSkLlkMVgb+UvUUpSBZUUa/M7HW24nUK4L2vnkXZrsdPdseDSfBs04vJXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762531759; c=relaxed/simple;
	bh=fsY3NKKjdEAZnR/YNjwGYfIiYz3H855QFv+flLleryQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JGU6JfcNIxoAq9W5FvmX8WPRieo5qLDPCh9+TQmBO/1Nk37WYAe/M2MvQ2XgENPrU4xDywUtbwcTsaP0a76hizQ1ZutHoSvjZozhqeUnYPg49NO/waM/gRPI0h9cxFIdI4eryOlV+UVnaHZ4xLtXh3/fYUH6oBCfJl2ral4S6UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=vn3cbOu+; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fwpXxoU8iEmC+DaN7Cr9PGN8QVIi8rUJqHbS4C13YiQ=; b=vn3cbOu+GFQMbus8RTESyhk+QD
	l4MSz/4gSrLSWpMwTcHMS8POSDqXlYoqW6hd0IVlrkrHN0rw/yZ1S8tjbRotxVZckRVVD5aRb8bPB
	u2YW04OZjQkWBC/IllYfMqxS3Dir+tyGqw82YW/NF7mlLI684toDkm0bSBsVAcqCbYiV7/jxwioKY
	+/pe49r2zq2ujlFEiw4kOmyaMOLhRepjPkmnOJVla7Zg8W/csk11yTw9Aw59+2MoFRvcckO8KEMVM
	IwqMBuTNFDkx39IA961qvS8bRUtzUhe9fuWfVrlXNzSefV5rCz9+Bo9Qr7u3Tve04azN7os0yDbxA
	N0fCfdkQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:32908)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vHP1N-000000006sy-0WaB;
	Fri, 07 Nov 2025 16:09:05 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vHP1F-000000007hv-1jzX;
	Fri, 07 Nov 2025 16:08:57 +0000
Date: Fri, 7 Nov 2025 16:08:57 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
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
Subject: Re: [PATCH net-next 11/16] net: stmmac: starfive: use
 stmmac_get_phy_intf_sel()
Message-ID: <aQ4ZmXB_eFjKXgIv@shell.armlinux.org.uk>
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk>
 <E1vHNSR-0000000DkSt-0wDu@rmk-PC.armlinux.org.uk>
 <CANBLGczzW+kjvSqYm5YVt+2sdLtgyZfa=fhsU1Q-nUjSVvB4cw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANBLGczzW+kjvSqYm5YVt+2sdLtgyZfa=fhsU1Q-nUjSVvB4cw@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Fri, Nov 07, 2025 at 11:00:35AM -0500, Emil Renner Berthing wrote:
> Quoting Russell King (Oracle) (2025-11-07 15:28:55)
> > Use stmmac_get_phy_intf_sel() to decode the PHY interface mode to the
> > phy_intf_sel value, validate the result and use that to set the
> > control register to select the operating mode for the DWMAC core.
> >
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > ---
> >  .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 22 +++++--------------
> >  1 file changed, 6 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> > index 1ef72576c6f1..00078b7a6486 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> > @@ -35,25 +35,15 @@ static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
> >         struct starfive_dwmac *dwmac = plat_dat->bsp_priv;
> >         struct regmap *regmap;
> >         unsigned int args[2];
> > -       unsigned int mode;
> > +       int phy_intf_sel;
> >         int err;
> >
> > -       switch (plat_dat->phy_interface) {
> > -       case PHY_INTERFACE_MODE_RMII:
> > -               mode = STARFIVE_DWMAC_PHY_INFT_RMII;
> > -               break;
> > -
> > -       case PHY_INTERFACE_MODE_RGMII:
> > -       case PHY_INTERFACE_MODE_RGMII_ID:
> > -       case PHY_INTERFACE_MODE_RGMII_RXID:
> > -       case PHY_INTERFACE_MODE_RGMII_TXID:
> > -               mode = STARFIVE_DWMAC_PHY_INFT_RGMII;
> > -               break;
> 
> After these two patches the STARFIVE_DWMAC_PHY_INFT_RMII and ..RGMII macros are
> left unused.

Thanks, I'll remove them in this patch.

> Maybe just squash the patches and remove the definitions?

It's two logical changes, thus two patches. Reviewers find that this
makes it easier to review.

Given the number of platform glues that I'm modifying, I don't want
to change some of them using one big all encompassing patch and
others as a set of logical changes - that would be totally insane
to manage.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

