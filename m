Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B8C339FBCC
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jun 2021 18:08:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233133AbhFHQId (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Jun 2021 12:08:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232686AbhFHQI2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Jun 2021 12:08:28 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A589EC061574;
        Tue,  8 Jun 2021 09:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=XwFsKV0wTnqrjM2zeN8AG8XOGt14/N7ay2THQ9JeNTU=; b=gAN/Fa8WhYn6iNnCWrgN61xP/7
        qpzWIbLp0RYRHKw+NrnaYNk86XGlBkEyNRZLSg+GjvrOS8dmNbfGeS9TaVA0rvGZTGvYqu20webuB
        fT//Gqjhw5BrXJ6eG7EsymCK6M9V8oVkAIum+X29mXJKhsWauuNFnG1S8uKWQPoxx07AsAXKnHiDM
        eezVe5V2bDEhRbNtHqKM1THzpw5ZQMP5ng6DjhKyhuQSgWmrH8JXt8cz85Ba93BG0y+rgch2mzvYp
        uTW6yTIWA84hxpbqarGW1LvLqWd9BltX1o8xjsjJ6gNYQIu6J7HYcOTEWcCAf/Ps19PgmjiQKbx4M
        KvtAPxqw==;
Received: from [2001:4bb8:192:ff5f:74ed:7c4f:a5ee:8dcb] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1lqeFE-009Rci-3P; Tue, 08 Jun 2021 16:06:24 +0000
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
Subject: [PATCH 05/16] bvec: add memcpy_{from,to}_bvec and memzero_bvec helper
Date:   Tue,  8 Jun 2021 18:05:52 +0200
Message-Id: <20210608160603.1535935-6-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210608160603.1535935-1-hch@lst.de>
References: <20210608160603.1535935-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add helpers to perform common memory operation on a bvec.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/bvec.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/linux/bvec.h b/include/linux/bvec.h
index d64d6c0ceb77..ac835fa01ee3 100644
--- a/include/linux/bvec.h
+++ b/include/linux/bvec.h
@@ -189,4 +189,19 @@ static inline void *bvec_kmap_local(struct bio_vec *bvec)
 	return kmap_local_page(bvec->bv_page) + bvec->bv_offset;
 }
 
+static inline void memcpy_from_bvec(char *to, struct bio_vec *bvec)
+{
+	memcpy_from_page(to, bvec->bv_page, bvec->bv_offset, bvec->bv_len);
+}
+
+static inline void memcpy_to_bvec(struct bio_vec *bvec, const char *from)
+{
+	memcpy_to_page(bvec->bv_page, bvec->bv_offset, from, bvec->bv_len);
+}
+
+static inline void memzero_bvec(struct bio_vec *bvec)
+{
+	memzero_page(bvec->bv_page, bvec->bv_offset, bvec->bv_len);
+}
+
 #endif /* __LINUX_BVEC_H */
-- 
2.30.2

