Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 360073135AB
	for <lists+linux-mips@lfdr.de>; Mon,  8 Feb 2021 15:51:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233034AbhBHOvl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Feb 2021 09:51:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232797AbhBHOvM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Feb 2021 09:51:12 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA703C06178C;
        Mon,  8 Feb 2021 06:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=LbVdEP6Q8sdgfOzBxgO4V1zaoOM6OhmNlKX6TnKe0gU=; b=UK19lT76lf81jqlGSn+5yRUE9A
        eoh59SO2HusP3NHZuWli8aBBZic3BEbHGUbWFa03/NI6EczhF8dU8W0c2Ir3uY9Ft7ra8yTF4tCMa
        IVFb8ENbP93Zp2VMVVjBgslqUtgvkHTkZ1+dJ/5yvb7bKv87d3epy0cEot9Y3xegVTzOer7Ksv09+
        1PBy0uKNz03QNHOfhP+JpYDShZ/zk2bctze+zLppzHiOwcsejgLRD5F+r/Y7m0l/99v7Ur5wRhnLn
        YXTQdrVoOtwut87NEo64JkgMv0+AgVp5UQ0eSAh7yh+mb3xOUs+MIQuIbh8+e0D+qqxlxP85YnACM
        ojngzDHQ==;
Received: from [2001:4bb8:184:7d04:e3ed:f9d6:78e2:6f0f] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l97rx-0066da-9O; Mon, 08 Feb 2021 14:50:29 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org
Subject: [PATCH 1/6] MIPS/malta: simplify plat_setup_iocoherency
Date:   Mon,  8 Feb 2021 15:50:19 +0100
Message-Id: <20210208145024.3320420-2-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208145024.3320420-1-hch@lst.de>
References: <20210208145024.3320420-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Merge plat_enable_iocoherency into plat_setup_iocoherency to simplify
the code a bit.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/mti-malta/malta-setup.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/arch/mips/mti-malta/malta-setup.c b/arch/mips/mti-malta/malta-setup.c
index e1fb8b5349447e..f3fec5a5a07c76 100644
--- a/arch/mips/mti-malta/malta-setup.c
+++ b/arch/mips/mti-malta/malta-setup.c
@@ -90,7 +90,7 @@ static void __init fd_activate(void)
 }
 #endif
 
-static int __init plat_enable_iocoherency(void)
+static void __init plat_setup_iocoherency(void)
 {
 	int supported = 0;
 	u32 cfg;
@@ -118,19 +118,13 @@ static int __init plat_enable_iocoherency(void)
 		/* Nothing special needs to be done to enable coherency */
 		pr_info("CMP IOCU detected\n");
 		cfg = __raw_readl((u32 *)CKSEG1ADDR(ROCIT_CONFIG_GEN0));
-		if (!(cfg & ROCIT_CONFIG_GEN0_PCI_IOCU)) {
+		if (cfg & ROCIT_CONFIG_GEN0_PCI_IOCU)
+			supported = 1;
+		else
 			pr_crit("IOCU OPERATION DISABLED BY SWITCH - DEFAULTING TO SW IO COHERENCY\n");
-			return 0;
-		}
-		supported = 1;
 	}
-	hw_coherentio = supported;
-	return supported;
-}
 
-static void __init plat_setup_iocoherency(void)
-{
-	if (plat_enable_iocoherency()) {
+	if (supported)
 		if (coherentio == IO_COHERENCE_DISABLED)
 			pr_info("Hardware DMA cache coherency disabled\n");
 		else
@@ -141,6 +135,7 @@ static void __init plat_setup_iocoherency(void)
 		else
 			pr_info("Software DMA cache coherency enabled\n");
 	}
+	hw_coherentio = supported;
 }
 
 static void __init pci_clock_check(void)
-- 
2.29.2

