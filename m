Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47770FAB08
	for <lists+linux-mips@lfdr.de>; Wed, 13 Nov 2019 08:35:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726086AbfKMHfr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Nov 2019 02:35:47 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:52916 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726066AbfKMHfq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 13 Nov 2019 02:35:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=rd7mmpK7guSSmDniY3UzjuffSk44L5H1a81KJkawXJw=; b=iYmN1KCPnXZG1k9dQjOrsZ8Iox
        NWI3SA1Hi71xwEY6vxyQd4oTCTHjiXdI2+SBUBzpLWbLISmLrJqg140XOQQircwB35YirZCNRy8Vj
        5YkjmoOoIMzuemdq6E1uh/xLm1tC7oSSMcS18jm03KDikQEwF6POZfWxk+adIl9/FkTieB3efkzsX
        06dPIjnmkb6MLjeBQbA74fFYc3Ej2f4DQoI2OtN4cb2NENRKhvOEZ2i1AX7HXlG2PdLpUHTOIJjlk
        WrHGTeWjt0pTIyXq5GiZkjAkuVQaCkA0btqNyGEStx2mMbbBJc1uG299HvDmvf7nA8rSLyWU8Qn47
        BjG6a8DQ==;
Received: from [2001:4bb8:180:3806:c70:4a89:bc61:5] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iUnBo-0008Rh-A0; Wed, 13 Nov 2019 07:35:44 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        iommu@lists.linux-foundation.org,
        Russell King <linux@armlinux.org.uk>
Cc:     linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/3] dma-direct: unify the dma_capable definitions
Date:   Wed, 13 Nov 2019 08:35:37 +0100
Message-Id: <20191113073539.9660-2-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191113073539.9660-1-hch@lst.de>
References: <20191113073539.9660-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Currently each architectures that wants to override dma_to_phys and
phys_to_dma also has to provide dma_capable.  But there isn't really
any good reason for that.  powerpc and mips just have copies of the
generic one minus the latests fix, and the arm one was the inspiration
for said fix, but misses the bus_dma_mask handling.
Make all architectures use the generic version instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm/include/asm/dma-direct.h     | 19 -------------------
 arch/mips/include/asm/dma-direct.h    |  8 --------
 arch/powerpc/include/asm/dma-direct.h |  9 ---------
 include/linux/dma-direct.h            |  2 +-
 4 files changed, 1 insertion(+), 37 deletions(-)

diff --git a/arch/arm/include/asm/dma-direct.h b/arch/arm/include/asm/dma-direct.h
index b67e5fc1fe43..7c3001a6a775 100644
--- a/arch/arm/include/asm/dma-direct.h
+++ b/arch/arm/include/asm/dma-direct.h
@@ -14,23 +14,4 @@ static inline phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dev_addr)
 	return __pfn_to_phys(dma_to_pfn(dev, dev_addr)) + offset;
 }
 
-static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t size)
-{
-	u64 limit, mask;
-
-	if (!dev->dma_mask)
-		return 0;
-
-	mask = *dev->dma_mask;
-
-	limit = (mask + 1) & ~mask;
-	if (limit && size > limit)
-		return 0;
-
-	if ((addr | (addr + size - 1)) & ~mask)
-		return 0;
-
-	return 1;
-}
-
 #endif /* ASM_ARM_DMA_DIRECT_H */
diff --git a/arch/mips/include/asm/dma-direct.h b/arch/mips/include/asm/dma-direct.h
index b5c240806e1b..14e352651ce9 100644
--- a/arch/mips/include/asm/dma-direct.h
+++ b/arch/mips/include/asm/dma-direct.h
@@ -2,14 +2,6 @@
 #ifndef _MIPS_DMA_DIRECT_H
 #define _MIPS_DMA_DIRECT_H 1
 
-static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t size)
-{
-	if (!dev->dma_mask)
-		return false;
-
-	return addr + size - 1 <= *dev->dma_mask;
-}
-
 dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr);
 phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t daddr);
 
diff --git a/arch/powerpc/include/asm/dma-direct.h b/arch/powerpc/include/asm/dma-direct.h
index a2912b47102c..e29e8a236b8d 100644
--- a/arch/powerpc/include/asm/dma-direct.h
+++ b/arch/powerpc/include/asm/dma-direct.h
@@ -2,15 +2,6 @@
 #ifndef ASM_POWERPC_DMA_DIRECT_H
 #define ASM_POWERPC_DMA_DIRECT_H 1
 
-static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t size)
-{
-	if (!dev->dma_mask)
-		return false;
-
-	return addr + size - 1 <=
-		min_not_zero(*dev->dma_mask, dev->bus_dma_mask);
-}
-
 static inline dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
 {
 	if (!dev)
diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
index 6db863c3eb93..991f8aa2676e 100644
--- a/include/linux/dma-direct.h
+++ b/include/linux/dma-direct.h
@@ -24,6 +24,7 @@ static inline phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dev_addr)
 
 	return paddr + ((phys_addr_t)dev->dma_pfn_offset << PAGE_SHIFT);
 }
+#endif /* !CONFIG_ARCH_HAS_PHYS_TO_DMA */
 
 static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t size)
 {
@@ -38,7 +39,6 @@ static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t size)
 
 	return end <= min_not_zero(*dev->dma_mask, dev->bus_dma_mask);
 }
-#endif /* !CONFIG_ARCH_HAS_PHYS_TO_DMA */
 
 #ifdef CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED
 bool force_dma_unencrypted(struct device *dev);
-- 
2.20.1

