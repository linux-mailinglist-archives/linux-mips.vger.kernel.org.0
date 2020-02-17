Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF9C81609BF
	for <lists+linux-mips@lfdr.de>; Mon, 17 Feb 2020 06:04:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbgBQFEV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 17 Feb 2020 00:04:21 -0500
Received: from foss.arm.com ([217.140.110.172]:57504 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726294AbgBQFEU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 17 Feb 2020 00:04:20 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B8081FB;
        Sun, 16 Feb 2020 21:04:20 -0800 (PST)
Received: from p8cg001049571a15.blr.arm.com (p8cg001049571a15.blr.arm.com [10.162.16.95])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3017F3F703;
        Sun, 16 Feb 2020 21:04:13 -0800 (PST)
From:   Anshuman Khandual <anshuman.khandual@arm.com>
To:     linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc:     Anshuman Khandual <anshuman.khandual@arm.com>,
        Guo Ren <guoren@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mel Gorman <mgorman@suse.de>, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-sh@vger.kernel.org
Subject: [PATCH 2/5] mm/vma: Make vma_is_accessible() available for general use
Date:   Mon, 17 Feb 2020 10:33:50 +0530
Message-Id: <1581915833-21984-3-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581915833-21984-1-git-send-email-anshuman.khandual@arm.com>
References: <1581915833-21984-1-git-send-email-anshuman.khandual@arm.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Lets move vma_is_accessible() helper to include/linux/mm.h which makes it
available for general use. While here, this replaces all remaining open
encodings for VMA access check with vma_is_accessible().

Cc: Guo Ren <guoren@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Mel Gorman <mgorman@suse.de>
Cc: linux-kernel@vger.kernel.org
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-mips@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-sh@vger.kernel.org
Cc: linux-mm@kvack.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/csky/mm/fault.c    | 2 +-
 arch/m68k/mm/fault.c    | 2 +-
 arch/mips/mm/fault.c    | 2 +-
 arch/powerpc/mm/fault.c | 2 +-
 arch/sh/mm/fault.c      | 2 +-
 arch/x86/mm/fault.c     | 2 +-
 include/linux/mm.h      | 5 +++++
 kernel/sched/fair.c     | 2 +-
 mm/gup.c                | 2 +-
 mm/memory.c             | 5 -----
 mm/mempolicy.c          | 3 +--
 11 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/arch/csky/mm/fault.c b/arch/csky/mm/fault.c
index f76618b630f9..4b3511b8298d 100644
--- a/arch/csky/mm/fault.c
+++ b/arch/csky/mm/fault.c
@@ -137,7 +137,7 @@ asmlinkage void do_page_fault(struct pt_regs *regs, unsigned long write,
 		if (!(vma->vm_flags & VM_WRITE))
 			goto bad_area;
 	} else {
-		if (!(vma->vm_flags & (VM_READ | VM_WRITE | VM_EXEC)))
+		if (!vma_is_accessible(vma))
 			goto bad_area;
 	}
 
diff --git a/arch/m68k/mm/fault.c b/arch/m68k/mm/fault.c
index e9b1d7585b43..d5131ec5d923 100644
--- a/arch/m68k/mm/fault.c
+++ b/arch/m68k/mm/fault.c
@@ -125,7 +125,7 @@ int do_page_fault(struct pt_regs *regs, unsigned long address,
 		case 1:		/* read, present */
 			goto acc_err;
 		case 0:		/* read, not present */
-			if (!(vma->vm_flags & (VM_READ | VM_EXEC | VM_WRITE)))
+			if (!vma_is_accessible(vma))
 				goto acc_err;
 	}
 
diff --git a/arch/mips/mm/fault.c b/arch/mips/mm/fault.c
index 1e8d00793784..5b9f947bfa32 100644
--- a/arch/mips/mm/fault.c
+++ b/arch/mips/mm/fault.c
@@ -142,7 +142,7 @@ static void __kprobes __do_page_fault(struct pt_regs *regs, unsigned long write,
 				goto bad_area;
 			}
 		} else {
-			if (!(vma->vm_flags & (VM_READ | VM_WRITE | VM_EXEC)))
+			if (!vma_is_accessible(vma))
 				goto bad_area;
 		}
 	}
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 8db0507619e2..71a3658c516b 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -314,7 +314,7 @@ static bool access_error(bool is_write, bool is_exec,
 		return false;
 	}
 
