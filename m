Return-Path: <linux-mips+bounces-7735-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E11A31401
	for <lists+linux-mips@lfdr.de>; Tue, 11 Feb 2025 19:23:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 744781886D09
	for <lists+linux-mips@lfdr.de>; Tue, 11 Feb 2025 18:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 468661E32DB;
	Tue, 11 Feb 2025 18:22:41 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57FDB1E231F;
	Tue, 11 Feb 2025 18:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739298161; cv=none; b=sNoil1LNL+eztQfr286x9xrR0Qz3gRx2+Cl93vH+JzG9+3I9PjPeAlmSyyOEaJVuSAPMH427UfygxSHyTWjc9skP1qIf4xfaKl0nXBtJQJQwbP3Knyr2l/TrECF1W3CKFnLR99GQ0lR8o4w7gFfpS4la0H+nL2KmNaYIq9vpzws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739298161; c=relaxed/simple;
	bh=7dkQibdUy+NOc+u9G1470iGJGOPpU8BL2cSrqAQbM30=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=TGG/75aIYVHqIpcJASfVKgDK/WdLHUSXgGI114soiIuuCu0qxiLGlIknDRAHNvdLnOQEv/pvhH+RvnDV6104+xrPNx/10xBD9+KDpAQ1TT/hMtqleD9qB7xKSTMCXYGEHNy8dKR9hLpAGB1bsgMr+iUf6yXEArcKgaAkXw+Yg/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id EF5F492009C; Tue, 11 Feb 2025 19:22:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id EAABA92009B;
	Tue, 11 Feb 2025 18:22:30 +0000 (GMT)
Date: Tue, 11 Feb 2025 18:22:30 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Oleg Nesterov <oleg@redhat.com>, "Dmitry V. Levin" <ldv@strace.io>
cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Export syscall stack arguments properly for remote
 use
Message-ID: <alpine.DEB.2.21.2502101732120.65342@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

We have several places across the kernel where we want to access another 
task's syscall arguments, such as ptrace(2), seccomp(2), etc., by making 
a call to syscall_get_arguments().

This works for register arguments right away by accessing the task's 
`regs' member of `struct pt_regs', however for stack arguments seen with 
32-bit/o32 kernels things are more complicated.  Technically they ought 
to be obtained from the user stack with calls to an access_remote_vm(), 
but we have an easier way available already.

So as to be able to access syscall stack arguments as regular function 
arguments following the MIPS calling convention we copy them over from 
the user stack to the kernel stack in arch/mips/kernel/scall32-o32.S, in 
handle_sys(), to the current stack frame's outgoing argument space at 
the top of the stack, which is where the handler called expects to see 
its incoming arguments.  This area is also pointed at by the `pt_regs'
pointer obtained by task_pt_regs().

Make the o32 stack argument space a proper member of `struct pt_regs' 
then, by renaming the existing member from `pad0' to `args' and using 
generated offsets to access the space.  No functional change though.

With the change in place the o32 kernel stack frame layout at the entry 
to a syscall handler invoked by handle_sys() is therefore as follows:

$sp + 68 -> |         ...         | <- pt_regs.regs[9]
            +---------------------+
$sp + 64 -> |         $t0         | <- pt_regs.regs[8]
            +---------------------+
$sp + 60 -> |   $a3/argument #4   | <- pt_regs.regs[7]
            +---------------------+
$sp + 56 -> |   $a2/argument #3   | <- pt_regs.regs[6]
            +---------------------+
$sp + 52 -> |   $a1/argument #2   | <- pt_regs.regs[5]
            +---------------------+
$sp + 48 -> |   $a0/argument #1   | <- pt_regs.regs[4]
            +---------------------+
$sp + 44 -> |         $v1         | <- pt_regs.regs[3]
            +---------------------+
$sp + 40 -> |         $v0         | <- pt_regs.regs[2]
            +---------------------+
$sp + 36 -> |         $at         | <- pt_regs.regs[1]
            +---------------------+
$sp + 32 -> |        $zero        | <- pt_regs.regs[0]
            +---------------------+
