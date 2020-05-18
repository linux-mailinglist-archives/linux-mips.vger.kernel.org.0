Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65D7E1D7029
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2020 07:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726355AbgERFJs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 May 2020 01:09:48 -0400
Received: from mail.loongson.cn ([114.242.206.163]:58152 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726358AbgERFJr (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 18 May 2020 01:09:47 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb99lGMJeaPY1AA--.27S4;
        Mon, 18 May 2020 13:08:54 +0800 (CST)
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
Subject: [PATCH v3 3/3] mm/memory.c: Add memory read privilege before filling PTE entry
Date:   Mon, 18 May 2020 13:08:49 +0800
Message-Id: <1589778529-25627-3-git-send-email-maobibo@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1589778529-25627-1-git-send-email-maobibo@loongson.cn>
References: <1589778529-25627-1-git-send-email-maobibo@loongson.cn>
X-CM-TRANSID: AQAAf9Dxb99lGMJeaPY1AA--.27S4
X-Coremail-Antispam: 1UD129KBjvJXoW7KFW3Ar1DAF15Jr4UWw1rWFg_yoW8ZryrpF
        Z3Gw1q9rs7Xw1DAF4xG3Z5Ar15ua1FgayFvr95Cw1rZwnxtrs0grWxJFWFvFykAFy8Kw1r
        AF4jyr4UZa18uaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPSb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
        8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF
        64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcV
        CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280
        aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4
        CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvj
        eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxw
        CY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAq
        x4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6r
        W5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF
        7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI
        0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7I
        U8sID7UUUUU==
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On mips platform, hw PTE entry valid bit is set in pte_mkyoung
function, it is used to set physical page with readable privilege.

Here add pte_mkyoung function to make page readable on MIPS platform
during page fault handling. This patch improves page fault latency
about 10% on my MIPS machine with lmbench lat_pagefault case.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 mm/memory.c   | 3 +++
 mm/mprotect.c | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/mm/memory.c b/mm/memory.c
index 2eb59a9..2399dcb 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2704,6 +2704,7 @@ static vm_fault_t wp_page_copy(struct vm_fault *vmf)
 		}
 		flush_cache_page(vma, vmf->address, pte_pfn(vmf->orig_pte));
 		entry = mk_pte(new_page, vma->vm_page_prot);
+		entry = pte_mkyoung(entry);
 		entry = maybe_mkwrite(pte_mkdirty(entry), vma);
 		/*
 		 * Clear the pte entry and flush it first, before updating the
@@ -3378,6 +3379,7 @@ static vm_fault_t do_anonymous_page(struct vm_fault *vmf)
 	__SetPageUptodate(page);
 
 	entry = mk_pte(page, vma->vm_page_prot);
+	entry = pte_mkyoung(entry);
 	if (vma->vm_flags & VM_WRITE)
 		entry = pte_mkwrite(pte_mkdirty(entry));
 
@@ -3660,6 +3662,7 @@ vm_fault_t alloc_set_pte(struct vm_fault *vmf, struct mem_cgroup *memcg,
 
 	flush_icache_page(vma, page);
 	entry = mk_pte(page, vma->vm_page_prot);
+	entry = pte_mkyoung(entry);
 	if (write)
 		entry = maybe_mkwrite(pte_mkdirty(entry), vma);
 	/* copy-on-write page */
diff --git a/mm/mprotect.c b/mm/mprotect.c
index 494192ca..673f1cd 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -131,6 +131,8 @@ static unsigned long change_pte_range(struct vm_area_struct *vma, pmd_t *pmd,
 				ptent = pte_clear_uffd_wp(ptent);
 			}
 
+			if (vma->vm_flags & VM_READ)
+				ptent = pte_mkyoung(ptent);
 			/* Avoid taking write faults for known dirty pages */
 			if (dirty_accountable && pte_dirty(ptent) &&
 					(pte_soft_dirty(ptent) ||
-- 
1.8.3.1

