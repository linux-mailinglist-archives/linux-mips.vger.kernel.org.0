Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DADAB273C8F
	for <lists+linux-mips@lfdr.de>; Tue, 22 Sep 2020 09:49:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726796AbgIVHtO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 22 Sep 2020 03:49:14 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:40480 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726766AbgIVHtO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Sep 2020 03:49:14 -0400
Received: by mail-ed1-f67.google.com with SMTP id t16so15257461edw.7;
        Tue, 22 Sep 2020 00:49:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tkNnH/LgGWRWsIkn54prukiE/8IPOzAY4WWXu7q2L5k=;
        b=bImS9oUzS9t8T7o04HjS1aRXx2VKkdTGkuE0gfqIinp4l3bWuN90kKBvMOJQLNmKwh
         8D3wKFCaocjNCZhyha0ieacf6Z+qImev/u1yEwA7vW/Ff0hgByxqVM/s2xtj0NFDFi00
         b+LmZWHZHN22zhLvgdM7dwgoLF6e78QTfmx0giJr0+fLekS4FoFiKeijradqXfa/lnQd
         JE7qhyJD7qrdou8l1ghc2jqhAe8rSI7+XalxrG1h4rQmI7wppsEE966jYooNQLg37GYO
         9TUwFD9uq+qQcsa9xoPyNbHWOceTfKvCmDwviaDc1OE5mpcaS2qtOxk4hntHfpXHK2kY
         VD3w==
X-Gm-Message-State: AOAM5311vT2I2IIYcw2PMINPeKVSYlpSxLFEkZl1NniG3LnxYwVUOEtK
        41Jx0UEPrN+WjFA1TiYlaqnEGVft/ympK1tr6adJFDoM7ME=
X-Google-Smtp-Source: ABdhPJwLcWWCUEt8p5yQlYU14gxPGSkOs/brGp7CghOj4dX4vV/dJJ3Vht6R7gMlSgXaW39nMNNloTCoG83wj5/qPrs=
X-Received: by 2002:a05:6402:17ed:: with SMTP id t13mr2688983edy.163.1600760951985;
 Tue, 22 Sep 2020 00:49:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200920210834.116411-1-tsbogend@alpha.franken.de>
In-Reply-To: <20200920210834.116411-1-tsbogend@alpha.franken.de>
From:   =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date:   Tue, 22 Sep 2020 09:49:00 +0200
Message-ID: <CAAdtpL57e02iAcPY78tqXGzVGOgGz7b4Mu91siXuM9zZJu8+pA@mail.gmail.com>
Subject: Re: [PATCH] MIPS: malta: remove unused header file
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Sep 20, 2020 at 11:09 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> Remove unused heasder file asm/mach-malta/malta-pm.h.

Typo "header".

>
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/include/asm/mach-malta/malta-pm.h | 33 -----------------------------
>  1 file changed, 33 deletions(-)
>  delete mode 100644 arch/mips/include/asm/mach-malta/malta-pm.h
>
> diff --git a/arch/mips/include/asm/mach-malta/malta-pm.h b/arch/mips/include/asm/mach-malta/malta-pm.h
> deleted file mode 100644
> index 2a5146d79313..000000000000
> --- a/arch/mips/include/asm/mach-malta/malta-pm.h
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-or-later */
> -/*
> - * Copyright (C) 2014 Imagination Technologies
> - * Author: Paul Burton <paul.burton@mips.com>
> - */
> -
> -#ifndef __ASM_MIPS_MACH_MALTA_PM_H__
> -#define __ASM_MIPS_MACH_MALTA_PM_H__
> -
> -#include <asm/mips-boards/piix4.h>
> -
> -#ifdef CONFIG_MIPS_MALTA_PM
> -
> -/**
> - * mips_pm_suspend - enter a suspend state
> - * @state: the state to enter, one of PIIX4_FUNC3IO_PMCNTRL_SUS_TYP_*
> - *
> - * Enters a suspend state via the Malta's PIIX4. If the state to be entered
> - * is one which loses context (eg. SOFF) then this function will never
> - * return.
> - */
> -extern int mips_pm_suspend(unsigned state);
> -
> -#else /* !CONFIG_MIPS_MALTA_PM */
> -
> -static inline int mips_pm_suspend(unsigned state)
> -{
> -       return -EINVAL;
> -}
> -
> -#endif /* !CONFIG_MIPS_MALTA_PM */
> -
> -#endif /* __ASM_MIPS_MACH_MALTA_PM_H__ */
> --
> 2.16.4
>
