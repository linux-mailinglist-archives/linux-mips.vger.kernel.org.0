Return-Path: <linux-mips+bounces-415-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B707FF62C
	for <lists+linux-mips@lfdr.de>; Thu, 30 Nov 2023 17:36:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4D9B1C21157
	for <lists+linux-mips@lfdr.de>; Thu, 30 Nov 2023 16:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B2D4777A;
	Thu, 30 Nov 2023 16:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F339A1A4;
	Thu, 30 Nov 2023 08:36:09 -0800 (PST)
Received: from hutton.arch.nue2.suse.org (unknown [10.168.144.140])
	by smtp-out1.suse.de (Postfix) with ESMTP id 0BB0321B3E;
	Thu, 30 Nov 2023 16:36:08 +0000 (UTC)
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org,
	Aurelien Jarno <aurel32@debian.org>
Subject: [PATCH] MIPS: kernel: Clear FPU states when setting up kernel threads
Date: Thu, 30 Nov 2023 17:36:01 +0100
Message-Id: <20231130163601.185270-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Score: 3.91
X-Spamd-Result: default: False [3.91 / 50.00];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 R_MISSING_CHARSET(2.50)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-0.99)[-0.994];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[franken.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_COUNT_ZERO(0.00)[0];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+]

io_uring sets up the io worker kernel thread via a syscall out of an
user space prrocess. This process might have used FPU and since
copy_thread() didn't clear FPU states for kernel threads a BUG()
is triggered for using FPU inside kernel. Move code around
to always clear FPU state for user and kernel threads.

Cc: stable@vger.kernel.org
Reported-by: Aurelien Jarno <aurel32@debian.org>
Closes: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1055021
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/kernel/process.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
index 5387ed0a5186..b630604c577f 100644
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -121,6 +121,19 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	/*  Put the stack after the struct pt_regs.  */
 	childksp = (unsigned long) childregs;
 	p->thread.cp0_status = (read_c0_status() & ~(ST0_CU2|ST0_CU1)) | ST0_KERNEL_CUMASK;
+
+	/*
+	 * New tasks lose permission to use the fpu. This accelerates context
+	 * switching for most programs since they don't use the fpu.
+	 */
+	clear_tsk_thread_flag(p, TIF_USEDFPU);
+	clear_tsk_thread_flag(p, TIF_USEDMSA);
+	clear_tsk_thread_flag(p, TIF_MSA_CTX_LIVE);
+
+#ifdef CONFIG_MIPS_MT_FPAFF
+	clear_tsk_thread_flag(p, TIF_FPUBOUND);
+#endif /* CONFIG_MIPS_MT_FPAFF */
+
 	if (unlikely(args->fn)) {
 		/* kernel thread */
 		unsigned long status = p->thread.cp0_status;
@@ -149,20 +162,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	p->thread.reg29 = (unsigned long) childregs;
 	p->thread.reg31 = (unsigned long) ret_from_fork;
 
-	/*
-	 * New tasks lose permission to use the fpu. This accelerates context
-	 * switching for most programs since they don't use the fpu.
-	 */
 	childregs->cp0_status &= ~(ST0_CU2|ST0_CU1);
 
-	clear_tsk_thread_flag(p, TIF_USEDFPU);
-	clear_tsk_thread_flag(p, TIF_USEDMSA);
-	clear_tsk_thread_flag(p, TIF_MSA_CTX_LIVE);
-
-#ifdef CONFIG_MIPS_MT_FPAFF
-	clear_tsk_thread_flag(p, TIF_FPUBOUND);
-#endif /* CONFIG_MIPS_MT_FPAFF */
-
 #ifdef CONFIG_MIPS_FP_SUPPORT
 	atomic_set(&p->thread.bd_emu_frame, BD_EMUFRAME_NONE);
 #endif
-- 
2.35.3


