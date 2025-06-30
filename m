Return-Path: <linux-mips+bounces-9558-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F969AEE366
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 18:06:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FBD93BE6C6
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 16:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32B7228D85E;
	Mon, 30 Jun 2025 16:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sPwA+9N/"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DC4292B41;
	Mon, 30 Jun 2025 16:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751299526; cv=none; b=cycICQwzkmk5KWMpAbSRJxmB83+1MLobERKpFu78/dte7hDnGNxNhyiYU9yN3ukEo/RDpmX/boqDl0YkV0+I+hboCv2RNeOtFXpCsG7dT2IO0dzuyEwBpmhNl41QKikUzSpzt0qOJR+7TBJwSgJ6QZngOS3A1sOQKBqf2nQQXfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751299526; c=relaxed/simple;
	bh=ErEAgVMHNorw18U5pjaEJsohh5MEwMTo7uVgc9XOnpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B6LHZYV49t5jnqLGj1cut3j9Ura7H27St+p/2/ekB4WYt0Q1RGTH7O8OjP3ZuizPh7tSayc/58Sn132J/wuWoCSaYp1KQxmvOIX1WbKYww55km/UewUNapMr87KY7mg66AEj0ipzq5RwBycwgNMiEqIz/Hj87BUA3N7fXeQ2Wbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sPwA+9N/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44CB1C4CEFB;
	Mon, 30 Jun 2025 16:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299525;
	bh=ErEAgVMHNorw18U5pjaEJsohh5MEwMTo7uVgc9XOnpg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sPwA+9N/PmZU/Vofk/2p3oPfabiSsCi43lD+tpzvnViI7FGuAct966GSovR56bj7v
	 rIygd0nXEyabxAdfm7IBpN+A1mZHlUJDA4rAW2r6J7B2dF0bDHoGZuqeCgy2BAzwGH
	 hkX9QtxPmR78J0O9QJAPb63D53v1CMIgixfJX7QNrEjJGNuVnI9akPZr3NI33feIw3
	 3rwLaJMmhwpJ3Rk0U9TAPMdA+DPhg6Tzqz6gpscv9ubfTC4ar9WpK5RXhb1+GROQ8e
	 DvNwBfUuRJvUeZGw7So6MbbkWl1hU9yz2fq4mbJKKZ4eAWsaD5/7metybDNtJvDlJy
	 chgfgo21R2Rrg==
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
Subject: [PATCH v3 08/16] lib/crypto: arm64/sha512: Migrate optimized SHA-512 code to library
Date: Mon, 30 Jun 2025 09:03:12 -0700
Message-ID: <20250630160320.2888-9-ebiggers@kernel.org>
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

Instead of exposing the arm64-optimized SHA-512 code via arm64-specific
crypto_shash algorithms, instead just implement the sha512_blocks()
library function.  This is much simpler, it makes the SHA-512 (and
SHA-384) library functions be arm64-optimized, and it fixes the
longstanding issue where the arm64-optimized SHA-512 code was disabled
by default.  SHA-512 still remains available through crypto_shash, but
individual architectures no longer need to handle it.

To match sha512_blocks(), change the type of the nblocks parameter of
the assembly functions from int or 'unsigned int' to size_t.  Update the
ARMv8 CE assembly function accordingly.  The scalar assembly function
actually already treated it as size_t.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm64/configs/defconfig                  |  1 -
 arch/arm64/crypto/Kconfig                     | 19 ----
 arch/arm64/crypto/Makefile                    | 14 ---
 arch/arm64/crypto/sha512-ce-glue.c            | 96 -------------------
 arch/arm64/crypto/sha512-glue.c               | 83 ----------------
 lib/crypto/Kconfig                            |  1 +
 lib/crypto/Makefile                           | 10 ++
 lib/crypto/arm64/.gitignore                   |  2 +
 .../crypto/arm64}/sha512-ce-core.S            | 10 +-
 lib/crypto/arm64/sha512.h                     | 46 +++++++++
 10 files changed, 64 insertions(+), 218 deletions(-)
 delete mode 100644 arch/arm64/crypto/sha512-ce-glue.c
 delete mode 100644 arch/arm64/crypto/sha512-glue.c
 create mode 100644 lib/crypto/arm64/.gitignore
 rename {arch/arm64/crypto => lib/crypto/arm64}/sha512-ce-core.S (97%)
 create mode 100644 lib/crypto/arm64/sha512.h

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a91..b612b78b3b091 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1742,11 +1742,10 @@ CONFIG_CRYPTO_ECHAINIV=y
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_ANSI_CPRNG=y
 CONFIG_CRYPTO_USER_API_RNG=m
 CONFIG_CRYPTO_GHASH_ARM64_CE=y
 CONFIG_CRYPTO_SHA1_ARM64_CE=y
