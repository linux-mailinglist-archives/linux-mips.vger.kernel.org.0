Return-Path: <linux-mips+bounces-579-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C29808B6D
	for <lists+linux-mips@lfdr.de>; Thu,  7 Dec 2023 16:07:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 075D6281C64
	for <lists+linux-mips@lfdr.de>; Thu,  7 Dec 2023 15:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08AC244391;
	Thu,  7 Dec 2023 15:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="YWVt+2yO"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AD78D54
	for <linux-mips@vger.kernel.org>; Thu,  7 Dec 2023 07:06:56 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40c0a0d068bso10888115e9.3
        for <linux-mips@vger.kernel.org>; Thu, 07 Dec 2023 07:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701961614; x=1702566414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWcoco88tut+CY63Y/9PXHuBFD03h05uf7rbyZFiPT4=;
        b=YWVt+2yOSzLKdBA6mFxuQnKPoBnm59Qrl4iFRlKaQjOfKdrnHVoPUl/taei2v0CntL
         T/WWc3PIORGPZHXfTfgGEm/D9uV/LUaZmT2dEytAZEgjPof3K5/pQzZV4WERP8LBV4on
         Z5cAgODFO65IvGVUDbdOyEDpSsZOBHfkNcZOOWL3liAD81quM2qrtulYeA4JqbnDwRyE
         YEJmhMHNNcr6B2EOo/MCkBJ6rB43y7WR5L1lCIZOoUg4gr71KD2qW5tuA6ooLrOYykF8
         pVVAxjhkJ7c1QV2OZG9NUNeOEqUEZRRqKazaseNHrFunCBZBSAlMQM+lyfesSjy9HSyV
         Pdyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701961614; x=1702566414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EWcoco88tut+CY63Y/9PXHuBFD03h05uf7rbyZFiPT4=;
        b=GDGztaTyepxiDrGm5lmAylURP6tAneifGWdaykJEGiTuF4Ct9HhIRi7a0hvA/ZsJGF
         esRbVIKPtPZa7tX8+a4wBCh+t65R3W3uFfSccNgL0OoM+Kigx8Hfv9W15bw1mZp/0u9Z
         TUjYw4qX8PolSCNaF//CKQFz1qynzRabFf3sl68dcuVHsgdLwGsIZiwxZFEmKUZ/3EzE
         7tpAgqO+1pzUuiBEFTZhMDkyV3NxTVxTWVE9Z1a4koKxRpHQgwViAkPNFt9nhQFjY99T
         G8qxRGOHAt6fGiPlvqA7FQ4fyfklBko1fnfFho3Rmfmo5IYFGnxbduauTGz3sTSC2kyA
         wXBQ==
X-Gm-Message-State: AOJu0Yy0A1/8SolSUt+5PFwEyPlXnBFh1yjYl6GIq18TuHLyeQUqDA27
	qiWxnvtE4mFOIweJ0uk29VWdkg==
X-Google-Smtp-Source: AGHT+IHTy8+IvueJsQn+KurIJffNNmKiqFVQtVzbm19iX0i45eZHV4tLMcBmveaKizCMPPNo4tYVVQ==
X-Received: by 2002:a5d:67c5:0:b0:333:3867:c5aa with SMTP id n5-20020a5d67c5000000b003333867c5aamr1932506wrw.20.1701961614467;
        Thu, 07 Dec 2023 07:06:54 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id a8-20020adffb88000000b003335e67e574sm1649359wrr.78.2023.12.07.07.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 07:06:54 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ved Shanbhogue <ved@rivosinc.com>,
	Matt Evans <mev@rivosinc.com>,
	Dylan Jhong <dylan@andestech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH RFC/RFT 3/4] riscv: Stop emitting preventive sfence.vma for new userspace mappings
Date: Thu,  7 Dec 2023 16:03:47 +0100
Message-Id: <20231207150348.82096-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207150348.82096-1-alexghiti@rivosinc.com>
References: <20231207150348.82096-1-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The preventive sfence.vma were emitted because new mappings must be made
visible to the page table walker, either the uarch caches invalid
entries or not.

