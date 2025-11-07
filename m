Return-Path: <linux-mips+bounces-12135-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AECC40B90
	for <lists+linux-mips@lfdr.de>; Fri, 07 Nov 2025 17:00:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5055D188A3D0
	for <lists+linux-mips@lfdr.de>; Fri,  7 Nov 2025 16:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21BAE1DE8AE;
	Fri,  7 Nov 2025 16:00:41 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4A214A8E
	for <linux-mips@vger.kernel.org>; Fri,  7 Nov 2025 16:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762531241; cv=none; b=W+j9SVsmCpcaPClJyp1XA/A1h589LpSdCxAIJpHBSScM+OzDsbi207RDtUsy/BEnFwYhl3JOuIakmdMkwZEHgh4tr48jXankXxyKOCjAwqNfjHCDb9T4s7x52oJkkLY/vtoUjC02wiRenYsuNNQhA1u3T3fmj93FMnGGxYAWRYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762531241; c=relaxed/simple;
	bh=HBO7bY++Cw1AAbrVGM7hvvjXfFReX0nppGgu3qKCSCE=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SP/ACI/T4zdGU2GwsfDcYBKjF1Qd+TaS6YR6Jipy1GzwkUjnMXLBiQm3kRZ0vCjZQwuvkUR/xxfAUVq2LRKtYmSk3jg4Y3G7yY4qcNVlq8H2ZtUwMjRShjftyfgPjjonSG8KapM39EVyUWvniLXBk0hCoawI36iPWOoHdgMbfBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=esmil.dk; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=esmil.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b72b495aa81so100242966b.2
        for <linux-mips@vger.kernel.org>; Fri, 07 Nov 2025 08:00:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762531236; x=1763136036;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wkBMuEFYniV7o/NZEZ9uUf/PpOYiog+if+0C8Zohm+8=;
        b=IlSO4VKLj8XGr6fhl0dXzbN4Ib/1Z42k2jZRlTL8w4J6hjxDFdhf7Y3gMwQxq04OlX
         4MGDgie9OXJh5pcYI7/xIa7R8ToDQ/cst8Yo4cIP99njYkNnvhvXPuoT38so04ZELOPV
         CoPDHNwLF4bAt3ainviJr5fZO9LOxdeSnaGvUEzWiDvAOnrzXjapKZD1d4PPrsmtXTZ0
         fazfao8wSIUIzplwoAiRy9r4vhmyvarKPg/RyUBIHkJuEHWXNrMVl/5wGfBaugdWQqZZ
         VrLrDrSwft1cGvqp8Liz27wS7HpMF27ovuNB/MJXYtmX1tDuJ+ze7ivOl6wppPYqH4Pt
         oxVw==
X-Forwarded-Encrypted: i=1; AJvYcCXEmMMoEP/OdokZ88dLtBCf286qgmZYq8QoAhLbauG0uEnLz8hD7LvTNGh6gFX00ODyeUc3d3FtZO1s@vger.kernel.org
X-Gm-Message-State: AOJu0YzwZVH92vRdqbndGkTWEy68g/GHMcN72WiDEQK6R4Witic77DxA
	5cDvcPc26aI35qI4YF/x1wKBxK10/NohKPiJeMuOjePSnxxG/8kN8ctvIhFKUtEdvlMuwcakith
	f+CujQgGx0Tx+QOtl2qGs/n/wElalZzg=
X-Gm-Gg: ASbGnctc/SIbclTHNHOXgpodNqP+ZR825wV8aYStH/mJwvs3nr6T9GVfMUYHs4Mmj/7
	oJ9/93MrozePpLjYC82J/XVeI3SqAtznyn55g9Xvs4jfLL/KvIsHR1tG54MQ/zvVe7exfYicm+4
	ief6laDHun+/QdI7Qtpins2mqRWM4iQdoZTBCjz+NLeyBNffrVZSPEEWhEorkTDtIiwc5QoMfUm
	1eg7PfOV8C/zXVrAerO6n10TfHN1m/+P912q/RF7+JfRHUsBWFe3WtlPNFJLz0s3Gwfl3oyhAuL
	FUCiaAWBkJKRH9k6HA==
X-Google-Smtp-Source: AGHT+IFOoHBXH/PzewtzvKKUtM610X3TQ1SmT9FLvQyuUDuxyBy4OLhIMpEqweiHRkcJBKlSnsBceRB/zJjkJgVr+9A=
X-Received: by 2002:a17:906:f582:b0:b70:a9fd:1170 with SMTP id
 a640c23a62f3a-b72c0eef5bfmr340953066b.65.1762531236039; Fri, 07 Nov 2025
 08:00:36 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 7 Nov 2025 11:00:35 -0500
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 7 Nov 2025 11:00:35 -0500
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <E1vHNSR-0000000DkSt-0wDu@rmk-PC.armlinux.org.uk>
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk> <E1vHNSR-0000000DkSt-0wDu@rmk-PC.armlinux.org.uk>
From: Emil Renner Berthing <kernel@esmil.dk>
User-Agent: alot/0.0.0
Date: Fri, 7 Nov 2025 11:00:35 -0500
X-Gm-Features: AWmQ_bnSZQW08h0NXQTG6zSRGIlnDRSY70b9JlHXkxjmDNLgOFrMa4uAbMmEPzM
Message-ID: <CANBLGczzW+kjvSqYm5YVt+2sdLtgyZfa=fhsU1Q-nUjSVvB4cw@mail.gmail.com>
Subject: Re: [PATCH net-next 11/16] net: stmmac: starfive: use stmmac_get_phy_intf_sel()
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Minda Chen <minda.chen@starfivetech.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	netdev@vger.kernel.org, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Quoting Russell King (Oracle) (2025-11-07 15:28:55)
> Use stmmac_get_phy_intf_sel() to decode the PHY interface mode to the
> phy_intf_sel value, validate the result and use that to set the
> control register to select the operating mode for the DWMAC core.
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-starfive.c  | 22 +++++--------------
>  1 file changed, 6 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> index 1ef72576c6f1..00078b7a6486 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> @@ -35,25 +35,15 @@ static int starfive_dwmac_set_mode(struct plat_stmmacenet_data *plat_dat)
>         struct starfive_dwmac *dwmac = plat_dat->bsp_priv;
>         struct regmap *regmap;
>         unsigned int args[2];
> -       unsigned int mode;
> +       int phy_intf_sel;
>         int err;
>
> -       switch (plat_dat->phy_interface) {
> -       case PHY_INTERFACE_MODE_RMII:
> -               mode = STARFIVE_DWMAC_PHY_INFT_RMII;
> -               break;
> -
> -       case PHY_INTERFACE_MODE_RGMII:
> -       case PHY_INTERFACE_MODE_RGMII_ID:
> -       case PHY_INTERFACE_MODE_RGMII_RXID:
> -       case PHY_INTERFACE_MODE_RGMII_TXID:
> -               mode = STARFIVE_DWMAC_PHY_INFT_RGMII;
> -               break;

After these two patches the STARFIVE_DWMAC_PHY_INFT_RMII and ..RGMII macros are
left unused. Maybe just squash the patches and remove the definitions?

/Emil

