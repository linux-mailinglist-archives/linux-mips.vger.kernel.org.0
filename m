Return-Path: <linux-mips+bounces-9578-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D68A8AEE3F8
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 18:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E99873B43CD
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 16:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E1D82BD5BF;
	Mon, 30 Jun 2025 16:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B4SBkLPs"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FD82D4B4F;
	Mon, 30 Jun 2025 16:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751299766; cv=none; b=tm8MUoQ90kTH8PWzgYURt0uL9zww0NoWpapST3+79daOZ6eOJYjwaybF1tykj7HQOCuDguCs+5CRebTh1nYldgYtu36AaZ5mDJjsOWsKWDPAbO3Gh8VFTCS0XyV9WqfB2G+qtB4dGf3HEt6G6U39tFRLzcwOi2fA+74KGZ7/Ex0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751299766; c=relaxed/simple;
	bh=qX6erliMaa6ulFNQWAym5UGYaX+QesAVdQAZCq+fGOg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R28lu2EyuUcs4f+YorwnywavXcMKWwqUPalsp13vgqdGZ0GGQ3iBmKp2DYtS6xAKk4YQhNmZFfOi87qQHLtRdvhzGCEgYFTnjGf4sLOg5ThHDGLxyh+Yq0ytXJ8nmrCkUbjE/xp3Enewp777lw9RJe3b3cmG2dpfICPQFvsSF0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B4SBkLPs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB896C4CEF4;
	Mon, 30 Jun 2025 16:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299766;
	bh=qX6erliMaa6ulFNQWAym5UGYaX+QesAVdQAZCq+fGOg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B4SBkLPsrDtMSle6gshLLQ/m4UzOebXqZJ7GZ8t9HmQa3kgB01qTNAxJ+E+5SI0tE
	 DNGWpFZnQ42KfzK1RPVMUHDevxo25awdKlOgZ5M7V1/kMazAdbvyoeDHw6yEDYBjSb
	 iZaBZ9D+PNTEt33b1OvxfM4ZesS/fBZeiGK025KQUGyFBVXu14Psn7CYuNbWmtzCjQ
	 L6jJO1k4bEMhGecya7uc2MbbpyDHLgiATkvhMXmup1TwqKqZAdBd/RW12OdtAHwxLc
	 Yo87PcBTc0x13h6KFgGAboUadOVjZ6H54Lpvg+8Bq/LQnkASFOe0y18gFsm1pvPLrz
	 mzGLPZzFJjrFA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 11/14] lib/crypto: sha256: Remove sha256_is_arch_optimized()
Date: Mon, 30 Jun 2025 09:06:42 -0700
Message-ID: <20250630160645.3198-12-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630160645.3198-1-ebiggers@kernel.org>
References: <20250630160645.3198-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove sha256_is_arch_optimized(), since it is no longer used.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/mips/cavium-octeon/crypto/octeon-sha256.c | 6 ------
 include/crypto/internal/sha2.h                 | 8 --------
 lib/crypto/arm/sha256.c                        | 7 -------
 lib/crypto/arm64/sha256.c                      | 7 -------
 lib/crypto/powerpc/sha256.c                    | 6 ------
 lib/crypto/riscv/sha256.c                      | 6 ------
 lib/crypto/s390/sha256.c                       | 6 ------
 lib/crypto/sparc/sha256.c                      | 6 ------
 lib/crypto/x86/sha256.c                        | 6 ------
 9 files changed, 58 deletions(-)

diff --git a/arch/mips/cavium-octeon/crypto/octeon-sha256.c b/arch/mips/cavium-octeon/crypto/octeon-sha256.c
index f8664818d04ec..c7c67bdc2bd06 100644
--- a/arch/mips/cavium-octeon/crypto/octeon-sha256.c
+++ b/arch/mips/cavium-octeon/crypto/octeon-sha256.c
@@ -59,14 +59,8 @@ void sha256_blocks_arch(struct sha256_block_state *state,
 	state64[3] = read_octeon_64bit_hash_dword(3);
 	octeon_crypto_disable(&cop2_state, flags);
 }
 EXPORT_SYMBOL_GPL(sha256_blocks_arch);
 
