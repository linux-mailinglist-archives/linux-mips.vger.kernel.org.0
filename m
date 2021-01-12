Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59E7C2F2F16
	for <lists+linux-mips@lfdr.de>; Tue, 12 Jan 2021 13:31:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387865AbhALMaM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 12 Jan 2021 07:30:12 -0500
Received: from mail.loongson.cn ([114.242.206.163]:34336 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730624AbhALMaI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 12 Jan 2021 07:30:08 -0500
Received: from loongson.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx6L0dlv1fsycDAA--.5569S3;
        Tue, 12 Jan 2021 20:29:18 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Burton <paulburton@kernel.org>,
        Jun-Ru Chang <jrjang@realtek.com>
Subject: [PATCH 1/4] MIPS: process: Reorder header files
Date:   Tue, 12 Jan 2021 20:29:14 +0800
Message-Id: <1610454557-25867-2-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1610454557-25867-1-git-send-email-hejinyang@loongson.cn>
References: <1610454557-25867-1-git-send-email-hejinyang@loongson.cn>
X-CM-TRANSID: AQAAf9Dx6L0dlv1fsycDAA--.5569S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww15AryDCFW8GFWfGrWkXrb_yoW5Jr45pF
        4qkF48JrZ8Aw18AF17ur12kFn8Xw4Dur17tFy2ga4UZ347tF1vq3yv9rnxtr1kAa9FgayU
        WFW3Grs8GrWYqrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUB0b7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
        8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_Jrv_JF4l8cAvFVAK0II2c7xJM28CjxkF
        64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcV
        CY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIE
        c7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
        8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCF
        s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_Xr1l42xK82IYc2Ij64
        vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
        jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2I
        x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
        8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I
        0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcRpBDUUUU
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Just reorder the header files.

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/mips/kernel/process.c | 44 ++++++++++++++++++++++----------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
index d7e288f..361bd28 100644
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -9,28 +9,29 @@
  * Copyright (C) 2004 Thiemo Seufer
  * Copyright (C) 2013  Imagination Technologies Ltd.
  */
+#include <linux/completion.h>
+#include <linux/cpu.h>
 #include <linux/errno.h>
+#include <linux/export.h>
+#include <linux/init.h>
+#include <linux/kallsyms.h>
+#include <linux/kernel.h>
+#include <linux/mm.h>
+#include <linux/mman.h>
+#include <linux/nmi.h>
+#include <linux/personality.h>
+#include <linux/ptrace.h>
+#include <linux/prctl.h>
+#include <linux/random.h>
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
 #include <linux/sched/task.h>
 #include <linux/sched/task_stack.h>
-#include <linux/tick.h>
-#include <linux/kernel.h>
-#include <linux/mm.h>
 #include <linux/stddef.h>
-#include <linux/unistd.h>
-#include <linux/export.h>
-#include <linux/ptrace.h>
-#include <linux/mman.h>
-#include <linux/personality.h>
 #include <linux/sys.h>
-#include <linux/init.h>
-#include <linux/completion.h>
-#include <linux/kallsyms.h>
-#include <linux/random.h>
-#include <linux/prctl.h>
-#include <linux/nmi.h>
-#include <linux/cpu.h>
+#include <linux/tick.h>
+#include <linux/uaccess.h>
+#include <linux/unistd.h>
 
 #include <asm/abi.h>
 #include <asm/asm.h>
@@ -38,21 +39,20 @@
 #include <asm/cpu.h>
 #include <asm/dsemul.h>
 #include <asm/dsp.h>
+#include <asm/elf.h>
+#include <asm/exec.h>
 #include <asm/fpu.h>
+#include <asm/inst.h>
+#include <asm/io.h>
 #include <asm/irq.h>
+#include <asm/irq_regs.h>
+#include <asm/isadep.h>
 #include <asm/mips-cps.h>
 #include <asm/msa.h>
 #include <asm/mipsregs.h>
 #include <asm/processor.h>
 #include <asm/reg.h>
-#include <linux/uaccess.h>
-#include <asm/io.h>
-#include <asm/elf.h>
-#include <asm/isadep.h>
-#include <asm/inst.h>
 #include <asm/stacktrace.h>
-#include <asm/irq_regs.h>
-#include <asm/exec.h>
 
 #ifdef CONFIG_HOTPLUG_CPU
 void arch_cpu_idle_dead(void)
-- 
2.1.0

