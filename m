Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BCFC20E634
	for <lists+linux-mips@lfdr.de>; Tue, 30 Jun 2020 00:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727780AbgF2VpS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Jun 2020 17:45:18 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49522 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727120AbgF2Shn (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 29 Jun 2020 14:37:43 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn9566flezmRMAA--.4772S3;
        Mon, 29 Jun 2020 21:15:43 +0800 (CST)
From:   bibo mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Kravetz <mike.kravetz@oracle.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Bibo Mao <maobibo@loongson.cn>
Subject: [PATCH 2/2] hugetlb: use lightweight tlb flush when update huge tlb on mips
Date:   Mon, 29 Jun 2020 21:15:33 +0800
Message-Id: <1593436533-8645-2-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1593436533-8645-1-git-send-email-maobibo@loongson.cn>
References: <1593436533-8645-1-git-send-email-maobibo@loongson.cn>
X-CM-TRANSID: AQAAf9Dxn9566flezmRMAA--.4772S3
X-Coremail-Antispam: 1UD129KBjvJXoWxuF15Ww1xJw1DZw4xAry7Jrb_yoWrCw1rpF
        9rCan8C3y8trWkurZ7Zr4qvr15Jwn0ga4IvryIqayYvw1aqw1a9F4DGw4fA3yrurWrGay7
        Ca1Ygrs8WF4fZw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBF14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
        ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
        xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
        vE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
        r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVCm-wCF04k20xvY0x
        0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
        7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
        C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
        04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
        CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUHyIUUUUUU=
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Bibo Mao <maobibo@loongson.cn>

On mips platform huge pte pointers to invalid_pte_table if
huge_pte_none return true. TLB entry with normal page size is
added if huge pte entry is none. When updating huge pte entry,
older tlb entry with normal page needs to be invalid.

This patch uses lightweight tlb flush function local_flush_tlb_page,
rather than flush_tlb_range which will flush all tlb entries instead.
Also this patch adds new huge tlb update function named
update_mmu_cache_huge, page faulting address is passed rather than
huge page start address.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/mips/include/asm/hugetlb.h | 17 ++++++++++++-----
 include/linux/hugetlb.h         |  9 +++++++++
 mm/hugetlb.c                    | 12 +++++++-----
 3 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/arch/mips/include/asm/hugetlb.h b/arch/mips/include/asm/hugetlb.h
index c214440..fce09b4 100644
--- a/arch/mips/include/asm/hugetlb.h
+++ b/arch/mips/include/asm/hugetlb.h
@@ -72,15 +72,22 @@ static inline int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 
 	if (changed) {
 		set_pte_at(vma->vm_mm, addr, ptep, pte);
-		/*
-		 * There could be some standard sized pages in there,
-		 * get them all.
-		 */
-		flush_tlb_range(vma, addr, addr + HPAGE_SIZE);
 	}
 	return changed;
 }
 
+#define update_mmu_cache_huge	update_mmu_cache_huge
+static inline void update_mmu_cache_huge(struct vm_area_struct *vma,
+					unsigned long address, pte_t *ptep)
+{
+	/*
+	 * There could be some standard sized page in there,
+	 * parameter address must be page faulting address rather than
+	 * start address of huge page
+	 */
+	local_flush_tlb_page(vma, address);
+	update_mmu_cache(vma, address & huge_page_mask(hstate_vma(vma)), ptep);
+}
 #include <asm-generic/hugetlb.h>
 
 #endif /* __ASM_HUGETLB_H */
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 858522e..2f3f9eb 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -746,6 +746,15 @@ static inline void huge_ptep_modify_prot_commit(struct vm_area_struct *vma,
 }
 #endif
 
+#ifndef update_mmu_cache_huge
+#define update_mmu_cache_huge	update_mmu_cache_huge
+static inline void update_mmu_cache_huge(struct vm_area_struct *vma,
+					unsigned long address, pte_t *ptep)
+{
+	update_mmu_cache(vma, address & huge_page_mask(hstate_vma(vma)), ptep);
+}
+#endif
+
 #else	/* CONFIG_HUGETLB_PAGE */
 struct hstate {};
 
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 1410e62..96faad7 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3757,10 +3757,12 @@ static void set_huge_ptep_writable(struct vm_area_struct *vma,
 				   unsigned long address, pte_t *ptep)
 {
 	pte_t entry;
+	struct hstate *h = hstate_vma(vma);
+	unsigned long haddr = address & huge_page_mask(h);
 
 	entry = huge_pte_mkwrite(huge_pte_mkdirty(huge_ptep_get(ptep)));
-	if (huge_ptep_set_access_flags(vma, address, ptep, entry, 1))
-		update_mmu_cache(vma, address, ptep);
+	if (huge_ptep_set_access_flags(vma, haddr, ptep, entry, 1))
+		update_mmu_cache_huge(vma, address, ptep);
 }
 
 bool is_hugetlb_entry_migration(pte_t pte)
@@ -4128,7 +4130,7 @@ static vm_fault_t hugetlb_cow(struct mm_struct *mm, struct vm_area_struct *vma,
 	 * and just make the page writable */
 	if (page_mapcount(old_page) == 1 && PageAnon(old_page)) {
 		page_move_anon_rmap(old_page, vma);
-		set_huge_ptep_writable(vma, haddr, ptep);
+		set_huge_ptep_writable(vma, address, ptep);
 		return 0;
 	}
 
@@ -4630,7 +4632,7 @@ vm_fault_t hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
 	entry = pte_mkyoung(entry);
 	if (huge_ptep_set_access_flags(vma, haddr, ptep, entry,
 						flags & FAULT_FLAG_WRITE))
-		update_mmu_cache(vma, haddr, ptep);
+		update_mmu_cache_huge(vma, address, ptep);
 out_put_page:
 	if (page != pagecache_page)
 		unlock_page(page);
@@ -4770,7 +4772,7 @@ int hugetlb_mcopy_atomic_pte(struct mm_struct *dst_mm,
 	hugetlb_count_add(pages_per_huge_page(h), dst_mm);
 
 	/* No need to invalidate - it was non-present before */
-	update_mmu_cache(dst_vma, dst_addr, dst_pte);
+	update_mmu_cache_huge(dst_vma, dst_addr, dst_pte);
 
 	spin_unlock(ptl);
 	set_page_huge_active(page);
-- 
1.8.3.1

