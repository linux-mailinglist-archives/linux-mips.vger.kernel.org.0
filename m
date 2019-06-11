Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72C5C3CF27
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2019 16:42:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391707AbfFKOmA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Jun 2019 10:42:00 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:37814 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391234AbfFKOmA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 11 Jun 2019 10:42:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=BBXXT9xa9mrRhIGkEBsSxPqH41gwjewyswp0iGthWuw=; b=G8LOT4PF2yvCs1mHkYytZqaKeQ
        xEujP5jOt56yiaI+d8fgDk4Xmq480Lul6ae1hHIRTkyZ4l7d6Fsri/dNIUK9LffjZeavJwiShIBZe
        Q44n5eKUC+iTdz7NZezLbHWpMZoll7MPwJGN4b+uFUK/T3Wp6fklHarEf9lPLlQsbnIV2Ppjy6PC2
        aEKuoSGKW0MabJ7AF8PN1lRrSYS8/EUd9PN10WcpUVfYQl5IsiolX/4XUXYwV+6XNGn1jowk49CzR
        O7mStspTewveegDCsMZIAXSzkHajsbpdPgODgDrKkW1Ef97kDEoc2nmsBeNk3X+3EarOGJxgFUb9c
        vjWvJ/5A==;
Received: from mpp-cp1-natpool-1-037.ethz.ch ([82.130.71.37] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hahy5-0005dm-5p; Tue, 11 Jun 2019 14:41:45 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>
Cc:     Nicholas Piggin <npiggin@gmail.com>,
        Khalid Aziz <khalid.aziz@oracle.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-mips@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-mm@kvack.org, x86@kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 13/16] mm: move the powerpc hugepd code to mm/gup.c
Date:   Tue, 11 Jun 2019 16:40:59 +0200
Message-Id: <20190611144102.8848-14-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611144102.8848-1-hch@lst.de>
References: <20190611144102.8848-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

While only powerpc supports the hugepd case, the code is pretty
generic and I'd like to keep all GUP internals in one place.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/powerpc/Kconfig          |  1 +
 arch/powerpc/mm/hugetlbpage.c | 72 ------------------------------
 include/linux/hugetlb.h       | 18 --------
 mm/Kconfig                    | 10 +++++
 mm/gup.c                      | 82 +++++++++++++++++++++++++++++++++++
 5 files changed, 93 insertions(+), 90 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 992a04796e56..4f1b00979cde 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -125,6 +125,7 @@ config PPC
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_KCOV
+	select ARCH_HAS_HUGEPD			if HUGETLB_PAGE
 	select ARCH_HAS_MMIOWB			if PPC64
 	select ARCH_HAS_PHYS_TO_DMA
 	select ARCH_HAS_PMEM_API                if PPC64
diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index b5d92dc32844..51716c11d0fb 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -511,13 +511,6 @@ struct page *follow_huge_pd(struct vm_area_struct *vma,
 	return page;
 }
 
-static unsigned long hugepte_addr_end(unsigned long addr, unsigned long end,
-				      unsigned long sz)
-{
-	unsigned long __boundary = (addr + sz) & ~(sz-1);
-	return (__boundary - 1 < end - 1) ? __boundary : end;
-}
-
 #ifdef CONFIG_PPC_MM_SLICES
 unsigned long hugetlb_get_unmapped_area(struct file *file, unsigned long addr,
 					unsigned long len, unsigned long pgoff,
@@ -665,68 +658,3 @@ void flush_dcache_icache_hugepage(struct page *page)
 		}
 	}
 }
-
-static int gup_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
-		       unsigned long end, int write, struct page **pages, int *nr)
-{
-	unsigned long pte_end;
-	struct page *head, *page;
-	pte_t pte;
-	int refs;
-
-	pte_end = (addr + sz) & ~(sz-1);
-	if (pte_end < end)
-		end = pte_end;
-
-	pte = READ_ONCE(*ptep);
-
-	if (!pte_access_permitted(pte, write))
-		return 0;
-
-	/* hugepages are never "special" */
-	VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
-
-	refs = 0;
-	head = pte_page(pte);
-
-	page = head + ((addr & (sz-1)) >> PAGE_SHIFT);
-	do {
-		VM_BUG_ON(compound_head(page) != head);
-		pages[*nr] = page;
-		(*nr)++;
-		page++;
-		refs++;
-	} while (addr += PAGE_SIZE, addr != end);
-
-	if (!page_cache_add_speculative(head, refs)) {
-		*nr -= refs;
-		return 0;
-	}
-
-	if (unlikely(pte_val(pte) != pte_val(*ptep))) {
-		/* Could be optimized better */
-		*nr -= refs;
-		while (refs--)
-			put_page(head);
-		return 0;
-	}
-
-	return 1;
-}
-
-int gup_huge_pd(hugepd_t hugepd, unsigned long addr, unsigned int pdshift,
-		unsigned long end, int write, struct page **pages, int *nr)
-{
-	pte_t *ptep;
-	unsigned long sz = 1UL << hugepd_shift(hugepd);
-	unsigned long next;
-
-	ptep = hugepte_offset(hugepd, addr, pdshift);
-	do {
-		next = hugepte_addr_end(addr, end, sz);
-		if (!gup_hugepte(ptep, sz, addr, end, write, pages, nr))
-			return 0;
-	} while (ptep++, addr = next, addr != end);
-
-	return 1;
-}
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index edf476c8cfb9..0f91761e2c53 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -16,29 +16,11 @@ struct user_struct;
 struct mmu_gather;
 
 #ifndef is_hugepd
