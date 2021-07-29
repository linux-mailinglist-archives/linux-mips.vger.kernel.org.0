Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F10B53DACF7
	for <lists+linux-mips@lfdr.de>; Thu, 29 Jul 2021 22:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233932AbhG2UQY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 29 Jul 2021 16:16:24 -0400
Received: from ale.deltatee.com ([204.191.154.188]:59138 "EHLO
        ale.deltatee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232672AbhG2UP7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 29 Jul 2021 16:15:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Cc:To:From:content-disposition;
        bh=SvEzwpNxmVfyllnMOG86hKyCuFZgCTrDE53Ra6OCzdU=; b=WiNvtwJWsvaWnq8SYmDQL8Ejad
        kH1OHkO85WUX8V6h92JFJR4xzaBqNooRZC0dTcIQp+I0ka90sKEZo9dxN8NsH82EZJEy/3xG7TAWh
        /sXbBOqrMxoadkyNfMXimu8pd4Agw8sVOzNLOSstc8uNoV9t6HvaGetGv0LeTxzfEXWU9iU6/cWGy
        w4tLTaS+Fq7Pp4bbmhNN3Bz4G1KCh3RZ96+TBQ3yzo+FtsWXDlffmD/JEOHEGhiGj+bTKS3UxB/lf
        7OUmTUn9JsDjcIpVl7kARu3aX9kwjXt6JGCGiMse2DWCpu72hJcFNV7zOEnDl4AZ+N6YF/CyfpBQY
        tTCEnQog==;
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
        by ale.deltatee.com with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <gunthorp@deltatee.com>)
        id 1m9CRb-0008VN-JL; Thu, 29 Jul 2021 14:15:52 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.92)
        (envelope-from <gunthorp@deltatee.com>)
        id 1m9CRV-0001UE-W9; Thu, 29 Jul 2021 14:15:46 -0600
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
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>
Date:   Thu, 29 Jul 2021 14:15:35 -0600
Message-Id: <20210729201539.5602-18-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729201539.5602-1-logang@deltatee.com>
References: <20210729201539.5602-1-logang@deltatee.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org, hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com, sbates@raithlin.com, martin.oliveira@eideticom.com, logang@deltatee.com, boris.ostrovsky@oracle.com, konrad.wilk@oracle.com, jgross@suse.com, sstabellini@kernel.org
X-SA-Exim-Mail-From: gunthorp@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        MYRULES_NO_TEXT autolearn=no autolearn_force=no version=3.4.2
Subject: [PATCH v3 17/21] xen: swiotlb: return error code from xen_swiotlb_map_sg()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Martin Oliveira <martin.oliveira@eideticom.com>

The .map_sg() op now expects an error code instead of zero on failure.

xen_swiotlb_map_sg() may only fail if xen_swiotlb_map_page() fails, but
xen_swiotlb_map_page() only supports returning errors as
DMA_MAPPING_ERROR. So coalesce all errors into EIO per the documentation
for dma_map_sgtable().

Signed-off-by: Martin Oliveira <martin.oliveira@eideticom.com>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
---
 drivers/xen/swiotlb-xen.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 24d11861ac7d..85d58b720a24 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -509,7 +509,7 @@ xen_swiotlb_map_sg(struct device *dev, struct scatterlist *sgl, int nelems,
 out_unmap:
 	xen_swiotlb_unmap_sg(dev, sgl, i, dir, attrs | DMA_ATTR_SKIP_CPU_SYNC);
 	sg_dma_len(sgl) = 0;
-	return 0;
+	return -EIO;
 }
 
 static void
-- 
2.20.1

