Return-Path: <linux-mips+bounces-9557-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C34BFAEE355
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 18:06:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08DBA17D6C7
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 16:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C080D292B49;
	Mon, 30 Jun 2025 16:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NGd3wu7j"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB02292B3E;
	Mon, 30 Jun 2025 16:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751299525; cv=none; b=sNdzRjuSkBfOvnutMpDULDlzeHmjBZRwekY1xou9u5+iT6CC1hjal30sQEyrTuifCfgka6nvv9iuHjXmUI0uofXliQIqU4B+1hwYJKGDr/oAEiyTnGKjM1cz+Pj+GBs5+YEnGB4Bp/weXVmhFVkkcmYbVxPKYCS0nXAZY+jsbo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751299525; c=relaxed/simple;
	bh=/omQk0AnfhMvcqecsM2I25KnqR+dVzBwTNmX31ZnD+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nb9yuRWUBZQb/WpKJx8K7UH7t2kmO4JTSwTI9PEa9g8nTPgS3PHwwxHYL1wGkxMGUGDttKobETwEEXWWbDPuiNmFRrtOB1HaRTAYCyBB/7Qrqj4ZYEXYCrRob5LbBQOWx/pihw9Se+itdMUs/5gMhp0I1EUZXx2OvcTIN7cjhJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NGd3wu7j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5FF6C4CEF2;
	Mon, 30 Jun 2025 16:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299525;
	bh=/omQk0AnfhMvcqecsM2I25KnqR+dVzBwTNmX31ZnD+I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NGd3wu7j7sKL/um4b0OWMF3aaE1syWgvDA5LSmZu/ZEMkWrHGFx5Flqi2slW0qtbL
	 arqlfH9D5NG5oIEsZF9jmUx72q45G1nToNEKH6CG1qveaSA3P1JZqovBbs6uCVqwG8
	 OqsoJF4Hy1qvMOuDVU/BDXxNNdMtzYtc1hdNpwwTz+f8hXDYp3DuUl1UXPKANwrmCB
	 Af4f9v7fy29lTX4Jkuy93oiWuCPdd6alLUPYcUtOvQrPfb8r9hyD8M2vNmiuIKurch
	 AUD0EynZj16eH/R2qERsVARGCFnnpQFS9CoblAbmnWfdN8iJTB2MJupQE3JXx4Hld9
	 9q1aI4pemzf6A==
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
Subject: [PATCH v3 07/16] lib/crypto: arm/sha512: Migrate optimized SHA-512 code to library
Date: Mon, 30 Jun 2025 09:03:11 -0700
Message-ID: <20250630160320.2888-8-ebiggers@kernel.org>
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

Instead of exposing the arm-optimized SHA-512 code via arm-specific
crypto_shash algorithms, instead just implement the sha512_blocks()
library function.  This is much simpler, it makes the SHA-512 (and
SHA-384) library functions be arm-optimized, and it fixes the
longstanding issue where the arm-optimized SHA-512 code was disabled by
default.  SHA-512 still remains available through crypto_shash, but
individual architectures no longer need to handle it.

To match sha512_blocks(), change the type of the nblocks parameter of
the assembly functions from int to size_t.  The assembly functions
actually already treated it as size_t.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm/configs/exynos_defconfig             |   1 -
 arch/arm/configs/milbeaut_m10v_defconfig      |   1 -
 arch/arm/configs/multi_v7_defconfig           |   1 -
 arch/arm/configs/omap2plus_defconfig          |   1 -
 arch/arm/configs/pxa_defconfig                |   1 -
 arch/arm/crypto/Kconfig                       |  10 --
 arch/arm/crypto/Makefile                      |  15 ---
 arch/arm/crypto/sha512-glue.c                 | 110 ------------------
 arch/arm/crypto/sha512-neon-glue.c            |  75 ------------
 arch/arm/crypto/sha512.h                      |   3 -
 lib/crypto/Kconfig                            |   1 +
 lib/crypto/Makefile                           |  14 +++
 lib/crypto/arm/.gitignore                     |   2 +
 .../crypto => lib/crypto/arm}/sha512-armv4.pl |   0
 lib/crypto/arm/sha512.h                       |  38 ++++++
 15 files changed, 55 insertions(+), 218 deletions(-)
 delete mode 100644 arch/arm/crypto/sha512-glue.c
 delete mode 100644 arch/arm/crypto/sha512-neon-glue.c
 delete mode 100644 arch/arm/crypto/sha512.h
 create mode 100644 lib/crypto/arm/.gitignore
 rename {arch/arm/crypto => lib/crypto/arm}/sha512-armv4.pl (100%)
 create mode 100644 lib/crypto/arm/sha512.h

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index f71af368674cf..d58e300693045 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -362,11 +362,10 @@ CONFIG_CRYPTO_LZ4=m
 CONFIG_CRYPTO_USER_API_HASH=m
 CONFIG_CRYPTO_USER_API_SKCIPHER=m
 CONFIG_CRYPTO_USER_API_RNG=m
 CONFIG_CRYPTO_USER_API_AEAD=m
 CONFIG_CRYPTO_SHA1_ARM_NEON=m
