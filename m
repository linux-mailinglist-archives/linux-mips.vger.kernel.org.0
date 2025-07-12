Return-Path: <linux-mips+bounces-9773-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CCCB02DCE
	for <lists+linux-mips@lfdr.de>; Sun, 13 Jul 2025 01:28:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B87CFA46EAF
	for <lists+linux-mips@lfdr.de>; Sat, 12 Jul 2025 23:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B8A238C0D;
	Sat, 12 Jul 2025 23:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SnIQC8iL"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCCE238173;
	Sat, 12 Jul 2025 23:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752362784; cv=none; b=RpHSmEl3SqrsJUGI47C0drmmsdoihWrjbxVMCW3hlMhmbEyyisUHkyq5bQHrT2xWw9hOqLjcwaL588Vnqbf8JeoTMQS6EwmaVagLrUQB8Dvhr0vMdGquLWLXWK84Ql8yjtJirXAP5xjbEW1BsE9JwdbEPpKsiIwl2e2PNnNqM0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752362784; c=relaxed/simple;
	bh=T1G5rz22TZVVTnJT6izv9vwaaifRR1MqdehL7gIh2Eo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lyeQnyeA6Owesie1UyYvWecQio3o4Kih00oktoHx5aVpsS0DPH/4l/48p7Y8TSPGXsCIgIC6HEuwbtQvmsmTWfICMAmIVFfuhNQB6mXoNl+fcEvYdg4iH6aEjm0iYXHwwHBkXL4MMR0OSnm5cXbXIAHNhMB4eK5kw+Q4B+9hcKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SnIQC8iL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE99EC4CEF5;
	Sat, 12 Jul 2025 23:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362784;
	bh=T1G5rz22TZVVTnJT6izv9vwaaifRR1MqdehL7gIh2Eo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SnIQC8iLtvGuNtkaE6lzbpaOul2vAVIBXsCxe2sAJmAxdJGNTb8jlLL4ldCrGEviX
	 RSkgJ1PtxdfYfGUH+QXqiqc4fryCCmjdVWOu4yDKj+pSJM3QB0aeEnzax75qyg24jI
	 S9MLHc2/WFXkah2i94Lz8hyRrsOzTlPuAwvxmJbbdGELqv119ec0F9o0FjJOZAl4ia
	 ehs9pO5xGnmwsn5Q2ctjrGamWWrBKK4dawMnSmkxNHZO2HneXum6/Eo4V8eg6tiqF9
	 Te4vk4maW5fj1MTVA+aFN+uznHrJyKfMwtMDkUlHMlu1QFNBuI0fVCTqRmxNIPDjpg
	 pBdfCEVBhNRpg==
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
Subject: [PATCH 08/26] lib/crypto: arm64/sha1: Migrate optimized code into library
Date: Sat, 12 Jul 2025 16:22:59 -0700
Message-ID: <20250712232329.818226-9-ebiggers@kernel.org>
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

Instead of exposing the arm64-optimized SHA-1 code via arm64-specific
crypto_shash algorithms, instead just implement the sha1_blocks()
library function.  This is much simpler, it makes the SHA-1 library
functions be arm64-optimized, and it fixes the longstanding issue where
the arm64-optimized SHA-1 code was disabled by default.  SHA-1 still
remains available through crypto_shash, but individual architectures no
longer need to handle it.

Remove support for SHA-1 finalization from assembly code, since the
library does not yet support architecture-specific overrides of the
finalization.  (Support for that has been omitted for now, for
simplicity and because usually it isn't performance-critical.)

To match sha1_blocks(), change the type of the nblocks parameter and the
return value of __sha1_ce_transform() from int to size_t.  Update the
assembly code accordingly.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm64/configs/defconfig                  |   1 -
 arch/arm64/crypto/Kconfig                     |  11 --
 arch/arm64/crypto/Makefile                    |   3 -
 arch/arm64/crypto/sha1-ce-glue.c              | 118 ------------------
 lib/crypto/Kconfig                            |   1 +
 lib/crypto/Makefile                           |   1 +
 .../crypto/arm64}/sha1-ce-core.S              |  40 ++----
 lib/crypto/arm64/sha1.h                       |  39 ++++++
 8 files changed, 51 insertions(+), 163 deletions(-)
 delete mode 100644 arch/arm64/crypto/sha1-ce-glue.c
 rename {arch/arm64/crypto => lib/crypto/arm64}/sha1-ce-core.S (76%)
 create mode 100644 lib/crypto/arm64/sha1.h

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b612b78b3b091..31681206b49cf 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1741,11 +1741,10 @@ CONFIG_CRYPTO_BENCHMARK=m
 CONFIG_CRYPTO_ECHAINIV=y
 CONFIG_CRYPTO_MICHAEL_MIC=m
 CONFIG_CRYPTO_ANSI_CPRNG=y
 CONFIG_CRYPTO_USER_API_RNG=m
 CONFIG_CRYPTO_GHASH_ARM64_CE=y
