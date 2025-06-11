Return-Path: <linux-mips+bounces-9240-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4F5AD48AE
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 04:15:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E9ED18860FD
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 02:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 313B91D9324;
	Wed, 11 Jun 2025 02:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BInTO5VY"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03581D5CDD;
	Wed, 11 Jun 2025 02:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749607979; cv=none; b=mutrpMY7aCpL6OpYOm/5Lu4du3+x3fb1QS/OXO105oj80/+S7C3+Y3uTlSQq75TgUnHHKXOEjz7JFUZkDQHnWJXj5rLIcBY62OSGcqvZIZYV6wNA6dxmr0bOLClTldCYw4yq/5zH3zTLZAhxefUb9Pei0AajAB6SiCM9h3UI2/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749607979; c=relaxed/simple;
	bh=LymbL3HQOHfT/jDvUslu3WG9DHYX8sFXPLEZDKGLIl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FMWmHo2okr0p3S6XXuiC+TZg992CLNV5Jqu8ASqm8hyL72vgVNNF1ThIvEkqMIUTeAgTDkI/PrxEhnlOxhDC9YjHMJKQ89US/JJ0uqijsG7ZRx7ajraKxFBGoB/Ot6DdRDDXgSa3zt/FPHuk4//3XuN2saDTU6gFDzXNSEFpySs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BInTO5VY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 818E2C4CEF5;
	Wed, 11 Jun 2025 02:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749607978;
	bh=LymbL3HQOHfT/jDvUslu3WG9DHYX8sFXPLEZDKGLIl0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BInTO5VYEIg6ikYMucIEzcf6zyBwRdamla0H1Jog5AEi7WG9AnYgCrl/Bm/0CIBYM
	 bUUvMH6uHSurGHGM0Tj6u8+eYLXIU9qzIKzlSebuPIKnXuox/g2JVmMG+jMLfGalEj
	 EWMNCB4977XqRRtwwZltuUSbpVoQwBGl4CLAXqaJA79Rnr2RZpnnqlBn/qumER6oHd
	 JSuOU0PvpS4JB1RdZWdxRIN30cQJf1sVFJVMElRBMeTO/jYzEf52vveaD33VvbCmTO
	 WiN9rc1QKHtrgc9BXBXa9jtp9CNyHJQ/0avsULhfeVFjXjUVwVTSTSwVctBNmu7Obm
	 VFxDXlz5N8TvQ==
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
Subject: [PATCH 14/16] lib/crypto/sha512: migrate sparc-optimized SHA-512 code to library
Date: Tue, 10 Jun 2025 19:09:21 -0700
Message-ID: <20250611020923.1482701-15-ebiggers@kernel.org>
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

Instead of exposing the sparc-optimized SHA-512 code via sparc-specific
crypto_shash algorithms, instead just implement the sha512_blocks()
library function.  This is much simpler, it makes the SHA-512 (and
SHA-384) library functions be sparc-optimized, and it fixes the
longstanding issue where the sparc-optimized SHA-512 code was disabled
by default.  SHA-512 still remains available through crypto_shash, but
individual architectures no longer need to handle it.

To match sha512_blocks(), change the type of the nblocks parameter of
the assembly function from int to size_t.  The assembly function
actually already treated it as size_t.

Note: to see the diff from arch/sparc/crypto/sha512_glue.c to
lib/crypto/sparc/sha512.h, view this commit with 'git show -M10'.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/sparc/crypto/Kconfig                     |  10 --
 arch/sparc/crypto/Makefile                    |   2 -
 arch/sparc/crypto/sha512_glue.c               | 122 ------------------
 lib/crypto/Kconfig                            |   1 +
 lib/crypto/Makefile                           |   1 +
 lib/crypto/sparc/sha512.h                     |  42 ++++++
 .../crypto => lib/crypto/sparc}/sha512_asm.S  |   0
 7 files changed, 44 insertions(+), 134 deletions(-)
 delete mode 100644 arch/sparc/crypto/sha512_glue.c
 create mode 100644 lib/crypto/sparc/sha512.h
 rename {arch/sparc/crypto => lib/crypto/sparc}/sha512_asm.S (100%)

diff --git a/arch/sparc/crypto/Kconfig b/arch/sparc/crypto/Kconfig
index a6ba319c42dce..9d8da9aef3a41 100644
--- a/arch/sparc/crypto/Kconfig
+++ b/arch/sparc/crypto/Kconfig
@@ -34,20 +34,10 @@ config CRYPTO_SHA1_SPARC64
 	help
 	  SHA-1 secure hash algorithm (FIPS 180)
 
 	  Architecture: sparc64
 
