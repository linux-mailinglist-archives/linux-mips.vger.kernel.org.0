Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF8F119CF
	for <lists+linux-mips@lfdr.de>; Thu,  2 May 2019 15:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726282AbfEBNLh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 2 May 2019 09:11:37 -0400
Received: from verein.lst.de ([213.95.11.211]:59207 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726203AbfEBNLh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 2 May 2019 09:11:37 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 5EEEF68AA6; Thu,  2 May 2019 15:11:19 +0200 (CEST)
Date:   Thu, 2 May 2019 15:11:19 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Paul Burton <paul.burton@mips.com>
Cc:     Christoph Hellwig <hch@lst.de>, Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Ley Foon Tan <lftan@altera.com>,
        Michal Simek <monstr@monstr.eu>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH 4/7] dma-direct: provide generic support for uncached
 kernel segments
Message-ID: <20190502131119.GA2859@lst.de>
References: <20190430110032.25301-1-hch@lst.de> <20190430110032.25301-5-hch@lst.de> <20190501171857.chfxqntvm6r4xrr4@pburton-laptop> <20190501172912.GA19375@lst.de> <20190501174033.6rj5aiopdeo4uqpw@pburton-laptop> <20190501174905.GA20458@lst.de> <20190502000759.4ii2wuogc6fuc3jh@pburton-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190502000759.4ii2wuogc6fuc3jh@pburton-laptop>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, May 02, 2019 at 12:08:01AM +0000, Paul Burton wrote:
> > Can you test the stack with the two updated patches and ack them if
> > they are fine?  That would allow getting at least the infrastructure
> > and mips in for this merge window.
> 
> Did you send a v2 of this patch?
> 
> If so it hasn't showed up in my inbox, nor on the linux-mips archive on
> lore.kernel.org.

I did earlier in this thread.  Here it is again:

---
From 247ca658ebeb7c8d04918747ec8a0da45c36bcb8 Mon Sep 17 00:00:00 2001
From: Christoph Hellwig <hch@lst.de>
Date: Sun, 28 Apr 2019 13:23:26 -0500
Subject: dma-direct: provide generic support for uncached kernel segments

A few architectures support uncached kernel segments.  In that case we get
an uncached mapping for a given physica address by using an offset in the
uncached segement.  Implement support for this scheme in the generic
dma-direct code instead of duplicating it in arch hooks.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/Kconfig                    |  8 ++++++++
 include/linux/dma-noncoherent.h |  3 +++
 kernel/dma/direct.c             | 17 +++++++++++++++--
 3 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 33687dddd86a..ea22a8c894ec 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -249,6 +249,14 @@ config ARCH_HAS_FORTIFY_SOURCE
 config ARCH_HAS_SET_MEMORY
 	bool
 
+#
+# Select if arch has an uncached kernel segment and provides the
+# uncached_kernel_address / cached_kernel_address symbols to use it
+#
+config ARCH_HAS_UNCACHED_SEGMENT
+	select ARCH_HAS_DMA_PREP_COHERENT
+	bool
+
 # Select if arch init_task must go in the __init_task_data section
 config ARCH_TASK_STRUCT_ON_STACK
        bool
diff --git a/include/linux/dma-noncoherent.h b/include/linux/dma-noncoherent.h
index 9741767e400f..7e0126a04e02 100644
--- a/include/linux/dma-noncoherent.h
+++ b/include/linux/dma-noncoherent.h
@@ -80,4 +80,7 @@ static inline void arch_dma_prep_coherent(struct page *page, size_t size)
 }
 #endif /* CONFIG_ARCH_HAS_DMA_PREP_COHERENT */
 
+void *uncached_kernel_address(void *addr);
+void *cached_kernel_address(void *addr);
+
 #endif /* _LINUX_DMA_NONCOHERENT_H */
diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 2c2772e9702a..6688e1cee7d1 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -171,6 +171,13 @@ void *dma_direct_alloc_pages(struct device *dev, size_t size,
 		*dma_handle = phys_to_dma(dev, page_to_phys(page));
 	}
 	memset(ret, 0, size);
+
+	if (IS_ENABLED(CONFIG_ARCH_HAS_UNCACHED_SEGMENT) &&
+	    !dev_is_dma_coherent(dev) && !(attrs & DMA_ATTR_NON_CONSISTENT)) {
+		arch_dma_prep_coherent(page, size);
+		ret = uncached_kernel_address(ret);
+	}
+
 	return ret;
 }
 
@@ -189,13 +196,18 @@ void dma_direct_free_pages(struct device *dev, size_t size, void *cpu_addr,
 
 	if (force_dma_unencrypted())
 		set_memory_encrypted((unsigned long)cpu_addr, 1 << page_order);
+
+	if (IS_ENABLED(CONFIG_ARCH_HAS_UNCACHED_SEGMENT) &&
+	    !dev_is_dma_coherent(dev) && !(attrs & DMA_ATTR_NON_CONSISTENT))
+		cpu_addr = cached_kernel_address(cpu_addr);
 	__dma_direct_free_pages(dev, size, virt_to_page(cpu_addr));
 }
 
 void *dma_direct_alloc(struct device *dev, size_t size,
 		dma_addr_t *dma_handle, gfp_t gfp, unsigned long attrs)
 {
-	if (!dev_is_dma_coherent(dev))
+	if (!IS_ENABLED(CONFIG_ARCH_HAS_UNCACHED_SEGMENT) &&
+	    !dev_is_dma_coherent(dev))
 		return arch_dma_alloc(dev, size, dma_handle, gfp, attrs);
 	return dma_direct_alloc_pages(dev, size, dma_handle, gfp, attrs);
 }
@@ -203,7 +215,8 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 void dma_direct_free(struct device *dev, size_t size,
 		void *cpu_addr, dma_addr_t dma_addr, unsigned long attrs)
 {
-	if (!dev_is_dma_coherent(dev))
+	if (!IS_ENABLED(CONFIG_ARCH_HAS_UNCACHED_SEGMENT) &&
+	    !dev_is_dma_coherent(dev))
 		arch_dma_free(dev, size, cpu_addr, dma_addr, attrs);
 	else
 		dma_direct_free_pages(dev, size, cpu_addr, dma_addr, attrs);
-- 
2.20.1