-CONFIG_CRYPTO_SHA1_ARM64_CE=y
 CONFIG_CRYPTO_SHA3_ARM64=m
 CONFIG_CRYPTO_SM3_ARM64_CE=m
 CONFIG_CRYPTO_AES_ARM64_CE_BLK=y
 CONFIG_CRYPTO_AES_ARM64_BS=m
 CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
diff --git a/arch/arm64/crypto/Kconfig b/arch/arm64/crypto/Kconfig
index a9ead99f72c28..3bb5b513d5ae2 100644
--- a/arch/arm64/crypto/Kconfig
+++ b/arch/arm64/crypto/Kconfig
@@ -23,21 +23,10 @@ config CRYPTO_NHPOLY1305_NEON
 	  NHPoly1305 hash function (Adiantum)
 
 	  Architecture: arm64 using:
 	  - NEON (Advanced SIMD) extensions
 
-config CRYPTO_SHA1_ARM64_CE
-	tristate "Hash functions: SHA-1 (ARMv8 Crypto Extensions)"
-	depends on KERNEL_MODE_NEON
-	select CRYPTO_HASH
-	select CRYPTO_SHA1
-	help
-	  SHA-1 secure hash algorithm (FIPS 180)
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
index 228101f125d50..a8b2cdbe202c1 100644
--- a/arch/arm64/crypto/Makefile
+++ b/arch/arm64/crypto/Makefile
@@ -3,13 +3,10 @@
 # linux/arch/arm64/crypto/Makefile
 #
 # Copyright (C) 2014 Linaro Ltd <ard.biesheuvel@linaro.org>
 #
 
-obj-$(CONFIG_CRYPTO_SHA1_ARM64_CE) += sha1-ce.o
-sha1-ce-y := sha1-ce-glue.o sha1-ce-core.o
-
 obj-$(CONFIG_CRYPTO_SHA3_ARM64) += sha3-ce.o
 sha3-ce-y := sha3-ce-glue.o sha3-ce-core.o
 
 obj-$(CONFIG_CRYPTO_SM3_NEON) += sm3-neon.o
 sm3-neon-y := sm3-neon-glue.o sm3-neon-core.o
