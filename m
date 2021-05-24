Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7679338E2D0
	for <lists+linux-mips@lfdr.de>; Mon, 24 May 2021 10:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232484AbhEXI4i (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 May 2021 04:56:38 -0400
Received: from mail-ua1-f51.google.com ([209.85.222.51]:42496 "EHLO
        mail-ua1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232362AbhEXI4g (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 24 May 2021 04:56:36 -0400
Received: by mail-ua1-f51.google.com with SMTP id 14so9083664uac.9;
        Mon, 24 May 2021 01:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5H0qZkzumrdkYcAyVjQDQA6Hje2p2FxbSu2Plzs94Cg=;
        b=Bn/c6Kw7q0MNLCbshYdbAYgS97X7nKSJGRbi6LfqPjQuE8DXHOElGQnZ5C3wKeIgcy
         4KkM51ueXOpt1GLBYOfYiUylUogOKUgzWQLvNYK9gmnBPRLAPq5/vg1YblRRFhYqlETi
         oejDUHfGr+TTCKy/8RkHw8U639RPilcjlMeJRFkv9UJk3j6BlpbJT1SS5NsyttGttx54
         VoiIW5IeABFkIEIEb6x9K37WzXB+Max8o5z9nBwyXvPuOSNl8uGK2lul+dTRbFr4E3d8
         9Ak4hbkPX4bWQXLg8KIyOOj0lZJn+OyE3NgXUoVAYLeqC5e5fR+ZViFlgZSo7X+rvQCU
         yJ8Q==
X-Gm-Message-State: AOAM5311EDvujXylHpzfASl67Hhlo2oCu5I2vwwRODy8IjlTmaGwMlVy
        oBQaOAua/sxGfVg4R77llrw4sf7V/VGQhC3Znig=
X-Google-Smtp-Source: ABdhPJxxyosYrdj1GqNypPiBnYRArw2E3/38homNMO1Av1PFu0RXXr0Dh8t9Utur9chqZtb0X55m4PfZQwmS3BcBlZQ=
X-Received: by 2002:ab0:7705:: with SMTP id z5mr20481974uaq.2.1621846508208;
 Mon, 24 May 2021 01:55:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210523232556.15017-1-digetx@gmail.com>
In-Reply-To: <20210523232556.15017-1-digetx@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 24 May 2021 10:54:57 +0200
Message-ID: <CAMuHMdWqNngrDQOut1r5aD1Nk5BMXEV4m8+OBix4DXOV6OSpNg@mail.gmail.com>
Subject: Re: [PATCH v1] kbuild: Disable compile testing if HAVE_LEGACY_CLK enabled
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Paul Burton <paul.burton@mips.com>,
        John Crispin <john@phrozen.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:TI ETHERNET SWITCH DRIVER (CPSW)" 
        <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Dmitry,

On Mon, May 24, 2021 at 1:26 AM Dmitry Osipenko <digetx@gmail.com> wrote:
> There are couple older platforms that can't be compile-tested because they
> partially implement CLK API. It causes build failure of kernel drivers due
> to the missing symbols of the unimplemented part of CLK API.
>
> These platforms are: ARM EP93XX, ARM OMAP1, m68k ColdFire, MIPS AR7,
>                      MIPS Ralink.
>
> Disable compile-testing for HAVE_LEGACY_CLK=y.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Thanks for your patch!

> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -131,7 +131,7 @@ config INIT_ENV_ARG_LIMIT
>
>  config COMPILE_TEST
>         bool "Compile also drivers which will not load"
> -       depends on HAS_IOMEM
> +       depends on HAS_IOMEM && !HAVE_LEGACY_CLK

That sounds a bit drastic to me.  Usually we just try to implement the
missing functionality, or provide stubs.
Which functions are missing?

>         help
>           Some drivers can be compiled on a different platform than they are
>           intended to be run on. Despite they cannot be loaded there (or even

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
