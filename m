Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 689A7F0C52
	for <lists+linux-mips@lfdr.de>; Wed,  6 Nov 2019 04:06:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730585AbfKFDGM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 5 Nov 2019 22:06:12 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41281 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730562AbfKFDGM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 5 Nov 2019 22:06:12 -0500
Received: by mail-pl1-f195.google.com with SMTP id d29so4374980plj.8
        for <linux-mips@vger.kernel.org>; Tue, 05 Nov 2019 19:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HSPsN5AxRXcFzFJzQxd+YN63iH/ClAHwInFFkFsFbgo=;
        b=AA8n8y1xYDcs5QZPb4AQQOdt0lMzDK9MWRpIwAsoRpYC3ssbzNgOdabwY8zuisr4W7
         pYnNOVyD8ukGT/ch5n8vZoQ6TH9ffNhoCTEzIU57e2eKQjAf6rX55cmbIas4iAi6s9qV
         EK+KbWJiaUxWv3Lmm1XyBUxHntfPCKpc6GBMFRki+6zQ18gLOVsrXFRVWhOMV7bul4Yu
         +wTGydHsU9jyjF0mwaz/ScEbacImrVQgV3/6wyRSrel08/jHR6q5aPuWPZa7NrzyeL2d
         m6PFh7o/s5W7TdYMmUUP7tYTiiFE/WZyWno3rubKFBbAQoIpx5uZ+rGi3h33mdhr0DKE
         O8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HSPsN5AxRXcFzFJzQxd+YN63iH/ClAHwInFFkFsFbgo=;
        b=DGaRA1nyLafVMecGeLsCF40rUPnWWbjBY4MNJk1UBuWAjk5vQpVDX7Ew7FEUdFvEgJ
         CYF6ST8ID76dQU0Pi/znwhsQZcuO+LUG0Mm0BhY3HNFnxWNVmOu4yarPpv2sRKdU8JmD
         Li7VOInTZ/CTEvFQ/pUtPOoPIwzATPOOGFmcow6houvxqckE58hJgPQklWiyQ1zTlNST
         GP+miGjgdbwGUkilU7VXlfd50hKJ03C6QcjmPDUZ0uqYJUB7qha1j7LMqaFzOiVjh1QW
         CVFAv+pnzpuBnwqmFdLvoMsd3eKFw5aATnX/s0lhYwNShevQGkv+3dFmqP38g55t+78w
         w/1w==
X-Gm-Message-State: APjAAAWaazSf/L2ScEa4aUP9Et7tfm7A4Zb4wYYjODOgZ+5CqBkHucUv
        tQISbqDS554TQO8GHYQBOCVcRQ==
X-Google-Smtp-Source: APXvYqxnNpDZ4kAMrsjebnDPVg25uvanmzFPSGDmDJu/2XQmMp+k3jC2NPQCt4fi1drpeZiIfCOCOQ==
X-Received: by 2002:a17:902:6b8a:: with SMTP id p10mr180414plk.192.1573009571424;
        Tue, 05 Nov 2019 19:06:11 -0800 (PST)
Received: from Mindolluin.ire.aristanetworks.com ([217.173.96.166])
        by smtp.gmail.com with ESMTPSA id k24sm19570487pgl.6.2019.11.05.19.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2019 19:06:10 -0800 (PST)
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
Subject: [PATCH 01/50] kallsyms/printk: Add loglvl to print_ip_sym()
Date:   Wed,  6 Nov 2019 03:04:52 +0000
Message-Id: <20191106030542.868541-2-dima@arista.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191106030542.868541-1-dima@arista.com>
References: <20191106030542.868541-1-dima@arista.com>
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
Signed-off-by: Dmitry Safonov <dima@arista.com>
---
 arch/microblaze/kernel/unwind.c | 2 +-
 arch/mips/kernel/traps.c        | 4 ++--
 arch/nds32/kernel/traps.c       | 4 ++--
 arch/riscv/kernel/stacktrace.c  | 2 +-
 include/linux/kallsyms.h        | 4 ++--
 kernel/locking/lockdep.c        | 4 ++--
 kernel/sched/core.c             | 4 ++--
 kernel/trace/ftrace.c           | 8 ++++----
 8 files changed, 16 insertions(+), 16 deletions(-)

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
index 342e41de9d64..861e79868055 100644
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
index 233459c03b5a..914ff610b880 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -3999,7 +3999,7 @@ static void print_unlock_imbalance_bug(struct task_struct *curr,
 		curr->comm, task_pid_nr(curr));
 	print_lockdep_cache(lock);
 	pr_cont(") at:\n");
-	print_ip_sym(ip);
+	print_ip_sym(KERN_WARNING, ip);
 	pr_warn("but there are no more locks to release!\n");
 	pr_warn("\nother info that might help us debug this:\n");
 	lockdep_print_held_locks(curr);
@@ -4604,7 +4604,7 @@ static void print_lock_contention_bug(struct task_struct *curr,
 		curr->comm, task_pid_nr(curr));
 	print_lockdep_cache(lock);
 	pr_cont(") at:\n");
-	print_ip_sym(ip);
+	print_ip_sym(KERN_WARNING, ip);
 	pr_warn("but there are no locks held!\n");
 	pr_warn("\nother info that might help us debug this:\n");
 	lockdep_print_held_locks(curr);
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index dd05a378631a..774ff0d8dfe9 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3858,7 +3858,7 @@ static noinline void __schedule_bug(struct task_struct *prev)
 	if (IS_ENABLED(CONFIG_DEBUG_PREEMPT)
 	    && in_atomic_preempt_off()) {
 		pr_err("Preemption disabled at:");
-		print_ip_sym(preempt_disable_ip);
+		print_ip_sym(KERN_ERR, preempt_disable_ip);
 		pr_cont("\n");
 	}
 	if (panic_on_warn)
@@ -6774,7 +6774,7 @@ void ___might_sleep(const char *file, int line, int preempt_offset)
 	if (IS_ENABLED(CONFIG_DEBUG_PREEMPT)
 	    && !preempt_count_equals(preempt_offset)) {
 		pr_err("Preemption disabled at:");
-		print_ip_sym(preempt_disable_ip);
+		print_ip_sym(KERN_ERR, preempt_disable_ip);
 		pr_cont("\n");
 	}
 	dump_stack();
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index f296d89be757..04a95cdf414f 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -2002,12 +2002,12 @@ void ftrace_bug(int failed, struct dyn_ftrace *rec)
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
@@ -2018,12 +2018,12 @@ void ftrace_bug(int failed, struct dyn_ftrace *rec)
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
-- 
2.23.0

