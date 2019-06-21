Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A39454E7F1
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2019 14:24:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbfFUMY1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Jun 2019 08:24:27 -0400
Received: from eddie.linux-mips.org ([148.251.95.138]:40224 "EHLO
        cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbfFUMY1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 21 Jun 2019 08:24:27 -0400
Received: (from localhost user: 'macro', uid#1010) by eddie.linux-mips.org
        with ESMTP id S23994572AbfFUMYW7BvMZ (ORCPT
        <rfc822;linux-kernel@vger.kernel.org> + 1 other);
        Fri, 21 Jun 2019 14:24:22 +0200
Date:   Fri, 21 Jun 2019 13:24:22 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Arnd Bergmann <arnd@arndb.de>
cc:     Paul Burton <paul.burton@mips.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Serge Semin <Sergey.Semin@t-platforms.ru>,
        "Vadim V . Vlasov" <vadim.vlasov@t-platforms.ru>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mips: Remove q-accessors from non-64bit platforms
In-Reply-To: <CAK8P3a3HWn7RXjcT0KA_qOc+C1SgWd2qXSdCTTAmRKHdc4qNbQ@mail.gmail.com>
Message-ID: <alpine.LFD.2.21.1906211230170.21654@eddie.linux-mips.org>
References: <20190614063341.1672-1-fancer.lancer@gmail.com> <20190620174002.tgayzon7dc5d57fh@pburton-laptop> <alpine.LFD.2.21.1906201851580.21654@eddie.linux-mips.org> <CAK8P3a28Dp3UygNyomDPDxDmCmey37VS7TJkmDogaKUGZMF2mw@mail.gmail.com>
 <alpine.LFD.2.21.1906211048360.21654@eddie.linux-mips.org> <CAK8P3a3HWn7RXjcT0KA_qOc+C1SgWd2qXSdCTTAmRKHdc4qNbQ@mail.gmail.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, 21 Jun 2019, Arnd Bergmann wrote:

> > > The other property of packet memory and similar things is that you
> > > basically want memcpy()-behavior with no byteswaps. This is one
> > > of the few cases in which __raw_readq() is actually the right accessor
> > > in (mostly) portable code.
> >
> >  Correct, but we're missing an `__raw_readq_relaxed', etc. interface and
> > having additional barriers applied on every access would hit performance
> > very badly;
> 
> How so? __raw_readq() by definition has the least barriers of
> all, you can't make it more relaxed than it already is.

 Well, `__raw_readq' has all the barriers plain `readq' has except it does 
not ever do byte-swapping (which may be bad where address swizzling is 
also present).  Whereas `readq_relaxed' at least avoids the trailing DMA 
barrier.

 This is what the MIPS version has:

#define __BUILD_MEMORY_SINGLE(pfx, bwlq, type, barrier, relax, irq)	\
[...]

#define __BUILD_MEMORY_PFX(bus, bwlq, type, relax)			\
									\
__BUILD_MEMORY_SINGLE(bus, bwlq, type, 1, relax, 1)

#define BUILDIO_MEM(bwlq, type)						\
									\
__BUILD_MEMORY_PFX(__raw_, bwlq, type, 0)				\
__BUILD_MEMORY_PFX(__relaxed_, bwlq, type, 1)				\
__BUILD_MEMORY_PFX(__mem_, bwlq, type, 0)				\
__BUILD_MEMORY_PFX(, bwlq, type, 0)

So `barrier' is always passed 1 and consequently all the accessors have a 
leading MMIO ordering barrier inserted and only `__relaxed_*' ones have 
`relax' set to 0 making them skip the trailing MMIO read vs DMA ordering 
barrier.  This is in accordance to Documentation/memory-barriers.txt I 
believe.

 NB I got one part wrong in the previous e-mail, sorry, as for packet 
memory accesses etc. the correct accessors are actually `__mem_*' rather 
than `__raw_*' ones, but the former ones are not portable.  I always 
forget about this peculiarity and it took us years to get it right with 
the MIPS port and the old IDE subsystem when doing PIO.

 The `__mem_*' handlers still do whetever system-specific transformation 
is required to present data in the memory rather than CPU byte ordering.  
See arch/mips/include/asm/mach-ip27/mangle-port.h for a non-trivial 
example and arch/mips/include/asm/mach-generic/mangle-port.h for the 
general case.  Whereas `__raw_*' pass raw data unchanged and are generally 
only suitable for accesses to onchip SOC MMIO or similar resources that do 
not traverse any external bus where a system's endianness may be observed.

 So contrary to what I have written before for the theoretical case of a 
big-endian system possibly doing address swizzling we'd have to define and 
use `__mem_readq_unordered', etc. here rather than `__raw_readq_relaxed', 
etc.

> > in fact even the barriers `*_relaxed' accessors imply would
> > best be removed in this use (which is why defza.c uses `readw_o' vs
> > `readw_u', etc. internally), but after all the struggles over the years
> > for weakly ordered internal APIs x86 people are so averse to I'm not sure
> > if I want to start another one.  We can get away with `readq_relaxed' in
> > this use though as all the systems this device can be used with are
> > little-endian as is TURBOchannel, so no byte-swapping will ever actually
> > occur.
> 
> I still don't see any downside of using __raw_readq() here, while the
> upsides are:
> 
> - makes the driver portable to big-endian kernels (even though we don't
>   care)
> - avoids all barriers
> - fixes the build regression.

 Giving my observations above it would only address item #3 on your list, 
while addressing #1 and #2 would require defining `__mem_readq_unordered', 
etc. I am afraid.

 Have I missed anything?

  Maciej
