Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8376A3F485B
	for <lists+linux-mips@lfdr.de>; Mon, 23 Aug 2021 12:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233444AbhHWKOY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Aug 2021 06:14:24 -0400
Received: from mail-vs1-f50.google.com ([209.85.217.50]:39455 "EHLO
        mail-vs1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232890AbhHWKOY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 23 Aug 2021 06:14:24 -0400
Received: by mail-vs1-f50.google.com with SMTP id e9so10719571vst.6;
        Mon, 23 Aug 2021 03:13:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QGWlxXbqp4C9V0pOALutj8L5f0IIEa5u3E7vAfklyGo=;
        b=SIi2V6dyjKIL/fg+PPR92B32IH5ZqM6GbyIP1iquL64x6g9uMeLmGR3icsh4ME06dz
         WL4kmPrRm4OgnqIi6UCv5lwetbC9ByeOgijrE8Odt0jH06lou5V0NrVrSFK4ZtHYSdAc
         dDzZ+Uh2Owj9Fp2bQWuBPgIGjmV9IgPhrlEtF9Ia8YWVejqoTngHZlSUQ5xcUXmjXNS+
         qyVR6yMAaJWvqCE7a79kgin3vWfvWE3noz8ZBN+IQlJTciFWBqoNvyME5EsIxqxSpeSZ
         haMQbgPJdbuGLyLDkVTIqIZefdAYKHdrkx+PwrQsxHeTQaBz/QMnF+iorsFTQRJHcJsp
         qLyg==
X-Gm-Message-State: AOAM530Y6/PLy3pogCZt663u6PjFJelhQX+s5KS0Xn6uuuz143EATOjs
        T4v/FB2UkNfsQXpINWtD5DvWfrHbVDi7P0yBjao=
X-Google-Smtp-Source: ABdhPJyH0E1pyhC89wWPYYQoaEHA/nfpaJPSksxoQnbMkworBUBLdcC7hq0D2zToet9d4s7ykx8MrywnipUtR++lG+Q=
X-Received: by 2002:a67:6e86:: with SMTP id j128mr22666984vsc.26.1629713621125;
 Mon, 23 Aug 2021 03:13:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1628670468.git.geert+renesas@glider.be> <YRkxzx/1XM3r64Ee@robh.at.kernel.org>
In-Reply-To: <YRkxzx/1XM3r64Ee@robh.at.kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 23 Aug 2021 12:13:29 +0200
Message-ID: <CAMuHMdXs0+7K4N0mg6qX6X1cr_8dBr_HdTahdfORMk76wCJcEA@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Add generic support for kdump DT properties
To:     Rob Herring <robh@kernel.org>
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

Hi Rob,

On Sun, Aug 15, 2021 at 5:25 PM Rob Herring <robh@kernel.org> wrote:
> On Wed, Aug 11, 2021 at 10:50:58AM +0200, Geert Uytterhoeven wrote:
> > This patch series adds generic support for parsing DT properties related
> > to crash dump kernels ("linux,elfcorehdr" and "linux,elfcorehdr" under
> > the "/chosen" node), makes use of it on arm32, and performs a few
> > cleanups.  It is an evolution of the combination of [1] and [2].
>
> The DT bits look fine to me. How do you expect this to be merged? I'm
> happy to take it if arch maintainers can ack it.

I had hoped you could take the series...

> > The series consists of 6 parts:
> >   1. Patch 1 prepares architecture-specific code (needed for MIPS only)
> >      to avoid duplicating elf core header reservation later.
> >   2. Patch 2 prepares the visibility of variables used to hold
> >      information retrieved from the DT properties.
> >   3. Patches 3-5 add support to the FDT core for handling the
> >      properties.
> >      This can co-exist safely with architecture-specific handling, until
> >      the latter has been removed.
>
> Looks like patch 5 doesn't have any dependencies with the series?

Indeed. So you can take it independently.

> >   4. Patch 6 removes the non-standard handling of "linux,elfcorehdr" on
> >      riscv.
>
> I thought this should be applied for 5.14?

Me too, but unfortunately that hasn't happened yet...

> >   5. Patches 7-8 convert arm64 to use the generic handling instead of
> >      its own implementation.
> >   6. Patch 9 adds support for kdump properties to arm32.
> >      The corresponding patch for kexec-tools is "[PATCH] arm: kdump: Add
> >      DT properties to crash dump kernel's DTB"[3], which is still valid.
>
> This one can be applied on its own, right?

While that wouldn't break anything (i.e. no regression), it still
wouldn't work if the DT properties are present, and the now-legacy
"mem=" kernel command line parameter is not.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
