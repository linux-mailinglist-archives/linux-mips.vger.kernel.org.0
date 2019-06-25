Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD2145521A
	for <lists+linux-mips@lfdr.de>; Tue, 25 Jun 2019 16:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731053AbfFYOhn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 Jun 2019 10:37:43 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:52486 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730701AbfFYOhn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 25 Jun 2019 10:37:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=QyABUaahMXDucs76DrKe6gk3GH371BfoHXoRIxsRdtE=; b=AAx87/4yE16TLsgzBCexdNloqw
        SQQ6qt7hqNIhycsh55YfUmQTHyMCyPi2/hko55Yyb/MqJ6mZU658VEOWrTR4SEardCSyw2OyaS7Oy
        tBVovYa7OkK9CHSAYiGX8ezfbBDSTCbse7HWwKjnqN+Arqb4YRKFOCTmwpUJlDYVsWiEY8ozxYcds
        6bCAb83LXOmgvX640XkeJiJ/V4bWtzNckqR7avhkK7JDjCrTScU4sdqO0TnUFEd3vBe3Jf+istmyu
        9W5pIRypWNJcfNvcS5ZYMh3KwXg4/RiOBrL8RdpyMIwFY5CGgN6likzAe4jvbBDb7aMG+8TpH4DpH
        CuGb0Wqg==;
Received: from 213-225-6-159.nat.highway.a1.net ([213.225.6.159] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hfmZb-0007yK-FI; Tue, 25 Jun 2019 14:37:28 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
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
        linux-mm@kvack.org, x86@kernel.org, linux-kernel@vger.kernel.org,
        Jason Gunthorpe <jgg@mellanox.com>
Subject: [PATCH 03/16] mm: lift the x86_32 PAE version of gup_get_pte to common code
Date:   Tue, 25 Jun 2019 16:37:02 +0200
Message-Id: <20190625143715.1689-4-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625143715.1689-1-hch@lst.de>
References: <20190625143715.1689-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The split low/high access is the only non-READ_ONCE version of
gup_get_pte that did show up in the various arch implemenations.
Lift it to common code and drop the ifdef based arch override.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>
---
 arch/x86/Kconfig                      |  1 +
 arch/x86/include/asm/pgtable-3level.h | 47 ------------------------
 arch/x86/kvm/mmu.c                    |  2 +-
 mm/Kconfig                            |  3 ++
 mm/gup.c                              | 51 ++++++++++++++++++++++++---
 5 files changed, 52 insertions(+), 52 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 2bbbd4d1ba31..7cd53cc59f0f 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -121,6 +121,7 @@ config X86
 	select GENERIC_STRNCPY_FROM_USER
 	select GENERIC_STRNLEN_USER
 	select GENERIC_TIME_VSYSCALL
+	select GUP_GET_PTE_LOW_HIGH		if X86_PAE
 	select HARDLOCKUP_CHECK_TIMESTAMP	if X86_64
 	select HAVE_ACPI_APEI			if ACPI
 	select HAVE_ACPI_APEI_NMI		if ACPI
diff --git a/arch/x86/include/asm/pgtable-3level.h b/arch/x86/include/asm/pgtable-3level.h
index f8b1ad2c3828..e3633795fb22 100644
--- a/arch/x86/include/asm/pgtable-3level.h
+++ b/arch/x86/include/asm/pgtable-3level.h
@@ -285,53 +285,6 @@ static inline pud_t native_pudp_get_and_clear(pud_t *pudp)
 #define __pte_to_swp_entry(pte)	(__swp_entry(__pteval_swp_type(pte), \
 					     __pteval_swp_offset(pte)))
 
-#define gup_get_pte gup_get_pte
-/*
- * WARNING: only to be used in the get_user_pages_fast() implementation.
- *
- * With get_user_pages_fast(), we walk down the pagetables without taking
- * any locks.  For this we would like to load the pointers atomically,
- * but that is not possible (without expensive cmpxchg8b) on PAE.  What
- * we do have is the guarantee that a PTE will only either go from not
- * present to present, or present to not present or both -- it will not
- * switch to a completely different present page without a TLB flush in
- * between; something that we are blocking by holding interrupts off.
- *
- * Setting ptes from not present to present goes:
- *
- *   ptep->pte_high = h;
- *   smp_wmb();
- *   ptep->pte_low = l;
- *
- * And present to not present goes:
- *
- *   ptep->pte_low = 0;
- *   smp_wmb();
- *   ptep->pte_high = 0;
- *
- * We must ensure here that the load of pte_low sees 'l' iff pte_high
- * sees 'h'. We load pte_high *after* loading pte_low, which ensures we
- * don't see an older value of pte_high.  *Then* we recheck pte_low,
- * which ensures that we haven't picked up a changed pte high. We might
- * have gotten rubbish values from pte_low and pte_high, but we are
- * guaranteed that pte_low will not have the present bit set *unless*
- * it is 'l'. Because get_user_pages_fast() only operates on present ptes
- * we're safe.
- */
-static inline pte_t gup_get_pte(pte_t *ptep)
-{
-	pte_t pte;
-
-	do {
-		pte.pte_low = ptep->pte_low;
-		smp_rmb();
-		pte.pte_high = ptep->pte_high;
-		smp_rmb();
-	} while (unlikely(pte.pte_low != ptep->pte_low));
-
-	return pte;
-}
-
 #include <asm/pgtable-invert.h>
 
 #endif /* _ASM_X86_PGTABLE_3LEVEL_H */
