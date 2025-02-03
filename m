Return-Path: <linux-mips+bounces-7663-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15194A252A4
	for <lists+linux-mips@lfdr.de>; Mon,  3 Feb 2025 08:00:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B62C83A3D1A
	for <lists+linux-mips@lfdr.de>; Mon,  3 Feb 2025 06:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E2131D63DD;
	Mon,  3 Feb 2025 06:59:58 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73F5D1DA31D;
	Mon,  3 Feb 2025 06:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.107.17.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738565998; cv=none; b=dwmMg7k7RVfksFg/HymeCw9zMGH9cFQjVqdeYzfng9qorfrr+MN45e+LMwQecP72xoGhwZHK3cBQnmt8oIl3oAGVvg/QH3rD/G+RhBvAI9UZvAUedEI6U0X2TnLrSOKBy0zapSW+/eciDz77FIQidSmRcMGYW/NF8XWHaMgvsw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738565998; c=relaxed/simple;
	bh=L+9dWtVflSZ3wYxMdOOqIm+skRJepeS50G6D4E8vvRI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ULVsHkyLe0we+IyeOWQRgM2C2p2gM/Z4MAUzdOxv4R8DP5j7aiKhKsDk6ACp7fvb5E+wRofhqpdunSDmUKga60IWRmLB2qrlFC8Oq31dUs3UUKiqfB5UyTREG6IJ2/n9Eb1hvHV0xMJQkISpbfSnoMJkKjQ3PK3lkTd54PHNFyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=194.107.17.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 270A672C8FB;
	Mon,  3 Feb 2025 09:59:55 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 1407E7CCB3A; Mon,  3 Feb 2025 08:59:55 +0200 (IST)
Date: Mon, 3 Feb 2025 08:59:55 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
	Oleg Nesterov <oleg@redhat.com>, Alexey Gladkov <legion@kernel.org>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Mike Frysinger <vapier@gentoo.org>,
	Renzo Davoli <renzo@cs.unibo.it>,
	Davide Berardi <berardi.dav@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	strace-devel@lists.strace.io, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/7] mips: fix mips_get_syscall_arg() for o32
Message-ID: <20250203065954.GB14120@strace.io>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203065849.GA14120@strace.io>

This makes ptrace/get_syscall_info selftest pass on mips o32 and
mips64 o32 by fixing the following two test assertions:

1. get_syscall_info test assertion on mips o32:
  # get_syscall_info.c:218:get_syscall_info:Expected exp_args[5] (3134521044) == info.entry.args[4] (4911432)
  # get_syscall_info.c:219:get_syscall_info:wait #1: entry stop mismatch

2. get_syscall_info test assertion on mips64 o32:
  # get_syscall_info.c:209:get_syscall_info:Expected exp_args[2] (3134324433) == info.entry.args[1] (18446744072548908753)
  # get_syscall_info.c:210:get_syscall_info:wait #1: entry stop mismatch

The first assertion is fixed for mips o32 by using struct pt_regs.pad0
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

        sw	t5, 16(sp)		# argument #5 to ksp
        sw	t6, 20(sp)		# argument #6 to ksp
        sw	t7, 24(sp)		# argument #7 to ksp
        sw	t8, 28(sp)		# argument #8 to ksp
        .set	pop

        .section __ex_table,"a"
        PTR_WD	load_a4, bad_stack_a4
        PTR_WD	load_a5, bad_stack_a5
        PTR_WD	load_a6, bad_stack_a6
        PTR_WD	load_a7, bad_stack_a7
        .previous

arch/mips/kernel/scall64-o32.S has analogous code for mips64 o32 that
allows obtaining syscall arguments from struct pt_regs.regs[4..11]
instead of get_user().

The second assertion is fixed by truncating 64-bit values to 32-bit
syscall arguments.

Signed-off-by: Dmitry V. Levin <ldv@strace.io>
---
 arch/mips/include/asm/syscall.h | 32 ++++++++------------------------
 1 file changed, 8 insertions(+), 24 deletions(-)

diff --git a/arch/mips/include/asm/syscall.h b/arch/mips/include/asm/syscall.h
index ebdf4d910af2..b3f00ede8bb3 100644
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
+		*arg = regs->pad0[n];
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

