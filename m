Return-Path: <linux-mips+bounces-9239-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DB764AD48A3
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 04:14:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DFF467AC350
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 02:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B19471C8605;
	Wed, 11 Jun 2025 02:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PpsXWzO/"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791F21C5499;
	Wed, 11 Jun 2025 02:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749607978; cv=none; b=srOYHyhriaiQBY6/yc/bnX3zXhzf8EYaajpVkQQHZTEubfJCqkxQCPNKj0wfS/tg6sUpYhWL6K4qHXoWlk0QxmBNpeHRpPnhJPFHUA5tSL/SZ0Wyf9zkYcmws8xUghGIZD1zJNJ/J3hXJjQ7eh0dVw6yqDkpbTgC44sQkACieNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749607978; c=relaxed/simple;
	bh=shFLT4F4dyJ2yMKreeGnA/S4wZhozDYaduQLUGMT9TI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fjHuukMHReff9BgTrIcilnFFg6fuzMH7yGumtDTJFdIiJZxPT8TI5iovBGbDPkCkERcTQysj4SOcuyHqz3mafBcs0icgvO2XyTxGmzUCRwaT6fVAlk6QzvrIoUWuky9OzayldNZMotj3xxuZrVd9ih8lngEvAWq5qehr/Vi5ETc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PpsXWzO/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E194C4CEED;
	Wed, 11 Jun 2025 02:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749607978;
	bh=shFLT4F4dyJ2yMKreeGnA/S4wZhozDYaduQLUGMT9TI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PpsXWzO/inqgOHbDDB5Y0H5+8S8PlapRkhxC3UmmrxorrwGJfWwXLKI9SUnudaCLe
	 bcVFxBOt9A/1x/f4Rpdl71kytSIuINKey1rZTe3Ynbvj9Se325673wLcDiyXWKo3oa
	 swQ8srIfjsFMTbvIx30EQqlkw9FU62D4j8qNdCiu4y1eEzLUakJmTu8TSaMs5C7auG
	 DHq0f+zObcsj06SBZ+A0kZuZYptpC0nfEQaufstcMdhmEe1XEhLuWFvMV0ntFZ8dtF
	 LL57XHJ/4ekcvH7I34gzUUdQciffuPWc/uNJHr5ch8HWY1v2TtgZwv/A3kStXAGpOS
	 LhGR6jWAXZCBg==
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
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 13/16] lib/crypto/sha512: migrate s390-optimized SHA-512 code to library
Date: Tue, 10 Jun 2025 19:09:20 -0700
Message-ID: <20250611020923.1482701-14-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611020923.1482701-1-ebiggers@kernel.org>
References: <20250611020923.1482701-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

Instead of exposing the s390-optimized SHA-512 code via s390-specific
crypto_shash algorithms, instead just implement the sha512_blocks()
library function.  This is much simpler, it makes the SHA-512 (and
SHA-384) library functions be s390-optimized, and it fixes the
longstanding issue where the s390-optimized SHA-512 code was disabled by
default.  SHA-512 still remains available through crypto_shash, but
individual architectures no longer need to handle it.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/s390/configs/debug_defconfig |   1 -
 arch/s390/configs/defconfig       |   1 -
 arch/s390/crypto/Kconfig          |  10 --
 arch/s390/crypto/Makefile         |   1 -
 arch/s390/crypto/sha512_s390.c    | 151 ------------------------------
 lib/crypto/Kconfig                |   1 +
 lib/crypto/s390/sha512.h          |  28 ++++++
 7 files changed, 29 insertions(+), 164 deletions(-)
 delete mode 100644 arch/s390/crypto/sha512_s390.c
 create mode 100644 lib/crypto/s390/sha512.h

diff --git a/arch/s390/configs/debug_defconfig b/arch/s390/configs/debug_defconfig
index 8ecad727497e1..ef313c30b375c 100644
--- a/arch/s390/configs/debug_defconfig
+++ b/arch/s390/configs/debug_defconfig
@@ -802,11 +802,10 @@ CONFIG_CRYPTO_ZSTD=m
 CONFIG_CRYPTO_ANSI_CPRNG=m
 CONFIG_CRYPTO_USER_API_HASH=m
 CONFIG_CRYPTO_USER_API_SKCIPHER=m
 CONFIG_CRYPTO_USER_API_RNG=m
 CONFIG_CRYPTO_USER_API_AEAD=m
-CONFIG_CRYPTO_SHA512_S390=m
 CONFIG_CRYPTO_SHA1_S390=m
 CONFIG_CRYPTO_SHA3_256_S390=m
 CONFIG_CRYPTO_SHA3_512_S390=m
 CONFIG_CRYPTO_GHASH_S390=m
 CONFIG_CRYPTO_AES_S390=m
