Return-Path: <linux-mips+bounces-10033-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB23B1BC99
	for <lists+linux-mips@lfdr.de>; Wed,  6 Aug 2025 00:30:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B9AB1898DDA
	for <lists+linux-mips@lfdr.de>; Tue,  5 Aug 2025 22:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D06D729994C;
	Tue,  5 Aug 2025 22:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NM/B5cER"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1876298CC3;
	Tue,  5 Aug 2025 22:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754433009; cv=none; b=I/dIqR9QnsOCBEnIc0lJxiX3kp5PyUttGXecZk/GMiI40th1kd98P9z6Y0/tvm/oOE49wqa3LARd0oRrta3XgJf5ook7v52XhN7eiI92MwFES3SWtrzxSipMOuvqrY4KnLBJYN/HNzSs/oz8RJbrquanebT2m4PrsBSed+9yvog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754433009; c=relaxed/simple;
	bh=1MyX5/ScI+ABzLHp94uEiUWeHGKbS9SP8d6OkXKSCMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jXaW1FMc5pA78rfCWwM5/jS7yq8Me8wUSTQVYGVGxPbHCdGykmITNvQ7NdHg1/waL+U9/Q4XjVF0AJXcugbOhuwyUvAOHsFA97nNP8ivo550HIzHWk5+jLllocKUtSOlMQtPypYjUfrt4VkQ02Q1KtMlTY2Ca7iiIgy+NSPHnXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NM/B5cER; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB128C4CEF4;
	Tue,  5 Aug 2025 22:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754433009;
	bh=1MyX5/ScI+ABzLHp94uEiUWeHGKbS9SP8d6OkXKSCMU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NM/B5cER0kHM26PVRd5nsKUaz/6xEg3J0MAxmPDAYziStnyDLO6OqBjoCKDU05m1C
	 jys9dP5LtFjHGTnaxTfOU/Ua8qJBFpyHVj80/br8jIsQQyqRbP53L8f/LBm65Y+97f
	 PsKAFQmMiGvsWRMcrrV+zzjCHUO2BflRxLrZNM5s8c3CbyrfbdoPolcP0a7JXUMn0V
	 etHV5/GqhZD4SQ4NYxgwn50Nsw3uQ248HAFWwtAbI5oSx+2iPxJXADWwf17S7a3Vmj
	 3D62qWA1pG5Cm9uPj6XbTojhxBrv7T9i27VVjS9Qc0cqvWJfYmOt2/xfo1g5JJwv2V
	 l/Wuov4vsgH8Q==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 4/7] lib/crypto: powerpc/md5: Migrate optimized code into library
Date: Tue,  5 Aug 2025 15:28:52 -0700
Message-ID: <20250805222855.10362-5-ebiggers@kernel.org>
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

Instead of exposing the powerpc-optimized MD5 code via powerpc-specific
crypto_shash algorithms, instead just implement the md5_blocks() library
function.  This is much simpler, it makes the MD5 library functions be
powerpc-optimized, and it fixes the longstanding issue where the
powerpc-optimized MD5 code was disabled by default.  MD5 still remains
available through crypto_shash, but individual architectures no longer
need to handle it.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/powerpc/configs/powernv_defconfig        |  1 -
 arch/powerpc/configs/ppc64_defconfig          |  1 -
 arch/powerpc/crypto/Kconfig                   |  8 --
 arch/powerpc/crypto/Makefile                  |  2 -
 arch/powerpc/crypto/md5-glue.c                | 99 -------------------
 lib/crypto/Kconfig                            |  1 +
 lib/crypto/Makefile                           |  1 +
 .../crypto => lib/crypto/powerpc}/md5-asm.S   |  0
 lib/crypto/powerpc/md5.h                      | 12 +++
 9 files changed, 14 insertions(+), 111 deletions(-)
 delete mode 100644 arch/powerpc/crypto/md5-glue.c
 rename {arch/powerpc/crypto => lib/crypto/powerpc}/md5-asm.S (100%)
 create mode 100644 lib/crypto/powerpc/md5.h

diff --git a/arch/powerpc/configs/powernv_defconfig b/arch/powerpc/configs/powernv_defconfig
index d06388b0f66e3..bd4685612de6d 100644
--- a/arch/powerpc/configs/powernv_defconfig
+++ b/arch/powerpc/configs/powernv_defconfig
@@ -318,11 +318,10 @@ CONFIG_FTR_FIXUP_SELFTEST=y
 CONFIG_MSI_BITMAP_SELFTEST=y
 CONFIG_XMON=y
 CONFIG_CRYPTO_BENCHMARK=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_HMAC=y
