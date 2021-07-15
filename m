Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACB983CA2BF
	for <lists+linux-mips@lfdr.de>; Thu, 15 Jul 2021 18:46:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234351AbhGOQtJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 15 Jul 2021 12:49:09 -0400
Received: from ale.deltatee.com ([204.191.154.188]:50060 "EHLO
        ale.deltatee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234059AbhGOQtG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 15 Jul 2021 12:49:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Cc:To:From:content-disposition;
        bh=bxYuYkexdgjCkkzv9UnzPxUCVLmS0/r9pZcrAxTBVsI=; b=Lss1AvtDz5LUXxNmZLvnEi5Xde
        zNsqlgc9Jfm+oTis6ayJermYtPQlSU7FExSZG7YxLDzVUAjV3EZgudpLjdA49a+pQ5IoaupAkmrUj
        MBmKsrcgEudrKKHqygKF9x1/h8OG9HCtnZ6ksLTzwkUmB6vGkrWUyKuQf2SwXUyj9EiP/h+4XMAeI
        5942GhQ+bqkXDDvcsqx0b0E0wzNh4Dd0L/rKgGWHjBE4F1pg1VHlpxUpnp+SnapV7KhBrAH+jRe0k
        I5aj2hsoE9K9+DtJ37q/EQ4CjTJYY8q+bja6l5RiGMwjgqR841ENJ51Mn9zbG5mhOaFhmV7ciE2YO
        VNuGxQPg==;
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
        by ale.deltatee.com with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <gunthorp@deltatee.com>)
        id 1m44Ux-0001ye-4e; Thu, 15 Jul 2021 10:46:08 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.92)
        (envelope-from <gunthorp@deltatee.com>)
        id 1m44Up-0001nl-Il; Thu, 15 Jul 2021 10:45:59 -0600
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
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>
Date:   Thu, 15 Jul 2021 10:45:42 -0600
Message-Id: <20210715164544.6827-15-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210715164544.6827-1-logang@deltatee.com>
References: <20210715164544.6827-1-logang@deltatee.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org, hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com, sbates@raithlin.com, martin.oliveira@eideticom.com, logang@deltatee.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, schnelle@linux.ibm.com, tsbogend@alpha.franken.de, mpe@ellerman.id.au
X-SA-Exim-Mail-From: gunthorp@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        MYRULES_NO_TEXT autolearn=no autolearn_force=no version=3.4.2
Subject: [PATCH v1 14/16] x86/amd_gart: return error code from gart_map_sg()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Martin Oliveira <martin.oliveira@eideticom.com>

The .map_sg() op now expects an error code instead of zero on failure.

So make __dma_map_cont() return a valid errno (which is then propagated
to gart_map_sg() via dma_map_cont()) and return it in case of failure.

Also, return -EINVAL in case of invalid nents.

Signed-off-by: Martin Oliveira <martin.oliveira@eideticom.com>
Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/x86/kernel/amd_gart_64.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kernel/amd_gart_64.c b/arch/x86/kernel/amd_gart_64.c
index 9ac696487b13..46aea9a4f26b 100644
--- a/arch/x86/kernel/amd_gart_64.c
+++ b/arch/x86/kernel/amd_gart_64.c
@@ -331,7 +331,7 @@ static int __dma_map_cont(struct device *dev, struct scatterlist *start,
 	int i;
 
 	if (iommu_start == -1)
-		return -1;
+		return -ENOMEM;
 
 	for_each_sg(start, s, nelems, i) {
 		unsigned long pages, addr;
@@ -380,13 +380,13 @@ static int gart_map_sg(struct device *dev, struct scatterlist *sg, int nents,
 		       enum dma_data_direction dir, unsigned long attrs)
 {
 	struct scatterlist *s, *ps, *start_sg, *sgmap;
-	int need = 0, nextneed, i, out, start;
+	int need = 0, nextneed, i, out, start, ret;
 	unsigned long pages = 0;
 	unsigned int seg_size;
 	unsigned int max_seg_size;
 
 	if (nents == 0)
-		return 0;
+		return -EINVAL;
 
 	out		= 0;
 	start		= 0;
@@ -414,8 +414,9 @@ static int gart_map_sg(struct device *dev, struct scatterlist *sg, int nents,
 			if (!iommu_merge || !nextneed || !need || s->offset ||
 			    (s->length + seg_size > max_seg_size) ||
 			    (ps->offset + ps->length) % PAGE_SIZE) {
-				if (dma_map_cont(dev, start_sg, i - start,
-						 sgmap, pages, need) < 0)
+				ret = dma_map_cont(dev, start_sg, i - start,
+						   sgmap, pages, need);
+				if (ret < 0)
 					goto error;
 				out++;
 
@@ -432,7 +433,8 @@ static int gart_map_sg(struct device *dev, struct scatterlist *sg, int nents,
 		pages += iommu_num_pages(s->offset, s->length, PAGE_SIZE);
 		ps = s;
 	}
-	if (dma_map_cont(dev, start_sg, i - start, sgmap, pages, need) < 0)
+	ret = dma_map_cont(dev, start_sg, i - start, sgmap, pages, need);
+	if (ret < 0)
 		goto error;
 	out++;
 	flush_gart();
@@ -458,7 +460,7 @@ static int gart_map_sg(struct device *dev, struct scatterlist *sg, int nents,
 	iommu_full(dev, pages << PAGE_SHIFT, dir);
 	for_each_sg(sg, s, nents, i)
 		s->dma_address = DMA_MAPPING_ERROR;
-	return 0;
+	return ret;
 }
 
 /* allocate and map a coherent mapping */
-- 
2.20.1

