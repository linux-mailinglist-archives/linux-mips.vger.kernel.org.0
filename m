Return-Path: <linux-mips+bounces-7163-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF649FAC38
	for <lists+linux-mips@lfdr.de>; Mon, 23 Dec 2024 10:44:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15E151885248
	for <lists+linux-mips@lfdr.de>; Mon, 23 Dec 2024 09:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7D31917F4;
	Mon, 23 Dec 2024 09:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ikFqkr6B"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815931946B9
	for <linux-mips@vger.kernel.org>; Mon, 23 Dec 2024 09:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734947011; cv=none; b=RibjBnjVH8H+KeRhq0lvVPnPi5x0e9/z5Ha7U+/wU6vSjko399bprsjjMP6EnOwuaj3w7T+civOMFEXtc0yNEDk43sB7PEM1HDdHzNV7bZCvTTrkUT855Au4v/NGcQd65M5hJgDE5Pg7irYlwLQu8XDha+pvWdjzSx9qBmnJCK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734947011; c=relaxed/simple;
	bh=ju5DuzkKGwFmMyIwrlT1Lgl5SSQbM6pKt1IYE0Qmp1M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HVsj82AGPKqy7CH+4m/uXs0zlMbylwMUD/q0ztIdRQH3psldfcnceg0Ykb0AgpFI+WvIQ6eQm3jqO2+a7DnOjrHhxKZbxhovtmLoDVXDz6GmQv6t42cw1uDbzwhwLru+dQOHBzja//o498xWGOleBZOV99+ycHmpAifxAN7J+S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ikFqkr6B; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-728f28744c5so3822103b3a.1
        for <linux-mips@vger.kernel.org>; Mon, 23 Dec 2024 01:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734947009; x=1735551809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/tJ15+vmer/NbqXoUznjybhQp/MgC6GOdT/GuQUXpM=;
        b=ikFqkr6B0/3PS1wO+3Ey7F7j57aIAc5gjLbqDwTohFJrbACx++AluUPiHxN9uHBSQC
         IVPuuF6KnKEYEiKr/yQHxcdloQB5DmS29AvyvLbqeNU3NHLyX3a9I+gZbR15sRRD11He
         3WwSXngasVjY/nlqAjPJjwQfmR0c2XGTXEKlcXALQ5kf8ED99PA2Ayoi/O3MhrlmfPNn
         3D8gWkdGG66Ol9dqQ0sbt4gH8vLMHxGLBKAh+ZQlp5ldZC91qPk058gI+7dKBfDn/WE0
         E73kQOlr4lyiks0g4/4kKzB3pYIYnBkZGpw6tt/3pr2uNYDQk51eeBQEn8dRlp1a5OqM
         YufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734947009; x=1735551809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/tJ15+vmer/NbqXoUznjybhQp/MgC6GOdT/GuQUXpM=;
        b=ChK+NLo10T5EBcYAByv286UAia/OUyydiunVYKlB9Akw70Ca6iJHOSvxTdmU/JA6L4
         ibFrQJ9Hh4znQ+sgW51LhQ1fux50SKAtYV26vc2sqElQQbyYiFph4TLTuiPkshV7Uqbq
         H54c0912H++gZnz7TFuHKKuiKV9Ylr0OC3etEaFgNMO7h0MKIz02/AALTtFW/DI2IwJX
         o8wm54wKJq8Pc41l+cD+CFhFJouATEhM6Svl0hQ37zi3MfmpqldblxaGTKfXi+zvjMet
         n9THXE96YobPrw3EtuCfzXfcSNKOD/SXEeYPgQs4wbfSu0rf/LeHVoexkRR3opYq6tok
         UQnw==
X-Forwarded-Encrypted: i=1; AJvYcCUN5Oj1x/jfUQLNlCrNwlowiKf9ybdE81wW36msvlBACQ0N1RU6dQzhxWpdM2XocJzkD9dSq7XfZifI@vger.kernel.org
X-Gm-Message-State: AOJu0YweJEM5prR4Pcv3hi6ljiMMTYkY7YkqYByW2EYwr6z4h3CliCE/
	AByJxhTnA6CRuT0ipgyPIpXpsQzD75T5nD1enZikabuZYMLq8wIdyAu6jJCYmkA=
X-Gm-Gg: ASbGnctzbfGANhVwn68Bgf0Mh5ZKBqeNiOzdWrBOImUWip+773FIT3aZ9o6FgfLRHQA
	NIiRjT7fJuJk8oKTmwIg1jqGmC0PQKRLAp2/bd/FDda0yAzRWX6lFvefrG83yaZ50Sz4CIT12Fp
	lkLpWqdC8uTcZM4XtAbil9S8zfFwBo+uLkGSVckoafFx1J3JjQgjV57Jbb2uwxEElL4ShUqiRKj
	8I20KWEoNCBTV5mYAgr56LwSzLq6ihHm1lJVHAmWZuQs+52Ecpy9syO2303tu5XbVmOmKvRjzW0
	gRxfcwBMn+m95Xz0k5CTOg==
X-Google-Smtp-Source: AGHT+IGn0WgNlH4n6jFU+xV15Lu8l6dnMV2FFWuW4zvXTMVJTCCaTT+ZxewqFKpQcJgKvmYU0RJrVw==
X-Received: by 2002:a05:6a00:35ca:b0:724:f86e:e3d9 with SMTP id d2e1a72fcca58-72abdecbdb4mr16058641b3a.14.1734947008718;
        Mon, 23 Dec 2024 01:43:28 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8486c6sm7468309b3a.85.2024.12.23.01.43.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:43:28 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
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
Subject: [PATCH v3 02/17] riscv: mm: Skip pgtable level check in {pud,p4d}_alloc_one
Date: Mon, 23 Dec 2024 17:40:48 +0800
Message-Id: <84ddf857508b98a195a790bc6ff6ab8849b44633.1734945104.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1734945104.git.zhengqi.arch@bytedance.com>
References: <cover.1734945104.git.zhengqi.arch@bytedance.com>
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