diff --git a/arch/s390/configs/defconfig b/arch/s390/configs/defconfig
index c13a77765162a..b6fa341bb03b6 100644
--- a/arch/s390/configs/defconfig
+++ b/arch/s390/configs/defconfig
@@ -789,11 +789,10 @@ CONFIG_CRYPTO_ANSI_CPRNG=m
 CONFIG_CRYPTO_JITTERENTROPY_OSR=1
 CONFIG_CRYPTO_USER_API_HASH=m
 CONFIG_CRYPTO_USER_API_SKCIPHER=m
 CONFIG_CRYPTO_USER_API_RNG=m
 CONFIG_CRYPTO_USER_API_AEAD=m
-CONFIG_CRYPTO_SHA512_S390=m
 CONFIG_CRYPTO_SHA1_S390=m
 CONFIG_CRYPTO_SHA3_256_S390=m
 CONFIG_CRYPTO_SHA3_512_S390=m
 CONFIG_CRYPTO_GHASH_S390=m
 CONFIG_CRYPTO_AES_S390=m
diff --git a/arch/s390/crypto/Kconfig b/arch/s390/crypto/Kconfig
index e2c27588b21a9..4557514fbac35 100644
--- a/arch/s390/crypto/Kconfig
+++ b/arch/s390/crypto/Kconfig
@@ -1,19 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 
 menu "Accelerated Cryptographic Algorithms for CPU (s390)"
 
-config CRYPTO_SHA512_S390
-	tristate "Hash functions: SHA-384 and SHA-512"
-	select CRYPTO_HASH
-	help
-	  SHA-384 and SHA-512 secure hash algorithms (FIPS 180)
-
-	  Architecture: s390
-
-	  It is available as of z10.
-
 config CRYPTO_SHA1_S390
 	tristate "Hash functions: SHA-1"
 	select CRYPTO_HASH
 	help
 	  SHA-1 secure hash algorithm (FIPS 180)
diff --git a/arch/s390/crypto/Makefile b/arch/s390/crypto/Makefile
index 21757d86cd499..473d64c0982af 100644
--- a/arch/s390/crypto/Makefile
+++ b/arch/s390/crypto/Makefile
@@ -2,11 +2,10 @@
 #
 # Cryptographic API
 #
 
 obj-$(CONFIG_CRYPTO_SHA1_S390) += sha1_s390.o sha_common.o
-obj-$(CONFIG_CRYPTO_SHA512_S390) += sha512_s390.o sha_common.o
 obj-$(CONFIG_CRYPTO_SHA3_256_S390) += sha3_256_s390.o sha_common.o
 obj-$(CONFIG_CRYPTO_SHA3_512_S390) += sha3_512_s390.o sha_common.o
 obj-$(CONFIG_CRYPTO_DES_S390) += des_s390.o
 obj-$(CONFIG_CRYPTO_AES_S390) += aes_s390.o
 obj-$(CONFIG_CRYPTO_PAES_S390) += paes_s390.o