diff --git a/arch/x86/kvm/mmu.c b/arch/x86/kvm/mmu.c
index 98f6e4f88b04..4a9c63d1c20a 100644
--- a/arch/x86/kvm/mmu.c
+++ b/arch/x86/kvm/mmu.c
@@ -650,7 +650,7 @@ static u64 __update_clear_spte_slow(u64 *sptep, u64 spte)
 
 /*
  * The idea using the light way get the spte on x86_32 guest is from
- * gup_get_pte(arch/x86/mm/gup.c).
+ * gup_get_pte (mm/gup.c).
  *
  * An spte tlb flush may be pending, because kvm_set_pte_rmapp
  * coalesces them and we are running out of the MMU lock.  Therefore
diff --git a/mm/Kconfig b/mm/Kconfig
index f0c76ba47695..fe51f104a9e0 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -762,6 +762,9 @@ config GUP_BENCHMARK
 
 	  See tools/testing/selftests/vm/gup_benchmark.c
 
+config GUP_GET_PTE_LOW_HIGH
+	bool
+
 config ARCH_HAS_PTE_SPECIAL
 	bool
 
diff --git a/mm/gup.c b/mm/gup.c
index 3237f33792e6..9b72f2ea3471 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1684,17 +1684,60 @@ struct page *get_dump_page(unsigned long addr)
  * This code is based heavily on the PowerPC implementation by Nick Piggin.
  */
 #ifdef CONFIG_HAVE_GENERIC_GUP
+#ifdef CONFIG_GUP_GET_PTE_LOW_HIGH
+/*
+ * WARNING: only to be used in the get_user_pages_fast() implementation.
+ *
+ * With get_user_pages_fast(), we walk down the pagetables without taking any
+ * locks.  For this we would like to load the pointers atomically, but sometimes
+ * that is not possible (e.g. without expensive cmpxchg8b on x86_32 PAE).  What
+ * we do have is the guarantee that a PTE will only either go from not present
+ * to present, or present to not present or both -- it will not switch to a
+ * completely different present page without a TLB flush in between; something
+ * that we are blocking by holding interrupts off.
+ *
+ * Setting ptes from not present to present goes:
+ *
+ *   ptep->pte_high = h;
+ *   smp_wmb();
+ *   ptep->pte_low = l;
+ *
+ * And present to not present goes:
+ *
+ *   ptep->pte_low = 0;
+ *   smp_wmb();
+ *   ptep->pte_high = 0;
+ *
+ * We must ensure here that the load of pte_low sees 'l' IFF pte_high sees 'h'.
+ * We load pte_high *after* loading pte_low, which ensures we don't see an older
+ * value of pte_high.  *Then* we recheck pte_low, which ensures that we haven't
+ * picked up a changed pte high. We might have gotten rubbish values from
+ * pte_low and pte_high, but we are guaranteed that pte_low will not have the
+ * present bit set *unless* it is 'l'. Because get_user_pages_fast() only
+ * operates on present ptes we're safe.
+ */
+static inline pte_t gup_get_pte(pte_t *ptep)
+{
+	pte_t pte;
 
-#ifndef gup_get_pte
+	do {
+		pte.pte_low = ptep->pte_low;
+		smp_rmb();
+		pte.pte_high = ptep->pte_high;
+		smp_rmb();
+	} while (unlikely(pte.pte_low != ptep->pte_low));
+
+	return pte;
+}
+#else /* CONFIG_GUP_GET_PTE_LOW_HIGH */
 /*
- * We assume that the PTE can be read atomically. If this is not the case for
- * your architecture, please provide the helper.
+ * We require that the PTE can be read atomically.
  */
 static inline pte_t gup_get_pte(pte_t *ptep)
 {
 	return READ_ONCE(*ptep);
 }
-#endif
+#endif /* CONFIG_GUP_GET_PTE_LOW_HIGH */
 
 static void undo_dev_pagemap(int *nr, int nr_start, struct page **pages)
 {
-- 
2.20.1