-config CRYPTO_SHA512_SPARC64
-	tristate "Hash functions: SHA-384 and SHA-512"
-	depends on SPARC64
-	select CRYPTO_SHA512
-	select CRYPTO_HASH
-	help
-	  SHA-384 and SHA-512 secure hash algorithms (FIPS 180)
-
-	  Architecture: sparc64 using crypto instructions, when available
-
 config CRYPTO_AES_SPARC64
 	tristate "Ciphers: AES, modes: ECB, CBC, CTR"
 	depends on SPARC64
 	select CRYPTO_SKCIPHER
 	help
diff --git a/arch/sparc/crypto/Makefile b/arch/sparc/crypto/Makefile
index 701c39edb0d73..99a7e8fd13bc9 100644
--- a/arch/sparc/crypto/Makefile
+++ b/arch/sparc/crypto/Makefile
@@ -2,19 +2,17 @@
 #
 # Arch-specific CryptoAPI modules.
 #
 
 obj-$(CONFIG_CRYPTO_SHA1_SPARC64) += sha1-sparc64.o
-obj-$(CONFIG_CRYPTO_SHA512_SPARC64) += sha512-sparc64.o
 obj-$(CONFIG_CRYPTO_MD5_SPARC64) += md5-sparc64.o
 
 obj-$(CONFIG_CRYPTO_AES_SPARC64) += aes-sparc64.o
 obj-$(CONFIG_CRYPTO_DES_SPARC64) += des-sparc64.o
 obj-$(CONFIG_CRYPTO_CAMELLIA_SPARC64) += camellia-sparc64.o
 
 sha1-sparc64-y := sha1_asm.o sha1_glue.o
-sha512-sparc64-y := sha512_asm.o sha512_glue.o
 md5-sparc64-y := md5_asm.o md5_glue.o
 
 aes-sparc64-y := aes_asm.o aes_glue.o
 des-sparc64-y := des_asm.o des_glue.o
 camellia-sparc64-y := camellia_asm.o camellia_glue.o
