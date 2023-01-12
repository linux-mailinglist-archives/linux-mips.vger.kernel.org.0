Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32F4A666936
	for <lists+linux-mips@lfdr.de>; Thu, 12 Jan 2023 04:05:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235746AbjALDFl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Jan 2023 22:05:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235845AbjALDFk (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Jan 2023 22:05:40 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFCE248837;
        Wed, 11 Jan 2023 19:05:38 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4738BB81DAD;
        Thu, 12 Jan 2023 03:05:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48EEDC4339B;
        Thu, 12 Jan 2023 03:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673492735;
        bh=U/EobkqUvUWKdse+cBiW37gLSU6QqG5tdF0KZ4OEuCk=;
        h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
        b=sI6fS19ugF0T84nlo/8mDKp2VtGiYYNMw2ol6EBnc7g2p7nVe+/xgSIQ/pwEevrfe
         /oQ6gnExWM0HdiBcK/zSG9lE2rAoOEdISJavfYGL7z18qlkTtqYH5Nr/BAAEVPxsKW
         FSGvpysU7n558FfBYn3BL4pYxs+TyJGDGm9y4eF0QEjEAul2viul1QYqvErO8sXuKn
         +WG/gDUftDN2ANmK1LdVqiyWbaP3LSKZiZukpFDgNpXgR0BxaMwC/91uL4Q5PN5ALF
         8TztrfeE92XwkQYEfBUbH1PSCCfbdcuKdF/HrAT+d8mDSQGonMGRBHtA2eBkaKk0p1
         RdOO2EqvLe/TQ==
From:   Nathan Chancellor <nathan@kernel.org>
Date:   Wed, 11 Jan 2023 20:04:59 -0700
Subject: [PATCH v2 02/14] MIPS: Always use -Wa,-msoft-float and eliminate
 GAS_HAS_SET_HARDFLOAT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221228-drop-qunused-arguments-v2-2-9adbddd20d86@kernel.org>
References: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
In-Reply-To: <20221228-drop-qunused-arguments-v2-0-9adbddd20d86@kernel.org>
To:     masahiroy@kernel.org
Cc:     ndesaulniers@google.com, nicolas@fjasle.eu, trix@redhat.com,
        linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
        kernel test robot <lkp@intel.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        linux-mips@vger.kernel.org
X-Mailer: b4 0.12-dev-78c63
X-Developer-Signature: v=1; a=openpgp-sha256; l=14054; i=nathan@kernel.org;
 h=from:subject:message-id; bh=U/EobkqUvUWKdse+cBiW37gLSU6QqG5tdF0KZ4OEuCk=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDMn7K36l913UujnpljXvEbeckwauqWx/4tR+T/0/49WmxOL5
 RR2XO0pZGMQ4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEbBMZGTqr47Ue3uuQUr63ocZITr
 /rwHOGl64dRzwt7v5fvdHUsYyR4fi7fTw3z/QuvvC6LlpRW+aEdcMbVaUHNypvPeu/9ernbl4A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

-Wa,-msoft-float is tested with as-option, which will be a problem for
clang with an upcoming change to move as-option to use KBUILD_AFLAGS
instead of KBUILD_CFLAGS due to a lack of '-mno-abicalls' in
KBUILD_AFLAGS at the point that this check occurs; $(cflags-y) is added
to KBUILD_AFLAGS towards the end of this file.

  clang: error: ignoring '-fno-PIE' option as it cannot be used with implicit usage of -mabicalls and the N64 ABI [-Werror,-Woption-ignored]

This could be resolved by switching to a cc-option check but
'$(cflags-y)' would need to be added so that '-mno-abicalls' is present
for the test. However, this check is no longer necessary, as
-msoft-float is supported by all supported assembler versions (GNU as
2.25+ and LLVM 11+). Eliminate GAS_HAS_SET_HARDFLOAT and all of its
uses, inlining SET_HARDFLOAT where necessary.

Link: https://lore.kernel.org/202209101939.bvk64Fok-lkp@intel.com/
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Cc: linux-mips@vger.kernel.org
---
 arch/mips/Makefile                  | 11 +---------
 arch/mips/include/asm/asmmacro-32.h |  4 ++--
 arch/mips/include/asm/asmmacro.h    | 42 ++++++++++++++++++-------------------
 arch/mips/include/asm/fpregdef.h    | 14 -------------
 arch/mips/include/asm/mipsregs.h    | 20 ++++--------------
 arch/mips/kernel/genex.S            |  2 +-
 arch/mips/kernel/r2300_fpu.S        |  4 ++--
 arch/mips/kernel/r4k_fpu.S          | 12 +++++------
 arch/mips/kvm/fpu.S                 |  6 +++---
 9 files changed, 40 insertions(+), 75 deletions(-)

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 490dea07d4e0..a00a6d94e16f 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -95,7 +95,7 @@ all-$(CONFIG_SYS_SUPPORTS_ZBOOT)+= vmlinuz
 # crossformat linking we rely on the elf2ecoff tool for format conversion.
 #
 cflags-y			+= -G 0 -mno-abicalls -fno-pic -pipe
-cflags-y			+= -msoft-float
+cflags-y			+= -msoft-float -Wa,-msoft-float
 LDFLAGS_vmlinux			+= -G 0 -static -n -nostdlib
 KBUILD_AFLAGS_MODULE		+= -mlong-calls
 KBUILD_CFLAGS_MODULE		+= -mlong-calls
@@ -104,15 +104,6 @@ ifeq ($(CONFIG_RELOCATABLE),y)
 LDFLAGS_vmlinux			+= --emit-relocs
 endif
 
-#
-# pass -msoft-float to GAS if it supports it.  However on newer binutils
-# (specifically newer than 2.24.51.20140728) we then also need to explicitly
-# set ".set hardfloat" in all files which manipulate floating point registers.
-#
-ifneq ($(call as-option,-Wa$(comma)-msoft-float,),)
-	cflags-y		+= -DGAS_HAS_SET_HARDFLOAT -Wa,-msoft-float
-endif
-
 cflags-y += -ffreestanding
 
 cflags-$(CONFIG_CPU_BIG_ENDIAN)		+= -EB
diff --git a/arch/mips/include/asm/asmmacro-32.h b/arch/mips/include/asm/asmmacro-32.h
index 1c08c1f7903c..83a4940b7c89 100644
--- a/arch/mips/include/asm/asmmacro-32.h
+++ b/arch/mips/include/asm/asmmacro-32.h
@@ -15,7 +15,7 @@
 
 	.macro	fpu_save_single thread tmp=t0
 	.set push
-	SET_HARDFLOAT
+	.set hardfloat
 	cfc1	\tmp,  fcr31
 	s.d	$f0,  THREAD_FPR0(\thread)
 	s.d	$f2,  THREAD_FPR2(\thread)
@@ -39,7 +39,7 @@
 
 	.macro	fpu_restore_single thread tmp=t0
 	.set push
-	SET_HARDFLOAT
+	.set hardfloat
 	lw	\tmp, THREAD_FCR31(\thread)
 	l.d	$f0,  THREAD_FPR0(\thread)
 	l.d	$f2,  THREAD_FPR2(\thread)
diff --git a/arch/mips/include/asm/asmmacro.h b/arch/mips/include/asm/asmmacro.h
index ca83ada7015f..1c4438f3f2ab 100644
--- a/arch/mips/include/asm/asmmacro.h
+++ b/arch/mips/include/asm/asmmacro.h
@@ -83,7 +83,7 @@
 
 	.macro	fpu_save_16even thread tmp=t0
 	.set	push
-	SET_HARDFLOAT
+	.set	hardfloat
 	cfc1	\tmp, fcr31
 	sdc1	$f0,  THREAD_FPR0(\thread)
 	sdc1	$f2,  THREAD_FPR2(\thread)
@@ -109,7 +109,7 @@
 	.set	push
 	.set	mips64r2
 	.set	fp=64
-	SET_HARDFLOAT
+	.set	hardfloat
 	sdc1	$f1,  THREAD_FPR1(\thread)
 	sdc1	$f3,  THREAD_FPR3(\thread)
 	sdc1	$f5,  THREAD_FPR5(\thread)
@@ -142,7 +142,7 @@
 
 	.macro	fpu_restore_16even thread tmp=t0
 	.set	push
-	SET_HARDFLOAT
+	.set	hardfloat
 	lw	\tmp, THREAD_FCR31(\thread)
 	ldc1	$f0,  THREAD_FPR0(\thread)
 	ldc1	$f2,  THREAD_FPR2(\thread)
@@ -168,7 +168,7 @@
 	.set	push
 	.set	mips64r2
 	.set	fp=64
-	SET_HARDFLOAT
+	.set	hardfloat
 	ldc1	$f1,  THREAD_FPR1(\thread)
 	ldc1	$f3,  THREAD_FPR3(\thread)
 	ldc1	$f5,  THREAD_FPR5(\thread)
@@ -373,7 +373,7 @@
 	.macro	_cfcmsa	rd, cs
 	.set	push
 	.set	noat
-	SET_HARDFLOAT
+	.set	hardfloat
 	insn_if_mips 0x787e0059 | (\cs << 11)
 	insn32_if_mm 0x587e0056 | (\cs << 11)
 	move	\rd, $1
@@ -383,7 +383,7 @@
 	.macro	_ctcmsa	cd, rs
 	.set	push
 	.set	noat
-	SET_HARDFLOAT
+	.set	hardfloat
 	move	$1, \rs
 	insn_if_mips 0x783e0819 | (\cd << 6)
 	insn32_if_mm 0x583e0816 | (\cd << 6)
@@ -393,7 +393,7 @@
 	.macro	ld_b	wd, off, base
 	.set	push
 	.set	noat
-	SET_HARDFLOAT
+	.set	hardfloat
 	PTR_ADDU $1, \base, \off
 	insn_if_mips 0x78000820 | (\wd << 6)
 	insn32_if_mm 0x58000807 | (\wd << 6)
@@ -403,7 +403,7 @@
 	.macro	ld_h	wd, off, base
 	.set	push
 	.set	noat
-	SET_HARDFLOAT
+	.set	hardfloat
 	PTR_ADDU $1, \base, \off
 	insn_if_mips 0x78000821 | (\wd << 6)
 	insn32_if_mm 0x58000817 | (\wd << 6)
@@ -413,7 +413,7 @@
 	.macro	ld_w	wd, off, base
 	.set	push
 	.set	noat
-	SET_HARDFLOAT
+	.set	hardfloat
 	PTR_ADDU $1, \base, \off
 	insn_if_mips 0x78000822 | (\wd << 6)
 	insn32_if_mm 0x58000827 | (\wd << 6)
@@ -423,7 +423,7 @@
 	.macro	ld_d	wd, off, base
 	.set	push
 	.set	noat
-	SET_HARDFLOAT
+	.set	hardfloat
 	PTR_ADDU $1, \base, \off
 	insn_if_mips 0x78000823 | (\wd << 6)
 	insn32_if_mm 0x58000837 | (\wd << 6)
@@ -433,7 +433,7 @@
 	.macro	st_b	wd, off, base
 	.set	push
 	.set	noat
-	SET_HARDFLOAT
+	.set	hardfloat
 	PTR_ADDU $1, \base, \off
 	insn_if_mips 0x78000824 | (\wd << 6)
 	insn32_if_mm 0x5800080f | (\wd << 6)
@@ -443,7 +443,7 @@
 	.macro	st_h	wd, off, base
 	.set	push
 	.set	noat
-	SET_HARDFLOAT
+	.set	hardfloat
 	PTR_ADDU $1, \base, \off
 	insn_if_mips 0x78000825 | (\wd << 6)
 	insn32_if_mm 0x5800081f | (\wd << 6)
@@ -453,7 +453,7 @@
 	.macro	st_w	wd, off, base
 	.set	push
 	.set	noat
-	SET_HARDFLOAT
+	.set	hardfloat
 	PTR_ADDU $1, \base, \off
 	insn_if_mips 0x78000826 | (\wd << 6)
 	insn32_if_mm 0x5800082f | (\wd << 6)
@@ -463,7 +463,7 @@
 	.macro	st_d	wd, off, base
 	.set	push
 	.set	noat
-	SET_HARDFLOAT
+	.set	hardfloat
 	PTR_ADDU $1, \base, \off
 	insn_if_mips 0x78000827 | (\wd << 6)
 	insn32_if_mm 0x5800083f | (\wd << 6)
@@ -473,7 +473,7 @@
 	.macro	copy_s_w	ws, n
 	.set	push
 	.set	noat
-	SET_HARDFLOAT
+	.set	hardfloat
 	insn_if_mips 0x78b00059 | (\n << 16) | (\ws << 11)
 	insn32_if_mm 0x58b00056 | (\n << 16) | (\ws << 11)
 	.set	pop
@@ -482,7 +482,7 @@
 	.macro	copy_s_d	ws, n
 	.set	push
 	.set	noat
-	SET_HARDFLOAT
+	.set	hardfloat
 	insn_if_mips 0x78b80059 | (\n << 16) | (\ws << 11)
 	insn32_if_mm 0x58b80056 | (\n << 16) | (\ws << 11)
 	.set	pop
@@ -491,7 +491,7 @@
 	.macro	insert_w	wd, n
 	.set	push
 	.set	noat
-	SET_HARDFLOAT
+	.set	hardfloat
 	insn_if_mips 0x79300819 | (\n << 16) | (\wd << 6)
 	insn32_if_mm 0x59300816 | (\n << 16) | (\wd << 6)
 	.set	pop
@@ -500,7 +500,7 @@
 	.macro	insert_d	wd, n
 	.set	push
 	.set	noat
-	SET_HARDFLOAT
+	.set	hardfloat
 	insn_if_mips 0x79380819 | (\n << 16) | (\wd << 6)
 	insn32_if_mm 0x59380816 | (\n << 16) | (\wd << 6)
 	.set	pop
@@ -553,7 +553,7 @@
 	st_d	29, THREAD_FPR29 - FPR_BASE_OFFS, FPR_BASE
 	st_d	30, THREAD_FPR30 - FPR_BASE_OFFS, FPR_BASE
 	st_d	31, THREAD_FPR31 - FPR_BASE_OFFS, FPR_BASE
-	SET_HARDFLOAT
+	.set	hardfloat
 	_cfcmsa	$1, MSA_CSR
 	sw	$1, THREAD_MSA_CSR(\thread)
 	.set	pop
@@ -562,7 +562,7 @@
 	.macro	msa_restore_all	thread
 	.set	push
 	.set	noat
-	SET_HARDFLOAT
+	.set	hardfloat
 	lw	$1, THREAD_MSA_CSR(\thread)
 	_ctcmsa	MSA_CSR, $1
 #ifdef TOOLCHAIN_SUPPORTS_MSA
@@ -618,7 +618,7 @@
 	.macro	msa_init_all_upper
 	.set	push
 	.set	noat
-	SET_HARDFLOAT
+	.set	hardfloat
 	not	$1, zero
 	msa_init_upper	0
 	msa_init_upper	1
diff --git a/arch/mips/include/asm/fpregdef.h b/arch/mips/include/asm/fpregdef.h
index f184ba088532..429481f9028d 100644
--- a/arch/mips/include/asm/fpregdef.h
+++ b/arch/mips/include/asm/fpregdef.h
@@ -14,20 +14,6 @@
 
 #include <asm/sgidefs.h>
 
-/*
- * starting with binutils 2.24.51.20140729, MIPS binutils warn about mixing
- * hardfloat and softfloat object files.  The kernel build uses soft-float by
- * default, so we also need to pass -msoft-float along to GAS if it supports it.
- * But this in turn causes assembler errors in files which access hardfloat
- * registers.  We detect if GAS supports "-msoft-float" in the Makefile and
- * explicitly put ".set hardfloat" where floating point registers are touched.
- */
-#ifdef GAS_HAS_SET_HARDFLOAT
-#define SET_HARDFLOAT .set hardfloat
-#else
-#define SET_HARDFLOAT
-#endif
-
 #if _MIPS_SIM == _MIPS_SIM_ABI32
 
 /*
diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index 99eeafe6dcab..2d53704d9f24 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -2367,7 +2367,7 @@ do {									\
 /*
  * Macros to access the floating point coprocessor control registers
  */
-#define _read_32bit_cp1_register(source, gas_hardfloat)			\
+#define read_32bit_cp1_register(source)					\
 ({									\
 	unsigned int __res;						\
 									\
@@ -2377,36 +2377,24 @@ do {									\
 	"	# gas fails to assemble cfc1 for some archs,	\n"	\
 	"	# like Octeon.					\n"	\
 	"	.set	mips1					\n"	\
-	"	"STR(gas_hardfloat)"				\n"	\
+	"	.set hardfloat					\n"	\
 	"	cfc1	%0,"STR(source)"			\n"	\
 	"	.set	pop					\n"	\
 	: "=r" (__res));						\
 	__res;								\
 })
 
-#define _write_32bit_cp1_register(dest, val, gas_hardfloat)		\
+#define write_32bit_cp1_register(dest, val)				\
 do {									\
 	__asm__ __volatile__(						\
 	"	.set	push					\n"	\
 	"	.set	reorder					\n"	\
-	"	"STR(gas_hardfloat)"				\n"	\
+	"	.set hardfloat					\n"	\
 	"	ctc1	%0,"STR(dest)"				\n"	\
 	"	.set	pop					\n"	\
 	: : "r" (val));							\
 } while (0)
 
-#ifdef GAS_HAS_SET_HARDFLOAT
-#define read_32bit_cp1_register(source)					\
-	_read_32bit_cp1_register(source, .set hardfloat)
-#define write_32bit_cp1_register(dest, val)				\
-	_write_32bit_cp1_register(dest, val, .set hardfloat)
-#else
-#define read_32bit_cp1_register(source)					\
-	_read_32bit_cp1_register(source, )
-#define write_32bit_cp1_register(dest, val)				\
-	_write_32bit_cp1_register(dest, val, )
-#endif
-
 #ifdef TOOLCHAIN_SUPPORTS_DSP
 #define rddsp(mask)							\
 ({									\
diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
index 3425df6019c0..b6de8e88c1bd 100644
--- a/arch/mips/kernel/genex.S
+++ b/arch/mips/kernel/genex.S
@@ -480,7 +480,7 @@ NESTED(nmi_handler, PT_SIZE, sp)
 	.set	push
 	/* gas fails to assemble cfc1 for some archs (octeon).*/ \
 	.set	mips1
-	SET_HARDFLOAT
+	.set	hardfloat
 	cfc1	a1, fcr31
 	.set	pop
 	.endm
diff --git a/arch/mips/kernel/r2300_fpu.S b/arch/mips/kernel/r2300_fpu.S
index 2748c55820c2..6c745aa9e825 100644
--- a/arch/mips/kernel/r2300_fpu.S
+++ b/arch/mips/kernel/r2300_fpu.S
@@ -64,7 +64,7 @@ LEAF(_restore_fp)
  */
 LEAF(_save_fp_context)
 	.set	push
-	SET_HARDFLOAT
+	.set	hardfloat
 	li	v0, 0					# assume success
 	cfc1	t1, fcr31
 	EX2(s.d $f0, 0(a0))
@@ -98,7 +98,7 @@ LEAF(_save_fp_context)
  */
 LEAF(_restore_fp_context)
 	.set	push
-	SET_HARDFLOAT
+	.set	hardfloat
 	li	v0, 0					# assume success
 	EX(lw t0, (a1))
 	EX2(l.d $f0, 0(a0))
diff --git a/arch/mips/kernel/r4k_fpu.S b/arch/mips/kernel/r4k_fpu.S
index 2e687c60bc4f..4e8c98517d9d 100644
--- a/arch/mips/kernel/r4k_fpu.S
+++ b/arch/mips/kernel/r4k_fpu.S
@@ -26,7 +26,7 @@
 
 	.macro	EX insn, reg, src
 	.set	push
-	SET_HARDFLOAT
+	.set	hardfloat
 	.set	nomacro
 .ex\@:	\insn	\reg, \src
 	.set	pop
@@ -98,14 +98,14 @@ LEAF(_init_msa_upper)
  */
 LEAF(_save_fp_context)
 	.set	push
-	SET_HARDFLOAT
+	.set	hardfloat
 	cfc1	t1, fcr31
 	.set	pop
 
 #if defined(CONFIG_64BIT) || defined(CONFIG_CPU_MIPSR2) || \
     defined(CONFIG_CPU_MIPSR5) || defined(CONFIG_CPU_MIPSR6)
 	.set	push
-	SET_HARDFLOAT
+	.set	hardfloat
 #if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR5)
 	.set	mips32r2
 	.set	fp=64
@@ -135,7 +135,7 @@ LEAF(_save_fp_context)
 #endif
 
 	.set push
-	SET_HARDFLOAT
+	.set	hardfloat
 	/* Store the 16 even double precision registers */
 	EX	sdc1 $f0, 0(a0)
 	EX	sdc1 $f2, 16(a0)
@@ -173,7 +173,7 @@ LEAF(_restore_fp_context)
 #if defined(CONFIG_64BIT) || defined(CONFIG_CPU_MIPSR2) || \
     defined(CONFIG_CPU_MIPSR5) || defined(CONFIG_CPU_MIPSR6)
 	.set	push
-	SET_HARDFLOAT
+	.set	hardfloat
 #if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR5)
 	.set	mips32r2
 	.set	fp=64
@@ -201,7 +201,7 @@ LEAF(_restore_fp_context)
 1:	.set pop
 #endif
 	.set push
-	SET_HARDFLOAT
+	.set hardfloat
 	EX	ldc1 $f0, 0(a0)
 	EX	ldc1 $f2, 16(a0)
 	EX	ldc1 $f4, 32(a0)
diff --git a/arch/mips/kvm/fpu.S b/arch/mips/kvm/fpu.S
index 16f17c6390dd..eb2e8cc3532f 100644
--- a/arch/mips/kvm/fpu.S
+++ b/arch/mips/kvm/fpu.S
@@ -22,7 +22,7 @@
 
 LEAF(__kvm_save_fpu)
 	.set	push
-	SET_HARDFLOAT
+	.set	hardfloat
 	.set	fp=64
 	mfc0	t0, CP0_STATUS
 	sll     t0, t0, 5			# is Status.FR set?
@@ -66,7 +66,7 @@ LEAF(__kvm_save_fpu)
 
 LEAF(__kvm_restore_fpu)
 	.set	push
-	SET_HARDFLOAT
+	.set	hardfloat
 	.set	fp=64
 	mfc0	t0, CP0_STATUS
 	sll     t0, t0, 5			# is Status.FR set?
@@ -110,7 +110,7 @@ LEAF(__kvm_restore_fpu)
 
 LEAF(__kvm_restore_fcsr)
 	.set	push
-	SET_HARDFLOAT
+	.set	hardfloat
 	lw	t0, VCPU_FCR31(a0)
 	/*
 	 * The ctc1 must stay at this offset in __kvm_restore_fcsr.

-- 
2.39.0

