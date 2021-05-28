Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28E4C393FE3
	for <lists+linux-mips@lfdr.de>; Fri, 28 May 2021 11:26:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235361AbhE1J1w convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Fri, 28 May 2021 05:27:52 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:58893 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235493AbhE1J1o (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 28 May 2021 05:27:44 -0400
Received: from mail-wr1-f51.google.com ([209.85.221.51]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MUGmJ-1lwDPB1hNj-00RKEq; Fri, 28 May 2021 11:26:06 +0200
Received: by mail-wr1-f51.google.com with SMTP id m18so2611306wrv.2;
        Fri, 28 May 2021 02:26:06 -0700 (PDT)
X-Gm-Message-State: AOAM531aGTsAf7aRC087pOKmTKHuQSc0B2fCmvVTaHJOOcImJj1LADR7
        sAhlvdN4DuRYwMR9DT3XLTvQgzoqgcq0JmvyDqM=
X-Google-Smtp-Source: ABdhPJwUBBPBqy6sEDp8MUkLq9WzypD0Ti5CAqDfrYMCxwUKuoh2u9qM4m0RTX0uKLkvdTb1O0BPwtgr4KrPVkM5omw=
X-Received: by 2002:adf:e589:: with SMTP id l9mr8000769wrm.361.1622193965898;
 Fri, 28 May 2021 02:26:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210523232556.15017-1-digetx@gmail.com> <CAMuHMdWqNngrDQOut1r5aD1Nk5BMXEV4m8+OBix4DXOV6OSpNg@mail.gmail.com>
 <8b6af8c0-6f01-193f-1eb4-4e230871f0cd@gmail.com>
In-Reply-To: <8b6af8c0-6f01-193f-1eb4-4e230871f0cd@gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 28 May 2021 11:24:36 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2XsrfUJQQAfnGknh8HiA-D9L_wmEoAgXU89KqagE31NQ@mail.gmail.com>
Message-ID: <CAK8P3a2XsrfUJQQAfnGknh8HiA-D9L_wmEoAgXU89KqagE31NQ@mail.gmail.com>
Subject: Re: [PATCH v1] kbuild: Disable compile testing if HAVE_LEGACY_CLK enabled
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
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
X-Provags-ID: V03:K1:ZxmZe66P3gA1RFoWlXwfGZn23pAfY6er9wEJOUOeuPZfr13zAwo
 Nv6OSeliDuoSrIZqL0lanKzF1Fzb9Sr6PkDKrCiO9HAXOatpvNaNbR6eo3C0r9asSJRZ7MP
 3S8J3zZ1Hh2/mW2A3FzHfFA8q5VIMAyiAxEmYjs38fsSdwz6906SwkWJjooQa46iYxVovED
 Fg/yCwpDZL1LKsN9LGpfQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:pHJrBUoRBmQ=:X2mhG5x1vx4uO3+KX2YGMS
 V7bhmFDEMfN7q+qdEEycrYlL8RRy+iqc6BncDqAaVXQIWebQudKLCAmdDnB+VdCBst2ZdAKTy
 u9iQhgkgGqmDkva9fco/1NiqExoKD0uY+oZLzEWL0cMVx781kc9++/aQuzhtvmtx3GLHXsf54
 74vVBKAJpsizMlpSZcshKpGLatnSkzIjohkM6ghnoxVJiuKeKpCHJ/fhKyFripLabTwHjMI5r
 /+cKnXcCBWKvmEQH8xB89h6bxdCgF1Ggpv6Itb0M5Dao4CpXPH9GvDhhks5Z9Y9B6pBWnlgHV
 qgOjPYqSzOBPShVKLHN/fPUmatPA5MkPnX7W/KhM1btLwlakFOtxPDnJT8RPZeh5fmdl1Pgro
 7oZsuRSOP+mYW2MymM65qplkZU8UTBFOD2DRVLA2BgRH123VRF5PvQ4csRfMuL3FSp401AmSy
 UE0yqG5TwLkfGGPRs+0rORBMxxLCeqIszS8B2oVHGw+UbQ0h7HzHEWJG3/hlwyPPWgAt3Ss64
 yp6oIrEH2v1uixzidOp9gU=
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, May 24, 2021 at 2:39 PM Dmitry Osipenko <digetx@gmail.com> wrote:
> 24.05.2021 11:54, Geert Uytterhoeven пишет:
> > Hi Dmitry,
> >
> > On Mon, May 24, 2021 at 1:26 AM Dmitry Osipenko <digetx@gmail.com> wrote:
> >> There are couple older platforms that can't be compile-tested because they
> >> partially implement CLK API. It causes build failure of kernel drivers due
> >> to the missing symbols of the unimplemented part of CLK API.
> >>
> >> These platforms are: ARM EP93XX, ARM OMAP1, m68k ColdFire, MIPS AR7,
> >>                      MIPS Ralink.

There is also most of arch/sh/, with the one exception of J2.

On MIPS, I see BCM63XX and Lantiq in addition to AR7 and Ralink.

I think the patches to convert ep93xx are under discussion at the moment,
and I have previously done an implementation for omap1 that I have meant
to dig out for a while.

Both of the Arm platforms should work fine with compile testing, as I
have previously added the stubs as necessary.

> >> @@ -131,7 +131,7 @@ config INIT_ENV_ARG_LIMIT
> >>
> >>  config COMPILE_TEST
> >>         bool "Compile also drivers which will not load"
> >> -       depends on HAS_IOMEM
> >> +       depends on HAS_IOMEM && !HAVE_LEGACY_CLK
> >
> > That sounds a bit drastic to me.  Usually we just try to implement the
> > missing functionality, or provide stubs.
> > Which functions are missing?
>
> Everything that belongs to CONFIG_COMMON_CLK needs stubs.
>
> That is everything under CONFIG_HAVE_CLK [1], excluding functions
> belonging to clk-devres.o and clk-bulk.o [2]. The HAVE_LEGACY_CLK
> selects HAVE_CLK, but the COMMON_CLK is under HAVE_CLK too.
>
> [1]
> https://elixir.bootlin.com/linux/v5.13-rc3/source/include/linux/clk.h#L786
> [2]
> https://elixir.bootlin.com/linux/v5.13-rc3/source/drivers/clk/Makefile#L3
>
> This problem is repeated over and over again for the past years. Some
> maintainers are adding "depends on COMMON_CLK" for COMPILE_TEST of each
> driver, but this doesn't solve the root of the problem, and thus, it's
> constantly reoccurring.

These dependencies tend to reflect the actual requirements though: if a
driver calls the clk interfaces, it is likely to require them at
runtime as well.

If a driver that calls clk_get_rate() does not have a fallback to deal with '0'
getting returned, this means that building it without CONFIG_COMMON_CLK
gives you a driver that can't work on any hardware at all. In this case

  depends on COMMON_CLK || COMPILE_TEST

does reflect what we want.depends onb

> Recently Krzysztof Kozlowski added couple more clk stubs for MIPS, but
> still lots of stubs are missing. Some platforms don't have any stubs at
> all and apparently nobody cares to fix them.
>
> There 3 possible solutions:
>
> 1. Factor out COMMON_CLK from HAVE_LEGACY_CLK, if this is possible
> 2. Build stubs universally, maybe using weak functions.
> 3. Disable compile-testing for HAVE_LEGACY_CLK
>
> The third option is the simplest. If anyone will care to fix those
> legacy platforms properly, then compile-testing could be re-enabled for
> them. This is my proposal.

It is pretty much a given that arch/sh won't be converted to common clk
at this point, and I think disabling COMPILE_TEST on arch/sh globabally
makes sense.

Converting coldfire and ar7/lantiq/bcm63xx/ralink to common_clk shouldn't
actually be too hard, but I don't think it's a priority for anyone at
the moment.

One other idea I can think of is to redefine CONFIG_HAVE_CLK. At the
moment, this is defined as (COMMON_CLK || HAVE_LEGACY_CLK),
not literally, but for all practical purposes. If HAVE_CLK is disabled,
we get the stubs, so the build failures you saw happen very rarely
on drivers that use clk interfaces but have no such Kconfig dependency.

If we change this to define it as

config HAVE_CLK
        def_bool COMMON_CLK || COMPILE_TEST

while annotating the sh/coldfire/ar7/bcm63xx/lantiq/ralink specific
drivers as 'depends on HAVE_CLK || HAVE_LEGACY_CLK', then
we can compile test any driver, but actually get the build failures
for drivers that lack a 'depends on COMMON_CLK' and can fix
them up more easily. This probably requires adding a ton of
missing dependencies first that happened to get ignored in the
past.

If we don't do this, another approach would be to provide
global stubs for anything that isn't already provided by
the platforms. Here is a list of which interfaces each version
actually has implemented (Y), stubbed out (S) or lacks (N):

                omap1   ep93xx  ar7     bcm63xx lantiq  ralink  coldf   sh
clk_enable      Y       Y       S       Y       Y       S       Y       Y
clk_disable     Y       Y       S       Y       Y       S       Y       Y
clk_get_rate    Y       Y       Y       Y       Y       Y       S       Y
clk_round_rate  Y       S       S       S       Y       S       S       Y
clk_set_rate    Y       Y       S       S       Y       S       S       Y
clk_set_parent  S       S       S       N       N       S       S       Y
clk_get_parent  S       Y       S       N       N       S       S       Y
clk_get         N       N       Y       N       N       N       Y       N
clk_put         N       N       S       N       N       N       S       N

- ar7 and coldfire are the only ones that lack the generic
  clkdev lookup but instead provide their own clk_get/clk_put
  functions. This can probably get addressed easily.

- The clk_get_parent/set_parent functions are only
  provided on ep93xx and sh. Once ep93xx is out of the
  way, we could remove the private stubs and always
  provide the global ones, except for sh.

- The remaining five functions
  (enable/disable/get_rate/set_rate/round_rate) have a
  consistent interface across all eight platforms, they
  are always exported in that case.

       Arnd
