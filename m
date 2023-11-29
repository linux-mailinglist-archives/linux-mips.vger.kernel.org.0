Return-Path: <linux-mips+bounces-355-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CB77FD52E
	for <lists+linux-mips@lfdr.de>; Wed, 29 Nov 2023 12:12:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29B7F1C21127
	for <lists+linux-mips@lfdr.de>; Wed, 29 Nov 2023 11:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3953B1C2A5;
	Wed, 29 Nov 2023 11:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D1791BD3;
	Wed, 29 Nov 2023 03:12:29 -0800 (PST)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5c8c26cf056so68438927b3.1;
        Wed, 29 Nov 2023 03:12:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701256348; x=1701861148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XJBAY+EVsFCK+6qYmvKhC75YavWi+kzyxoJ2FmRxal8=;
        b=jaWtpb1sLMqSdAnmRcCenPS33V/jmiXzByTQY9GkO1pwFnrEr13+MRYKu8ZfwDNkHn
         +LAZNu1j0WJ/dN38JUuuvDLBLCDgZnnoPdtlmdAQx5SDxTKpCYvgetJ1mnrfhiCRD+Ox
         likC4IMdUz5zl18QV9jBmIgnrNhOH8cz1byy9oFYu109EDaVuKLMhCbnyZyeT9FB8eMv
         vmusbwmQzyfcsR1Zy/g13ETGm3VMpwnqPqeVxtREPNv/k3IlMVeycGv+TLRISOzp3yyU
         oqwmzKJl/jezCl7c6/iU8YAcO3igDPjXIhb/XQFuwOr1f1NtLYAcJN6yBrJp8eKiabQn
         yp0w==
X-Gm-Message-State: AOJu0Yzzesn9GxFr9pUJmGGGOZmFJA02RmNOtweiC3bmOqyP/S/tF339
	MY8OhKx6jwnFt0p2flwJW9YINbhVdMi4PQ==
X-Google-Smtp-Source: AGHT+IGEUithuImb8Z2qUZxwr6NIlq5U9rnCet+mbGkGv0YjADJBmSs0RsiHmtKVx/S1WylHeziKCg==
X-Received: by 2002:a05:690c:448c:b0:5d0:17a3:a4dc with SMTP id gr12-20020a05690c448c00b005d017a3a4dcmr11984084ywb.34.1701256348606;
        Wed, 29 Nov 2023 03:12:28 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id y140-20020a0dd692000000b005cb0b3d9291sm4474283ywd.12.2023.11.29.03.12.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 03:12:27 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5cd0af4a7d3so68489867b3.0;
        Wed, 29 Nov 2023 03:12:26 -0800 (PST)
X-Received: by 2002:a81:574d:0:b0:5d0:675:575 with SMTP id l74-20020a81574d000000b005d006750575mr10045178ywb.18.1701256346741;
 Wed, 29 Nov 2023 03:12:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128200155.438722-1-andriy.shevchenko@linux.intel.com> <20231128200155.438722-11-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231128200155.438722-11-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Nov 2023 12:12:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVOTNBkq=ptZ_Y4=+h+jMXKDYXr4iJcs1g7aGYCDKLtuw@mail.gmail.com>
Message-ID: <CAMuHMdVOTNBkq=ptZ_Y4=+h+jMXKDYXr4iJcs1g7aGYCDKLtuw@mail.gmail.com>
Subject: Re: [PATCH v3 10/22] pinctrl: core: Add a convenient define PINCTRL_GROUP_DESC()
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
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 9:05=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> Add PINCTRL_GROUP_DESC() macro for inline use.
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