Actually, there is no need to preventively sfence.vma on new mappings for
userspace, this should be handled only in the page fault path.

This allows to drastically reduce the number of sfence.vma emitted:

* Ubuntu boot to login:
Before: ~630k sfence.vma
After:  ~200k sfence.vma

* ltp - mmapstress01
Before: ~45k
After:  ~6.3k

* lmbench - lat_pagefault
Before: ~665k
After:   832 (!)

* lmbench - lat_mmap
Before: ~546k
After:   718 (!)

The only issue with the removal of sfence.vma in update_mmu_cache() is
that on uarchs that cache invalid entries, those won't be invalidated
until the process takes a fault: so that's an additional fault in those
cases.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/arm64/include/asm/pgtable.h              |  2 +-
 arch/mips/include/asm/pgtable.h               |  6 +--
 arch/powerpc/include/asm/book3s/64/tlbflush.h |  8 ++--
 arch/riscv/include/asm/pgtable.h              | 43 +++++++++++--------
 include/linux/pgtable.h                       |  8 +++-
 mm/memory.c                                   | 12 +++++-
 6 files changed, 48 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 7f7d9b1df4e5..728f25f529a5 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -57,7 +57,7 @@ static inline bool arch_thp_swp_supported(void)
  * fault on one CPU which has been handled concurrently by another CPU
  * does not need to perform additional invalidation.
  */
-#define flush_tlb_fix_spurious_fault(vma, address, ptep) do { } while (0)
+#define flush_tlb_fix_spurious_write_fault(vma, address, ptep) do { } while (0)
 
 /*
  * ZERO_PAGE is a global shared page that is always zero: used
diff --git a/arch/mips/include/asm/pgtable.h b/arch/mips/include/asm/pgtable.h
index 430b208c0130..84439fe6ed29 100644
--- a/arch/mips/include/asm/pgtable.h
+++ b/arch/mips/include/asm/pgtable.h
@@ -478,9 +478,9 @@ static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
 	return __pgprot(prot);
 }
 
-static inline void flush_tlb_fix_spurious_fault(struct vm_area_struct *vma,
-						unsigned long address,
-						pte_t *ptep)
+static inline void flush_tlb_fix_spurious_write_fault(struct vm_area_struct *vma,
+						      unsigned long address,
+						      pte_t *ptep)
 {
 }
 
diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerpc/include/asm/book3s/64/tlbflush.h
index 1950c1b825b4..7166d56f90db 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
@@ -128,10 +128,10 @@ static inline void flush_tlb_page(struct vm_area_struct *vma,
 #define flush_tlb_page(vma, addr)	local_flush_tlb_page(vma, addr)
 #endif /* CONFIG_SMP */
 
-#define flush_tlb_fix_spurious_fault flush_tlb_fix_spurious_fault
-static inline void flush_tlb_fix_spurious_fault(struct vm_area_struct *vma,
-						unsigned long address,
-						pte_t *ptep)
+#define flush_tlb_fix_spurious_write_fault flush_tlb_fix_spurious_write_fault
+static inline void flush_tlb_fix_spurious_write_fault(struct vm_area_struct *vma,
+						      unsigned long address,
+						      pte_t *ptep)
 {
 	/*
 	 * Book3S 64 does not require spurious fault flushes because the PTE
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index b2ba3f79cfe9..89aa5650f104 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -472,28 +472,20 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 		struct vm_area_struct *vma, unsigned long address,
 		pte_t *ptep, unsigned int nr)
 {
-	/*
-	 * The kernel assumes that TLBs don't cache invalid entries, but
-	 * in RISC-V, SFENCE.VMA specifies an ordering constraint, not a
-	 * cache flush; it is necessary even after writing invalid entries.
-	 * Relying on flush_tlb_fix_spurious_fault would suffice, but
-	 * the extra traps reduce performance.  So, eagerly SFENCE.VMA.
-	 */
-	while (nr--)
-		local_flush_tlb_page(address + nr * PAGE_SIZE);
 }
 #define update_mmu_cache(vma, addr, ptep) \
 	update_mmu_cache_range(NULL, vma, addr, ptep, 1)
 
 #define __HAVE_ARCH_UPDATE_MMU_TLB
