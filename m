Return-Path: <linux-mips+bounces-7934-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E65CA433DF
	for <lists+linux-mips@lfdr.de>; Tue, 25 Feb 2025 04:47:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92B3C189D345
	for <lists+linux-mips@lfdr.de>; Tue, 25 Feb 2025 03:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10339192D86;
	Tue, 25 Feb 2025 03:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Cu/mdhem"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFF01A239E
	for <linux-mips@vger.kernel.org>; Tue, 25 Feb 2025 03:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740455221; cv=none; b=Myf5QXkEDyLvVdYB76RCUFvHxag5voIKdn4mra9JeietpeF8I25it/2oUDXCGLGLPpCV15PwczNb+LhNY70/rYzITYA9V5vbERhUfjjDs1W/a08BnH86SzUq7AGlXjAnludMpu80kpLVWv5yabQoZfiVUbscTPjDctW2s5gnnRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740455221; c=relaxed/simple;
	bh=9R+hVIAoZGq7muh+MjTEAY3Ux6O+nL5GCUlW0n8y7ig=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HaPxvF+PvDZ6tdabLzsieCJBHNotZdAPpNFiNBOV5k/0saNN9L2VxosiBr1BAX8t+/PCtgIdb12EEnyxDdyE382VvVCHssQNkrzLYpFIFD0pdiFu0yxHyBFinzN2Pg3e+BzFFA0Ns9gSlcj1lntq9aM6XAqd5O30u/djT9AY6UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Cu/mdhem; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22185cddbffso103440125ad.1
        for <linux-mips@vger.kernel.org>; Mon, 24 Feb 2025 19:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740455219; x=1741060019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zIKiL/cvy76O78IwclMxfA3FUb4EAj4nzgq2isZtk2Q=;
        b=Cu/mdhemmCbAerBZ9oVzh0Mkg7UNTtb83FVS7cRwQrf+fw+CvHENqBNF38tX4xjRr1
         qyOXtUaGbAguT8/p4zLRW5lb5ryKRykzW066IB+wizfDssHNXLF+6/FVn9oSPsk2nb8x
         caz1Vmj+BO37leflIM3ZEO8wwf1Kw0eVhFOUP3stmTY/cJxk8hKv83Ku+TI9bYouB+rL
         VwJ+O7Kd3FTGQLdYS0gBfsk41dNgkbKMy1sGBMk7C4lWRztP2Skl+Akczz36pcGBQzWM
         QSFTodUUx7q/qy9xxZviWTGHM0F71pcXDZnTWgWQe3lyLKLgbrG+Ga2+TQQh7/JNkIQU
         2E0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740455219; x=1741060019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zIKiL/cvy76O78IwclMxfA3FUb4EAj4nzgq2isZtk2Q=;
        b=EoVXEj80wO65gF7brwgOba+xxDSqI4X/T8gXrV3XCGwJQb0NfOykZur0ruWTXjvvZa
         UcMqlJK9wKgYLC9TapUmO4fKuOqz8LOLgZKGu7ttyh1fcb0mSkJDUH7nTD9kL91MAEjG
         dYqZh5+fiOtTHQzdM3azGz43RWtVRB1GZ8aqQuorZZ+UPRw8ljJfq/QBW8lg0TajYcaY
         jD/8Ch+0iYGd1SqLcyNrPVZPb5pLGdPOi0NJj6O7cmoHjtFhKsUKDRIibye7MGaBs4Qq
         Z/VJY8I+INU8pqR5o3HGkDgELoRzC5Q4iTrOyjJAVxcnNf1F9/AZMyy01a5ICZmugtpM
         CS0Q==
X-Forwarded-Encrypted: i=1; AJvYcCW/Ypqq/dd+ZL+i2AulPQuMF3sZzF9RKpSlQfeXUU0nPw5RmRZ+j75Ph8c478j0+Se3QvwwkhWNfrrY@vger.kernel.org
X-Gm-Message-State: AOJu0YzHOXcRL2gjdafET/qkgnhcCpeD/DGIKLmhfBuq9tuH3z7TCWuQ
	yMe3HXBNyh1YUoLDJqMY1oAQfWouGf6dpv5EjBCpRx7PG2flQJHpXdMFZznS8Vg=
X-Gm-Gg: ASbGncudfsL0t10nVZAjioGfG/C60MaKMMUM0TFs5WCcBIdhETslEBsVjL1uPUneAxr
	bKw4SLiBhUvloksPK3Z9e/5rm/ftWjn/KHOgd/D1jggdqX/6l15XvXaVAZwQS+g83P5EhkUNiWC
	LwfY5M3nDdG+xDftC98Vd39nu4L/jhgZO9DytQqi4tZ4E9TqnJD25THQeGxsew5UDdAeYiLZiSf
	fpWoAe7JzldDTl/8sONEDvCHJ65gAZ8UPsx168sxrbRsrlr0cepgB2i60PrX4jPzfGIlslFtEW5
	rXKy+dNEpygo3TUMGOyBYislFxfN/9YWHihcOuFU2mbUKzX4jGKD8xi5i8Ezq5glWw==
