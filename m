Return-Path: <linux-mips+bounces-354-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 319E97FD524
	for <lists+linux-mips@lfdr.de>; Wed, 29 Nov 2023 12:10:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB3BA2820AE
	for <lists+linux-mips@lfdr.de>; Wed, 29 Nov 2023 11:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D02E11C2A6;
	Wed, 29 Nov 2023 11:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C9BD271D;
	Wed, 29 Nov 2023 03:10:50 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5c08c47c055so65164407b3.1;
        Wed, 29 Nov 2023 03:10:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701256248; x=1701861048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CIg/lVR/UB6jNsuQOE2z1pZZGLYqtdqMUy/N5XrA7+s=;
        b=j+nbdeiOc68h3LVA3Aoy2C4hsk4nNwNLPR0NNmEmeCvLKu6rHi+Xq0Q1lALUmg9sZG
         4ZjlzEcDkfxRprrK50DTrXKBHyNTEcLjsNnQ07zOkUh1zyL7Cl0D55RMsji2TsZfPaWp
         9tcgDCdnyqU76l5RVXGnHGvfAaz/OYSNipC0xgWxw8n12rkJZwY2D+R/km4DsTJ9BT0S
         jlNn/SmRcH2TCKJXC70vwxYzJ7jROxi/+m0gFLsW8TdqRlPHeGfkGArdjbUru23XqwGW
         QVWpH2jrrt3NVj2s3KbL86ryfhMfXMrRXU+SujiahWGXKJkhaTTtVZnDOCXssyrrDznR
         rH9w==
X-Gm-Message-State: AOJu0YwBeWSFzRXuoEPp1qM71DVXkEAyKJDzNjCxTE9VncZPtoZqVZmE
	BYAX4deyGpJSIMjPzvjmzN01xfvtx/6Gjw==
X-Google-Smtp-Source: AGHT+IGobGQMHmqiy2cLdoyY99eiWypJdrD0bQrkSVLPAPEh8boWvFdsGyiVjYCXdWVZROMHHs/0CQ==
X-Received: by 2002:a05:690c:2a93:b0:5ce:a930:d641 with SMTP id ek19-20020a05690c2a9300b005cea930d641mr14096395ywb.4.1701256248544;
        Wed, 29 Nov 2023 03:10:48 -0800 (PST)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id t5-20020a0dd105000000b0057087e7691bsm4486383ywd.56.2023.11.29.03.10.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 03:10:47 -0800 (PST)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-db40898721fso6138611276.3;
        Wed, 29 Nov 2023 03:10:47 -0800 (PST)
X-Received: by 2002:a05:6902:566:b0:d7b:90c6:683c with SMTP id
 a6-20020a056902056600b00d7b90c6683cmr19865805ybt.26.1701256247010; Wed, 29
 Nov 2023 03:10:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128200155.438722-1-andriy.shevchenko@linux.intel.com> <20231128200155.438722-21-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231128200155.438722-21-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Nov 2023 12:10:35 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXPPHN=G8Ej0apBch4hFWic+jWBBt1SWjgz0xD_wFw=Gw@mail.gmail.com>
Message-ID: <CAMuHMdXPPHN=G8Ej0apBch4hFWic+jWBBt1SWjgz0xD_wFw=Gw@mail.gmail.com>
Subject: Re: [PATCH v3 20/22] pinctrl: renesas: Convert to use grp member
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-mips@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Sean Wang <sean.wang@kernel.org>, 
	Paul Cercueil <paul@crapouillou.net>, Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Tue, Nov 28, 2023 at 9:04=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> Convert drivers to use grp member embedded in struct group_desc.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
> @@ -273,7 +273,7 @@ static int rzg2l_pinctrl_set_mux(struct pinctrl_dev *=
pctldev,
>         struct function_desc *func;
>         unsigned int i, *psel_val;
>         struct group_desc *group;
> -       int *pins;
> +       const int *pins;

unsigned, as this no longer signed.

>
>         func =3D pinmux_generic_get_function(pctldev, func_selector);
>         if (!func)
> @@ -283,9 +283,9 @@ static int rzg2l_pinctrl_set_mux(struct pinctrl_dev *=
pctldev,
>                 return -EINVAL;
>
>         psel_val =3D func->data;
> -       pins =3D group->pins;
> +       pins =3D group->grp.pins;

> --- a/drivers/pinctrl/renesas/pinctrl-rzv2m.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzv2m.c
> @@ -165,7 +165,7 @@ static int rzv2m_pinctrl_set_mux(struct pinctrl_dev *=
pctldev,
>         struct function_desc *func;
>         unsigned int i, *psel_val;
>         struct group_desc *group;
> -       int *pins;
> +       const int *pins;

unsigned

>
>         func =3D pinmux_generic_get_function(pctldev, func_selector);
>         if (!func)
> @@ -175,9 +175,9 @@ static int rzv2m_pinctrl_set_mux(struct pinctrl_dev *=
pctldev,
>                 return -EINVAL;
>
>         psel_val =3D func->data;
> -       pins =3D group->pins;
> +       pins =3D group->grp.pins;

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

