Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FADD6AACEC
	for <lists+linux-mips@lfdr.de>; Sat,  4 Mar 2023 23:15:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbjCDWPp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 4 Mar 2023 17:15:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbjCDWPp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 4 Mar 2023 17:15:45 -0500
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D91FB17177
        for <linux-mips@vger.kernel.org>; Sat,  4 Mar 2023 14:15:43 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 555965C0103;
        Sat,  4 Mar 2023 17:15:43 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sat, 04 Mar 2023 17:15:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; t=1677968143; x=
        1678054543; bh=gkce09u2kxsTpJcm1Af+ZLkvFD5ey6VxSJLwcOW4WFw=; b=P
        Ts/TeaiYAdkueDRbj8hd+fwPIHEsngMMZ2vfQZngzvHu6wraTUx+X5tXunilV9Lf
        ZpEwOITb2dMJT8KGJ+N2fq3g9xDAeepfvJkLkz2LC/1kRTnjnySpTCmr1w8LoQGn
        r1e9OlonK4XyuTWSrXreetIDUdZY/cHaAfDpe5RUGQeopBS9v8Yg2bTLDw3Vzlje
        lx1leSdNn+myt63sb5SDDWC/PUHdpY/HQ0j4N369wi1VkbNLrALSvsyeR/G8Baxz
        ewqnEs2bpg4cqAx3Z1CEYfbJoE5chPgGpd+d/WqogxZgKTlHb8t9Eo8tnzwQEDDp
        Gntu3WNiYJjaI3ImJ3Xag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1677968143; x=
        1678054543; bh=gkce09u2kxsTpJcm1Af+ZLkvFD5ey6VxSJLwcOW4WFw=; b=g
        lqyW75wegDgqHauKT1s6pwc59PLE4DxpqEqFpryDAR38J1oHQIqMshnfgHWcP1P1
        mKQe+Vkk3RF2QH6MxS9c+CLoYGoFcdSXMAHGh5/ee6mpcQx+3AG1hCebaaMRODXu
        0/AXx3cc8YwQaetzOoGEpghSbDs70S0NGZwO/R7yoHqxBPVabd16xHm7xOU5reWr
        L/Zm7zRFvKwT1FfZMVBaXzpFyl+nSihLcsy3OwM0awY70u62H/d7H9HsCOZEBLyI
        FqLg5RxQEbL2KSuUUdPD8HyjnCvZZfkRCx0GGdvetoLlSAIXCApfcQR09bo08jGK
        SRkSzfZ8je0w+H2pKozRA==
X-ME-Sender: <xms:D8MDZLVk1KnXXtYjMj_Y3hdpzFEEDps6t8b1_PnYF8K0-XTw1g8k4Q>
    <xme:D8MDZDmbuzbKE7y2fOjH8S63kVkPQoIPVrzJMYO9lqOsw81bwAIOnyCjPSU_RDB-7
    TQNQl8OcyayVfOcsLw>
X-ME-Received: <xmr:D8MDZHalQlmi2c5bnsMHBUxfxdP9ZHYY7sKp8Shre2SKRiQVaCx-dBE2Ty2E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtuddgudehhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
    ekredtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigr
    nhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeefledufeehgedvue
    dvvdegkefgvddttedtleeiiefhgeetudegkefhvdfhjeeftdenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflh
    ihghhorghtrdgtohhm
X-ME-Proxy: <xmx:D8MDZGXjswNWQyb7jC4RO0EJuBVQVjiK5SYv8FhwMtHLD-FwOR0uSA>
    <xmx:D8MDZFlURKUYkH40xV9qTdVyJlVn6vR_JCLk2Z_4xhytIMID-BrooQ>
    <xmx:D8MDZDd80jLoD-oln-YMAQsKMPIO2AX-19HLVkTzVkxlcw70FMhvTA>
    <xmx:D8MDZKwz2vL8kVagFqN87ByDru_-2GBsqsLHh6bnQcR6vkHGdW42WA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 4 Mar 2023 17:15:42 -0500 (EST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, philmd@linaro.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 08/12] MIPS: Loongson: Move arch cflags to MIPS top level Makefile
Date:   Sat,  4 Mar 2023 22:15:20 +0000
Message-Id: <20230304221524.47160-9-jiaxun.yang@flygoat.com>
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
2.34.1