-CONFIG_CRYPTO_SHA512_ARM64_CE=m
 CONFIG_CRYPTO_SHA3_ARM64=m
 CONFIG_CRYPTO_SM3_ARM64_CE=m
 CONFIG_CRYPTO_AES_ARM64_CE_BLK=y
 CONFIG_CRYPTO_AES_ARM64_BS=m
 CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
diff --git a/arch/arm64/crypto/Kconfig b/arch/arm64/crypto/Kconfig
index c44b0f202a1f5..a9ead99f72c28 100644
--- a/arch/arm64/crypto/Kconfig
+++ b/arch/arm64/crypto/Kconfig
@@ -34,29 +34,10 @@ config CRYPTO_SHA1_ARM64_CE
 	  SHA-1 secure hash algorithm (FIPS 180)
 
 	  Architecture: arm64 using:
 	  - ARMv8 Crypto Extensions
 
-config CRYPTO_SHA512_ARM64
-	tristate "Hash functions: SHA-384 and SHA-512"
-	select CRYPTO_HASH
-	help
-	  SHA-384 and SHA-512 secure hash algorithms (FIPS 180)
-
-	  Architecture: arm64
-
-config CRYPTO_SHA512_ARM64_CE
-	tristate "Hash functions: SHA-384 and SHA-512 (ARMv8 Crypto Extensions)"
-	depends on KERNEL_MODE_NEON
-	select CRYPTO_HASH
-	select CRYPTO_SHA512_ARM64
-	help
-	  SHA-384 and SHA-512 secure hash algorithms (FIPS 180)
-
-	  Architecture: arm64 using:
-	  - ARMv8 Crypto Extensions
-
 config CRYPTO_SHA3_ARM64
 	tristate "Hash functions: SHA-3 (ARMv8.2 Crypto Extensions)"
 	depends on KERNEL_MODE_NEON
 	select CRYPTO_HASH
 	select CRYPTO_SHA3
diff --git a/arch/arm64/crypto/Makefile b/arch/arm64/crypto/Makefile
index c231c980c5142..228101f125d50 100644
--- a/arch/arm64/crypto/Makefile
+++ b/arch/arm64/crypto/Makefile
@@ -6,13 +6,10 @@
 #
 
 obj-$(CONFIG_CRYPTO_SHA1_ARM64_CE) += sha1-ce.o
 sha1-ce-y := sha1-ce-glue.o sha1-ce-core.o
 
-obj-$(CONFIG_CRYPTO_SHA512_ARM64_CE) += sha512-ce.o
-sha512-ce-y := sha512-ce-glue.o sha512-ce-core.o
-
 obj-$(CONFIG_CRYPTO_SHA3_ARM64) += sha3-ce.o
 sha3-ce-y := sha3-ce-glue.o sha3-ce-core.o
 
 obj-$(CONFIG_CRYPTO_SM3_NEON) += sm3-neon.o
 sm3-neon-y := sm3-neon-glue.o sm3-neon-core.o
@@ -51,24 +48,13 @@ obj-$(CONFIG_CRYPTO_AES_ARM64_CE_BLK) += aes-ce-blk.o
 aes-ce-blk-y := aes-glue-ce.o aes-ce.o
 
 obj-$(CONFIG_CRYPTO_AES_ARM64_NEON_BLK) += aes-neon-blk.o
 aes-neon-blk-y := aes-glue-neon.o aes-neon.o
 
-obj-$(CONFIG_CRYPTO_SHA512_ARM64) += sha512-arm64.o
-sha512-arm64-y := sha512-glue.o sha512-core.o
-
 obj-$(CONFIG_CRYPTO_NHPOLY1305_NEON) += nhpoly1305-neon.o
 nhpoly1305-neon-y := nh-neon-core.o nhpoly1305-neon-glue.o
 
 obj-$(CONFIG_CRYPTO_AES_ARM64) += aes-arm64.o
 aes-arm64-y := aes-cipher-core.o aes-cipher-glue.o
 
 obj-$(CONFIG_CRYPTO_AES_ARM64_BS) += aes-neon-bs.o
 aes-neon-bs-y := aes-neonbs-core.o aes-neonbs-glue.o
