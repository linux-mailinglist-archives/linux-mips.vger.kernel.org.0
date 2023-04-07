Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65C086DAB82
	for <lists+linux-mips@lfdr.de>; Fri,  7 Apr 2023 12:27:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232114AbjDGK1g (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Apr 2023 06:27:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240607AbjDGK1e (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Apr 2023 06:27:34 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00FC1AD0A
        for <linux-mips@vger.kernel.org>; Fri,  7 Apr 2023 03:27:29 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id 329105C0053;
        Fri,  7 Apr 2023 06:27:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Fri, 07 Apr 2023 06:27:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1680863249; x=
        1680949649; bh=ILWbuHX2izidYKUkIq+XSMUPC8yRfOMxfpn3f3OVIzE=; b=E
        QherGmNeiZI78cWxSyIAjgRbzhWePpJxmgUDwPe4mWU8LCqryZtIOuOVnnJVg2Jn
        pg3Ca+yJAd90CH+K9ibE8l1KDKQd2OB+kxUOqqRDBtsKHpMWpl1/FdEu/U9r7Xj1
        P+1kSMRaKCQRxfRt8Gnr8x+jkMzwSMk9N6sEHO/eK9x0HVV40v7QpW8BDw//fkkA
        8sjIIqu6BPbM+WsUdbon4AMsXU+cycVMRVkij5CrQRVmkvQEeJrDBhGGWUT59SG7
        ro0rjQCxarwkPOm9VdJgRbqn7a/Rl2doFKUuZYlboJOWoTK5YbVO1cnB7Hap/UA9
        IYUfTFU3mV+kLG2hOgnhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1680863249; x=
        1680949649; bh=ILWbuHX2izidYKUkIq+XSMUPC8yRfOMxfpn3f3OVIzE=; b=E
        PqUETVzsL3HLpZLoB6/wBu36z13wwiUXVoOm5ixmTPHN3N0w9Y9UWVlloVvgAY3Z
        lpcnf36pD81/4ibO0285HRQcIvGfoCUmc32ZKLPlT38CVnq5yfoGdEa6N+rfaUJg
        IObHCv7eVNGz2F6qe43p/TPmMV2zd60L3Agi0pd9PAxWIdfFKQrdviBODowgP49m
        j//Pb2wz/T9DjP15zKqA3VABNi4GfNty+ODKxR7it8PPRZzb63Z9x/4AFizgmY78
        6VYT712P4LDJScaQOpPHkMbGRcNJCg2hWOdV9E+MZPZvzaetB8i8epd4EkUfjKvu
        p7xRbtY8uEHFXET3zqi4Q==
X-ME-Sender: <xms:EfAvZDaXX5kxSDjA09ruoygyInJWfJbLenJoOUfZxmjAnIQ867H-pw>
    <xme:EfAvZCYCTLFKt6c-JU2p0EKdHIHiE7hoj2QJU6C2H8aQbnEt3yUZecH2Q6KlalhQY
    iqvgVEcocGI_NvBA2M>
X-ME-Received: <xmr:EfAvZF9ms63br0xbh-2jq0lgyeH04RlW2rCRRgta2YSHCKGyRRrz77vI1SD2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejhedgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepieefhfevtdfhjeevve
    fgkeeuudeileeftefftdevtefffeegleeitefgffeujeeknecuffhomhgrihhnpehgihht
    hhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:EfAvZJpc0ylmi4P4ZahDbFeNuP7rjRa9PwK_GedGclQpVBiZ7TOMyA>
    <xmx:EfAvZOqNbNrOeqGjwvWyDdG9K5GQ4-aiMpUYDPM8kkJjL12reqjJlg>
    <xmx:EfAvZPREV8he5WmywdQ1X6s8jvm7FO6aRXKME6DwdRLhHwK5giRG2Q>
    <xmx:EfAvZHk3TgcJ0FLYGRM5p48DeqvOT-TlxfZz-YsXoig_hDLuFFdAfQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Apr 2023 06:27:27 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     llvm@lists.linux.dev, tsbogend@alpha.franken.de,
        ndesaulniers@google.com, nathan@kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 3/5] MIPS: Detect toolchain support of workarounds in Kconfig
Date:   Fri,  7 Apr 2023 11:27:19 +0100
Message-Id: <20230407102721.14814-4-jiaxun.yang@flygoat.com>
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

LLVM toolchain does not support most of workarounds, detect
those supports in Kconfig so we can hide unsupported workarounds
to user.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig               | 28 +++++++++++++++++++++++++---
 arch/mips/Makefile              |  6 +++---
 arch/mips/cavium-octeon/Kconfig |  1 +
 3 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 9e9de2b62f28..d896af492da6 100644
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
@@ -2456,6 +2457,7 @@ config CPU_HAS_SYNC
 #   "MIPS R4400MC Errata, Processor Revision 1.0", erratum #5
 config CPU_DADDI_WORKAROUNDS
 	bool
+	depends on CPU_R4X00_BUGS64 && CC_HAS_DADDI_WORKAROUNDS
 
 # Work around certain R4000 CPU errata (as implemented by GCC):
 #
@@ -2477,6 +2479,7 @@ config CPU_DADDI_WORKAROUNDS
 #   erratum #52
 config CPU_R4000_WORKAROUNDS
 	bool
+	depends on CPU_R4X00_BUGS64 && CC_HAS_R4000_WORKAROUNDS
 	select CPU_R4400_WORKAROUNDS
 
 # Work around certain R4400 CPU errata (as implemented by GCC):
@@ -2487,6 +2490,7 @@ config CPU_R4000_WORKAROUNDS
 #   "MIPS R4400MC Errata, Processor Revision 2.0 & 3.0", erratum #4
 config CPU_R4400_WORKAROUNDS
 	bool
+	depends on CPU_R4X00_BUGS64 && CC_HAS_R4400_WORKAROUNDS
 
 config CPU_R4X00_BUGS64
 	bool
@@ -3167,6 +3171,15 @@ config CC_HAS_MNO_BRANCH_LIKELY
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
@@ -3192,6 +3205,15 @@ config AS_HAS_DSP
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

