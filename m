Return-Path: <linux-mips+bounces-5985-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9719099A031
	for <lists+linux-mips@lfdr.de>; Fri, 11 Oct 2024 11:33:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A28D1F24247
	for <lists+linux-mips@lfdr.de>; Fri, 11 Oct 2024 09:33:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E0020FAAD;
	Fri, 11 Oct 2024 09:33:31 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 566DF20FA9F;
	Fri, 11 Oct 2024 09:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728639211; cv=none; b=ijGe/LIW0SB+G/vy8Z7cr+KUl4n8kokuGts/m90d2mfZaTEcvM8588XjbrpyWMsMx0YrcVaLgEUc/yLW5Fr1+nOdAM4WpGDrdcYIj6ygrrvBJ1iX0V37EbUHY54G2H/j0NGGeeFLk/R390Ubro+XTa4uOPvI9+IoDuZ1Qh6rCsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728639211; c=relaxed/simple;
	bh=M0d+ANDehZEebyJHx2IcY4rTbs80ZSrqNjo1Xmet/O4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MXCFeJCilycQJwjSIp3O6s/k8K0clHApp/4qo28ObrnjeODcDn0z99EIYF/DA55Yh3o5X8UCzLwbhiGqGLB0FX2aAIUSUGiBRHp28O8uI+l6DuCNgWpvr3n/kx0kkbDIq2h8hRptTwonk7k7grguBD3WmR9rJW+1SWHhv/ZRGoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8Bx22rg8AhnsmQTAA--.28485S3;
	Fri, 11 Oct 2024 17:33:20 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowMBxXuTf8AhnWK8jAA--.48225S2;
	Fri, 11 Oct 2024 17:33:19 +0800 (CST)
From: Bibo Mao <maobibo@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mm@kvack.org,
	kasan-dev@googlegroups.com,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	WANG Xuerui <kernel@xen0n.name>
Subject: [PATCH] mm: Define general function pXd_init()
Date: Fri, 11 Oct 2024 17:33:18 +0800
Message-Id: <20241011093318.519432-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMBxXuTf8AhnWK8jAA--.48225S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Function pmd_init() and pud_init() are duplicated defined in file kasan.c
and sparse-vmemmap.c as weak function. Now move them to generic header
file pgtable.h, architecture can redefine them.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
 arch/loongarch/include/asm/pgtable.h |  2 ++
 arch/mips/include/asm/pgtable-64.h   |  2 ++
 include/linux/mm.h                   |  2 --
 include/linux/pgtable.h              | 14 ++++++++++++++
 mm/kasan/init.c                      |  8 --------
 mm/sparse-vmemmap.c                  |  8 --------
 6 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index 9965f52ef65b..8bd653a6fa70 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -267,7 +267,9 @@ extern void set_pmd_at(struct mm_struct *mm, unsigned long addr, pmd_t *pmdp, pm
  * Initialize a new pgd / pud / pmd table with invalid pointers.
  */
 extern void pgd_init(void *addr);
+#define pud_init pud_init
 extern void pud_init(void *addr);
+#define pmd_init pmd_init
 extern void pmd_init(void *addr);
 
 /*
diff --git a/arch/mips/include/asm/pgtable-64.h b/arch/mips/include/asm/pgtable-64.h
index 401c1d9e4409..45c8572a0462 100644
--- a/arch/mips/include/asm/pgtable-64.h
+++ b/arch/mips/include/asm/pgtable-64.h
@@ -316,7 +316,9 @@ static inline pmd_t *pud_pgtable(pud_t pud)
  * Initialize a new pgd / pud / pmd table with invalid pointers.
  */
 extern void pgd_init(void *addr);
+#define pud_init pud_init
 extern void pud_init(void *addr);
+#define pmd_init pmd_init
 extern void pmd_init(void *addr);
 
 /*
diff --git a/include/linux/mm.h b/include/linux/mm.h
index ecf63d2b0582..651bdc1bef48 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3818,8 +3818,6 @@ void *sparse_buffer_alloc(unsigned long size);
 struct page * __populate_section_memmap(unsigned long pfn,
 		unsigned long nr_pages, int nid, struct vmem_altmap *altmap,
 		struct dev_pagemap *pgmap);
-void pmd_init(void *addr);
-void pud_init(void *addr);
 pgd_t *vmemmap_pgd_populate(unsigned long addr, int node);
 p4d_t *vmemmap_p4d_populate(pgd_t *pgd, unsigned long addr, int node);
 pud_t *vmemmap_pud_populate(p4d_t *p4d, unsigned long addr, int node);
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index e8b2ac6bd2ae..bec5356ee644 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -90,6 +90,20 @@ static inline unsigned long pud_index(unsigned long address)
 #define pgd_index(a)  (((a) >> PGDIR_SHIFT) & (PTRS_PER_PGD - 1))
 #endif
 
+#ifndef pmd_init
+static inline void pmd_init(void *addr)
+{
+}
+#define pmd_init pmd_init
+#endif
+
+#ifndef pud_init
+static inline void pud_init(void *addr)
+{
+}
+#define pud_init pud_init
+#endif
+
 #ifndef pte_offset_kernel
 static inline pte_t *pte_offset_kernel(pmd_t *pmd, unsigned long address)
 {
diff --git a/mm/kasan/init.c b/mm/kasan/init.c
index 89895f38f722..6b2dac62e63a 100644
--- a/mm/kasan/init.c
+++ b/mm/kasan/init.c
@@ -139,10 +139,6 @@ static int __ref zero_pmd_populate(pud_t *pud, unsigned long addr,
 	return 0;
 }
 
-void __weak __meminit pmd_init(void *addr)
-{
-}
-
 static int __ref zero_pud_populate(p4d_t *p4d, unsigned long addr,
 				unsigned long end)
 {
@@ -181,10 +177,6 @@ static int __ref zero_pud_populate(p4d_t *p4d, unsigned long addr,
 	return 0;
 }
 
-void __weak __meminit pud_init(void *addr)
-{
-}
-
 static int __ref zero_p4d_populate(pgd_t *pgd, unsigned long addr,
 				unsigned long end)
 {
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index edcc7a6b0f6f..a0c884947861 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -196,10 +196,6 @@ pmd_t * __meminit vmemmap_pmd_populate(pud_t *pud, unsigned long addr, int node)
 	return pmd;
 }
 
-void __weak __meminit pmd_init(void *addr)
-{
-}
-
 pud_t * __meminit vmemmap_pud_populate(p4d_t *p4d, unsigned long addr, int node)
 {
 	pud_t *pud = pud_offset(p4d, addr);
@@ -213,10 +209,6 @@ pud_t * __meminit vmemmap_pud_populate(p4d_t *p4d, unsigned long addr, int node)
 	return pud;
 }
 
-void __weak __meminit pud_init(void *addr)
-{
-}
-
 p4d_t * __meminit vmemmap_p4d_populate(pgd_t *pgd, unsigned long addr, int node)
 {
 	p4d_t *p4d = p4d_offset(pgd, addr);

base-commit: 87d6aab2389e5ce0197d8257d5f8ee965a67c4cd
-- 
2.39.3