-CONFIG_CRYPTO_MD5_PPC=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_SHA256=y
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_ANUBIS=m
 CONFIG_CRYPTO_BLOWFISH=m
diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index ce34597e9f3e1..2d92c11eea7e4 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -385,11 +385,10 @@ CONFIG_CRYPTO_TWOFISH=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_SHA256=y
 CONFIG_CRYPTO_WP512=m
 CONFIG_CRYPTO_LZO=m
-CONFIG_CRYPTO_MD5_PPC=m
 CONFIG_CRYPTO_AES_GCM_P10=m
 CONFIG_CRYPTO_DEV_NX=y
 CONFIG_CRYPTO_DEV_NX_ENCRYPT=m
 CONFIG_CRYPTO_DEV_VMX=y
 CONFIG_SYSTEM_TRUSTED_KEYRING=y
diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
index cfe39fc221cf8..f4b779c7352de 100644
--- a/arch/powerpc/crypto/Kconfig
+++ b/arch/powerpc/crypto/Kconfig
@@ -13,18 +13,10 @@ config CRYPTO_CURVE25519_PPC64
 	  Curve25519 algorithm
 
 	  Architecture: PowerPC64
 	  - Little-endian
 
-config CRYPTO_MD5_PPC
-	tristate "Digests: MD5"
-	select CRYPTO_HASH
-	help
-	  MD5 message digest algorithm (RFC1321)
-
-	  Architecture: powerpc
-
 config CRYPTO_AES_PPC_SPE
 	tristate "Ciphers: AES, modes: ECB/CBC/CTR/XTS (SPE)"
 	depends on SPE
 	select CRYPTO_SKCIPHER
 	help
diff --git a/arch/powerpc/crypto/Makefile b/arch/powerpc/crypto/Makefile
index bc8fd27344b8b..9eb59dce67f36 100644
--- a/arch/powerpc/crypto/Makefile
+++ b/arch/powerpc/crypto/Makefile
@@ -4,17 +4,15 @@
 #
 # Arch-specific CryptoAPI modules.
 #
 
 obj-$(CONFIG_CRYPTO_AES_PPC_SPE) += aes-ppc-spe.o
-obj-$(CONFIG_CRYPTO_MD5_PPC) += md5-ppc.o
 obj-$(CONFIG_CRYPTO_AES_GCM_P10) += aes-gcm-p10-crypto.o
 obj-$(CONFIG_CRYPTO_DEV_VMX_ENCRYPT) += vmx-crypto.o
 obj-$(CONFIG_CRYPTO_CURVE25519_PPC64) += curve25519-ppc64le.o
 
 aes-ppc-spe-y := aes-spe-core.o aes-spe-keys.o aes-tab-4k.o aes-spe-modes.o aes-spe-glue.o
-md5-ppc-y := md5-asm.o md5-glue.o
 aes-gcm-p10-crypto-y := aes-gcm-p10-glue.o aes-gcm-p10.o ghashp10-ppc.o aesp10-ppc.o
 vmx-crypto-objs := vmx.o aesp8-ppc.o ghashp8-ppc.o aes.o aes_cbc.o aes_ctr.o aes_xts.o ghash.o
 curve25519-ppc64le-y := curve25519-ppc64le-core.o curve25519-ppc64le_asm.o
 
 ifeq ($(CONFIG_CPU_LITTLE_ENDIAN),y)
