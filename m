Return-Path: <linux-mips+bounces-9571-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D8BAEE3CE
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 18:13:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2791F3B7E23
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 16:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE170299922;
	Mon, 30 Jun 2025 16:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vPcuVHiJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC42B2989B7;
	Mon, 30 Jun 2025 16:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751299762; cv=none; b=SYjKvKCDEYCm+Hna+shZJMqR84uk8Rj9PZj3ljOPeWJQ1shCgPo6czTtbzSEw+VgPPK9IxYea3j5XW5rC1G2Qw0SPjeT2/8zzJSV+SgPti+Bop4SzdjbeFV1mBntirPkM6cNbpAhbvDqeLfq0Lq4cx0gAL2btBxvijupSZx/MWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751299762; c=relaxed/simple;
	bh=AX3+47UVrGWP2J2bC/zrXT7p/EnL+R7qPt+i6YI6jIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CeVXSn3BSzVlY7sV+R4VzQ3fpDgtz1vWCFeLPD1VWpbKheN7/hnqpVfGsDZqZHi4JZ/vQstfnN8nm6h32rTgo3IeiGUcPReNo9bUhS2Vg/dhsB502kct2vmOGss9N2nD9eV9zMvU3DDig/4xSvhU+m4799+P5fF1U35958UY05w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vPcuVHiJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D6A9C4CEF6;
	Mon, 30 Jun 2025 16:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299762;
	bh=AX3+47UVrGWP2J2bC/zrXT7p/EnL+R7qPt+i6YI6jIM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vPcuVHiJurbdCF7aricQijbYydODfrhh5o+hU2eU/gFZAUQoAhd+uVCePS7V/xf3z
	 g9igp9NbWAEbRSP1T5WcJANeGwEPuAji4iH/zSnqhCv46/7BNh5Bz3EwbQTgZDlyij
	 uQqene2JT81iGBDoK6X0CzAiWalf0Gx6TwCGRtD5PPXlgWG18Pj1VKBsfODozRfAoO
	 uHxBu1WbSLf1Btsoy2vnHlTJJQ4NIm40Flo+sboXkz5CQ3iVXRrx0LnAK968y82j48
	 eUMC7BkE8QpcdXd+bR/tOV1Ws0Cui9863CSryKgOVzcFVUzxuzmMqRzO/unm0X8ZOH
	 vLCgIl+9+u2sg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 04/14] lib/crypto: sha256: Remove sha256_blocks_simd()
Date: Mon, 30 Jun 2025 09:06:35 -0700
Message-ID: <20250630160645.3198-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630160645.3198-1-ebiggers@kernel.org>
References: <20250630160645.3198-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of having both sha256_blocks_arch() and sha256_blocks_simd(),
instead have just sha256_blocks_arch() which uses the most efficient
implementation that is available in the calling context.

This is simpler, as it reduces the API surface.  It's also safer, since
sha256_blocks_arch() just works in all contexts, including contexts
where the FPU/SIMD/vector registers cannot be used.  This doesn't mean
that SHA-256 computations *should* be done in such contexts, but rather
we should just do the right thing instead of corrupting a random task's
registers.  Eliminating this footgun and simplifying the code is well
worth the very small performance cost of doing the check.

Note: in the case of arm and arm64, what used to be sha256_blocks_arch()
is renamed back to its original name of sha256_block_data_order().
sha256_blocks_arch() is now used for the higher-level dispatch function.
This renaming also required an update to lib/crypto/arm64/sha512.h,
since sha2-armv8.pl is shared by both SHA-256 and SHA-512.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/internal/sha2.h |  6 ------
 lib/crypto/Kconfig             |  8 --------
 lib/crypto/arm/Kconfig         |  1 -
 lib/crypto/arm/sha256-armv4.pl | 20 ++++++++++----------
 lib/crypto/arm/sha256.c        | 14 +++++++-------
 lib/crypto/arm64/Kconfig       |  1 -
 lib/crypto/arm64/sha2-armv8.pl |  2 +-
 lib/crypto/arm64/sha256.c      | 14 +++++++-------
 lib/crypto/arm64/sha512.h      |  6 +++---
 lib/crypto/riscv/Kconfig       |  1 -
 lib/crypto/riscv/sha256.c      | 12 +++---------
 lib/crypto/x86/Kconfig         |  1 -
 lib/crypto/x86/sha256.c        | 12 +++---------
 13 files changed, 34 insertions(+), 64 deletions(-)

