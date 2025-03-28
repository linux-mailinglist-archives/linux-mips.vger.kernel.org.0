Return-Path: <linux-mips+bounces-8394-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B294A7488D
	for <lists+linux-mips@lfdr.de>; Fri, 28 Mar 2025 11:43:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A058417BF81
	for <lists+linux-mips@lfdr.de>; Fri, 28 Mar 2025 10:43:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1074621322B;
	Fri, 28 Mar 2025 10:43:02 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F4C91C174E;
	Fri, 28 Mar 2025 10:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743158582; cv=none; b=qOW1Kk5GJVHNW3dAP3Cg9jrVtjYBPahQ0R3JABdNq2XlKnjj7jfy7jhrONWfSLluWuSyUJxjOiysmdokQJlkoeqIaUCB1DmnmnYTTtmx0EGvoKUtkI2zbRMNs4H5aj+oAJML4X8wY8eYXzYlCnAV4CGb2jlDe+8GzcTMlJYkgZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743158582; c=relaxed/simple;
	bh=RGvkjYCnX8xGlZm4pCFZKNWvPleXd2bYo/GQZmrfKJU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=OcYsA0PRz+Fx684ioyYDOkoA5FwxD9jwc1DZqhDgLMtm9PEo4RZkz6clfM1Ws7A6aPvWDzfso+CpUuajjqMEgJycSdPuP9LosBcQVxlAxC2odq5gbiB3vMuVba/iKxjEWP1583DoN7ObSgy1jVOeTUw9ELDe8Oeo1ucP04+fmEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 7C8FB92009C; Fri, 28 Mar 2025 11:42:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 7594992009B;
	Fri, 28 Mar 2025 10:42:50 +0000 (GMT)
Date: Fri, 28 Mar 2025 10:42:50 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Marco Crivellari <marco.crivellari@suse.com>
cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Frederic Weisbecker <frederic@kernel.org>, 
    Anna-Maria Behnsen <anna-maria@linutronix.de>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    Peter Zijlstra <peterz@infradead.org>, Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH v6 1/1] MIPS: Fix idle VS timer enqueue
In-Reply-To: <CAAofZF5yaGMG0Kyax+ksfGngQ0T6AxvN5-60SnasQh7=OabaOg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2503260300290.29685@angie.orcam.me.uk>
References: <20250315194002.13778-1-marco.crivellari@suse.com> <20250315194002.13778-2-marco.crivellari@suse.com> <alpine.DEB.2.21.2503211146001.35806@angie.orcam.me.uk> <CAAofZF4gy6WJKLK4TzF5aV7+ca3gob5jVz3XQZyGrTpfnCsn_Q@mail.gmail.com>
 <alpine.DEB.2.21.2503211747150.35806@angie.orcam.me.uk> <CAAofZF5yaGMG0Kyax+ksfGngQ0T6AxvN5-60SnasQh7=OabaOg@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Marco,

> >  Whatever manual you quote it refers to MIPS Release 2, which is only
> > dated 2003
> 
> About the MIPS manual, anyhow, it is "MIPS32 M4 Processor Core" (year 2008).
> Maybe I've also picked the wrong manual.

 It has to be M4K there, and that isn't the most fortunate choice, because 
it's a manual for the specific microarchitecture and then one that doesn't 
usually run Linux, because it has no TLB.  For MIPS Release 1 onwards the 
architecture manuals are a better choice, but still they don't necessarily 
get the details right for older legacy MIPS ISA revisions.

 For your reference the architecture manuals are:

- "MIPS32 Architecture For Programmers, Volume I: Introduction to the 
   MIPS32 Architecture",

- "MIPS32 Architecture For Programmers, Volume II: The MIPS32 Instruction 
   Set",

- "MIPS32 Architecture For Programmers, Volume III: The MIPS32 Privileged 
   Resource Architecture",

and their MIPS64 counterparts, released repeatedly as the architecture 
evolved with the document's major revision number matching the respective 
architecture release.  I do believe the most recent revisions continue 
being available from the MIPS web site.  But as the titles imply these 
manuals document the architecture and not the intricacies of the MIPS 
assembly language dialect or the various aspects of programming for the 
architecture.  For that you need another book.

