Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45DC06C2F74
	for <lists+linux-mips@lfdr.de>; Tue, 21 Mar 2023 11:49:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230408AbjCUKtY (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 21 Mar 2023 06:49:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbjCUKtU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 21 Mar 2023 06:49:20 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F094ACC29
        for <linux-mips@vger.kernel.org>; Tue, 21 Mar 2023 03:49:09 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 82EA83200C5B;
        Tue, 21 Mar 2023 06:49:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 21 Mar 2023 06:49:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1679395748; x=
        1679482148; bh=eAsPTvVEioK0QszbY/FDpc0oedKcpD+iJBaaQUCaDB4=; b=3
        ghdxPSh4r8qyremRyB9Q5/8JtofCv4CzpDnStzv7glQTQGJsO54sF5Je+X7AEPtE
        AEUMwKQBSkUfAnoXHijFKwnXUJazsCDU2fN2vtohvIs3anMfd8h1HcdqWOZ91UER
        +OrVIVYpgD2dg8cQ55ffGtNgojAheqPIZ8vxZe/CZp2OmtrXHuAV7XM5Z44kwzCr
        POteH8VTG0WflZ9knRUvRYDlmA0OgdnLbMogZnhvMlgQgkiMbhYSivEpuIjw9Cex
        tdHsGCS7j2j0gMTPia1nzWcNtd7CjdgZWWAFI7ew1wEWyMxtdAgV62/hjam1E6CD
        A9yPCM/XfMBn85Byh2Ghg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1679395748; x=
        1679482148; bh=eAsPTvVEioK0QszbY/FDpc0oedKcpD+iJBaaQUCaDB4=; b=h
        V3R2qvs37wUJfenvO6xjYYywW9SUaHDwDSVp4vDDBEUm7W7DJmTxqcGg8Qy4Ftrp
        BrdlAFMP19r4fHM9FUsWpgAel3wm+K20joXIlBXYrUHTs+I+yVi1cbgEt0kqPOjM
        1PfGvbblcozPfhQyiQN59DZ/GdgvsILieQJTG6A9sKiN28Q+WssbQ/k3TJ4q+OLX
        +kYDxpGlMBTM2B5WS9OpqrpCa7CDjgX3HqjkDqacYB+r3EuhSd9wZux2Xos/YHRz
        tp3dJ+xfzoCy1q1BX1huPomxBK82FQU0XX88vqwCfg8MzdyNfip9/du7vBHxQNTo
        dV7qUnkDcYCQDkq7+bcfg==
X-ME-Sender: <xms:o4sZZGDkTeGjkWSNNG7jLnR1-SZ2NaWkPDSt-QxbcatjNf3Y1EGPFQ>
    <xme:o4sZZAiZzvlF2svRdhr0w9gb7bPyPpp2sNQ_BguBA3PjjS0VNiFTZKfDcqG3GCq9J
    crel9G59JIIpCtsfZw>
X-ME-Received: <xmr:o4sZZJmwNPUAgM-kT8r5X59E-hryNN3_fs3PkOB541DIFmyNd52rl1lD6EIcfS63ridZYelQ5cI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegtddgvddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:pIsZZEwTCH6SExbQEw2k9-o7YLoQbJE-0T7pcG8dhz55Z2rprj-LXQ>
    <xmx:pIsZZLRDGtmdihA6kEsNy5qUYuRXjnlwRGV5YpO7PhkMX9wKyOP9IQ>
    <xmx:pIsZZPYn2Qum8j9zDWYQozl7D63WQSY0fEYRatkyuXuzUxAJPijT5w>
    <xmx:pIsZZJOMDLD4Y2-ckOBkbrJALEbNYyoVTU9akB7JYAd0yTEzwuMBfw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Mar 2023 06:49:07 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        sergei.shtylyov@gmail.com, aleksander.lobakin@intel.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 04/12] MIPS: Octeon: Opt-out 4k_cache feature
Date:   Tue, 21 Mar 2023 10:48:44 +0000
Message-Id: <20230321104852.25284-5-jiaxun.yang@flygoat.com>
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

Octeon has a different cache interface with traditional R4K one,
just opt-out this flag for octeon to avoid run R4K cache initialization
code accidentally.

Also remove ISA level assumption for 4k cache.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/cpu-features.h | 2 +-
 arch/mips/kernel/cpu-probe.c         | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
index c0983130a44c..c613426b0bfc 100644
--- a/arch/mips/include/asm/cpu-features.h
+++ b/arch/mips/include/asm/cpu-features.h
@@ -118,7 +118,7 @@
 #define cpu_has_3k_cache	__isa_lt_and_opt(1, MIPS_CPU_3K_CACHE)
 #endif
 #ifndef cpu_has_4k_cache
-#define cpu_has_4k_cache	__isa_ge_or_opt(1, MIPS_CPU_4K_CACHE)
+#define cpu_has_4k_cache	__opt(MIPS_CPU_4K_CACHE)
 #endif
 #ifndef cpu_has_octeon_cache
 #define cpu_has_octeon_cache	0
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index 7ddf07f255f3..6d15a398d389 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1602,6 +1602,8 @@ static inline void cpu_probe_broadcom(struct cpuinfo_mips *c, unsigned int cpu)
 static inline void cpu_probe_cavium(struct cpuinfo_mips *c, unsigned int cpu)
 {
 	decode_configs(c);
+	/* Octeon has different cache interface */
+	c->options &= ~MIPS_CPU_4K_CACHE;
 	switch (c->processor_id & PRID_IMP_MASK) {
 	case PRID_IMP_CAVIUM_CN38XX:
 	case PRID_IMP_CAVIUM_CN31XX:
-- 
2.37.1 (Apple Git-137.1)

