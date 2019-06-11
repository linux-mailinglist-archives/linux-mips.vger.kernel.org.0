Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26BCB3CF24
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2019 16:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391723AbfFKOmD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Jun 2019 10:42:03 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:37846 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391720AbfFKOmD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 11 Jun 2019 10:42:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=A1i8h65qriplI15qgyPKPV5aWfBos+CWcUOK7xSAxuY=; b=NOYU9DLYhjro838aLFWjvDoMbZ
        UkqZ8t//il4sKiPD2MvuzAucG5i7l8pWQ6VZyXnM1lDiBoQSz1ebEgO0BoHCTP8qbcTO53B6Bxri5
        4hFy8f18Wb9wpm7g7LLyMcw6j6ZRXpvaD3DUeonwZKNckLX8QbqQvsZlKL5eHMh/7DG7/kuoYQcX/
        YW+S9XokqeT/7Vw2z5+vqNVRt8eGRYlmsFbAa22ATQgqR5aJPASr2OARLcEF1Ta3Mn/k33RIaEXrm
        z6rmE/LSYeU+Btb4GR8sulOJQPhFjwpE69UYW3PVZcX30EaXUIHK9X6wejIo8dhub+RTZQTowcoNm
        oUmZ6b2A==;
Received: from mpp-cp1-natpool-1-037.ethz.ch ([82.130.71.37] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hahyB-0005u1-RB; Tue, 11 Jun 2019 14:41:52 +0000
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
Subject: [PATCH 15/16] mm: mark the page referenced in gup_hugepte
Date:   Tue, 11 Jun 2019 16:41:01 +0200
Message-Id: <20190611144102.8848-16-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611144102.8848-1-hch@lst.de>
References: <20190611144102.8848-1-hch@lst.de>
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
index 0733674b539d..8bcc042f933a 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2021,6 +2021,7 @@ static int gup_hugepte(pte_t *ptep, unsigned long sz, unsigned long addr,
 		return 0;
 	}
 
+	SetPageReferenced(head);
 	return 1;
 }
 
-- 
2.20.1

