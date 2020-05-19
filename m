Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E84541D93EF
	for <lists+linux-mips@lfdr.de>; Tue, 19 May 2020 12:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726938AbgESKEC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 19 May 2020 06:04:02 -0400
Received: from mail.loongson.cn ([114.242.206.163]:42506 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726508AbgESKEC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 19 May 2020 06:04:02 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz97yrsNeDoM2AA--.42S4;
        Tue, 19 May 2020 18:03:32 +0800 (CST)
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
Subject: [PATCH v4 3/4] mm/memory.c: Add memory read privilege on page fault handling
Date:   Tue, 19 May 2020 18:03:29 +0800
Message-Id: <1589882610-7291-3-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1589882610-7291-1-git-send-email-maobibo@loongson.cn>
References: <1589882610-7291-1-git-send-email-maobibo@loongson.cn>
X-CM-TRANSID: AQAAf9Dxz97yrsNeDoM2AA--.42S4
X-Coremail-Antispam: 1UD129KBjvJXoWxZFy5KF13KFyfJrykZry8uFg_yoW5AryfpF
        Z7Cw1F9rsxXw18AFWfGFn2kr15ua1rKFWrurySkw1ku3ZxJrs8Wrs7GayFv34kJFWkK3Wr
        Gr4jqr4UZayIvaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBGb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
        8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF
        64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcV
        CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280
        aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzV
        Aqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S
        6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7Mx
        AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
        Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwI
        xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8
        Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0x
        vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07b5wZcUUUUU=
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Here add pte_sw_mkyoung function to make page readable on MIPS
platform during page fault handling. This patch improves page
fault latency about 10% on my MIPS machine with lmbench
lat_pagefault case.

It is noop function on other arches, there is no negative
influence on those architectures.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/mips/include/asm/pgtable.h |  2 ++
 include/asm-generic/pgtable.h   | 15 +++++++++++++++
 mm/memory.c                     |  3 +++
 3 files changed, 20 insertions(+)

diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index 0d625c2..755d534 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -414,6 +414,8 @@ static inline pte_t pte_mkyoung(pte_t pte)
 	return pte;
 }
 
+#define pte_sw_mkyoung	pte_mkyoung
+
 #ifdef CONFIG_MIPS_HUGE_TLB_SUPPORT
 static inline int pte_huge(pte_t pte)	{ return pte_val(pte) & _PAGE_HUGE; }
 
diff --git a/include/asm-generic/pgtable.h b/include/asm-generic/pgtable.h
index 329b8c8..2542ef1 100644
--- a/include/asm-generic/pgtable.h
+++ b/include/asm-generic/pgtable.h
@@ -227,6 +227,21 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addres
 }
 #endif
 
+/*
+ * On some architectures hardware does not set page access bit when accessing
+ * memory page, it is responsibilty of software setting this bit. It brings
+ * out extra page fault penalty to track page access bit. For optimization page
+ * access bit can be set during all page fault flow on these arches.
+ * To be differentiate with macro pte_mkyoung, this macro is used on platforms
+ * where software maintains page access bit.
+ */
+#ifndef pte_sw_mkyoung
+static inline pte_t pte_sw_mkyoung(pte_t pte)
+{
+	return pte;
+}
+#endif
+
 #ifndef pte_savedwrite
 #define pte_savedwrite pte_write
 #endif
diff --git a/mm/memory.c b/mm/memory.c
index 2eb59a9..d9700b1 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2704,6 +2704,7 @@ static vm_fault_t wp_page_copy(struct vm_fault *vmf)
 		}
 		flush_cache_page(vma, vmf->address, pte_pfn(vmf->orig_pte));
 		entry = mk_pte(new_page, vma->vm_page_prot);
+		entry = pte_sw_mkyoung(entry);
 		entry = maybe_mkwrite(pte_mkdirty(entry), vma);
 		/*
 		 * Clear the pte entry and flush it first, before updating the
@@ -3378,6 +3379,7 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
 	__SetPageUptodate(page);
 
 	entry = mk_pte(page, vma->vm_page_prot);
+	entry = pte_sw_mkyoung(entry);
 	if (vma->vm_flags & VM_WRITE)
 		entry = pte_mkwrite(pte_mkdirty(entry));
 
@@ -3660,6 +3662,7 @@ vm_fault_t alloc_set_pte(struct vm_fault *vmf, struct mem_cgroup *memcg,
 
 	flush_icache_page(vma, page);
 	entry = mk_pte(page, vma->vm_page_prot);
+	entry = pte_sw_mkyoung(entry);
 	if (write)
 		entry = maybe_mkwrite(pte_mkdirty(entry), vma);
 	/* copy-on-write page */
-- 
1.8.3.1