diff --git a/arch/arm64/crypto/sha1-ce-glue.c b/arch/arm64/crypto/sha1-ce-glue.c
deleted file mode 100644
index 65b6980817e5b..0000000000000
--- a/arch/arm64/crypto/sha1-ce-glue.c
+++ /dev/null
@@ -1,118 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * sha1-ce-glue.c - SHA-1 secure hash using ARMv8 Crypto Extensions
- *
- * Copyright (C) 2014 - 2017 Linaro Ltd <ard.biesheuvel@linaro.org>
- */
-
-#include <asm/neon.h>
-#include <asm/simd.h>
-#include <crypto/internal/hash.h>
-#include <crypto/internal/simd.h>
-#include <crypto/sha1.h>
-#include <crypto/sha1_base.h>
-#include <linux/cpufeature.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/string.h>
-
-MODULE_DESCRIPTION("SHA1 secure hash using ARMv8 Crypto Extensions");
-MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
-MODULE_LICENSE("GPL v2");
-MODULE_ALIAS_CRYPTO("sha1");
-
-struct sha1_ce_state {
-	struct sha1_state	sst;
-	u32			finalize;
-};
-
-extern const u32 sha1_ce_offsetof_count;
-extern const u32 sha1_ce_offsetof_finalize;
-
-asmlinkage int __sha1_ce_transform(struct sha1_ce_state *sst, u8 const *src,
-				   int blocks);
-
-static void sha1_ce_transform(struct sha1_state *sst, u8 const *src,
-			      int blocks)
-{
-	while (blocks) {
-		int rem;
-
-		kernel_neon_begin();
-		rem = __sha1_ce_transform(container_of(sst,
-						       struct sha1_ce_state,
-						       sst), src, blocks);
-		kernel_neon_end();
-		src += (blocks - rem) * SHA1_BLOCK_SIZE;
-		blocks = rem;
-	}
-}
-
-const u32 sha1_ce_offsetof_count = offsetof(struct sha1_ce_state, sst.count);
-const u32 sha1_ce_offsetof_finalize = offsetof(struct sha1_ce_state, finalize);
-
-static int sha1_ce_update(struct shash_desc *desc, const u8 *data,
-			  unsigned int len)
-{
-	struct sha1_ce_state *sctx = shash_desc_ctx(desc);
-
-	sctx->finalize = 0;
-	return sha1_base_do_update_blocks(desc, data, len, sha1_ce_transform);
-}
-
-static int sha1_ce_finup(struct shash_desc *desc, const u8 *data,
-			 unsigned int len, u8 *out)
-{
-	struct sha1_ce_state *sctx = shash_desc_ctx(desc);
-	bool finalized = false;
-
-	/*
-	 * Allow the asm code to perform the finalization if there is no
-	 * partial data and the input is a round multiple of the block size.
-	 */
-	if (len >= SHA1_BLOCK_SIZE) {
-		unsigned int remain = len - round_down(len, SHA1_BLOCK_SIZE);
-
-		finalized = !remain;
-		sctx->finalize = finalized;
-		sha1_base_do_update_blocks(desc, data, len, sha1_ce_transform);
-		data += len - remain;
-		len = remain;
-	}
-	if (!finalized) {
-		sctx->finalize = 0;
-		sha1_base_do_finup(desc, data, len, sha1_ce_transform);
-	}
-	return sha1_base_finish(desc, out);
-}
-
-static struct shash_alg alg = {
-	.init			= sha1_base_init,
-	.update			= sha1_ce_update,
-	.finup			= sha1_ce_finup,
-	.descsize		= sizeof(struct sha1_ce_state),
-	.statesize		= SHA1_STATE_SIZE,
-	.digestsize		= SHA1_DIGEST_SIZE,
-	.base			= {
-		.cra_name		= "sha1",
-		.cra_driver_name	= "sha1-ce",
-		.cra_priority		= 200,
-		.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY |
-					  CRYPTO_AHASH_ALG_FINUP_MAX,
-		.cra_blocksize		= SHA1_BLOCK_SIZE,
-		.cra_module		= THIS_MODULE,
-	}
-};
-
-static int __init sha1_ce_mod_init(void)
-{
-	return crypto_register_shash(&alg);
-}
-
-static void __exit sha1_ce_mod_fini(void)
-{
-	crypto_unregister_shash(&alg);
-}
-
-module_cpu_feature_match(SHA1, sha1_ce_mod_init);
-module_exit(sha1_ce_mod_fini);
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 5c1bfa02fa349..189bdae58c812 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -145,10 +145,11 @@ config CRYPTO_LIB_SHA1
 
 config CRYPTO_LIB_SHA1_ARCH
 	bool
 	depends on CRYPTO_LIB_SHA1 && !UML
 	default y if ARM
+	default y if ARM64 && KERNEL_MODE_NEON
 
 config CRYPTO_LIB_SHA256
 	tristate
 	help
 	  Enable the SHA-256 library interface. This interface may be fulfilled
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index e10a84a6dda6a..11c8ac54bf7d1 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -76,10 +76,11 @@ CFLAGS_sha1.o += -I$(src)/$(SRCARCH)
 ifeq ($(CONFIG_ARM),y)
 libsha1-y += arm/sha1-armv4-large.o
 libsha1-$(CONFIG_KERNEL_MODE_NEON) += arm/sha1-armv7-neon.o \
 				      arm/sha1-ce-core.o
 endif
+libsha1-$(CONFIG_ARM64) += arm64/sha1-ce-core.o
 endif # CONFIG_CRYPTO_LIB_SHA1_ARCH
 
 ################################################################################
 
 obj-$(CONFIG_CRYPTO_LIB_SHA256) += libsha256.o
diff --git a/arch/arm64/crypto/sha1-ce-core.S b/lib/crypto/arm64/sha1-ce-core.S
similarity index 76%
rename from arch/arm64/crypto/sha1-ce-core.S
rename to lib/crypto/arm64/sha1-ce-core.S
index 9b1f2d82a6fea..21efbbafd7d62 100644
--- a/arch/arm64/crypto/sha1-ce-core.S
+++ b/lib/crypto/arm64/sha1-ce-core.S
@@ -60,12 +60,12 @@
 	movk		\tmp, :abs_g1:\val
 	dup		\k, \tmp
 	.endm
 
 	/*
-	 * int __sha1_ce_transform(struct sha1_ce_state *sst, u8 const *src,
-	 *			   int blocks)
+	 * size_t __sha1_ce_transform(struct sha1_block_state *state,
+	 *			      const u8 *data, size_t nblocks);
 	 */
 SYM_FUNC_START(__sha1_ce_transform)
 	/* load round constants */
 	loadrc		k0.4s, 0x5a827999, w6
 	loadrc		k1.4s, 0x6ed9eba1, w6
