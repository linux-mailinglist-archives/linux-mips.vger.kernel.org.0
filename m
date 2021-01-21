Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 092FB2FE1EE
	for <lists+linux-mips@lfdr.de>; Thu, 21 Jan 2021 06:44:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726375AbhAUFnf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 Jan 2021 00:43:35 -0500
Received: from mail.loongson.cn ([114.242.206.163]:47456 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726811AbhAUFcn (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 21 Jan 2021 00:32:43 -0500
Received: from loongson.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxeL7GEQlgHXEIAA--.13206S3;
        Thu, 21 Jan 2021 13:31:51 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Burton <paulburton@kernel.org>,
        Jun-Ru Chang <jrjang@realtek.com>
Subject: [PATCH v2 1/4] MIPS: process: Remove unnecessary headers inclusion
Date:   Thu, 21 Jan 2021 13:31:35 +0800
Message-Id: <1611207098-11381-2-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1611207098-11381-1-git-send-email-hejinyang@loongson.cn>
References: <1611207098-11381-1-git-send-email-hejinyang@loongson.cn>
X-CM-TRANSID: AQAAf9DxeL7GEQlgHXEIAA--.13206S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrWfAFy7ZrWxuw47KF1kGrg_yoW8tr4fpF
        sIkFW8JrWDAw18Ar17ur12kF1DXw4Dur17tFy2ga4UZ342yF1vqrWv9rnxtrykJFZFga1U
        WFW3Grs8Gr4YqrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBYb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
        8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_JFI_Gr1l8cAvFVAK0II2c7xJM28CjxkF
        64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcV
        CY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv
        6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
        02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE
        4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6r4rMxAIw28IcxkI7V
        AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
        r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6x
        IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
        w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
        0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5Lo7tUUUUU==
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Some headers are not necessary, remove them and sort includes.

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
v2:
- Remove useless header inclusion.

 arch/mips/kernel/process.c | 39 ++++++++++-----------------------------
 1 file changed, 10 insertions(+), 29 deletions(-)

diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
index d7e288f..d737234 100644
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -9,50 +9,31 @@
  * Copyright (C) 2004 Thiemo Seufer
  * Copyright (C) 2013  Imagination Technologies Ltd.
  */
+#include <linux/cpu.h>
 #include <linux/errno.h>
-#include <linux/sched.h>
-#include <linux/sched/debug.h>
-#include <linux/sched/task.h>
-#include <linux/sched/task_stack.h>
-#include <linux/tick.h>
-#include <linux/kernel.h>
-#include <linux/mm.h>
-#include <linux/stddef.h>
-#include <linux/unistd.h>
-#include <linux/export.h>
-#include <linux/ptrace.h>
-#include <linux/mman.h>
-#include <linux/personality.h>
-#include <linux/sys.h>
 #include <linux/init.h>
-#include <linux/completion.h>
 #include <linux/kallsyms.h>
-#include <linux/random.h>
-#include <linux/prctl.h>
+#include <linux/kernel.h>
 #include <linux/nmi.h>
-#include <linux/cpu.h>
+#include <linux/personality.h>
+#include <linux/prctl.h>
+#include <linux/sched.h>
+#include <linux/sched/debug.h>
+#include <linux/sched/task_stack.h>
 
 #include <asm/abi.h>
 #include <asm/asm.h>
-#include <asm/bootinfo.h>
-#include <asm/cpu.h>
 #include <asm/dsemul.h>
 #include <asm/dsp.h>
 #include <asm/fpu.h>
+#include <asm/inst.h>
 #include <asm/irq.h>
-#include <asm/mips-cps.h>
+#include <asm/irq_regs.h>
+#include <asm/isadep.h>
 #include <asm/msa.h>
 #include <asm/mipsregs.h>
 #include <asm/processor.h>
 #include <asm/reg.h>
-#include <linux/uaccess.h>
-#include <asm/io.h>
-#include <asm/elf.h>
-#include <asm/isadep.h>
-#include <asm/inst.h>
-#include <asm/stacktrace.h>
-#include <asm/irq_regs.h>
-#include <asm/exec.h>
 
 #ifdef CONFIG_HOTPLUG_CPU
 void arch_cpu_idle_dead(void)
-- 
2.1.0

