Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1785C2D863C
	for <lists+linux-mips@lfdr.de>; Sat, 12 Dec 2020 12:38:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405597AbgLLLhd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 12 Dec 2020 06:37:33 -0500
Received: from [157.25.102.26] ([157.25.102.26]:57288 "EHLO orcam.me.uk"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726727AbgLLLha (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 12 Dec 2020 06:37:30 -0500
Received: from bugs.linux-mips.org (eddie.linux-mips.org [IPv6:2a01:4f8:201:92aa::3])
        by orcam.me.uk (Postfix) with ESMTPS id 2F91E2BE0F3
        for <linux-mips@vger.kernel.org>; Sat, 12 Dec 2020 11:36:55 +0000 (GMT)
Date:   Sat, 12 Dec 2020 11:36:35 +0000 (GMT)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Fredrik Noring <noring@nocrew.org>
cc:     =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        linux-mips@vger.kernel.org, Andreas Jaeger <aj@suse.de>,
        Nick Clifton <nickc@redhat.com>,
        =?UTF-8?Q?J=C3=BCrgen_Urban?= <JuergenUrban@gmx.de>,
        libc-help@sourceware.org
Subject: Re: [PATCH 002/120] MIPS: R5900: Trap the RDHWR instruction as an
 SQ address exception
In-Reply-To: <X9SiXnZJLxDCrKMV@sx9>
Message-ID: <alpine.LFD.2.21.2012121105280.2104409@eddie.linux-mips.org>
References: <cover.1567326213.git.noring@nocrew.org> <4f856a5ea2c039c6639df875d11b5bff1bf7ecd2.1567326213.git.noring@nocrew.org> <2767f5c3-4e89-6543-34f7-6cd1a1be8c23@amsat.org> <alpine.LFD.2.21.2011191241410.656242@eddie.linux-mips.org>
 <X9SiXnZJLxDCrKMV@sx9>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 12 Dec 2020, Fredrik Noring wrote:

> >  The use of RDHWR, actual or emulated, is a part of the MIPS TLS psABI, 
> > see: <https://www.linux-mips.org/wiki/NPTL>, in particular starting from: 
> > <https://www.linux-mips.org/wiki/NPTL#Design_Choices> and throughout (the 
> > expired certificate of the web site is a known issue, but there is 
> > currently no way to get it fixed as nobody knows where Ralf Baechle has 
> > gone).
> 
> Can the site be wrapped up and published elsewhere?

 Well if someone does that, sure!  I guess archive.org will have it too.

> >  This of course disagrees with what Fredrik wrote in the quotation above, 
> > as it's the last page rather than the zeroth that is accessed, but the net 
> > effect is the same, or even better.
> 
> The first page could be mapped by the application itself, but what about

 It doesn't matter given that `rdhwr $3, $29' maps to an R5900 instruction 
that does not access it.

> RDHWR registers $0-$3 having mnemonics CPUNum, SYNC1_Step, CC and CCRes[1],
> or in Linux
> 
> /* RDHWR register numbers */
> #define MIPS_HWR_CPUNUM		0	/* CPU number */
> #define MIPS_HWR_SYNCISTEP	1	/* SYNCI step size */
> #define MIPS_HWR_CC		2	/* Cycle counter */
> #define MIPS_HWR_CCRES		3	/* Cycle counter resolution */
> #define MIPS_HWR_ULR		29	/* UserLocal */
> #define MIPS_HWR_IMPL1		30	/* Implementation dependent */
> #define MIPS_HWR_IMPL2		31	/* Implementation dependent */
> 
> in arch/mips/include/asm/mipsregs.h? They land on the first page, no?

 Unlike TLS pointer access, specifically using $3 as rt, which has been 
made a part of the Linux ABI, they're not supposed to be referred with 
pre-R2 code.  After all RDHWR was only introduced with R2.

 Indeed there's emulation code in the kernel for those encodings even with 
pre-R2 hardware, but it is not guaranteed to give sensible results, and 
given the circumstances I'm not sure what it really is for, e.g. what is 
SYNCI_Step for with processors that do not implement SYNCI?  The cycle 
counter register may be absent too, so even emulated accesses will return 
rubbish; gettimeofday(2) is the standard interface.

 So I think we can safely ignore them, just as we can any ULR access with 
rt != $3.  Unlike standardised TLS pointer accesses such instructions 
won't appear in compiler-generated code and whoever uses them in handcoded 
assembly or otherwise generated machine code will have to make sure they 
make sense for their application (yes, there's rubbish code out there, 
e.g. Firefox has a JIT that unconditionally produces MIPS R2 code even if 
the piece of software has been compiled for an older ISA revision, and 
having not verified that the CPU it runs on actually supports the R2 ISA, 
but that's just the usual imperfection of the world; you just can't fix it 
all).

  Maciej

