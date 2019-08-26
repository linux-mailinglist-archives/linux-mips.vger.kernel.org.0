Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 567809D075
	for <lists+linux-mips@lfdr.de>; Mon, 26 Aug 2019 15:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732012AbfHZN0V (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 26 Aug 2019 09:26:21 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:35198 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727462AbfHZN0U (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 26 Aug 2019 09:26:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=93/+ko3Du/V64K+y2AaxEF8szX3mmmGeAKtqr4Af7n4=; b=R1nk6Id6AuYtIvOixwysSYYVYv
        g2Rrk60htrPfir2WYJFC1xWJ8kvN38zfbjvdWoIopyGaW3UyghRTi9EzVNPxrrCcy9GA3tIBG+QZD
        0LNXUW6ojAEyTjbjVMr8BZcA2B8JG5WQsnUj0aEs/JL+VhIVmNbzGGU9xmxcz9MeXUCwF8HgUlHQS
        /+kqiBoR3I5ZG5XWusc9Bif/aS/mr7RnkiLP4wgBf5QX4eVSdpSpT2XyN1bW6rfat3lV/v8NwZCLn
        /KwkHL8QEbZEZBSnQ+Xe7iFshVP4DbSHe+hl1c9r5Iy0JC2SaFZCr9Njcu2gJMAyeQW8RqbtXjSq7
        qMRTVd6w==;
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i2F0a-0007wK-Gk; Mon, 26 Aug 2019 13:26:09 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     iommu@lists.linux-foundation.org
Cc:     Guan Xuetao <gxt@pku.edu.cn>, Shawn Anastasio <shawn@anastas.io>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] dma-mapping: make dma_atomic_pool_init self-contained
Date:   Mon, 26 Aug 2019 15:25:51 +0200
Message-Id: <20190826132553.4116-5-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190826132553.4116-1-hch@lst.de>
References: <20190826132553.4116-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The memory allocated for the atomic pool needs to have the same
mapping attributes that we use for remapping, so use
pgprot_dmacoherent instead of open coding it.  Also deduct a
suitable zone to allocate the memory from based on the presence
of the DMA zones.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arc/mm/dma.c           |  6 ------
 arch/arm64/mm/dma-mapping.c |  6 ------
 arch/csky/mm/dma-mapping.c  |  6 ------
 arch/nds32/kernel/dma.c     |  6 ------
 include/linux/dma-mapping.h |  1 -
 kernel/dma/remap.c          | 17 ++++++++++++++---
 6 files changed, 14 insertions(+), 28 deletions(-)

diff --git a/arch/arc/mm/dma.c b/arch/arc/mm/dma.c
index 62c210e7ee4c..ff4a5752f8cc 100644
--- a/arch/arc/mm/dma.c
+++ b/arch/arc/mm/dma.c
@@ -104,9 +104,3 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 	dev_info(dev, "use %sncoherent DMA ops\n",
 		 dev->dma_coherent ? "" : "non");
 }
-
-static int __init atomic_pool_init(void)
-{
-	return dma_atomic_pool_init(GFP_KERNEL, pgprot_noncached(PAGE_KERNEL));
-}
-postcore_initcall(atomic_pool_init);
diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
index 676efcda51e6..a1d05f669f67 100644
--- a/arch/arm64/mm/dma-mapping.c
+++ b/arch/arm64/mm/dma-mapping.c
@@ -28,12 +28,6 @@ void arch_dma_prep_coherent(struct page *page, size_t size)
 	__dma_flush_area(page_address(page), size);
 }
 
