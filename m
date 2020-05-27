Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 264191E359D
	for <lists+linux-mips@lfdr.de>; Wed, 27 May 2020 04:26:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726746AbgE0C0X (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 22:26:23 -0400
Received: from mail.loongson.cn ([114.242.206.163]:41680 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727867AbgE0C0J (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 26 May 2020 22:26:09 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr2uQz81e3nc5AA--.351S4;
        Wed, 27 May 2020 10:25:20 +0800 (CST)
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
Subject: [PATCH v7 2/4] mm/memory.c: Update local TLB if PTE entry exists
Date:   Wed, 27 May 2020 10:25:18 +0800
Message-Id: <1590546320-21814-3-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1590546320-21814-1-git-send-email-maobibo@loongson.cn>
References: <1590546320-21814-1-git-send-email-maobibo@loongson.cn>
X-CM-TRANSID: AQAAf9Dxr2uQz81e3nc5AA--.351S4
X-Coremail-Antispam: 1UD129KBjvJXoWxuFW5Ar4rJFWkuw18Zw1rXrb_yoWxCw1UpF
        93Can8Xa17Xr18AFWfJr1Dur13Z34rKFykJry3Kw1Fvwnxtw1Sga4rG3yrArZ5Jr9Yq3Zr
        Jr4jgF4UCa17uw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
        8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF
        64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcV
        CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2
        jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0V
        AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1l
        Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04
        v7MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s02
        6c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GF
        v_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvE
        c7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67
        AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZE
        Xa7IU5DMa5UUUUU==
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

If two threads concurrently fault at the same page, the thread that
won the race updates the PTE and its local TLB. For now, the other
thread gives up, simply does nothing, and continues.

It could happen that this second thread triggers another fault, whereby
it only updates its local TLB while handling the fault. Instead of
triggering another fault, let's directly update the local TLB of the
second thread. Function update_mmu_tlb is used here to update local
TLB on the second thread, and it is defined as empty on other arches.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
Acked-by: Andrew Morton <akpm@linux-foundation.org>
---
 arch/mips/include/asm/pgtable.h | 23 +++++++++++++++++++++++
 include/asm-generic/pgtable.h   | 17 +++++++++++++++++
 mm/memory.c                     | 27 +++++++++++++++++++--------
 3 files changed, 59 insertions(+), 8 deletions(-)

diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index f8f48fc..6f40612 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -483,6 +483,26 @@ static inline void flush_tlb_fix_spurious_fault(struct vm_area_struct *vma,
 {
 }
 
+#define __HAVE_ARCH_PTE_SAME
+static inline int pte_same(pte_t pte_a, pte_t pte_b)
+{
+	return pte_val(pte_a) == pte_val(pte_b);
+}
+
+#define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
+static inline int ptep_set_access_flags(struct vm_area_struct *vma,
+					unsigned long address, pte_t *ptep,
+					pte_t entry, int dirty)
+{
+	if (!pte_same(*ptep, entry))
+		set_pte_at(vma->vm_mm, address, ptep, entry);
+	/*
+	 * update_mmu_cache will unconditionally execute, handling both
+	 * the case that the PTE changed and the spurious fault case.
+	 */
+	return true;
+}
+
 /*
  * Conversion functions: convert a page and protection to a page entry,
  * and a page entry and page directory to the page they refer to.
@@ -526,6 +546,9 @@ static inline void update_mmu_cache(struct vm_area_struct *vma,
 	__update_tlb(vma, address, pte);
 }
 
+#define	__HAVE_ARCH_UPDATE_MMU_TLB
+#define update_mmu_tlb	update_mmu_cache
+
 static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
 	unsigned long address, pmd_t *pmdp)
 {
diff --git a/include/asm-generic/pgtable.h b/include/asm-generic/pgtable.h
index 329b8c8..fa5c73f 100644
--- a/include/asm-generic/pgtable.h
+++ b/include/asm-generic/pgtable.h
@@ -188,6 +188,23 @@ static inline pte_t ptep_get_and_clear_full(struct mm_struct *mm,
 }
 #endif
 
+
+/*
+ * If two threads concurrently fault at the same page, the thread that
+ * won the race updates the PTE and its local TLB/Cache. The other thread
+ * gives up, simply does nothing, and continues; on architectures where
+ * software can update TLB,  local TLB can be updated here to avoid next page
+ * fault. This function updates TLB only, do nothing with cache or others.
+ * It is the difference with function update_mmu_cache.
+ */
+#ifndef __HAVE_ARCH_UPDATE_MMU_TLB
+static inline void update_mmu_tlb(struct vm_area_struct *vma,
+				unsigned long address, pte_t *ptep)
+{
+}
+#define __HAVE_ARCH_UPDATE_MMU_TLB
+#endif
+
 /*
  * Some architectures may be able to avoid expensive synchronization
  * primitives when modifications are made to PTE's which are already
diff --git a/mm/memory.c b/mm/memory.c
index f703fe8..8bb31c4 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2436,10 +2436,9 @@ static inline bool cow_user_page(struct page *dst, struct page *src,
 		if (!likely(pte_same(*vmf->pte, vmf->orig_pte))) {
 			/*
 			 * Other thread has already handled the fault
-			 * and we don't need to do anything. If it's
-			 * not the case, the fault will be triggered
-			 * again on the same address.
+			 * and update local tlb only
 			 */
+			update_mmu_tlb(vma, addr, vmf->pte);
 			ret = false;
 			goto pte_unlock;
 		}
@@ -2463,7 +2462,8 @@ static inline bool cow_user_page(struct page *dst, struct page *src,
 		vmf->pte = pte_offset_map_lock(mm, vmf->pmd, addr, &vmf->ptl);
 		locked = true;
 		if (!likely(pte_same(*vmf->pte, vmf->orig_pte))) {
-			/* The PTE changed under us. Retry page fault. */
+			/* The PTE changed under us, update local tlb */
+			update_mmu_tlb(vma, addr, vmf->pte);
 			ret = false;
 			goto pte_unlock;
 		}
@@ -2752,6 +2752,7 @@ static vm_fault_t wp_page_copy(struct vm_fault *vmf)
 		new_page = old_page;
 		page_copied = 1;
 	} else {
+		update_mmu_tlb(vma, vmf->address, vmf->pte);
 		mem_cgroup_cancel_charge(new_page, memcg, false);
 	}
 
@@ -2812,6 +2813,7 @@ vm_fault_t finish_mkwrite_fault(struct vm_fault *vmf)
 	 * pte_offset_map_lock.
 	 */
 	if (!pte_same(*vmf->pte, vmf->orig_pte)) {
+		update_mmu_tlb(vmf->vma, vmf->address, vmf->pte);
 		pte_unmap_unlock(vmf->pte, vmf->ptl);
 		return VM_FAULT_NOPAGE;
 	}
@@ -2936,6 +2938,7 @@ static vm_fault_t do_wp_page(struct vm_fault *vmf)
 			vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd,
 					vmf->address, &vmf->ptl);
 			if (!pte_same(*vmf->pte, vmf->orig_pte)) {
+				update_mmu_tlb(vma, vmf->address, vmf->pte);
 				unlock_page(vmf->page);
 				pte_unmap_unlock(vmf->pte, vmf->ptl);
 				put_page(vmf->page);
@@ -3341,8 +3344,10 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
 						vma->vm_page_prot));
 		vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd,
 				vmf->address, &vmf->ptl);
-		if (!pte_none(*vmf->pte))
+		if (!pte_none(*vmf->pte)) {
+			update_mmu_tlb(vma, vmf->address, vmf->pte);
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
+		update_mmu_tlb(vma, vmf->address, vmf->pte);
 		return VM_FAULT_NOPAGE;
+	}
 
 	flush_icache_page(vma, page);
 	entry = mk_pte(page, vma->vm_page_prot);
@@ -4224,8 +4233,10 @@ static vm_fault_t handle_pte_fault(struct vm_fault *vmf)
 	vmf->ptl = pte_lockptr(vmf->vma->vm_mm, vmf->pmd);
 	spin_lock(vmf->ptl);
 	entry = vmf->orig_pte;
-	if (unlikely(!pte_same(*vmf->pte, entry)))
+	if (unlikely(!pte_same(*vmf->pte, entry))) {
+		update_mmu_tlb(vmf->vma, vmf->address, vmf->pte);
 		goto unlock;
+	}
 	if (vmf->flags & FAULT_FLAG_WRITE) {
 		if (!pte_write(entry))
 			return do_wp_page(vmf);
-- 
1.8.3.1

