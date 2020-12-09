Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A9EF2D3EF9
	for <lists+linux-mips@lfdr.de>; Wed,  9 Dec 2020 10:42:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729308AbgLIJjr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Dec 2020 04:39:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:54148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729307AbgLIJjp (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 9 Dec 2020 04:39:45 -0500
X-Gm-Message-State: AOAM5327ygBGmuT87qCYawR2XnuGR+wLXSTQNNGg/EU59/+h5bGlVHSR
        GKLe906K848+smb4KdLiXvFDQ32d2E1NGeFNXAA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607506743;
        bh=y0aoGX7ac5Mr8h/RNiVqkNsUM+IeH9kGfjBcLTwNzy4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=OjzWr5aeXull7Vf+ynwy2cSazAzNv1p6VjkQOs9EQMARqNjlvdpQIja6k2ikyqaDJ
         1PUiolMDNlT6sN6ddkPv1YbYLP8YMEdPg+YsydW/zr35JyChzR6BdFbpwqQn/Fdb20
         BG0sBv9YPsuN00niN4Hknt6khvGa6ODeobSaOa4DYmsQksfshik6l6Q0Kpg7wjNOwZ
         R1gisM2ZbnWnxO90oXdn7FbDkixiOja1Y+0oHV4QgoFZtba6q90B6vKC3yDWK/KgCa
         OdYP2VFuA9GSSWEvmZBPtygqB8aq+aLHef+yDFlDjfgKReRZky/hVX50PWldmqTrMU
         I0pUv9kGlHc3w==
X-Google-Smtp-Source: ABdhPJytyWJ4vfLyNrGEiaVPvO0xSkRZFoVATwqPf88N6hbIDYzCs7Rs4b8GyCo5gU5NvJS69SwTpHBua5l6jzoSWyQ=
X-Received: by 2002:aca:5ec2:: with SMTP id s185mr1104855oib.33.1607506742899;
 Wed, 09 Dec 2020 01:39:02 -0800 (PST)
MIME-Version: 1.0
References: <20201208164821.2686082-1-paul@crapouillou.net>
In-Reply-To: <20201208164821.2686082-1-paul@crapouillou.net>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Wed, 9 Dec 2020 10:38:51 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGXsTTtPLX0HM3_HYRBTJ8q+w09xgXs9BXMSe8GLtk2YQ@mail.gmail.com>
Message-ID: <CAMj1kXGXsTTtPLX0HM3_HYRBTJ8q+w09xgXs9BXMSe8GLtk2YQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] if_enabled.h: Add IF_ENABLED_OR_ELSE() and
 IF_ENABLED() macros
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        od@zcrc.me, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, 8 Dec 2020 at 17:49, Paul Cercueil <paul@crapouillou.net> wrote:
>
> Introduce a new header <linux/if_enabled.h>, that brings two new macros:
> IF_ENABLED_OR_ELSE() and IF_ENABLED().
>
> IF_ENABLED_OR_ELSE(CONFIG_FOO, a, b) evaluates to (a) if CONFIG_FOO is set
> to 'y' or 'm', (b) otherwise. It is used internally to define the
> IF_ENABLED() macro. The (a) and (b) arguments must be of the same type.
>
> IF_ENABLED(CONFIG_FOO, ptr) evaluates to (ptr) if CONFIG_FOO is set to 'y'
> or 'm', NULL otherwise. The (ptr) argument must be a pointer.
>
> The IF_ENABLED() macro can be very useful to help GCC drop dead code.
>
> For instance, consider the following:
>
>     #ifdef CONFIG_FOO_SUSPEND
>     static int foo_suspend(struct device *dev)
>     {
>        ...
>     }
>     #endif
>
>     static struct pm_ops foo_ops = {
>         #ifdef CONFIG_FOO_SUSPEND
>         .suspend = foo_suspend,
>         #endif
>     };
>
> While this works, the foo_suspend() macro is compiled conditionally,
> only when CONFIG_FOO_SUSPEND is set. This is problematic, as there could
> be a build bug in this function, we wouldn't have a way to know unless
> the config option is set.
>
> An alternative is to declare foo_suspend() always, but mark it as maybe
> unused:
>
>     static int __maybe_unused foo_suspend(struct device *dev)
>     {
>        ...
>     }
>
>     static struct pm_ops foo_ops = {
>         #ifdef CONFIG_FOO_SUSPEND
>         .suspend = foo_suspend,
>         #endif
>     };
>
> Again, this works, but the __maybe_unused attribute is required to
> instruct the compiler that the function may not be referenced anywhere,
> and is safe to remove without making a fuss about it. This makes the
> programmer responsible for tagging the functions that can be
> garbage-collected.
>
> With this patch, it is now possible to write the following:
>
>     static int foo_suspend(struct device *dev)
>     {
>        ...
>     }
>
>     static struct pm_ops foo_ops = {
>         .suspend = IF_ENABLED(CONFIG_FOO_SUSPEND, foo_suspend),
>     };
>
> The foo_suspend() function will now be automatically dropped by the
> compiler, and it does not require any specific attribute.
>
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Hi Paul,

I understand the issue you are trying to address here, but please note
that there are many cases where the struct member in question will not
even be declared if the associated CONFIG option is not set, in which
case this will cause a compile error.










> ---
>  include/linux/if_enabled.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 include/linux/if_enabled.h
>
> diff --git a/include/linux/if_enabled.h b/include/linux/if_enabled.h
> new file mode 100644
> index 000000000000..8189d1402340
> --- /dev/null
> +++ b/include/linux/if_enabled.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __LINUX_IF_ENABLED_H
> +#define __LINUX_IF_ENABLED_H
> +
> +#include <linux/build_bug.h>
> +#include <linux/compiler_types.h>
> +#include <linux/kconfig.h>
> +
> +/*
> + * IF_ENABLED_OR_ELSE(CONFIG_FOO, a, b) evaluates to (a) if CONFIG_FOO is set
> + * to 'y' or 'm', (b) otherwise.
> + */
> +#define IF_ENABLED_OR_ELSE(option, a, b) \
> +       (BUILD_BUG_ON_ZERO(__same_type((a), (b))) || IS_ENABLED(option) ? (a) : (b))
> +
> +/*
> + * IF_ENABLED(CONFIG_FOO, ptr) evaluates to (ptr) if CONFIG_FOO is set to 'y'
> + * or 'm', NULL otherwise.
> + */
> +#define IF_ENABLED(option, ptr) IF_ENABLED_OR_ELSE(option, ptr, NULL)
> +
> +#endif /* __LINUX_IF_ENABLED_H */
> --
> 2.29.2
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
