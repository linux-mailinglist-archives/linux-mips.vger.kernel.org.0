Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49D6424CF40
	for <lists+linux-mips@lfdr.de>; Fri, 21 Aug 2020 09:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727841AbgHUHX5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Aug 2020 03:23:57 -0400
Received: from mail.loongson.cn ([114.242.206.163]:46552 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727900AbgHUHX5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 21 Aug 2020 03:23:57 -0400
Received: from localhost.localdomain (unknown [222.209.8.90])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP997dj9fGgoMAA--.14754S3;
        Fri, 21 Aug 2020 15:23:48 +0800 (CST)
From:   Huang Pei <huangpei@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        ambrosehua@gmail.com
Cc:     Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhc@lemote.com>, linux-mips@vger.kernel.org
Subject: [PATCH 2/3] MIPS: make userspace mapping young by default
Date:   Fri, 21 Aug 2020 15:23:28 +0800
Message-Id: <20200821072329.18006-2-huangpei@loongson.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200821072329.18006-1-huangpei@loongson.cn>
References: <20200821072329.18006-1-huangpei@loongson.cn>
X-CM-TRANSID: AQAAf9DxP997dj9fGgoMAA--.14754S3
X-Coremail-Antispam: 1UD129KBjvJXoW3XrWUGr1fKw45Jr4xCF4fGrg_yoWxtF47pa
        s7Cry8A3y3Xr13ZryxZrnrAw1rAwsIqFyjqwnrCa15X343Z34ktrs8KrZ2vrykWa92kw4U
        Z3WUXr4rW39I9rUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9m14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxGrwCFx2
        IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
        6r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
        AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IY
        s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr
        0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUqAp5UUUUU=
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This patch adds support for non-rixi, based on [1].

MIPS page fault path take 1 tlb miss + 2 tlb invalid exceptions, the
second tlb invalid excpetion is just caused by __update_tlb from
do_page_fault writing tlb without _PAGE_VALID set. With this patch, it
only take 1 tlb miss + 1 tlb invalid exceptions

[1]: https://lkml.kernel.org/lkml/1591416169-26666-1-git-send-email-maobibo@loongson.cn/

Signed-off-by: Huang Pei <huangpei@loongson.cn>
---
 arch/mips/include/asm/pgtable.h | 32 +++++++++++++++-----------------
 arch/mips/mm/cache.c            | 25 +++++++++++++------------
 mm/memory.c                     |  3 ---
 3 files changed, 28 insertions(+), 32 deletions(-)

diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index dd7a0f552cac..aaafe3d6a0a1 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -25,22 +25,22 @@
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
-#define PAGE_KERNEL	__pgprot(_PAGE_PRESENT | __READABLE | __WRITEABLE | \
-				 _PAGE_GLOBAL | _page_cachable_default)
-#define PAGE_KERNEL_NC	__pgprot(_PAGE_PRESENT | __READABLE | __WRITEABLE | \
-				 _PAGE_GLOBAL | _CACHE_CACHABLE_NONCOHERENT)
-#define PAGE_USERIO	__pgprot(_PAGE_PRESENT | _PAGE_WRITE | \
-				 _page_cachable_default)
+#define PAGE_NONE      __pgprot(_PAGE_PRESENT | _PAGE_NO_READ | \
+                                _page_cachable_default)
+#define PAGE_SHARED    __pgprot(_PAGE_PRESENT | _PAGE_WRITE | \
+                                __READABLE | _page_cachable_default)
+#define PAGE_COPY      __pgprot(_PAGE_PRESENT | _PAGE_NO_EXEC | \
+                                __READABLE | _page_cachable_default)
+#define PAGE_READONLY  __pgprot(_PAGE_PRESENT |  __READABLE | \
+                                _page_cachable_default)
+#define PAGE_KERNEL    __pgprot(_PAGE_PRESENT | __READABLE | __WRITEABLE | \
+                                _PAGE_GLOBAL | _page_cachable_default)
+#define PAGE_KERNEL_NC __pgprot(_PAGE_PRESENT | __READABLE | __WRITEABLE | \
+                                _PAGE_GLOBAL | _CACHE_CACHABLE_NONCOHERENT)
+#define PAGE_USERIO    __pgprot(_PAGE_PRESENT | _PAGE_WRITE | \
+                                _page_cachable_default)
 #define PAGE_KERNEL_UNCACHED __pgprot(_PAGE_PRESENT | __READABLE | \
