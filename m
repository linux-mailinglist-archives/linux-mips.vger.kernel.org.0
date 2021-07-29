Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 540E23DACC3
	for <lists+linux-mips@lfdr.de>; Thu, 29 Jul 2021 22:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233256AbhG2UQK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 29 Jul 2021 16:16:10 -0400
Received: from ale.deltatee.com ([204.191.154.188]:59208 "EHLO
        ale.deltatee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232786AbhG2UQA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 29 Jul 2021 16:16:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Cc:To:From:content-disposition;
        bh=bIO3ta0XzvPdSC9DXOQ0qCnsFUls6Qbnvb3IRvewUpc=; b=ZNMXxY11ucan2rIkQrjisLwQ+B
        6blub6QUn7EeBcOr3SYI6GUpfI/lbMbcZ9SzZJmu8GYTDjJDYOizd0AoyssRs53Y7zF60qrSHLxzg
        0kB6Wp4xhCyatxH1ELRyTWvz8FvihtxvTvYV12SGAeFmh+bQUCGwLiba2M2UT6GuEgQN3T6gh5sCH
        dELJmt5WbzcFtXrM8VB7F1/wQDAiWi84VjKxuDM5l3W6dYCtBwdsIyV16GCQvj2E4pzHhwLM0Zb5d
        Saz/rllKkYdOjQrlq5w8vdk2MWu5ocFeWbKcO3xplslC9yawbI+eZEMzZQFFVVVieOKZ82Ypr0PUM
        ca5BpGow==;
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
        by ale.deltatee.com with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <gunthorp@deltatee.com>)
        id 1m9CRd-0008VL-3J; Thu, 29 Jul 2021 14:15:54 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.92)
        (envelope-from <gunthorp@deltatee.com>)
        id 1m9CRV-0001U8-Lk; Thu, 29 Jul 2021 14:15:45 -0600
From:   Logan Gunthorpe <logang@deltatee.com>
To:     linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-parisc@vger.kernel.org,
        xen-devel@lists.xenproject.org
Cc:     Christoph Hellwig <hch@lst.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Stephen Bates <sbates@raithlin.com>,
        Martin Oliveira <martin.oliveira@eideticom.com>,
        Logan Gunthorpe <logang@deltatee.com>,
        "David S. Miller" <davem@davemloft.net>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>
Date:   Thu, 29 Jul 2021 14:15:33 -0600
Message-Id: <20210729201539.5602-16-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729201539.5602-1-logang@deltatee.com>
References: <20210729201539.5602-1-logang@deltatee.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org, hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com, sbates@raithlin.com, martin.oliveira@eideticom.com, logang@deltatee.com, davem@davemloft.net, schnelle@linux.ibm.com, mpe@ellerman.id.au
X-SA-Exim-Mail-From: gunthorp@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        MYRULES_FREE,MYRULES_NO_TEXT autolearn=no autolearn_force=no
        version=3.4.2
Subject: [PATCH v3 15/21] sparc/iommu: don't set failed sg dma_address to DMA_MAPPING_ERROR
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Setting the ->dma_address to DMA_MAPPING_ERROR is not part of
the ->map_sg calling convention, so remove it.

Link: https://lore.kernel.org/linux-mips/20210716063241.GC13345@lst.de/
Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/sparc/kernel/iommu.c     | 2 --
 arch/sparc/kernel/pci_sun4v.c | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/sparc/kernel/iommu.c b/arch/sparc/kernel/iommu.c
index 0589acd34201..da0363692528 100644
--- a/arch/sparc/kernel/iommu.c
+++ b/arch/sparc/kernel/iommu.c
@@ -546,7 +546,6 @@ static int dma_4u_map_sg(struct device *dev, struct scatterlist *sglist,
 
 	if (outcount < incount) {
 		outs = sg_next(outs);
-		outs->dma_address = DMA_MAPPING_ERROR;
 		outs->dma_length = 0;
 	}
 
@@ -572,7 +571,6 @@ static int dma_4u_map_sg(struct device *dev, struct scatterlist *sglist,
 			iommu_tbl_range_free(&iommu->tbl, vaddr, npages,
 					     IOMMU_ERROR_CODE);
 
-			s->dma_address = DMA_MAPPING_ERROR;
 			s->dma_length = 0;
 		}
 		if (s == outs)
diff --git a/arch/sparc/kernel/pci_sun4v.c b/arch/sparc/kernel/pci_sun4v.c
index d90e80fa5705..384480971805 100644
--- a/arch/sparc/kernel/pci_sun4v.c
+++ b/arch/sparc/kernel/pci_sun4v.c
@@ -594,7 +594,6 @@ static int dma_4v_map_sg(struct device *dev, struct scatterlist *sglist,
 
 	if (outcount < incount) {
 		outs = sg_next(outs);
-		outs->dma_address = DMA_MAPPING_ERROR;
 		outs->dma_length = 0;
 	}
 
@@ -611,7 +610,6 @@ static int dma_4v_map_sg(struct device *dev, struct scatterlist *sglist,
 			iommu_tbl_range_free(tbl, vaddr, npages,
 					     IOMMU_ERROR_CODE);
 			/* XXX demap? XXX */
-			s->dma_address = DMA_MAPPING_ERROR;
 			s->dma_length = 0;
 		}
 		if (s == outs)
-- 
2.20.1

