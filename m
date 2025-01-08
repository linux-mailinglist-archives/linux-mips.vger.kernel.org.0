Return-Path: <linux-mips+bounces-7299-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E86F8A053E1
	for <lists+linux-mips@lfdr.de>; Wed,  8 Jan 2025 08:02:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C90F3A5BCE
	for <lists+linux-mips@lfdr.de>; Wed,  8 Jan 2025 07:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 431FF1AA1E6;
	Wed,  8 Jan 2025 07:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="jzhuXRQy"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D27B1DFE0A
	for <linux-mips@vger.kernel.org>; Wed,  8 Jan 2025 07:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736319682; cv=none; b=dZePasTCInjA2++/3TynurABVAtL/ibmzD5TFntnjhURrlEyYv3JrtPmKuNqysRewd9wRjKQsIKc+mojz1dUixz3usS6Q0doWT6ErusExRtycp/Td2vd2dqdgiTsnrdFgUP0C1nTp9k3vKjEAbr/FPM0OMDcarDwcNhDVG+k8Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736319682; c=relaxed/simple;
	bh=wfTgGSVhXTkiP60cV7XgYAcbBAoscYS/kqOY2RPeVxA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JUF6ENS0LTAB74MAi9Y43fdyDr5fA57Qls56HTGn5yY8aduN8QOO2FgicZGUwoqRKtApYrxn5AHvW3qwc2MePb9ZrnX7rRqx7o2bdgzXX7px+R1AKBrxWiQWgYoISqJPosSQaqb/AFmwkB3gpA9wqfyDp6vvEE2PRASV3AemvVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=jzhuXRQy; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2161eb94cceso171118685ad.2
        for <linux-mips@vger.kernel.org>; Tue, 07 Jan 2025 23:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736319680; x=1736924480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRYydr57EpvJJkVepk/VS3bq1fMuYMijkZdKL5zejaA=;
        b=jzhuXRQygiP56bBOGwYPpbPtA5GEJz1GaN11tiBhJYnUV114ySJcMCAR4Vl+T6q7iB
         iO9qveGtmAH/WLYpOnkh6/dQ4fWRdvMBfQkgqPlto4qRGfb24KnxiIpSTcAjkUG5xJsW
         6vcIMFe9+GK1j0KNvpwYHFkFKfOIdYXc7cJOcNkjfpRMruUxLep7SGgaYlmoaWVVHOLz
         pL7s9qE7xJ9WxO4pGKdd71605tq/4DHIUMhLXggZULfR7eGOU/yxQ09VIcxeQyYh3b10
         KrZxsMr40DPAULhPtjk37jYc3p6WqftsSh5wCMycWAPG2NO7InOzihDWbXycUDdm0j4K
         TlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319680; x=1736924480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRYydr57EpvJJkVepk/VS3bq1fMuYMijkZdKL5zejaA=;
        b=jf7+vnC/FLVtT66dKbfO6+su7t53tLmaMFd0oG4oEr5C5fKZFc1Y0UJdPgcuCku41s
         g6kD+6pNrfWbo13m09xur7DvsdGV9r0YDzRHOR955tiMBZsFVR1Oc8xIK9JfvACHJSbd
         V3lMfiFSAlHH7MwK6hPFYSOObXVUqC8ByNlFKgR1FhLiad7OBMlPmwz0fNcdNMWZlUPd
         eyYS4v7dLIMP+2pQa17RVNhwHeZ4ImGD41XONDOiDYhFcVaz/6qXaDPhMsMO37wUqzY+
         YYDS0yZv822BYCrc2jfn8UOMlN9na9H31Q8SRK66p623tE1AlWD68ypo0BY+awYOR2G2
         t/lw==
