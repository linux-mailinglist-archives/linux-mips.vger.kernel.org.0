Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1742A18F61
	for <lists+linux-mips@lfdr.de>; Thu,  9 May 2019 19:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726787AbfEIRjg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 May 2019 13:39:36 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:59074 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbfEIRjf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 May 2019 13:39:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Zh+SE7SPz23Ox2vKTKGMxIaCp2/ny0ISAkGrrJwXZK4=; b=WeT/W1ulWZ47DBVh93Jw6mADBB
        ReR4tx89c06k+f+fgfwNLSafBfWwz7gB6PCu78hmGrawmkfcxSNAzx/W7nv5ufZGAAPbhTJglvVrQ
        rACri3Pejn2PQnUB2lQcZ798IPa7LhjVlC54l0qqx3zabLLYnttY850qFRZpLRt+UVndSfmf805PO
        SKEkWqnOp/PsrqaUhba/EkaEOK1pUSycmQ+DA3xJSOO1ZturZWKBZsJDkxoSIZ2zdiA+9wBQfvp54
        L43RRnodwUlolioQJFOo9btaVPKmqXUJimLcJFNXF3GgVDVGljESr5aWvSpsPeY3yI60VuATKQcIN
        gUOcWPug==;
Received: from 089144210233.atnat0019.highway.a1.net ([89.144.210.233] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hOn14-0005KS-0K; Thu, 09 May 2019 17:39:34 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Manuel Lauss <manuel.lauss@gmail.com>
Cc:     linux-mips@vger.kernel.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] au1100fb: fix DMA API abuse
Date:   Thu,  9 May 2019 19:38:47 +0200
Message-Id: <20190509173849.11825-2-hch@lst.de>
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

Virtual addresses return from dma(m)_alloc_coherent are opaque in what
backs then, and drivers must not poke into them.  Switch the driver
to use the generic DMA API mmap helper to avoid these problems.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/video/fbdev/au1100fb.c | 24 ++++--------------------
 drivers/video/fbdev/au1100fb.h |  1 +
 2 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100fb.c
index 0adf0683cf08..99941ae1f3a1 100644
--- a/drivers/video/fbdev/au1100fb.c
+++ b/drivers/video/fbdev/au1100fb.c
@@ -340,14 +340,12 @@ int au1100fb_fb_pan_display(struct fb_var_screeninfo *var, struct fb_info *fbi)
  */
 int au1100fb_fb_mmap(struct fb_info *fbi, struct vm_area_struct *vma)
 {
-	struct au1100fb_device *fbdev;
-
-	fbdev = to_au1100fb_device(fbi);
+	struct au1100fb_device *fbdev = to_au1100fb_device(fbi);
 
-	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
 	pgprot_val(vma->vm_page_prot) |= (6 << 9); //CCA=6
 
-	return vm_iomap_memory(vma, fbdev->fb_phys, fbdev->fb_len);
+	return dma_mmap_coherent(fbdev->dev, vma, fbdev->fb_mem, fbdev->fb_phys,
+			fbdev->fb_len);
 }
 
 static struct fb_ops au1100fb_ops =
@@ -412,7 +410,6 @@ static int au1100fb_drv_probe(struct platform_device *dev)
 {
 	struct au1100fb_device *fbdev;
 	struct resource *regs_res;
-	unsigned long page;
 	struct clk *c;
 
 	/* Allocate new device private */
@@ -424,6 +421,7 @@ static int au1100fb_drv_probe(struct platform_device *dev)
 		goto failed;
 
 	platform_set_drvdata(dev, (void *)fbdev);
+	fbdev->dev = &dev->dev;
 
 	/* Allocate region for our registers and map them */
 	regs_res = platform_get_resource(dev, IORESOURCE_MEM, 0);
@@ -472,20 +470,6 @@ static int au1100fb_drv_probe(struct platform_device *dev)
 	au1100fb_fix.smem_start = fbdev->fb_phys;
 	au1100fb_fix.smem_len = fbdev->fb_len;
 
-	/*
-	 * Set page reserved so that mmap will work. This is necessary
-	 * since we'll be remapping normal memory.
-	 */
-	for (page = (unsigned long)fbdev->fb_mem;
-	     page < PAGE_ALIGN((unsigned long)fbdev->fb_mem + fbdev->fb_len);
-	     page += PAGE_SIZE) {
-#ifdef CONFIG_DMA_NONCOHERENT
-		SetPageReserved(virt_to_page(CAC_ADDR((void *)page)));
-#else
-		SetPageReserved(virt_to_page(page));
-#endif
-	}
-
 	print_dbg("Framebuffer memory map at %p", fbdev->fb_mem);
 	print_dbg("phys=0x%08x, size=%dK", fbdev->fb_phys, fbdev->fb_len / 1024);
 
diff --git a/drivers/video/fbdev/au1100fb.h b/drivers/video/fbdev/au1100fb.h
index 9af19939a9c6..e7239bceefd3 100644
--- a/drivers/video/fbdev/au1100fb.h
+++ b/drivers/video/fbdev/au1100fb.h
@@ -110,6 +110,7 @@ struct au1100fb_device {
 	dma_addr_t    		fb_phys;
 	int			panel_idx;
 	struct clk		*lcdclk;
+	struct device		*dev;
 };
 
 /********************************************************************/
-- 
2.20.1

