Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B86E73F4C8F
	for <lists+linux-mips@lfdr.de>; Mon, 23 Aug 2021 16:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230281AbhHWOpv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Aug 2021 10:45:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:40750 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230186AbhHWOpv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 23 Aug 2021 10:45:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9140F613CF;
        Mon, 23 Aug 2021 14:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629729908;
        bh=HS2M+wkDtx/G0MZSg6+SDwYSA3teAsEDvrv+10PPD1A=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qPKYxgfB9GVNO/ci0L6xILxIQPPJGBHIQJy4YMnj0Zw7zF7wGjfzynHM07q/hdtFJ
         fzjZSr+FNFIn8DCHJscN7WHtmTm/qhJneZMJJj08w7k3nJ838qAJNWc+vVoaXF87+1
         iNcj8INOwKrfvditV+DxlUtQ8DX4lAbEXz/sDy2ACAgKAp+HvHvaZhS0+UZJN4VgMH
         GPAZlRaNM4E4saszqP0w189j7NDctQFAvm5aZhrYjAQHhd9mTXKAONYbcAz4L1fskn
         IpHuinmaVCOcnYZwI5rcTj2KMKe0BjZ4hk50UN58HZdjfm9uvmn9CsDQYSUqstrZ9J
         Jky99juD8VeBQ==
Received: by mail-ej1-f48.google.com with SMTP id n27so5597739eja.5;
        Mon, 23 Aug 2021 07:45:08 -0700 (PDT)
X-Gm-Message-State: AOAM531MEUyxgeIaj9j3I1BTJ5VtAo4c/J7JBjNhCaINJBEdNIN8GKY6
        xQU8a+/9cjlRVYzvnRkmHTosyJU97M90Mk4fTw==
X-Google-Smtp-Source: ABdhPJxGMCnkZ6Wg5JPxtvBTf03t6XhofzKZ3GpTAEgQlSG7jl4bDW3CMJL9Gl4hxiY+ePwWhCIra0pqlfZDMAM51Ag=
X-Received: by 2002:a17:907:b06:: with SMTP id h6mr3650075ejl.130.1629729907110;
 Mon, 23 Aug 2021 07:45:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1628670468.git.geert+renesas@glider.be> <92b6718f5618d5469f67b48fbea189cca0c12f4b.1628670468.git.geert+renesas@glider.be>
 <YRn9DHlB/pdNPJyP@kernel.org> <CAMuHMdVdqR7gw+2O2v=qv_BB=+X2wEXN9jXV=np=jRayadwj7g@mail.gmail.com>
 <YSOeGzowhV/R9QS/@kernel.org>
In-Reply-To: <YSOeGzowhV/R9QS/@kernel.org>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 23 Aug 2021 09:44:55 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLMv4fKebJEOv=7UXvy_qqut0N42psS-PSgRMU-qhiFLQ@mail.gmail.com>
Message-ID: <CAL_JsqLMv4fKebJEOv=7UXvy_qqut0N42psS-PSgRMU-qhiFLQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/9] MIPS: Avoid future duplicate elf core header reservation
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
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

On Mon, Aug 23, 2021 at 8:10 AM Mike Rapoport <rppt@kernel.org> wrote:
>
> On Mon, Aug 23, 2021 at 12:17:50PM +0200, Geert Uytterhoeven wrote:
> > Hi Mike,
> >
> > On Mon, Aug 16, 2021 at 7:52 AM Mike Rapoport <rppt@kernel.org> wrote:
> > > On Wed, Aug 11, 2021 at 10:50:59AM +0200, Geert Uytterhoeven wrote:
> > > > Prepare for early_init_fdt_scan_reserved_mem() reserving the memory
> > > > occupied by an elf core header described in the device tree.
> > > > As arch_mem_init() calls early_init_fdt_scan_reserved_mem() before
> > > > mips_reserve_vmcore(), the latter needs to check if the memory has
> > > > already been reserved before.
> > >
> > > Doing memblock_reserve() for the same region is usually fine, did you
> > > encounter any issues without this patch?
> >
> > Does it also work if the same region is part of an earlier larger
> > reservation?  I am no memblock expert, so I don't know.
> > I didn't run into any issues, as my MIPS platform is non-DT, but I
> > assume arch/arm64/mm/init.c:reserve_elfcorehdr() had the check for
> > a reason.
>
> The memory will be reserved regardless of the earlier reservation, the
> issue may appear when the reservations are made for different purpose. E.g.
> if there was crash kernel allocation before the reservation of elfcorehdr.
>
> The check in such case will prevent the second reservation, but, at least
> in arch/arm64/mm/init.c:reserve_elfcorehdr() it does not seem to prevent
> different users of the overlapping regions to step on each others toes.

If the kernel has been passed in overlapping regions, is there
anything you can do other than hope to get a message out?

> Moreover, arm64::reserve_elfcorehdr() seems buggy to me, because of there
> is only a partial overlap of the elfcorehdr with the previous reservation,
> the non-overlapping part of elfcorehdr won't get reserved at all.

What do you suggest as the arm64 version is not the common version?

Rob
