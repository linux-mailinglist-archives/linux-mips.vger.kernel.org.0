Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 047B85B0B4
	for <lists+linux-mips@lfdr.de>; Sun, 30 Jun 2019 18:48:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726572AbfF3QsL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 30 Jun 2019 12:48:11 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:52024 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726520AbfF3QsL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 30 Jun 2019 12:48:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=OOfEOtrG0Sb6Y0YzmxJZbpeIWttqDGl84dqQ7eJVwPg=; b=Xrjm5qZNG1e59Q/Wtor0r/mMS
        tqG2QGAng39Aw1YruOo7lmewixNBu6SxOymcCzjES7SrJVB4U+CCQV9UVMOqSceTYvVOeL0i9+PmB
        NeJkRYQTpjGcbc4OnwHn99jepPjWFvQ2anm5vbPMnTkKfTwaU5U/4jYErYBnmzG2fSw4KlJVNjI9v
        Qj2pjZZafiafco6GYuDmPvGya40WoQKC7MRJ/DZMahAAPJICw4ZLVSgIBZWM4meNnpi7huW0fD5qU
        i8RZWzQb8R7dVvSDpchsihU4Tzo+YQt7kidskBBBGZ2XyDfv06YrOGqhdTBqHhb2hxnGxdkQ56Tk+
        M6twGDX0A==;
Received: from [213.208.157.36] (helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hhczn-0004lL-Tx; Sun, 30 Jun 2019 16:48:08 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     paul.burton@mips.com
Cc:     linux@roeck-us.net, linux-mips@vger.kernel.org,
        iommu@lists.linux-foundation.org
Subject: [PATCH] MIPS: only select ARCH_HAS_UNCACHED_SEGMENT for non-coherent platforms
Date:   Sun, 30 Jun 2019 18:48:05 +0200
Message-Id: <20190630164805.12229-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

While mips might architecturally have the uncached segment all the time,
the infrastructure to use it is only need on platforms where DMA is
at least partially incoherent.  Only select it for those configuration
to fix a build failure as the arch_dma_prep_coherent symbol is also only
provided for non-coherent platforms.

Fixes: 2e96e04d25 ("MIPS: use the generic uncached segment support in dma-direct")
Reported-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 61a390c2f2c1..caf480275a31 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -8,7 +8,6 @@ config MIPS
 	select ARCH_HAS_ELF_RANDOMIZE
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
-	select ARCH_HAS_UNCACHED_SEGMENT
 	select ARCH_SUPPORTS_UPROBES
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF if 64BIT
@@ -1120,6 +1119,7 @@ config DMA_NONCOHERENT
 	bool
 	select ARCH_HAS_DMA_MMAP_PGPROT
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
+	select ARCH_HAS_UNCACHED_SEGMENT
 	select NEED_DMA_MAP_STATE
 	select ARCH_HAS_DMA_COHERENT_TO_PFN
 	select DMA_NONCOHERENT_CACHE_SYNC
-- 
2.20.1

