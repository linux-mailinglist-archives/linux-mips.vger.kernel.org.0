Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E174A367ADE
	for <lists+linux-mips@lfdr.de>; Thu, 22 Apr 2021 09:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235020AbhDVHUY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 22 Apr 2021 03:20:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235002AbhDVHUY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 22 Apr 2021 03:20:24 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32805C06174A
        for <linux-mips@vger.kernel.org>; Thu, 22 Apr 2021 00:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=uecr72uR4S7RBlQH3PaVDyORw5/pv2frUuL1UFgzCPE=; b=nhiKI19LhclhWHaCMD71/Cry2I
        ad6ySo/VVhMQiMubBTbcXCyyZlDNjzYbPA+tZk8BiT5hw3n0w6mKDxom0sj0rvkAgg0i1yyn8o7oo
        1WIEdVXIC6LTk0UxAy1ehak/xKXq6XQPbaGVDUPwPborS1UiEulB3qS7UESlVagzJt4QCZaO9CtEI
        fcQs+SXYcRWhy5a8sDZTyC08Ri/E79nWiQSVrG4ZiR8v9uKg/DTl1oamETbfl6gUflJKqvh2ddxOi
        BdTobsRp+kpB65cIWtJVMzOi3UY9DmsWvx7DOMlmgKmk3irvAqkEQdojJ/k//Qspi8SEXYbVYNPNh
        pTGVPpvQ==;
Received: from [2001:4bb8:19b:f845:15fc:cef6:715a:fb03] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lZTck-00DRlu-Sv; Thu, 22 Apr 2021 07:19:43 +0000
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
Subject: [PATCH 7/7] swiotlb: don't override the command line in swiotlb_adjust_size
Date:   Thu, 22 Apr 2021 09:19:21 +0200
Message-Id: <20210422071921.1428607-8-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210422071921.1428607-1-hch@lst.de>
References: <20210422071921.1428607-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When the user specified an explicit swiotlb size on the command line,
the achitecture code should not override it.

Fixes: 2cbc2776efe4 ("swiotlb: remove swiotlb_nr_tbl")
Reported-by: Tom Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/swiotlb.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 87d06ddf4753f3..aef02a3825b494 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -106,7 +106,9 @@ void swiotlb_set_max_segment(unsigned int val)
 
 unsigned long swiotlb_size_or_default(void)
 {
-	return swiotlb_default_size;
+	if (swiotlb_default_size)
+		return swiotlb_default_size;
+	return IO_TLB_DEFAULT_SIZE;
 }
 
 void __init swiotlb_adjust_size(unsigned long size)
@@ -116,6 +118,8 @@ void __init swiotlb_adjust_size(unsigned long size)
 	 * architectures such as those supporting memory encryption to
 	 * adjust/expand SWIOTLB size for their use.
 	 */
+	if (swiotlb_default_size)
+		return;
 	swiotlb_default_size = ALIGN(size, IO_TLB_SEGSIZE << IO_TLB_SHIFT);
 	pr_info("SWIOTLB bounce buffer size adjusted to %luMB",
 		swiotlb_default_size >> 20);
-- 
2.30.1

