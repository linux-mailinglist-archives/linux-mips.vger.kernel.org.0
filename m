Return-Path: <linux-mips+bounces-8421-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BD2A76DF8
	for <lists+linux-mips@lfdr.de>; Mon, 31 Mar 2025 22:10:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CD4216B186
	for <lists+linux-mips@lfdr.de>; Mon, 31 Mar 2025 20:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2616214238;
	Mon, 31 Mar 2025 20:10:07 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5851518BBBB;
	Mon, 31 Mar 2025 20:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743451807; cv=none; b=G29lI7PA/yd3Q1uzsV65QVymh0Y/Qmk48bTLJvnZYlYhbUI+MUoeSrQ55N9Vj2ucsoV6yoJiwEZJaCXFFqRPSnlXFHbM8oHEpmfg0UYlMTKKGWs32DKlDGU+LnKHxneluhMjwSpm3BNnyuGuX4VYAWgOLzwdmzHEV+ly//YHfGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743451807; c=relaxed/simple;
	bh=U3q9aimAB43eG1j3611rsmgpp5AzU5aSFce0DJ/oQDU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=kgUt3OhhcwUrCRzvgm6ku/FwvfvD+NM6Txrzn9CvmRGGnZnmGPQpQw2y5Mbq88TdUcQ9cZunEMzgMgd42dVmU1Cs/e4xW9eWckb0wn19ozhdtdw8NVIwacbiGnQXm/+oUb2dH93oLaml52Up/FLN7bSdg6Qqgjc7TTGN9kd7KoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 8130592009C; Mon, 31 Mar 2025 22:09:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 7ADA792009B;
	Mon, 31 Mar 2025 21:09:56 +0100 (BST)
Date: Mon, 31 Mar 2025 21:09:56 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Marco Crivellari <marco.crivellari@suse.com>
cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Frederic Weisbecker <frederic@kernel.org>, 
    Anna-Maria Behnsen <anna-maria@linutronix.de>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    Peter Zijlstra <peterz@infradead.org>, Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH v6 1/1] MIPS: Fix idle VS timer enqueue
In-Reply-To: <CAAofZF65p+DnH8xA0+sfuZv=VO63Zgv4rQ6frrdEzQYoZ0MaWA@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2503311348560.47733@angie.orcam.me.uk>
References: <20250315194002.13778-1-marco.crivellari@suse.com> <20250315194002.13778-2-marco.crivellari@suse.com> <alpine.DEB.2.21.2503211146001.35806@angie.orcam.me.uk> <CAAofZF4gy6WJKLK4TzF5aV7+ca3gob5jVz3XQZyGrTpfnCsn_Q@mail.gmail.com>
 <alpine.DEB.2.21.2503211747150.35806@angie.orcam.me.uk> <CAAofZF5yaGMG0Kyax+ksfGngQ0T6AxvN5-60SnasQh7=OabaOg@mail.gmail.com> <alpine.DEB.2.21.2503260300290.29685@angie.orcam.me.uk> <alpine.DEB.2.21.2503281345010.47733@angie.orcam.me.uk>
 <CAAofZF65p+DnH8xA0+sfuZv=VO63Zgv4rQ6frrdEzQYoZ0MaWA@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 31 Mar 2025, Marco Crivellari wrote:

> > There's some complication here coming from the need to factor in the ISA
> > bit in the microMIPS mode; something that hasn't been discussed so far.
> > The `.fill 0' approach is a hack and it has struck me that we need to add
> > a `.noinsn' pseudo-op to GAS for this purpose, complementing `.insn', but
> > we need to stick with the hack for now anyway as it will take years until
> > we can rely on a new feature in the assembler.
> 
> Ah, interesting. So de facto having the "repeat" to 0, will generate nothing.

 Correct, and as a side effect this pseudo-op clears the ISA bit on any 
label attached, as it is not an instruction.

> > I can't imagine how we'd advance past WAIT without these instructions,
> > what do you have in mind?
> 
> I've not been precise, sorry.
> I meant to remove the instructions like they are now because the
> region would have
> been different, then.
> So, those instructions would have needed a change, in practice.

 OK, so this is precisely what happened here with my proposal.  Thanks for 
clarifying.

