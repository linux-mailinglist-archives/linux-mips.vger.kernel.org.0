Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09E02F502
	for <lists+linux-mips@lfdr.de>; Tue, 30 Apr 2019 13:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727589AbfD3LBR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Apr 2019 07:01:17 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:43212 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727552AbfD3LBQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 30 Apr 2019 07:01:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=PLS+osiMtzH1FJ/aM7uyPFKiVBY7BzXRbfElifCKyyE=; b=GN+Uh9+b25iaMg6GFZU3a2iKdY
        S+lgEpIziAlfBj3OEPubaQtiErkISqk2C56GDXjM2pKSQOqunuoLCEfgk0qKrm47UL8h4ri0YlzqJ
        A0SFQqL+GEPp+SpmQnb5cfURRx3FN/mrS+18Stz+7LMpu0Spp8HbjwHc4FloYI/L8Yidwxt1DdD5D
        yhF3VsRSGIKs5QEkODudorExHNXjJVpXSOKmFCAjGK8yhhBpXPfR0spZ6w8YjxZWy6Z7lHeBzwEG0
        gUYV2N5BxeYsSauC4c6mzU8U9HqFberKfFSgetfEaRpwle/VS6nfvSLTRqStCNSp3k6VNyTU4nHjO
        10eSQ8aQ==;
Received: from adsl-173-228-226-134.prtc.net ([173.228.226.134] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hLQVd-0000Gk-G3; Tue, 30 Apr 2019 11:01:13 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Ley Foon Tan <lftan@altera.com>,
        Michal Simek <monstr@monstr.eu>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     linux-mips@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: [PATCH 2/7] au1100fb: fix DMA API abuse
Date:   Tue, 30 Apr 2019 07:00:27 -0400
Message-Id: <20190430110032.25301-3-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190430110032.25301-1-hch@lst.de>
References: <20190430110032.25301-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Virtual addresses return from dma(m)_alloc_coherent are opaque in what
backs then, and drivers must not poke into them.  Switch the driver
to use the generic DMA API mmap helper to avoid these games.

Signed-off-by: Christoph Hellwig <hch@lst.de>
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

