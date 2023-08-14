Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0493B77B575
	for <lists+linux-mips@lfdr.de>; Mon, 14 Aug 2023 11:29:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234001AbjHNJ2k (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 14 Aug 2023 05:28:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235527AbjHNJ2K (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 14 Aug 2023 05:28:10 -0400
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 702A610DB;
        Mon, 14 Aug 2023 02:27:55 -0700 (PDT)
Received: from loongson.cn (unknown [113.200.148.30])
        by gateway (Coremail) with SMTP id _____8CxbeuH89lkpxQYAA--.47460S3;
        Mon, 14 Aug 2023 17:27:35 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Bx3yOE89lkSLlZAA--.49910S4;
        Mon, 14 Aug 2023 17:27:34 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "Maciej W. Rozycki" <macro@orcam.me.uk>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        loongson-kernel@lists.loongnix.cn
Subject: [PATCH v3 2/3] MIPS: Remove noreturn attribute for die()
Date:   Mon, 14 Aug 2023 17:27:25 +0800
Message-Id: <1692005246-18399-3-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1692005246-18399-1-git-send-email-yangtiezhu@loongson.cn>
References: <1692005246-18399-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf8Bx3yOE89lkSLlZAA--.49910S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxXry8KF4kZry5XrW3try7Jwc_yoW5Jw4xpa
        1qkasrGrWDCF4kXFyDAF4DCrW5JrZ5t3y2kw10kw4F93ZIv34rXrs7GFWjvw4rtr9Yga4U
        WFWYqr1FyFZ7AFcCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
        sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
        0xBIdaVrnRJUUU9Ib4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
        IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
        e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
        0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
        xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
        AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
        tVWrXwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x
        0EwIxGrwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AK
        xVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
        AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI
        42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
        IF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnI
        WIevJa73UjIFyTuYvjxU2na9DUUUU
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

If notify_die() returns NOTIFY_STOP, honor the return value from the
handler chain invocation in die() as, through a debugger, the fault
may have been fixed. It makes sense even if ignoring the event will
make the system unstable, by allowing access through a debugger it
has been compromised already anyway. So we can remove the noreturn
attribute for die() to make our port consistent with x86, arm64,
riscv and csky.

Commit 20c0d2d44029 ("[PATCH] i386: pass proper trap numbers to die
chain handlers") may be the earliest of similar changes.

Link: https://lore.kernel.org/all/alpine.DEB.2.21.2308132148500.8596@angie.orcam.me.uk/
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/include/asm/ptrace.h |  2 +-
 arch/mips/kernel/traps.c       | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/mips/include/asm/ptrace.h b/arch/mips/include/asm/ptrace.h
index daf3cf2..aee8e0a 100644
--- a/arch/mips/include/asm/ptrace.h
+++ b/arch/mips/include/asm/ptrace.h
@@ -159,7 +159,7 @@ static inline long regs_return_value(struct pt_regs *regs)
 extern asmlinkage long syscall_trace_enter(struct pt_regs *regs, long syscall);
 extern asmlinkage void syscall_trace_leave(struct pt_regs *regs);
 
-extern void die(const char *, struct pt_regs *) __noreturn;
+extern void die(const char *, struct pt_regs *);
 
 static inline void die_if_kernel(const char *str, struct pt_regs *regs)
 {
diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 7a34674..4f5140f 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -391,16 +391,15 @@ void show_registers(struct pt_regs *regs)
 
 static DEFINE_RAW_SPINLOCK(die_lock);
 
-void __noreturn die(const char *str, struct pt_regs *regs)
+void die(const char *str, struct pt_regs *regs)
 {
 	static int die_counter;
-	int sig = SIGSEGV;
+	int ret;
 
 	oops_enter();
 
-	if (notify_die(DIE_OOPS, str, regs, 0, current->thread.trap_nr,
-		       SIGSEGV) == NOTIFY_STOP)
-		sig = 0;
+	ret = notify_die(DIE_OOPS, str, regs, 0,
+			 current->thread.trap_nr, SIGSEGV);
 
 	console_verbose();
 	raw_spin_lock_irq(&die_lock);
@@ -422,7 +421,8 @@ void __noreturn die(const char *str, struct pt_regs *regs)
 	if (regs && kexec_should_crash(current))
 		crash_kexec(regs);
 
-	make_task_dead(sig);
+	if (ret != NOTIFY_STOP)
+		make_task_dead(SIGSEGV);
 }
 
 extern struct exception_table_entry __start___dbe_table[];
-- 
2.1.0

