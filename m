Return-Path: <linux-mips+bounces-9772-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DA7B02DC3
	for <lists+linux-mips@lfdr.de>; Sun, 13 Jul 2025 01:27:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AA13A42D82
	for <lists+linux-mips@lfdr.de>; Sat, 12 Jul 2025 23:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDBB7236A73;
	Sat, 12 Jul 2025 23:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VHp+oJL4"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA36D2367C0;
	Sat, 12 Jul 2025 23:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752362783; cv=none; b=nA7gM04uNrWaYzxfnVZuL1f+tN1IpvaSz1DYfo/+7oM3RWLrb5CakwX2e99Ya6QbJ3cRBa8scw8cKtr1jOB4vJzASuwi9f4JiNg9I6B3U82FkpKs0UKvIrX8MFk8IzwSEqRVy0RLuLaQYTmR4GVAGRW8YZJqLc9nA7q1SuBHDQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752362783; c=relaxed/simple;
	bh=bpokzlR5aRrtAf8xhNRcFoywovQO/qQZG9FKuitvbCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FLmuHzcb1LOw9f2tAHTiUxtmp7LBNMusIoNj2kY0I03jZUpvbEXrkYUyahBGEhIe+svGEzsiW8y02K/NlM8N3cnpmr3AWtxO0f/yw9ozFGDFVr+Z5DgUmdMVHXZAqQnQatzUcA9BQGxoiU3aokKNKXkuD/VbICsUw8X/0EjjM5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VHp+oJL4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C9FBC4CEF7;
	Sat, 12 Jul 2025 23:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362783;
	bh=bpokzlR5aRrtAf8xhNRcFoywovQO/qQZG9FKuitvbCw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VHp+oJL4lww+HdUgf7FStuudDaEDe4dNiT/XClKNlG+hNGTx3nTDtMRzMd79RvUAd
	 HwebO+Scx1RN0yl+EavxREVlCgi0yunL5T+KDzGRcaBzPJucUQ61pK3nZp3k4bcrHo
	 B4T01D1397+RVSmZY9cGBfKhOkR65hNiE6gHEukV5u2yIw/VQTHffDnqfIAJSYpaa9
	 LCnzRFnURojiEODMeMQr8Ai/7CAYsKOnDnHKmX0gmrUQ3YtrvZd/Bwm2hym+38atew
	 qKMOlBrFqCv1I5eL+wfRHpQSNTYlpRLNtjr9dEQZs22Dw8Xfke2XInPk55SYESOx/I
	 0V9QcqcOg8o5A==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 07/26] lib/crypto: arm/sha1: Migrate optimized code into library
Date: Sat, 12 Jul 2025 16:22:58 -0700
Message-ID: <20250712232329.818226-8-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250712232329.818226-1-ebiggers@kernel.org>
References: <20250712232329.818226-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Instead of exposing the arm-optimized SHA-1 code via arm-specific
crypto_shash algorithms, instead just implement the sha1_blocks()
library function.  This is much simpler, it makes the SHA-1 library
functions be arm-optimized, and it fixes the longstanding issue where
the arm-optimized SHA-1 code was disabled by default.  SHA-1 still
remains available through crypto_shash, but individual architectures no
longer need to handle it.

