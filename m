Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B6FCF0C78
	for <lists+linux-mips@lfdr.de>; Wed,  6 Nov 2019 04:07:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387872AbfKFDHb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 5 Nov 2019 22:07:31 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:36414 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387798AbfKFDHa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 5 Nov 2019 22:07:30 -0500
Received: by mail-pg1-f193.google.com with SMTP id k13so4803229pgh.3
        for <linux-mips@vger.kernel.org>; Tue, 05 Nov 2019 19:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vkkklFe3TyOXksAjwuWOsrzjO8z7PwLbC/jgYh6dWG8=;
        b=A/+Cnn5ZCtwfQnRLI1pfiS399uGsB43hH8LDyhdmpW1q83F+3ACAdiXXrBv0g1Ywww
         REYMFcEHmGcbe6M0IbJfQylbKnZ7Q0UCP6xwfOy14IjRDFCzg3ry8uPFBLqKASAqjCtj
         ujoKFR8uv+OvcTyB6mkUOf2PbfHtU3HB1nkdbJO64lWbfmymOpljuqrI2PgC9iAPCmMi
         +FejX45ZP/iMi6FGwhVA0ORwAuZDFi5ZbkdfO/2Czp/8vcD/LKkzBM9dTLhuNQkzYVSk
         RPJIoYaDDD0tqA4oTUqmcyoEa/l90LR18vIU53MFsrwRnvLvcKIL0tK+8EYZeXudTfp8
         YFlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vkkklFe3TyOXksAjwuWOsrzjO8z7PwLbC/jgYh6dWG8=;
        b=Iox41MZvPzutyrYO4HgwZjqhpkZhfR5ss9h3IxZ6MYre6emTVVoXv0B2afAsWIQ+dc
         C6y9dpEAiyCl7QAx+wddLpdqhujs6d++cCzpyxOnsjg4SOe/n/mXLURUTGz6s7O8VLYo
         y5icYwTQbC739XZZ1Rzhh2UrRXuH309HSdshQQWJrI50Pjj06DTA6adQdp/CSpVnzgzs
         TufU7VCzlocUz8yGEnMSjw6kI/UOraG/HHCASzoR7Oc3utb1sIt8ql3Rg3OOAoEQVrlz
         YmRYURff+Zq3mNayJGMgee4DKxvPAn917QVaXVs4bpSofH1mY+V196ek3bVxcPhJrUIQ
         dpjQ==
X-Gm-Message-State: APjAAAXZc1vpD7Fru0W15EnmYVf9+kXrF42e/nj/FwDNURx1VEw7qk++
        pgCpwcLaegcoVqH6Gbt0EitCuw==
X-Google-Smtp-Source: APXvYqxD1eZJFiBLz7NC+WgeQdNv09aVPP03yZXZlt+bqyDDtkVZkHq08MufmMicVwS+9aNc2TjbFw==
X-Received: by 2002:a65:62d2:: with SMTP id m18mr183670pgv.117.1573009650116;
        Tue, 05 Nov 2019 19:07:30 -0800 (PST)
Received: from Mindolluin.ire.aristanetworks.com ([217.173.96.166])
        by smtp.gmail.com with ESMTPSA id k24sm19570487pgl.6.2019.11.05.19.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 19:07:29 -0800 (PST)
From:   Dmitry Safonov <dima@arista.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dmitry Safonov <0x7f454c46@gmail.com>,
        Dmitry Safonov <dima@arista.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ingo Molnar <mingo@kernel.org>, Jiri Slaby <jslaby@suse.com>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        James Hogan <jhogan@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>, linux-mips@vger.kernel.org
Subject: [PATCH 21/50] mips: Add show_stack_loglvl()
Date:   Wed,  6 Nov 2019 03:05:12 +0000
Message-Id: <20191106030542.868541-22-dima@arista.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191106030542.868541-1-dima@arista.com>
References: <20191106030542.868541-1-dima@arista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Currently, the log-level of show_stack() depends on a platform
realization. It creates situations where the headers are printed with
lower log level or higher than the stacktrace (depending on
a platform or user).

Furthermore, it forces the logic decision from user to an architecture
side. In result, some users as sysrq/kdb/etc are doing tricks with
temporary rising console_loglevel while printing their messages.
And in result it not only may print unwanted messages from other CPUs,
but also omit printing at all in the unlucky case where the printk()
was deferred.

Introducing log-level parameter and KERN_UNSUPPRESSED [1] seems
an easier approach than introducing more printk buffers.
Also, it will consolidate printings with headers.

Introduce show_stack_loglvl(), that eventually will substitute
show_stack().

Cc: James Hogan <jhogan@kernel.org>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: linux-mips@vger.kernel.org
[1]: https://lore.kernel.org/lkml/20190528002412.1625-1-dima@arista.com/T/#u
Signed-off-by: Dmitry Safonov <dima@arista.com>
---
 arch/mips/kernel/traps.c | 41 +++++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 861e79868055..11cdb16311e1 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -106,26 +106,26 @@ void (*board_bind_eic_interrupt)(int irq, int regset);
 void (*board_ebase_setup)(void);
 void(*board_cache_error_setup)(void);
 
