Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA91E2A2AC7
	for <lists+linux-mips@lfdr.de>; Mon,  2 Nov 2020 13:33:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728561AbgKBMdx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 2 Nov 2020 07:33:53 -0500
Received: from [78.8.192.131] ([78.8.192.131]:10727 "EHLO orcam.me.uk"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728765AbgKBMdx (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 2 Nov 2020 07:33:53 -0500
Received: from cvs.linux-mips.org (eddie.linux-mips.org [148.251.95.138])
        by orcam.me.uk (Postfix) with ESMTPS id 2A8242BE086;
        Mon,  2 Nov 2020 12:33:49 +0000 (GMT)
Date:   Mon, 2 Nov 2020 12:33:45 +0000 (GMT)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Hev <r@hev.cc>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paulburton@kernel.org>
Subject: Re: [PATCH] MIPS: Optional SYNC emulation
In-Reply-To: <CAHirt9i06fyHxinkurR-AA8rW2_Qm=UmAFgCPABsj=K9YADT2Q@mail.gmail.com>
Message-ID: <alpine.LFD.2.21.2011021217330.3100725@eddie.linux-mips.org>
References: <20200821031228.31231-1-r@hev.cc> <20200930111644.GA19903@alpha.franken.de> <CAHirt9i06fyHxinkurR-AA8rW2_Qm=UmAFgCPABsj=K9YADT2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 1 Oct 2020, Hev wrote:

> > I see your point, but isn't taking an exception already more than a
> > compiler barrier ? Does the missing sync hurt in real life ?
> 
> As far as I known, the optional sync instruction has been used in user
> space programs (such as firefox), and the illegal instruction
> exception does not include the semantics of the memory barrier, so if
> the optional sync instruction is not simulated, the memory access
> order of these programs it may be different from the order in the
> code.

 Your concerns as to ERET not implying any of the SYNC semantics seem 
valid to me.

> About the compiler barrier, What if the hardware does not support SYNC
> 0? I think it does not support SMP, so smp_mb() is only a compiler
> barrier and will not cause infinite recursion in the simulation.

 However both SYNC 0 is mandatory (save for ancient MIPS I ISA processors) 
and other SYNC operations have to fall back to SYNC 0 if not specifically 
implemented.  Even MIPSr1 had this[1][2]:

"SYNC does not guarantee the order in which instruction fetches are 
performed.  The stype values 1-31 are reserved for future extensions to 
the architecture.  A value of zero will always be defined such that it 
performs all defined synchronization operations.  Non-zero values may be 
defined to remove some synchronization operations.  As such, software 
should never use a non-zero value of the stype field, as this may 
inadvertently cause future failures if non-zero values remove 
synchronization operations."

and MIPSr0.95 was even stricter[3][4]:

"SYNC does not guarantee the order in which instruction fetches are 
performed.  The stype values 1-31 are reserved; they produce the same 
result as the value zero."

so I suggest a board/CPU-specific workaround.

References:

[1]  "MIPS32 Architecture For Programmers, Volume II: The MIPS32
     Instruction Set", MIPS Technologies, Inc., Document Number: MD00086,
     Revision 1.00, August 29, 2002, p. 209

[2]  "MIPS64 Architecture For Programmers, Volume II: The MIPS64
     Instruction Set", MIPS Technologies, Inc., Document Number: MD00087,
     Revision 1.00, August 29, 2002, p. 295

[3]  "MIPS32 Architecture For Programmers, Volume II: The MIPS32
     Instruction Set", MIPS Technologies, Inc., Document Number: MD00086,
     Revision 0.95, March 12, 2001, p. 215

[4]  "MIPS64 Architecture For Programmers, Volume II: The MIPS64
     Instruction Set", MIPS Technologies, Inc., Document Number: MD00087,
     Revision 0.95, March 12, 2001, p. 300

 HTH,

  Maciej
