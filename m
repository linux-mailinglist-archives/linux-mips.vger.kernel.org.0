Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49D9831631C
	for <lists+linux-mips@lfdr.de>; Wed, 10 Feb 2021 11:03:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230250AbhBJKC0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Feb 2021 05:02:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230410AbhBJKAT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Feb 2021 05:00:19 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A65A1C06178A;
        Wed, 10 Feb 2021 01:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=u5NbTnnrhnYrB2dx6qOY6zq3bhU0+0dqdS2E83sSAIs=; b=p6Am/N5cpFrcuiblrl9z12UUVY
        LaiYLnWoy8KJpcRBRfAFpSS3mFvDuszHTIXNjLk4B4Ou06akDjwcIUzoTI8Lk8fuI7M5iIa+5DGRV
        QIltYK9P2Ge5r6T+jwumoHWnnrxWRlCCHaXQOXBhenzOaMBuRnNa5zzOhkSzgycbs+DFv7wG135M2
        a3jXw9mDEpnUOecRbg7eDJgSGXwYsOW89RpgbeiXhljN59Jf64JDnEOUkgW4+1PDIq051TzcENMO2
        SnK1akdm5bJb7JYJ1dvzIzxO8VXpyfy0GON387EO7R0xPprQ77T7dBhINiIGfqrAymVwcuSEbtOgy
        AiiGZejw==;
Received: from [2001:4bb8:184:7d04:5e70:671e:7b3:191] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l9mF2-008g56-UN; Wed, 10 Feb 2021 09:57:02 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org
Subject: [PATCH 5/6] MIPS: remove CONFIG_DMA_MAYBE_COHERENT
Date:   Wed, 10 Feb 2021 10:56:40 +0100
Message-Id: <20210210095641.23856-6-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210095641.23856-1-hch@lst.de>
References: <20210210095641.23856-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

CONFIG_DMA_MAYBE_COHERENT just guards two early init options now.  Just
enable them unconditionally for CONFIG_DMA_NONCOHERENT.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/Kconfig        | 8 ++------
 arch/mips/kernel/setup.c | 2 +-
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 0e86162df65541..1f1603a08a6d2d 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -181,7 +181,7 @@ config MIPS_ALCHEMY
 	select CEVT_R4K
 	select CSRC_R4K
 	select IRQ_MIPS_CPU
-	select DMA_MAYBE_COHERENT	# Au1000,1500,1100 aren't, rest is
+	select DMA_NONCOHERENT		# Au1000,1500,1100 aren't, rest is
 	select MIPS_FIXUP_BIGPHYS_ADDR if PCI
 	select SYS_HAS_CPU_MIPS32_R1
 	select SYS_SUPPORTS_32BIT_KERNEL
@@ -546,7 +546,7 @@ config MIPS_MALTA
 	select CLKSRC_MIPS_GIC
 	select COMMON_CLK
 	select CSRC_R4K
-	select DMA_MAYBE_COHERENT
+	select DMA_NONCOHERENT
 	select GENERIC_ISA_DMA
 	select HAVE_PCSPKR_PLATFORM
 	select HAVE_PCI
@@ -1127,10 +1127,6 @@ config FW_CFE
 config ARCH_SUPPORTS_UPROBES
 	bool
 
-config DMA_MAYBE_COHERENT
-	select DMA_NONCOHERENT
-	bool
-
 config DMA_PERDEV_COHERENT
 	bool
 	select ARCH_HAS_SETUP_DMA_OPS
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index d6b2ba527f5b81..b25d07675b1ee1 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -805,7 +805,7 @@ static int __init debugfs_mips(void)
 arch_initcall(debugfs_mips);
 #endif
 
-#ifdef CONFIG_DMA_MAYBE_COHERENT
+#ifdef CONFIG_DMA_NONCOHERENT
 static int __init setcoherentio(char *str)
 {
 	dma_default_coherent = true;
-- 
2.29.2