-CONFIG_CRYPTO_SHA512_ARM=m
 CONFIG_CRYPTO_AES_ARM_BS=m
 CONFIG_CRYPTO_CHACHA20_NEON=m
 CONFIG_CRYPTO_DEV_EXYNOS_RNG=y
 CONFIG_CRYPTO_DEV_S5P=y
 CONFIG_DMA_CMA=y
diff --git a/arch/arm/configs/milbeaut_m10v_defconfig b/arch/arm/configs/milbeaut_m10v_defconfig
index 242e7d5a3f682..8ebf8bd872fe8 100644
--- a/arch/arm/configs/milbeaut_m10v_defconfig
+++ b/arch/arm/configs/milbeaut_m10v_defconfig
@@ -98,11 +98,10 @@ CONFIG_CRYPTO_SELFTESTS=y
 CONFIG_CRYPTO_AES=y
 CONFIG_CRYPTO_SEQIV=m
 CONFIG_CRYPTO_GHASH_ARM_CE=m
 CONFIG_CRYPTO_SHA1_ARM_NEON=m
 CONFIG_CRYPTO_SHA1_ARM_CE=m
-CONFIG_CRYPTO_SHA512_ARM=m
 CONFIG_CRYPTO_AES_ARM=m
 CONFIG_CRYPTO_AES_ARM_BS=m
 CONFIG_CRYPTO_AES_ARM_CE=m
 CONFIG_CRYPTO_CHACHA20_NEON=m
 # CONFIG_CRYPTO_HW is not set
diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 50c170b4619f7..3fd07e864ca85 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1280,11 +1280,10 @@ CONFIG_CRYPTO_USER_API_SKCIPHER=m
 CONFIG_CRYPTO_USER_API_RNG=m
 CONFIG_CRYPTO_USER_API_AEAD=m
 CONFIG_CRYPTO_GHASH_ARM_CE=m
 CONFIG_CRYPTO_SHA1_ARM_NEON=m
 CONFIG_CRYPTO_SHA1_ARM_CE=m
-CONFIG_CRYPTO_SHA512_ARM=m
 CONFIG_CRYPTO_AES_ARM=m
 CONFIG_CRYPTO_AES_ARM_BS=m
 CONFIG_CRYPTO_AES_ARM_CE=m
 CONFIG_CRYPTO_CHACHA20_NEON=m
 CONFIG_CRYPTO_DEV_SUN4I_SS=m
diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
index 9f9780c8e62aa..530dfb8338c98 100644
--- a/arch/arm/configs/omap2plus_defconfig
+++ b/arch/arm/configs/omap2plus_defconfig
@@ -703,11 +703,10 @@ CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_SECURITY=y
 CONFIG_CRYPTO_MICHAEL_MIC=y
 CONFIG_CRYPTO_GHASH_ARM_CE=m
 CONFIG_CRYPTO_SHA1_ARM_NEON=m
-CONFIG_CRYPTO_SHA512_ARM=m
 CONFIG_CRYPTO_AES_ARM=m
 CONFIG_CRYPTO_AES_ARM_BS=m
 CONFIG_CRYPTO_CHACHA20_NEON=m
 CONFIG_CRYPTO_DEV_OMAP=m
 CONFIG_CRYPTO_DEV_OMAP_SHAM=m
