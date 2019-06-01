Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2ABEB31A49
	for <lists+linux-mips@lfdr.de>; Sat,  1 Jun 2019 09:52:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727323AbfFAHvU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 1 Jun 2019 03:51:20 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:51310 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727357AbfFAHvQ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 1 Jun 2019 03:51:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=rc9LqUIutMEld6u5RSQ1sWzYs7kKnMm3S4iYITq0SoM=; b=hmItU0MzoKBxkW0xZSY+1V9IVJ
        UlnIz7x0urr62nzgcyqnB/5AQ1M6XxA40U4gxuVcAGCsZXzQMrqW+4eKIbaj5MYaWx5FKa+gz1mKz
        HRuyf4AFR/AjCjgH8EDN4vHwAhjKlzmMds++4hoDLSl7tnnj8utVFIcJ1xF5v2BvjcyJSGfnZhRgg
        CGtHKWy+mwizinD1wdoATmhB/sprl/mtqAL2Mea12uUVfEACrsVwrstfEucPET4mDXbr7743/4ZpD
        tGZvwusRlY1sYBD80QVps0fAgFJ6FrIu6GKRIDGA4zcDNIRUJhWop4eFhMFiU+OV0AXhP+aTvhS++
        PTXgcQDg==;
Received: from 217-76-161-89.static.highway.a1.net ([217.76.161.89] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hWynB-0007sS-Px; Sat, 01 Jun 2019 07:51:06 +0000
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
Subject: [PATCH 16/16] mm: mark the page referenced in gup_hugepte
Date:   Sat,  1 Jun 2019 09:49:59 +0200
Message-Id: <20190601074959.14036-17-hch@lst.de>
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

All other get_user_page_fast cases mark the page referenced, so do
this here as well.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 mm/gup.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/gup.c b/mm/gup.c
index 6090044227f1..d1fc008de292 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2020,6 +2020,7 @@ static int gup_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
 		return 0;
 	}
 
+	SetPageReferenced(head);
 	return 1;
 }
 
-- 
2.20.1

