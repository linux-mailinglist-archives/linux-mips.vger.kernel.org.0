Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8638186D43
	for <lists+linux-mips@lfdr.de>; Mon, 16 Mar 2020 15:39:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731507AbgCPOjv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Mar 2020 10:39:51 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35164 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731536AbgCPOju (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 16 Mar 2020 10:39:50 -0400
Received: by mail-pg1-f194.google.com with SMTP id 7so9882492pgr.2
        for <linux-mips@vger.kernel.org>; Mon, 16 Mar 2020 07:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AD7FtBEtTdopzK9pUfhZrq115V9s5XIG8+/OzSZ3Wto=;
        b=beK8PCLhYD1dsLDpHJqB8TGxb7jQ3ongo5w6XNyZETLY4DBFCgV6vo1/Kg3D8/g9TT
         jDa7CyqwP6bvlCprkI5tDSFMoUTXcgwB6uiucd06U6ZutTR34GpztaaDBilSTUraD1lA
         f/sVZKw2N5UEeOUhzymaK7xfM/UqWtoxrBrSlOhsigCrjhc+WFJYpHUVUYs7cGMJppAS
         colGDPgTSwUmsuiSnMYX1LLvGitITGH21NbuQ3oavInbU/YFwa6DgCpLfDhW/TG0VVFn
         5v9nH08IShEv4OkMwS2q4yMf4YwLYG0Rq9f0GIRPBZfSeSOOUH3EMyyFpIsO01TXv07a
         O17Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AD7FtBEtTdopzK9pUfhZrq115V9s5XIG8+/OzSZ3Wto=;
        b=mqM5weImNqBHMozwgc6A1rS+o2ezBVraD9Onni4fQwCqwF5kjMDuKgKwou9SamJgOP
         XmQLiOcozQKteilTRKvaVLfk8g4mWnXY+irOqfZaG0JDq6nGwSilAH8DrpDbnAEuYWNt
         GEgxzPysXG1xGaCg0I8Zzx0YqFwmUE06uaKwjTPVfvgOEAgCMGYW3FDH3cG8RY14E6GG
         UfirR1YyYAwtYAbr3oljCwkBamoJ/NpyDAvDQPQ2aYpnSaqtyVsmcS6A93h1D29uLTKf
         FWo5DEQJc6Kq1C/HmLo5Ctozk3w7jimWx8mX8AqoADNDXg59cj1mbeoedEZS6uQrsRSJ
         0q4Q==
X-Gm-Message-State: ANhLgQ2sWmNNPdECiUWWBQZNQRhno5JQlgIUU0RbC31/Gz1AElvnZ0cw
        5w8M7SYAJy6jxdr2dBmGnP6fpA==
X-Google-Smtp-Source: ADFU+vu68iG0TnbKfTTHZ6jUwW0TjWy3ZYyyMw5wypW0qWK6v9wnWEf9y1k4iDUr1GuSU5GTgBbgdw==
X-Received: by 2002:a62:7d4e:: with SMTP id y75mr5644pfc.32.1584369586818;
        Mon, 16 Mar 2020 07:39:46 -0700 (PDT)
Received: from Mindolluin.aristanetworks.com ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
        by smtp.gmail.com with ESMTPSA id i2sm81524pjs.21.2020.03.16.07.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 07:39:46 -0700 (PDT)
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
        Albert Ou <aou@eecs.berkeley.edu>,
        Ben Segall <bsegall@google.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Greentime Hu <green.hu@gmail.com>,
        Ingo Molnar <mingo@redhat.com>,
        James Hogan <jhogan@kernel.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Mel Gorman <mgorman@suse.de>, Michal Simek <monstr@monstr.eu>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Burton <paulburton@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincent Chen <deanbo422@gmail.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Will Deacon <will@kernel.org>, linux-mips@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [PATCHv2 01/50] kallsyms/printk: Add loglvl to print_ip_sym()
Date:   Mon, 16 Mar 2020 14:38:27 +0000
Message-Id: <20200316143916.195608-2-dima@arista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200316143916.195608-1-dima@arista.com>
References: <20200316143916.195608-1-dima@arista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

print_ip_sym() needs to have a log level parameter to comply with other
parts being printed. Otherwise, half of the expected backtrace would be
printed and other may be missing with some logging level.

The following callee(s) are using now the adjusted log level:
- microblaze/unwind: the same level as headers & userspace unwind.
  Note that pr_debug()'s there are for debugging the unwinder itself.
- nds32/traps: symbol addresses are printed with the same log level
  as backtrace headers.
- lockdep: ip for locking issues is printed with the same log level
  as other part of the warning.
- sched: ip where preemption was disabled is printed as error like
  the rest part of the message.
- ftrace: bug reports are now consistent in the log level being used.

Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Ben Segall <bsegall@google.com>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Greentime Hu <green.hu@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: James Hogan <jhogan@kernel.org>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Michal Simek <monstr@monstr.eu>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Vincent Chen <deanbo422@gmail.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Will Deacon <will@kernel.org>
Cc: linux-mips@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
Signed-off-by: Dmitry Safonov <dima@arista.com>
---
 arch/microblaze/kernel/unwind.c | 2 +-
 arch/mips/kernel/traps.c        | 4 ++--
 arch/nds32/kernel/traps.c       | 4 ++--
 arch/riscv/kernel/stacktrace.c  | 2 +-
 include/linux/kallsyms.h        | 4 ++--
 kernel/locking/lockdep.c        | 4 ++--
 kernel/sched/core.c             | 6 ++----
 kernel/trace/ftrace.c           | 8 ++++----
 tools/include/linux/kallsyms.h  | 2 +-
 9 files changed, 17 insertions(+), 19 deletions(-)

diff --git a/arch/microblaze/kernel/unwind.c b/arch/microblaze/kernel/unwind.c
index 34c270cb11fc..4241cdd28ee7 100644
--- a/arch/microblaze/kernel/unwind.c
+++ b/arch/microblaze/kernel/unwind.c
@@ -254,7 +254,7 @@ static void microblaze_unwind_inner(struct task_struct *task,
 					task->comm);
 				break;
 			} else
