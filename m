Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8B26367ADA
	for <lists+linux-mips@lfdr.de>; Thu, 22 Apr 2021 09:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234920AbhDVHUV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 22 Apr 2021 03:20:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234965AbhDVHUT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 22 Apr 2021 03:20:19 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AFF5C06138D
        for <linux-mips@vger.kernel.org>; Thu, 22 Apr 2021 00:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=ocKi+a7wA4qY8frBZ78pjJ0PvLqvNZlAHfEVjthKdOw=; b=rIas4ugj56r8ElM/bnchDokS2d
        mFY5g6FAgdaRMzZSuL6wueVstVK+INGvP9FcnGBJPEx2Wz/58EaILo4Vd3JtUgnDVm/Pe5jfEeMy+
        n1VLxAk7vCdLqB8GfXBHw9YNAOymqr2nOEIbCxLsqNEW12sxs1g+x22cc7mXLNMHbK2P7p/bVy5y/
        c0zYvlu8JhJ3C/qoUFlucMevgR+R0jg8QXQFG8p0uUfNsqp2ASnwLBv6GoVWDdt1t35j5sTsNuElg
        0QI/6vvUiKqAIdYUzgDbJn4cHtdqkXpBlqYT9+i7m+45G4wwGBZTefduoz+81IYCwYckzOSCKXnEM
        Z5BkkTkQ==;
Received: from [2001:4bb8:19b:f845:15fc:cef6:715a:fb03] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lZTcX-00DRko-OO; Thu, 22 Apr 2021 07:19:30 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc:     Tom Lendacky <thomas.lendacky@amd.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org
Subject: [PATCH 2/7] swiotlb: use swiotlb_size_or_default in swiotlb_init
Date:   Thu, 22 Apr 2021 09:19:16 +0200
Message-Id: <20210422071921.1428607-3-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210422071921.1428607-1-hch@lst.de>
References: <20210422071921.1428607-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use swiotlb_size_or_default to calculate the buffer size insted of
open coding it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/swiotlb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index c7b3dd86db7f56..27461fd63e0330 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -209,7 +209,7 @@ int __init swiotlb_init_with_tbl(char *tlb, size_t bytes, int verbose)
 void  __init
 swiotlb_init(int verbose)
 {
-	size_t bytes = default_nslabs << IO_TLB_SHIFT;
+	size_t bytes = swiotlb_size_or_default();
 	void *tlb;
 
 	if (swiotlb_force == SWIOTLB_NO_FORCE)
-- 
2.30.1

