Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA096E1DC7
	for <lists+linux-mips@lfdr.de>; Fri, 14 Apr 2023 10:07:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229938AbjDNIHi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Apr 2023 04:07:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229947AbjDNIHh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 Apr 2023 04:07:37 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FE8D6E81
        for <linux-mips@vger.kernel.org>; Fri, 14 Apr 2023 01:07:33 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 8E9955C00DF;
        Fri, 14 Apr 2023 04:07:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 14 Apr 2023 04:07:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm1; t=1681459652; x=
        1681546052; bh=2W+vVLs9XVAQ4F9uWHupEXXQyJAF5k40wMG7QV290h0=; b=Q
        sD7A7fflu99jtogVrIcgUtPxMZ2dv3ax5Jwqdqy0lcvUjhwZko2l6nRuObIyk/Cp
        O8SY0pvp8PanQshQg7xiYiJMSjvzP+lCck+y+Hvr3+y23ajfU5wxXNlaEYcMJRsO
        3JTeBt7PVBE+EAwTbfmc+7ElH1pRlf+AItzsgvFEiHejO6KZymUwTBQ9anPa2NyL
        V/orMNa97giQvciNub09lZ3tE8VeNm3YJMh4hoqcJ8K7/rks8LF6bzjUkXmUDJgx
        mCSHXYWX/a80wo7rH57HeXWCJs3Qt5gb/1VO7hYkMu9l4tMZ6bH47nk/f9glP4Su
        jASBGJREBjz3GyvJuRQ+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1681459652; x=
        1681546052; bh=2W+vVLs9XVAQ4F9uWHupEXXQyJAF5k40wMG7QV290h0=; b=N
        g2IToKCire1WzMqtj/aotfAx9fjbWufJGbYrkMbvkQw6URVP6AE1+mybTt876MiR
        CKmoMtnTcwI5h5owTBkUlHLYKf4EoKxihVUi0fvHXLoZONMWQ/JQACQmoDv6tXkA
        AmQ7mJX8V8ShsOENKVMcJBrb9XusLIkAvcRu/Q/ruOzAgSk6whisSqrQJ6xcuuEe
        +1phVg/FmxlvadQLVwo2f1nxKbtUKi+WA7IQEe8az/gX7/7ygfMO7y8FnUCLXBCu
        G+ZOJzTIRM/iidpHtVQAyUIRRrtLpnaT2pcsXF6ct/vPKOg4G9AgDRcjszMvyztY
        lsafWbRd+8E/rYMBmdJ2Q==
X-ME-Sender: <xms:xAk5ZCDkXQVl8W4uK2Sr9gjYeSZuJz3fSJe-9CxjQG-4PMTBvF_QhA>
    <xme:xAk5ZMj9ZPkcUqf8wra_U6orcwSgGPXRBd0HgUBU63OCv09KIhO9xM32_J9VKM3Od
    3q-psTVG0YYTlz35k8>
X-ME-Received: <xmr:xAk5ZFkWwkfXRFrdbgQQwW5LLuiGEFrTa26EWnnNsqrTs81z0XfUN-xgRxBO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekledgudeftdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
    ekredtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigr
    nhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeeifefhvedthfejve
    evgfekueduieelfeetffdtveetffefgeelieetgfffueejkeenucffohhmrghinhepghhi
    thhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:xAk5ZAzmpvpiMS2VZsMquqiwaW2zqyon4KQ0vYu4OKkDjsqBMWOxcA>
    <xmx:xAk5ZHR_EmPHb2C1jfJ1601ycZSOATVcGP5q6paZgN_-ZK40mSoRtQ>
    <xmx:xAk5ZLYYOWVhruIU3O-N1t3KA4Fe7cCUPVr5iOpDfSAoME_DyXiRRQ>
    <xmx:xAk5ZFMGyaFImY7jWAZlSHtcKuxcqt1Q6ZVu3G1pFnssTnV26d8FmA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Apr 2023 04:07:31 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     llvm@lists.linux.dev, tsbogend@alpha.franken.de,
        ndesaulniers@google.com, nathan@kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 3/7] MIPS: Detect toolchain support of workarounds in Kconfig
Date:   Fri, 14 Apr 2023 09:06:57 +0100
Message-Id: <20230414080701.15503-4-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230414080701.15503-1-jiaxun.yang@flygoat.com>
References: <20230414080701.15503-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

LLVM toolchain does not support most of workarounds, detect
those supports in Kconfig so we can hide unsupported workarounds
to user.

Link: https://github.com/ClangBuiltLinux/linux/issues/1544
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/mips/Kconfig               | 28 +++++++++++++++++++++++++---
 arch/mips/Makefile              |  6 +++---
 arch/mips/cavium-octeon/Kconfig |  1 +
 3 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 0b270562c3eb..0cd9cd01b7ab 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -371,9 +371,9 @@ config MACH_DECSTATION
 	select CEVT_R4K if CPU_R4X00
 	select CSRC_IOASIC
 	select CSRC_R4K if CPU_R4X00
-	select CPU_DADDI_WORKAROUNDS if 64BIT
-	select CPU_R4000_WORKAROUNDS if 64BIT
-	select CPU_R4400_WORKAROUNDS if 64BIT
+	imply CPU_DADDI_WORKAROUNDS
+	imply CPU_R4000_WORKAROUNDS
+	imply CPU_R4400_WORKAROUNDS
 	select DMA_NONCOHERENT
 	select NO_IOPORT_MAP
 	select IRQ_MIPS_CPU
