Return-Path: <linux-mips+bounces-580-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 040AB808B72
	for <lists+linux-mips@lfdr.de>; Thu,  7 Dec 2023 16:08:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B190A281CC2
	for <lists+linux-mips@lfdr.de>; Thu,  7 Dec 2023 15:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72BB844395;
	Thu,  7 Dec 2023 15:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="u8t5vxmE"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60A2B10D8
	for <linux-mips@vger.kernel.org>; Thu,  7 Dec 2023 07:07:57 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-50bfd8d5c77so971001e87.1
        for <linux-mips@vger.kernel.org>; Thu, 07 Dec 2023 07:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701961675; x=1702566475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Copp2ndGZ68t6KATBAuS2R34UMtC0q0chiu6mkWyRdw=;
        b=u8t5vxmEmHrKhlXGx9Y1N22VRqEFQuUadlfMtoo8YlaN1NJBs4b/TI9x6wdcbrDmBr
         6o+Dq6kP9F/uNNwM6YxO1CGcDP7qK32Qpk+G2r9A9sMO0JDQeB44UvlKaXvCUBc059bN
         NOiEocdglH4p1FidzTJeE+aIFXQpuZtYPGwQZxpELUowMXVbTv6b/9p7HFmo2YdouxH2
         zbjCTJqHU/b4WJQ0pCo6ldSOPSyPKWVu24Tt4RI+KjISKwg8ljY/WsOXs/mSCrik4XGo
         V78oY1Rt2tpGheqk4yjuj/sDv3vWdtCN9THm+uvqy1W6KJMfV+h4tBJayW3Yjn5vbXJM
         NjgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701961675; x=1702566475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Copp2ndGZ68t6KATBAuS2R34UMtC0q0chiu6mkWyRdw=;
        b=KuJkDBOXs6PCqN/jyljPHeHDtbheBSWiulGOlc1vHsWppIVEaLRvjkdZ/au27WoKr2
         LzdqTFfTBhuMMyiEnKAkspdRdjtBLJT2zWEDeDTuSLNFY3pOTODpudgqp1qyMdlCZxuP
         Iqm/XDNZ82i2KpIlgIGP6QI/1dpWUH+0DWc8oM6QvKGFAn/kkg7c0KbWrBRVAn2oMhj8
         29aZjQj9zfDZeb8YRcsc1JQjqHbgk4UEKZz0HsXvIAATo4Zr7duYogl9ZvucxZRaG6Lb
         ahq5HdXiRCLawiC8g+w4nph4kXlKd7WLMlhkGIaajmQTOQsfXlpYdjP63A7Iwi+uRt2m
         GD4w==
X-Gm-Message-State: AOJu0YxRP/scScDSQsm3lBkQGcpYa+cCtUht7w7AVGDJWFYw35Im6+EF
	0C7GSF3atFUCEAW/gsagYqIPFg==
X-Google-Smtp-Source: AGHT+IF3ts9ek/mYmRNdXx3GxmP46nrPUW7Zl/dOKYDi965OgtHxqAPAmVkPP3Q02kKv6wkmHjBDJg==
X-Received: by 2002:ac2:5147:0:b0:50b:debe:d35d with SMTP id q7-20020ac25147000000b0050bdebed35dmr702137lfd.133.1701961675502;
        Thu, 07 Dec 2023 07:07:55 -0800 (PST)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id i11-20020a5d438b000000b003332ef77db4sm1647628wrq.44.2023.12.07.07.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 07:07:55 -0800 (PST)
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
Subject: [PATCH RFC/RFT 4/4] TEMP: riscv: Add debugfs interface to retrieve #sfence.vma
Date: Thu,  7 Dec 2023 16:03:48 +0100
Message-Id: <20231207150348.82096-5-alexghiti@rivosinc.com>
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

This is useful for testing/benchmarking.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h  |  6 ++++--
 arch/riscv/include/asm/tlbflush.h |  4 ++++
 arch/riscv/kernel/sbi.c           | 12 ++++++++++++
 arch/riscv/mm/tlbflush.c          | 17 +++++++++++++++++
 4 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 89aa5650f104..b0855a620cfd 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -550,7 +550,7 @@ static inline int ptep_set_access_flags(struct vm_area_struct *vma,
 	return false;
 }
 
-extern u64 nr_sfence_vma_handle_exception;
+extern u64 nr_sfence_vma_spurious_read;
 extern bool tlb_caching_invalid_entries;
 
 #define flush_tlb_fix_spurious_read_fault flush_tlb_fix_spurious_read_fault
@@ -558,8 +558,10 @@ static inline void flush_tlb_fix_spurious_read_fault(struct vm_area_struct *vma,
 						     unsigned long address,
 						     pte_t *ptep)
 {
-	if (tlb_caching_invalid_entries)
+	if (tlb_caching_invalid_entries) {
+		__sync_fetch_and_add(&nr_sfence_vma_spurious_read, 1UL);
 		flush_tlb_page(vma, address);
+	}
 }
 
 #define __HAVE_ARCH_PTEP_GET_AND_CLEAR
diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index a09196f8de68..f419ec9d2207 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -14,14 +14,18 @@
 #ifdef CONFIG_MMU
 extern unsigned long asid_mask;
 
+extern u64 nr_sfence_vma, nr_sfence_vma_all, nr_sfence_vma_all_asid;
+
 static inline void local_flush_tlb_all(void)
 {
+	__sync_fetch_and_add(&nr_sfence_vma_all, 1UL);
 	__asm__ __volatile__ ("sfence.vma" : : : "memory");
 }
 
 /* Flush one page from local TLB */
 static inline void local_flush_tlb_page(unsigned long addr)
 {
+	__sync_fetch_and_add(&nr_sfence_vma, 1UL);
 	ALT_FLUSH_TLB_PAGE(__asm__ __volatile__ ("sfence.vma %0" : : "r" (addr) : "memory"));
 }
 #else /* CONFIG_MMU */
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index c672c8ba9a2a..ac1617759583 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -376,6 +376,8 @@ int sbi_remote_fence_i(const struct cpumask *cpu_mask)
 }
 EXPORT_SYMBOL(sbi_remote_fence_i);
 
+extern u64 nr_sfence_vma, nr_sfence_vma_all, nr_sfence_vma_all_asid;
+
 /**
  * sbi_remote_sfence_vma() - Execute SFENCE.VMA instructions on given remote
  *			     harts for the specified virtual address range.
@@ -389,6 +391,11 @@ int sbi_remote_sfence_vma(const struct cpumask *cpu_mask,
 			   unsigned long start,
 			   unsigned long size)
 {
+	if (size == (unsigned long)-1)
+		__sync_fetch_and_add(&nr_sfence_vma_all, 1UL);
+	else
+		__sync_fetch_and_add(&nr_sfence_vma, ALIGN(size, PAGE_SIZE) / PAGE_SIZE);
+
 	return __sbi_rfence(SBI_EXT_RFENCE_REMOTE_SFENCE_VMA,
 			    cpu_mask, start, size, 0, 0);
 }
@@ -410,6 +417,11 @@ int sbi_remote_sfence_vma_asid(const struct cpumask *cpu_mask,
 				unsigned long size,
 				unsigned long asid)
 {
+	if (size == (unsigned long)-1)
+		__sync_fetch_and_add(&nr_sfence_vma_all_asid, 1UL);
+	else
+		__sync_fetch_and_add(&nr_sfence_vma, ALIGN(size, PAGE_SIZE) / PAGE_SIZE);
+
 	return __sbi_rfence(SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID,
 			    cpu_mask, start, size, asid, 0);
 }
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 77be59aadc73..75a3e2dff16a 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -3,11 +3,16 @@
 #include <linux/mm.h>
 #include <linux/smp.h>
 #include <linux/sched.h>
+#include <linux/debugfs.h>
 #include <asm/sbi.h>
 #include <asm/mmu_context.h>
 
+u64 nr_sfence_vma, nr_sfence_vma_all, nr_sfence_vma_all_asid,
+	nr_sfence_vma_handle_exception, nr_sfence_vma_spurious_read;
+
 static inline void local_flush_tlb_all_asid(unsigned long asid)
 {
+	__sync_fetch_and_add(&nr_sfence_vma_all_asid, 1);
 	__asm__ __volatile__ ("sfence.vma x0, %0"
 			:
 			: "r" (asid)
@@ -17,6 +22,7 @@ static inline void local_flush_tlb_all_asid(unsigned long asid)
 static inline void local_flush_tlb_page_asid(unsigned long addr,
 		unsigned long asid)
 {
+	__sync_fetch_and_add(&nr_sfence_vma, 1);
 	__asm__ __volatile__ ("sfence.vma %0, %1"
 			:
 			: "r" (addr), "r" (asid)
@@ -149,3 +155,14 @@ void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
 	__flush_tlb_range(vma->vm_mm, start, end - start, PMD_SIZE);
 }
 #endif
+
+static int debugfs_nr_sfence_vma(void)
+{
+	debugfs_create_u64("nr_sfence_vma", 0444, NULL, &nr_sfence_vma);
+	debugfs_create_u64("nr_sfence_vma_all", 0444, NULL, &nr_sfence_vma_all);
+	debugfs_create_u64("nr_sfence_vma_all_asid", 0444, NULL, &nr_sfence_vma_all_asid);
+	debugfs_create_u64("nr_sfence_vma_handle_exception", 0444, NULL, &nr_sfence_vma_handle_exception);
+	debugfs_create_u64("nr_sfence_vma_spurious_read", 0444, NULL, &nr_sfence_vma_spurious_read);
+	return 0;
+}
+device_initcall(debugfs_nr_sfence_vma);
-- 
2.39.2


