Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE9B39FBE5
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jun 2021 18:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232773AbhFHQJ1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Jun 2021 12:09:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232635AbhFHQIp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Jun 2021 12:08:45 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76247C06178B;
        Tue,  8 Jun 2021 09:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=rADL90S3oRiyRdCFkcJ9oLhZvXcChQZEzORShMtqGjI=; b=fAhFUBN7Oc5BAEM6sORmoH6JDn
        sA7j6sp/njH1e/DfVaccAfoQX5UE5IFfNBERRtuswcYno9hlov73RUW8L80YIlgzUZJwT8ma5YmJc
        mExGOPVRIFR/Nc3HFgNHk6IHOsJDVHbX8oVmEjnj0LkiLvx48A2UatdpveMhgZVrfKszj04iZqH31
        RehyDVGENeMdIRBKZhmU1IK/Yzlj2kaEVWh8MW2VMYwPaO2VPbLnpdl5fU9GM0J7DoPkDwUeQpPfY
        9MDj2/MorS5EwuEz29zobjxozUL9M2dGB6AuzgY11N+r3k1auMeuObPi6fJn/MTove72mkACrAMy8
        bUrNAULA==;
Received: from [2001:4bb8:192:ff5f:74ed:7c4f:a5ee:8dcb] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1lqeFX-009RiV-I9; Tue, 08 Jun 2021 16:06:44 +0000
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
Subject: [PATCH 11/16] block: rewrite bio_copy_data_iter to use bvec_kmap_local and memcpy_to_bvec
Date:   Tue,  8 Jun 2021 18:05:58 +0200
Message-Id: <20210608160603.1535935-12-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210608160603.1535935-1-hch@lst.de>
References: <20210608160603.1535935-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use the proper helpers instead of open coding the copy.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 block/bio.c | 28 ++++++++--------------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/block/bio.c b/block/bio.c
index 1d7abdb83a39..c14d2e66c084 100644
--- a/block/bio.c
+++ b/block/bio.c
@@ -1186,27 +1186,15 @@ EXPORT_SYMBOL(bio_advance);
 void bio_copy_data_iter(struct bio *dst, struct bvec_iter *dst_iter,
 			struct bio *src, struct bvec_iter *src_iter)
 {
-	struct bio_vec src_bv, dst_bv;
-	void *src_p, *dst_p;
-	unsigned bytes;
-
 	while (src_iter->bi_size && dst_iter->bi_size) {
-		src_bv = bio_iter_iovec(src, *src_iter);
-		dst_bv = bio_iter_iovec(dst, *dst_iter);
-
-		bytes = min(src_bv.bv_len, dst_bv.bv_len);
-
-		src_p = kmap_atomic(src_bv.bv_page);
-		dst_p = kmap_atomic(dst_bv.bv_page);
-
-		memcpy(dst_p + dst_bv.bv_offset,
-		       src_p + src_bv.bv_offset,
-		       bytes);
-
-		kunmap_atomic(dst_p);
-		kunmap_atomic(src_p);
-
-		flush_dcache_page(dst_bv.bv_page);
+		struct bio_vec src_bv = bio_iter_iovec(src, *src_iter);
+		struct bio_vec dst_bv = bio_iter_iovec(dst, *dst_iter);
+		unsigned int bytes = min(src_bv.bv_len, dst_bv.bv_len);
+		void *src_buf;
+
+		src_buf = bvec_kmap_local(&src_bv);
+		memcpy_to_bvec(&dst_bv, src_buf);
+		kunmap_local(src_buf);
 
 		bio_advance_iter_single(src, src_iter, bytes);
 		bio_advance_iter_single(dst, dst_iter, bytes);
-- 
2.30.2

