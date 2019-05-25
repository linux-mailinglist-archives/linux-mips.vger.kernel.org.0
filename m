Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C16A42A49D
	for <lists+linux-mips@lfdr.de>; Sat, 25 May 2019 15:32:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbfEYNcf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 25 May 2019 09:32:35 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:50462 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727092AbfEYNc2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 25 May 2019 09:32:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=LECtn05W6P2NimP0OllUf9vpm+KEHNIpicbdgrA2kyI=; b=k8gst9WuPquL97md/tHmXZQkBD
        hn0QTx8oa20csZMaFnMKCBgUoSKd6TRGT8nMw+l2blX+vM5IsiYEr+trtkLraBToZuKn3VDbG5xuA
        cxls9b6CRrfMWHlXo3zhCi+l/ucpwTyxtSx2ySEtK0P679gUtIOAEUfXBigaj2lDLiWSZ/Ena4l+d
        /Sw9q/76Y2EoiKyUoqSvVwaidlPXWIMpo2+ZZ4jIQRzvZcEl3DUguMES55HjopjazGs11iTCGD0J/
        VFnyOS8e+p+fdrnb/SNdr/4wUWdWzJjdRagRamO42+zKlAZdPmIuNkVdJ+W3eXNbGqrnfUEXh5m5A
        FjpChbeg==;
Received: from 213-225-10-46.nat.highway.a1.net ([213.225.10.46] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hUWmf-0006Zp-3t; Sat, 25 May 2019 13:32:25 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>
Cc:     Nicholas Piggin <npiggin@gmail.com>, linux-mips@vger.kernel.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] mm: don't allow non-generic get_user_pages_fast implementations
Date:   Sat, 25 May 2019 15:32:03 +0200
Message-Id: <20190525133203.25853-7-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190525133203.25853-1-hch@lst.de>
References: <20190525133203.25853-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add an explicit ifdef instead of the weak functions for the stubs
so that we can't let new get_user_pages_fast implementation slip in.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 mm/util.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/mm/util.c b/mm/util.c
index 91682a2090ee..74ae737ffd95 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -300,6 +300,7 @@ void arch_pick_mmap_layout(struct mm_struct *mm, struct rlimit *rlim_stack)
 }
 #endif
 
+#ifndef CONFIG_HAVE_GENERIC_GUP
 /*
  * Like get_user_pages_fast() except its IRQ-safe in that it won't fall
  * back to the regular GUP.
@@ -308,8 +309,8 @@ void arch_pick_mmap_layout(struct mm_struct *mm, struct rlimit *rlim_stack)
  * If the architecture does not support this function, simply return with no
  * pages pinned.
  */
-int __weak __get_user_pages_fast(unsigned long start,
-				 int nr_pages, int write, struct page **pages)
+int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
+		struct page **pages)
 {
 	return 0;
 }
@@ -339,13 +340,13 @@ EXPORT_SYMBOL_GPL(__get_user_pages_fast);
  * requested. If nr_pages is 0 or negative, returns 0. If no pages
  * were pinned, returns -errno.
  */
-int __weak get_user_pages_fast(unsigned long start,
-				int nr_pages, unsigned int gup_flags,
-				struct page **pages)
+int get_user_pages_fast(unsigned long start, int nr_pages,
+		unsigned int gup_flags, struct page **pages)
 {
 	return get_user_pages_unlocked(start, nr_pages, pages, gup_flags);
 }
 EXPORT_SYMBOL_GPL(get_user_pages_fast);
+#endif /* !CONFIG_HAVE_GENERIC_GUP */
 
 unsigned long vm_mmap_pgoff(struct file *file, unsigned long addr,
 	unsigned long len, unsigned long prot,
-- 
2.20.1

