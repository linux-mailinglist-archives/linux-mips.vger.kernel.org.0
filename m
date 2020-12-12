Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3EB2D8629
	for <lists+linux-mips@lfdr.de>; Sat, 12 Dec 2020 12:09:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388145AbgLLLJM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 12 Dec 2020 06:09:12 -0500
Received: from ste-pvt-msa1.bahnhof.se ([213.80.101.70]:33987 "EHLO
        ste-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730250AbgLLLJF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 12 Dec 2020 06:09:05 -0500
X-Greylist: delayed 578 seconds by postgrey-1.27 at vger.kernel.org; Sat, 12 Dec 2020 06:09:04 EST
Received: from localhost (localhost [127.0.0.1])
        by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 97ABE3F896;
        Sat, 12 Dec 2020 11:58:40 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.9
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, NO_RELAYS=-0.001, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ze8OC6IahE9v; Sat, 12 Dec 2020 11:58:39 +0100 (CET)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id AA62B3F61B;
        Sat, 12 Dec 2020 11:58:38 +0100 (CET)
Date:   Sat, 12 Dec 2020 11:58:38 +0100
From:   Fredrik Noring <noring@nocrew.org>
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        linux-mips@vger.kernel.org, Andreas Jaeger <aj@suse.de>,
        Nick Clifton <nickc@redhat.com>,
        =?utf-8?Q?J=C3=BCrgen?= Urban <JuergenUrban@gmx.de>,
        libc-help@sourceware.org
Subject: Re: [PATCH 002/120] MIPS: R5900: Trap the RDHWR instruction as an SQ
 address exception
Message-ID: <X9SiXnZJLxDCrKMV@sx9>
References: <cover.1567326213.git.noring@nocrew.org>
 <4f856a5ea2c039c6639df875d11b5bff1bf7ecd2.1567326213.git.noring@nocrew.org>
 <2767f5c3-4e89-6543-34f7-6cd1a1be8c23@amsat.org>
 <alpine.LFD.2.21.2011191241410.656242@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.21.2011191241410.656242@eddie.linux-mips.org>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Maciej,

On Thu, Nov 19, 2020 at 01:28:00PM +0000, Maciej W. Rozycki wrote:
>  The use of RDHWR, actual or emulated, is a part of the MIPS TLS psABI, 
> see: <https://www.linux-mips.org/wiki/NPTL>, in particular starting from: 
> <https://www.linux-mips.org/wiki/NPTL#Design_Choices> and throughout (the 
> expired certificate of the web site is a known issue, but there is 
> currently no way to get it fixed as nobody knows where Ralf Baechle has 
> gone).

Can the site be wrapped up and published elsewhere?

>  While there indeed is an unfortunate opcode overlap between RDHWR and SQ, 
> the encoding of the specific operands chosen for TLS pointer access is 
> luckily guaranteed to always trap in the user mode, because the address 
> requested when the encoding is interpreted as SQ rather than RDHWR is 
> within the kernel KSEG2 segment:
> 
> $ cat rdhwr.s
> 	rdhwr	$3, $29
> $ gcc -march=mips32r2 -c rdhwr.s
> $ objdump -d rdhwr.o
> rdhwr.o:     file format elf32-tradlittlemips
> 
> 
> Disassembly of section .text:
> 
> 00000000 <.text>:
>    0:	7c03e83b 	rdhwr	v1,$29
> 	...
> $ objdump -m mips:5900 -d rdhwr.o
> 
> rdhwr.o:     file format elf32-tradlittlemips
> 
> 
> Disassembly of section .text:
> 
> 00000000 <.text>:
>    0:	7c03e83b 	sq	v1,-6085(zero)
> 	...
> $ 
> 
> This is because the HWR read is encoded in bits 15:11 of the instruction 
> word and $29 has the highest bit set, which lands in bit 15 of the 
> instruction word, meaning that the offset encoded in bits 15:0 used where 
> the instruction word is interpreted as SQ is negative.  And then bits 
> 25:21 are hardwired to 0 in the encoding of RDHWR and they correspond to 
> the base register encoding with SQ, meaning that it will be interpreted as 
> $zero.  So the address ultimately requested is -6085 => 0xffffffffffffe83b 
> (the R5900 uses 32-bit addressing and ignores address bits 63:32, but that 
> does not matter here; this is KSEG2 either way).
> 
>  Consequently an AdES exception is triggered which we can trap and handle, 
> reinterpreting the encoding according to our needs and return the TLS 
> pointer in $v1 rather than issuing a SIGBUS.  So you are not expected to 
> see any issue unless there is a security erratum in the R5900 as well and 
> the encoding does not cause an exception for some reason.
> 
>  This of course disagrees with what Fredrik wrote in the quotation above, 
> as it's the last page rather than the zeroth that is accessed, but the net 
> effect is the same, or even better.

The first page could be mapped by the application itself, but what about
RDHWR registers $0-$3 having mnemonics CPUNum, SYNC1_Step, CC and CCRes[1],
or in Linux

/* RDHWR register numbers */
#define MIPS_HWR_CPUNUM		0	/* CPU number */
#define MIPS_HWR_SYNCISTEP	1	/* SYNCI step size */
#define MIPS_HWR_CC		2	/* Cycle counter */
#define MIPS_HWR_CCRES		3	/* Cycle counter resolution */
#define MIPS_HWR_ULR		29	/* UserLocal */
#define MIPS_HWR_IMPL1		30	/* Implementation dependent */
#define MIPS_HWR_IMPL2		31	/* Implementation dependent */

in arch/mips/include/asm/mipsregs.h? They land on the first page, no?

Fredrik

References:

[1] "MIPS Architecture for programmers Volume II-A: The MIPS32 Instruction
    Set", revision 5.04, 11 December 2013, p. 248.
