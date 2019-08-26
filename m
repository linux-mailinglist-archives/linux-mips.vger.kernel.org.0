Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 953D69D070
	for <lists+linux-mips@lfdr.de>; Mon, 26 Aug 2019 15:26:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732419AbfHZN0b (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 26 Aug 2019 09:26:31 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:35596 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732403AbfHZN00 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 26 Aug 2019 09:26:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=MhfKilNLV8AdxkyYpV9V+99YpggpHbv15IYon9mhMkc=; b=SxWguzeHjibJiQGTh0enGJ7wsj
        xvlWsmuxilsSrybCT7ApvIPfTJthkTEJChIJ5pY9DHIsQGjUN67v8cKOOKr5a0uXhM5HM4z32vow4
        bkkZjRbgFpCc/BYTH1TR2Srt2asiNr4QwjlKzC6thdTiNry7uant3AU9xHnoI8haOOP/qM8zbiqxw
        4HlaZ9eaMXY9Je+6oKpIzLdltUVMmtCOJrHiTM/zTsoJ2sL1u6Gn862HOqAy+cr2ZFt3K9eB+DHlR
        YzntowaXSIiZlnQk9a3lTajwZqbRPQp/EZ6iFMq2aXPq9PasHkqpCJwWzyHeA9WB3ILK9MurfmZqm
        +7QSFpkQ==;
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i2F0h-0007zP-RH; Mon, 26 Aug 2019 13:26:16 +0000
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
Subject: [PATCH 6/6] MIPS: document mixing "slightly different CCAs"
Date:   Mon, 26 Aug 2019 15:25:53 +0200
Message-Id: <20190826132553.4116-7-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190826132553.4116-1-hch@lst.de>
References: <20190826132553.4116-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Based on an email from Paul Burton, quoting section 4.8 "Cacheability and
Coherency Attributes and Access Types" of "MIPS Architecture Volume 1:
Introduction to the MIPS32 Architecture" (MD00080, revision 6.01).

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/Kconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index fc88f68ea1ee..aff1cadeea43 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1119,6 +1119,13 @@ config DMA_PERDEV_COHERENT
 
 config DMA_NONCOHERENT
 	bool
+	#
+	# MIPS allows mixing "slightly different" Cacheability and Coherency
+	# Attribute bits.  It is believed that the uncached access through
+	# KSEG1 and the implementation specific "uncached accelerated" used
+	# by pgprot_writcombine can be mixed, and the latter sometimes provides
+	# significant advantages.
+	#
 	select ARCH_HAS_DMA_WRITE_COMBINE
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select ARCH_HAS_UNCACHED_SEGMENT
-- 
2.20.1