diff --git a/arch/arm/configs/pxa_defconfig b/arch/arm/configs/pxa_defconfig
index ff29c5b0e9c93..eaa44574d4a64 100644
--- a/arch/arm/configs/pxa_defconfig
+++ b/arch/arm/configs/pxa_defconfig
@@ -657,11 +657,10 @@ CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_XCBC=m
 CONFIG_CRYPTO_DEFLATE=y
 CONFIG_CRYPTO_LZO=y
 CONFIG_CRYPTO_SHA1_ARM=m
-CONFIG_CRYPTO_SHA512_ARM=m
 CONFIG_CRYPTO_AES_ARM=m
 CONFIG_FONTS=y
 CONFIG_FONT_8x8=y
 CONFIG_FONT_8x16=y
 CONFIG_FONT_6x11=y
diff --git a/arch/arm/crypto/Kconfig b/arch/arm/crypto/Kconfig
index 7efb9a8596e4e..a18f97f1597cb 100644
--- a/arch/arm/crypto/Kconfig
+++ b/arch/arm/crypto/Kconfig
@@ -91,20 +91,10 @@ config CRYPTO_SHA1_ARM_CE
 	help
 	  SHA-1 secure hash algorithm (FIPS 180)
 
 	  Architecture: arm using ARMv8 Crypto Extensions
 
-config CRYPTO_SHA512_ARM
-	tristate "Hash functions: SHA-384 and SHA-512 (NEON)"
-	select CRYPTO_HASH
-	depends on !CPU_V7M
-	help
-	  SHA-384 and SHA-512 secure hash algorithms (FIPS 180)
-
-	  Architecture: arm using
-	  - NEON (Advanced SIMD) extensions
-
 config CRYPTO_AES_ARM
 	tristate "Ciphers: AES"
 	select CRYPTO_ALGAPI
 	select CRYPTO_AES
 	help
diff --git a/arch/arm/crypto/Makefile b/arch/arm/crypto/Makefile
index 8479137c6e800..78a4042d8761c 100644
--- a/arch/arm/crypto/Makefile
+++ b/arch/arm/crypto/Makefile
@@ -5,11 +5,10 @@
 
 obj-$(CONFIG_CRYPTO_AES_ARM) += aes-arm.o
 obj-$(CONFIG_CRYPTO_AES_ARM_BS) += aes-arm-bs.o
 obj-$(CONFIG_CRYPTO_SHA1_ARM) += sha1-arm.o
 obj-$(CONFIG_CRYPTO_SHA1_ARM_NEON) += sha1-arm-neon.o
-obj-$(CONFIG_CRYPTO_SHA512_ARM) += sha512-arm.o
 obj-$(CONFIG_CRYPTO_BLAKE2B_NEON) += blake2b-neon.o
 obj-$(CONFIG_CRYPTO_NHPOLY1305_NEON) += nhpoly1305-neon.o
 obj-$(CONFIG_CRYPTO_CURVE25519_NEON) += curve25519-neon.o
 
 obj-$(CONFIG_CRYPTO_AES_ARM_CE) += aes-arm-ce.o
@@ -18,25 +17,11 @@ obj-$(CONFIG_CRYPTO_GHASH_ARM_CE) += ghash-arm-ce.o
 
 aes-arm-y	:= aes-cipher-core.o aes-cipher-glue.o
 aes-arm-bs-y	:= aes-neonbs-core.o aes-neonbs-glue.o
 sha1-arm-y	:= sha1-armv4-large.o sha1_glue.o
 sha1-arm-neon-y	:= sha1-armv7-neon.o sha1_neon_glue.o
-sha512-arm-neon-$(CONFIG_KERNEL_MODE_NEON) := sha512-neon-glue.o
-sha512-arm-y	:= sha512-core.o sha512-glue.o $(sha512-arm-neon-y)
 blake2b-neon-y  := blake2b-neon-core.o blake2b-neon-glue.o
 sha1-arm-ce-y	:= sha1-ce-core.o sha1-ce-glue.o
 aes-arm-ce-y	:= aes-ce-core.o aes-ce-glue.o
 ghash-arm-ce-y	:= ghash-ce-core.o ghash-ce-glue.o
 nhpoly1305-neon-y := nh-neon-core.o nhpoly1305-neon-glue.o
 curve25519-neon-y := curve25519-core.o curve25519-glue.o
