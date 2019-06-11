Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 696E03CF4D
	for <lists+linux-mips@lfdr.de>; Tue, 11 Jun 2019 16:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391772AbfFKOmf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Jun 2019 10:42:35 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:37510 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391595AbfFKOlj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 11 Jun 2019 10:41:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=NpWcgZzp3PVAHx6KOALQeB51c2SoNPG0lnYZA6y2f1k=; b=Elx6a7oB+cG63hmgYxilqyyn8c
        41Dy5+a7mSEbpr74nkmh4p8U4+Csa9fSuC+Gn2NIci0h+zE1AJ2oCVBGO13LLiFb0b5dtSmQVG46v
        9u67LZN22/J37Gq6Pw0EdVcHmtYQmz4D+jPa3xzMxshR3N3w3jFih5D2yKc/uCU1s1tzAUO98HmhR
        Eb4uYc9Q63+/RNoh85FinfAQMq2GbkMiPqDoguuctm3ABd08mxoDvUh7pRodjX/6Qrk1P4MO1lvCS
        cb+WEkPCrmQqVuObuLcxvqmcclY+k9OvtBq6GcKL8ErofhZRUpsV0D0m18ViO9NmB/7DHIAQrxxoM
        YaFeTNdQ==;
Received: from mpp-cp1-natpool-1-037.ethz.ch ([82.130.71.37] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hahxi-0005Q5-7q; Tue, 11 Jun 2019 14:41:22 +0000
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
Subject: [PATCH 05/16] sh: add the missing pud_page definition
Date:   Tue, 11 Jun 2019 16:40:51 +0200
Message-Id: <20190611144102.8848-6-hch@lst.de>
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

sh only had pud_page_vaddr, but not pud_page.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/sh/include/asm/pgtable-3level.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/sh/include/asm/pgtable-3level.h b/arch/sh/include/asm/pgtable-3level.h
index 7d8587eb65ff..3c7ff20f3f94 100644
--- a/arch/sh/include/asm/pgtable-3level.h
+++ b/arch/sh/include/asm/pgtable-3level.h
@@ -37,6 +37,7 @@ static inline unsigned long pud_page_vaddr(pud_t pud)
 {
 	return pud_val(pud);
 }
+#define pud_page(pud)		pfn_to_page(pud_pfn(pud))
 
 #define pmd_index(address)	(((address) >> PMD_SHIFT) & (PTRS_PER_PMD-1))
 static inline pmd_t *pmd_offset(pud_t *pud, unsigned long address)
-- 
2.20.1

