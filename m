Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46FD331A45
	for <lists+linux-mips@lfdr.de>; Sat,  1 Jun 2019 09:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727351AbfFAHvQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 1 Jun 2019 03:51:16 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:51304 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727323AbfFAHvP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 1 Jun 2019 03:51:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=d1mKwnxq0/21AleEJW7W0Ivu2dwVglOxlHTSE/EgRxs=; b=REuEawrBG9hy1w/8tCiSMSGDQr
        QmlJAVeLmCzHaQeCZ6QVeotjDLj2GXg0W/wnB9YZ+BE6+11w0s6WZNPG/ikohc3P+qPllwiZPMOZK
        Uf04Dcy7w+CE2UCj6lraV7/IJ6LgNaen6eTng5WzyUKlNntVp+5qt3qWaxSE8Xj9X9jm3fnM5ql4O
        0nTV/cHhydhIgwqLfn+yXdOjke+6B6TCGd8c4gIT1VmjmBwuNJIQ8+VkzzOaaEcb2BsUXCDy+tudh
        rVmzdbazRoVoLH18OBy5SxhO/nmLtVZkuB2qMC7Nswrxp+XFEatPa01wyJPnEAwRdzn16fDGmzYOW
        wWqwVD1Q==;
Received: from 217-76-161-89.static.highway.a1.net ([217.76.161.89] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hWyn8-0007rr-9v; Sat, 01 Jun 2019 07:51:03 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
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
        linux-mm@kvack.org, x86@kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 15/16] mm: switch gup_hugepte to use try_get_compound_head
Date:   Sat,  1 Jun 2019 09:49:58 +0200
Message-Id: <20190601074959.14036-16-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601074959.14036-1-hch@lst.de>
References: <20190601074959.14036-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This applies the overflow fixes from 8fde12ca79aff
("mm: prevent get_user_pages() from overflowing page refcount")
to the powerpc hugepd code and brings it back in sync with the
other GUP cases.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 mm/gup.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/gup.c b/mm/gup.c
index e03c7e6b1422..6090044227f1 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2006,7 +2006,8 @@ static int gup_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
 		refs++;
 	} while (addr += PAGE_SIZE, addr != end);
 
-	if (!page_cache_add_speculative(head, refs)) {
+	head = try_get_compound_head(head, refs);
+	if (!head) {
 		*nr -= refs;
 		return 0;
 	}
-- 
2.20.1

