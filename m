Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 706AB1A07F3
	for <lists+linux-mips@lfdr.de>; Tue,  7 Apr 2020 09:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726865AbgDGHII (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 Apr 2020 03:08:08 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:43095 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbgDGHII (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 7 Apr 2020 03:08:08 -0400
Received: by mail-oi1-f193.google.com with SMTP id k5so600627oiw.10;
        Tue, 07 Apr 2020 00:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9KPwW6gv1QSgTyaBqvuvuccR22yt8OHERtZtZ45QV20=;
        b=WwSt2cfwloWFmAvZ4cKIWi95qAqUchfj3HUVgIOvUTpElpqq/n76tW7VnZqhh9d6Iy
         FIfYV4M0yuMGym13r86/PIVYozv0HUYKC4nzvmRFCiTQCqXvvRD8FWogedPewwkXPlr5
         JSzcg1QD41/V32E0EXrvAcFGs4pwVLrg95ts4Nh/o9+YvtcoLMLVlO5h7+1p4+fwEFUp
         E334smNjM+MpZ7UlcLQhG+J5+FZlw5WpB5n7Ohby1OWtbYo33/SF5RL926aMqZCpfsrs
         GCgp/N0ZG59umQBW8zSk5aofNMCKrmPPa0NP64+gkSeNc4LrdTpwkvCn+UNJSuWzNJdf
         NJMg==
X-Gm-Message-State: AGi0PubMLaG7PnzPg0IIpJA2bKW5B9SCBi8pM+qf0o1hpKT83dT4lP2N
        oSvv93W+urB5DVUUMfDErPzgcBOlrLNlIU5BzAo=
X-Google-Smtp-Source: APiQypJUPzMxv/4MrgNefdxeLOoU32bKKGVhjV9FcAL8pAgR+GgzTWByrZ8jvfBkCgjZ21+HvYrOL/5ps9Lu0L/nTBE=
X-Received: by 2002:aca:cdd1:: with SMTP id d200mr591205oig.153.1586243287374;
 Tue, 07 Apr 2020 00:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200405025123.154688-1-sboyd@kernel.org> <20200405025123.154688-7-sboyd@kernel.org>
 <CAK8P3a2M54quhRNK4xvwjz9O9oZwgrobc_wtkGaeA2PMYwOUdg@mail.gmail.com>
 <158614207114.88454.6776609424163493475@swboyd.mtv.corp.google.com>
 <CAK8P3a3Yt2woG2LMcQ0jNPGuHdMtFbBmLvtBbrWFQ4J6x3v9aQ@mail.gmail.com> <8a2a142a-106a-4241-fca5-5ef12e66cd41@linux-m68k.org>
In-Reply-To: <8a2a142a-106a-4241-fca5-5ef12e66cd41@linux-m68k.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 7 Apr 2020 09:07:56 +0200
Message-ID: <CAMuHMdV=rqpfmxtS+_kFeSiPs7cg6h2nTw4YmBKb=4kn0PuGgg@mail.gmail.com>
Subject: Re: [PATCH 6/9] clk: Allow the common clk framework to be selectable
To:     Greg Ungerer <gerg@linux-m68k.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Mark Salter <msalter@redhat.com>,
        Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Guan Xuetao <gxt@pku.edu.cn>,
        Russell King <linux@armlinux.org.uk>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        linux-c6x-dev@linux-c6x.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Greg,

On Tue, Apr 7, 2020 at 6:57 AM Greg Ungerer <gerg@linux-m68k.org> wrote:
> On 6/4/20 5:35 pm, Arnd Bergmann wrote:
> > On Mon, Apr 6, 2020 at 5:01 AM Stephen Boyd <sboyd@kernel.org> wrote:
> >> Quoting Arnd Bergmann (2020-04-05 05:45:20)
> >>> On Sun, Apr 5, 2020 at 4:51 AM Stephen Boyd <sboyd@kernel.org> wrote:
> >>>> There's one snag with doing this, and that's making sure that randconfig
> >>>> builds don't select this option when some architecture or platform
> >>>> implements 'struct clk' outside of the common clk framework. Introduce a
> >>>> new config option 'HAVE_LEGACY_CLK' to indicate those platforms that
> >>>> haven't migrated to the common clk framework and therefore shouldn't be
> >>>> allowed to select this new config option. Also add a note that we hope
> >>>> one day to remove this config entirely.

> >>>> --- a/arch/m68k/Kconfig.cpu
> >>>> +++ b/arch/m68k/Kconfig.cpu
> >>>
> >>>     text    data     bss     dec     hex filename
> >>> 1934726 263616   83284 2281626 22d09a obj/vmlinux-before
> >>> 1971989 266192   83308 2321489 236c51 obj/vmlinux-after
> >>>
> >>> The coldfire clock implementation looks rather simple compared
> >>> to chips from the 2010s: most chips have only fixed clocks,
> >>> and three of them have one of two registers of clock gates.
> >>>
> >>> It shouldn't be hard to convert, but enabling common-clk will
> >>> cause a noticeable kernel size increase on the fairly limited
> >>> hardware.
> >>>
> >>> Simply enabling COMMON_CLK in m5475evb_defconfig
> >>> results in a 1.7% or 40KB growth in kernel size, plus there
> >>> would be additional dynamic memory usage:
> >> There could certainly be some work done to reduce the code size of the
> >> CCF. I haven't looked but perhaps we could save some memory by making
> >> the basic types selectable too and then push a bunch of kconfig updates
> >> through for that.
> >
> > Right, that might help. Another possibility would be to support both
> > the common clk layer and the custom clk implementation on coldfire
> > until we remove the other custom implementations, by which point
> > even fewer people will care about coldfire.
> >
> > Let's see what Geert and Greg think would be the best path for coldfire,
> > maybe the added 40KB is less of a problem after all.
>
> Losing another 40k is not ideal, but not the end of the world.
> It would not stop me running it on any platforms I regularly
> run on. For sure some of the really old hardware just doesn't
> have the RAM to spare.
>
> Any way, I say we have to move forward and and move to using
> the common clock framework for ColdFire sooner than later.

Fine for me.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
