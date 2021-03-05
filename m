Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86D8E32E629
	for <lists+linux-mips@lfdr.de>; Fri,  5 Mar 2021 11:21:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbhCEKUl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Mar 2021 05:20:41 -0500
Received: from mail.loongson.cn ([114.242.206.163]:49286 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229576AbhCEKUb (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 5 Mar 2021 05:20:31 -0500
Received: from localhost.localdomain (unknown [182.149.161.105])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr9fCBUJgPcwUAA--.6604S6;
        Fri, 05 Mar 2021 18:19:56 +0800 (CST)
From:   Huang Pei <huangpei@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        ambrosehua@gmail.com
Cc:     Bibo Mao <maobibo@loongson.cn>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mips@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-mm@kvack.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Jinyang He <hejinyang@loongson.cn>,
        "Maciej W . Rozycki" <macro@orcam.me.uk>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH 4/4] MIPS: add DYNAMIC_FTRACE_WITH_REGS
Date:   Fri,  5 Mar 2021 18:19:33 +0800
Message-Id: <20210305101933.9799-5-huangpei@loongson.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210305101933.9799-1-huangpei@loongson.cn>
References: <20210305101933.9799-1-huangpei@loongson.cn>
X-CM-TRANSID: AQAAf9Dxr9fCBUJgPcwUAA--.6604S6
X-Coremail-Antispam: 1UD129KBjvAXoWfJFWxXr48GFW8AF1Dtw4Utwb_yoW8JFW8Ko
        Wfu3ZIvws5JFyIqan5uay5Gr15Xrn8KF98JaySyw15WFn0kr12qFn8Ca1Dtw15ur1FyFsx
        AFW3ZF48JF40y3srn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUUO27AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20EY4v20xva
        j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r126s0DM28Irc
        Ia0xkI8VCY1x0267AKxVW5JVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l
        84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJV
        WxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
        3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
        x0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
        JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2
        ka0xkIwI1lc2xSY4AK67AK6r4DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
        6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
        AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
        2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
        vEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIev
        Ja73UjIFyTuYvjfUriihUUUUU
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add another ftrace implementation in parallel with mcount-based ftrace

+. Depend on GCC with -fpatchable-function-entry

+. Use 3 nops for stub in module and vmlinux, smaller than old one.

+. Simplify ftrace_regs_caller/ftrace_caller handling, especially
on MIPS O32

+. No adjustment on sp, so callee(the traced function) can get caller's
sp, very friendly to livepatch

Signed-off-by: Huang Pei <huangpei@loongson.cn>
---
 arch/mips/Kconfig               |   2 +
 arch/mips/Makefile              |  16 ++-
 arch/mips/include/asm/ftrace.h  |   7 ++
 arch/mips/kernel/Makefile       |   5 +-
 arch/mips/kernel/entry-ftrace.S | 182 +++++++++++++++++++++++++++
 arch/mips/kernel/ftrace.c       | 215 ++++++++++++++++++++++++++++++++
 6 files changed, 422 insertions(+), 5 deletions(-)
 create mode 100644 arch/mips/kernel/entry-ftrace.S
 create mode 100644 arch/mips/kernel/ftrace.c

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 5741dae35b74..6b96a19a42c2 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -56,6 +56,8 @@ config MIPS
 	select HAVE_DEBUG_STACKOVERFLOW
 	select HAVE_DMA_CONTIGUOUS
 	select HAVE_DYNAMIC_FTRACE
+	select HAVE_DYNAMIC_FTRACE_WITH_REGS \
+		if $(cc-option, -fpatchable-function-entry=3)
 	select HAVE_EBPF_JIT if 64BIT && !CPU_MICROMIPS && TARGET_ISA_REV >= 2
 	select HAVE_EXIT_THREAD
 	select HAVE_FAST_GUP
diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 0d0f29d662c9..1d6553f0623e 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -56,13 +56,16 @@ ifneq ($(SUBARCH),$(ARCH))
   endif
 endif
 
-ifdef CONFIG_FUNCTION_GRAPH_TRACER
-  ifndef KBUILD_MCOUNT_RA_ADDRESS
-    ifeq ($(call cc-option-yn,-mmcount-ra-address), y)
-      cflags-y += -mmcount-ra-address -DKBUILD_MCOUNT_RA_ADDRESS
+ifndef CONFIG_DYNMAIC_FTRACE_WITH_REGS
+  ifdef CONFIG_FUNCTION_GRAPH_TRACER
+    ifndef KBUILD_MCOUNT_RA_ADDRESS
+      ifeq ($(call cc-option-yn,-mmcount-ra-address), y)
+        cflags-y += -mmcount-ra-address -DKBUILD_MCOUNT_RA_ADDRESS
+      endif
     endif
   endif
 endif
+
 cflags-y += $(call cc-option, -mno-check-zero-division)
 
 ifdef CONFIG_32BIT
@@ -293,6 +296,11 @@ ifdef CONFIG_64BIT
 bootvars-y	+= ADDR_BITS=64
 endif
 
+ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
+	KBUILD_CPPFLAGS += -DCC_USING_PATCHABLE_FUNCTION_ENTRY
+	CC_FLAGS_FTRACE := -fpatchable-function-entry=3
+endif
+
 # This is required to get dwarf unwinding tables into .debug_frame
 # instead of .eh_frame so we don't discard them.
 KBUILD_CFLAGS += -fno-asynchronous-unwind-tables
diff --git a/arch/mips/include/asm/ftrace.h b/arch/mips/include/asm/ftrace.h
index b463f2aa5a61..e3b0910486ab 100644
--- a/arch/mips/include/asm/ftrace.h
+++ b/arch/mips/include/asm/ftrace.h
@@ -87,4 +87,11 @@ struct dyn_arch_ftrace {
 #endif /*  CONFIG_DYNAMIC_FTRACE */
 #endif /* __ASSEMBLY__ */
 #endif /* CONFIG_FUNCTION_TRACER */
+
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
+struct dyn_ftrace;
+int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec);
+#define ftrace_init_nop ftrace_init_nop
+#endif
+
 #endif /* _ASM_MIPS_FTRACE_H */
diff --git a/arch/mips/kernel/Makefile b/arch/mips/kernel/Makefile
index 3e7b0ee54cfb..7b07d80aadd5 100644
--- a/arch/mips/kernel/Makefile
+++ b/arch/mips/kernel/Makefile
@@ -21,6 +21,7 @@ CFLAGS_REMOVE_ftrace-mcount.o = $(CC_FLAGS_FTRACE)
 CFLAGS_REMOVE_early_printk.o = $(CC_FLAGS_FTRACE)
 CFLAGS_REMOVE_perf_event.o = $(CC_FLAGS_FTRACE)
 CFLAGS_REMOVE_perf_event_mipsxx.o = $(CC_FLAGS_FTRACE)
+CFLAGS_REMOVE_ftrace.o = $(CC_FLAGS_FTRACE)
 endif
 
 obj-$(CONFIG_CEVT_BCM1480)	+= cevt-bcm1480.o
@@ -39,7 +40,9 @@ obj-$(CONFIG_DEBUG_FS)		+= segment.o
 obj-$(CONFIG_STACKTRACE)	+= stacktrace.o
 obj-$(CONFIG_MODULES)		+= module.o
 
-obj-$(CONFIG_FUNCTION_TRACER)	+= mcount.o ftrace-mcount.o
+ft-$(CONFIG_FUNCTION_TRACER)	+= mcount.o ftrace-mcount.o
+ft-$(CONFIG_DYNAMIC_FTRACE_WITH_REGS)	:= entry-ftrace.o ftrace.o
+obj-y				+= $(ft-y)
 
 sw-y				:= r4k_switch.o
 sw-$(CONFIG_CPU_R3000)		:= r2300_switch.o
diff --git a/arch/mips/kernel/entry-ftrace.S b/arch/mips/kernel/entry-ftrace.S
new file mode 100644
index 000000000000..1e1eebc523ea
--- /dev/null
+++ b/arch/mips/kernel/entry-ftrace.S
@@ -0,0 +1,182 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * arch/mips/kernel/entry_ftrace.S
+ *
+ * Copyright (C) 2021 Loongson Corp
+ * Author: Huang Pei <huangpei@loongson.cn>
+ */
+
+#include <asm/export.h>
+#include <asm/regdef.h>
+#include <asm/stackframe.h>
+
+/*
+ * ftrace_regs_caller() is the function that replaces _mcount() when ftrace
+ * is active.
+ *
+ * we arrive here after a function A calls function B, and B is what we
+ * are tracing for. When we enter, sp points to A's stack frame, B has not
+ * yet had a chance to allocate one yet. (This is different from -pg case
+ * , in which the B's stack is allocated))
+
+ * when ftrace initialized, it replace three nops from all function with 
+ * "lui + nop + move"
+ * B:
+ *	lui	at, %hi(ftrace_regs_caller)
+ *	nop
+ *	li	t0, 0
+ * #	B's real start
+ *
+ * at B's entry, when tracing enabled, replace the 'nop' with 'jalr'
+ *
+ * #	B's entry, three nop for both in vmlinux and in kernel modules
+ * B:
+ *	lui	at, %hi(ftrace_regs_caller)
+ *	jalr	at, at
+ *	move	t0, zero
+ * #	B's real start
+ *
+ * if set t0 to 1, then calling ftrace_regs_caller with partial regs saved
+ *
+ * B:
+ *	lui	at, %hi(ftrace_regs_caller)
+ *	jalr	at, at
+ *	li	t0, 1
+ * #	B's real start
+ *
+ * we make ftrace_regs_caller 64KB aligned, when entring ftrace_regs_caller
+ * AT points to the return address to B, and ra points to return address
+ * to A,
+ *
+ * if patched to new funcition, then clobbered the first real instruction
+ *
+ * B:
+ *	lui	at, %hi(new_B)
+ *	addiu	at, at, %lo(new_B)
+ *	jr	at
+ * #	B's real start, now clobbered with zero
+ *	nop
+ *
+ */
+	.text
+	.set push
+	.set noreorder
+	.set noat
+	.align 16
+NESTED(ftrace_regs_caller, PT_SIZE, ra)
+	PTR_ADDIU	sp, sp, -PT_SIZE
+	.globl ftrace_caller
+ftrace_caller:
+#ifdef CONFIG_64BIT
+	PTR_S	a4, PT_R8(sp)
+	PTR_S	a5, PT_R9(sp)
+	PTR_S	a6, PT_R10(sp)
+	PTR_S	a7, PT_R11(sp)
+#endif
+	PTR_S	a0, PT_R4(sp)
+	PTR_S	a1, PT_R5(sp)
+	PTR_S	a2, PT_R6(sp)
+
+	bnez	t0, 1f
+	PTR_S	a3, PT_R7(sp)
+
+	PTR_S	t0, PT_R12(sp)
+	PTR_S	t1, PT_R13(sp)
+	PTR_S	t2, PT_R14(sp)
+	PTR_S	t3, PT_R15(sp)
+
+	PTR_S	s0, PT_R16(sp)
+	PTR_S	s1, PT_R17(sp)
+	PTR_S	s2, PT_R18(sp)
+	PTR_S	s3, PT_R19(sp)
+
+	PTR_S	s4, PT_R20(sp)
+	PTR_S	s5, PT_R21(sp)
+	PTR_S	s6, PT_R22(sp)
+	PTR_S	s7, PT_R23(sp)
+
+	PTR_S	t8, PT_R24(sp)
+	PTR_S	t9, PT_R25(sp)
+	PTR_S	s8, PT_R30(sp)
+	PTR_S	gp, PT_R28(sp)
+
+1:
+	PTR_S	sp, PT_R29(sp)
+	PTR_S	ra, PT_R1(sp)
+	PTR_S	AT, PT_R31(sp)
+
+	END(ftrace_regs_caller)
+
+ftrace_common:
+	PTR_ADDIU	a0, AT, -12	//a0 points to B's entry address
+	move	a1, ra			//a1 points to return address to A
+	PTR_L	a2, function_trace_op	//a2 points to function_trace op
+
+	.globl	ftrace_call
+ftrace_call:
+	jal	ftrace_stub
+	move	a3, sp			//a3 point to frame pointer
+
+#ifdef CONFIG_FUNCTION_GRAPH_TRACER
+	.globl ftrace_graph_call
+ftrace_graph_call:
+	nop
+	nop
+#endif
+
+ftrace_common_return:
+	PTR_L	AT, PT_R1(sp)
+ftrace_graph_return:
+	PTR_L	ra, PT_R31(sp)
+	PTR_L	a0, PT_R4(sp)
+	PTR_L	a1, PT_R5(sp)
+	PTR_L	a2, PT_R6(sp)
+	PTR_L	a3, PT_R7(sp)
+#ifdef CONFIG_64BIT
+	PTR_L	a4, PT_R8(sp)
+	PTR_L	a5, PT_R9(sp)
+	PTR_L	a6, PT_R10(sp)
+	PTR_L	a7, PT_R11(sp)
+#endif
+	PTR_ADDIU	sp, sp, PT_SIZE	//retore stack frame
+	jr	ra
+	move	ra, AT
+
+
+	.globl ftrace_stub
+ftrace_stub:
+	jr	ra
+	nop
+
+#ifdef CONFIG_FUNCTION_GRAPH_TRACER
+	.globl	ftrace_graph_caller
+ftrace_graph_caller:
+	PTR_L	a0, PT_R1(sp)
+	PTR_L	a1, PT_R31(sp)
+	jal	prepare_ftrace_return
+	PTR_ADDIU	a2, sp, PT_SIZE
+
+	b	ftrace_graph_return
+	move	AT, v0
+
+
+	.align	2
+	.globl	return_to_handler
+return_to_handler:
+	PTR_SUBU	sp, PT_SIZE
+	PTR_S	v0, PT_R2(sp)
+
+	jal	ftrace_return_to_handler
+	 PTR_S	v1, PT_R3(sp)
+
+	/* restore the real parent address: v0 -> ra */
+	move	ra, v0
+
+	PTR_L	v0, PT_R2(sp)
+	PTR_L	v1, PT_R3(sp)
+	jr	ra
+	 PTR_ADDIU	sp, PT_SIZE
+
+	.set at
+	.set reorder
+#endif /* CONFIG_FUNCTION_GRAPH_TRACER */
diff --git a/arch/mips/kernel/ftrace.c b/arch/mips/kernel/ftrace.c
new file mode 100644
index 000000000000..4c8bea1818cb
--- /dev/null
+++ b/arch/mips/kernel/ftrace.c
@@ -0,0 +1,215 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * arch/mips/kernel/ftrace.c
+ *
+ * Copyright (C) 2021 Loongson Limited Corp.
+ * Author: Huang Pei <huangpei@loongson.cn>
+ */
+
+#include <linux/ftrace.h>
+#include <linux/module.h>
+#include <linux/swab.h>
+#include <linux/uaccess.h>
+
+#include <asm/ftrace.h>
+#include <asm/asm.h>
+#include <asm/asm-offsets.h>
+#include <asm/cacheflush.h>
+#include <asm/uasm.h>
+
+
+#define INSN_NOP	0x00000000	/* nop */
+#define INSN_JALR_AT2	0x00200809 	/* jalr at, at */
+#define INSN_LI_0	0x240c0000	/* li t0, 0 */
+#define INSN_LI_1	0x240c0001	/* li t0, 1 */
+#define FTRACE_CALL_IP	((unsigned long)(&ftrace_call))
+#define JAL		0x0c000000	/* jump & link: ip --> ra, jump to target */
+#define ADDR_MASK	0x03ffffff	/*  op_code|addr : 31...26|25 ....0 */
+#define INSN_JAL(addr)	\
+	((unsigned int)(JAL | (((addr) >> 2) & ADDR_MASK)))
+
+extern void ftrace_graph_call(void);
+
+static unsigned int insn_lui __read_mostly;
+
+/* Arch override because MIPS doesn't need to run this from stop_machine() */
+void arch_ftrace_update_code(int command)
+{
+	ftrace_modify_all_code(command);
+}
+
+static int ftrace_modify_code(unsigned long ip, unsigned int new_code)
+{
+	int faulted;
+	mm_segment_t old_fs;
+
+	/* *(unsigned int *)ip = new_code; */
+	safe_store_code(new_code, ip, faulted);
+
+	if (unlikely(faulted))
+		return -EFAULT;
+
+	old_fs = get_fs();
+	set_fs(KERNEL_DS);
+	flush_icache_range(ip, ip + 8);
+	set_fs(old_fs);
+
+	return 0;
+}
+
+int ftrace_update_ftrace_func(ftrace_func_t func)
+{
+	unsigned int new;
+
+	new = INSN_JAL((unsigned long)func);
+
+	return ftrace_modify_code(FTRACE_CALL_IP, new);
+}
+
+/*
+ * enable tracing by replacing the middle nop with jalr, like
+ *
+ * lui	at, %hi(ftrace_regs_all)
+ * jalr	at, at
+ * li	t0, 0
+ */
+int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
+{
+	unsigned long ip = rec->ip;
+
+	ftrace_modify_code(ip + 4, INSN_JALR_AT2);
+	return 0;
+}
+
+/*
+ * disable recording regs by replacing
+ *
+ *  li	t0, 0
+ *
+ * with
+ *
+ *  li, t0, 1
+ *
+ * or vesa
+ */
+int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
+			unsigned long addr)
+{
+	unsigned long ip = rec->ip;
+
+	if (abs(old_addr - addr) == 4) {
+		if (addr == (unsigned long)ftrace_regs_caller)
+			return ftrace_modify_code(ip + 4, INSN_LI_0);
+
+		if (addr == (unsigned long)ftrace_caller)
+			return ftrace_modify_code(ip + 4, INSN_LI_1);
+
+	}
+
+	/* we do not support direct call or trampoline now */
+
+	return -1;
+
+}
+
+/*
+ * replace all three nop at the entry with
+ *
+ * lui	at, %hi(ftrace_regs_all)
+ * nop
+ * li	t0, 1
+ */
+
+int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
+{
+	unsigned long ip = rec->ip;
+
+	ftrace_modify_code(ip, insn_lui);
+
+	ftrace_modify_code(ip + 8, INSN_LI_1);
+	return 0;
+}
+
+
+
+/*
+ * disable tracing by replacing
+ *
+ *  jalr at, at
+ *
+ * with
+ *
+ *  nop
+ *
+ */
+
+int ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec,
+			unsigned long addr)
+
+{
+	unsigned int new = INSN_NOP;
+	unsigned long ip = rec->ip + 4;
+
+	return ftrace_modify_code(ip, new);
+}
+
+int __init ftrace_dyn_arch_init(void)
+{
+	u32 *buf;
+	int reg;
+
+	reg = 1;
+	/* lui at, %hi(ftrace_regs_all) */
+	buf = (u32*)&insn_lui;
+	uasm_i_lui(&buf, reg, uasm_rel_hi((long)ftrace_regs_caller));
+
+	return 0;
+}
+
+#ifdef CONFIG_FUNCTION_GRAPH_TRACER
+unsigned long prepare_ftrace_return(unsigned long parent, unsigned long self_ra,
+			   unsigned long fp)
+{
+	unsigned long return_hooker = (unsigned long)&return_to_handler;
+
+	if (unlikely(ftrace_graph_is_dead()))
+		goto out;
+
+	if (unlikely(atomic_read(&current->tracing_graph_pause)))
+		goto out;
+
+	self_ra -=  8;
+	if (!function_graph_enter(parent, self_ra, fp, NULL))
+		parent = return_hooker;
+out:
+	return parent;
+}
+
+/*
+ * Turn on/off the call to ftrace_graph_caller() in ftrace_caller()
+ * depending on @enable.
+ */
+static int ftrace_modify_graph_caller(bool enable)
+{
+	unsigned long pc = (unsigned long)ftrace_graph_call;
+	unsigned new;
+
+	if (enable)
+		new = INSN_JAL((unsigned long)ftrace_graph_caller);
+	else
+		new = INSN_NOP;
+
+	return ftrace_modify_code(pc, new);
+}
+
+int ftrace_enable_ftrace_graph_caller(void)
+{
+	return ftrace_modify_graph_caller(true);
+}
+
+int ftrace_disable_ftrace_graph_caller(void)
+{
+	return ftrace_modify_graph_caller(false);
+}
+
+#endif /* CONFIG_FUNCTION_GRAPH_TRACER */
-- 
2.17.1