To match sha1_blocks(), change the type of the nblocks parameter of the
assembly functions from int to size_t.  The assembly functions actually
already treated it as size_t.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm/configs/exynos_defconfig             |  1 -
 arch/arm/configs/milbeaut_m10v_defconfig      |  2 -
 arch/arm/configs/multi_v7_defconfig           |  2 -
 arch/arm/configs/omap2plus_defconfig          |  1 -
 arch/arm/configs/pxa_defconfig                |  1 -
 arch/arm/crypto/Kconfig                       | 31 -------
 arch/arm/crypto/Makefile                      |  6 --
 arch/arm/crypto/sha1-ce-glue.c                | 72 ----------------
 arch/arm/crypto/sha1_glue.c                   | 75 -----------------
 arch/arm/crypto/sha1_neon_glue.c              | 83 -------------------
 lib/crypto/Kconfig                            |  1 +
 lib/crypto/Makefile                           |  5 ++
 .../crypto/arm}/sha1-armv4-large.S            |  0
 .../crypto/arm}/sha1-armv7-neon.S             | 13 ++-
 .../crypto => lib/crypto/arm}/sha1-ce-core.S  |  4 +-
 lib/crypto/arm/sha1.h                         | 46 ++++++++++
 16 files changed, 60 insertions(+), 283 deletions(-)
 delete mode 100644 arch/arm/crypto/sha1-ce-glue.c
 delete mode 100644 arch/arm/crypto/sha1_glue.c
 delete mode 100644 arch/arm/crypto/sha1_neon_glue.c
 rename {arch/arm/crypto => lib/crypto/arm}/sha1-armv4-large.S (100%)
 rename {arch/arm/crypto => lib/crypto/arm}/sha1-armv7-neon.S (98%)
 rename {arch/arm/crypto => lib/crypto/arm}/sha1-ce-core.S (96%)
 create mode 100644 lib/crypto/arm/sha1.h

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index d58e300693045..6915c766923a2 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -361,11 +361,10 @@ CONFIG_CRYPTO_LZO=m
 CONFIG_CRYPTO_LZ4=m
 CONFIG_CRYPTO_USER_API_HASH=m
 CONFIG_CRYPTO_USER_API_SKCIPHER=m
 CONFIG_CRYPTO_USER_API_RNG=m
 CONFIG_CRYPTO_USER_API_AEAD=m
-CONFIG_CRYPTO_SHA1_ARM_NEON=m
 CONFIG_CRYPTO_AES_ARM_BS=m
 CONFIG_CRYPTO_CHACHA20_NEON=m
 CONFIG_CRYPTO_DEV_EXYNOS_RNG=y
 CONFIG_CRYPTO_DEV_S5P=y
 CONFIG_DMA_CMA=y
diff --git a/arch/arm/configs/milbeaut_m10v_defconfig b/arch/arm/configs/milbeaut_m10v_defconfig
index 8ebf8bd872fe8..a3be0b2ede09c 100644
--- a/arch/arm/configs/milbeaut_m10v_defconfig
+++ b/arch/arm/configs/milbeaut_m10v_defconfig
@@ -96,12 +96,10 @@ CONFIG_KEYS=y
 CONFIG_CRYPTO_SELFTESTS=y
 # CONFIG_CRYPTO_ECHAINIV is not set
 CONFIG_CRYPTO_AES=y
 CONFIG_CRYPTO_SEQIV=m
 CONFIG_CRYPTO_GHASH_ARM_CE=m
-CONFIG_CRYPTO_SHA1_ARM_NEON=m
-CONFIG_CRYPTO_SHA1_ARM_CE=m
 CONFIG_CRYPTO_AES_ARM=m
 CONFIG_CRYPTO_AES_ARM_BS=m
 CONFIG_CRYPTO_AES_ARM_CE=m
 CONFIG_CRYPTO_CHACHA20_NEON=m
 # CONFIG_CRYPTO_HW is not set
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 3fd07e864ca85..fb63f487a6232 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1278,12 +1278,10 @@ CONFIG_CRYPTO_USER=m
 CONFIG_CRYPTO_USER_API_HASH=m
 CONFIG_CRYPTO_USER_API_SKCIPHER=m
 CONFIG_CRYPTO_USER_API_RNG=m
 CONFIG_CRYPTO_USER_API_AEAD=m
 CONFIG_CRYPTO_GHASH_ARM_CE=m
-CONFIG_CRYPTO_SHA1_ARM_NEON=m
-CONFIG_CRYPTO_SHA1_ARM_CE=m
 CONFIG_CRYPTO_AES_ARM=m
 CONFIG_CRYPTO_AES_ARM_BS=m
 CONFIG_CRYPTO_AES_ARM_CE=m
 CONFIG_CRYPTO_CHACHA20_NEON=m
 CONFIG_CRYPTO_DEV_SUN4I_SS=m
diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index 530dfb8338c98..0464676379013 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -702,11 +702,10 @@ CONFIG_ROOT_NFS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_SECURITY=y
 CONFIG_CRYPTO_MICHAEL_MIC=y
 CONFIG_CRYPTO_GHASH_ARM_CE=m
-CONFIG_CRYPTO_SHA1_ARM_NEON=m
 CONFIG_CRYPTO_AES_ARM=m
 CONFIG_CRYPTO_AES_ARM_BS=m
 CONFIG_CRYPTO_CHACHA20_NEON=m
 CONFIG_CRYPTO_DEV_OMAP=m
 CONFIG_CRYPTO_DEV_OMAP_SHAM=m
diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index eaa44574d4a64..1a80602c12845 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -656,11 +656,10 @@ CONFIG_CRYPTO_TGR192=m
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_XCBC=m
 CONFIG_CRYPTO_DEFLATE=y
 CONFIG_CRYPTO_LZO=y
-CONFIG_CRYPTO_SHA1_ARM=m
 CONFIG_CRYPTO_AES_ARM=m
 CONFIG_FONTS=y
 CONFIG_FONT_8x8=y
 CONFIG_FONT_8x16=y
 CONFIG_FONT_6x11=y
diff --git a/arch/arm/crypto/Kconfig b/arch/arm/crypto/Kconfig
index a18f97f1597cb..1e5f3cdf691c4 100644
--- a/arch/arm/crypto/Kconfig
+++ b/arch/arm/crypto/Kconfig
@@ -60,41 +60,10 @@ config CRYPTO_BLAKE2B_NEON
 	  On ARM processors that have NEON support but not the ARMv8
 	  Crypto Extensions, typically this BLAKE2b implementation is
 	  much faster than the SHA-2 family and slightly faster than
 	  SHA-1.
 
-config CRYPTO_SHA1_ARM
-	tristate "Hash functions: SHA-1"
-	select CRYPTO_SHA1
-	select CRYPTO_HASH
-	help
-	  SHA-1 secure hash algorithm (FIPS 180)
-
-	  Architecture: arm
-
-config CRYPTO_SHA1_ARM_NEON
-	tristate "Hash functions: SHA-1 (NEON)"
-	depends on KERNEL_MODE_NEON
-	select CRYPTO_SHA1_ARM
-	select CRYPTO_SHA1
-	select CRYPTO_HASH
-	help
-	  SHA-1 secure hash algorithm (FIPS 180)
-
-	  Architecture: arm using
-	  - NEON (Advanced SIMD) extensions
-
-config CRYPTO_SHA1_ARM_CE
-	tristate "Hash functions: SHA-1 (ARMv8 Crypto Extensions)"
-	depends on KERNEL_MODE_NEON
-	select CRYPTO_SHA1_ARM
-	select CRYPTO_HASH
-	help
-	  SHA-1 secure hash algorithm (FIPS 180)
-
-	  Architecture: arm using ARMv8 Crypto Extensions
-
 config CRYPTO_AES_ARM
 	tristate "Ciphers: AES"
 	select CRYPTO_ALGAPI
 	select CRYPTO_AES
 	help
diff --git a/arch/arm/crypto/Makefile b/arch/arm/crypto/Makefile
index 78a4042d8761c..4f23999ae17df 100644
--- a/arch/arm/crypto/Makefile
+++ b/arch/arm/crypto/Makefile
@@ -3,25 +3,19 @@
 # Arch-specific CryptoAPI modules.
 #
 
 obj-$(CONFIG_CRYPTO_AES_ARM) += aes-arm.o
 obj-$(CONFIG_CRYPTO_AES_ARM_BS) += aes-arm-bs.o
