Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12F683D3FDB
	for <lists+linux-mips@lfdr.de>; Fri, 23 Jul 2021 19:51:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233786AbhGWRKk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 23 Jul 2021 13:10:40 -0400
Received: from ale.deltatee.com ([204.191.154.188]:50836 "EHLO
        ale.deltatee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231940AbhGWRKB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 23 Jul 2021 13:10:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Cc:To:From:content-disposition;
        bh=OuJXER8TMWR954py7rg3mrCeDrxT4LjuVdKtzQZh6Zs=; b=VZIFNWIUoksYSuIPKO5F+BKDMW
        Dz/a1KEPRyGo26cwuIdeXHT4dKD9VP1PKuhNPdp3I+hm+TlxEfSoQUiJE30/x7kdL6uUd6o3CJsB5
        xPZ+/Lx68xcGKHV5UlYVDyawUrujcwyjqEX0T+qPlsOuC3ErRY/c/7KVW/EICp3gIO/DCrQYr+W0w
        HgdWUyAhbYLn47KaBKMV/m+ymoVBD9FwfVWFZSyO3eOYF9xUquor5DI5Cb/WzUJ0cqEREJl2x8tfY
        3hnmz0IlHu+FbWJbelRPwn+3O8tbkq7FTWZVo1hQD0Bp5XyLUodycAhAggyNro0H4M1lucZqx9/vw
        qXFJPM+g==;
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
        by ale.deltatee.com with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <gunthorp@deltatee.com>)
        id 1m6zJe-0005Li-5A; Fri, 23 Jul 2021 11:50:31 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.92)
        (envelope-from <gunthorp@deltatee.com>)
        id 1m6zJM-0005r2-0e; Fri, 23 Jul 2021 11:50:12 -0600
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
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Geoff Levand <geoff@infradead.org>
Date:   Fri, 23 Jul 2021 11:49:58 -0600
Message-Id: <20210723175008.22410-12-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723175008.22410-1-logang@deltatee.com>
References: <20210723175008.22410-1-logang@deltatee.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org, hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com, sbates@raithlin.com, martin.oliveira@eideticom.com, logang@deltatee.com, mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org, geoff@infradead.org
X-SA-Exim-Mail-From: gunthorp@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        MYRULES_FREE,MYRULES_NO_TEXT,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.2
Subject: [PATCH v2 11/21] powerpc/iommu: don't set failed sg dma_address to DMA_MAPPING_ERROR
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
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Geoff Levand <geoff@infradead.org>
---
 arch/powerpc/kernel/iommu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index a8ec4fe42817..30b7736f0896 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -575,7 +575,6 @@ int ppc_iommu_map_sg(struct device *dev, struct iommu_table *tbl,
 	 */
 	if (outcount < incount) {
 		outs = sg_next(outs);
-		outs->dma_address = DMA_MAPPING_ERROR;
 		outs->dma_length = 0;
 	}
 
@@ -593,7 +592,6 @@ int ppc_iommu_map_sg(struct device *dev, struct iommu_table *tbl,
 			npages = iommu_num_pages(s->dma_address, s->dma_length,
 						 IOMMU_PAGE_SIZE(tbl));
 			__iommu_free(tbl, vaddr, npages);
-			s->dma_address = DMA_MAPPING_ERROR;
 			s->dma_length = 0;
 		}
 		if (s == outs)
-- 
2.20.1

