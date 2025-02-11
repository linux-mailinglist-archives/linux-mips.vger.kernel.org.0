Return-Path: <linux-mips+bounces-7742-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB9CA31943
	for <lists+linux-mips@lfdr.de>; Wed, 12 Feb 2025 00:02:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 384343A553E
	for <lists+linux-mips@lfdr.de>; Tue, 11 Feb 2025 23:02:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45E9727293A;
	Tue, 11 Feb 2025 23:02:13 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD396272924;
	Tue, 11 Feb 2025 23:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.107.17.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739314933; cv=none; b=GNormyHsuLTTLuzwDeakUr6mkyZIh8836a7ZqJLMpWdlEgy7DKnadds387VU+Y4DkFxB1q0zM++sTtIdPDlXnaVZqAo48O+5JoRM+3tnA5tztCRwocHf31snjt7/0fa09zqV2tP7f4PSjUotIOMfTSG2anOwLTga4didYdrb6sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739314933; c=relaxed/simple;
	bh=H7bdxn0MkgRyaqEuoBJoO78Bs2zTYOuyVXTnazydVek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GfmHsF3vfiG9iHIQavrwAD0CUgye5Rh62txrVy4eL6SRrw4zZPXT82QEcjd3DDCdSQP7SSByq67yelAUwGaSGKV0xSOmJiZQ8F2Fp5Zr7S9LazUPbKf3oJbHxUg5+6gTLy2yW0iOOunSGEcJrztlnk8W6ITLpotESn0bBl8qvX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=194.107.17.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 8588872C8CC;
	Wed, 12 Feb 2025 02:02:09 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 6DA1F7CCB3A; Wed, 12 Feb 2025 01:02:09 +0200 (IST)
Date: Wed, 12 Feb 2025 01:02:09 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Oleg Nesterov <oleg@redhat.com>, Alexey Gladkov <legion@kernel.org>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, strace-devel@lists.strace.io,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: fix mips_get_syscall_arg() for o32
Message-ID: <20250211230209.GA19616@strace.io>
References: <alpine.DEB.2.21.2502101732120.65342@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2502101732120.65342@angie.orcam.me.uk>

This makes ptrace/get_syscall_info selftest pass on mips o32 and
mips64 o32 by fixing the following two test assertions:

1. get_syscall_info test assertion on mips o32:
  # get_syscall_info.c:218:get_syscall_info:Expected exp_args[5] (3134521044) == info.entry.args[4] (4911432)
  # get_syscall_info.c:219:get_syscall_info:wait #1: entry stop mismatch

2. get_syscall_info test assertion on mips64 o32:
  # get_syscall_info.c:209:get_syscall_info:Expected exp_args[2] (3134324433) == info.entry.args[1] (18446744072548908753)
  # get_syscall_info.c:210:get_syscall_info:wait #1: entry stop mismatch

The first assertion happens due to mips_get_syscall_arg() trying to access
another task's context but failing to do it properly because get_user() it
calls just peeks at the current task's context.  It usually does not crash
because the default user stack always gets assigned the same VMA, but it
is pure luck which mips_get_syscall_arg() wouldn't have if e.g. the stack
was switched (via setcontext(3) or however) or a non-default process's
thread peeked at, and in any case irrelevant data is obtained just as
observed with the test case.

mips_get_syscall_arg() ought to be using access_remote_vm() instead to
retrieve the other task's stack contents, but given that the data has been
already obtained and saved in `struct pt_regs' it would be an overkill.

The first assertion is fixed for mips o32 by using struct pt_regs.args
instead of get_user() to obtain syscall arguments.  This approach works
due to this piece in arch/mips/kernel/scall32-o32.S:

        /*
         * Ok, copy the args from the luser stack to the kernel stack.
         */

        .set    push
        .set    noreorder
        .set    nomacro

    load_a4: user_lw(t5, 16(t0))		# argument #5 from usp
    load_a5: user_lw(t6, 20(t0))		# argument #6 from usp
    load_a6: user_lw(t7, 24(t0))		# argument #7 from usp
    load_a7: user_lw(t8, 28(t0))		# argument #8 from usp
    loads_done:

        sw	t5, PT_ARG4(sp)		# argument #5 to ksp
        sw	t6, PT_ARG5(sp)		# argument #6 to ksp
        sw	t7, PT_ARG6(sp)		# argument #7 to ksp
        sw	t8, PT_ARG7(sp)		# argument #8 to ksp
        .set	pop

        .section __ex_table,"a"
        PTR_WD	load_a4, bad_stack_a4
        PTR_WD	load_a5, bad_stack_a5
        PTR_WD	load_a6, bad_stack_a6
        PTR_WD	load_a7, bad_stack_a7
        .previous

arch/mips/kernel/scall64-o32.S has analogous code for mips64 o32 that
allows fixing the issue by obtaining syscall arguments from struct
pt_regs.regs[4..11] instead of the erroneous use of get_user().

The second assertion is fixed by truncating 64-bit values to 32-bit
syscall arguments.

Fixes: c0ff3c53d4f9 ("MIPS: Enable HAVE_ARCH_TRACEHOOK.")
Signed-off-by: Dmitry V. Levin <ldv@strace.io>
---

This started as a part of PTRACE_SET_SYSCALL_INFO API series[1].
It has been rebased on top of [2] as suggested by Maciej in [3].

[1] https://lore.kernel.org/all/20250210113336.GA887@strace.io/
[2] https://lore.kernel.org/all/alpine.DEB.2.21.2502101732120.65342@angie.orcam.me.uk/
[3] https://lore.kernel.org/all/alpine.DEB.2.21.2502111530080.65342@angie.orcam.me.uk/

 arch/mips/include/asm/syscall.h | 32 ++++++++------------------------
 1 file changed, 8 insertions(+), 24 deletions(-)

diff --git a/arch/mips/include/asm/syscall.h b/arch/mips/include/asm/syscall.h
index ebdf4d910af2..056aa1b713e2 100644
--- a/arch/mips/include/asm/syscall.h
+++ b/arch/mips/include/asm/syscall.h
@@ -57,37 +57,21 @@ static inline void mips_syscall_update_nr(struct task_struct *task,
 static inline void mips_get_syscall_arg(unsigned long *arg,
 	struct task_struct *task, struct pt_regs *regs, unsigned int n)
 {
-	unsigned long usp __maybe_unused = regs->regs[29];
-
+#ifdef CONFIG_32BIT
 	switch (n) {
 	case 0: case 1: case 2: case 3:
 		*arg = regs->regs[4 + n];
-
-		return;
-
-#ifdef CONFIG_32BIT
-	case 4: case 5: case 6: case 7:
-		get_user(*arg, (int *)usp + n);
 		return;
-#endif
-
-#ifdef CONFIG_64BIT
 	case 4: case 5: case 6: case 7:
-#ifdef CONFIG_MIPS32_O32
-		if (test_tsk_thread_flag(task, TIF_32BIT_REGS))
-			get_user(*arg, (int *)usp + n);
-		else
-#endif
-			*arg = regs->regs[4 + n];
-
+		*arg = regs->args[n];
 		return;
-#endif
-
-	default:
-		BUG();
 	}
-
-	unreachable();
+#else
+	*arg = regs->regs[4 + n];
+	if ((IS_ENABLED(CONFIG_MIPS32_O32) &&
+	     test_tsk_thread_flag(task, TIF_32BIT_REGS)))
+		*arg = (unsigned int)*arg;
+#endif
 }
 
 static inline long syscall_get_error(struct task_struct *task,
-- 
ldv