-
-quiet_cmd_perl = PERL    $@
-      cmd_perl = $(PERL) $(<) > $(@)
-
-$(obj)/%-core.S: $(src)/%-armv4.pl
-	$(call cmd,perl)
-
-clean-files += sha512-core.S
-
-aflags-thumb2-$(CONFIG_THUMB2_KERNEL)  := -U__thumb2__ -D__thumb2__=1
-
-AFLAGS_sha512-core.o += $(aflags-thumb2-y)
diff --git a/arch/arm/crypto/sha512-glue.c b/arch/arm/crypto/sha512-glue.c
deleted file mode 100644
index f8a6480889b1b..0000000000000
--- a/arch/arm/crypto/sha512-glue.c
+++ /dev/null
@@ -1,110 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * sha512-glue.c - accelerated SHA-384/512 for ARM
- *
- * Copyright (C) 2015 Linaro Ltd <ard.biesheuvel@linaro.org>
- */
-
-#include <asm/hwcap.h>
-#include <asm/neon.h>
-#include <crypto/internal/hash.h>
-#include <crypto/sha2.h>
-#include <crypto/sha512_base.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-
-#include "sha512.h"
-
-MODULE_DESCRIPTION("Accelerated SHA-384/SHA-512 secure hash for ARM");
-MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
-MODULE_LICENSE("GPL v2");
-
-MODULE_ALIAS_CRYPTO("sha384");
-MODULE_ALIAS_CRYPTO("sha512");
-MODULE_ALIAS_CRYPTO("sha384-arm");
-MODULE_ALIAS_CRYPTO("sha512-arm");
-
-asmlinkage void sha512_block_data_order(struct sha512_state *state,
-					u8 const *src, int blocks);
-
-static int sha512_arm_update(struct shash_desc *desc, const u8 *data,
-			     unsigned int len)
-{
-	return sha512_base_do_update_blocks(desc, data, len,
-					    sha512_block_data_order);
-}
-
-static int sha512_arm_finup(struct shash_desc *desc, const u8 *data,
-			    unsigned int len, u8 *out)
-{
-	sha512_base_do_finup(desc, data, len, sha512_block_data_order);
-	return sha512_base_finish(desc, out);
-}
-
-static struct shash_alg sha512_arm_algs[] = { {
-	.init			= sha384_base_init,
-	.update			= sha512_arm_update,
-	.finup			= sha512_arm_finup,
-	.descsize		= SHA512_STATE_SIZE,
-	.digestsize		= SHA384_DIGEST_SIZE,
-	.base			= {
-		.cra_name		= "sha384",
-		.cra_driver_name	= "sha384-arm",
-		.cra_priority		= 250,
-		.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY |
-					  CRYPTO_AHASH_ALG_FINUP_MAX,
-		.cra_blocksize		= SHA512_BLOCK_SIZE,
-		.cra_module		= THIS_MODULE,
-	}
-},  {
-	.init			= sha512_base_init,
-	.update			= sha512_arm_update,
-	.finup			= sha512_arm_finup,
-	.descsize		= SHA512_STATE_SIZE,
-	.digestsize		= SHA512_DIGEST_SIZE,
-	.base			= {
-		.cra_name		= "sha512",
-		.cra_driver_name	= "sha512-arm",
-		.cra_priority		= 250,
-		.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY |
-					  CRYPTO_AHASH_ALG_FINUP_MAX,
-		.cra_blocksize		= SHA512_BLOCK_SIZE,
-		.cra_module		= THIS_MODULE,
-	}
-} };
-
-static int __init sha512_arm_mod_init(void)
-{
-	int err;
-
-	err = crypto_register_shashes(sha512_arm_algs,
-				      ARRAY_SIZE(sha512_arm_algs));
-	if (err)
-		return err;
-
-	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) && cpu_has_neon()) {
-		err = crypto_register_shashes(sha512_neon_algs,
-					      ARRAY_SIZE(sha512_neon_algs));
-		if (err)
-			goto err_unregister;
-	}
-	return 0;
-
-err_unregister:
-	crypto_unregister_shashes(sha512_arm_algs,
-				  ARRAY_SIZE(sha512_arm_algs));
-
-	return err;
-}
-
-static void __exit sha512_arm_mod_fini(void)
-{
-	crypto_unregister_shashes(sha512_arm_algs,
-				  ARRAY_SIZE(sha512_arm_algs));
-	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) && cpu_has_neon())
-		crypto_unregister_shashes(sha512_neon_algs,
-					  ARRAY_SIZE(sha512_neon_algs));
-}
-
-module_init(sha512_arm_mod_init);
-module_exit(sha512_arm_mod_fini);
diff --git a/arch/arm/crypto/sha512-neon-glue.c b/arch/arm/crypto/sha512-neon-glue.c
deleted file mode 100644
index bd528077fefbf..0000000000000
--- a/arch/arm/crypto/sha512-neon-glue.c
+++ /dev/null
@@ -1,75 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * sha512-neon-glue.c - accelerated SHA-384/512 for ARM NEON
- *
- * Copyright (C) 2015 Linaro Ltd <ard.biesheuvel@linaro.org>
- */
-
-#include <asm/neon.h>
-#include <crypto/internal/hash.h>
-#include <crypto/sha2.h>
-#include <crypto/sha512_base.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-
-#include "sha512.h"
-
-MODULE_ALIAS_CRYPTO("sha384-neon");
-MODULE_ALIAS_CRYPTO("sha512-neon");
-
-asmlinkage void sha512_block_data_order_neon(struct sha512_state *state,
-					     const u8 *src, int blocks);
-
-static int sha512_neon_update(struct shash_desc *desc, const u8 *data,
-			      unsigned int len)
-{
-	int remain;
-
-	kernel_neon_begin();
-	remain = sha512_base_do_update_blocks(desc, data, len,
-					      sha512_block_data_order_neon);
-	kernel_neon_end();
-	return remain;
-}
-
-static int sha512_neon_finup(struct shash_desc *desc, const u8 *data,
-			     unsigned int len, u8 *out)
-{
-	kernel_neon_begin();
-	sha512_base_do_finup(desc, data, len, sha512_block_data_order_neon);
-	kernel_neon_end();
-	return sha512_base_finish(desc, out);
-}
-
-struct shash_alg sha512_neon_algs[] = { {
-	.init			= sha384_base_init,
-	.update			= sha512_neon_update,
-	.finup			= sha512_neon_finup,
-	.descsize		= SHA512_STATE_SIZE,
-	.digestsize		= SHA384_DIGEST_SIZE,
-	.base			= {
-		.cra_name		= "sha384",
-		.cra_driver_name	= "sha384-neon",
-		.cra_priority		= 300,
-		.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY |
-					  CRYPTO_AHASH_ALG_FINUP_MAX,
-		.cra_blocksize		= SHA384_BLOCK_SIZE,
-		.cra_module		= THIS_MODULE,
-
-	}
-},  {
-	.init			= sha512_base_init,
-	.update			= sha512_neon_update,
-	.finup			= sha512_neon_finup,
-	.descsize		= SHA512_STATE_SIZE,
-	.digestsize		= SHA512_DIGEST_SIZE,
-	.base			= {
-		.cra_name		= "sha512",
-		.cra_driver_name	= "sha512-neon",
-		.cra_priority		= 300,
-		.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY |
-					  CRYPTO_AHASH_ALG_FINUP_MAX,
-		.cra_blocksize		= SHA512_BLOCK_SIZE,
-		.cra_module		= THIS_MODULE,
-	}
-} };
diff --git a/arch/arm/crypto/sha512.h b/arch/arm/crypto/sha512.h
deleted file mode 100644
index eeaee52cda69b..0000000000000
--- a/arch/arm/crypto/sha512.h
+++ /dev/null
@@ -1,3 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-
-extern struct shash_alg sha512_neon_algs[2];
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index d1bee3787eb3c..dac6356ba0aac 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -175,10 +175,11 @@ config CRYPTO_LIB_SHA512
 	  <crypto/sha2.h>.
 
 config CRYPTO_LIB_SHA512_ARCH
 	bool
 	depends on CRYPTO_LIB_SHA512 && !UML
