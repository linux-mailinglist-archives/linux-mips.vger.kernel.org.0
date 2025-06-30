Return-Path: <linux-mips+bounces-9564-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD0AAEE371
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 18:07:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E9867A3DBE
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 16:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F06DF29A9CB;
	Mon, 30 Jun 2025 16:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="niOe2zDW"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF44299957;
	Mon, 30 Jun 2025 16:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751299528; cv=none; b=g1rpU0qltdrYdYmpRjB00oM5PYbU9Q50e11MogwhPavkvDUwW8FhvDvshVnVcFMVf4j4CXKjVFxaY+WfazvmQ9yEHpxJ/KdvGri7TtmIeZAlNM/n6jfGc8rFtLEI/Jk154Ljeq42SSUN2vGTbT9NZD6tAE7/qXZNLyrO2ga/UgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751299528; c=relaxed/simple;
	bh=rSgoYaJG0c19UXiZMKnoCIyNff6j1yNcmTHQlGSjGTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ofS0aEOVtj5QjcX+KuSNGw8rul0DhsSbayFeGLCFYDLpmQa+XhcclPrI/VtOXe5Prv20TTG7oEYQTEKcynSomTQd2NRlZlkRKOglJn7nFnDEY5cQyMCWMsHfEzT2YOq3JZPrJDC8MLEJLi2OW6qEsbzpkiFdietwRNIlMDMD5ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=niOe2zDW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 188E4C4CEF1;
	Mon, 30 Jun 2025 16:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299528;
	bh=rSgoYaJG0c19UXiZMKnoCIyNff6j1yNcmTHQlGSjGTY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=niOe2zDWcL54rqVQiu22V58aWoS7OSERtpshwG++TmB8HqX4KhG1nJ7jkLZn4lsju
	 XlXOOJ8YCHfh4CTe96zmx94U6DlUdSwhyBK395udwjOkfChfrlK2F4S4H2VpS+U0Bn
	 GWq0f8Gaam1El0QT2bIl5xATd7W4jYdIiRIVLDpUNr0Joip1z9c3o5PEmZcFrBhJYp
	 wISFMMEKAj/u0u+pyfLwL4RiihxNbMrYLDNac53oK72YJp0E8fZp80BQtWRzoKYdR0
	 DocOx4ShwQLStJ33q1V0e3DTKNvtmSUNuPKflTVDPNRkiTjgkLW2BQ31lA0RB9clN7
	 12a43IPPnZqXQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v3 14/16] lib/crypto: x86/sha512: Migrate optimized SHA-512 code to library
Date: Mon, 30 Jun 2025 09:03:18 -0700
Message-ID: <20250630160320.2888-15-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630160320.2888-1-ebiggers@kernel.org>
References: <20250630160320.2888-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of exposing the x86-optimized SHA-512 code via x86-specific
crypto_shash algorithms, instead just implement the sha512_blocks()
library function.  This is much simpler, it makes the SHA-512 (and
SHA-384) library functions be x86-optimized, and it fixes the
longstanding issue where the x86-optimized SHA-512 code was disabled by
default.  SHA-512 still remains available through crypto_shash, but
individual architectures no longer need to handle it.

To match sha512_blocks(), change the type of the nblocks parameter of
the assembly functions from int to size_t.  The assembly functions
actually already treated it as size_t.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/x86/crypto/Kconfig                       |  13 -
 arch/x86/crypto/Makefile                      |   3 -
 arch/x86/crypto/sha512_ssse3_glue.c           | 322 ------------------
 lib/crypto/Kconfig                            |   1 +
 lib/crypto/Makefile                           |   3 +
 .../crypto/x86}/sha512-avx-asm.S              |   9 +-
 .../crypto/x86}/sha512-avx2-asm.S             |   9 +-
 .../crypto/x86}/sha512-ssse3-asm.S            |  10 +-
 lib/crypto/x86/sha512.h                       |  54 +++
 9 files changed, 72 insertions(+), 352 deletions(-)
 delete mode 100644 arch/x86/crypto/sha512_ssse3_glue.c
 rename {arch/x86/crypto => lib/crypto/x86}/sha512-avx-asm.S (98%)
 rename {arch/x86/crypto => lib/crypto/x86}/sha512-avx2-asm.S (99%)
 rename {arch/x86/crypto => lib/crypto/x86}/sha512-ssse3-asm.S (97%)
 create mode 100644 lib/crypto/x86/sha512.h

