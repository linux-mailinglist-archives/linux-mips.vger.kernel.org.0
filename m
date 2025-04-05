Return-Path: <linux-mips+bounces-8493-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF6AA7CB62
	for <lists+linux-mips@lfdr.de>; Sat,  5 Apr 2025 20:31:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E47B3B7D85
	for <lists+linux-mips@lfdr.de>; Sat,  5 Apr 2025 18:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677401E5217;
	Sat,  5 Apr 2025 18:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PQAXJq/n"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DE21E1DEE;
	Sat,  5 Apr 2025 18:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743877857; cv=none; b=RqbT59SAu6E/2RKW01W1Bsjplk56P9ayDEcbwdgLyhEviUzjttwkfXgIoijfiIfoJBZwInXt7mi10hyU9yUxaDYWg6+eXR7BE4x/aVA4PiSUa4P7hDQvSmCMV2+IaEGKSQSbs5GgFBxd3ZdWXlxnYVCJteIuwk2217dFWd+2wJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743877857; c=relaxed/simple;
	bh=Xwh08sUrwMmQCiHRbYZtr7YEg0mBK+LLgKoP4B4fAZs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZPt8dURuN5vm9RKOBO1tiUpJkbLb72icXdo6BhnG9Am6IZh8w4mqoThJ6f6y59IDe5aj518fv/atlojrvZI7VGig+afOYNyNUAaIyHW5hhxZ4HeNm2xlFZVIYAEsJeZG4QE0jHlBpx0xlEKQ94sS3PlovURNlNOMkxmlt7xn5JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PQAXJq/n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42FF8C4CEE7;
	Sat,  5 Apr 2025 18:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743877856;
	bh=Xwh08sUrwMmQCiHRbYZtr7YEg0mBK+LLgKoP4B4fAZs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PQAXJq/nTIrYXPGSD4Rnn6n3p4oa0uFWpwBny/fE1QMrnfmFAqlzJGqii9u2ExoNG
	 VCxf3BI4IuLWmrth2IQ2UWIgWYqoY8u577ch5z3LTqObfLB4+yYjIJh/iNoPuvTyHY
	 HKNBrhd0s8N4ndBt6e4BIcBy/UBCy2Hs84SVVpDfFKKV2MWLBgW6oThbeLlN1d6cy3
	 cJXJHokTaaCN+H0JLtR7gX603ND3ilHiSKtDygFGgyLfhRn4t2F2xgKehWPgykgrl2
	 3IGvAudA0Tkhuc4zSu/Gf30BqTSHJv8jBAdAAjhgKIHviWwQfAPkcbw43UA3Saj4X9
	 BiFzjf/Mh0KSQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 8/9] crypto: x86/chacha - remove the skcipher algorithms
Date: Sat,  5 Apr 2025 11:26:08 -0700
Message-ID: <20250405182609.404216-9-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250405182609.404216-1-ebiggers@kernel.org>
References: <20250405182609.404216-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

Since crypto/chacha.c now registers chacha20-$(ARCH), xchacha20-$(ARCH),
and xchacha12-$(ARCH) skcipher algorithms that use the architecture's
ChaCha and HChaCha library functions, individual architectures no longer
need to do the same.  Therefore, remove the redundant skcipher
algorithms and leave just the library functions.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/x86/crypto/Kconfig       |   9 ---
 arch/x86/crypto/chacha_glue.c | 142 +---------------------------------
 2 files changed, 4 insertions(+), 147 deletions(-)

diff --git a/arch/x86/crypto/Kconfig b/arch/x86/crypto/Kconfig
index 3d948f10c94cd..8cf0a3f55576e 100644
--- a/arch/x86/crypto/Kconfig
+++ b/arch/x86/crypto/Kconfig
@@ -350,22 +350,13 @@ config CRYPTO_ARIA_GFNI_AVX512_X86_64
 	  Processes 64 blocks in parallel.
 
 config CRYPTO_CHACHA20_X86_64
 	tristate
 	depends on X86 && 64BIT
-	select CRYPTO_SKCIPHER
 	select CRYPTO_LIB_CHACHA_GENERIC
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
 	default CRYPTO_LIB_CHACHA_INTERNAL
