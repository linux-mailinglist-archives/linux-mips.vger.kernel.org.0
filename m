Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC3986D5C05
	for <lists+linux-mips@lfdr.de>; Tue,  4 Apr 2023 11:34:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234257AbjDDJeZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 4 Apr 2023 05:34:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233983AbjDDJeY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 4 Apr 2023 05:34:24 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57A381981
        for <linux-mips@vger.kernel.org>; Tue,  4 Apr 2023 02:34:23 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id C42F25C00C3;
        Tue,  4 Apr 2023 05:34:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 04 Apr 2023 05:34:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1680600862; x=
        1680687262; bh=ql0CQWg7yLQoKQxs/B6S7EcbRtYsrs3XLpVRfvbE+HY=; b=U
        tfEu4c12rSNl8Xrbv3aiT8kV1z+y+lnC34t27p5HMiCk57peFc8jkvELgr6eUuPd
        GhwfWhjn2Zu+MolLeg+K8hpfzhAMr2R199QMky4z60SIqQzai/lrlm0kzb+BvhK/
        xz59MgCE7thGq4ZSjTBZpXVptxgfws7DT/pFWaYYo3/UIgjrmS2JLk7kid1dgUcE
        U18E9eJLINwySv4aKX3b8AQIzlziNpxUit+GZb6I+OA5YHqk0gr3pbzZ6GQB6DR2
        GtqHvYF3kAfMv4fZUty7pucChw7MGfGcG/A0YR8U2H4FV9i/2VXwpDWhLmEW8L+t
        S9aRBGgwAbVU2U7LJ1STw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1680600862; x=
        1680687262; bh=ql0CQWg7yLQoKQxs/B6S7EcbRtYsrs3XLpVRfvbE+HY=; b=Q
        VG17avGfGpAJMy/PJUwEsQsW+giYb6Wf7XC19sGAH/2JvdohJk7hPE074Kt3tHOM
        4LzDp+Gc9gClCInYV8El1CLtZK5k69kTzD090S+cV92tkvCJLj2xGC1iXH07dqfU
        Jo+rJemkvnMbP+7d5QQhKgI5FrM3tKJj/RNo94CV0k7tCryiZVsvzFQm3HNVVks0
        3y6zdPWChzvSdzfQY5Odtxos1Z6yPrFVhsv9hIzJf6GbwolInAXakNdnZZKFMoho
        K85Vlj6KXqPPVzzzQwBdApJK/Jsj4EYqRbFuGTW8vh/Jo40A2HJxhac60OIPn/+f
        IaBUuOQu6mM+1kKHgqv2A==
X-ME-Sender: <xms:Hu8rZDbDG1D6_q2_s8ar5p2qyySgoj71IjlP74TMv6tQEk_YUayhAg>
    <xme:Hu8rZCa-8h69PGsMhBXzxrcP5NUBoJDDqeUP2H2Oa7RjEvBp7qAm5rWKFnGfPjnIm
    6N04YF2vLdAeZUj39A>
X-ME-Received: <xmr:Hu8rZF9ymXphv0fWSZ4bG9sRS5vCHQFqmqxyA4K_jZDT0iYZq6oT0qurzZB5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiledgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:Hu8rZJp4jiabLgBuJGttZOB-3Ys7891Qb4DVB4ZvS3gjq4mN0M-uuQ>
    <xmx:Hu8rZOp5P2ELTbFgFk70yvJUhXkXbCK8EDksID2XmRgGATVAxvXU5g>
    <xmx:Hu8rZPTALUBoLCAfKy8za_-qk5hp8kLUtKwk_gKUUORvuQEWzOs4rA>
    <xmx:Hu8rZHmDFsnWtWRJE5o8n3xPPWdtxKBk0aVXRp0bod_qIlgpK6pwhg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Apr 2023 05:34:21 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        sergei.shtylyov@gmail.com, aleksander.lobakin@intel.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3 08/12] MIPS: Loongson: Move arch cflags to MIPS top level Makefile
Date:   Tue,  4 Apr 2023 10:33:47 +0100
Message-Id: <20230404093351.4233-9-jiaxun.yang@flygoat.com>
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

Arch cflags should be independent to Platform.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Makefile             | 38 ++++++++++++++++++++++++++++++++++
 arch/mips/loongson2ef/Platform | 35 -------------------------------
 arch/mips/loongson64/Platform  | 16 --------------
 3 files changed, 38 insertions(+), 51 deletions(-)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 04e46ec24319..a7a4ee66a9d3 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -181,9 +181,47 @@ endif
 cflags-$(CONFIG_CAVIUM_CN63XXP1) += -Wa,-mfix-cn63xxp1
 cflags-$(CONFIG_CPU_BMIPS)	+= -march=mips32 -Wa,-mips32 -Wa,--trap
 
+cflags-$(CONFIG_CPU_LOONGSON2E) += -march=loongson2e -Wa,--trap
+cflags-$(CONFIG_CPU_LOONGSON2F) += -march=loongson2f -Wa,--trap
+# Some -march= flags enable MMI instructions, and GCC complains about that
+# support being enabled alongside -msoft-float. Thus explicitly disable MMI.
+cflags-$(CONFIG_CPU_LOONGSON2EF) += $(call cc-option,-mno-loongson-mmi)
+ifdef CONFIG_CPU_LOONGSON64
+cflags-$(CONFIG_CPU_LOONGSON64)	+= -Wa,--trap
+cflags-$(CONFIG_CC_IS_GCC) += -march=loongson3a
+cflags-$(CONFIG_CC_IS_CLANG) += -march=mips64r2
+endif
+cflags-$(CONFIG_CPU_LOONGSON64) += $(call cc-option,-mno-loongson-mmi)
+
 cflags-$(CONFIG_CPU_R4000_WORKAROUNDS)	+= $(call cc-option,-mfix-r4000,)
 cflags-$(CONFIG_CPU_R4400_WORKAROUNDS)	+= $(call cc-option,-mfix-r4400,)
 cflags-$(CONFIG_CPU_DADDI_WORKAROUNDS)	+= $(call cc-option,-mno-daddi,)
