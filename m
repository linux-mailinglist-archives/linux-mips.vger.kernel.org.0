Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26CAB8FBF0
	for <lists+linux-mips@lfdr.de>; Fri, 16 Aug 2019 09:17:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbfHPHRA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Aug 2019 03:17:00 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:39490 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726755AbfHPHRA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 16 Aug 2019 03:17:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=5slocbe6PQWQPCbfPHRmFcXbh8p3/1KOX8/V8eA6Q9A=; b=Cwd5nn8mGMcw08OzE0p/GngGiO
        XNDinPVA9h0z8gOXLwNvPC5+xGzUuqzVJ7bzHX6VrHtT2KWxhDwEh2w+4DScwazticFb/jTlov9+O
        ZsglZG/XJJ9o4ddV713LiunQaBw97yejihx2A6H9mBNjCWNm+CrvkGqbWkjZfSnppVn5Tc9zGVhYg
        c1T64d90DXi99E4doAqi5iXtVW1wIlubAneZwAcO699CTmXKuJCmMx70YR0/75mKUVOSCEwsALe9m
        J+CmrJ+zilbuREvyDod92BUSEGW1TzmHxcwBUEfT9HK4UT3AcOxXIQjmy7HHd4iFg+VVXFKVVOCIv
        h1CBNIwg==;
Received: from 089144199030.atnat0008.highway.a1.net ([89.144.199.30] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hyWTh-0000Zn-6C; Fri, 16 Aug 2019 07:16:50 +0000
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
Subject: [PATCH 3/6] arm-nommu: remove the unused pgprot_dmacoherent define
Date:   Fri, 16 Aug 2019 09:07:51 +0200
Message-Id: <20190816070754.15653-4-hch@lst.de>
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
 arch/arm/include/asm/pgtable-nommu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/include/asm/pgtable-nommu.h b/arch/arm/include/asm/pgtable-nommu.h
index 0b1f6799a32e..d0de24f06724 100644
--- a/arch/arm/include/asm/pgtable-nommu.h
+++ b/arch/arm/include/asm/pgtable-nommu.h
@@ -62,7 +62,6 @@ typedef pte_t *pte_addr_t;
  */
 #define pgprot_noncached(prot)	(prot)
 #define pgprot_writecombine(prot) (prot)
-#define pgprot_dmacoherent(prot) (prot)
 #define pgprot_device(prot)	(prot)
 
 
-- 
2.20.1

