Return-Path: <linux-mips+bounces-8396-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4DBA74C43
	for <lists+linux-mips@lfdr.de>; Fri, 28 Mar 2025 15:18:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 804A63A91E0
	for <lists+linux-mips@lfdr.de>; Fri, 28 Mar 2025 14:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E8917BCE;
	Fri, 28 Mar 2025 14:18:34 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D84D16BE3A;
	Fri, 28 Mar 2025 14:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743171514; cv=none; b=FzS2/AxK5rG+rm6U2M/EHy6h3aJhOSu2A7DjKHchN0413fx4w5HOMY0WBzlnODwoZZzuYYh/MsJV660FWeeYaXj1fLNGd/qxcy8HeoFF4SYWrwKUbzgw64oHio/9AQbcsGXXH2p8hFkvtMaioFOH+9lTN0V4jdJIXHRCAj77Xg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743171514; c=relaxed/simple;
	bh=gVJ2Op8dE/iVm0XpfyCO967lCATWD22HnXANHUDQoiI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Ptc1aYc3vJLq7s50erJIFawxTEv7nDvXqa9h0qveBoK2XQM/+EQS3kjLHruslqQnQmZXRC/ZkgAmv1u4kbjcD3pnZchJ0CCTKq5PkkR1PHNdVblq/trzGAJmseP9f/WH+fbwYOeM0A4jU/nWwaQQxJe698IbhqoxV2QYTM8TGUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 91C8792009C; Fri, 28 Mar 2025 15:18:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 8E8CD92009B;
	Fri, 28 Mar 2025 14:18:29 +0000 (GMT)
Date: Fri, 28 Mar 2025 14:18:29 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Marco Crivellari <marco.crivellari@suse.com>
cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Frederic Weisbecker <frederic@kernel.org>, 
    Anna-Maria Behnsen <anna-maria@linutronix.de>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    Peter Zijlstra <peterz@infradead.org>, Huacai Chen <chenhuacai@kernel.org>
Subject: Re: [PATCH v6 1/1] MIPS: Fix idle VS timer enqueue
In-Reply-To: <alpine.DEB.2.21.2503260300290.29685@angie.orcam.me.uk>
Message-ID: <alpine.DEB.2.21.2503281345010.47733@angie.orcam.me.uk>
References: <20250315194002.13778-1-marco.crivellari@suse.com> <20250315194002.13778-2-marco.crivellari@suse.com> <alpine.DEB.2.21.2503211146001.35806@angie.orcam.me.uk> <CAAofZF4gy6WJKLK4TzF5aV7+ca3gob5jVz3XQZyGrTpfnCsn_Q@mail.gmail.com>
 <alpine.DEB.2.21.2503211747150.35806@angie.orcam.me.uk> <CAAofZF5yaGMG0Kyax+ksfGngQ0T6AxvN5-60SnasQh7=OabaOg@mail.gmail.com> <alpine.DEB.2.21.2503260300290.29685@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 28 Mar 2025, Maciej W. Rozycki wrote:

> just massaged a little.  FWIW I went ahead and chose to cook this piece up 
> myself since I realised how complex this issue actually is and that it 
> would take us forever to get all the individual aspects nailed over e-mail 
> communication.

 And yet after this many of internal iterations I did manage to miss one 
bit.  In the optimised version proposed we need to explicitly skip over 
the WAIT instruction like this:

r4k_wait_insn:
	wait
r4k_wait_exit:

and then:

	.set	noreorder
	bne	k0, k1, \handler
	 PTR_ADDIU	k0, r4k_wait_exit - r4k_wait_insn + 2
	.set	reorder

(and here we have a legitimate use for `.set noreorder' to avoid wasting a 
NOP for the branch delay slot due to a data antidependency on $k0; it's 
fine to clobber $k0 in the branch-taken case as by definition the register 
is dead at the exit from this macro).

 Updated patch follows.  I think we also need to replace "rollback" with 
another name as with new code we don't roll back anymore.

  Maciej

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
 arch/mips/include/asm/idle.h |    3 --
 arch/mips/kernel/genex.S     |   63 +++++++++++++++++++++++++------------------
 arch/mips/kernel/idle.c      |    7 ----
 3 files changed, 38 insertions(+), 35 deletions(-)

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
@@ -104,42 +104,53 @@ NESTED(except_vec3_r4000, 0, sp)
 
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
+r4k_wait_exit:
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
+	/* Subtract/add 2 to let the ISA bit propagate through the mask.  */
+	PTR_LA	k1, r4k_wait_insn - 2
+	ori	k0, r4k_wait_idle_size - 2
+	.set	noreorder
 	bne	k0, k1, \handler
+	 PTR_ADDIU	k0, r4k_wait_exit - r4k_wait_insn + 2
+	.set	reorder
 	MTC0	k0, CP0_EPC
 	.set pop
 	.endm
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

