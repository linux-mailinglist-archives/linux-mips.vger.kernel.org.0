Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8FEF6AACE5
	for <lists+linux-mips@lfdr.de>; Sat,  4 Mar 2023 23:15:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbjCDWPj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 4 Mar 2023 17:15:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjCDWPi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 4 Mar 2023 17:15:38 -0500
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D42C512F22
        for <linux-mips@vger.kernel.org>; Sat,  4 Mar 2023 14:15:36 -0800 (PST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 7AF9B5C0101;
        Sat,  4 Mar 2023 17:15:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sat, 04 Mar 2023 17:15:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1677968135; x=
        1678054535; bh=6wu56FuUf5PEAXYiDOFQaP4gNqab8JFzm14DGfaET4A=; b=L
        fND/DOLdlKm1ufsqFjiyx/iq6zK3mgNu8lCHOzcDvx0fqfQ/UkuSoAJTd4KjrPfj
        QEk+Xq0vgk1JlOSz5gCnw/tmS7HuJeKhW5YXvrEu7j7Calg3SoBeHnDkd2t+i6tN
        RTE1k4MRlQr+1jhZYsrg/WEBdlu801CcN1GQEue57LiFNaF1ZhQM7u7o9bDlP2hL
        6ws22/HQaX1MeQ87bt+3vUPYtVPNh/VL4SjlKKN19d5NpEhM2d16tj6TCylR7Qg6
        PCjRqZ63eIscGEyAw5VSBculbeITTxO1+lPQSCstaOhQBctoDeWjcYrWjGPskRNq
        ELMO3KFUV5caxtMZU5hjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677968135; x=
        1678054535; bh=6wu56FuUf5PEAXYiDOFQaP4gNqab8JFzm14DGfaET4A=; b=H
        89j96yLIvbyugdaT84BvLRHQTCOQ+neMTQA34R/4zAfD3gORk/5gaANOIM/3onIb
        f+vwyG15ewIwdFgvIiXl97j9E9tCWLnfvOgmg0onyCrkRTIcSRYCjwBNBLL7xSLv
        l0KRfOC0JAdks35sZTBiy5MOGVDBYte9mEV6uoW0zB1RKtUwd8iEQQ5lL3wbzrRK
        Qgr/C3Il0DjqR2DtoA4x/oh0Fs7U4v+MQQjOqHM/3xkoWZbIf5bjSH+srEb2/kkx
        fofnkXi4CTT/7h0KxQteD7PLwtszi+WcTTF51HWwDidbvL7nBov/QGP4ZQFqgyLk
        2SlDzp4EHMC2M+hGgCPLQ==
X-ME-Sender: <xms:B8MDZFRODksUtYU_t5gaVy1jD7aTzwlv8izY3mkXa5Xz7W93KitESg>
    <xme:B8MDZOzt3CShWCcPno0Vp-UFHOzEVpw8ZwVQwpL7KE9CrYqs6lHLFqGSqGN2B2Hi2
    1_0LLJ-A1C6jH6oDKA>
X-ME-Received: <xmr:B8MDZK2twyQRyrnjag8Kcvm1aMjUE8RHIOR1UT6qngvFYolxY4oeM2kyioXf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtuddgudehhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
    ekredtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigr
    nhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeefledufeehgedvue
    dvvdegkefgvddttedtleeiiefhgeetudegkefhvdfhjeeftdenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflh
    ihghhorghtrdgtohhm
X-ME-Proxy: <xmx:B8MDZNDMudv66Rr-SHdV65qGN77kdjLUuBo5xwFSeipSVbQqziXdQA>
    <xmx:B8MDZOjYIuhCRXM5bJy91OvAoURtFm6LMB1LOEpv2bwWNxPHYL1zqg>
    <xmx:B8MDZBpnfczXh0mgW-RHIlW6exc_QQKwmOEKN_nHkDRCAC4A_UTPtQ>
    <xmx:B8MDZBsbib_if6ArALbSxdNSZO-2Jcm4fPm0DMGzki-2FT_wxf9iRw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 4 Mar 2023 17:15:34 -0500 (EST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 01/12] MIPS: Move declaration of bcache ops to cache.c
Date:   Sat,  4 Mar 2023 22:15:13 +0000
Message-Id: <20230304221524.47160-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230304221524.47160-1-jiaxun.yang@flygoat.com>
References: <20230304221524.47160-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

bcache is not tied to CPU's cache interface. Just move those
declaration to cache.c so it can be avaialble to CPU with all
cache types.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/mm/c-r4k.c | 14 --------------
 arch/mips/mm/cache.c | 17 +++++++++++++++++
 2 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index a549fa98c2f4..fd660d5c5328 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -110,20 +110,6 @@ static unsigned long dcache_size __read_mostly;
 static unsigned long vcache_size __read_mostly;
 static unsigned long scache_size __read_mostly;
 
-/*
- * Dummy cache handling routines for machines without boardcaches
- */
-static void cache_noop(void) {}
-
-static struct bcache_ops no_sc_ops = {
-	.bc_enable = (void *)cache_noop,
-	.bc_disable = (void *)cache_noop,
-	.bc_wback_inv = (void *)cache_noop,
-	.bc_inv = (void *)cache_noop
-};
-
-struct bcache_ops *bcops = &no_sc_ops;
-
 #define cpu_is_r4600_v1_x()	((read_c0_prid() & 0xfffffff0) == 0x00002010)
 #define cpu_is_r4600_v2_x()	((read_c0_prid() & 0xfffffff0) == 0x00002020)
 
diff --git a/arch/mips/mm/cache.c b/arch/mips/mm/cache.c
index 11b3e7ddafd5..25cedd6ee572 100644
--- a/arch/mips/mm/cache.c
+++ b/arch/mips/mm/cache.c
@@ -17,6 +17,7 @@
 #include <linux/highmem.h>
 #include <linux/pagemap.h>
 
+#include <asm/bcache.h>
 #include <asm/cacheflush.h>
 #include <asm/processor.h>
 #include <asm/cpu.h>
@@ -56,6 +57,22 @@ EXPORT_SYMBOL_GPL(local_flush_data_cache_page);
 EXPORT_SYMBOL(flush_data_cache_page);
 EXPORT_SYMBOL(flush_icache_all);
 
+#ifdef CONFIG_BOARD_SCACHE
+/*
+ * Dummy cache handling routines for machines without boardcaches
+ */
+static void cache_noop(void) {}
+
+static struct bcache_ops no_sc_ops = {
+	.bc_enable = (void *)cache_noop,
+	.bc_disable = (void *)cache_noop,
+	.bc_wback_inv = (void *)cache_noop,
+	.bc_inv = (void *)cache_noop
+};
+
+struct bcache_ops *bcops = &no_sc_ops;
+#endif
+
 #ifdef CONFIG_DMA_NONCOHERENT
 
 /* DMA cache operations. */
-- 
2.34.1

