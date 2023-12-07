Return-Path: <linux-mips+bounces-573-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 519E98084F4
	for <lists+linux-mips@lfdr.de>; Thu,  7 Dec 2023 10:50:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B3A4283A17
	for <lists+linux-mips@lfdr.de>; Thu,  7 Dec 2023 09:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9DB035275;
	Thu,  7 Dec 2023 09:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JGY43OkJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51B02132
	for <linux-mips@vger.kernel.org>; Thu,  7 Dec 2023 01:50:20 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5d05ff42db0so4634387b3.2
        for <linux-mips@vger.kernel.org>; Thu, 07 Dec 2023 01:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701942619; x=1702547419; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rIX1RNQkc6dFT3GzufGFqm5IkObG6UPnE4BiG2zpzws=;
        b=JGY43OkJ8dPiGSg/LM9PIVXUJ2A0MvHlLWMYb+4Q0e0DkIEUC6pvOjRDN2GVrSHTvM
         CAFsPeTBhY5GMRjyiNyCuuHiXH6LeNGNf1Yb1gy9NKKXOASspl6XGYzoeg4JVXU1Eoiu
         bLs2XqnTulIN8kd4YQ/bnlB54G4RFtytKq0OA6FPH5KyoQNjSJh6QP6eGPosfzpZxNnt
         kw5ztsMUb57SGZVUPGQ0+RcP7IJHNTf89IY8AF8e7CycAXvOdhU7Wjo7XY/yDc1vpm5f
         OeSGpndfs66BBIB/vyExrapfTwXu1avdkBZpfy34fgZ7ZUHmss2sOL0EnzNvpa5djdSV
         kE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701942619; x=1702547419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rIX1RNQkc6dFT3GzufGFqm5IkObG6UPnE4BiG2zpzws=;
        b=dXFbw4ghFlO3ayQeaEW01bAeR9UByGYwxL9W/s4YHANEjsAnX8UP/HZz3kS7V3fVT1
         +QAfoz4v8+1yNys+H/eYHvT0wCoD20Jd/oTbLv9ZJBesqdt6LDRsGXZyitiku+cmu+fg
         S7QR0vl/zTMLhP6GSt413QldR0r9XiCOKhIZvb1DEERSTRFkmsXAFW+7UiBm6rZL5YC0
         O1VX/JCkFTuU6oKSqOrUJ6BHgzsEcl75tWdtxSUcJLVPz09rQBtiDAJElFZPEDTxUI7d
         lqlD5Z/aPDSAW0qlORGFnFywMemy+d6rroHygKnUQftlWOLa5piyAZ1GBHKM1vvkgyin
         BfHQ==
X-Gm-Message-State: AOJu0YxKINp+tG1ikQv7361heIcLgotK1IyjCIlsaeWSXErQbWTONvms
	1buN6/+tW7OLCZKLS3qTQ8pmQ5EbjLq/bdKba49yWw==
X-Google-Smtp-Source: AGHT+IEEJzWHmSbZphkfBLVNWSrStTPwZmWuytH0kY6FxBii24pm/m34J3igBSJ8TViq0A9/s3USCc7X5N9RAXK7HsM=
X-Received: by 2002:a81:bd42:0:b0:5d3:761e:d835 with SMTP id
 n2-20020a81bd42000000b005d3761ed835mr1947189ywk.28.1701942619477; Thu, 07 Dec
 2023 01:50:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231129161459.1002323-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdZhpXcx2FZYKM69j3x4dP5Nu-=3sXW+BQAw3k6c5aRrWw@mail.gmail.com> <ZW3m-KDhs39i0E5n@smile.fi.intel.com>
In-Reply-To: <ZW3m-KDhs39i0E5n@smile.fi.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 7 Dec 2023 10:50:29 +0100
Message-ID: <CACRpkdaDDJfDznGZE1OGNt0Rc6Wbh0-0suu6PgL+veJea9rBRQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/23] pinctrl: Convert struct group_desc to use struct pingroup
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
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
	Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 4, 2023 at 3:49=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Mon, Dec 04, 2023 at 03:38:43PM +0100, Linus Walleij wrote:
> > Hi Andy,
> >
> > due to compile errors on arm32 and arm64 I had to drop most of the
> > patches again but I kept the preparatory patches so your
> > patch stack don't need to be so deep.
>
> Thank you!
>
> ...
>
> > >   pinctrl: core: Make pins const unsigned int pointer in struct
> > >     group_desc
> > >   pinctrl: equilibrium: Convert to use struct pingroup
> > >   pinctrl: keembay: Convert to use struct pingroup
> > >   pinctrl: nuvoton: Convert to use struct pingroup and
> > >     PINCTRL_PINGROUP()
>
> Hmm... Why these to be dropped?

I couldn't tell apart which ones could cross depend on the others,
simple as that...

Yours,
Linus Walleij

