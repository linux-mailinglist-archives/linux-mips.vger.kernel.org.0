Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DBF139FBE3
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jun 2021 18:08:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233422AbhFHQJZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Jun 2021 12:09:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232800AbhFHQIk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Jun 2021 12:08:40 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAF11C061787;
        Tue,  8 Jun 2021 09:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=HwW7/FcNSPjoRVBBgiBQclHiHBGFA68ApXQNMgI7IuU=; b=ZySEe4D5FHucQqfuf1IfwHVuKW
        WEHowatN5Tz2b3Z9grV/ImybjMv//WEMk+nNaqsU/kHB1CkTwBz9uwV6tqL+NLTC16eFXX4KUjdlm
        KNe+VlkXw296qZipYK9wua0s0mArIUMI5dTf7VnXNQACY7jfkA0ecBfVzsyPgispTyntJziaW50av
        bxo55suRvkOWzp3BY6bVQf82DwObcQ9EC8uIvE37Y8razpBbm9ai7HDfedZaZTWb5CjY0Y0uFMxvS
        xqYCerXgjUgMWiaesg9WqaPvdlFa/PXNUX/k+E9vjO/L20OtCWESv7G+isYWlB5y2kI5cj2BK3k6N
        RoH6CpdA==;
Received: from [2001:4bb8:192:ff5f:74ed:7c4f:a5ee:8dcb] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1lqeFQ-009Rge-Pv; Tue, 08 Jun 2021 16:06:37 +0000
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
Subject: [PATCH 09/16] ps3disk: use memcpy_{from,to}_bvec
Date:   Tue,  8 Jun 2021 18:05:56 +0200
Message-Id: <20210608160603.1535935-10-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210608160603.1535935-1-hch@lst.de>
References: <20210608160603.1535935-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use the bvec helpers instead of open coding the copy.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/ps3disk.c | 19 +++----------------
 1 file changed, 3 insertions(+), 16 deletions(-)

diff --git a/drivers/block/ps3disk.c b/drivers/block/ps3disk.c
index ba3ece56cbb3..f2eb0225814f 100644
--- a/drivers/block/ps3disk.c
+++ b/drivers/block/ps3disk.c
@@ -84,26 +84,13 @@ static void ps3disk_scatter_gather(struct ps3_storage_device *dev,
 	unsigned int offset = 0;
 	struct req_iterator iter;
 	struct bio_vec bvec;
-	unsigned int i = 0;
-	size_t size;
-	void *buf;
 
 	rq_for_each_segment(bvec, req, iter) {
-		unsigned long flags;
-		dev_dbg(&dev->sbd.core, "%s:%u: bio %u: %u sectors from %llu\n",
-			__func__, __LINE__, i, bio_sectors(iter.bio),
-			iter.bio->bi_iter.bi_sector);
-
-		size = bvec.bv_len;
-		buf = bvec_kmap_irq(&bvec, &flags);
 		if (gather)
-			memcpy(dev->bounce_buf+offset, buf, size);
+			memcpy_from_bvec(dev->bounce_buf + offset, &bvec);
 		else
-			memcpy(buf, dev->bounce_buf+offset, size);
-		offset += size;
-		flush_kernel_dcache_page(bvec.bv_page);
-		bvec_kunmap_irq(buf, &flags);
-		i++;
+			memcpy_to_bvec(&bvec, dev->bounce_buf + offset);
+		offset += bvec.bv_len;
 	}
 }
 
-- 
2.30.2

