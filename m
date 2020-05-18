Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 801B11D7027
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2020 07:09:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726481AbgERFJo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 May 2020 01:09:44 -0400
Received: from mail.loongson.cn ([114.242.206.163]:58154 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726355AbgERFJo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 18 May 2020 01:09:44 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb99lGMJeaPY1AA--.27S3;
        Mon, 18 May 2020 13:08:53 +0800 (CST)
From:   Bibo Mao <maobibo@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Paul Burton <paulburton@kernel.org>,
        Dmitry Korotin <dkorotin@wavecomp.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        Stafford Horne <shorne@gmail.com>,
        Steven Price <steven.price@arm.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mike Rapoport <rppt@linux.ibm.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "Maciej W. Rozycki" <macro@wdc.com>, linux-mm@kvack.org,
        David Hildenbrand <david@redhat.com>
Subject: [PATCH v3 2/3] mm/memory.c: Update local TLB if PTE entry exists
Date:   Mon, 18 May 2020 13:08:48 +0800
Message-Id: <1589778529-25627-2-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1589778529-25627-1-git-send-email-maobibo@loongson.cn>
References: <1589778529-25627-1-git-send-email-maobibo@loongson.cn>
X-CM-TRANSID: AQAAf9Dxb99lGMJeaPY1AA--.27S3
X-Coremail-Antispam: 1UD129KBjvJXoWxuFW5Cr43Cr1rWr4ruF1rWFg_yoWxGw43pr
        yfCa1DXF4xXr18Zr4xXw4qvF15Za4rJa4kJry3Kw1Fv39xXr4fuay5G3yFvFZ5Gr95Xwsr
        Jr4jgF4UZay7uw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPab7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
        8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
        64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcV
        CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280
        aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4
        CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvj
        eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxw
        CY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
        x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6r
        W5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF
        7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
        WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU
        ygo2UUUUU
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

If two threads concurrently fault at the same address, the thread that
won the race updates the PTE and its local TLB. For now, the other
thread gives up, simply does nothing, and continues.

It could happen that this second thread triggers another fault, whereby
it only updates its local TLB while handling the fault. Instead of
triggering another fault, let's directly update the local TLB of the
second thread.

It is only useful to architectures where software can update TLB, it may
bring out some negative effect if update_mmu_cache is used for other
purpose also. It seldom happens where multiple threads access the same
page at the same time, so the negative effect is limited on other arches.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 mm/memory.c | 44 +++++++++++++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 17 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index f703fe8..2eb59a9 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1770,8 +1770,8 @@ static vm_fault_t insert_pfn(struct vm_area_struct *vma, unsigned long addr,
 			}
 			entry = pte_mkyoung(*pte);
 			entry = maybe_mkwrite(pte_mkdirty(entry), vma);
-			if (ptep_set_access_flags(vma, addr, pte, entry, 1))
-				update_mmu_cache(vma, addr, pte);
+			ptep_set_access_flags(vma, addr, pte, entry, 1);
+			update_mmu_cache(vma, addr, pte);
 		}
 		goto out_unlock;
 	}
@@ -2436,17 +2436,16 @@ static inline bool cow_user_page(struct page *dst, struct page *src,
 		if (!likely(pte_same(*vmf->pte, vmf->orig_pte))) {
 			/*
 			 * Other thread has already handled the fault
-			 * and we don't need to do anything. If it's
-			 * not the case, the fault will be triggered
-			 * again on the same address.
+			 * and update local tlb only
 			 */
+			update_mmu_cache(vma, addr, vmf->pte);
 			ret = false;
 			goto pte_unlock;
 		}
 
 		entry = pte_mkyoung(vmf->orig_pte);
-		if (ptep_set_access_flags(vma, addr, vmf->pte, entry, 0))
-			update_mmu_cache(vma, addr, vmf->pte);
+		ptep_set_access_flags(vma, addr, vmf->pte, entry, 0);
+		update_mmu_cache(vma, addr, vmf->pte);
 	}
 
 	/*
@@ -2463,7 +2462,8 @@ static inline bool cow_user_page(struct page *dst, struct page *src,
 		vmf->pte = pte_offset_map_lock(mm, vmf->pmd, addr, &vmf->ptl);
 		locked = true;
 		if (!likely(pte_same(*vmf->pte, vmf->orig_pte))) {
-			/* The PTE changed under us. Retry page fault. */
+			/* The PTE changed under us, update local tlb */
+			update_mmu_cache(vma, addr, vmf->pte);
 			ret = false;
 			goto pte_unlock;
 		}
@@ -2618,8 +2618,8 @@ static inline void wp_page_reuse(struct vm_fault *vmf)
 	flush_cache_page(vma, vmf->address, pte_pfn(vmf->orig_pte));
 	entry = pte_mkyoung(vmf->orig_pte);
 	entry = maybe_mkwrite(pte_mkdirty(entry), vma);
