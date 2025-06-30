Return-Path: <linux-mips+bounces-9560-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA80AEE36D
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 18:07:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 785F73AA92D
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 16:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F182951CD;
	Mon, 30 Jun 2025 16:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dYiYAok4"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9E9293C6E;
	Mon, 30 Jun 2025 16:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751299527; cv=none; b=hvsgP+3DBgBQOwWlUfRIWAAN1bzMAcCAKKh9u2npBfPHsUzkKOXVRkAXZpU2HRP9Lv6Lj7SPzkD6RBNX4N5ZMpfOxYDnRC0MgsNCNz9d5BwLgbv25GewASchT1l+efrT45QKMHvQfHb4AJFDzI3bpESUhTQIg7sKLuqOyEHK3X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751299527; c=relaxed/simple;
	bh=X4Q3jMJYTozhR3OhKfdtes+x8nVkSNX4ADLbk36WeBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LcVx6eE9Yv+ff8QaaKjleLhZs0vXya2eVR8WuqQ73ndJWhyBSbvQzR18WoPufXyHs/oOmawrKQQlq7V6cdjP/rEGWVdSRwwiox1C0BkbaxLdh3rSalfDB6vdev6lRrvJxLy+kwu6kLlISPqW517DV2GZ0g907loypWRdB39myeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dYiYAok4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35AEBC4CEF1;
	Mon, 30 Jun 2025 16:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299526;
	bh=X4Q3jMJYTozhR3OhKfdtes+x8nVkSNX4ADLbk36WeBU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dYiYAok4mmLaetpLGKE+oZw1I0/fkjYiA/j49nYQFuOzTzq/jJpWRoVb1o/FTyew1
	 6sL+6zQWgmh/b9Y+Wy+ykcZYpn3th0dDdV2VkvEUunYlP3HHstk17V67zpdtS5mtkX
	 7den1CZqICJDRSqBAuq+q0jFQzB/ig3niN+n4ijj/VeK+xqbeh4aKvHmdz0EWsAh47
	 AgYxV2PvrQqY6RAH8itrWXXy55TAwpvLW9lAIMUosyitb6y/MXXN/wzkxd3wjgrbUO
	 IX3P2YfU19lkDVrC6CJ9KbQJntwJhzvNojYvBKK2N7KI0hB0gBbFKyIWGicPSkj1Qu
	 HOWI8rNld1nPQ==
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
Subject: [PATCH v3 10/16] lib/crypto: mips/sha512: Migrate optimized SHA-512 code to library
Date: Mon, 30 Jun 2025 09:03:14 -0700
Message-ID: <20250630160320.2888-11-ebiggers@kernel.org>
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

Instead of exposing the mips-optimized SHA-512 code via mips-specific
crypto_shash algorithms, instead just implement the sha512_blocks()
library function.  This is much simpler, it makes the SHA-512 (and
SHA-384) library functions be mips-optimized, and it fixes the
longstanding issue where the mips-optimized SHA-512 code was disabled by
default.  SHA-512 still remains available through crypto_shash, but
individual architectures no longer need to handle it.

Note: to see the diff from
arch/mips/cavium-octeon/crypto/octeon-sha512.c to
lib/crypto/mips/sha512.h, view this commit with 'git show -M10'.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/mips/cavium-octeon/crypto/Makefile       |   1 -
 .../mips/cavium-octeon/crypto/octeon-sha512.c | 166 ------------------
 arch/mips/configs/cavium_octeon_defconfig     |   1 -
 arch/mips/crypto/Kconfig                      |  10 --
 lib/crypto/Kconfig                            |   1 +
 lib/crypto/mips/sha512.h                      |  74 ++++++++
 6 files changed, 75 insertions(+), 178 deletions(-)
 delete mode 100644 arch/mips/cavium-octeon/crypto/octeon-sha512.c
 create mode 100644 lib/crypto/mips/sha512.h

diff --git a/arch/mips/cavium-octeon/crypto/Makefile b/arch/mips/cavium-octeon/crypto/Makefile
index db26c73fa0eda..168b19ef7ce89 100644
--- a/arch/mips/cavium-octeon/crypto/Makefile
+++ b/arch/mips/cavium-octeon/crypto/Makefile
@@ -6,6 +6,5 @@
 obj-y += octeon-crypto.o
 
 obj-$(CONFIG_CRYPTO_MD5_OCTEON)		+= octeon-md5.o
 obj-$(CONFIG_CRYPTO_SHA1_OCTEON)	+= octeon-sha1.o
 obj-$(CONFIG_CRYPTO_SHA256_OCTEON)	+= octeon-sha256.o
