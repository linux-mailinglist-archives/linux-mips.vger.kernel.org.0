Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E146A355F34
	for <lists+linux-mips@lfdr.de>; Wed,  7 Apr 2021 01:03:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234550AbhDFXEC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Apr 2021 19:04:02 -0400
Received: from mx2.suse.de ([195.135.220.15]:55872 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233379AbhDFXEC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 6 Apr 2021 19:04:02 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 9457EB01F;
        Tue,  6 Apr 2021 23:03:52 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Fix new sparse warning
Date:   Wed,  7 Apr 2021 01:03:48 +0200
Message-Id: <20210406230348.130713-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit 45deb5faeb9e ("MIPS: uaccess: Remove get_fs/set_fs call sites")
caused a few new sparse warning, fix them.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/kernel/access-helper.h | 7 ++++---
 arch/mips/kernel/unaligned.c     | 6 +++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/mips/kernel/access-helper.h b/arch/mips/kernel/access-helper.h
index dd5b502813b8..590388031503 100644
--- a/arch/mips/kernel/access-helper.h
+++ b/arch/mips/kernel/access-helper.h
@@ -4,15 +4,16 @@
 
 static inline int __get_addr(unsigned long *a, unsigned long *p, bool user)
 {
-	return user ? get_user(*a, p) : get_kernel_nofault(*a, p);
+	return user ? get_user(*a, (unsigned long __user *)p) :
+		      get_kernel_nofault(*a, p);
 }
 
 static inline int __get_inst16(u16 *i, u16 *p, bool user)
 {
-	return user ? get_user(*i, p) : get_kernel_nofault(*i, p);
+	return user ? get_user(*i, (u16 __user *)p) : get_kernel_nofault(*i, p);
 }
 
 static inline int __get_inst32(u32 *i, u32 *p, bool user)
 {
-	return user ? get_user(*i, p) : get_kernel_nofault(*i, p);
+	return user ? get_user(*i, (u32 __user *)p) : get_kernel_nofault(*i, p);
 }
diff --git a/arch/mips/kernel/unaligned.c b/arch/mips/kernel/unaligned.c
index 1f3b20a8c377..df4b708c04a9 100644
--- a/arch/mips/kernel/unaligned.c
+++ b/arch/mips/kernel/unaligned.c
@@ -109,7 +109,7 @@ static u32 unaligned_action;
 extern void show_registers(struct pt_regs *regs);
 
 static void emulate_load_store_insn(struct pt_regs *regs,
-	void __user *addr, unsigned int __user *pc)
+	void __user *addr, unsigned int *pc)
 {
 	unsigned long origpc, orig31, value;
 	union mips_instruction insn;
@@ -1475,7 +1475,7 @@ static void emulate_load_store_MIPS16e(struct pt_regs *regs, void __user * addr)
 asmlinkage void do_ade(struct pt_regs *regs)
 {
 	enum ctx_state prev_state;
-	unsigned int __user *pc;
+	unsigned int *pc;
 
 	prev_state = exception_enter();
 	perf_sw_event(PERF_COUNT_SW_ALIGNMENT_FAULTS,
@@ -1526,7 +1526,7 @@ asmlinkage void do_ade(struct pt_regs *regs)
 
 	if (unaligned_action == UNALIGNED_ACTION_SHOW)
 		show_registers(regs);
-	pc = (unsigned int __user *)exception_epc(regs);
+	pc = (unsigned int *)exception_epc(regs);
 
 	emulate_load_store_insn(regs, (void __user *)regs->cp0_badvaddr, pc);
 
-- 
2.29.2