X-Google-Smtp-Source: AGHT+IGrbcobmtkudsLXXtQABX/QCxCZukDHXrGqT8EvNNCQnozfEzflYDWPRR+Q4O9sUaua1jgg6Q==
X-Received: by 2002:a05:6a00:3cd5:b0:725:41c4:dbc7 with SMTP id d2e1a72fcca58-73425b7fd45mr26417726b3a.4.1740455218800;
        Mon, 24 Feb 2025 19:46:58 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7347a81f014sm409429b3a.156.2025.02.24.19.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 19:46:58 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	kevin.brodsky@arm.com,
	riel@surriel.com,
	vishal.moola@gmail.com,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	willy@infradead.org,
	yuzhao@google.com,
	muchun.song@linux.dev,
	akpm@linux-foundation.org,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	arnd@arndb.de,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	alexghiti@rivosinc.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v2 4/6] riscv: pgtable: unconditionally use tlb_remove_ptdesc()
Date: Tue, 25 Feb 2025 11:45:54 +0800
Message-Id: <9025595e895515515c95e48db54b29afa489c41d.1740454179.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1740454179.git.zhengqi.arch@bytedance.com>
References: <cover.1740454179.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To support fast gup, the commit 69be3fb111e7 ("riscv: enable
MMU_GATHER_RCU_TABLE_FREE for SMP && MMU") did the following:

1) use tlb_remove_page_ptdesc() for those platforms which use IPI to
   perform TLB shootdown

2) use tlb_remove_ptdesc() for those platforms which use SBI to perform
   TLB shootdown

The tlb_remove_page_ptdesc() is the wrapper of the tlb_remove_page(). By
design, the tlb_remove_page() should be used to remove a normal page from
a page table entry, and should not be used for page table pages.

The tlb_remove_ptdesc() is the wrapper of the tlb_remove_table(), which is
designed specifically for freeing page table pages. If the
CONFIG_MMU_GATHER_TABLE_FREE is enabled, the tlb_remove_table() will use
semi RCU to free page table pages, that is:

 - batch table freeing: asynchronous free by RCU
 - single table freeing: IPI + synchronous free

If the CONFIG_MMU_GATHER_TABLE_FREE is disabled, the tlb_remove_table()
will fall back to pagetable_dtor() + tlb_remove_page().

For case 1), since we need to perform TLB shootdown before freeing the
page table page, the local_irq_save() in fast gup can block the freeing
and protect the fast gup page walker. Therefore we can ensure safety by
just using tlb_remove_page_ptdesc(). In addition, we can also the
tlb_remove_ptdesc()/tlb_remove_table() to achieve it, and it doesn't
matter whether CONFIG_MMU_GATHER_RCU_TABLE_FREE is selected. And in
theory, the performance of freeing pages asynchronously via RCU will not
be lower than synchronous free.

For case 2), since local_irq_save() only disable S-privilege IPI irq but
not M-privilege's, which is used by the SBI implementation to perform TLB
shootdown, so we must select CONFIG_MMU_GATHER_RCU_TABLE_FREE and use
tlb_remove_ptdesc() to ensure safety. The riscv selects this config for
SMP && MMU, the CONFIG_RISCV_SBI is dependent on MMU. Therefore, only the
UP system may have the situation where CONFIG_MMU_GATHER_RCU_TABLE_FREE is
disabled but CONFIG_RISCV_SBI is enabled. But there is no freeing vs fast
gup race in the UP system.

So, in summary, we can use tlb_remove_ptdesc() to support fast gup in all
cases, and this interface is specifically designed for page table pages.
So let's use it unconditionally.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/riscv/include/asm/pgalloc.h | 26 ++++----------------------
 1 file changed, 4 insertions(+), 22 deletions(-)

diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index 3e2aebea6312d..770ce18a7328b 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -15,24 +15,6 @@
 #define __HAVE_ARCH_PUD_FREE
 #include <asm-generic/pgalloc.h>
 
-/*
- * While riscv platforms with riscv_ipi_for_rfence as true require an IPI to
- * perform TLB shootdown, some platforms with riscv_ipi_for_rfence as false use
- * SBI to perform TLB shootdown. To keep software pagetable walkers safe in this
- * case we switch to RCU based table free (MMU_GATHER_RCU_TABLE_FREE). See the
- * comment below 'ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE' in include/asm-generic/tlb.h
- * for more details.
- */
-static inline void riscv_tlb_remove_ptdesc(struct mmu_gather *tlb, void *pt)
-{
-	if (riscv_use_sbi_for_rfence()) {
-		tlb_remove_ptdesc(tlb, pt);
-	} else {
-		pagetable_dtor(pt);
-		tlb_remove_page_ptdesc(tlb, pt);
-	}
-}
-
 static inline void pmd_populate_kernel(struct mm_struct *mm,
 	pmd_t *pmd, pte_t *pte)
 {
@@ -108,14 +90,14 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 				  unsigned long addr)
 {
 	if (pgtable_l4_enabled)
-		riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(pud));
+		tlb_remove_ptdesc(tlb, virt_to_ptdesc(pud));
 }
 
 static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
 				  unsigned long addr)
 {
 	if (pgtable_l5_enabled)
-		riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(p4d));
+		tlb_remove_ptdesc(tlb, virt_to_ptdesc(p4d));
 }
 #endif /* __PAGETABLE_PMD_FOLDED */
 
@@ -143,7 +125,7 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
 				  unsigned long addr)
 {
-	riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(pmd));
+	tlb_remove_ptdesc(tlb, virt_to_ptdesc(pmd));
 }
 
 #endif /* __PAGETABLE_PMD_FOLDED */
@@ -151,7 +133,7 @@ static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
 static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte,
 				  unsigned long addr)
 {
-	riscv_tlb_remove_ptdesc(tlb, page_ptdesc(pte));
+	tlb_remove_ptdesc(tlb, page_ptdesc(pte));
 }
 #endif /* CONFIG_MMU */
 
-- 
2.20.1


