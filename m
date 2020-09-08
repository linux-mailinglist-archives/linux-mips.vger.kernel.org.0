Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 262EC26158F
	for <lists+linux-mips@lfdr.de>; Tue,  8 Sep 2020 18:53:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732114AbgIHQtB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Sep 2020 12:49:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732034AbgIHQsj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Sep 2020 12:48:39 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 694DDC061796;
        Tue,  8 Sep 2020 09:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=al0ag1j1mhlnjNfR7j4kD7CUfxxYaZBiv73JAkyo30Q=; b=c2ZnrSe2X6va8zAfelp2V/exIM
        hwcLDaVgsRkmxTApT2R4WKPdHTn4Y/Cx6BoSPvMrqulcKzxOqOEroLmrZCoG5GV619Ou5t0p24Ap5
        FzWUe07Ff/CQ2GwhhWYzbSioLNbsUHlkM+NxA0akLBhY/BPykuDhR3iy9VNWZ4DPsNKXhPPM6kGWj
        12Pr6pX8v5s9wMnaYEmMRivjZy6GdSa40AE5ko0P7gIC4cf3pBnGb40zeSHSUESoil3jeaXYAKhev
        I4/VinsIgOcWeaROvSrTabkj0eCQ3IgG8kUVFdsLNt14IFi+2f0P+OHbK/sRYXOpxGeKeH8tLRr5v
        HR5eHbvA==;
Received: from [2001:4bb8:184:af1:3dc3:9c83:fc6c:e0f] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kFgmt-0001Sf-Qe; Tue, 08 Sep 2020 16:48:08 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        iommu@lists.linux-foundation.org
Cc:     Tomasz Figa <tfiga@chromium.org>, Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: [PATCH 07/12] dma-direct: lift gfp_t manipulation out of__dma_direct_alloc_pages
Date:   Tue,  8 Sep 2020 18:47:53 +0200
Message-Id: <20200908164758.3177341-8-hch@lst.de>
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

Move the detailed gfp_t setup from __dma_direct_alloc_pages into the
caller to clean things up a little.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/direct.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 1d564bea58571b..12e9f5f75dfe4b 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -108,7 +108,7 @@ static inline bool dma_should_free_from_pool(struct device *dev,
 }
 
 static struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
-		gfp_t gfp, unsigned long attrs)
+		gfp_t gfp)
 {
 	int node = dev_to_node(dev);
 	struct page *page = NULL;
@@ -116,11 +116,6 @@ static struct page *__dma_direct_alloc_pages(struct device *dev, size_t size,
 
 	WARN_ON_ONCE(!PAGE_ALIGNED(size));
 
-	if (attrs & DMA_ATTR_NO_WARN)
-		gfp |= __GFP_NOWARN;
-
-	/* we always manually zero the memory once we are done: */
-	gfp &= ~__GFP_ZERO;
 	gfp |= dma_direct_optimal_gfp_mask(dev, dev->coherent_dma_mask,
 					   &phys_limit);
 	page = dma_alloc_contiguous(dev, size, gfp);
@@ -164,6 +159,8 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 		return arch_dma_alloc(dev, size, dma_handle, gfp, attrs);
 
 	size = PAGE_ALIGN(size);
+	if (attrs & DMA_ATTR_NO_WARN)
+		gfp |= __GFP_NOWARN;
 
 	if (dma_should_alloc_from_pool(dev, gfp, attrs)) {
 		u64 phys_mask;
@@ -177,7 +174,8 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 		goto done;
 	}
 
-	page = __dma_direct_alloc_pages(dev, size, gfp, attrs);
+	/* we always manually zero the memory once we are done */
+	page = __dma_direct_alloc_pages(dev, size, gfp & ~__GFP_ZERO);
 	if (!page)
 		return NULL;
 
-- 
2.28.0