-/*
- * Some architectures requires a hugepage directory format that is
- * required to support multiple hugepage sizes. For example
- * a4fe3ce76 "powerpc/mm: Allow more flexible layouts for hugepage pagetables"
- * introduced the same on powerpc. This allows for a more flexible hugepage
- * pagetable layout.
- */
 typedef struct { unsigned long pd; } hugepd_t;
 #define is_hugepd(hugepd) (0)
 #define __hugepd(x) ((hugepd_t) { (x) })
-static inline int gup_huge_pd(hugepd_t hugepd, unsigned long addr,
-			      unsigned pdshift, unsigned long end,
-			      int write, struct page **pages, int *nr)
-{
-	return 0;
-}
-#else
-extern int gup_huge_pd(hugepd_t hugepd, unsigned long addr,
-		       unsigned pdshift, unsigned long end,
-		       int write, struct page **pages, int *nr);
 #endif
 
-
 #ifdef CONFIG_HUGETLB_PAGE
 
 #include <linux/mempolicy.h>
diff --git a/mm/Kconfig b/mm/Kconfig
index 5c41409557da..44be3f01a2b2 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -769,4 +769,14 @@ config GUP_GET_PTE_LOW_HIGH
 config ARCH_HAS_PTE_SPECIAL
 	bool
 
+#
+# Some architectures require a special hugepage directory format that is
+# required to support multiple hugepage sizes. For example a4fe3ce76
+# "powerpc/mm: Allow more flexible layouts for hugepage pagetables"
+# introduced it on powerpc.  This allows for a more flexible hugepage
+# pagetable layouts.
+#
+config ARCH_HAS_HUGEPD
+	bool
+
 endmenu
diff --git a/mm/gup.c b/mm/gup.c
index 78dc1871b3d4..494aa4c3a55e 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1967,6 +1967,88 @@ static int __gup_device_huge_pud(pud_t pud, pud_t *pudp, unsigned long addr,
 }
 #endif
 
+#ifdef CONFIG_ARCH_HAS_HUGEPD
+static unsigned long hugepte_addr_end(unsigned long addr, unsigned long end,
+				      unsigned long sz)
+{
+	unsigned long __boundary = (addr + sz) & ~(sz-1);
+	return (__boundary - 1 < end - 1) ? __boundary : end;
+}
+
+static int gup_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
+		       unsigned long end, int write, struct page **pages, int *nr)
+{
+	unsigned long pte_end;
+	struct page *head, *page;
+	pte_t pte;
+	int refs;
+
+	pte_end = (addr + sz) & ~(sz-1);
+	if (pte_end < end)
+		end = pte_end;
+
+	pte = READ_ONCE(*ptep);
+
+	if (!pte_access_permitted(pte, write))
+		return 0;
+
+	/* hugepages are never "special" */
+	VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
+
+	refs = 0;
+	head = pte_page(pte);
+
+	page = head + ((addr & (sz-1)) >> PAGE_SHIFT);
+	do {
+		VM_BUG_ON(compound_head(page) != head);
+		pages[*nr] = page;
+		(*nr)++;
+		page++;
+		refs++;
+	} while (addr += PAGE_SIZE, addr != end);
+
+	if (!page_cache_add_speculative(head, refs)) {
+		*nr -= refs;
+		return 0;
+	}
+
+	if (unlikely(pte_val(pte) != pte_val(*ptep))) {
+		/* Could be optimized better */
+		*nr -= refs;
+		while (refs--)
+			put_page(head);
+		return 0;
+	}
+
+	return 1;
+}
+
+static int gup_huge_pd(hugepd_t hugepd, unsigned long addr,
+		unsigned int pdshift, unsigned long end, int write,
+		struct page **pages, int *nr)
+{
+	pte_t *ptep;
+	unsigned long sz = 1UL << hugepd_shift(hugepd);
+	unsigned long next;
+
+	ptep = hugepte_offset(hugepd, addr, pdshift);
+	do {
+		next = hugepte_addr_end(addr, end, sz);
+		if (!gup_hugepte(ptep, sz, addr, end, write, pages, nr))
+			return 0;
+	} while (ptep++, addr = next, addr != end);
+
+	return 1;
+}
+#else
+static inline int gup_huge_pd(hugepd_t hugepd, unsigned long addr,
+		unsigned pdshift, unsigned long end, int write,
+		struct page **pages, int *nr)
+{
+	return 0;
+}
+#endif /* CONFIG_ARCH_HAS_HUGEPD */
+
 static int gup_huge_pmd(pmd_t orig, pmd_t *pmdp, unsigned long addr,
 		unsigned long end, unsigned int flags, struct page **pages, int *nr)
 {
-- 
2.20.1

