Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5CD031A51
	for <lists+linux-mips@lfdr.de>; Sat,  1 Jun 2019 09:52:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727407AbfFAHvw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 1 Jun 2019 03:51:52 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:50934 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726716AbfFAHuq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 1 Jun 2019 03:50:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=YP3TD4qj2FhYTbm7C+3n+R++qZq8j8DANjDQ1J/4VAA=; b=DJPd/p+J6xAiEW19XP4WDdXPUA
        OE7GEEQLhRzHz7FgCGv6MF29DCF/R1XhfnU+WwQD5gVnWNSRbHDwrvQ7PEcHWpnVP4a5/pKVHnzfO
        m6F4JcTmLFrPGGSj0m+c6lcvKb/jwjVbwNIzZEBSn1oFDtWpdL4ZPbF4wJw3e+U7G5dBFqMlsmp3l
        nY5m1NWcRpcPexl6UIKQEHst88/Cg1dw8PO1SdCgeTGeYUd2+PVyn9OBYfu13uEjHPtBASi0EUF3u
        FZIg18gPsQ2h4rkanz1RdkyZ0zxTxu6dNNaDuRB9k2FPU17xGpuLhRsx+87gajqcO02hzPHhj58TY
        ylFFdTXQ==;
Received: from 217-76-161-89.static.highway.a1.net ([217.76.161.89] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hWymf-0007n3-Nf; Sat, 01 Jun 2019 07:50:34 +0000
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
Subject: [PATCH 08/16] sparc64: add the missing pgd_page definition
Date:   Sat,  1 Jun 2019 09:49:51 +0200
Message-Id: <20190601074959.14036-9-hch@lst.de>
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

sparc64 only had pgd_page_vaddr, but not pgd_page.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/sparc/include/asm/pgtable_64.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
index 22500c3be7a9..dcf970e82262 100644
--- a/arch/sparc/include/asm/pgtable_64.h
+++ b/arch/sparc/include/asm/pgtable_64.h
@@ -861,6 +861,7 @@ static inline unsigned long pud_page_vaddr(pud_t pud)
 #define pud_clear(pudp)			(pud_val(*(pudp)) = 0UL)
 #define pgd_page_vaddr(pgd)		\
 	((unsigned long) __va(pgd_val(pgd)))
+#define pgd_page(pgd)			virt_to_page(__va(pgd_val(pgd)))
 #define pgd_present(pgd)		(pgd_val(pgd) != 0U)
 #define pgd_clear(pgdp)			(pgd_val(*(pgdp)) = 0UL)
 
-- 
2.20.1

