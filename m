Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EF43367AD8
	for <lists+linux-mips@lfdr.de>; Thu, 22 Apr 2021 09:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230324AbhDVHUV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 22 Apr 2021 03:20:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234920AbhDVHUT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 22 Apr 2021 03:20:19 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94C34C06138C
        for <linux-mips@vger.kernel.org>; Thu, 22 Apr 2021 00:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=dYyH/8K4Q8sCxeRfrx+sXZtnFZXl8dFeAAsbGjqR53E=; b=OYuuEeJvdRaOhc/KxZZh+gdgIc
        Pp/EPZXmB/fYLLqsRz/c0KwUZj/GOo1pdbdH6soycjs2KejEXIVJNZ7tQ+lf9O/LsH+jTFSSDOzZd
        t+gxtZRNuq7rxDeh6ySTt1AVSqrH2MQViV22MbxnRmy068+lzX+O0JLxqXQH/5IrHfRCI5qY6KpdA
        kaiQpAzWqDtiwzjkobuFUj9pclIHoEBzbD+b8LiqZ2sMabrUaOwnYHY7zIP1d8+0eoimCFxhiNNI9
        fJTUcQe8yUYVqIZp8UrHTvtUKr17zjKQySXJ4neE19YZy4WQ85r+8TPO/CfTvbmt0vZI1mUJDDUES
        tQclwPXQ==;
Received: from [2001:4bb8:19b:f845:15fc:cef6:715a:fb03] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lZTcd-00DRlK-3P; Thu, 22 Apr 2021 07:19:35 +0000
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
Subject: [PATCH 4/7] powerpc/pseries: simplify svm_swiotlb_init
Date:   Thu, 22 Apr 2021 09:19:18 +0200
Message-Id: <20210422071921.1428607-5-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210422071921.1428607-1-hch@lst.de>
References: <20210422071921.1428607-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The value returned by swiotlb_size_or_default is always properly
aligned now, so don't duplicate the work.

Signed-off-by: Christoph Hellwig <hch@lst.de>dddd
---
 arch/powerpc/platforms/pseries/svm.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/svm.c b/arch/powerpc/platforms/pseries/svm.c
index 4d281ff56ce96f..9187d2a1ed568d 100644
--- a/arch/powerpc/platforms/pseries/svm.c
+++ b/arch/powerpc/platforms/pseries/svm.c
@@ -43,20 +43,14 @@ machine_early_initcall(pseries, init_svm);
  */
 void __init svm_swiotlb_init(void)
 {
+	unsigned long bytes = swiotlb_size_or_default();
 	unsigned char *vstart;
-	unsigned long bytes, io_tlb_nslabs;
-
-	io_tlb_nslabs = (swiotlb_size_or_default() >> IO_TLB_SHIFT);
-	io_tlb_nslabs = ALIGN(io_tlb_nslabs, IO_TLB_SEGSIZE);
-
-	bytes = io_tlb_nslabs << IO_TLB_SHIFT;
 
 	vstart = memblock_alloc(PAGE_ALIGN(bytes), PAGE_SIZE);
 	if (vstart && !swiotlb_init_with_tbl(vstart, bytes, false))
 		return;
 
-	memblock_free_early(__pa(vstart),
-			    PAGE_ALIGN(io_tlb_nslabs << IO_TLB_SHIFT));
+	memblock_free_early(__pa(vstart), PAGE_ALIGN(bytes));
 	panic("SVM: Cannot allocate SWIOTLB buffer");
 }
 
-- 
2.30.1