diff --git a/include/crypto/internal/sha2.h b/include/crypto/internal/sha2.h
index 21a27fd5e198f..5a25ccc493886 100644
--- a/include/crypto/internal/sha2.h
+++ b/include/crypto/internal/sha2.h
@@ -1,11 +1,10 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
 #ifndef _CRYPTO_INTERNAL_SHA2_H
 #define _CRYPTO_INTERNAL_SHA2_H
 
-#include <crypto/internal/simd.h>
 #include <crypto/sha2.h>
 #include <linux/compiler_attributes.h>
 #include <linux/string.h>
 #include <linux/types.h>
 #include <linux/unaligned.h>
@@ -20,22 +19,17 @@ static inline bool sha256_is_arch_optimized(void)
 #endif
 void sha256_blocks_generic(u32 state[SHA256_STATE_WORDS],
 			   const u8 *data, size_t nblocks);
 void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
 			const u8 *data, size_t nblocks);
-void sha256_blocks_simd(u32 state[SHA256_STATE_WORDS],
-			const u8 *data, size_t nblocks);
 
 static __always_inline void sha256_choose_blocks(
 	u32 state[SHA256_STATE_WORDS], const u8 *data, size_t nblocks,
 	bool force_generic, bool force_simd)
 {
 	if (!IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_SHA256) || force_generic)
 		sha256_blocks_generic(state, data, nblocks);
-	else if (IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_SHA256_SIMD) &&
-		 (force_simd || crypto_simd_usable()))
-		sha256_blocks_simd(state, data, nblocks);
 	else
 		sha256_blocks_arch(state, data, nblocks);
 }
 
 static __always_inline void sha256_finup(
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 2460ddff967fc..9bd740475a898 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -148,18 +148,10 @@ config CRYPTO_ARCH_HAVE_LIB_SHA256
 	bool
 	help
 	  Declares whether the architecture provides an arch-specific
 	  accelerated implementation of the SHA-256 library interface.
 
-config CRYPTO_ARCH_HAVE_LIB_SHA256_SIMD
-	bool
-	help
-	  Declares whether the architecture provides an arch-specific
-	  accelerated implementation of the SHA-256 library interface
-	  that is SIMD-based and therefore not usable in hardirq
-	  context.
-
 config CRYPTO_LIB_SHA256_GENERIC
 	tristate
 	default CRYPTO_LIB_SHA256 if !CRYPTO_ARCH_HAVE_LIB_SHA256
 	help
 	  This symbol can be selected by arch implementations of the SHA-256
diff --git a/lib/crypto/arm/Kconfig b/lib/crypto/arm/Kconfig
index d1ad664f0c674..9f3ff30f40328 100644
--- a/lib/crypto/arm/Kconfig
+++ b/lib/crypto/arm/Kconfig
@@ -26,6 +26,5 @@ config CRYPTO_POLY1305_ARM
 config CRYPTO_SHA256_ARM
 	tristate
 	depends on !CPU_V7M
 	default CRYPTO_LIB_SHA256
 	select CRYPTO_ARCH_HAVE_LIB_SHA256
-	select CRYPTO_ARCH_HAVE_LIB_SHA256_SIMD
diff --git a/lib/crypto/arm/sha256-armv4.pl b/lib/crypto/arm/sha256-armv4.pl
index 8122db7fd5990..f3a2b54efd4ee 100644
--- a/lib/crypto/arm/sha256-armv4.pl
+++ b/lib/crypto/arm/sha256-armv4.pl
@@ -202,22 +202,22 @@ K256:
 .word	0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2
 .size	K256,.-K256
 .word	0				@ terminator
 #if __ARM_MAX_ARCH__>=7 && !defined(__KERNEL__)
 .LOPENSSL_armcap:
-.word	OPENSSL_armcap_P-sha256_blocks_arch
+.word	OPENSSL_armcap_P-sha256_block_data_order
 #endif
 .align	5
 
-.global	sha256_blocks_arch
-.type	sha256_blocks_arch,%function
-sha256_blocks_arch:
-.Lsha256_blocks_arch:
+.global	sha256_block_data_order
+.type	sha256_block_data_order,%function
+sha256_block_data_order:
+.Lsha256_block_data_order:
 #if __ARM_ARCH__<7
-	sub	r3,pc,#8		@ sha256_blocks_arch
+	sub	r3,pc,#8		@ sha256_block_data_order
 #else
-	adr	r3,.Lsha256_blocks_arch
+	adr	r3,.Lsha256_block_data_order
 #endif
 #if __ARM_MAX_ARCH__>=7 && !defined(__KERNEL__)
 	ldr	r12,.LOPENSSL_armcap
 	ldr	r12,[r3,r12]		@ OPENSSL_armcap_P
 	tst	r12,#ARMV8_SHA256
@@ -280,11 +280,11 @@ $code.=<<___;
 	ldmia	sp!,{r4-r11,lr}
 	tst	lr,#1
 	moveq	pc,lr			@ be binary compatible with V4, yet
 	bx	lr			@ interoperable with Thumb ISA:-)
 #endif
