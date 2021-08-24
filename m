Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B0CA3F5D70
	for <lists+linux-mips@lfdr.de>; Tue, 24 Aug 2021 13:55:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236966AbhHXL4a (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Aug 2021 07:56:30 -0400
Received: from mail-vk1-f180.google.com ([209.85.221.180]:38515 "EHLO
        mail-vk1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236939AbhHXL4a (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 24 Aug 2021 07:56:30 -0400
Received: by mail-vk1-f180.google.com with SMTP id k124so5429729vke.5;
        Tue, 24 Aug 2021 04:55:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XfgeSNPVMKWrfXyFj8jprqwXpb9tNGH+Wb+KqyJb9gQ=;
        b=qVrNOE423FmYdfxN0qo2eJSQWhpI1/CVIypQCppLZoegkSnd5BPdxw9qStKAWLHkFT
         z3A0Y+bq6viWu47pUgeDgrl4fMXeIjPue4SwC8JTlemJ4/HTiH+pf2JQMOiKivPL4cso
         6+NODu3x3pOJJKBR8T322l/FFvaJ+D4zCiMshz6hHU407xUxcIqQ3DbJ6/QkP0c55BBS
         Vcjff+o8+wNYc+g82IUQyzqCT6w8kEWXWzQsjtvyYW9vjpiPshm1vOhu9nnOn9VIWAzT
         uUsR5hbGJULSHNMeu9mFNlkGyVEJIk8X9DmDO9cjMXjjfbpXeljnBY0XanRZvRWpmEX8
         xXlg==
X-Gm-Message-State: AOAM531DskKYgEU9UJCtUfmp1c0BJrTukI2jcwsF0s4PZdgoNzNxWJnk
        f3j6SxJ6Wpit11UHTErUwR9AS2Q/hVR5AB31ki4=
X-Google-Smtp-Source: ABdhPJyF2wRPCJa9TS8UTuYi45dG+oebI6qeiCjlOVZk/DVs/Dyj3ugAf0SqlejD7IoDmVPYRh8sFRN0eHUzW9fAJ6o=
X-Received: by 2002:a05:6122:809:: with SMTP id 9mr295247vkj.4.1629806145488;
 Tue, 24 Aug 2021 04:55:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1628670468.git.geert+renesas@glider.be> <YRkxzx/1XM3r64Ee@robh.at.kernel.org>
 <CAMuHMdXs0+7K4N0mg6qX6X1cr_8dBr_HdTahdfORMk76wCJcEA@mail.gmail.com> <CAL_JsqK63hoEMafLP+5eeQR1qrhOO76J4KEQG_By6QnLfhF=dw@mail.gmail.com>
In-Reply-To: <CAL_JsqK63hoEMafLP+5eeQR1qrhOO76J4KEQG_By6QnLfhF=dw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 24 Aug 2021 13:55:34 +0200
Message-ID: <CAMuHMdVNi4bh0Kp43BrVVKD8YY5ac4yi9=W3QZmw=stmwwtuiQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Add generic support for kdump DT properties
To:     Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc:     Nicolas Pitre <nico@fluxnic.net>, Ard Biesheuvel <ardb@kernel.org>,
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
        Mike Rapoport <rppt@kernel.org>,
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

On Mon, Aug 23, 2021 at 4:52 PM Rob Herring <robh@kernel.org> wrote:
> On Mon, Aug 23, 2021 at 5:13 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Sun, Aug 15, 2021 at 5:25 PM Rob Herring <robh@kernel.org> wrote:
> > > On Wed, Aug 11, 2021 at 10:50:58AM +0200, Geert Uytterhoeven wrote:
> > > > This patch series adds generic support for parsing DT properties related
> > > > to crash dump kernels ("linux,elfcorehdr" and "linux,elfcorehdr" under
> > > > the "/chosen" node), makes use of it on arm32, and performs a few
> > > > cleanups.  It is an evolution of the combination of [1] and [2].
> > >
> > > The DT bits look fine to me. How do you expect this to be merged? I'm
> > > happy to take it if arch maintainers can ack it.
> >
> > I had hoped you could take the series...
>
> My current thought is I'll take 2-5, 7 and 8 given that's what I have
> acks for and the others can be applied independently.

Note that Palmer did ack patch 6, so you can include it.

Russell: any thoughts about patch 9?

Thanks!

> > > > The series consists of 6 parts:
> > > >   1. Patch 1 prepares architecture-specific code (needed for MIPS only)
> > > >      to avoid duplicating elf core header reservation later.
> > > >   2. Patch 2 prepares the visibility of variables used to hold
> > > >      information retrieved from the DT properties.
> > > >   3. Patches 3-5 add support to the FDT core for handling the
> > > >      properties.
> > > >      This can co-exist safely with architecture-specific handling, until
> > > >      the latter has been removed.
> > >
> > > Looks like patch 5 doesn't have any dependencies with the series?
> >
> > Indeed. So you can take it independently.
> >
> > > >   4. Patch 6 removes the non-standard handling of "linux,elfcorehdr" on
> > > >      riscv.
> > >
> > > I thought this should be applied for 5.14?
> >
> > Me too, but unfortunately that hasn't happened yet...
>
> Buried in the middle of this series is not going to encourage it to be
> picked up as a fix.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
