Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92A7A18F66
	for <lists+linux-mips@lfdr.de>; Thu,  9 May 2019 19:40:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbfEIRjl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 May 2019 13:39:41 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:59084 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726892AbfEIRji (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 May 2019 13:39:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=X0FjL3aO2ta2FtrLYrKKJDSOB+TS7uOhK8cSSGK92Po=; b=dg0Ik94KC7aLTSmZBv/TQo1F3m
        ROVzdjdVCdMqmOdYVDtJNKdQj4GMA8rZPkfoXoLuBfYbbCt6q1LYgzYGn+ExJDSUJVhpS7cS9+nme
        2oGZuR3O8smbZ3yU967o1U0E4tsQYOp1MqH+z6PiKT0khC1Mrvd7Fdhv6jTUdKbZtVMeo+ZwCNBjE
        s3lFeIa1IDYBxGgA1+p7OZd4aNvbRJ6+u+tg/yrXXFUUuAF+ie/2FMO9j/0al/OguuQdZ7W7a/d+p
        RavW6s1PoL5nDGzcozjvYrtwZ44Cn8MCBpOsnlqg7gY3Pg8p8N2xZzC5oAINq9FcnBITuUEpsz8hy
        rWe12bSw==;
Received: from 089144210233.atnat0019.highway.a1.net ([89.144.210.233] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hOn16-0005Kc-Nv; Thu, 09 May 2019 17:39:37 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Manuel Lauss <manuel.lauss@gmail.com>
Cc:     linux-mips@vger.kernel.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] au1200fb: fix DMA API abuse
Date:   Thu,  9 May 2019 19:38:48 +0200
Message-Id: <20190509173849.11825-3-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190509173849.11825-1-hch@lst.de>
References: <20190509173849.11825-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Virtual addresses return from dma(m)_alloc_attrs are opaque in what
backs then, and drivers must not poke into them.  Similarly caching
modes are not supposed to be directly set by the driver.  Switch the
driver to use the generic DMA API mmap helper to avoid these problems.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/video/fbdev/au1200fb.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/video/fbdev/au1200fb.c b/drivers/video/fbdev/au1200fb.c
index 3872ccef4cb2..26caffb02b7e 100644
--- a/drivers/video/fbdev/au1200fb.c
+++ b/drivers/video/fbdev/au1200fb.c
@@ -147,6 +147,7 @@ struct au1200_lcd_iodata_t {
 struct au1200fb_device {
 	struct fb_info *fb_info;		/* FB driver info record */
 	struct au1200fb_platdata *pd;
+	struct device *dev;
 
 	int					plane;
 	unsigned char* 		fb_mem;		/* FrameBuffer memory map */
@@ -1232,10 +1233,8 @@ static int au1200fb_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
 	struct au1200fb_device *fbdev = info->par;
 
-	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
-	pgprot_val(vma->vm_page_prot) |= _CACHE_MASK; /* CCA=7 */
-
-	return vm_iomap_memory(vma, fbdev->fb_phys, fbdev->fb_len);
+	return dma_mmap_attrs(fbdev->dev, vma, fbdev->fb_mem, fbdev->fb_phys,
+			fbdev->fb_len, DMA_ATTR_NON_CONSISTENT);
 }
 
 static void set_global(u_int cmd, struct au1200_lcd_global_regs_t *pdata)
@@ -1647,7 +1646,6 @@ static int au1200fb_drv_probe(struct platform_device *dev)
 	struct au1200fb_device *fbdev;
 	struct au1200fb_platdata *pd;
 	struct fb_info *fbi = NULL;
-	unsigned long page;
 	int bpp, plane, ret, irq;
 
 	print_info("" DRIVER_DESC "");
@@ -1685,6 +1683,7 @@ static int au1200fb_drv_probe(struct platform_device *dev)
 		fbdev = fbi->par;
 		fbdev->fb_info = fbi;
 		fbdev->pd = pd;
+		fbdev->dev = &dev->dev;
 
 		fbdev->plane = plane;
 
@@ -1702,16 +1701,6 @@ static int au1200fb_drv_probe(struct platform_device *dev)
 			goto failed;
 		}
 
-		/*
-		 * Set page reserved so that mmap will work. This is necessary
-		 * since we'll be remapping normal memory.
-		 */
-		for (page = (unsigned long)fbdev->fb_phys;
-		     page < PAGE_ALIGN((unsigned long)fbdev->fb_phys +
-			     fbdev->fb_len);
-		     page += PAGE_SIZE) {
-			SetPageReserved(pfn_to_page(page >> PAGE_SHIFT)); /* LCD DMA is NOT coherent on Au1200 */
-		}
 		print_dbg("Framebuffer memory map at %p", fbdev->fb_mem);
 		print_dbg("phys=0x%08x, size=%dK", fbdev->fb_phys, fbdev->fb_len / 1024);
 
-- 
2.20.1