-.size	sha256_blocks_arch,.-sha256_blocks_arch
+.size	sha256_block_data_order,.-sha256_block_data_order
 ___
 ######################################################################
 # NEON stuff
 #
 {{{
@@ -468,12 +468,12 @@ $code.=<<___;
 sha256_block_data_order_neon:
 .LNEON:
 	stmdb	sp!,{r4-r12,lr}
 
 	sub	$H,sp,#16*4+16
-	adr	$Ktbl,.Lsha256_blocks_arch
-	sub	$Ktbl,$Ktbl,#.Lsha256_blocks_arch-K256
+	adr	$Ktbl,.Lsha256_block_data_order
+	sub	$Ktbl,$Ktbl,#.Lsha256_block_data_order-K256
 	bic	$H,$H,#15		@ align for 128-bit stores
 	mov	$t2,sp
 	mov	sp,$H			@ alloca
 	add	$len,$inp,$len,lsl#6	@ len to point at the end of inp
 
diff --git a/lib/crypto/arm/sha256.c b/lib/crypto/arm/sha256.c
index 109192e54b0f0..2c9cfdaaa0691 100644
--- a/lib/crypto/arm/sha256.c
+++ b/lib/crypto/arm/sha256.c
@@ -4,40 +4,40 @@
  *
  * Copyright 2025 Google LLC
  */
 #include <asm/neon.h>
 #include <crypto/internal/sha2.h>
+#include <crypto/internal/simd.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
-asmlinkage void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
-				   const u8 *data, size_t nblocks);
-EXPORT_SYMBOL_GPL(sha256_blocks_arch);
+asmlinkage void sha256_block_data_order(u32 state[SHA256_STATE_WORDS],
+					const u8 *data, size_t nblocks);
 asmlinkage void sha256_block_data_order_neon(u32 state[SHA256_STATE_WORDS],
 					     const u8 *data, size_t nblocks);
 asmlinkage void sha256_ce_transform(u32 state[SHA256_STATE_WORDS],
 				    const u8 *data, size_t nblocks);
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_ce);
 
-void sha256_blocks_simd(u32 state[SHA256_STATE_WORDS],
+void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
 			const u8 *data, size_t nblocks)
 {
 	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
-	    static_branch_likely(&have_neon)) {
+	    static_branch_likely(&have_neon) && crypto_simd_usable()) {
 		kernel_neon_begin();
 		if (static_branch_likely(&have_ce))
 			sha256_ce_transform(state, data, nblocks);
 		else
 			sha256_block_data_order_neon(state, data, nblocks);
 		kernel_neon_end();
 	} else {
-		sha256_blocks_arch(state, data, nblocks);
+		sha256_block_data_order(state, data, nblocks);
 	}
 }
