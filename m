Return-Path: <linux-mips+bounces-7420-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A582DA0BE7D
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2025 18:11:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67A681666E2
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2025 17:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D2D320AF81;
	Mon, 13 Jan 2025 17:11:19 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 339561FBBE8;
	Mon, 13 Jan 2025 17:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.107.17.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736788279; cv=none; b=RQ+jBAHr5c2jiMAEjwRL3RtJtAs3kHrBWqod7jCOp/BKjlAYfzdKO0lpSXFzvjy+BPrTiX0oPf9vEAtd0etuj6xtrjopCw5r04BlMP4IQbvsrUFo7Ct0KfcyDUCBNgv5qN2eOAUzQpTxSH3n38m2Wb7BIpxadtLZVWOCoHm5IsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736788279; c=relaxed/simple;
	bh=Gaz/ihXEld1Yr3yk7IfN17d9Mg8sUtb+yzI1dhHG+YQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=lsWEuMJFXW3cWrxNNROhKABhdTF64va+XcWRj7k9cA9dZ7x/kku2rkC8+mkF5piGTntJCyHfkbqc4EJktgf9p413heaTJTBHXlTxcaTp0uBEOIlX/ywGuwe1gjzK6xFqZdb0gMFBrt/X8yLVdpA5SOeXDL8zfU4cwcNqwZXiPQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=194.107.17.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id D18D572C90B;
	Mon, 13 Jan 2025 20:11:14 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id C6A157CCB3A; Mon, 13 Jan 2025 19:11:14 +0200 (IST)
Date: Mon, 13 Jan 2025 19:11:14 +0200
From: "Dmitry V. Levin" <ldv@strace.io>
To: Oleg Nesterov <oleg@redhat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Eugene Syromyatnikov <evgsyr@gmail.com>,
	Mike Frysinger <vapier@gentoo.org>,
	Renzo Davoli <renzo@cs.unibo.it>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/7] mips: fix mips_get_syscall_arg() for O32 and N32
Message-ID: <20250113171114.GB589@strace.io>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113170925.GA392@strace.io>

Fix the following get_syscall_info test assertion on mips O32:
  # get_syscall_info.c:218:get_syscall_info:Expected exp_args[5] (3134521044) == info.entry.args[4] (4911432)
  # get_syscall_info.c:219:get_syscall_info:wait #1: entry stop mismatch

Fix the following get_syscall_info test assertion on mips64 O32 and mips64 N32:
  # get_syscall_info.c:209:get_syscall_info:Expected exp_args[2] (3134324433) == info.entry.args[1] (18446744072548908753)
  # get_syscall_info.c:210:get_syscall_info:wait #1: entry stop mismatch

This makes ptrace/get_syscall_info selftest pass on mips O32,
mips64 O32, and mips64 N32.

Signed-off-by: Dmitry V. Levin <ldv@strace.io>
---

Note that I'm not a MIPS expert, so I cannot tell why the get_user()
approach doesn't work for O32.  Also, during experiments I discovered that
regs->pad0 approach works for O32, but why it works remains a mystery.

 arch/mips/include/asm/syscall.h | 34 ++++++++++-----------------------
 1 file changed, 10 insertions(+), 24 deletions(-)

diff --git a/arch/mips/include/asm/syscall.h b/arch/mips/include/asm/syscall.h
index ebdf4d910af2..2f85f2d8f754 100644
--- a/arch/mips/include/asm/syscall.h
+++ b/arch/mips/include/asm/syscall.h
@@ -57,37 +57,23 @@ static inline void mips_syscall_update_nr(struct task_struct *task,
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
+	     test_tsk_thread_flag(task, TIF_32BIT_REGS)) ||
+	    (IS_ENABLED(CONFIG_MIPS32_N32) &&
+	     test_tsk_thread_flag(task, TIF_32BIT_ADDR)))
+		*arg = (unsigned int)*arg;
+#endif
 }
 
 static inline long syscall_get_error(struct task_struct *task,
-- 
ldv

