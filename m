Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2B413900BE
	for <lists+linux-mips@lfdr.de>; Tue, 25 May 2021 14:19:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232367AbhEYMUo convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 25 May 2021 08:20:44 -0400
Received: from mail-ua1-f49.google.com ([209.85.222.49]:40724 "EHLO
        mail-ua1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232353AbhEYMUn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 25 May 2021 08:20:43 -0400
Received: by mail-ua1-f49.google.com with SMTP id z14so9355346uan.7;
        Tue, 25 May 2021 05:19:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cflgo9YlhNLzTQ60SgvCsB3WgfxJaPc1W7VnDb/cs9M=;
        b=LDk/dTZGFfFBOnhqhUeE1Acr5XkNSQiOzlbd3BJXY5NoxQjeSKX4TyTu3OoyfW3Clb
         uMPAjdpHhyTyh3WQ2MCfbRc2OaM2iG7SKEKq/jerR+dvlTV+OvlC67t1ueASuBL2ykpq
         yev3FIscQGvsPjUyQ+w9gTUaZexfOxvWIH9sRjSkaiDye5Mc67jq3fcrUcpLDHT/A5nJ
         67gbVxeJLThC6Q4JCFyZFMrdrLZvwNwyzPW6EwRnz0sQI+pScRowe+n9vf4HB4cwFIZg
         ojEsh6WGTSilIoTQSQpEGPq9FGizYbUDKxI709yHPZrXm34xYfO8oi4P17wcjYzmwoyR
         r5dw==
X-Gm-Message-State: AOAM530yV8THWdZ2DFohZoCl9EldqBaVql7pwh27bjpzsAFxvKRDjh4s
        Q7w373gDXbBOzENlfVvpEdNfjzUGLsTor55nMsI=
X-Google-Smtp-Source: ABdhPJxb73scnc9iMaNZBOCcPhRZmkJ74QOEAKvaJx8dDb4KvKhoSSYw8rxoeu5H1uuhrw83tIPuW9y+8LIMsJgzL6Y=
X-Received: by 2002:a05:6122:3c:: with SMTP id q28mr484453vkd.5.1621945152471;
 Tue, 25 May 2021 05:19:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210523232556.15017-1-digetx@gmail.com> <CAMuHMdWqNngrDQOut1r5aD1Nk5BMXEV4m8+OBix4DXOV6OSpNg@mail.gmail.com>
 <8b6af8c0-6f01-193f-1eb4-4e230871f0cd@gmail.com> <f12b4622-6cea-ac65-2d94-f50a85c29215@canonical.com>
In-Reply-To: <f12b4622-6cea-ac65-2d94-f50a85c29215@canonical.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 25 May 2021 14:19:01 +0200
Message-ID: <CAMuHMdW_G259Nwx1EEf38h0AcVH8yjmjqp9Mh-vQ4LJJMzD8Dg@mail.gmail.com>
Subject: Re: [PATCH v1] kbuild: Disable compile testing if HAVE_LEGACY_CLK enabled
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
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
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Krzysztof,

On Tue, May 25, 2021 at 2:04 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
> On 24/05/2021 08:39, Dmitry Osipenko wrote:
> > 24.05.2021 11:54, Geert Uytterhoeven пишет:
> >> On Mon, May 24, 2021 at 1:26 AM Dmitry Osipenko <digetx@gmail.com> wrote:
> >>> There are couple older platforms that can't be compile-tested because they
> >>> partially implement CLK API. It causes build failure of kernel drivers due
> >>> to the missing symbols of the unimplemented part of CLK API.
> >>>
> >>> These platforms are: ARM EP93XX, ARM OMAP1, m68k ColdFire, MIPS AR7,
> >>>                      MIPS Ralink.
> >>>
> >>> Disable compile-testing for HAVE_LEGACY_CLK=y.
> >>>
> >>> Reported-by: kernel test robot <lkp@intel.com>
> >>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >>
> >> Thanks for your patch!
> >>
> >>> --- a/init/Kconfig
> >>> +++ b/init/Kconfig
> >>> @@ -131,7 +131,7 @@ config INIT_ENV_ARG_LIMIT
> >>>
> >>>  config COMPILE_TEST
> >>>         bool "Compile also drivers which will not load"
> >>> -       depends on HAS_IOMEM
> >>> +       depends on HAS_IOMEM && !HAVE_LEGACY_CLK
> >>
> >> That sounds a bit drastic to me.  Usually we just try to implement the
> >> missing functionality, or provide stubs.
> >> Which functions are missing?
> >
> > Everything that belongs to CONFIG_COMMON_CLK needs stubs.
> >
> > That is everything under CONFIG_HAVE_CLK [1], excluding functions
> > belonging to clk-devres.o and clk-bulk.o [2]. The HAVE_LEGACY_CLK
> > selects HAVE_CLK, but the COMMON_CLK is under HAVE_CLK too.
> >
> > [1]
> > https://elixir.bootlin.com/linux/v5.13-rc3/source/include/linux/clk.h#L786
> > [2]
> > https://elixir.bootlin.com/linux/v5.13-rc3/source/drivers/clk/Makefile#L3
> >
> > This problem is repeated over and over again for the past years. Some
> > maintainers are adding "depends on COMMON_CLK" for COMPILE_TEST of each
> > driver, but this doesn't solve the root of the problem, and thus, it's
> > constantly reoccurring.
> >
> > Recently Krzysztof Kozlowski added couple more clk stubs for MIPS, but
> > still lots of stubs are missing. Some platforms don't have any stubs at
> > all and apparently nobody cares to fix them.
> >
> > There 3 possible solutions:
> >
> > 1. Factor out COMMON_CLK from HAVE_LEGACY_CLK, if this is possible
> > 2. Build stubs universally, maybe using weak functions.
>
> I vote for this one - global stubs.

Yep.

> Or for a new one:
> 4. Disable COMPILE_TEST for specific platforms (mentioned in commit
> msg). Eventually could be like:
> config RALINK
>         depends !COMPILE_TEST || (COMPILE_TEST && COMMON_CLK)

That's a neat idea!

Of course there's a fifth option:

5. Convert legacy platforms to COMMON_CLK.

Which is already happening for ARM EP93XX.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
