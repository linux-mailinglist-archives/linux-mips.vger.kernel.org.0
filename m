Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17D5F309B1F
	for <lists+linux-mips@lfdr.de>; Sun, 31 Jan 2021 09:18:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbhAaIQE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 31 Jan 2021 03:16:04 -0500
Received: from mail.loongson.cn ([114.242.206.163]:57094 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229977AbhAaIPt (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 31 Jan 2021 03:15:49 -0500
Received: from loongson.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz_PvZhZg1dIAAA--.880S3;
        Sun, 31 Jan 2021 16:14:40 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>
Cc:     Wu Zhangjin <wuzhangjin@gmail.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: [PATCH 2/3] MIPS: ftrace: Combine ftrace_modify_code* into one function
Date:   Sun, 31 Jan 2021 16:14:37 +0800
Message-Id: <1612080878-5426-2-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1612080878-5426-1-git-send-email-hejinyang@loongson.cn>
References: <1612080878-5426-1-git-send-email-hejinyang@loongson.cn>
X-CM-TRANSID: AQAAf9Dxz_PvZhZg1dIAAA--.880S3
X-Coremail-Antispam: 1UD129KBjvJXoW3XryxAr4rXr1rCFWfXr1xuFg_yoW3AF4rpr
        W3KasxKrWxuF4qkay09ryDJF9xA34DJa4UKrsrt3yYy3WDJFn8ZFyS9rn8try8ta4vgFW3
        ZrW5Ar47G3WDXaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBv14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
        ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
        M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
        v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
        F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8ZwCF04
        k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
        MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr4
        1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
        IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
        A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU4CJQUUUUU=
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Behavior of ftrace_modify_code_2r() is similar to ftrace_modify_code_2(),
just the order of modification changed. Add a new struct ftrace_insn
to combine ftrace_modify_code with above two functions. The function is
same with the original ftrace_modify_code when ftrace_insn.code[1]
is DONT_SET.

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/mips/include/asm/ftrace.h |   3 +
 arch/mips/kernel/ftrace.c      | 157 +++++++++++++++++------------------------
 2 files changed, 68 insertions(+), 92 deletions(-)

diff --git a/arch/mips/include/asm/ftrace.h b/arch/mips/include/asm/ftrace.h
index b463f2a..636c640 100644
--- a/arch/mips/include/asm/ftrace.h
+++ b/arch/mips/include/asm/ftrace.h
@@ -84,6 +84,9 @@ static inline unsigned long ftrace_call_adjust(unsigned long addr)
 struct dyn_arch_ftrace {
 };
 
+struct ftrace_insn {
+	unsigned int code[2];
+};
 #endif /*  CONFIG_DYNAMIC_FTRACE */
 #endif /* __ASSEMBLY__ */
 #endif /* CONFIG_FUNCTION_TRACER */
diff --git a/arch/mips/kernel/ftrace.c b/arch/mips/kernel/ftrace.c
index f57e68f..fd6d1da 100644
--- a/arch/mips/kernel/ftrace.c
+++ b/arch/mips/kernel/ftrace.c
@@ -44,89 +44,70 @@ void arch_ftrace_update_code(int command)
 #define INSN_NOP 0x00000000	/* nop */
 #define INSN_JAL(addr)	\
 	((unsigned int)(JAL | (((addr) >> 2) & ADDR_MASK)))
+#define INSN_B_1F (0x10000000 | MCOUNT_OFFSET_INSNS)
+
+#define DONT_SET 0xffffffff
+
+static struct ftrace_insn jal_ftrace_caller __read_mostly;
+static struct ftrace_insn la_mcount __read_mostly;
+static struct ftrace_insn nop_kernel __read_mostly;
+static struct ftrace_insn nop_module __read_mostly;
 
-static unsigned int insn_jal_ftrace_caller __read_mostly;
-static unsigned int insn_la_mcount[2] __read_mostly;
-static unsigned int insn_j_ftrace_graph_caller __maybe_unused __read_mostly;
+#ifdef CONFIG_FUNCTION_GRAPH_TRACER
+static struct ftrace_insn j_ftrace_graph_caller __read_mostly;
+#endif
 
 static inline void ftrace_dyn_arch_init_insns(void)
 {
 	u32 *buf;
-	unsigned int v1;
+	unsigned int v1 = 3;
 
 	/* la v1, _mcount */
-	v1 = 3;
-	buf = (u32 *)&insn_la_mcount[0];
+	buf = (u32 *)&la_mcount;
 	UASM_i_LA(&buf, v1, MCOUNT_ADDR);
+#ifdef CONFIG_64BIT
+	la_mcount.code[1] = DONT_SET;
+#endif
 
 	/* jal (ftrace_caller + 8), jump over the first two instruction */
-	buf = (u32 *)&insn_jal_ftrace_caller;
+	buf = (u32 *)&jal_ftrace_caller;
 	uasm_i_jal(&buf, (FTRACE_ADDR + 8) & JUMP_RANGE_MASK);
+	jal_ftrace_caller.code[1] = DONT_SET;
+
+	nop_kernel.code[0] = INSN_NOP;
+	nop_module.code[0] = INSN_B_1F;
+
+#ifdef CONFIG_64BIT
+	nop_kernel.code[1] = DONT_SET;
+	nop_module.code[1] = DONT_SET;
+#else
+	nop_kernel.code[1] = INSN_NOP;
+	nop_module.code[1] = INSN_NOP;
+#endif
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 	/* j ftrace_graph_caller */
-	buf = (u32 *)&insn_j_ftrace_graph_caller;
+	buf = (u32 *)&j_ftrace_graph_caller;
 	uasm_i_j(&buf, (unsigned long)ftrace_graph_caller & JUMP_RANGE_MASK);
+	j_ftrace_graph_caller.code[1] = DONT_SET;
 #endif
 }
 
-static int ftrace_modify_code(unsigned long ip, unsigned int new_code)
-{
-	int faulted;
-	mm_segment_t old_fs;
-
-	/* *(unsigned int *)ip = new_code; */
-	safe_store_code(new_code, ip, faulted);
-
-	if (unlikely(faulted))
-		return -EFAULT;
-
-	old_fs = get_fs();
-	set_fs(KERNEL_DS);
-	flush_icache_range(ip, ip + 8);
-	set_fs(old_fs);
-
-	return 0;
-}
-
-#ifndef CONFIG_64BIT
-static int ftrace_modify_code_2(unsigned long ip, unsigned int new_code1,
-				unsigned int new_code2)
-{
-	int faulted;
-	mm_segment_t old_fs;
-
-	safe_store_code(new_code1, ip, faulted);
-	if (unlikely(faulted))
-		return -EFAULT;
-
-	ip += 4;
-	safe_store_code(new_code2, ip, faulted);
-	if (unlikely(faulted))
-		return -EFAULT;
-
-	ip -= 4;
-	old_fs = get_fs();
-	set_fs(KERNEL_DS);
-	flush_icache_range(ip, ip + 8);
-	set_fs(old_fs);
-
-	return 0;
-}
-
-static int ftrace_modify_code_2r(unsigned long ip, unsigned int new_code1,
-				 unsigned int new_code2)
+static int ftrace_modify_code(unsigned long ip, struct ftrace_insn insns)
 {
 	int faulted;
 	mm_segment_t old_fs;
 
-	ip += 4;
-	safe_store_code(new_code2, ip, faulted);
-	if (unlikely(faulted))
-		return -EFAULT;
+	if (insns.code[1] != DONT_SET) {
+		ip += 4;
+		safe_store_code(insns.code[1], ip, faulted);
+		if (unlikely(faulted))
+			return -EFAULT;
+		ip -= 4;
+	}
 
-	ip -= 4;
-	safe_store_code(new_code1, ip, faulted);
+	/* *(unsigned int *)ip = insns.code[0]; */
+	safe_store_code(insns.code[0], ip, faulted);
 	if (unlikely(faulted))
 		return -EFAULT;
 
@@ -137,7 +118,6 @@ static int ftrace_modify_code_2r(unsigned long ip, unsigned int new_code1,
 
 	return 0;
 }
-#endif
 
 /*
  * The details about the calling site of mcount on MIPS
@@ -169,66 +149,55 @@ static int ftrace_modify_code_2r(unsigned long ip, unsigned int new_code1,
  *				    1: offset = 4 instructions
  */
 
-#define INSN_B_1F (0x10000000 | MCOUNT_OFFSET_INSNS)
-
 int ftrace_make_nop(struct module *mod,
 		    struct dyn_ftrace *rec, unsigned long addr)
 {
-	unsigned int new;
+	struct ftrace_insn insns;
 	unsigned long ip = rec->ip;
 
 	/*
 	 * If ip is in kernel space, no long call, otherwise, long call is
 	 * needed.
 	 */
-	new = core_kernel_text(ip) ? INSN_NOP : INSN_B_1F;
-#ifdef CONFIG_64BIT
-	return ftrace_modify_code(ip, new);
-#else
-	/*
-	 * On 32 bit MIPS platforms, gcc adds a stack adjust
-	 * instruction in the delay slot after the branch to
-	 * mcount and expects mcount to restore the sp on return.
-	 * This is based on a legacy API and does nothing but
-	 * waste instructions so it's being removed at runtime.
-	 */
-	return ftrace_modify_code_2(ip, new, INSN_NOP);
-#endif
+	insns = core_kernel_text(ip) ? nop_kernel : nop_module;
+
+	return ftrace_modify_code(ip, insns);
 }
 
 int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
 {
-	unsigned int new;
+	struct ftrace_insn insns;
 	unsigned long ip = rec->ip;
 
-	new = core_kernel_text(ip) ? insn_jal_ftrace_caller : insn_la_mcount[0];
+	insns = core_kernel_text(ip) ? jal_ftrace_caller : la_mcount;
 
-#ifdef CONFIG_64BIT
-	return ftrace_modify_code(ip, new);
-#else
-	return ftrace_modify_code_2r(ip, new, core_kernel_text(ip) ?
-						INSN_NOP : insn_la_mcount[1]);
-#endif
+	return ftrace_modify_code(ip, insns);
 }
 
 #define FTRACE_CALL_IP ((unsigned long)(&ftrace_call))
 
 int ftrace_update_ftrace_func(ftrace_func_t func)
 {
-	unsigned int new;
+	struct ftrace_insn insns;
 
-	new = INSN_JAL((unsigned long)func);
+	insns.code[0] = INSN_JAL((unsigned long)func);
+	insns.code[1] = DONT_SET;
 
-	return ftrace_modify_code(FTRACE_CALL_IP, new);
+	return ftrace_modify_code(FTRACE_CALL_IP, insns);
 }
 
 int __init ftrace_dyn_arch_init(void)
 {
+	struct ftrace_insn insns;
+
+	insns.code[0] = INSN_NOP;
+	insns.code[1] = DONT_SET;
+
 	/* Encode the instructions when booting */
 	ftrace_dyn_arch_init_insns();
 
 	/* Remove "b ftrace_stub" to ensure ftrace_caller() is executed */
-	ftrace_modify_code(MCOUNT_ADDR, INSN_NOP);
+	ftrace_modify_code(MCOUNT_ADDR, insns);
 
 	return 0;
 }
@@ -243,13 +212,17 @@ extern void ftrace_graph_call(void);
 
 int ftrace_enable_ftrace_graph_caller(void)
 {
-	return ftrace_modify_code(FTRACE_GRAPH_CALL_IP,
-			insn_j_ftrace_graph_caller);
+	return ftrace_modify_code(FTRACE_GRAPH_CALL_IP, j_ftrace_graph_caller);
 }
 
 int ftrace_disable_ftrace_graph_caller(void)
 {
-	return ftrace_modify_code(FTRACE_GRAPH_CALL_IP, INSN_NOP);
+	struct ftrace_insn insns;
+
+	insns.code[0] = INSN_NOP;
+	insns.code[1] = DONT_SET;
+
+	return ftrace_modify_code(FTRACE_GRAPH_CALL_IP, insns);
 }
 
 #endif	/* CONFIG_DYNAMIC_FTRACE */
-- 
2.1.0

