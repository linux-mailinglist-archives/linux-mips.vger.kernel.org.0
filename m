Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D30AF2615A7
	for <lists+linux-mips@lfdr.de>; Tue,  8 Sep 2020 18:54:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731989AbgIHQyS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Sep 2020 12:54:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731946AbgIHQsR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Sep 2020 12:48:17 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AEE4C061756;
        Tue,  8 Sep 2020 09:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=fgyJ4ZABWJZTj7EJc7LH/kSnQv89OxFbc7jSvV77U8I=; b=oFmX/3NSSOEZg6Vq7bQMcIBLUk
        JWXlC6td7jF2tESzThvQo06B/CWB4gLSJFO1NLu2AzaaJqTYZxJod3allRVzjZg4SAH0SCSMwp848
        k9OWRr6hR2F7La4bbgnTPiCDAglGjzDzt7eJNYX5AEoZxS3aEcZbkkpX7q08ykyc5/YiVeivQYBY+
        /Za4hFEcsoyTiP3Mt/TZ34Yxycs9q0b+K1WWimLplRJxvnG7c0pvdsLtvF4kFosPMUiDUDLCc+nAX
        BDEJlUpYmKIXCHeHxxnUJW2saEFjAhGWPaqucs9SfLKyCdH6BFAk7GIW0YSE9LDZB9jDhoup3Ahi3
        558Ztg1w==;
Received: from [2001:4bb8:184:af1:3dc3:9c83:fc6c:e0f] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kFgmv-0001Sv-2X; Tue, 08 Sep 2020 16:48:10 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Tony Luck <tony.luck@intel.com>, Fenghua Yu <fenghua.yu@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        iommu@lists.linux-foundation.org
Cc:     Tomasz Figa <tfiga@chromium.org>, Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: [PATCH 08/12] dma-direct: use phys_to_dma_direct in dma_direct_alloc
Date:   Tue,  8 Sep 2020 18:47:54 +0200
Message-Id: <20200908164758.3177341-9-hch@lst.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200908164758.3177341-1-hch@lst.de>
References: <20200908164758.3177341-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Replace the currently open code copy.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/direct.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 12e9f5f75dfe4b..57a6e7d7cf8f16 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -240,10 +240,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 			goto out_encrypt_pages;
 	}
 done:
-	if (force_dma_unencrypted(dev))
-		*dma_handle = __phys_to_dma(dev, page_to_phys(page));
-	else
-		*dma_handle = phys_to_dma(dev, page_to_phys(page));
+	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page));
 	return ret;
 
 out_encrypt_pages:
-- 
2.28.0