X-Forwarded-Encrypted: i=1; AJvYcCUbAEV5KtE2ZBHjq6pYjk8qyHoS3MEWIrC4KDV/Ik65DQk4I6cXQ9AG4SVUhwutmSZzta6kOlaFLu3U@vger.kernel.org
X-Gm-Message-State: AOJu0YyGTP87HTuFCYeHbXZutA3T6Fy0Iv+TT7fbuy/JKGPLVGfW1/Ym
	xe5E6XYdy7NvTDV70RJSw+NoJ0FNiL14ODrz2WphgDhfWi7KDYgiFLuGlA+SgoE=
X-Gm-Gg: ASbGncsJG0gE2apDhwtvNg0T14dk1ye+vjlMHDzszXZw3hZ8quNpQQwRXkapmEMpAZO
	qjpqvqYNUTQPNfU5UcIuvTICD2Gl1u1xbPLW7r885SMjiv76fNPc2P6d7CdTeH9kt8UOYkgcYal
	tZuU61pLwMO5xWLO3Shao7+8aFbdxqeSAzoInBgPZ/btzGsl0eaD1VFyluYaIXWaAyud0l44gC1
	kMJ+u+TCfbHDXRNiM13ucbC3eMLP/yk9pfKz5pM8DEj2+yp+eHYxFTifqJhEV1Obkmt3j5cDrMm
	K78p/ncckwifYcSX2cZfPr5/v9I=
X-Google-Smtp-Source: AGHT+IGA+MEO+KKVHOehVcxKdAaP4kVFc+4x/MGW5FidU7ZYZhG+ejtfRbHdQiRj7WdzfqmV0LUjgQ==
X-Received: by 2002:a17:902:d352:b0:215:8847:435c with SMTP id d9443c01a7336-21a83f4b133mr25527805ad.12.1736319679689;
        Tue, 07 Jan 2025 23:01:19 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca023a3sm320067275ad.250.2025.01.07.23.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 23:01:19 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	alex@ghiti.fr,
	andreas@gaisler.com,
	palmer@dabbelt.com,
	tglx@linutronix.de,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	yuzhao@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	rientjes@google.com,
	vishal.moola@gmail.com,
	arnd@arndb.de,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v5 08/17] arm: pgtable: move pagetable_dtor() to __tlb_remove_table()
Date: Wed,  8 Jan 2025 14:57:24 +0800
Message-Id: <327b4b8990729edd4ce97d9d5acbdaff2d9fa1d1.1736317725.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1736317725.git.zhengqi.arch@bytedance.com>
References: <cover.1736317725.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move pagetable_dtor() to __tlb_remove_table(), so that ptlock and page
table pages can be freed together (regardless of whether RCU is used).
This prevents the use-after-free problem where the ptlock is freed
immediately but the page table pages is freed later via RCU.

Page tables shouldn't have swap cache, so use pagetable_free() instead of
free_page_and_swap_cache() to free page table pages.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm/include/asm/tlb.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
index ef79bf1e8563f..59854c6b97bc5 100644
--- a/arch/arm/include/asm/tlb.h
+++ b/arch/arm/include/asm/tlb.h
@@ -26,12 +26,14 @@
 
 #else /* !CONFIG_MMU */
 
-#include <linux/swap.h>
 #include <asm/tlbflush.h>
 
 static inline void __tlb_remove_table(void *_table)
 {
-	free_page_and_swap_cache((struct page *)_table);
+	struct ptdesc *ptdesc = (struct ptdesc *)_table;
+
+	pagetable_dtor(ptdesc);
+	pagetable_free(ptdesc);
 }
 
 #include <asm-generic/tlb.h>
@@ -41,7 +43,9 @@ __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte, unsigned long addr)
 {
 	struct ptdesc *ptdesc = page_ptdesc(pte);
 
+#ifndef CONFIG_MMU_GATHER_TABLE_FREE
 	pagetable_dtor(ptdesc);
+#endif
 
 #ifndef CONFIG_ARM_LPAE
 	/*
@@ -61,7 +65,6 @@ __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp, unsigned long addr)
 #ifdef CONFIG_ARM_LPAE
 	struct ptdesc *ptdesc = virt_to_ptdesc(pmdp);
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 #endif
 }
-- 
2.20.1