-
-quiet_cmd_perlasm = PERLASM $@
-      cmd_perlasm = $(PERL) $(<) void $(@)
-
-$(obj)/sha512-core.S: $(src)/../lib/crypto/sha2-armv8.pl
-	$(call cmd,perlasm)
-
-clean-files += sha512-core.S
diff --git a/arch/arm64/crypto/sha512-ce-glue.c b/arch/arm64/crypto/sha512-ce-glue.c
deleted file mode 100644
index 6fb3001fa2c9b..0000000000000
--- a/arch/arm64/crypto/sha512-ce-glue.c
+++ /dev/null
@@ -1,96 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * sha512-ce-glue.c - SHA-384/SHA-512 using ARMv8 Crypto Extensions
- *
- * Copyright (C) 2018 Linaro Ltd <ard.biesheuvel@linaro.org>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- */
-
-#include <asm/neon.h>
-#include <crypto/internal/hash.h>
-#include <crypto/sha2.h>
-#include <crypto/sha512_base.h>
-#include <linux/cpufeature.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-
-MODULE_DESCRIPTION("SHA-384/SHA-512 secure hash using ARMv8 Crypto Extensions");
-MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
-MODULE_LICENSE("GPL v2");
-MODULE_ALIAS_CRYPTO("sha384");
-MODULE_ALIAS_CRYPTO("sha512");
-
-asmlinkage int __sha512_ce_transform(struct sha512_state *sst, u8 const *src,
-				     int blocks);
-
-static void sha512_ce_transform(struct sha512_state *sst, u8 const *src,
-				int blocks)
-{
-	do {
-		int rem;
-
-		kernel_neon_begin();
-		rem = __sha512_ce_transform(sst, src, blocks);
-		kernel_neon_end();
-		src += (blocks - rem) * SHA512_BLOCK_SIZE;
-		blocks = rem;
-	} while (blocks);
-}
-
-static int sha512_ce_update(struct shash_desc *desc, const u8 *data,
-			    unsigned int len)
-{
-	return sha512_base_do_update_blocks(desc, data, len,
-					    sha512_ce_transform);
-}
-
-static int sha512_ce_finup(struct shash_desc *desc, const u8 *data,
-			   unsigned int len, u8 *out)
-{
-	sha512_base_do_finup(desc, data, len, sha512_ce_transform);
-	return sha512_base_finish(desc, out);
-}
-
-static struct shash_alg algs[] = { {
-	.init			= sha384_base_init,
-	.update			= sha512_ce_update,
-	.finup			= sha512_ce_finup,
-	.descsize		= SHA512_STATE_SIZE,
-	.digestsize		= SHA384_DIGEST_SIZE,
-	.base.cra_name		= "sha384",
-	.base.cra_driver_name	= "sha384-ce",
-	.base.cra_priority	= 200,
-	.base.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY |
-				  CRYPTO_AHASH_ALG_FINUP_MAX,
-	.base.cra_blocksize	= SHA512_BLOCK_SIZE,
-	.base.cra_module	= THIS_MODULE,
-}, {
-	.init			= sha512_base_init,
-	.update			= sha512_ce_update,
-	.finup			= sha512_ce_finup,
-	.descsize		= SHA512_STATE_SIZE,
-	.digestsize		= SHA512_DIGEST_SIZE,
-	.base.cra_name		= "sha512",
-	.base.cra_driver_name	= "sha512-ce",
-	.base.cra_priority	= 200,
-	.base.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY |
-				  CRYPTO_AHASH_ALG_FINUP_MAX,
-	.base.cra_blocksize	= SHA512_BLOCK_SIZE,
-	.base.cra_module	= THIS_MODULE,
-} };
-
-static int __init sha512_ce_mod_init(void)
-{
-	return crypto_register_shashes(algs, ARRAY_SIZE(algs));
-}
-
-static void __exit sha512_ce_mod_fini(void)
-{
-	crypto_unregister_shashes(algs, ARRAY_SIZE(algs));
-}
-
-module_cpu_feature_match(SHA512, sha512_ce_mod_init);
-module_exit(sha512_ce_mod_fini);
diff --git a/arch/arm64/crypto/sha512-glue.c b/arch/arm64/crypto/sha512-glue.c
deleted file mode 100644
index a78e184c100fa..0000000000000
--- a/arch/arm64/crypto/sha512-glue.c
+++ /dev/null
@@ -1,83 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Linux/arm64 port of the OpenSSL SHA512 implementation for AArch64
- *
- * Copyright (c) 2016 Linaro Ltd. <ard.biesheuvel@linaro.org>
- */
-
-#include <crypto/internal/hash.h>
-#include <crypto/sha2.h>
-#include <crypto/sha512_base.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-
-MODULE_DESCRIPTION("SHA-384/SHA-512 secure hash for arm64");
-MODULE_AUTHOR("Andy Polyakov <appro@openssl.org>");
-MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
-MODULE_LICENSE("GPL v2");
-MODULE_ALIAS_CRYPTO("sha384");
-MODULE_ALIAS_CRYPTO("sha512");
-
-asmlinkage void sha512_blocks_arch(u64 *digest, const void *data,
-				   unsigned int num_blks);
-
-static void sha512_arm64_transform(struct sha512_state *sst, u8 const *src,
-				   int blocks)
-{
-	sha512_blocks_arch(sst->state, src, blocks);
-}
-
-static int sha512_update_arm64(struct shash_desc *desc, const u8 *data,
-			       unsigned int len)
-{
-	return sha512_base_do_update_blocks(desc, data, len,
-					    sha512_arm64_transform);
-}
-
-static int sha512_finup(struct shash_desc *desc, const u8 *data,
-			unsigned int len, u8 *out)
-{
-	sha512_base_do_finup(desc, data, len, sha512_arm64_transform);
-	return sha512_base_finish(desc, out);
-}
-
-static struct shash_alg algs[] = { {
-	.digestsize		= SHA512_DIGEST_SIZE,
-	.init			= sha512_base_init,
-	.update			= sha512_update_arm64,
-	.finup			= sha512_finup,
-	.descsize		= SHA512_STATE_SIZE,
-	.base.cra_name		= "sha512",
-	.base.cra_driver_name	= "sha512-arm64",
-	.base.cra_priority	= 150,
-	.base.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY |
-				  CRYPTO_AHASH_ALG_FINUP_MAX,
-	.base.cra_blocksize	= SHA512_BLOCK_SIZE,
-	.base.cra_module	= THIS_MODULE,
-}, {
-	.digestsize		= SHA384_DIGEST_SIZE,
-	.init			= sha384_base_init,
-	.update			= sha512_update_arm64,
-	.finup			= sha512_finup,
-	.descsize		= SHA512_STATE_SIZE,
-	.base.cra_name		= "sha384",
-	.base.cra_driver_name	= "sha384-arm64",
-	.base.cra_priority	= 150,
-	.base.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY |
-				  CRYPTO_AHASH_ALG_FINUP_MAX,
-	.base.cra_blocksize	= SHA384_BLOCK_SIZE,
-	.base.cra_module	= THIS_MODULE,
-} };
-
-static int __init sha512_mod_init(void)
-{
-	return crypto_register_shashes(algs, ARRAY_SIZE(algs));
-}
-
-static void __exit sha512_mod_fini(void)
-{
-	crypto_unregister_shashes(algs, ARRAY_SIZE(algs));
-}
-
-module_init(sha512_mod_init);
-module_exit(sha512_mod_fini);
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index dac6356ba0aac..26413f679fab2 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -176,10 +176,11 @@ config CRYPTO_LIB_SHA512
 
 config CRYPTO_LIB_SHA512_ARCH
 	bool
 	depends on CRYPTO_LIB_SHA512 && !UML
 	default y if ARM && !CPU_V7M
