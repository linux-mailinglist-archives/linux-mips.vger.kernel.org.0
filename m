Return-Path: <linux-mips+bounces-9414-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BD7ADFD3F
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 07:50:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 443A47A9E96
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 05:49:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E5A5242D86;
	Thu, 19 Jun 2025 05:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dEut0Z4c"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB0E1D555;
	Thu, 19 Jun 2025 05:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750312217; cv=none; b=Ry3neGDZHUU9K4Suu7nOSusv5lHHv87j/4TzE5iGSeh1AyiDC5zBt6UfHFopVdGSayPUz7qunOkvjri5jr8anASziyQsdgsbi3CSNyg6qN6HbX7LhqavRkSxySAQVvlnAqBcHkNRr1W2xwanlZz07zE0M5m8cB2tHra3M3Lalc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750312217; c=relaxed/simple;
	bh=efcmd7RM8amVsXZiF1SEV/BmXYRAZ52mHFeAyGVChBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZDMveg4Qzbcl6sZMsmZlLjKCjVIONSZNZYvWlywOyNRe5fY5hupithq8X/6DKtOdwclsr3Pt/RMt0kMVKYPXb4DFBltji+yPpHUL4uTSlDDkPqSgeMoneeMghLrMF5dcO/PUMJmqO6Om+DZWzBT7xkL7o43x8URCxG1+pI+8/Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dEut0Z4c; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32b5226e6beso3853231fa.2;
        Wed, 18 Jun 2025 22:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750312213; x=1750917013; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BeKhFuW8a8z8HnsNlzPjiV9UXGhduJL1UPZRBcRr5iA=;
        b=dEut0Z4cq4MYTJFFwaXdRh7z+7qm9fC47jgCTAzaDDTpt/jxfn9Xa4xToemN/aq908
         uyhkRpH4hEiusoxbglvBjNXEhefxT4ReXkHRgVawFZS1PVRWL1BZKzk7GbFCixcDLbZO
         m0Y2ThRasX2sxaQiKHwXwCe6GqPr8BELsRkyC91hXyRZP3+plJvKIFlFmAoK4VlRzwJU
         M68LenntE4xuHHlTVb4UmPdmeuNiboI1u0m49Oxlm2zQIkXWsiafS8wFv0tne36t74+X
         kMPl+vpzM+FJwrHhIPaW+Udzt/J/F23tRiosYVZfXhHNvqUzqLbIiRoVwCPYy00DclVj
         6EqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750312213; x=1750917013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BeKhFuW8a8z8HnsNlzPjiV9UXGhduJL1UPZRBcRr5iA=;
        b=dKAu8RBOgChu+zC4vjr0kzFGuRQ+YGh8QkI85l3UbMEPTW158FjgXT/MELx4Rsu0oZ
         JCVlPC8IEJnvzDmveCi9MbcYGlYuqdHegW84NIQQXKuF/14TaUqOqZ9QAOtZq/EwmwgP
         444DHITet4+FiNZYk/45tC9G2b0PuBlAkhGv4iwPwJhFeNFHC0m7XAGmJF58KSOaSsSj
         NPVuaBeoF+5XDuSbcI9kIeAC2t4oJwPwB955loDEQZ07rknByPX9EMIfj1OvXvG0wnxp
         QKySpjZcguMjCnviCv/mjOp76fIUJQbnIEAMaSnWsVRsbENcg53YviXHowawL8AnVw9g
         jQpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCypxx0wz6iiylDfGJQUJs+MCCqGD6Lyjy4DMc85O5HY1zbLFx2G9fU1xyWEobW8zTZJY2H7jT@vger.kernel.org, AJvYcCWceY+7HaDmrg1PKL6Kx62/SOiXhTgLQN0zVbhfV+qmlAUzExB8M+CSzBsC34gspsljQhUceJzyHg08@vger.kernel.org
X-Gm-Message-State: AOJu0YyjhcFeWXzo2ckLCoU8JCVZzIbYY2fbXvpk63ll0Qp3gULhu3IX
	IrWElTSrQYMv+6WgFF/z32DPz0qmkrMAYCyuNAcBFtNxZc0cbF+UITUowWDFNhgN+6EQ6p1IuTx
	GtKwS1D7uq4hGmrFuR7aG9tJUHMARcgU=
X-Gm-Gg: ASbGnctZE9LAzbvePTmvpQTYoD8D5Wa08umdDWBdQxGg0HePF43j6dF3C6g9HEwIsYw
	beXRm272lHWJgctj3b6nkyLrKcuLwMKj3vgQnnnWrucTnFmcoG5xADeGlkGlxMoitKOznVh9Atz
	Gwt2nd4eGBW+9Vf3s3IfEsKi5sVhdHcc8g0IOFBEfpLc5KJA8axgEUnz8=
X-Google-Smtp-Source: AGHT+IEk0wCV2litekKJtCgKUf/bVLVWIXtsnBIXZlbey14EA0xVCtKFOE994VdvXguOsTJDJDzKHTC0HOYQikdby68=
X-Received: by 2002:a2e:a9a6:0:b0:32a:7332:bf7a with SMTP id
 38308e7fff4ca-32b4a2dab37mr55175051fa.13.1750312213374; Wed, 18 Jun 2025
 22:50:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aFKXzlno7HkG-cNh@shell.armlinux.org.uk> <E1uRqEE-004c7M-Go@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1uRqEE-004c7M-Go@rmk-PC.armlinux.org.uk>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Thu, 19 Jun 2025 13:49:36 +0800
