Return-Path: <linux-mips+bounces-9777-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1813AB02DEA
	for <lists+linux-mips@lfdr.de>; Sun, 13 Jul 2025 01:29:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7518BA42388
	for <lists+linux-mips@lfdr.de>; Sat, 12 Jul 2025 23:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D20423B61A;
	Sat, 12 Jul 2025 23:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NHeLA/KH"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E8B23ABBB;
	Sat, 12 Jul 2025 23:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752362786; cv=none; b=XFRnGpw6HvrvTiEzmXWyyGKR0mSvB8kXaq1wTtKCgEOAW+iJOkydhN29wsh+MppOvAhi5pZTHe529N+MVKUe/xoqSFMA1ne9lklsiuT/V26hO05u/zh3OsVs7qBuaF+SKVeUyZJKfbN1z0252q57uJRrJak9m8J5c4SHRQ77re0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752362786; c=relaxed/simple;
	bh=LruJqtF+TwmkPV/aEz/JpTzpQv42VX6b1q36sAkdMHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O8iJHzvWiD18Hhn/q49I/dldczgUYvVvvhxib+fI93+bOFQEJSTlhZRbQfLYrIg0cbp3T3UztOXP/wD2EFO866yYM17MwbAHEowUh9kbHmyJfU6c+u1i+DBCoIA0wcjcidepeTBvPoQ69xGYtP3U8tbI/W7Ebn/PGF8vjoTpvds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NHeLA/KH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D961C4CEF7;
	Sat, 12 Jul 2025 23:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362785;
	bh=LruJqtF+TwmkPV/aEz/JpTzpQv42VX6b1q36sAkdMHQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NHeLA/KHLKl2QWc9TBszQnASmUzxeJUh4BNHOt6A3lNhYy9I4pp3sYrQKd72LR60z
	 KGyJEWc1AzAAFX0ofjFZOaBPDWGm3LabMi5tr448sdAoMQAjXowUc2H82oe4Urk6qV
	 GosEozTuBSz9eu2210F9B6S64TfigAzo5I5P25QUBsw50TxOqjpT+KMGWe/IcoB1AZ
	 7gDqTHuRg1Ry3yGHTSm37EYcGLJFyh4cXIHMKu1j7fuB5ltEkmNCkhf0jYwsA2L88E
	 y/V+h9TEba4VUQqRGtSmZ0vKvRQv3S8nFvJSvdRakRfQNE6hSFJyOT0BR021XuPglF
	 jGIUNOMddbOZA==
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
Subject: [PATCH 12/26] lib/crypto: sparc/sha1: Migrate optimized code into library
Date: Sat, 12 Jul 2025 16:23:03 -0700
Message-ID: <20250712232329.818226-13-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250712232329.818226-1-ebiggers@kernel.org>
References: <20250712232329.818226-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of exposing the sparc-optimized SHA-1 code via sparc-specific
crypto_shash algorithms, instead just implement the sha1_blocks()
library function.  This is much simpler, it makes the SHA-1 library
functions be sparc-optimized, and it fixes the longstanding issue where
the sparc-optimized SHA-1 code was disabled by default.  SHA-1 still
remains available through crypto_shash, but individual architectures no
longer need to handle it.

Note: to see the diff from arch/sparc/crypto/sha1_glue.c to
lib/crypto/sparc/sha1.h, view this commit with 'git show -M10'.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/sparc/crypto/Kconfig                     | 10 --
 arch/sparc/crypto/Makefile                    |  2 -
 arch/sparc/crypto/sha1_glue.c                 | 94 -------------------
 lib/crypto/Kconfig                            |  1 +
 lib/crypto/Makefile                           |  1 +
 lib/crypto/sparc/sha1.h                       | 43 +++++++++
 .../crypto => lib/crypto/sparc}/sha1_asm.S    |  0
 7 files changed, 45 insertions(+), 106 deletions(-)
 delete mode 100644 arch/sparc/crypto/sha1_glue.c
 create mode 100644 lib/crypto/sparc/sha1.h
 rename {arch/sparc/crypto => lib/crypto/sparc}/sha1_asm.S (100%)

