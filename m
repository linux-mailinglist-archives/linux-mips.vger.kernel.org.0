Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 880DBF505
	for <lists+linux-mips@lfdr.de>; Tue, 30 Apr 2019 13:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727813AbfD3LBn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Apr 2019 07:01:43 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:43226 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727568AbfD3LBS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 Apr 2019 07:01:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=3iOsMDc/eLLeJdIqAIhjTf5tbnEOPkeC/CTfINb+v8s=; b=ZFsf5RbkvitbI3dDa9MPfsrldT
        JGeQp8Ha19YrecLU/VmcDCKmxEwrfbBCmypMSDbdrcmAULt4japidFPzYKBh8RJJBMnQUhaHSLndo
        MyEbobdpLYy+Rebm1U0TXQqqi+Q3fMe2YHdlx1r9+dw8D57qq1TYAf//f23Wf7j32+Mcj1a7LMpn3
        1c6ZGA3nTHHk8NfZRJ59rP9O1gWG8JYewgKzPEyww/N2BaSwUegIWa1IbhBci7z0B/vbP0o+ZumuS
        yRg6CAZGx5F/R/AkbftW5Qcin8R7X22PIemRqAwnHeU6vz6cs35QP8btIV5PROwzU3gm8VQ4mQw5O
        kkZehrwg==;
Received: from adsl-173-228-226-134.prtc.net ([173.228.226.134] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hLQVe-0000H2-V0; Tue, 30 Apr 2019 11:01:15 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Ley Foon Tan <lftan@altera.com>,
        Michal Simek <monstr@monstr.eu>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     linux-mips@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
        Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 3/7] dma-mapping: add a Kconfig symbol to indicate arch_dma_prep_coherent presence
Date:   Tue, 30 Apr 2019 07:00:28 -0400
Message-Id: <20190430110032.25301-4-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190430110032.25301-1-hch@lst.de>
References: <20190430110032.25301-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add a Kconfig symbol that indicates an architecture provides a
arch_dma_prep_coherent implementation, and provide a stub otherwise.

This will allow the generic dma-iommu code to use it while still
allowing to be built for cache coherent architectures.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
---
 arch/arm64/Kconfig              | 1 +
 arch/csky/Kconfig               | 1 +
 include/linux/dma-noncoherent.h | 6 ++++++
 kernel/dma/Kconfig              | 3 +++
 4 files changed, 11 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 7e34b9eba5de..adda078d6df7 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -13,6 +13,7 @@ config ARM64
 	select ARCH_HAS_DEVMEM_IS_ALLOWED
 	select ARCH_HAS_DMA_COHERENT_TO_PFN
 	select ARCH_HAS_DMA_MMAP_PGPROT
+	select ARCH_HAS_DMA_PREP_COHERENT
 	select ARCH_HAS_ACPI_TABLE_UPGRADE if ACPI
 	select ARCH_HAS_ELF_RANDOMIZE
 	select ARCH_HAS_FAST_MULTIPLIER
diff --git a/arch/csky/Kconfig b/arch/csky/Kconfig
index 725a115759c9..2c3178848b7d 100644
--- a/arch/csky/Kconfig
+++ b/arch/csky/Kconfig
@@ -1,6 +1,7 @@
 config CSKY
 	def_bool y
 	select ARCH_32BIT_OFF_T
+	select ARCH_HAS_DMA_PREP_COHERENT
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select ARCH_USE_BUILTIN_BSWAP
diff --git a/include/linux/dma-noncoherent.h b/include/linux/dma-noncoherent.h
index 69b36ed31a99..9741767e400f 100644
--- a/include/linux/dma-noncoherent.h
+++ b/include/linux/dma-noncoherent.h
@@ -72,6 +72,12 @@ static inline void arch_sync_dma_for_cpu_all(struct device *dev)
 }
 #endif /* CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL */
 
+#ifdef CONFIG_ARCH_HAS_DMA_PREP_COHERENT
 void arch_dma_prep_coherent(struct page *page, size_t size);
+#else
+static inline void arch_dma_prep_coherent(struct page *page, size_t size)
+{
+}
+#endif /* CONFIG_ARCH_HAS_DMA_PREP_COHERENT */
 
 #endif /* _LINUX_DMA_NONCOHERENT_H */
diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index 52b704e2b97a..83d711f8d665 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -38,6 +38,9 @@ config ARCH_HAS_SYNC_DMA_FOR_CPU
 config ARCH_HAS_SYNC_DMA_FOR_CPU_ALL
 	bool
 
+config ARCH_HAS_DMA_PREP_COHERENT
+	bool
+
 config ARCH_HAS_DMA_COHERENT_TO_PFN
 	bool
 
-- 
2.20.1