-	if (ptep_set_access_flags(vma, vmf->address, vmf->pte, entry, 1))
-		update_mmu_cache(vma, vmf->address, vmf->pte);
+	ptep_set_access_flags(vma, vmf->address, vmf->pte, entry, 1);
+	update_mmu_cache(vma, vmf->address, vmf->pte);
 	pte_unmap_unlock(vmf->pte, vmf->ptl);
 }
 
@@ -2752,6 +2752,7 @@ static vm_fault_t wp_page_copy(struct vm_fault *vmf)
 		new_page = old_page;
 		page_copied = 1;
 	} else {
+		update_mmu_cache(vma, vmf->address, vmf->pte);
 		mem_cgroup_cancel_charge(new_page, memcg, false);
 	}
 
@@ -2812,6 +2813,7 @@ vm_fault_t finish_mkwrite_fault(struct vm_fault *vmf)
 	 * pte_offset_map_lock.
 	 */
 	if (!pte_same(*vmf->pte, vmf->orig_pte)) {
+		update_mmu_cache(vmf->vma, vmf->address, vmf->pte);
 		pte_unmap_unlock(vmf->pte, vmf->ptl);
 		return VM_FAULT_NOPAGE;
 	}
@@ -2936,6 +2938,7 @@ static vm_fault_t do_wp_page(struct vm_fault *vmf)
 			vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd,
 					vmf->address, &vmf->ptl);
 			if (!pte_same(*vmf->pte, vmf->orig_pte)) {
+				update_mmu_cache(vma, vmf->address, vmf->pte);
 				unlock_page(vmf->page);
 				pte_unmap_unlock(vmf->pte, vmf->ptl);
 				put_page(vmf->page);
@@ -3341,8 +3344,10 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
 						vma->vm_page_prot));
 		vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd,
 				vmf->address, &vmf->ptl);
-		if (!pte_none(*vmf->pte))
+		if (!pte_none(*vmf->pte)) {
+			update_mmu_cache(vma, vmf->address, vmf->pte);
 			goto unlock;
+		}
 		ret = check_stable_address_space(vma->vm_mm);
 		if (ret)
 			goto unlock;
@@ -3378,8 +3383,10 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
 
 	vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd, vmf->address,
 			&vmf->ptl);
-	if (!pte_none(*vmf->pte))
+	if (!pte_none(*vmf->pte)) {
+		update_mmu_cache(vma, vmf->address, vmf->pte);
 		goto release;
+	}
 
 	ret = check_stable_address_space(vma->vm_mm);
 	if (ret)
@@ -3646,8 +3653,10 @@ vm_fault_t alloc_set_pte(struct vm_fault *vmf, struct mem_cgroup *memcg,
 	}
 
 	/* Re-check under ptl */
-	if (unlikely(!pte_none(*vmf->pte)))
+	if (unlikely(!pte_none(*vmf->pte))) {
+		update_mmu_cache(vma, vmf->address, vmf->pte);
 		return VM_FAULT_NOPAGE;
+	}
 
 	flush_icache_page(vma, page);
 	entry = mk_pte(page, vma->vm_page_prot);
@@ -4224,18 +4233,18 @@ static vm_fault_t handle_pte_fault(struct vm_fault *vmf)
 	vmf->ptl = pte_lockptr(vmf->vma->vm_mm, vmf->pmd);
 	spin_lock(vmf->ptl);
 	entry = vmf->orig_pte;
-	if (unlikely(!pte_same(*vmf->pte, entry)))
+	if (unlikely(!pte_same(*vmf->pte, entry))) {
+		update_mmu_cache(vmf->vma, vmf->address, vmf->pte);
 		goto unlock;
+	}
 	if (vmf->flags & FAULT_FLAG_WRITE) {
 		if (!pte_write(entry))
 			return do_wp_page(vmf);
 		entry = pte_mkdirty(entry);
 	}
 	entry = pte_mkyoung(entry);
-	if (ptep_set_access_flags(vmf->vma, vmf->address, vmf->pte, entry,
+	if (!ptep_set_access_flags(vmf->vma, vmf->address, vmf->pte, entry,
 				vmf->flags & FAULT_FLAG_WRITE)) {
-		update_mmu_cache(vmf->vma, vmf->address, vmf->pte);
-	} else {
 		/*
 		 * This is needed only for protection faults but the arch code
 		 * is not yet telling us if this is a protection fault or not.
@@ -4245,6 +4254,7 @@ static vm_fault_t handle_pte_fault(struct vm_fault *vmf)
 		if (vmf->flags & FAULT_FLAG_WRITE)
 			flush_tlb_fix_spurious_fault(vmf->vma, vmf->address);
 	}
+	update_mmu_cache(vmf->vma, vmf->address, vmf->pte);
 unlock:
 	pte_unmap_unlock(vmf->pte, vmf->ptl);
 	return 0;
-- 
1.8.3.1

