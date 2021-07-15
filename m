Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14D453CA2B7
	for <lists+linux-mips@lfdr.de>; Thu, 15 Jul 2021 18:46:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234288AbhGOQtI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 15 Jul 2021 12:49:08 -0400
Received: from ale.deltatee.com ([204.191.154.188]:50066 "EHLO
        ale.deltatee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234083AbhGOQtG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 15 Jul 2021 12:49:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Cc:To:From:content-disposition;
        bh=Wrns5FFqiizJvY/sNvwDopZHfXFnxfOgrEtwhJFRdNw=; b=Sws5QpZQtGmVowR/5iUlwg8UgC
        Q5huPCa0lRnH7erDaKrhzfZc3JEbtS/rjcSlaa8ceAyHmJK3qWsjN9/c4G6FhbYQ9HlDeJ9jETJXB
        bdq2f8TzBEOEkrjZGT5Co1lxkWTp+AluJjL1bkBj90Yq6ajMWBMKV71yrDPw9lVFWzowjR6HfsXtg
        d+Je/PWPnaLtSYNrKpkvSiyI5DRH5zJ66i9nbDkdeg3NtjmH3nUDa+Kbqhs6Z3Dk8wWp1fVvuoZAb
        ByyrzFq6ya5bW2DjyLNWRxN8NNyR7KERo6lOJpGSIfwCgNHNa6vWbhtarhteipE1N4ZU/tBRoJcGY
        7hO7A1Vg==;
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
        by ale.deltatee.com with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <gunthorp@deltatee.com>)
        id 1m44Ux-0001yb-0X; Thu, 15 Jul 2021 10:46:08 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.92)
        (envelope-from <gunthorp@deltatee.com>)
        id 1m44Uo-0001nZ-TI; Thu, 15 Jul 2021 10:45:58 -0600
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
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>
Date:   Thu, 15 Jul 2021 10:45:38 -0600
Message-Id: <20210715164544.6827-11-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210715164544.6827-1-logang@deltatee.com>
References: <20210715164544.6827-1-logang@deltatee.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org, hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com, sbates@raithlin.com, martin.oliveira@eideticom.com, logang@deltatee.com, schnelle@linux.ibm.com, gerald.schaefer@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com, borntraeger@de.ibm.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        MYRULES_NO_TEXT autolearn=no autolearn_force=no version=3.4.2
Subject: [PATCH v1 10/16] s390/pci: return error code from s390_dma_map_sg()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Martin Oliveira <martin.oliveira@eideticom.com>

The .map_sg() op now expects an error code instead of zero on failure.

So propagate the error from __s390_dma_map_sg() up.

Signed-off-by: Martin Oliveira <martin.oliveira@eideticom.com>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
---
 arch/s390/pci/pci_dma.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/s390/pci/pci_dma.c b/arch/s390/pci/pci_dma.c
index ebc9a49523aa..c78b02012764 100644
--- a/arch/s390/pci/pci_dma.c
+++ b/arch/s390/pci/pci_dma.c
@@ -487,7 +487,7 @@ static int s390_dma_map_sg(struct device *dev, struct scatterlist *sg,
 	unsigned int max = dma_get_max_seg_size(dev);
 	unsigned int size = s->offset + s->length;
 	unsigned int offset = s->offset;
-	int count = 0, i;
+	int count = 0, i, ret;
 
 	for (i = 1; i < nr_elements; i++) {
 		s = sg_next(s);
@@ -497,8 +497,9 @@ static int s390_dma_map_sg(struct device *dev, struct scatterlist *sg,
 
 		if (s->offset || (size & ~PAGE_MASK) ||
 		    size + s->length > max) {
-			if (__s390_dma_map_sg(dev, start, size,
-					      &dma->dma_address, dir))
+			ret = __s390_dma_map_sg(dev, start, size,
+						&dma->dma_address, dir);
+			if (ret)
 				goto unmap;
 
 			dma->dma_address += offset;
@@ -511,7 +512,8 @@ static int s390_dma_map_sg(struct device *dev, struct scatterlist *sg,
 		}
 		size += s->length;
 	}
-	if (__s390_dma_map_sg(dev, start, size, &dma->dma_address, dir))
+	ret = __s390_dma_map_sg(dev, start, size, &dma->dma_address, dir);
+	if (ret)
 		goto unmap;
 
 	dma->dma_address += offset;
@@ -523,7 +525,7 @@ static int s390_dma_map_sg(struct device *dev, struct scatterlist *sg,
 		s390_dma_unmap_pages(dev, sg_dma_address(s), sg_dma_len(s),
 				     dir, attrs);
 
-	return 0;
+	return ret;
 }
 
 static void s390_dma_unmap_sg(struct device *dev, struct scatterlist *sg,
-- 
2.20.1

