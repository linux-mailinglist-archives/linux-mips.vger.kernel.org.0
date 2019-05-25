Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1931B2A4A0
	for <lists+linux-mips@lfdr.de>; Sat, 25 May 2019 15:32:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727081AbfEYNc1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 25 May 2019 09:32:27 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:50440 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726838AbfEYNc0 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 25 May 2019 09:32:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ZZFtwSDsCxtgfQbz1NVsc2BkUdN+ilOhDT8cfx+4H9s=; b=VM5E4vpTn++p7BaTgkSkUBiAzt
        NRnjC8ZNu8X/cDDkfV6bbNpJmbW7HcUtMqwOfn2FeqjXREc9RiNmiqlWtH4TpX02YRTnYKwj05C4D
        JKhk5CRR6/2hoitHD7DlPO2IirGizW4A4JV6JCkwCP4c7RmZlIthUVht7mvge28qUd/pIQqpQB5ou
        cvYSNKb/2h2VN46bf2aOHsEhctEOEpiBFR6iAxdjfpJtVeCvuPjiVZ+/CjCba/VaDmPmn7fxuzNXS
        56yR+61NCh4bxS+udPq3SmlYJ2OW1kcwKXqY97Kd3FBbdAJLIkLE6S/tkuVSQcqpOAeI9kfADMKPW
        DZnAnLqQ==;
Received: from 213-225-10-46.nat.highway.a1.net ([213.225.10.46] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hUWmZ-0006Yk-2b; Sat, 25 May 2019 13:32:19 +0000
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
Subject: [PATCH 4/6] mm: add a gup_fixup_start_addr hook
Date:   Sat, 25 May 2019 15:32:01 +0200
Message-Id: <20190525133203.25853-5-hch@lst.de>
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

This will allow sparc64 to override its ADI tags for
get_user_pages and get_user_pages_fast.  I have no idea why this
is not required for plain old get_user_pages, but it keeps the
existing sparc64 behavior.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 mm/gup.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index f173fcbaf1b2..1c21ecfbf38b 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2117,6 +2117,10 @@ static void gup_pgd_range(unsigned long addr, unsigned long end,
 	} while (pgdp++, addr = next, addr != end);
 }
 
+#ifndef gup_fixup_start_addr
+#define gup_fixup_start_addr(start)	(start)
+#endif
+
 #ifndef gup_fast_permitted
 /*
  * Check if it's allowed to use __get_user_pages_fast() for the range, or
@@ -2145,7 +2149,7 @@ int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
 	unsigned long flags;
 	int nr = 0;
 
-	start &= PAGE_MASK;
+	start = gup_fixup_start_addr(start) & PAGE_MASK;
 	len = (unsigned long) nr_pages << PAGE_SHIFT;
 	end = start + len;
 
@@ -2218,7 +2222,7 @@ int get_user_pages_fast(unsigned long start, int nr_pages,
 	unsigned long addr, len, end;
 	int nr = 0, ret = 0;
 
-	start &= PAGE_MASK;
+	start = gup_fixup_start_addr(start) & PAGE_MASK;
 	addr = start;
 	len = (unsigned long) nr_pages << PAGE_SHIFT;
 	end = start + len;
-- 
2.20.1

