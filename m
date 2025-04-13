Return-Path: <linux-mips+bounces-8575-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B84CDA870A9
	for <lists+linux-mips@lfdr.de>; Sun, 13 Apr 2025 06:55:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4C041896671
	for <lists+linux-mips@lfdr.de>; Sun, 13 Apr 2025 04:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 331A515E5AE;
	Sun, 13 Apr 2025 04:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nHBMw7xi"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B5A156678;
	Sun, 13 Apr 2025 04:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744520141; cv=none; b=otAvfyaMCp1fgMCCbShsaTzx1InONZUI0U51uk6tThqHfYpbMjJI3pjEV80ZXrzJYSAxEPFAqD6ZxJKZFxmITf9MOAHcGP1KOI/wB5OZb98AHfjpkMzp/iCe8szXOcaFxiwwY0GOKxiA/okYWfpMZxPZYsQUToTC5+ZDgICWVvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744520141; c=relaxed/simple;
	bh=QuZp4dCBsrytrfUD2yzI6B/K0FCoLtG9KaUBqXXB548=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=omTmCg+gKh70arm0uzVwIOyMA4FAFEnuRKlw5sVKJI23s4atZ1Spp6Z1dnzveMuUV1z7rEn+73yB3POam4CtO8xh+5WsuFstzWt6EkPoYoegTgNf3Qa2CVhgVioj/Z18eT2KnGJOV4S+ebdR2u8dAfZ639Wux8MK0uf7PYYbMqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nHBMw7xi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C105C4CEE5;
	Sun, 13 Apr 2025 04:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744520140;
	bh=QuZp4dCBsrytrfUD2yzI6B/K0FCoLtG9KaUBqXXB548=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nHBMw7xiYAkkBYxo0P8tTLJRYnt+0kuvM7E7DyGLRTjn2lov/iQhwse3ldMrMkVKQ
	 3GRxkC9ZmZYpMHimEjDkRWbVZNhFpibY13Moq+7yXaieGwKqWO4eKvnn0W8kW+Cdfs
	 8DoLb8WisCutQtZ4o1RQeD16c1oBEmH5Uf7FhOF+2w/8r9cmS7y4/RzaxPueAkfWX1
	 8h6+CzNo+L2MJBKR2gEGP+9/vC+GrAKI3zzPlzmrDroLx+Npq47KGtr82CzKnXYaxt
	 y7KhiQGn4uucGoKEuBdzrh3mij8snIs99FVKCztwU48BtGGTnK8fPjIvU6OZtdqGXb
	 6eZ2FGtEDr+xw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org
Subject: [PATCH 2/9] crypto: poly1305 - centralize the shash wrappers for arch code
Date: Sat, 12 Apr 2025 21:54:14 -0700
Message-ID: <20250413045421.55100-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413045421.55100-1-ebiggers@kernel.org>
References: <20250413045421.55100-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

Following the example of the crc32, crc32c, and chacha code, make the
crypto subsystem register both generic and architecture-optimized
poly1305 shash algorithms, both implemented on top of the appropriate
library functions.  This eliminates the need for every architecture to
implement the same shash glue code.

Note that the poly1305 shash requires that the key be prepended to the
data, which differs from the library functions where the key is simply a
parameter to poly1305_init().  Previously this was handled at a fairly
low level, polluting the library code with shash-specific code.
Reorganize things so that the shash code handles this quirk itself.

Also, to register the architecture-optimized shashes only when
architecture-optimized code is actually being used, add a function
poly1305_is_arch_optimized() and make each arch implement it.  Change
each architecture's Poly1305 module_init function to arch_initcall so
that the CPU feature detection is guaranteed to run before
poly1305_is_arch_optimized() gets called by crypto/poly1305.c.  (In
cases where poly1305_is_arch_optimized() just returns true
unconditionally, using arch_initcall is not strictly needed, but it's
still good to be consistent across architectures.)

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm/crypto/poly1305-glue.c         |  11 +-
 arch/arm64/crypto/poly1305-glue.c       |   9 +-
 arch/mips/crypto/poly1305-glue.c        |  10 +-
 arch/powerpc/crypto/poly1305-p10-glue.c |   6 +
 arch/x86/crypto/poly1305_glue.c         |   8 +-
 crypto/Makefile                         |   3 +-
 crypto/poly1305.c                       | 152 ++++++++++++++++++++++++
 crypto/poly1305_generic.c               | 149 -----------------------
 include/crypto/poly1305.h               |   9 ++
 9 files changed, 201 insertions(+), 156 deletions(-)
 create mode 100644 crypto/poly1305.c
 delete mode 100644 crypto/poly1305_generic.c

