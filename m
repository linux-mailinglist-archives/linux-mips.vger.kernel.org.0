Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F9BE4EA1E
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2019 16:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbfFUOCE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Jun 2019 10:02:04 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:34643 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbfFUOCD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 Jun 2019 10:02:03 -0400
Received: by mail-qt1-f196.google.com with SMTP id m29so7029718qtu.1;
        Fri, 21 Jun 2019 07:02:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OXXeAOb5rpGL+JHRiSVPIGXcFlOX3Qaj7ipceyvS4V0=;
        b=mO+m6EjeMd5/Z2WxgkIpPTtqyOtlO7whwtHFoAG+kFKD1b10/PjeeH1c2KQ8Tr090q
         MnB6S3KA2RI9DQcXfPCaFJ+vaWsdD/zm4/NE38Rz2KYlywimkqfqAnH1VJsgU3erZod6
         8As2vsNudllgRBAuZq3gUmq61Hs0labops+H69/uO3CNW2X955kCCTGbtNgXC3C0zq6E
         QLNKINFgFWPrR5NGGJcNbHVzw3LaouSdd+OYSF2ltFr2g3ZOG8ZdUm7zSh8iDSzTVqAT
         T40SXu2ZypxYynQh2sSWN43eeMGuk3pZQU3Jc6z/XAQ6TqIx/wyCPFJBszncJO5ZI/38
         JFEg==
X-Gm-Message-State: APjAAAWRPtJtXJbYqqSH2vYsP/U3PSynNDlp+bWp5cf4/klzGxloOC2q
        /d7KDl3m8i++kJWHQALwylNFhIk3cdqXwWbj0NA=
X-Google-Smtp-Source: APXvYqyqCloALuEtaHZRSNBaVsW1xlN7t8qrHA3DGfCUIY7hIRgYdpVqVn4diklgt+vPjMiv5ONk9xTmUOnCGfXAXuE=
X-Received: by 2002:aed:2bc1:: with SMTP id e59mr97042293qtd.7.1561125722684;
 Fri, 21 Jun 2019 07:02:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190614063341.1672-1-fancer.lancer@gmail.com>
 <20190620174002.tgayzon7dc5d57fh@pburton-laptop> <alpine.LFD.2.21.1906201851580.21654@eddie.linux-mips.org>
 <CAK8P3a28Dp3UygNyomDPDxDmCmey37VS7TJkmDogaKUGZMF2mw@mail.gmail.com>
 <alpine.LFD.2.21.1906211048360.21654@eddie.linux-mips.org>
 <CAK8P3a3HWn7RXjcT0KA_qOc+C1SgWd2qXSdCTTAmRKHdc4qNbQ@mail.gmail.com> <alpine.LFD.2.21.1906211230170.21654@eddie.linux-mips.org>
In-Reply-To: <alpine.LFD.2.21.1906211230170.21654@eddie.linux-mips.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 21 Jun 2019 16:01:46 +0200
Message-ID: <CAK8P3a0Vw-DPjRxsOKiqQmACztdKW5Drkdza8eb6yeEkjdsxoQ@mail.gmail.com>
Subject: Re: [PATCH] mips: Remove q-accessors from non-64bit platforms
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     Paul Burton <paul.burton@mips.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Serge Semin <Sergey.Semin@t-platforms.ru>,
        "Vadim V . Vlasov" <vadim.vlasov@t-platforms.ru>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jun 21, 2019 at 2:24 PM Maciej W. Rozycki <macro@linux-mips.org> wrote:
