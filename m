Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 783AE31A5A
	for <lists+linux-mips@lfdr.de>; Sat,  1 Jun 2019 09:52:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbfFAHuq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 1 Jun 2019 03:50:46 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:50908 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726349AbfFAHup (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 1 Jun 2019 03:50:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=yY/ra2PGFgbg7XqU3FF0wFq0V6rCLZSmY3LqWPMhNa4=; b=rcHoPkNBcn5I35lT0nSXPSoUmK
        4vxZRGXHEDwfmRiduNeBcHUEvPxoD8OJrN0S5PQmE3re/arNQar+m7iSLIMTsowGpB4Ex04zPb/gN
        29PPacLkhP5k/ojj3/Pa75U++zPDy3dYVb7BB3Paj88dFUs47D6xLlvkBHuqM7Il063uPmOqZZNcF
        wD8Tfl4VS9E3grfV6nmX4Tt/FE4OvZDbbNPrwWgUWcHBoL/a9qclxKhIIBdy59SE5ZBiYm89iK4RM
        INzpbbwRa9Sf7Gyw3QMcVnAV2C3wd8IfP0CShLYG4iQifTBRdaFTvSUlYc0QaQRmDfkZUOHZgrJuX
        0fxi4omg==;
Received: from 217-76-161-89.static.highway.a1.net ([217.76.161.89] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hWymI-0007kx-5x; Sat, 01 Jun 2019 07:50:11 +0000
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
Subject: [PATCH 02/16] mm: use untagged_addr() for get_user_pages_fast addresses
Date:   Sat,  1 Jun 2019 09:49:45 +0200
Message-Id: <20190601074959.14036-3-hch@lst.de>
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

This will allow sparc64 to override its ADI tags for
get_user_pages and get_user_pages_fast.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 mm/gup.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index f173fcbaf1b2..9775f7675653 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2145,7 +2145,7 @@ int __get_user_pages_fast(unsigned long start, int nr_pages, int write,
 	unsigned long flags;
 	int nr = 0;
 
-	start &= PAGE_MASK;
+	start = untagged_addr(start) & PAGE_MASK;
 	len = (unsigned long) nr_pages << PAGE_SHIFT;
 	end = start + len;
 
@@ -2218,7 +2218,7 @@ int get_user_pages_fast(unsigned long start, int nr_pages,
 	unsigned long addr, len, end;
 	int nr = 0, ret = 0;
 
-	start &= PAGE_MASK;
+	start = untagged_addr(start) & PAGE_MASK;
 	addr = start;
 	len = (unsigned long) nr_pages << PAGE_SHIFT;
 	end = start + len;
-- 
2.20.1

