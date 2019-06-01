Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65FB231A3B
	for <lists+linux-mips@lfdr.de>; Sat,  1 Jun 2019 09:52:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727312AbfFAHvH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 1 Jun 2019 03:51:07 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:51222 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727299AbfFAHvH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 1 Jun 2019 03:51:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=tBVEdevPoucewTq4OAhkR7FJKNQsBjZp3J3iboXORi4=; b=ehdh6hvly314iwU1GnFuHEE5gQ
        fB2jAQcWZO4o+YOC+NJC2yWmmM772WTP/dLU/OM2dY/F3SXDE6UCRYeP2PYPbEeLJqneh2MERfV+g
        FcP/ATctAjNAhXWCGq1kezTvlWJNWdyKMSZD/sxA8Yx7y4dOa2GRyBgwUYDgB0/guLH+/24UDpQgu
        vjFUXTcIM6lqq9YjbfcH8h0S/DFSb8DRiG/N4q3UCxByRO4iiSuavdtY2XKPMhbdOWtyIOiou5eXX
        +D5M4jODgdxsUV6vZagl5C/VnqSARpiWDTSre9AfvM59FuGkPdH0xOTu258kDXC8kXZFo3g1E0iuY
        0WpBgjow==;
Received: from 217-76-161-89.static.highway.a1.net ([217.76.161.89] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hWyn0-0007pM-QN; Sat, 01 Jun 2019 07:50:55 +0000
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
Subject: [PATCH 13/16] mm: validate get_user_pages_fast flags
Date:   Sat,  1 Jun 2019 09:49:56 +0200
Message-Id: <20190601074959.14036-14-hch@lst.de>
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

We can only deal with FOLL_WRITE and/or FOLL_LONGTERM in
get_user_pages_fast, so reject all other flags.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 mm/gup.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/gup.c b/mm/gup.c
index c8da7764de9c..53b50c63ba51 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2316,6 +2316,9 @@ int get_user_pages_fast(unsigned long start, int nr_pages,
 	unsigned long addr, len, end;
 	int nr = 0, ret = 0;
 
+	if (WARN_ON_ONCE(gup_flags & ~(FOLL_WRITE | FOLL_LONGTERM)))
+		return -EINVAL;
+
 	start = untagged_addr(start) & PAGE_MASK;
 	addr = start;
 	len = (unsigned long) nr_pages << PAGE_SHIFT;
-- 
2.20.1

