Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED2CE6DAB81
	for <lists+linux-mips@lfdr.de>; Fri,  7 Apr 2023 12:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240593AbjDGK1g (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 7 Apr 2023 06:27:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240605AbjDGK1d (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 7 Apr 2023 06:27:33 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E99297ED3
        for <linux-mips@vger.kernel.org>; Fri,  7 Apr 2023 03:27:28 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 77EAA5C02F7;
        Fri,  7 Apr 2023 06:27:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 07 Apr 2023 06:27:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        cc:cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1680863246; x=
        1680949646; bh=mKBYAYmQOUcy8YuQxwCRtwb9d+L7Jo6sbgjNnR0YTZE=; b=M
        D5r8RgHvNjtPZq522FPxbLhsof/JX3EscUiMN8d6OxYI258Kq6PKy8ww3yIfQTS/
        JpKGDZIatm/8dPjFu1tn0fDdIThwaBPI1gef77CN7aSXG9kmHlPiJleKzg5Xlhc1
        l4EspZfa4NdZWfhDm9ojfnLfzaBpIbLcgO29JQmCeXBrxysBa40Q852STs9f/cih
        21A8XissNc7CL7BUQfu1vx01rkr7ZeUDuaXoUq8AIVVkIcQDWeIz9RcfDuMl8mgG
        F2ew1mLcqQNa2SsxG7Fb/MHbS8QT8h1IN/nGDbAKJ9IosikaKq+qcQgRWq7mw031
        JdcagZK7HIHETP4R2uNUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1680863246; x=
        1680949646; bh=mKBYAYmQOUcy8YuQxwCRtwb9d+L7Jo6sbgjNnR0YTZE=; b=g
        vHS1dqbA7jsV59EpGH9JZgX/5+fuclc2/zEjmNXiRH8KTc12X125RdinUqI0VbTm
        pD1U+IvFVVzp3PvRVQjEKmYj8AjeUQOGK9tvxRu7aqQeEDF6WqIEPWEYIctHnhKY
        am5nGD04jaMDUWn+LaK7My5OIACSXU/42VHg8ALbiyTu7qGmDyIG51tI9VPEFH2D
        dykWjl42D8ijgk15FyMEGyJLffAOss5YV4cY7KMTVcjpCxgRukQ+lOCAbjZLNU2m
        h8891y7FwwrQTs9QOHX6oA65GiJEHJruJOS0tjK/bB8KEtr5cuWpw6Zc5WMFyN5h
        LJonQBM1q1Rwv8K9UM4HA==
X-ME-Sender: <xms:DvAvZEVe_fIDLRkarE3r2Q7zJ5hkTq2Iu6pzcWL4LK9LZ1gnsjxU4g>
    <xme:DvAvZIk9JR6qpKUIc8RE48qElA-Glt1X67BTthhp50mjUxFXPM8g24p-7k3s9SJvk
    sAy1Xf8meXc1919Peo>
X-ME-Received: <xmr:DvAvZIah0MoBK4PFVo_NZniVzfPUq1N-TmHT3R0SwpQCJQ0LcWzqhWZPDQTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejhedgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:DvAvZDWWXizsRInAZOtak1ZgZep1JvK78hLEJ7NEi836n2syIcObbg>
    <xmx:DvAvZOlWWYoIHk6SWnq4o8kGUzM2eW9JV4M6kPvkexmVsqh3xkpwmQ>
    <xmx:DvAvZIfz0dlXdh9XlXnbe9Fx-gMYua_saP17hGJ1sMEGUZ-A4LmPbQ>
    <xmx:DvAvZPA5ftKbxYTAy4JIIGApAhVgMS6q9ZZGc_lNsDay3POkdpG4VQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Apr 2023 06:27:25 -0400 (EDT)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     llvm@lists.linux.dev, tsbogend@alpha.franken.de,
        ndesaulniers@google.com, nathan@kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 1/5] MIPS: Move various toolchain ASE check to Kconfig
Date:   Fri,  7 Apr 2023 11:27:17 +0100
Message-Id: <20230407102721.14814-2-jiaxun.yang@flygoat.com>
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

Use Kconfig to perform Kconfig toolchain feature check, so we will
be able to have toolchain feature availablility information in Kconfig
to guard relevant options.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig                | 27 +++++++++++++++++++++++++++
 arch/mips/Makefile               | 29 +++--------------------------
 arch/mips/crypto/crc32-mips.c    |  4 ++--
 arch/mips/include/asm/asmmacro.h |  8 ++++----
 arch/mips/include/asm/ginvt.h    |  2 +-
 arch/mips/include/asm/mipsregs.h | 10 +++++-----
 arch/mips/include/asm/msa.h      |  4 ++--
 7 files changed, 44 insertions(+), 40 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 770d098b11bf..c52401c155a4 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -3157,6 +3157,12 @@ config MIPS32_N32
 
 	  If unsure, say N.
 
+config CC_HAS_SMARTMIPS
+	def_bool $(cc-option,-mmicromips)
+
+config CC_HAS_MICROMIPS
+	def_bool $(cc-option,-mmicromips)
+
 config CC_HAS_MNO_BRANCH_LIKELY
 	def_bool y
 	depends on $(cc-option,-mno-branch-likely)
@@ -3165,6 +3171,27 @@ config CC_HAS_MNO_BRANCH_LIKELY
 config CC_HAS_BROKEN_INLINE_COMPAT_BRANCH
 	def_bool y if CC_IS_CLANG
 
+config AS_HAS_MSA
+	def_bool $(cc-option,-Wa$(comma)-mmsa)
+
+config AS_HAS_VIRT
+	def_bool $(cc-option,-Wa$(comma)-mvirt)
+
+# For -mmicromips, use -Wa,-fatal-warnings to catch unsupported -mxpa which
+# only warns
+config AS_HAS_XPA
+	def_bool $(cc-option,-Wa$(comma)-mxpa) if !CPU_MICROMIPS
+	def_bool $(cc-option,-mmicromips -Wa$(comma)-fatal-warnings -Wa$(comma)-mxpa) if CPU_MICROMIPS
+
+config AS_HAS_CRC
+	def_bool $(cc-option,-Wa$(comma)-mcrc)
+
+config AS_HAS_DSP
+	def_bool $(cc-option,-Wa$(comma)-mdsp)
+
+config AS_HAS_GINV
+	def_bool $(cc-option,-Wa$(comma)-mginv)
+
 menu "Power management options"
 
 config ARCH_HIBERNATION_POSSIBLE
diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index a7a4ee66a9d3..3aa0f9d4ceb6 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -233,32 +233,9 @@ cflags-$(CONFIG_CPU_LOONGSON64)	+= $(call as-option,-Wa$(comma)-mno-fix-loongson
 # Pass -Wa,--no-warn to disable all assembler warnings until the kernel code has
 # been fixed properly.
 mips-cflags				:= $(cflags-y)
-ifeq ($(CONFIG_CPU_HAS_SMARTMIPS),y)
-smartmips-ase				:= $(call cc-option-yn,$(mips-cflags) -msmartmips)
-cflags-$(smartmips-ase)			+= -msmartmips -Wa,--no-warn
-endif
-ifeq ($(CONFIG_CPU_MICROMIPS),y)
-micromips-ase				:= $(call cc-option-yn,$(mips-cflags) -mmicromips)
-cflags-$(micromips-ase)			+= -mmicromips
-endif
-ifeq ($(CONFIG_CPU_HAS_MSA),y)
-toolchain-msa				:= $(call cc-option-yn,$(mips-cflags) -mhard-float -mfp64 -Wa$(comma)-mmsa)
-cflags-$(toolchain-msa)			+= -DTOOLCHAIN_SUPPORTS_MSA
-endif
-toolchain-virt				:= $(call cc-option-yn,$(mips-cflags) -mvirt)
-cflags-$(toolchain-virt)		+= -DTOOLCHAIN_SUPPORTS_VIRT
-# For -mmicromips, use -Wa,-fatal-warnings to catch unsupported -mxpa which
-# only warns
-xpa-cflags-y				:= $(mips-cflags)
-xpa-cflags-$(micromips-ase)		+= -mmicromips -Wa$(comma)-fatal-warnings
-toolchain-xpa				:= $(call cc-option-yn,$(xpa-cflags-y) -mxpa)
-cflags-$(toolchain-xpa)			+= -DTOOLCHAIN_SUPPORTS_XPA
-toolchain-crc				:= $(call cc-option-yn,$(mips-cflags) -Wa$(comma)-mcrc)
-cflags-$(toolchain-crc)			+= -DTOOLCHAIN_SUPPORTS_CRC
-toolchain-dsp				:= $(call cc-option-yn,$(mips-cflags) -Wa$(comma)-mdsp)
-cflags-$(toolchain-dsp)			+= -DTOOLCHAIN_SUPPORTS_DSP
-toolchain-ginv				:= $(call cc-option-yn,$(mips-cflags) -Wa$(comma)-mginv)
-cflags-$(toolchain-ginv)		+= -DTOOLCHAIN_SUPPORTS_GINV
+
+cflags-$(CONFIG_CPU_HAS_SMARTMIPS)	+= -msmartmips -Wa,--no-warn
+cflags-$(CONFIG_CPU_MICROMIPS)		+= -mmicromips
 
 #
 # Firmware support
diff --git a/arch/mips/crypto/crc32-mips.c b/arch/mips/crypto/crc32-mips.c
index 3e4f5ba104f8..54bbcfae06d5 100644
--- a/arch/mips/crypto/crc32-mips.c
+++ b/arch/mips/crypto/crc32-mips.c
@@ -27,7 +27,7 @@ enum crc_type {
 	crc32c,
 };
 
-#ifndef TOOLCHAIN_SUPPORTS_CRC
+#ifndef CONFIG_AS_HAS_CRC
 #define _ASM_SET_CRC(OP, SZ, TYPE)					  \
 _ASM_MACRO_3R(OP, rt, rs, rt2,						  \
 	".ifnc	\\rt, \\rt2\n\t"					  \
@@ -38,7 +38,7 @@ _ASM_MACRO_3R(OP, rt, rs, rt2,						  \
 	_ASM_INSN32_IF_MM(0x00000030 | (__rs << 16) | (__rt << 21) |	  \
 			  ((SZ) << 14) | ((TYPE) << 3)))
 #define _ASM_UNSET_CRC(op, SZ, TYPE) ".purgem " #op "\n\t"
-#else /* !TOOLCHAIN_SUPPORTS_CRC */
+#else /* !CONFIG_AS_HAS_CRC */
 #define _ASM_SET_CRC(op, SZ, TYPE) ".set\tcrc\n\t"
 #define _ASM_UNSET_CRC(op, SZ, TYPE)
 #endif
diff --git a/arch/mips/include/asm/asmmacro.h b/arch/mips/include/asm/asmmacro.h
index 067a635d3bc8..74c2dedc55b4 100644
--- a/arch/mips/include/asm/asmmacro.h
+++ b/arch/mips/include/asm/asmmacro.h
@@ -239,7 +239,7 @@
 	 .word	0x41800000 | (\rt << 16) | (\rd << 11) | (\u << 5) | (\sel)
 	.endm
 
-#ifdef TOOLCHAIN_SUPPORTS_MSA
+#ifdef CONFIG_AS_HAS_MSA
 	.macro	_cfcmsa	rd, cs
 	.set	push
 	.set	mips32r2
@@ -507,7 +507,7 @@
 	.endm
 #endif
 
-#ifdef TOOLCHAIN_SUPPORTS_MSA
+#ifdef CONFIG_AS_HAS_MSA
 #define FPR_BASE_OFFS	THREAD_FPR0
 #define FPR_BASE	$1
 #else
@@ -518,7 +518,7 @@
 	.macro	msa_save_all	thread
 	.set	push
 	.set	noat
-#ifdef TOOLCHAIN_SUPPORTS_MSA
+#ifdef CONFIG_AS_HAS_MSA
 	PTR_ADDU FPR_BASE, \thread, FPR_BASE_OFFS
 #endif
 	st_d	 0, THREAD_FPR0  - FPR_BASE_OFFS, FPR_BASE
@@ -565,7 +565,7 @@
 	.set	hardfloat
 	lw	$1, THREAD_MSA_CSR(\thread)
 	_ctcmsa	MSA_CSR, $1
-#ifdef TOOLCHAIN_SUPPORTS_MSA
+#ifdef CONFIG_AS_HAS_MSA
 	PTR_ADDU FPR_BASE, \thread, FPR_BASE_OFFS
 #endif
 	ld_d	 0, THREAD_FPR0  - FPR_BASE_OFFS, FPR_BASE
diff --git a/arch/mips/include/asm/ginvt.h b/arch/mips/include/asm/ginvt.h
index 87b2974ffc53..20244a622552 100644
--- a/arch/mips/include/asm/ginvt.h
+++ b/arch/mips/include/asm/ginvt.h
@@ -10,7 +10,7 @@ enum ginvt_type {
 	GINVT_MMID,
 };
 
-#ifdef TOOLCHAIN_SUPPORTS_GINV
+#ifdef CONFIG_AS_HAS_GINV
 # define _ASM_SET_GINV	".set	ginv\n"
 # define _ASM_UNSET_GINV
 #else
diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index 2d53704d9f24..8f0ebc399338 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -1604,7 +1604,7 @@ do {									\
 	local_irq_restore(__flags);					\
 } while (0)
 
-#ifndef TOOLCHAIN_SUPPORTS_XPA
+#ifndef CONFIG_AS_HAS_XPA
 #define _ASM_SET_MFHC0							\
 	_ASM_MACRO_2R_1S(mfhc0, rt, rs, sel,				\
 			 _ASM_INSN_IF_MIPS(0x40400000 | __rt << 16 | __rs << 11 | \\sel)	\
@@ -1615,7 +1615,7 @@ do {									\
 			 _ASM_INSN_IF_MIPS(0x40c00000 | __rt << 16 | __rd << 11 | \\sel)	\
 			 _ASM_INSN32_IF_MM(0x000002f4 | __rt << 21 | __rd << 16 | \\sel << 11))
 #define _ASM_UNSET_MTHC0 ".purgem mthc0\n\t"
-#else	/* !TOOLCHAIN_SUPPORTS_XPA */
+#else	/* !CONFIG_AS_HAS_XPA */
 #define _ASM_SET_MFHC0 ".set\txpa\n\t"
 #define _ASM_SET_MTHC0 ".set\txpa\n\t"
 #define _ASM_UNSET_MFHC0
@@ -2040,7 +2040,7 @@ do {									\
  * Macros to access the guest system control coprocessor
  */
 
-#ifndef TOOLCHAIN_SUPPORTS_VIRT
+#ifndef CONFIG_AS_HAS_VIRT
 #define _ASM_SET_MFGC0							\
 	_ASM_MACRO_2R_1S(mfgc0, rt, rs, sel,				\
 			 _ASM_INSN_IF_MIPS(0x40600000 | __rt << 16 | __rs << 11 | \\sel)	\
@@ -2077,7 +2077,7 @@ do {									\
 #define __tlbginvf()							\
 		_ASM_INSN_IF_MIPS(0x4200000c)				\
 		_ASM_INSN32_IF_MM(0x0000517c)
-#else	/* !TOOLCHAIN_SUPPORTS_VIRT */
+#else	/* !CONFIG_AS_HAS_VIRT */
 #define _ASM_SET_VIRT ".set\tvirt\n\t"
 #define _ASM_SET_MFGC0	_ASM_SET_VIRT
 #define _ASM_SET_DMFGC0	_ASM_SET_VIRT
@@ -2395,7 +2395,7 @@ do {									\
 	: : "r" (val));							\
 } while (0)
 
-#ifdef TOOLCHAIN_SUPPORTS_DSP
+#ifdef CONFIG_AS_HAS_DSP
 #define rddsp(mask)							\
 ({									\
 	unsigned int __dspctl;						\
diff --git a/arch/mips/include/asm/msa.h b/arch/mips/include/asm/msa.h
index 236a49ee2e3e..a9ca57e3f780 100644
--- a/arch/mips/include/asm/msa.h
+++ b/arch/mips/include/asm/msa.h
@@ -156,7 +156,7 @@ static inline void init_msa_upper(void)
 	_init_msa_upper();
 }
 
-#ifndef TOOLCHAIN_SUPPORTS_MSA
+#ifndef CONFIG_AS_HAS_MSA
 /*
  * Define assembler macros using .word for the c[ft]cmsa instructions in order
  * to allow compilation with toolchains that do not support MSA. Once all
@@ -173,7 +173,7 @@ static inline void init_msa_upper(void)
 		      _ASM_INSN_IF_MIPS(0x783e0019 | __rs << 11 | __cd << 6)	\
 		      _ASM_INSN32_IF_MM(0x583e0016 | __rs << 11 | __cd << 6))
 #define _ASM_UNSET_CTCMSA ".purgem ctcmsa\n\t"
-#else /* TOOLCHAIN_SUPPORTS_MSA */
+#else /* CONFIG_AS_HAS_MSA */
 #define _ASM_SET_CFCMSA						\
 		".set\tfp=64\n\t"				\
 		".set\tmsa\n\t"
-- 
2.39.2 (Apple Git-143)

