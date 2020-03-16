Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0FDE186D69
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2020 15:41:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731782AbgCPOlR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Mar 2020 10:41:17 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44240 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731753AbgCPOlR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 16 Mar 2020 10:41:17 -0400
Received: by mail-pg1-f195.google.com with SMTP id 37so9864811pgm.11
        for <linux-mips@vger.kernel.org>; Mon, 16 Mar 2020 07:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ec/qljJseUj42+qXdMKQ/Cdd1Nw68u70B1BF4qO5fFk=;
        b=PA43uhLJ4dV67BS6HBUW1ccyCma3ss0jBNt5wlVS4LOxSfNPNL/IWaKkGVIUVjAaFC
         nbfLb3nxu/T8w91QAEqS91k6z48VGZruAaM3bf59RowqJMsQUAuUZHntA45bT6+xHSFr
         TTW5IOs5I0KKhKbW5IVXXpXO+3joJjfP4mECiOi+TSCpENvT6YZKjDeIqpstPxDxURaY
         iiPoUqUWHnt4Eij8NLaw0V3Xf4QoJpYDhrTN939zuVNpTB9SCHIEKKMDidgHPkxXSMsy
         WLJVfutOCTbKWle2w+hxBnA1rOZbPKqTnd6LnFPg1TQterEsldTsSp1POiKrWb9/2CWs
         hHyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ec/qljJseUj42+qXdMKQ/Cdd1Nw68u70B1BF4qO5fFk=;
        b=Ged9dO8N6M73NZ3y3jKVIJHz58ul8EvxtJGl94ucWk+tU33S/0o63ZhjRnfQct5as1
         eTJnBtMQqTRFWrXUMvPuzbCNDNhe5PbDekggwK34sGj58ldsPSSj3c52B7kwfYUEV97z
         10y+w7/ita7Qv/fDf9t02EYrIc+v+I8p6OoqmI3juraP3Ly7pdTC4yJPe2eqRovYQVPu
         XR3YHT9XMkChFmaUFRMvhvk7r3WUQGeOG+UuqUA0aQmgoxiaQAtLmI6hXnY1o9V0gdWj
         WCo76tpGfnbZVtATAYigyFmdND+Io2HlpcOaqJIfPu2bLF8VrAlmv94J2WCEWPuuoJ6+
         aRRA==
X-Gm-Message-State: ANhLgQ0XMX8vkvILpkJnjVgg2cVftFF5/0cxSabt6WZ1F+4xxn7qlDt2
        bVSHIhrk+9cXd36H8UostkkYWQ==
X-Google-Smtp-Source: ADFU+vv9fNvlM9VkE8msbeFBPvyd020Kc7WOA9oT9awJJ2vvJOtgZ7ZP3GfmK6w+s097m3AxgtVHNg==
X-Received: by 2002:aa7:961c:: with SMTP id q28mr9311527pfg.177.1584369675909;
        Mon, 16 Mar 2020 07:41:15 -0700 (PDT)
Received: from Mindolluin.aristanetworks.com ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
        by smtp.gmail.com with ESMTPSA id i2sm81524pjs.21.2020.03.16.07.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 07:41:15 -0700 (PDT)
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
Subject: [PATCHv2 21/50] mips: Add show_stack_loglvl()
Date:   Mon, 16 Mar 2020 14:38:47 +0000
Message-Id: <20200316143916.195608-22-dima@arista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200316143916.195608-1-dima@arista.com>
References: <20200316143916.195608-1-dima@arista.com>
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
2.25.1

