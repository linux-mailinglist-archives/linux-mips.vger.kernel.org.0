Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8E9EF5E8C
	for <lists+linux-mips@lfdr.de>; Sat,  9 Nov 2019 11:56:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbfKIK4R (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 9 Nov 2019 05:56:17 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:34660 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726143AbfKIK4Q (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 9 Nov 2019 05:56:16 -0500
Received: by mail-il1-f196.google.com with SMTP id p6so7464335ilp.1
        for <linux-mips@vger.kernel.org>; Sat, 09 Nov 2019 02:56:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p+HNynEYlSDYoAok7MPbk43uDfLD40rcs5XnqKwKpLU=;
        b=QTn8lH5cErlMq9WrJNIh2ysqpvtQhHXmNQTl+VMVOfTjnGqwb4j4Zoy8bdxi4V+3Jn
         jZ9a+wO86FDPxADwPmJbQifdOVLRMi/uqG/kKr1wot1Dd3E0G86UXILInrzcdOp1z8Ba
         OIfwbAER6lMa/EVnjXVUYqcPTPHZ38ngWJY51vE0fVoqNYTNJN73f2053Dhg49D94efk
         Y/Ue/ZXjXz9w/z/3kW2cEEVqijS1SbAISlRl69LI0Vtilt4Cbz77rANrZxT4x8F5eXzA
         w5IoU1QV+trZ4WV25xjciWksk9jzQOEd9MGpvPgzqc+GIkZoBJv1meL4Hnw2KJWtmm88
         4U0A==
X-Gm-Message-State: APjAAAUkl/zrZ2NzkHTkULSURluEKb1t5v5DLZt6CVOrvGDal4+pC1bb
        DrbJDVLzIymsslqKhh2Q0Ub0vuEWA8U2noQH724=
X-Google-Smtp-Source: APXvYqwYsxGDf3wQIkHhhUyBGhPBOHPJGaR1vXuAaaq6GfdY6DtNz9ZiiZAA1303DA+hFVLuqD2YyUq+jW9D+uy/sos=
X-Received: by 2002:a92:5d8f:: with SMTP id e15mr19333143ilg.173.1573296974194;
 Sat, 09 Nov 2019 02:56:14 -0800 (PST)
MIME-Version: 1.0
References: <1572847781-21652-1-git-send-email-chenhc@lemote.com> <20191108191149.bbq3h4xp4famsh2n@lantea.localdomain>
In-Reply-To: <20191108191149.bbq3h4xp4famsh2n@lantea.localdomain>
From:   Huacai Chen <chenhc@lemote.com>
Date:   Sat, 9 Nov 2019 19:02:01 +0800
Message-ID: <CAAhV-H7v6xfBY8SpNKnhTh075=HQWggP72UN5=jQGyOH3BdFdg@mail.gmail.com>
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

Hi, Paul

On Sat, Nov 9, 2019 at 3:11 AM Paul Burton <paulburton@kernel.org> wrote:
>
> Hi Huacai,
>
> On Mon, Nov 04, 2019 at 02:09:41PM +0800, Huacai Chen wrote:
> > Old processors before Loongson-3A2000 have a 32bit ebase register and
> > have no WG bit, new processors since Loongson-3A2000 have a 64bit ebase
> > register and do have the WG bit. Unfortunately, Loongson processors
> > which have the WG bit are slightly different from MIPS R2. This makes
> > the generic ebase setup not suitable for every scenarios.
>
> Can you describe how the Loongson WG bit differs from the WG bit as
> architecturally defined? This patch may make things work for you but it
> doesn't give us any record of what the hardware errata is or what we
> actually need to do to work with the broken WG bit.
>
> For example - right now Loongson kernels don't use the WG bit at all, so
> what's the problem? It doesn't matter if WG has different behavior if we
> don't use it.
>
> So one option here might be to just continue to not indicate support for
> the WG bit. It does look like the kernel ought to be ensuring the
> exception vector it allocates is at a suitable address in this case, and
> currently isn't. Something like the (untested) patch below ought to
> address that. In practice though memblock is configured to allocate
> bottom-up until after this point so it should be unlikely we'll get an
> unsuitable address, and there's a WARN_ON() in trap_init() that would
> already tell you if that happened.
>
> > To make Loongson's kernel be more robust, we add a board_ebase_setup()
> > hook to ensure that CKSEG0 is always used for ebase. This is also useful
> > on platforms where BIOS doesn't initialise an appropriate ebase.
>
> Can you also elaborate on that? I'm not sure why this would help on
> systems that don't initialize EBase - the kernel unconditionally sets
> EBase for >= MIPSr2 systems in configure_exception_vector() anyway, and
> since v5.2 it doesn't even try to inherit whatever the bootloader used.
>
I'm sorry that I haven't seen the changes in 5.2. My original problem
has been fixed with the below two commits.
172dcd935c34b022729f45a7bbaae5cc052 ("MIPS: Always allocate exception
vector for MIPSr2+")
de56d4c1da3e68f0ca468a55f6677bef3cee ("MIPS: Remove duplicate EBase
configuration")

My own patch is only needed in 4.9/4.14/4.19, and I can backport the
above two commits while completely drop my own patch.

Thanks,
Huacai

> Thanks,
>     Paul
>
> ---
> diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
> index 342e41de9d64..a25ee41eff48 100644
> --- a/arch/mips/kernel/traps.c
> +++ b/arch/mips/kernel/traps.c
> @@ -2271,7 +2271,7 @@ void __init trap_init(void)
>         extern char except_vec4;
>         extern char except_vec3_r4000;
>         unsigned long i, vec_size;
> -       phys_addr_t ebase_pa;
> +       phys_addr_t ebase_pa, ebase_limit;
>
>         check_wait();
>
> @@ -2287,7 +2287,21 @@ void __init trap_init(void)
>                 else
>                         vec_size = PAGE_SIZE;
>
> -               ebase_pa = memblock_phys_alloc(vec_size, 1 << fls(vec_size));
> +               /*
> +                * If we have support for the EBase.WG bit then allow the
> +                * exception vector to be located anywhere. When EBase.WG is
> +                * not supported EBase is limited to a (c)kseg[01] address, so
> +                * we must ensure the allocated vector is in memory accessible
> +                * via those unmapped regions.
> +                */
> +               if (cpu_has_ebase_wg)
> +                       ebase_limit = MEMBLOCK_ALLOC_ACCESSIBLE;
> +               else
> +                       ebase_limit = CKSEG1 - CKSEG0;
> +
> +               ebase_pa = memblock_phys_alloc_range(vec_size,
> +                                                    1 << fls(vec_size),
> +                                                    0, ebase_limit);
>                 if (!ebase_pa)
>                         panic("%s: Failed to allocate %lu bytes align=0x%x\n",
>                               __func__, vec_size, 1 << fls(vec_size));