$sp + 28 -> |  stack argument #8  | <- pt_regs.args[7]
            +---------------------+
$sp + 24 -> |  stack argument #7  | <- pt_regs.args[6]
            +---------------------+
$sp + 20 -> |  stack argument #6  | <- pt_regs.args[5]
            +---------------------+
$sp + 16 -> |  stack argument #5  | <- pt_regs.args[4]
            +---------------------+
$sp + 12 -> | psABI space for $a3 | <- pt_regs.args[3]
            +---------------------+
$sp +  8 -> | psABI space for $a2 | <- pt_regs.args[2]
            +---------------------+
$sp +  4 -> | psABI space for $a1 | <- pt_regs.args[1]
            +---------------------+
$sp +  0 -> | psABI space for $a0 | <- pt_regs.args[0]
            +---------------------+

holding user data received and with the first 4 frame slots reserved by 
the psABI for the compiler to spill the incoming arguments from $a0-$a3 
registers (which it sometimes does according to its needs) and the next 
4 frame slots designated by the psABI for any stack function arguments 
that follow.  This data is also available for other tasks to peek/poke 
at as reqired and where permitted.

Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
---
 arch/mips/include/asm/ptrace.h |    4 ++--
 arch/mips/kernel/asm-offsets.c |    6 ++++++
 arch/mips/kernel/scall32-o32.S |    8 ++++----
 3 files changed, 12 insertions(+), 6 deletions(-)

linux-mips-scall32-o32-pt-regs-args.diff
Index: linux-malta/arch/mips/include/asm/ptrace.h
===================================================================
--- linux-malta.orig/arch/mips/include/asm/ptrace.h
+++ linux-malta/arch/mips/include/asm/ptrace.h
@@ -27,8 +27,8 @@
  */
 struct pt_regs {
 #ifdef CONFIG_32BIT
-	/* Pad bytes for argument save space on the stack. */
-	unsigned long pad0[8];
+	/* Saved syscall stack arguments; entries 0-3 unused. */
+	unsigned long args[8];
 #endif
 
 	/* Saved main processor registers. */
Index: linux-malta/arch/mips/kernel/asm-offsets.c
===================================================================
--- linux-malta.orig/arch/mips/kernel/asm-offsets.c
+++ linux-malta/arch/mips/kernel/asm-offsets.c
@@ -27,6 +27,12 @@
 void output_ptreg_defines(void)
 {
 	COMMENT("MIPS pt_regs offsets.");
+#ifdef CONFIG_32BIT
+	OFFSET(PT_ARG4, pt_regs, args[4]);
+	OFFSET(PT_ARG5, pt_regs, args[5]);
+	OFFSET(PT_ARG6, pt_regs, args[6]);
+	OFFSET(PT_ARG7, pt_regs, args[7]);
+#endif
 	OFFSET(PT_R0, pt_regs, regs[0]);
 	OFFSET(PT_R1, pt_regs, regs[1]);
 	OFFSET(PT_R2, pt_regs, regs[2]);
Index: linux-malta/arch/mips/kernel/scall32-o32.S
===================================================================
--- linux-malta.orig/arch/mips/kernel/scall32-o32.S
+++ linux-malta/arch/mips/kernel/scall32-o32.S
@@ -64,10 +64,10 @@ load_a6: user_lw(t7, 24(t0))		# argument
 load_a7: user_lw(t8, 28(t0))		# argument #8 from usp
 loads_done:
 
-	sw	t5, 16(sp)		# argument #5 to ksp
-	sw	t6, 20(sp)		# argument #6 to ksp
-	sw	t7, 24(sp)		# argument #7 to ksp
-	sw	t8, 28(sp)		# argument #8 to ksp
+	sw	t5, PT_ARG4(sp)		# argument #5 to ksp
+	sw	t6, PT_ARG5(sp)		# argument #6 to ksp
+	sw	t7, PT_ARG6(sp)		# argument #7 to ksp
+	sw	t8, PT_ARG7(sp)		# argument #8 to ksp
 	.set	pop
 
 	.section __ex_table,"a"

