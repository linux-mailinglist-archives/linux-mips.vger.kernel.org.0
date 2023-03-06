Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 558316AB9DA
	for <lists+linux-mips@lfdr.de>; Mon,  6 Mar 2023 10:29:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbjCFJ3i (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 Mar 2023 04:29:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229715AbjCFJ3h (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 6 Mar 2023 04:29:37 -0500
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85BBD3C12
        for <linux-mips@vger.kernel.org>; Mon,  6 Mar 2023 01:29:35 -0800 (PST)
Received: by mail-vs1-xe2d.google.com with SMTP id o2so8468118vss.8
        for <linux-mips@vger.kernel.org>; Mon, 06 Mar 2023 01:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678094974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvQIkDYLjKi1xYa8PrsuWYhMkTUsPQ5bO7uaHkoyHmk=;
        b=mCi1+sduhkZCcF2FmwXn2Dqy97YfHE+Tq+pWTIJMTliBycII7wVJmM/NdvGq1R2U1g
         pAgO1lGyMVTxhg7Xp9X9Yh02GvDU1hMtNuMLFLXT1BoSwwt+zeD1C8VkxRQpeOpHUhVc
         Ta5lzEE+glpZkBMY3x3bgr5kFtpDYGiBfOP0iBM2LINiGBVnmTdAdNwXe12JpkjS+wHw
         hCqyVrgattuUkwoeXo1Fsxr25p+WL6qkAyg59W/V0j5i0L2f1Iw23CBpS9/tp83roNLd
         jwJT0w+ZkprunZPQzx5gWQwIYl6Z7hsCdXiZQEvFDvRjWdwgKTazxUSUQHNVO2177bD6
         TS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678094974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qvQIkDYLjKi1xYa8PrsuWYhMkTUsPQ5bO7uaHkoyHmk=;
        b=rWcrfbFoWWTgt3CW7/A6Xyp+c3QqK+kedbXdAprQT6gb6ih0xJlzVu4To6ZzPR6aIu
         07QMGnv5IL44CUqchqSyi0J7S/RKfG9dwucw0mkk/C82eem1Eu5Wj9QUJ5FcSuRNErxX
         qhHM3hfxlXXWBMlLFuVRIa8VQoBmrzV+2K+KXnq/TaDk3GKn8C8r0flhweMOynGyNSjU
         YfGrRYbiVhgrEzwn4p021p4eHgCZ1uXJ/FIE1GSxVDxS9yIgRPyeEtfbii2lyMFtUmRZ
         WwN1frGQv/x2hGUczIskV5PRwMAXAFubdzgPKbYlJsVkdPYYY6V7KePA+ZSughXNNkIJ
         Mu7g==
X-Gm-Message-State: AO0yUKVgxuGsbNZoelsq/cUA77SaD28pF/gUOCAeR++rLq4N0gK2UyOJ
        7m+Pfop3FwFZospFX01bps/3vNPSHdoXK945Sinwrr7FoBQoNqvz
X-Google-Smtp-Source: AK7set8up+nvdh8MZZ//VuYTKLoxEsHVHN4YdURn1YFhptrsjt+rU4qjrNP6eUQ9U+bIEeMCcFd/KBNJ0/AWG7eq9xc=
X-Received: by 2002:a67:ec4f:0:b0:411:c9c5:59ae with SMTP id
 z15-20020a67ec4f000000b00411c9c559aemr6763838vso.5.1678094974566; Mon, 06 Mar
 2023 01:29:34 -0800 (PST)
MIME-Version: 1.0
References: <20230302125215.214014-1-keguang.zhang@gmail.com> <20230302125215.214014-2-keguang.zhang@gmail.com>
In-Reply-To: <20230302125215.214014-2-keguang.zhang@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 6 Mar 2023 10:29:23 +0100
Message-ID: <CAMRc=Me=Yrr5BuRaMd4r91URzmdYHWUvVGvLL9YFuZPaV0WYFA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] gpio: loongson1: Convert to SPDX identifier
To:     Keguang Zhang <keguang.zhang@gmail.com>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Mar 2, 2023 at 1:52=E2=80=AFPM Keguang Zhang <keguang.zhang@gmail.c=
om> wrote:
>
> Use SPDX-License-Identifier instead of the license text and
> update the author information.
>
> Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
> ---
> V1 -> V2: Keep GPLv2, just convert to SPDX identifier
> ---
>  drivers/gpio/gpio-loongson1.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpio/gpio-loongson1.c b/drivers/gpio/gpio-loongson1.=
c
> index 5d90b3bc5a25..8862c9ea0d41 100644
> --- a/drivers/gpio/gpio-loongson1.c
> +++ b/drivers/gpio/gpio-loongson1.c
> @@ -1,11 +1,8 @@
> +// SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * GPIO Driver for Loongson 1 SoC
>   *
> - * Copyright (C) 2015-2016 Zhang, Keguang <keguang.zhang@gmail.com>
> - *
> - * This file is licensed under the terms of the GNU General Public
> - * License version 2. This program is licensed "as is" without any
> - * warranty of any kind, whether express or implied.
> + * Copyright (C) 2015-2023 Keguang Zhang <keguang.zhang@gmail.com>
>   */
>
>  #include <linux/module.h>
> @@ -90,6 +87,6 @@ static struct platform_driver ls1x_gpio_driver =3D {
>
>  module_platform_driver(ls1x_gpio_driver);
>
> -MODULE_AUTHOR("Kelvin Cheung <keguang.zhang@gmail.com>");

Why are you removing credits of the old author?

Bart

> +MODULE_AUTHOR("Keguang Zhang <keguang.zhang@gmail.com>");
>  MODULE_DESCRIPTION("Loongson1 GPIO driver");
>  MODULE_LICENSE("GPL");
> --
> 2.34.1
>
