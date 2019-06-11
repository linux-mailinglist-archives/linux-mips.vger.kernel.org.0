Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44FBF3CF2F
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2019 16:42:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391683AbfFKOl4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Jun 2019 10:41:56 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:37754 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391234AbfFKOly (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 11 Jun 2019 10:41:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=19P6HKT8gx+qvtagjEoAfgixjiXJTHCy2J5lWoKb+RI=; b=RvMLHQLM0EqS4QeoOT3XL4S8Cn
        bxrsz4T2AKHyg/Jnz9ysLo0v7PvYXCdSxmLvfSIpHzfHqH9NklV5iCu1CJz+7sk5NP0HxWHhNDbVS
        APpwXXhK22mKDDmkVGTsQl6GmckrjXQaHs33F/LL3JxSB4TnsvLYz7ZZIfzWiwRU6CjT/SINtqap4
        868A4nTBLbFV2gFiY5ook73YDF/6b+QARegN2/rb9yAqWpqUDNB0D9CjTXtsogPm0omdTGL9Ajdmp
        roiPNf+qsDk//cZFte1jfmP7N7hAUk6jNYUyMBU3Oxq/RYBPF/lvSKYiKGZQIUGuymNMKWpU8qPg8
        8Ld3TJGg==;
Received: from mpp-cp1-natpool-1-037.ethz.ch ([82.130.71.37] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hahy2-0005YC-6o; Tue, 11 Jun 2019 14:41:42 +0000
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
Subject: [PATCH 12/16] mm: validate get_user_pages_fast flags
Date:   Tue, 11 Jun 2019 16:40:58 +0200
Message-Id: <20190611144102.8848-13-hch@lst.de>
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

We can only deal with FOLL_WRITE and/or FOLL_LONGTERM in
get_user_pages_fast, so reject all other flags.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 mm/gup.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/mm/gup.c b/mm/gup.c
index fe4f205651fd..78dc1871b3d4 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2317,6 +2317,9 @@ int get_user_pages_fast(unsigned long start, int nr_pages,
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

