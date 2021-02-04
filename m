Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C655430EB0F
	for <lists+linux-mips@lfdr.de>; Thu,  4 Feb 2021 04:38:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234583AbhBDDhU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Feb 2021 22:37:20 -0500
Received: from mail.loongson.cn ([114.242.206.163]:49912 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234594AbhBDDga (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 3 Feb 2021 22:36:30 -0500
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb9d9axtgvDEDAA--.4897S3;
        Thu, 04 Feb 2021 11:35:28 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Juxin Gao <gaojuxin@loongson.cn>,
        David Daney <david.daney@cavium.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Archer Yan <ayan@wavecomp.com>
Subject: [PATCH v2 1/3] MIPS: kernel: Support extracting off-line stack traces from user-space with perf
Date:   Thu,  4 Feb 2021 11:35:22 +0800
Message-Id: <1612409724-3516-2-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1612409724-3516-1-git-send-email-yangtiezhu@loongson.cn>
References: <1612409724-3516-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Dxb9d9axtgvDEDAA--.4897S3
X-Coremail-Antispam: 1UD129KBjvJXoW3AF4rJrW7JrW5Xr1rCr45Wrg_yoW7CrWfpr
        W7Cw1rJw4vqa47C3yfCFy8ur1aqaykXFZ7ZrWfCa43ZrW2van5Xwn2gr13t343Jr1Uta17
        uFyqqr4jkF1jyw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPE14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0
        owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
        IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4U
        M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
        kIc2xKxwCY02Avz4vE14v_Gr4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
        Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
        CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
        I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
        8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73
        UjIFyTuYvjTR_SdyUUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add perf_event_mips_regs/perf_reg_value/perf_reg_validate to support
features HAVE_PERF_REGS/HAVE_PERF_USER_STACK_DUMP in kernel.

[ayan@wavecomp.com: Repick this patch for unwinding userstack backtrace
 by perf and libunwind on MIPS based CPU.]

[ralf@linux-mips.org: Add perf_get_regs_user() which is required after
'commit 88a7c26af8da ("perf: Move task_pt_regs sampling into arch code")'.]

[yangtiezhu@loongson.cn: Fix build error about perf_get_regs_user() after
commit 76a4efa80900 ("perf/arch: Remove perf_sample_data::regs_user_copy"),
and also separate the original patches into two parts (MIPS kernel and perf
tools) to merge easily.]

The original patches:
https://lore.kernel.org/patchwork/patch/1126521/
https://lore.kernel.org/patchwork/patch/1126520/

Signed-off-by: David Daney <david.daney@cavium.com>
Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
Signed-off-by: Archer Yan <ayan@wavecomp.com>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---

v2: add R26 and R27 to the enum perf_event_mips_regs

 arch/mips/Kconfig                      |  2 +
 arch/mips/include/uapi/asm/perf_regs.h | 40 ++++++++++++++++++++
 arch/mips/kernel/Makefile              |  2 +-
 arch/mips/kernel/perf_regs.c           | 68 ++++++++++++++++++++++++++++++++++
 4 files changed, 111 insertions(+), 1 deletion(-)
 create mode 100644 arch/mips/include/uapi/asm/perf_regs.h
 create mode 100644 arch/mips/kernel/perf_regs.c

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 62475fc..743b8f7 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -77,6 +77,8 @@ config MIPS
 	select HAVE_NMI
 	select HAVE_OPROFILE
 	select HAVE_PERF_EVENTS
+	select HAVE_PERF_REGS
+	select HAVE_PERF_USER_STACK_DUMP
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RSEQ
 	select HAVE_SPARSE_SYSCALL_NR
diff --git a/arch/mips/include/uapi/asm/perf_regs.h b/arch/mips/include/uapi/asm/perf_regs.h
new file mode 100644
index 0000000..d0f4ecd
--- /dev/null
+++ b/arch/mips/include/uapi/asm/perf_regs.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _ASM_MIPS_PERF_REGS_H
+#define _ASM_MIPS_PERF_REGS_H
+
+enum perf_event_mips_regs {
+	PERF_REG_MIPS_PC,
+	PERF_REG_MIPS_R1,
+	PERF_REG_MIPS_R2,
+	PERF_REG_MIPS_R3,
+	PERF_REG_MIPS_R4,
+	PERF_REG_MIPS_R5,
+	PERF_REG_MIPS_R6,
+	PERF_REG_MIPS_R7,
+	PERF_REG_MIPS_R8,
+	PERF_REG_MIPS_R9,
+	PERF_REG_MIPS_R10,
+	PERF_REG_MIPS_R11,
+	PERF_REG_MIPS_R12,
+	PERF_REG_MIPS_R13,
+	PERF_REG_MIPS_R14,
+	PERF_REG_MIPS_R15,
+	PERF_REG_MIPS_R16,
+	PERF_REG_MIPS_R17,
+	PERF_REG_MIPS_R18,
+	PERF_REG_MIPS_R19,
+	PERF_REG_MIPS_R20,
+	PERF_REG_MIPS_R21,
+	PERF_REG_MIPS_R22,
+	PERF_REG_MIPS_R23,
+	PERF_REG_MIPS_R24,
+	PERF_REG_MIPS_R25,
+	PERF_REG_MIPS_R26,
+	PERF_REG_MIPS_R27,
+	PERF_REG_MIPS_R28,
+	PERF_REG_MIPS_R29,
+	PERF_REG_MIPS_R30,
+	PERF_REG_MIPS_R31,
+	PERF_REG_MIPS_MAX = PERF_REG_MIPS_R31 + 1,
+};
+#endif /* _ASM_MIPS_PERF_REGS_H */
diff --git a/arch/mips/kernel/Makefile b/arch/mips/kernel/Makefile
index 2303a58..a893ea0 100644
--- a/arch/mips/kernel/Makefile
+++ b/arch/mips/kernel/Makefile
@@ -103,7 +103,7 @@ obj-$(CONFIG_MIPSR2_TO_R6_EMULATOR)	+= mips-r2-to-r6-emul.o
 
 CFLAGS_cpu-bugs64.o	= $(shell if $(CC) $(KBUILD_CFLAGS) -Wa,-mdaddi -c -o /dev/null -x c /dev/null >/dev/null 2>&1; then echo "-DHAVE_AS_SET_DADDI"; fi)
 
-obj-$(CONFIG_PERF_EVENTS)	+= perf_event.o
+obj-$(CONFIG_PERF_EVENTS)	+= perf_event.o perf_regs.o
 obj-$(CONFIG_HW_PERF_EVENTS)	+= perf_event_mipsxx.o
 
 obj-$(CONFIG_JUMP_LABEL)	+= jump_label.o
diff --git a/arch/mips/kernel/perf_regs.c b/arch/mips/kernel/perf_regs.c
new file mode 100644
index 0000000..e686780
--- /dev/null
+++ b/arch/mips/kernel/perf_regs.c
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * This file is subject to the terms and conditions of the GNU General Public
+ * License.  See the file "COPYING" in the main directory of this archive
+ * for more details.
+ *
+ * Some parts derived from x86 version of this file.
+ *
+ * Copyright (C) 2013 Cavium, Inc.
+ */
+
+#include <linux/perf_event.h>
+
+#include <asm/ptrace.h>
+
+#ifdef CONFIG_32BIT
+u64 perf_reg_abi(struct task_struct *tsk)
+{
+	return PERF_SAMPLE_REGS_ABI_32;
+}
+#else /* Must be CONFIG_64BIT */
+u64 perf_reg_abi(struct task_struct *tsk)
+{
+	if (test_tsk_thread_flag(tsk, TIF_32BIT_REGS))
+		return PERF_SAMPLE_REGS_ABI_32;
+	else
+		return PERF_SAMPLE_REGS_ABI_64;
+}
+#endif /* CONFIG_32BIT */
+
+int perf_reg_validate(u64 mask)
+{
+	if (!mask)
+		return -EINVAL;
+	if (mask & ~((1ull << PERF_REG_MIPS_MAX) - 1))
+		return -EINVAL;
+	return 0;
+}
+
+u64 perf_reg_value(struct pt_regs *regs, int idx)
+{
+	long v;
+
+	switch (idx) {
+	case PERF_REG_MIPS_PC:
+		v = regs->cp0_epc;
+		break;
+	case PERF_REG_MIPS_R1 ... PERF_REG_MIPS_R25:
+		v = regs->regs[idx - PERF_REG_MIPS_R1 + 1];
+		break;
+	case PERF_REG_MIPS_R28 ... PERF_REG_MIPS_R31:
+		v = regs->regs[idx - PERF_REG_MIPS_R28 + 28];
+		break;
+
+	default:
+		WARN_ON_ONCE(1);
+		return 0;
+	}
+
+	return (s64)v; /* Sign extend if 32-bit. */
+}
+
+void perf_get_regs_user(struct perf_regs *regs_user,
+			struct pt_regs *regs)
+{
+	regs_user->regs = task_pt_regs(current);
+	regs_user->abi = perf_reg_abi(current);
+}
-- 
2.1.0

