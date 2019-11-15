Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70A18FD7CA
	for <lists+linux-mips@lfdr.de>; Fri, 15 Nov 2019 09:16:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbfKOIQY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 Nov 2019 03:16:24 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:38829 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726182AbfKOIQY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 15 Nov 2019 03:16:24 -0500
Received: by mail-io1-f65.google.com with SMTP id i13so9521994ioj.5
        for <linux-mips@vger.kernel.org>; Fri, 15 Nov 2019 00:16:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q4BMJzZTLlAktq++AZaqhjCZzhkEXXRKlakuPbQlVSM=;
        b=dgPIXRtP8YF8PnQo+rn715P6mw4frJUXquxN/IFlPnnyV9kp5WywDq3VsDKMwBPO+m
         vgJqC+Zh2cwGNzkDa1143WQsw/VgfT4h+IEHjyNIdXEUODwzoxgXotICmRZz4w/AiBLj
         i35LebeZpWiGnSwJzSdfOBMV7NNb6fmtuMJvnuqIDMewnnalNrsd91mx+D7iMF3/n5Y5
         m5zT6uGkz0ymcdbiQCLnC3rh4uJ+Kol+EYH6KZOCKhbM60IJZlnOxXcfkdOELsGnInhG
         CicKRVQBXr5xmthuxjRtcOcorxuvgmNtYMBQ9nWWvirdNnbYXKHif/zHRF1MGfocj1Oc
         u7vA==
X-Gm-Message-State: APjAAAVmwIVWl/fvKd0vYgIq5mudpm+FK7VnOZkOBBzmiC60iwv7loOX
        QZFk1ma3LhGq6LQjVr6oohaEDxaEWXHG3PI7GjQ=
X-Google-Smtp-Source: APXvYqxh2IzuuAEJV6ReU0kPTaZH0gF6IzFyQhF84EsECp1JIzUKOdLSsubXRl5flYN86Kse6H6/wsuacA9E8NWJaYg=
X-Received: by 2002:a02:c512:: with SMTP id s18mr11486691jam.92.1573805781965;
 Fri, 15 Nov 2019 00:16:21 -0800 (PST)
MIME-Version: 1.0
References: <1572847781-21652-1-git-send-email-chenhc@lemote.com>
 <20191108191149.bbq3h4xp4famsh2n@lantea.localdomain> <CAAhV-H7v6xfBY8SpNKnhTh075=HQWggP72UN5=jQGyOH3BdFdg@mail.gmail.com>
In-Reply-To: <CAAhV-H7v6xfBY8SpNKnhTh075=HQWggP72UN5=jQGyOH3BdFdg@mail.gmail.com>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Fri, 15 Nov 2019 16:22:19 +0800
Message-ID: <CAAhV-H7drSBCsB-pMBDuQ0v-J9=vWPWaphGB2zM1Ucij6xf4TA@mail.gmail.com>
Subject: Re: [PATCH V2] MIPS: Loongson: Add board_ebase_setup() support
To:     Paul Burton <paulburton@kernel.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Paul Burton <paul.burton@mips.com>,
        Linux MIPS Mailing List <linux-mips@linux-mips.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, Paul,

