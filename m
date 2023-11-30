Return-Path: <linux-mips+bounces-404-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 769207FECE2
	for <lists+linux-mips@lfdr.de>; Thu, 30 Nov 2023 11:35:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF3ABB20A83
	for <lists+linux-mips@lfdr.de>; Thu, 30 Nov 2023 10:35:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59D5A30334;
	Thu, 30 Nov 2023 10:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D91910DB;
	Thu, 30 Nov 2023 02:35:13 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5cfc3a48ab2so8117387b3.0;
        Thu, 30 Nov 2023 02:35:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701340512; x=1701945312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DUdP6LeO/4HAezqcq7YXUkxax+n83AqIPO6DNMdfcCg=;
        b=fM+yICvpWyE3KUK7SHzjzjq+iYJ2Zp5DyGJfuK695CTd4m9c6bOYdDuPMbCkQqY9TV
         7UFO5Zw8WWvcr5i714gs+7tCynDPqG6syXvOvDXaMCsRYVQyQGtyOueBsYFfcUruLUfj
         4Bpd1m9Q6goyYq4wP0NbMs6pyRSiubN2AH9iZyWKjU3zYt8GEdcOQdddvI8siXBVl5ON
         RIt7EK4s3II7oB52RwMs8d/DXRLa1HM7pF35yaWJv/yVInGnDL3Exn68dNCSGkcjVuhp
         xNbvdAKt+V1EJ9Q6csU88N/TkGYk3cMLxowGleZrMBRUUotog7LU1mOyPiKFKgrBnUoD
         vPKg==
X-Gm-Message-State: AOJu0YzBLiW3JEcvjgtW5YMQe3oqD7q3uPBNz4zKC17UrHJRiRdsENj3
	QmTmRaYPCN8HrxhLkvwHt3B+x09N0TgaGQ==
X-Google-Smtp-Source: AGHT+IF0pJeBKISCmyDcQ1B1b0A34RUrl6WFHjFX1LvlcVoN7JOfqf+QfLNSvA6QMNG7B5JdHHZrFQ==
X-Received: by 2002:a81:5344:0:b0:5ca:e4a6:bb47 with SMTP id h65-20020a815344000000b005cae4a6bb47mr21993982ywb.35.1701340512210;
        Thu, 30 Nov 2023 02:35:12 -0800 (PST)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id v127-20020a818585000000b00583b144fe51sm275622ywf.118.2023.11.30.02.35.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Nov 2023 02:35:11 -0800 (PST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5cfc3a48ab2so8117187b3.0;
        Thu, 30 Nov 2023 02:35:11 -0800 (PST)
X-Received: by 2002:a0d:cc4f:0:b0:5c9:ff96:d78b with SMTP id
 o76-20020a0dcc4f000000b005c9ff96d78bmr21925523ywd.37.1701340511007; Thu, 30
 Nov 2023 02:35:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231129161459.1002323-1-andriy.shevchenko@linux.intel.com> <20231129161459.1002323-7-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231129161459.1002323-7-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Nov 2023 11:34:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUCEVrg1Dsu9u-cECyXJP4PKXkXibU0QK1G=+juwG9rxQ@mail.gmail.com>
Message-ID: <CAMuHMdUCEVrg1Dsu9u-cECyXJP4PKXkXibU0QK1G=+juwG9rxQ@mail.gmail.com>
Subject: Re: [PATCH v4 06/23] pinctrl: core: Make pins const unsigned int
 pointer in struct group_desc
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
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

On Wed, Nov 29, 2023 at 5:15=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> It's unclear why it's not a const unsigned int pointer from day 1.
> Make the pins member const unsigned int pointer in struct group_desc.
> Update necessary APIs.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