-				print_ip_sym(pc);
+				print_ip_sym(KERN_INFO, pc);
 		}
 
 		/* Stop when we reach anything not part of the kernel */
diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 31968cbd6464..de05503c680c 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -123,7 +123,7 @@ static void show_raw_backtrace(unsigned long reg29)
 			break;
 		}
 		if (__kernel_text_address(addr))
-			print_ip_sym(addr);
+			print_ip_sym(KERN_DEFAULT, addr);
 	}
 	printk("\n");
 }
@@ -153,7 +153,7 @@ static void show_backtrace(struct task_struct *task, const struct pt_regs *regs)
 	}
 	printk("Call Trace:\n");
 	do {
-		print_ip_sym(pc);
+		print_ip_sym(KERN_DEFAULT, pc);
 		pc = unwind_stack(task, &sp, pc, &ra);
 	} while (pc);
 	pr_cont("\n");
diff --git a/arch/nds32/kernel/traps.c b/arch/nds32/kernel/traps.c
index f4d386b52622..40625760a125 100644
--- a/arch/nds32/kernel/traps.c
+++ b/arch/nds32/kernel/traps.c
@@ -108,7 +108,7 @@ static void __dump(struct task_struct *tsk, unsigned long *base_reg)
 			if (__kernel_text_address(ret_addr)) {
 				ret_addr = ftrace_graph_ret_addr(
 						tsk, &graph, ret_addr, NULL);
-				print_ip_sym(ret_addr);
+				print_ip_sym(KERN_EMERG, ret_addr);
 			}
 			if (--cnt < 0)
 				break;
@@ -124,7 +124,7 @@ static void __dump(struct task_struct *tsk, unsigned long *base_reg)
 
 				ret_addr = ftrace_graph_ret_addr(
 						tsk, &graph, ret_addr, NULL);
-				print_ip_sym(ret_addr);
+				print_ip_sym(KERN_EMERG, ret_addr);
 			}
 			if (--cnt < 0)
 				break;
diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index 0940681d2f68..a76892b48fff 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -98,7 +98,7 @@ static void notrace walk_stackframe(struct task_struct *task,
 
 static bool print_trace_address(unsigned long pc, void *arg)
 {
-	print_ip_sym(pc);
+	print_ip_sym(KERN_DEFAULT, pc);
 	return false;
 }
 
diff --git a/include/linux/kallsyms.h b/include/linux/kallsyms.h
index 657a83b943f0..98338dc6b5d2 100644
--- a/include/linux/kallsyms.h
+++ b/include/linux/kallsyms.h
@@ -165,9 +165,9 @@ static inline int kallsyms_show_value(void)
 
 #endif /*CONFIG_KALLSYMS*/
 
-static inline void print_ip_sym(unsigned long ip)
+static inline void print_ip_sym(const char *loglvl, unsigned long ip)
 {
-	printk("[<%px>] %pS\n", (void *) ip, (void *) ip);
+	printk("%s[<%px>] %pS\n", loglvl, (void *) ip, (void *) ip);
 }
 
 #endif /*_LINUX_KALLSYMS_H*/
diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index 32406ef0d6a2..af819bb6874b 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -3998,7 +3998,7 @@ static void print_unlock_imbalance_bug(struct task_struct *curr,
 		curr->comm, task_pid_nr(curr));
 	print_lockdep_cache(lock);
 	pr_cont(") at:\n");
-	print_ip_sym(ip);
+	print_ip_sym(KERN_WARNING, ip);
 	pr_warn("but there are no more locks to release!\n");
 	pr_warn("\nother info that might help us debug this:\n");
 	lockdep_print_held_locks(curr);
@@ -4600,7 +4600,7 @@ static void print_lock_contention_bug(struct task_struct *curr,
 		curr->comm, task_pid_nr(curr));
 	print_lockdep_cache(lock);
 	pr_cont(") at:\n");
-	print_ip_sym(ip);
+	print_ip_sym(KERN_WARNING, ip);
 	pr_warn("but there are no locks held!\n");
 	pr_warn("\nother info that might help us debug this:\n");
 	lockdep_print_held_locks(curr);
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 1a9983da4408..2284deb3a83b 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3858,8 +3858,7 @@ static noinline void __schedule_bug(struct task_struct *prev)
 	if (IS_ENABLED(CONFIG_DEBUG_PREEMPT)
 	    && in_atomic_preempt_off()) {
 		pr_err("Preemption disabled at:");
-		print_ip_sym(preempt_disable_ip);
-		pr_cont("\n");
+		print_ip_sym(KERN_ERR, preempt_disable_ip);
 	}
 	if (panic_on_warn)
 		panic("scheduling while atomic\n");
@@ -6792,8 +6791,7 @@ void ___might_sleep(const char *file, int line, int preempt_offset)
 	if (IS_ENABLED(CONFIG_DEBUG_PREEMPT)
 	    && !preempt_count_equals(preempt_offset)) {
 		pr_err("Preemption disabled at:");
-		print_ip_sym(preempt_disable_ip);
-		pr_cont("\n");
+		print_ip_sym(KERN_ERR, preempt_disable_ip);
 	}
 	dump_stack();
 	add_taint(TAINT_WARN, LOCKDEP_STILL_OK);
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index fd81c7de77a7..c377e290ba54 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -2021,12 +2021,12 @@ void ftrace_bug(int failed, struct dyn_ftrace *rec)
 	case -EFAULT:
 		FTRACE_WARN_ON_ONCE(1);
 		pr_info("ftrace faulted on modifying ");
-		print_ip_sym(ip);
+		print_ip_sym(KERN_INFO, ip);
 		break;
 	case -EINVAL:
 		FTRACE_WARN_ON_ONCE(1);
 		pr_info("ftrace failed to modify ");
-		print_ip_sym(ip);
+		print_ip_sym(KERN_INFO, ip);
 		print_ip_ins(" actual:   ", (unsigned char *)ip);
 		pr_cont("\n");
 		if (ftrace_expected) {
@@ -2037,12 +2037,12 @@ void ftrace_bug(int failed, struct dyn_ftrace *rec)
 	case -EPERM:
 		FTRACE_WARN_ON_ONCE(1);
 		pr_info("ftrace faulted on writing ");
-		print_ip_sym(ip);
+		print_ip_sym(KERN_INFO, ip);
 		break;
 	default:
 		FTRACE_WARN_ON_ONCE(1);
 		pr_info("ftrace faulted on unknown error ");
-		print_ip_sym(ip);
+		print_ip_sym(KERN_INFO, ip);
 	}
 	print_bug_type();
 	if (rec) {
diff --git a/tools/include/linux/kallsyms.h b/tools/include/linux/kallsyms.h
index 89ca6fe257cc..efb6c3f5f2a9 100644
--- a/tools/include/linux/kallsyms.h
+++ b/tools/include/linux/kallsyms.h
@@ -20,7 +20,7 @@ static inline const char *kallsyms_lookup(unsigned long addr,
 
 #include <execinfo.h>
 #include <stdlib.h>
-static inline void print_ip_sym(unsigned long ip)
+static inline void print_ip_sym(const char *loglvl, unsigned long ip)
 {
 	char **name;
 
-- 
2.25.1