diff --git a/arch/sparc/crypto/sha512_glue.c b/arch/sparc/crypto/sha512_glue.c
deleted file mode 100644
index fb81c3290c8c0..0000000000000
--- a/arch/sparc/crypto/sha512_glue.c
+++ /dev/null
@@ -1,122 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/* Glue code for SHA512 hashing optimized for sparc64 crypto opcodes.
- *
- * This is based largely upon crypto/sha512_generic.c
- *
- * Copyright (c) Jean-Luc Cooke <jlcooke@certainkey.com>
- * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
- * Copyright (c) 2003 Kyle McMartin <kyle@debian.org>
- */
-
-#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
-
-#include <asm/elf.h>
-#include <asm/opcodes.h>
-#include <asm/pstate.h>
-#include <crypto/internal/hash.h>
-#include <crypto/sha2.h>
-#include <crypto/sha512_base.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-
-asmlinkage void sha512_sparc64_transform(u64 *digest, const char *data,
-					 unsigned int rounds);
-
-static void sha512_block(struct sha512_state *sctx, const u8 *src, int blocks)
-{
-	sha512_sparc64_transform(sctx->state, src, blocks);
-}
-
-static int sha512_sparc64_update(struct shash_desc *desc, const u8 *data,
-				 unsigned int len)
-{
-	return sha512_base_do_update_blocks(desc, data, len, sha512_block);
-}
-
-static int sha512_sparc64_finup(struct shash_desc *desc, const u8 *src,
-				unsigned int len, u8 *out)
-{
-	sha512_base_do_finup(desc, src, len, sha512_block);
-	return sha512_base_finish(desc, out);
-}
-
-static struct shash_alg sha512_alg = {
-	.digestsize	=	SHA512_DIGEST_SIZE,
-	.init		=	sha512_base_init,
-	.update		=	sha512_sparc64_update,
-	.finup		=	sha512_sparc64_finup,
-	.descsize	=	SHA512_STATE_SIZE,
-	.base		=	{
-		.cra_name	=	"sha512",
-		.cra_driver_name=	"sha512-sparc64",
-		.cra_priority	=	SPARC_CR_OPCODE_PRIORITY,
-		.cra_blocksize	=	SHA512_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-};
-
-static struct shash_alg sha384_alg = {
-	.digestsize	=	SHA384_DIGEST_SIZE,
-	.init		=	sha384_base_init,
-	.update		=	sha512_sparc64_update,
-	.finup		=	sha512_sparc64_finup,
-	.descsize	=	SHA512_STATE_SIZE,
-	.base		=	{
-		.cra_name	=	"sha384",
-		.cra_driver_name=	"sha384-sparc64",
-		.cra_priority	=	SPARC_CR_OPCODE_PRIORITY,
-		.cra_blocksize	=	SHA384_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-};
-
-static bool __init sparc64_has_sha512_opcode(void)
-{
-	unsigned long cfr;
-
-	if (!(sparc64_elf_hwcap & HWCAP_SPARC_CRYPTO))
-		return false;
-
-	__asm__ __volatile__("rd %%asr26, %0" : "=r" (cfr));
-	if (!(cfr & CFR_SHA512))
-		return false;
-
-	return true;
-}
-
-static int __init sha512_sparc64_mod_init(void)
-{
-	if (sparc64_has_sha512_opcode()) {
-		int ret = crypto_register_shash(&sha384_alg);
-		if (ret < 0)
-			return ret;
-
-		ret = crypto_register_shash(&sha512_alg);
-		if (ret < 0) {
-			crypto_unregister_shash(&sha384_alg);
-			return ret;
-		}
-
-		pr_info("Using sparc64 sha512 opcode optimized SHA-512/SHA-384 implementation\n");
-		return 0;
-	}
-	pr_info("sparc64 sha512 opcode not available.\n");
-	return -ENODEV;
-}
-
-static void __exit sha512_sparc64_mod_fini(void)
-{
-	crypto_unregister_shash(&sha384_alg);
-	crypto_unregister_shash(&sha512_alg);
-}
-
-module_init(sha512_sparc64_mod_init);
-module_exit(sha512_sparc64_mod_fini);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("SHA-384 and SHA-512 Secure Hash Algorithm, sparc64 sha512 opcode accelerated");
-
-MODULE_ALIAS_CRYPTO("sha384");
-MODULE_ALIAS_CRYPTO("sha512");
-
-#include "crop_devid.c"
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 4bdb4118a789f..0d6522b92ef57 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -182,10 +182,11 @@ config CRYPTO_LIB_SHA512_ARCH
 	default y if ARM && !CPU_V7M
 	default y if ARM64
 	default y if MIPS && CPU_CAVIUM_OCTEON
 	default y if RISCV && 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
 	default y if S390
+	default y if SPARC64
 
 config CRYPTO_LIB_SM3
 	tristate
 
 if !KMSAN # avoid false positives from assembly
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index bfa35cc235cea..3c651927f5ba5 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -90,10 +90,11 @@ $(obj)/arm64/sha512-core.S: $(src)/../../arch/arm64/lib/crypto/sha2-armv8.pl
 clean-files += arm64/sha512-core.S
 libsha512-$(CONFIG_KERNEL_MODE_NEON) += arm64/sha512-ce-core.o
 endif
 
 libsha512-$(CONFIG_RISCV) += riscv/sha512-riscv64-zvknhb-zvkb.o
+libsha512-$(CONFIG_SPARC) += sparc/sha512_asm.o
 endif # CONFIG_CRYPTO_LIB_SHA512_ARCH
 
 obj-$(CONFIG_MPILIB) += mpi/
 
 obj-$(CONFIG_CRYPTO_SELFTESTS)			+= simd.o
diff --git a/lib/crypto/sparc/sha512.h b/lib/crypto/sparc/sha512.h
new file mode 100644
index 0000000000000..55303ab6b15f7
--- /dev/null
+++ b/lib/crypto/sparc/sha512.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * SHA-512 accelerated using the sparc64 sha512 opcodes
+ *
+ * Copyright (c) Jean-Luc Cooke <jlcooke@certainkey.com>
+ * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
+ * Copyright (c) 2003 Kyle McMartin <kyle@debian.org>
+ */
+
+#include <asm/elf.h>
+#include <asm/opcodes.h>
+#include <asm/pstate.h>
+
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_sha512_opcodes);
+
+asmlinkage void sha512_sparc64_transform(struct sha512_block_state *state,
+					 const u8 *data, size_t nblocks);
+
+static void sha512_blocks(struct sha512_block_state *state,
+			  const u8 *data, size_t nblocks)
+{
+	if (static_branch_likely(&have_sha512_opcodes))
+		sha512_sparc64_transform(state, data, nblocks);
+	else
+		sha512_blocks_generic(state, data, nblocks);
+}
+
+#define sha512_mod_init_arch sha512_mod_init_arch
+static inline void sha512_mod_init_arch(void)
+{
+	unsigned long cfr;
+
+	if (!(sparc64_elf_hwcap & HWCAP_SPARC_CRYPTO))
+		return;
+
+	__asm__ __volatile__("rd %%asr26, %0" : "=r" (cfr));
+	if (!(cfr & CFR_SHA512))
+		return;
+
+	static_branch_enable(&have_sha512_opcodes);
+	pr_info("Using sparc64 sha512 opcode optimized SHA-512/SHA-384 implementation\n");
+}
diff --git a/arch/sparc/crypto/sha512_asm.S b/lib/crypto/sparc/sha512_asm.S
similarity index 100%
rename from arch/sparc/crypto/sha512_asm.S
rename to lib/crypto/sparc/sha512_asm.S
-- 
2.49.0


