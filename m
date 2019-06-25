Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67E3C54E84
	for <lists+linux-mips@lfdr.de>; Tue, 25 Jun 2019 14:13:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbfFYMNb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 Jun 2019 08:13:31 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:54054 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726390AbfFYMNa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 25 Jun 2019 08:13:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=vchcZTzIkMEAWcb5HPtE7BlK4YNlIW5ENXBoS5wrV/4=; b=TxXJ+Mp3u2gUAb2112gcbzBxM
        zJGL2VNptBAIEd1GELNpXO/vwjXjAp3urpI3ipTt4n/dEPtkkXzeqNJi0pzDSI2mW2ffWGwBXLbOi
        QTwCkgjPiyFAVNG1GcKP+dKG1lkOjX5toNmUmdNMRmkNS++D4FXR5Y35S7BK9P/PFqV9hkSsln+UG
        toqL79GDrnds0w8WBbSAtMwP5Z9DVfsoaEeI7cZhqAhWbPzgLdkuUOlmQ+TA27EcF6xBxixlBZWnP
        EThDTj/9dI3wRHTFE1016qG4If2MWxtopvinuQatpNyMZ5vnh7SmJ8wXML9kUi0ijCYM/dtjCUyaM
        1AwpKvesA==;
Received: from srvnet-01-053.ikbnet.co.at ([83.175.70.53] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hfkKG-0008MR-NZ; Tue, 25 Jun 2019 12:13:29 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     Manuel Lauss <manuel.lauss@gmail.com>, linux-mips@vger.kernel.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] au1200fb: don't use DMA_ATTR_NON_CONSISTENT
Date:   Tue, 25 Jun 2019 14:13:21 +0200
Message-Id: <20190625121321.10197-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

au1200fb allocates DMA memory using DMA_ATTR_NON_CONSISTENT, but never
calls dma_cache_sync to synchronize the memory between the CPU and the
device.  If it was use on a not cache coherent bus that would be fatal,
but as far as I can tell from the naming and the mips platform
implementation it always is used in cache coherent systems.  Remove
the DMA_ATTR_NON_CONSISTENT flag, which is a no-op in that case.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/video/fbdev/au1200fb.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/au1200fb.c b/drivers/video/fbdev/au1200fb.c
index 26caffb02b7e..265d3b45efd0 100644
--- a/drivers/video/fbdev/au1200fb.c
+++ b/drivers/video/fbdev/au1200fb.c
@@ -1234,7 +1234,7 @@ static int au1200fb_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 	struct au1200fb_device *fbdev = info->par;
 
 	return dma_mmap_attrs(fbdev->dev, vma, fbdev->fb_mem, fbdev->fb_phys,
-			fbdev->fb_len, DMA_ATTR_NON_CONSISTENT);
+			fbdev->fb_len, 0);
 }
 
 static void set_global(u_int cmd, struct au1200_lcd_global_regs_t *pdata)
@@ -1692,8 +1692,7 @@ static int au1200fb_drv_probe(struct platform_device *dev)
 
 		fbdev->fb_mem = dmam_alloc_attrs(&dev->dev,
 				PAGE_ALIGN(fbdev->fb_len),
-				&fbdev->fb_phys, GFP_KERNEL,
-				DMA_ATTR_NON_CONSISTENT);
+				&fbdev->fb_phys, GFP_KERNEL, 0);
 		if (!fbdev->fb_mem) {
 			print_err("fail to allocate framebuffer (size: %dK))",
 				  fbdev->fb_len / 1024);
-- 
2.20.1

