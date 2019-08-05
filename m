Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E582813D8
	for <lists+linux-mips@lfdr.de>; Mon,  5 Aug 2019 10:02:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727783AbfHEICI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 5 Aug 2019 04:02:08 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:50466 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726423AbfHEICH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 5 Aug 2019 04:02:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=M7aCOncE9cdu2lm40wE0sX+3YWUOlwEH41YvffpGGBk=; b=U3AOvS84+K0PANpTElTG64i6jb
        hWFT+tud1AOorcRkdR7h21ajTA52bvZ2O0FungAr+CBH5ceoQaQw6bHC7/CxRZbfcQUl4TGpMKmxj
        3iYO8iluc4+/v+DCRgXlE4NcXpt86w0S6RuJiFN5kWslZjOoMl+iTo44Efqx5+jSecYA/H6Bj4u4A
        JJ1WuHjA0WwPvD6Soh/DL3PMUE1aRlZwO0R2EZm/euaznjyWg3k8VXpVb5NIV44JBLMWSZKbBB4M5
        Ei0P+F+QZIe8hlGdYmtC5JJHtHvhcuaTFqmMrVHFZMIhYfiL9HpxRkrNV+qAfIQw0U4rkAuaw4nM4
        FltAaKnQ==;
Received: from [195.167.85.94] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1huXwK-0003OX-Je; Mon, 05 Aug 2019 08:01:57 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     iommu@lists.linux-foundation.org
Cc:     Shawn Anastasio <shawn@anastas.io>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linuxppc-dev@lists.ozlabs.org,
        linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] MIPS: remove support for DMA_ATTR_WRITE_COMBINE
Date:   Mon,  5 Aug 2019 11:01:45 +0300
Message-Id: <20190805080145.5694-3-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190805080145.5694-1-hch@lst.de>
References: <20190805080145.5694-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Mips uses the KSEG1 kernel memory segment do map dma coherent
allocations for non-coherent devices as uncachable, and does not have
any kind of special support for DMA_ATTR_WRITE_COMBINE in the allocation
path.  Thus supporting DMA_ATTR_WRITE_COMBINE in dma_mmap_attrs will
lead to multiple mappings with different caching attributes.

Fixes: 8c172467be36 ("MIPS: Add implementation of dma_map_ops.mmap()")
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/Kconfig              | 1 -
 arch/mips/mm/dma-noncoherent.c | 8 --------
 2 files changed, 9 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index d50fafd7bf3a..86e6760ef0d0 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1119,7 +1119,6 @@ config DMA_PERDEV_COHERENT
 
 config DMA_NONCOHERENT
 	bool
-	select ARCH_HAS_DMA_MMAP_PGPROT
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select ARCH_HAS_UNCACHED_SEGMENT
 	select NEED_DMA_MAP_STATE
diff --git a/arch/mips/mm/dma-noncoherent.c b/arch/mips/mm/dma-noncoherent.c
index ed56c6fa7be2..1d4d57dd9acf 100644
--- a/arch/mips/mm/dma-noncoherent.c
+++ b/arch/mips/mm/dma-noncoherent.c
@@ -65,14 +65,6 @@ long arch_dma_coherent_to_pfn(struct device *dev, void *cpu_addr,
 	return page_to_pfn(virt_to_page(cached_kernel_address(cpu_addr)));
 }
 
-pgprot_t arch_dma_mmap_pgprot(struct device *dev, pgprot_t prot,
-		unsigned long attrs)
-{
-	if (attrs & DMA_ATTR_WRITE_COMBINE)
-		return pgprot_writecombine(prot);
-	return pgprot_noncached(prot);
-}
-
 static inline void dma_sync_virt(void *addr, size_t size,
 		enum dma_data_direction dir)
 {
-- 
2.20.1