+	default y if ARM && !CPU_V7M
 
 config CRYPTO_LIB_SM3
 	tristate
 
 if !KMSAN # avoid false positives from assembly
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index f6b6f370451ec..67008a1612c6f 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -1,7 +1,12 @@
 # SPDX-License-Identifier: GPL-2.0
 
+aflags-thumb2-$(CONFIG_THUMB2_KERNEL)  := -U__thumb2__ -D__thumb2__=1
+
+quiet_cmd_perlasm = PERLASM $@
+      cmd_perlasm = $(PERL) $(<) > $(@)
+
 obj-$(CONFIG_CRYPTO_LIB_UTILS)			+= libcryptoutils.o
 libcryptoutils-y				:= memneq.o utils.o
 
 # chacha is used by the /dev/random driver which is always builtin
 obj-y						+= chacha.o
@@ -66,10 +71,19 @@ libsha256-generic-y				:= sha256-generic.o
 
 obj-$(CONFIG_CRYPTO_LIB_SHA512) += libsha512.o
 libsha512-y := sha512.o
 ifeq ($(CONFIG_CRYPTO_LIB_SHA512_ARCH),y)
 CFLAGS_sha512.o += -I$(src)/$(SRCARCH)
+
+ifeq ($(CONFIG_ARM),y)
+libsha512-y += arm/sha512-core.o
+$(obj)/arm/sha512-core.S: $(src)/arm/sha512-armv4.pl
+	$(call cmd,perlasm)
+clean-files += arm/sha512-core.S
+AFLAGS_arm/sha512-core.o += $(aflags-thumb2-y)
+endif
+
 endif # CONFIG_CRYPTO_LIB_SHA512_ARCH
 
 obj-$(CONFIG_MPILIB) += mpi/
 
 obj-$(CONFIG_CRYPTO_SELFTESTS_FULL)		+= simd.o
