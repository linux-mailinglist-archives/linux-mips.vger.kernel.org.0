Return-Path: <linux-mips+bounces-10034-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2480B1BC9B
	for <lists+linux-mips@lfdr.de>; Wed,  6 Aug 2025 00:30:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 202AD1899BB6
	for <lists+linux-mips@lfdr.de>; Tue,  5 Aug 2025 22:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7120E29A9E4;
	Tue,  5 Aug 2025 22:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZFNS1a85"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E57262FE5;
	Tue,  5 Aug 2025 22:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754433010; cv=none; b=Ht+W5t2vSXcKwhT2KBRBq8DPU3D7ezqend3meixCcNiPqiTwosP0HWy4VbSn2UmOfEjs34IHKMDteZGBUoXxeMtAqwvd3z1wVdMfmLNveGQ9N3SaFoANjlqZhc9MxZW+jIligyPnwrGX3RdLH3P96VLsYegLcGsyF7VzExZ8jgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754433010; c=relaxed/simple;
	bh=J7l9bJPT2xll8QmdyoGz4D6kdDet0QE/TANAjwOgrDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lQz7gKlexyuoSFQDuXplNuM0DL9ymMiWQcchxRMWP+4YyPvX9bntweZcul9k7n2YJGaiRfeFkfGCHTAoHGlitMpq4R0O/hN6Jh3JJN+DRhirNJ0KH8Y+gu4JIBKyoxuF0OMCU4n6fculr8b+D0aAAh0FBlf1Xi5ZqKTvMCI0fIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZFNS1a85; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63E88C4CEFA;
	Tue,  5 Aug 2025 22:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754433009;
	bh=J7l9bJPT2xll8QmdyoGz4D6kdDet0QE/TANAjwOgrDo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZFNS1a85za7GpfUoLXTwGjDCv5IXRSRQuIA3+z49wtvO+VrZscELL+1ERjMskUWuJ
	 TwzHx2s9wT2VI85C51XshvQuu/LnzJbVueUOmZhGO9y8+0rfBWwqs85E48FEe/ZSTB
	 8cjVIjmOSLpz8OGRmAnHX305vGaZhKF5Kj4NR7829UiMTZJBZq+4uacJPahOoYFvPe
	 dkswDlwx4YaSz6jBB/Id555kdFVDHaH7kAnccbHP1FJcRXRdm3cJ2P+J18+s6JxJkD
	 ERWtuH8r1pA3GUN84ampNtw35O957Ji7eBceu71gCV4Co9KdrWCBgzcZQFiEHSzhnr
	 uhjcjb0HyNz/Q==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 5/7] lib/crypto: sparc/md5: Migrate optimized code into library
Date: Tue,  5 Aug 2025 15:28:53 -0700
Message-ID: <20250805222855.10362-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250805222855.10362-1-ebiggers@kernel.org>
References: <20250805222855.10362-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of exposing the sparc-optimized MD5 code via sparc-specific
crypto_shash algorithms, instead just implement the md5_blocks() library
function.  This is much simpler, it makes the MD5 library functions be
sparc-optimized, and it fixes the longstanding issue where the
sparc-optimized MD5 code was disabled by default.  MD5 still remains
available through crypto_shash, but individual architectures no longer
need to handle it.

Note: to see the diff from arch/sparc/crypto/md5_glue.c to
lib/crypto/sparc/md5.h, view this commit with 'git show -M10'.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/sparc/crypto/Kconfig                     |  10 -
 arch/sparc/crypto/Makefile                    |   4 -
 arch/sparc/crypto/md5_glue.c                  | 174 ------------------
 lib/crypto/Kconfig                            |   1 +
 lib/crypto/Makefile                           |   1 +
 lib/crypto/sparc/md5.h                        |  48 +++++
 .../crypto => lib/crypto/sparc}/md5_asm.S     |   0
 7 files changed, 50 insertions(+), 188 deletions(-)
 delete mode 100644 arch/sparc/crypto/md5_glue.c
 create mode 100644 lib/crypto/sparc/md5.h
 rename {arch/sparc/crypto => lib/crypto/sparc}/md5_asm.S (100%)

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
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index cfbbfaae9fe29..2ca1d5b37dc0e 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -110,10 +110,11 @@ config CRYPTO_LIB_MD5
 config CRYPTO_LIB_MD5_ARCH
 	bool
 	depends on CRYPTO_LIB_MD5 && !UML
 	default y if MIPS && CPU_CAVIUM_OCTEON
 	default y if PPC
+	default y if SPARC64
 
 config CRYPTO_LIB_POLY1305_RSIZE
 	int
 	default 2 if MIPS
 	default 11 if X86_64
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 8360054481b84..e52a08937390c 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -64,10 +64,11 @@ libdes-y					:= des.o
 obj-$(CONFIG_CRYPTO_LIB_MD5) += libmd5.o
 libmd5-y := md5.o
 ifeq ($(CONFIG_CRYPTO_LIB_MD5_ARCH),y)
 CFLAGS_md5.o += -I$(src)/$(SRCARCH)
 libmd5-$(CONFIG_PPC) += powerpc/md5-asm.o
+libmd5-$(CONFIG_SPARC) += sparc/md5_asm.o
 endif # CONFIG_CRYPTO_LIB_MD5_ARCH
 
 ################################################################################
 
 obj-$(CONFIG_CRYPTO_LIB_POLY1305)		+= libpoly1305.o
diff --git a/lib/crypto/sparc/md5.h b/lib/crypto/sparc/md5.h
new file mode 100644
index 0000000000000..3f1b0ed8c0b3f
--- /dev/null
+++ b/lib/crypto/sparc/md5.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * MD5 accelerated using the sparc64 crypto opcodes
+ *
+ * Copyright (c) Alan Smithee.
+ * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
+ * Copyright (c) Jean-Francois Dive <jef@linuxbe.org>
+ * Copyright (c) Mathias Krause <minipli@googlemail.com>
+ * Copyright (c) Cryptoapi developers.
+ * Copyright (c) 2002 James Morris <jmorris@intercode.com.au>
+ */
+
+#include <asm/elf.h>
+#include <asm/opcodes.h>
+#include <asm/pstate.h>
+
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_md5_opcodes);
+
+asmlinkage void md5_sparc64_transform(struct md5_block_state *state,
+				      const u8 *data, size_t nblocks);
+
+static void md5_blocks(struct md5_block_state *state,
+		       const u8 *data, size_t nblocks)
+{
+	if (static_branch_likely(&have_md5_opcodes)) {
+		cpu_to_le32_array(state->h, ARRAY_SIZE(state->h));
+		md5_sparc64_transform(state, data, nblocks);
+		le32_to_cpu_array(state->h, ARRAY_SIZE(state->h));
+	} else {
+		md5_blocks_generic(state, data, nblocks);
+	}
+}
+
+#define md5_mod_init_arch md5_mod_init_arch
+static inline void md5_mod_init_arch(void)
+{
+	unsigned long cfr;
+
+	if (!(sparc64_elf_hwcap & HWCAP_SPARC_CRYPTO))
+		return;
+
+	__asm__ __volatile__("rd %%asr26, %0" : "=r" (cfr));
+	if (!(cfr & CFR_MD5))
+		return;
+
+	static_branch_enable(&have_md5_opcodes);
+	pr_info("Using sparc64 md5 opcode optimized MD5 implementation\n");
+}
diff --git a/arch/sparc/crypto/md5_asm.S b/lib/crypto/sparc/md5_asm.S
similarity index 100%
rename from arch/sparc/crypto/md5_asm.S
rename to lib/crypto/sparc/md5_asm.S
-- 
2.50.1