diff --git a/arch/sparc/crypto/Kconfig b/arch/sparc/crypto/Kconfig
index 9d8da9aef3a41..f5b2e720fec3c 100644
--- a/arch/sparc/crypto/Kconfig
+++ b/arch/sparc/crypto/Kconfig
@@ -24,20 +24,10 @@ config CRYPTO_MD5_SPARC64
 	help
 	  MD5 message digest algorithm (RFC1321)
 
 	  Architecture: sparc64 using crypto instructions, when available
 
-config CRYPTO_SHA1_SPARC64
-	tristate "Hash functions: SHA-1"
-	depends on SPARC64
-	select CRYPTO_SHA1
-	select CRYPTO_HASH
-	help
-	  SHA-1 secure hash algorithm (FIPS 180)
-
-	  Architecture: sparc64
-
 config CRYPTO_AES_SPARC64
 	tristate "Ciphers: AES, modes: ECB, CBC, CTR"
 	depends on SPARC64
 	select CRYPTO_SKCIPHER
 	help
diff --git a/arch/sparc/crypto/Makefile b/arch/sparc/crypto/Makefile
index 99a7e8fd13bc9..0d05a17988c4c 100644
--- a/arch/sparc/crypto/Makefile
+++ b/arch/sparc/crypto/Makefile
@@ -1,18 +1,16 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Arch-specific CryptoAPI modules.
 #
 
-obj-$(CONFIG_CRYPTO_SHA1_SPARC64) += sha1-sparc64.o
 obj-$(CONFIG_CRYPTO_MD5_SPARC64) += md5-sparc64.o
 
 obj-$(CONFIG_CRYPTO_AES_SPARC64) += aes-sparc64.o
 obj-$(CONFIG_CRYPTO_DES_SPARC64) += des-sparc64.o
 obj-$(CONFIG_CRYPTO_CAMELLIA_SPARC64) += camellia-sparc64.o
 
-sha1-sparc64-y := sha1_asm.o sha1_glue.o
 md5-sparc64-y := md5_asm.o md5_glue.o
 
 aes-sparc64-y := aes_asm.o aes_glue.o
 des-sparc64-y := des_asm.o des_glue.o
 camellia-sparc64-y := camellia_asm.o camellia_glue.o
