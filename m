Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE3601D282B
	for <lists+linux-mips@lfdr.de>; Thu, 14 May 2020 08:50:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725864AbgENGub (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 May 2020 02:50:31 -0400
Received: from mail.loongson.cn ([114.242.206.163]:59850 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725818AbgENGub (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 14 May 2020 02:50:31 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL90t6rxe9Is0AA--.7S2;
        Thu, 14 May 2020 14:50:22 +0800 (CST)
From:   Bibo Mao <maobibo@loongson.cn>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: mm/memory.c: Add update local tlb for smp race
Date:   Thu, 14 May 2020 14:50:21 +0800
Message-Id: <1589439021-17005-1-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9DxL90t6rxe9Is0AA--.7S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXFW5Jw47Aw15GrWxtw1fWFg_yoWrur4xpF
        yfCa1jqF4xXr1kAr4xXw1DZr13Za4rta48A3sxKw1Fvwnrtw4S9ay5G3yFvFWkAr95Gwsr
        Jr4jqF48uay8Ww7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkFb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
        C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
        F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
        4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE-syl42xK82IY
        c2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
        026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF
        0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0x
        vE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
        jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07bOoGdUUUUU=
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

If there are two threads hitting page fault at the address, one
thread updates pte entry and local tlb, the other thread can update
local tlb also, rather than give up and let page fault happening
again.

	modified:   mm/memory.c

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 mm/memory.c | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index f703fe8..3a741ce 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2436,11 +2436,10 @@ static inline bool cow_user_page(struct page *dst, struct page *src,
 		if (!likely(pte_same(*vmf->pte, vmf->orig_pte))) {
 			/*
 			 * Other thread has already handled the fault
-			 * and we don't need to do anything. If it's
-			 * not the case, the fault will be triggered
-			 * again on the same address.
+			 * and update local tlb only
 			 */
 			ret = false;
+			update_mmu_cache(vma, addr, vmf->pte);
 			goto pte_unlock;
 		}
 
@@ -2463,8 +2462,9 @@ static inline bool cow_user_page(struct page *dst, struct page *src,
 		vmf->pte = pte_offset_map_lock(mm, vmf->pmd, addr, &vmf->ptl);
 		locked = true;
 		if (!likely(pte_same(*vmf->pte, vmf->orig_pte))) {
-			/* The PTE changed under us. Retry page fault. */
+			/* The PTE changed under us. update local tlb */
 			ret = false;
+			update_mmu_cache(vma, addr, vmf->pte);
 			goto pte_unlock;
 		}
 
@@ -2704,6 +2704,7 @@ static vm_fault_t wp_page_copy(struct vm_fault *vmf)
 		}
 		flush_cache_page(vma, vmf->address, pte_pfn(vmf->orig_pte));
 		entry = mk_pte(new_page, vma->vm_page_prot);
+		entry = pte_mkyoung(entry);
 		entry = maybe_mkwrite(pte_mkdirty(entry), vma);
 		/*
 		 * Clear the pte entry and flush it first, before updating the
@@ -2752,6 +2753,7 @@ static vm_fault_t wp_page_copy(struct vm_fault *vmf)
 		new_page = old_page;
 		page_copied = 1;
 	} else {
+		update_mmu_cache(vma, vmf->address, vmf->pte);
 		mem_cgroup_cancel_charge(new_page, memcg, false);
 	}
 
@@ -2812,6 +2814,7 @@ vm_fault_t finish_mkwrite_fault(struct vm_fault *vmf)
 	 * pte_offset_map_lock.
 	 */
 	if (!pte_same(*vmf->pte, vmf->orig_pte)) {
+		update_mmu_cache(vmf->vma, vmf->address, vmf->pte);
 		pte_unmap_unlock(vmf->pte, vmf->ptl);
 		return VM_FAULT_NOPAGE;
 	}
@@ -2936,6 +2939,7 @@ static vm_fault_t do_wp_page(struct vm_fault *vmf)
 			vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd,
 					vmf->address, &vmf->ptl);
 			if (!pte_same(*vmf->pte, vmf->orig_pte)) {
+				update_mmu_cache(vma, vmf->address, vmf->pte);
 				unlock_page(vmf->page);
 				pte_unmap_unlock(vmf->pte, vmf->ptl);
 				put_page(vmf->page);
@@ -3341,8 +3345,10 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
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
@@ -3373,13 +3379,16 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
 	__SetPageUptodate(page);
 
 	entry = mk_pte(page, vma->vm_page_prot);
+	entry = pte_mkyoung(entry);
 	if (vma->vm_flags & VM_WRITE)
 		entry = pte_mkwrite(pte_mkdirty(entry));
 
 	vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd, vmf->address,
 			&vmf->ptl);
-	if (!pte_none(*vmf->pte))
+	if (!pte_none(*vmf->pte)) {
+		update_mmu_cache(vma, vmf->address, vmf->pte);
 		goto release;
+	}
 
 	ret = check_stable_address_space(vma->vm_mm);
 	if (ret)
@@ -3646,11 +3655,14 @@ vm_fault_t alloc_set_pte(struct vm_fault *vmf, struct mem_cgroup *memcg,
 	}
 
 	/* Re-check under ptl */
-	if (unlikely(!pte_none(*vmf->pte)))
+	if (unlikely(!pte_none(*vmf->pte))) {
+		update_mmu_cache(vma, vmf->address, vmf->pte);
 		return VM_FAULT_NOPAGE;
+	}
 
 	flush_icache_page(vma, page);
 	entry = mk_pte(page, vma->vm_page_prot);
+	entry = pte_mkyoung(entry);
 	if (write)
 		entry = maybe_mkwrite(pte_mkdirty(entry), vma);
 	/* copy-on-write page */
@@ -4224,8 +4236,10 @@ static vm_fault_t handle_pte_fault(struct vm_fault *vmf)
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
-- 
1.8.3.1

