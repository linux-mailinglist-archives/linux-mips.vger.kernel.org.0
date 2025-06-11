Return-Path: <linux-mips+bounces-9238-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E64BAD489B
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 04:14:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CC8F3A5A82
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 02:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800101C5D6A;
	Wed, 11 Jun 2025 02:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TmehLuSf"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8031BD01F;
	Wed, 11 Jun 2025 02:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749607978; cv=none; b=CeLdLKNCaBooTTsUry1XohzdUiH/3ud0zF14rJ0T+EaSjzcjRWe6Qpt2CGQyU5KSR20lXRonEgcXr9dDo6RkqvLoXvrD2haI4PjnbMCZLL6JSeUQD+sBQqfgFIkEoK8Ed6DOXeIoL5I3nkyzzlIO9kXWgoeEi3F5CJyNi4JQY7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749607978; c=relaxed/simple;
	bh=XigrAiLcrrLfJL/KlTapcHL9o31nG9s9uyBgyxBTDvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rSe6g8/V8hBlXmm6WmlP109/9cEVpA5twZu4dQHtb8jPtuuYMW7oTmNuvPRJ3HVYnsLRWP3uTIcJmDCFxxLIPnz8USust4GnuBsmeVJnctOjywDTtC0k1LWV+CzMMKUy/1H1zDJZSdtqhzJGUELpQEQDI566w0kozlIrFVp9y7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TmehLuSf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EC0AC4CEF0;
	Wed, 11 Jun 2025 02:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749607977;
	bh=XigrAiLcrrLfJL/KlTapcHL9o31nG9s9uyBgyxBTDvQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TmehLuSfxxuOQ3PjhGxqfr4fjGnmwn200vk/iurPv4UCoqIz9jTmxni/V+1Ib1qzI
	 zYaPmntWS9TRQc59XgGecEAxXZl0ReKld/LiO7ui6x82s5U5tBBY8f4Ck3TUMw3Sxg
	 OCcCqx2cUJyb+h40Gih7b5CumnctN8Nq0xJ+IobmPj9rhC3wFRbRDrHXXikOD8yxZH
	 9kgVcpAjjl/XPfKMjS7pFHquSqKEwDJGD0sNxfLkQXnhuAJMS97L7MApkB+rdu+mRZ
	 JFft8X7BycUv1Q+KGM/cgH8YrWb26XlRbOPGEOeCGPjgKfnocX3k+6BfbT0xDqXnX+
	 k7qJXSE6UrBHw==
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
Subject: [PATCH 12/16] lib/crypto/sha512: migrate riscv-optimized SHA-512 code to library
Date: Tue, 10 Jun 2025 19:09:19 -0700
Message-ID: <20250611020923.1482701-13-ebiggers@kernel.org>
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

Instead of exposing the riscv-optimized SHA-512 code via riscv-specific
crypto_shash algorithms, instead just implement the sha512_blocks()
library function.  This is much simpler, it makes the SHA-512 (and
SHA-384) library functions be riscv-optimized, and it fixes the
longstanding issue where the riscv-optimized SHA-512 code was disabled
by default.  SHA-512 still remains available through crypto_shash, but
individual architectures no longer need to handle it.

To match sha512_blocks(), change the type of the nblocks parameter of
the assembly function from int to size_t.  The assembly function
actually already treated it as size_t.

Note: to see the diff from arch/riscv/crypto/sha512-riscv64-glue.c to
lib/crypto/riscv/sha512.h, view this commit with 'git show -M10'.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/riscv/crypto/Kconfig                     |  12 --
 arch/riscv/crypto/Makefile                    |   3 -
 arch/riscv/crypto/sha512-riscv64-glue.c       | 130 ------------------
 lib/crypto/Kconfig                            |   1 +
 lib/crypto/Makefile                           |   2 +
 .../riscv}/sha512-riscv64-zvknhb-zvkb.S       |   4 +-
 lib/crypto/riscv/sha512.h                     |  41 ++++++
 7 files changed, 46 insertions(+), 147 deletions(-)
 delete mode 100644 arch/riscv/crypto/sha512-riscv64-glue.c
 rename {arch/riscv/crypto => lib/crypto/riscv}/sha512-riscv64-zvknhb-zvkb.S (98%)
 create mode 100644 lib/crypto/riscv/sha512.h

