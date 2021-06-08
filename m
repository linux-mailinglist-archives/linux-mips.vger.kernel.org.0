Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7803439FBDE
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jun 2021 18:08:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232948AbhFHQJX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Jun 2021 12:09:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232773AbhFHQIj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Jun 2021 12:08:39 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22ADBC0613A2;
        Tue,  8 Jun 2021 09:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=VJNoOLPDvc5xu3y+i4aVzvsoJRnShX/8Sf+3m5K1BjA=; b=Ay8U/aM3HgzodlZNkVKqaH3JIW
        rTwNhHqPm4zx8CrV68VSyfJaD7NErjIc2oUzYjkIs9qH60mq/BMnxp8EJN08iqshI7VrR+0XMZYxK
        r6n+rW/nWhgNySp15k9UwrXPl6aulxl+1L0jo3+aqxnDVEzscCAdONz+1Xn3H/SVlehWIVCdTgVFm
        W/wh2A4yjifNnmEp5RBmlG+9cTsdu215NSyXUNM8FKf4MEG475xZLKjwhsC3M1jw5A3iT5qMR2ri4
        S/cNoGCUcy6Or054gHSx3OYG4BrmEYkDMfB+2hpC1o17HO8siwvUNYNhF85F5E0B0XNl1UnBV0BOx
        RtiOva8A==;
Received: from [2001:4bb8:192:ff5f:74ed:7c4f:a5ee:8dcb] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1lqeFN-009Rfa-Dj; Tue, 08 Jun 2021 16:06:34 +0000
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
Subject: [PATCH 08/16] dm-writecache: use bvec_kmap_local instead of bvec_kmap_irq
Date:   Tue,  8 Jun 2021 18:05:55 +0200
Message-Id: <20210608160603.1535935-9-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210608160603.1535935-1-hch@lst.de>
References: <20210608160603.1535935-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There is no need to disable interrupts in bio_copy_block, and the local
only mappings helps to avoid any sort of problems with stray writes
into the bio data.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/dm-writecache.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
index aecc246ade26..93ca454eaca9 100644
--- a/drivers/md/dm-writecache.c
+++ b/drivers/md/dm-writecache.c
@@ -1205,14 +1205,13 @@ static void memcpy_flushcache_optimized(void *dest, void *source, size_t size)
 static void bio_copy_block(struct dm_writecache *wc, struct bio *bio, void *data)
 {
 	void *buf;
-	unsigned long flags;
 	unsigned size;
 	int rw = bio_data_dir(bio);
 	unsigned remaining_size = wc->block_size;
 
 	do {
 		struct bio_vec bv = bio_iter_iovec(bio, bio->bi_iter);
-		buf = bvec_kmap_irq(&bv, &flags);
+		buf = bvec_kmap_local(&bv);
 		size = bv.bv_len;
 		if (unlikely(size > remaining_size))
 			size = remaining_size;
@@ -1230,7 +1229,7 @@ static void bio_copy_block(struct dm_writecache *wc, struct bio *bio, void *data
 			memcpy_flushcache_optimized(data, buf, size);
 		}
 
-		bvec_kunmap_irq(buf, &flags);
+		kunmap_local(buf);
 
 		data = (char *)data + size;
 		remaining_size -= size;
-- 
2.30.2