diff --git a/arch/arm/crypto/poly1305-glue.c b/arch/arm/crypto/poly1305-glue.c
index 4464ffbf8fd1..238dbf50d05d 100644
--- a/arch/arm/crypto/poly1305-glue.c
+++ b/arch/arm/crypto/poly1305-glue.c
@@ -216,11 +216,11 @@ static struct shash_alg arm_poly1305_algs[] = {{
 	.final			= arm_poly1305_final,
 	.digestsize		= POLY1305_DIGEST_SIZE,
 	.descsize		= sizeof(struct poly1305_desc_ctx),
 
 	.base.cra_name		= "poly1305",
-	.base.cra_driver_name	= "poly1305-arm",
+	.base.cra_driver_name	= "poly1305-arm-old",
 	.base.cra_priority	= 150,
 	.base.cra_blocksize	= POLY1305_BLOCK_SIZE,
 	.base.cra_module	= THIS_MODULE,
 #ifdef CONFIG_KERNEL_MODE_NEON
 }, {
@@ -236,10 +236,17 @@ static struct shash_alg arm_poly1305_algs[] = {{
 	.base.cra_blocksize	= POLY1305_BLOCK_SIZE,
 	.base.cra_module	= THIS_MODULE,
 #endif
 }};
 
+bool poly1305_is_arch_optimized(void)
+{
+	/* We always can use at least the ARM scalar implementation. */
+	return true;
+}
+EXPORT_SYMBOL(poly1305_is_arch_optimized);
+
 static int __init arm_poly1305_mod_init(void)
 {
 	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
 	    (elf_hwcap & HWCAP_NEON))
 		static_branch_enable(&have_neon);
@@ -262,11 +269,11 @@ static void __exit arm_poly1305_mod_exit(void)
 	}
 	crypto_unregister_shashes(arm_poly1305_algs,
 				  ARRAY_SIZE(arm_poly1305_algs));
 }
 
-module_init(arm_poly1305_mod_init);
+arch_initcall(arm_poly1305_mod_init);
 module_exit(arm_poly1305_mod_exit);
 
 MODULE_DESCRIPTION("Accelerated Poly1305 transform for ARM");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS_CRYPTO("poly1305");
diff --git a/arch/arm64/crypto/poly1305-glue.c b/arch/arm64/crypto/poly1305-glue.c
index 18883ea438f3..89415731d9be 100644
--- a/arch/arm64/crypto/poly1305-glue.c
+++ b/arch/arm64/crypto/poly1305-glue.c
@@ -204,10 +204,17 @@ static struct shash_alg neon_poly1305_alg = {
 	.base.cra_priority	= 200,
 	.base.cra_blocksize	= POLY1305_BLOCK_SIZE,
 	.base.cra_module	= THIS_MODULE,
 };
 
