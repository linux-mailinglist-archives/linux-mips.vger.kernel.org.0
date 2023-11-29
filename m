Return-Path: <linux-mips+bounces-391-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D12E47FDDF5
	for <lists+linux-mips@lfdr.de>; Wed, 29 Nov 2023 18:08:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5684CB20E6C
	for <lists+linux-mips@lfdr.de>; Wed, 29 Nov 2023 17:08:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A7673C097;
	Wed, 29 Nov 2023 17:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PRYgMA3F"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 031BFBE;
	Wed, 29 Nov 2023 09:08:50 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-280cd4e6f47so1132485a91.1;
        Wed, 29 Nov 2023 09:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701277729; x=1701882529; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O76Cfk68KhrIxRJmJnZsx1C518bMCKM0WCIhUwoBo8w=;
        b=PRYgMA3F0Bp6pNkgNKeUdAQlRGC+iPlG85TnoAVupre+1QPulwS0cHnlgeTje09G9A
         mPE7vzEXEWAr7pe4MHdfWmcbN/vsIaEW8AYHQJGMuyEYVBdbOCIW0MSb+9yaPxPTnk5m
         LjuzykqfsG8ZEb+b6YvwfnLxZWPkAg9K3Wx3sY/5Non09c2a36k5GhWO56mxIZjsci1E
         QUreYyc3TDav+GGV5ctRTr4ubn6PT4c7WK43Mycl37yAgFAB7woFzqOw7Pi1m+BiT6tf
         /mp8kc0nNXQI2Pj71NKG+YFbEp0KH1uagoghh0QPrx6Kzdjs4x1U7/m3IPM5RvmGHEB9
         2+yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701277729; x=1701882529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O76Cfk68KhrIxRJmJnZsx1C518bMCKM0WCIhUwoBo8w=;
        b=kDKJc+wi3XGQCze3nzmQuGPPIAamvXl/MIt54+h85wSB//FZfZ0RiEuuIztDMXl7pE
         +Cx3Z6UPiRaAy1oUB5U7Lb64vEV7lepv4mc9zNQZEYTKIGQDevieBZBftgn1xEqwPAss
         21cmyDvpuZHTARY4A87Z0dNPdZCW48zeOoihkBKU/S0vGUYaW7mEKgxqIAZdYsJ1c/DY
         x/iZvulchB7doGhINUfGT/hZaET2PjZp4glkyGwYxIW6aWr60cgjgDsu3Lu16ZXEuavl
         57R9rxG+L7Ud7Rnma5rgjBPpnWRPHRx9rrvbSPx2lR7PBfLpf9q8wkSuCVdkcjAfqXoB
         O+Cg==
X-Gm-Message-State: AOJu0Yxi01M8CIE28NXf3DTlWmlzikAgf8ZaFsee7XMt9A2V0CmUw8hK
	+lpoLfNLRW95DNTMI2XT+h4IdNxySM1GfUqgVwQ=
X-Google-Smtp-Source: AGHT+IFtel5cMuSoclx/RD5jpcO3jFsf4gFjr/2yk0h//Bk9GZrDN+VMoKMUdgmJ/KVAvyVH4q/bBMMt3AS7ri8wwtQ=
X-Received: by 2002:a17:90a:d996:b0:285:f76:9d6e with SMTP id
 d22-20020a17090ad99600b002850f769d6emr19702101pjv.3.1701277729276; Wed, 29
 Nov 2023 09:08:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231129161459.1002323-1-andriy.shevchenko@linux.intel.com>
 <20231129161459.1002323-17-andriy.shevchenko@linux.intel.com>
 <CAOMZO5CZpQjWKimNReUkwHOc-mF8vWoq2HDhjGKSu6E3g5-aVw@mail.gmail.com> <ZWduPKmBWkaIdLhi@smile.fi.intel.com>
In-Reply-To: <ZWduPKmBWkaIdLhi@smile.fi.intel.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 29 Nov 2023 14:08:38 -0300
Message-ID: <CAOMZO5C_dhvx70nk1HOSZdw8hMMmED69tdsXgydXdpnxHTJ58Q@mail.gmail.com>
Subject: Re: [PATCH v4 16/23] pinctrl: imx: Convert to use grp member
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
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Sean Wang <sean.wang@kernel.org>, 
	Paul Cercueil <paul@crapouillou.net>, Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, 
	Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 29, 2023 at 2:01=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> It's explained in the first paragraph in the cover letter. Do you
> want to copy this into each commit message?

Yes, much better to have the information into each commit message.

