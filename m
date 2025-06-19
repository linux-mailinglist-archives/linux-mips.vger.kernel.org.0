Return-Path: <linux-mips+bounces-9413-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4949BADFD3C
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 07:49:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 621E63A3C2D
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 05:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 275C9374D1;
	Thu, 19 Jun 2025 05:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lJ9Tx5AU"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F931239E8D;
	Thu, 19 Jun 2025 05:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750312163; cv=none; b=Yo8oHJYOIW0JElhofecHNwphuN9d0L8Y1XcjOUjRkSJPiFy7r0DBH4sPgTikYj605wCXRNdc8v69LOaT/qZfZjC0Y21rB2+9e53UmBVBnzz150RsMsNii+Bm+D602/p0mKdRb3Cf3ZutJO56pHdb4pdR0+zpW2UJ0tMvyDo8v8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750312163; c=relaxed/simple;
	bh=X1eLZfBAk86nemMzfPKzEu41Vb9ua9iooK6dbhd+PCw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MRnnki1Qw5CSMug22iqiw8zu8LpZi/9BEMGDG3pm5hjzKulXUzRZsoSF77/2zgEfMhk8KB08saP2HoWfCvU/zMdFATJCyZZ7AJz0RhcwxN+n8gxiiolCo0SqCaXUbXA48HbobOTM+YzhN91H+InlfkVO7UQozMFsrRLN1e3VTjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lJ9Tx5AU; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-551fc6d4a76so357969e87.0;
        Wed, 18 Jun 2025 22:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750312160; x=1750916960; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LP0+v+yPMTvWP3QRlvcaJX6go4/gtqoSeY1FPuuU0EQ=;
        b=lJ9Tx5AUyLc6hLCbAgr3N6OBVteAXBdKtDEUI94foonoPYIs3jU9l6IeCyw6Pn0ymk
         P0Fj8ly1GwYySgdDaxoRZwXZnR6SI3jA7OQ4K9+nN7Wmda2vXVo1KBBonA1/aRGubh5Z
         sTgHG3V3bl+Dvd78eFMXYaQ/IST8+PEGit3ru0RhPxeZLaO5APYWrsqpAaM6/tdRMUQQ
         q4ENTYzaDYK6aMX7Z4Pr78kaH6Fzp7U3domslSfkYZZvJIsEzcowPHNoLOsz/hk8R7Rr
         OVBEvfCwqSC5UHSthE87OInHNPMCjSUa2xzwW5NvQF+kZWi4VgFhpFxkwMLBq7NVXD7M
         UG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750312160; x=1750916960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LP0+v+yPMTvWP3QRlvcaJX6go4/gtqoSeY1FPuuU0EQ=;
        b=nxcTM4kmHOKhJoniqwXAc2SiXNf9Yn6gUk+Nv6ypMk3h+bQE7vXIG+EISGJoRlDWIK
         xK5s0mS9Dtzn5R7tDrfn+85cYIwIJc7v7GB0nnU0IKPScMn7hFsUHxyxzkAof92PHedi
         8XvckLizSgfk/AGhV7vkugq3FSPds4PU4IcY8oS6fglXCk4+/nSOcjgrFaSt9xCJmnuB
         JU21r6i7N4ECyeSBwBhfAexCpKFv4BLWo8/jsl7BRyyFEO3POgHPlXl6ZFnyz2wmTUiz
         n30RA3VR6Bn205A/CZpenJNv8L/VuyIwSxhT0AFJ9N51WzjauOh5UZJVXYVB3csGePLG
         EwhA==
X-Forwarded-Encrypted: i=1; AJvYcCU9yOo2WDK5nLXdGjFTqAOPF/qKZz/Sk3tQCXwW3O1ER1S55jdn0RziRbPlZV0DFChouANjZtbS4HSn@vger.kernel.org, AJvYcCWU3af8sxOrwS6sm71o7qDwA5r+PuOkBdvC1g9abE2RPO3r4eBaHzs2FZrE36nE5vPIL8w0M4Cs@vger.kernel.org
X-Gm-Message-State: AOJu0YwNIqmyqMoHeRo7C6vRMffFx0cyYOstEyAIoeR6g+0XSwOycw1g
	9Y/HHCA41Ge6wTOn2q9l2+xLrNtSkfgldtHPsCxEpz1OoSGa2vm+kEBgkWaseOcQBJJUBJeMslO
	DZxwl9WTeCd46dqnHYf4j9xgjhyH8G2k=
X-Gm-Gg: ASbGncveboGIoeowiNLuDMXXaklvJUvuL567iPWFDW/YJg0BPXbkWgJ6KpriMLkF7a1
	hHysGh1OVXukpFIHT4xm8Ajr3676vyf8r+uBOGtfyBxrOpobVFutBRrR2w8kRk+Mnpy27ncdxSN
	hRaOqQOaLJC/DOTnEf59fYJ/loK8uNXBRzlwrfddo1zMDc
