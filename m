Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3ACD169E55
	for <lists+linux-mips@lfdr.de>; Mon, 24 Feb 2020 07:22:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbgBXGV7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Feb 2020 01:21:59 -0500
Received: from foss.arm.com ([217.140.110.172]:58612 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726509AbgBXGV7 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Feb 2020 01:21:59 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED65D30E;
        Sun, 23 Feb 2020 22:21:58 -0800 (PST)
Received: from p8cg001049571a15.blr.arm.com (p8cg001049571a15.blr.arm.com [10.162.16.95])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B2B4E3F534;
        Sun, 23 Feb 2020 22:25:45 -0800 (PST)
From:   Anshuman Khandual <anshuman.khandual@arm.com>
To:     linux-mm@kvack.org
Cc:     Anshuman Khandual <anshuman.khandual@arm.com>,
        Guo Ren <guoren@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mm/vma: Append unlikely() while testing VMA access permissions
Date:   Mon, 24 Feb 2020 11:51:44 +0530
Message-Id: <1582525304-32113-1-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

It is unlikely that an inaccessible VMA without required permission flags
will get a page fault. Hence lets just append unlikely() directive to such
checks in order to improve performance while also standardizing it across
various platforms.

Cc: Guo Ren <guoren@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Mike Rapoport <rppt@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-m68k@lists.linux-m68k.org
Cc: linux-mips@vger.kernel.org
Cc: linux-csky@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This patch applies on v5.6-rc3 along with the recent VMA series V2
(https://patchwork.kernel.org/cover/11399319/). This has only been
build tested for mips and m68k platforms.

 arch/csky/mm/fault.c | 2 +-
 arch/m68k/mm/fault.c | 2 +-
 arch/mips/mm/fault.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/csky/mm/fault.c b/arch/csky/mm/fault.c
index 4b3511b8298d..01caae98c350 100644
--- a/arch/csky/mm/fault.c
+++ b/arch/csky/mm/fault.c
@@ -137,7 +137,7 @@ asmlinkage void do_page_fault(struct pt_regs *regs, unsigned long write,
 		if (!(vma->vm_flags & VM_WRITE))
 			goto bad_area;
 	} else {
-		if (!vma_is_accessible(vma))
+		if (unlikely(!vma_is_accessible(vma)))
 			goto bad_area;
 	}
 
diff --git a/arch/m68k/mm/fault.c b/arch/m68k/mm/fault.c
index d5131ec5d923..d5dd75ed77f1 100644
--- a/arch/m68k/mm/fault.c
+++ b/arch/m68k/mm/fault.c
@@ -125,7 +125,7 @@ int do_page_fault(struct pt_regs *regs, unsigned long address,
 		case 1:		/* read, present */
 			goto acc_err;
 		case 0:		/* read, not present */
-			if (!vma_is_accessible(vma))
+			if (unlikely(!vma_is_accessible(vma)))
 				goto acc_err;
 	}
 
diff --git a/arch/mips/mm/fault.c b/arch/mips/mm/fault.c
index 5b9f947bfa32..db4b51a40c58 100644
--- a/arch/mips/mm/fault.c
+++ b/arch/mips/mm/fault.c
@@ -142,7 +142,7 @@ static void __kprobes __do_page_fault(struct pt_regs *regs, unsigned long write,
 				goto bad_area;
 			}
 		} else {
-			if (!vma_is_accessible(vma))
+			if (unlikely(!vma_is_accessible(vma)))
 				goto bad_area;
 		}
 	}
-- 
2.20.1

