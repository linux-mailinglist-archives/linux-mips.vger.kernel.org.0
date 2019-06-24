Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7302D51B40
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2019 21:13:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbfFXTNk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Jun 2019 15:13:40 -0400
Received: from eddie.linux-mips.org ([148.251.95.138]:43528 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725881AbfFXTNk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 24 Jun 2019 15:13:40 -0400
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23992973AbfFXTNhSGk7y (ORCPT
        <rfc822;linux-kernel@vger.kernel.org> + 1 other);
        Mon, 24 Jun 2019 21:13:37 +0200
Date:   Mon, 24 Jun 2019 20:13:37 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Arnd Bergmann <arnd@arndb.de>
cc:     Paul Burton <paul.burton@mips.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Serge Semin <Sergey.Semin@t-platforms.ru>,
        "Vadim V . Vlasov" <vadim.vlasov@t-platforms.ru>,
        Arnd Bergmann <arnd@arndb.de>,
        Palmer Dabbelt <palmer@sifive.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        David Howells <dhowells@redhat.com>,
        Daniel Lustig <dlustig@nvidia.com>,
        Andrea Parri <andrea.parri@amarulasolutions.com>,
        Mikulas Patocka <mpatocka@redhat.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mips: Remove q-accessors from non-64bit platforms
In-Reply-To: <CAK8P3a0Vw-DPjRxsOKiqQmACztdKW5Drkdza8eb6yeEkjdsxoQ@mail.gmail.com>
Message-ID: <alpine.LFD.2.21.1906241822460.28103@eddie.linux-mips.org>
References: <20190614063341.1672-1-fancer.lancer@gmail.com> <20190620174002.tgayzon7dc5d57fh@pburton-laptop> <alpine.LFD.2.21.1906201851580.21654@eddie.linux-mips.org> <CAK8P3a28Dp3UygNyomDPDxDmCmey37VS7TJkmDogaKUGZMF2mw@mail.gmail.com>
 <alpine.LFD.2.21.1906211048360.21654@eddie.linux-mips.org> <CAK8P3a3HWn7RXjcT0KA_qOc+C1SgWd2qXSdCTTAmRKHdc4qNbQ@mail.gmail.com> <alpine.LFD.2.21.1906211230170.21654@eddie.linux-mips.org> <CAK8P3a0Vw-DPjRxsOKiqQmACztdKW5Drkdza8eb6yeEkjdsxoQ@mail.gmail.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Arnd,

 We're getting into MMIO and barriers again, sigh.  Cc-ing people recently 
involved then.

On Fri, 21 Jun 2019, Arnd Bergmann wrote:

> > > > > The other property of packet memory and similar things is that you
> > > > > basically want memcpy()-behavior with no byteswaps. This is one
> > > > > of the few cases in which __raw_readq() is actually the right accessor
> > > > > in (mostly) portable code.
> > > >
> > > >  Correct, but we're missing an `__raw_readq_relaxed', etc. interface and
> > > > having additional barriers applied on every access would hit performance
> > > > very badly;
> > >
> > > How so? __raw_readq() by definition has the least barriers of
> > > all, you can't make it more relaxed than it already is.
> >
> >  Well, `__raw_readq' has all the barriers plain `readq' has except it does
> > not ever do byte-swapping (which may be bad where address swizzling is
> > also present).  Whereas `readq_relaxed' at least avoids the trailing DMA
> > barrier.
> >
> >  This is what the MIPS version has:
> >
> > #define __BUILD_MEMORY_SINGLE(pfx, bwlq, type, barrier, relax, irq)     \
> > [...]
> >
> > #define __BUILD_MEMORY_PFX(bus, bwlq, type, relax)                      \
> >                                                                         \
> > __BUILD_MEMORY_SINGLE(bus, bwlq, type, 1, relax, 1)
> >
> > #define BUILDIO_MEM(bwlq, type)                                         \
> >                                                                         \
> > __BUILD_MEMORY_PFX(__raw_, bwlq, type, 0)                               \
> > __BUILD_MEMORY_PFX(__relaxed_, bwlq, type, 1)                           \
> > __BUILD_MEMORY_PFX(__mem_, bwlq, type, 0)                               \
> > __BUILD_MEMORY_PFX(, bwlq, type, 0)
> >
> > So `barrier' is always passed 1 and consequently all the accessors have a
> > leading MMIO ordering barrier inserted and only `__relaxed_*' ones have
> > `relax' set to 0 making them skip the trailing MMIO read vs DMA ordering
> > barrier.  This is in accordance to Documentation/memory-barriers.txt I
> > believe.
> 
> It is definitely not what other architectures do here. In particular, the
> asm-generic implementation that is now used on most of them
> defines raw_readl() as
> 
> static inline u32 __raw_readl(const volatile void __iomem *addr)
> {
>         return *(const volatile u32 __force *)addr;
> }
> 
> and there are a number of drivers that depend on this behavior.
> readl_relaxed() typically adds the byteswap on this, and readl() adds
> the barriers on top of readl_relaxed().

 If the lack of any ordering barriers with `__raw_*' accessors is indeed 
intended, then we need to document it in `memory-barriers.txt' as the 
expected semantics.

 This however does not make the interface suitable for accesses to 
memory-like MMIO resources, e.g. string I/O, but also the ATA data port, 
unless you want to make/keep the nomenclature more confusing than it has 
to be.

 First some backgound information.

1. For systems that have a uniform endianness throughout there's obviously 
   no issue.  We only need to choose between strongly-ordered and, if 
   applicable weakly-ordered accesses.  As the minimum and at the cost of 
   performance we can enforce strong MMIO ordering everywhere.

2. For systems parts of which have the opposite endianness we can have two 
   variants (or endianness policies) implemented in hardware for accesses 
   that cross the boundary of the two endiannesses:

   a. Byte lane matching.

      In this case individual byte addresses are preserved while accessing 
      a device and byte enables are generated directly from the least 
      significant bits of the CPU address, meaning that the device is 
      addressed within its decoding window directly as documented.

      The data quantity accessed, however, has to be byte-swapped to be 
      interpreted within the domain of the opposite endianness as a 
      numerical value or a bit pattern if wider than 8 bits.

   b. Bit lane matching.

      In this case individual byte addresses are mangled while accessing a 
      device and byte enables are generated from the inverse of the 
      leastsignificant bits of the CPU address, meaning that to calculate 
      a device address the CPU address has to be transformed, unless 
      accessing an aligned data quantity of the bus width.

      The data quantity accessed, however, can be used directly to be 
      interpreted within the domain of the opposite endianness as a 
      numerical value or a bit pattern regardless of its width.

   Like with the systems of a uniform endianness ordering is to be 
   considered separately.

Existing computer systems based on the MIPS processor implement either 
endianness policy or both.  The existence of systems that do bit lane 
matching is why we have all the arch/mips/include/asm/mach-*/mangle-port.h 
headers.

 I actually own a SOC-based system that implements both, when strapped at 
reset for the big endianness, by having two MMIO windows defined in its 
address space, which assume each of the policies respectively, and the 
boundary between the two endianness domains is at the PCI host bridge.  
This means that device accesses that cross the PCI bridge need address 
mangling or byte-swapping as necessary while device accesses that access 
onchip SOC devices or external devices wired to SOC's interfaces other 
than PCI require straight through accesses.

 The implementers of our Linux port for this system chose to use the byte 
lane matching policy exclusively, although for performance reason it might 
make sense to switch between the two policies depending on whether data is 
to be interpreted as a value or memory contents as the offset between the 
two windows is fixed.

 Anyway, for a system like this and regardless of any ordering requirement 
we clearly need to have three kinds of accessors:

1. Native (pass-through data, never with address mangling).

2. Value (data byte-swapped if required, possibly with address mangling).

3. Memory (data byte-swapped if required, possibly with address mangling).

And I think the natural nomenclature for the three kinds of accessors 
respectively is:

1. `__raw_*'.

2. `*' (no prefix by long-established practice, although `__val_*' would 
   do too, IMO).

