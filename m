Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99AC66DAB84
	for <lists+linux-mips@lfdr.de>; Fri,  7 Apr 2023 12:27:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240614AbjDGK1n (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Apr 2023 06:27:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240564AbjDGK1f (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Apr 2023 06:27:35 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D380AD2E
        for <linux-mips@vger.kernel.org>; Fri,  7 Apr 2023 03:27:32 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id BECC35C0261;
        Fri,  7 Apr 2023 06:27:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 07 Apr 2023 06:27:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1680863251; x=
        1680949651; bh=9cs4dzTjOtRqsWTfMOvIqIj7BwArvdXCK5uc5nFvhBE=; b=D
        W//qnfb6oTj7YgpxQ11y1omVhrPKZbW3PKCLnccd/R5eNaq25Aom/Lk29XCZIx1v
        5Sucv4wmXnxt+RdmqB8ewU1ZH9yOy8OCxNuCp0PvHVCI9kJ7OLgf6HemvH5Vnv4j
        9ZAYwZjT28IHDLgeOCZ3+GtFdZIbTitC8F7ZbL//HF172PyhqRaTBx3xWV+EqoiJ
        lKdvZGJ+GDpkE8W5KGXa1tSawoVwlWvYRZQFWoD4C5CiSh/L6fLDgng5j6mKHM8t
        toMiGvwsM1LhKR6ejR6Ji7jMRHRO0WsBmMku8C4oYhdIjgDQshOlZWlK6Z5iAb+v
        vNVNmgXnOxmhjU88gwqMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1680863251; x=
        1680949651; bh=9cs4dzTjOtRqsWTfMOvIqIj7BwArvdXCK5uc5nFvhBE=; b=Z
        4zR8myKoiUeU572IPOzqmU/23rOgrx/ksLCtI7xNnIYW4u0XuuqNREY0INV6kFBL
        P2kKl9FfCWOylrQPfIrhII9AZe+A7eJzd5lrHSYRj+Y7QWzLpkF1idg4tLxf1/FT
        q+E2paGMIjG4v8gbvJSUdtBs70z4LukFVj8C850AVsVMqJPb37EtJTO+pfmpOqc3
        qA/o3InMjWaeGD2t2KwSsH1cKLw9d1l0NhrR4bcYCzBnTSkFMxE6l9fmauc1nSSr
        laT1Z9SLDFu+4UlfPonl8DhSEK6MsbQCq+sI7T4KSG5STm48YB7CTvMaMnPQ3LnJ
        pYvRRvTOBut4NGesifQzQ==
X-ME-Sender: <xms:E_AvZAwp_2qhcpH6jDUXPnnh70Dbz3iXZLEr0ZutLWi9ReOACieVNg>
    <xme:E_AvZERei1QJAAko-EhPs3sf8PuT-YrTlv0NdSAc9DXTgVURHLLytZs1vF_zw1Bre
    9HDq7QHast-5vPk3uU>
X-ME-Received: <xmr:E_AvZCWTGAw6-hXD657AzMBsHLmVbDwR18hqPImhAtNxrbV_GPhcutdgmXrb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejhedgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:E_AvZOhQqTvHvUXW6E1x9Kc5E8FVGe5j9MDt3HRYzQh01oUwPSiK6Q>
    <xmx:E_AvZCCn64cjmpHtHwr4bp6ksrB6FtxFEH770w-1xJ5XjGdrXMccXQ>
    <xmx:E_AvZPKE4-nsDh9WbbfhfJtMGuQRYoYhHP5FtC72-ZqzYM5PxqAWCg>
    <xmx:E_AvZF-pXGjgBHg6yxI7GP7IbFgSyLrT08NdC76Op--sWA6hPZnXMg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Apr 2023 06:27:30 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     llvm@lists.linux.dev, tsbogend@alpha.franken.de,
        ndesaulniers@google.com, nathan@kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 5/5] MIPS: Fallback CPU -march CFLAG to ISA level if unsupported
Date:   Fri,  7 Apr 2023 11:27:21 +0100
Message-Id: <20230407102721.14814-6-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230407102721.14814-1-jiaxun.yang@flygoat.com>
References: <20230407102721.14814-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

LLVM does not implement some of -march option. However those march
does not provide any special functionality in most cases, they just
serves as compiler's tuning target.

Fallback -march CFLAG to ISA level if unsupported by toolchain so
we can get those kernel to build with LLVM.

Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Makefile | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 344fe5f00f7b..eab6abeaa45c 100644
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
@@ -160,19 +160,21 @@ cflags-$(CONFIG_CPU_MIPS64_R1)	+= -march=mips64 -Wa,--trap
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
 cflags-$(CONFIG_CPU_CAVIUM_OCTEON) += $(call cc-option,-march=octeon) -Wa,--trap
 ifeq (,$(findstring march=octeon, $(cflags-$(CONFIG_CPU_CAVIUM_OCTEON))))
@@ -181,8 +183,10 @@ endif
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

