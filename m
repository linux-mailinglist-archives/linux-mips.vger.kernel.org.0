Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAA893E9496
	for <lists+linux-mips@lfdr.de>; Wed, 11 Aug 2021 17:35:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233058AbhHKPgC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Aug 2021 11:36:02 -0400
Received: from mail-vs1-f42.google.com ([209.85.217.42]:42700 "EHLO
        mail-vs1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233010AbhHKPgC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Aug 2021 11:36:02 -0400
Received: by mail-vs1-f42.google.com with SMTP id k24so1764345vsg.9;
        Wed, 11 Aug 2021 08:35:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qe0iSj8XpU18YU856j4Cl+K1mgU1eag6gHjOJIBodYU=;
        b=NxbMnEOENBHaXg4NMprVdhDf6hm/iv8kojr90GBi/mZJvHW2UBFe3kuT37cSCMFpOJ
         WSKTIZrLDfHkr3TCElHHczCSfqT94Kl8POn7qJ0H8q4XD+QeFIVI7O5D/ASitH+1RsVz
         ImwdIRcCp1UJetSE/xdF/uDTnW6WoN0evVQbWoBYLEcLzF4rJUGNwJa/uP9naCWVfW+B
         5C7uFG3wWW+2dYv59oZRPPhbDzgWUUYfWyNbf5SDQtHLCFUPjH8pekxT2uziRhGOcxTy
         PkPqp8ozJMKO2RWf6QFF4q7HbJu1awxrLDiqUidDKLSAugYQYAd9RxKGw4jsRdErdNsf
         NdNQ==
X-Gm-Message-State: AOAM532FKs2F8dhaSJE9z8LbThpgml7plQ1eXadzYFJKB/UZW59xx9Vq
        MxkfEDSVkqERhRomXeWlr5HDusICQEN7n/4Yzos=
X-Google-Smtp-Source: ABdhPJyCg7XeMMJOVeEoBRA0hgH3tr2A9kDf4d5be/Soj53sLrczZ+iXFRzYK6VNuP5kM7qaaKYjO/TzUNz0MI9TmgQ=
X-Received: by 2002:a67:8009:: with SMTP id b9mr27769636vsd.18.1628696137555;
 Wed, 11 Aug 2021 08:35:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1628670468.git.geert+renesas@glider.be> <92b6718f5618d5469f67b48fbea189cca0c12f4b.1628670468.git.geert+renesas@glider.be>
In-Reply-To: <92b6718f5618d5469f67b48fbea189cca0c12f4b.1628670468.git.geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 11 Aug 2021 17:35:26 +0200
Message-ID: <CAMuHMdVFJ_qGs0V7f+XhfD6v3WnkMJ98fO31sCRSNaeS89XXUQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] MIPS: Avoid future duplicate elf core header reservation
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Russell King <linux@armlinux.org.uk>,
        Rob Herring <robh+dt@kernel.org>,
        Nicolas Pitre <nico@fluxnic.net>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Nick Kossifidis <mick@ics.forth.gr>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Frank Rowand <frowand.list@gmail.com>,
        Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>,
        Mike Rapoport <rppt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        kexec@lists.infradead.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Aug 11, 2021 at 10:51 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Prepare for early_init_fdt_scan_reserved_mem() reserving the memory
> occupied by an elf core header described in the device tree.
> As arch_mem_init() calls early_init_fdt_scan_reserved_mem() before
> mips_reserve_vmcore(), the latter needs to check if the memory has
> already been reserved before.
>
> Note that mips_reserve_vmcore() cannot just be removed, as not all MIPS
> systems use DT.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v5:
>   - New.
> ---
>  arch/mips/kernel/setup.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
> index 23a140327a0bac1b..4693add05743d78b 100644
> --- a/arch/mips/kernel/setup.c
> +++ b/arch/mips/kernel/setup.c
> @@ -429,7 +429,8 @@ static void __init mips_reserve_vmcore(void)
>         pr_info("Reserving %ldKB of memory at %ldKB for kdump\n",
>                 (unsigned long)elfcorehdr_size >> 10, (unsigned long)elfcorehdr_addr >> 10);
>
> -       memblock_reserve(elfcorehdr_addr, elfcorehdr_size);
> +       if (!memblock_is_region_reserved(elfcorehdr_addr, elfcorehdr_size)

As pointed out by lkp, there's a closing parenthesis missing.

/me hides back under his rock.

> +               memblock_reserve(elfcorehdr_addr, elfcorehdr_size);
>  #endif

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
