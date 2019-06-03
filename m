Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B001D328E0
	for <lists+linux-mips@lfdr.de>; Mon,  3 Jun 2019 08:53:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727271AbfFCGxb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 3 Jun 2019 02:53:31 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:51622 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbfFCGxb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 3 Jun 2019 02:53:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=kLwF1ym8GKnVJtZUX19FSWDad7iQ4CxTHf3O1Y3qJF0=; b=X6nNoPOfgUtt+f8/QSuai2um25
        ghPmqDOLdRtH1hnbid7cZ1Yxu7nbNAMLugg2Se9hhIFNcF6twQl6uwRWOUBTXW2LcT83p6oOSwRYe
        OkH+yIr23Mge/Hcc2WdKq9y6gNNEzARYytiLhM+3cbmxuH/sD82m5+L+CcULvbhu/Z6xJotEgvOXg
        Ip9qWvKcDUNnW92757hHwB2qK4sM7x5l+DGvv0OPUZJUPZgyqGBvU2zVuV4KRsowhd745W7NPxg7n
        y1SPMZ5Rv0jXuBPCq81xQjlbtWlKRkqT7GiaF8kyCJCjxKZ2qP3tw1Bblipq3X7TenLWYxWOblFwR
        QH6MIQAA==;
Received: from 089144193064.atnat0002.highway.a1.net ([89.144.193.64] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hXgqX-00064l-WB; Mon, 03 Jun 2019 06:53:30 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Ley Foon Tan <lftan@altera.com>, Michal Simek <monstr@monstr.eu>
Cc:     linux-mips@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] nios2: use the generic uncached segment support in dma-direct
Date:   Mon,  3 Jun 2019 08:53:23 +0200
Message-Id: <20190603065324.9724-2-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190603065324.9724-1-hch@lst.de>
References: <20190603065324.9724-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Stop providing our own arch alloc/free hooks and just expose the segment
offset and use the generic dma-direct allocator.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/nios2/Kconfig            |  1 +
 arch/nios2/include/asm/page.h |  6 ------
 arch/nios2/mm/dma-mapping.c   | 34 +++++++++++++++-------------------
 3 files changed, 16 insertions(+), 25 deletions(-)

diff --git a/arch/nios2/Kconfig b/arch/nios2/Kconfig
index 26a9c760a98b..44b5da37e8bd 100644
--- a/arch/nios2/Kconfig
+++ b/arch/nios2/Kconfig
@@ -4,6 +4,7 @@ config NIOS2
 	select ARCH_32BIT_OFF_T
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
+	select ARCH_HAS_UNCACHED_SEGMENT
 	select ARCH_NO_SWAP
 	select TIMER_OF
 	select GENERIC_ATOMIC64
diff --git a/arch/nios2/include/asm/page.h b/arch/nios2/include/asm/page.h
index f1fbdc47bdaf..79fcac61f6ef 100644
--- a/arch/nios2/include/asm/page.h
+++ b/arch/nios2/include/asm/page.h
@@ -101,12 +101,6 @@ static inline bool pfn_valid(unsigned long pfn)
 # define VM_DATA_DEFAULT_FLAGS	(VM_READ | VM_WRITE | \
 				 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
 
-# define UNCAC_ADDR(addr)	\
-	((void *)((unsigned)(addr) | CONFIG_NIOS2_IO_REGION_BASE))
-# define CAC_ADDR(addr)		\
-	((void *)(((unsigned)(addr) & ~CONFIG_NIOS2_IO_REGION_BASE) |	\
-		CONFIG_NIOS2_KERNEL_REGION_BASE))
-
 #include <asm-generic/memory_model.h>
 
 #include <asm-generic/getorder.h>
diff --git a/arch/nios2/mm/dma-mapping.c b/arch/nios2/mm/dma-mapping.c
index 4af9e5b5ba1c..9cb238664584 100644
--- a/arch/nios2/mm/dma-mapping.c
+++ b/arch/nios2/mm/dma-mapping.c
@@ -60,32 +60,28 @@ void arch_sync_dma_for_cpu(struct device *dev, phys_addr_t paddr,
 	}
 }
 
-void *arch_dma_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle,
-		gfp_t gfp, unsigned long attrs)
+void arch_dma_prep_coherent(struct page *page, size_t size)
 {
-	void *ret;
+	unsigned long start = (unsigned long)page_address(page);
 
-	/* optimized page clearing */
-	gfp |= __GFP_ZERO;
+	flush_dcache_range(start, start + size);
+}
 
-	if (dev == NULL || (dev->coherent_dma_mask < 0xffffffff))
-		gfp |= GFP_DMA;
+void *uncached_kernel_address(void *ptr)
+{
+	unsigned long addr = (unsigned long)ptr;
 
-	ret = (void *) __get_free_pages(gfp, get_order(size));
-	if (ret != NULL) {
-		*dma_handle = virt_to_phys(ret);
-		flush_dcache_range((unsigned long) ret,
-			(unsigned long) ret + size);
-		ret = UNCAC_ADDR(ret);
-	}
+	addr |= CONFIG_NIOS2_IO_REGION_BASE;
 
-	return ret;
+	return (void *)ptr;
 }
 
-void arch_dma_free(struct device *dev, size_t size, void *vaddr,
-		dma_addr_t dma_handle, unsigned long attrs)
+void *cached_kernel_address(void *ptr)
 {
-	unsigned long addr = (unsigned long) CAC_ADDR((unsigned long) vaddr);
+	unsigned long addr = (unsigned long)ptr;
+
+	addr &= ~CONFIG_NIOS2_IO_REGION_BASE;
+	addr |= CONFIG_NIOS2_KERNEL_REGION_BASE;
 
-	free_pages(addr, get_order(size));
+	return (void *)ptr;
 }
-- 
2.20.1

