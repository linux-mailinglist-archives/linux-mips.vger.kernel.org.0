Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC1723135A8
	for <lists+linux-mips@lfdr.de>; Mon,  8 Feb 2021 15:51:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232690AbhBHOva (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Feb 2021 09:51:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232223AbhBHOvW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Feb 2021 09:51:22 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E49EC061797;
        Mon,  8 Feb 2021 06:50:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=+MpFIGSWgbW0vyKyZJNwqvTHMm0b/1LCjD/m/I6OcLA=; b=l8QZNkyc9h9Gkg7MHmjHOPMmeo
        q2+IKI1aA+GcPLziFUXAqqgC6CO1mt7+UOS3oc6FeQj8r95Be1RAvxBaC+Rjg+uXJX65Dp6ciFn/w
        Ub92Uip65LdtI3DY2x3a/YumwGtIjrEFMIVbf29fnydqca8Ez1rtsJFJpIL2VGn7FvKbeNZhlscwK
        JIgt7E9nMLMt6iJ2OAZZprAVMhY31iQKBRCYduVyV8oR7YXz3roAqihIrYNYr8219uDfTxupvD3Mz
        PAwB3u52Y4itHru2uLBfAFxmEsfqTa2/cY7rAWOgq6I53rWq7pE+j7x7n46s8imMB83erUpWL0roY
        wx42sFog==;
Received: from [2001:4bb8:184:7d04:e3ed:f9d6:78e2:6f0f] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l97s4-0066dy-2G; Mon, 08 Feb 2021 14:50:36 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org
Subject: [PATCH 4/6] MIPS: refactor the maybe coherent DMA indicators
Date:   Mon,  8 Feb 2021 15:50:22 +0100
Message-Id: <20210208145024.3320420-5-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208145024.3320420-1-hch@lst.de>
References: <20210208145024.3320420-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Replace the global coherentio enum, and the hw_coherentio (fake) boolean
variables with a single boolean dma_default_coherent flag.  Only the
malta setup code needs two additional local boolean variables to
preserved the command line overrides.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/alchemy/common/setup.c      |  3 +--
 arch/mips/include/asm/dma-coherence.h | 24 ++++--------------------
 arch/mips/kernel/setup.c              |  8 +++-----
 arch/mips/mm/c-r4k.c                  |  8 ++------
 arch/mips/mti-malta/malta-setup.c     | 24 ++++++++++++++----------
 arch/mips/pci/pci-alchemy.c           |  5 ++---
 6 files changed, 26 insertions(+), 46 deletions(-)

diff --git a/arch/mips/alchemy/common/setup.c b/arch/mips/alchemy/common/setup.c
index c2da68e7984450..39e5b9cd882b10 100644
--- a/arch/mips/alchemy/common/setup.c
+++ b/arch/mips/alchemy/common/setup.c
@@ -65,8 +65,7 @@ void __init plat_mem_setup(void)
 		/* Clear to obtain best system bus performance */
 		clear_c0_config(1 << 19); /* Clear Config[OD] */
 
-	coherentio = alchemy_dma_coherent() ?
-		IO_COHERENCE_ENABLED : IO_COHERENCE_DISABLED;
+	dma_default_coherent = alchemy_dma_coherent();
 
 	board_setup();	/* board specific setup */
 
diff --git a/arch/mips/include/asm/dma-coherence.h b/arch/mips/include/asm/dma-coherence.h
index 5eaa1fcc878a88..846c5ade30d12d 100644
--- a/arch/mips/include/asm/dma-coherence.h
+++ b/arch/mips/include/asm/dma-coherence.h
@@ -9,30 +9,14 @@
 #ifndef __ASM_DMA_COHERENCE_H
 #define __ASM_DMA_COHERENCE_H
 
-enum coherent_io_user_state {
-	IO_COHERENCE_DEFAULT,
-	IO_COHERENCE_ENABLED,
-	IO_COHERENCE_DISABLED,
-};
-
-#if defined(CONFIG_DMA_PERDEV_COHERENT)
-/* Don't provide (hw_)coherentio to avoid misuse */
-#elif defined(CONFIG_DMA_MAYBE_COHERENT)
-extern enum coherent_io_user_state coherentio;
-extern int hw_coherentio;
-
+#ifdef CONFIG_DMA_MAYBE_COHERENT
+extern bool dma_default_coherent;
 static inline bool dev_is_dma_coherent(struct device *dev)
 {
-	return coherentio == IO_COHERENCE_ENABLED ||
-		(coherentio == IO_COHERENCE_DEFAULT && hw_coherentio);
+	return dma_default_coherent;
 }
 #else
-#ifdef CONFIG_DMA_NONCOHERENT
-#define coherentio	IO_COHERENCE_DISABLED
-#else
-#define coherentio	IO_COHERENCE_ENABLED
+#define dma_default_coherent	(!IS_ENABLED(CONFIG_DMA_NONCOHERENT))
 #endif
-#define hw_coherentio	0
-#endif /* CONFIG_DMA_MAYBE_COHERENT */
 
 #endif
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 8e205a4e18c27b..85690957525ac9 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -806,9 +806,7 @@ static int __init debugfs_mips(void)
 arch_initcall(debugfs_mips);
 #endif
 
-#ifdef CONFIG_DMA_MAYBE_COHERENT
-/* User defined DMA coherency from command line. */
-enum coherent_io_user_state coherentio = IO_COHERENCE_DEFAULT;
-EXPORT_SYMBOL_GPL(coherentio);
-int hw_coherentio;	/* Actual hardware supported DMA coherency setting. */
+#ifdef CONFIG_DMA_NONCOHERENT
+bool dma_default_coherent;
+EXPORT_SYMBOL_GPL(dma_default_coherent);
 #endif
diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 4f976d687ab007..58afbc3e4ada03 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -1913,15 +1913,11 @@ void r4k_cache_init(void)
 	__local_flush_icache_user_range	= local_r4k_flush_icache_user_range;
 
 #ifdef CONFIG_DMA_NONCOHERENT
-#ifdef CONFIG_DMA_MAYBE_COHERENT
-	if (coherentio == IO_COHERENCE_ENABLED ||
-	    (coherentio == IO_COHERENCE_DEFAULT && hw_coherentio)) {
+	if (dma_default_coherent) {
 		_dma_cache_wback_inv	= (void *)cache_noop;
 		_dma_cache_wback	= (void *)cache_noop;
 		_dma_cache_inv		= (void *)cache_noop;
-	} else
-#endif /* CONFIG_DMA_MAYBE_COHERENT */
-	{
+	} else {
 		_dma_cache_wback_inv	= r4k_dma_cache_wback_inv;
 		_dma_cache_wback	= r4k_dma_cache_wback_inv;
 		_dma_cache_inv		= r4k_dma_cache_inv;
diff --git a/arch/mips/mti-malta/malta-setup.c b/arch/mips/mti-malta/malta-setup.c
index 33449a2692c3a3..e98cc977a735b2 100644
--- a/arch/mips/mti-malta/malta-setup.c
+++ b/arch/mips/mti-malta/malta-setup.c
@@ -90,9 +90,12 @@ static void __init fd_activate(void)
 }
 #endif
 
+static bool dma_force_coherent;
+static bool dma_force_noncoherent;
+
 static int __init setcoherentio(char *str)
 {
-	coherentio = IO_COHERENCE_ENABLED;
+	dma_force_coherent = true;
 	pr_info("Hardware DMA cache coherency (command line)\n");
 	return 0;
 }
@@ -100,7 +103,7 @@ early_param("coherentio", setcoherentio);
 
 static int __init setnocoherentio(char *str)
 {
-	coherentio = IO_COHERENCE_DISABLED;
+	dma_force_noncoherent = true;
 	pr_info("Software DMA cache coherency (command line)\n");
 	return 0;
 }
@@ -141,17 +144,18 @@ static void __init plat_setup_iocoherency(void)
 	}
 
 	if (supported)
-		if (coherentio == IO_COHERENCE_DISABLED)
+		if (dma_force_noncoherent) {
 			pr_info("Hardware DMA cache coherency disabled\n");
-		else
-			pr_info("Hardware DMA cache coherency enabled\n");
+			return;
+		}
+		pr_info("Hardware DMA cache coherency enabled\n");
+		dma_default_coherent = true;
+	} else if (dma_force_coherent) {
+		pr_info("Hardware DMA cache coherency unsupported, but enabled from command line!\n");
+		dma_default_coherent = true;
 	} else {
-		if (coherentio == IO_COHERENCE_ENABLED)
-			pr_info("Hardware DMA cache coherency unsupported, but enabled from command line!\n");
-		else
-			pr_info("Software DMA cache coherency enabled\n");
+		pr_info("Software DMA cache coherency enabled\n");
 	}
-	hw_coherentio = supported;
 }
 
 static void __init pci_clock_check(void)
diff --git a/arch/mips/pci/pci-alchemy.c b/arch/mips/pci/pci-alchemy.c
index 7285b5667568ef..54c86b40d30498 100644
--- a/arch/mips/pci/pci-alchemy.c
+++ b/arch/mips/pci/pci-alchemy.c
@@ -429,9 +429,8 @@ static int alchemy_pci_probe(struct platform_device *pdev)
 	ctx->alchemy_pci_ctrl.io_map_base = (unsigned long)virt_io;
 
 	/* Au1500 revisions older than AD have borked coherent PCI */
-	if ((alchemy_get_cputype() == ALCHEMY_CPU_AU1500) &&
-	    (read_c0_prid() < 0x01030202) &&
-	    (coherentio == IO_COHERENCE_DISABLED)) {
+	if (alchemy_get_cputype() == ALCHEMY_CPU_AU1500 &&
+	    read_c0_prid() < 0x01030202 && !dma_default_coherent) {
 		val = __raw_readl(ctx->regs + PCI_REG_CONFIG);
 		val |= PCI_CONFIG_NC;
 		__raw_writel(val, ctx->regs + PCI_REG_CONFIG);
-- 
2.29.2

