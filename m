Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 323D434EF6C
	for <lists+linux-mips@lfdr.de>; Tue, 30 Mar 2021 19:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232292AbhC3R1O (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Mar 2021 13:27:14 -0400
Received: from mx2.suse.de ([195.135.220.15]:38430 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232421AbhC3R1G (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 30 Mar 2021 13:27:06 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 7EC07B32E;
        Tue, 30 Mar 2021 17:27:05 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     hch@lst.de
Subject: [PATCH 2/3] MIPS: uaccess: Remove get_fs/set_fs call sites
Date:   Tue, 30 Mar 2021 19:26:59 +0200
Message-Id: <20210330172702.146909-3-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210330172702.146909-1-tsbogend@alpha.franken.de>
References: <20210330172702.146909-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use new __get_data macro to access user/kernel for functions, which
are used with user/kernel pointers. Instead of dealing with get_fs/set_fs
this macro uses a parameter to select user/kernel access.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/include/asm/uaccess.h |  23 ++++
 arch/mips/kernel/traps.c        |  72 ++++--------
 arch/mips/kernel/unaligned.c    | 197 ++++++++++++--------------------
 3 files changed, 116 insertions(+), 176 deletions(-)

diff --git a/arch/mips/include/asm/uaccess.h b/arch/mips/include/asm/uaccess.h
index c5cab0b8f902..8b3a4b992ebc 100644
--- a/arch/mips/include/asm/uaccess.h
+++ b/arch/mips/include/asm/uaccess.h
@@ -355,6 +355,29 @@ do {									\
 	(val) = __gu_tmp.t;						\
 }
 
+#define __get_udata(x, ptr, size)					\
+({									\
+	int __gu_err;							\
+									\
+	__chk_user_ptr(ptr);						\
+	__get_user_common((x), size, ptr);				\
+									\
+	__gu_err;							\
+})
+
+#define __get_kdata(x, ptr, size)					\
+({									\
+	int __gu_err;							\
+									\
+	__get_kernel_common((x), size, ptr);				\
+									\
+	__gu_err;							\
+})
+
+#define __get_data(x, ptr, u)						\
+	(((u) == true) ? __get_udata((x), (ptr), sizeof(*(ptr))) :	\
+			__get_kdata((x), (ptr), sizeof(*(ptr))))
+
 #define HAVE_GET_KERNEL_NOFAULT
 
 #define __get_kernel_nofault(dst, src, type, err_label)			\
diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 808b8b61ded1..6561c0c7841d 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -108,7 +108,8 @@ void (*board_bind_eic_interrupt)(int irq, int regset);
 void (*board_ebase_setup)(void);
 void(*board_cache_error_setup)(void);
 
-static void show_raw_backtrace(unsigned long reg29, const char *loglvl)
+static void show_raw_backtrace(unsigned long reg29, const char *loglvl,
+			       bool user)
 {
 	unsigned long *sp = (unsigned long *)(reg29 & ~3);
 	unsigned long addr;
@@ -120,7 +121,7 @@ static void show_raw_backtrace(unsigned long reg29, const char *loglvl)
 	while (!kstack_end(sp)) {
 		unsigned long __user *p =
 			(unsigned long __user *)(unsigned long)sp++;
-		if (__get_user(addr, p)) {
+		if (__get_data(addr, p, user)) {
 			printk("%s (Bad stack address)", loglvl);
 			break;
 		}
@@ -141,7 +142,7 @@ __setup("raw_show_trace", set_raw_show_trace);
 #endif
 
 static void show_backtrace(struct task_struct *task, const struct pt_regs *regs,
-			   const char *loglvl)
+			   const char *loglvl, bool user)
 {
 	unsigned long sp = regs->regs[29];
 	unsigned long ra = regs->regs[31];
@@ -151,7 +152,7 @@ static void show_backtrace(struct task_struct *task, const struct pt_regs *regs,
 		task = current;
 
 	if (raw_show_trace || user_mode(regs) || !__kernel_text_address(pc)) {
-		show_raw_backtrace(sp, loglvl);
+		show_raw_backtrace(sp, loglvl, user);
 		return;
 	}
 	printk("%sCall Trace:\n", loglvl);
@@ -167,7 +168,7 @@ static void show_backtrace(struct task_struct *task, const struct pt_regs *regs,
  * with at least a bit of error checking ...
  */
 static void show_stacktrace(struct task_struct *task,
-	const struct pt_regs *regs, const char *loglvl)
+	const struct pt_regs *regs, const char *loglvl, bool user)
 {
 	const int field = 2 * sizeof(unsigned long);
 	long stackdata;
@@ -186,7 +187,7 @@ static void show_stacktrace(struct task_struct *task,
 			break;
 		}
 
-		if (__get_user(stackdata, sp++)) {
+		if (__get_data(stackdata, sp++, user)) {
 			pr_cont(" (Bad stack address)");
 			break;
 		}
@@ -195,13 +196,12 @@ static void show_stacktrace(struct task_struct *task,
 		i++;
 	}
 	pr_cont("\n");
-	show_backtrace(task, regs, loglvl);
+	show_backtrace(task, regs, loglvl, user);
 }
 
 void show_stack(struct task_struct *task, unsigned long *sp, const char *loglvl)
 {
 	struct pt_regs regs;
-	mm_segment_t old_fs = get_fs();
 
 	regs.cp0_status = KSU_KERNEL;
 	if (sp) {
@@ -217,16 +217,10 @@ void show_stack(struct task_struct *task, unsigned long *sp, const char *loglvl)
 			prepare_frametrace(&regs);
 		}
 	}
-	/*
-	 * show_stack() deals exclusively with kernel mode, so be sure to access
-	 * the stack in the kernel (not user) address space.
-	 */
-	set_fs(KERNEL_DS);
-	show_stacktrace(task, &regs, loglvl);
-	set_fs(old_fs);
+	show_stacktrace(task, &regs, loglvl, false);
 }
 
-static void show_code(unsigned int __user *pc)
+static void show_code(unsigned int __user *pc, bool user)
 {
 	long i;
 	unsigned short __user *pc16 = NULL;
@@ -237,7 +231,8 @@ static void show_code(unsigned int __user *pc)
 		pc16 = (unsigned short __user *)((unsigned long)pc & ~1);
 	for(i = -3 ; i < 6 ; i++) {
 		unsigned int insn;
-		if (pc16 ? __get_user(insn, pc16 + i) : __get_user(insn, pc + i)) {
+		if (pc16 ? __get_data(insn, pc16 + i, user) :
+			   __get_data(insn, pc + i, user)) {
 			pr_cont(" (Bad address in epc)\n");
 			break;
 		}
@@ -356,7 +351,6 @@ void show_regs(struct pt_regs *regs)
 void show_registers(struct pt_regs *regs)
 {
 	const int field = 2 * sizeof(unsigned long);
-	mm_segment_t old_fs = get_fs();
 
 	__show_regs(regs);
 	print_modules();
@@ -371,13 +365,9 @@ void show_registers(struct pt_regs *regs)
 			printk("*HwTLS: %0*lx\n", field, tls);
 	}
 
-	if (!user_mode(regs))
-		/* Necessary for getting the correct stack content */
-		set_fs(KERNEL_DS);
-	show_stacktrace(current, regs, KERN_DEFAULT);
-	show_code((unsigned int __user *) regs->cp0_epc);
+	show_stacktrace(current, regs, KERN_DEFAULT, user_mode(regs));
+	show_code((unsigned int __user *) regs->cp0_epc, user_mode(regs));
 	printk("\n");
-	set_fs(old_fs);
 }
 
 static DEFINE_RAW_SPINLOCK(die_lock);
@@ -1022,18 +1012,14 @@ asmlinkage void do_bp(struct pt_regs *regs)
 	unsigned long epc = msk_isa16_mode(exception_epc(regs));
 	unsigned int opcode, bcode;
 	enum ctx_state prev_state;
-	mm_segment_t seg;
-
-	seg = get_fs();
-	if (!user_mode(regs))
-		set_fs(KERNEL_DS);
+	bool user = user_mode(regs);
 
 	prev_state = exception_enter();
 	current->thread.trap_nr = (regs->cp0_cause >> 2) & 0x1f;
 	if (get_isa16_mode(regs->cp0_epc)) {
 		u16 instr[2];
 
-		if (__get_user(instr[0], (u16 __user *)epc))
+		if (__get_data(instr[0], (u16 __user *)epc, user))
 			goto out_sigsegv;
 
 		if (!cpu_has_mmips) {
@@ -1044,13 +1030,13 @@ asmlinkage void do_bp(struct pt_regs *regs)
 			bcode = instr[0] & 0xf;
 		} else {
 			/* 32-bit microMIPS BREAK */
-			if (__get_user(instr[1], (u16 __user *)(epc + 2)))
+			if (__get_data(instr[1], (u16 __user *)(epc + 2), user))
 				goto out_sigsegv;
 			opcode = (instr[0] << 16) | instr[1];
 			bcode = (opcode >> 6) & ((1 << 20) - 1);
 		}
 	} else {
-		if (__get_user(opcode, (unsigned int __user *)epc))
+		if (__get_data(opcode, (unsigned int __user *)epc, user))
 			goto out_sigsegv;
 		bcode = (opcode >> 6) & ((1 << 20) - 1);
 	}
@@ -1100,7 +1086,6 @@ asmlinkage void do_bp(struct pt_regs *regs)
 	do_trap_or_bp(regs, bcode, TRAP_BRKPT, "Break");
 
 out:
-	set_fs(seg);
 	exception_exit(prev_state);
 	return;
 
@@ -1114,25 +1099,21 @@ asmlinkage void do_tr(struct pt_regs *regs)
 	u32 opcode, tcode = 0;
 	enum ctx_state prev_state;
 	u16 instr[2];
-	mm_segment_t seg;
+	bool user = user_mode(regs);
 	unsigned long epc = msk_isa16_mode(exception_epc(regs));
 
-	seg = get_fs();
-	if (!user_mode(regs))
-		set_fs(KERNEL_DS);
-
 	prev_state = exception_enter();
 	current->thread.trap_nr = (regs->cp0_cause >> 2) & 0x1f;
 	if (get_isa16_mode(regs->cp0_epc)) {
-		if (__get_user(instr[0], (u16 __user *)(epc + 0)) ||
-		    __get_user(instr[1], (u16 __user *)(epc + 2)))
+		if (__get_data(instr[0], (u16 __user *)(epc + 0), user) ||
+		    __get_data(instr[1], (u16 __user *)(epc + 2), user))
 			goto out_sigsegv;
 		opcode = (instr[0] << 16) | instr[1];
 		/* Immediate versions don't provide a code.  */
 		if (!(opcode & OPCODE))
 			tcode = (opcode >> 12) & ((1 << 4) - 1);
 	} else {
-		if (__get_user(opcode, (u32 __user *)epc))
+		if (__get_data(opcode, (u32 __user *)epc, user))
 			goto out_sigsegv;
 		/* Immediate versions don't provide a code.  */
 		if (!(opcode & OPCODE))
@@ -1142,7 +1123,6 @@ asmlinkage void do_tr(struct pt_regs *regs)
 	do_trap_or_bp(regs, tcode, 0, "Trap");
 
 out:
-	set_fs(seg);
 	exception_exit(prev_state);
 	return;
 
@@ -1591,7 +1571,6 @@ asmlinkage void do_mcheck(struct pt_regs *regs)
 {
 	int multi_match = regs->cp0_status & ST0_TS;
 	enum ctx_state prev_state;
-	mm_segment_t old_fs = get_fs();
 
 	prev_state = exception_enter();
 	show_regs(regs);
@@ -1602,12 +1581,7 @@ asmlinkage void do_mcheck(struct pt_regs *regs)
 		dump_tlb_all();
 	}
 
-	if (!user_mode(regs))
-		set_fs(KERNEL_DS);
-
-	show_code((unsigned int __user *) regs->cp0_epc);
-
-	set_fs(old_fs);
+	show_code((unsigned int __user *) regs->cp0_epc, user_mode(regs));
 
 	/*
 	 * Some chips may have other causes of machine check (e.g. SB1
diff --git a/arch/mips/kernel/unaligned.c b/arch/mips/kernel/unaligned.c
index 126a5f3f4e4c..fa005cdee0c7 100644
--- a/arch/mips/kernel/unaligned.c
+++ b/arch/mips/kernel/unaligned.c
@@ -112,9 +112,8 @@ static void emulate_load_store_insn(struct pt_regs *regs,
 	unsigned long origpc, orig31, value;
 	union mips_instruction insn;
 	unsigned int res;
-#ifdef	CONFIG_EVA
-	mm_segment_t seg;
-#endif
+	bool user = user_mode(regs);
+
 	origpc = (unsigned long)pc;
 	orig31 = regs->regs[31];
 
@@ -123,7 +122,7 @@ static void emulate_load_store_insn(struct pt_regs *regs,
 	/*
 	 * This load never faults.
 	 */
-	__get_user(insn.word, pc);
+	__get_data(insn.word, pc, user);
 
 	switch (insn.i_format.opcode) {
 		/*
@@ -163,7 +162,7 @@ static void emulate_load_store_insn(struct pt_regs *regs,
 		if (insn.dsp_format.func == lx_op) {
 			switch (insn.dsp_format.op) {
 			case lwx_op:
-				if (!access_ok(addr, 4))
+				if (user && !access_ok(addr, 4))
 					goto sigbus;
 				LoadW(addr, value, res);
 				if (res)
@@ -172,7 +171,7 @@ static void emulate_load_store_insn(struct pt_regs *regs,
 				regs->regs[insn.dsp_format.rd] = value;
 				break;
 			case lhx_op:
-				if (!access_ok(addr, 2))
+				if (user && !access_ok(addr, 2))
 					goto sigbus;
 				LoadHW(addr, value, res);
 				if (res)
@@ -191,93 +190,66 @@ static void emulate_load_store_insn(struct pt_regs *regs,
 			 * memory, so we need to "switch" the address limit to
 			 * user space, so that address check can work properly.
 			 */
-			seg = force_uaccess_begin();
 			switch (insn.spec3_format.func) {
 			case lhe_op:
-				if (!access_ok(addr, 2)) {
-					force_uaccess_end(seg);
+				if (!access_ok(addr, 2))
 					goto sigbus;
-				}
 				LoadHWE(addr, value, res);
-				if (res) {
-					force_uaccess_end(seg);
+				if (res)
 					goto fault;
-				}
 				compute_return_epc(regs);
 				regs->regs[insn.spec3_format.rt] = value;
 				break;
 			case lwe_op:
-				if (!access_ok(addr, 4)) {
-					force_uaccess_end(seg);
+				if (!access_ok(addr, 4))
 					goto sigbus;
-				}
 				LoadWE(addr, value, res);
-				if (res) {
-					force_uaccess_end(seg);
+				if (res)
 					goto fault;
-				}
 				compute_return_epc(regs);
 				regs->regs[insn.spec3_format.rt] = value;
 				break;
 			case lhue_op:
-				if (!access_ok(addr, 2)) {
-					force_uaccess_end(seg);
+				if (!access_ok(addr, 2))
 					goto sigbus;
-				}
 				LoadHWUE(addr, value, res);
-				if (res) {
-					force_uaccess_end(seg);
+				if (res)
 					goto fault;
-				}
 				compute_return_epc(regs);
 				regs->regs[insn.spec3_format.rt] = value;
 				break;
 			case she_op:
-				if (!access_ok(addr, 2)) {
-					force_uaccess_end(seg);
+				if (!access_ok(addr, 2))
 					goto sigbus;
-				}
 				compute_return_epc(regs);
 				value = regs->regs[insn.spec3_format.rt];
 				StoreHWE(addr, value, res);
-				if (res) {
-					force_uaccess_end(seg);
+				if (res)
 					goto fault;
-				}
 				break;
 			case swe_op:
-				if (!access_ok(addr, 4)) {
-					force_uaccess_end(seg);
+				if (!access_ok(addr, 4))
 					goto sigbus;
-				}
 				compute_return_epc(regs);
 				value = regs->regs[insn.spec3_format.rt];
 				StoreWE(addr, value, res);
-				if (res) {
-					force_uaccess_end(seg);
+				if (res)
 					goto fault;
-				}
 				break;
 			default:
-				force_uaccess_end(seg);
 				goto sigill;
 			}
-			force_uaccess_end(seg);
 		}
 #endif
 		break;
 	case lh_op:
-		if (!access_ok(addr, 2))
+		if (user && !access_ok(addr, 2))
 			goto sigbus;
 
-		if (IS_ENABLED(CONFIG_EVA)) {
-			if (uaccess_kernel())
-				LoadHW(addr, value, res);
-			else
-				LoadHWE(addr, value, res);
-		} else {
+		if (IS_ENABLED(CONFIG_EVA) && user)
+			LoadHWE(addr, value, res);
+		else
 			LoadHW(addr, value, res);
-		}
 
 		if (res)
 			goto fault;
@@ -286,17 +258,13 @@ static void emulate_load_store_insn(struct pt_regs *regs,
 		break;
 
 	case lw_op:
-		if (!access_ok(addr, 4))
+		if (user && !access_ok(addr, 4))
 			goto sigbus;
 
-		if (IS_ENABLED(CONFIG_EVA)) {
-			if (uaccess_kernel())
-				LoadW(addr, value, res);
-			else
-				LoadWE(addr, value, res);
-		} else {
+		if (IS_ENABLED(CONFIG_EVA) && user)
+			LoadWE(addr, value, res);
+		else
 			LoadW(addr, value, res);
-		}
 
 		if (res)
 			goto fault;
@@ -305,17 +273,13 @@ static void emulate_load_store_insn(struct pt_regs *regs,
 		break;
 
 	case lhu_op:
-		if (!access_ok(addr, 2))
+		if (user && !access_ok(addr, 2))
 			goto sigbus;
 
-		if (IS_ENABLED(CONFIG_EVA)) {
-			if (uaccess_kernel())
-				LoadHWU(addr, value, res);
-			else
-				LoadHWUE(addr, value, res);
-		} else {
+		if (IS_ENABLED(CONFIG_EVA) && user)
+			LoadHWUE(addr, value, res);
+		else
 			LoadHWU(addr, value, res);
-		}
 
 		if (res)
 			goto fault;
@@ -332,7 +296,7 @@ static void emulate_load_store_insn(struct pt_regs *regs,
 		 * would blow up, so for now we don't handle unaligned 64-bit
 		 * instructions on 32-bit kernels.
 		 */
-		if (!access_ok(addr, 4))
+		if (user && !access_ok(addr, 4))
 			goto sigbus;
 
 		LoadWU(addr, value, res);
@@ -355,7 +319,7 @@ static void emulate_load_store_insn(struct pt_regs *regs,
 		 * would blow up, so for now we don't handle unaligned 64-bit
 		 * instructions on 32-bit kernels.
 		 */
-		if (!access_ok(addr, 8))
+		if (user && !access_ok(addr, 8))
 			goto sigbus;
 
 		LoadDW(addr, value, res);
@@ -370,40 +334,32 @@ static void emulate_load_store_insn(struct pt_regs *regs,
 		goto sigill;
 
 	case sh_op:
-		if (!access_ok(addr, 2))
+		if (user && !access_ok(addr, 2))
 			goto sigbus;
 
 		compute_return_epc(regs);
 		value = regs->regs[insn.i_format.rt];
 
-		if (IS_ENABLED(CONFIG_EVA)) {
-			if (uaccess_kernel())
-				StoreHW(addr, value, res);
-			else
-				StoreHWE(addr, value, res);
-		} else {
+		if (IS_ENABLED(CONFIG_EVA) && user)
+			StoreHWE(addr, value, res);
+		else
 			StoreHW(addr, value, res);
-		}
 
 		if (res)
 			goto fault;
 		break;
 
 	case sw_op:
-		if (!access_ok(addr, 4))
+		if (user && !access_ok(addr, 4))
 			goto sigbus;
 
 		compute_return_epc(regs);
 		value = regs->regs[insn.i_format.rt];
 
-		if (IS_ENABLED(CONFIG_EVA)) {
-			if (uaccess_kernel())
-				StoreW(addr, value, res);
-			else
-				StoreWE(addr, value, res);
-		} else {
+		if (IS_ENABLED(CONFIG_EVA) && user)
+			StoreWE(addr, value, res);
+		else
 			StoreW(addr, value, res);
-		}
 
 		if (res)
 			goto fault;
@@ -418,7 +374,7 @@ static void emulate_load_store_insn(struct pt_regs *regs,
 		 * would blow up, so for now we don't handle unaligned 64-bit
 		 * instructions on 32-bit kernels.
 		 */
-		if (!access_ok(addr, 8))
+		if (user && !access_ok(addr, 8))
 			goto sigbus;
 
 		compute_return_epc(regs);
@@ -626,6 +582,7 @@ static void emulate_load_store_microMIPS(struct pt_regs *regs,
 	unsigned long origpc, contpc;
 	union mips_instruction insn;
 	struct mm_decoded_insn mminsn;
+	bool user = user_mode(regs);
 
 	origpc = regs->cp0_epc;
 	orig31 = regs->regs[31];
@@ -689,7 +646,7 @@ static void emulate_load_store_microMIPS(struct pt_regs *regs,
 			if (reg == 31)
 				goto sigbus;
 
-			if (!access_ok(addr, 8))
+			if (user && !access_ok(addr, 8))
 				goto sigbus;
 
 			LoadW(addr, value, res);
@@ -708,7 +665,7 @@ static void emulate_load_store_microMIPS(struct pt_regs *regs,
 			if (reg == 31)
 				goto sigbus;
 
-			if (!access_ok(addr, 8))
+			if (user && !access_ok(addr, 8))
 				goto sigbus;
 
 			value = regs->regs[reg];
@@ -728,7 +685,7 @@ static void emulate_load_store_microMIPS(struct pt_regs *regs,
 			if (reg == 31)
 				goto sigbus;
 
-			if (!access_ok(addr, 16))
+			if (user && !access_ok(addr, 16))
 				goto sigbus;
 
 			LoadDW(addr, value, res);
@@ -751,7 +708,7 @@ static void emulate_load_store_microMIPS(struct pt_regs *regs,
 			if (reg == 31)
 				goto sigbus;
 
-			if (!access_ok(addr, 16))
+			if (user && !access_ok(addr, 16))
 				goto sigbus;
 
 			value = regs->regs[reg];
@@ -774,10 +731,10 @@ static void emulate_load_store_microMIPS(struct pt_regs *regs,
 			if ((rvar > 9) || !reg)
 				goto sigill;
 			if (reg & 0x10) {
-				if (!access_ok(addr, 4 * (rvar + 1)))
+				if (user && !access_ok(addr, 4 * (rvar + 1)))
 					goto sigbus;
 			} else {
-				if (!access_ok(addr, 4 * rvar))
+				if (user && !access_ok(addr, 4 * rvar))
 					goto sigbus;
 			}
 			if (rvar == 9)
@@ -810,10 +767,10 @@ static void emulate_load_store_microMIPS(struct pt_regs *regs,
 			if ((rvar > 9) || !reg)
 				goto sigill;
 			if (reg & 0x10) {
-				if (!access_ok(addr, 4 * (rvar + 1)))
+				if (user && !access_ok(addr, 4 * (rvar + 1)))
 					goto sigbus;
 			} else {
-				if (!access_ok(addr, 4 * rvar))
+				if (user && !access_ok(addr, 4 * rvar))
 					goto sigbus;
 			}
 			if (rvar == 9)
@@ -847,10 +804,10 @@ static void emulate_load_store_microMIPS(struct pt_regs *regs,
 			if ((rvar > 9) || !reg)
 				goto sigill;
 			if (reg & 0x10) {
-				if (!access_ok(addr, 8 * (rvar + 1)))
+				if (user && !access_ok(addr, 8 * (rvar + 1)))
 					goto sigbus;
 			} else {
-				if (!access_ok(addr, 8 * rvar))
+				if (user && !access_ok(addr, 8 * rvar))
 					goto sigbus;
 			}
 			if (rvar == 9)
@@ -888,10 +845,10 @@ static void emulate_load_store_microMIPS(struct pt_regs *regs,
 			if ((rvar > 9) || !reg)
 				goto sigill;
 			if (reg & 0x10) {
-				if (!access_ok(addr, 8 * (rvar + 1)))
+				if (user && !access_ok(addr, 8 * (rvar + 1)))
 					goto sigbus;
 			} else {
-				if (!access_ok(addr, 8 * rvar))
+				if (user && !access_ok(addr, 8 * rvar))
 					goto sigbus;
 			}
 			if (rvar == 9)
@@ -1010,7 +967,7 @@ static void emulate_load_store_microMIPS(struct pt_regs *regs,
 		case mm_lwm16_op:
 			reg = insn.mm16_m_format.rlist;
 			rvar = reg + 1;
-			if (!access_ok(addr, 4 * rvar))
+			if (user && !access_ok(addr, 4 * rvar))
 				goto sigbus;
 
 			for (i = 16; rvar; rvar--, i++) {
@@ -1030,7 +987,7 @@ static void emulate_load_store_microMIPS(struct pt_regs *regs,
 		case mm_swm16_op:
 			reg = insn.mm16_m_format.rlist;
 			rvar = reg + 1;
-			if (!access_ok(addr, 4 * rvar))
+			if (user && !access_ok(addr, 4 * rvar))
 				goto sigbus;
 
 			for (i = 16; rvar; rvar--, i++) {
@@ -1084,7 +1041,7 @@ static void emulate_load_store_microMIPS(struct pt_regs *regs,
 	}
 
 loadHW:
-	if (!access_ok(addr, 2))
+	if (user && !access_ok(addr, 2))
 		goto sigbus;
 
 	LoadHW(addr, value, res);
@@ -1094,7 +1051,7 @@ static void emulate_load_store_microMIPS(struct pt_regs *regs,
 	goto success;
 
 loadHWU:
-	if (!access_ok(addr, 2))
+	if (user && !access_ok(addr, 2))
 		goto sigbus;
 
 	LoadHWU(addr, value, res);
@@ -1104,7 +1061,7 @@ static void emulate_load_store_microMIPS(struct pt_regs *regs,
 	goto success;
 
 loadW:
-	if (!access_ok(addr, 4))
+	if (user && !access_ok(addr, 4))
 		goto sigbus;
 
 	LoadW(addr, value, res);
@@ -1122,7 +1079,7 @@ static void emulate_load_store_microMIPS(struct pt_regs *regs,
 	 * would blow up, so for now we don't handle unaligned 64-bit
 	 * instructions on 32-bit kernels.
 	 */
-	if (!access_ok(addr, 4))
+	if (user && !access_ok(addr, 4))
 		goto sigbus;
 
 	LoadWU(addr, value, res);
@@ -1144,7 +1101,7 @@ static void emulate_load_store_microMIPS(struct pt_regs *regs,
 	 * would blow up, so for now we don't handle unaligned 64-bit
 	 * instructions on 32-bit kernels.
 	 */
-	if (!access_ok(addr, 8))
+	if (user && !access_ok(addr, 8))
 		goto sigbus;
 
 	LoadDW(addr, value, res);
@@ -1158,7 +1115,7 @@ static void emulate_load_store_microMIPS(struct pt_regs *regs,
 	goto sigill;
 
 storeHW:
-	if (!access_ok(addr, 2))
+	if (user && !access_ok(addr, 2))
 		goto sigbus;
 
 	value = regs->regs[reg];
@@ -1168,7 +1125,7 @@ static void emulate_load_store_microMIPS(struct pt_regs *regs,
 	goto success;
 
 storeW:
-	if (!access_ok(addr, 4))
+	if (user && !access_ok(addr, 4))
 		goto sigbus;
 
 	value = regs->regs[reg];
@@ -1186,7 +1143,7 @@ static void emulate_load_store_microMIPS(struct pt_regs *regs,
 	 * would blow up, so for now we don't handle unaligned 64-bit
 	 * instructions on 32-bit kernels.
 	 */
-	if (!access_ok(addr, 8))
+	if (user && !access_ok(addr, 8))
 		goto sigbus;
 
 	value = regs->regs[reg];
@@ -1243,6 +1200,7 @@ static void emulate_load_store_MIPS16e(struct pt_regs *regs, void __user * addr)
 	union mips16e_instruction mips16inst, oldinst;
 	unsigned int opcode;
 	int extended = 0;
+	bool user = user_mode(regs);
 
 	origpc = regs->cp0_epc;
 	orig31 = regs->regs[31];
@@ -1344,7 +1302,7 @@ static void emulate_load_store_MIPS16e(struct pt_regs *regs, void __user * addr)
 		goto sigbus;
 
 	case MIPS16e_lh_op:
-		if (!access_ok(addr, 2))
+		if (user && !access_ok(addr, 2))
 			goto sigbus;
 
 		LoadHW(addr, value, res);
@@ -1355,7 +1313,7 @@ static void emulate_load_store_MIPS16e(struct pt_regs *regs, void __user * addr)
 		break;
 
 	case MIPS16e_lhu_op:
-		if (!access_ok(addr, 2))
+		if (user && !access_ok(addr, 2))
 			goto sigbus;
 
 		LoadHWU(addr, value, res);
@@ -1368,7 +1326,7 @@ static void emulate_load_store_MIPS16e(struct pt_regs *regs, void __user * addr)
 	case MIPS16e_lw_op:
 	case MIPS16e_lwpc_op:
 	case MIPS16e_lwsp_op:
-		if (!access_ok(addr, 4))
+		if (user && !access_ok(addr, 4))
 			goto sigbus;
 
 		LoadW(addr, value, res);
@@ -1387,7 +1345,7 @@ static void emulate_load_store_MIPS16e(struct pt_regs *regs, void __user * addr)
 		 * would blow up, so for now we don't handle unaligned 64-bit
 		 * instructions on 32-bit kernels.
 		 */
-		if (!access_ok(addr, 4))
+		if (user && !access_ok(addr, 4))
 			goto sigbus;
 
 		LoadWU(addr, value, res);
@@ -1411,7 +1369,7 @@ static void emulate_load_store_MIPS16e(struct pt_regs *regs, void __user * addr)
 		 * would blow up, so for now we don't handle unaligned 64-bit
 		 * instructions on 32-bit kernels.
 		 */
-		if (!access_ok(addr, 8))
+		if (user && !access_ok(addr, 8))
 			goto sigbus;
 
 		LoadDW(addr, value, res);
@@ -1426,7 +1384,7 @@ static void emulate_load_store_MIPS16e(struct pt_regs *regs, void __user * addr)
 		goto sigill;
 
 	case MIPS16e_sh_op:
-		if (!access_ok(addr, 2))
+		if (user && !access_ok(addr, 2))
 			goto sigbus;
 
 		MIPS16e_compute_return_epc(regs, &oldinst);
@@ -1439,7 +1397,7 @@ static void emulate_load_store_MIPS16e(struct pt_regs *regs, void __user * addr)
 	case MIPS16e_sw_op:
 	case MIPS16e_swsp_op:
 	case MIPS16e_i8_op:	/* actually - MIPS16e_swrasp_func */
-		if (!access_ok(addr, 4))
+		if (user && !access_ok(addr, 4))
 			goto sigbus;
 
 		MIPS16e_compute_return_epc(regs, &oldinst);
@@ -1459,7 +1417,7 @@ static void emulate_load_store_MIPS16e(struct pt_regs *regs, void __user * addr)
 		 * would blow up, so for now we don't handle unaligned 64-bit
 		 * instructions on 32-bit kernels.
 		 */
-		if (!access_ok(addr, 8))
+		if (user && !access_ok(addr, 8))
 			goto sigbus;
 
 		MIPS16e_compute_return_epc(regs, &oldinst);
@@ -1516,7 +1474,6 @@ asmlinkage void do_ade(struct pt_regs *regs)
 {
 	enum ctx_state prev_state;
 	unsigned int __user *pc;
-	mm_segment_t seg;
 
 	prev_state = exception_enter();
 	perf_sw_event(PERF_COUNT_SW_ALIGNMENT_FAULTS,
@@ -1551,24 +1508,14 @@ asmlinkage void do_ade(struct pt_regs *regs)
 			show_registers(regs);
 
 		if (cpu_has_mmips) {
-			seg = get_fs();
-			if (!user_mode(regs))
-				set_fs(KERNEL_DS);
 			emulate_load_store_microMIPS(regs,
 				(void __user *)regs->cp0_badvaddr);
-			set_fs(seg);
-
 			return;
 		}
 
 		if (cpu_has_mips16) {
-			seg = get_fs();
-			if (!user_mode(regs))
-				set_fs(KERNEL_DS);
 			emulate_load_store_MIPS16e(regs,
 				(void __user *)regs->cp0_badvaddr);
-			set_fs(seg);
-
 			return;
 		}
 
@@ -1579,11 +1526,7 @@ asmlinkage void do_ade(struct pt_regs *regs)
 		show_registers(regs);
 	pc = (unsigned int __user *)exception_epc(regs);
 
-	seg = get_fs();
-	if (!user_mode(regs))
-		set_fs(KERNEL_DS);
 	emulate_load_store_insn(regs, (void __user *)regs->cp0_badvaddr, pc);
-	set_fs(seg);
 
 	return;
 
-- 
2.29.2

