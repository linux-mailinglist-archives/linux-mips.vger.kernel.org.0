Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2497031304D
	for <lists+linux-mips@lfdr.de>; Mon,  8 Feb 2021 12:12:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232347AbhBHLLz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Feb 2021 06:11:55 -0500
Received: from mail.loongson.cn ([114.242.206.163]:57476 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233101AbhBHLIX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 8 Feb 2021 06:08:23 -0500
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxadVxGyFgpzUIAA--.10612S2;
        Mon, 08 Feb 2021 19:07:30 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Oleg Nesterov <oleg@redhat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Xingxing Su <suxingxing@loongson.cn>
Subject: [PATCH] MIPS: Add basic support for ptrace single step
Date:   Mon,  8 Feb 2021 19:07:27 +0800
Message-Id: <1612782447-3728-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9AxadVxGyFgpzUIAA--.10612S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtryDWFWkWr45JFWrtw47Arb_yoW3urW3pa
        yxC34DKrWUGw1F9FZ3Xws5ZF13Jws5Wa43Cryft3yFkan5JF1rXF1xKFy5Aw45ArWvga4a
        krZ0qF15WFsxAaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkq14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_Gw4l
        42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
        WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAK
        I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
        4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
        0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUUAhltUUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In the current code, arch_has_single_step() is not defined on MIPS,
that means MIPS does not support instruction single-step for user mode.

Delve is a debugger for the Go programming language, the ptrace syscall
PtraceSingleStep() failed [1] on MIPS and then the single step function
can not work well, we can see that PtraceSingleStep() definition returns
ptrace(PTRACE_SINGLESTEP) [2].

So it is necessary to support ptrace single step on MIPS.

At the beginning, we try to use the Debug Single Step exception on the
Loongson 3A4000 platform, but it has no effect when set CP0_DEBUG SSt
bit, this is because CP0_DEBUG NoSSt bit is 1 which indicates no
single-step feature available [3], so this way which is dependent on the
hardware is almost impossible.

With further research, we find out there exists a common way used with
break instruction in arch/alpha/kernel/ptrace.c, it is workable.

For the above analysis, define arch_has_single_step(), add the common
function user_enable_single_step() and user_disable_single_step(), set
flag TIF_SINGLESTEP for child process, use break instruction to set
breakpoint.

We can use the following testcase to test it:
tools/testing/selftests/breakpoints/step_after_suspend_test.c

 $ make -C tools/testing/selftests TARGETS=breakpoints
 $ cd tools/testing/selftests/breakpoints

Without this patch:

 $ ./step_after_suspend_test -n
 TAP version 13
 1..4
 # ptrace(PTRACE_SINGLESTEP) not supported on this architecture: Input/output error
 ok 1 # SKIP CPU 0
 # ptrace(PTRACE_SINGLESTEP) not supported on this architecture: Input/output error
 ok 2 # SKIP CPU 1
 # ptrace(PTRACE_SINGLESTEP) not supported on this architecture: Input/output error
 ok 3 # SKIP CPU 2
 # ptrace(PTRACE_SINGLESTEP) not supported on this architecture: Input/output error
 ok 4 # SKIP CPU 3
 # Totals: pass:0 fail:0 xfail:0 xpass:0 skip:4 error:0

With this patch:

 $ ./step_after_suspend_test -n
 TAP version 13
 1..4
 ok 1 CPU 0
 ok 2 CPU 1
 ok 3 CPU 2
 ok 4 CPU 3
 # Totals: pass:4 fail:0 xfail:0 xpass:0 skip:0 error:0

[1] https://github.com/go-delve/delve/blob/master/pkg/proc/native/threads_linux.go#L50
[2] https://github.com/go-delve/delve/blob/master/vendor/golang.org/x/sys/unix/syscall_linux.go#L1573
[3] http://www.t-es-t.hu/download/mips/md00047f.pdf

Reported-by: Guoqi Chen <chenguoqi@loongson.cn>
Signed-off-by: Xingxing Su <suxingxing@loongson.cn>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/include/asm/ptrace.h      |   2 +
 arch/mips/include/asm/thread_info.h |   5 ++
 arch/mips/kernel/ptrace.c           | 108 ++++++++++++++++++++++++++++++++++++
 arch/mips/kernel/signal.c           |   2 +-
 4 files changed, 116 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/ptrace.h b/arch/mips/include/asm/ptrace.h
index daf3cf2..c733daef 100644
--- a/arch/mips/include/asm/ptrace.h
+++ b/arch/mips/include/asm/ptrace.h
@@ -186,4 +186,6 @@ static inline void user_stack_pointer_set(struct pt_regs *regs,
 	regs->regs[29] = val;
 }
 
+#define arch_has_single_step()	(1)
+
 #endif /* _ASM_PTRACE_H */
diff --git a/arch/mips/include/asm/thread_info.h b/arch/mips/include/asm/thread_info.h
index e2c352d..bd4dbb5 100644
--- a/arch/mips/include/asm/thread_info.h
+++ b/arch/mips/include/asm/thread_info.h
@@ -35,6 +35,10 @@ struct thread_info {
 						 */
 	struct pt_regs		*regs;
 	long			syscall;	/* syscall number */
+
+	int bpt_nsaved;
+	unsigned long bpt_addr[1];		/* breakpoint handling */
+	unsigned int bpt_insn[1];
 };
 
 /*
@@ -117,6 +121,7 @@ static inline struct thread_info *current_thread_info(void)
 #define TIF_UPROBE		6	/* breakpointed or singlestepping */
 #define TIF_NOTIFY_SIGNAL	7	/* signal notifications exist */
 #define TIF_RESTORE_SIGMASK	9	/* restore signal mask in do_signal() */
+#define TIF_SINGLESTEP		10	/* restore singlestep on return to user mode */
 #define TIF_USEDFPU		16	/* FPU was used by this task this quantum (SMP) */
 #define TIF_MEMDIE		18	/* is terminating due to OOM killer */
 #define TIF_NOHZ		19	/* in adaptive nohz mode */
diff --git a/arch/mips/kernel/ptrace.c b/arch/mips/kernel/ptrace.c
index db7c5be..1c06523 100644
--- a/arch/mips/kernel/ptrace.c
+++ b/arch/mips/kernel/ptrace.c
@@ -45,10 +45,15 @@
 #include <linux/uaccess.h>
 #include <asm/bootinfo.h>
 #include <asm/reg.h>
+#include <asm/branch.h>
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/syscalls.h>
 
+#include "probes-common.h"
+
+#define BREAKINST	0x0000000d
+
 /*
  * Called by kernel/ptrace.c when detaching..
  *
@@ -58,6 +63,7 @@ void ptrace_disable(struct task_struct *child)
 {
 	/* Don't load the watchpoint registers for the ex-child. */
 	clear_tsk_thread_flag(child, TIF_LOAD_WATCH);
+	user_disable_single_step(child);
 }
 
 /*
@@ -1072,6 +1078,108 @@ const struct user_regset_view *task_user_regset_view(struct task_struct *task)
 #endif
 }
 
+static int read_insn(struct task_struct *task, unsigned long addr, unsigned int *insn)
+{
+	int copied = access_process_vm(task, addr, insn,
+				       sizeof(unsigned int), FOLL_FORCE);
+
+	if (copied != sizeof(unsigned int)) {
+		pr_err("failed to read instruction from 0x%lx\n", addr);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int write_insn(struct task_struct *task, unsigned long addr, unsigned int insn)
+{
+	int copied = access_process_vm(task, addr, &insn,
+				       sizeof(unsigned int), FOLL_FORCE | FOLL_WRITE);
+
+	if (copied != sizeof(unsigned int)) {
+		pr_err("failed to write instruction to 0x%lx\n", addr);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int insn_has_delayslot(union mips_instruction insn)
+{
+	return __insn_has_delay_slot(insn);
+}
+
+static void ptrace_set_bpt(struct task_struct *child)
+{
+	union mips_instruction mips_insn;
+	struct pt_regs *regs;
+	unsigned long pc;
+	unsigned int insn;
+	int i, ret, nsaved = 0;
+
+	regs = task_pt_regs(child);
+	pc = regs->cp0_epc;
+
+	ret = read_insn(child, pc, &insn);
+	if (ret < 0)
+		return;
+
+	if (insn_has_delayslot(mips_insn)) {
+		pr_info("executing branch insn\n");
+		ret = __compute_return_epc(regs);
+		if (ret < 0)
+			return;
+		task_thread_info(child)->bpt_addr[nsaved++] = regs->cp0_epc;
+	} else {
+		pr_info("executing normal insn\n");
+		task_thread_info(child)->bpt_addr[nsaved++] = pc + 4;
+	}
+
+	/* install breakpoints */
+	for (i = 0; i < nsaved; i++) {
+		ret = read_insn(child, task_thread_info(child)->bpt_addr[i], &insn);
+		if (ret < 0)
+			return;
+
+		task_thread_info(child)->bpt_insn[i] = insn;
+
+		ret = write_insn(child, task_thread_info(child)->bpt_addr[i], BREAKINST);
+		if (ret < 0)
+			return;
+	}
+
+	task_thread_info(child)->bpt_nsaved = nsaved;
+}
+
+static void ptrace_cancel_bpt(struct task_struct *child)
+{
+	int i, nsaved = task_thread_info(child)->bpt_nsaved;
+
+	task_thread_info(child)->bpt_nsaved = 0;
+
+	if (nsaved > 1) {
+		pr_info("%s: bogus nsaved: %d!\n", __func__, nsaved);
+		nsaved = 1;
+	}
+
+	for (i = 0; i < nsaved; i++) {
+		write_insn(child, task_thread_info(child)->bpt_addr[i],
+			  task_thread_info(child)->bpt_insn[i]);
+	}
+}
+
+void user_enable_single_step(struct task_struct *child)
+{
+	set_tsk_thread_flag(child, TIF_SINGLESTEP);
+	ptrace_set_bpt(child);
+}
+
+void user_disable_single_step(struct task_struct *child)
+{
+	clear_tsk_thread_flag(child, TIF_SINGLESTEP);
+	ptrace_cancel_bpt(child);
+}
+
 long arch_ptrace(struct task_struct *child, long request,
 		 unsigned long addr, unsigned long data)
 {
diff --git a/arch/mips/kernel/signal.c b/arch/mips/kernel/signal.c
index f1e9851..82d11d8 100644
--- a/arch/mips/kernel/signal.c
+++ b/arch/mips/kernel/signal.c
@@ -849,7 +849,7 @@ static void handle_signal(struct ksignal *ksig, struct pt_regs *regs)
 		ret = abi->setup_frame(vdso + abi->vdso->off_sigreturn,
 				       ksig, regs, oldset);
 
-	signal_setup_done(ret, ksig, 0);
+	signal_setup_done(ret, ksig, test_thread_flag(TIF_SINGLESTEP));
 }
 
 static void do_signal(struct pt_regs *regs)
-- 
2.1.0