-			__WRITEABLE | _PAGE_GLOBAL | _CACHE_UNCACHED)
+                       __WRITEABLE | _PAGE_GLOBAL | _CACHE_UNCACHED)
 
 /*
  * If _PAGE_NO_EXEC is not defined, we can't do page protection for
@@ -414,8 +414,6 @@ static inline pte_t pte_mkyoung(pte_t pte)
 	return pte;
 }
 
-#define pte_sw_mkyoung	pte_mkyoung
-
 #ifdef CONFIG_MIPS_HUGE_TLB_SUPPORT
 static inline int pte_huge(pte_t pte)	{ return pte_val(pte) & _PAGE_HUGE; }
 
diff --git a/arch/mips/mm/cache.c b/arch/mips/mm/cache.c
index 3e81ba000096..ed75f2871aad 100644
--- a/arch/mips/mm/cache.c
+++ b/arch/mips/mm/cache.c
@@ -159,22 +159,23 @@ static inline void setup_protection_map(void)
 {
 	if (cpu_has_rixi) {
 		protection_map[0]  = __pgprot(_page_cachable_default | _PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
-		protection_map[1]  = __pgprot(_page_cachable_default | _PAGE_PRESENT | _PAGE_NO_EXEC);
+		protection_map[1]  = __pgprot(_page_cachable_default | _PAGE_PRESENT | _PAGE_NO_EXEC | __READABLE);
 		protection_map[2]  = __pgprot(_page_cachable_default | _PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
-		protection_map[3]  = __pgprot(_page_cachable_default | _PAGE_PRESENT | _PAGE_NO_EXEC);
-		protection_map[4]  = __pgprot(_page_cachable_default | _PAGE_PRESENT);
-		protection_map[5]  = __pgprot(_page_cachable_default | _PAGE_PRESENT);
-		protection_map[6]  = __pgprot(_page_cachable_default | _PAGE_PRESENT);
-		protection_map[7]  = __pgprot(_page_cachable_default | _PAGE_PRESENT);
+		protection_map[3]  = __pgprot(_page_cachable_default | _PAGE_PRESENT | _PAGE_NO_EXEC | __READABLE);
+		protection_map[4]  = __pgprot(_page_cachable_default | _PAGE_PRESENT | __READABLE);
+		protection_map[5]  = __pgprot(_page_cachable_default | _PAGE_PRESENT | __READABLE);
+		protection_map[6]  = __pgprot(_page_cachable_default | _PAGE_PRESENT | __READABLE);
+		protection_map[7]  = __pgprot(_page_cachable_default | _PAGE_PRESENT | __READABLE);
 
 		protection_map[8]  = __pgprot(_page_cachable_default | _PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_NO_READ);
-		protection_map[9]  = __pgprot(_page_cachable_default | _PAGE_PRESENT | _PAGE_NO_EXEC);
+		protection_map[9]  = __pgprot(_page_cachable_default | _PAGE_PRESENT | _PAGE_NO_EXEC | __READABLE);
 		protection_map[10] = __pgprot(_page_cachable_default | _PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE | _PAGE_NO_READ);
-		protection_map[11] = __pgprot(_page_cachable_default | _PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE);
-		protection_map[12] = __pgprot(_page_cachable_default | _PAGE_PRESENT);
-		protection_map[13] = __pgprot(_page_cachable_default | _PAGE_PRESENT);
-		protection_map[14] = __pgprot(_page_cachable_default | _PAGE_PRESENT | _PAGE_WRITE);
-		protection_map[15] = __pgprot(_page_cachable_default | _PAGE_PRESENT | _PAGE_WRITE);
+		protection_map[11] = __pgprot(_page_cachable_default | _PAGE_PRESENT | _PAGE_NO_EXEC | _PAGE_WRITE | __READABLE);
+		protection_map[12]  = __pgprot(_page_cachable_default | _PAGE_PRESENT | __READABLE);
+		protection_map[13]  = __pgprot(_page_cachable_default | _PAGE_PRESENT | __READABLE);
+		protection_map[14]  = __pgprot(_page_cachable_default | _PAGE_PRESENT | _PAGE_NO_EXEC | __READABLE);
+		protection_map[15]  = __pgprot(_page_cachable_default | _PAGE_PRESENT | _PAGE_NO_EXEC | __READABLE);
+
 
 	} else {
 		protection_map[0] = PAGE_NONE;
diff --git a/mm/memory.c b/mm/memory.c
index 3a7779d9891d..834424ea8a24 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2705,7 +2705,6 @@ static vm_fault_t wp_page_copy(struct vm_fault *vmf)
 		}
 		flush_cache_page(vma, vmf->address, pte_pfn(vmf->orig_pte));
 		entry = mk_pte(new_page, vma->vm_page_prot);
-		entry = pte_sw_mkyoung(entry);
 		entry = maybe_mkwrite(pte_mkdirty(entry), vma);
 		/*
 		 * Clear the pte entry and flush it first, before updating the
@@ -3386,7 +3385,6 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
 	__SetPageUptodate(page);
 
 	entry = mk_pte(page, vma->vm_page_prot);
-	entry = pte_sw_mkyoung(entry);
 	if (vma->vm_flags & VM_WRITE)
 		entry = pte_mkwrite(pte_mkdirty(entry));
 
@@ -3661,7 +3659,6 @@ vm_fault_t alloc_set_pte(struct vm_fault *vmf, struct page *page)
 
 	flush_icache_page(vma, page);
 	entry = mk_pte(page, vma->vm_page_prot);
-	entry = pte_sw_mkyoung(entry);
 	if (write)
 		entry = maybe_mkwrite(pte_mkdirty(entry), vma);
 	/* copy-on-write page */
-- 
2.17.1