-bool sha256_is_arch_optimized(void)
-{
-	return octeon_has_crypto();
-}
-EXPORT_SYMBOL_GPL(sha256_is_arch_optimized);
-
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("SHA-256 Secure Hash Algorithm (OCTEON)");
 MODULE_AUTHOR("Aaro Koskinen <aaro.koskinen@iki.fi>");
diff --git a/include/crypto/internal/sha2.h b/include/crypto/internal/sha2.h
index f0f455477bbd7..7915a3a46bc86 100644
--- a/include/crypto/internal/sha2.h
+++ b/include/crypto/internal/sha2.h
@@ -7,18 +7,10 @@
 #include <linux/compiler_attributes.h>
 #include <linux/string.h>
 #include <linux/types.h>
 #include <linux/unaligned.h>
 
-#if IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_SHA256)
-bool sha256_is_arch_optimized(void);
-#else
-static inline bool sha256_is_arch_optimized(void)
-{
-	return false;
-}
-#endif
 void sha256_blocks_generic(struct sha256_block_state *state,
 			   const u8 *data, size_t nblocks);
 void sha256_blocks_arch(struct sha256_block_state *state,
 			const u8 *data, size_t nblocks);
 
diff --git a/lib/crypto/arm/sha256.c b/lib/crypto/arm/sha256.c
index 7d90823586952..27181be0aa92e 100644
--- a/lib/crypto/arm/sha256.c
+++ b/lib/crypto/arm/sha256.c
@@ -35,17 +35,10 @@ void sha256_blocks_arch(struct sha256_block_state *state,
 		sha256_block_data_order(state, data, nblocks);
 	}
 }
 EXPORT_SYMBOL_GPL(sha256_blocks_arch);
 
-bool sha256_is_arch_optimized(void)
-{
-	/* We always can use at least the ARM scalar implementation. */
-	return true;
-}
-EXPORT_SYMBOL_GPL(sha256_is_arch_optimized);
-
 static int __init sha256_arm_mod_init(void)
 {
 	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) && (elf_hwcap & HWCAP_NEON)) {
 		static_branch_enable(&have_neon);
 		if (elf_hwcap2 & HWCAP2_SHA2)
diff --git a/lib/crypto/arm64/sha256.c b/lib/crypto/arm64/sha256.c
index 609ffb8151987..a5a4982767089 100644
--- a/lib/crypto/arm64/sha256.c
+++ b/lib/crypto/arm64/sha256.c
@@ -45,17 +45,10 @@ void sha256_blocks_arch(struct sha256_block_state *state,
 		sha256_block_data_order(state, data, nblocks);
 	}
 }
 EXPORT_SYMBOL_GPL(sha256_blocks_arch);
 
-bool sha256_is_arch_optimized(void)
-{
-	/* We always can use at least the ARM64 scalar implementation. */
-	return true;
-}
-EXPORT_SYMBOL_GPL(sha256_is_arch_optimized);
-
 static int __init sha256_arm64_mod_init(void)
 {
 	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
 	    cpu_have_named_feature(ASIMD)) {
 		static_branch_enable(&have_neon);
diff --git a/lib/crypto/powerpc/sha256.c b/lib/crypto/powerpc/sha256.c
index c3f844ae0aceb..437e587b05754 100644
--- a/lib/crypto/powerpc/sha256.c
+++ b/lib/crypto/powerpc/sha256.c
@@ -58,13 +58,7 @@ void sha256_blocks_arch(struct sha256_block_state *state,
 		nblocks -= unit;
 	} while (nblocks);
 }
 EXPORT_SYMBOL_GPL(sha256_blocks_arch);
 
