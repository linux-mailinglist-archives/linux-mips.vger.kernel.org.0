Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B924C8FBE0
	for <lists+linux-mips@lfdr.de>; Fri, 16 Aug 2019 09:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbfHPHOq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Aug 2019 03:14:46 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:36366 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbfHPHOp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 16 Aug 2019 03:14:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=djaGEic6NaBK09gi+fCrcAouUdZlbuVe4m8rrYkWAaA=; b=De8E2C1m/tYOHXiACl9jPeBQqw
        DHJDyoV7M56F2pURRY0JpFKgXIsU8Sg2ia55yaguBXylVD+dnGLbt26dQrufgh4P0kK67d2pZcXUb
        CgG8JVvDhpx/xKUCbSHV7uMu5rd9hdx70ji+0fq+5PqFsGqtekMqQltJcgMNybJqD1u5O7YQ851Md
        JymL/FlVKYkqMmIKzSgin6m3IQhatyBhjae58awB6dw4B6Kz+QaL7gTX2J+GdNdfDQ9eOUl66Q7Ia
        7q3I6pZgs+mmCEMUJbtwE6VMunhxsX0Jzehg6uiIdUuwwDjddm6mqpaScef1yXPSMklZV1dFPYwks
        iO4GnMxQ==;
Received: from 089144199030.atnat0008.highway.a1.net ([89.144.199.30] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hyWRY-0007Ea-2x; Fri, 16 Aug 2019 07:14:36 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     iommu@lists.linux-foundation.org
Cc:     Guan Xuetao <gxt@pku.edu.cn>, Shawn Anastasio <shawn@anastas.io>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] unicore32: remove the unused pgprot_dmacoherent define
Date:   Fri, 16 Aug 2019 09:07:50 +0200
Message-Id: <20190816070754.15653-3-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190816070754.15653-1-hch@lst.de>
References: <20190816070754.15653-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/unicore32/include/asm/pgtable.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/unicore32/include/asm/pgtable.h b/arch/unicore32/include/asm/pgtable.h
index 9492aa304f03..126e961a8cb0 100644
--- a/arch/unicore32/include/asm/pgtable.h
+++ b/arch/unicore32/include/asm/pgtable.h
@@ -198,8 +198,6 @@ static inline pte_t pte_mkspecial(pte_t pte) { return pte; }
 	__pgprot(pgprot_val(prot) & ~PTE_CACHEABLE)
 #define pgprot_writecombine(prot)	\
 	__pgprot(pgprot_val(prot) & ~PTE_CACHEABLE)
-#define pgprot_dmacoherent(prot)	\
-	__pgprot(pgprot_val(prot) & ~PTE_CACHEABLE)
 
 #define pmd_none(pmd)		(!pmd_val(pmd))
 #define pmd_present(pmd)	(pmd_val(pmd) & PMD_PRESENT)
-- 
2.20.1

