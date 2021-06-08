Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8899B39FBC2
	for <lists+linux-mips@lfdr.de>; Tue,  8 Jun 2021 18:08:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231840AbhFHQIW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Jun 2021 12:08:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231443AbhFHQIT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Jun 2021 12:08:19 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2F5AC061574;
        Tue,  8 Jun 2021 09:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description;
        bh=oWZyuciTMk9Oz4llaN6cnzbuyETlAwlAW/ZL8WXrlPc=; b=fUvQPpV8AGyBRslM8FvxAa8ee0
        47eWXK3dNc5ZAlrjmamJRRWC4sOdmEagVUA3hMXNZuGYGNzwXRXZmuJw5/7V0aKWpPkhyG5JQWfi8
        MNcDFWT/E1QnWvENVMH2BpSW3aI00e6CVb4srdu3kf9yHi9p90PlCuCd6rcF486FXU91yUzIEyzFE
        nC6yga6H3TmGZfyKF58vd2+prfBps0sjiiCR+/GmO0Hy6wtuKSXPcIsPMClX6L7dDDJ4i6X5I3BMa
        mqe2VKbNbEqxT/t6/RJdVY6MjtQUfSxayVFScRJ93MuEoWPfuqFPvn/2D0kAPXTOgwbHuMhf1oibN
        KF+gHULA==;
Received: from [2001:4bb8:192:ff5f:74ed:7c4f:a5ee:8dcb] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1lqeF7-009Rb7-Hr; Tue, 08 Jun 2021 16:06:18 +0000
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
Subject: [PATCH 03/16] bvec: fix the include guards for bvec.h
Date:   Tue,  8 Jun 2021 18:05:50 +0200
Message-Id: <20210608160603.1535935-4-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210608160603.1535935-1-hch@lst.de>
References: <20210608160603.1535935-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Fix the include guards to match the file naming.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 include/linux/bvec.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/bvec.h b/include/linux/bvec.h
index ff832e698efb..883faf5f1523 100644
--- a/include/linux/bvec.h
+++ b/include/linux/bvec.h
@@ -4,8 +4,8 @@
  *
  * Copyright (C) 2001 Ming Lei <ming.lei@canonical.com>
  */
-#ifndef __LINUX_BVEC_ITER_H
-#define __LINUX_BVEC_ITER_H
+#ifndef __LINUX_BVEC_H
+#define __LINUX_BVEC_H
 
 #include <linux/bug.h>
 #include <linux/errno.h>
@@ -183,4 +183,4 @@ static inline void bvec_advance(const struct bio_vec *bvec,
 	}
 }
 
-#endif /* __LINUX_BVEC_ITER_H */
+#endif /* __LINUX_BVEC_H */
-- 
2.30.2