diff --git a/arch/riscv/crypto/Kconfig b/arch/riscv/crypto/Kconfig
index 53e4e1eacf554..a75d6325607b4 100644
--- a/arch/riscv/crypto/Kconfig
+++ b/arch/riscv/crypto/Kconfig
@@ -26,22 +26,10 @@ config CRYPTO_GHASH_RISCV64
 	  GCM GHASH function (NIST SP 800-38D)
 
 	  Architecture: riscv64 using:
 	  - Zvkg vector crypto extension
 
-config CRYPTO_SHA512_RISCV64
-	tristate "Hash functions: SHA-384 and SHA-512"
-	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
-	select CRYPTO_LIB_SHA512
-	select CRYPTO_SHA512
-	help
-	  SHA-384 and SHA-512 secure hash algorithm (FIPS 180)
-
-	  Architecture: riscv64 using:
-	  - Zvknhb vector crypto extension
-	  - Zvkb vector crypto extension
-
 config CRYPTO_SM3_RISCV64
 	tristate "Hash functions: SM3 (ShangMi 3)"
 	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
 	select CRYPTO_HASH
 	select CRYPTO_LIB_SM3
diff --git a/arch/riscv/crypto/Makefile b/arch/riscv/crypto/Makefile
index e10e8257734e3..183495a95cc0e 100644
--- a/arch/riscv/crypto/Makefile
+++ b/arch/riscv/crypto/Makefile
@@ -5,13 +5,10 @@ aes-riscv64-y := aes-riscv64-glue.o aes-riscv64-zvkned.o \
 		 aes-riscv64-zvkned-zvbb-zvkg.o aes-riscv64-zvkned-zvkb.o
 
 obj-$(CONFIG_CRYPTO_GHASH_RISCV64) += ghash-riscv64.o
 ghash-riscv64-y := ghash-riscv64-glue.o ghash-riscv64-zvkg.o
 
-obj-$(CONFIG_CRYPTO_SHA512_RISCV64) += sha512-riscv64.o
-sha512-riscv64-y := sha512-riscv64-glue.o sha512-riscv64-zvknhb-zvkb.o
-
 obj-$(CONFIG_CRYPTO_SM3_RISCV64) += sm3-riscv64.o
 sm3-riscv64-y := sm3-riscv64-glue.o sm3-riscv64-zvksh-zvkb.o
 
 obj-$(CONFIG_CRYPTO_SM4_RISCV64) += sm4-riscv64.o
 sm4-riscv64-y := sm4-riscv64-glue.o sm4-riscv64-zvksed-zvkb.o
