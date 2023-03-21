Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D31DF6C2F70
	for <lists+linux-mips@lfdr.de>; Tue, 21 Mar 2023 11:49:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230399AbjCUKtO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Mar 2023 06:49:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230393AbjCUKtJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Mar 2023 06:49:09 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30F38126C8
        for <linux-mips@vger.kernel.org>; Tue, 21 Mar 2023 03:49:03 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id CC3573200C58;
        Tue, 21 Mar 2023 06:49:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Tue, 21 Mar 2023 06:49:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1679395741; x=
        1679482141; bh=/MYU/KjfY+eo4EoIzkIiiVQPtTUroJQHgDHBxvs4x8s=; b=x
        bsWvhl+89ujbzsOUVvXukiO0UDpMssxbjh//Lf3xn1oqaoU2PXIQM0IcQcIqygy3
        7PunKNE+sjzceROrB5aZwkUXVjFwp0+D46R+EmDnT6z1pl6/KRh8LAg9gNAwzNY7
        EQh2vad+NCDKcI/Ay6C35ObvRqyK2S3aEkXjcwGz8x2DlFqb5FcfG+FK1VK/rhrr
        cDkvsVoclhpZnpG51o3ClOjI+1jM01zf/vVd4WNC1GfGhk3X3iGcRfJugsMD1aqr
        7E9JUprbb/ceCiZG9QQW4GGH0GQyQ1dSDECfp0VCshMuOIofxPl5wZO+WzM10ilp
        OSOhVjtY5ADXI2TRpYKpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1679395741; x=
        1679482141; bh=/MYU/KjfY+eo4EoIzkIiiVQPtTUroJQHgDHBxvs4x8s=; b=B
        lDKL+Ci/FV9HP1E5CqM2or+wM0apqNY1OIf8vy440uGRrkK/xgzSWz3rSzpFf+Pa
        rs6utld7vXcWtb5SSNn9+75Sx0H70Mxwe8P3/r53NhBkBIbVnyFS/CPU8wlCtZ/g
        U1oPudmh/0QbniWWNHSWHB2bvlQMQSMUrLa3NyY6WDdOHm6xHqXfKs9GaB4QntI8
        Lib11+63jmL9emCBgIyF7DvUwKTMGYUw/rPAs5bzw2yKIBZwApwMsjRrb8+CBsx1
        I6+a0mYtn17eQv1X/YoRGL8F1lGlZI55wjnpRnkng5TNlJ5WjZ7rngopEOkVD0eh
        tJhQG+E6zfgxwQskyWgpg==
X-ME-Sender: <xms:nYsZZEEGG_OKGqTIVWesDbnyylVxgKLxmIHui9emsMIh4QEbqGAN2g>
    <xme:nYsZZNUrAjTZD6jdHeSzdKlPDwf9guSOTn-A2hyFoprEPBKGL8Qj_s7XfRkmnJ5Wi
    vBATZ_e3d7OcZnB6vg>
X-ME-Received: <xmr:nYsZZOJfCi6CWAkx-2C-TtTm2eu6YQJYTtwqeC8v3witgUl3L_kKkiIyOYStR2X7_IIHKpixRWs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegtddgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:nYsZZGFLy5HwLkwzycJmx-dKauv3VYaSdjWw0TqfEz1RgZJ3sHJetw>
    <xmx:nYsZZKUC-JD_O4CeqUWD1u-sZlKOVJmk0Wt4onfnwYMj2FdeVwhBXg>
    <xmx:nYsZZJP6-5LzHp1zSxfqaGJH-8Nb8D1yNyeqdLUus1rNbZty9UsLiQ>
    <xmx:nYsZZIxpVn_-9zYFbbjb7Qwat5PR1aaRX_6NhMxuv86JVUz5vMZKdQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Mar 2023 06:49:00 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        sergei.shtylyov@gmail.com, aleksander.lobakin@intel.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 01/12] MIPS: Move declaration of bcache ops to cache.c
Date:   Tue, 21 Mar 2023 10:48:41 +0000
Message-Id: <20230321104852.25284-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230321104852.25284-1-jiaxun.yang@flygoat.com>
References: <20230321104852.25284-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
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
2.37.1 (Apple Git-137.1)

