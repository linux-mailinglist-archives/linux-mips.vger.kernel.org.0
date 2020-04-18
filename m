Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 079421AF4D8
	for <lists+linux-mips@lfdr.de>; Sat, 18 Apr 2020 22:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728512AbgDRUUX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 18 Apr 2020 16:20:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728493AbgDRUUT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sat, 18 Apr 2020 16:20:19 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FC1BC061A10
        for <linux-mips@vger.kernel.org>; Sat, 18 Apr 2020 13:20:19 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id r26so6794190wmh.0
        for <linux-mips@vger.kernel.org>; Sat, 18 Apr 2020 13:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KXthq0beVn1b/Jm4pPQNCj7aWxL8Gh4NNaBiyfVk3X0=;
        b=R0MRfBV9Gd66haBi9D3ueClx5ZSnhLckdmjiQzJOv2IPsF0ru2js1A1Cp4mL2iX6lk
         JCOMPVi58fnnFkGaf1zOkp0aOFFHD3rtq0m6mnuNKdYpaRSpgXoZB0U3lfwcXKX8cHEh
         CPE2sNS61aIkdpigc5XBKmkp4QWdPXUbHWLg/F+2w3yxQ1C3DVPcdiYKIbBnIegxa0Wt
         QHLWpfWupDmgfRrrZ/uLEkJw0BzZ2G22TsQgWqYaJyykbY4P1qYHmS2H1SNJAEQ//hPs
         d5J/ZtBfrYS7ev0m2e23zt0pnlIVJa5zfP0hZpu3eGc+B0MQaihhOhchHsdgVtfqywds
         r/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KXthq0beVn1b/Jm4pPQNCj7aWxL8Gh4NNaBiyfVk3X0=;
        b=dHIXpdTyduj8ccyo7v6U1q36ztNpdGY3418NExdu9AsVdnoMTnoGgWPuUD7l3xtdYN
         kz1jbYVKsVhNF5wrG22F99REC4Xh3mQ3c0JnilvienPnL/9U6BhaC9VOUJg0kHOcdJDM
         mNx86bpLuXcaJaK+CCafY34NOH80taw5H8oFcMHokHq++d+B51bA/3VfeKJ/MNfc+pOm
         eLLBac6CC7DCU5JhJrDFIqxkuF8q4+zkMXgpIgd8iLcscpdFtcB41OMb0lb00UbeuXwH
         j4rX+p5nYBTx6lAGJOBsPW9KaK1F6WxgZ3HkLYC01mkbKxlF6TGqUAdDqFBIhkTh/qe2
         RmPg==
X-Gm-Message-State: AGi0PuYEAq+ZHcnAjUsEaBIXcvRmSko86kKULq3pIXaz6wmBuqQ3GIKn
        7kIj+UjvKmrUOKvGsqid04+G9g==
X-Google-Smtp-Source: APiQypLwnprpKA3nWw7LWuFkawgnHDVEf+RYxFbPPV/WfkwBuJAhv71JQulxXE+mI1aG3QgmcvCz3Q==
X-Received: by 2002:a1c:ed04:: with SMTP id l4mr737085wmh.93.1587241218237;
        Sat, 18 Apr 2020 13:20:18 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
        by smtp.gmail.com with ESMTPSA id m1sm31735255wro.64.2020.04.18.13.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2020 13:20:17 -0700 (PDT)
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
Subject: [PATCHv3 21/50] mips: Add show_stack_loglvl()
Date:   Sat, 18 Apr 2020 21:19:15 +0100
Message-Id: <20200418201944.482088-22-dima@arista.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200418201944.482088-1-dima@arista.com>
References: <20200418201944.482088-1-dima@arista.com>
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
index de05503c680c..077aabbd6b9f 100644
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
@@ -219,10 +221,15 @@ void show_stack(struct task_struct *task, unsigned long *sp)
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
@@ -371,7 +378,7 @@ void show_registers(struct pt_regs *regs)
 	if (!user_mode(regs))
 		/* Necessary for getting the correct stack content */
 		set_fs(KERNEL_DS);
-	show_stacktrace(current, regs);
+	show_stacktrace(current, regs, KERN_DEFAULT);
 	show_code((unsigned int __user *) regs->cp0_epc);
 	printk("\n");
 	set_fs(old_fs);
-- 
2.26.0