+	default y if ARM64
 
 config CRYPTO_LIB_SM3
 	tristate
 
 if !KMSAN # avoid false positives from assembly
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 67008a1612c6f..22269ab06d700 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -3,10 +3,13 @@
 aflags-thumb2-$(CONFIG_THUMB2_KERNEL)  := -U__thumb2__ -D__thumb2__=1
 
 quiet_cmd_perlasm = PERLASM $@
       cmd_perlasm = $(PERL) $(<) > $(@)
 
+quiet_cmd_perlasm_with_args = PERLASM $@
+      cmd_perlasm_with_args = $(PERL) $(<) void $(@)
+
 obj-$(CONFIG_CRYPTO_LIB_UTILS)			+= libcryptoutils.o
 libcryptoutils-y				:= memneq.o utils.o
 
 # chacha is used by the /dev/random driver which is always builtin
 obj-y						+= chacha.o
@@ -80,10 +83,17 @@ $(obj)/arm/sha512-core.S: $(src)/arm/sha512-armv4.pl
 	$(call cmd,perlasm)
 clean-files += arm/sha512-core.S
 AFLAGS_arm/sha512-core.o += $(aflags-thumb2-y)
 endif
 
+ifeq ($(CONFIG_ARM64),y)
+libsha512-y += arm64/sha512-core.o
+$(obj)/arm64/sha512-core.S: $(src)/../../arch/arm64/lib/crypto/sha2-armv8.pl
+	$(call cmd,perlasm_with_args)
+clean-files += arm64/sha512-core.S
+libsha512-$(CONFIG_KERNEL_MODE_NEON) += arm64/sha512-ce-core.o
+endif
 endif # CONFIG_CRYPTO_LIB_SHA512_ARCH
 
 obj-$(CONFIG_MPILIB) += mpi/
 
 obj-$(CONFIG_CRYPTO_SELFTESTS_FULL)		+= simd.o
