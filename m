Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 300D931630B
	for <lists+linux-mips@lfdr.de>; Wed, 10 Feb 2021 11:00:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230301AbhBJJ7q (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Feb 2021 04:59:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230364AbhBJJ5a (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Feb 2021 04:57:30 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8C57C06174A;
        Wed, 10 Feb 2021 01:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=7mvLgu1+Gyqd04nyTJl2tT4bnW3tEVEKyJ4XIZnRr1Y=; b=ieikQQAMDHkfRGHAsR3EZ4LdRF
        XHtcGxUwEVvFbFsRfy+TLDLAPGUrnkuC7+jMiQay2ou/D8WJh7S9PzTIwqnG+tobigY50b8OBfols
        UXn+wasaF6b/BBgjAE6f+q+ocziytpwDr7DvTFflWrDN2eipufomVE3drrox0nsMxxIm+QuArUdOz
        oDFWtDIsRT3yQZJuZB8/Lcyd5ASvzxnMijIhRh+QZkiWatE0fOwHe/duzmC28AeOm72G9RrPXyM9e
        sB5rmSqABEuLkZwfpsd+obDpLC8xOMAipLnLm8za4elA1gjc8ZrZZS+M5W3OP1i7xm8tsTl4m6OGq
        zg5ogTaQ==;
Received: from [2001:4bb8:184:7d04:5e70:671e:7b3:191] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l9mEo-008g4A-JP; Wed, 10 Feb 2021 09:56:47 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org
Subject: [PATCH 1/6] MIPS/malta: simplify plat_setup_iocoherency
Date:   Wed, 10 Feb 2021 10:56:36 +0100
Message-Id: <20210210095641.23856-2-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210095641.23856-1-hch@lst.de>
References: <20210210095641.23856-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Given that plat_mem_setup runs before earlyparams are handled and malta
selects CONFIG_DMA_MAYBE_COHERENT, coherentio can only be set to
IO_COHERENCE_DEFAULT at this point.  So remove the checking for other
options and merge plat_enable_iocoherency into plat_setup_iocoherency
to simplify the code a bit.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/mti-malta/malta-setup.c | 32 +++++++++----------------------
 1 file changed, 9 insertions(+), 23 deletions(-)

diff --git a/arch/mips/mti-malta/malta-setup.c b/arch/mips/mti-malta/malta-setup.c
index e1fb8b5349447e..4caff9e3b45637 100644
--- a/arch/mips/mti-malta/malta-setup.c
+++ b/arch/mips/mti-malta/malta-setup.c
@@ -90,16 +90,15 @@ static void __init fd_activate(void)
 }
 #endif
 
-static int __init plat_enable_iocoherency(void)
+static void __init plat_setup_iocoherency(void)
 {
-	int supported = 0;
 	u32 cfg;
 
 	if (mips_revision_sconid == MIPS_REVISION_SCON_BONITO) {
 		if (BONITO_PCICACHECTRL & BONITO_PCICACHECTRL_CPUCOH_PRES) {
 			BONITO_PCICACHECTRL |= BONITO_PCICACHECTRL_CPUCOH_EN;
 			pr_info("Enabled Bonito CPU coherency\n");
-			supported = 1;
+			hw_coherentio = 1;
 		}
 		if (strstr(fw_getcmdline(), "iobcuncached")) {
 			BONITO_PCICACHECTRL &= ~BONITO_PCICACHECTRL_IOBCCOH_EN;
@@ -118,29 +117,16 @@ static int __init plat_enable_iocoherency(void)
 		/* Nothing special needs to be done to enable coherency */
 		pr_info("CMP IOCU detected\n");
 		cfg = __raw_readl((u32 *)CKSEG1ADDR(ROCIT_CONFIG_GEN0));
-		if (!(cfg & ROCIT_CONFIG_GEN0_PCI_IOCU)) {
+		if (cfg & ROCIT_CONFIG_GEN0_PCI_IOCU)
+			hw_coherentio = 1;
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
-		if (coherentio == IO_COHERENCE_DISABLED)
-			pr_info("Hardware DMA cache coherency disabled\n");
-		else
-			pr_info("Hardware DMA cache coherency enabled\n");
-	} else {
-		if (coherentio == IO_COHERENCE_ENABLED)
-			pr_info("Hardware DMA cache coherency unsupported, but enabled from command line!\n");
-		else
-			pr_info("Software DMA cache coherency enabled\n");
-	}
+	if (hw_coherentio)
+		pr_info("Hardware DMA cache coherency enabled\n");
+	else
+		pr_info("Software DMA cache coherency enabled\n");
 }
 
 static void __init pci_clock_check(void)
-- 
2.29.2

