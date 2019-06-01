Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C2F731A1D
	for <lists+linux-mips@lfdr.de>; Sat,  1 Jun 2019 09:50:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbfFAHup (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 1 Jun 2019 03:50:45 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:50896 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbfFAHup (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 1 Jun 2019 03:50:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=YXjy0WBjpu+AWKxD8h6RRyLkoP4ahwrltsDsU1htN2I=; b=R8eTXd7Qhgr7vURBFw97YaTWlD
        T3lyN0YEcMJ79ClQ+mCtBMUFLuOiyWyH3g+cHJXsaGhU1ZQW0CpNC7mNNo8HyUgX3FhszTplgD7+X
        btlqXe68EAzd2OLJNYX0KYYHinh1c1G4uuGiFlpg+5KG/tYnjC/ECmZyFV2W5cbClw1LxVMs9OjOx
        xz9hhBoldK6Z0Q6nLK7VIYIQIYX28J0b8BdVQdYwzuUP/jm8NauIjZX8wekrKPrycgoI7/Cp1nW8D
        uv/lWnRuft7vqH/a/ly/wzkcdfMFR+xhY72TZ1pDxHDHpG7pasgAcW1XaGC4eUgJiUS8qppfZsHVh
        aA9pmEJg==;
Received: from 217-76-161-89.static.highway.a1.net ([217.76.161.89] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hWymX-0007mJ-HL; Sat, 01 Jun 2019 07:50:26 +0000
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
Subject: [PATCH 06/16] sh: add the missing pud_page definition
Date:   Sat,  1 Jun 2019 09:49:49 +0200
Message-Id: <20190601074959.14036-7-hch@lst.de>
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

sh only had pud_page_vaddr, but not pud_page.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/sh/include/asm/pgtable-3level.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/sh/include/asm/pgtable-3level.h b/arch/sh/include/asm/pgtable-3level.h
index 7d8587eb65ff..8ff6fb6b4d19 100644
--- a/arch/sh/include/asm/pgtable-3level.h
+++ b/arch/sh/include/asm/pgtable-3level.h
@@ -37,6 +37,7 @@ static inline unsigned long pud_page_vaddr(pud_t pud)
 {
 	return pud_val(pud);
 }
+#define pud_page(pud)		virt_to_page((void *)pud_page_vaddr(pud))
 
 #define pmd_index(address)	(((address) >> PMD_SHIFT) & (PTRS_PER_PMD-1))
 static inline pmd_t *pmd_offset(pud_t *pud, unsigned long address)
-- 
2.20.1