diff --git a/arch/riscv/crypto/sha512-riscv64-glue.c b/arch/riscv/crypto/sha512-riscv64-glue.c
deleted file mode 100644
index b3dbc71de07b0..0000000000000
--- a/arch/riscv/crypto/sha512-riscv64-glue.c
+++ /dev/null
@@ -1,130 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * SHA-512 and SHA-384 using the RISC-V vector crypto extensions
- *
- * Copyright (C) 2023 VRULL GmbH
- * Author: Heiko Stuebner <heiko.stuebner@vrull.eu>
- *
- * Copyright (C) 2023 SiFive, Inc.
- * Author: Jerry Shih <jerry.shih@sifive.com>
- */
-
-#include <asm/simd.h>
-#include <asm/vector.h>
-#include <crypto/internal/hash.h>
-#include <crypto/internal/simd.h>
-#include <crypto/sha512_base.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-
-/*
- * Note: the asm function only uses the 'state' field of struct sha512_state.
- * It is assumed to be the first field.
- */
-asmlinkage void sha512_transform_zvknhb_zvkb(
-	struct sha512_state *state, const u8 *data, int num_blocks);
-
-static void sha512_block(struct sha512_state *state, const u8 *data,
-			 int num_blocks)
-{
-	/*
-	 * Ensure struct sha512_state begins directly with the SHA-512
-	 * 512-bit internal state, as this is what the asm function expects.
-	 */
-	BUILD_BUG_ON(offsetof(struct sha512_state, state) != 0);
-
-	if (crypto_simd_usable()) {
-		kernel_vector_begin();
-		sha512_transform_zvknhb_zvkb(state, data, num_blocks);
-		kernel_vector_end();
-	} else {
-		struct __sha512_ctx ctx = {};
-
-		static_assert(sizeof(ctx.state) == sizeof(state->state));
-		memcpy(&ctx.state, state->state, sizeof(ctx.state));
-		__sha512_update(&ctx, data,
-				(size_t)num_blocks * SHA512_BLOCK_SIZE);
-		memcpy(state->state, &ctx.state, sizeof(state->state));
-	}
-}
-
-static int riscv64_sha512_update(struct shash_desc *desc, const u8 *data,
-				 unsigned int len)
-{
-	return sha512_base_do_update_blocks(desc, data, len, sha512_block);
-}
-
-static int riscv64_sha512_finup(struct shash_desc *desc, const u8 *data,
-				unsigned int len, u8 *out)
-{
-	sha512_base_do_finup(desc, data, len, sha512_block);
-	return sha512_base_finish(desc, out);
-}
-
-static int riscv64_sha512_digest(struct shash_desc *desc, const u8 *data,
-				 unsigned int len, u8 *out)
-{
-	return sha512_base_init(desc) ?:
-	       riscv64_sha512_finup(desc, data, len, out);
-}
-
-static struct shash_alg riscv64_sha512_algs[] = {
-	{
-		.init = sha512_base_init,
-		.update = riscv64_sha512_update,
-		.finup = riscv64_sha512_finup,
-		.digest = riscv64_sha512_digest,
-		.descsize = SHA512_STATE_SIZE,
-		.digestsize = SHA512_DIGEST_SIZE,
-		.base = {
-			.cra_blocksize = SHA512_BLOCK_SIZE,
-			.cra_priority = 300,
-			.cra_flags = CRYPTO_AHASH_ALG_BLOCK_ONLY |
-				     CRYPTO_AHASH_ALG_FINUP_MAX,
-			.cra_name = "sha512",
-			.cra_driver_name = "sha512-riscv64-zvknhb-zvkb",
-			.cra_module = THIS_MODULE,
-		},
-	}, {
-		.init = sha384_base_init,
-		.update = riscv64_sha512_update,
-		.finup = riscv64_sha512_finup,
-		.descsize = SHA512_STATE_SIZE,
-		.digestsize = SHA384_DIGEST_SIZE,
-		.base = {
-			.cra_blocksize = SHA384_BLOCK_SIZE,
-			.cra_priority = 300,
-			.cra_flags = CRYPTO_AHASH_ALG_BLOCK_ONLY |
-				     CRYPTO_AHASH_ALG_FINUP_MAX,
-			.cra_name = "sha384",
-			.cra_driver_name = "sha384-riscv64-zvknhb-zvkb",
-			.cra_module = THIS_MODULE,
-		},
-	},
-};
-
-static int __init riscv64_sha512_mod_init(void)
-{
-	if (riscv_isa_extension_available(NULL, ZVKNHB) &&
-	    riscv_isa_extension_available(NULL, ZVKB) &&
-	    riscv_vector_vlen() >= 128)
-		return crypto_register_shashes(riscv64_sha512_algs,
-					       ARRAY_SIZE(riscv64_sha512_algs));
-
-	return -ENODEV;
-}
-
-static void __exit riscv64_sha512_mod_exit(void)
-{
-	crypto_unregister_shashes(riscv64_sha512_algs,
-				  ARRAY_SIZE(riscv64_sha512_algs));
-}
-
-module_init(riscv64_sha512_mod_init);
-module_exit(riscv64_sha512_mod_exit);
-
-MODULE_DESCRIPTION("SHA-512 (RISC-V accelerated)");
-MODULE_AUTHOR("Heiko Stuebner <heiko.stuebner@vrull.eu>");
-MODULE_LICENSE("GPL");
-MODULE_ALIAS_CRYPTO("sha512");
-MODULE_ALIAS_CRYPTO("sha384");
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 7e54348f70ec1..482d934cc5ecc 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -180,10 +180,11 @@ config CRYPTO_LIB_SHA512_ARCH
 	bool
 	depends on CRYPTO_LIB_SHA512
 	default y if ARM && !CPU_V7M
 	default y if ARM64
 	default y if MIPS && CPU_CAVIUM_OCTEON
