Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 069B33F4CAA
	for <lists+linux-mips@lfdr.de>; Mon, 23 Aug 2021 16:52:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230384AbhHWOxV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Aug 2021 10:53:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:42010 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230166AbhHWOxU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 23 Aug 2021 10:53:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C04F6613B3;
        Mon, 23 Aug 2021 14:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629730353;
        bh=95kSV68n0dpCCRUmMY5PPrmt84oo0wFMRjTfsjZdteg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Ik7GtlWL3XwZ6jqLY8wD2dMPkqgIADw9+NOe1Mw5Y9wL8Ob1L1ZWO55L8QppisdbM
         jRutPdbSED+7HzgxY5p7UqIxkqo7sV3d+DokWvYAnWL07BEyC6Co5Qyn55QZoRMLNa
         feDAaHy5RcNjkEFxYgjtQM24FqzUXGPPhI1lwyANIWvlbXDR0xTPGuHBMXDJx1ovKK
         Ly93dRR3jtoGZCR271SrqRHy4l1rU1KxApzZdoQZ+kyslZfHy+Bz5iEQ39/1tHo8j2
         Jx6GXTFn1SWeGIZtN1/iHz73LBrRrTzlzKHXoCaTx7/RZljk1jUt/UeXL1SUD8itXh
         narNQBH53/f5Q==
Received: by mail-ed1-f52.google.com with SMTP id d6so26634310edt.7;
        Mon, 23 Aug 2021 07:52:33 -0700 (PDT)
X-Gm-Message-State: AOAM532vHeMvIfdzF9sj4RHXO24ywLE1doEPn6/YAII4j9NC/PUlxWz4
        GQAjz0govhh+3VJBf8s9t3tQDYVUQlMoUtE0Dg==
X-Google-Smtp-Source: ABdhPJy1bCMbL4YGtSLOxVSdg1ups6Ob2RljDGjUf8dlwlp/X6+ZF3IAe5w4+7XIcmdRLOHvmaJrv6lkF74HB0qCbkE=
X-Received: by 2002:aa7:c487:: with SMTP id m7mr18233689edq.62.1629730352256;
 Mon, 23 Aug 2021 07:52:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1628670468.git.geert+renesas@glider.be> <YRkxzx/1XM3r64Ee@robh.at.kernel.org>
 <CAMuHMdXs0+7K4N0mg6qX6X1cr_8dBr_HdTahdfORMk76wCJcEA@mail.gmail.com>
In-Reply-To: <CAMuHMdXs0+7K4N0mg6qX6X1cr_8dBr_HdTahdfORMk76wCJcEA@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 23 Aug 2021 09:52:20 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK63hoEMafLP+5eeQR1qrhOO76J4KEQG_By6QnLfhF=dw@mail.gmail.com>
Message-ID: <CAL_JsqK63hoEMafLP+5eeQR1qrhOO76J4KEQG_By6QnLfhF=dw@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Add generic support for kdump DT properties
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Russell King <linux@armlinux.org.uk>,
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

On Mon, Aug 23, 2021 at 5:13 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Rob,
>
> On Sun, Aug 15, 2021 at 5:25 PM Rob Herring <robh@kernel.org> wrote:
> > On Wed, Aug 11, 2021 at 10:50:58AM +0200, Geert Uytterhoeven wrote:
> > > This patch series adds generic support for parsing DT properties related
> > > to crash dump kernels ("linux,elfcorehdr" and "linux,elfcorehdr" under
> > > the "/chosen" node), makes use of it on arm32, and performs a few
> > > cleanups.  It is an evolution of the combination of [1] and [2].
> >
> > The DT bits look fine to me. How do you expect this to be merged? I'm
> > happy to take it if arch maintainers can ack it.
>
> I had hoped you could take the series...

My current thought is I'll take 2-5, 7 and 8 given that's what I have
acks for and the others can be applied independently.

> > > The series consists of 6 parts:
> > >   1. Patch 1 prepares architecture-specific code (needed for MIPS only)
> > >      to avoid duplicating elf core header reservation later.
> > >   2. Patch 2 prepares the visibility of variables used to hold
> > >      information retrieved from the DT properties.
> > >   3. Patches 3-5 add support to the FDT core for handling the
> > >      properties.
> > >      This can co-exist safely with architecture-specific handling, until
> > >      the latter has been removed.
> >
> > Looks like patch 5 doesn't have any dependencies with the series?
>
> Indeed. So you can take it independently.
>
> > >   4. Patch 6 removes the non-standard handling of "linux,elfcorehdr" on
> > >      riscv.
> >
> > I thought this should be applied for 5.14?
>
> Me too, but unfortunately that hasn't happened yet...

Buried in the middle of this series is not going to encourage it to be
picked up as a fix.

Rob
