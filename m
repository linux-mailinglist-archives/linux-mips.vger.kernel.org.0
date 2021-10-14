Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E817442D507
	for <lists+linux-mips@lfdr.de>; Thu, 14 Oct 2021 10:33:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbhJNIfG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 Oct 2021 04:35:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbhJNIez (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 Oct 2021 04:34:55 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF72EC061570;
        Thu, 14 Oct 2021 01:32:50 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id q10-20020a17090a1b0a00b001a076a59640so5144246pjq.0;
        Thu, 14 Oct 2021 01:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k7OT6HMJtupmQjXYmRGzazB83eIQrNYr9RUXbJ9zlf4=;
        b=NOzjscW0oxY5kXXyBMN/O0ikeKPqaA+njFEEpDJpVQcyo8w+goIxTOL5HVt7Q2je4d
         bX4HKBv/4r5GpEHzPrajTrW1HobIXFmGKjYrHaWOPC/wki0Gei7TttzmRkBBebLJXpx3
         WIs6vCwZDsFl8E0ytWmqa3Bzti1U58B6SGy0kovcokS+DrwlzCsBWMevCrGJOG372DlH
         hp4pcVUvjXtEv8to1vn9mGg44jrD1jcARbNZy7MfFlvRuyPaoq/2SjlMzV4ZnqcpvafZ
         2w16J+Z/573MzNCzaeUDy7V5hEmVz+2RstkBDZDA2mFAqnxKdSkhm50bj45u5nZw42js
         R07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k7OT6HMJtupmQjXYmRGzazB83eIQrNYr9RUXbJ9zlf4=;
        b=G5mpvq6HZDwL1rJz6HUPsF9c9wGzC1j8r59CbFBuokRVpSknJ6SbpTPbnSxpmcud4w
         M+3W21WjevnxEusQVQtcsONLe+2FLdnuoU4s2bh4q28GUQpGoOs01XVimlhepuZR8dSQ
         4EIXgPwgEWPkO2Ow85dNzz7AviPJRBQE+U1YUgtltiX1C2fDVdljrqY3fShDuj0UV6jD
         VhJBF5w54I139TMDRRQzIhmT8RNMHHXWRylafF3NsTPCSpaykpxQobmAPnGa5bMhCMg8
         xeEk9cHNvgNuzjfneKD5HodmUwNi67y4fQmLESU8RH+Ne1jV4ehjzrelqs0rsjgPfV7G
         z9gw==
X-Gm-Message-State: AOAM533gSQaCNfMAJsUAOuZy9Vzfz+fYXfzs31mSSGce3lADbJoG6cEk
        LPNH43K0v5xQyUyWBLLPi2A=
X-Google-Smtp-Source: ABdhPJxG0kT/khrj861dMSXCJqVj8wHK9SkgCpW+aptoKLn2h9jzzx7LvGUYAKFMTBo23wXP3xWo5A==
X-Received: by 2002:a17:90a:f488:: with SMTP id bx8mr4753575pjb.86.1634200370108;
        Thu, 14 Oct 2021 01:32:50 -0700 (PDT)
Received: from archlinux.localdomain (61-218-132-193.hinet-ip.hinet.net. [61.218.132.193])
        by smtp.gmail.com with ESMTPSA id z23sm1802004pgv.45.2021.10.14.01.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 01:32:49 -0700 (PDT)
From:   Feiyang Chen <chris.chenfeiyang@gmail.com>
X-Google-Original-From: Feiyang Chen <chenfeiyang@loongson.cn>
To:     tsbogend@alpha.franken.de, tglx@linutronix.de,
        peterz@infradead.org, luto@kernel.org, arnd@arndb.de
Cc:     Feiyang Chen <chenfeiyang@loongson.cn>, linux-mips@vger.kernel.org,
        linux-arch@vger.kernel.org, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, zhouyu@wanyeetech.com, hns@goldelico.com,
        chris.chenfeiyang@gmail.com, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v3 2/2] MIPS: convert irq to generic entry
Date:   Thu, 14 Oct 2021 16:32:54 +0800
Message-Id: <30df5df7baa0c4d8dbac984e2833294308b493cd.1634177547.git.chenfeiyang@loongson.cn>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1634177547.git.chenfeiyang@loongson.cn>
References: <cover.1634177547.git.chenfeiyang@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Convert MIPS irq to use the generic entry infrastructure from
kernel/entry/*.

When entering the handler functions written in C, there are three
status: STI, CLI and KMODE. Now use CLI for all handler functions,
since interrupts must be disabled before calling irqentry_enter().

- For handler functions who originally used STI, enable interrupts
after calling irqentry_enter().

- For handler functions who originally used KMODE, enable interrupts
after calling irqentry_enter() only if they are enabled in the parent
context.

- If CONFIG_HARDWARE_WATCHPOINTS is defined, interrupts will be enabled
after the watch registers are read. Only enable interrupts manually in
do_watch() if it is not defined.

Use call_on_irq_stack() to help invoking a function on IRQ stack.

Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Huacai Chen <chenhuacai@kernel.org>
---
 arch/mips/include/asm/irqflags.h   |  42 ------
 arch/mips/include/asm/stackframe.h |   8 +
 arch/mips/kernel/entry.S           |  82 -----------
 arch/mips/kernel/genex.S           | 150 ++++---------------
 arch/mips/kernel/head.S            |   1 -
 arch/mips/kernel/r4k-bugs64.c      |  14 +-
 arch/mips/kernel/scall.S           |   1 -
 arch/mips/kernel/signal.c          |  24 ---
 arch/mips/kernel/traps.c           | 225 +++++++++++++++++++++--------
 arch/mips/kernel/unaligned.c       |  21 ++-
 arch/mips/mm/c-octeon.c            |  15 ++
 arch/mips/mm/cex-oct.S             |   8 +-
 arch/mips/mm/fault.c               |  12 +-
 arch/mips/mm/tlbex-fault.S         |   7 +-
 14 files changed, 257 insertions(+), 353 deletions(-)

diff --git a/arch/mips/include/asm/irqflags.h b/arch/mips/include/asm/irqflags.h
index f5b8300f4573..ee7519b0d23f 100644
--- a/arch/mips/include/asm/irqflags.h
+++ b/arch/mips/include/asm/irqflags.h
@@ -11,8 +11,6 @@
 #ifndef _ASM_IRQFLAGS_H
 #define _ASM_IRQFLAGS_H
 
-#ifndef __ASSEMBLY__
-
 #include <linux/compiler.h>
 #include <linux/stringify.h>
 #include <asm/compiler.h>
@@ -142,44 +140,4 @@ static inline int arch_irqs_disabled(void)
 	return arch_irqs_disabled_flags(arch_local_save_flags());
 }
 
-#endif /* #ifndef __ASSEMBLY__ */
-
-/*
- * Do the CPU's IRQ-state tracing from assembly code.
- */
-#ifdef CONFIG_TRACE_IRQFLAGS
-/* Reload some registers clobbered by trace_hardirqs_on */
-#ifdef CONFIG_64BIT
-# define TRACE_IRQS_RELOAD_REGS						\
-	LONG_L	$11, PT_R11(sp);					\
-	LONG_L	$10, PT_R10(sp);					\
-	LONG_L	$9, PT_R9(sp);						\
-	LONG_L	$8, PT_R8(sp);						\
-	LONG_L	$7, PT_R7(sp);						\
-	LONG_L	$6, PT_R6(sp);						\
-	LONG_L	$5, PT_R5(sp);						\
-	LONG_L	$4, PT_R4(sp);						\
-	LONG_L	$2, PT_R2(sp)
-#else
-# define TRACE_IRQS_RELOAD_REGS						\
-	LONG_L	$7, PT_R7(sp);						\
-	LONG_L	$6, PT_R6(sp);						\
-	LONG_L	$5, PT_R5(sp);						\
-	LONG_L	$4, PT_R4(sp);						\
-	LONG_L	$2, PT_R2(sp)
-#endif
-# define TRACE_IRQS_ON							\
-	CLI;	/* make sure trace_hardirqs_on() is called in kernel level */ \
-	jal	trace_hardirqs_on
-# define TRACE_IRQS_ON_RELOAD						\
-	TRACE_IRQS_ON;							\
-	TRACE_IRQS_RELOAD_REGS
-# define TRACE_IRQS_OFF							\
-	jal	trace_hardirqs_off
-#else
-# define TRACE_IRQS_ON
-# define TRACE_IRQS_ON_RELOAD
-# define TRACE_IRQS_OFF
-#endif
-
 #endif /* _ASM_IRQFLAGS_H */
