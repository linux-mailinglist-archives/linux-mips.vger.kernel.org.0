Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DAF06AACE8
	for <lists+linux-mips@lfdr.de>; Sat,  4 Mar 2023 23:15:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbjCDWPl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 4 Mar 2023 17:15:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjCDWPk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 4 Mar 2023 17:15:40 -0500
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C78412F22
        for <linux-mips@vger.kernel.org>; Sat,  4 Mar 2023 14:15:39 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id B18095C00F4;
        Sat,  4 Mar 2023 17:15:38 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sat, 04 Mar 2023 17:15:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1677968138; x=
        1678054538; bh=wIDTEiHzh6Ropf3Pdulwmt7BPaBwI6CcgfYjGy9/w/Q=; b=D
        npk+L0UeS4u8EwAUVFobdkspFgnx9pgUaMknItGjoWWLxPTpx+4vFvk0mLFf6Lfl
        g7Fjmp/zXPiE/tLqXWiuuc7urF+oAECyxLYKa0qozjV/XwZLAjTTQ+kP22idhq4W
        wo9jIdiR8LAVeecyQQ+2JNU0Ba7zLIxj9VoZA8pq9Akqjx1JnPZCGSYe6uque/R9
        DwUvT51Ti5J/6tWaOOVXMQOy1oaYoOBEOjwO+pCdk8fzzhkDgfX3oTC6bh/wNBG3
        9k0vXnNT6i2sFb/9JiwY9fHyyiFLwf1OQaiVLGibi5JwlkZ3ZwC91D5kKDDQsB9A
        KzBFgHrL65z6L8dBvSUUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677968138; x=
        1678054538; bh=wIDTEiHzh6Ropf3Pdulwmt7BPaBwI6CcgfYjGy9/w/Q=; b=Y
        pU0CyAf5jltoxhrAYX5MMXIPW2zRQIHWTiG0eHHqFL8UyxE1av3dnnH4ardJJyx2
        wPPEWeBEpVHuEeTT72dI8f1rSSpiLkzRKrvgW7e1v+/bjqgAjDsT8nYl9MzTB+dM
        SduKoJZxJGKbiF9+85HFMPvUoKCjWdEBVlVxmJhINM/WMfTlmeFbzSYRfNMxXpbZ
        JL8qAuSMKZfGf3+af+6ZLQjD+jtlASMCVSccyFWUhb1A+901Wyufxo8pl/5bvSoO
        omExICkc9sXCmJB91IpOk08eT4RKr40qTe1hsEKbF/4sjbMNz4f445Mkx1qZqjR+
        CtIAD628irar/mtCik53Q==
X-ME-Sender: <xms:CsMDZNpv7q2G4ehfuTKHVUTTZCC5xCPBtL3LIB415faW3tEU5rVX0A>
    <xme:CsMDZPqX8bfLiR4-FQq0EgSRDOeY4N6g5EY9F7DU4jukNCogbY7EzDj_4qz1jLUV-
    djkVjAt6EVSNYqIYd4>
X-ME-Received: <xmr:CsMDZKOpQD6x0zxdv-fQzBjEDHTrdmKjzZ5gIoy5M2TEg1_dPja4hDuH5ml_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtuddgudehiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
    ekredtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigr
    nhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeefledufeehgedvue
    dvvdegkefgvddttedtleeiiefhgeetudegkefhvdfhjeeftdenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflh
    ihghhorghtrdgtohhm
X-ME-Proxy: <xmx:CsMDZI4YGJvqRhGtm6LHBewgd8_RvI27Xu9-sXkONannDJQmeCC7GA>
    <xmx:CsMDZM7MfbLXMPFgjX33CHcUTYN9-q2CPIxiDuE4JQWkEFOtZPVU4w>
    <xmx:CsMDZAjkX_gcIK9JuvlWUXWJkRVCi7ykSbYJQMlLOiVvoKRoUlHQKA>
    <xmx:CsMDZMFl_Gx5L0lPPx0yfpmPdhpFW1q9MYvGeP-56W9lfQyEMPfMLQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 4 Mar 2023 17:15:37 -0500 (EST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 04/12] MIPS: Octeon: Opt-out 4k_cache feature
Date:   Sat,  4 Mar 2023 22:15:16 +0000
Message-Id: <20230304221524.47160-5-jiaxun.yang@flygoat.com>
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
2.34.1

