Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B647D31630C
	for <lists+linux-mips@lfdr.de>; Wed, 10 Feb 2021 11:00:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230356AbhBJJ7z (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Feb 2021 04:59:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230374AbhBJJ5e (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 10 Feb 2021 04:57:34 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A72EC061756;
        Wed, 10 Feb 2021 01:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=8LNOsPgjWIgMUBWaUxbVqhVEgDcpqshclRns6ZWbyUk=; b=Tb6BTJyVgqk6wZXJPDM/6g+NVX
        f3Y5oD+Htxwy08eJQg7Lf+U6wJ8D+KkflU2o8pV3wtTHqLdt3nfDeEYp2ZCNItD+wnC6GwzmWmwEA
        AwnpaGrua8tl6O+4WVoJLMW/sVfqTekXHplkJrQ1ax6FgOTmR4QIdGEJvFtANlNHgt/wh5J6KcvLA
        a3CQq9eVdTx6squwDFR02NEEP/8pEs/mh6hQQC0FAmA+KKDS7jzMnYspEwqmGov0iukbmnVp4nTZD
        Ug1IKJmsinE/CFTnDwHAQ0EJQyR0RTY2BA2v+gRiSMskS/PKGheTlUty6k44LzwYgvILc3izbUtQU
        m/HE1H4A==;
Received: from [2001:4bb8:184:7d04:5e70:671e:7b3:191] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l9mEr-008g4I-L1; Wed, 10 Feb 2021 09:56:50 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org
Subject: [PATCH 2/6] MIPS/alchemy: factor out the DMA coherent setup
Date:   Wed, 10 Feb 2021 10:56:37 +0100
Message-Id: <20210210095641.23856-3-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210095641.23856-1-hch@lst.de>
References: <20210210095641.23856-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Factor out a alchemy_dma_coherent helper that determines if the platform
is DMA coherent.  Also stop initializing the hw_coherentio variable, given
that is only ever set to a non-zero value by the malta setup code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/alchemy/common/setup.c | 33 ++++++++++++++++++--------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/arch/mips/alchemy/common/setup.c b/arch/mips/alchemy/common/setup.c
index 0f60efe0481ecc..c2da68e7984450 100644
--- a/arch/mips/alchemy/common/setup.c
+++ b/arch/mips/alchemy/common/setup.c
@@ -37,6 +37,23 @@
 extern void __init board_setup(void);
 extern void __init alchemy_set_lpj(void);
 
+static bool alchemy_dma_coherent(void)
+{
+	switch (alchemy_get_cputype()) {
+	case ALCHEMY_CPU_AU1000:
+	case ALCHEMY_CPU_AU1500:
+	case ALCHEMY_CPU_AU1100:
+		return false;
+	case ALCHEMY_CPU_AU1200:
+		/* Au1200 AB USB does not support coherent memory */
+		if ((read_c0_prid() & PRID_REV_MASK) == 0)
+			return false;
+		return true;
+	default:
+		return true;
+	}
+}
+
 void __init plat_mem_setup(void)
 {
 	alchemy_set_lpj();
@@ -48,20 +65,8 @@ void __init plat_mem_setup(void)
 		/* Clear to obtain best system bus performance */
 		clear_c0_config(1 << 19); /* Clear Config[OD] */
 
-	hw_coherentio = 0;
-	coherentio = IO_COHERENCE_ENABLED;
-	switch (alchemy_get_cputype()) {
-	case ALCHEMY_CPU_AU1000:
-	case ALCHEMY_CPU_AU1500:
-	case ALCHEMY_CPU_AU1100:
-		coherentio = IO_COHERENCE_DISABLED;
-		break;
-	case ALCHEMY_CPU_AU1200:
-		/* Au1200 AB USB does not support coherent memory */
-		if (0 == (read_c0_prid() & PRID_REV_MASK))
-			coherentio = IO_COHERENCE_DISABLED;
-		break;
-	}
+	coherentio = alchemy_dma_coherent() ?
+		IO_COHERENCE_ENABLED : IO_COHERENCE_DISABLED;
 
 	board_setup();	/* board specific setup */
 
-- 
2.29.2