-	help
-	  Length-preserving ciphers: ChaCha20, XChaCha20, and XChaCha12
-	  stream cipher algorithms
-
-	  Architecture: x86_64 using:
-	  - SSSE3 (Supplemental SSE3)
-	  - AVX2 (Advanced Vector Extensions 2)
-	  - AVX-512VL (Advanced Vector Extensions-512VL)
 
 config CRYPTO_AEGIS128_AESNI_SSE2
 	tristate "AEAD ciphers: AEGIS-128 (AES-NI/SSE4.1)"
 	depends on X86 && 64BIT
 	select CRYPTO_AEAD
diff --git a/arch/x86/crypto/chacha_glue.c b/arch/x86/crypto/chacha_glue.c
index 83a07b31cdd3a..71ec959caadaa 100644
--- a/arch/x86/crypto/chacha_glue.c
+++ b/arch/x86/crypto/chacha_glue.c
@@ -1,17 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * x64 SIMD accelerated ChaCha and XChaCha stream ciphers,
- * including ChaCha20 (RFC7539)
+ * ChaCha and HChaCha functions (x86_64 optimized)
  *
  * Copyright (C) 2015 Martin Willi
  */
 
-#include <crypto/algapi.h>
-#include <crypto/internal/chacha.h>
+#include <crypto/chacha.h>
 #include <crypto/internal/simd.h>
-#include <crypto/internal/skcipher.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/sizes.h>
 #include <asm/simd.h>
 
@@ -152,126 +149,10 @@ void chacha_crypt_arch(u32 *state, u8 *dst, const u8 *src, unsigned int bytes,
 		dst += todo;
 	} while (bytes);
 }
 EXPORT_SYMBOL(chacha_crypt_arch);
 
-static int chacha_simd_stream_xor(struct skcipher_request *req,
-				  const struct chacha_ctx *ctx, const u8 *iv)
-{
-	u32 state[CHACHA_STATE_WORDS] __aligned(8);
-	struct skcipher_walk walk;
-	int err;
-
-	err = skcipher_walk_virt(&walk, req, false);
-
-	chacha_init(state, ctx->key, iv);
-
-	while (walk.nbytes > 0) {
-		unsigned int nbytes = walk.nbytes;
-
-		if (nbytes < walk.total)
-			nbytes = round_down(nbytes, walk.stride);
-
-		if (!static_branch_likely(&chacha_use_simd) ||
-		    !crypto_simd_usable()) {
-			chacha_crypt_generic(state, walk.dst.virt.addr,
-					     walk.src.virt.addr, nbytes,
-					     ctx->nrounds);
-		} else {
-			kernel_fpu_begin();
-			chacha_dosimd(state, walk.dst.virt.addr,
-				      walk.src.virt.addr, nbytes,
-				      ctx->nrounds);
-			kernel_fpu_end();
-		}
-		err = skcipher_walk_done(&walk, walk.nbytes - nbytes);
-	}
-
-	return err;
-}
-
-static int chacha_simd(struct skcipher_request *req)
-{
-	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
-	struct chacha_ctx *ctx = crypto_skcipher_ctx(tfm);
-
-	return chacha_simd_stream_xor(req, ctx, req->iv);
-}
-
-static int xchacha_simd(struct skcipher_request *req)
-{
-	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
-	struct chacha_ctx *ctx = crypto_skcipher_ctx(tfm);
-	u32 state[CHACHA_STATE_WORDS] __aligned(8);
-	struct chacha_ctx subctx;
-	u8 real_iv[16];
-
-	chacha_init(state, ctx->key, req->iv);
-
-	if (req->cryptlen > CHACHA_BLOCK_SIZE && crypto_simd_usable()) {
-		kernel_fpu_begin();
-		hchacha_block_ssse3(state, subctx.key, ctx->nrounds);
-		kernel_fpu_end();
-	} else {
-		hchacha_block_generic(state, subctx.key, ctx->nrounds);
-	}
-	subctx.nrounds = ctx->nrounds;
-
-	memcpy(&real_iv[0], req->iv + 24, 8);
-	memcpy(&real_iv[8], req->iv + 16, 8);
-	return chacha_simd_stream_xor(req, &subctx, real_iv);
-}
-
-static struct skcipher_alg algs[] = {
-	{
-		.base.cra_name		= "chacha20",
-		.base.cra_driver_name	= "chacha20-simd",
-		.base.cra_priority	= 300,
-		.base.cra_blocksize	= 1,
-		.base.cra_ctxsize	= sizeof(struct chacha_ctx),
-		.base.cra_module	= THIS_MODULE,
-
-		.min_keysize		= CHACHA_KEY_SIZE,
-		.max_keysize		= CHACHA_KEY_SIZE,
-		.ivsize			= CHACHA_IV_SIZE,
-		.chunksize		= CHACHA_BLOCK_SIZE,
-		.setkey			= chacha20_setkey,
-		.encrypt		= chacha_simd,
-		.decrypt		= chacha_simd,
-	}, {
-		.base.cra_name		= "xchacha20",
-		.base.cra_driver_name	= "xchacha20-simd",
-		.base.cra_priority	= 300,
-		.base.cra_blocksize	= 1,
-		.base.cra_ctxsize	= sizeof(struct chacha_ctx),
-		.base.cra_module	= THIS_MODULE,
-
-		.min_keysize		= CHACHA_KEY_SIZE,
-		.max_keysize		= CHACHA_KEY_SIZE,
-		.ivsize			= XCHACHA_IV_SIZE,
-		.chunksize		= CHACHA_BLOCK_SIZE,
-		.setkey			= chacha20_setkey,
-		.encrypt		= xchacha_simd,
-		.decrypt		= xchacha_simd,
-	}, {
-		.base.cra_name		= "xchacha12",
-		.base.cra_driver_name	= "xchacha12-simd",
-		.base.cra_priority	= 300,
-		.base.cra_blocksize	= 1,
-		.base.cra_ctxsize	= sizeof(struct chacha_ctx),
-		.base.cra_module	= THIS_MODULE,
-
-		.min_keysize		= CHACHA_KEY_SIZE,
-		.max_keysize		= CHACHA_KEY_SIZE,
-		.ivsize			= XCHACHA_IV_SIZE,
-		.chunksize		= CHACHA_BLOCK_SIZE,
-		.setkey			= chacha12_setkey,
-		.encrypt		= xchacha_simd,
-		.decrypt		= xchacha_simd,
-	},
-};
-
 bool chacha_is_arch_optimized(void)
 {
 	return static_key_enabled(&chacha_use_simd);
 }
 EXPORT_SYMBOL(chacha_is_arch_optimized);