@@ -74,24 +74,20 @@ SYM_FUNC_START(__sha1_ce_transform)
 
 	/* load state */
 	ld1		{dgav.4s}, [x0]
 	ldr		dgb, [x0, #16]
 
-	/* load sha1_ce_state::finalize */
-	ldr_l		w4, sha1_ce_offsetof_finalize, x4
-	ldr		w4, [x0, x4]
-
 	/* load input */
 0:	ld1		{v8.4s-v11.4s}, [x1], #64
-	sub		w2, w2, #1
+	sub		x2, x2, #1
 
 CPU_LE(	rev32		v8.16b, v8.16b		)
 CPU_LE(	rev32		v9.16b, v9.16b		)
 CPU_LE(	rev32		v10.16b, v10.16b	)
 CPU_LE(	rev32		v11.16b, v11.16b	)
 
-1:	add		t0.4s, v8.4s, k0.4s
+	add		t0.4s, v8.4s, k0.4s
 	mov		dg0v.16b, dgav.16b
 
 	add_update	c, ev, k0,  8,  9, 10, 11, dgb
 	add_update	c, od, k0,  9, 10, 11,  8
 	add_update	c, ev, k0, 10, 11,  8,  9
@@ -118,33 +114,17 @@ CPU_LE(	rev32		v11.16b, v11.16b	)
 
 	/* update state */
 	add		dgbv.2s, dgbv.2s, dg1v.2s
 	add		dgav.4s, dgav.4s, dg0v.4s
 
-	cbz		w2, 2f
-	cond_yield	3f, x5, x6
-	b		0b
+	/* return early if voluntary preemption is needed */
+	cond_yield	1f, x5, x6
 
-	/*
-	 * Final block: add padding and total bit count.
-	 * Skip if the input size was not a round multiple of the block size,
-	 * the padding is handled by the C code in that case.
-	 */
-2:	cbz		x4, 3f
-	ldr_l		w4, sha1_ce_offsetof_count, x4
-	ldr		x4, [x0, x4]
-	movi		v9.2d, #0
-	mov		x8, #0x80000000
-	movi		v10.2d, #0
-	ror		x7, x4, #29		// ror(lsl(x4, 3), 32)
-	fmov		d8, x8
-	mov		x4, #0
-	mov		v11.d[0], xzr
-	mov		v11.d[1], x7
-	b		1b
+	/* handled all input blocks? */
+	cbnz		x2, 0b
 
 	/* store new state */
-3:	st1		{dgav.4s}, [x0]
+1:	st1		{dgav.4s}, [x0]
 	str		dgb, [x0, #16]
-	mov		w0, w2
+	mov		x0, x2
 	ret
 SYM_FUNC_END(__sha1_ce_transform)
diff --git a/lib/crypto/arm64/sha1.h b/lib/crypto/arm64/sha1.h
new file mode 100644
index 0000000000000..0a166f968f63e
--- /dev/null
+++ b/lib/crypto/arm64/sha1.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * SHA-1 optimized for ARM64
+ *
+ * Copyright 2025 Google LLC
+ */
+#include <asm/neon.h>
+#include <asm/simd.h>
+#include <linux/cpufeature.h>
+
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_ce);
+
+asmlinkage size_t __sha1_ce_transform(struct sha1_block_state *state,
+				      const u8 *data, size_t nblocks);
+
+static void sha1_blocks(struct sha1_block_state *state,
+			  const u8 *data, size_t nblocks)
+{
+	if (static_branch_likely(&have_ce) && may_use_simd()) {
+		do {
+			size_t rem;
+
+			kernel_neon_begin();
+			rem = __sha1_ce_transform(state, data, nblocks);
+			kernel_neon_end();
+			data += (nblocks - rem) * SHA1_BLOCK_SIZE;
+			nblocks = rem;
+		} while (nblocks);
+	} else {
+		sha1_blocks_generic(state, data, nblocks);
+	}
+}
+
+#define sha1_mod_init_arch sha1_mod_init_arch
+static inline void sha1_mod_init_arch(void)
+{
+	if (cpu_have_named_feature(SHA1))
+		static_branch_enable(&have_ce);
+}
-- 
2.50.1


