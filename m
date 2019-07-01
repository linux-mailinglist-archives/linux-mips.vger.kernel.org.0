Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10D1455211
	for <lists+linux-mips@lfdr.de>; Tue, 25 Jun 2019 16:38:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731502AbfFYOin (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 Jun 2019 10:38:43 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:52576 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731260AbfFYOht (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 25 Jun 2019 10:37:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=rMutb/mdXZWT7NThFT68hJrDj+EN7r08hrqkExGM1N0=; b=nD3PJ12M/+ZRf8iUUjpwR2BcYx
        672S8ju0tCof1gf2fqrCbrsCpu7NFBMKaLTMwLkXOaFiKyFut/g5RXRJ/cOxHnubPbiLSN5aV8tJy
        JavcS+cHBWZD76nRh6lZuQ/mQIPinDpLY5TMCmr49gDGHFbuHmJdb00rTzy1mFwlsZIsSgl9kT5Fj
        kkd5icJsltmuqyAF7k3QI/zT6tGFmaPcaUX17VAB09De8SAUkTKOfv2zQx+qdDT4CeXWd6UHrZjo8
        A++RYiFjkYlhD6cfHebQjHq6sW2lxvpcONIU3/+aXFXEukG9qDfInJQXNXV9C+WwblaXsZ2jisVo+
        /tYjAgzA==;
Received: from 213-225-6-159.nat.highway.a1.net ([213.225.6.159] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hfmZY-0007y2-7Z; Tue, 25 Jun 2019 14:37:24 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>
Cc:     Nicholas Piggin <npiggin@gmail.com>,
        Khalid Aziz <khalid.aziz@oracle.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-mips@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-mm@kvack.org, x86@kernel.org, linux-kernel@vger.kernel.org,
        Jason Gunthorpe <jgg@mellanox.com>
Subject: [PATCH 02/16] mm: simplify gup_fast_permitted
Date:   Tue, 25 Jun 2019 16:37:01 +0200
Message-Id: <20190625143715.1689-3-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190625143715.1689-1-hch@lst.de>
References: <20190625143715.1689-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Pass in the already calculated end value instead of recomputing it, and
leave the end > start check in the callers instead of duplicating them
in the arch code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jason Gunthorpe <jgg@mellanox.com>
---
 arch/s390/include/asm/pgtable.h   |  8 +-------
 arch/x86/include/asm/pgtable_64.h |  8 +-------
 mm/gup.c                          | 17 +++++++----------
 3 files changed, 9 insertions(+), 24 deletions(-)

diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index 9f0195d5fa16..9b274fcaacb6 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -1270,14 +1270,8 @@ static inline pte_t *pte_offset(pmd_t *pmd, unsigned long address)
 #define pte_offset_map(pmd, address) pte_offset_kernel(pmd, address)
 #define pte_unmap(pte) do { } while (0)
 
-static inline bool gup_fast_permitted(unsigned long start, int nr_pages)
+static inline bool gup_fast_permitted(unsigned long start, unsigned long end)
 {
-	unsigned long len, end;
-
-	len = (unsigned long) nr_pages << PAGE_SHIFT;
-	end = start + len;
-	if (end < start)
-		return false;
 	return end <= current->mm->context.asce_limit;
 }
 #define gup_fast_permitted gup_fast_permitted
diff --git a/arch/x86/include/asm/pgtable_64.h b/arch/x86/include/asm/pgtable_64.h
index 0bb566315621..4990d26dfc73 100644
--- a/arch/x86/include/asm/pgtable_64.h
+++ b/arch/x86/include/asm/pgtable_64.h
@@ -259,14 +259,8 @@ extern void init_extra_mapping_uc(unsigned long phys, unsigned long size);
 extern void init_extra_mapping_wb(unsigned long phys, unsigned long size);
 
 #define gup_fast_permitted gup_fast_permitted
-static inline bool gup_fast_permitted(unsigned long start, int nr_pages)
+static inline bool gup_fast_permitted(unsigned long start, unsigned long end)
 {
-	unsigned long len, end;
-
-	len = (unsigned long)nr_pages << PAGE_SHIFT;
-	end = start + len;
-	if (end < start)
-		return false;
 	if (end >> __VIRTUAL_MASK_SHIFT)
 		return false;
 	return true;
diff --git a/mm/gup.c b/mm/gup.c
index 6bb521db67ec..3237f33792e6 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2123,13 +2123,9 @@ static void gup_pgd_range(unsigned long addr, unsigned long end,
  * Check if it's allowed to use __get_user_pages_fast() for the range, or
  * we need to fall back to the slow version:
  */
-bool gup_fast_permitted(unsigned long start, int nr_pages)
+static bool gup_fast_permitted(unsigned long start, unsigned long end)
 {
-	unsigned long len, end;
-
-	len = (unsigned long) nr_pages << PAGE_SHIFT;
-	end = start + len;
-	return end >= start;
+	return true;
 }
 #endif
 
@@ -2150,6 +2146,8 @@ int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
 	len = (unsigned long) nr_pages << PAGE_SHIFT;
 	end = start + len;
 
+	if (end <= start)
+		return 0;
 	if (unlikely(!access_ok((void __user *)start, len)))
 		return 0;
 
@@ -2165,7 +2163,7 @@ int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
 	 * block IPIs that come from THPs splitting.
 	 */
 
-	if (gup_fast_permitted(start, nr_pages)) {
+	if (gup_fast_permitted(start, end)) {
 		local_irq_save(flags);
 		gup_pgd_range(start, end, write ? FOLL_WRITE : 0, pages, &nr);
 		local_irq_restore(flags);
@@ -2224,13 +2222,12 @@ int get_user_pages_fast(unsigned long start, int nr_pages,
 	len = (unsigned long) nr_pages << PAGE_SHIFT;
 	end = start + len;
 
-	if (nr_pages <= 0)
+	if (end <= start)
 		return 0;
-
 	if (unlikely(!access_ok((void __user *)start, len)))
 		return -EFAULT;
 
-	if (gup_fast_permitted(start, nr_pages)) {
+	if (gup_fast_permitted(start, end)) {
 		local_irq_disable();
 		gup_pgd_range(addr, end, gup_flags, pages, &nr);
 		local_irq_enable();
-- 
2.20.1

