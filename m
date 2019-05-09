Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AC3518F64
	for <lists+linux-mips@lfdr.de>; Thu,  9 May 2019 19:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbfEIRjl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 May 2019 13:39:41 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:59102 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726899AbfEIRjl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 9 May 2019 13:39:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ze3bI7R/AWInMMM2JlDlT8P7z6aa7ltggLIal7qS1fs=; b=WKveJiy42tZa3XL3xEuRZRY2+Y
        /wFrD9wGXNbRmW3FI4knn62zQ0lsa6/yA554tTuDxACiFGD8H04SFguP6SpPJJUTsC9tPHHKZLDUZ
        dcrqukr1oW1BbrODPMEMDZ0F99786dV4u+ip4Mdgdg84PgQVUN5dJ4JJFag0QCQkBNkHjjgRFZnNI
        YzHQgyhXf0ADhDO3gkNf3dFevriC+kuga/MwMBKDLxfOO4Iewqh3AVidMqdnS4JTJUoM4rtwpzh8M
        rqzmN7vQta8y7T0YPLC/1YsWg8+sUCJgTNSr5V6Rn8UQBbQt/z2KZpcPGJehPUrW5SZtJ4cAKqFm7
        TwsCOg/A==;
Received: from 089144210233.atnat0019.highway.a1.net ([89.144.210.233] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hOn19-0005Lf-Nm; Thu, 09 May 2019 17:39:40 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Manuel Lauss <manuel.lauss@gmail.com>
Cc:     linux-mips@vger.kernel.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] jz4740_fb: fix DMA API abuse
Date:   Thu,  9 May 2019 19:38:49 +0200
Message-Id: <20190509173849.11825-4-hch@lst.de>
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
---
 drivers/video/fbdev/jz4740_fb.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/video/fbdev/jz4740_fb.c b/drivers/video/fbdev/jz4740_fb.c
index b57df83fdbd3..b95cdfa9e0a1 100644
--- a/drivers/video/fbdev/jz4740_fb.c
+++ b/drivers/video/fbdev/jz4740_fb.c
@@ -466,7 +466,6 @@ static int jzfb_alloc_devmem(struct jzfb *jzfb)
 {
 	int max_videosize = 0;
 	struct fb_videomode *mode = jzfb->pdata->modes;
-	void *page;
 	int i;
 
 	for (i = 0; i < jzfb->pdata->num_modes; ++mode, ++i) {
@@ -491,12 +490,6 @@ static int jzfb_alloc_devmem(struct jzfb *jzfb)
 	if (!jzfb->vidmem)
 		goto err_free_framedesc;
 
-	for (page = jzfb->vidmem;
-		 page < jzfb->vidmem + PAGE_ALIGN(jzfb->vidmem_size);
-		 page += PAGE_SIZE) {
-		SetPageReserved(virt_to_page(page));
-	}
-
 	jzfb->framedesc->next = jzfb->framedesc_phys;
 	jzfb->framedesc->addr = jzfb->vidmem_phys;
 	jzfb->framedesc->id = 0xdeafbead;
-- 
2.20.1