diff --git a/arch/sparc/crypto/sha1_glue.c b/arch/sparc/crypto/sha1_glue.c
deleted file mode 100644
index ef19d5023b1bc..0000000000000
--- a/arch/sparc/crypto/sha1_glue.c
+++ /dev/null
@@ -1,94 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/* Glue code for SHA1 hashing optimized for sparc64 crypto opcodes.
- *
- * This is based largely upon arch/x86/crypto/sha1_ssse3_glue.c
- *
- * Copyright (c) Alan Smithee.
- * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
- * Copyright (c) Jean-Francois Dive <jef@linuxbe.org>
- * Copyright (c) Mathias Krause <minipli@googlemail.com>
- */
-
-#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
-
-#include <asm/elf.h>
-#include <asm/opcodes.h>
-#include <asm/pstate.h>
-#include <crypto/internal/hash.h>
-#include <crypto/sha1.h>
-#include <crypto/sha1_base.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-
-asmlinkage void sha1_sparc64_transform(struct sha1_state *digest,
-				       const u8 *data, int rounds);
-
-static int sha1_sparc64_update(struct shash_desc *desc, const u8 *data,
-			       unsigned int len)
-{
-	return sha1_base_do_update_blocks(desc, data, len,
-					  sha1_sparc64_transform);
-}
-
-/* Add padding and return the message digest. */
-static int sha1_sparc64_finup(struct shash_desc *desc, const u8 *src,
-			      unsigned int len, u8 *out)
-{
-	sha1_base_do_finup(desc, src, len, sha1_sparc64_transform);
-	return sha1_base_finish(desc, out);
-}
-
-static struct shash_alg alg = {
-	.digestsize	=	SHA1_DIGEST_SIZE,
-	.init		=	sha1_base_init,
-	.update		=	sha1_sparc64_update,
-	.finup		=	sha1_sparc64_finup,
-	.descsize	=	SHA1_STATE_SIZE,
-	.base		=	{
-		.cra_name	=	"sha1",
-		.cra_driver_name=	"sha1-sparc64",
-		.cra_priority	=	SPARC_CR_OPCODE_PRIORITY,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY,
-		.cra_blocksize	=	SHA1_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-};
-
-static bool __init sparc64_has_sha1_opcode(void)
-{
-	unsigned long cfr;
-
-	if (!(sparc64_elf_hwcap & HWCAP_SPARC_CRYPTO))
-		return false;
-
-	__asm__ __volatile__("rd %%asr26, %0" : "=r" (cfr));
-	if (!(cfr & CFR_SHA1))
-		return false;
-
-	return true;
-}
-
-static int __init sha1_sparc64_mod_init(void)
-{
-	if (sparc64_has_sha1_opcode()) {
-		pr_info("Using sparc64 sha1 opcode optimized SHA-1 implementation\n");
-		return crypto_register_shash(&alg);
-	}
-	pr_info("sparc64 sha1 opcode not available.\n");
-	return -ENODEV;
-}
-
-static void __exit sha1_sparc64_mod_fini(void)
-{
-	crypto_unregister_shash(&alg);
-}
-
-module_init(sha1_sparc64_mod_init);
-module_exit(sha1_sparc64_mod_fini);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("SHA1 Secure Hash Algorithm, sparc64 sha1 opcode accelerated");
-
-MODULE_ALIAS_CRYPTO("sha1");
-
-#include "crop_devid.c"
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 2c55b75cea525..3405789bebbe6 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -149,10 +149,11 @@ config CRYPTO_LIB_SHA1_ARCH
 	default y if ARM
 	default y if ARM64 && KERNEL_MODE_NEON
 	default y if MIPS && CPU_CAVIUM_OCTEON
 	default y if PPC
 	default y if S390
+	default y if SPARC64
 
 config CRYPTO_LIB_SHA256
 	tristate
 	help
 	  Enable the SHA-256 library interface. This interface may be fulfilled
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 3f4199c079307..6e49e00b4a0a2 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -81,10 +81,11 @@ endif
 libsha1-$(CONFIG_ARM64) += arm64/sha1-ce-core.o
 ifeq ($(CONFIG_PPC),y)
 libsha1-y += powerpc/sha1-powerpc-asm.o
 libsha1-$(CONFIG_SPE) += powerpc/sha1-spe-asm.o
 endif
+libsha1-$(CONFIG_SPARC) += sparc/sha1_asm.o
 endif # CONFIG_CRYPTO_LIB_SHA1_ARCH
 
 ################################################################################
 
 obj-$(CONFIG_CRYPTO_LIB_SHA256) += libsha256.o
diff --git a/lib/crypto/sparc/sha1.h b/lib/crypto/sparc/sha1.h
new file mode 100644
index 0000000000000..5015f93584b7e
--- /dev/null
+++ b/lib/crypto/sparc/sha1.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * SHA-1 accelerated using the sparc64 crypto opcodes
+ *
+ * Copyright (c) Alan Smithee.
+ * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
+ * Copyright (c) Jean-Francois Dive <jef@linuxbe.org>
+ * Copyright (c) Mathias Krause <minipli@googlemail.com>
+ */
+
+#include <asm/elf.h>
+#include <asm/opcodes.h>
+#include <asm/pstate.h>
+
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_sha1_opcodes);
+
+asmlinkage void sha1_sparc64_transform(struct sha1_block_state *state,
+				       const u8 *data, size_t nblocks);
+
+static void sha1_blocks(struct sha1_block_state *state,
+			const u8 *data, size_t nblocks)
+{
+	if (static_branch_likely(&have_sha1_opcodes))
+		sha1_sparc64_transform(state, data, nblocks);
+	else
+		sha1_blocks_generic(state, data, nblocks);
+}
+
+#define sha1_mod_init_arch sha1_mod_init_arch
+static inline void sha1_mod_init_arch(void)
+{
+	unsigned long cfr;
+
+	if (!(sparc64_elf_hwcap & HWCAP_SPARC_CRYPTO))
+		return;
+
+	__asm__ __volatile__("rd %%asr26, %0" : "=r" (cfr));
+	if (!(cfr & CFR_SHA1))
+		return;
+
+	static_branch_enable(&have_sha1_opcodes);
+	pr_info("Using sparc64 sha1 opcode optimized SHA-1 implementation\n");
+}
diff --git a/arch/sparc/crypto/sha1_asm.S b/lib/crypto/sparc/sha1_asm.S
similarity index 100%
rename from arch/sparc/crypto/sha1_asm.S
rename to lib/crypto/sparc/sha1_asm.S
-- 
2.50.1


