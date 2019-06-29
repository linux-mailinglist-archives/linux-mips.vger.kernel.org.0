Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7B2D5AD25
	for <lists+linux-mips@lfdr.de>; Sat, 29 Jun 2019 21:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbfF2Teh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 29 Jun 2019 15:34:37 -0400
Received: from mail-yb1-f195.google.com ([209.85.219.195]:45875 "EHLO
        mail-yb1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726909AbfF2Teh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 29 Jun 2019 15:34:37 -0400
Received: by mail-yb1-f195.google.com with SMTP id j133so1390187ybj.12
        for <linux-mips@vger.kernel.org>; Sat, 29 Jun 2019 12:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TrEAkRNd58OxQm438HJ/LWyeqxT458dpIIN9rnAAj1U=;
        b=HFHXV38GwofcAY4vLufShERlXUE5rVUMWzsssyqAnf0TGWxiz1zoetJzFqA0bstvbL
         AU0mOgyXmRgYKWklGPZcp6I3oEkTvzO4rBRpwHqzyG8WuXzhuKX4mizCX9zqbnPS5MOZ
         T2tb0XGFjnhBKrDXR+37mvesIMo8lpJUcL9dUz8C9J9DyYqu+EguGocJFOnGzRIGrJOf
         c0jV99HS4ygDUN07KVog9GTaPnlucLiqO7JkYzfGFh/SCaftOgacj8FofJ/2c1gAn/fI
         wh9SNlrIJtYIpuC9U+pSi8j5OqpG5TaDp3eOICbaZr8rLis5//S33c7cSkvzYykqeZmR
         5PNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TrEAkRNd58OxQm438HJ/LWyeqxT458dpIIN9rnAAj1U=;
        b=VeWMzDUpy9CPoKzab/EEEJZqpO6YiH2bGw+QlN2NFk4ULXKm0EqzdSghC1yK2kZ6JZ
         8NmuIqKKJraWk/VYPshXwQqT4oZmIq6z6UxUJHwGmhI683aZmnjLDLHkZyol8H16BA1R
         xu8YilZJ/OygCKvWBp1Gmv4CgyxG32O9ussqfHYPmzNYBZrFD02M5QSykjma4BNopcWq
         DjG/aN+w5qgFaNGxLGocEl2XO8IwLIBENy8cxPzbKfKGZs6hIPWK6+PyIlRFTza4M6ZF
         lgTIpI20dPRNAxnaxuNP/F8KtRVKHzBIjGp3LQ/bQ6N8q68a4XZFSJWp+7B1SoOBA/p3
         65Eg==
X-Gm-Message-State: APjAAAWqGNscOuCgpk7G+MP67xUGodHkZC7cn1gcTLICghBN8/3iE2Uq
        Ec1rMVUv0AWdyuD/zEin5P7UU6a2
X-Google-Smtp-Source: APXvYqzRiSRA0T4W+O6+G2DG6W6ZneN9eLVL1bJJr+1jHQTST8O6iis8j6AaUI0CKoO/xvoJSbbECA==
X-Received: by 2002:a25:7901:: with SMTP id u1mr10207281ybc.209.1561836875693;
        Sat, 29 Jun 2019 12:34:35 -0700 (PDT)
Received: from mail-yw1-f45.google.com (mail-yw1-f45.google.com. [209.85.161.45])
        by smtp.gmail.com with ESMTPSA id g189sm1529894ywa.20.2019.06.29.12.34.34
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Sat, 29 Jun 2019 12:34:34 -0700 (PDT)
Received: by mail-yw1-f45.google.com with SMTP id n127so3281436ywd.9
        for <linux-mips@vger.kernel.org>; Sat, 29 Jun 2019 12:34:34 -0700 (PDT)
X-Received: by 2002:a81:4807:: with SMTP id v7mr8813316ywa.494.1561836873634;
 Sat, 29 Jun 2019 12:34:33 -0700 (PDT)
MIME-Version: 1.0
References: <20190629122419.19026-1-opensource@vdorst.com>
In-Reply-To: <20190629122419.19026-1-opensource@vdorst.com>
From:   Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date:   Sat, 29 Jun 2019 15:33:57 -0400
X-Gmail-Original-Message-ID: <CA+FuTSdr8HCRJTE8pEVxsga3N-xx-fEAxzKAAyPFWH6doVRHbQ@mail.gmail.com>
Message-ID: <CA+FuTSdr8HCRJTE8pEVxsga3N-xx-fEAxzKAAyPFWH6doVRHbQ@mail.gmail.com>
Subject: Re: [PATCH] net: ethernet: mediatek: Fix overlapping capability bits.
To:     =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>
Cc:     sean.wang@mediatek.com, f.fainelli@gmail.com,
        linux@armlinux.org.uk, David Miller <davem@davemloft.net>,
        matthias.bgg@gmail.com, andrew@lunn.ch, vivien.didelot@gmail.com,
        frank-w@public-files.de,
        Network Development <netdev@vger.kernel.org>,
        linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Jun 29, 2019 at 8:24 AM Ren=C3=A9 van Dorst <opensource@vdorst.com>=
 wrote:
>
> Both MTK_TRGMII_MT7621_CLK and MTK_PATH_BIT are defined as bit 10.
>
> This causes issues on non-MT7621 devices which has the
> MTK_PATH_BIT(MTK_ETH_PATH_GMAC1_RGMII) capability set.
> The wrong TRGMII setup code is executed.
>
> Moving the MTK_PATH_BIT to bit 11 fixes the issue.
>
> Fixes: 8efaa653a8a5 ("net: ethernet: mediatek: Add MT7621 TRGMII mode
> support")
> Signed-off-by: Ren=C3=A9 van Dorst <opensource@vdorst.com>

This targets net? Please mark networking patches [PATCH net] or [PATCH
net-next].

> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/et=
hernet/mediatek/mtk_eth_soc.h
> index 876ce6798709..2cb8a915731c 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> @@ -626,7 +626,7 @@ enum mtk_eth_path {
>  #define MTK_TRGMII_MT7621_CLK          BIT(10)
>
>  /* Supported path present on SoCs */
> -#define MTK_PATH_BIT(x)         BIT((x) + 10)
>
> +#define MTK_PATH_BIT(x)         BIT((x) + 11)
>

To avoid this happening again, perhaps make the reserved range more explici=
t?

For instance

#define MTK_FIXED_BIT_LAST 10
#define MTK_TRGMII_MT7621_CLK  BIT(MTK_FIXED_BIT_LAST)

#define MTK_PATH_BIT_FIRST  (MTK_FIXED_BIT_LAST + 1)
#define MTK_PATH_BIT_LAST (MTK_FIXED_BIT_LAST + 7)
#define MTK_MUX_BIT_FIRST (MTK_PATH_BIT_LAST + 1)

Though I imagine there are cleaner approaches. Perhaps define all
fields as enum instead of just mtk_eth_mux and mtk_eth_path. Then
there can be no accidental collision.