-obj-$(CONFIG_CRYPTO_SHA1_ARM) += sha1-arm.o
-obj-$(CONFIG_CRYPTO_SHA1_ARM_NEON) += sha1-arm-neon.o
 obj-$(CONFIG_CRYPTO_BLAKE2B_NEON) += blake2b-neon.o
 obj-$(CONFIG_CRYPTO_NHPOLY1305_NEON) += nhpoly1305-neon.o
 obj-$(CONFIG_CRYPTO_CURVE25519_NEON) += curve25519-neon.o
 
 obj-$(CONFIG_CRYPTO_AES_ARM_CE) += aes-arm-ce.o
-obj-$(CONFIG_CRYPTO_SHA1_ARM_CE) += sha1-arm-ce.o
 obj-$(CONFIG_CRYPTO_GHASH_ARM_CE) += ghash-arm-ce.o
 
 aes-arm-y	:= aes-cipher-core.o aes-cipher-glue.o
 aes-arm-bs-y	:= aes-neonbs-core.o aes-neonbs-glue.o
-sha1-arm-y	:= sha1-armv4-large.o sha1_glue.o
-sha1-arm-neon-y	:= sha1-armv7-neon.o sha1_neon_glue.o
 blake2b-neon-y  := blake2b-neon-core.o blake2b-neon-glue.o
-sha1-arm-ce-y	:= sha1-ce-core.o sha1-ce-glue.o
 aes-arm-ce-y	:= aes-ce-core.o aes-ce-glue.o
 ghash-arm-ce-y	:= ghash-ce-core.o ghash-ce-glue.o
 nhpoly1305-neon-y := nh-neon-core.o nhpoly1305-neon-glue.o
 curve25519-neon-y := curve25519-core.o curve25519-glue.o
