Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 657041DC5AF
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2020 05:31:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728193AbgEUDbC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 May 2020 23:31:02 -0400
Received: from mail.loongson.cn ([114.242.206.163]:60934 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726954AbgEUDbC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 20 May 2020 23:31:02 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx793d9cVewz03AA--.629S4;
        Thu, 21 May 2020 11:30:39 +0800 (CST)
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
Subject: [PATCH v5 3/4] mm/memory.c: Add memory read privilege on page fault handling
Date:   Thu, 21 May 2020 11:30:36 +0800
Message-Id: <1590031837-9582-3-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1590031837-9582-1-git-send-email-maobibo@loongson.cn>
References: <1590031837-9582-1-git-send-email-maobibo@loongson.cn>
X-CM-TRANSID: AQAAf9Dx793d9cVewz03AA--.629S4
X-Coremail-Antispam: 1UD129KBjvJXoWxZFy5KF13KFW5CFy3Gr1rJFb_yoW5AFy7pF
        Z7CwnY9rsrXw1xAFWfGFn29r1ruw4rKFWY9rySk3Wku3ZxJrn8Wrs7GayFv34kJFWkK3Wr
        Gr4jqr4UZay2vaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPSb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
        8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF
        64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcV
        CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280
        aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4
        CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvj
        eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxw
        CY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
        x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6r
        W5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF
        7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI
        0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7I
        U5DMa5UUUUU==
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
 include/asm-generic/pgtable.h   | 16 ++++++++++++++++
 mm/memory.c                     |  3 +++
 3 files changed, 21 insertions(+)

diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index 5f610ec..9cd811e 100644
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
index 329b8c8..7dcfa30 100644
--- a/include/asm-generic/pgtable.h
+++ b/include/asm-generic/pgtable.h
@@ -227,6 +227,22 @@ static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addres
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
+#define pte_sw_mkyoung	pte_sw_mkyoung
+#endif
+
 #ifndef pte_savedwrite
 #define pte_savedwrite pte_write
 #endif
diff --git a/mm/memory.c b/mm/memory.c
index 9e2be4a..33d3b4c 100644
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

