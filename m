Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67E1739FBBA
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jun 2021 18:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231465AbhFHQIT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Jun 2021 12:08:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231165AbhFHQIR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Jun 2021 12:08:17 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 039A4C061787;
        Tue,  8 Jun 2021 09:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=mxjphJIexdyUP+LgP6QQe1/DAIfJHdL4g4Vg5OxQMzY=; b=hNgm/XKkGW6qS50D9qILkbSbA3
        ag1xUOBkEaBqGY3BiVOKZGE5bCfd+z0l6QZhFmyK7gOFzLVvRsu/qsETBYA3TnzLaS+oil4N6+zTS
        NTQMtE/JDlzwR/trspEmleh/87WlxYX4msxtg+R1WobU8kdnPgrsEJy3QCzmAc1dkhJ2L9gNJAyLO
        G6CxwAp9rJckWNufxaRejzebCCFvkRMee7p07BeU94Osh3HVMv8jPxAfv7X8MPcbd7oKcH0tkJLzT
        36Voi00g3IQrTciGkP9mUs3b4G/CpF92BIsdK9SLCNipoMLXYiBiraJ7HumR/oOascVon2CdJt5tP
        DMfEIv9A==;
Received: from [2001:4bb8:192:ff5f:74ed:7c4f:a5ee:8dcb] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1lqeF0-009Ra6-Pg; Tue, 08 Jun 2021 16:06:11 +0000
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
Subject: [PATCH 01/16] mm: use kmap_local_page in memzero_page
Date:   Tue,  8 Jun 2021 18:05:48 +0200
Message-Id: <20210608160603.1535935-2-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210608160603.1535935-1-hch@lst.de>
References: <20210608160603.1535935-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

No need for kmap_atomic here.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/highmem.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/highmem.h b/include/linux/highmem.h
index 832b49b50c7b..0dc0451cf1d1 100644
--- a/include/linux/highmem.h
+++ b/include/linux/highmem.h
@@ -334,9 +334,9 @@ static inline void memcpy_to_page(struct page *page, size_t offset,
 
 static inline void memzero_page(struct page *page, size_t offset, size_t len)
 {
-	char *addr = kmap_atomic(page);
+	char *addr = kmap_local_page(page);
 	memset(addr + offset, 0, len);
-	kunmap_atomic(addr);
+	kunmap_local(addr);
 }
 
 #endif /* _LINUX_HIGHMEM_H */
-- 
2.30.2