@@ -1723,6 +1723,7 @@ config CPU_JUMP_WORKAROUNDS
 config CPU_LOONGSON2F_WORKAROUNDS
 	bool "Loongson 2F Workarounds"
 	default y
+	depends on AS_HAS_NOP_WORKAROUNDS && AS_HAS_JUMP_WORKAROUNDS
 	select CPU_NOP_WORKAROUNDS
 	select CPU_JUMP_WORKAROUNDS
 	help
@@ -2457,6 +2458,7 @@ config CPU_HAS_SYNC
 #   "MIPS R4400MC Errata, Processor Revision 1.0", erratum #5
 config CPU_DADDI_WORKAROUNDS
 	bool
+	depends on CPU_R4X00_BUGS64 && CC_HAS_DADDI_WORKAROUNDS
 
 # Work around certain R4000 CPU errata (as implemented by GCC):
 #
@@ -2478,6 +2480,7 @@ config CPU_DADDI_WORKAROUNDS
 #   erratum #52
 config CPU_R4000_WORKAROUNDS
 	bool
+	depends on CPU_R4X00_BUGS64 && CC_HAS_R4000_WORKAROUNDS
 	select CPU_R4400_WORKAROUNDS
 
 # Work around certain R4400 CPU errata (as implemented by GCC):
@@ -2488,6 +2491,7 @@ config CPU_R4000_WORKAROUNDS
 #   "MIPS R4400MC Errata, Processor Revision 2.0 & 3.0", erratum #4
 config CPU_R4400_WORKAROUNDS
 	bool
+	depends on CPU_R4X00_BUGS64 && CC_HAS_R4400_WORKAROUNDS
 
 config CPU_R4X00_BUGS64
 	bool
@@ -3168,6 +3172,15 @@ config CC_HAS_MNO_BRANCH_LIKELY
 	def_bool y
 	depends on $(cc-option,-mno-branch-likely)
 
+config CC_HAS_R4000_WORKAROUNDS
+	def_bool $(cc-option,-mfix-r4000)
+
+config CC_HAS_R4400_WORKAROUNDS
+	def_bool $(cc-option,-mfix-r4400)
+
+config CC_HAS_DADDI_WORKAROUNDS
+	def_bool $(cc-option,-mno-daddi)
+
 # https://github.com/llvm/llvm-project/issues/61045
 config CC_HAS_BROKEN_INLINE_COMPAT_BRANCH
 	def_bool y if CC_IS_CLANG
@@ -3193,6 +3206,15 @@ config AS_HAS_DSP
 config AS_HAS_GINV
 	def_bool $(cc-option,-Wa$(comma)-mginv)
 
+config AS_HAS_CN63XXP1_WORKAROUNDS
+	def_bool $(cc-option,-Wa$(comma)-mfix-cn63xxp1)
+
+config AS_HAS_NOP_WORKAROUNDS
+	def_bool $(cc-option,-Wa$(comma)-mfix-loongson2f-nop)
+
+config AS_HAS_JUMP_WORKAROUNDS
+	def_bool $(cc-option,-Wa$(comma)-mfix-loongson2f-jump)
+
 menu "Power management options"
 
 config ARCH_HIBERNATION_POSSIBLE
diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 3aa0f9d4ceb6..344fe5f00f7b 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -193,9 +193,9 @@ cflags-$(CONFIG_CC_IS_CLANG) += -march=mips64r2
 endif
 cflags-$(CONFIG_CPU_LOONGSON64) += $(call cc-option,-mno-loongson-mmi)
 
-cflags-$(CONFIG_CPU_R4000_WORKAROUNDS)	+= $(call cc-option,-mfix-r4000,)
-cflags-$(CONFIG_CPU_R4400_WORKAROUNDS)	+= $(call cc-option,-mfix-r4400,)
-cflags-$(CONFIG_CPU_DADDI_WORKAROUNDS)	+= $(call cc-option,-mno-daddi,)
+cflags-$(CONFIG_CPU_R4000_WORKAROUNDS)	+= -mfix-r4000
+cflags-$(CONFIG_CPU_R4400_WORKAROUNDS)	+= -mfix-r4400
+cflags-$(CONFIG_CPU_DADDI_WORKAROUNDS)	+= -mno-daddi
 ifdef CONFIG_CPU_LOONGSON2F_WORKAROUNDS
 cflags-$(CONFIG_CPU_NOP_WORKAROUNDS) += -Wa,-mfix-loongson2f-nop
 cflags-$(CONFIG_CPU_JUMP_WORKAROUNDS) += -Wa,-mfix-loongson2f-jump
diff --git a/arch/mips/cavium-octeon/Kconfig b/arch/mips/cavium-octeon/Kconfig
index 450e979ef5d9..38c9dc89cd5f 100644
--- a/arch/mips/cavium-octeon/Kconfig
+++ b/arch/mips/cavium-octeon/Kconfig
@@ -4,6 +4,7 @@ if CPU_CAVIUM_OCTEON
 config CAVIUM_CN63XXP1
 	bool "Enable CN63XXP1 errata workarounds"
 	default "n"
+	depends on AS_HAS_CN63XXP1_WORKAROUNDS
 	help
 	  The CN63XXP1 chip requires build time workarounds to
 	  function reliably, select this option to enable them.  These
-- 
2.39.2 (Apple Git-143)