+ifdef CONFIG_CPU_LOONGSON2F_WORKAROUNDS
+cflags-$(CONFIG_CPU_NOP_WORKAROUNDS) += -Wa,-mfix-loongson2f-nop
+cflags-$(CONFIG_CPU_JUMP_WORKAROUNDS) += -Wa,-mfix-loongson2f-jump
+endif
+
+#
+# Some versions of binutils, not currently mainline as of 2019/02/04, support
+# an -mfix-loongson3-llsc flag which emits a sync prior to each ll instruction
+# to work around a CPU bug (see __SYNC_loongson3_war in asm/sync.h for a
+# description).
+#
+# We disable this in order to prevent the assembler meddling with the
+# instruction that labels refer to, ie. if we label an ll instruction:
+#
+# 1: ll v0, 0(a0)
+#
+# ...then with the assembler fix applied the label may actually point at a sync
+# instruction inserted by the assembler, and if we were using the label in an
+# exception table the table would no longer contain the address of the ll
+# instruction.
+#
+# Avoid this by explicitly disabling that assembler behaviour. If upstream
+# binutils does not merge support for the flag then we can revisit & remove
+# this later - for now it ensures vendor toolchains don't cause problems.
+#
+cflags-$(CONFIG_CPU_LOONGSON64)	+= $(call as-option,-Wa$(comma)-mno-fix-loongson3-llsc,)
 
 # For smartmips configurations, there are hundreds of warnings due to ISA overrides
 # in assembly and header files. smartmips is only supported for MIPS32r1 onwards
diff --git a/arch/mips/loongson2ef/Platform b/arch/mips/loongson2ef/Platform
index c6f7a4b95997..d446b705fba4 100644
--- a/arch/mips/loongson2ef/Platform
+++ b/arch/mips/loongson2ef/Platform
@@ -2,41 +2,6 @@
 # Loongson Processors' Support
 #
 
-cflags-$(CONFIG_CPU_LOONGSON2EF)	+= -Wa,--trap
-cflags-$(CONFIG_CPU_LOONGSON2E) += -march=loongson2e
-cflags-$(CONFIG_CPU_LOONGSON2F) += -march=loongson2f
-#
-# Some versions of binutils, not currently mainline as of 2019/02/04, support
-# an -mfix-loongson3-llsc flag which emits a sync prior to each ll instruction
-# to work around a CPU bug (see __SYNC_loongson3_war in asm/sync.h for a
-# description).
-#
-# We disable this in order to prevent the assembler meddling with the
-# instruction that labels refer to, ie. if we label an ll instruction:
-#
-# 1: ll v0, 0(a0)
-#
-# ...then with the assembler fix applied the label may actually point at a sync
-# instruction inserted by the assembler, and if we were using the label in an
-# exception table the table would no longer contain the address of the ll
-# instruction.
-#
-# Avoid this by explicitly disabling that assembler behaviour. If upstream
-# binutils does not merge support for the flag then we can revisit & remove
-# this later - for now it ensures vendor toolchains don't cause problems.
-#
-cflags-$(CONFIG_CPU_LOONGSON2EF)	+= $(call cc-option,-Wa$(comma)-mno-fix-loongson3-llsc,)
-
-# Enable the workarounds for Loongson2f
-ifdef CONFIG_CPU_LOONGSON2F_WORKAROUNDS
-cflags-$(CONFIG_CPU_NOP_WORKAROUNDS) += -Wa,-mfix-loongson2f-nop
-cflags-$(CONFIG_CPU_JUMP_WORKAROUNDS) += -Wa,-mfix-loongson2f-jump
-endif
-
-# Some -march= flags enable MMI instructions, and GCC complains about that
-# support being enabled alongside -msoft-float. Thus explicitly disable MMI.
-cflags-y += $(call cc-option,-mno-loongson-mmi)
-
 #
 # Loongson Machines' Support
 #
diff --git a/arch/mips/loongson64/Platform b/arch/mips/loongson64/Platform
index 473404cae1c4..49c9889e3d56 100644
--- a/arch/mips/loongson64/Platform
+++ b/arch/mips/loongson64/Platform
@@ -1,19 +1,3 @@
-#
-# Loongson Processors' Support
-#
-
-
-cflags-$(CONFIG_CPU_LOONGSON64)	+= -Wa,--trap
-
-ifdef CONFIG_CPU_LOONGSON64
-cflags-$(CONFIG_CC_IS_GCC) += -march=loongson3a
-cflags-$(CONFIG_CC_IS_CLANG) += -march=mips64r2
-endif
-
-# Some -march= flags enable MMI instructions, and GCC complains about that
-# support being enabled alongside -msoft-float. Thus explicitly disable MMI.
-cflags-y += $(call cc-option,-mno-loongson-mmi)
-
 #
 # Loongson Machines' Support
 #
-- 
2.39.2 (Apple Git-143)

