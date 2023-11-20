Return-Path: <linux-mips+bounces-120-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A45457F1D1E
	for <lists+linux-mips@lfdr.de>; Mon, 20 Nov 2023 20:08:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F3841F25515
	for <lists+linux-mips@lfdr.de>; Mon, 20 Nov 2023 19:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61294321BF;
	Mon, 20 Nov 2023 19:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id DEF96D2;
	Mon, 20 Nov 2023 11:08:36 -0800 (PST)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1r59dK-0000eh-00; Mon, 20 Nov 2023 20:08:34 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 821E1C0136; Mon, 20 Nov 2023 20:08:24 +0100 (CET)
Date: Mon, 20 Nov 2023 20:08:24 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, syq@debian.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] MIPS: process: Remove lazy context flags for new kernel
 thread
Message-ID: <ZVuuqAUJ7f2ELIYW@alpha.franken.de>
References: <20231026111715.1281728-1-jiaxun.yang@flygoat.com>
 <ZTvQGs/lEpizUFLh@aurel32.net>
 <ZVjaDTcjNpD3m0cC@aurel32.net>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZVjaDTcjNpD3m0cC@aurel32.net>

On Sat, Nov 18, 2023 at 04:36:45PM +0100, Aurelien Jarno wrote:
> > Anyway, I have been able to test a backport of the patch onto the 5.10
> > kernel (with minor adjustments) and I confirm it fixes the reported
> > issue.
> > 
> > Tested-by: Aurelien Jarno <aurel32@debian.org>
> 
> It seems that this patch hasn't been merged yet, either in Linus' tree
> or in the MIPS tree. Is there anything blocking?

sorry, took some time to get really back from vacation...

I don't like the patch doing too much code restructing. I can't
reproduce on my loongson machine, so I can't test below patch...

What cmake version do I need and what would be a package to
reproduce the bug ?

Thomas.

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
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