-EXPORT_SYMBOL_GPL(sha256_blocks_simd);
+EXPORT_SYMBOL_GPL(sha256_blocks_arch);
 
 bool sha256_is_arch_optimized(void)
 {
 	/* We always can use at least the ARM scalar implementation. */
 	return true;
diff --git a/lib/crypto/arm64/Kconfig b/lib/crypto/arm64/Kconfig
index 129a7685cb4c1..49e57bfdb5b52 100644
--- a/lib/crypto/arm64/Kconfig
+++ b/lib/crypto/arm64/Kconfig
@@ -15,6 +15,5 @@ config CRYPTO_POLY1305_NEON
 
 config CRYPTO_SHA256_ARM64
 	tristate
 	default CRYPTO_LIB_SHA256
 	select CRYPTO_ARCH_HAVE_LIB_SHA256
-	select CRYPTO_ARCH_HAVE_LIB_SHA256_SIMD
diff --git a/lib/crypto/arm64/sha2-armv8.pl b/lib/crypto/arm64/sha2-armv8.pl
index 4aebd20c498bc..35ec9ae99fe16 100644
--- a/lib/crypto/arm64/sha2-armv8.pl
+++ b/lib/crypto/arm64/sha2-armv8.pl
@@ -93,11 +93,11 @@ if ($output =~ /512/) {
 	@sigma1=(17,19,10);
 	$rounds=64;
 	$reg_t="w";
 }
 
-$func="sha${BITS}_blocks_arch";
+$func="sha${BITS}_block_data_order";
 
 ($ctx,$inp,$num,$Ktbl)=map("x$_",(0..2,30));
 
 @X=map("$reg_t$_",(3..15,0..2));
 @V=($A,$B,$C,$D,$E,$F,$G,$H)=map("$reg_t$_",(20..27));
diff --git a/lib/crypto/arm64/sha256.c b/lib/crypto/arm64/sha256.c
index bcf7a3adc0c46..fb9bff40357be 100644
--- a/lib/crypto/arm64/sha256.c
+++ b/lib/crypto/arm64/sha256.c
@@ -4,29 +4,29 @@
  *
  * Copyright 2025 Google LLC
  */
 #include <asm/neon.h>
 #include <crypto/internal/sha2.h>
+#include <crypto/internal/simd.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
-asmlinkage void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
-				   const u8 *data, size_t nblocks);
-EXPORT_SYMBOL_GPL(sha256_blocks_arch);
+asmlinkage void sha256_block_data_order(u32 state[SHA256_STATE_WORDS],
+					const u8 *data, size_t nblocks);
 asmlinkage void sha256_block_neon(u32 state[SHA256_STATE_WORDS],
 				  const u8 *data, size_t nblocks);
 asmlinkage size_t __sha256_ce_transform(u32 state[SHA256_STATE_WORDS],
 					const u8 *data, size_t nblocks);
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_ce);
 
-void sha256_blocks_simd(u32 state[SHA256_STATE_WORDS],
+void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
 			const u8 *data, size_t nblocks)
 {
 	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
-	    static_branch_likely(&have_neon)) {
+	    static_branch_likely(&have_neon) && crypto_simd_usable()) {
 		if (static_branch_likely(&have_ce)) {
 			do {
 				size_t rem;
 
 				kernel_neon_begin();
@@ -40,14 +40,14 @@ void sha256_blocks_simd(u32 state[SHA256_STATE_WORDS],
 			kernel_neon_begin();
 			sha256_block_neon(state, data, nblocks);
 			kernel_neon_end();
 		}
 	} else {
-		sha256_blocks_arch(state, data, nblocks);
+		sha256_block_data_order(state, data, nblocks);
 	}
 }
-EXPORT_SYMBOL_GPL(sha256_blocks_simd);
+EXPORT_SYMBOL_GPL(sha256_blocks_arch);
 
 bool sha256_is_arch_optimized(void)
 {
 	/* We always can use at least the ARM64 scalar implementation. */
 	return true;
diff --git a/lib/crypto/arm64/sha512.h b/lib/crypto/arm64/sha512.h
index eae14f9752e0b..6abb40b467f2e 100644
--- a/lib/crypto/arm64/sha512.h
+++ b/lib/crypto/arm64/sha512.h
@@ -9,12 +9,12 @@
 #include <crypto/internal/simd.h>
 #include <linux/cpufeature.h>
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_sha512_insns);
 
-asmlinkage void sha512_blocks_arch(struct sha512_block_state *state,
-				   const u8 *data, size_t nblocks);
+asmlinkage void sha512_block_data_order(struct sha512_block_state *state,
+					const u8 *data, size_t nblocks);
 asmlinkage size_t __sha512_ce_transform(struct sha512_block_state *state,
 					const u8 *data, size_t nblocks);
 
 static void sha512_blocks(struct sha512_block_state *state,
 			  const u8 *data, size_t nblocks)
@@ -30,11 +30,11 @@ static void sha512_blocks(struct sha512_block_state *state,
 			kernel_neon_end();
 			data += (nblocks - rem) * SHA512_BLOCK_SIZE;
 			nblocks = rem;
 		} while (nblocks);
 	} else {
-		sha512_blocks_arch(state, data, nblocks);
+		sha512_block_data_order(state, data, nblocks);
 	}
 }
 
 #ifdef CONFIG_KERNEL_MODE_NEON
 #define sha512_mod_init_arch sha512_mod_init_arch
diff --git a/lib/crypto/riscv/Kconfig b/lib/crypto/riscv/Kconfig
index 47c99ea97ce2c..c100571feb7e8 100644
--- a/lib/crypto/riscv/Kconfig
+++ b/lib/crypto/riscv/Kconfig
@@ -10,7 +10,6 @@ config CRYPTO_CHACHA_RISCV64
 config CRYPTO_SHA256_RISCV64
 	tristate
 	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
 	default CRYPTO_LIB_SHA256
 	select CRYPTO_ARCH_HAVE_LIB_SHA256