-#define update_mmu_tlb update_mmu_cache
+static inline void update_mmu_tlb(struct vm_area_struct *vma,
+				  unsigned long address, pte_t *ptep)
+{
+	flush_tlb_range(vma, address, address + PAGE_SIZE);
+}
 
 static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
 		unsigned long address, pmd_t *pmdp)
 {
-	pte_t *ptep = (pte_t *)pmdp;
-
-	update_mmu_cache(vma, address, ptep);
 }
 
 #define __HAVE_ARCH_PTE_SAME
@@ -548,13 +540,26 @@ static inline int ptep_set_access_flags(struct vm_area_struct *vma,
 					unsigned long address, pte_t *ptep,
 					pte_t entry, int dirty)
 {
-	if (!pte_same(*ptep, entry))
+	if (!pte_same(*ptep, entry)) {
 		__set_pte_at(ptep, entry);
-	/*
-	 * update_mmu_cache will unconditionally execute, handling both
-	 * the case that the PTE changed and the spurious fault case.
-	 */
-	return true;
+		/* Here only not svadu is impacted */
+		flush_tlb_page(vma, address);
+		return true;
+	}
+
+	return false;
+}
+
+extern u64 nr_sfence_vma_handle_exception;
+extern bool tlb_caching_invalid_entries;
+
+#define flush_tlb_fix_spurious_read_fault flush_tlb_fix_spurious_read_fault
+static inline void flush_tlb_fix_spurious_read_fault(struct vm_area_struct *vma,
+						     unsigned long address,
+						     pte_t *ptep)
+{
+	if (tlb_caching_invalid_entries)
+		flush_tlb_page(vma, address);
 }
 
 #define __HAVE_ARCH_PTEP_GET_AND_CLEAR
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index af7639c3b0a3..7abaf42ef612 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -931,8 +931,12 @@ static inline void arch_swap_restore(swp_entry_t entry, struct folio *folio)
 # define pte_accessible(mm, pte)	((void)(pte), 1)
 #endif
 
-#ifndef flush_tlb_fix_spurious_fault
-#define flush_tlb_fix_spurious_fault(vma, address, ptep) flush_tlb_page(vma, address)
+#ifndef flush_tlb_fix_spurious_write_fault
+#define flush_tlb_fix_spurious_write_fault(vma, address, ptep) flush_tlb_page(vma, address)
+#endif
+
+#ifndef flush_tlb_fix_spurious_read_fault
+#define flush_tlb_fix_spurious_read_fault(vma, address, ptep)
 #endif
 
 /*
diff --git a/mm/memory.c b/mm/memory.c
index 517221f01303..5cb0ccf0c03f 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5014,8 +5014,16 @@ static vm_fault_t handle_pte_fault(struct vm_fault *vmf)
 		 * with threads.
 		 */
 		if (vmf->flags & FAULT_FLAG_WRITE)
-			flush_tlb_fix_spurious_fault(vmf->vma, vmf->address,
-						     vmf->pte);
+			flush_tlb_fix_spurious_write_fault(vmf->vma, vmf->address,
+							   vmf->pte);
+		else
+			/*
+			 * With the pte_same(ptep_get(vmf->pte), entry) check
+			 * that calls update_mmu_tlb() above, multiple threads
+			 * faulting at the same time won't get there.
+			 */
+			flush_tlb_fix_spurious_read_fault(vmf->vma, vmf->address,
+							  vmf->pte);
 	}
 unlock:
 	pte_unmap_unlock(vmf->pte, vmf->ptl);
-- 
2.39.2


