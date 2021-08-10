Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71BF53DACED
	for <lists+linux-mips@lfdr.de>; Thu, 29 Jul 2021 22:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233863AbhG2UQW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 29 Jul 2021 16:16:22 -0400
Received: from ale.deltatee.com ([204.191.154.188]:59478 "EHLO
        ale.deltatee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233273AbhG2UQL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 29 Jul 2021 16:16:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Cc:To:From:content-disposition;
        bh=3+NKDp2q/0zHzVVwq3INd+w6NURPV4dE2hTg9/0ITMI=; b=OAsOqNptAFqz7ht2gGLe+fKNkN
        afDvfEj3zeW9zPgG0qWcEcE9wlLmDSYL85QoO8TgnEWXRF0cFS1SxJL0P2x6FNz8bkfgtr50lIoro
        6NBcPcKqDRmsmgDVRzLy+D6IKa8mkq91+s5hOgCuL9nQGrogvFlY65BWYTh6XQsjV4xMlWoDFNNTt
        RXgkNvWiqAupSHXfu1J8U8DfHfK8jRBxipCV1nbbK7WEgwzUwFPWpF0/V8qKrFN+TrHgXMHQe328C
        D8SL2GNPbqtflFoGqbAzN2fcTNhQ834PMkcgcBzlMxFACHWKZCDJYJgnFCRB6vjtCbi2yEAqf0i/3
        lEI0LnDQ==;
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
        by ale.deltatee.com with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <gunthorp@deltatee.com>)
        id 1m9CRn-0008VM-Nk; Thu, 29 Jul 2021 14:16:04 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.92)
        (envelope-from <gunthorp@deltatee.com>)
        id 1m9CRU-0001Te-3R; Thu, 29 Jul 2021 14:15:44 -0600
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
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>
Date:   Thu, 29 Jul 2021 14:15:23 -0600
Message-Id: <20210729201539.5602-6-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729201539.5602-1-logang@deltatee.com>
References: <20210729201539.5602-1-logang@deltatee.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org, hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com, sbates@raithlin.com, martin.oliveira@eideticom.com, logang@deltatee.com, rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        MYRULES_NO_TEXT autolearn=no autolearn_force=no version=3.4.2
Subject: [PATCH v3 05/21] alpha: return error code from alpha_pci_map_sg()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Martin Oliveira <martin.oliveira@eideticom.com>

The .map_sg() op now expects an error code instead of zero on failure.

pci_map_single_1() can fail for different reasons, but since the only
supported type of error return is DMA_MAPPING_ERROR, we coalesce those
errors into EIO.

ENOMEM is returned when no page tables can be allocated.

Signed-off-by: Martin Oliveira <martin.oliveira@eideticom.com>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Ivan Kokshaysky <ink@jurassic.park.msu.ru>
Cc: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/pci_iommu.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
index 35d7b3096d6e..21f9ac101324 100644
--- a/arch/alpha/kernel/pci_iommu.c
+++ b/arch/alpha/kernel/pci_iommu.c
@@ -649,7 +649,9 @@ static int alpha_pci_map_sg(struct device *dev, struct scatterlist *sg,
 		sg->dma_address
 		  = pci_map_single_1(pdev, SG_ENT_VIRT_ADDRESS(sg),
 				     sg->length, dac_allowed);
-		return sg->dma_address != DMA_MAPPING_ERROR;
+		if (sg->dma_address == DMA_MAPPING_ERROR)
+			return -EIO;
+		return 1;
 	}
 
 	start = sg;
@@ -685,8 +687,10 @@ static int alpha_pci_map_sg(struct device *dev, struct scatterlist *sg,
 	if (out < end)
 		out->dma_length = 0;
 
-	if (out - start == 0)
+	if (out - start == 0) {
 		printk(KERN_WARNING "pci_map_sg failed: no entries?\n");
+		return -ENOMEM;
+	}
 	DBGA("pci_map_sg: %ld entries\n", out - start);
 
 	return out - start;
@@ -699,7 +703,7 @@ static int alpha_pci_map_sg(struct device *dev, struct scatterlist *sg,
 	   entries.  Unmap them now.  */
 	if (out > start)
 		pci_unmap_sg(pdev, start, out - start, dir);
-	return 0;
+	return -ENOMEM;
 }
 
 /* Unmap a set of streaming mode DMA translations.  Again, cpu read
-- 
2.20.1