+	default y if RISCV && 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
 
 config CRYPTO_LIB_SM3
 	tristate
 
 if !KMSAN # avoid false positives from assembly
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 2aef827c025f0..bfa35cc235cea 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -88,10 +88,12 @@ libsha512-y += arm64/sha512-core.o
 $(obj)/arm64/sha512-core.S: $(src)/../../arch/arm64/lib/crypto/sha2-armv8.pl
 	$(call cmd,perlasm_with_args)
 clean-files += arm64/sha512-core.S
 libsha512-$(CONFIG_KERNEL_MODE_NEON) += arm64/sha512-ce-core.o
 endif
+
+libsha512-$(CONFIG_RISCV) += riscv/sha512-riscv64-zvknhb-zvkb.o
 endif # CONFIG_CRYPTO_LIB_SHA512_ARCH
 
 obj-$(CONFIG_MPILIB) += mpi/
 
 obj-$(CONFIG_CRYPTO_SELFTESTS)			+= simd.o
diff --git a/arch/riscv/crypto/sha512-riscv64-zvknhb-zvkb.S b/lib/crypto/riscv/sha512-riscv64-zvknhb-zvkb.S
similarity index 98%
rename from arch/riscv/crypto/sha512-riscv64-zvknhb-zvkb.S
rename to lib/crypto/riscv/sha512-riscv64-zvknhb-zvkb.S
index 89f4a10d12dd6..b41eebf605462 100644
--- a/arch/riscv/crypto/sha512-riscv64-zvknhb-zvkb.S
+++ b/lib/crypto/riscv/sha512-riscv64-zvknhb-zvkb.S
@@ -91,12 +91,12 @@
 	sha512_4rounds	\last, W1, W2, W3, W0
 	sha512_4rounds	\last, W2, W3, W0, W1
 	sha512_4rounds	\last, W3, W0, W1, W2
 .endm
 
-// void sha512_transform_zvknhb_zvkb(u64 state[8], const u8 *data,
-//				     int num_blocks);
+// void sha512_transform_zvknhb_zvkb(struct sha512_block_state *state,
+//				     const u8 *data, size_t nblocks);
 SYM_FUNC_START(sha512_transform_zvknhb_zvkb)
 
 	// Setup mask for the vmerge to replace the first word (idx==0) in
 	// message scheduling.  There are 4 words, so an 8-bit mask suffices.
 	vsetivli	zero, 1, e8, m1, ta, ma
diff --git a/lib/crypto/riscv/sha512.h b/lib/crypto/riscv/sha512.h
new file mode 100644
index 0000000000000..9d0abede322f7
--- /dev/null
+++ b/lib/crypto/riscv/sha512.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * SHA-512 and SHA-384 using the RISC-V vector crypto extensions
+ *
+ * Copyright (C) 2023 VRULL GmbH
+ * Author: Heiko Stuebner <heiko.stuebner@vrull.eu>
+ *
+ * Copyright (C) 2023 SiFive, Inc.
+ * Author: Jerry Shih <jerry.shih@sifive.com>
+ */
+
+#include <asm/simd.h>
+#include <asm/vector.h>
+#include <crypto/internal/simd.h>
+
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_extensions);
+
+asmlinkage void sha512_transform_zvknhb_zvkb(struct sha512_block_state *state,
+					     const u8 *data, size_t nblocks);
+
+static void sha512_blocks(struct sha512_block_state *state,
+			  const u8 *data, size_t nblocks)
+{
+	if (static_branch_likely(&have_extensions) &&
+	    likely(crypto_simd_usable())) {
+		kernel_vector_begin();
+		sha512_transform_zvknhb_zvkb(state, data, nblocks);
+		kernel_vector_end();
+	} else {
+		sha512_blocks_generic(state, data, nblocks);
+	}
+}
+
+#define sha512_mod_init_arch sha512_mod_init_arch
+static inline void sha512_mod_init_arch(void)
+{
+	if (riscv_isa_extension_available(NULL, ZVKNHB) &&
+	    riscv_isa_extension_available(NULL, ZVKB) &&
+	    riscv_vector_vlen() >= 128)
+		static_branch_enable(&have_extensions);
+}
-- 
2.49.0