diff --git a/arch/mips/include/asm/stackframe.h b/arch/mips/include/asm/stackframe.h
index aa430a6c68b2..8bc74d7950fb 100644
--- a/arch/mips/include/asm/stackframe.h
+++ b/arch/mips/include/asm/stackframe.h
@@ -444,6 +444,14 @@
 		RESTORE_SP \docfi
 		.endm
 
+		.macro	RESTORE_ALL_AND_RET docfi=0
+		RESTORE_TEMP \docfi
+		RESTORE_STATIC \docfi
+		RESTORE_AT \docfi
+		RESTORE_SOME \docfi
+		RESTORE_SP_AND_RET \docfi
+		.endm
+
 /*
  * Move to kernel mode and disable interrupts.
  * Set cp0 enable bit as sign that we're running on the kernel stack
diff --git a/arch/mips/kernel/entry.S b/arch/mips/kernel/entry.S
index 1a2aec9dab1b..c9148831d820 100644
--- a/arch/mips/kernel/entry.S
+++ b/arch/mips/kernel/entry.S
@@ -11,7 +11,6 @@
 #include <asm/asm.h>
 #include <asm/asmmacro.h>
 #include <asm/compiler.h>
-#include <asm/irqflags.h>
 #include <asm/regdef.h>
 #include <asm/mipsregs.h>
 #include <asm/stackframe.h>
@@ -19,55 +18,8 @@
 #include <asm/thread_info.h>
 #include <asm/war.h>
 
-#ifndef CONFIG_PREEMPTION
-#define resume_kernel	restore_all
-#else
-#define __ret_from_irq	ret_from_exception
-#endif
-
 	.text
 	.align	5
-#ifndef CONFIG_PREEMPTION
-FEXPORT(ret_from_exception)
-	local_irq_disable			# preempt stop
-	b	__ret_from_irq
-#endif
-FEXPORT(ret_from_irq)
-	LONG_S	s0, TI_REGS($28)
-FEXPORT(__ret_from_irq)
-/*
- * We can be coming here from a syscall done in the kernel space,
- * e.g. a failed kernel_execve().
- */
-resume_userspace_check:
-	LONG_L	t0, PT_STATUS(sp)		# returning to kernel mode?
-	andi	t0, t0, KU_USER
-	beqz	t0, resume_kernel
-
-resume_userspace:
-	local_irq_disable		# make sure we dont miss an
-					# interrupt setting need_resched
-					# between sampling and return
-	LONG_L	a2, TI_FLAGS($28)	# current->work
-	andi	t0, a2, _TIF_WORK_MASK	# (ignoring syscall_trace)
-	bnez	t0, work_pending
-	j	restore_all
-
-#ifdef CONFIG_PREEMPTION
-resume_kernel:
-	local_irq_disable
-	lw	t0, TI_PRE_COUNT($28)
-	bnez	t0, restore_all
-	LONG_L	t0, TI_FLAGS($28)
-	andi	t1, t0, _TIF_NEED_RESCHED
-	beqz	t1, restore_all
-	LONG_L	t0, PT_STATUS(sp)		# Interrupts off?
-	andi	t0, 1
-	beqz	t0, restore_all
-	PTR_LA	ra, restore_all
-	j	preempt_schedule_irq
-#endif
-
 FEXPORT(ret_from_kernel_thread)
 	jal	schedule_tail		# a0 = struct task_struct *prev
 	move	a0, s1
@@ -92,40 +44,6 @@ FEXPORT(ret_from_fork)
 	RESTORE_SP_AND_RET
 	.set	at
 
-restore_all:				# restore full frame
-	.set	noat
-	RESTORE_TEMP
-	RESTORE_AT
-	RESTORE_STATIC
-restore_partial:			# restore partial frame
-	RESTORE_SOME
-	RESTORE_SP_AND_RET
-	.set	at
-
-work_pending:
-	andi	t0, a2, _TIF_NEED_RESCHED # a2 is preloaded with TI_FLAGS
-	beqz	t0, work_notifysig
-work_resched:
-	TRACE_IRQS_OFF
-	jal	schedule
-
-	local_irq_disable		# make sure need_resched and
-					# signals dont change between
-					# sampling and return
-	LONG_L	a2, TI_FLAGS($28)
-	andi	t0, a2, _TIF_WORK_MASK	# is there any work to be done
-					# other than syscall tracing?
-	beqz	t0, restore_all
-	andi	t0, a2, _TIF_NEED_RESCHED
-	bnez	t0, work_resched
-
-work_notifysig:				# deal with pending signals and
-					# notify-resume requests
-	move	a0, sp
-	li	a1, 0
-	jal	do_notify_resume	# a2 already loaded
-	j	resume_userspace_check
-
 #if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR5) || \
     defined(CONFIG_CPU_MIPSR6) || defined(CONFIG_MIPS_MT)
 
diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
index 743d75927b71..aa04eb131379 100644
--- a/arch/mips/kernel/genex.S
+++ b/arch/mips/kernel/genex.S
@@ -13,7 +13,6 @@
 #include <asm/asm.h>
 #include <asm/asmmacro.h>
 #include <asm/cacheops.h>
-#include <asm/irqflags.h>
 #include <asm/regdef.h>
 #include <asm/fpregdef.h>
 #include <asm/mipsregs.h>
@@ -182,53 +181,17 @@ NESTED(handle_int, PT_SIZE, sp)
 #endif
 	SAVE_ALL docfi=1
 	CLI
-	TRACE_IRQS_OFF
 
-	LONG_L	s0, TI_REGS($28)
-	LONG_S	sp, TI_REGS($28)
-
-	/*
-	 * SAVE_ALL ensures we are using a valid kernel stack for the thread.
-	 * Check if we are already using the IRQ stack.
-	 */
-	move	s1, sp # Preserve the sp
-
-	/* Get IRQ stack for this CPU */
-	ASM_CPUID_MFC0	k0, ASM_SMP_CPUID_REG
-#if defined(CONFIG_32BIT) || defined(KBUILD_64BIT_SYM32)
-	lui	k1, %hi(irq_stack)
-#else
-	lui	k1, %highest(irq_stack)
-	daddiu	k1, %higher(irq_stack)
-	dsll	k1, 16
-	daddiu	k1, %hi(irq_stack)
-	dsll	k1, 16
-#endif
-	LONG_SRL	k0, SMP_CPUID_PTRSHIFT
-	LONG_ADDU	k1, k0
-	LONG_L	t0, %lo(irq_stack)(k1)
-
-	# Check if already on IRQ stack
-	PTR_LI	t1, ~(_THREAD_SIZE-1)
-	and	t1, t1, sp
-	beq	t0, t1, 2f
-
-	/* Switch to IRQ stack */
-	li	t1, _IRQ_STACK_START
-	PTR_ADD sp, t0, t1
-
-	/* Save task's sp on IRQ stack so that unwinding can follow it */
-	LONG_S	s1, 0(sp)
-2:
-	jal	plat_irq_dispatch
-
-	/* Restore sp */
-	move	sp, s1
-
-	j	ret_from_irq
+	move	a0, sp
+	move	a1, sp
+	jal	do_int
 #ifdef CONFIG_CPU_MICROMIPS
 	nop
 #endif
+
+	.set	noat
+	RESTORE_ALL_AND_RET
+	.set	at
 	END(handle_int)
 
 	__INIT
@@ -290,54 +253,13 @@ NESTED(except_vec_vi_handler, 0, sp)
 	SAVE_TEMP
 	SAVE_STATIC
 	CLI
-#ifdef CONFIG_TRACE_IRQFLAGS
-	move	s0, v0
-	TRACE_IRQS_OFF
-	move	v0, s0
-#endif
-
-	LONG_L	s0, TI_REGS($28)
-	LONG_S	sp, TI_REGS($28)
 
-	/*
-	 * SAVE_ALL ensures we are using a valid kernel stack for the thread.
-	 * Check if we are already using the IRQ stack.
-	 */
-	move	s1, sp # Preserve the sp
-
-	/* Get IRQ stack for this CPU */
-	ASM_CPUID_MFC0	k0, ASM_SMP_CPUID_REG
-#if defined(CONFIG_32BIT) || defined(KBUILD_64BIT_SYM32)
-	lui	k1, %hi(irq_stack)
-#else
-	lui	k1, %highest(irq_stack)
-	daddiu	k1, %higher(irq_stack)
-	dsll	k1, 16
-	daddiu	k1, %hi(irq_stack)
-	dsll	k1, 16
-#endif
-	LONG_SRL	k0, SMP_CPUID_PTRSHIFT
-	LONG_ADDU	k1, k0
-	LONG_L	t0, %lo(irq_stack)(k1)
-
-	# Check if already on IRQ stack
-	PTR_LI	t1, ~(_THREAD_SIZE-1)
-	and	t1, t1, sp
-	beq	t0, t1, 2f
-
-	/* Switch to IRQ stack */
-	li	t1, _IRQ_STACK_START
-	PTR_ADD sp, t0, t1
-
-	/* Save task's sp on IRQ stack so that unwinding can follow it */
-	LONG_S	s1, 0(sp)
-2:
-	jalr	v0
-
-	/* Restore sp */
-	move	sp, s1
+	move	a0, sp
+	move	a1, sp
+	move	a2, v0
+	jal	do_vi
 
-	j	ret_from_irq
+	RESTORE_ALL_AND_RET
 	END(except_vec_vi_handler)
 
 /*
@@ -462,22 +384,12 @@ NESTED(nmi_handler, PT_SIZE, sp)
 	.set	pop
 	END(nmi_handler)
 
-	.macro	__build_clear_none
-	.endm
-
-	.macro	__build_clear_sti
-	TRACE_IRQS_ON
-	STI
-	.endm
-
 	.macro	__build_clear_cli
 	CLI
-	TRACE_IRQS_OFF
 	.endm
 
 	.macro	__build_clear_fpe
 	CLI
-	TRACE_IRQS_OFF
 	.set	push
 	/* gas fails to assemble cfc1 for some archs (octeon).*/ \
 	.set	mips1
@@ -488,14 +400,13 @@ NESTED(nmi_handler, PT_SIZE, sp)
 
 	.macro	__build_clear_msa_fpe
 	CLI
-	TRACE_IRQS_OFF
 	_cfcmsa	a1, MSA_CSR
 	.endm
 
 	.macro	__build_clear_ade
 	MFC0	t0, CP0_BADVADDR
 	PTR_S	t0, PT_BVADDR(sp)
