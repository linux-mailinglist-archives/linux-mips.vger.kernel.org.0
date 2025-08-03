Return-Path: <linux-mips+bounces-9976-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 464B9B19545
	for <lists+linux-mips@lfdr.de>; Sun,  3 Aug 2025 22:46:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 784361730B7
	for <lists+linux-mips@lfdr.de>; Sun,  3 Aug 2025 20:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE91215F6B;
	Sun,  3 Aug 2025 20:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OwaDkcFh"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C55D214A64;
	Sun,  3 Aug 2025 20:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754253933; cv=none; b=iep8s2dqcEiXSeZqOCkNvyML5RQXfOF0h+z64SaNZfBBOwIXgrAnb0m2ik91DygwNpKdl7cB346A4uWwlW3YjTUJ2sA5a4MllFPR92lFOJWSWbFEfstglRK8jA73qj+HkKlxrWeMqsMCdHTfmRsOys/mUAmGQ1Oa3QpJQUxVG18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754253933; c=relaxed/simple;
	bh=qJoEmIc3Mge0u7TgtUI5nQSBYyQxiZgMWyRRzuSQVwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HbptTaFtAl85jxPCyLq1V/EEBYsHkAbqUlYhatGSDzT3AEzPE2U+5m3Iv/DKEwi21iKPv+EH3rvBzkIFCgXAMS6W/Ty97I/9EfO3M13nbD34UHpVwpy4BVdzNKSIERceMjZicmwl9rXEI5r6FEVBsJKler+ZX5aVsLmQSjvKroY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OwaDkcFh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A3F5C4CEFF;
	Sun,  3 Aug 2025 20:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754253933;
	bh=qJoEmIc3Mge0u7TgtUI5nQSBYyQxiZgMWyRRzuSQVwI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OwaDkcFhcnSmeH2K9mzvipkS4S0wlp7t2TgpcZw1uaxNvwS79mcP3uk9rSzS5e85U
	 WkvEBX5rZbvTwfl6kHuGU8Ao85h4Xq4fz2qy8+FkaWHJ07YYWzkiXTTkyxOPuBLdkg
	 f6MAGeU9/b7jOopNP4MOFiroIXDFdGITiQm5fooGcgxVstF2UGhKE2DTKUI6b9L3Di
	 cg1MDzGB+EM2q3copfW097xhyFI9bCGNqigAYSpDEodb9dz9VuS4KTzhohFbrMGfZ6
	 7m7uU4y0qI0bUjjOLFV9qD4HizaAvIWi0h8Uv76EhP42n7uhwqyyBD0EP/jNgjOAoQ
	 RKVbJUKGqsjUA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 4/7] crypto: sparc/md5 - Remove SPARC64 optimized MD5 code
Date: Sun,  3 Aug 2025 13:44:30 -0700
Message-ID: <20250803204433.75703-5-ebiggers@kernel.org>
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

This commit removes the SPARC64 optimized MD5 code.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/sparc/crypto/Kconfig    |  10 --
 arch/sparc/crypto/Makefile   |   4 -
 arch/sparc/crypto/md5_asm.S  |  70 --------------
 arch/sparc/crypto/md5_glue.c | 174 -----------------------------------
 4 files changed, 258 deletions(-)
 delete mode 100644 arch/sparc/crypto/md5_asm.S
 delete mode 100644 arch/sparc/crypto/md5_glue.c

diff --git a/arch/sparc/crypto/Kconfig b/arch/sparc/crypto/Kconfig
index f5b2e720fec3c..f755da9795346 100644
--- a/arch/sparc/crypto/Kconfig
+++ b/arch/sparc/crypto/Kconfig
@@ -14,20 +14,10 @@ config CRYPTO_DES_SPARC64
 	  Length-preserving ciphers: DES with ECB and CBC modes
 	  Length-preserving ciphers: Tripe DES EDE with ECB and CBC modes
 
 	  Architecture: sparc64
 
-config CRYPTO_MD5_SPARC64
-	tristate "Digests: MD5"
-	depends on SPARC64
-	select CRYPTO_MD5
-	select CRYPTO_HASH
-	help
-	  MD5 message digest algorithm (RFC1321)
-
-	  Architecture: sparc64 using crypto instructions, when available
-
 config CRYPTO_AES_SPARC64
 	tristate "Ciphers: AES, modes: ECB, CBC, CTR"
 	depends on SPARC64
 	select CRYPTO_SKCIPHER
 	help
diff --git a/arch/sparc/crypto/Makefile b/arch/sparc/crypto/Makefile
index 0d05a17988c4c..7b4796842ddd7 100644
--- a/arch/sparc/crypto/Makefile
+++ b/arch/sparc/crypto/Makefile
@@ -1,16 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Arch-specific CryptoAPI modules.
 #
 
