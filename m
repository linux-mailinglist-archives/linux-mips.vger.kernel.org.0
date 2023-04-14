Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27F976E1DCA
	for <lists+linux-mips@lfdr.de>; Fri, 14 Apr 2023 10:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229820AbjDNIHl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 14 Apr 2023 04:07:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbjDNIHk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 14 Apr 2023 04:07:40 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E691540F1
        for <linux-mips@vger.kernel.org>; Fri, 14 Apr 2023 01:07:36 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 53A445C00C7;
        Fri, 14 Apr 2023 04:07:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Fri, 14 Apr 2023 04:07:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm1; t=1681459656; x=
        1681546056; bh=fZeeZgetkzLZlnct5h9tPs01Yd2dGvdP1qxQG0szvns=; b=R
        0pjHwsfLy8k1ZQy7FK879GnLfBqR7OD282JbBrkrTyxHewIk7sZQ3wdzqwqdiRrO
        WydO83t3dnhECpeuGRXbtuvKMyqG3Kzfa910yWRFd3QSiQs8ONwTIbLCc3XWlJE1
        42LG2N1MwAV84PaMaCYr1Bryk0J8fYvIiiY3uYKAw47VlVElxmOQYFadyZKzR8b4
        XQluy4XZwH16ELEBDCOjKW858eTxp6gUXZvpKf1E+JFQY3SZ5k+u3+mujfy60eHt
        q8ooiROLzNu111nhZ6XeCOr/dTJilX0+v4oxlG1sGopqiInmM0L0o8AdTvCJmf0+
        hKf/QdAzl+T2+MNF7Y1Ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1681459656; x=
        1681546056; bh=fZeeZgetkzLZlnct5h9tPs01Yd2dGvdP1qxQG0szvns=; b=U
        2SJQ2GqYAVJY/aohD0KQdEOaRIx8qLsTtM5kV8bDklqrzrFiMwJBJqPrxJeWAJzF
        Ngf2yfa/wOmFwb0VPnDdN0DRF7S9woWYIyFngOwOZimntj2wi5SCb9pkzlj90SUs
        rj2ZN0/Bbu3YnrZfTJpzCHpmAEAhhxPOUqYpjQ0a5uoy5iMp2bNUzBtFVWKmqVxd
        Q1OzEXYhEEvidI4r15QCAU5SNW0wt4wQSYCfDs49GABJjs0sWSeAXTel9nfg3dsZ
        dj/zuISCDRPzEKStVzjC4h5EJgPZ82acziBMWDpm//N7NcdjQNpsnf06byd5iban
        9Jmd9xsi/flrRHvruKT4A==
X-ME-Sender: <xms:yAk5ZKdzxk4jrpAfSaSajP5EZcmZrnBS6rUp95Ro4j9vThaZPk-jFA>
    <xme:yAk5ZENkUY64Mb9dLQOWx1Lr6eKCfCrm6BnPZqa_ZeWd58HrSUobE6jsNIU7bXb85
    4cIt69AafB9Hd_6OJU>
X-ME-Received: <xmr:yAk5ZLg64DdDha73DCDLCYxI4GUYfritw4kpmJuNeUzu1bOzVf9kznqGWGJA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdekledgudeftdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
    ekredtredttdenucfhrhhomheplfhirgiguhhnucgjrghnghcuoehjihgrgihunhdrhigr
    nhhgsehflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeeifefhvedthfejve
    evgfekueduieelfeetffdtveetffefgeelieetgfffueejkeenucffohhmrghinhepghhi
    thhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilh
    hfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:yAk5ZH-8vTWmV5Od_d6fBni7rDX3I-Potz2206hQ_IaF3vpXa20MmQ>
    <xmx:yAk5ZGsge3ywKav92RJjpj14TnjfxsKQyObVU4YRyt6BOvHc7Z8hUA>
    <xmx:yAk5ZOGLF83FOPaKWhoDDy2qAAt1fu9z0r5ttfPTzNVqoifG3OKrOQ>
    <xmx:yAk5ZIIs49Fe2M0CR-Nr7TMn2039xA5QER9JMA_7U9KVKJKUGRh68g>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Apr 2023 04:07:35 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     llvm@lists.linux.dev, tsbogend@alpha.franken.de,
        ndesaulniers@google.com, nathan@kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 6/7] MIPS: Fallback CPU -march CFLAG to ISA level if unsupported
Date:   Fri, 14 Apr 2023 09:07:00 +0100
Message-Id: <20230414080701.15503-7-jiaxun.yang@flygoat.com>
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

LLVM does not implement some of -march options. However those options
are not mandatory for kernel to build for those CPUs.

Fallback -march CFLAG to ISA level if unsupported by toolchain so
we can get those kernel to build with LLVM.

Link: https://github.com/ClangBuiltLinux/linux/issues/1544
Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v2: Reword commit message
---
 arch/mips/Makefile | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index af3d17ec35d3..0fa84fc395c9 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -148,10 +148,10 @@ cflags-y += $(call cc-option,-Wa$(comma)-mno-fix-loongson3-llsc,)
 #
 # CPU-dependent compiler/assembler options for optimization.
 #
