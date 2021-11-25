Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B51CB45D96D
	for <lists+linux-mips@lfdr.de>; Thu, 25 Nov 2021 12:41:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233289AbhKYLos (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 25 Nov 2021 06:44:48 -0500
Received: from mail.loongson.cn ([114.242.206.163]:45486 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235144AbhKYLms (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 25 Nov 2021 06:42:48 -0500
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxZ+j1dZ9hTVoBAA--.6082S2;
        Thu, 25 Nov 2021 19:39:34 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Xuefeng Li <lixuefeng@loongson.cn>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] MIPS: Fix using smp_processor_id() in preemptible in show_cpuinfo()
Date:   Thu, 25 Nov 2021 19:39:32 +0800
Message-Id: <1637840372-27773-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9AxZ+j1dZ9hTVoBAA--.6082S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WF47JF1Dur17Zr47ZryftFb_yoW8Zr4rpa
        y7Ar1Utr4UWw4UJas5JrZ3uryrXFs8Za42kayxJ3y3Z3W5Wr1DXrnagF47uFyqgr1rta1I
        gF9Fqr4Yqry8ZaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r4k
        MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
        0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
        wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
        W8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
        IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjTa0PUUUU
        U==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There exists the following issue under DEBUG_PREEMPT:

 BUG: using smp_processor_id() in preemptible [00000000] code: systemd/1
 caller is show_cpuinfo+0x460/0xea0
 ...
 Call Trace:
 [<ffffffff8020f0dc>] show_stack+0x94/0x128
 [<ffffffff80e6cab4>] dump_stack_lvl+0x94/0xd8
 [<ffffffff80e74c5c>] check_preemption_disabled+0x104/0x110
 [<ffffffff802209c8>] show_cpuinfo+0x460/0xea0
 [<ffffffff80539d54>] seq_read_iter+0xfc/0x4f8
 [<ffffffff804fcc10>] new_sync_read+0x110/0x1b8
 [<ffffffff804ff57c>] vfs_read+0x1b4/0x1d0
 [<ffffffff804ffb18>] ksys_read+0xd0/0x110
 [<ffffffff8021c090>] syscall_common+0x34/0x58

We can see the following call trace:
 show_cpuinfo()
   cpu_has_fpu
     current_cpu_data
       smp_processor_id()

 $ addr2line -f -e vmlinux 0xffffffff802209c8
 show_cpuinfo
 arch/mips/kernel/proc.c:188

 $ head -188 arch/mips/kernel/proc.c | tail -1
	 if (cpu_has_fpu)

 arch/mips/include/asm/cpu-features.h
 #  define cpu_has_fpu		(current_cpu_data.options & MIPS_CPU_FPU)

 arch/mips/include/asm/cpu-info.h
 #define current_cpu_data cpu_data[smp_processor_id()]

Based on the above analysis, fix the issue by using raw_cpu_has_fpu
which calls raw_smp_processor_id() in show_cpuinfo().

Fixes: 626bfa037299 ("MIPS: kernel: proc: add CPU option reporting")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/kernel/proc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
index 376a6e2..9f47a88 100644
--- a/arch/mips/kernel/proc.c
+++ b/arch/mips/kernel/proc.c
@@ -185,7 +185,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		seq_puts(m, " tx39_cache");
 	if (cpu_has_octeon_cache)
 		seq_puts(m, " octeon_cache");
-	if (cpu_has_fpu)
+	if (raw_cpu_has_fpu)
 		seq_puts(m, " fpu");
 	if (cpu_has_32fpr)
 		seq_puts(m, " 32fpr");
-- 
2.1.0

