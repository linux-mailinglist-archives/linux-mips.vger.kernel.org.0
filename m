Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E933206FFB
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jun 2020 11:27:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388671AbgFXJ0x (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 24 Jun 2020 05:26:53 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34796 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389368AbgFXJ0w (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 24 Jun 2020 05:26:52 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxNupIHPNe6zFJAA--.493S2;
        Wed, 24 Jun 2020 17:26:32 +0800 (CST)
From:   Bibo Mao <maobibo@loongson.cn>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Daniel Silsby <dansilsby@gmail.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Subject: [PATCH 1/3] mm: set page fault address for update_mmu_cache_pmd
Date:   Wed, 24 Jun 2020 17:26:30 +0800
Message-Id: <1592990792-1923-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9AxNupIHPNe6zFJAA--.493S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZF1fAry7ArW7CrW7XrW3GFg_yoW5uFWDpF
        97Can5XFsIqw1kuayfXr4qkr15J3s2qay7Kry2k3ZYv3Waqr1S9w1DAwn5Ar98Jry8ua13
        CF4YgFZ8Xw4fZaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkYb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
        F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
        4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE-syl42xK82IY
        c2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
        026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF
        0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0x
        vE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
        jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU56c_DUUUUU==
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

update_mmu_cache_pmd is used to update tlb for the pmd entry by
software. On MIPS system, the tlb entry indexed by page fault
address maybe exists already, only that tlb entry may be small
page, also it may be huge page. Before updating pmd entry with
huge page size, older tlb entry need to be invalidated.

Here page fault address is passed to function update_mmu_cache_pmd,
rather than pmd huge page start address. The page fault address
can be used for invalidating older tlb entry.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/mips/include/asm/pgtable.h | 9 +++++++++
 mm/huge_memory.c                | 7 ++++---
 mm/memory.c                     | 2 +-
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index dd7a0f5..bd81661 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -554,11 +554,20 @@ static inline void update_mmu_cache(struct vm_area_struct *vma,
 #define	__HAVE_ARCH_UPDATE_MMU_TLB
 #define update_mmu_tlb	update_mmu_cache
 
+extern void local_flush_tlb_page(struct vm_area_struct *vma,
+				unsigned long page);
 static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
 	unsigned long address, pmd_t *pmdp)
 {
 	pte_t pte = *(pte_t *)pmdp;
 
+	/*
+	 * If pmd_none is true, older tlb entry will be normal page.
+	 * here to invalidate older tlb entry indexed by address
+	 * parameter address must be page fault address rather than
+	 * start address of pmd huge page
+	 */
+	local_flush_tlb_page(vma, address);
 	__update_tlb(vma, address, pte);
 }
 
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 78c84be..0f9187b 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -780,6 +780,7 @@ static void insert_pfn_pmd(struct vm_area_struct *vma, unsigned long addr,
 		pgtable_t pgtable)
 {
 	struct mm_struct *mm = vma->vm_mm;
+	unsigned long start = addr & PMD_MASK;
 	pmd_t entry;
 	spinlock_t *ptl;
 
@@ -792,7 +793,7 @@ static void insert_pfn_pmd(struct vm_area_struct *vma, unsigned long addr,
 			}
 			entry = pmd_mkyoung(*pmd);
 			entry = maybe_pmd_mkwrite(pmd_mkdirty(entry), vma);
-			if (pmdp_set_access_flags(vma, addr, pmd, entry, 1))
+			if (pmdp_set_access_flags(vma, start, pmd, entry, 1))
 				update_mmu_cache_pmd(vma, addr, pmd);
 		}
 
@@ -813,7 +814,7 @@ static void insert_pfn_pmd(struct vm_area_struct *vma, unsigned long addr,
 		pgtable = NULL;
 	}
 
-	set_pmd_at(mm, addr, pmd, entry);
+	set_pmd_at(mm, start, pmd, entry);
 	update_mmu_cache_pmd(vma, addr, pmd);
 
 out_unlock:
@@ -864,7 +865,7 @@ vm_fault_t vmf_insert_pfn_pmd_prot(struct vm_fault *vmf, pfn_t pfn,
 
 	track_pfn_insert(vma, &pgprot, pfn);
 
-	insert_pfn_pmd(vma, addr, vmf->pmd, pfn, pgprot, write, pgtable);
+	insert_pfn_pmd(vma, vmf->address, vmf->pmd, pfn, pgprot, write, pgtable);
 	return VM_FAULT_NOPAGE;
 }
 EXPORT_SYMBOL_GPL(vmf_insert_pfn_pmd_prot);
diff --git a/mm/memory.c b/mm/memory.c
index dc7f354..c703458 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3592,7 +3592,7 @@ static vm_fault_t do_set_pmd(struct vm_fault *vmf, struct page *page)
 
 	set_pmd_at(vma->vm_mm, haddr, vmf->pmd, entry);
 
-	update_mmu_cache_pmd(vma, haddr, vmf->pmd);
+	update_mmu_cache_pmd(vma, vmf->address, vmf->pmd);
 
 	/* fault is handled */
 	ret = 0;
-- 
1.8.3.1

