Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A86B3261564
	for <lists+linux-mips@lfdr.de>; Tue,  8 Sep 2020 18:48:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731981AbgIHQsx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Sep 2020 12:48:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732052AbgIHQsj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Sep 2020 12:48:39 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BF40C06179B;
        Tue,  8 Sep 2020 09:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=oseo1oDvGbSjzX3W8VD/a+snC1mEpAwE65LrT+9c/bQ=; b=eLWCPBdqbscc8ji4I9KQ3ECKYt
        WaEKmMpj47OVWtOs2fuVa5TEc1lvBjzjNMpmqsW+TUFVfbEis16CfBQvK3sSaIJPrX1guGtxJ/k2R
        5j4drCsb+jaDdGKp56cYOK2DyEFIT5IrvNaRGSvwFSm4hAUKfsRdHSDCgqBvkmYNhftq99e7eMr5K
        NEnDFA6ItMNKlB6l9rmsJkeWnuZdSixCJ7XzXWgdztc76shQwizDnDONV7UPMVw2tTvOAHE5MJnfV
        zFr1kg2fsDToh29ceR7I4qzavDbdsTsNTvlbN/o4dR54MK4qevsFXJ0+dDeekiERWLXrFoqficKpB
        Z07YEx8A==;
Received: from [2001:4bb8:184:af1:3dc3:9c83:fc6c:e0f] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kFgmr-0001SA-DR; Tue, 08 Sep 2020 16:48:05 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        iommu@lists.linux-foundation.org
Cc:     Tomasz Figa <tfiga@chromium.org>, Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: [PATCH 05/12] dma-mapping: add (back) arch_dma_mark_clean for ia64
Date:   Tue,  8 Sep 2020 18:47:51 +0200
Message-Id: <20200908164758.3177341-6-hch@lst.de>
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

Add back a hook to optimize dcache flushing after reading executable
code using DMA.  This gets ia64 out of the business of pretending to
be dma incoherent just for this optimization.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/ia64/Kconfig               |  3 +--
 arch/ia64/kernel/dma-mapping.c  | 14 +-------------
 arch/ia64/mm/init.c             |  3 +--
 include/linux/dma-direct.h      |  3 +++
 include/linux/dma-noncoherent.h |  8 ++++++++
 kernel/dma/Kconfig              |  6 ++++++
 kernel/dma/direct.c             |  3 +++
 7 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
index 5b4ec80bf5863a..513ba0c5d33610 100644
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@ -8,6 +8,7 @@ menu "Processor type and features"
 
 config IA64
 	bool
+	select ARCH_HAS_DMA_MARK_CLEAN
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_MIGHT_HAVE_PC_SERIO
 	select ACPI
@@ -32,8 +33,6 @@ config IA64
 	select TTY
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_VIRT_CPU_ACCOUNTING
-	select DMA_NONCOHERENT_MMAP
-	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select VIRT_TO_BUS
 	select GENERIC_IRQ_PROBE
 	select GENERIC_PENDING_IRQ if SMP
diff --git a/arch/ia64/kernel/dma-mapping.c b/arch/ia64/kernel/dma-mapping.c
index 09ef9ce9988d1f..f640ed6fe1d576 100644
--- a/arch/ia64/kernel/dma-mapping.c
+++ b/arch/ia64/kernel/dma-mapping.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-#include <linux/dma-direct.h>
+#include <linux/dma-mapping.h>
 #include <linux/export.h>
 
 /* Set this to 1 if there is a HW IOMMU in the system */
@@ -7,15 +7,3 @@ int iommu_detected __read_mostly;
 
 const struct dma_map_ops *dma_ops;
 EXPORT_SYMBOL(dma_ops);
-
-void *arch_dma_alloc(struct device *dev, size_t size,
-		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
-{
-	return dma_direct_alloc_pages(dev, size, dma_handle, gfp, attrs);
-}
-
-void arch_dma_free(struct device *dev, size_t size, void *cpu_addr,
-		dma_addr_t dma_addr, unsigned long attrs)
-{
-	dma_direct_free_pages(dev, size, cpu_addr, dma_addr, attrs);
-}
diff --git a/arch/ia64/mm/init.c b/arch/ia64/mm/init.c
index 0b3fb4c7af2920..02e5aa08294ee0 100644
--- a/arch/ia64/mm/init.c
+++ b/arch/ia64/mm/init.c
@@ -73,8 +73,7 @@ __ia64_sync_icache_dcache (pte_t pte)
  * DMA can be marked as "clean" so that lazy_mmu_prot_update() doesn't have to
  * flush them when they get mapped into an executable vm-area.
  */
-void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
-		enum dma_data_direction dir)
+void arch_dma_mark_clean(phys_addr_t paddr, size_t size)
 {
 	unsigned long pfn = PHYS_PFN(paddr);
 
diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
index 6e87225600ae35..95e3e28bd93f47 100644
--- a/include/linux/dma-direct.h
+++ b/include/linux/dma-direct.h
@@ -150,6 +150,9 @@ static inline void dma_direct_sync_single_for_cpu(struct device *dev,
 
 	if (unlikely(is_swiotlb_buffer(paddr)))
 		swiotlb_tbl_sync_single(dev, paddr, size, dir, SYNC_FOR_CPU);
+
+	if (dir == DMA_FROM_DEVICE)
+		arch_dma_mark_clean(paddr, size);
 }
 
 static inline dma_addr_t dma_direct_map_page(struct device *dev,
diff --git a/include/linux/dma-noncoherent.h b/include/linux/dma-noncoherent.h
index ca09a4e07d2d3d..b9bc6c557ea46f 100644
--- a/include/linux/dma-noncoherent.h
+++ b/include/linux/dma-noncoherent.h
@@ -108,6 +108,14 @@ static inline void arch_dma_prep_coherent(struct page *page, size_t size)
 }
 #endif /* CONFIG_ARCH_HAS_DMA_PREP_COHERENT */
 
+#ifdef CONFIG_ARCH_HAS_DMA_MARK_CLEAN
+void arch_dma_mark_clean(phys_addr_t paddr, size_t size);
+#else
+static inline void arch_dma_mark_clean(phys_addr_t paddr, size_t size)
+{
+}
+#endif /* ARCH_HAS_DMA_MARK_CLEAN */
+
 void *arch_dma_set_uncached(void *addr, size_t size);
 void arch_dma_clear_uncached(void *addr, size_t size);
 
diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index e7b801649f6574..281785feb874db 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -44,6 +44,12 @@ config ARCH_HAS_DMA_SET_MASK
 config ARCH_HAS_DMA_WRITE_COMBINE
 	bool
 
+#
+# Select if the architectures provides the arch_dma_mark_clean hook
+#
+config ARCH_HAS_DMA_MARK_CLEAN
+	bool
+
 config DMA_DECLARE_COHERENT
 	bool
 
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index db6ef07aec3b37..949c1cbf08b2d5 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -345,6 +345,9 @@ void dma_direct_sync_sg_for_cpu(struct device *dev,
 		if (unlikely(is_swiotlb_buffer(paddr)))
 			swiotlb_tbl_sync_single(dev, paddr, sg->length, dir,
 					SYNC_FOR_CPU);
+
+		if (dir == DMA_FROM_DEVICE)
+			arch_dma_mark_clean(paddr, sg->length);
 	}
 
 	if (!dev_is_dma_coherent(dev))
-- 
2.28.0

