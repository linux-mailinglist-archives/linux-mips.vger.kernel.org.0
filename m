Return-Path: <linux-mips+bounces-9973-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C42C8B19534
	for <lists+linux-mips@lfdr.de>; Sun,  3 Aug 2025 22:45:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB47E17309E
	for <lists+linux-mips@lfdr.de>; Sun,  3 Aug 2025 20:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 347B81FDE39;
	Sun,  3 Aug 2025 20:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qaoBwU0x"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20961F7060;
	Sun,  3 Aug 2025 20:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754253931; cv=none; b=f/3YBKRP/wa/3R2m3aJ24RDNci7BOEAd3gArS6hIW6sSUpAV8RdBqH1Pk/xDnJ8acB6A6VUkXVCnZTyYDjUQWmsjFY9oFGma0BKId3sujcGMvKoOV3ydLOmKaboUc/tZTGUh/qNYshmAAuNT4YNG2mPOWQrUUUptXz8KdHO+3qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754253931; c=relaxed/simple;
	bh=kOLqgrnl4tWnh+WKFtl52eqWac73t7nW7tHwI5o4EzY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n8ohiHlTjWNvyZV8EFAtiXS+z4q4ixLpBfQX13ORLxnlTfKk4mgZfIvKxeEFaE7txxXYfbmSFnLWjC6HaD6QhXd7UY+XpAFYoUc9o+lvN3btmu5t6cQnZHIvYz6Vq/XDPjUkjf6vkizWVXXMqHQCpwK8rVfeMxjlQhsNYyo7P9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qaoBwU0x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10375C4CEFA;
	Sun,  3 Aug 2025 20:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754253930;
	bh=kOLqgrnl4tWnh+WKFtl52eqWac73t7nW7tHwI5o4EzY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qaoBwU0xAivrRD0noa/vc3+65roQolq1SSiKTZuuzE5WS3L3+Ut6OEU+DhWzS+8Gl
	 YygAKB/z0pKalQ3vN6r/NUodOi13X4SrHPwwykCB37rznwR/A8nC4r8RUq789GUqbG
	 WOgsIIRsMEhZ+MVlGIoq/kvoA+3HmDUsRXngkKJauomPLSvNTECe6+jtPeTFlFeOG1
	 Wgdw30lHqvbXluA75xC7AiqCuqYjSORORo7Wtp+Znf9iZnZHcbZDgYwp9v/5p+jqF7
	 mkbZrO4XRuvmSRpW6E7rRn9DrErOSYEHfItibttWqMWN+UZAV/2segIuzVcVrL0XI+
	 Sk2l3FMA/oGNg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 1/7] mips: cavium-octeon: Remove Octeon optimized MD5 code
Date: Sun,  3 Aug 2025 13:44:27 -0700
Message-ID: <20250803204433.75703-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803204433.75703-1-ebiggers@kernel.org>
References: <20250803204433.75703-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MD5 is insecure, is no longer commonly used, and has never been
optimized for the most common architectures in the kernel.  Only mips,
powerpc, and sparc have optimized MD5 code in the kernel.  Of these,
only the powerpc one is actually testable in QEMU.  The mips one works
only on Cavium Octeon SoCs.

Taken together, it's clear that it's time to retire these additional MD5
implementations, and focus maintenance on the MD5 generic C code.

This commit removes the Cavium Octeon optimized MD5 code.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/mips/cavium-octeon/crypto/Makefile     |   2 -
 arch/mips/cavium-octeon/crypto/octeon-md5.c | 214 --------------------
 arch/mips/configs/cavium_octeon_defconfig   |   1 -
 arch/mips/crypto/Kconfig                    |  10 -
 arch/mips/include/asm/octeon/crypto.h       |  21 +-
 5 files changed, 4 insertions(+), 244 deletions(-)
 delete mode 100644 arch/mips/cavium-octeon/crypto/octeon-md5.c

diff --git a/arch/mips/cavium-octeon/crypto/Makefile b/arch/mips/cavium-octeon/crypto/Makefile
index 83f2f5dd93ccc..b7d03e8a03187 100644
--- a/arch/mips/cavium-octeon/crypto/Makefile
+++ b/arch/mips/cavium-octeon/crypto/Makefile
@@ -2,7 +2,5 @@
 #
 # OCTEON-specific crypto modules.
 #
 
 obj-y += octeon-crypto.o