-	select CRYPTO_ARCH_HAVE_LIB_SHA256_SIMD
 	select CRYPTO_LIB_SHA256_GENERIC
diff --git a/lib/crypto/riscv/sha256.c b/lib/crypto/riscv/sha256.c
index 71808397dff4c..aa77349d08f30 100644
--- a/lib/crypto/riscv/sha256.c
+++ b/lib/crypto/riscv/sha256.c
@@ -9,36 +9,30 @@
  * Author: Jerry Shih <jerry.shih@sifive.com>
  */
 
 #include <asm/vector.h>
 #include <crypto/internal/sha2.h>
+#include <crypto/internal/simd.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
 asmlinkage void sha256_transform_zvknha_or_zvknhb_zvkb(
 	u32 state[SHA256_STATE_WORDS], const u8 *data, size_t nblocks);
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_extensions);
 
-void sha256_blocks_simd(u32 state[SHA256_STATE_WORDS],
+void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
 			const u8 *data, size_t nblocks)
 {
-	if (static_branch_likely(&have_extensions)) {
+	if (static_branch_likely(&have_extensions) && crypto_simd_usable()) {
 		kernel_vector_begin();
 		sha256_transform_zvknha_or_zvknhb_zvkb(state, data, nblocks);
 		kernel_vector_end();
 	} else {
 		sha256_blocks_generic(state, data, nblocks);
 	}
 }
-EXPORT_SYMBOL_GPL(sha256_blocks_simd);
-
-void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
-			const u8 *data, size_t nblocks)
-{
-	sha256_blocks_generic(state, data, nblocks);
-}
 EXPORT_SYMBOL_GPL(sha256_blocks_arch);
 
 bool sha256_is_arch_optimized(void)
 {
 	return static_key_enabled(&have_extensions);
diff --git a/lib/crypto/x86/Kconfig b/lib/crypto/x86/Kconfig
index 5e94cdee492c2..e344579db3d85 100644
--- a/lib/crypto/x86/Kconfig
+++ b/lib/crypto/x86/Kconfig
@@ -28,7 +28,6 @@ config CRYPTO_POLY1305_X86_64
 config CRYPTO_SHA256_X86_64
 	tristate
 	depends on 64BIT
 	default CRYPTO_LIB_SHA256
 	select CRYPTO_ARCH_HAVE_LIB_SHA256
-	select CRYPTO_ARCH_HAVE_LIB_SHA256_SIMD
 	select CRYPTO_LIB_SHA256_GENERIC
diff --git a/lib/crypto/x86/sha256.c b/lib/crypto/x86/sha256.c
index 80380f8fdcee4..baba74d7d26f2 100644
--- a/lib/crypto/x86/sha256.c
+++ b/lib/crypto/x86/sha256.c
@@ -4,10 +4,11 @@
  *
  * Copyright 2025 Google LLC
  */
 #include <asm/fpu/api.h>
 #include <crypto/internal/sha2.h>
+#include <crypto/internal/simd.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/static_call.h>
 
 asmlinkage void sha256_transform_ssse3(u32 state[SHA256_STATE_WORDS],
@@ -21,28 +22,21 @@ asmlinkage void sha256_ni_transform(u32 state[SHA256_STATE_WORDS],
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_sha256_x86);
 
 DEFINE_STATIC_CALL(sha256_blocks_x86, sha256_transform_ssse3);
 
-void sha256_blocks_simd(u32 state[SHA256_STATE_WORDS],
+void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
 			const u8 *data, size_t nblocks)
 {
-	if (static_branch_likely(&have_sha256_x86)) {
+	if (static_branch_likely(&have_sha256_x86) && crypto_simd_usable()) {
 		kernel_fpu_begin();
 		static_call(sha256_blocks_x86)(state, data, nblocks);
 		kernel_fpu_end();
 	} else {
 		sha256_blocks_generic(state, data, nblocks);
 	}
 }
-EXPORT_SYMBOL_GPL(sha256_blocks_simd);
-
-void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
-			const u8 *data, size_t nblocks)
-{
-	sha256_blocks_generic(state, data, nblocks);
-}
 EXPORT_SYMBOL_GPL(sha256_blocks_arch);
 
 bool sha256_is_arch_optimized(void)
 {
 	return static_key_enabled(&have_sha256_x86);
-- 
2.50.0