-obj-$(CONFIG_CRYPTO_MD5_SPARC64) += md5-sparc64.o
-
 obj-$(CONFIG_CRYPTO_AES_SPARC64) += aes-sparc64.o
 obj-$(CONFIG_CRYPTO_DES_SPARC64) += des-sparc64.o
 obj-$(CONFIG_CRYPTO_CAMELLIA_SPARC64) += camellia-sparc64.o
 
-md5-sparc64-y := md5_asm.o md5_glue.o
-
 aes-sparc64-y := aes_asm.o aes_glue.o
 des-sparc64-y := des_asm.o des_glue.o
 camellia-sparc64-y := camellia_asm.o camellia_glue.o
diff --git a/arch/sparc/crypto/md5_asm.S b/arch/sparc/crypto/md5_asm.S
deleted file mode 100644
index 60b544e4d205b..0000000000000
--- a/arch/sparc/crypto/md5_asm.S
+++ /dev/null
@@ -1,70 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#include <linux/linkage.h>
-#include <asm/opcodes.h>
-#include <asm/visasm.h>
-
-ENTRY(md5_sparc64_transform)
-	/* %o0 = digest, %o1 = data, %o2 = rounds */
-	VISEntryHalf
-	ld	[%o0 + 0x00], %f0
-	ld	[%o0 + 0x04], %f1
-	andcc	%o1, 0x7, %g0
-	ld	[%o0 + 0x08], %f2
-	bne,pn	%xcc, 10f
-	 ld	[%o0 + 0x0c], %f3
-
-1:
-	ldd	[%o1 + 0x00], %f8
-	ldd	[%o1 + 0x08], %f10
-	ldd	[%o1 + 0x10], %f12
-	ldd	[%o1 + 0x18], %f14
-	ldd	[%o1 + 0x20], %f16
-	ldd	[%o1 + 0x28], %f18
-	ldd	[%o1 + 0x30], %f20
-	ldd	[%o1 + 0x38], %f22
-
-	MD5
-
-	subcc	%o2, 1, %o2
-	bne,pt	%xcc, 1b
-	 add	%o1, 0x40, %o1
-
-5:
-	st	%f0, [%o0 + 0x00]
-	st	%f1, [%o0 + 0x04]
-	st	%f2, [%o0 + 0x08]
-	st	%f3, [%o0 + 0x0c]
-	retl
-	 VISExitHalf
-10:
-	alignaddr %o1, %g0, %o1
-
-	ldd	[%o1 + 0x00], %f10
-1:
-	ldd	[%o1 + 0x08], %f12
-	ldd	[%o1 + 0x10], %f14
-	ldd	[%o1 + 0x18], %f16
-	ldd	[%o1 + 0x20], %f18
-	ldd	[%o1 + 0x28], %f20
-	ldd	[%o1 + 0x30], %f22
-	ldd	[%o1 + 0x38], %f24
-	ldd	[%o1 + 0x40], %f26
-
-	faligndata %f10, %f12, %f8
-	faligndata %f12, %f14, %f10
-	faligndata %f14, %f16, %f12
-	faligndata %f16, %f18, %f14
-	faligndata %f18, %f20, %f16
-	faligndata %f20, %f22, %f18
-	faligndata %f22, %f24, %f20
-	faligndata %f24, %f26, %f22
-
-	MD5
-
-	subcc	%o2, 1, %o2
-	fsrc2	%f26, %f10
-	bne,pt	%xcc, 1b
-	 add	%o1, 0x40, %o1
-
-	ba,a,pt	%xcc, 5b
-ENDPROC(md5_sparc64_transform)
diff --git a/arch/sparc/crypto/md5_glue.c b/arch/sparc/crypto/md5_glue.c
deleted file mode 100644
index b3615f0cdf626..0000000000000
--- a/arch/sparc/crypto/md5_glue.c
+++ /dev/null
@@ -1,174 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/* Glue code for MD5 hashing optimized for sparc64 crypto opcodes.
- *
- * This is based largely upon arch/x86/crypto/sha1_ssse3_glue.c
- * and crypto/md5.c which are:
- *
- * Copyright (c) Alan Smithee.
- * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
- * Copyright (c) Jean-Francois Dive <jef@linuxbe.org>
- * Copyright (c) Mathias Krause <minipli@googlemail.com>
- * Copyright (c) Cryptoapi developers.
- * Copyright (c) 2002 James Morris <jmorris@intercode.com.au>
- */
-
-#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
-
-#include <asm/elf.h>
-#include <asm/opcodes.h>
-#include <asm/pstate.h>
-#include <crypto/internal/hash.h>
-#include <crypto/md5.h>
-#include <linux/errno.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/string.h>
-#include <linux/unaligned.h>
-
-struct sparc_md5_state {
-	__le32 hash[MD5_HASH_WORDS];
-	u64 byte_count;
-};
-
-asmlinkage void md5_sparc64_transform(__le32 *digest, const char *data,
-				      unsigned int rounds);
-
-static int md5_sparc64_init(struct shash_desc *desc)
-{
-	struct sparc_md5_state *mctx = shash_desc_ctx(desc);
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
-static int md5_sparc64_update(struct shash_desc *desc, const u8 *data,
-			      unsigned int len)
-{
-	struct sparc_md5_state *sctx = shash_desc_ctx(desc);
-
-	sctx->byte_count += round_down(len, MD5_HMAC_BLOCK_SIZE);
-	md5_sparc64_transform(sctx->hash, data, len / MD5_HMAC_BLOCK_SIZE);
-	return len - round_down(len, MD5_HMAC_BLOCK_SIZE);
-}
-
-/* Add padding and return the message digest. */
-static int md5_sparc64_finup(struct shash_desc *desc, const u8 *src,
-			     unsigned int offset, u8 *out)
-{
-	struct sparc_md5_state *sctx = shash_desc_ctx(desc);
-	__le64 block[MD5_BLOCK_WORDS] = {};
-	u8 *p = memcpy(block, src, offset);
-	__le32 *dst = (__le32 *)out;
-	__le64 *pbits;
-	int i;
-
-	src = p;
-	p += offset;
-	*p++ = 0x80;
-	sctx->byte_count += offset;
-	pbits = &block[(MD5_BLOCK_WORDS / (offset > 55 ? 1 : 2)) - 1];
-	*pbits = cpu_to_le64(sctx->byte_count << 3);
-	md5_sparc64_transform(sctx->hash, src, (pbits - block + 1) / 8);
-	memzero_explicit(block, sizeof(block));
-
-	/* Store state in digest */
-	for (i = 0; i < MD5_HASH_WORDS; i++)
-		dst[i] = sctx->hash[i];
-
-	return 0;
-}
-
-static int md5_sparc64_export(struct shash_desc *desc, void *out)
-{
-	struct sparc_md5_state *sctx = shash_desc_ctx(desc);
-	union {
-		u8 *u8;
-		u32 *u32;
-		u64 *u64;
-	} p = { .u8 = out };
-	int i;
-
-	for (i = 0; i < MD5_HASH_WORDS; i++)
-		put_unaligned(le32_to_cpu(sctx->hash[i]), p.u32++);
-	put_unaligned(sctx->byte_count, p.u64);
-	return 0;
-}
-
-static int md5_sparc64_import(struct shash_desc *desc, const void *in)
-{
-	struct sparc_md5_state *sctx = shash_desc_ctx(desc);
-	union {
-		const u8 *u8;
-		const u32 *u32;
-		const u64 *u64;
-	} p = { .u8 = in };
-	int i;
-
-	for (i = 0; i < MD5_HASH_WORDS; i++)
-		sctx->hash[i] = cpu_to_le32(get_unaligned(p.u32++));
-	sctx->byte_count = get_unaligned(p.u64);
-	return 0;
-}
-
-static struct shash_alg alg = {
-	.digestsize	=	MD5_DIGEST_SIZE,
-	.init		=	md5_sparc64_init,
-	.update		=	md5_sparc64_update,
-	.finup		=	md5_sparc64_finup,
-	.export		=	md5_sparc64_export,
-	.import		=	md5_sparc64_import,
-	.descsize	=	sizeof(struct sparc_md5_state),
-	.statesize	=	sizeof(struct sparc_md5_state),
-	.base		=	{
-		.cra_name	=	"md5",
-		.cra_driver_name=	"md5-sparc64",
-		.cra_priority	=	SPARC_CR_OPCODE_PRIORITY,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY,
-		.cra_blocksize	=	MD5_HMAC_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-};
-
-static bool __init sparc64_has_md5_opcode(void)
-{
-	unsigned long cfr;
-
-	if (!(sparc64_elf_hwcap & HWCAP_SPARC_CRYPTO))
-		return false;
-
-	__asm__ __volatile__("rd %%asr26, %0" : "=r" (cfr));
-	if (!(cfr & CFR_MD5))
-		return false;
-
-	return true;
-}
-
-static int __init md5_sparc64_mod_init(void)
-{
-	if (sparc64_has_md5_opcode()) {
-		pr_info("Using sparc64 md5 opcode optimized MD5 implementation\n");
-		return crypto_register_shash(&alg);
-	}
-	pr_info("sparc64 md5 opcode not available.\n");
-	return -ENODEV;
-}
-
-static void __exit md5_sparc64_mod_fini(void)
-{
-	crypto_unregister_shash(&alg);
-}
-
-module_init(md5_sparc64_mod_init);
-module_exit(md5_sparc64_mod_fini);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("MD5 Message Digest Algorithm, sparc64 md5 opcode accelerated");
-
-MODULE_ALIAS_CRYPTO("md5");
-
-#include "crop_devid.c"
-- 
2.50.1


