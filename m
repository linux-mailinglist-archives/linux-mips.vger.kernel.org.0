Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C2063CA326
	for <lists+linux-mips@lfdr.de>; Thu, 15 Jul 2021 18:48:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231164AbhGOQup (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 15 Jul 2021 12:50:45 -0400
Received: from ale.deltatee.com ([204.191.154.188]:49960 "EHLO
        ale.deltatee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233692AbhGOQtE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 15 Jul 2021 12:49:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Cc:To:From:content-disposition;
        bh=5q5HrJN5z01eX+XAG2EfKItHnqLG5Bo1fOvwGUnV4O4=; b=oVKqj1qxGhVN9ixr6TLSsC4ZBO
        UTD1MZ1POYG3KI27eIMLMFxYbxzslShIpA6YWVrJkGi8+wWJ/wcVjvI1+Jf302nsbpn08IP0HnrjG
        oh9pK+zmvzVkSIE1LmiCYRQEMg/n7BKDDFN1GhirqNtUZZY85nV7dWg7yr93fsfot42jaRm2mqSn+
        wA3i/zh7pUzR0TP8bgsZsoHOwBQn2dWZ41mvNoesxsAdL31ytt8u53ohsynd3SOTknscoWtbi7kQX
        eUTXIk0RVW11sAtm1oHi0qiO2SdAZ7zV+zvHAQY6D/M0Zv5t6bRmqKI4wJIkqLx4KZbsVyYpCrClV
        /+yGg5Kg==;
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
        by ale.deltatee.com with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <gunthorp@deltatee.com>)
        id 1m44Ut-0001yb-T5; Thu, 15 Jul 2021 10:46:04 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.92)
        (envelope-from <gunthorp@deltatee.com>)
        id 1m44Up-0001no-O1; Thu, 15 Jul 2021 10:45:59 -0600
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
        Logan Gunthorpe <logang@deltatee.com>
Date:   Thu, 15 Jul 2021 10:45:43 -0600
Message-Id: <20210715164544.6827-16-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210715164544.6827-1-logang@deltatee.com>
References: <20210715164544.6827-1-logang@deltatee.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org, hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com, sbates@raithlin.com, martin.oliveira@eideticom.com, logang@deltatee.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        MYRULES_NO_TEXT autolearn=no autolearn_force=no version=3.4.2
Subject: [PATCH v1 15/16] dma-mapping: return error code from dma_dummy_map_sg()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Martin Oliveira <martin.oliveira@eideticom.com>

The .map_sg() op now expects an error code instead of zero on failure.

The only errno to return is -ENODEV in the case when DMA is not
supported.

Signed-off-by: Martin Oliveira <martin.oliveira@eideticom.com>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 kernel/dma/dummy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/dma/dummy.c b/kernel/dma/dummy.c
index eacd4c5b10bf..ae9abebed0c4 100644
--- a/kernel/dma/dummy.c
+++ b/kernel/dma/dummy.c
@@ -22,7 +22,7 @@ static int dma_dummy_map_sg(struct device *dev, struct scatterlist *sgl,
 		int nelems, enum dma_data_direction dir,
 		unsigned long attrs)
 {
-	return 0;
+	return -ENODEV;
 }
 
 static int dma_dummy_supported(struct device *hwdev, u64 mask)
-- 
2.20.1