diff --git a/lib/crypto/arm/.gitignore b/lib/crypto/arm/.gitignore
new file mode 100644
index 0000000000000..670a4d97b5684
--- /dev/null
+++ b/lib/crypto/arm/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+sha512-core.S
diff --git a/arch/arm/crypto/sha512-armv4.pl b/lib/crypto/arm/sha512-armv4.pl
similarity index 100%
rename from arch/arm/crypto/sha512-armv4.pl
rename to lib/crypto/arm/sha512-armv4.pl
diff --git a/lib/crypto/arm/sha512.h b/lib/crypto/arm/sha512.h
new file mode 100644
index 0000000000000..f147b6490d6cd
--- /dev/null
+++ b/lib/crypto/arm/sha512.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * arm32-optimized SHA-512 block function
+ *
+ * Copyright 2025 Google LLC
+ */
+
+#include <asm/neon.h>
+#include <crypto/internal/simd.h>
+
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
+
+asmlinkage void sha512_block_data_order(struct sha512_block_state *state,
+					const u8 *data, size_t nblocks);
+asmlinkage void sha512_block_data_order_neon(struct sha512_block_state *state,
+					     const u8 *data, size_t nblocks);
+
+static void sha512_blocks(struct sha512_block_state *state,
+			  const u8 *data, size_t nblocks)
+{
+	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
+	    static_branch_likely(&have_neon) && likely(crypto_simd_usable())) {
+		kernel_neon_begin();
+		sha512_block_data_order_neon(state, data, nblocks);
+		kernel_neon_end();
+	} else {
+		sha512_block_data_order(state, data, nblocks);
+	}
+}
+
+#ifdef CONFIG_KERNEL_MODE_NEON
+#define sha512_mod_init_arch sha512_mod_init_arch
+static inline void sha512_mod_init_arch(void)
+{
+	if (cpu_has_neon())
+		static_branch_enable(&have_neon);
+}
+#endif /* CONFIG_KERNEL_MODE_NEON */
-- 
2.50.0


