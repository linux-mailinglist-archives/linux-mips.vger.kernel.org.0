Return-Path: <linux-mips+bounces-7719-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9DEA2EB41
	for <lists+linux-mips@lfdr.de>; Mon, 10 Feb 2025 12:34:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4568164917
	for <lists+linux-mips@lfdr.de>; Mon, 10 Feb 2025 11:34:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A75F21B87F1;
	Mon, 10 Feb 2025 11:34:45 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C373C1957FF;
	Mon, 10 Feb 2025 11:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.107.17.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739187285; cv=none; b=nPPZ1gqZ+h5QQZvuhaDKpqiQldFE4ze20PSV5B65YbE4SBgF6LMggXDPQ7ygvW1w+JwON1go/BE2A2nXuigU0QZe/QOyslkS0sVKXhgEHeM8cz1ng1Ej1EQUXam3xnSOQbh8M42dvlKwvcMKtNqOpLJhjZPwxd5eNuvtbUJ+aPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739187285; c=relaxed/simple;
	bh=L+9dWtVflSZ3wYxMdOOqIm+skRJepeS50G6D4E8vvRI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=iaxv1a3X50gWU9c5xlFnKnbJrqmu1uZTomV31dEhOtHkvGM7xqhzGgNXCRsXRMjv+0trscsCJO3yeqNjTZXehajSp3JsNG2RsTlxfIqUnrc3xGomK7im25dJ8foc12G3MfONcEptJVykFucLXDwh1svWPsWc9swslq1I2xR2x40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=194.107.17.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id A5A4B72C8F5;
	Mon, 10 Feb 2025 14:34:42 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 990DE7CCB3A; Mon, 10 Feb 2025 13:34:42 +0200 (IST)
Date: Mon, 10 Feb 2025 13:34:42 +0200
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
Subject: [PATCH v5 1/7] mips: fix mips_get_syscall_arg() for o32
Message-ID: <20250210113442.GB887@strace.io>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210113336.GA887@strace.io>

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