diff --git a/lib/crypto/arm64/.gitignore b/lib/crypto/arm64/.gitignore
new file mode 100644
index 0000000000000..670a4d97b5684
--- /dev/null
+++ b/lib/crypto/arm64/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+sha512-core.S
diff --git a/arch/arm64/crypto/sha512-ce-core.S b/lib/crypto/arm64/sha512-ce-core.S
similarity index 97%
rename from arch/arm64/crypto/sha512-ce-core.S
rename to lib/crypto/arm64/sha512-ce-core.S
index 91ef68b15fcc6..7d870a435ea38 100644
--- a/arch/arm64/crypto/sha512-ce-core.S
+++ b/lib/crypto/arm64/sha512-ce-core.S
@@ -100,12 +100,12 @@
 	add		v\i4\().2d, v\i1\().2d, v\i3\().2d
 	sha512h2	q\i3, q\i1, v\i0\().2d
 	.endm
 
 	/*
-	 * int __sha512_ce_transform(struct sha512_state *sst, u8 const *src,
-	 *			     int blocks)
+	 * size_t __sha512_ce_transform(struct sha512_block_state *state,
+	 *				const u8 *data, size_t nblocks);
 	 */
 	.text
 SYM_FUNC_START(__sha512_ce_transform)
 	/* load state */
 	ld1		{v8.2d-v11.2d}, [x0]
@@ -115,11 +115,11 @@ SYM_FUNC_START(__sha512_ce_transform)
 	ld1		{v20.2d-v23.2d}, [x3], #64
 
 	/* load input */
 0:	ld1		{v12.2d-v15.2d}, [x1], #64
 	ld1		{v16.2d-v19.2d}, [x1], #64
-	sub		w2, w2, #1
+	sub		x2, x2, #1
 
 CPU_LE(	rev64		v12.16b, v12.16b	)
 CPU_LE(	rev64		v13.16b, v13.16b	)
 CPU_LE(	rev64		v14.16b, v14.16b	)
 CPU_LE(	rev64		v15.16b, v15.16b	)
@@ -195,12 +195,12 @@ CPU_LE(	rev64		v19.16b, v19.16b	)
 	add		v10.2d, v10.2d, v2.2d
 	add		v11.2d, v11.2d, v3.2d
 
 	cond_yield	3f, x4, x5
 	/* handled all input blocks? */
-	cbnz		w2, 0b
+	cbnz		x2, 0b
 
 	/* store new state */
 3:	st1		{v8.2d-v11.2d}, [x0]
-	mov		w0, w2
+	mov		x0, x2
 	ret
 SYM_FUNC_END(__sha512_ce_transform)
diff --git a/lib/crypto/arm64/sha512.h b/lib/crypto/arm64/sha512.h
new file mode 100644
index 0000000000000..eae14f9752e0b
--- /dev/null
+++ b/lib/crypto/arm64/sha512.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * arm64-optimized SHA-512 block function
+ *
+ * Copyright 2025 Google LLC
+ */
+
+#include <asm/neon.h>
+#include <crypto/internal/simd.h>
+#include <linux/cpufeature.h>
+
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_sha512_insns);
+
+asmlinkage void sha512_blocks_arch(struct sha512_block_state *state,
+				   const u8 *data, size_t nblocks);
+asmlinkage size_t __sha512_ce_transform(struct sha512_block_state *state,
+					const u8 *data, size_t nblocks);
+
+static void sha512_blocks(struct sha512_block_state *state,
+			  const u8 *data, size_t nblocks)
+{
+	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
+	    static_branch_likely(&have_sha512_insns) &&
+	    likely(crypto_simd_usable())) {
+		do {
+			size_t rem;
+
+			kernel_neon_begin();
+			rem = __sha512_ce_transform(state, data, nblocks);
+			kernel_neon_end();
+			data += (nblocks - rem) * SHA512_BLOCK_SIZE;
+			nblocks = rem;
+		} while (nblocks);
+	} else {
+		sha512_blocks_arch(state, data, nblocks);
+	}
+}
+
+#ifdef CONFIG_KERNEL_MODE_NEON
+#define sha512_mod_init_arch sha512_mod_init_arch
+static inline void sha512_mod_init_arch(void)
+{
+	if (cpu_have_named_feature(SHA512))
+		static_branch_enable(&have_sha512_insns);
+}
+#endif /* CONFIG_KERNEL_MODE_NEON */
-- 
2.50.0


