Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB43184364
	for <lists+linux-mips@lfdr.de>; Fri, 13 Mar 2020 10:12:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbgCMJMY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Mar 2020 05:12:24 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:55195 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbgCMJMY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 13 Mar 2020 05:12:24 -0400
Received: by mail-pj1-f66.google.com with SMTP id np16so3835840pjb.4
        for <linux-mips@vger.kernel.org>; Fri, 13 Mar 2020 02:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zdp5j1dRx4L6luQP3yw+rUB6uTIqhnrylSbC9jjQ0GI=;
        b=eYZNfunZS1i35l0V26ppzIiM+XnKOKWeKjjJ6fVDaTNFgAECFzs/hluRxtbld5hXl4
         oS5aAI+lw2eNoWcmEm2REAhIuCG9wMqUfivrXuQXmpyXky3Fy/JjkcwKqe/1SHuePn07
         ySYOGBHWFyw/0KiG0cpWwHUL7nQX/nKCkAZbWKeIZkpX6xue0JqXWkacNb31up4NLvXl
         BMFPSBeP7cXj3jXkTGDFaKfneNUVo1zrEOeza47fJ7dxAfky4/kn12ZdD53vo2uyx8/u
         iEhtSY9lu1AcgM03r+kpmKYqh+oyd4aMHwTCy7xsvcNQMCntwr6Nho+C8VhsL7EwVhi+
         Vtqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Zdp5j1dRx4L6luQP3yw+rUB6uTIqhnrylSbC9jjQ0GI=;
        b=nOjPtyAWP1T1cFM4vfl1Gxs/D7YlBRn8nPDyBHt2XQW0n0XYR5pi1dxthjhTRhwvaB
         kMsd2ejSuNSqqkdVfg2cXXhfQcDw9e4FAwnO9dXem1JXBPbgBtq4AiTBFkUf0CBTovHv
         JMugOeR+dBCWkF1ycErM8k+LOBY5qObBb9S/6iTJzvIZJhMdCsy/SVlg7C4ugf3+ptJG
         LuNdQs1s+/d1DPOU+KoKZrhEp3VNUmpCSgwSL+5HHFWb/078hOjwHxT2mQyf41ThjCDd
         F617SC/86WTyFkh/TRUzHviJniyShIo0qFzPeXJzDRh/kE3kxYpkoqiqEBftG6oJmNMB
         lhZQ==
X-Gm-Message-State: ANhLgQ2/pkYJZDgp4q0BfUUMPDo4cSH4VtIjDk2iBhQJw3LnLi7dyFMD
        kNWPK6nmVGUEwmeCdA9LB7isj64Pm+A=
X-Google-Smtp-Source: ADFU+vsk3MQoyZuQ8IbMZEFhWBiZWfVX+TWweClX1eX70E4GayGX2HeQHWtMkSCF24FoTaPomYmwYg==
X-Received: by 2002:a17:90a:bd96:: with SMTP id z22mr8593400pjr.172.1584090742207;
        Fri, 13 Mar 2020 02:12:22 -0700 (PDT)
Received: from titan.hq.cloud.yunionyun.com ([47.244.19.249])
        by smtp.gmail.com with ESMTPSA id g18sm58064606pfi.80.2020.03.13.02.12.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Mar 2020 02:12:20 -0700 (PDT)
From:   Yousong Zhou <yszhou4tech@gmail.com>
To:     Paul Burton <paulburton@kernel.org>
Cc:     linux-mips@vger.kernel.org, Yousong Zhou <yszhou4tech@gmail.com>
Subject: [PATCH] MIPS: Exclude more dsemul code when CONFIG_MIPS_FP_SUPPORT=n
Date:   Fri, 13 Mar 2020 17:12:08 +0800
Message-Id: <20200313091208.88450-1-yszhou4tech@gmail.com>
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
This is a resend.  Previously it was sent to old ..@linux-mips.org
addresses

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
index bc35f8499111..f0f96371392f 100644
--- a/arch/mips/kernel/vdso.c
+++ b/arch/mips/kernel/vdso.c
@@ -71,10 +71,12 @@ subsys_initcall(init_vdso);
 
 static unsigned long vdso_base(void)
 {
-	unsigned long base;
+	unsigned long base = STACK_TOP;
 
-	/* Skip the delay slot emulation page */
-	base = STACK_TOP + PAGE_SIZE;
+	if (IS_ENABLED(CONFIG_MIPS_FP_EMULATOR)) {
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
+	if (IS_ENABLED(CONFIG_MIPS_FP_EMULATOR)) {
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