> >  Best is to avoid using a `.set noreorder' region in the first place.
> > But is it really needed here?  Does the rollback area have to be of a
> > hardcoded size rather than one calculated by the assembler based on
> > actual machine code produced?  It seems to me having it calculated would
> > reduce complexity here and let us use the EI instruction where available
> > as well.
> 
> Well, considering the complexity and how the code looks fragile even with
> a small change, yes, that's likely better to avoid noreorder.

 FAOD this is my general observation, regardless of its applicability 
here.

> I think I'm going to need some guidance here.
> Please, correct me where something is wrong.
> 
> 1)
> When you say "let us use the EI instruction where available" are you
> referring to do
> something like below?
> 
> #if defined(CONFIG_CPU_HAS_DIEI)
> ei
> #else
> MFC0    t0, CP0_STATUS
> ori     t0, 0x1f
> xori    t0, 0x1e
> MTC0    t0, CP0_STATUS
> #endif

 I think let's just simplify this stuff a lot and make use of the existing 
code infrastructure.  Since we move interrupt enabling into `__r4k_wait', 
we can just get rid of the C wrapper the existence of which makes no sense 
anymore along with the extra nesting of function calls, and have something 
along the lines of:

	.section .cpuidle.text,"ax"
	/* Align to 32 bytes for the maximum idle interrupt region size.  */
	.align	5
LEAF(r4k_wait)
	/* Keep the ISA bit clear for calculations on local labels here.  */
0:	.fill	0
	/* Start of idle interrupt region.  */
	local_irq_enable
	/*
	 * If an interrupt lands here, before going idle on the next
	 * instruction, we must *NOT* go idle since the interrupt could
	 * have set TIF_NEED_RESCHED or caused a timer to need resched.
	 * Fall through -- see rollback_handler below -- and have the
	 * idle loop take care of things.
	 */
1:	.fill	0
	/* The R2 EI/EHB sequence takes 8 bytes, otherwise pad up.  */
	.if	1b - 0b > 32
	.error	"overlong idle interrupt region"
	.elseif	1b - 0b > 8
	.align	4
	.endif
2:	.fill	0
	.equ	r4k_wait_idle_size, 2b - 0b
	/* End of idle interrupt region; size has to be a power of 2.  */
	.set	MIPS_ISA_ARCH_LEVEL_RAW
r4k_wait_insn:
	wait
	.set	mips0
	local_irq_disable
	jr	ra
	END(r4k_wait)
	.previous

	.macro	BUILD_ROLLBACK_PROLOGUE handler
	FEXPORT(rollback_\handler)
	.set	push
	.set	noat
	MFC0	k0, CP0_EPC
	/* Subtract 2 to let the ISA bit propagate through the mask.  */
	PTR_LA	k1, r4k_wait_insn - 2
	ori	k0, r4k_wait_idle_size - 2
	bne	k0, k1, \handler
	MTC0	k0, CP0_EPC
	.set pop
	.endm

There's some complication here coming from the need to factor in the ISA 
bit in the microMIPS mode; something that hasn't been discussed so far.  
The `.fill 0' approach is a hack and it has struck me that we need to add 
a `.noinsn' pseudo-op to GAS for this purpose, complementing `.insn', but 
we need to stick with the hack for now anyway as it will take years until 
we can rely on a new feature in the assembler.

 NB don't refer to a local label from a macro as such a reference may end 
up pointing not where you want it to from the place the macro is pasted 
at.  For example with your v6 code BUILD_ROLLBACK_PROLOGUE refers to the 
intended label in `__r4k_wait' when pasted for `handle_int', but then to 
the label in `except_vec4' instead when pasted for `except_vec_vi' further 
down.

> 2)
> Removing "noreorder" would let the compiler add "nops" where they are needed.

 The assembler, not the compiler.

> But that still means the 3 ssnop and ehb are still needed, right?

 Yes, in the pessimistic case, which the code above avoids where not 
needed.  E.g. for R2 we now have:

807f1700 <r4k_wait>:
807f1700:	41606020 	ei
807f1704:	000000c0 	ehb

807f1708 <r4k_wait_insn>:
807f1708:	42000020 	wait
807f170c:	41606000 	di
807f1710:	000000c0 	ehb
807f1714:	03e00008 	jr	ra
807f1718:	00000000 	nop
	...

-- nice and sweet, and for the R10k likewise:

a80000000084e540 <r4k_wait>:
a80000000084e540:	400c6000 	mfc0	t0,$12
a80000000084e544:	358c0001 	ori	t0,t0,0x1
a80000000084e548:	408c6000 	mtc0	t0,$12
a80000000084e54c:	00000000 	nop

a80000000084e550 <r4k_wait_insn>:
a80000000084e550:	42000020 	wait
a80000000084e554: 	400c6000 	mfc0	t0,$12
a80000000084e558: 	358c0001 	ori	t0,t0,0x1
a80000000084e55c: 	398c0001 	xori	t0,t0,0x1
a80000000084e560: 	408c6000 	mtc0	t0,$12
a80000000084e564: 	03e00008 	jr	ra
a80000000084e568: 	00000000 	nop
	...

