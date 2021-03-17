Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 688ED33FA83
	for <lists+linux-mips@lfdr.de>; Wed, 17 Mar 2021 22:37:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229622AbhCQVgd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Mar 2021 17:36:33 -0400
Received: from angie.orcam.me.uk ([157.25.102.26]:37764 "EHLO
        angie.orcam.me.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbhCQVgW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Mar 2021 17:36:22 -0400
Received: by angie.orcam.me.uk (Postfix, from userid 500)
        id F1D3192009C; Wed, 17 Mar 2021 22:36:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by angie.orcam.me.uk (Postfix) with ESMTP id E84EA92009B;
        Wed, 17 Mar 2021 22:36:20 +0100 (CET)
Date:   Wed, 17 Mar 2021 22:36:20 +0100 (CET)
From:   "Maciej W. Rozycki" <macro@orcam.me.uk>
To:     David Laight <David.Laight@ACULAB.COM>
cc:     Tiezhu Yang <yangtiezhu@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: RE: [PATCH v2] MIPS: Check __clang__ to avoid performance influence
 with GCC in csum_tcpudp_nofold()
In-Reply-To: <6e7bc85a3f92419f89117fc1381511be@AcuMS.aculab.com>
Message-ID: <alpine.DEB.2.21.2103172009070.21463@angie.orcam.me.uk>
References: <1615263493-10609-1-git-send-email-yangtiezhu@loongson.cn> <alpine.DEB.2.21.2103142140000.33195@angie.orcam.me.uk> <bdfe753d-0ef2-8f66-7716-acadfc3917a5@loongson.cn> <913665e71fd44c5d810d006cd179725c@AcuMS.aculab.com> <5ee86b3b-81d2-790c-f67b-e250f60272fd@loongson.cn>
 <alpine.DEB.2.21.2103171541590.21463@angie.orcam.me.uk> <6e7bc85a3f92419f89117fc1381511be@AcuMS.aculab.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 17 Mar 2021, David Laight wrote:

> > > > Not that I grok the mips opcodes.
> > > > But that code has horridness on its side.
> > 
> >  It's a 32-bit one's-complement addition.  The use of 64-bit operations
> > reduces the number of calculations as any 32-bit carries accumulate in the
> > high 32-bit word allowing one instruction to be saved total compared to
> > the 32-bit variant.  Nothing particularly unusual for me here; I've seen
> > worse stuff with x86.
> 
> The 'problem' is that mips doesn't have a carry flag.
> So the 64-bit maths is 'tricky'.
> It may well be that a loop based on:
> 	do {
> 		val = *ptr++;
> 		sum += val;
> 		carry += sum < val;
> 	} while (ptr != limit)
> will generate much better code.

 This piece of assembly appears to me as good as you can get, but it is 
somewhat dated, going back to 1999 and LMO commit 0458ce25ec4e ("Fix 
MIPS64 IP checksums.") as far as the 64-bit variant is concerned, with a 
much later bug fix applied for a corner case with commit 66fd848cadaa 
("MIPS: Fix special case in 64 bit IP checksumming.") back in 2017 (!), 
which added two instructions.  It may well be that GCC has since improved 
and would produce code of similar or better quality.  Anyone is welcome to 
try it of course and submit a patch if it turns out beneficial.

 NB I note there's an earlyclobber specifier missing on the output 
operand, lost with the merge of the separate mips and mips64 ports with 
LMO commit a69fb3990ea9 ("Goodbye mips64.  31704 lines of code bite the 
dust."), back in 2003, which I previously added myself, back in 2002 with 
LMO commit acc75ed18471 ("Bug fixes for constraints and type casts.").  
Sigh.  I think the overlap with operand #1 has prevented damage from 
happening as a result of the missing specifier, but IMO it would best be 
reinstated just in case.

> I think there is a 'setlt' instruction for the compare.

 Yes and it's used in the piece of code quoted (SLT).

> It certainly would on the nios (which is mips-like).
> That is (probably) 6 instructions for 4 bytes.
> I suspect there may be a data stall after the memory read.
> So an interleaved unroll would remove that stall.
> That would be 10 clocks for 8 bytes.

 There's no memory read involved in this code; of course there could be in 
the paster of the inline function as shown in the piece shown by Tiezhu.  
There are a couple of instructions in between though, which should keep 
the pipeline occupied as long as data retrieved is hot in the cache 
(prefetch instructions could be used to assist with that).

 OTOH if data were to come from the main memory, I doubt anything could 
help here.

> The x86-64 code is 'interesting'.
> It has repeated 'add carry' instructions.
> On Intel cpus prior to (at least) Haswell they take two clocks each.
> So the code is no faster than adding 32bit values to a 64bit sum.

 GCC has DFA pipeline descriptions for various MIPS processors, so the 
details may vary, but it is assumed overall that plain ALU operations 
cause no pipeline stalls or slips, so nominally they take 1 pipeline clock 
each for scalar implementations.  This includes all the instructions in 
the piece of code discussed here.

 (Actual clock counts will of course depend on the number of pipeline 
stages a given microarchitecture implements and are not a concern here. 
The earliest MIPS chips had as few as four stages only and the inclusion 
of branch and load delay slots prevented pipeline slips from occuring or 
even actually being implemented, as in what MIPS used to stand for, that 
is Microprocessor without Interlocked Pipeline Stages.  Stalls could still 
happen of course in the case of cache misses.)

  Maciej
