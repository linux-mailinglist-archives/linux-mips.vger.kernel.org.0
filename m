Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 972B93D3FAF
	for <lists+linux-mips@lfdr.de>; Fri, 23 Jul 2021 19:51:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232870AbhGWRKX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 23 Jul 2021 13:10:23 -0400
Received: from ale.deltatee.com ([204.191.154.188]:50890 "EHLO
        ale.deltatee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232957AbhGWRKG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 23 Jul 2021 13:10:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Cc:To:From:content-disposition;
        bh=vIIfMW9o269S9AHsb2MNe2Vf6XnVZ9UtVyZ/8uq4vWQ=; b=bcT7nhnwKTkOw153bRnRfDqhw8
        GEdhzlf3ZUOauG46mHHDfDiqbDm28+xdNalpW8ZgWemADhBvwUwO0f1NqENJLn3UFqK1nnSR114kh
        SsabhcTcFTEEC2vHkwqBHFFIOqf95eVmCmTsZHOeZgXK6mVJPGejw2jVv5dlbvqztUNYb6DtG6fiE
        KkrHLTq040obmM1yxGT8Rx8BdG/QsQSjFIm1Q4MtwxLehaduH2vJ7SQ7FXeyTwKhHUlT3IN83D2HW
        koMC31otWVVdde3608o3Hvr5hmp34H7SgeFgK8P2/h39MjJKB7RCTNVf5ZzsK90vBiXJPeF8uaJmO
        qBZ3j8hw==;
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
        by ale.deltatee.com with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <gunthorp@deltatee.com>)
        id 1m6zJh-0005Ll-OW; Fri, 23 Jul 2021 11:50:36 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.92)
        (envelope-from <gunthorp@deltatee.com>)
        id 1m6zJL-0005qq-DG; Fri, 23 Jul 2021 11:50:11 -0600
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
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Date:   Fri, 23 Jul 2021 11:49:54 -0600
Message-Id: <20210723175008.22410-8-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723175008.22410-1-logang@deltatee.com>
References: <20210723175008.22410-1-logang@deltatee.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org, hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com, sbates@raithlin.com, martin.oliveira@eideticom.com, logang@deltatee.com, linux@armlinux.org.uk, tsbogend@alpha.franken.de
X-SA-Exim-Mail-From: gunthorp@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        MYRULES_NO_TEXT,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.2
Subject: [PATCH v2 07/21] ARM/dma-mapping: don't set failed sg dma_address to DMA_MAPPING_ERROR
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Setting the ->dma_address to DMA_MAPPING_ERROR is not part of the
->map_sg calling convention, so remove it.

Link: https://lore.kernel.org/linux-mips/20210716063241.GC13345@lst.de/
Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/arm/mm/dma-mapping.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index 113b9cb3701b..4b61541853ea 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -1632,7 +1632,6 @@ static int __iommu_map_sg(struct device *dev, struct scatterlist *sg, int nents,
 	for (i = 1; i < nents; i++) {
 		s = sg_next(s);
 
-		s->dma_address = DMA_MAPPING_ERROR;
 		s->dma_length = 0;
 
 		if (s->offset || (size & ~PAGE_MASK) || size + s->length > max) {
-- 
2.20.1