@@ -291,27 +172,12 @@ static int __init chacha_simd_mod_init(void)
 		if (IS_ENABLED(CONFIG_AS_AVX512) &&
 		    boot_cpu_has(X86_FEATURE_AVX512VL) &&
 		    boot_cpu_has(X86_FEATURE_AVX512BW)) /* kmovq */
 			static_branch_enable(&chacha_use_avx512vl);
 	}
-	return IS_REACHABLE(CONFIG_CRYPTO_SKCIPHER) ?
-		crypto_register_skciphers(algs, ARRAY_SIZE(algs)) : 0;
+	return 0;
 }
-
-static void __exit chacha_simd_mod_fini(void)
-{
-	if (IS_REACHABLE(CONFIG_CRYPTO_SKCIPHER) && boot_cpu_has(X86_FEATURE_SSSE3))
-		crypto_unregister_skciphers(algs, ARRAY_SIZE(algs));
-}
-
 arch_initcall(chacha_simd_mod_init);
-module_exit(chacha_simd_mod_fini);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Martin Willi <martin@strongswan.org>");
-MODULE_DESCRIPTION("ChaCha and XChaCha stream ciphers (x64 SIMD accelerated)");
-MODULE_ALIAS_CRYPTO("chacha20");
-MODULE_ALIAS_CRYPTO("chacha20-simd");
-MODULE_ALIAS_CRYPTO("xchacha20");
-MODULE_ALIAS_CRYPTO("xchacha20-simd");
-MODULE_ALIAS_CRYPTO("xchacha12");
-MODULE_ALIAS_CRYPTO("xchacha12-simd");
+MODULE_DESCRIPTION("ChaCha and HChaCha functions (x86_64 optimized)");
-- 
2.49.0


