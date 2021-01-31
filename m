Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1EFF309B18
	for <lists+linux-mips@lfdr.de>; Sun, 31 Jan 2021 09:16:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230043AbhAaIPt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 31 Jan 2021 03:15:49 -0500
Received: from mail.loongson.cn ([114.242.206.163]:57058 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230027AbhAaIPs (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 31 Jan 2021 03:15:48 -0500
Received: from loongson.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz_PvZhZg1dIAAA--.880S4;
        Sun, 31 Jan 2021 16:14:40 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>
Cc:     Wu Zhangjin <wuzhangjin@gmail.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: [PATCH 3/3] MIPS: ftrace: Add DYNAMIC_FTRACE_WITH_REGS support
Date:   Sun, 31 Jan 2021 16:14:38 +0800
Message-Id: <1612080878-5426-3-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1612080878-5426-1-git-send-email-hejinyang@loongson.cn>
References: <1612080878-5426-1-git-send-email-hejinyang@loongson.cn>
X-CM-TRANSID: AQAAf9Dxz_PvZhZg1dIAAA--.880S4
X-Coremail-Antispam: 1UD129KBjvAXoW3KryUXFW7XrW5Cr1xAFW5Jrb_yoW8JrW7Zo
        WrCwnFqrs5Aa4Ivan5uayUKrWYqFn8KF15Ja4Fkr45Wa1UKry2gF1aka1ktw15Xrn8CFWf
        ZFyUXF48JF1vyryDn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUUYK7AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20EY4v20xva
        j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r15M28IrcIa0x
        kI8VCY1x0267AKxVW8JVW5JwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84AC
        jcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM2
        8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4U
        JwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
        IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
        M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GFyl42
        xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
        GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI4
        8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4U
        MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
        8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUj5rcDUUUU
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In the past, we have always used the address of _mcount as the address of
ftrace_caller. It reduces one ftrace_modify_code operation when do ftrace
on modules on 64Bit platform in this way. In order to provide
DYNAMIC_FTRACE_WITH_REGS, we have to take _mcount out of ftrace_caller and
add a new definition of _mcount. It is necessary to modify 2 instructions.
Also add the definition of ftrace_regs_caller. ftrace_regs_caller will
store and restore more registers. Of course, some functions in ftrace.c
also need to consider ftrace_regs_caller. Modify these functions and add
the related code of ftrace_regs_caller.

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/mips/Kconfig              |   1 +
 arch/mips/include/asm/ftrace.h |   5 ++
 arch/mips/kernel/ftrace.c      | 159 ++++++++++++++++++++++++++++-------------
 arch/mips/kernel/mcount.S      | 137 +++++++++++++++++++++++++++++------
 4 files changed, 229 insertions(+), 73 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 62475fc..00d36dd 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -58,6 +58,7 @@ config MIPS
 	select HAVE_DEBUG_STACKOVERFLOW
 	select HAVE_DMA_CONTIGUOUS
 	select HAVE_DYNAMIC_FTRACE
+	select HAVE_DYNAMIC_FTRACE_WITH_REGS
 	select HAVE_EBPF_JIT if 64BIT && !CPU_MICROMIPS && TARGET_ISA_REV >= 2
 	select HAVE_EXIT_THREAD
 	select HAVE_FAST_GUP
diff --git a/arch/mips/include/asm/ftrace.h b/arch/mips/include/asm/ftrace.h
index 636c640..8afd1bc 100644
--- a/arch/mips/include/asm/ftrace.h
+++ b/arch/mips/include/asm/ftrace.h
@@ -76,6 +76,11 @@ do {						\
 
 
 #ifdef CONFIG_DYNAMIC_FTRACE
+
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
+#define ARCH_SUPPORTS_FTRACE_OPS 1
+#endif
+
 static inline unsigned long ftrace_call_adjust(unsigned long addr)
 {
 	return addr;
diff --git a/arch/mips/kernel/ftrace.c b/arch/mips/kernel/ftrace.c
index fd6d1da..890429a 100644
--- a/arch/mips/kernel/ftrace.c
+++ b/arch/mips/kernel/ftrace.c
@@ -49,40 +49,89 @@ void arch_ftrace_update_code(int command)
 #define DONT_SET 0xffffffff
 
 static struct ftrace_insn jal_ftrace_caller __read_mostly;
-static struct ftrace_insn la_mcount __read_mostly;
+static struct ftrace_insn la_ftrace_caller __read_mostly;
 static struct ftrace_insn nop_kernel __read_mostly;
 static struct ftrace_insn nop_module __read_mostly;
 
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
+static struct ftrace_insn jal_ftrace_regs_caller __read_mostly;
+static struct ftrace_insn la_ftrace_regs_caller __read_mostly;
+#endif
+
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 static struct ftrace_insn j_ftrace_graph_caller __read_mostly;
 #endif
 
+/*
+ * The details about the calling site of mcount on MIPS
+ *
+ * 1. For kernel:
+ *
+ * move at, ra
+ * jal _mcount		--> nop
+ *  sub sp, sp, 8	--> nop  (CONFIG_32BIT)
+ *
+ * 2. For modules:
+ *
+ * 2.1 For KBUILD_MCOUNT_RA_ADDRESS and CONFIG_32BIT
+ *
+ * lui v1, hi_16bit_of_mcount	     --> b 1f (0x10000005)
+ * addiu v1, v1, low_16bit_of_mcount --> nop  (CONFIG_32BIT)
+ * move at, ra
+ * move $12, ra_address
+ * jalr v1
+ *  sub sp, sp, 8
+ *				    1: offset = 5 instructions
+ * 2.2 For the Other situations
+ *
+ * lui v1, hi_16bit_of_mcount	     --> b 1f (0x10000004)
+ * addiu v1, v1, low_16bit_of_mcount --> nop  (CONFIG_32BIT)
+ * move at, ra
+ * jalr v1
+ *  nop | move $12, ra_address | sub sp, sp, 8
+ *				    1: offset = 4 instructions
+ */
+
 static inline void ftrace_dyn_arch_init_insns(void)
 {
 	u32 *buf;
 	unsigned int v1 = 3;
 
-	/* la v1, _mcount */
-	buf = (u32 *)&la_mcount;
-	UASM_i_LA(&buf, v1, MCOUNT_ADDR);
-#ifdef CONFIG_64BIT
-	la_mcount.code[1] = DONT_SET;
-#endif
+	/* la v1, ftrace_caller */
+	buf = (u32 *)&la_ftrace_caller;
+	UASM_i_LA(&buf, v1, FTRACE_ADDR);
 
-	/* jal (ftrace_caller + 8), jump over the first two instruction */
 	buf = (u32 *)&jal_ftrace_caller;
-	uasm_i_jal(&buf, (FTRACE_ADDR + 8) & JUMP_RANGE_MASK);
+#ifdef CONFIG_32BIT
+	/* jal (ftrace_caller + 4), jump over the sp restore instruction */
+	uasm_i_jal(&buf, (FTRACE_ADDR + 4) & JUMP_RANGE_MASK);
+#else
+	uasm_i_jal(&buf, FTRACE_ADDR & JUMP_RANGE_MASK);
+#endif
 	jal_ftrace_caller.code[1] = DONT_SET;
 
 	nop_kernel.code[0] = INSN_NOP;
-	nop_module.code[0] = INSN_B_1F;
-
 #ifdef CONFIG_64BIT
 	nop_kernel.code[1] = DONT_SET;
-	nop_module.code[1] = DONT_SET;
 #else
 	nop_kernel.code[1] = INSN_NOP;
+#endif
+	nop_module.code[0] = INSN_B_1F;
 	nop_module.code[1] = INSN_NOP;
+
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
+	/* la v1, ftrace_regs_caller */
+	buf = (u32 *)&la_ftrace_regs_caller;
+	UASM_i_LA(&buf, v1, FTRACE_REGS_ADDR);
+
+	/* jal ftrace_regs_caller */
+	buf = (u32 *)&jal_ftrace_regs_caller;
+#ifdef CONFIG_32BIT
+	uasm_i_jal(&buf, (FTRACE_REGS_ADDR + 4) & JUMP_RANGE_MASK);
+#else
+	uasm_i_jal(&buf, FTRACE_REGS_ADDR & JUMP_RANGE_MASK);
+#endif
+	jal_ftrace_regs_caller.code[1] = DONT_SET;
 #endif
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
@@ -119,36 +168,6 @@ static int ftrace_modify_code(unsigned long ip, struct ftrace_insn insns)
 	return 0;
 }
 
-/*
- * The details about the calling site of mcount on MIPS
- *
- * 1. For kernel:
- *
- * move at, ra
- * jal _mcount		--> nop
- *  sub sp, sp, 8	--> nop  (CONFIG_32BIT)
- *
- * 2. For modules:
- *
- * 2.1 For KBUILD_MCOUNT_RA_ADDRESS and CONFIG_32BIT
- *
- * lui v1, hi_16bit_of_mcount	     --> b 1f (0x10000005)
- * addiu v1, v1, low_16bit_of_mcount --> nop  (CONFIG_32BIT)
- * move at, ra
- * move $12, ra_address
- * jalr v1
- *  sub sp, sp, 8
- *				    1: offset = 5 instructions
- * 2.2 For the Other situations
- *
- * lui v1, hi_16bit_of_mcount	     --> b 1f (0x10000004)
- * addiu v1, v1, low_16bit_of_mcount --> nop  (CONFIG_32BIT)
- * move at, ra
- * jalr v1
- *  nop | move $12, ra_address | sub sp, sp, 8
- *				    1: offset = 4 instructions
- */
-
 int ftrace_make_nop(struct module *mod,
 		    struct dyn_ftrace *rec, unsigned long addr)
 {
@@ -164,41 +183,79 @@ int ftrace_make_nop(struct module *mod,
 	return ftrace_modify_code(ip, insns);
 }
 
+static int __ftrace_make_call(unsigned long ip, unsigned long addr)
+{
+	u32 *buf;
+	struct ftrace_insn insns;
+	unsigned int v1 = 3;
+
+	if (core_kernel_text(ip)) {
+		/* PC-region */
+		if ((addr & ~JUMP_RANGE_MASK) != (ip & ~JUMP_RANGE_MASK))
+			return -EINVAL;
+
+		insns.code[0] = INSN_JAL(addr);
+		insns.code[1] = DONT_SET;
+	} else {
+		buf = (u32 *)&insns;
+		UASM_i_LA(&buf, v1, addr);
+	}
+
+	return ftrace_modify_code(ip, insns);
+}
+
 int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 {
 	struct ftrace_insn insns;
 	unsigned long ip = rec->ip;
 
-	insns = core_kernel_text(ip) ? jal_ftrace_caller : la_mcount;
+	if (addr == FTRACE_ADDR)
+		insns = core_kernel_text(ip) ? jal_ftrace_caller : la_ftrace_caller;
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
+	else if (addr == FTRACE_REGS_ADDR)
+		insns = core_kernel_text(ip) ? jal_ftrace_regs_caller : la_ftrace_regs_caller;
+#endif
+	else
+		return __ftrace_make_call(ip, addr);
 
 	return ftrace_modify_code(ip, insns);
 }
 
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
+int ftrace_modify_call(struct dyn_ftrace *rec, unsigned long old_addr,
+			unsigned long addr)
+{
+	unsigned long ip = rec->ip;
+
+	return __ftrace_make_call(ip, addr);
+}
+#endif
+
 #define FTRACE_CALL_IP ((unsigned long)(&ftrace_call))
 
 int ftrace_update_ftrace_func(ftrace_func_t func)
 {
+	int faulted;
 	struct ftrace_insn insns;
 
 	insns.code[0] = INSN_JAL((unsigned long)func);
 	insns.code[1] = DONT_SET;
 
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
+#define FTRACE_REGS_CALL_IP ((unsigned long)(&ftrace_regs_call))
+	faulted = ftrace_modify_code(FTRACE_REGS_CALL_IP, insns);
+	if (unlikely(faulted))
+		return -EFAULT;
+#endif
+
 	return ftrace_modify_code(FTRACE_CALL_IP, insns);
 }
 
 int __init ftrace_dyn_arch_init(void)
 {
-	struct ftrace_insn insns;
-
-	insns.code[0] = INSN_NOP;
-	insns.code[1] = DONT_SET;
-
 	/* Encode the instructions when booting */
 	ftrace_dyn_arch_init_insns();
 
-	/* Remove "b ftrace_stub" to ensure ftrace_caller() is executed */
-	ftrace_modify_code(MCOUNT_ADDR, insns);
-
 	return 0;
 }
 #endif	/* CONFIG_DYNAMIC_FTRACE */
diff --git a/arch/mips/kernel/mcount.S b/arch/mips/kernel/mcount.S
index 808257a..2c9c061 100644
--- a/arch/mips/kernel/mcount.S
+++ b/arch/mips/kernel/mcount.S
@@ -51,11 +51,83 @@
 	PTR_ADDIU	sp, PT_SIZE
 	.endm
 
+	.macro MCOUNT_SAVE_MORE_REGS
+	PTR_SUBU	sp, PT_SIZE
+	PTR_S	ra, PT_R31(sp)
+	PTR_S	AT, PT_R1(sp)
+	PTR_S	a0, PT_R4(sp)
+	PTR_S	a1, PT_R5(sp)
+	PTR_S	a2, PT_R6(sp)
+	PTR_S	a3, PT_R7(sp)
+#if _MIPS_SIM == _MIPS_SIM_ABI64 || _MIPS_SIM == _MIPS_SIM_NABI32
+	PTR_S	a4, PT_R8(sp)
+	PTR_S	a5, PT_R9(sp)
+	PTR_S	a6, PT_R10(sp)
+	PTR_S	a7, PT_R11(sp)
+#endif
+	PTR_S	s0, PT_R16(sp)
+	PTR_S	s1, PT_R17(sp)
+	PTR_S	s2, PT_R18(sp)
+	PTR_S	s3, PT_R19(sp)
+	PTR_S	s4, PT_R20(sp)
+	PTR_S	s5, PT_R21(sp)
+	PTR_S	s6, PT_R22(sp)
+	PTR_S	s7, PT_R23(sp)
+	PTR_S	gp, PT_R28(sp)
+	PTR_S	sp, PT_R29(sp)
+	PTR_S	s8, PT_R30(sp)
+	.endm
+
+	.macro MCOUNT_RESTORE_MORE_REGS
+	PTR_L	ra, PT_R31(sp)
+	PTR_L	AT, PT_R1(sp)
+	PTR_L	v0, PT_R2(sp)
+	PTR_L	v1, PT_R3(sp)
+	PTR_L	a0, PT_R4(sp)
+	PTR_L	a1, PT_R5(sp)
+	PTR_L	a2, PT_R6(sp)
+	PTR_L	a3, PT_R7(sp)
+#if _MIPS_SIM == _MIPS_SIM_ABI64 || _MIPS_SIM == _MIPS_SIM_NABI32
+	PTR_L	a4, PT_R8(sp)
+	PTR_L	a5, PT_R9(sp)
+	PTR_L	a6, PT_R10(sp)
+	PTR_L	a7, PT_R11(sp)
+#endif
+	PTR_L	s0, PT_R16(sp)
+	PTR_L	s1, PT_R17(sp)
+	PTR_L	s2, PT_R18(sp)
+	PTR_L	s3, PT_R19(sp)
+	PTR_L	s4, PT_R20(sp)
+	PTR_L	s5, PT_R21(sp)
+	PTR_L	s6, PT_R22(sp)
+	PTR_L	s7, PT_R23(sp)
+	PTR_L	gp, PT_R28(sp)
+	PTR_L	sp, PT_R29(sp)
+	PTR_L	s8, PT_R30(sp)
+	PTR_ADDIU	sp, PT_SIZE
+	.endm
+
 	.macro RETURN_BACK
 	jr ra
 	 move ra, AT
 	.endm
 
+	.macro is_in_module addr res temp1 temp2
+	PTR_LA   \res, _stext
+	sltu     \temp1, \addr, \res	/* temp1 = (addr < _stext) */
+	PTR_LA   \res, _etext
+	sltu     \temp2, \res, \addr	/* temp2 = (addr > _etext) */
+	or       \res, \temp1, \temp2
+	.endm
+
+	.macro adjust_module_callsite addr
+#if defined(KBUILD_MCOUNT_RA_ADDRESS) && defined(CONFIG_32BIT)
+	PTR_SUBU \addr, \addr, 16	/* arg1: adjust to module's recorded callsite */
+#else
+	PTR_SUBU \addr, \addr, 12
+#endif
+	.endm
+
 /*
  * The -mmcount-ra-address option of gcc 4.5 uses register $12 to pass
  * the location of the parent's return address.
@@ -64,55 +136,76 @@
 
 #ifdef CONFIG_DYNAMIC_FTRACE
 
-NESTED(ftrace_caller, PT_SIZE, ra)
-	.globl _mcount
-_mcount:
+NESTED(_mcount, PT_SIZE, ra)
 EXPORT_SYMBOL(_mcount)
-	b	ftrace_stub
+#ifdef CONFIG_32BIT
+	addiu sp, sp, 8
+#endif
+	.globl ftrace_stub
+ftrace_stub:
+	RETURN_BACK
+	END(_mcount)
+
+NESTED(ftrace_caller, PT_SIZE, ra)
 #ifdef CONFIG_32BIT
 	 addiu sp,sp,8
-#else
-	 nop
 #endif
 
-	/* When tracing is activated, it calls ftrace_caller+8 (aka here) */
 	MCOUNT_SAVE_REGS
 #ifdef KBUILD_MCOUNT_RA_ADDRESS
 	PTR_S	MCOUNT_RA_ADDRESS_REG, PT_R12(sp)
 #endif
 
 	PTR_SUBU a0, ra, 8	/* arg1: self address */
-	PTR_LA   t1, _stext
-	sltu     t2, a0, t1	/* t2 = (a0 < _stext) */
-	PTR_LA   t1, _etext
-	sltu     t3, t1, a0	/* t3 = (a0 > _etext) */
-	or       t1, t2, t3
+	is_in_module a0, t1, t8, t9
 	beqz     t1, ftrace_call
-	 nop
-#if defined(KBUILD_MCOUNT_RA_ADDRESS) && defined(CONFIG_32BIT)
-	PTR_SUBU a0, a0, 16	/* arg1: adjust to module's recorded callsite */
-#else
-	PTR_SUBU a0, a0, 12
-#endif
+	nop
+	adjust_module_callsite a0
 
 	.globl ftrace_call
 ftrace_call:
 	nop	/* a placeholder for the call to a real tracing function */
-	 move	a1, AT		/* arg2: parent's return address */
+	move	a1, AT		/* arg2: parent's return address */
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 	.globl ftrace_graph_call
 ftrace_graph_call:
 	nop
-	 nop
+	nop
 #endif
 
 	MCOUNT_RESTORE_REGS
-	.globl ftrace_stub
-ftrace_stub:
 	RETURN_BACK
 	END(ftrace_caller)
 
+#ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
+NESTED(ftrace_regs_caller, PT_SIZE, ra)
+#ifdef CONFIG_32BIT
+	addiu sp, sp, 8
+#endif
+	MCOUNT_SAVE_MORE_REGS
+#ifdef KBUILD_MCOUNT_RA_ADDRESS
+	PTR_S	MCOUNT_RA_ADDRESS_REG, PT_R12(sp)
+#endif
+
+	move     a2, zero		/* arg3: NULL */
+	move     a3, sp         /* arg4: fregs address */
+	PTR_SUBU a0, ra, 8		/* arg1: self address */
+	is_in_module a0, t1, t8, t9
+	beqz     t1, ftrace_regs_call
+	nop
+	adjust_module_callsite a0
+
+	.globl ftrace_regs_call
+ftrace_regs_call:
+	nop
+	move	a1, AT			/* arg2: parent's return address */
+
+	MCOUNT_RESTORE_REGS
+	RETURN_BACK
+	END(ftrace_regs_caller)
+#endif /* CONFIG_DYNAMIC_FTRACE_WITH_REGS */
+
 #else	/* ! CONFIG_DYNAMIC_FTRACE */
 
 NESTED(_mcount, PT_SIZE, ra)
-- 
2.1.0