-	KMODE
+	CLI
 	.endm
 
 	.macro __build_clear_gsexc
@@ -507,8 +418,7 @@ NESTED(nmi_handler, PT_SIZE, sp)
 	.set	mips32
 	mfc0	a1, CP0_DIAGNOSTIC1
 	.set	pop
-	TRACE_IRQS_ON
-	STI
+	CLI
 	.endm
 
 	.macro	__BUILD_silent exception
@@ -547,7 +457,7 @@ NESTED(nmi_handler, PT_SIZE, sp)
 	__BUILD_\verbose \exception
 	move	a0, sp
 	jal	do_\handler
-	j	ret_from_exception
+	RESTORE_ALL_AND_RET
 	END(handle_\exception)
 	.endm
 
@@ -559,32 +469,28 @@ NESTED(nmi_handler, PT_SIZE, sp)
 	BUILD_HANDLER ades ade ade silent		/* #5  */
 	BUILD_HANDLER ibe be cli silent			/* #6  */
 	BUILD_HANDLER dbe be cli silent			/* #7  */
-	BUILD_HANDLER bp bp sti silent			/* #9  */
-	BUILD_HANDLER ri ri sti silent			/* #10 */
-	BUILD_HANDLER cpu cpu sti silent		/* #11 */
-	BUILD_HANDLER ov ov sti silent			/* #12 */
-	BUILD_HANDLER tr tr sti silent			/* #13 */
+	BUILD_HANDLER bp bp cli silent			/* #9  */
+	BUILD_HANDLER ri ri cli silent			/* #10 */
+	BUILD_HANDLER cpu cpu cli silent		/* #11 */
+	BUILD_HANDLER ov ov cli silent			/* #12 */
+	BUILD_HANDLER tr tr cli silent			/* #13 */
 	BUILD_HANDLER msa_fpe msa_fpe msa_fpe silent	/* #14 */
 #ifdef CONFIG_MIPS_FP_SUPPORT
 	BUILD_HANDLER fpe fpe fpe silent		/* #15 */
 #endif
-	BUILD_HANDLER ftlb ftlb none silent		/* #16 */
+	BUILD_HANDLER ftlb ftlb cli silent		/* #16 */
 	BUILD_HANDLER gsexc gsexc gsexc silent		/* #16 */
-	BUILD_HANDLER msa msa sti silent		/* #21 */
-	BUILD_HANDLER mdmx mdmx sti silent		/* #22 */
+	BUILD_HANDLER msa msa cli silent		/* #21 */
+	BUILD_HANDLER mdmx mdmx cli silent		/* #22 */
 #ifdef	CONFIG_HARDWARE_WATCHPOINTS
-	/*
-	 * For watch, interrupts will be enabled after the watch
-	 * registers are read.
-	 */
 	BUILD_HANDLER watch watch cli silent		/* #23 */
 #else
-	BUILD_HANDLER watch watch sti verbose		/* #23 */
+	BUILD_HANDLER watch watch cli verbose		/* #23 */
 #endif
 	BUILD_HANDLER mcheck mcheck cli verbose		/* #24 */
-	BUILD_HANDLER mt mt sti silent			/* #25 */
-	BUILD_HANDLER dsp dsp sti silent		/* #26 */
-	BUILD_HANDLER reserved reserved sti verbose	/* others */
+	BUILD_HANDLER mt mt cli silent			/* #25 */
+	BUILD_HANDLER dsp dsp cli silent		/* #26 */
+	BUILD_HANDLER reserved reserved cli verbose	/* others */
 
 	.align	5
 	LEAF(handle_ri_rdhwr_tlbp)
@@ -678,5 +584,5 @@ isrdhwr:
 
 	__INIT
 
-	BUILD_HANDLER  daddi_ov daddi_ov none silent	/* #12 */
+	BUILD_HANDLER  daddi_ov daddi_ov cli silent	/* #12 */
 #endif
diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
index b825ed4476c7..5f028dbd5961 100644
--- a/arch/mips/kernel/head.S
+++ b/arch/mips/kernel/head.S
@@ -19,7 +19,6 @@
 #include <asm/addrspace.h>
 #include <asm/asm.h>
 #include <asm/asmmacro.h>
-#include <asm/irqflags.h>
 #include <asm/regdef.h>
 #include <asm/mipsregs.h>
 #include <asm/stackframe.h>
diff --git a/arch/mips/kernel/r4k-bugs64.c b/arch/mips/kernel/r4k-bugs64.c
index 35729c9e6cfa..0384b649877c 100644
--- a/arch/mips/kernel/r4k-bugs64.c
+++ b/arch/mips/kernel/r4k-bugs64.c
@@ -3,6 +3,7 @@
  * Copyright (C) 2003, 2004, 2007  Maciej W. Rozycki
  */
 #include <linux/context_tracking.h>
+#include <linux/entry-common.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/ptrace.h>
@@ -168,14 +169,19 @@ static __always_inline __init void check_mult_sh(void)
 
 static volatile int daddi_ov;
 
-asmlinkage void __init do_daddi_ov(struct pt_regs *regs)
+asmlinkage void noinstr __init do_daddi_ov(struct pt_regs *regs)
 {
-	enum ctx_state prev_state;
+	irqentry_state_t state = irqentry_enter(regs);
+
+	/* Enable interrupt if enabled in parent context */
+	if (likely(!regs_irqs_disabled(regs)))
+		local_irq_enable();
 
-	prev_state = exception_enter();
 	daddi_ov = 1;
 	regs->cp0_epc += 4;
-	exception_exit(prev_state);
+
+	local_irq_disable();
+	irqentry_exit(regs, state);
 }
 
 static __init void check_daddi(void)
diff --git a/arch/mips/kernel/scall.S b/arch/mips/kernel/scall.S
index fae8d99f0458..bd2e05304e72 100644
--- a/arch/mips/kernel/scall.S
+++ b/arch/mips/kernel/scall.S
@@ -9,7 +9,6 @@
 #include <linux/errno.h>
 #include <asm/asm.h>
 #include <asm/asmmacro.h>
-#include <asm/irqflags.h>
 #include <asm/mipsregs.h>
 #include <asm/regdef.h>
 #include <asm/stackframe.h>
