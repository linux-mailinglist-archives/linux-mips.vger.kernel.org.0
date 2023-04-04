Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C00F26D5BFD
	for <lists+linux-mips@lfdr.de>; Tue,  4 Apr 2023 11:34:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233160AbjDDJeS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Apr 2023 05:34:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233706AbjDDJeR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 4 Apr 2023 05:34:17 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34543BB
        for <linux-mips@vger.kernel.org>; Tue,  4 Apr 2023 02:34:14 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id A028C5C00C3;
        Tue,  4 Apr 2023 05:34:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 04 Apr 2023 05:34:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1680600853; x=
        1680687253; bh=ccKPLYfcy4UpmxohEMAlTAkJR5esvltg9ql6FRiqLRI=; b=f
        FB8rxox2SFZco2QxffzlnQjHX9uMvV126TISgUzFk5Nwgfe6FYYWZWIRGvVkXcBp
        0G9JgKkBgqfK9oJN2dthOpWvDvrdlYQQhWQoS14poUkpz3phdnKJsfSG/V0TuXlY
        wk0vx/G7Vp3A/eHY0yeKss6v2HdezJ4p9uacIRkXjHOXASTdkrKAl5DXATd91c19
        9eo6JAYKtoWyGsdjKuOPdxDURsn8s3LOSw8ieW2eaUrMlWZhd0F05CJ1j4jq9CV/
        y3x6i8JYzD5P4AWyaECRqX7rjzeZ5WzN5sEHeExYRB6rLEZ5qKr+8lL+AuKV2Tuq
        BsAYgLpg9IpW2jKfDdP6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1680600853; x=
        1680687253; bh=ccKPLYfcy4UpmxohEMAlTAkJR5esvltg9ql6FRiqLRI=; b=g
        Dygsva6o7WQDYQDBiCvmGsIw0ryDC6U5GTJJ0TBxQUQfHiDl3FRJhFf1nCe6IwW8
        1AMHvIvjXpEJSD/ZsNrPg+jfRzh8NUCWztzfJB7bJ4ipf6v3eEB6c1Whdq3NRKZ5
        8R3hwykE6CggHhZVkYdfU/i+6KGxwI7rMhOxGnH7PBoF51pMZb9h2o/u8G5meL9n
        1hSeWCNpxmuKit9rrvnYUTVBosc7RMh8JJd35F6dCvhiDVUj5PVI3BW/FLSbdc7i
        PoUv+5iXt3brV5trcQo+zxvdisBaDCDFH/r/p/wmdPg1WZ2qOkvpINEjYlk8j6en
        7B70ATQNyOQe3znB3d0Iw==
X-ME-Sender: <xms:Fe8rZGVitx-3Ku6FgwwhknlQyAEN6bV1uwGgRdkZZgIKSAa_jD8MGQ>
    <xme:Fe8rZCm_jdbkOfSjk0cR8QmKIgq17r3p253zkRMoHRATwDoz42A5AbohvbBJEo0m4
    kKrhFLx5p5il_Duw68>
X-ME-Received: <xmr:Fe8rZKaSRXNA-X5x1fQYLf9_oM7TJflRBgYzHcESSBxgnw8-9Nw_Q1qFAWzF>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:Fe8rZNUATAC-6AeDUQeikHicv-CH-v83KBfBumKn-LzMLc_cw8wiiw>
    <xmx:Fe8rZAl9ux-wNYL61zj99Yj_X5xNbZtkpR2AdNLe9ByRz5pEAr5z_g>
    <xmx:Fe8rZCfvXIiaPJkh9R_hnsTq-tK7ngi_xYetT6Xu3wfJ9iQiiBeX6Q>
    <xmx:Fe8rZBBhytMZAE85Ibzq9mnyiztYBYW8gCz9ZhQLqYJT3bcPLC6bKQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 05:34:12 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        sergei.shtylyov@gmail.com, aleksander.lobakin@intel.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3 01/12] MIPS: Move declaration of bcache ops to cache.c
Date:   Tue,  4 Apr 2023 10:33:40 +0100
Message-Id: <20230404093351.4233-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230404093351.4233-1-jiaxun.yang@flygoat.com>
References: <20230404093351.4233-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
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
v3: Declear cache_noop as a global symbol
---
 arch/mips/include/asm/cache.h |  2 ++
 arch/mips/mm/c-r4k.c          | 14 --------------
 arch/mips/mm/cache.c          | 19 +++++++++++++++++++
 3 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/arch/mips/include/asm/cache.h b/arch/mips/include/asm/cache.h
index 29187e12b861..3424a7908c0f 100644
--- a/arch/mips/include/asm/cache.h
+++ b/arch/mips/include/asm/cache.h
@@ -16,4 +16,6 @@
 
 #define __read_mostly __section(".data..read_mostly")
 
+extern void cache_noop(void);
+
 #endif /* _ASM_CACHE_H */
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
index 11b3e7ddafd5..7dba4b5c02c3 100644
--- a/arch/mips/mm/cache.c
+++ b/arch/mips/mm/cache.c
@@ -17,6 +17,7 @@
 #include <linux/highmem.h>
 #include <linux/pagemap.h>
 
+#include <asm/bcache.h>
 #include <asm/cacheflush.h>
 #include <asm/processor.h>
 #include <asm/cpu.h>
@@ -56,6 +57,24 @@ EXPORT_SYMBOL_GPL(local_flush_data_cache_page);
 EXPORT_SYMBOL(flush_data_cache_page);
 EXPORT_SYMBOL(flush_icache_all);
 
+/*
+ * Dummy cache handling routine
+ */
+
+void cache_noop(void) {}
+
+#ifdef CONFIG_BOARD_SCACHE
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
2.39.2 (Apple Git-143)