X-Google-Smtp-Source: AGHT+IEAtdtfArajT5szIQvBU7UGnWhv91Qs5Lq4eHuTo5U3W8BhvGer+g6N8WmU7PLHZ8aDkn6H5sM9ZBf+qYCptUo=
X-Received: by 2002:a05:6512:ea5:b0:553:2d93:d31 with SMTP id
 2adb3069b0e04-553b6ecba35mr5597131e87.22.1750312159320; Wed, 18 Jun 2025
 22:49:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aFKXzlno7HkG-cNh@shell.armlinux.org.uk> <E1uRqE9-004c7G-CB@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1uRqE9-004c7G-CB@rmk-PC.armlinux.org.uk>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Thu, 19 Jun 2025 13:48:42 +0800
X-Gm-Features: Ac12FXwywCRDElBPzLsFtuXFdNKKqhum4JUE_fePl755xSXSFzh60WUfPkWp7Z4
Message-ID: <CAJhJPsUDmQgunCk_Fbe5vFtBzE6Yy6m6Q0oRcXmpWRTu4nqQ0A@mail.gmail.com>
Subject: Re: [PATCH net-next 1/2] net: stmmac: loongson1: provide match data struct
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

On Wed, Jun 18, 2025 at 6:41=E2=80=AFPM Russell King (Oracle)
<rmk+kernel@armlinux.org.uk> wrote:
>
> Provide a structure for match data rather than using the function
> pointer as match data. This allows stronger type-checking for the
> function itself, and allows extensions to the match data.
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-loongson1.c | 24 ++++++++++++++-----
>  1 file changed, 18 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c b/driv=
ers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> index 3e86810717d3..78d9540be10c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson1.c
> @@ -46,6 +46,10 @@ struct ls1x_dwmac {
>         struct regmap *regmap;
>  };
>
> +struct ls1x_data {
> +       int (*init)(struct platform_device *pdev, void *bsp_priv);
> +};
> +
>  static int ls1b_dwmac_syscon_init(struct platform_device *pdev, void *pr=
iv)
>  {
>         struct ls1x_dwmac *dwmac =3D priv;
> @@ -143,9 +147,9 @@ static int ls1x_dwmac_probe(struct platform_device *p=
dev)
>  {
>         struct plat_stmmacenet_data *plat_dat;
>         struct stmmac_resources stmmac_res;
> +       const struct ls1x_data *data;
>         struct regmap *regmap;
>         struct ls1x_dwmac *dwmac;
> -       int (*init)(struct platform_device *pdev, void *priv);
>         int ret;
>
>         ret =3D stmmac_get_platform_resources(pdev, &stmmac_res);
> @@ -159,8 +163,8 @@ static int ls1x_dwmac_probe(struct platform_device *p=
dev)
>                 return dev_err_probe(&pdev->dev, PTR_ERR(regmap),
>                                      "Unable to find syscon\n");
>
> -       init =3D of_device_get_match_data(&pdev->dev);
> -       if (!init) {
> +       data =3D of_device_get_match_data(&pdev->dev);
> +       if (!data) {
>                 dev_err(&pdev->dev, "No of match data provided\n");
>                 return -EINVAL;
>         }
> @@ -175,21 +179,29 @@ static int ls1x_dwmac_probe(struct platform_device =
*pdev)
>                                      "dt configuration failed\n");
>
>         plat_dat->bsp_priv =3D dwmac;
> -       plat_dat->init =3D init;
> +       plat_dat->init =3D data->init;
>         dwmac->plat_dat =3D plat_dat;
>         dwmac->regmap =3D regmap;
>
>         return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);
>  }
>
> +static const struct ls1x_data ls1b_dwmac_data =3D {
> +       .init =3D ls1b_dwmac_syscon_init,
> +};
> +
> +static const struct ls1x_data ls1c_dwmac_data =3D {
> +       .init =3D ls1c_dwmac_syscon_init,
> +};
> +
>  static const struct of_device_id ls1x_dwmac_match[] =3D {
>         {
>                 .compatible =3D "loongson,ls1b-gmac",
> -               .data =3D &ls1b_dwmac_syscon_init,
> +               .data =3D &ls1b_dwmac_data,
>         },
>         {
>                 .compatible =3D "loongson,ls1c-emac",
> -               .data =3D &ls1c_dwmac_syscon_init,
> +               .data =3D &ls1c_dwmac_data,
>         },
>         { }
>  };
> --
> 2.30.2
>


--=20
Best regards,

Keguang Zhang