-static int __init arm64_dma_init(void)
-{
-	return dma_atomic_pool_init(GFP_DMA32, __pgprot(PROT_NORMAL_NC));
-}
-arch_initcall(arm64_dma_init);
-
 #ifdef CONFIG_IOMMU_DMA
 void arch_teardown_dma_ops(struct device *dev)
 {
diff --git a/arch/csky/mm/dma-mapping.c b/arch/csky/mm/dma-mapping.c
index 80783bb71c5c..602a60d47a94 100644
--- a/arch/csky/mm/dma-mapping.c
+++ b/arch/csky/mm/dma-mapping.c
@@ -14,12 +14,6 @@
 #include <linux/version.h>
 #include <asm/cache.h>
 
-static int __init atomic_pool_init(void)
-{
-	return dma_atomic_pool_init(GFP_KERNEL, pgprot_noncached(PAGE_KERNEL));
-}
-postcore_initcall(atomic_pool_init);
-
 void arch_dma_prep_coherent(struct page *page, size_t size)
 {
 	if (PageHighMem(page)) {
diff --git a/arch/nds32/kernel/dma.c b/arch/nds32/kernel/dma.c
index 490e3720d694..4206d4b6c8ce 100644
--- a/arch/nds32/kernel/dma.c
+++ b/arch/nds32/kernel/dma.c
@@ -80,9 +80,3 @@ void arch_dma_prep_coherent(struct page *page, size_t size)
 {
 	cache_op(page_to_phys(page), size, cpu_dma_wbinval_range);
 }
-
-static int __init atomic_pool_init(void)
-{
-	return dma_atomic_pool_init(GFP_KERNEL, pgprot_noncached(PAGE_KERNEL));
-}
-postcore_initcall(atomic_pool_init);
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index f7d1eea32c78..48ebe8295987 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -624,7 +624,6 @@ void *dma_common_pages_remap(struct page **pages, size_t size,
 			const void *caller);
 void dma_common_free_remap(void *cpu_addr, size_t size, unsigned long vm_flags);
 
-int __init dma_atomic_pool_init(gfp_t gfp, pgprot_t prot);
 bool dma_in_atomic_pool(void *start, size_t size);
 void *dma_alloc_from_pool(size_t size, struct page **ret_page, gfp_t flags);
 bool dma_free_from_pool(void *start, size_t size);
diff --git a/kernel/dma/remap.c b/kernel/dma/remap.c
index ffe78f0b2fe4..838123f79639 100644
--- a/kernel/dma/remap.c
+++ b/kernel/dma/remap.c
@@ -105,7 +105,16 @@ static int __init early_coherent_pool(char *p)
 }
 early_param("coherent_pool", early_coherent_pool);
 
-int __init dma_atomic_pool_init(gfp_t gfp, pgprot_t prot)
+static gfp_t dma_atomic_pool_gfp(void)
+{
+	if (IS_ENABLED(CONFIG_ZONE_DMA))
+		return GFP_DMA;
+	if (IS_ENABLED(CONFIG_ZONE_DMA32))
+		return GFP_DMA32;
+	return GFP_KERNEL;
+}
+
+static int __init dma_atomic_pool_init(void)
 {
 	unsigned int pool_size_order = get_order(atomic_pool_size);
 	unsigned long nr_pages = atomic_pool_size >> PAGE_SHIFT;
@@ -117,7 +126,7 @@ int __init dma_atomic_pool_init(gfp_t gfp, pgprot_t prot)
 		page = dma_alloc_from_contiguous(NULL, nr_pages,
 						 pool_size_order, false);
 	else
-		page = alloc_pages(gfp, pool_size_order);
+		page = alloc_pages(dma_atomic_pool_gfp(), pool_size_order);
 	if (!page)
 		goto out;
 
@@ -128,7 +137,8 @@ int __init dma_atomic_pool_init(gfp_t gfp, pgprot_t prot)
 		goto free_page;
 
 	addr = dma_common_contiguous_remap(page, atomic_pool_size, VM_USERMAP,
-					   prot, __builtin_return_address(0));
+					   pgprot_dmacoherent(PAGE_KERNEL),
+					   __builtin_return_address(0));
 	if (!addr)
 		goto destroy_genpool;
 
@@ -155,6 +165,7 @@ int __init dma_atomic_pool_init(gfp_t gfp, pgprot_t prot)
 		atomic_pool_size / 1024);
 	return -ENOMEM;
 }
+postcore_initcall(dma_atomic_pool_init);
 
 bool dma_in_atomic_pool(void *start, size_t size)
 {
-- 
2.20.1