diff --git a/arch/s390/crypto/sha512_s390.c b/arch/s390/crypto/sha512_s390.c
deleted file mode 100644
index e8bb172dbed75..0000000000000
--- a/arch/s390/crypto/sha512_s390.c
+++ /dev/null
@@ -1,151 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0+
-/*
- * Cryptographic API.
- *
- * s390 implementation of the SHA512 and SHA38 Secure Hash Algorithm.
- *
- * Copyright IBM Corp. 2007
- * Author(s): Jan Glauber (jang@de.ibm.com)
- */
-#include <asm/cpacf.h>
-#include <crypto/internal/hash.h>
-#include <crypto/sha2.h>
-#include <linux/cpufeature.h>
-#include <linux/errno.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-
-#include "sha.h"
-
-static int sha512_init_s390(struct shash_desc *desc)
-{
-	struct s390_sha_ctx *ctx = shash_desc_ctx(desc);
-
-	ctx->sha512.state[0] = SHA512_H0;
-	ctx->sha512.state[1] = SHA512_H1;
-	ctx->sha512.state[2] = SHA512_H2;
-	ctx->sha512.state[3] = SHA512_H3;
-	ctx->sha512.state[4] = SHA512_H4;
-	ctx->sha512.state[5] = SHA512_H5;
-	ctx->sha512.state[6] = SHA512_H6;
-	ctx->sha512.state[7] = SHA512_H7;
-	ctx->count = 0;
-	ctx->sha512.count_hi = 0;
-	ctx->func = CPACF_KIMD_SHA_512;
-
-	return 0;
-}
-
-static int sha512_export(struct shash_desc *desc, void *out)
-{
-	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
-	struct sha512_state *octx = out;
-
-	octx->count[0] = sctx->count;
-	octx->count[1] = sctx->sha512.count_hi;
-	memcpy(octx->state, sctx->state, sizeof(octx->state));
-	return 0;
-}
-
-static int sha512_import(struct shash_desc *desc, const void *in)
-{
-	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
-	const struct sha512_state *ictx = in;
-
-	sctx->count = ictx->count[0];
-	sctx->sha512.count_hi = ictx->count[1];
-
-	memcpy(sctx->state, ictx->state, sizeof(ictx->state));
-	sctx->func = CPACF_KIMD_SHA_512;
-	return 0;
-}
-
-static struct shash_alg sha512_alg = {
-	.digestsize	=	SHA512_DIGEST_SIZE,
-	.init		=	sha512_init_s390,
-	.update		=	s390_sha_update_blocks,
-	.finup		=	s390_sha_finup,
-	.export		=	sha512_export,
-	.import		=	sha512_import,
-	.descsize	=	sizeof(struct s390_sha_ctx),
-	.statesize	=	SHA512_STATE_SIZE,
-	.base		=	{
-		.cra_name	=	"sha512",
-		.cra_driver_name=	"sha512-s390",
-		.cra_priority	=	300,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY |
-					CRYPTO_AHASH_ALG_FINUP_MAX,
-		.cra_blocksize	=	SHA512_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-};
-
-MODULE_ALIAS_CRYPTO("sha512");
-
-static int sha384_init_s390(struct shash_desc *desc)
-{
-	struct s390_sha_ctx *ctx = shash_desc_ctx(desc);
-
-	ctx->sha512.state[0] = SHA384_H0;
-	ctx->sha512.state[1] = SHA384_H1;
-	ctx->sha512.state[2] = SHA384_H2;
-	ctx->sha512.state[3] = SHA384_H3;
-	ctx->sha512.state[4] = SHA384_H4;
-	ctx->sha512.state[5] = SHA384_H5;
-	ctx->sha512.state[6] = SHA384_H6;
-	ctx->sha512.state[7] = SHA384_H7;
-	ctx->count = 0;
-	ctx->sha512.count_hi = 0;
-	ctx->func = CPACF_KIMD_SHA_512;
-
-	return 0;
-}
-
-static struct shash_alg sha384_alg = {
-	.digestsize	=	SHA384_DIGEST_SIZE,
-	.init		=	sha384_init_s390,
-	.update		=	s390_sha_update_blocks,
-	.finup		=	s390_sha_finup,
-	.export		=	sha512_export,
-	.import		=	sha512_import,
-	.descsize	=	sizeof(struct s390_sha_ctx),
-	.statesize	=	SHA512_STATE_SIZE,
-	.base		=	{
-		.cra_name	=	"sha384",
-		.cra_driver_name=	"sha384-s390",
-		.cra_priority	=	300,
-		.cra_blocksize	=	SHA384_BLOCK_SIZE,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY |
-					CRYPTO_AHASH_ALG_FINUP_MAX,
-		.cra_ctxsize	=	sizeof(struct s390_sha_ctx),
-		.cra_module	=	THIS_MODULE,
-	}
-};
-
-MODULE_ALIAS_CRYPTO("sha384");
-
-static int __init init(void)
-{
-	int ret;
-
-	if (!cpacf_query_func(CPACF_KIMD, CPACF_KIMD_SHA_512))
-		return -ENODEV;
-	if ((ret = crypto_register_shash(&sha512_alg)) < 0)
-		goto out;
-	if ((ret = crypto_register_shash(&sha384_alg)) < 0)
-		crypto_unregister_shash(&sha512_alg);
-out:
-	return ret;
-}
-
-static void __exit fini(void)
-{
-	crypto_unregister_shash(&sha512_alg);
-	crypto_unregister_shash(&sha384_alg);
-}
-
-module_cpu_feature_match(S390_CPU_FEATURE_MSA, init);
-module_exit(fini);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("SHA512 and SHA-384 Secure Hash Algorithm");
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 482d934cc5ecc..4bdb4118a789f 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -181,10 +181,11 @@ config CRYPTO_LIB_SHA512_ARCH
 	depends on CRYPTO_LIB_SHA512
 	default y if ARM && !CPU_V7M
 	default y if ARM64
 	default y if MIPS && CPU_CAVIUM_OCTEON
 	default y if RISCV && 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
+	default y if S390
 
 config CRYPTO_LIB_SM3
 	tristate
 
 if !KMSAN # avoid false positives from assembly
diff --git a/lib/crypto/s390/sha512.h b/lib/crypto/s390/sha512.h
new file mode 100644
index 0000000000000..24744651550cb
--- /dev/null
+++ b/lib/crypto/s390/sha512.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * SHA-512 optimized using the CP Assist for Cryptographic Functions (CPACF)
+ *
+ * Copyright 2025 Google LLC
+ */
+#include <asm/cpacf.h>
+#include <linux/cpufeature.h>
+
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_cpacf_sha512);
+
+static void sha512_blocks(struct sha512_block_state *state,
+			  const u8 *data, size_t nblocks)
+{
+	if (static_branch_likely(&have_cpacf_sha512))
+		cpacf_kimd(CPACF_KIMD_SHA_512, state, data,
+			   nblocks * SHA512_BLOCK_SIZE);
+	else
+		sha512_blocks_generic(state, data, nblocks);
+}
+
+#define sha512_mod_init_arch sha512_mod_init_arch
+static inline void sha512_mod_init_arch(void)
+{
+	if (cpu_have_feature(S390_CPU_FEATURE_MSA) &&
+	    cpacf_query_func(CPACF_KIMD, CPACF_KIMD_SHA_512))
+		static_branch_enable(&have_cpacf_sha512);
+}
-- 
2.49.0


