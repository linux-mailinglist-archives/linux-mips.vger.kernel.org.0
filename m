Return-Path: <linux-mips+bounces-7593-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6C4A1A503
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2025 14:29:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 391FA7A4BFB
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2025 13:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48C5320F99B;
	Thu, 23 Jan 2025 13:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Xj2x2CDo"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20066211276
	for <linux-mips@vger.kernel.org>; Thu, 23 Jan 2025 13:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737638941; cv=none; b=dFAZp2OVtiICOC3r39Do06yQ7VjsIhcP5E0P+4bkHeau1jXbtc5G5DScEhJGx7uFpX6UC1rph0r3O4AIxQpDbNLd0xQ65ChDbW6rKzt0vpCMMn+Us66W/9bis6uL+Vj28C3yYVm7b8P9DGXnB+k0FIC3Np16kfga6VBm5R+eixQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737638941; c=relaxed/simple;
	bh=XyLnW1p4MsGHgpzOh0HFNu0AzM3/S/jW+m0owjdfXKA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CxPpjbAFeqkahAAo0AUF1G5jk43XcVk7o527N9bhDpRsSpwal69u42HqC0xspwdaJBvVc770iXfQuqCl7qGpA9qh921gCVdoRJmcvALkrbIUuUnHJ+f+g2h5H+zSrX8B+r5L+c6/VK7ZUyT190S05Vk6nGRHZ6A9IKdEdZGI/SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Xj2x2CDo; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21619108a6bso14158415ad.3
        for <linux-mips@vger.kernel.org>; Thu, 23 Jan 2025 05:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1737638938; x=1738243738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bSVoet4BIZh93xV/DLydReH1JogDWuAFDaImcbetZJc=;
        b=Xj2x2CDobTidW+U9sDFs4+jCbSytQphy3KwBWYHsA1sy1iJEpmLxJod+gS0mFgaiWE
         OBa+1fslwiAcn8QpcGQhzMxNBe/UM6oEV3azi+PV7tk9f2B3ciTxa1kv8jms+AQIaE0B
         EOof801pLMKcki7SnpnsemYxyEYyHIHmO2ulb8fRjTpGrhrdCI46Ksq6knL2VrjTYF1m
         lThsS5Smcfs/nqiIzLrxHoR/79gNVNKK1L93NwFWzTk2eoT1Xs2cGS6U9dAxA+leYV9i
         PL4NHUXAlsMIHCgx9uxxss6Buv0Rdr+E6Vl2PVN7HByVUOW/9vVjHTYiU7RvMSo1yJYR
         OBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737638938; x=1738243738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bSVoet4BIZh93xV/DLydReH1JogDWuAFDaImcbetZJc=;
        b=qM1o80jpGUq6qZa5yxQUQiYCzedh3e8yW+D5rEh5jEqi6y8SHbX8KOgTHva0S6ON7o
         QHhaHmaAGWt8bSd7aljd26+N+PWTkJubNQS0i/BTqL8OmH5oe2DP26Lv/t08HwHZJRT7
         nFB/TXb4X5Sj/ejKAKarzIhIGhnxP/0KdKW4LRhLs5op0vvTCM5Dtu38yhGcCMTdBrmJ
         GPcQcxk4C99ccyjp2QYSIoTGTJxKiasoOAZs6sWweSbR1YsQFhEPvgYHTu8N5JgaDtxm
         OX2hbIuTdG/rOBXf40+IEvLgJN2R+iv9icz3LiIm0dei5J+rlUG68uLdXpdZEQYxi8+5
         Ie7A==
X-Forwarded-Encrypted: i=1; AJvYcCUdLMWkLUVVmKKfQUiLww2k3gdcwE8J/HMS8uSKuU5yaQdOl+KV6qEkS08sJ7uF9oRIjCmS1eC86o+I@vger.kernel.org
X-Gm-Message-State: AOJu0Yww9wY8xLNFyTnI6fOM4h6cXnwWoip3FjYmQqkcXzIoE1yJ1CIg
	6glR6rE4OAc+fxWeDQlb/9ysA74fCNVD037kvGoKSJNSoxy2Exd7RRRdmxAkA+U=