3. `__mem_*'.

So I think the MIPS port got it right (and the rest is confused, IMHO).

 Furthermore, going back to the ordering requirement, I think we also need 
to have strongly-ordered native accessors, so that driver writers do not 
have to be bothered about sprinkling barriers in the common case.

 The MIPS port currently meets all the requirements, although it does not 
provide weakly ordered accessors.

> >  NB I got one part wrong in the previous e-mail, sorry, as for packet
> > memory accesses etc. the correct accessors are actually `__mem_*' rather
> > than `__raw_*' ones, but the former ones are not portable.  I always
> > forget about this peculiarity and it took us years to get it right with
> > the MIPS port and the old IDE subsystem when doing PIO.
> >
> >  The `__mem_*' handlers still do whetever system-specific transformation
> > is required to present data in the memory rather than CPU byte ordering.
> > See arch/mips/include/asm/mach-ip27/mangle-port.h for a non-trivial
> > example and arch/mips/include/asm/mach-generic/mangle-port.h for the
> > general case.  Whereas `__raw_*' pass raw data unchanged and are generally
> > only suitable for accesses to onchip SOC MMIO or similar resources that do
> > not traverse any external bus where a system's endianness may be observed.
> 
> Ok, so what you have for __mem_* is actually what I had expected from
> __raw_* for an architecture, except for the barriers that should have been
> left out.

 Please see above for an explanation as to why `__mem_*' is equivalent to 
