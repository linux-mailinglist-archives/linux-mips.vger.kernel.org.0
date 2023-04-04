Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E9866D5C01
	for <lists+linux-mips@lfdr.de>; Tue,  4 Apr 2023 11:34:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234235AbjDDJeV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Apr 2023 05:34:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233983AbjDDJeU (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 4 Apr 2023 05:34:20 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7655DE6E
        for <linux-mips@vger.kernel.org>; Tue,  4 Apr 2023 02:34:19 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id E23945C01DA;
        Tue,  4 Apr 2023 05:34:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Tue, 04 Apr 2023 05:34:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1680600858; x=
        1680687258; bh=jbI6xS0GXzwGgILPBf3RXFTgJP3RKu1KqM31xeCowQI=; b=0
        BxofeiX9JR+8iz6z+TUjNxssFehW7L6jQYZDe23aQYEYbPFTGNCYQrDEUu3ZcoPb
        0ys2HSG/St62kUV/pvabCrNj5dGMbANEDXX8npm+QoZC0nSAL8kA7u02DZCY0kFV
        TINRBQvBqjuWwRUDq1c/VRw3QYcrlpUQkzn5hVLHtGhAKjoykJwz/hIjeI7sVCjS
        1maH92wwg/7TmCYK4VIH3x1eyPuql9gqzFVMfV6CUM3VwaMLirFr0oMUuvuvSah2
        OugQpEijR9e/YVxRbHGfjO5m7WULcfjg2mDmMmLo2Hd84qASAOghDmCoLbku1X4L
        HB26tT+kM9RjGq3co+4OA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1680600858; x=
        1680687258; bh=jbI6xS0GXzwGgILPBf3RXFTgJP3RKu1KqM31xeCowQI=; b=R
        rmAc4p39Fe0rxtreocAMyG5Vdp1IuNpO252qXYRzKs9AW4awU5L+tgEoPqXcNt0k
        FK2Opbe4APRN0fuaQzIqclP6zVTE3tMLLOYKef5OSlDGFIGHW+/qZdjtNF6UOGOw
        jU1SvXRz/qyJ1t0zpyFqcv7n9AYpqwU1ZEyrkphi1zjOMfy1GLJenvDFrENfFwyg
        WmBZ2beYeD2xpdWbaXoDwCnhw30N0Sfn1FZvagOLSA1/rbjIGXn/N0L5ndyc6Tjk
        Mut0X3uGD9e8FTKsyqcbTGKeSbzZTa3Fx9vDkF5zCi/zEpD3bbgTgDGkwOv+tjLN
        1gXPJu1shkKCLLqteSuJQ==
X-ME-Sender: <xms:Gu8rZEyxz62T5h9StQOS248qvvP5eQCkrPF_HGqMn-efzuU1kc_rEA>
    <xme:Gu8rZIThvjy0pqoTR_Ft1Qxwvz7QYo4f4b50l7HJFdXZxJR-ospKpnPHs20ofBPjN
    ww7-FECiJ7QHhZilRA>
X-ME-Received: <xmr:Gu8rZGX18rBM-fEGoU6JUleNy3OtTlme6D4wvsnemdo4KN5XitkmuQrvWuiH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:Gu8rZCim6rNds33GeyQBv68aLEse3bXMQodXdXp06ptXwsFHTLOORA>
    <xmx:Gu8rZGBzVIVeFa-7Ga8YM8usVRd1v0w7_WrYGRNoRMXBqZFNbrB-9A>
    <xmx:Gu8rZDL8A8Ikn2f4ra4pyPhHKVZu3aeGYm8gd-P5IjAu9CPAnICrjg>
    <xmx:Gu8rZJ93_eOpscv08QVcYGJrE2Gcp_lsQaH2keTJZi9RBBhIbT9AtQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 05:34:17 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        sergei.shtylyov@gmail.com, aleksander.lobakin@intel.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3 05/12] MIPS: cpu-features: Enable octeon_cache by cpu_type
Date:   Tue,  4 Apr 2023 10:33:44 +0100
Message-Id: <20230404093351.4233-6-jiaxun.yang@flygoat.com>
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

cpu_has_octeon_cache was tied to 0 for generic cpu-features,
whith this generic kernel built for octeon CPU won't boot.

Just enable this flag by cpu_type. It won't hurt orther platforms
because compiler will eliminate the code path on other processors.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/include/asm/cpu-features.h | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
index c613426b0bfc..51a1737b03d0 100644
--- a/arch/mips/include/asm/cpu-features.h
+++ b/arch/mips/include/asm/cpu-features.h
@@ -121,7 +121,24 @@
 #define cpu_has_4k_cache	__opt(MIPS_CPU_4K_CACHE)
 #endif
 #ifndef cpu_has_octeon_cache
-#define cpu_has_octeon_cache	0
+#define cpu_has_octeon_cache						\
+({									\
+	int __res;							\
+									\
+	switch (current_cpu_type()) {					\
+	case CPU_CAVIUM_OCTEON:						\
+	case CPU_CAVIUM_OCTEON_PLUS:					\
+	case CPU_CAVIUM_OCTEON2:					\
+	case CPU_CAVIUM_OCTEON3:					\
+		__res = 1;						\
+		break;							\
+									\
+	default:							\
+		__res = 0;						\
+	}								\
+									\
+	__res;								\
+})
 #endif
 /* Don't override `cpu_has_fpu' to 1 or the "nofpu" option won't work.  */
 #ifndef cpu_has_fpu
-- 
2.39.2 (Apple Git-143)