-obj-$(CONFIG_CRYPTO_SHA512_OCTEON)	+= octeon-sha512.o
diff --git a/arch/mips/cavium-octeon/crypto/octeon-sha512.c b/arch/mips/cavium-octeon/crypto/octeon-sha512.c
deleted file mode 100644
index 53de74f642db0..0000000000000
--- a/arch/mips/cavium-octeon/crypto/octeon-sha512.c
+++ /dev/null
@@ -1,166 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Cryptographic API.
- *
- * SHA-512 and SHA-384 Secure Hash Algorithm.
- *
- * Adapted for OCTEON by Aaro Koskinen <aaro.koskinen@iki.fi>.
- *
- * Based on crypto/sha512_generic.c, which is:
- *
- * Copyright (c) Jean-Luc Cooke <jlcooke@certainkey.com>
- * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
- * Copyright (c) 2003 Kyle McMartin <kyle@debian.org>
- */
-
-#include <asm/octeon/crypto.h>
-#include <asm/octeon/octeon.h>
-#include <crypto/internal/hash.h>
-#include <crypto/sha2.h>
-#include <crypto/sha512_base.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-
-/*
- * We pass everything as 64-bit. OCTEON can handle misaligned data.
- */
-
-static void octeon_sha512_store_hash(struct sha512_state *sctx)
-{
-	write_octeon_64bit_hash_sha512(sctx->state[0], 0);
-	write_octeon_64bit_hash_sha512(sctx->state[1], 1);
-	write_octeon_64bit_hash_sha512(sctx->state[2], 2);
-	write_octeon_64bit_hash_sha512(sctx->state[3], 3);
-	write_octeon_64bit_hash_sha512(sctx->state[4], 4);
-	write_octeon_64bit_hash_sha512(sctx->state[5], 5);
-	write_octeon_64bit_hash_sha512(sctx->state[6], 6);
-	write_octeon_64bit_hash_sha512(sctx->state[7], 7);
-}
-
-static void octeon_sha512_read_hash(struct sha512_state *sctx)
-{
-	sctx->state[0] = read_octeon_64bit_hash_sha512(0);
-	sctx->state[1] = read_octeon_64bit_hash_sha512(1);
-	sctx->state[2] = read_octeon_64bit_hash_sha512(2);
-	sctx->state[3] = read_octeon_64bit_hash_sha512(3);
-	sctx->state[4] = read_octeon_64bit_hash_sha512(4);
-	sctx->state[5] = read_octeon_64bit_hash_sha512(5);
-	sctx->state[6] = read_octeon_64bit_hash_sha512(6);
-	sctx->state[7] = read_octeon_64bit_hash_sha512(7);
-}
-
-static void octeon_sha512_transform(struct sha512_state *sctx,
-				    const u8 *src, int blocks)
-{
-	do {
-		const u64 *block = (const u64 *)src;
-
-		write_octeon_64bit_block_sha512(block[0], 0);
-		write_octeon_64bit_block_sha512(block[1], 1);
-		write_octeon_64bit_block_sha512(block[2], 2);
-		write_octeon_64bit_block_sha512(block[3], 3);
-		write_octeon_64bit_block_sha512(block[4], 4);
-		write_octeon_64bit_block_sha512(block[5], 5);
-		write_octeon_64bit_block_sha512(block[6], 6);
-		write_octeon_64bit_block_sha512(block[7], 7);
-		write_octeon_64bit_block_sha512(block[8], 8);
-		write_octeon_64bit_block_sha512(block[9], 9);
-		write_octeon_64bit_block_sha512(block[10], 10);
-		write_octeon_64bit_block_sha512(block[11], 11);
-		write_octeon_64bit_block_sha512(block[12], 12);
-		write_octeon_64bit_block_sha512(block[13], 13);
-		write_octeon_64bit_block_sha512(block[14], 14);
-		octeon_sha512_start(block[15]);
-
-		src += SHA512_BLOCK_SIZE;
-	} while (--blocks);
-}
-
-static int octeon_sha512_update(struct shash_desc *desc, const u8 *data,
-				unsigned int len)
-{
-	struct sha512_state *sctx = shash_desc_ctx(desc);
-	struct octeon_cop2_state state;
-	unsigned long flags;
-	int remain;
-
-	flags = octeon_crypto_enable(&state);
-	octeon_sha512_store_hash(sctx);
-
-	remain = sha512_base_do_update_blocks(desc, data, len,
-					      octeon_sha512_transform);
-
-	octeon_sha512_read_hash(sctx);
-	octeon_crypto_disable(&state, flags);
-	return remain;
-}
-
-static int octeon_sha512_finup(struct shash_desc *desc, const u8 *src,
-			       unsigned int len, u8 *hash)
-{
-	struct sha512_state *sctx = shash_desc_ctx(desc);
-	struct octeon_cop2_state state;
-	unsigned long flags;
-
-	flags = octeon_crypto_enable(&state);
-	octeon_sha512_store_hash(sctx);
-
-	sha512_base_do_finup(desc, src, len, octeon_sha512_transform);
-
-	octeon_sha512_read_hash(sctx);
-	octeon_crypto_disable(&state, flags);
-	return sha512_base_finish(desc, hash);
-}
-
-static struct shash_alg octeon_sha512_algs[2] = { {
-	.digestsize	=	SHA512_DIGEST_SIZE,
-	.init		=	sha512_base_init,
-	.update		=	octeon_sha512_update,
-	.finup		=	octeon_sha512_finup,
-	.descsize	=	SHA512_STATE_SIZE,
-	.base		=	{
-		.cra_name	=	"sha512",
-		.cra_driver_name=	"octeon-sha512",
-		.cra_priority	=	OCTEON_CR_OPCODE_PRIORITY,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY |
-					CRYPTO_AHASH_ALG_FINUP_MAX,
-		.cra_blocksize	=	SHA512_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-}, {
-	.digestsize	=	SHA384_DIGEST_SIZE,
-	.init		=	sha384_base_init,
-	.update		=	octeon_sha512_update,
-	.finup		=	octeon_sha512_finup,
-	.descsize	=	SHA512_STATE_SIZE,
-	.base		=	{
-		.cra_name	=	"sha384",
-		.cra_driver_name=	"octeon-sha384",
-		.cra_priority	=	OCTEON_CR_OPCODE_PRIORITY,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY |
-					CRYPTO_AHASH_ALG_FINUP_MAX,
-		.cra_blocksize	=	SHA384_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-} };
-
-static int __init octeon_sha512_mod_init(void)
-{
-	if (!octeon_has_crypto())
-		return -ENOTSUPP;
-	return crypto_register_shashes(octeon_sha512_algs,
-				       ARRAY_SIZE(octeon_sha512_algs));
-}
-
-static void __exit octeon_sha512_mod_fini(void)
-{
-	crypto_unregister_shashes(octeon_sha512_algs,
-				  ARRAY_SIZE(octeon_sha512_algs));
-}
-
-module_init(octeon_sha512_mod_init);
-module_exit(octeon_sha512_mod_fini);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("SHA-512 and SHA-384 Secure Hash Algorithms (OCTEON)");
-MODULE_AUTHOR("Aaro Koskinen <aaro.koskinen@iki.fi>");
diff --git a/arch/mips/configs/cavium_octeon_defconfig b/arch/mips/configs/cavium_octeon_defconfig
index 88ae0aa85364b..effdfb2bb738b 100644
--- a/arch/mips/configs/cavium_octeon_defconfig
+++ b/arch/mips/configs/cavium_octeon_defconfig
@@ -155,11 +155,10 @@ CONFIG_SECURITY=y
 CONFIG_SECURITY_NETWORK=y
 CONFIG_CRYPTO_CBC=y
 CONFIG_CRYPTO_HMAC=y
 CONFIG_CRYPTO_MD5_OCTEON=y
 CONFIG_CRYPTO_SHA1_OCTEON=m
-CONFIG_CRYPTO_SHA512_OCTEON=m
 CONFIG_CRYPTO_DES=y
 CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_DEBUG_FS=y
 CONFIG_MAGIC_SYSRQ=y
 # CONFIG_SCHED_DEBUG is not set
diff --git a/arch/mips/crypto/Kconfig b/arch/mips/crypto/Kconfig
index 6bf073ae7613f..51a76a5ee3b16 100644
--- a/arch/mips/crypto/Kconfig
+++ b/arch/mips/crypto/Kconfig
@@ -20,16 +20,6 @@ config CRYPTO_SHA1_OCTEON
 	help
 	  SHA-1 secure hash algorithm (FIPS 180)
 
 	  Architecture: mips OCTEON
 
-config CRYPTO_SHA512_OCTEON
-	tristate "Hash functions: SHA-384 and SHA-512 (OCTEON)"
-	depends on CPU_CAVIUM_OCTEON
-	select CRYPTO_SHA512
-	select CRYPTO_HASH
-	help
-	  SHA-384 and SHA-512 secure hash algorithms (FIPS 180)
-
-	  Architecture: mips OCTEON using crypto instructions, when available
-
 endmenu
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 26413f679fab2..303ea15e3e900 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -177,10 +177,11 @@ config CRYPTO_LIB_SHA512
 config CRYPTO_LIB_SHA512_ARCH
 	bool
 	depends on CRYPTO_LIB_SHA512 && !UML
 	default y if ARM && !CPU_V7M
 	default y if ARM64
+	default y if MIPS && CPU_CAVIUM_OCTEON
 
 config CRYPTO_LIB_SM3
 	tristate
 
 if !KMSAN # avoid false positives from assembly
diff --git a/lib/crypto/mips/sha512.h b/lib/crypto/mips/sha512.h
new file mode 100644
index 0000000000000..b3ffbc1e8ca8e
--- /dev/null
+++ b/lib/crypto/mips/sha512.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Cryptographic API.
+ *
+ * SHA-512 and SHA-384 Secure Hash Algorithm.
+ *
+ * Adapted for OCTEON by Aaro Koskinen <aaro.koskinen@iki.fi>.
+ *
+ * Based on crypto/sha512_generic.c, which is:
+ *
+ * Copyright (c) Jean-Luc Cooke <jlcooke@certainkey.com>
+ * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
+ * Copyright (c) 2003 Kyle McMartin <kyle@debian.org>
+ */
+
+#include <asm/octeon/crypto.h>
+#include <asm/octeon/octeon.h>
+
+/*
+ * We pass everything as 64-bit. OCTEON can handle misaligned data.
+ */
+
+static void sha512_blocks(struct sha512_block_state *state,
+			  const u8 *data, size_t nblocks)
+{
+	struct octeon_cop2_state cop2_state;
+	unsigned long flags;
+
+	if (!octeon_has_crypto())
+		return sha512_blocks_generic(state, data, nblocks);
+
+	flags = octeon_crypto_enable(&cop2_state);
+	write_octeon_64bit_hash_sha512(state->h[0], 0);
+	write_octeon_64bit_hash_sha512(state->h[1], 1);
+	write_octeon_64bit_hash_sha512(state->h[2], 2);
+	write_octeon_64bit_hash_sha512(state->h[3], 3);
+	write_octeon_64bit_hash_sha512(state->h[4], 4);
+	write_octeon_64bit_hash_sha512(state->h[5], 5);
+	write_octeon_64bit_hash_sha512(state->h[6], 6);
+	write_octeon_64bit_hash_sha512(state->h[7], 7);
+
+	do {
+		const u64 *block = (const u64 *)data;
+
+		write_octeon_64bit_block_sha512(block[0], 0);
+		write_octeon_64bit_block_sha512(block[1], 1);
+		write_octeon_64bit_block_sha512(block[2], 2);
+		write_octeon_64bit_block_sha512(block[3], 3);
+		write_octeon_64bit_block_sha512(block[4], 4);
+		write_octeon_64bit_block_sha512(block[5], 5);
+		write_octeon_64bit_block_sha512(block[6], 6);
+		write_octeon_64bit_block_sha512(block[7], 7);
+		write_octeon_64bit_block_sha512(block[8], 8);
+		write_octeon_64bit_block_sha512(block[9], 9);
+		write_octeon_64bit_block_sha512(block[10], 10);
+		write_octeon_64bit_block_sha512(block[11], 11);
+		write_octeon_64bit_block_sha512(block[12], 12);
+		write_octeon_64bit_block_sha512(block[13], 13);
+		write_octeon_64bit_block_sha512(block[14], 14);
+		octeon_sha512_start(block[15]);
+
+		data += SHA512_BLOCK_SIZE;
+	} while (--nblocks);
+
+	state->h[0] = read_octeon_64bit_hash_sha512(0);
+	state->h[1] = read_octeon_64bit_hash_sha512(1);
+	state->h[2] = read_octeon_64bit_hash_sha512(2);
+	state->h[3] = read_octeon_64bit_hash_sha512(3);
+	state->h[4] = read_octeon_64bit_hash_sha512(4);
+	state->h[5] = read_octeon_64bit_hash_sha512(5);
+	state->h[6] = read_octeon_64bit_hash_sha512(6);
+	state->h[7] = read_octeon_64bit_hash_sha512(7);
+	octeon_crypto_disable(&cop2_state, flags);
+}
-- 
2.50.0


