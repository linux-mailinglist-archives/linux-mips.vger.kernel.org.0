Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73C5E2D0B42
	for <lists+linux-mips@lfdr.de>; Mon,  7 Dec 2020 08:46:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725918AbgLGHqG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Dec 2020 02:46:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgLGHqF (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 7 Dec 2020 02:46:05 -0500
X-Greylist: delayed 79644 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 06 Dec 2020 23:45:25 PST
Received: from orcam.me.uk (unknown [IPv6:2001:4190:8020::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6F49DC0613D0
        for <linux-mips@vger.kernel.org>; Sun,  6 Dec 2020 23:45:25 -0800 (PST)
Received: from bugs.linux-mips.org (eddie.linux-mips.org [IPv6:2a01:4f8:201:92aa::3])
        by orcam.me.uk (Postfix) with ESMTPS id 1CD242BE0EC
        for <linux-mips@vger.kernel.org>; Mon,  7 Dec 2020 07:45:24 +0000 (GMT)
Date:   Thu, 19 Nov 2020 13:28:00 +0000 (GMT)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
cc:     Fredrik Noring <noring@nocrew.org>, linux-mips@vger.kernel.org,
        Andreas Jaeger <aj@suse.de>, Nick Clifton <nickc@redhat.com>,
        =?UTF-8?Q?J=C3=BCrgen_Urban?= <JuergenUrban@gmx.de>,
        libc-help@sourceware.org
Subject: Re: [PATCH 002/120] MIPS: R5900: Trap the RDHWR instruction as an
 SQ address exception
In-Reply-To: <2767f5c3-4e89-6543-34f7-6cd1a1be8c23@amsat.org>
Message-ID: <alpine.LFD.2.21.2011191241410.656242@eddie.linux-mips.org>
References: <cover.1567326213.git.noring@nocrew.org> <4f856a5ea2c039c6639df875d11b5bff1bf7ecd2.1567326213.git.noring@nocrew.org> <2767f5c3-4e89-6543-34f7-6cd1a1be8c23@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, 19 Nov 2020, Philippe Mathieu-Daudé wrote:

> > On the R5900, the RDHWR instruction is interpreted as the R5900 specific
> > SQ instruction[1] that traps into a zero page address exception. Hence
> > RDHWR can be emulated by emulate_load_store_insn().
> 
> Please bare with me because this is not my area, but this does
> not look the correct way to fix this problem to me.
> 
> The R5900 is a MIPS-III, so I don't understand why we have to care
> about RDHWR.

 The use of RDHWR, actual or emulated, is a part of the MIPS TLS psABI, 
see: <https://www.linux-mips.org/wiki/NPTL>, in particular starting from: 
<https://www.linux-mips.org/wiki/NPTL#Design_Choices> and throughout (the 
expired certificate of the web site is a known issue, but there is 
currently no way to get it fixed as nobody knows where Ralf Baechle has 
gone).

> IIRC MIPS TLS support has been added in glibc with MIPS32 ISA in
> mind in 2005:
> https://sourceware.org/git/?p=glibc.git;a=commit;h=f850220be6
> 
> MIPS16 is handled differently:
> https://sourceware.org/git/?p=glibc.git;a=blobdiff;f=ports/sysdeps/mips/tls-macros.h;h=3e87e42ea;hp=8fe2e4a150d;hb=43301bd3c2;hpb=85bd816a60
> 
> Shouldn't we have a similar set of macros for the R5900?

 The macros are there to support different instructions used to access 
data within TLS.  However the TLS pointer still has to be fetched with 
RDHWR, and READ_THREAD_POINTER does exactly that, by calling the 
`__builtin_thread_pointer' intrinsic in the MIPS16 case.  How it works is 
explained in GCC sources, in gcc/config/mips/mips.md:

;; In MIPS16 mode, the TLS base pointer is accessed by a
;; libgcc helper function __mips16_rdhwr(), as 'rdhwr' is not
;; accessible in MIPS16.
;;
;; This is not represented as a call insn, to avoid the
;; unnecesarry clobbering of caller-save registers by a
;; function consisting only of: "rdhwr $3,$29; j $31; nop;"
;;
;; A $25 clobber is added to cater for a $25 load stub added by the
;; linker to __mips16_rdhwr when the call is made from non-PIC code.

-- that is a small piece of regular MIPS code is called, which executes 
RDHWR.

> The problem I have is this break running the binaries built
> by the Sony Linux Toolkit for Playstation 2 which use the
> LQ/SQ instruction:
> 
>  1b00d5c:       0c6c00d4        jal     0x1b00350
>  1b00d60:       7fa90020        sq      t1,32(sp)
>  1b00d64:       a2710000        sb      s1,0(s3)
>  1b00d68:       26730001        addiu   s3,s3,1
>  1b00d6c:       10000004        b       0x1b00d80
>  1b00d70:       7ba90020        lq      t1,32(sp)
>  1b00d74:       00000000        nop
>  1b00d78:       2617ffff        addiu   s7,s0,-1
>  1b00d7c:       25360001        addiu   s6,t1,1
>  1b00d80:       91220000        lbu     v0,0(t1)
>  1b00d84:       02e0802d        move    s0,s7
>  1b00d88:       02c0482d        move    t1,s6
>  1b00d8c:       a2620000        sb      v0,0(s3)
>  1b00d90:       1600fff9        bnez    s0,0x1b00d78
>  1b00d94:       26730001        addiu   s3,s3,1
>  1b00d98:       10000003        b       0x1b00da8
>  1b00d9c:       01342026        xor     a0,t1,s4
>  1b00da0:       253e0003        addiu   s8,t1,3
>  1b00da4:       01342026        xor     a0,t1,s4
>  1b00da8:       7fa90020        sq      t1,32(sp)
>  1b00dac:       2c840001        sltiu   a0,a0,1
>  1b00db0:       0c6c00d4        jal     0x1b00350

 Where exactly do you see a problem, what are the symptoms?  A bug in the 
emulation cannot be ruled out of course.

 While there indeed is an unfortunate opcode overlap between RDHWR and SQ, 
the encoding of the specific operands chosen for TLS pointer access is 
luckily guaranteed to always trap in the user mode, because the address 
requested when the encoding is interpreted as SQ rather than RDHWR is 
within the kernel KSEG2 segment:

$ cat rdhwr.s
	rdhwr	$3, $29
$ gcc -march=mips32r2 -c rdhwr.s
$ objdump -d rdhwr.o
rdhwr.o:     file format elf32-tradlittlemips


Disassembly of section .text:

00000000 <.text>:
   0:	7c03e83b 	rdhwr	v1,$29
	...
$ objdump -m mips:5900 -d rdhwr.o

rdhwr.o:     file format elf32-tradlittlemips


Disassembly of section .text:

00000000 <.text>:
   0:	7c03e83b 	sq	v1,-6085(zero)
	...
$ 

This is because the HWR read is encoded in bits 15:11 of the instruction 
word and $29 has the highest bit set, which lands in bit 15 of the 
instruction word, meaning that the offset encoded in bits 15:0 used where 
the instruction word is interpreted as SQ is negative.  And then bits 
25:21 are hardwired to 0 in the encoding of RDHWR and they correspond to 
the base register encoding with SQ, meaning that it will be interpreted as 
$zero.  So the address ultimately requested is -6085 => 0xffffffffffffe83b 
(the R5900 uses 32-bit addressing and ignores address bits 63:32, but that 
does not matter here; this is KSEG2 either way).

 Consequently an AdES exception is triggered which we can trap and handle, 
reinterpreting the encoding according to our needs and return the TLS 
pointer in $v1 rather than issuing a SIGBUS.  So you are not expected to 
see any issue unless there is a security erratum in the R5900 as well and 
the encoding does not cause an exception for some reason.

 This of course disagrees with what Fredrik wrote in the quotation above, 
as it's the last page rather than the zeroth that is accessed, but the net 
effect is the same, or even better.

  Maciej

