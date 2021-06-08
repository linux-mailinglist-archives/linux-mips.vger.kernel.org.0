Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B9A339FBE8
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jun 2021 18:08:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233684AbhFHQJa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Jun 2021 12:09:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbhFHQIv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Jun 2021 12:08:51 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F130DC061574;
        Tue,  8 Jun 2021 09:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=6el1Xjjuiwoh8C5GaeWua1PePuQ0zzIn1YY3WglnD2c=; b=TR8lLAOIS9zH3xVLWrYC1kGQrQ
        ROk7bhb2bZD5SH4f4/jWv+orQvUCu6O+IRXa+J1jUD/m3jLMXUaQRfWEpokNpQbnjhRiIwrZHPhX6
        mqTDg9EtUknw9+BRv3LMGaqTsoxZhj6anyleI8mez0H3rWdl6zeyQDKehV8SibcXYZxQqh1dJ45aP
        UrqbSNBFeSgMNn0L6wpo2G+b2mh2BiPBZpG7hA/S6gnshZkSIGD2I8luNyDg08Lb/CIZKzo9Cj3Uv
        twQB+yNrgflXuc4Ljp/nn/sL7L63WlwyhGpoeS7NAtisM+UES6NDhs5DFfhoHGgpwUw38okU/c+L4
        KtOKoViA==;
Received: from [2001:4bb8:192:ff5f:74ed:7c4f:a5ee:8dcb] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1lqeFa-009RjP-Qy; Tue, 08 Jun 2021 16:06:47 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Geoff Levand <geoff@infradead.org>,
        Ilya Dryomov <idryomov@gmail.com>,
        Dongsheng Yang <dongsheng.yang@easystack.cn>,
        Mike Snitzer <snitzer@redhat.com>,
        Ira Weiny <ira.weiny@intel.com>, dm-devel@redhat.com,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-block@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        ceph-devel@vger.kernel.org
Subject: [PATCH 12/16] block: use memcpy_to_bvec in copy_to_high_bio_irq
Date:   Tue,  8 Jun 2021 18:05:59 +0200
Message-Id: <20210608160603.1535935-13-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210608160603.1535935-1-hch@lst.de>
References: <20210608160603.1535935-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use memcpy_to_bvec instead of opencoding the logic.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/bounce.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/block/bounce.c b/block/bounce.c
index 94081e013c58..a2fc6326b6c9 100644
--- a/block/bounce.c
+++ b/block/bounce.c
@@ -67,18 +67,6 @@ static __init int init_emergency_pool(void)
 
 __initcall(init_emergency_pool);
 
-/*
- * highmem version, map in to vec
- */
-static void bounce_copy_vec(struct bio_vec *to, unsigned char *vfrom)
-{
-	unsigned char *vto;
-
-	vto = kmap_atomic(to->bv_page);
-	memcpy(vto + to->bv_offset, vfrom, to->bv_len);
-	kunmap_atomic(vto);
-}
-
 /*
  * Simple bounce buffer support for highmem pages. Depending on the
  * queue gfp mask set, *to may or may not be a highmem page. kmap it
@@ -107,7 +95,7 @@ static void copy_to_high_bio_irq(struct bio *to, struct bio *from)
 			vfrom = page_address(fromvec.bv_page) +
 				tovec.bv_offset;
 
-			bounce_copy_vec(&tovec, vfrom);
+			memcpy_to_bvec(&tovec, vfrom);
 			flush_dcache_page(tovec.bv_page);
 		}
 		bio_advance_iter(from, &from_iter, tovec.bv_len);
-- 
2.30.2

