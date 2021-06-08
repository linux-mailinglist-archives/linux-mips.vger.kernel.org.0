Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41A9339FBF4
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jun 2021 18:08:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233871AbhFHQKS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Jun 2021 12:10:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233868AbhFHQJE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Jun 2021 12:09:04 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D410C061283;
        Tue,  8 Jun 2021 09:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=HbWeEgqptxjWNK7W80q76MsDEy7Zz/e6+B7EWMBgV8Y=; b=0nS2fsMtKYvfSlgh29sC//dKZs
        2CPkEeC+4D9KSJM/UG68fYgeWCVzS3LIfSfKE/T4KK7DGJezyJ9cxLExGzI2GU3q+Cs0IpTxfyjf1
        zK19+5A8xXKYYb2MI2QsaI+FP/Drq5r9lM3AoflpgPMj8vgVhY336seMuJanKdVyI/Owe1XLKxOr/
        aCL4ot5L/dNSl5+TFMhbMAVxV+eFkO++1ck61ihXa0fvMJQpJpavBbsPEBa1HzvClWiWcqtKExlM0
        R2i93zJVTZnYPib30u5oUeyUqB9bDPylCZpw6iHHeENdKDo//v+y6Hzm+wXHx/vEiNpkymqmra3vc
        I6DZNp0A==;
Received: from [2001:4bb8:192:ff5f:74ed:7c4f:a5ee:8dcb] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1lqeFe-009Rk6-0p; Tue, 08 Jun 2021 16:06:50 +0000
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
Subject: [PATCH 13/16] block: use memcpy_from_bvec in bio_copy_kern_endio_read
Date:   Tue,  8 Jun 2021 18:06:00 +0200
Message-Id: <20210608160603.1535935-14-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210608160603.1535935-1-hch@lst.de>
References: <20210608160603.1535935-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use memcpy_from_bvec instead of open coding the logic.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/blk-map.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/blk-map.c b/block/blk-map.c
index 3743158ddaeb..d1448aaad980 100644
--- a/block/blk-map.c
+++ b/block/blk-map.c
@@ -400,7 +400,7 @@ static void bio_copy_kern_endio_read(struct bio *bio)
 	struct bvec_iter_all iter_all;
 
 	bio_for_each_segment_all(bvec, bio, iter_all) {
-		memcpy(p, page_address(bvec->bv_page), bvec->bv_len);
+		memcpy_from_bvec(p, bvec);
 		p += bvec->bv_len;
 	}
 
-- 
2.30.2

