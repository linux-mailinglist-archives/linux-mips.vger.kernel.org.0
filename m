Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08DF52B19B1
	for <lists+linux-mips@lfdr.de>; Fri, 13 Nov 2020 12:11:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726492AbgKMLLi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 13 Nov 2020 06:11:38 -0500
Received: from mx2.suse.de ([195.135.220.15]:33046 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726625AbgKMLKP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 13 Nov 2020 06:10:15 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id A204DAF0C;
        Fri, 13 Nov 2020 11:10:12 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] MIPS: mm: Clean up setup of protection map
Date:   Fri, 13 Nov 2020 12:09:52 +0100
Message-Id: <20201113110952.68086-4-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20201113110952.68086-1-tsbogend@alpha.franken.de>
References: <20201113110952.68086-1-tsbogend@alpha.franken.de>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Protection map difference between RIXI and non RIXI cpus is _PAGE_NO_EXEC
and _PAGE_NO_READ usage. Both already take care of cpu_has_rixi while
setting up the page bits. So we just need one setup of protection map
and can drop the now unused (and broken for RIXI) PAGE_* defines.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/include/asm/pgtable.h |  8 ------
 arch/mips/mm/cache.c            | 55 ++++++++++++++---------------------------
 2 files changed, 18 insertions(+), 45 deletions(-)

diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index e5ef0fdd4838..158ba3aa3bf1 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -25,14 +25,6 @@
 struct mm_struct;
 struct vm_area_struct;
 
-#define PAGE_NONE	__pgprot(_PAGE_PRESENT | _PAGE_NO_READ | \
-				 _page_cachable_default)
-#define PAGE_SHARED	__pgprot(_PAGE_PRESENT | _PAGE_WRITE | \
-				 _page_cachable_default)
-#define PAGE_COPY	__pgprot(_PAGE_PRESENT | _PAGE_NO_EXEC | \
-				 _page_cachable_default)
-#define PAGE_READONLY	__pgprot(_PAGE_PRESENT | \
-				 _page_cachable_default)
 #define PAGE_KERNEL	__pgprot(_PAGE_PRESENT | __READABLE | __WRITEABLE | \
 				 _PAGE_GLOBAL | _page_cachable_default)
 #define PAGE_KERNEL_NC	__pgprot(_PAGE_PRESENT | __READABLE | __WRITEABLE | \
diff --git a/arch/mips/mm/cache.c b/arch/mips/mm/cache.c
index f66a8bfc030e..36bcf4e955e8 100644
--- a/arch/mips/mm/cache.c
+++ b/arch/mips/mm/cache.c
@@ -159,43 +159,24 @@ EXPORT_SYMBOL(_page_cachable_default);
 
 static inline void setup_protection_map(void)
 {
-	if (cpu_has_rixi) {
-		protection_map[0]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
-		protection_map[1]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC);
-		protection_map[2]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
-		protection_map[3]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC);
-		protection_map[4]  = PM(_PAGE_PRESENT);
-		protection_map[5]  = PM(_PAGE_PRESENT);
-		protection_map[6]  = PM(_PAGE_PRESENT);
-		protection_map[7]  = PM(_PAGE_PRESENT);
-
-		protection_map[8]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
-		protection_map[9]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC);
-		protection_map[10] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE | _PAGE_NO_READ);
-		protection_map[11] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE);
-		protection_map[12] = PM(_PAGE_PRESENT);
-		protection_map[13] = PM(_PAGE_PRESENT);
-		protection_map[14] = PM(_PAGE_PRESENT | _PAGE_WRITE);
-		protection_map[15] = PM(_PAGE_PRESENT | _PAGE_WRITE);
-
-	} else {
-		protection_map[0] = PAGE_NONE;
-		protection_map[1] = PAGE_READONLY;
-		protection_map[2] = PAGE_COPY;
-		protection_map[3] = PAGE_COPY;
-		protection_map[4] = PAGE_READONLY;
-		protection_map[5] = PAGE_READONLY;
-		protection_map[6] = PAGE_COPY;
-		protection_map[7] = PAGE_COPY;
-		protection_map[8] = PAGE_NONE;
-		protection_map[9] = PAGE_READONLY;
-		protection_map[10] = PAGE_SHARED;
-		protection_map[11] = PAGE_SHARED;
-		protection_map[12] = PAGE_READONLY;
-		protection_map[13] = PAGE_READONLY;
-		protection_map[14] = PAGE_SHARED;
-		protection_map[15] = PAGE_SHARED;
-	}
+	protection_map[0]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
+	protection_map[1]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC);
+	protection_map[2]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
+	protection_map[3]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC);
+	protection_map[4]  = PM(_PAGE_PRESENT);
+	protection_map[5]  = PM(_PAGE_PRESENT);
+	protection_map[6]  = PM(_PAGE_PRESENT);
+	protection_map[7]  = PM(_PAGE_PRESENT);
+
+	protection_map[8]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
+	protection_map[9]  = PM(_PAGE_PRESENT | _PAGE_NO_EXEC);
+	protection_map[10] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE |
+				_PAGE_NO_READ);
+	protection_map[11] = PM(_PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE);
+	protection_map[12] = PM(_PAGE_PRESENT);
+	protection_map[13] = PM(_PAGE_PRESENT);
+	protection_map[14] = PM(_PAGE_PRESENT | _PAGE_WRITE);
+	protection_map[15] = PM(_PAGE_PRESENT | _PAGE_WRITE);
 }
 
 #undef PM
-- 
2.16.4