+bool poly1305_is_arch_optimized(void)
+{
+	/* We always can use at least the ARM64 scalar implementation. */
+	return true;
+}
+EXPORT_SYMBOL(poly1305_is_arch_optimized);
+
 static int __init neon_poly1305_mod_init(void)
 {
 	if (!cpu_have_named_feature(ASIMD))
 		return 0;
 
@@ -221,11 +228,11 @@ static void __exit neon_poly1305_mod_exit(void)
 {
 	if (IS_REACHABLE(CONFIG_CRYPTO_HASH) && cpu_have_named_feature(ASIMD))
 		crypto_unregister_shash(&neon_poly1305_alg);
 }
 
-module_init(neon_poly1305_mod_init);
+arch_initcall(neon_poly1305_mod_init);
 module_exit(neon_poly1305_mod_exit);
 
 MODULE_DESCRIPTION("Poly1305 transform using NEON instructions");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS_CRYPTO("poly1305");
diff --git a/arch/mips/crypto/poly1305-glue.c b/arch/mips/crypto/poly1305-glue.c
index c03ad0bbe69c..9eee71dc0b99 100644
--- a/arch/mips/crypto/poly1305-glue.c
+++ b/arch/mips/crypto/poly1305-glue.c
@@ -163,16 +163,22 @@ static struct shash_alg mips_poly1305_alg = {
 	.final			= mips_poly1305_final,
 	.digestsize		= POLY1305_DIGEST_SIZE,
 	.descsize		= sizeof(struct poly1305_desc_ctx),
 
 	.base.cra_name		= "poly1305",
-	.base.cra_driver_name	= "poly1305-mips",
+	.base.cra_driver_name	= "poly1305-mips-old",
 	.base.cra_priority	= 200,
 	.base.cra_blocksize	= POLY1305_BLOCK_SIZE,
 	.base.cra_module	= THIS_MODULE,
 };
 
+bool poly1305_is_arch_optimized(void)
+{
+	return true;
+}
+EXPORT_SYMBOL(poly1305_is_arch_optimized);
+
 static int __init mips_poly1305_mod_init(void)
 {
 	return IS_REACHABLE(CONFIG_CRYPTO_HASH) ?
 		crypto_register_shash(&mips_poly1305_alg) : 0;
 }
@@ -181,11 +187,11 @@ static void __exit mips_poly1305_mod_exit(void)
 {
 	if (IS_REACHABLE(CONFIG_CRYPTO_HASH))
 		crypto_unregister_shash(&mips_poly1305_alg);
 }
 
-module_init(mips_poly1305_mod_init);
+arch_initcall(mips_poly1305_mod_init);
 module_exit(mips_poly1305_mod_exit);
 
 MODULE_DESCRIPTION("Poly1305 transform (MIPS accelerated");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS_CRYPTO("poly1305");
diff --git a/arch/powerpc/crypto/poly1305-p10-glue.c b/arch/powerpc/crypto/poly1305-p10-glue.c
index 87bd5eba4497..40d296d52c23 100644
--- a/arch/powerpc/crypto/poly1305-p10-glue.c
+++ b/arch/powerpc/crypto/poly1305-p10-glue.c
@@ -111,10 +111,16 @@ void poly1305_final_arch(struct poly1305_desc_ctx *dctx, u8 *dst)
 
 	poly1305_emit_64(&dctx->h, &dctx->s, dst);
 }
 EXPORT_SYMBOL(poly1305_final_arch);
 
+bool poly1305_is_arch_optimized(void)
+{
+	return static_key_enabled(&have_p10);
+}
+EXPORT_SYMBOL(poly1305_is_arch_optimized);
+
 static int __init poly1305_p10_init(void)
 {
 	if (cpu_has_feature(CPU_FTR_ARCH_31))
 		static_branch_enable(&have_p10);
 	return 0;
diff --git a/arch/x86/crypto/poly1305_glue.c b/arch/x86/crypto/poly1305_glue.c
index 8b5593c46da7..40d03a9a4fb5 100644
--- a/arch/x86/crypto/poly1305_glue.c
+++ b/arch/x86/crypto/poly1305_glue.c
@@ -255,10 +255,16 @@ static struct shash_alg alg = {
 		.cra_blocksize		= POLY1305_BLOCK_SIZE,
 		.cra_module		= THIS_MODULE,
 	},
 };
 
+bool poly1305_is_arch_optimized(void)
+{
+	return static_key_enabled(&poly1305_use_avx);
+}
+EXPORT_SYMBOL(poly1305_is_arch_optimized);
+
 static int __init poly1305_simd_mod_init(void)
 {
 	if (boot_cpu_has(X86_FEATURE_AVX) &&
 	    cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM, NULL))
 		static_branch_enable(&poly1305_use_avx);
@@ -278,11 +284,11 @@ static void __exit poly1305_simd_mod_exit(void)
 {
 	if (IS_REACHABLE(CONFIG_CRYPTO_HASH))
 		crypto_unregister_shash(&alg);
 }
 
