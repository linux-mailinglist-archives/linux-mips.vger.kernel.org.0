Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E05831631A
	for <lists+linux-mips@lfdr.de>; Wed, 10 Feb 2021 11:03:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230227AbhBJKCW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Feb 2021 05:02:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230417AbhBJKAT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Feb 2021 05:00:19 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05FAFC06178C;
        Wed, 10 Feb 2021 01:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=YKTLEno4BoA1uPNMvgxx9dNuxXxSTmmhndwcXjQkrV4=; b=QvU3B3H4RDAcSNbKxreIM/Nr2Q
        rINm9XHMOmzWqNGXWuaWXlZi2agPamfUhuRvESci2niE2s7ucyAxICbMghzEP0uXllV/8TgR6QSuI
        OSQWGWlyQpRdyUFkCgsKZtkFr4CATjHpCbTxxW492l0tjxG917oQSXVrPh6uuMeA4XdU62HtaEh/C
        lH/IEpNVg3r5yyM7/PRpj6U8DSc57FZRY/joYX5ZmsZX+RNFsbnrERSHBJbaExBd9XZg3qCsKbeOd
        Oc2+Ow9eu063j8/76xXN7zKFH/SzMzUAIPzlskPSjJb28IwLsAIZ7GpjU0wMwRFNiMuggLn1wg946
        7hpObaoQ==;
Received: from [2001:4bb8:184:7d04:5e70:671e:7b3:191] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l9mF9-008g5d-Ea; Wed, 10 Feb 2021 09:57:09 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        Huacai Chen <chenhuacai@kernel.org>
Subject: [PATCH 6/6] MIPS: remove CONFIG_DMA_PERDEV_COHERENT
Date:   Wed, 10 Feb 2021 10:56:41 +0100
Message-Id: <20210210095641.23856-7-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210095641.23856-1-hch@lst.de>
References: <20210210095641.23856-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Just select DMA_NONCOHERENT and ARCH_HAS_SETUP_DMA_OPS from the
MIPS_GENERIC platform instead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Huacai Chen <chenhuacai@kernel.org>
---
 arch/mips/Kconfig              | 3 ++-
 arch/mips/mm/dma-noncoherent.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 1f1603a08a6d2d..32a693d033adfd 100644
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