X-Gm-Gg: ASbGncslDYsdn8s8w1BwU94+7eiKfdtyaJrey/wBAXRurw1q17vPx59oWKKuOjrYNZp
	Qzt+0YjA676ObQdZ+DLtA/EXzKeyeYH2EJt+ALGbEJvbcBP5Dvok1WrYwIIFlw60LAFA6Ib9AwL
	uoXpO+Dc4atBlJANCITbXQA7z19EECvStb9aFehzr2g22uWdFJUyq19CMOAvadLBa/jtHWHqr7x
	mE2GwJEnsaCn8Uq/SG48vfQbOYVH9I4C83CuIgzEYaVWGNDVtH5agrr2xJ3pQvy8KbqlJ4UYmMK
	q5+o6Xyf4zWKDEfUsw1Z6hq8fAW67djUKNaiC4UKuDPe
X-Google-Smtp-Source: AGHT+IE9ITT+lxW4q5ku2WHS5AYNu8WFWCG+wILMASo2spfcLUt1T5YAi0clrsTLRCDPofgLk2+QPw==
X-Received: by 2002:a17:902:e5ce:b0:216:6590:d472 with SMTP id d9443c01a7336-21c3551ae48mr419794535ad.21.1737638938491;
        Thu, 23 Jan 2025 05:28:58 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3ac3e2sm111583655ad.139.2025.01.23.05.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 05:28:57 -0800 (PST)
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
Subject: [PATCH 4/5] x86: pgtable: unconditionally use tlb_remove_table()
Date: Thu, 23 Jan 2025 21:26:17 +0800
Message-Id: <00bf7935d65826eee547ac195d7854b1c946dbc5.1737637631.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1737637631.git.zhengqi.arch@bytedance.com>
References: <cover.1737637631.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the CONFIG_MMU_GATHER_TABLE_FREE is disabled, the tlb_remove_table()
will fall back to pagetable_dtor() + tlb_remove_page(). So let's use
tlb_remove_table() unconditionally to free page table pages.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/kernel/paravirt.c | 17 +----------------
 arch/x86/mm/pgtable.c      | 11 -----------
 2 files changed, 1 insertion(+), 27 deletions(-)

diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index 1ccaa3397a670..527f5605aa3e5 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -59,21 +59,6 @@ void __init native_pv_lock_init(void)
 		static_branch_enable(&virt_spin_lock_key);
 }
 
-#ifndef CONFIG_PT_RECLAIM
-static void native_tlb_remove_table(struct mmu_gather *tlb, void *table)
-{
-	struct ptdesc *ptdesc = (struct ptdesc *)table;
-
-	pagetable_dtor(ptdesc);
-	tlb_remove_page(tlb, ptdesc_page(ptdesc));
-}
-#else
-static void native_tlb_remove_table(struct mmu_gather *tlb, void *table)
-{
-	tlb_remove_table(tlb, table);
-}
-#endif
-
 struct static_key paravirt_steal_enabled;
 struct static_key paravirt_steal_rq_enabled;
 
@@ -195,7 +180,7 @@ struct paravirt_patch_template pv_ops = {
 	.mmu.flush_tlb_kernel	= native_flush_tlb_global,
 	.mmu.flush_tlb_one_user	= native_flush_tlb_one_user,
 	.mmu.flush_tlb_multi	= native_flush_tlb_multi,
-	.mmu.tlb_remove_table	= native_tlb_remove_table,
+	.mmu.tlb_remove_table	= tlb_remove_table,
 
 	.mmu.exit_mmap		= paravirt_nop,
 	.mmu.notify_page_enc_status_changed	= paravirt_nop,
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index 1fef5ad32d5a8..3bc8ad282b272 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -19,22 +19,11 @@ EXPORT_SYMBOL(physical_mask);
 #endif
 
 #ifndef CONFIG_PARAVIRT
-#ifndef CONFIG_PT_RECLAIM
-static inline
-void paravirt_tlb_remove_table(struct mmu_gather *tlb, void *table)
-{
-	struct ptdesc *ptdesc = (struct ptdesc *)table;
-
-	pagetable_dtor(ptdesc);
-	tlb_remove_page(tlb, ptdesc_page(ptdesc));
-}
-#else
 static inline
 void paravirt_tlb_remove_table(struct mmu_gather *tlb, void *table)
 {
 	tlb_remove_table(tlb, table);
 }
-#endif /* !CONFIG_PT_RECLAIM */
 #endif /* !CONFIG_PARAVIRT */
 
 gfp_t __userpte_alloc_gfp = GFP_PGTABLE_USER | PGTABLE_HIGHMEM;
-- 
2.20.1