-	if (unlikely(!(vma->vm_flags & (VM_READ | VM_EXEC | VM_WRITE))))
+	if (unlikely(!vma_is_accessible(vma)))
 		return true;
 	/*
 	 * We should ideally do the vma pkey access check here. But in the
diff --git a/arch/sh/mm/fault.c b/arch/sh/mm/fault.c
index 5f51456f4fc7..a8c4253f37d7 100644
--- a/arch/sh/mm/fault.c
+++ b/arch/sh/mm/fault.c
@@ -355,7 +355,7 @@ static inline int access_error(int error_code, struct vm_area_struct *vma)
 		return 1;
 
 	/* read, not present: */
-	if (unlikely(!(vma->vm_flags & (VM_READ | VM_EXEC | VM_WRITE))))
+	if (unlikely(!vma_is_accessible(vma)))
 		return 1;
 
 	return 0;
diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
index fa4ea09593ab..c461eaab0306 100644
--- a/arch/x86/mm/fault.c
+++ b/arch/x86/mm/fault.c
@@ -1200,7 +1200,7 @@ access_error(unsigned long error_code, struct vm_area_struct *vma)
 		return 1;
 
 	/* read, not present: */
-	if (unlikely(!(vma->vm_flags & (VM_READ | VM_EXEC | VM_WRITE))))
+	if (unlikely(!vma_is_accessible(vma)))
 		return 1;
 
 	return 0;
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 52269e56c514..b0e53ef13ff1 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -541,6 +541,11 @@ static inline bool vma_is_anonymous(struct vm_area_struct *vma)
 	return !vma->vm_ops;
 }
 
+static inline bool vma_is_accessible(struct vm_area_struct *vma)
+{
+	return vma->vm_flags & (VM_READ | VM_WRITE | VM_EXEC);
+}
+
 #ifdef CONFIG_SHMEM
 /*
  * The vma_is_shmem is not inline because it is used only by slow
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index fe4e0d775375..6ce54d57dd09 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -2573,7 +2573,7 @@ static void task_numa_work(struct callback_head *work)
 		 * Skip inaccessible VMAs to avoid any confusion between
 		 * PROT_NONE and NUMA hinting ptes
 		 */
-		if (!(vma->vm_flags & (VM_READ | VM_EXEC | VM_WRITE)))
+		if (!vma_is_accessible(vma))
 			continue;
 
 		do {
diff --git a/mm/gup.c b/mm/gup.c
index 1b521e0ac1de..c8ffe2e61f03 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1171,7 +1171,7 @@ long populate_vma_page_range(struct vm_area_struct *vma,
 	 * We want mlock to succeed for regions that have any permissions
 	 * other than PROT_NONE.
 	 */
-	if (vma->vm_flags & (VM_READ | VM_WRITE | VM_EXEC))
+	if (vma_is_accessible(vma))
 		gup_flags |= FOLL_FORCE;
 
 	/*
diff --git a/mm/memory.c b/mm/memory.c
index 0bccc622e482..2f07747612b7 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3942,11 +3942,6 @@ static inline vm_fault_t wp_huge_pmd(struct vm_fault *vmf, pmd_t orig_pmd)
 	return VM_FAULT_FALLBACK;
 }
 
-static inline bool vma_is_accessible(struct vm_area_struct *vma)
-{
-	return vma->vm_flags & (VM_READ | VM_EXEC | VM_WRITE);
-}
-
 static vm_fault_t create_huge_pud(struct vm_fault *vmf)
 {
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 977c641f78cf..91c1ad6ab8ea 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -649,8 +649,7 @@ static int queue_pages_test_walk(unsigned long start, unsigned long end,
 
 	if (flags & MPOL_MF_LAZY) {
 		/* Similar to task_numa_work, skip inaccessible VMAs */
-		if (!is_vm_hugetlb_page(vma) &&
-			(vma->vm_flags & (VM_READ | VM_EXEC | VM_WRITE)) &&
+		if (!is_vm_hugetlb_page(vma) && vma_is_accessible(vma) &&
 			!(vma->vm_flags & VM_MIXEDMAP))
 			change_prot_numa(vma, start, endvma);
 		return 1;
-- 
2.20.1