On Sat, Nov 9, 2019 at 7:02 PM Huacai Chen <chenhc@lemote.com> wrote:
>
> Hi, Paul
>
> On Sat, Nov 9, 2019 at 3:11 AM Paul Burton <paulburton@kernel.org> wrote:
> >
> > Hi Huacai,
> >
> > On Mon, Nov 04, 2019 at 02:09:41PM +0800, Huacai Chen wrote:
> > > Old processors before Loongson-3A2000 have a 32bit ebase register and
> > > have no WG bit, new processors since Loongson-3A2000 have a 64bit ebase
> > > register and do have the WG bit. Unfortunately, Loongson processors
> > > which have the WG bit are slightly different from MIPS R2. This makes
> > > the generic ebase setup not suitable for every scenarios.
> >
> > Can you describe how the Loongson WG bit differs from the WG bit as
> > architecturally defined? This patch may make things work for you but it
> > doesn't give us any record of what the hardware errata is or what we
> > actually need to do to work with the broken WG bit.
> >
> > For example - right now Loongson kernels don't use the WG bit at all, so
> > what's the problem? It doesn't matter if WG has different behavior if we
> > don't use it.
> >
> > So one option here might be to just continue to not indicate support for
> > the WG bit. It does look like the kernel ought to be ensuring the
> > exception vector it allocates is at a suitable address in this case, and
> > currently isn't. Something like the (untested) patch below ought to
> > address that. In practice though memblock is configured to allocate
> > bottom-up until after this point so it should be unlikely we'll get an
> > unsuitable address, and there's a WARN_ON() in trap_init() that would
> > already tell you if that happened.
> >
> > > To make Loongson's kernel be more robust, we add a board_ebase_setup()
> > > hook to ensure that CKSEG0 is always used for ebase. This is also useful
> > > on platforms where BIOS doesn't initialise an appropriate ebase.
> >
> > Can you also elaborate on that? I'm not sure why this would help on
> > systems that don't initialize EBase - the kernel unconditionally sets
> > EBase for >= MIPSr2 systems in configure_exception_vector() anyway, and
> > since v5.2 it doesn't even try to inherit whatever the bootloader used.
> >
> I'm sorry that I haven't seen the changes in 5.2. My original problem
> has been fixed with the below two commits.
> 172dcd935c34b022729f45a7bbaae5cc052 ("MIPS: Always allocate exception
> vector for MIPSr2+")
> de56d4c1da3e68f0ca468a55f6677bef3cee ("MIPS: Remove duplicate EBase
> configuration")
>
> My own patch is only needed in 4.9/4.14/4.19, and I can backport the
> above two commits while completely drop my own patch.
Maybe this patch is still neccesary. The above two commits surely make
it possible to boot with any firmware, but dynamically allocated ebase
cannot work perfectly with STR(suspend) and STD(hibernation).

STR is fixable, because we can save ebase at suspend and restore it at
resume. However, STD is very diffcult to fix, because we cannot assure
the ebase allocated by the new kernel is the same as the old kernel,
and I think change ebase during kernel switching is dangerous.

So could you please consider to accept this patch? Thanks.
>
> Thanks,
> Huacai
>
> > Thanks,
> >     Paul
> >
> > ---
> > diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
> > index 342e41de9d64..a25ee41eff48 100644
> > --- a/arch/mips/kernel/traps.c
> > +++ b/arch/mips/kernel/traps.c
> > @@ -2271,7 +2271,7 @@ void __init trap_init(void)
> >         extern char except_vec4;
> >         extern char except_vec3_r4000;
> >         unsigned long i, vec_size;
> > -       phys_addr_t ebase_pa;
> > +       phys_addr_t ebase_pa, ebase_limit;
> >
> >         check_wait();
> >
> > @@ -2287,7 +2287,21 @@ void __init trap_init(void)
> >                 else
> >                         vec_size = PAGE_SIZE;
> >
> > -               ebase_pa = memblock_phys_alloc(vec_size, 1 << fls(vec_size));
> > +               /*
> > +                * If we have support for the EBase.WG bit then allow the
> > +                * exception vector to be located anywhere. When EBase.WG is
> > +                * not supported EBase is limited to a (c)kseg[01] address, so
> > +                * we must ensure the allocated vector is in memory accessible
> > +                * via those unmapped regions.
> > +                */
> > +               if (cpu_has_ebase_wg)
> > +                       ebase_limit = MEMBLOCK_ALLOC_ACCESSIBLE;
> > +               else
> > +                       ebase_limit = CKSEG1 - CKSEG0;
> > +
> > +               ebase_pa = memblock_phys_alloc_range(vec_size,
> > +                                                    1 << fls(vec_size),
> > +                                                    0, ebase_limit);
> >                 if (!ebase_pa)
> >                         panic("%s: Failed to allocate %lu bytes align=0x%x\n",
> >                               __func__, vec_size, 1 << fls(vec_size));