-
-obj-$(CONFIG_CRYPTO_MD5_OCTEON)		+= octeon-md5.o
diff --git a/arch/mips/cavium-octeon/crypto/octeon-md5.c b/arch/mips/cavium-octeon/crypto/octeon-md5.c
deleted file mode 100644
index a8ce831e2cebd..0000000000000
--- a/arch/mips/cavium-octeon/crypto/octeon-md5.c
+++ /dev/null
@@ -1,214 +0,0 @@
-/*
- * Cryptographic API.
- *
- * MD5 Message Digest Algorithm (RFC1321).
- *
- * Adapted for OCTEON by Aaro Koskinen <aaro.koskinen@iki.fi>.
- *
- * Based on crypto/md5.c, which is:
- *
- * Derived from cryptoapi implementation, originally based on the
- * public domain implementation written by Colin Plumb in 1993.
- *
- * Copyright (c) Cryptoapi developers.
- * Copyright (c) 2002 James Morris <jmorris@intercode.com.au>
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms of the GNU General Public License as published by the Free
- * Software Foundation; either version 2 of the License, or (at your option)
- * any later version.
- */
-
-#include <asm/octeon/crypto.h>
-#include <asm/octeon/octeon.h>
-#include <crypto/internal/hash.h>
-#include <crypto/md5.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/string.h>
-#include <linux/unaligned.h>
-
-struct octeon_md5_state {
-	__le32 hash[MD5_HASH_WORDS];
-	u64 byte_count;
-};
-
-/*
- * We pass everything as 64-bit. OCTEON can handle misaligned data.
- */
-
-static void octeon_md5_store_hash(struct octeon_md5_state *ctx)
-{
-	u64 *hash = (u64 *)ctx->hash;
-
-	write_octeon_64bit_hash_dword(hash[0], 0);
-	write_octeon_64bit_hash_dword(hash[1], 1);
-}
-
-static void octeon_md5_read_hash(struct octeon_md5_state *ctx)
-{
-	u64 *hash = (u64 *)ctx->hash;
-
-	hash[0] = read_octeon_64bit_hash_dword(0);
-	hash[1] = read_octeon_64bit_hash_dword(1);
-}
-
-static void octeon_md5_transform(const void *_block)
-{
-	const u64 *block = _block;
-
-	write_octeon_64bit_block_dword(block[0], 0);
-	write_octeon_64bit_block_dword(block[1], 1);
-	write_octeon_64bit_block_dword(block[2], 2);
-	write_octeon_64bit_block_dword(block[3], 3);
-	write_octeon_64bit_block_dword(block[4], 4);
-	write_octeon_64bit_block_dword(block[5], 5);
-	write_octeon_64bit_block_dword(block[6], 6);
-	octeon_md5_start(block[7]);
-}
-
-static int octeon_md5_init(struct shash_desc *desc)
-{
-	struct octeon_md5_state *mctx = shash_desc_ctx(desc);
-
-	mctx->hash[0] = cpu_to_le32(MD5_H0);
-	mctx->hash[1] = cpu_to_le32(MD5_H1);
-	mctx->hash[2] = cpu_to_le32(MD5_H2);
-	mctx->hash[3] = cpu_to_le32(MD5_H3);
-	mctx->byte_count = 0;
-
-	return 0;
-}
-
-static int octeon_md5_update(struct shash_desc *desc, const u8 *data,
-			     unsigned int len)
-{
-	struct octeon_md5_state *mctx = shash_desc_ctx(desc);
-	struct octeon_cop2_state state;
-	unsigned long flags;
-
-	mctx->byte_count += len;
-	flags = octeon_crypto_enable(&state);
-	octeon_md5_store_hash(mctx);
-
-	do {
-		octeon_md5_transform(data);
-		data += MD5_HMAC_BLOCK_SIZE;
-		len -= MD5_HMAC_BLOCK_SIZE;
-	} while (len >= MD5_HMAC_BLOCK_SIZE);
-
-	octeon_md5_read_hash(mctx);
-	octeon_crypto_disable(&state, flags);
-	mctx->byte_count -= len;
-	return len;
-}
-
-static int octeon_md5_finup(struct shash_desc *desc, const u8 *src,
-			    unsigned int offset, u8 *out)
-{
-	struct octeon_md5_state *mctx = shash_desc_ctx(desc);
-	int padding = 56 - (offset + 1);
-	struct octeon_cop2_state state;
-	u32 block[MD5_BLOCK_WORDS];
-	unsigned long flags;
-	char *p;
-
-	p = memcpy(block, src, offset);
-	p += offset;
-	*p++ = 0x80;
-
-	flags = octeon_crypto_enable(&state);
-	octeon_md5_store_hash(mctx);
-
-	if (padding < 0) {
-		memset(p, 0x00, padding + sizeof(u64));
-		octeon_md5_transform(block);
-		p = (char *)block;
-		padding = 56;
-	}
-
-	memset(p, 0, padding);
-	mctx->byte_count += offset;
-	block[14] = mctx->byte_count << 3;
-	block[15] = mctx->byte_count >> 29;
-	cpu_to_le32_array(block + 14, 2);
-	octeon_md5_transform(block);
-
-	octeon_md5_read_hash(mctx);
-	octeon_crypto_disable(&state, flags);
-
-	memzero_explicit(block, sizeof(block));
-	memcpy(out, mctx->hash, sizeof(mctx->hash));
-
-	return 0;
-}
-
-static int octeon_md5_export(struct shash_desc *desc, void *out)
-{
-	struct octeon_md5_state *ctx = shash_desc_ctx(desc);
-	union {
-		u8 *u8;
-		u32 *u32;
-		u64 *u64;
-	} p = { .u8 = out };
-	int i;
-
-	for (i = 0; i < MD5_HASH_WORDS; i++)
-		put_unaligned(le32_to_cpu(ctx->hash[i]), p.u32++);
-	put_unaligned(ctx->byte_count, p.u64);
-	return 0;
-}
-
-static int octeon_md5_import(struct shash_desc *desc, const void *in)
-{
-	struct octeon_md5_state *ctx = shash_desc_ctx(desc);
-	union {
-		const u8 *u8;
-		const u32 *u32;
-		const u64 *u64;
-	} p = { .u8 = in };
-	int i;
-
-	for (i = 0; i < MD5_HASH_WORDS; i++)
-		ctx->hash[i] = cpu_to_le32(get_unaligned(p.u32++));
-	ctx->byte_count = get_unaligned(p.u64);
-	return 0;
-}
-
-static struct shash_alg alg = {
-	.digestsize	=	MD5_DIGEST_SIZE,
-	.init		=	octeon_md5_init,
-	.update		=	octeon_md5_update,
-	.finup		=	octeon_md5_finup,
-	.export		=	octeon_md5_export,
-	.import		=	octeon_md5_import,
-	.statesize	=	MD5_STATE_SIZE,
-	.descsize	=	sizeof(struct octeon_md5_state),
-	.base		=	{
-		.cra_name	=	"md5",
-		.cra_driver_name=	"octeon-md5",
-		.cra_priority	=	OCTEON_CR_OPCODE_PRIORITY,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY,
-		.cra_blocksize	=	MD5_HMAC_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-};
-
-static int __init md5_mod_init(void)
-{
-	if (!octeon_has_crypto())
-		return -ENOTSUPP;
-	return crypto_register_shash(&alg);
-}
-
-static void __exit md5_mod_fini(void)
-{
-	crypto_unregister_shash(&alg);
-}
-
-module_init(md5_mod_init);
-module_exit(md5_mod_fini);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("MD5 Message Digest Algorithm (OCTEON)");
-MODULE_AUTHOR("Aaro Koskinen <aaro.koskinen@iki.fi>");
diff --git a/arch/mips/configs/cavium_octeon_defconfig b/arch/mips/configs/cavium_octeon_defconfig
index 3f50e1d78894a..68c363366bceb 100644
--- a/arch/mips/configs/cavium_octeon_defconfig
+++ b/arch/mips/configs/cavium_octeon_defconfig
@@ -153,11 +153,10 @@ CONFIG_NLS_ISO8859_1=y
 CONFIG_NLS_UTF8=y
 CONFIG_SECURITY=y
 CONFIG_SECURITY_NETWORK=y
 CONFIG_CRYPTO_CBC=y
 CONFIG_CRYPTO_HMAC=y
-CONFIG_CRYPTO_MD5_OCTEON=y
 CONFIG_CRYPTO_DES=y
 CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_DEBUG_FS=y
 CONFIG_MAGIC_SYSRQ=y
 # CONFIG_SCHED_DEBUG is not set
diff --git a/arch/mips/crypto/Kconfig b/arch/mips/crypto/Kconfig
index 7b91f4ec65bff..6a5bd5074867e 100644
--- a/arch/mips/crypto/Kconfig
+++ b/arch/mips/crypto/Kconfig
@@ -1,15 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
 menu "Accelerated Cryptographic Algorithms for CPU (mips)"
 
-config CRYPTO_MD5_OCTEON
-	tristate "Digests: MD5 (OCTEON)"
-	depends on CPU_CAVIUM_OCTEON
-	select CRYPTO_MD5
-	select CRYPTO_HASH
-	help
-	  MD5 message digest algorithm (RFC1321)
-
-	  Architecture: mips OCTEON using crypto instructions, when available
-
 endmenu
diff --git a/arch/mips/include/asm/octeon/crypto.h b/arch/mips/include/asm/octeon/crypto.h
index cb68f9e284bba..76601e9153d87 100644
--- a/arch/mips/include/asm/octeon/crypto.h
+++ b/arch/mips/include/asm/octeon/crypto.h
@@ -3,43 +3,41 @@
  * License. See the file "COPYING" in the main directory of this archive
  * for more details.
  *
  * Copyright (C) 2012-2013 Cavium Inc., All Rights Reserved.
  *
- * MD5/SHA1/SHA256/SHA512 instruction definitions added by
+ * SHA1, SHA256, and SHA512 instruction definitions added by
  * Aaro Koskinen <aaro.koskinen@iki.fi>.
  *
  */
 #ifndef __LINUX_OCTEON_CRYPTO_H
 #define __LINUX_OCTEON_CRYPTO_H
 
 #include <linux/sched.h>
 #include <asm/mipsregs.h>
 
-#define OCTEON_CR_OPCODE_PRIORITY 300
-
 extern unsigned long octeon_crypto_enable(struct octeon_cop2_state *state);
 extern void octeon_crypto_disable(struct octeon_cop2_state *state,
 				  unsigned long flags);
 
 /*
- * Macros needed to implement MD5/SHA1/SHA256:
+ * Macros needed to implement SHA1 and SHA256:
  */
 
 /*
- * The index can be 0-1 (MD5) or 0-2 (SHA1), 0-3 (SHA256).
+ * The index can be 0-2 (SHA1) or 0-3 (SHA256).
  */
 #define write_octeon_64bit_hash_dword(value, index)	\
 do {							\
 	__asm__ __volatile__ (				\
 	"dmtc2 %[rt],0x0048+" STR(index)		\
 	:						\
 	: [rt] "d" (cpu_to_be64(value)));		\
 } while (0)
 
 /*
- * The index can be 0-1 (MD5) or 0-2 (SHA1), 0-3 (SHA256).
+ * The index can be 0-2 (SHA1) or 0-3 (SHA256).
  */
 #define read_octeon_64bit_hash_dword(index)		\
 ({							\
 	__be64 __value;					\
 							\
@@ -60,21 +58,10 @@ do {							\
 	"dmtc2 %[rt],0x0040+" STR(index)		\
 	:						\
 	: [rt] "d" (cpu_to_be64(value)));		\
 } while (0)
 
-/*
- * The value is the final block dword (64-bit).
- */
-#define octeon_md5_start(value)				\
-do {							\
-	__asm__ __volatile__ (				\
-	"dmtc2 %[rt],0x4047"				\
-	:						\
-	: [rt] "d" (cpu_to_be64(value)));		\
-} while (0)
-
 /*
  * The value is the final block dword (64-bit).
  */
 #define octeon_sha1_start(value)			\
 do {							\
-- 
2.50.1


