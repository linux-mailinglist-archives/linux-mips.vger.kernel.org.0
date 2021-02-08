Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A47CF3135AD
	for <lists+linux-mips@lfdr.de>; Mon,  8 Feb 2021 15:51:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233054AbhBHOvm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Feb 2021 09:51:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233050AbhBHOv0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Feb 2021 09:51:26 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F86CC0617A9;
        Mon,  8 Feb 2021 06:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=EPoiozZS6/Cvp+l1A8bZazJRGXrcXgormcPYzPOKxGQ=; b=BDunB0gBYgJ2R+w+QAi2mR/CSA
        0PbAGk5flA4O6lJxRN6sKdMbQ0SoudMZd/funMFRlZj9WA9c9zubNKRW3GM22pC1fdKI6i8mlVBaD
        nyEBbXTylPOk7uX/Vi7O8Xv78vIgIrlrZvE0yAAvy5DJIpAMxqaVIQfxBFxeaXLq8SLVRewRjjNxk
        Bpoq6dzsNkcVnv8zxmWC3/QeHpW90CtIsfKdLQv//ujL3aU8gU//DRrZLHLxZ/VaFeihcGcwpAS2t
        qsBUwl3Bfdm6/+LyXiz6sJSdnYTaUzDRz5Cxv/rZKEHpWZtIxUv/T6VQhFdEuiBbZkeAZOXlzJN98
        jswI31Tw==;
Received: from [2001:4bb8:184:7d04:e3ed:f9d6:78e2:6f0f] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l97sA-0066eF-KK; Mon, 08 Feb 2021 14:50:43 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org
Subject: [PATCH 6/6] MIPS: remove CONFIG_DMA_PERDEV_COHERENT
Date:   Mon,  8 Feb 2021 15:50:24 +0100
Message-Id: <20210208145024.3320420-7-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208145024.3320420-1-hch@lst.de>
References: <20210208145024.3320420-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Just select DMA_NONCOHERENT and ARCH_HAS_SETUP_DMA_OPS from the
MIPS_GENERIC platform instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/Kconfig              | 8 ++------
 arch/mips/mm/dma-noncoherent.c | 2 +-
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 1f1603a08a6d2d..fae02b0b9c599a 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -123,6 +123,7 @@ choice
 
 config MIPS_GENERIC_KERNEL
 	bool "Generic board-agnostic MIPS kernel"
+	select ARCH_HAS_SETUP_DMA_OPS
 	select MIPS_GENERIC
 	select BOOT_RAW
 	select BUILTIN_DTB
@@ -132,7 +133,7 @@ config MIPS_GENERIC_KERNEL
 	select CPU_MIPSR2_IRQ_EI
 	select CPU_MIPSR2_IRQ_VI
 	select CSRC_R4K
-	select DMA_PERDEV_COHERENT
+	select DMA_NONCOHERENT
 	select HAVE_PCI
 	select IRQ_MIPS_CPU
 	select MIPS_AUTO_PFN_OFFSET
@@ -1127,11 +1128,6 @@ config FW_CFE
 config ARCH_SUPPORTS_UPROBES
 	bool
 
-config DMA_PERDEV_COHERENT
-	bool
-	select ARCH_HAS_SETUP_DMA_OPS
-	select DMA_NONCOHERENT
-
 config DMA_NONCOHERENT
 	bool
 	#
diff --git a/arch/mips/mm/dma-noncoherent.c b/arch/mips/mm/dma-noncoherent.c
index 90b562753eb892..212f3ce75a6bd3 100644
--- a/arch/mips/mm/dma-noncoherent.c
+++ b/arch/mips/mm/dma-noncoherent.c
@@ -135,7 +135,7 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 }
 #endif
 
-#ifdef CONFIG_DMA_PERDEV_COHERENT
+#ifdef CONFIG_ARCH_HAS_SETUP_DMA_OPS
 void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
 		const struct iommu_ops *iommu, bool coherent)
 {
-- 
2.29.2

