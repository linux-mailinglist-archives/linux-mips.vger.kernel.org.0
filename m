Return-Path: <linux-mips+bounces-6552-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D837B9B5BDC
	for <lists+linux-mips@lfdr.de>; Wed, 30 Oct 2024 07:39:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 07C821C2105C
	for <lists+linux-mips@lfdr.de>; Wed, 30 Oct 2024 06:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33F2B18E37B;
	Wed, 30 Oct 2024 06:39:19 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E8AC1D31AE;
	Wed, 30 Oct 2024 06:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730270359; cv=none; b=t6MG4sATucrtIrsBDCCEYU/4TR1t1KJMVRpRcqO2oE5DUYIZtsx1VOyEgJjgpi2LPuHgPhh/w/ByJks0zKl1OaJvNczho/vP5dE+sSmQf4+kYt7mHgZuQmdCrT+kEWeeimxOq82+5Z9XWdpcVHuiTzmuzAPmGZX7/X0I2rYkWdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730270359; c=relaxed/simple;
	bh=3nyyNH5v2uLVnFdxFFD+XNXeHYcJOF9QmL11NuXz+wU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tkIsdD1f/kRirqW97I03TzyQ3/XuQ9qjOwdPb/Xj/dv/54LBM/GWvjeLU/V7KNeoSkfG0iOYA2VmLtCABglZ+ggaj25HS4O4v2DS+UjhRYicYoOsiRKFwobHrqY9KlxfOfcuLdDGJhz6kylSL7gsR0GcNXzIDSwvsVphbRqc/yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.2.5.213])
	by gateway (Coremail) with SMTP id _____8AxquGR1CFnA6kdAA--.62511S3;
	Wed, 30 Oct 2024 14:39:13 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.213])
	by front1 (Coremail) with SMTP id qMiowMDxPEeP1CFntLooAA--.23618S2;
	Wed, 30 Oct 2024 14:39:12 +0800 (CST)
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
Subject: [PATCH v2] mm: define general function pXd_init()
Date: Wed, 30 Oct 2024 14:39:05 +0800
Message-Id: <20241030063905.2434824-1-maobibo@loongson.cn>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMDxPEeP1CFntLooAA--.23618S2
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Function pud_init(), pmd_init() and kernel_pte_init() are duplicated
defined in file kasan.c and sparse-vmemmap.c as weak functions. Move
them to generic header file pgtable.h, architecture can redefine them.

Signed-off-by: Bibo Mao <maobibo@loongson.cn>
---
v1 ... v2:
  1. Add general function definition about kernel_pte_init().
---
 arch/loongarch/include/asm/pgtable.h |  3 +++
 arch/mips/include/asm/pgtable-64.h   |  2 ++
 include/linux/mm.h                   |  3 ---
 include/linux/pgtable.h              | 21 +++++++++++++++++++++
 mm/kasan/init.c                      | 12 ------------
 mm/sparse-vmemmap.c                  | 12 ------------
 6 files changed, 26 insertions(+), 27 deletions(-)

diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
index 20714b73f14c..df5889d995f9 100644
--- a/arch/loongarch/include/asm/pgtable.h
+++ b/arch/loongarch/include/asm/pgtable.h
@@ -267,8 +267,11 @@ extern void set_pmd_at(struct mm_struct *mm, unsigned long addr, pmd_t *pmdp, pm
  * Initialize a new pgd / pud / pmd table with invalid pointers.
  */
 extern void pgd_init(void *addr);
+#define pud_init pud_init
 extern void pud_init(void *addr);
+#define pmd_init pmd_init
 extern void pmd_init(void *addr);
+#define kernel_pte_init kernel_pte_init
 extern void kernel_pte_init(void *addr);
 
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
index 61fff5d34ed5..651bdc1bef48 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3818,9 +3818,6 @@ void *sparse_buffer_alloc(unsigned long size);
 struct page * __populate_section_memmap(unsigned long pfn,
 		unsigned long nr_pages, int nid, struct vmem_altmap *altmap,
 		struct dev_pagemap *pgmap);
-void pud_init(void *addr);
-void pmd_init(void *addr);
-void kernel_pte_init(void *addr);
 pgd_t *vmemmap_pgd_populate(unsigned long addr, int node);
 p4d_t *vmemmap_p4d_populate(pgd_t *pgd, unsigned long addr, int node);
 pud_t *vmemmap_pud_populate(p4d_t *p4d, unsigned long addr, int node);
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index e8b2ac6bd2ae..adee214c21f8 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -90,6 +90,27 @@ static inline unsigned long pud_index(unsigned long address)
 #define pgd_index(a)  (((a) >> PGDIR_SHIFT) & (PTRS_PER_PGD - 1))
 #endif
 
+#ifndef kernel_pte_init
+static inline void kernel_pte_init(void *addr)
+{
+}
+#define kernel_pte_init kernel_pte_init
+#endif
+
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
index ac607c306292..ced6b29fcf76 100644
--- a/mm/kasan/init.c
+++ b/mm/kasan/init.c
@@ -106,10 +106,6 @@ static void __ref zero_pte_populate(pmd_t *pmd, unsigned long addr,
 	}
 }
 
-void __weak __meminit kernel_pte_init(void *addr)
-{
-}
-
 static int __ref zero_pmd_populate(pud_t *pud, unsigned long addr,
 				unsigned long end)
 {
@@ -145,10 +141,6 @@ static int __ref zero_pmd_populate(pud_t *pud, unsigned long addr,
 	return 0;
 }
 
-void __weak __meminit pmd_init(void *addr)
-{
-}
-
 static int __ref zero_pud_populate(p4d_t *p4d, unsigned long addr,
 				unsigned long end)
 {
@@ -187,10 +179,6 @@ static int __ref zero_pud_populate(p4d_t *p4d, unsigned long addr,
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
index c0388b2e959d..cec67c5f37d8 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -184,10 +184,6 @@ static void * __meminit vmemmap_alloc_block_zero(unsigned long size, int node)
 	return p;
 }
 
-void __weak __meminit kernel_pte_init(void *addr)
-{
-}
-
 pmd_t * __meminit vmemmap_pmd_populate(pud_t *pud, unsigned long addr, int node)
 {
 	pmd_t *pmd = pmd_offset(pud, addr);
@@ -201,10 +197,6 @@ pmd_t * __meminit vmemmap_pmd_populate(pud_t *pud, unsigned long addr, int node)
 	return pmd;
 }
 
-void __weak __meminit pmd_init(void *addr)
-{
-}
-
 pud_t * __meminit vmemmap_pud_populate(p4d_t *p4d, unsigned long addr, int node)
 {
 	pud_t *pud = pud_offset(p4d, addr);
@@ -218,10 +210,6 @@ pud_t * __meminit vmemmap_pud_populate(p4d_t *p4d, unsigned long addr, int node)
 	return pud;
 }
 
-void __weak __meminit pud_init(void *addr)
-{
-}
-
 p4d_t * __meminit vmemmap_p4d_populate(pgd_t *pgd, unsigned long addr, int node)
 {
 	p4d_t *p4d = p4d_offset(pgd, addr);

base-commit: 81983758430957d9a5cb3333fe324fd70cf63e7e
-- 
2.39.3