diff --git a/arch/powerpc/crypto/md5-glue.c b/arch/powerpc/crypto/md5-glue.c
deleted file mode 100644
index 204440a90cd84..0000000000000
--- a/arch/powerpc/crypto/md5-glue.c
+++ /dev/null
@@ -1,99 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Glue code for MD5 implementation for PPC assembler
- *
- * Based on generic implementation.
- *
- * Copyright (c) 2015 Markus Stockhausen <stockhausen@collogia.de>
- */
-
-#include <crypto/internal/hash.h>
-#include <crypto/md5.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/string.h>
-
-extern void ppc_md5_transform(u32 *state, const u8 *src, u32 blocks);
-
-static int ppc_md5_init(struct shash_desc *desc)
-{
-	struct md5_state *sctx = shash_desc_ctx(desc);
-
-	sctx->hash[0] = MD5_H0;
-	sctx->hash[1] = MD5_H1;
-	sctx->hash[2] = MD5_H2;
-	sctx->hash[3] =	MD5_H3;
-	sctx->byte_count = 0;
-
-	return 0;
-}
-
-static int ppc_md5_update(struct shash_desc *desc, const u8 *data,
-			unsigned int len)
-{
-	struct md5_state *sctx = shash_desc_ctx(desc);
-
-	sctx->byte_count += round_down(len, MD5_HMAC_BLOCK_SIZE);
-	ppc_md5_transform(sctx->hash, data, len >> 6);
-	return len - round_down(len, MD5_HMAC_BLOCK_SIZE);
-}
-
-static int ppc_md5_finup(struct shash_desc *desc, const u8 *src,
-			 unsigned int offset, u8 *out)
-{
-	struct md5_state *sctx = shash_desc_ctx(desc);
-	__le64 block[MD5_BLOCK_WORDS] = {};
-	u8 *p = memcpy(block, src, offset);
-	__le32 *dst = (__le32 *)out;
-	__le64 *pbits;
-
-	src = p;
-	p += offset;
-	*p++ = 0x80;
-	sctx->byte_count += offset;
-	pbits = &block[(MD5_BLOCK_WORDS / (offset > 55 ? 1 : 2)) - 1];
-	*pbits = cpu_to_le64(sctx->byte_count << 3);
-	ppc_md5_transform(sctx->hash, src, (pbits - block + 1) / 8);
-	memzero_explicit(block, sizeof(block));
-
-	dst[0] = cpu_to_le32(sctx->hash[0]);
-	dst[1] = cpu_to_le32(sctx->hash[1]);
-	dst[2] = cpu_to_le32(sctx->hash[2]);
-	dst[3] = cpu_to_le32(sctx->hash[3]);
-	return 0;
-}
-
-static struct shash_alg alg = {
-	.digestsize	=	MD5_DIGEST_SIZE,
-	.init		=	ppc_md5_init,
-	.update		=	ppc_md5_update,
-	.finup		=	ppc_md5_finup,
-	.descsize	=	MD5_STATE_SIZE,
-	.base		=	{
-		.cra_name	=	"md5",
-		.cra_driver_name=	"md5-ppc",
-		.cra_priority	=	200,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY,
-		.cra_blocksize	=	MD5_HMAC_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-};
-
-static int __init ppc_md5_mod_init(void)
-{
-	return crypto_register_shash(&alg);
-}
-
-static void __exit ppc_md5_mod_fini(void)
-{
-	crypto_unregister_shash(&alg);
-}
-
-module_init(ppc_md5_mod_init);
-module_exit(ppc_md5_mod_fini);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("MD5 Secure Hash Algorithm, PPC assembler");
-
-MODULE_ALIAS_CRYPTO("md5");
-MODULE_ALIAS_CRYPTO("md5-ppc");
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index fe2910c25f0ba..cfbbfaae9fe29 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -109,10 +109,11 @@ config CRYPTO_LIB_MD5
 
 config CRYPTO_LIB_MD5_ARCH
 	bool
 	depends on CRYPTO_LIB_MD5 && !UML
 	default y if MIPS && CPU_CAVIUM_OCTEON
+	default y if PPC
 
 config CRYPTO_LIB_POLY1305_RSIZE
 	int
 	default 2 if MIPS
 	default 11 if X86_64
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 25443e9ca7465..8360054481b84 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -63,10 +63,11 @@ libdes-y					:= des.o
 
 obj-$(CONFIG_CRYPTO_LIB_MD5) += libmd5.o
 libmd5-y := md5.o
 ifeq ($(CONFIG_CRYPTO_LIB_MD5_ARCH),y)
 CFLAGS_md5.o += -I$(src)/$(SRCARCH)
+libmd5-$(CONFIG_PPC) += powerpc/md5-asm.o
 endif # CONFIG_CRYPTO_LIB_MD5_ARCH
 
 ################################################################################
 
 obj-$(CONFIG_CRYPTO_LIB_POLY1305)		+= libpoly1305.o
diff --git a/arch/powerpc/crypto/md5-asm.S b/lib/crypto/powerpc/md5-asm.S
similarity index 100%
rename from arch/powerpc/crypto/md5-asm.S
rename to lib/crypto/powerpc/md5-asm.S
diff --git a/lib/crypto/powerpc/md5.h b/lib/crypto/powerpc/md5.h
new file mode 100644
index 0000000000000..540b08e34d1d5
--- /dev/null
+++ b/lib/crypto/powerpc/md5.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * MD5 optimized for PowerPC
+ */
+
+void ppc_md5_transform(u32 *state, const u8 *data, size_t nblocks);
+
+static void md5_blocks(struct md5_block_state *state,
+		       const u8 *data, size_t nblocks)
+{
+	ppc_md5_transform(state->h, data, nblocks);
+}
-- 
2.50.1


