Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9748319145F
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2020 16:28:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727680AbgCXP2O (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Mar 2020 11:28:14 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37887 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727699AbgCXP2N (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 24 Mar 2020 11:28:13 -0400
Received: by mail-pl1-f195.google.com with SMTP id x1so3497543plm.4
        for <linux-mips@vger.kernel.org>; Tue, 24 Mar 2020 08:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x+18KwjdW7xn5gJkSFR3X8gc0R4qDrX19hXMt3Pj6ho=;
        b=pvUrJGil7R+6087PktRP0/DECaIQVODZg2s3+A40va3GDuZgZJd/rEpxH0IDIITB39
         LIT3rFOghdff2XoPs/frGcHKhiobNuOAkPX4mJMqXszaDO4PhTfd8ugtyX+dpOSs49tS
         kCVVsV2r3IdqK2aTziiqgZFaqJZa2BHugJRW/bHnO/obVGywPzwCWHmTo8TUqO5SPQGp
         5Egsvu96gJ5/MAi1Fo5kankhyEj6HSAxcPQ0ydC3bkwkZcEpjLQzoogJxcn3ECC8z30S
         FmPygP1OwqGgUIsTe4WBmYsr6e+MG7gau5eNBLI3tzJDf86zngiYu2FoH8dD0npDaS56
         aKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x+18KwjdW7xn5gJkSFR3X8gc0R4qDrX19hXMt3Pj6ho=;
        b=dA6x9eukLFDyLm2AzbJmxm2lE1J7h68odkeZjoOBfvmW5NEjxOatR6mwpZPlD/4fpr
         i1UiHBGIIUh2NYjSXQj2VXVyPPwP4/LapKwAUkK5RTHy6pZQHko3N5+i8UDmdnWyCsyW
         F5s2aoUYfUt6kAa5DY/Wr9riu6QwfwOkAcYXnUoKf18zluzcOvL/B/LGYYZCXbX3P57k
         XwHtImfPWfMmr2kM1Ph2Rf/kHdjeOt6GeuFJcdv9vcC9h4Ut77ZRCN1moMzS2NzgsilJ
         GdueZiCb3AcYxf5hYbP4Tv6SDLj30uE9yk5o5PaefP9Z3mqTFFW8AcXEOUIqLytUCHA6
         VZKw==
X-Gm-Message-State: ANhLgQ2SmQ/jzCCO1sOSu2JznYgqZ8ehRCe1xMrwuGxyofDog3+1eEAk
        WZDiO8iPSqgjvx9QkSwfbaA=
X-Google-Smtp-Source: ADFU+vuyf/gEhAf3CAGcpb87/uvQf3XVXrSZ6HrgPkNdzqZ0NlTq0YZRD0V+4G7cP1Qlq1Sa6bwrJw==
X-Received: by 2002:a17:90a:2042:: with SMTP id n60mr6078928pjc.0.1585063691180;
        Tue, 24 Mar 2020 08:28:11 -0700 (PDT)
Received: from titan.hq.cloud.yunionyun.com ([47.244.19.249])
        by smtp.gmail.com with ESMTPSA id k6sm1602879pfa.214.2020.03.24.08.28.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Mar 2020 08:28:10 -0700 (PDT)
From:   Yousong Zhou <yszhou4tech@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Paul Burton <paulburton@kernel.org>, linux-mips@vger.kernel.org,
        Yousong Zhou <yszhou4tech@gmail.com>
Subject: [PATCH v2] MIPS: Exclude more dsemul code when CONFIG_MIPS_FP_SUPPORT=n
Date:   Tue, 24 Mar 2020 23:27:51 +0800
Message-Id: <20200324152751.57666-1-yszhou4tech@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This furthers what commit 42b10815d559 ("MIPS: Don't compile math-emu
when CONFIG_MIPS_FP_SUPPORT=n") has done

Signed-off-by: Yousong Zhou <yszhou4tech@gmail.com>
---
v2 <- v1: Fix using unknown symbol CONFIG_MIPS_FP_EMULATOR, @tsbogend

 arch/mips/include/asm/processor.h | 12 ++++++------
 arch/mips/kernel/process.c        | 10 ++++++++--
 arch/mips/kernel/vdso.c           | 26 +++++++++++++++-----------
 3 files changed, 29 insertions(+), 19 deletions(-)

diff --git a/arch/mips/include/asm/processor.h b/arch/mips/include/asm/processor.h
index 7619ad319400..813ba94d87bb 100644
--- a/arch/mips/include/asm/processor.h
+++ b/arch/mips/include/asm/processor.h
@@ -253,13 +253,13 @@ struct thread_struct {
 #ifdef CONFIG_MIPS_FP_SUPPORT
 	/* Saved fpu/fpu emulator stuff. */
 	struct mips_fpu_struct fpu FPU_ALIGN;
-#endif
 	/* Assigned branch delay slot 'emulation' frame */
 	atomic_t bd_emu_frame;
 	/* PC of the branch from a branch delay slot 'emulation' */
 	unsigned long bd_emu_branch_pc;
 	/* PC to continue from following a branch delay slot 'emulation' */
 	unsigned long bd_emu_cont_pc;
+#endif
 #ifdef CONFIG_MIPS_MT_FPAFF
 	/* Emulated instruction count */
 	unsigned long emulated_fp;
@@ -302,7 +302,11 @@ struct thread_struct {
 		.fpr		= {{{0,},},},			\
 		.fcr31		= 0,				\
 		.msacsr		= 0,				\
-	},
+	},							\
+	/* Delay slot emulation */				\
+	.bd_emu_frame = ATOMIC_INIT(BD_EMUFRAME_NONE),		\
+	.bd_emu_branch_pc = 0,					\
+	.bd_emu_cont_pc = 0,
 #else
 # define FPU_INIT
 #endif
@@ -334,10 +338,6 @@ struct thread_struct {
 	 * FPU affinity state (null if not FPAFF)		\
 	 */							\
 	FPAFF_INIT						\
-	/* Delay slot emulation */				\
-	.bd_emu_frame = ATOMIC_INIT(BD_EMUFRAME_NONE),		\
-	.bd_emu_branch_pc = 0,					\
-	.bd_emu_cont_pc = 0,					\
 	/*							\
 	 * Saved DSP stuff					\
 	 */							\
diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
index 339870ed92f7..b2a797557825 100644
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -75,7 +75,9 @@ void start_thread(struct pt_regs * regs, unsigned long pc, unsigned long sp)
 	lose_fpu(0);
 	clear_thread_flag(TIF_MSA_CTX_LIVE);
 	clear_used_math();
+#ifdef CONFIG_MIPS_FP_SUPPORT
 	atomic_set(&current->thread.bd_emu_frame, BD_EMUFRAME_NONE);
+#endif
 	init_dsp();
 	regs->cp0_epc = pc;
 	regs->regs[29] = sp;
@@ -176,7 +178,9 @@ int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
 	clear_tsk_thread_flag(p, TIF_FPUBOUND);
 #endif /* CONFIG_MIPS_MT_FPAFF */
 
+#ifdef CONFIG_MIPS_FP_SUPPORT
 	atomic_set(&p->thread.bd_emu_frame, BD_EMUFRAME_NONE);
+#endif
 
 	if (clone_flags & CLONE_SETTLS)
 		ti->tp_value = tls;
@@ -650,8 +654,10 @@ unsigned long mips_stack_top(void)
 {
 	unsigned long top = TASK_SIZE & PAGE_MASK;
 
-	/* One page for branch delay slot "emulation" */
-	top -= PAGE_SIZE;
+	if (IS_ENABLED(CONFIG_MIPS_FP_SUPPORT)) {
+		/* One page for branch delay slot "emulation" */
+		top -= PAGE_SIZE;
+	}
 
 	/* Space for the VDSO, data page & GIC user page */
 	top -= PAGE_ALIGN(current->thread.abi->vdso->size);
diff --git a/arch/mips/kernel/vdso.c b/arch/mips/kernel/vdso.c
index bc35f8499111..3adb7354bc01 100644
--- a/arch/mips/kernel/vdso.c
+++ b/arch/mips/kernel/vdso.c
@@ -71,10 +71,12 @@ subsys_initcall(init_vdso);
 
 static unsigned long vdso_base(void)
 {
-	unsigned long base;
+	unsigned long base = STACK_TOP;
 
-	/* Skip the delay slot emulation page */
-	base = STACK_TOP + PAGE_SIZE;
+	if (IS_ENABLED(CONFIG_MIPS_FP_SUPPORT)) {
+		/* Skip the delay slot emulation page */
+		base += PAGE_SIZE;
+	}
 
 	if (current->flags & PF_RANDOMIZE) {
 		base += get_random_int() & (VDSO_RANDOMIZE_SIZE - 1);
@@ -95,14 +97,16 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 	if (down_write_killable(&mm->mmap_sem))
 		return -EINTR;
 
-	/* Map delay slot emulation page */
-	base = mmap_region(NULL, STACK_TOP, PAGE_SIZE,
-			   VM_READ | VM_EXEC |
-			   VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC,
-			   0, NULL);
-	if (IS_ERR_VALUE(base)) {
-		ret = base;
-		goto out;
+	if (IS_ENABLED(CONFIG_MIPS_FP_SUPPORT)) {
+		/* Map delay slot emulation page */
+		base = mmap_region(NULL, STACK_TOP, PAGE_SIZE,
+				VM_READ | VM_EXEC |
+				VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC,
+				0, NULL);
+		if (IS_ERR_VALUE(base)) {
+			ret = base;
+			goto out;
+		}
 	}
 
 	/*