diff --git a/arch/arm/crypto/sha1-ce-glue.c b/arch/arm/crypto/sha1-ce-glue.c
deleted file mode 100644
index fac07a4799de6..0000000000000
--- a/arch/arm/crypto/sha1-ce-glue.c
+++ /dev/null
@@ -1,72 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * sha1-ce-glue.c - SHA-1 secure hash using ARMv8 Crypto Extensions
- *
- * Copyright (C) 2015 Linaro Ltd <ard.biesheuvel@linaro.org>
- */
-
-#include <asm/neon.h>
-#include <crypto/internal/hash.h>
-#include <crypto/sha1.h>
-#include <crypto/sha1_base.h>
-#include <linux/cpufeature.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-
-MODULE_DESCRIPTION("SHA1 secure hash using ARMv8 Crypto Extensions");
-MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
-MODULE_LICENSE("GPL v2");
-
-asmlinkage void sha1_ce_transform(struct sha1_state *sst, u8 const *src,
-				  int blocks);
-
-static int sha1_ce_update(struct shash_desc *desc, const u8 *data,
-			  unsigned int len)
-{
-	int remain;
-
-	kernel_neon_begin();
-	remain = sha1_base_do_update_blocks(desc, data, len, sha1_ce_transform);
-	kernel_neon_end();
-
-	return remain;
-}
-
-static int sha1_ce_finup(struct shash_desc *desc, const u8 *data,
-			 unsigned int len, u8 *out)
-{
-	kernel_neon_begin();
-	sha1_base_do_finup(desc, data, len, sha1_ce_transform);
-	kernel_neon_end();
-
-	return sha1_base_finish(desc, out);
-}
-
-static struct shash_alg alg = {
-	.init			= sha1_base_init,
-	.update			= sha1_ce_update,
-	.finup			= sha1_ce_finup,
-	.descsize		= SHA1_STATE_SIZE,
-	.digestsize		= SHA1_DIGEST_SIZE,
-	.base			= {
-		.cra_name		= "sha1",
-		.cra_driver_name	= "sha1-ce",
-		.cra_priority		= 200,
-		.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY,
-		.cra_blocksize		= SHA1_BLOCK_SIZE,
-		.cra_module		= THIS_MODULE,
-	}
-};
-
-static int __init sha1_ce_mod_init(void)
-{
-	return crypto_register_shash(&alg);
-}
-
-static void __exit sha1_ce_mod_fini(void)
-{
-	crypto_unregister_shash(&alg);
-}
-
-module_cpu_feature_match(SHA1, sha1_ce_mod_init);
-module_exit(sha1_ce_mod_fini);
diff --git a/arch/arm/crypto/sha1_glue.c b/arch/arm/crypto/sha1_glue.c
deleted file mode 100644
index 255da00c7d98a..0000000000000
--- a/arch/arm/crypto/sha1_glue.c
+++ /dev/null
@@ -1,75 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Cryptographic API.
- * Glue code for the SHA1 Secure Hash Algorithm assembler implementation
- *
- * This file is based on sha1_generic.c and sha1_ssse3_glue.c
- *
- * Copyright (c) Alan Smithee.
- * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
- * Copyright (c) Jean-Francois Dive <jef@linuxbe.org>
- * Copyright (c) Mathias Krause <minipli@googlemail.com>
- */
-
-#include <crypto/internal/hash.h>
-#include <crypto/sha1.h>
-#include <crypto/sha1_base.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-
-asmlinkage void sha1_block_data_order(struct sha1_state *digest,
-		const u8 *data, int rounds);
-
-static int sha1_update_arm(struct shash_desc *desc, const u8 *data,
-			   unsigned int len)
-{
-	/* make sure signature matches sha1_block_fn() */
-	BUILD_BUG_ON(offsetof(struct sha1_state, state) != 0);
-
-	return sha1_base_do_update_blocks(desc, data, len,
-					  sha1_block_data_order);
-}
-
-static int sha1_finup_arm(struct shash_desc *desc, const u8 *data,
-			  unsigned int len, u8 *out)
-{
-	sha1_base_do_finup(desc, data, len, sha1_block_data_order);
-	return sha1_base_finish(desc, out);
-}
-
-static struct shash_alg alg = {
-	.digestsize	=	SHA1_DIGEST_SIZE,
-	.init		=	sha1_base_init,
-	.update		=	sha1_update_arm,
-	.finup		=	sha1_finup_arm,
-	.descsize	=	SHA1_STATE_SIZE,
-	.base		=	{
-		.cra_name	=	"sha1",
-		.cra_driver_name=	"sha1-asm",
-		.cra_priority	=	150,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY,
-		.cra_blocksize	=	SHA1_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-};
-
-
-static int __init sha1_mod_init(void)
-{
-	return crypto_register_shash(&alg);
-}
-
-
-static void __exit sha1_mod_fini(void)
-{
-	crypto_unregister_shash(&alg);
-}
-
-
-module_init(sha1_mod_init);
-module_exit(sha1_mod_fini);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("SHA1 Secure Hash Algorithm (ARM)");
-MODULE_ALIAS_CRYPTO("sha1");
-MODULE_AUTHOR("David McCullough <ucdevel@gmail.com>");
diff --git a/arch/arm/crypto/sha1_neon_glue.c b/arch/arm/crypto/sha1_neon_glue.c
deleted file mode 100644
index d321850f22a6d..0000000000000
--- a/arch/arm/crypto/sha1_neon_glue.c
+++ /dev/null
@@ -1,83 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Glue code for the SHA1 Secure Hash Algorithm assembler implementation using
- * ARM NEON instructions.
- *
- * Copyright © 2014 Jussi Kivilinna <jussi.kivilinna@iki.fi>
- *
- * This file is based on sha1_generic.c and sha1_ssse3_glue.c:
- *  Copyright (c) Alan Smithee.
- *  Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
- *  Copyright (c) Jean-Francois Dive <jef@linuxbe.org>
- *  Copyright (c) Mathias Krause <minipli@googlemail.com>
- *  Copyright (c) Chandramouli Narayanan <mouli@linux.intel.com>
- */
-
-#include <asm/neon.h>
-#include <crypto/internal/hash.h>
-#include <crypto/sha1.h>
-#include <crypto/sha1_base.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-
-asmlinkage void sha1_transform_neon(struct sha1_state *state_h,
-				    const u8 *data, int rounds);
-
-static int sha1_neon_update(struct shash_desc *desc, const u8 *data,
-			  unsigned int len)
-{
-	int remain;
-
-	kernel_neon_begin();
-	remain = sha1_base_do_update_blocks(desc, data, len,
-					    sha1_transform_neon);
-	kernel_neon_end();
-
-	return remain;
-}
-
-static int sha1_neon_finup(struct shash_desc *desc, const u8 *data,
-			   unsigned int len, u8 *out)
-{
-	kernel_neon_begin();
-	sha1_base_do_finup(desc, data, len, sha1_transform_neon);
-	kernel_neon_end();
-
-	return sha1_base_finish(desc, out);
-}
-
-static struct shash_alg alg = {
-	.digestsize	=	SHA1_DIGEST_SIZE,
-	.init		=	sha1_base_init,
-	.update		=	sha1_neon_update,
-	.finup		=	sha1_neon_finup,
-	.descsize		= SHA1_STATE_SIZE,
-	.base		=	{
-		.cra_name		= "sha1",
-		.cra_driver_name	= "sha1-neon",
-		.cra_priority		= 250,
-		.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY,
-		.cra_blocksize		= SHA1_BLOCK_SIZE,
-		.cra_module		= THIS_MODULE,
-	}
-};
-
-static int __init sha1_neon_mod_init(void)
-{
-	if (!cpu_has_neon())
-		return -ENODEV;
-
-	return crypto_register_shash(&alg);
-}
-
-static void __exit sha1_neon_mod_fini(void)
-{
-	crypto_unregister_shash(&alg);
-}
-
-module_init(sha1_neon_mod_init);
-module_exit(sha1_neon_mod_fini);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("SHA1 Secure Hash Algorithm, NEON accelerated");
-MODULE_ALIAS_CRYPTO("sha1");
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index ff54c9a631f86..5c1bfa02fa349 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -144,10 +144,11 @@ config CRYPTO_LIB_SHA1
 	  the functions from <crypto/sha1.h>.
 
 config CRYPTO_LIB_SHA1_ARCH
 	bool
 	depends on CRYPTO_LIB_SHA1 && !UML
+	default y if ARM
 
 config CRYPTO_LIB_SHA256
 	tristate
 	help
 	  Enable the SHA-256 library interface. This interface may be fulfilled
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index c96abfc4b9d3b..e10a84a6dda6a 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -71,10 +71,15 @@ libpoly1305-generic-y				+= poly1305-generic.o
 
 obj-$(CONFIG_CRYPTO_LIB_SHA1) += libsha1.o
 libsha1-y := sha1.o
 ifeq ($(CONFIG_CRYPTO_LIB_SHA1_ARCH),y)
 CFLAGS_sha1.o += -I$(src)/$(SRCARCH)
+ifeq ($(CONFIG_ARM),y)
+libsha1-y += arm/sha1-armv4-large.o
+libsha1-$(CONFIG_KERNEL_MODE_NEON) += arm/sha1-armv7-neon.o \
+				      arm/sha1-ce-core.o
+endif
 endif # CONFIG_CRYPTO_LIB_SHA1_ARCH
 
 ################################################################################
 
 obj-$(CONFIG_CRYPTO_LIB_SHA256) += libsha256.o
diff --git a/arch/arm/crypto/sha1-armv4-large.S b/lib/crypto/arm/sha1-armv4-large.S
similarity index 100%
rename from arch/arm/crypto/sha1-armv4-large.S
rename to lib/crypto/arm/sha1-armv4-large.S
diff --git a/arch/arm/crypto/sha1-armv7-neon.S b/lib/crypto/arm/sha1-armv7-neon.S
similarity index 98%
rename from arch/arm/crypto/sha1-armv7-neon.S
rename to lib/crypto/arm/sha1-armv7-neon.S
index 28d816a6a5307..6edba3ab62e8b 100644
--- a/arch/arm/crypto/sha1-armv7-neon.S
+++ b/lib/crypto/arm/sha1-armv7-neon.S
@@ -280,22 +280,21 @@
 #define WPRECALC_32_79_9(i,W,W_m04,W_m08,W_m12,W_m16,W_m20,W_m24,W_m28) \
 	vst1.32 {tmp0}, [RWK];
 
 
 /*
- * Transform nblks*64 bytes (nblks*16 32-bit words) at DATA.
+ * Transform nblocks*64 bytes (nblocks*16 32-bit words) at DATA.
  *
- * unsigned int
- * sha1_transform_neon (void *ctx, const unsigned char *data,
- *                      unsigned int nblks)
+ * void sha1_transform_neon(struct sha1_block_state *state,
+ *			    const u8 *data, size_t nblocks);
  */
 .align 3
 ENTRY(sha1_transform_neon)
   /* input:
-   *	r0: ctx, CTX
-   *	r1: data (64*nblks bytes)
-   *	r2: nblks
+   *	r0: state
+   *	r1: data (64*nblocks bytes)
+   *	r2: nblocks
    */
 
   cmp RNBLKS, #0;
   beq .Ldo_nothing;
 
diff --git a/arch/arm/crypto/sha1-ce-core.S b/lib/crypto/arm/sha1-ce-core.S
similarity index 96%
rename from arch/arm/crypto/sha1-ce-core.S
rename to lib/crypto/arm/sha1-ce-core.S
index 8a702e051738a..2de40dd25e47e 100644
--- a/arch/arm/crypto/sha1-ce-core.S
+++ b/lib/crypto/arm/sha1-ce-core.S
@@ -57,12 +57,12 @@
 	.word		0x6ed9eba1, 0x6ed9eba1, 0x6ed9eba1, 0x6ed9eba1
 	.word		0x8f1bbcdc, 0x8f1bbcdc, 0x8f1bbcdc, 0x8f1bbcdc
 	.word		0xca62c1d6, 0xca62c1d6, 0xca62c1d6, 0xca62c1d6
 
 	/*
-	 * void sha1_ce_transform(struct sha1_state *sst, u8 const *src,
-	 *			  int blocks);
+	 * void sha1_ce_transform(struct sha1_block_state *state,
+	 *			  const u8 *data, size_t nblocks);
 	 */
 ENTRY(sha1_ce_transform)
 	/* load round constants */
 	adr		ip, .Lsha1_rcon
 	vld1.32		{k0-k1}, [ip, :128]!
diff --git a/lib/crypto/arm/sha1.h b/lib/crypto/arm/sha1.h
new file mode 100644
index 0000000000000..b177b71f5530a
--- /dev/null
+++ b/lib/crypto/arm/sha1.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * SHA-1 optimized for ARM
+ *
+ * Copyright 2025 Google LLC
+ */
+#include <asm/neon.h>
+#include <asm/simd.h>
+
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_ce);
+
+asmlinkage void sha1_block_data_order(struct sha1_block_state *state,
+				      const u8 *data, size_t nblocks);
+asmlinkage void sha1_transform_neon(struct sha1_block_state *state,
+				    const u8 *data, size_t nblocks);
+asmlinkage void sha1_ce_transform(struct sha1_block_state *state,
+				  const u8 *data, size_t nblocks);
+
+static void sha1_blocks(struct sha1_block_state *state,
+			  const u8 *data, size_t nblocks)
+{
+	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
+	    static_branch_likely(&have_neon) && may_use_simd()) {
+		kernel_neon_begin();
+		if (static_branch_likely(&have_ce))
+			sha1_ce_transform(state, data, nblocks);
+		else
+			sha1_transform_neon(state, data, nblocks);
+		kernel_neon_end();
+	} else {
+		sha1_block_data_order(state, data, nblocks);
+	}
+}
+
+#ifdef CONFIG_KERNEL_MODE_NEON
+#define sha1_mod_init_arch sha1_mod_init_arch
+static inline void sha1_mod_init_arch(void)
+{
+	if (elf_hwcap & HWCAP_NEON) {
+		static_branch_enable(&have_neon);
+		if (elf_hwcap2 & HWCAP2_SHA1)
+			static_branch_enable(&have_ce);
+	}
+}
+#endif /* CONFIG_KERNEL_MODE_NEON */
-- 
2.50.1