-static void show_raw_backtrace(unsigned long reg29)
+static void show_raw_backtrace(unsigned long reg29, const char *loglvl)
 {
 	unsigned long *sp = (unsigned long *)(reg29 & ~3);
 	unsigned long addr;
 
-	printk("Call Trace:");
+	printk("%sCall Trace:", loglvl);
 #ifdef CONFIG_KALLSYMS
-	printk("\n");
+	printk("%s\n", loglvl);
 #endif
 	while (!kstack_end(sp)) {
 		unsigned long __user *p =
 			(unsigned long __user *)(unsigned long)sp++;
 		if (__get_user(addr, p)) {
-			printk(" (Bad stack address)");
+			printk("%s (Bad stack address)", loglvl);
 			break;
 		}
 		if (__kernel_text_address(addr))
-			print_ip_sym(KERN_DEFAULT, addr);
+			print_ip_sym(loglvl, addr);
 	}
-	printk("\n");
+	printk("%s\n", loglvl);
 }
 
 #ifdef CONFIG_KALLSYMS
@@ -138,7 +138,8 @@ static int __init set_raw_show_trace(char *str)
 __setup("raw_show_trace", set_raw_show_trace);
 #endif
 
-static void show_backtrace(struct task_struct *task, const struct pt_regs *regs)
+static void show_backtrace(struct task_struct *task, const struct pt_regs *regs,
+			   const char *loglvl)
 {
 	unsigned long sp = regs->regs[29];
 	unsigned long ra = regs->regs[31];
@@ -148,12 +149,12 @@ static void show_backtrace(struct task_struct *task, const struct pt_regs *regs)
 		task = current;
 
 	if (raw_show_trace || user_mode(regs) || !__kernel_text_address(pc)) {
-		show_raw_backtrace(sp);
+		show_raw_backtrace(sp, loglvl);
 		return;
 	}
-	printk("Call Trace:\n");
+	printk("%sCall Trace:\n", loglvl);
 	do {
-		print_ip_sym(KERN_DEFAULT, pc);
+		print_ip_sym(loglvl, pc);
 		pc = unwind_stack(task, &sp, pc, &ra);
 	} while (pc);
 	pr_cont("\n");
@@ -164,19 +165,19 @@ static void show_backtrace(struct task_struct *task, const struct pt_regs *regs)
  * with at least a bit of error checking ...
  */
 static void show_stacktrace(struct task_struct *task,
-	const struct pt_regs *regs)
+	const struct pt_regs *regs, const char *loglvl)
 {
 	const int field = 2 * sizeof(unsigned long);
 	long stackdata;
 	int i;
 	unsigned long __user *sp = (unsigned long __user *)regs->regs[29];
 
-	printk("Stack :");
+	printk("%sStack :", loglvl);
 	i = 0;
 	while ((unsigned long) sp & (PAGE_SIZE - 1)) {
 		if (i && ((i % (64 / field)) == 0)) {
 			pr_cont("\n");
-			printk("       ");
+			printk("%s       ", loglvl);
 		}
 		if (i > 39) {
 			pr_cont(" ...");
@@ -192,10 +193,11 @@ static void show_stacktrace(struct task_struct *task,
 		i++;
 	}
 	pr_cont("\n");
-	show_backtrace(task, regs);
+	show_backtrace(task, regs, loglvl);
 }
 
-void show_stack(struct task_struct *task, unsigned long *sp)
+void show_stack_loglvl(struct task_struct *task, unsigned long *sp,
+		       const char *loglvl)
 {
 	struct pt_regs regs;
 	mm_segment_t old_fs = get_fs();
@@ -224,10 +226,15 @@ void show_stack(struct task_struct *task, unsigned long *sp)
 	 * the stack in the kernel (not user) address space.
 	 */
 	set_fs(KERNEL_DS);
-	show_stacktrace(task, &regs);
+	show_stacktrace(task, &regs, loglvl);
 	set_fs(old_fs);
 }
 
+void show_stack(struct task_struct *task, unsigned long *sp)
+{
+	show_stack_loglvl(task, sp, KERN_DEFAULT)
+}
+
 static void show_code(unsigned int __user *pc)
 {
 	long i;
@@ -376,7 +383,7 @@ void show_registers(struct pt_regs *regs)
 	if (!user_mode(regs))
 		/* Necessary for getting the correct stack content */
 		set_fs(KERNEL_DS);
-	show_stacktrace(current, regs);
+	show_stacktrace(current, regs, KERN_DEFAULT);
 	show_code((unsigned int __user *) regs->cp0_epc);
 	printk("\n");
 	set_fs(old_fs);
-- 
2.23.0