> On Fri, 21 Jun 2019, Arnd Bergmann wrote:
> > > > The other property of packet memory and similar things is that you
> > > > basically want memcpy()-behavior with no byteswaps. This is one
> > > > of the few cases in which __raw_readq() is actually the right accessor
> > > > in (mostly) portable code.
> > >
> > >  Correct, but we're missing an `__raw_readq_relaxed', etc. interface and
> > > having additional barriers applied on every access would hit performance
> > > very badly;
> >
> > How so? __raw_readq() by definition has the least barriers of
> > all, you can't make it more relaxed than it already is.
>
>  Well, `__raw_readq' has all the barriers plain `readq' has except it does
> not ever do byte-swapping (which may be bad where address swizzling is
> also present).  Whereas `readq_relaxed' at least avoids the trailing DMA
> barrier.
>
>  This is what the MIPS version has:
>
> #define __BUILD_MEMORY_SINGLE(pfx, bwlq, type, barrier, relax, irq)     \
> [...]
>
> #define __BUILD_MEMORY_PFX(bus, bwlq, type, relax)                      \
>                                                                         \
> __BUILD_MEMORY_SINGLE(bus, bwlq, type, 1, relax, 1)
>
> #define BUILDIO_MEM(bwlq, type)                                         \
>                                                                         \
> __BUILD_MEMORY_PFX(__raw_, bwlq, type, 0)                               \
> __BUILD_MEMORY_PFX(__relaxed_, bwlq, type, 1)                           \
> __BUILD_MEMORY_PFX(__mem_, bwlq, type, 0)                               \
> __BUILD_MEMORY_PFX(, bwlq, type, 0)
>
> So `barrier' is always passed 1 and consequently all the accessors have a
> leading MMIO ordering barrier inserted and only `__relaxed_*' ones have
> `relax' set to 0 making them skip the trailing MMIO read vs DMA ordering
> barrier.  This is in accordance to Documentation/memory-barriers.txt I
> believe.

It is definitely not what other architectures do here. In particular, the
asm-generic implementation that is now used on most of them
defines raw_readl() as

static inline u32 __raw_readl(const volatile void __iomem *addr)
{
        return *(const volatile u32 __force *)addr;
}

and there are a number of drivers that depend on this behavior.
readl_relaxed() typically adds the byteswap on this, and readl() adds
the barriers on top of readl_relaxed().

>  NB I got one part wrong in the previous e-mail, sorry, as for packet
> memory accesses etc. the correct accessors are actually `__mem_*' rather
> than `__raw_*' ones, but the former ones are not portable.  I always
> forget about this peculiarity and it took us years to get it right with
> the MIPS port and the old IDE subsystem when doing PIO.
>
>  The `__mem_*' handlers still do whetever system-specific transformation
> is required to present data in the memory rather than CPU byte ordering.
> See arch/mips/include/asm/mach-ip27/mangle-port.h for a non-trivial
> example and arch/mips/include/asm/mach-generic/mangle-port.h for the
> general case.  Whereas `__raw_*' pass raw data unchanged and are generally
> only suitable for accesses to onchip SOC MMIO or similar resources that do
> not traverse any external bus where a system's endianness may be observed.

Ok, so what you have for __mem_* is actually what I had expected from
__raw_* for an architecture, except for the barriers that should have been
left out.

>  So contrary to what I have written before for the theoretical case of a
> big-endian system possibly doing address swizzling we'd have to define and
> use `__mem_readq_unordered', etc. here rather than `__raw_readq_relaxed',
> etc.

Right.

> > > in fact even the barriers `*_relaxed' accessors imply would
> > > best be removed in this use (which is why defza.c uses `readw_o' vs
> > > `readw_u', etc. internally), but after all the struggles over the years
> > > for weakly ordered internal APIs x86 people are so averse to I'm not sure
> > > if I want to start another one.  We can get away with `readq_relaxed' in
> > > this use though as all the systems this device can be used with are
> > > little-endian as is TURBOchannel, so no byte-swapping will ever actually
> > > occur.
> >
> > I still don't see any downside of using __raw_readq() here, while the
> > upsides are:
> >
> > - makes the driver portable to big-endian kernels (even though we don't
> >   care)
> > - avoids all barriers
> > - fixes the build regression.
>
>  Giving my observations above it would only address item #3 on your list,
> while addressing #1 and #2 would require defining `__mem_readq_unordered',
> etc. I am afraid.
>
>  Have I missed anything?

No, I think you are right based on how mips defines __raw_readl().

Unfortunately, this also means that all portable drivers using the
__raw_ accessors to do what you want here are broken on mips
(at least on big-endian), while mips drivers using __raw_* are not
portable to anything else.

      Arnd
