Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16F6C3F4876
	for <lists+linux-mips@lfdr.de>; Mon, 23 Aug 2021 12:18:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233481AbhHWKSp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Aug 2021 06:18:45 -0400
Received: from mail-vs1-f53.google.com ([209.85.217.53]:38752 "EHLO
        mail-vs1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233518AbhHWKSo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 23 Aug 2021 06:18:44 -0400
Received: by mail-vs1-f53.google.com with SMTP id t4so7850349vsm.5;
        Mon, 23 Aug 2021 03:18:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fn6frUv3RQ/aTjcmQj/o89ICwJB87FoHT5MS19YzVHM=;
        b=fiqr3sG6gy0h+XgQeywAVSA2hkFj3Keio8jHmi9liC06PECDccy0t2kCjr3lZ1+Jjr
         VeMeBGqv734n/BPWiHEdqzxQy13rOC9dPmlOcpoCN/ahGne26TERbyw1Lm8NNx9Fafcp
         0P+6+f3VGS5/msLEWIBufYGwhUAxXX/WUo6b0wGUwTK7RbzAgMq4VTaUoBdZSwlvy4n6
         fEBw3Pi+YGh+5Tsbkj5om2PmS8alhh0oU9n9rDihUiAWmQCU2SUWT6ETHlAm3lKKED+7
         QXqzwfknIEs8jCDKIpvmxp2CdAux+SDrZ1n6iDSDlQG1I7rx1PT3wRRnBz9Ugs8ZJqGd
         rbtg==
X-Gm-Message-State: AOAM533rQMK/YfsC71vQzxLAS8LEDvRJlGBgWPalPanRQIxciD6ICkMV
        nCYrVPacVSCr17MP3u8bdJtcybBAvYw6qddKm7s=
X-Google-Smtp-Source: ABdhPJwlCanF14EHYCKCFLIhNlaGYU+ggYsOisyFUA/DqJkwdSAMQnOyL5VqX+D7DhPY+/mopUoKoyjACSnbySpEy0c=
X-Received: by 2002:a67:c789:: with SMTP id t9mr23378055vsk.60.1629713881619;
 Mon, 23 Aug 2021 03:18:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1628670468.git.geert+renesas@glider.be> <92b6718f5618d5469f67b48fbea189cca0c12f4b.1628670468.git.geert+renesas@glider.be>
 <YRn9DHlB/pdNPJyP@kernel.org>
In-Reply-To: <YRn9DHlB/pdNPJyP@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 23 Aug 2021 12:17:50 +0200
Message-ID: <CAMuHMdVdqR7gw+2O2v=qv_BB=+X2wEXN9jXV=np=jRayadwj7g@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] MIPS: Avoid future duplicate elf core header reservation
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Kossifidis <mick@ics.forth.gr>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Frank Rowand <frowand.list@gmail.com>,
        Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        kexec@lists.infradead.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Mike,

On Mon, Aug 16, 2021 at 7:52 AM Mike Rapoport <rppt@kernel.org> wrote:
> On Wed, Aug 11, 2021 at 10:50:59AM +0200, Geert Uytterhoeven wrote:
> > Prepare for early_init_fdt_scan_reserved_mem() reserving the memory
> > occupied by an elf core header described in the device tree.
> > As arch_mem_init() calls early_init_fdt_scan_reserved_mem() before
> > mips_reserve_vmcore(), the latter needs to check if the memory has
> > already been reserved before.
>
> Doing memblock_reserve() for the same region is usually fine, did you
> encounter any issues without this patch?

Does it also work if the same region is part of an earlier larger
reservation?  I am no memblock expert, so I don't know.
I didn't run into any issues, as my MIPS platform is non-DT, but I
assume arch/arm64/mm/init.c:reserve_elfcorehdr() had the check for
a reason.

Thanks!

>
> > Note that mips_reserve_vmcore() cannot just be removed, as not all MIPS
> > systems use DT.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v5:
> >   - New.
> > ---
> >  arch/mips/kernel/setup.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> > index 23a140327a0bac1b..4693add05743d78b 100644
> > --- a/arch/mips/kernel/setup.c
> > +++ b/arch/mips/kernel/setup.c
> > @@ -429,7 +429,8 @@ static void __init mips_reserve_vmcore(void)
> >       pr_info("Reserving %ldKB of memory at %ldKB for kdump\n",
> >               (unsigned long)elfcorehdr_size >> 10, (unsigned long)elfcorehdr_addr >> 10);
> >
> > -     memblock_reserve(elfcorehdr_addr, elfcorehdr_size);
> > +     if (!memblock_is_region_reserved(elfcorehdr_addr, elfcorehdr_size)
> > +             memblock_reserve(elfcorehdr_addr, elfcorehdr_size);
> >  #endif
> >  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