-- because it's fully interlocked, so no extra NOPs other than to pad the 
idle interrupt region to a power-of-two size.

> My subsequent dumb question is: there is the guarantee that the
> compiler will not
> reorder / change something we did?

 Not in this case; the assembler isn't that smart (which is why compiled 
code is usually a better choice where feasible) and except for one case 
all it can do is adding extra NOPs between instructions to avoid pipeline 
hazards (and then ones coming from data dependencies in register use 
only), including ones between non-adjacent instruction pairs.

 The only exception are jumps/branches where the assembler will schedule 
their delay slot where possible by swapping the jump/branch with the 
immediately preceding instruction where no data dependency exists between 
the two instructions.  Otherwise the delay slot will be filled with a NOP.

 For example with the code sequences above the last instruction produced 
by `local_irq_disable' could be scheduled into the delay slot of `jr ra'.  
It wouldn't be an issue here however and it doesn't actually happen with 
GAS, likely because `local_irq_disable' is a user macro.  For built-in 
instruction macros such as `la' the swapping of the final instruction does 
happen.

> This question also came after reading the manual you quoted (paragraph
> "Coprocessor Hazards"):
> 
> "For example, after an mtc0 to the Status register which changes an
> interrupt mask bit,
> there will be two further instructions before the interrupt is
> actually enabled or disabled.
> [...]
> To cope with these situations usually requires the programmer to take explicit
> action to prevent the assembler from scheduling inappropriate
> instructions after a
> dangerous mtc0. This is done by using the .set noreorder directive,
> discussed below"

 Technically it is correct and likely the original MIPSCO assembler from 
1985 or one supplied with IRIX were smarter, but GAS won't itself ever 
reorder instructions other than to fill branch delay slots, so we don't 
have to be worried.  Here's the relevant comment from GAS sources:

      /* There are a lot of optimizations we could do that we don't.
	 In particular, we do not, in general, reorder instructions.
	 If you use gcc with optimization, it will reorder
	 instructions and generally do much more optimization then we
	 do here; repeating all that work in the assembler would only
	 benefit hand written assembly code, and does not seem worth
	 it.  */

And in cases like this where we just don't want a bunch of instructions to 
be moved across a certain point we don't actually have to schedule any 
code by hand as a lone:

	.set	noreorder
	.set	reorder

barrier will do (or actually just a label should as well).

> 3)
> Considering the size is determined by the compiler, the check about
> the idle interrupt
> size region should not be needed, correct?

 I gave it some thought and concluded that the interrupt handling path has 
to be optimised for performance and the idle routine does not.  Therefore 
I think we need to stick to the power-of-two size for the idle interrupt 
region, because in that case the check for an interrupt arriving within 
`r4k_wait' but ahead of the WAIT instruction can be done with a pair of 
ALU operations and a single branch.  Anything more complex would require 
more operations in the interrupt handling path.

> 4)
> ori and PTR_ADDIU should be removed of course from the rollback handler macro.

 I can't imagine how we'd advance past WAIT without these instructions, 
what do you have in mind?

> Can I have some hints about the needed change?
> Using QEMU is always working, so I'm not sure if what I will change is
> also correct.

 Any verification with real hardware can only be based on the probability 
of an interrupt arriving at the right time and the right conditions for a 
pending timer.  I'd expect such an event to be relatively rare, so for the 
large part I think we need to rely on correct code generation rather than 
run-time verification.  Making use of the existing infrastructure rather 
than having an ad-hoc handcoded variant improves robustness here and also 
means no change will likely be needed should any further platform variant 
of the various hazard resolution macros be added in the future.

 NB how do you actually verify this stuff with QEMU?  Is it by injecting 
an interrupt by hand at a chosen code location via GDB attached to QEMU's 
built-in debug stub?

> Many thanks in advance, also for your time!

 You're welcome.

 Below I've included a complete change based on the outline above.  It 
seems to do the right thing for a couple of my configurations, but I've 
only eyeballed the resulting code and haven't tried running it.  Most of 
my hardware doesn't implement the WAIT instruction anyway.

 The missing `.cpuidle.text' section assignment is a separate preexisting 
problem and the fix might be worth splitting off into a preparatory patch, 
for backporting or documentation purposes.

 You can add my:

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>

on top of yours when using this code, since it's still ultimately yours, 
just massaged a little.  FWIW I went ahead and chose to cook this piece up 
myself since I realised how complex this issue actually is and that it 
would take us forever to get all the individual aspects nailed over e-mail 
communication.

 Let me know if you find anything here unclear or have any questions or 