diff --git a/arch/mips/kernel/signal.c b/arch/mips/kernel/signal.c
index 314a6ffa0e07..087dd3cfaafa 100644
--- a/arch/mips/kernel/signal.c
+++ b/arch/mips/kernel/signal.c
@@ -877,30 +877,6 @@ void arch_do_signal_or_restart(struct pt_regs *regs, bool has_signal)
 	restore_saved_sigmask();
 }
 
-/*
- * notification of userspace execution resumption
- * - triggered by the TIF_WORK_MASK flags
- */
-asmlinkage void do_notify_resume(struct pt_regs *regs, void *unused,
-	__u32 thread_info_flags)
-{
-	local_irq_enable();
-
-	user_exit();
-
-	if (thread_info_flags & _TIF_UPROBE)
-		uprobe_notify_resume(regs);
-
-	/* deal with pending signal delivery */
-	if (thread_info_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
-		arch_do_signal_or_restart(regs, thread_info_flags & _TIF_SIGPENDING);
-
-	if (thread_info_flags & _TIF_NOTIFY_RESUME)
-		tracehook_notify_resume(regs);
-
-	user_enter();
-}
-
 #if defined(CONFIG_SMP) && defined(CONFIG_MIPS_FP_SUPPORT)
 static int smp_save_fp_context(void __user *sc)
 {
diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 6f07362de5ce..5c4be5440b15 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -17,6 +17,7 @@
 #include <linux/compiler.h>
 #include <linux/context_tracking.h>
 #include <linux/cpu_pm.h>
+#include <linux/entry-common.h>
 #include <linux/kexec.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -40,6 +41,7 @@
 #include <linux/perf_event.h>
 
 #include <asm/addrspace.h>
+#include <asm/asm-offsets.h>
 #include <asm/bootinfo.h>
 #include <asm/branch.h>
 #include <asm/break.h>
@@ -438,15 +440,14 @@ static const struct exception_table_entry *search_dbe_tables(unsigned long addr)
 	return e;
 }
 
-asmlinkage void do_be(struct pt_regs *regs)
+asmlinkage void noinstr do_be(struct pt_regs *regs)
 {
+	irqentry_state_t state = irqentry_enter(regs);
 	const int field = 2 * sizeof(unsigned long);
 	const struct exception_table_entry *fixup = NULL;
 	int data = regs->cp0_cause & 4;
 	int action = MIPS_BE_FATAL;
-	enum ctx_state prev_state;
 
-	prev_state = exception_enter();
 	/* XXX For now.	 Fixme, this searches the wrong table ...  */
 	if (data && !user_mode(regs))
 		fixup = search_dbe_tables(exception_epc(regs));
@@ -486,7 +487,7 @@ asmlinkage void do_be(struct pt_regs *regs)
 	force_sig(SIGBUS);
 
 out:
-	exception_exit(prev_state);
+	irqentry_exit(regs, state);
 }
 
 /*
@@ -743,15 +744,18 @@ static int simulate_loongson3_cpucfg(struct pt_regs *regs,
 }
 #endif /* CONFIG_CPU_LOONGSON3_CPUCFG_EMULATION */
 
-asmlinkage void do_ov(struct pt_regs *regs)
+asmlinkage void noinstr do_ov(struct pt_regs *regs)
 {
-	enum ctx_state prev_state;
+	irqentry_state_t state = irqentry_enter(regs);
+
+	local_irq_enable();
 
-	prev_state = exception_enter();
 	die_if_kernel("Integer overflow", regs);
 
 	force_sig_fault(SIGFPE, FPE_INTOVF, (void __user *)regs->cp0_epc);
-	exception_exit(prev_state);
+
+	local_irq_disable();
+	irqentry_exit(regs, state);
 }
 
 #ifdef CONFIG_MIPS_FP_SUPPORT
@@ -865,13 +869,12 @@ static int simulate_fp(struct pt_regs *regs, unsigned int opcode,
 /*
  * XXX Delayed fp exceptions when doing a lazy ctx switch XXX
  */
-asmlinkage void do_fpe(struct pt_regs *regs, unsigned long fcr31)
+asmlinkage void noinstr do_fpe(struct pt_regs *regs, unsigned long fcr31)
 {
-	enum ctx_state prev_state;
+	irqentry_state_t state = irqentry_enter(regs);
 	void __user *fault_addr;
 	int sig;
 
-	prev_state = exception_enter();
 	if (notify_die(DIE_FP, "FP exception", regs, 0, current->thread.trap_nr,
 		       SIGFPE) == NOTIFY_STOP)
 		goto out;
@@ -916,7 +919,8 @@ asmlinkage void do_fpe(struct pt_regs *regs, unsigned long fcr31)
 	process_fpemu_return(sig, fault_addr, fcr31);
 
 out:
-	exception_exit(prev_state);
+	local_irq_disable();
+	irqentry_exit(regs, state);
 }
 
 /*
@@ -1018,14 +1022,16 @@ void do_trap_or_bp(struct pt_regs *regs, unsigned int code, int si_code,
 	}
 }
 
-asmlinkage void do_bp(struct pt_regs *regs)
+asmlinkage void noinstr do_bp(struct pt_regs *regs)
 {
-	unsigned long epc = msk_isa16_mode(exception_epc(regs));
-	unsigned int opcode, bcode;
-	enum ctx_state prev_state;
+	irqentry_state_t state = irqentry_enter(regs);
 	bool user = user_mode(regs);
+	unsigned int opcode, bcode;
+	unsigned long epc;
+
+	local_irq_enable();
 
-	prev_state = exception_enter();
+	epc = msk_isa16_mode(exception_epc(regs));
 	current->thread.trap_nr = (regs->cp0_cause >> 2) & 0x1f;
 	if (get_isa16_mode(regs->cp0_epc)) {
 		u16 instr[2];
@@ -1097,7 +1103,8 @@ asmlinkage void do_bp(struct pt_regs *regs)
 	do_trap_or_bp(regs, bcode, TRAP_BRKPT, "Break");
 
 out:
-	exception_exit(prev_state);
+	local_irq_disable();
+	irqentry_exit(regs, state);
 	return;
 
 out_sigsegv:
@@ -1105,15 +1112,17 @@ asmlinkage void do_bp(struct pt_regs *regs)
 	goto out;
 }
 
-asmlinkage void do_tr(struct pt_regs *regs)
+asmlinkage void noinstr do_tr(struct pt_regs *regs)
 {
+	irqentry_state_t state = irqentry_enter(regs);
+	bool user = user_mode(regs);
 	u32 opcode, tcode = 0;
-	enum ctx_state prev_state;
+	unsigned long epc;
 	u16 instr[2];
-	bool user = user_mode(regs);
-	unsigned long epc = msk_isa16_mode(exception_epc(regs));
 
-	prev_state = exception_enter();
+	local_irq_enable();
+
+	epc = msk_isa16_mode(exception_epc(regs));
 	current->thread.trap_nr = (regs->cp0_cause >> 2) & 0x1f;
 	if (get_isa16_mode(regs->cp0_epc)) {
 		if (__get_inst16(&instr[0], (u16 *)(epc + 0), user) ||
@@ -1134,7 +1143,8 @@ asmlinkage void do_tr(struct pt_regs *regs)
 	do_trap_or_bp(regs, tcode, 0, "Trap");
 
 out:
-	exception_exit(prev_state);
+	local_irq_disable();
+	irqentry_exit(regs, state);
 	return;
 
 out_sigsegv:
@@ -1142,15 +1152,19 @@ asmlinkage void do_tr(struct pt_regs *regs)
 	goto out;
 }
 
-asmlinkage void do_ri(struct pt_regs *regs)
+asmlinkage void noinstr do_ri(struct pt_regs *regs)
 {
-	unsigned int __user *epc = (unsigned int __user *)exception_epc(regs);
+	irqentry_state_t state = irqentry_enter(regs);
 	unsigned long old_epc = regs->cp0_epc;
 	unsigned long old31 = regs->regs[31];
-	enum ctx_state prev_state;
+	unsigned int __user *epc;
 	unsigned int opcode = 0;
 	int status = -1;
 
+	local_irq_enable();
+
+	epc = (unsigned int __user *)exception_epc(regs);
+
 	/*
 	 * Avoid any kernel code. Just emulate the R2 instruction
 	 * as quickly as possible.
@@ -1177,7 +1191,6 @@ asmlinkage void do_ri(struct pt_regs *regs)
 
 no_r2_instr:
 
-	prev_state = exception_enter();
 	current->thread.trap_nr = (regs->cp0_cause >> 2) & 0x1f;
 
 	if (notify_die(DIE_RI, "RI Fault", regs, 0, current->thread.trap_nr,
@@ -1233,7 +1246,8 @@ asmlinkage void do_ri(struct pt_regs *regs)
 	}
 
 out:
-	exception_exit(prev_state);
+	local_irq_disable();
+	irqentry_exit(regs, state);
 }
 
 /*
@@ -1393,16 +1407,17 @@ static int enable_restore_fp_context(int msa)
 
 #endif /* CONFIG_MIPS_FP_SUPPORT */
 
-asmlinkage void do_cpu(struct pt_regs *regs)
+asmlinkage void noinstr do_cpu(struct pt_regs *regs)
 {
-	enum ctx_state prev_state;
+	irqentry_state_t state = irqentry_enter(regs);
 	unsigned int __user *epc;
 	unsigned long old_epc, old31;
 	unsigned int opcode;
 	unsigned int cpid;
 	int status;
 
-	prev_state = exception_enter();
+	local_irq_enable();
+
 	cpid = (regs->cp0_cause >> CAUSEB_CE) & 3;
 
 	if (cpid != 2)
@@ -1495,14 +1510,14 @@ asmlinkage void do_cpu(struct pt_regs *regs)
 		break;
 	}
 
-	exception_exit(prev_state);
+	local_irq_disable();
+	irqentry_exit(regs, state);
 }
 
-asmlinkage void do_msa_fpe(struct pt_regs *regs, unsigned int msacsr)
+asmlinkage void noinstr do_msa_fpe(struct pt_regs *regs, unsigned int msacsr)
 {
-	enum ctx_state prev_state;
+	irqentry_state_t state = irqentry_enter(regs);
 
-	prev_state = exception_enter();
 	current->thread.trap_nr = (regs->cp0_cause >> 2) & 0x1f;
 	if (notify_die(DIE_MSAFP, "MSA FP exception", regs, 0,
 		       current->thread.trap_nr, SIGFPE) == NOTIFY_STOP)
@@ -1514,16 +1529,18 @@ asmlinkage void do_msa_fpe(struct pt_regs *regs, unsigned int msacsr)
 
 	die_if_kernel("do_msa_fpe invoked from kernel context!", regs);
 	force_sig(SIGFPE);
+
 out:
-	exception_exit(prev_state);
+	local_irq_disable();
+	irqentry_exit(regs, state);
 }
 
-asmlinkage void do_msa(struct pt_regs *regs)
+asmlinkage void noinstr do_msa(struct pt_regs *regs)
 {
-	enum ctx_state prev_state;
+	irqentry_state_t state = irqentry_enter(regs);
 	int err;
 
-	prev_state = exception_enter();
+	local_irq_enable();
 
 	if (!cpu_has_msa || test_thread_flag(TIF_32BIT_FPREGS)) {
 		force_sig(SIGILL);
@@ -1535,27 +1552,39 @@ asmlinkage void do_msa(struct pt_regs *regs)
 	err = enable_restore_fp_context(1);
 	if (err)
 		force_sig(SIGILL);
+
 out:
-	exception_exit(prev_state);
+	local_irq_disable();
+	irqentry_exit(regs, state);
 }
 
-asmlinkage void do_mdmx(struct pt_regs *regs)
+asmlinkage void noinstr do_mdmx(struct pt_regs *regs)
 {
-	enum ctx_state prev_state;
+	irqentry_state_t state = irqentry_enter(regs);
+
+	local_irq_enable();
 
-	prev_state = exception_enter();
 	force_sig(SIGILL);
-	exception_exit(prev_state);
+
+	local_irq_disable();
+	irqentry_exit(regs, state);
 }
 
 /*
  * Called with interrupts disabled.
  */
-asmlinkage void do_watch(struct pt_regs *regs)
+asmlinkage void noinstr do_watch(struct pt_regs *regs)
 {
-	enum ctx_state prev_state;
+	irqentry_state_t state = irqentry_enter(regs);
+
+#ifndef CONFIG_HARDWARE_WATCHPOINTS
+	/*
+	 * For watch, interrupts will be enabled after the watch
+	 * registers are read.
+	 */
+	local_irq_enable();
+#endif
 
-	prev_state = exception_enter();
 	/*
 	 * Clear WP (bit 22) bit of cause register so we don't loop
 	 * forever.
@@ -1575,15 +1604,16 @@ asmlinkage void do_watch(struct pt_regs *regs)
 		mips_clear_watch_registers();
 		local_irq_enable();
 	}
-	exception_exit(prev_state);
+
+	local_irq_disable();
+	irqentry_exit(regs, state);
 }
 
-asmlinkage void do_mcheck(struct pt_regs *regs)
+asmlinkage void noinstr do_mcheck(struct pt_regs *regs)
 {
+	irqentry_state_t state = irqentry_enter(regs);
 	int multi_match = regs->cp0_status & ST0_TS;
-	enum ctx_state prev_state;
 
-	prev_state = exception_enter();
 	show_regs(regs);
 
 	if (multi_match) {
@@ -1601,12 +1631,17 @@ asmlinkage void do_mcheck(struct pt_regs *regs)
 	panic("Caught Machine Check exception - %scaused by multiple "
 	      "matching entries in the TLB.",
 	      (multi_match) ? "" : "not ");
+
+	irqentry_exit(regs, state);
 }
 
-asmlinkage void do_mt(struct pt_regs *regs)
+asmlinkage void noinstr do_mt(struct pt_regs *regs)
 {
+	irqentry_state_t state = irqentry_enter(regs);
 	int subcode;
 
+	local_irq_enable();
+
 	subcode = (read_vpe_c0_vpecontrol() & VPECONTROL_EXCPT)
 			>> VPECONTROL_EXCPT_SHIFT;
 	switch (subcode) {
@@ -1636,19 +1671,33 @@ asmlinkage void do_mt(struct pt_regs *regs)
 	die_if_kernel("MIPS MT Thread exception in kernel", regs);
 
 	force_sig(SIGILL);
+
+	local_irq_disable();
+	irqentry_exit(regs, state);
 }
 
 
-asmlinkage void do_dsp(struct pt_regs *regs)
+asmlinkage void noinstr do_dsp(struct pt_regs *regs)
 {
+	irqentry_state_t state = irqentry_enter(regs);
+
+	local_irq_enable();
+
 	if (cpu_has_dsp)
 		panic("Unexpected DSP exception");
 
 	force_sig(SIGILL);
+
+	local_irq_disable();
+	irqentry_exit(regs, state);
 }
 
-asmlinkage void do_reserved(struct pt_regs *regs)
+asmlinkage void noinstr do_reserved(struct pt_regs *regs)
 {
+	irqentry_state_t state = irqentry_enter(regs);
+
+	local_irq_enable();
+
 	/*
 	 * Game over - no way to handle this if it ever occurs.	 Most probably
 	 * caused by a new unknown cpu type or after another deadly
@@ -1657,6 +1706,9 @@ asmlinkage void do_reserved(struct pt_regs *regs)
 	show_regs(regs);
 	panic("Caught reserved exception %ld - should not happen.",
 	      (regs->cp0_cause & 0x7f) >> 2);
+
+	local_irq_disable();
+	irqentry_exit(regs, state);
 }
 
 static int __initdata l1parity = 1;
@@ -1871,11 +1923,16 @@ asmlinkage void cache_parity_error(void)
 	panic("Can't handle the cache error!");
 }
 
-asmlinkage void do_ftlb(void)
+asmlinkage void noinstr do_ftlb(struct pt_regs *regs)
 {
+	irqentry_state_t state = irqentry_enter(regs);
 	const int field = 2 * sizeof(unsigned long);
 	unsigned int reg_val;
 
+	/* Enable interrupt if enabled in parent context */
+	if (likely(!regs_irqs_disabled(regs)))
+		local_irq_enable();
+
 	/* For the moment, report the problem and hang. */
 	if ((cpu_has_mips_r2_r6) &&
 	    (((current_cpu_data.processor_id & 0xff0000) == PRID_COMP_MIPS) ||
@@ -1898,16 +1955,17 @@ asmlinkage void do_ftlb(void)
 	}
 	/* Just print the cacheerr bits for now */
 	cache_parity_error();
+	local_irq_disable();
+	irqentry_exit(regs, state);
 }
 
-asmlinkage void do_gsexc(struct pt_regs *regs, u32 diag1)
+asmlinkage void noinstr do_gsexc(struct pt_regs *regs, u32 diag1)
 {
+	irqentry_state_t state = irqentry_enter(regs);
 	u32 exccode = (diag1 & LOONGSON_DIAG1_EXCCODE) >>
 			LOONGSON_DIAG1_EXCCODE_SHIFT;
-	enum ctx_state prev_state;
-
-	prev_state = exception_enter();
 
+	local_irq_enable();
 	switch (exccode) {
 	case 0x08:
 		/* Undocumented exception, will trigger on certain
@@ -1928,7 +1986,52 @@ asmlinkage void do_gsexc(struct pt_regs *regs, u32 diag1)
 		panic("Unhandled Loongson exception - GSCause = %08x", diag1);
 	}
 
-	exception_exit(prev_state);
+	local_irq_disable();
+	irqentry_exit(regs, state);
+}
+
+static void noinstr call_on_irq_stack(struct pt_regs *regs,
+	unsigned long sp, void (*func)(void))
+{
+	int cpu;
+	unsigned long stack;
+	irqentry_state_t state = irqentry_enter(regs);
+	struct pt_regs *old_regs = set_irq_regs(regs);
+
+	cpu = smp_processor_id();
+
+	if (on_irq_stack(cpu, sp)) {
+		func();
+	} else {
+		stack = (unsigned long)irq_stack[cpu] + _IRQ_STACK_START;
+
+		/* Save task's sp on IRQ stack so that unwinding can follow it */
+		*(unsigned long *)stack = sp;
+
+		__asm__ __volatile__(
+		"move	$16, $29	\n" /* Preserve sp */
+		"move	$29, %[stack]	\n" /* Switch to IRQ stack */
+		"jalr	%[func]		\n" /* Invoke func */
+		"move	$29, $16	\n" /* Restore sp */
+		: /* No outputs */
+		: [stack] "r" (stack), [func] "r" (func)
+		: "$2", "$3", "$4", "$5", "$6", "$7", "$8", "$9", "$10", "$11",
+		  "$12", "$13", "$14", "$15", "$16", "$24", "$25", "memory");
+	}
+
+	set_irq_regs(old_regs);
+	irqentry_exit(regs, state);
+}
+
+asmlinkage void noinstr do_int(struct pt_regs *regs, unsigned long sp)
+{
+	call_on_irq_stack(regs, sp, plat_irq_dispatch);
+}
+
+asmlinkage void noinstr do_vi(struct pt_regs *regs, unsigned long sp,
+	vi_handler_t handler)
+{
+	call_on_irq_stack(regs, sp, handler);
 }
 
 /*
diff --git a/arch/mips/kernel/unaligned.c b/arch/mips/kernel/unaligned.c
index df4b708c04a9..b0fdca022b82 100644
--- a/arch/mips/kernel/unaligned.c
+++ b/arch/mips/kernel/unaligned.c
@@ -74,6 +74,7 @@
  *	 Undo the partial store in this case.
  */
 #include <linux/context_tracking.h>
+#include <linux/entry-common.h>
 #include <linux/mm.h>
 #include <linux/signal.h>
 #include <linux/smp.h>
@@ -1472,12 +1473,15 @@ static void emulate_load_store_MIPS16e(struct pt_regs *regs, void __user * addr)
 	force_sig(SIGILL);
 }
 
-asmlinkage void do_ade(struct pt_regs *regs)
+asmlinkage void noinstr do_ade(struct pt_regs *regs)
 {
-	enum ctx_state prev_state;
+	irqentry_state_t state = irqentry_enter(regs);
 	unsigned int *pc;
 
-	prev_state = exception_enter();
+	/* Enable interrupt if enabled in parent context */
+	if (likely(!regs_irqs_disabled(regs)))
+		local_irq_enable();
+
 	perf_sw_event(PERF_COUNT_SW_ALIGNMENT_FAULTS,
 			1, regs, regs->cp0_badvaddr);
 	/*
@@ -1512,13 +1516,13 @@ asmlinkage void do_ade(struct pt_regs *regs)
 		if (cpu_has_mmips) {
 			emulate_load_store_microMIPS(regs,
 				(void __user *)regs->cp0_badvaddr);
-			return;
+			goto out;
 		}
 
 		if (cpu_has_mips16) {
 			emulate_load_store_MIPS16e(regs,
 				(void __user *)regs->cp0_badvaddr);
-			return;
+			goto out;
 		}
 
 		goto sigbus;
@@ -1530,16 +1534,19 @@ asmlinkage void do_ade(struct pt_regs *regs)
 
 	emulate_load_store_insn(regs, (void __user *)regs->cp0_badvaddr, pc);
 
-	return;
+	goto out;
 
 sigbus:
 	die_if_kernel("Kernel unaligned instruction access", regs);
 	force_sig(SIGBUS);
 
+out:
 	/*
 	 * XXX On return from the signal handler we should advance the epc
 	 */
-	exception_exit(prev_state);
+
+	local_irq_disable();
+	irqentry_exit(regs, state);
 }
 
 #ifdef CONFIG_DEBUG_FS
diff --git a/arch/mips/mm/c-octeon.c b/arch/mips/mm/c-octeon.c
index ec2ae501539a..e68c9e6c6480 100644
--- a/arch/mips/mm/c-octeon.c
+++ b/arch/mips/mm/c-octeon.c
@@ -5,6 +5,7 @@
  *
  * Copyright (C) 2005-2007 Cavium Networks
  */
+#include <linux/entry-common.h>
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/sched.h>
@@ -349,3 +350,17 @@ asmlinkage void cache_parity_error_octeon_non_recoverable(void)
 	co_cache_error_call_notifiers(1);
 	panic("Can't handle cache error: nested exception");
 }
+
+asmlinkage void noinstr do_cache_err(struct pt_regs *regs)
+{
+	irqentry_state_t state = irqentry_enter(regs);
+
+	/* Enable interrupt if enabled in parent context */
+	if (likely(!regs_irqs_disabled(regs)))
+		local_irq_enable();
+
+	cache_parity_error_octeon_recoverable();
+
+	local_irq_disable();
+	irqentry_exit(regs, state);
+}
diff --git a/arch/mips/mm/cex-oct.S b/arch/mips/mm/cex-oct.S
index 9029092aa740..7d39087d208b 100644
--- a/arch/mips/mm/cex-oct.S
+++ b/arch/mips/mm/cex-oct.S
@@ -60,11 +60,11 @@
 	.set	noat
 
 	SAVE_ALL
-	KMODE
-	jal	cache_parity_error_octeon_recoverable
-	nop
-	j	ret_from_exception
+	CLI
+	move	a0, sp
+	jal	do_cache_err
 	nop
 
+	RESTORE_ALL_AND_RET
 	.set pop
 	END(handle_cache_err)
diff --git a/arch/mips/mm/fault.c b/arch/mips/mm/fault.c
index e7abda9c013f..e55bd45a596b 100644
--- a/arch/mips/mm/fault.c
+++ b/arch/mips/mm/fault.c
@@ -8,6 +8,7 @@
 #include <linux/context_tracking.h>
 #include <linux/signal.h>
 #include <linux/sched.h>
+#include <linux/entry-common.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -327,9 +328,14 @@ static void __kprobes __do_page_fault(struct pt_regs *regs, unsigned long write,
 asmlinkage void __kprobes do_page_fault(struct pt_regs *regs,
 	unsigned long write, unsigned long address)
 {
-	enum ctx_state prev_state;
+	irqentry_state_t state = irqentry_enter(regs);
+
+	/* Enable interrupt if enabled in parent context */
+	if (likely(!regs_irqs_disabled(regs)))
+		local_irq_enable();
 
-	prev_state = exception_enter();
 	__do_page_fault(regs, write, address);
-	exception_exit(prev_state);
+
+	local_irq_disable();
+	irqentry_exit(regs, state);
 }
diff --git a/arch/mips/mm/tlbex-fault.S b/arch/mips/mm/tlbex-fault.S
index 77db401fc620..e16b4aa1fcc4 100644
--- a/arch/mips/mm/tlbex-fault.S
+++ b/arch/mips/mm/tlbex-fault.S
@@ -15,12 +15,15 @@
 	.cfi_signal_frame
 	SAVE_ALL docfi=1
 	MFC0	a2, CP0_BADVADDR
-	KMODE
+	CLI
 	move	a0, sp
 	REG_S	a2, PT_BVADDR(sp)
 	li	a1, \write
 	jal	do_page_fault
-	j	ret_from_exception
+
+	.set	noat
+	RESTORE_ALL_AND_RET
+	.set	at
 	END(tlb_do_page_fault_\write)
 	.endm
 
-- 
2.27.0