-cflags-$(CONFIG_CPU_R3000)	+= -march=r3000
-cflags-$(CONFIG_CPU_R4300)	+= -march=r4300 -Wa,--trap
-cflags-$(CONFIG_CPU_R4X00)	+= -march=r4600 -Wa,--trap
-cflags-$(CONFIG_CPU_TX49XX)	+= -march=r4600 -Wa,--trap
+cflags-$(CONFIG_CPU_R3000)	+= $(call cc-option,-march=r3000,-march=mips1)
+cflags-$(CONFIG_CPU_R4300)	+= $(call cc-option,-march=r4300,-march=mips3) -Wa,--trap
+cflags-$(CONFIG_CPU_R4X00)	+= $(call cc-option,-march=r4600,-march=mips3) -Wa,--trap
+cflags-$(CONFIG_CPU_TX49XX)	+= $(call cc-option,-march=r4600,-march=mips3) -Wa,--trap
 cflags-$(CONFIG_CPU_MIPS32_R1)	+= -march=mips32 -Wa,--trap
 cflags-$(CONFIG_CPU_MIPS32_R2)	+= -march=mips32r2 -Wa,--trap
 cflags-$(CONFIG_CPU_MIPS32_R5)	+= -march=mips32r5 -Wa,--trap -modd-spreg
@@ -160,26 +160,30 @@ cflags-$(CONFIG_CPU_MIPS64_R1)	+= -march=mips64 -Wa,--trap
 cflags-$(CONFIG_CPU_MIPS64_R2)	+= -march=mips64r2 -Wa,--trap
 cflags-$(CONFIG_CPU_MIPS64_R5)	+= -march=mips64r5 -Wa,--trap
 cflags-$(CONFIG_CPU_MIPS64_R6)	+= -march=mips64r6 -Wa,--trap
-cflags-$(CONFIG_CPU_P5600)	+= -march=p5600 -Wa,--trap -modd-spreg
-cflags-$(CONFIG_CPU_R5000)	+= -march=r5000 -Wa,--trap
-cflags-$(CONFIG_CPU_R5500)	+= $(call cc-option,-march=r5500,-march=r5000) \
+cflags-$(CONFIG_CPU_P5600)	+= $(call cc-option,-march=p5600,-march=mips32r5) \
+			-Wa,--trap -modd-spreg
+cflags-$(CONFIG_CPU_R5000)	+= $(call cc-option,-march=r5000,-march=mips4) \
 			-Wa,--trap
-cflags-$(CONFIG_CPU_NEVADA)	+= $(call cc-option,-march=rm5200,-march=r5000) \
+cflags-$(CONFIG_CPU_R5500)	+= $(call cc-option,-march=r5500,-march=mips4) \
 			-Wa,--trap
-cflags-$(CONFIG_CPU_RM7000)	+= $(call cc-option,-march=rm7000,-march=r5000) \
+cflags-$(CONFIG_CPU_NEVADA)	+= $(call cc-option,-march=rm5200,-march=mips4) \
 			-Wa,--trap
-cflags-$(CONFIG_CPU_SB1)	+= $(call cc-option,-march=sb1,-march=r5000) \
+cflags-$(CONFIG_CPU_RM7000)	+= $(call cc-option,-march=rm7000,-march=mips4) \
+			-Wa,--trap
+cflags-$(CONFIG_CPU_SB1)	+= $(call cc-option,-march=sb1,-march=mips4) \
 			-Wa,--trap
 cflags-$(CONFIG_CPU_SB1)	+= $(call cc-option,-mno-mdmx)
 cflags-$(CONFIG_CPU_SB1)	+= $(call cc-option,-mno-mips3d)
-cflags-$(CONFIG_CPU_R10000)	+= $(call cc-option,-march=r10000,-march=r8000) \
+cflags-$(CONFIG_CPU_R10000)	+= $(call cc-option,-march=r10000,-march=mips4) \
 			-Wa,--trap
 cflags-$(CONFIG_CPU_CAVIUM_OCTEON) += -march=octeon -Wa,--trap
 cflags-$(CONFIG_CAVIUM_CN63XXP1) += -Wa,-mfix-cn63xxp1
 cflags-$(CONFIG_CPU_BMIPS)	+= -march=mips32 -Wa,-mips32 -Wa,--trap
 
-cflags-$(CONFIG_CPU_LOONGSON2E) += -march=loongson2e -Wa,--trap
-cflags-$(CONFIG_CPU_LOONGSON2F) += -march=loongson2f -Wa,--trap
+cflags-$(CONFIG_CPU_LOONGSON2E) += \
+			$(call cc-option,-march=loongson2e,-march=mips3) -Wa,--trap
+cflags-$(CONFIG_CPU_LOONGSON2F) += \
+			$(call cc-option,-march=loongson2f,-march=mips3) -Wa,--trap
 # Some -march= flags enable MMI instructions, and GCC complains about that
 # support being enabled alongside -msoft-float. Thus explicitly disable MMI.
 cflags-$(CONFIG_CPU_LOONGSON2EF) += $(call cc-option,-mno-loongson-mmi)
-- 
2.39.2 (Apple Git-143)

