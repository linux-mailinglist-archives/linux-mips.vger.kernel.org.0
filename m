Return-Path: <linux-mips+bounces-7197-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F45C9FE42D
	for <lists+linux-mips@lfdr.de>; Mon, 30 Dec 2024 10:09:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E65B3A1946
	for <lists+linux-mips@lfdr.de>; Mon, 30 Dec 2024 09:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3498C1A238C;
	Mon, 30 Dec 2024 09:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="UqK3sU+2"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640CD1A23AC
	for <linux-mips@vger.kernel.org>; Mon, 30 Dec 2024 09:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735549750; cv=none; b=trmeQcn7xKWRpITh0LIt0eikVCByCJZQDkP2N3e3kO1I3oBskXjNCQ4RtHSkQj6KcpsuesAMRnijEKZxqCW10EE2OWrxlDzwghY8BFvbsGShLwecCwHDn0SipTpGbFNNUZFKslowQoR2aosKTSYh5WwKAlZdluFrfbsTuGtAxQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735549750; c=relaxed/simple;
	bh=PKxGSwR+56aVOtqiYfVzo+PhXISkTKu7YVtS9mMtvvo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j/FDwmG8aoMLX/WWUJXY9uiy3HPaoK5gX2BxQ610gkeoLpopWvsgnmQVPdPi9k+oLgyk/R62A828k80C1EBmSfrfkgEjdfKPzjwwiOjiNJ+BsywKGO3BXrUA+1SnaZc6fd1gwxSccXVePlrfLIcnNoBxt/qhMu8ICIMDJy3hXLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=UqK3sU+2; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21683192bf9so116587775ad.3
        for <linux-mips@vger.kernel.org>; Mon, 30 Dec 2024 01:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735549745; x=1736154545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHzGZQny5JmimEm0kycepUlCOKttN6NXbKtm7VNKgbw=;
        b=UqK3sU+2wcAUPiAKKXdtQ0aEJDqkRo6Yya3Wbj9oIqILyZNKbqjce1teTm/9Pe/6TJ
         TT8TcgAmn7YerrmNKsaGqC/WVERQJSYXRT1OqR6pmXQ/mhI169SR8N03MZJaP4hc5/U7
         Y68xqwOFUJu5yye3K1J4GXggf6nRlCdi08h2F1f64ee3FILFskQeGXmz7dX8Kdt6LEXA
         DAFVaNIPS1JpGxoZ5OiMJSwjmI+OFqDDuwo8UB4xy1LXw3q0u1V1kadgXpWOzHB45i65
         ZYWnCzkSVkqGj0YzoFzawN2g9hKsI1PUKJX/uPdhmHDeFZ+JqSgtP3rgsKecpfYbHO3w
         anMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735549745; x=1736154545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mHzGZQny5JmimEm0kycepUlCOKttN6NXbKtm7VNKgbw=;
        b=V/71IZOzw1ZrlNNIVxKrQeg7I482Vf7coDyfH+28GSospHeaYjvvA3XCYJfhZBA47a
         jVd19dhqebOplONlSXtDqtb8BeIkKUCedotRayJGx9STe4gfr1YXasAchOxvXmikn0xg
         QDUecI9TpuSvL4VGynVG+6Ckyqmbg92JFUl6J3EAftYkMtVVzVrPGLX6SEWx8u/RQQWF
         D3SX0Mm8WHu3ULUrMxsd0pC9abZxHov0etK6rWRCDVicLYD2iK+pzVFvhgNoMkhBWKJH
         HWSps/Kz6AsVOCuLtvvg9WbC3bAUtAXutRxqIp8Q7H6RKKa3b3rEXeLZkCsEbekQ7eIA
         zHlw==
X-Forwarded-Encrypted: i=1; AJvYcCVSEmp305iejsUFKq28cBgrjUh/wgWpKWIFt4N6v07I2lKLMrHEinIBsYOFT3Y3AvJm1Oo34ensX6tN@vger.kernel.org
X-Gm-Message-State: AOJu0YwawrCus44EmNL8vf+DkvgEKPSnd6EMMQYpi6a3GPuRunYilYlf
	HI3ShGbM7esPQMjtRhu2TmqUrLt4BJ3mGJsGiwnI0c1S0nZPV9+O4KXdcJCLfNE=
