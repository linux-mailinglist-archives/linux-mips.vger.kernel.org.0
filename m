Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98BC83C4404
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jul 2021 08:12:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231495AbhGLGPY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Jul 2021 02:15:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230207AbhGLGPY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 12 Jul 2021 02:15:24 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A712CC0613DD;
        Sun, 11 Jul 2021 23:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=qx+S4X/AntMqvxHU8howep6p8wMPAKrF08wI0C/NDGI=; b=HW0ivQUNaIYb5D9jXaAJzvrLZZ
        NniOiQZpWmJnb1cTY9auqT9pv2DlwoLkLGJ+KeyvsCTm9An/7PIvNmXlKerWnhERlxy776PZAbEK5
        w+s3UFIo7PBlv0QHfGAW7tcievs3wv7RgURmLb7ugyYGYQNGDA/Ee9+qWygbCEh9qtXob4Q6q49Sx
        8Fs0AbLAHKg5mW3XTuQD7t+AshiUpgoY/8GYI0/12YPWENxwvsCl13CCTg420Ahuq+TxZKyOMbHaO
        GCzOJe9rzXLJP6nlryt99yK+VjCX8rmjhs/Mi1LuOtuutrWVqEpojFaINEGSgdhC5fOkGQmHPJeqa
        ovmkx9nA==;
Received: from [2001:4bb8:184:8b7c:bd9:61b8:39ba:d78a] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m2p9R-00GwGj-QZ; Mon, 12 Jul 2021 06:10:54 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc:     Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Nick Hu <nickhu@andestech.com>,
        Greentime Hu <green.hu@gmail.com>,
        Vincent Chen <deanbo422@gmail.com>,
        Helge Deller <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Geoff Levand <geoff@infradead.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Alex Shi <alexs@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org
Subject: [PATCH 4/6] scatterlist: replace flush_kernel_dcache_page with flush_dcache_page
Date:   Mon, 12 Jul 2021 08:09:26 +0200
Message-Id: <20210712060928.4161649-5-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210712060928.4161649-1-hch@lst.de>
References: <20210712060928.4161649-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Pages used in scatterlist can be mapped page cache pages (and often are),
so we must use flush_dcache_page here instead of the more limited
flush_kernel_dcache_page that is intended for highmem pages only.

Also remove the PageSlab check given that page_mapping_file as used
by the flush_dcache_page implementations already contains that check.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 lib/scatterlist.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/lib/scatterlist.c b/lib/scatterlist.c
index 27efa6178153..627aa84f8bbd 100644
--- a/lib/scatterlist.c
+++ b/lib/scatterlist.c
@@ -887,9 +887,8 @@ void sg_miter_stop(struct sg_mapping_iter *miter)
 		miter->__offset += miter->consumed;
 		miter->__remaining -= miter->consumed;
 
-		if ((miter->__flags & SG_MITER_TO_SG) &&
-		    !PageSlab(miter->page))
-			flush_kernel_dcache_page(miter->page);
+		if (miter->__flags & SG_MITER_TO_SG)
+			flush_dcache_page(miter->page);
 
 		if (miter->__flags & SG_MITER_ATOMIC) {
 			WARN_ON_ONCE(preemptible());
-- 
2.30.2

