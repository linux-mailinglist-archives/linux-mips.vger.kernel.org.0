Return-Path: <linux-mips+bounces-12245-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D83C9C5CD4F
	for <lists+linux-mips@lfdr.de>; Fri, 14 Nov 2025 12:23:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 76F9D4F591C
	for <lists+linux-mips@lfdr.de>; Fri, 14 Nov 2025 11:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C19B0315D41;
	Fri, 14 Nov 2025 11:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MJ9Mpinl"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96290315D2B
	for <linux-mips@vger.kernel.org>; Fri, 14 Nov 2025 11:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763118843; cv=none; b=WeCUuFimM6EBdrrUKdZmpmLVzsP6gpQG0HvtRW02PGZ9Jql7rKoZXQU9q3RPHNpToY7+Cv7tW1KI3c7cbCcVACEu3ZvYDC8wClVtM8SONnDe/KnWY1VLv0Cc2ZJ0gbhytIqgkevOvB/mCtmM7Nlv51CPMV+7DK66gN+B9WjA9xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763118843; c=relaxed/simple;
	bh=y3+cAqzSkPk1tWuUrHkYALa2DGC3gvmhFzF8IzkFgAo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=in0AZBxLZja0gwQhXi5qLmqHhUnIQRMGtZIvJ36N0uheiNyJ/xQjnK2JW49HllDHVxnaPwThCYyoYv82XEI2LGoGXV9JRtY05nJrbp3luHlvTTA/K0TXytqPospsuA+r6WiIpFRsRCigPbPLZITG8fT9ihsAjqE4ap6wUinww5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MJ9Mpinl; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763118839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sax8A8PA6ZHc/cVS+xTeKKlG8M0r3mfGW440vNjJZdg=;
	b=MJ9MpinllxQ4TveK74NmYHIrtnuWysqMuo3kH1WtaJPOEfUFraWTOjeuO+qSEwJDbXunL4
	KzCwC7WMF3bErXcULhl6Hmst/RWmFUWC5WUQqMmKuZtOwbb3VyxdEl/g2hEf0Oms7Jx9kQ
	EAMJFMUorbF1pVdhYWTD7Kr5yAkEd64=
From: Qi Zheng <qi.zheng@linux.dev>
To: will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	peterz@infradead.org,
	dev.jain@arm.com,
	akpm@linux-foundation.org,
	david@redhat.com,
	ioworker0@gmail.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>
Subject: [PATCH 5/7] parisc: mm: enable MMU_GATHER_RCU_TABLE_FREE
Date: Fri, 14 Nov 2025 19:11:19 +0800
Message-ID: <3a88790a662c2b84066c77772d20bd1f5f687f8b.1763117269.git.zhengqi.arch@bytedance.com>
In-Reply-To: <cover.1763117269.git.zhengqi.arch@bytedance.com>
References: <cover.1763117269.git.zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Qi Zheng <zhengqi.arch@bytedance.com>

On a 64-bit system, madvise(MADV_DONTNEED) may cause a large number of
empty PTE page table pages (such as 100GB+). To resolve this problem,
first enable MMU_GATHER_RCU_TABLE_FREE to prepare for enabling the
PT_RECLAIM feature, which resolves this problem.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
---
 arch/parisc/Kconfig           | 1 +
 arch/parisc/include/asm/tlb.h | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index 47fd9662d8005..946cbe21a4118 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -92,6 +92,7 @@ config PARISC
 	select TRACE_IRQFLAGS_SUPPORT
 	select HAVE_FUNCTION_DESCRIPTORS if 64BIT
 	select PCI_MSI_ARCH_FALLBACKS if PCI_MSI
+	select MMU_GATHER_RCU_TABLE_FREE
 
 	help
 	  The PA-RISC microprocessor is designed by Hewlett-Packard and used
diff --git a/arch/parisc/include/asm/tlb.h b/arch/parisc/include/asm/tlb.h
index 44235f367674d..ab7d4113df61a 100644
--- a/arch/parisc/include/asm/tlb.h
+++ b/arch/parisc/include/asm/tlb.h
@@ -5,8 +5,10 @@
 #include <asm-generic/tlb.h>
 
 #if CONFIG_PGTABLE_LEVELS == 3
-#define __pmd_free_tlb(tlb, pmd, addr)	pmd_free((tlb)->mm, pmd)
+#define __pmd_free_tlb(tlb, pmd, addr)	\
+	tlb_remove_ptdesc((tlb), virt_to_ptdesc(pmd))
 #endif
-#define __pte_free_tlb(tlb, pte, addr)	pte_free((tlb)->mm, pte)
+#define __pte_free_tlb(tlb, pte, addr)	\
+	tlb_remove_ptdesc((tlb), page_ptdesc(pte))
 
 #endif
-- 
2.20.1


