Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6ACBF1A3EAA
	for <lists+linux-mips@lfdr.de>; Fri, 10 Apr 2020 05:21:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726595AbgDJDVQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Apr 2020 23:21:16 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34348 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726082AbgDJDVQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 9 Apr 2020 23:21:16 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz2kd5o9etf8lAA--.35S2;
        Fri, 10 Apr 2020 11:21:02 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v2] MIPS: Limit check_bugs32() to affected platform
Date:   Fri, 10 Apr 2020 11:20:59 +0800
Message-Id: <1586488859-18715-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dxz2kd5o9etf8lAA--.35S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJw4fGF13uF47ZFWxGF4kJFb_yoWrCryxpF
        4qyan5Wr4DWFy7tFySyrykCrWaq34kWr4a9r12ga4UZ3WavFn8WFnaqr1fJryUAFZIga48
        Wa4Sqr13tr4IyaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUyC14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
        4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0E
        wIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
        80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0
        I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
        k26cxKx2IYs7xG6Fyj6rWUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF
        7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUdEfOUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In the current code, check_bugs32() only handles MIPS32 CPU type CPU_34K,
it is better to build and call it on the affected platform.

Move check_bugs32() to the new added 34k-bugs32.c to indicate the fact that
the code is specific to the 34k CPU, and also add CONFIG_CPU_34K_BUGS32 to
control whether or not check the bugs.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---

v2:
  - Add new 34k-bugs32.c
  - Rename check_errata() to check_errata32()
  - Add CONFIG_CPU_34K_BUGS32
  - Modify commit message

 arch/mips/Kconfig             |  4 ++++
 arch/mips/include/asm/bugs.h  |  4 +++-
 arch/mips/kernel/34k-bugs32.c | 29 +++++++++++++++++++++++++++++
 arch/mips/kernel/Makefile     |  1 +
 arch/mips/kernel/cpu-probe.c  | 25 -------------------------
 5 files changed, 37 insertions(+), 26 deletions(-)
 create mode 100644 arch/mips/kernel/34k-bugs32.c

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index a1f973c..d95dc18 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2619,6 +2619,10 @@ config CPU_R4X00_BUGS64
 	bool
 	default y if SYS_HAS_CPU_R4X00 && 64BIT && (TARGET_ISA_REV < 1)
 
+config CPU_34K_BUGS32
+	bool
+	default y if CPU_MIPS32_R2
+
 config MIPS_ASID_SHIFT
 	int
 	default 6 if CPU_R3000 || CPU_TX39XX
diff --git a/arch/mips/include/asm/bugs.h b/arch/mips/include/asm/bugs.h
index d72dc6e..bbf843a 100644
--- a/arch/mips/include/asm/bugs.h
+++ b/arch/mips/include/asm/bugs.h
@@ -35,7 +35,9 @@ static inline void check_bugs(void)
 	unsigned int cpu = smp_processor_id();
 
 	cpu_data[cpu].udelay_val = loops_per_jiffy;
-	check_bugs32();
+
+	if (IS_ENABLED(CONFIG_CPU_34K_BUGS32))
+		check_bugs32();
 
 	if (IS_ENABLED(CONFIG_CPU_R4X00_BUGS64))
 		check_bugs64();
diff --git a/arch/mips/kernel/34k-bugs32.c b/arch/mips/kernel/34k-bugs32.c
new file mode 100644
index 0000000..dc3ac01
--- /dev/null
+++ b/arch/mips/kernel/34k-bugs32.c
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <asm/cpu.h>
+#include <asm/cpu-info.h>
+#include <asm/cpu-type.h>
+#include <asm/bugs.h>
+
+static inline void check_errata32(void)
+{
+	struct cpuinfo_mips *c = &current_cpu_data;
+
+	switch (current_cpu_type()) {
+	case CPU_34K:
+		/*
+		 * Erratum "RPS May Cause Incorrect Instruction Execution"
+		 * This code only handles VPE0, any SMP/RTOS code
+		 * making use of VPE1 will be responsable for that VPE.
+		 */
+		if ((c->processor_id & PRID_REV_MASK) <= PRID_REV_34K_V1_0_2)
+			write_c0_config7(read_c0_config7() | MIPS_CONF7_RPS);
+		break;
+	default:
+		break;
+	}
+}
+
+void __init check_bugs32(void)
+{
+	check_errata32();
+}
diff --git a/arch/mips/kernel/Makefile b/arch/mips/kernel/Makefile
index d6e97df..c2fd191 100644
--- a/arch/mips/kernel/Makefile
+++ b/arch/mips/kernel/Makefile
@@ -81,6 +81,7 @@ obj-$(CONFIG_PROC_FS)		+= proc.o
 obj-$(CONFIG_MAGIC_SYSRQ)	+= sysrq.o
 
 obj-$(CONFIG_CPU_R4X00_BUGS64)	+= r4k-bugs64.o
+obj-$(CONFIG_CPU_34K_BUGS32)	+= 34k-bugs32.o
 
 obj-$(CONFIG_I8253)		+= i8253.o
 
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index f21a230..7179787 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -14,7 +14,6 @@
 #include <linux/stddef.h>
 #include <linux/export.h>
 
-#include <asm/bugs.h>
 #include <asm/cpu.h>
 #include <asm/cpu-features.h>
 #include <asm/cpu-type.h>
@@ -461,30 +460,6 @@ static inline void cpu_set_mt_per_tc_perf(struct cpuinfo_mips *c)
 		c->options |= MIPS_CPU_MT_PER_TC_PERF_COUNTERS;
 }
 
-static inline void check_errata(void)
-{
-	struct cpuinfo_mips *c = &current_cpu_data;
-
-	switch (current_cpu_type()) {
-	case CPU_34K:
-		/*
-		 * Erratum "RPS May Cause Incorrect Instruction Execution"
-		 * This code only handles VPE0, any SMP/RTOS code
-		 * making use of VPE1 will be responsable for that VPE.
-		 */
-		if ((c->processor_id & PRID_REV_MASK) <= PRID_REV_34K_V1_0_2)
-			write_c0_config7(read_c0_config7() | MIPS_CONF7_RPS);
-		break;
-	default:
-		break;
-	}
-}
-
-void __init check_bugs32(void)
-{
-	check_errata();
-}
-
 /*
  * Probe whether cpu has config register by trying to play with
  * alternate cache bit and see whether it matters.
-- 
2.1.0