X-Gm-Features: Ac12FXwPd1YGJO7PxhRou6waOopKJzetREi64C09608AmKe9oHFc2z42ZdWqLG4
Message-ID: <CAJhJPsVoz67Yv2pty=WPMHeOq28yqq5u2VBoZwGMhUAtpNbgcg@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] net: stmmac: loongson1: get ls1b resource
 only once
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, 
	Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Keguang Zhang <keguang.zhang@gmail.com>
Tested-by: Keguang Zhang <keguang.zhang@gmail.com> # on LS1B & LS1C

On Wed, Jun 18, 2025 at 6:42=E2=80=AFPM Russell King (Oracle)
<rmk+kernel@armlinux.org.uk> wrote:
>
> ls1b_dwmac_syscon_init() was getting the stmmac iomem resource to detect
> which GMAC block is being used. Move this to a separate setup() function
> that only runs at probe time, so it can sensibly behave with an
> unrecognised resource adress. Use this to set a MAC index (id) which is
> then used in place of testing the base address.
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-loongson1.c | 49 ++++++++++++++-----
>  1 file changed, 37 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c b/driv=
ers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> index 78d9540be10c..32b5d1492e2e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> @@ -44,28 +44,50 @@
>  struct ls1x_dwmac {
>         struct plat_stmmacenet_data *plat_dat;
>         struct regmap *regmap;
> +       unsigned int id;
>  };
>
>  struct ls1x_data {
> +       int (*setup)(struct platform_device *pdev,
> +                    struct plat_stmmacenet_data *plat_dat);
>         int (*init)(struct platform_device *pdev, void *bsp_priv);
>  };
>
> -static int ls1b_dwmac_syscon_init(struct platform_device *pdev, void *pr=
iv)
> +static int ls1b_dwmac_setup(struct platform_device *pdev,
> +                           struct plat_stmmacenet_data *plat_dat)
>  {
> -       struct ls1x_dwmac *dwmac =3D priv;
> -       struct plat_stmmacenet_data *plat =3D dwmac->plat_dat;
> -       struct regmap *regmap =3D dwmac->regmap;
> +       struct ls1x_dwmac *dwmac =3D plat_dat->bsp_priv;
>         struct resource *res;
> -       unsigned long reg_base;
>
>         res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>         if (!res) {
> +               /* This shouldn't fail - stmmac_get_platform_resources()
> +                * already mapped this resource.
> +                */
>                 dev_err(&pdev->dev, "Could not get IO_MEM resources\n");
>                 return -EINVAL;
>         }
> -       reg_base =3D (unsigned long)res->start;
>
> -       if (reg_base =3D=3D LS1B_GMAC0_BASE) {
> +       if (res->start =3D=3D LS1B_GMAC0_BASE) {
> +               dwmac->id =3D 0;
> +       } else if (res->start =3D=3D LS1B_GMAC1_BASE) {
> +               dwmac->id =3D 1;
> +       } else {
> +               dev_err(&pdev->dev, "Invalid Ethernet MAC base address %p=
R",
> +                       res);
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static int ls1b_dwmac_syscon_init(struct platform_device *pdev, void *pr=
iv)
> +{
> +       struct ls1x_dwmac *dwmac =3D priv;
> +       struct plat_stmmacenet_data *plat =3D dwmac->plat_dat;
> +       struct regmap *regmap =3D dwmac->regmap;
> +
> +       if (dwmac->id =3D=3D 0) {
>                 switch (plat->phy_interface) {
>                 case PHY_INTERFACE_MODE_RGMII_ID:
>                         regmap_update_bits(regmap, LS1X_SYSCON0,
> @@ -84,7 +106,7 @@ static int ls1b_dwmac_syscon_init(struct platform_devi=
ce *pdev, void *priv)
>                 }
>
>                 regmap_update_bits(regmap, LS1X_SYSCON0, GMAC0_SHUT, 0);
> -       } else if (reg_base =3D=3D LS1B_GMAC1_BASE) {
> +       } else if (dwmac->id =3D=3D 1) {
>                 regmap_update_bits(regmap, LS1X_SYSCON0,
>                                    GMAC1_USE_UART1 | GMAC1_USE_UART0,
>                                    GMAC1_USE_UART1 | GMAC1_USE_UART0);
> @@ -108,10 +130,6 @@ static int ls1b_dwmac_syscon_init(struct platform_de=
vice *pdev, void *priv)
>                 }
>
>                 regmap_update_bits(regmap, LS1X_SYSCON1, GMAC1_SHUT, 0);
> -       } else {
> -               dev_err(&pdev->dev, "Invalid Ethernet MAC base address %l=
x",
> -                       reg_base);
> -               return -EINVAL;
>         }
>
>         return 0;
> @@ -183,10 +201,17 @@ static int ls1x_dwmac_probe(struct platform_device =
*pdev)
>         dwmac->plat_dat =3D plat_dat;
>         dwmac->regmap =3D regmap;
>
> +       if (data->setup) {
> +               ret =3D data->setup(pdev, plat_dat);
> +               if (ret)
> +                       return ret;
> +       }
> +
>         return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
>  }
>
>  static const struct ls1x_data ls1b_dwmac_data =3D {
> +       .setup =3D ls1b_dwmac_setup,
>         .init =3D ls1b_dwmac_syscon_init,
>  };
>
> --
> 2.30.2
>


--=20
Best regards,

Keguang Zhang

