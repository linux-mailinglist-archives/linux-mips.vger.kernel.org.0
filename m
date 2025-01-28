Return-Path: <linux-mips+bounces-7618-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11AEDA206FC
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jan 2025 10:17:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2C6017A3233
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jan 2025 09:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6638D1DF723;
	Tue, 28 Jan 2025 09:16:23 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5524A1DEFDD;
	Tue, 28 Jan 2025 09:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.107.17.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738055783; cv=none; b=RTZgLw6qPevxoAjIkO9Yt6JTLyhUsSm7cl2qdlkdH9LlOHbC5t3v5hyt3XdqP8tOLSJBnMAhNj1rKxTWoS3kR6eWberwuaUksSrLfY4EBLeQLHJeCSVqQ/JPwU5I7mSO3GO958bAT+2xoelyzKaRkOAIO4wHwNGnDfLBLQ/KCo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738055783; c=relaxed/simple;
	bh=L+9dWtVflSZ3wYxMdOOqIm+skRJepeS50G6D4E8vvRI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=a+h4AjaCJFzv4/Vq4wAyHqGiYur0wQ1ptqG2DAGy2XEPCX/66qHddLCPLbtBcAt52JWq30MphwCAPHUj0HYjHjlTq8cd0Gpe/9FxRxPJeswby16hNzwjT51VBgiVunbI9a/AmPT2TM89HG4zj9kUJES/J5zBe0GWuWessKO9dGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=194.107.17.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 2228272C8CC;
	Tue, 28 Jan 2025 12:16:20 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 197D67CCB3A; Tue, 28 Jan 2025 11:16:19 +0200 (IST)
Date: Tue, 28 Jan 2025 11:16:19 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Oleg Nesterov <oleg@redhat.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Alexey Gladkov <legion@kernel.org>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Mike Frysinger <vapier@gentoo.org>,
	Renzo Davoli <renzo@cs.unibo.it>,
	Davide Berardi <berardi.dav@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	strace-devel@lists.strace.io, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/6] mips: fix mips_get_syscall_arg() for o32
Message-ID: <20250128091619.GA8601@strace.io>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250128091445.GA8257@strace.io>

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