X-Gm-Gg: ASbGncuF25LIzyj/qUs3Ee/S1RP3kz0nQW/unPFWda749UmdgWD0Tb5n7CPMBnAOugC
	F6SbAcL9go294cX/7nwsCLR41kYICrXD/wUMxhPEEP7afVOC25fwNdehi5onpX26+LB4pxy3YPf
	M6yUrIKVoOFN1VeiWueFdzXSTqsXhEku7Kzmz1zVZd4xfTTX6vq9bemRbMfHffVlvMRTh+DJ0h6
	fAI1QnJsT66511RG3h0reGwKKaUWW6r/Cip5imCsm1ydlz0wnI9EjBkf8XlEOF0CspTWUYB/Hti
	4mJIHMtTLw2UJnycTeiPbQ==
X-Google-Smtp-Source: AGHT+IEdmvGR6U/qwRYH5ruA02a+sFRctKWchidIfEBAoumo12DzBepIE5K3QuQVJJ60xG/AvigJ4Q==
X-Received: by 2002:a05:6a20:a127:b0:1db:ddba:8795 with SMTP id adf61e73a8af0-1e5e08028cfmr53967973637.36.1735549745320;
        Mon, 30 Dec 2024 01:09:05 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72f7csm17057841a12.4.2024.12.30.01.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 01:09:04 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
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
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v4 02/15] riscv: mm: Skip pgtable level check in {pud,p4d}_alloc_one
Date: Mon, 30 Dec 2024 17:07:37 +0800
Message-Id: <84ddf857508b98a195a790bc6ff6ab8849b44633.1735549103.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1735549103.git.zhengqi.arch@bytedance.com>
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kevin Brodsky <kevin.brodsky@arm.com>

{pmd,pud,p4d}_alloc_one() is never called if the corresponding page
table level is folded, as {pmd,pud,p4d}_alloc() already does the
required check. We can therefore remove the runtime page table level
checks in {pud,p4d}_alloc_one. The PUD helper becomes equivalent to
the generic version, so we remove it altogether.

This is consistent with the way arm64 and x86 handle this situation
(runtime check in p4d_free() only).

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/include/asm/pgalloc.h | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index f52264304f772..8ad0bbe838a24 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -12,7 +12,6 @@
 #include <asm/tlb.h>
 
 #ifdef CONFIG_MMU
-#define __HAVE_ARCH_PUD_ALLOC_ONE
 #define __HAVE_ARCH_PUD_FREE
 #include <asm-generic/pgalloc.h>
 
@@ -88,15 +87,6 @@ static inline void pgd_populate_safe(struct mm_struct *mm, pgd_t *pgd,
 	}
 }
 
-#define pud_alloc_one pud_alloc_one
-static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long addr)
-{
-	if (pgtable_l4_enabled)
-		return __pud_alloc_one(mm, addr);
-
-	return NULL;
-}
-
 #define pud_free pud_free
 static inline void pud_free(struct mm_struct *mm, pud_t *pud)
 {
@@ -118,15 +108,11 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 #define p4d_alloc_one p4d_alloc_one
 static inline p4d_t *p4d_alloc_one(struct mm_struct *mm, unsigned long addr)
 {
-	if (pgtable_l5_enabled) {
-		gfp_t gfp = GFP_PGTABLE_USER;
-
-		if (mm == &init_mm)
-			gfp = GFP_PGTABLE_KERNEL;
-		return (p4d_t *)get_zeroed_page(gfp);
-	}
+	gfp_t gfp = GFP_PGTABLE_USER;
 
-	return NULL;
+	if (mm == &init_mm)
+		gfp = GFP_PGTABLE_KERNEL;
+	return (p4d_t *)get_zeroed_page(gfp);
 }
 
 static inline void __p4d_free(struct mm_struct *mm, p4d_t *p4d)
-- 
2.20.1


