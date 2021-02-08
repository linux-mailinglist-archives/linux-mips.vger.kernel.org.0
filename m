Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B95413135AA
	for <lists+linux-mips@lfdr.de>; Mon,  8 Feb 2021 15:51:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233000AbhBHOvj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Feb 2021 09:51:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233041AbhBHOvR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 8 Feb 2021 09:51:17 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89413C061794;
        Mon,  8 Feb 2021 06:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=aFhPYGLoYcGU6Ykd7tgOcPfeJpRv4i64UK7IzVFmOyw=; b=Wqn9F2nkW7EbNgVcEA0xn00cNJ
        hFeO35gRq902ZDyisNpxQ8AFhzSiiDH/qqV01qfYQWB1Q2Jte25pCcvxR434YjVVtD1agFVmfdymc
        AoWQKf5rVR/uToJTh634oN5kGvvyTyI7noVlej1gVzEECH/KS5Op/RrkhuTz2eAPv+PpMAsV9YY1L
        LnO6k3xvBNCfBqCltBPURv5KDWNbfz6LrxrZnmCNuwumtVzpBX/qHojQBvaVgGVoOEExwIxoUr3uc
        Hnj9DwW2nJLtOE+RLTp+TH4BVOaC2LllrA3evV8K34E5kPxtJjLsSHm2+sQepCAvAQLFvo06mBFO3
        YaM+kojQ==;
Received: from [2001:4bb8:184:7d04:e3ed:f9d6:78e2:6f0f] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l97s1-0066ds-Nf; Mon, 08 Feb 2021 14:50:34 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org
Subject: [PATCH 3/6] MIPS: move the {no,}nocoherentio options to the malta setup code
Date:   Mon,  8 Feb 2021 15:50:21 +0100
Message-Id: <20210208145024.3320420-4-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208145024.3320420-1-hch@lst.de>
References: <20210208145024.3320420-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There are only two MIPS platforms that are conditionally DMA coherent.
Of those alchemcy forces the coherentcy base on the platform, while
malta allows a mix of hardware defaults and manual overrides.  Move the
command line options for these overrides to the malta setup code, as
they can't have an effect for alchemy.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/kernel/setup.c          | 16 ----------------
 arch/mips/mti-malta/malta-setup.c | 16 ++++++++++++++++
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 7e1f8e2774373d..8e205a4e18c27b 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -811,20 +811,4 @@ arch_initcall(debugfs_mips);
 enum coherent_io_user_state coherentio = IO_COHERENCE_DEFAULT;
 EXPORT_SYMBOL_GPL(coherentio);
 int hw_coherentio;	/* Actual hardware supported DMA coherency setting. */
-
-static int __init setcoherentio(char *str)
-{
-	coherentio = IO_COHERENCE_ENABLED;
-	pr_info("Hardware DMA cache coherency (command line)\n");
-	return 0;
-}
-early_param("coherentio", setcoherentio);
-
-static int __init setnocoherentio(char *str)
-{
-	coherentio = IO_COHERENCE_DISABLED;
-	pr_info("Software DMA cache coherency (command line)\n");
-	return 0;
-}
-early_param("nocoherentio", setnocoherentio);
 #endif
diff --git a/arch/mips/mti-malta/malta-setup.c b/arch/mips/mti-malta/malta-setup.c
index f3fec5a5a07c76..33449a2692c3a3 100644
--- a/arch/mips/mti-malta/malta-setup.c
+++ b/arch/mips/mti-malta/malta-setup.c
@@ -90,6 +90,22 @@ static void __init fd_activate(void)
 }
 #endif
 
+static int __init setcoherentio(char *str)
+{
+	coherentio = IO_COHERENCE_ENABLED;
+	pr_info("Hardware DMA cache coherency (command line)\n");
+	return 0;
+}
+early_param("coherentio", setcoherentio);
+
+static int __init setnocoherentio(char *str)
+{
+	coherentio = IO_COHERENCE_DISABLED;
+	pr_info("Software DMA cache coherency (command line)\n");
+	return 0;
+}
+early_param("nocoherentio", setnocoherentio);
+
 static void __init plat_setup_iocoherency(void)
 {
 	int supported = 0;
-- 
2.29.2