comments.

  Maciej

---
 arch/mips/include/asm/idle.h |    3 --
 arch/mips/kernel/genex.S     |   59 ++++++++++++++++++++++++-------------------
 arch/mips/kernel/idle.c      |    7 -----
 3 files changed, 34 insertions(+), 35 deletions(-)

linux-mips-idle-vs-timer.diff
Index: linux-macro/arch/mips/include/asm/idle.h
===================================================================
--- linux-macro.orig/arch/mips/include/asm/idle.h
+++ linux-macro/arch/mips/include/asm/idle.h
@@ -6,8 +6,7 @@
 #include <linux/linkage.h>
 
 extern void (*cpu_wait)(void);
-extern void r4k_wait(void);
-extern asmlinkage void __r4k_wait(void);
+extern asmlinkage void r4k_wait(void);
 extern void r4k_wait_irqoff(void);
 
 static inline int using_rollback_handler(void)
Index: linux-macro/arch/mips/kernel/genex.S
===================================================================
--- linux-macro.orig/arch/mips/kernel/genex.S
+++ linux-macro/arch/mips/kernel/genex.S
@@ -104,41 +104,48 @@ NESTED(except_vec3_r4000, 0, sp)
 
 	__FINIT
 
-	.align	5	/* 32 byte rollback region */
-LEAF(__r4k_wait)
-	.set	push
-	.set	noreorder
-	/* start of rollback region */
-	LONG_L	t0, TI_FLAGS($28)
-	nop
-	andi	t0, _TIF_NEED_RESCHED
-	bnez	t0, 1f
-	 nop
-	nop
-	nop
-#ifdef CONFIG_CPU_MICROMIPS
-	nop
-	nop
-	nop
-	nop
-#endif
+	.section .cpuidle.text,"ax"
+	/* Align to 32 bytes for the maximum idle interrupt region size.  */
+	.align	5
+LEAF(r4k_wait)
+	/* Keep the ISA bit clear for calculations on local labels here.  */
+0:	.fill	0
+	/* Start of idle interrupt region.  */
+	local_irq_enable
+	/*
+	 * If an interrupt lands here, before going idle on the next
+	 * instruction, we must *NOT* go idle since the interrupt could
+	 * have set TIF_NEED_RESCHED or caused a timer to need resched.
+	 * Fall through -- see rollback_handler below -- and have the
+	 * idle loop take care of things.
+	 */
+1:	.fill	0
+	/* The R2 EI/EHB sequence takes 8 bytes, otherwise pad up.  */
+	.if	1b - 0b > 32
+	.error	"overlong idle interrupt region"
+	.elseif	1b - 0b > 8
+	.align	4
+	.endif
+2:	.fill	0
+	.equ	r4k_wait_idle_size, 2b - 0b
+	/* End of idle interrupt region; size has to be a power of 2.  */
 	.set	MIPS_ISA_ARCH_LEVEL_RAW
+r4k_wait_insn:
 	wait
-	/* end of rollback region (the region size must be power of two) */
-1:
+	.set	mips0
+	local_irq_disable
 	jr	ra
-	 nop
-	.set	pop
-	END(__r4k_wait)
+	END(r4k_wait)
+	.previous
 
 	.macro	BUILD_ROLLBACK_PROLOGUE handler
 	FEXPORT(rollback_\handler)
 	.set	push
 	.set	noat
 	MFC0	k0, CP0_EPC
-	PTR_LA	k1, __r4k_wait
-	ori	k0, 0x1f	/* 32 byte rollback region */
-	xori	k0, 0x1f
+	/* Subtract 2 to let the ISA bit propagate through the mask.  */
+	PTR_LA	k1, r4k_wait_insn - 2
+	ori	k0, r4k_wait_idle_size - 2
 	bne	k0, k1, \handler
 	MTC0	k0, CP0_EPC
 	.set pop
Index: linux-macro/arch/mips/kernel/idle.c
===================================================================
--- linux-macro.orig/arch/mips/kernel/idle.c
+++ linux-macro/arch/mips/kernel/idle.c
@@ -35,13 +35,6 @@ static void __cpuidle r3081_wait(void)
 	write_c0_conf(cfg | R30XX_CONF_HALT);
 }
 
-void __cpuidle r4k_wait(void)
-{
-	raw_local_irq_enable();
-	__r4k_wait();
-	raw_local_irq_disable();
-}
-
 /*
  * This variant is preferable as it allows testing need_resched and going to
  * sleep depending on the outcome atomically.  Unfortunately the "It is

