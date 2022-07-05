Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB1C567331
	for <lists+linux-mips@lfdr.de>; Tue,  5 Jul 2022 17:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232238AbiGEPsL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 5 Jul 2022 11:48:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbiGEPrq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 5 Jul 2022 11:47:46 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B55951B794;
        Tue,  5 Jul 2022 08:47:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5EF8FB8181B;
        Tue,  5 Jul 2022 15:47:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95803C341CA;
        Tue,  5 Jul 2022 15:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657036063;
        bh=w1vvWwRXGrFGGCu3S45JmRiHVjmuU2Pk/iQYpri8uJ4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SKLmZZylYHnO/80wqksoONWkN54SXU8qc+mX3+RjzELCd1fPxVgn7swsX7KAbBMd5
         pW7SxY346GeQqKL6R2esMbYpaBd7qi9ETpPp8oyPmeyqssXAZ8suKCX7PUvw52oEib
         kFNQ0uR8kf4sGA3Xh/oJl5jqHLxausS0B+qg0Xrp0H+WL3F9l/NxligHhNEItt9g2z
         w+CIS2nTdOJbg8UtMNmYagdrDYzoKoYGLRkWCD8ZXhN10G1jl1AekWmakr51ptxMyS
         BQmXQdyJRlodScZpu8WHGJfMUhRMCzeCVVjAccXq3DkwMJUHXnze5S8NfWLbWfu9cW
         rZ9yMYpEHqw/Q==
From:   Mike Rapoport <rppt@kernel.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Dinh Nguyen <dinguyen@kernel.org>,
        Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
        Huacai Chen <chenhuacai@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Matthew Wilcox <willy@infradead.org>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Mike Rapoport <rppt@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        "Russell King (Oracle)" <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        WANG Xuerui <kernel@xen0n.name>, linux-arch@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-mm@kvack.org,
        linux-parisc@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        loongarch@lists.linux.dev
Subject: [PATCH v2 03/15] mips: Rename PMD_ORDER to PMD_TABLE_ORDER
Date:   Tue,  5 Jul 2022 18:46:56 +0300
Message-Id: <20220705154708.181258-4-rppt@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220705154708.181258-1-rppt@kernel.org>
References: <20220705154708.181258-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

This is the order of the page table allocation, not the order of a PMD.

While at it remove unused defintion of _PMD_ORDER in asm-offsets.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 arch/mips/include/asm/pgalloc.h    |  4 ++--
 arch/mips/include/asm/pgtable-32.h |  2 +-
 arch/mips/include/asm/pgtable-64.h | 18 +++++++++---------
 arch/mips/kernel/asm-offsets.c     |  3 ---
 4 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/arch/mips/include/asm/pgalloc.h b/arch/mips/include/asm/pgalloc.h
index 867e9c3db76e..0ef245cfcae9 100644
--- a/arch/mips/include/asm/pgalloc.h
+++ b/arch/mips/include/asm/pgalloc.h
@@ -67,12 +67,12 @@ static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
 	pmd_t *pmd;
 	struct page *pg;
 
-	pg = alloc_pages(GFP_KERNEL_ACCOUNT, PMD_ORDER);
+	pg = alloc_pages(GFP_KERNEL_ACCOUNT, PMD_TABLE_ORDER);
 	if (!pg)
 		return NULL;
 
 	if (!pgtable_pmd_page_ctor(pg)) {
-		__free_pages(pg, PMD_ORDER);
+		__free_pages(pg, PMD_TABLE_ORDER);
 		return NULL;
 	}
 
