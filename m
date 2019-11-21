Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1833C1056E0
	for <lists+linux-mips@lfdr.de>; Thu, 21 Nov 2019 17:21:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727156AbfKUQVn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 21 Nov 2019 11:21:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:35458 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726690AbfKUQVn (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 21 Nov 2019 11:21:43 -0500
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6FBF3206CC;
        Thu, 21 Nov 2019 16:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574353302;
        bh=RnEFBHDdwEGFihJ8AzIy/xCeEYZct7GFoZ5Z9u+a4aI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pXHrARQDRu46esN1ekKRe4ytslAfURJlMOQ/+BshoqNvXxnAGzBc/D1wphvjRXmHR
         nbL3K/rjOf9ydRBjxnnfw1jb6kbzWeSNZ3sz02AgER46nW5udYYtRyLgQdXY1y121D
         WPxpstnDFphwMctEVNsP5nMLkLvV4j1/0v3FYZcc=
From:   Mike Rapoport <rppt@kernel.org>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCH 1/3] mips: fix build when "48 bits virtual memory" is enabled
Date:   Thu, 21 Nov 2019 18:21:31 +0200
Message-Id: <20191121162133.15833-2-rppt@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191121162133.15833-1-rppt@kernel.org>
References: <20191121162133.15833-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Mike Rapoport <rppt@linux.ibm.com>

With CONFIG_MIPS_VA_BITS_48=y the build fails miserably:

  CC      arch/mips/kernel/asm-offsets.s
In file included from arch/mips/include/asm/pgtable.h:644,
                 from include/linux/mm.h:99,
                 from arch/mips/kernel/asm-offsets.c:15:
include/asm-generic/pgtable.h:16:2: error: #error CONFIG_PGTABLE_LEVELS is not consistent with __PAGETABLE_{P4D,PUD,PMD}_FOLDED
 #error CONFIG_PGTABLE_LEVELS is not consistent with __PAGETABLE_{P4D,PUD,PMD}_FOLDED
  ^~~~~
include/asm-generic/pgtable.h:390:28: error: unknown type name 'p4d_t'; did you mean 'pmd_t'?
 static inline int p4d_same(p4d_t p4d_a, p4d_t p4d_b)
                            ^~~~~
                            pmd_t

[ ... more such errors ... ]

scripts/Makefile.build:99: recipe for target 'arch/mips/kernel/asm-offsets.s' failed
make[2]: *** [arch/mips/kernel/asm-offsets.s] Error 1

This happens because when CONFIG_MIPS_VA_BITS_48 enables 4th level of the
page tables, but neither pgtable-nop4d.h nor 5level-fixup.h are included to
cope with the 5th level.

Replace #ifdef conditions around includes of the pgtable-nop{m,u}d.h with
explicit CONFIG_PGTABLE_LEVELS and add include of 5level-fixup.h for the
case when CONFIG_PGTABLE_LEVELS==4

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/mips/include/asm/pgtable-64.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/mips/include/asm/pgtable-64.h b/arch/mips/include/asm/pgtable-64.h
index 93a9dce31f25..813dfe5f45a5 100644
--- a/arch/mips/include/asm/pgtable-64.h
+++ b/arch/mips/include/asm/pgtable-64.h
@@ -18,10 +18,12 @@
 #include <asm/fixmap.h>
 
 #define __ARCH_USE_5LEVEL_HACK
-#if defined(CONFIG_PAGE_SIZE_64KB) && !defined(CONFIG_MIPS_VA_BITS_48)
+#if CONFIG_PGTABLE_LEVELS == 2
 #include <asm-generic/pgtable-nopmd.h>
-#elif !(defined(CONFIG_PAGE_SIZE_4KB) && defined(CONFIG_MIPS_VA_BITS_48))
+#elif CONFIG_PGTABLE_LEVELS == 3
 #include <asm-generic/pgtable-nopud.h>
+#else
+#include <asm-generic/5level-fixup.h>
 #endif
 
 /*
@@ -216,6 +218,9 @@ static inline unsigned long pgd_page_vaddr(pgd_t pgd)
 	return pgd_val(pgd);
 }
 
+#define pgd_phys(pgd)		virt_to_phys((void *)pgd_val(pgd))
+#define pgd_page(pgd)		(pfn_to_page(pgd_phys(pgd) >> PAGE_SHIFT))
+
 static inline pud_t *pud_offset(pgd_t *pgd, unsigned long address)
 {
 	return (pud_t *)pgd_page_vaddr(*pgd) + pud_index(address);
-- 
2.24.0

