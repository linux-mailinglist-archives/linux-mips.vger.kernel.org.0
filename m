Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 058B36D5C00
	for <lists+linux-mips@lfdr.de>; Tue,  4 Apr 2023 11:34:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234179AbjDDJeV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Apr 2023 05:34:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234235AbjDDJeT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 4 Apr 2023 05:34:19 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28B5CBB
        for <linux-mips@vger.kernel.org>; Tue,  4 Apr 2023 02:34:18 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 93DDD5C0192;
        Tue,  4 Apr 2023 05:34:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 04 Apr 2023 05:34:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1680600857; x=
        1680687257; bh=BfUSI091MW9zU9+1R2uUETrCx9v36dZHPyHQ41TShFI=; b=0
        9FArhjdqNi9Phe7i5qYL5XamUp/QTXdd7e4y8mBGwgVs3818E9CHige3ghBeLxT6
        q4X0xTCAiQuV53LnlNf4iDDCyt60qvMR2tZ83j3WjYpOvqLY2n6OYdW1JcZJmVpK
        O1ebeyqw9pAwVc3lSoJAdAqH30GHZcmhb8RMO5pL5iwk0dpWu0oRY853xvgyGBX/
        iTC+FTVea3LnWr0X8Sfe1WcrpBqDiWHhM5J2KByaIpfGggPuxxrfThtAH3tKpEoI
        6hKhrWQIxbOeU55nJv2EvNPyKuSzb7Ep4EH+f2QAZAwerF2ID02+lKKfxlhpbw+q
        RgXaWmF4a7XbKDwmER3dA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1680600857; x=
        1680687257; bh=BfUSI091MW9zU9+1R2uUETrCx9v36dZHPyHQ41TShFI=; b=U
        VmIfM8Q9zDTxty6mvk9N6+24wCR7DkC4zM2+4C7uAlGWiRs6Ckof1mpTu/ijK5oK
        Rl/WU9q7U0cmqYsGS3pYwK9IlQbJmP9yqU5CHDfb0oPDY56yXf8Wh/DVujm97vcC
        LrWqX7wazhwQGTNDzUOH2aTzX+oGnX7PEzbhCIQUVEMHJHxxlhyvzvhn8xFsptHU
        jEKQS1Iwpno4H1J3MBZHTstuXm8EyUWsiQbja47nIJE0r6D3HqrtE4tPtez90OWo
        IuZmVnKui5MYevTGCoBH6oYjdGwXFy0Mz13N3sAiYvyxXIrb5K2bt6iqpkbrqV/3
        NUH+Ji78xZfuQdGZDPMzw==
X-ME-Sender: <xms:Ge8rZHPNIejL4yFxzAwSaghTR8f8-GFJrauqhdrPqVcJsan3A94edw>
    <xme:Ge8rZB_o85yd5S8u74lA4cPqWrxF2goO_fdKdGL_QZ4faUj4t2CNNWlwjuOglwE7b
    koF1ruyNQ131pvMmbg>
X-ME-Received: <xmr:Ge8rZGQHWsyiPvGggNfIvbq0vKWHPx3hjy5dPsNz4QnIbuGcdO1_cUanJlwi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:Ge8rZLtpDLLG8ZmuN65IqOV6ozdkn_xPBIo1eBOXjUtLpR7zO3aFqA>
    <xmx:Ge8rZPfK7tQKKTgweG8i8yBXyivUxRQdlLgRUwRgvnmD5V3jasH6AA>
    <xmx:Ge8rZH3xoAKv4uO3I7Ln4GTyWgLJn-AEApJa-WDka5S_Ych8UXKzUQ>
    <xmx:Ge8rZG4ZH5ksRUjG17nbMn9sWwBwA_T51GzuW3djTf81TJTNNn597w>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 05:34:16 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        sergei.shtylyov@gmail.com, aleksander.lobakin@intel.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3 04/12] MIPS: Octeon: Opt-out 4k_cache feature
Date:   Tue,  4 Apr 2023 10:33:43 +0100
Message-Id: <20230404093351.4233-5-jiaxun.yang@flygoat.com>
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
2.39.2 (Apple Git-143)