diff --git a/arch/x86/crypto/Kconfig b/arch/x86/crypto/Kconfig
index 56cfdc79e2c66..eb641a300154e 100644
--- a/arch/x86/crypto/Kconfig
+++ b/arch/x86/crypto/Kconfig
@@ -388,23 +388,10 @@ config CRYPTO_SHA1_SSSE3
 	  - SSSE3 (Supplemental SSE3)
 	  - AVX (Advanced Vector Extensions)
 	  - AVX2 (Advanced Vector Extensions 2)
 	  - SHA-NI (SHA Extensions New Instructions)
 
-config CRYPTO_SHA512_SSSE3
-	tristate "Hash functions: SHA-384 and SHA-512 (SSSE3/AVX/AVX2)"
-	depends on 64BIT
-	select CRYPTO_SHA512
-	select CRYPTO_HASH
-	help
-	  SHA-384 and SHA-512 secure hash algorithms (FIPS 180)
-
-	  Architecture: x86_64 using:
-	  - SSSE3 (Supplemental SSE3)
-	  - AVX (Advanced Vector Extensions)
-	  - AVX2 (Advanced Vector Extensions 2)
-
 config CRYPTO_SM3_AVX_X86_64
 	tristate "Hash functions: SM3 (AVX)"
 	depends on 64BIT
 	select CRYPTO_HASH
 	select CRYPTO_LIB_SM3
diff --git a/arch/x86/crypto/Makefile b/arch/x86/crypto/Makefile
index aa289a9e0153b..d31348be83704 100644
--- a/arch/x86/crypto/Makefile
+++ b/arch/x86/crypto/Makefile
@@ -52,13 +52,10 @@ aesni-intel-$(CONFIG_64BIT) += aes-gcm-avx10-x86_64.o
 endif
 
 obj-$(CONFIG_CRYPTO_SHA1_SSSE3) += sha1-ssse3.o
 sha1-ssse3-y := sha1_avx2_x86_64_asm.o sha1_ssse3_asm.o sha1_ni_asm.o sha1_ssse3_glue.o
 
-obj-$(CONFIG_CRYPTO_SHA512_SSSE3) += sha512-ssse3.o
-sha512-ssse3-y := sha512-ssse3-asm.o sha512-avx-asm.o sha512-avx2-asm.o sha512_ssse3_glue.o
-
 obj-$(CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL) += ghash-clmulni-intel.o
 ghash-clmulni-intel-y := ghash-clmulni-intel_asm.o ghash-clmulni-intel_glue.o
 
 obj-$(CONFIG_CRYPTO_POLYVAL_CLMUL_NI) += polyval-clmulni.o
 polyval-clmulni-y := polyval-clmulni_asm.o polyval-clmulni_glue.o
