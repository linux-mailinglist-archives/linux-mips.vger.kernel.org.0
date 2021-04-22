Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CCC9367ADF
	for <lists+linux-mips@lfdr.de>; Thu, 22 Apr 2021 09:20:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234992AbhDVHU0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 22 Apr 2021 03:20:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234965AbhDVHUZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 22 Apr 2021 03:20:25 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7D60C06174A
        for <linux-mips@vger.kernel.org>; Thu, 22 Apr 2021 00:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=IEVkrkm3MuKaNKcyW8a+DG4O3GXVaGagie2/ONcqlhY=; b=anmjfDz2al0zGRuceriPKIfAtn
        2r5xN/fPvoh9RqCq8f2NgLc28anKl85DQp79zJxmlgMjrkAnWT9K6kWFfWdFfa+/oaUraoNrx3EK7
        Cj1NfF+BsAFyNN5ph+FqgH3P21AXa37gyZz30XWgEDpt7OyTdni3oF/OXOL2GxIlSHK6QlH9F8lXj
        oV/bsNdU9LdBrsaiEIvtR7snQd2qNegyfbIbJA40BDORsEqgSmk4odm8REfk7daCNYinPEfg7qB2T
        I6PzWdLRK3qjS5KE+f7VAlXQTos9C/2Z9rykR9kzQr/7cas/V3Ex7wBiKH/DQZu8dTJdpPwX8l/Ki
        812AaC/A==;
Received: from [2001:4bb8:19b:f845:15fc:cef6:715a:fb03] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lZTci-00DRlk-9r; Thu, 22 Apr 2021 07:19:40 +0000
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
Subject: [PATCH 6/7] swiotlb: replace default_nslabs with a byte value
Date:   Thu, 22 Apr 2021 09:19:20 +0200
Message-Id: <20210422071921.1428607-7-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210422071921.1428607-1-hch@lst.de>
References: <20210422071921.1428607-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Replace the default_nslabs variable with one that stores the size in
bytes as that is what all the users actually expect.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/swiotlb.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 93737d0932fbf2..87d06ddf4753f3 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -71,7 +71,7 @@ struct io_tlb_mem *io_tlb_default_mem;
  */
 static unsigned int max_segment;
 
-static unsigned long default_nslabs = IO_TLB_DEFAULT_SIZE >> IO_TLB_SHIFT;
+static unsigned long swiotlb_default_size = IO_TLB_DEFAULT_SIZE;
 
 static int __init
 setup_io_tlb_npages(char *str)
@@ -106,7 +106,7 @@ void swiotlb_set_max_segment(unsigned int val)
 
 unsigned long swiotlb_size_or_default(void)
 {
-	return default_nslabs << IO_TLB_SHIFT;
+	return swiotlb_default_size;
 }
 
 void __init swiotlb_adjust_size(unsigned long size)
@@ -116,9 +116,9 @@ void __init swiotlb_adjust_size(unsigned long size)
 	 * architectures such as those supporting memory encryption to
 	 * adjust/expand SWIOTLB size for their use.
 	 */
-	size = ALIGN(size, IO_TLB_SIZE);
-	default_nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
-	pr_info("SWIOTLB bounce buffer size adjusted to %luMB", size >> 20);
+	swiotlb_default_size = ALIGN(size, IO_TLB_SEGSIZE << IO_TLB_SHIFT);
+	pr_info("SWIOTLB bounce buffer size adjusted to %luMB",
+		swiotlb_default_size >> 20);
 }
 
 void swiotlb_print_info(void)
-- 
2.30.1