diff --git a/arch/mips/include/asm/pgtable-32.h b/arch/mips/include/asm/pgtable-32.h
index 95df9c293d8d..8d57bd5b0b94 100644
--- a/arch/mips/include/asm/pgtable-32.h
+++ b/arch/mips/include/asm/pgtable-32.h
@@ -82,7 +82,7 @@ extern int add_temporary_entry(unsigned long entrylo0, unsigned long entrylo1,
 
 #define PGD_ORDER	(__PGD_ORDER >= 0 ? __PGD_ORDER : 0)
 #define PUD_ORDER	aieeee_attempt_to_allocate_pud
-#define PMD_ORDER	aieeee_attempt_to_allocate_pmd
+#define PMD_TABLE_ORDER	aieeee_attempt_to_allocate_pmd
 #define PTE_ORDER	0
 
 #define PTRS_PER_PGD	(USER_PTRS_PER_PGD * 2)
diff --git a/arch/mips/include/asm/pgtable-64.h b/arch/mips/include/asm/pgtable-64.h
index 41921acdc9d8..ae0d5a09064d 100644
--- a/arch/mips/include/asm/pgtable-64.h
+++ b/arch/mips/include/asm/pgtable-64.h
@@ -51,12 +51,12 @@
 #define PMD_MASK	(~(PMD_SIZE-1))
 
 # ifdef __PAGETABLE_PUD_FOLDED
-# define PGDIR_SHIFT	(PMD_SHIFT + (PAGE_SHIFT + PMD_ORDER - 3))
+# define PGDIR_SHIFT	(PMD_SHIFT + (PAGE_SHIFT + PMD_TABLE_ORDER - 3))
 # endif
 #endif
 
 #ifndef __PAGETABLE_PUD_FOLDED
-#define PUD_SHIFT	(PMD_SHIFT + (PAGE_SHIFT + PMD_ORDER - 3))
+#define PUD_SHIFT	(PMD_SHIFT + (PAGE_SHIFT + PMD_TABLE_ORDER - 3))
 #define PUD_SIZE	(1UL << PUD_SHIFT)
 #define PUD_MASK	(~(PUD_SIZE-1))
 #define PGDIR_SHIFT	(PUD_SHIFT + (PAGE_SHIFT + PUD_ORDER - 3))
@@ -91,13 +91,13 @@
 #  define PGD_ORDER		1
 #  define PUD_ORDER		aieeee_attempt_to_allocate_pud
 # endif
-#define PMD_ORDER		0
+#define PMD_TABLE_ORDER		0
 #define PTE_ORDER		0
 #endif
 #ifdef CONFIG_PAGE_SIZE_8KB
 #define PGD_ORDER		0
 #define PUD_ORDER		aieeee_attempt_to_allocate_pud
-#define PMD_ORDER		0
+#define PMD_TABLE_ORDER		0
 #define PTE_ORDER		0
 #endif
 #ifdef CONFIG_PAGE_SIZE_16KB
@@ -107,22 +107,22 @@
 #define PGD_ORDER               0
 #endif
 #define PUD_ORDER		aieeee_attempt_to_allocate_pud
-#define PMD_ORDER		0
+#define PMD_TABLE_ORDER		0
 #define PTE_ORDER		0
 #endif
 #ifdef CONFIG_PAGE_SIZE_32KB
 #define PGD_ORDER		0
 #define PUD_ORDER		aieeee_attempt_to_allocate_pud
-#define PMD_ORDER		0
+#define PMD_TABLE_ORDER		0
 #define PTE_ORDER		0
 #endif
 #ifdef CONFIG_PAGE_SIZE_64KB
 #define PGD_ORDER		0
 #define PUD_ORDER		aieeee_attempt_to_allocate_pud
 #ifdef CONFIG_MIPS_VA_BITS_48
-#define PMD_ORDER		0
+#define PMD_TABLE_ORDER		0
 #else
-#define PMD_ORDER		aieeee_attempt_to_allocate_pmd
+#define PMD_TABLE_ORDER		aieeee_attempt_to_allocate_pmd
 #endif
 #define PTE_ORDER		0
 #endif
@@ -132,7 +132,7 @@
 #define PTRS_PER_PUD	((PAGE_SIZE << PUD_ORDER) / sizeof(pud_t))
 #endif
 #ifndef __PAGETABLE_PMD_FOLDED
-#define PTRS_PER_PMD	((PAGE_SIZE << PMD_ORDER) / sizeof(pmd_t))
+#define PTRS_PER_PMD	((PAGE_SIZE << PMD_TABLE_ORDER) / sizeof(pmd_t))
 #endif
 #define PTRS_PER_PTE	((PAGE_SIZE << PTE_ORDER) / sizeof(pte_t))
 
diff --git a/arch/mips/kernel/asm-offsets.c b/arch/mips/kernel/asm-offsets.c
index 04ca75278f02..ca7c5af7697d 100644
--- a/arch/mips/kernel/asm-offsets.c
+++ b/arch/mips/kernel/asm-offsets.c
@@ -197,9 +197,6 @@ void output_mm_defines(void)
 	DEFINE(_PTE_T_LOG2, PTE_T_LOG2);
 	BLANK();
 	DEFINE(_PGD_ORDER, PGD_ORDER);
-#ifndef __PAGETABLE_PMD_FOLDED
-	DEFINE(_PMD_ORDER, PMD_ORDER);
-#endif
 	DEFINE(_PTE_ORDER, PTE_ORDER);
 	BLANK();
 	DEFINE(_PMD_SHIFT, PMD_SHIFT);
-- 
2.34.1

