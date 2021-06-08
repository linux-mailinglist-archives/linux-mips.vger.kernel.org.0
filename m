Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C41F239FC07
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jun 2021 18:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234142AbhFHQK4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Jun 2021 12:10:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233965AbhFHQJS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Jun 2021 12:09:18 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C573BC0611FA;
        Tue,  8 Jun 2021 09:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=1vl+lJtrWoiUzzKH0COLUmHTJyPccdOEl/SXPdFbHq8=; b=0u+MxU9gFUcqqSv2kfOmfldTkp
        w7E+5atKEAad8wVEtQr/LZNgxJYK8mzid8YXzoNJss/ueLRaIOdg8Ffi1dL/Gr31d3tFiWQ9zGH02
        r8KOpgP6fzxXgSr3Wh6luKs/H3q+6tXlPI0xf+/W0LGq/H8vmX4Aoa51z42VVKK7k0YCZcWxMj1Tt
        dRbFgmR1NoyJwN2S3vD5Ob9TaDuXkzdV4d2UhmdDO+ZWpixwO5QzrOmmRQRh4pj/bDkEBisgt7Y3t
        xHTK/IpClwmin7IxY8YmqiMy2IbAOdFj8ljzq94oVX1751YbQwmfnlpOqnpoiDcmi2lZDM5h/0VgG
        Fle2n2Gw==;
Received: from [2001:4bb8:192:ff5f:74ed:7c4f:a5ee:8dcb] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1lqeFo-009Rnc-4u; Tue, 08 Jun 2021 16:07:00 +0000
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
Subject: [PATCH 16/16] block: use bvec_kmap_local in bio_integrity_process
Date:   Tue,  8 Jun 2021 18:06:03 +0200
Message-Id: <20210608160603.1535935-17-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210608160603.1535935-1-hch@lst.de>
References: <20210608160603.1535935-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Using local kmaps slightly reduces the chances to stray writes, and
the bvec interface cleans up the code a little bit.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/bio-integrity.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/block/bio-integrity.c b/block/bio-integrity.c
index 4b4eb8964a6f..8f54d49dc500 100644
--- a/block/bio-integrity.c
+++ b/block/bio-integrity.c
@@ -172,18 +172,16 @@ static blk_status_t bio_integrity_process(struct bio *bio,
 	iter.prot_buf = prot_buf;
 
 	__bio_for_each_segment(bv, bio, bviter, *proc_iter) {
-		void *kaddr = kmap_atomic(bv.bv_page);
+		void *kaddr = bvec_kmap_local(&bv);
 
-		iter.data_buf = kaddr + bv.bv_offset;
+		iter.data_buf = kaddr;
 		iter.data_size = bv.bv_len;
-
 		ret = proc_fn(&iter);
-		if (ret) {
-			kunmap_atomic(kaddr);
-			return ret;
-		}
+		kunmap_local(kaddr);
+
+		if (ret)
+			break;
 
-		kunmap_atomic(kaddr);
 	}
 	return ret;
 }
-- 
2.30.2

