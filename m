Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6D7E3F6BC8
	for <lists+linux-mips@lfdr.de>; Wed, 25 Aug 2021 00:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbhHXWoq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Aug 2021 18:44:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:47204 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229521AbhHXWop (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 24 Aug 2021 18:44:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D14436128A;
        Tue, 24 Aug 2021 22:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629845040;
        bh=GgSuJcA7bFVt0ybi6Nstz+q4perrXRwFyg1qNEVRquI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=h4gUMoR83nNHBimPYa4n0QIaQsGIEytgWZNSyfSz1bflJqll4RhsvGUslsQigPdA9
         8CeSKHimEOZWKLQKwjnwEV0bIVvQ8+Eg+tQ9wH8ReOFKdplBPaIWkQlkltPRJKzJ8L
         bsGNt9RHDyJWiigV48oj0dMLczAstQkX6MSk+pXXges1I7bmngT8isYnSdFrzhBYmB
         ceqsdyyL+fwbiKdQjvZPODWYSOf+lxuu7zR0ZW0RUuwIjtegXcBa2Tp2A+OQQ5O4+g
         AYsnW1ZBs5dVJiV4suHW0KZXSE0lftTrLm9nMIsnHaPzE/RRPgbseKjesczF8aUv9l
         lv95pJLArZogg==
Received: by mail-ej1-f46.google.com with SMTP id x11so47617222ejv.0;
        Tue, 24 Aug 2021 15:44:00 -0700 (PDT)
X-Gm-Message-State: AOAM533rB1ldh/K9cvJ6IiC69Vf3OwQivKb/zRapilKwGY+u5bA5XIKL
        h1NMM3q6NMQpdB1v3/x5nbKxtOHr6jr5o6tV1Q==
X-Google-Smtp-Source: ABdhPJyUY2L4QJTbPsFYD+ikQSi/9Dj0VJmplebp6jADpQGcDDA3Pj3knpdqSPXaTaP34wTa4JhBo1wA1Rnk6ojOk9E=
X-Received: by 2002:a17:906:b4d:: with SMTP id v13mr12333564ejg.468.1629845039486;
 Tue, 24 Aug 2021 15:43:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1628670468.git.geert+renesas@glider.be> <YRkxzx/1XM3r64Ee@robh.at.kernel.org>
 <CAMuHMdXs0+7K4N0mg6qX6X1cr_8dBr_HdTahdfORMk76wCJcEA@mail.gmail.com>
 <CAL_JsqK63hoEMafLP+5eeQR1qrhOO76J4KEQG_By6QnLfhF=dw@mail.gmail.com> <CAMuHMdVNi4bh0Kp43BrVVKD8YY5ac4yi9=W3QZmw=stmwwtuiQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVNi4bh0Kp43BrVVKD8YY5ac4yi9=W3QZmw=stmwwtuiQ@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 24 Aug 2021 17:43:48 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL_D85DWrbOEghNqbqdMaCabSJ5X7zKKJjn2uoB7=XN6g@mail.gmail.com>
Message-ID: <CAL_JsqL_D85DWrbOEghNqbqdMaCabSJ5X7zKKJjn2uoB7=XN6g@mail.gmail.com>
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

On Tue, Aug 24, 2021 at 6:55 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> On Mon, Aug 23, 2021 at 4:52 PM Rob Herring <robh@kernel.org> wrote:
> > On Mon, Aug 23, 2021 at 5:13 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Sun, Aug 15, 2021 at 5:25 PM Rob Herring <robh@kernel.org> wrote:
> > > > On Wed, Aug 11, 2021 at 10:50:58AM +0200, Geert Uytterhoeven wrote:
> > > > > This patch series adds generic support for parsing DT properties related
> > > > > to crash dump kernels ("linux,elfcorehdr" and "linux,elfcorehdr" under
> > > > > the "/chosen" node), makes use of it on arm32, and performs a few
> > > > > cleanups.  It is an evolution of the combination of [1] and [2].
> > > >
> > > > The DT bits look fine to me. How do you expect this to be merged? I'm
> > > > happy to take it if arch maintainers can ack it.
> > >
> > > I had hoped you could take the series...
> >
> > My current thought is I'll take 2-5, 7 and 8 given that's what I have
> > acks for and the others can be applied independently.
>
> Note that Palmer did ack patch 6, so you can include it.

Right, but Palmer should have taken it if it's for 5.14.

Anyways, I've now applied patches 2-8. If we want to improve the
handling over what arm64 code did as discussed, I think that's a
separate patch anyways.

Rob
