Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 760F73D3F37
	for <lists+linux-mips@lfdr.de>; Fri, 23 Jul 2021 19:50:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231940AbhGWRJt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 23 Jul 2021 13:09:49 -0400
Received: from ale.deltatee.com ([204.191.154.188]:50566 "EHLO
        ale.deltatee.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231126AbhGWRJr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 23 Jul 2021 13:09:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=deltatee.com; s=20200525; h=Subject:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Cc:To:From:content-disposition;
        bh=HKCVUstwA/z3wuW2EGad6Fa2PQLjmM0RyJDS41E8gEg=; b=ceE3xNa5zKwrpv+KSzmE7LfjqN
        0q/StfTaFLC89OIPsL5+enoCQ8wyl6/6i4jsEFiR43MEKekW1TRVGs6gbFQAw05b52z+Gg/B/HERs
        9OhcoIjeIB26sAHv5+uTd3D/NbWNNXUPnOUr95+mHUB34EmPY7Fko/92+5UiQVxjDeY5a2hCXho37
        WUkvAUx9LUDaBn28taATIaM4Whds0u2lS0PSsUSwfkqXp0M+8yje3Gmj75OuBqwto3/1QVzP9VFof
        dxz4o8gHrETaFZyTg9X6dGaLxMEevxwctrUYwYEcmWkRnf+9VN8ernNXHxdpFxwYPEua/aErYGkeC
        VaCk22FA==;
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
        by ale.deltatee.com with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <gunthorp@deltatee.com>)
        id 1m6zJQ-0005Li-JV; Fri, 23 Jul 2021 11:50:17 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.92)
        (envelope-from <gunthorp@deltatee.com>)
        id 1m6zJN-0005rW-Is; Fri, 23 Jul 2021 11:50:13 -0600
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
Date:   Fri, 23 Jul 2021 11:50:08 -0600
Message-Id: <20210723175008.22410-22-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723175008.22410-1-logang@deltatee.com>
References: <20210723175008.22410-1-logang@deltatee.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, linux-parisc@vger.kernel.org, xen-devel@lists.xenproject.org, hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com, sbates@raithlin.com, martin.oliveira@eideticom.com, logang@deltatee.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        MYRULES_NO_TEXT autolearn=no autolearn_force=no version=3.4.2
Subject: [PATCH v2 21/21] dma-mapping: Disallow .map_sg operations from returning zero on error
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
 kernel/dma/mapping.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index b8dc8b1cb402..86a8a421344a 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -194,6 +194,9 @@ static int __dma_map_sg_attrs(struct device *dev, struct scatterlist *sg,
 	else
 		ents = ops->map_sg(dev, sg, nents, dir, attrs);
 
+	if (WARN_ON_ONCE(ents == 0))
+		return -EIO;
+
 	if (ents > 0)
 		debug_dma_map_sg(dev, sg, nents, ents, dir);
 
@@ -259,9 +262,7 @@ int dma_map_sgtable(struct device *dev, struct sg_table *sgt,
 	int nents;
 
 	nents = __dma_map_sg_attrs(dev, sgt->sgl, sgt->orig_nents, dir, attrs);
-	if (nents == 0)
-		return -EIO;
-	else if (nents < 0) {
+	if (nents < 0) {
 		if (WARN_ON_ONCE(nents != -EINVAL && nents != -ENOMEM &&
 				 nents != -EIO))
 			return -EIO;
-- 
2.20.1

