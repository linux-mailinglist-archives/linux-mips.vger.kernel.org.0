Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A143D39FBC5
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jun 2021 18:08:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232112AbhFHQIX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Jun 2021 12:08:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231983AbhFHQIW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Jun 2021 12:08:22 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60F27C061574;
        Tue,  8 Jun 2021 09:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=OCSR+eGjYhLRS8RAy8MFl9s9L6IyjOgYmb7x7h5BGDk=; b=kTuZKBSrB0mFUHPruJWFctHCV/
        APCqvbEWKGNzK7EdLxVNJV0M14CczA+OeObXq7gTFWEM+UR7Y5OuFNQ/wAIImIHqbGFPje+jR55eX
        uGpdOM39AZD3j8luBVj/ZIg+IoYLY02rBnY9ZrHB9QJujM0+SfJPD8dUlyZ2WKSsWaRjzJMftODOh
        YGvtp3Ki+nr06a/z7EihNPqLTmpvDCJsU8Akh19ugoeeMUP9D5BuYIi18rjTrgGA/rWw2yGsVMd5Y
        I3zeZctjIYm0IV9n/p/91fmdHrKyqBiB8ZIAo0nilrI8I9oWt+2YI87d9bjA1Fp/buh7NrwGbK93P
        EFN+gjDw==;
Received: from [2001:4bb8:192:ff5f:74ed:7c4f:a5ee:8dcb] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1lqeFA-009Rbt-Qe; Tue, 08 Jun 2021 16:06:21 +0000
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
Subject: [PATCH 04/16] bvec: add a bvec_kmap_local helper
Date:   Tue,  8 Jun 2021 18:05:51 +0200
Message-Id: <20210608160603.1535935-5-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210608160603.1535935-1-hch@lst.de>
References: <20210608160603.1535935-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add a helper to call kmap_local_page on a bvec.  There is no need for
an unmap helper given that kunmap_local accept any address in the mapped
page.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/bvec.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/bvec.h b/include/linux/bvec.h
index 883faf5f1523..d64d6c0ceb77 100644
--- a/include/linux/bvec.h
+++ b/include/linux/bvec.h
@@ -7,6 +7,7 @@
 #ifndef __LINUX_BVEC_H
 #define __LINUX_BVEC_H
 
+#include <linux/highmem.h>
 #include <linux/bug.h>
 #include <linux/errno.h>
 #include <linux/limits.h>
@@ -183,4 +184,9 @@ static inline void bvec_advance(const struct bio_vec *bvec,
 	}
 }
 
+static inline void *bvec_kmap_local(struct bio_vec *bvec)
+{
+	return kmap_local_page(bvec->bv_page) + bvec->bv_offset;
+}
+
 #endif /* __LINUX_BVEC_H */
-- 
2.30.2