neither `__raw_*' nor plain `*'.

> >  So contrary to what I have written before for the theoretical case of a
> > big-endian system possibly doing address swizzling we'd have to define and
> > use `__mem_readq_unordered', etc. here rather than `__raw_readq_relaxed',
> > etc.
> 
> Right.
> 
> > > > in fact even the barriers `*_relaxed' accessors imply would
> > > > best be removed in this use (which is why defza.c uses `readw_o' vs
> > > > `readw_u', etc. internally), but after all the struggles over the years
> > > > for weakly ordered internal APIs x86 people are so averse to I'm not sure
> > > > if I want to start another one.  We can get away with `readq_relaxed' in
> > > > this use though as all the systems this device can be used with are
> > > > little-endian as is TURBOchannel, so no byte-swapping will ever actually
> > > > occur.
> > >
> > > I still don't see any downside of using __raw_readq() here, while the
> > > upsides are:
> > >
> > > - makes the driver portable to big-endian kernels (even though we don't
> > >   care)
> > > - avoids all barriers
> > > - fixes the build regression.
> >
> >  Giving my observations above it would only address item #3 on your list,
> > while addressing #1 and #2 would require defining `__mem_readq_unordered',
> > etc. I am afraid.
> >
> >  Have I missed anything?
> 
> No, I think you are right based on how mips defines __raw_readl().
> 
> Unfortunately, this also means that all portable drivers using the
> __raw_ accessors to do what you want here are broken on mips
> (at least on big-endian), while mips drivers using __raw_* are not
> portable to anything else.

 I guess your conclusion is correct then, but I maintain that the 
nomenclature chosen for the MIPS port years ago is the correct one.  This 
goes back to commit 4912ba72d6e2 ("Define mem_*() I/O accessory functions 
that preserve byte addresses.") which defined `mem_*' accessors later 
renamed to `__mem_*' with commit 290f10ae4230 ("mips: namespace pollution
- mem_... -> __mem_... in io.h").  I don't know at what stage of awareness 
of the three scenarios other ports were back then.

 Questions, comments, thoughts?

  Maciej