> > NB how do you actually verify this stuff with QEMU?  Is it by injecting
> > an interrupt by hand at a chosen code location via GDB attached to QEMU's
> > built-in debug stub?
> 
> Short answer: I am not able to fully test this, I can only boot.
> 
> The reason is that gdb-multiarch is not working as expected.
> The binary in my distribution has the python support broken. So when I try to
> inject the interrupt, I'm receiving a python error (actually, I receive the same
> error after the "target remote" command).
> I've also tried to compile the binary from source, but again,
> I understand why in OBS the build I found is broken...

 Well, you should be able to set a breakpoint at `rollback_handle_int' and 
fiddle with $epc by hand to see if the code sequence correctly skips over 
WAIT.  Though I reckon QEMU used to have an issue with presenting the MIPS 
privileged context over its debug stub.  Has the issue been fixed?  Either 
way you should be able to just operate on the copy in $k0 retrieved with 
(D)MFC0.

> > Below I've included a complete change based on the outline above.  It
> > seems to do the right thing for a couple of my configurations, but I've
> > only eyeballed the resulting code and haven't tried running it.  Most of
> > my hardware doesn't implement the WAIT instruction anyway.
> 
> It means it would be better to have someone else try the resulting
> patch, I guess.

 Exhaustive run-time verification is not always necessary if you can 
demonstrate that your code is correct via other means, including 
proofreading.

 FAOD I have one MIPS32r2 system wired for testing, but that might not be 
the most interesting configuration to verify as it'll now just use EI/EHB 
to enable interrupts ahead of WAIT.  I could try an R1 kernel instead, but 
I'm not sure if it can be made to work owing to the differences in the FPU 
between R1 and R2 for the MIPS32 ISA.  I used to have a MIPS64 (R1) system 
there, but the CPU daughtercard sadly stopped working 3 years ago and I 
wasn't able to repair it, owing to the lack of available spare parts (it's 
most likely a dead CPU).

> > Let me know if you find anything here unclear or have any questions or
> > comments.
> 
> 1)
> 
> > /* Keep the ISA bit clear for calculations on local labels here. */
> 
> The ISA bit should be the bit 0, correct?
> So, also in the macro code, it's done to preserve that bit.

 Correct, the bit will be set according to the ISA mode at the time the 
originating machine instruction is executed, in EPC or any other register 
the PC is copied to, e.g. $ra.  Likewise any instruction setting the PC 
such as JR or ERET will set the ISA mode from the ISA bit of the source 
register (the ISA bit for exception entry is set from CP0 Config3.ISAOnExc 
register bit).

 All code labels in microMIPS code will have the bit set, so that 
relocations correctly calculate immediates used to make register jumps.  

 The ISA mode can be switched explicitly with the JALX instruction (you 
can mix regular MIPS and microMIPS code as long as hardware supports the 
other ISA mode; either or both can be implemented in a given piece of 
silicon).

 Other immediate jumps and branches preserve the current ISA mode, but the 
assembler and linker verify you don't attempt to use these instructions to 
pass control to code in the other mode; this is an assembly or link error 
depending at what stage the label reference is resolved.

 FYI the documents for the microMIPS mode of operation are respectively:

- "MIPS Architecture For Programmers Volume I-B: Introduction to the
   microMIPS32 Architecture"

- "MIPS Architecture for Programmers Volume II-B: The microMIPS32 
   Instruction Set"

and their microMIPS64 counterparts (although the first document is almost 
an exact copy of its regular MIPS variant).  Be sure to download revision 
5.xx, because revision 6.xx describes an entirely different ISA which we 
currently have no support for (downstream patches were never submitted; 
also microMIPSr6 removed branch delay slots, which caused all sorts of 
portability issues).  See Section 3.5 of the latter manual for further 
discussion of the ISA bit.

> 2)
> .section .cpuidle.text,"ax"
> 
> This should be a single patch, right?
> Based on what I understood, 'a' should be the allocation, and 'x' the
> executable attribute.

 Both correct (see the GAS manual for the section flags); this just 
matches the __cpuidle macro from <linux/compiler_types.h>.

> This should be in order to mark those symbols like "cpuidle text":
> 
> $ nm -n vmlinux | grep -A3 "cpuidle_text"
> ffffffff80a127e0 T __cpuidle_text_start
> ffffffff80a127e0 T r4k_wait
> ffffffff80a12800 t r4k_wait_insn
> ffffffff80a12804 t r4k_wait_exit
> --
> ffffffff80a12c00 T __cpuidle_text_end
> ffffffff80a12c00 T __noinstr_text_end
> ffffffff80a12c00 t rest_init
> ffffffff80a12ccc t kernel_init
> 
> I guess it is used in order to understand if the instruction pointer is inside
> one of these functions / labels.

 See the comment at said macro in <linux/compiler_types.h> and also commit 
6727ad9e206c ("nmi_backtrace: generate one-line reports for idle cpus").

> How does a commit description sound like this?
> 
> "
> mips: Add dedicated .cpuidle.text section for CPU idle routines
> 
> Add a dedicated executable section for CPU idle code to properly organize
> and identify idle-related functions inside the .text section.
> "

 How about:

"
MIPS: Move __r4k_wait() to .cpuidle.text section

Fix missing .cpuidle.text section assignment for __r4k_wait() to correct 
backtracing with nmi_backtrace().

Fixes: 97c8580e85cf ("MIPS: Annotate cpu_wait implementations with __cpuidle")
"

or suchlike (based on the commit referred)?

 This probably does not itself qualify for linux-stable as the issue is 
only annoying rather than fatal, but I think the annotation should be 
there in case someone wants to backport it downstream.

> 3)
> 
> > I think we also need to replace "rollback" with
> > another name as with new code we don't roll back anymore.
> 
> Should be changed with "region", instead of rollback, maybe?
> Do you have something better to suggest?

 Hmm, "skipover" maybe?

  Maciej