-bool sha256_is_arch_optimized(void)
-{
-	return true;
-}
-EXPORT_SYMBOL_GPL(sha256_is_arch_optimized);
-
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("SHA-256 Secure Hash Algorithm, SPE optimized");
diff --git a/lib/crypto/riscv/sha256.c b/lib/crypto/riscv/sha256.c
index a2079aa3ae925..01004cb9c6e9e 100644
--- a/lib/crypto/riscv/sha256.c
+++ b/lib/crypto/riscv/sha256.c
@@ -32,16 +32,10 @@ void sha256_blocks_arch(struct sha256_block_state *state,
 		sha256_blocks_generic(state, data, nblocks);
 	}
 }
 EXPORT_SYMBOL_GPL(sha256_blocks_arch);
 
-bool sha256_is_arch_optimized(void)
-{
-	return static_key_enabled(&have_extensions);
-}
-EXPORT_SYMBOL_GPL(sha256_is_arch_optimized);
-
 static int __init riscv64_sha256_mod_init(void)
 {
 	/* Both zvknha and zvknhb provide the SHA-256 instructions. */
 	if ((riscv_isa_extension_available(NULL, ZVKNHA) ||
 	     riscv_isa_extension_available(NULL, ZVKNHB)) &&
diff --git a/lib/crypto/s390/sha256.c b/lib/crypto/s390/sha256.c
index fb565718f7539..6ebfd35a5d44c 100644
--- a/lib/crypto/s390/sha256.c
+++ b/lib/crypto/s390/sha256.c
@@ -21,16 +21,10 @@ void sha256_blocks_arch(struct sha256_block_state *state,
 	else
 		sha256_blocks_generic(state, data, nblocks);
 }
 EXPORT_SYMBOL_GPL(sha256_blocks_arch);
 
-bool sha256_is_arch_optimized(void)
-{
-	return static_key_enabled(&have_cpacf_sha256);
-}
-EXPORT_SYMBOL_GPL(sha256_is_arch_optimized);
-
 static int __init sha256_s390_mod_init(void)
 {
 	if (cpu_have_feature(S390_CPU_FEATURE_MSA) &&
 	    cpacf_query_func(CPACF_KIMD, CPACF_KIMD_SHA_256))
 		static_branch_enable(&have_cpacf_sha256);
diff --git a/lib/crypto/sparc/sha256.c b/lib/crypto/sparc/sha256.c
index 060664b88a6d3..f41c109c1c18d 100644
--- a/lib/crypto/sparc/sha256.c
+++ b/lib/crypto/sparc/sha256.c
@@ -30,16 +30,10 @@ void sha256_blocks_arch(struct sha256_block_state *state,
 	else
 		sha256_blocks_generic(state, data, nblocks);
 }
 EXPORT_SYMBOL_GPL(sha256_blocks_arch);
 
-bool sha256_is_arch_optimized(void)
-{
-	return static_key_enabled(&have_sha256_opcodes);
-}
-EXPORT_SYMBOL_GPL(sha256_is_arch_optimized);
-
 static int __init sha256_sparc64_mod_init(void)
 {
 	unsigned long cfr;
 
 	if (!(sparc64_elf_hwcap & HWCAP_SPARC_CRYPTO))
diff --git a/lib/crypto/x86/sha256.c b/lib/crypto/x86/sha256.c
index cbb45defbefab..9ee38d2b3d572 100644
--- a/lib/crypto/x86/sha256.c
+++ b/lib/crypto/x86/sha256.c
@@ -35,16 +35,10 @@ void sha256_blocks_arch(struct sha256_block_state *state,
 		sha256_blocks_generic(state, data, nblocks);
 	}
 }
 EXPORT_SYMBOL_GPL(sha256_blocks_arch);
 
-bool sha256_is_arch_optimized(void)
-{
-	return static_key_enabled(&have_sha256_x86);
-}
-EXPORT_SYMBOL_GPL(sha256_is_arch_optimized);
-
 static int __init sha256_x86_mod_init(void)
 {
 	if (boot_cpu_has(X86_FEATURE_SHA_NI)) {
 		static_call_update(sha256_blocks_x86, sha256_ni_transform);
 	} else if (cpu_has_xfeatures(XFEATURE_MASK_SSE |
-- 
2.50.0


