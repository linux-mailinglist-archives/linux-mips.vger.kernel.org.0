Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E26F63CA2AB
	for <lists+linux-mips@lfdr.de>; Thu, 15 Jul 2021 18:46:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234181AbhGOQtH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 15 Jul 2021 12:49:07 -0400
Received: from ale.deltatee.com ([204.191.154.188]:49988 "EHLO
        ale.deltatee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233883AbhGOQtE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 15 Jul 2021 12:49:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Cc:To:From:content-disposition;
        bh=wWprxpQbGfLFSl5wy/zhotLOA6ZrkLS6haFDYZBjiv4=; b=Spw0vcPuNWrC1VB/N3ErsY9QsR
        SVOu2pyWJ/FuZ63VRhkHaNrYGNxmmYIXx9PikhM8TCMmdpKyjBuF9RLs0h5USncTLdFqA8ookOx0G
        Uh+6hSZ1LQ/AT/6fkMs7I/sWmgeij/QksGHD/wcgAvLgLFIYupGJcECBNvTIejINc9vzRhnt1gvMp
        d1qv/fQOX1iCowsgU//qvf9zBxNSzcO+QCg8whF/oXVJhQQoSMlgUYlJBgNgtfjNvKiSi4udAIPMg
        kZkbvAnNQf0F0JxQ/F67quZyGQhReNDhJW14fk20qFpoR28wptyOUDAN3gFjO1yJsvCMWx9e+oRs6
        TMj7iEGw==;
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
        by ale.deltatee.com with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <gunthorp@deltatee.com>)
        id 1m44Ut-0001yd-PE; Thu, 15 Jul 2021 10:46:04 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.92)
        (envelope-from <gunthorp@deltatee.com>)
        id 1m44Up-0001nr-Se; Thu, 15 Jul 2021 10:45:59 -0600
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
Date:   Thu, 15 Jul 2021 10:45:44 -0600
Message-Id: <20210715164544.6827-17-logang@deltatee.com>
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
Subject: [PATCH v1 16/16] dma-mapping: Disallow .map_sg operations from returning zero on error
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Now that all the .map_sg operations have been converted to returning
proper error codes, drop the code to handle a zero return value,
add a warning if a zero is returned and update the comment for the
map_sg operation.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
---
 include/linux/dma-map-ops.h | 8 +++-----
 kernel/dma/mapping.c        | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index eaa969be8284..f299bc1e317b 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -42,11 +42,9 @@ struct dma_map_ops {
 			unsigned long attrs);
 	/*
 	 * map_sg should return a negative error code on error.
-	 * dma_map_sgtable() will return the error code returned and convert
-	 * a zero return (for legacy implementations) into -EINVAL.
-	 *
-	 * dma_map_sg() will always return zero on any negative or zero
-	 * return to satisfy its own calling convention.
+	 * dma_map_sgtable() will return the error code returned by the
+	 * operation and dma_map_sg() will always convert any error to zero
+	 * to satisfy its own calling convention.
 	 */
 	int (*map_sg)(struct device *dev, struct scatterlist *sg, int nents,
 			enum dma_data_direction dir, unsigned long attrs);
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 30f89d244566..978a6a16aaf7 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -194,6 +194,8 @@ static int __dma_map_sg_attrs(struct device *dev, struct scatterlist *sg,
 	else
 		ents = ops->map_sg(dev, sg, nents, dir, attrs);
 
+	WARN_ON_ONCE(ents == 0);
+
 	if (ents > 0)
 		debug_dma_map_sg(dev, sg, nents, ents, dir);
 
@@ -251,9 +253,7 @@ int dma_map_sgtable(struct device *dev, struct sg_table *sgt,
 	int nents;
 
 	nents = __dma_map_sg_attrs(dev, sgt->sgl, sgt->orig_nents, dir, attrs);
-	if (nents == 0)
-		return -EINVAL;
-	else if (nents < 0)
+	if (nents < 0)
 		return nents;
 
 	sgt->nents = nents;
-- 
2.20.1

