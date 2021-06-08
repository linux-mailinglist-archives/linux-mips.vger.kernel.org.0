Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4765D39FC0B
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jun 2021 18:10:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234152AbhFHQK5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Jun 2021 12:10:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233966AbhFHQJS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Jun 2021 12:09:18 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A518C0611FB;
        Tue,  8 Jun 2021 09:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=TkXSf08FOqBmuFw/ENTFMnI+54X5dnYwOAAHKqJCH8E=; b=pkj2gwkimoVdhfqEChAYFo7k01
        DnDjBy0Vy9d/v40yq3IoyAtXggh26kXheeh7Q6FS/HWWh00L9VMnx3pZTSNuEiIWOQJz53QqfcsNm
        R41he7jPnmOndHMbLi8GzQ2PqR2X7YKUx24DmYFyeV0jtN5cWY3DFgwVTdyQu/j5mvfY/cn5L0lv+
        qwTZ52er/7pZqEAG8sFNOmS+/jQdGymKGMUkboqU4/j+dbP5ihuHIrn6U2L9Zlya2Flw0avFZ5x6P
        cAWC40p3z6yHiYjkHFC0cXtePrK1w6gWMd17X+w27Mh7NnZ4JJhEo9dxBwnyBMj8OE0w8ksR+yJTw
        akNFincA==;
Received: from [2001:4bb8:192:ff5f:74ed:7c4f:a5ee:8dcb] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1lqeFk-009Rml-SV; Tue, 08 Jun 2021 16:06:57 +0000
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
Subject: [PATCH 15/16] block: use bvec_kmap_local in t10_pi_type1_{prepare,complete}
Date:   Tue,  8 Jun 2021 18:06:02 +0200
Message-Id: <20210608160603.1535935-16-hch@lst.de>
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
 block/t10-pi.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/block/t10-pi.c b/block/t10-pi.c
index d910534b3a41..00c203b2a921 100644
--- a/block/t10-pi.c
+++ b/block/t10-pi.c
@@ -147,11 +147,10 @@ static void t10_pi_type1_prepare(struct request *rq)
 			break;
 
 		bip_for_each_vec(iv, bip, iter) {
-			void *p, *pmap;
 			unsigned int j;
+			void *p;
 
-			pmap = kmap_atomic(iv.bv_page);
-			p = pmap + iv.bv_offset;
+			p = bvec_kmap_local(&iv);
 			for (j = 0; j < iv.bv_len; j += tuple_sz) {
 				struct t10_pi_tuple *pi = p;
 
@@ -161,8 +160,7 @@ static void t10_pi_type1_prepare(struct request *rq)
 				ref_tag++;
 				p += tuple_sz;
 			}
-
-			kunmap_atomic(pmap);
+			kunmap_local(p);
 		}
 
 		bip->bip_flags |= BIP_MAPPED_INTEGRITY;
@@ -195,11 +193,10 @@ static void t10_pi_type1_complete(struct request *rq, unsigned int nr_bytes)
 		struct bvec_iter iter;
 
 		bip_for_each_vec(iv, bip, iter) {
-			void *p, *pmap;
 			unsigned int j;
+			void *p;
 
-			pmap = kmap_atomic(iv.bv_page);
-			p = pmap + iv.bv_offset;
+			p = bvec_kmap_local(&iv);
 			for (j = 0; j < iv.bv_len && intervals; j += tuple_sz) {
 				struct t10_pi_tuple *pi = p;
 
@@ -210,8 +207,7 @@ static void t10_pi_type1_complete(struct request *rq, unsigned int nr_bytes)
 				intervals--;
 				p += tuple_sz;
 			}
-
-			kunmap_atomic(pmap);
+			kunmap_local(p);
 		}
 	}
 }
-- 
2.30.2