diff --git a/arch/x86/crypto/sha512_ssse3_glue.c b/arch/x86/crypto/sha512_ssse3_glue.c
deleted file mode 100644
index 97744b7d23817..0000000000000
--- a/arch/x86/crypto/sha512_ssse3_glue.c
+++ /dev/null
@@ -1,322 +0,0 @@
-/*
- * Cryptographic API.
- *
- * Glue code for the SHA512 Secure Hash Algorithm assembler
- * implementation using supplemental SSE3 / AVX / AVX2 instructions.
- *
- * This file is based on sha512_generic.c
- *
- * Copyright (C) 2013 Intel Corporation
- * Author: Tim Chen <tim.c.chen@linux.intel.com>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License as published by the Free
- * Software Foundation; either version 2 of the License, or (at your option)
- * any later version.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
- * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
- * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
- * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
- * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
- * SOFTWARE.
- *
- */
-
-#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
-
-#include <asm/cpu_device_id.h>
-#include <asm/simd.h>
-#include <crypto/internal/hash.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <crypto/sha2.h>
-#include <crypto/sha512_base.h>
-
-asmlinkage void sha512_transform_ssse3(struct sha512_state *state,
-				       const u8 *data, int blocks);
-
-static int sha512_update_x86(struct shash_desc *desc, const u8 *data,
-			     unsigned int len, sha512_block_fn *sha512_xform)
-{
-	int remain;
-
-	/*
-	 * Make sure struct sha512_state begins directly with the SHA512
-	 * 512-bit internal state, as this is what the asm functions expect.
-	 */
-	BUILD_BUG_ON(offsetof(struct sha512_state, state) != 0);
-
-	kernel_fpu_begin();
-	remain = sha512_base_do_update_blocks(desc, data, len, sha512_xform);
-	kernel_fpu_end();
-
-	return remain;
-}
-
-static int sha512_finup(struct shash_desc *desc, const u8 *data,
-	      unsigned int len, u8 *out, sha512_block_fn *sha512_xform)
-{
-	kernel_fpu_begin();
-	sha512_base_do_finup(desc, data, len, sha512_xform);
-	kernel_fpu_end();
-
-	return sha512_base_finish(desc, out);
-}
-
-static int sha512_ssse3_update(struct shash_desc *desc, const u8 *data,
-		       unsigned int len)
-{
-	return sha512_update_x86(desc, data, len, sha512_transform_ssse3);
-}
-
-static int sha512_ssse3_finup(struct shash_desc *desc, const u8 *data,
-	      unsigned int len, u8 *out)
-{
-	return sha512_finup(desc, data, len, out, sha512_transform_ssse3);
-}
-
-static struct shash_alg sha512_ssse3_algs[] = { {
-	.digestsize	=	SHA512_DIGEST_SIZE,
-	.init		=	sha512_base_init,
-	.update		=	sha512_ssse3_update,
-	.finup		=	sha512_ssse3_finup,
-	.descsize	=	SHA512_STATE_SIZE,
-	.base		=	{
-		.cra_name	=	"sha512",
-		.cra_driver_name =	"sha512-ssse3",
-		.cra_priority	=	150,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY |
-					CRYPTO_AHASH_ALG_FINUP_MAX,
-		.cra_blocksize	=	SHA512_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-},  {
-	.digestsize	=	SHA384_DIGEST_SIZE,
-	.init		=	sha384_base_init,
-	.update		=	sha512_ssse3_update,
-	.finup		=	sha512_ssse3_finup,
-	.descsize	=	SHA512_STATE_SIZE,
-	.base		=	{
-		.cra_name	=	"sha384",
-		.cra_driver_name =	"sha384-ssse3",
-		.cra_priority	=	150,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY |
-					CRYPTO_AHASH_ALG_FINUP_MAX,
-		.cra_blocksize	=	SHA384_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-} };
-
-static int register_sha512_ssse3(void)
-{
-	if (boot_cpu_has(X86_FEATURE_SSSE3))
-		return crypto_register_shashes(sha512_ssse3_algs,
-			ARRAY_SIZE(sha512_ssse3_algs));
-	return 0;
-}
-
-static void unregister_sha512_ssse3(void)
-{
-	if (boot_cpu_has(X86_FEATURE_SSSE3))
-		crypto_unregister_shashes(sha512_ssse3_algs,
-			ARRAY_SIZE(sha512_ssse3_algs));
-}
-
-asmlinkage void sha512_transform_avx(struct sha512_state *state,
-				     const u8 *data, int blocks);
-static bool avx_usable(void)
-{
-	if (!cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM, NULL)) {
-		if (boot_cpu_has(X86_FEATURE_AVX))
-			pr_info("AVX detected but unusable.\n");
-		return false;
-	}
-
-	return true;
-}
-
-static int sha512_avx_update(struct shash_desc *desc, const u8 *data,
-		       unsigned int len)
-{
-	return sha512_update_x86(desc, data, len, sha512_transform_avx);
-}
-
-static int sha512_avx_finup(struct shash_desc *desc, const u8 *data,
-	      unsigned int len, u8 *out)
-{
-	return sha512_finup(desc, data, len, out, sha512_transform_avx);
-}
-
-static struct shash_alg sha512_avx_algs[] = { {
-	.digestsize	=	SHA512_DIGEST_SIZE,
-	.init		=	sha512_base_init,
-	.update		=	sha512_avx_update,
-	.finup		=	sha512_avx_finup,
-	.descsize	=	SHA512_STATE_SIZE,
-	.base		=	{
-		.cra_name	=	"sha512",
-		.cra_driver_name =	"sha512-avx",
-		.cra_priority	=	160,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY |
-					CRYPTO_AHASH_ALG_FINUP_MAX,
-		.cra_blocksize	=	SHA512_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-},  {
-	.digestsize	=	SHA384_DIGEST_SIZE,
-	.init		=	sha384_base_init,
-	.update		=	sha512_avx_update,
-	.finup		=	sha512_avx_finup,
-	.descsize	=	SHA512_STATE_SIZE,
-	.base		=	{
-		.cra_name	=	"sha384",
-		.cra_driver_name =	"sha384-avx",
-		.cra_priority	=	160,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY |
-					CRYPTO_AHASH_ALG_FINUP_MAX,
-		.cra_blocksize	=	SHA384_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-} };
-
-static int register_sha512_avx(void)
-{
-	if (avx_usable())
-		return crypto_register_shashes(sha512_avx_algs,
-			ARRAY_SIZE(sha512_avx_algs));
-	return 0;
-}
-
-static void unregister_sha512_avx(void)
-{
-	if (avx_usable())
-		crypto_unregister_shashes(sha512_avx_algs,
-			ARRAY_SIZE(sha512_avx_algs));
-}
-
-asmlinkage void sha512_transform_rorx(struct sha512_state *state,
-				      const u8 *data, int blocks);
-
-static int sha512_avx2_update(struct shash_desc *desc, const u8 *data,
-		       unsigned int len)
-{
-	return sha512_update_x86(desc, data, len, sha512_transform_rorx);
-}
-
-static int sha512_avx2_finup(struct shash_desc *desc, const u8 *data,
-	      unsigned int len, u8 *out)
-{
-	return sha512_finup(desc, data, len, out, sha512_transform_rorx);
-}
-
-static struct shash_alg sha512_avx2_algs[] = { {
-	.digestsize	=	SHA512_DIGEST_SIZE,
-	.init		=	sha512_base_init,
-	.update		=	sha512_avx2_update,
-	.finup		=	sha512_avx2_finup,
-	.descsize	=	SHA512_STATE_SIZE,
-	.base		=	{
-		.cra_name	=	"sha512",
-		.cra_driver_name =	"sha512-avx2",
-		.cra_priority	=	170,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY |
-					CRYPTO_AHASH_ALG_FINUP_MAX,
-		.cra_blocksize	=	SHA512_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-},  {
-	.digestsize	=	SHA384_DIGEST_SIZE,
-	.init		=	sha384_base_init,
-	.update		=	sha512_avx2_update,
-	.finup		=	sha512_avx2_finup,
-	.descsize	=	SHA512_STATE_SIZE,
-	.base		=	{
-		.cra_name	=	"sha384",
-		.cra_driver_name =	"sha384-avx2",
-		.cra_priority	=	170,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY |
-					CRYPTO_AHASH_ALG_FINUP_MAX,
-		.cra_blocksize	=	SHA384_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-} };
-
-static bool avx2_usable(void)
-{
-	if (avx_usable() && boot_cpu_has(X86_FEATURE_AVX2) &&
-		    boot_cpu_has(X86_FEATURE_BMI2))
-		return true;
-
-	return false;
-}
-
-static int register_sha512_avx2(void)
-{
-	if (avx2_usable())
-		return crypto_register_shashes(sha512_avx2_algs,
-			ARRAY_SIZE(sha512_avx2_algs));
-	return 0;
-}
-static const struct x86_cpu_id module_cpu_ids[] = {
-	X86_MATCH_FEATURE(X86_FEATURE_AVX2, NULL),
-	X86_MATCH_FEATURE(X86_FEATURE_AVX, NULL),
-	X86_MATCH_FEATURE(X86_FEATURE_SSSE3, NULL),
-	{}
-};
-MODULE_DEVICE_TABLE(x86cpu, module_cpu_ids);
-
-static void unregister_sha512_avx2(void)
-{
-	if (avx2_usable())
-		crypto_unregister_shashes(sha512_avx2_algs,
-			ARRAY_SIZE(sha512_avx2_algs));
-}
-
-static int __init sha512_ssse3_mod_init(void)
-{
-	if (!x86_match_cpu(module_cpu_ids))
-		return -ENODEV;
-
-	if (register_sha512_ssse3())
-		goto fail;
-
-	if (register_sha512_avx()) {
-		unregister_sha512_ssse3();
-		goto fail;
-	}
-
-	if (register_sha512_avx2()) {
-		unregister_sha512_avx();
-		unregister_sha512_ssse3();
-		goto fail;
-	}
-
-	return 0;
-fail:
-	return -ENODEV;
-}
-
-static void __exit sha512_ssse3_mod_fini(void)
-{
-	unregister_sha512_avx2();
-	unregister_sha512_avx();
-	unregister_sha512_ssse3();
-}
-
-module_init(sha512_ssse3_mod_init);
-module_exit(sha512_ssse3_mod_fini);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("SHA512 Secure Hash Algorithm, Supplemental SSE3 accelerated");
-
-MODULE_ALIAS_CRYPTO("sha512");
-MODULE_ALIAS_CRYPTO("sha512-ssse3");
-MODULE_ALIAS_CRYPTO("sha512-avx");
-MODULE_ALIAS_CRYPTO("sha512-avx2");
-MODULE_ALIAS_CRYPTO("sha384");
-MODULE_ALIAS_CRYPTO("sha384-ssse3");
-MODULE_ALIAS_CRYPTO("sha384-avx");
-MODULE_ALIAS_CRYPTO("sha384-avx2");
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index c3edb78484f0a..dce127a69f131 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -181,10 +181,11 @@ config CRYPTO_LIB_SHA512_ARCH
 	default y if ARM64
 	default y if MIPS && CPU_CAVIUM_OCTEON
 	default y if RISCV && 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
 	default y if S390
 	default y if SPARC64
+	default y if X86_64
 
 config CRYPTO_LIB_SM3
 	tristate
 
 if !KMSAN # avoid false positives from assembly
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 0fb93f2469b3c..aaf445a85384c 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -93,10 +93,13 @@ clean-files += arm64/sha512-core.S
 libsha512-$(CONFIG_KERNEL_MODE_NEON) += arm64/sha512-ce-core.o
 endif
 
 libsha512-$(CONFIG_RISCV) += riscv/sha512-riscv64-zvknhb-zvkb.o
 libsha512-$(CONFIG_SPARC) += sparc/sha512_asm.o
+libsha512-$(CONFIG_X86) += x86/sha512-ssse3-asm.o \
+			   x86/sha512-avx-asm.o \
+			   x86/sha512-avx2-asm.o
 endif # CONFIG_CRYPTO_LIB_SHA512_ARCH
 
 obj-$(CONFIG_MPILIB) += mpi/
 
 obj-$(CONFIG_CRYPTO_SELFTESTS_FULL)		+= simd.o
diff --git a/arch/x86/crypto/sha512-avx-asm.S b/lib/crypto/x86/sha512-avx-asm.S
similarity index 98%
rename from arch/x86/crypto/sha512-avx-asm.S
rename to lib/crypto/x86/sha512-avx-asm.S
index 5bfce4b045fdf..0b5f69179d624 100644
--- a/arch/x86/crypto/sha512-avx-asm.S
+++ b/lib/crypto/x86/sha512-avx-asm.S
@@ -46,11 +46,10 @@
 # and search for that title.
 #
 ########################################################################
 
 #include <linux/linkage.h>
-#include <linux/cfi_types.h>
 
 .text
 
 # Virtual Registers
 # ARG1
@@ -265,18 +264,20 @@ frame_size = frame_WK + WK_SIZE
 	add	tmp0, h_64
 	RotateState
 .endm
 
 ########################################################################
-# void sha512_transform_avx(sha512_state *state, const u8 *data, int blocks)
+# void sha512_transform_avx(struct sha512_block_state *state,
+#			    const u8 *data, size_t nblocks);
 # Purpose: Updates the SHA512 digest stored at "state" with the message
 # stored in "data".
 # The size of the message pointed to by "data" must be an integer multiple
 # of SHA512 message blocks.
-# "blocks" is the message length in SHA512 blocks
+# "nblocks" is the message length in SHA512 blocks
 ########################################################################
-SYM_TYPED_FUNC_START(sha512_transform_avx)
+SYM_FUNC_START(sha512_transform_avx)
+
 	test msglen, msglen
 	je .Lnowork
 
 	# Save GPRs
 	push	%rbx
diff --git a/arch/x86/crypto/sha512-avx2-asm.S b/lib/crypto/x86/sha512-avx2-asm.S
similarity index 99%
rename from arch/x86/crypto/sha512-avx2-asm.S
rename to lib/crypto/x86/sha512-avx2-asm.S
index 24973f42c43ff..2309c01e316b9 100644
--- a/arch/x86/crypto/sha512-avx2-asm.S
+++ b/lib/crypto/x86/sha512-avx2-asm.S
@@ -48,11 +48,10 @@
 ########################################################################
 # This code schedules 1 blocks at a time, with 4 lanes per block
 ########################################################################
 
 #include <linux/linkage.h>
-#include <linux/cfi_types.h>
 
 .text
 
 # Virtual Registers
 Y_0 = %ymm4
@@ -557,18 +556,20 @@ frame_size = frame_CTX + CTX_SIZE
 	RotateState
 
 .endm
 
 ########################################################################
-# void sha512_transform_rorx(sha512_state *state, const u8 *data, int blocks)
+# void sha512_transform_rorx(struct sha512_block_state *state,
+#			     const u8 *data, size_t nblocks);
 # Purpose: Updates the SHA512 digest stored at "state" with the message
 # stored in "data".
 # The size of the message pointed to by "data" must be an integer multiple
 # of SHA512 message blocks.
-# "blocks" is the message length in SHA512 blocks
+# "nblocks" is the message length in SHA512 blocks
 ########################################################################
-SYM_TYPED_FUNC_START(sha512_transform_rorx)
+SYM_FUNC_START(sha512_transform_rorx)
+
 	# Save GPRs
 	push	%rbx
 	push	%r12
 	push	%r13
 	push	%r14
diff --git a/arch/x86/crypto/sha512-ssse3-asm.S b/lib/crypto/x86/sha512-ssse3-asm.S
similarity index 97%
rename from arch/x86/crypto/sha512-ssse3-asm.S
rename to lib/crypto/x86/sha512-ssse3-asm.S
index 30a2c4777f9d5..12e78142f2e38 100644
--- a/arch/x86/crypto/sha512-ssse3-asm.S
+++ b/lib/crypto/x86/sha512-ssse3-asm.S
@@ -46,11 +46,10 @@
 # and search for that title.
 #
 ########################################################################
 
 #include <linux/linkage.h>
-#include <linux/cfi_types.h>
 
 .text
 
 # Virtual Registers
 # ARG1
@@ -264,20 +263,19 @@ frame_size = frame_WK + WK_SIZE
 	lea	(T1, T2), h_64
 	RotateState
 .endm
 
 ########################################################################
-## void sha512_transform_ssse3(struct sha512_state *state, const u8 *data,
-##			       int blocks);
-# (struct sha512_state is assumed to begin with u64 state[8])
+# void sha512_transform_ssse3(struct sha512_block_state *state,
+#			      const u8 *data, size_t nblocks);
 # Purpose: Updates the SHA512 digest stored at "state" with the message
 # stored in "data".
 # The size of the message pointed to by "data" must be an integer multiple
 # of SHA512 message blocks.
-# "blocks" is the message length in SHA512 blocks.
+# "nblocks" is the message length in SHA512 blocks
 ########################################################################
-SYM_TYPED_FUNC_START(sha512_transform_ssse3)
+SYM_FUNC_START(sha512_transform_ssse3)
 
 	test msglen, msglen
 	je .Lnowork
 
 	# Save GPRs
diff --git a/lib/crypto/x86/sha512.h b/lib/crypto/x86/sha512.h
new file mode 100644
index 0000000000000..c13503d9d57d9
--- /dev/null
+++ b/lib/crypto/x86/sha512.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * x86-optimized SHA-512 block function
+ *
+ * Copyright 2025 Google LLC
+ */
+
+#include <asm/fpu/api.h>
+#include <crypto/internal/simd.h>
+#include <linux/static_call.h>
+
+DEFINE_STATIC_CALL(sha512_blocks_x86, sha512_blocks_generic);
+
+#define DEFINE_X86_SHA512_FN(c_fn, asm_fn)                                 \
+	asmlinkage void asm_fn(struct sha512_block_state *state,           \
+			       const u8 *data, size_t nblocks);            \
+	static void c_fn(struct sha512_block_state *state, const u8 *data, \
+			 size_t nblocks)                                   \
+	{                                                                  \
+		if (likely(crypto_simd_usable())) {                        \
+			kernel_fpu_begin();                                \
+			asm_fn(state, data, nblocks);                      \
+			kernel_fpu_end();                                  \
+		} else {                                                   \
+			sha512_blocks_generic(state, data, nblocks);       \
+		}                                                          \
+	}
+
+DEFINE_X86_SHA512_FN(sha512_blocks_ssse3, sha512_transform_ssse3);
+DEFINE_X86_SHA512_FN(sha512_blocks_avx, sha512_transform_avx);
+DEFINE_X86_SHA512_FN(sha512_blocks_avx2, sha512_transform_rorx);
+
+static void sha512_blocks(struct sha512_block_state *state,
+			  const u8 *data, size_t nblocks)
+{
+	static_call(sha512_blocks_x86)(state, data, nblocks);
+}
+
+#define sha512_mod_init_arch sha512_mod_init_arch
+static inline void sha512_mod_init_arch(void)
+{
+	if (cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM, NULL) &&
+	    boot_cpu_has(X86_FEATURE_AVX)) {
+		if (boot_cpu_has(X86_FEATURE_AVX2) &&
+		    boot_cpu_has(X86_FEATURE_BMI2))
+			static_call_update(sha512_blocks_x86,
+					   sha512_blocks_avx2);
+		else
+			static_call_update(sha512_blocks_x86,
+					   sha512_blocks_avx);
+	} else if (boot_cpu_has(X86_FEATURE_SSSE3)) {
+		static_call_update(sha512_blocks_x86, sha512_blocks_ssse3);
+	}
+}
-- 
2.50.0


