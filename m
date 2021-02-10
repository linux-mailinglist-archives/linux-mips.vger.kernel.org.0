Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB11A316AF3
	for <lists+linux-mips@lfdr.de>; Wed, 10 Feb 2021 17:17:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231996AbhBJQRT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Feb 2021 11:17:19 -0500
Received: from mx2.suse.de ([195.135.220.15]:42956 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230028AbhBJQRS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 10 Feb 2021 11:17:18 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id CDBD2B02C;
        Wed, 10 Feb 2021 16:16:35 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] Revert "MIPS: kernel: {ftrace,kgdb}: Set correct address limit for cache flushes"
Date:   Wed, 10 Feb 2021 17:16:13 +0100
Message-Id: <20210210161615.21228-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This reverts commit 6ebda44f366478d1eea180d93154e7d97b591f50.

All icache flushes in this code paths are done via flush_icache_range(),
which only uses normal cache instruction. And this is the correct thing
for EVA mode, too. So no need to do set_fs(KERNEL_DS) here.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/kernel/ftrace.c |  4 ----
 arch/mips/kernel/kgdb.c   | 18 +-----------------
 2 files changed, 1 insertion(+), 21 deletions(-)

diff --git a/arch/mips/kernel/ftrace.c b/arch/mips/kernel/ftrace.c
index f57e68f40a34..666b9969c1bd 100644
--- a/arch/mips/kernel/ftrace.c
+++ b/arch/mips/kernel/ftrace.c
@@ -73,7 +73,6 @@ static inline void ftrace_dyn_arch_init_insns(void)
 static int ftrace_modify_code(unsigned long ip, unsigned int new_code)
 {
 	int faulted;
-	mm_segment_t old_fs;
 
 	/* *(unsigned int *)ip = new_code; */
 	safe_store_code(new_code, ip, faulted);
@@ -81,10 +80,7 @@ static int ftrace_modify_code(unsigned long ip, unsigned int new_code)
 	if (unlikely(faulted))
 		return -EFAULT;
 
-	old_fs = get_fs();
-	set_fs(KERNEL_DS);
 	flush_icache_range(ip, ip + 8);
-	set_fs(old_fs);
 
 	return 0;
 }
diff --git a/arch/mips/kernel/kgdb.c b/arch/mips/kernel/kgdb.c
index ea781b29f7f1..de779e23faf2 100644
--- a/arch/mips/kernel/kgdb.c
+++ b/arch/mips/kernel/kgdb.c
@@ -32,7 +32,6 @@
 #include <asm/cacheflush.h>
 #include <asm/processor.h>
 #include <asm/sigcontext.h>
-#include <linux/uaccess.h>
 #include <asm/irq_regs.h>
 
 static struct hard_trap_info {
@@ -210,14 +209,7 @@ void arch_kgdb_breakpoint(void)
 
 void kgdb_call_nmi_hook(void *ignored)
 {
-	mm_segment_t old_fs;
-
-	old_fs = get_fs();
-	set_fs(KERNEL_DS);
-
 	kgdb_nmicallback(raw_smp_processor_id(), get_irq_regs());
-
-	set_fs(old_fs);
 }
 
 static int compute_signal(int tt)
@@ -302,7 +294,6 @@ static int kgdb_mips_notify(struct notifier_block *self, unsigned long cmd,
 	struct die_args *args = (struct die_args *)ptr;
 	struct pt_regs *regs = args->regs;
 	int trap = (regs->cp0_cause & 0x7c) >> 2;
-	mm_segment_t old_fs;
 
 #ifdef CONFIG_KPROBES
 	/*
@@ -317,17 +308,11 @@ static int kgdb_mips_notify(struct notifier_block *self, unsigned long cmd,
 	if (user_mode(regs))
 		return NOTIFY_DONE;
 
-	/* Kernel mode. Set correct address limit */
-	old_fs = get_fs();
-	set_fs(KERNEL_DS);
-
 	if (atomic_read(&kgdb_active) != -1)
 		kgdb_nmicallback(smp_processor_id(), regs);
 
-	if (kgdb_handle_exception(trap, compute_signal(trap), cmd, regs)) {
-		set_fs(old_fs);
+	if (kgdb_handle_exception(trap, compute_signal(trap), cmd, regs))
 		return NOTIFY_DONE;
-	}
 
 	if (atomic_read(&kgdb_setting_breakpoint))
 		if ((trap == 9) && (regs->cp0_epc == (unsigned long)breakinst))
@@ -337,7 +322,6 @@ static int kgdb_mips_notify(struct notifier_block *self, unsigned long cmd,
 	local_irq_enable();
 	__flush_cache_all();
 
-	set_fs(old_fs);
 	return NOTIFY_STOP;
 }
 
-- 
2.29.2