-module_init(poly1305_simd_mod_init);
+arch_initcall(poly1305_simd_mod_init);
 module_exit(poly1305_simd_mod_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Jason A. Donenfeld <Jason@zx2c4.com>");
 MODULE_DESCRIPTION("Poly1305 authenticator");
diff --git a/crypto/Makefile b/crypto/Makefile
index 98510a2aa0b1..53f5db5f1105 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -148,11 +148,12 @@ obj-$(CONFIG_CRYPTO_KHAZAD) += khazad.o
 obj-$(CONFIG_CRYPTO_ANUBIS) += anubis.o
 obj-$(CONFIG_CRYPTO_SEED) += seed.o
 obj-$(CONFIG_CRYPTO_ARIA) += aria_generic.o
 obj-$(CONFIG_CRYPTO_CHACHA20) += chacha.o
 CFLAGS_chacha.o += -DARCH=$(ARCH)
-obj-$(CONFIG_CRYPTO_POLY1305) += poly1305_generic.o
+obj-$(CONFIG_CRYPTO_POLY1305) += poly1305.o
+CFLAGS_poly1305.o += -DARCH=$(ARCH)
 obj-$(CONFIG_CRYPTO_DEFLATE) += deflate.o
 obj-$(CONFIG_CRYPTO_MICHAEL_MIC) += michael_mic.o
 obj-$(CONFIG_CRYPTO_CRC32C) += crc32c_generic.o
 obj-$(CONFIG_CRYPTO_CRC32) += crc32_generic.o
 CFLAGS_crc32c_generic.o += -DARCH=$(ARCH)
diff --git a/crypto/poly1305.c b/crypto/poly1305.c
new file mode 100644
index 000000000000..e0436bdc462b
--- /dev/null
+++ b/crypto/poly1305.c
@@ -0,0 +1,152 @@
+/*
+ * Crypto API wrapper for the Poly1305 library functions
+ *
+ * Copyright (C) 2015 Martin Willi
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+#include <crypto/algapi.h>
+#include <crypto/internal/hash.h>
+#include <crypto/internal/poly1305.h>
+#include <linux/crypto.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+
+struct crypto_poly1305_desc_ctx {
+	struct poly1305_desc_ctx base;
+	u8 key[POLY1305_KEY_SIZE];
+	unsigned int keysize;
+};
+
+static int crypto_poly1305_init(struct shash_desc *desc)
+{
+	struct crypto_poly1305_desc_ctx *dctx = shash_desc_ctx(desc);
+
+	dctx->keysize = 0;
+	return 0;
+}
+
+static int crypto_poly1305_update(struct shash_desc *desc,
+				  const u8 *src, unsigned int srclen, bool arch)
+{
+	struct crypto_poly1305_desc_ctx *dctx = shash_desc_ctx(desc);
+	unsigned int bytes;
+
+	/*
+	 * The key is passed as the first 32 "data" bytes.  The actual
+	 * poly1305_init() can be called only once the full key is available.
+	 */
+	if (dctx->keysize < POLY1305_KEY_SIZE) {
+		bytes = min(srclen, POLY1305_KEY_SIZE - dctx->keysize);
+		memcpy(&dctx->key[dctx->keysize], src, bytes);
+		dctx->keysize += bytes;
+		if (dctx->keysize < POLY1305_KEY_SIZE)
+			return 0;
+		if (arch)
+			poly1305_init(&dctx->base, dctx->key);
+		else
+			poly1305_init_generic(&dctx->base, dctx->key);
+		src += bytes;
+		srclen -= bytes;
+	}
+
+	if (arch)
+		poly1305_update(&dctx->base, src, srclen);
+	else
+		poly1305_update_generic(&dctx->base, src, srclen);
+
+	return 0;
+}
+
+static int crypto_poly1305_update_generic(struct shash_desc *desc,
+					  const u8 *src, unsigned int srclen)
+{
+	return crypto_poly1305_update(desc, src, srclen, false);
+}
+
+static int crypto_poly1305_update_arch(struct shash_desc *desc,
+				       const u8 *src, unsigned int srclen)
+{
+	return crypto_poly1305_update(desc, src, srclen, true);
+}
+
+static int crypto_poly1305_final(struct shash_desc *desc, u8 *dst, bool arch)
+{
+	struct crypto_poly1305_desc_ctx *dctx = shash_desc_ctx(desc);
+
+	if (unlikely(dctx->keysize != POLY1305_KEY_SIZE))
+		return -ENOKEY;
+
+	if (arch)
+		poly1305_final(&dctx->base, dst);
+	else
+		poly1305_final_generic(&dctx->base, dst);
+	memzero_explicit(&dctx->key, sizeof(dctx->key));
+	return 0;
+}
+
+static int crypto_poly1305_final_generic(struct shash_desc *desc, u8 *dst)
+{
+	return crypto_poly1305_final(desc, dst, false);
+}
+
+static int crypto_poly1305_final_arch(struct shash_desc *desc, u8 *dst)
+{
+	return crypto_poly1305_final(desc, dst, true);
+}
+
+static struct shash_alg poly1305_algs[] = {
+	{
+		.base.cra_name		= "poly1305",
+		.base.cra_driver_name	= "poly1305-generic",
+		.base.cra_priority	= 100,
+		.base.cra_blocksize	= POLY1305_BLOCK_SIZE,
+		.base.cra_module	= THIS_MODULE,
+		.digestsize		= POLY1305_DIGEST_SIZE,
+		.init			= crypto_poly1305_init,
+		.update			= crypto_poly1305_update_generic,
+		.final			= crypto_poly1305_final_generic,
+		.descsize		= sizeof(struct crypto_poly1305_desc_ctx),
+	},
+	{
+		.base.cra_name		= "poly1305",
+		.base.cra_driver_name	= "poly1305-" __stringify(ARCH),
+		.base.cra_priority	= 300,
+		.base.cra_blocksize	= POLY1305_BLOCK_SIZE,
+		.base.cra_module	= THIS_MODULE,
+		.digestsize		= POLY1305_DIGEST_SIZE,
+		.init			= crypto_poly1305_init,
+		.update			= crypto_poly1305_update_arch,
+		.final			= crypto_poly1305_final_arch,
+		.descsize		= sizeof(struct crypto_poly1305_desc_ctx),
+	},
+};
+
+static int num_algs;
+
+static int __init poly1305_mod_init(void)
+{
+	/* register the arch flavours only if they differ from generic */
+	num_algs = poly1305_is_arch_optimized() ? 2 : 1;
+
+	return crypto_register_shashes(poly1305_algs, num_algs);
+}
+
+static void __exit poly1305_mod_exit(void)
+{
+	crypto_unregister_shashes(poly1305_algs, num_algs);
+}
+
+subsys_initcall(poly1305_mod_init);
+module_exit(poly1305_mod_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Martin Willi <martin@strongswan.org>");
+MODULE_DESCRIPTION("Crypto API wrapper for the Poly1305 library functions");
+MODULE_ALIAS_CRYPTO("poly1305");
+MODULE_ALIAS_CRYPTO("poly1305-generic");
+MODULE_ALIAS_CRYPTO("poly1305-" __stringify(ARCH));
diff --git a/crypto/poly1305_generic.c b/crypto/poly1305_generic.c
deleted file mode 100644
index e6f29a98725a..000000000000
--- a/crypto/poly1305_generic.c
+++ /dev/null
@@ -1,149 +0,0 @@
-/*
- * Poly1305 authenticator algorithm, RFC7539
- *
- * Copyright (C) 2015 Martin Willi
- *
- * Based on public domain code by Andrew Moon and Daniel J. Bernstein.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- */
-
-#include <crypto/algapi.h>
-#include <crypto/internal/hash.h>
-#include <crypto/internal/poly1305.h>
-#include <linux/crypto.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/unaligned.h>
-
-static int crypto_poly1305_init(struct shash_desc *desc)
-{
-	struct poly1305_desc_ctx *dctx = shash_desc_ctx(desc);
-
-	poly1305_core_init(&dctx->h);
-	dctx->buflen = 0;
-	dctx->rset = 0;
-	dctx->sset = false;
-
-	return 0;
-}
-
-static unsigned int crypto_poly1305_setdesckey(struct poly1305_desc_ctx *dctx,
-					       const u8 *src, unsigned int srclen)
-{
-	if (!dctx->sset) {
-		if (!dctx->rset && srclen >= POLY1305_BLOCK_SIZE) {
-			poly1305_core_setkey(&dctx->core_r, src);
-			src += POLY1305_BLOCK_SIZE;
-			srclen -= POLY1305_BLOCK_SIZE;
-			dctx->rset = 2;
-		}
-		if (srclen >= POLY1305_BLOCK_SIZE) {
-			dctx->s[0] = get_unaligned_le32(src +  0);
-			dctx->s[1] = get_unaligned_le32(src +  4);
-			dctx->s[2] = get_unaligned_le32(src +  8);
-			dctx->s[3] = get_unaligned_le32(src + 12);
-			src += POLY1305_BLOCK_SIZE;
-			srclen -= POLY1305_BLOCK_SIZE;
-			dctx->sset = true;
-		}
-	}
-	return srclen;
-}
-
-static void poly1305_blocks(struct poly1305_desc_ctx *dctx, const u8 *src,
-			    unsigned int srclen)
-{
-	unsigned int datalen;
-
-	if (unlikely(!dctx->sset)) {
-		datalen = crypto_poly1305_setdesckey(dctx, src, srclen);
-		src += srclen - datalen;
-		srclen = datalen;
-	}
-
-	poly1305_core_blocks(&dctx->h, &dctx->core_r, src,
-			     srclen / POLY1305_BLOCK_SIZE, 1);
-}
-
-static int crypto_poly1305_update(struct shash_desc *desc,
-				  const u8 *src, unsigned int srclen)
-{
-	struct poly1305_desc_ctx *dctx = shash_desc_ctx(desc);
-	unsigned int bytes;
-
-	if (unlikely(dctx->buflen)) {
-		bytes = min(srclen, POLY1305_BLOCK_SIZE - dctx->buflen);
-		memcpy(dctx->buf + dctx->buflen, src, bytes);
-		src += bytes;
-		srclen -= bytes;
-		dctx->buflen += bytes;
-
-		if (dctx->buflen == POLY1305_BLOCK_SIZE) {
-			poly1305_blocks(dctx, dctx->buf,
-					POLY1305_BLOCK_SIZE);
-			dctx->buflen = 0;
-		}
-	}
-
-	if (likely(srclen >= POLY1305_BLOCK_SIZE)) {
-		poly1305_blocks(dctx, src, srclen);
-		src += srclen - (srclen % POLY1305_BLOCK_SIZE);
-		srclen %= POLY1305_BLOCK_SIZE;
-	}
-
-	if (unlikely(srclen)) {
-		dctx->buflen = srclen;
-		memcpy(dctx->buf, src, srclen);
-	}
-
-	return 0;
-}
-
-static int crypto_poly1305_final(struct shash_desc *desc, u8 *dst)
-{
-	struct poly1305_desc_ctx *dctx = shash_desc_ctx(desc);
-
-	if (unlikely(!dctx->sset))
-		return -ENOKEY;
-
-	poly1305_final_generic(dctx, dst);
-	return 0;
-}
-
-static struct shash_alg poly1305_alg = {
-	.digestsize	= POLY1305_DIGEST_SIZE,
-	.init		= crypto_poly1305_init,
-	.update		= crypto_poly1305_update,
-	.final		= crypto_poly1305_final,
-	.descsize	= sizeof(struct poly1305_desc_ctx),
-	.base		= {
-		.cra_name		= "poly1305",
-		.cra_driver_name	= "poly1305-generic",
-		.cra_priority		= 100,
-		.cra_blocksize		= POLY1305_BLOCK_SIZE,
-		.cra_module		= THIS_MODULE,
-	},
-};
-
-static int __init poly1305_mod_init(void)
-{
-	return crypto_register_shash(&poly1305_alg);
-}
-
-static void __exit poly1305_mod_exit(void)
-{
-	crypto_unregister_shash(&poly1305_alg);
-}
-
-subsys_initcall(poly1305_mod_init);
-module_exit(poly1305_mod_exit);
-
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Martin Willi <martin@strongswan.org>");
-MODULE_DESCRIPTION("Poly1305 authenticator");
-MODULE_ALIAS_CRYPTO("poly1305");
-MODULE_ALIAS_CRYPTO("poly1305-generic");
diff --git a/include/crypto/poly1305.h b/include/crypto/poly1305.h
index 090692ec3bc7..91444965772a 100644
--- a/include/crypto/poly1305.h
+++ b/include/crypto/poly1305.h
@@ -94,6 +94,15 @@ static inline void poly1305_final(struct poly1305_desc_ctx *desc, u8 *digest)
 		poly1305_final_arch(desc, digest);
 	else
 		poly1305_final_generic(desc, digest);
 }
 
+#if IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_POLY1305)
+bool poly1305_is_arch_optimized(void);
+#else
+static inline bool poly1305_is_arch_optimized(void)
+{
+	return false;
+}
+#endif
+
 #endif
-- 
2.49.0


