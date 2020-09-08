Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F54A26158A
	for <lists+linux-mips@lfdr.de>; Tue,  8 Sep 2020 18:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732120AbgIHQtC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Sep 2020 12:49:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732044AbgIHQsj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Sep 2020 12:48:39 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4187C061799;
        Tue,  8 Sep 2020 09:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=+nOSLIs9LkSjQJt0Q5qAmk8nkbWCQbovg2Llv5RLZtk=; b=IQ7sGbx+t6W2URYGAOKZfn6yYh
        JWIo9H8+pwAdOUvhjhfUAs2ggnOgWWcNDVAkixK61nw59vUUoSHBtr8ci/p/CkiVEZdX3lqJpc6md
        jCjTOziJO4l5EWDap3Wct/xQUY+QqWAoBNMLBc8/rDE3iqX1WQZwiYECBzvVAsUQ9APLCrlkKiLlF
        6dktr7vivViBBmsenA50pIFoJ5de5v0CWB7/r84SPvhv2j5JdzZNmwn/fBawbYUvcOmD0+shnGlaO
        dEbh3gNu0J03xzwCCQtqqSTZPiAVTwKUib9PmEV3i6T6ESrjW11KLyCKDzjHow+Wrg8IsaatI+N2i
        eaa0CdKQ==;
Received: from [2001:4bb8:184:af1:3dc3:9c83:fc6c:e0f] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kFgmm-0001Qz-8R; Tue, 08 Sep 2020 16:48:00 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        iommu@lists.linux-foundation.org
Cc:     Tomasz Figa <tfiga@chromium.org>, Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: [PATCH 01/12] MIPS: make dma_sync_*_for_cpu a little less overzealous
Date:   Tue,  8 Sep 2020 18:47:47 +0200
Message-Id: <20200908164758.3177341-2-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200908164758.3177341-1-hch@lst.de>
References: <20200908164758.3177341-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When transferring DMA ownership back to the CPU there should never
be any writeback from the cache, as the buffer was owned by the
device until now.  Instead it should just be invalidated for the
mapping directions where the device could have written data.
Note that the changes rely on the fact that kmap_atomic is stubbed
out for the !HIGHMEM case to simplify the code a bit.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/mm/dma-noncoherent.c | 44 +++++++++++++++++++++-------------
 1 file changed, 28 insertions(+), 16 deletions(-)

diff --git a/arch/mips/mm/dma-noncoherent.c b/arch/mips/mm/dma-noncoherent.c
index 563c2c0d0c8193..97a14adbafc99c 100644
--- a/arch/mips/mm/dma-noncoherent.c
+++ b/arch/mips/mm/dma-noncoherent.c
@@ -55,22 +55,34 @@ void *arch_dma_set_uncached(void *addr, size_t size)
 	return (void *)(__pa(addr) + UNCAC_BASE);
 }
 
-static inline void dma_sync_virt(void *addr, size_t size,
+static inline void dma_sync_virt_for_device(void *addr, size_t size,
 		enum dma_data_direction dir)
 {
 	switch (dir) {
 	case DMA_TO_DEVICE:
 		dma_cache_wback((unsigned long)addr, size);
 		break;
-
 	case DMA_FROM_DEVICE:
 		dma_cache_inv((unsigned long)addr, size);
 		break;
-
 	case DMA_BIDIRECTIONAL:
 		dma_cache_wback_inv((unsigned long)addr, size);
 		break;
+	default:
+		BUG();
+	}
+}
 
+static inline void dma_sync_virt_for_cpu(void *addr, size_t size,
+		enum dma_data_direction dir)
+{
+	switch (dir) {
+	case DMA_TO_DEVICE:
+		break;
+	case DMA_FROM_DEVICE:
+	case DMA_BIDIRECTIONAL:
+		dma_cache_inv((unsigned long)addr, size);
+		break;
 	default:
 		BUG();
 	}
@@ -82,7 +94,7 @@ static inline void dma_sync_virt(void *addr, size_t size,
  * configured then the bulk of this loop gets optimized out.
  */
 static inline void dma_sync_phys(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
+		enum dma_data_direction dir, bool for_device)
 {
 	struct page *page = pfn_to_page(paddr >> PAGE_SHIFT);
 	unsigned long offset = paddr & ~PAGE_MASK;
@@ -90,18 +102,20 @@ static inline void dma_sync_phys(phys_addr_t paddr, size_t size,
 
 	do {
 		size_t len = left;
+		void *addr;
 
 		if (PageHighMem(page)) {
-			void *addr;
-
 			if (offset + len > PAGE_SIZE)
 				len = PAGE_SIZE - offset;
+		}
+
+		addr = kmap_atomic(page);
+		if (for_device)
+			dma_sync_virt_for_device(addr + offset, len, dir);
+		else
+			dma_sync_virt_for_cpu(addr + offset, len, dir);
+		kunmap_atomic(addr);
 
-			addr = kmap_atomic(page);
-			dma_sync_virt(addr + offset, len, dir);
-			kunmap_atomic(addr);
-		} else
-			dma_sync_virt(page_address(page) + offset, size, dir);
 		offset = 0;
 		page++;
 		left -= len;
@@ -111,7 +125,7 @@ static inline void dma_sync_phys(phys_addr_t paddr, size_t size,
 void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
-	dma_sync_phys(paddr, size, dir);
+	dma_sync_phys(paddr, size, dir, true);
 }
 
 #ifdef CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU
@@ -119,16 +133,14 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 		enum dma_data_direction dir)
 {
 	if (cpu_needs_post_dma_flush())
-		dma_sync_phys(paddr, size, dir);
+		dma_sync_phys(paddr, size, dir, false);
 }
 #endif
 
 void arch_dma_cache_sync(struct device *dev, void *vaddr, size_t size,
 		enum dma_data_direction direction)
 {
-	BUG_ON(direction == DMA_NONE);
-
-	dma_sync_virt(vaddr, size, direction);
+	dma_sync_virt_for_device(vaddr, size, direction);
 }
 
 #ifdef CONFIG_DMA_PERDEV_COHERENT
-- 
2.28.0

