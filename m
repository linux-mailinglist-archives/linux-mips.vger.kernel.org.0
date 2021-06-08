Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAF8439FBD3
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jun 2021 18:08:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233081AbhFHQIr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Jun 2021 12:08:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233168AbhFHQIe (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Jun 2021 12:08:34 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7346C061574;
        Tue,  8 Jun 2021 09:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=/XS4Id3E1gYfbkc3NHcCC3rQFr5wtYJWpAMcKY+DpCM=; b=Uk954MLZwlNWd0DBj1xd6raQnh
        Uw48hj+wZry3hGYe6TYWXUR/39nqTqZzEoP6cc17w7Y1G8bMzCG+0LblPw2njd6n0BJO3RWVwriJj
        5ef8TWTx3URm6q037NrMHdXmHDHDnDBePZZppCfGlhZlijusYeofqZ8X35mt90FQOjmAbA0Z3YP3i
        Jw0UZ7zC/tw9DtI6VJkoAJSYdYQwH/dS4a1DACipCh033JCA52CBKtVxoM8h9/s5A8/JdzdPJr07G
        +YWPm1FnMCmEuJralo+r97PRe+DK3GfdtKQyzp6QSJgvPaxuZoyySzwIFSs1myl+U4/k1HeZq7ppf
        1YpmaZGw==;
Received: from [2001:4bb8:192:ff5f:74ed:7c4f:a5ee:8dcb] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1lqeFK-009ReP-7t; Tue, 08 Jun 2021 16:06:30 +0000
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
Subject: [PATCH 07/16] rbd: use memzero_bvec
Date:   Tue,  8 Jun 2021 18:05:54 +0200
Message-Id: <20210608160603.1535935-8-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210608160603.1535935-1-hch@lst.de>
References: <20210608160603.1535935-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use memzero_bvec instead of reimplementing it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/rbd.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/block/rbd.c b/drivers/block/rbd.c
index bbb88eb009e0..eb243fc4d108 100644
--- a/drivers/block/rbd.c
+++ b/drivers/block/rbd.c
@@ -1219,24 +1219,13 @@ static void rbd_dev_mapping_clear(struct rbd_device *rbd_dev)
 	rbd_dev->mapping.size = 0;
 }
 
-static void zero_bvec(struct bio_vec *bv)
-{
-	void *buf;
-	unsigned long flags;
-
-	buf = bvec_kmap_irq(bv, &flags);
-	memset(buf, 0, bv->bv_len);
-	flush_dcache_page(bv->bv_page);
-	bvec_kunmap_irq(buf, &flags);
-}
-
 static void zero_bios(struct ceph_bio_iter *bio_pos, u32 off, u32 bytes)
 {
 	struct ceph_bio_iter it = *bio_pos;
 
 	ceph_bio_iter_advance(&it, off);
 	ceph_bio_iter_advance_step(&it, bytes, ({
-		zero_bvec(&bv);
+		memzero_bvec(&bv);
 	}));
 }
 
@@ -1246,7 +1235,7 @@ static void zero_bvecs(struct ceph_bvec_iter *bvec_pos, u32 off, u32 bytes)
 
 	ceph_bvec_iter_advance(&it, off);
 	ceph_bvec_iter_advance_step(&it, bytes, ({
-		zero_bvec(&bv);
+		memzero_bvec(&bv);
 	}));
 }
 
-- 
2.30.2

