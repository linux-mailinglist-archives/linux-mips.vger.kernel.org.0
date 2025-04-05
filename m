Return-Path: <linux-mips+bounces-8490-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E91E2A7CB56
	for <lists+linux-mips@lfdr.de>; Sat,  5 Apr 2025 20:31:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E35687A7EB7
	for <lists+linux-mips@lfdr.de>; Sat,  5 Apr 2025 18:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDF231BD9C5;
	Sat,  5 Apr 2025 18:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BMvkeX7P"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8481B423E;
	Sat,  5 Apr 2025 18:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743877855; cv=none; b=GswxkghqY+KbDbSxw2VSrD7dLP7oQKncQHKat3IrLSVsnkpMAc2mvpD7kBOXl0AXs1SKx4QLnTFWYYM4Ym9hAbDbacV898mb3qu/+Gauc+fuTZYgujk0dKwfrzTuqpdGMskbjNhFQh5yrcKS55gDBzPssk647jgU68HZwom3nYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743877855; c=relaxed/simple;
	bh=3GecDYJPP+f/otGdToWIa9TB2f+in47vXsMRPZd3kDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ghd31yoE37ihh8wbnxoQFGglYrTAKwUcuiArGQ7kcxeCCqumBDy9Ngl5xgIwNwQIkIBKtW0/QLx3JP6TexXlQkE55nBfABoFX9qelyRzX+sOHxDoOy/SvGD8VHUXxidZ8qj3jD5uWRbLEnAEnBHmh5utr9IKO1JOWT4hgAWe1/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BMvkeX7P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC72FC4CEE4;
	Sat,  5 Apr 2025 18:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743877855;
	bh=3GecDYJPP+f/otGdToWIa9TB2f+in47vXsMRPZd3kDo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BMvkeX7PDVea3p39UTaGrF7AVBRn2MBPChS6OFi6ciRP0KDkF+rJawry/gPZGS2bo
	 kSnVQBXr669M4rcIWxd+LCz6OGQ6eqBMUF6SrycfjCv9AajLSUPLCfMApP4PVQB6BY
	 BCtfS7MzDpRRM0oxD0s5frAPm8YZx8Q0dfuwUWekYJaQPMfkO/bWdv8o9Kkm772t+I
	 rxLq5WBMke1+sdyDTXtkWqynjbBAaId1V5cQvdL3Vll9/u6CVRAAKb8w3NmLb6CPZv
	 Aj/VU9CLMWXaFtbR0F06zN2W4xfw/eecvkTamGE9xGSRM+MoJEkfsE8u2L0QyGZAbe
	 npBiy5Aho48zg==
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
Subject: [PATCH 5/9] crypto: mips/chacha - remove the skcipher algorithms
Date: Sat,  5 Apr 2025 11:26:05 -0700
Message-ID: <20250405182609.404216-6-ebiggers@kernel.org>
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
 arch/mips/crypto/Kconfig       |   6 --
 arch/mips/crypto/chacha-glue.c | 131 +--------------------------------
 2 files changed, 3 insertions(+), 134 deletions(-)

diff --git a/arch/mips/crypto/Kconfig b/arch/mips/crypto/Kconfig
index 545fc0e12422d..0189686de3a12 100644
--- a/arch/mips/crypto/Kconfig
+++ b/arch/mips/crypto/Kconfig
@@ -54,15 +54,9 @@ config CRYPTO_SHA512_OCTEON
 	  Architecture: mips OCTEON using crypto instructions, when available
 
 config CRYPTO_CHACHA_MIPS
 	tristate
 	depends on CPU_MIPS32_R2
-	select CRYPTO_SKCIPHER
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
 	default CRYPTO_LIB_CHACHA_INTERNAL
-	help
-	  Length-preserving ciphers: ChaCha20, XChaCha20, and XChaCha12
-	  stream cipher algorithms
-
-	  Architecture: MIPS32r2
 
 endmenu
diff --git a/arch/mips/crypto/chacha-glue.c b/arch/mips/crypto/chacha-glue.c
index 64ccaeaeaa1e1..334ecb29fb8fa 100644
--- a/arch/mips/crypto/chacha-glue.c
+++ b/arch/mips/crypto/chacha-glue.c
@@ -1,152 +1,27 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * MIPS accelerated ChaCha and XChaCha stream ciphers,
- * including ChaCha20 (RFC7539)
+ * ChaCha and HChaCha functions (MIPS optimized)
  *
  * Copyright (C) 2019 Linaro, Ltd. <ard.biesheuvel@linaro.org>
  */
 
-#include <asm/byteorder.h>
-#include <crypto/algapi.h>
-#include <crypto/internal/chacha.h>
-#include <crypto/internal/skcipher.h>
+#include <crypto/chacha.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
 asmlinkage void chacha_crypt_arch(u32 *state, u8 *dst, const u8 *src,
 				  unsigned int bytes, int nrounds);
 EXPORT_SYMBOL(chacha_crypt_arch);
 
 asmlinkage void hchacha_block_arch(const u32 *state, u32 *stream, int nrounds);
 EXPORT_SYMBOL(hchacha_block_arch);
 
-static int chacha_mips_stream_xor(struct skcipher_request *req,
-				  const struct chacha_ctx *ctx, const u8 *iv)
-{
-	struct skcipher_walk walk;
-	u32 state[16];
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
-		chacha_crypt(state, walk.dst.virt.addr, walk.src.virt.addr,
-			     nbytes, ctx->nrounds);
-		err = skcipher_walk_done(&walk, walk.nbytes - nbytes);
-	}
-
-	return err;
-}
-
-static int chacha_mips(struct skcipher_request *req)
-{
-	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
-	struct chacha_ctx *ctx = crypto_skcipher_ctx(tfm);
-
-	return chacha_mips_stream_xor(req, ctx, req->iv);
-}
-
-static int xchacha_mips(struct skcipher_request *req)
-{
-	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
-	struct chacha_ctx *ctx = crypto_skcipher_ctx(tfm);
-	struct chacha_ctx subctx;
-	u32 state[16];
-	u8 real_iv[16];
-
-	chacha_init(state, ctx->key, req->iv);
-
-	hchacha_block(state, subctx.key, ctx->nrounds);
-	subctx.nrounds = ctx->nrounds;
-
-	memcpy(&real_iv[0], req->iv + 24, 8);
-	memcpy(&real_iv[8], req->iv + 16, 8);
-	return chacha_mips_stream_xor(req, &subctx, real_iv);
-}
-
-static struct skcipher_alg algs[] = {
-	{
-		.base.cra_name		= "chacha20",
-		.base.cra_driver_name	= "chacha20-mips",
-		.base.cra_priority	= 200,
-		.base.cra_blocksize	= 1,
-		.base.cra_ctxsize	= sizeof(struct chacha_ctx),
-		.base.cra_module	= THIS_MODULE,
-
-		.min_keysize		= CHACHA_KEY_SIZE,
-		.max_keysize		= CHACHA_KEY_SIZE,
-		.ivsize			= CHACHA_IV_SIZE,
-		.chunksize		= CHACHA_BLOCK_SIZE,
-		.setkey			= chacha20_setkey,
-		.encrypt		= chacha_mips,
-		.decrypt		= chacha_mips,
-	}, {
-		.base.cra_name		= "xchacha20",
-		.base.cra_driver_name	= "xchacha20-mips",
-		.base.cra_priority	= 200,
-		.base.cra_blocksize	= 1,
-		.base.cra_ctxsize	= sizeof(struct chacha_ctx),
-		.base.cra_module	= THIS_MODULE,
-
-		.min_keysize		= CHACHA_KEY_SIZE,
-		.max_keysize		= CHACHA_KEY_SIZE,
-		.ivsize			= XCHACHA_IV_SIZE,
-		.chunksize		= CHACHA_BLOCK_SIZE,
-		.setkey			= chacha20_setkey,
-		.encrypt		= xchacha_mips,
-		.decrypt		= xchacha_mips,
-	}, {
-		.base.cra_name		= "xchacha12",
-		.base.cra_driver_name	= "xchacha12-mips",
-		.base.cra_priority	= 200,
-		.base.cra_blocksize	= 1,
-		.base.cra_ctxsize	= sizeof(struct chacha_ctx),
-		.base.cra_module	= THIS_MODULE,
-
-		.min_keysize		= CHACHA_KEY_SIZE,
-		.max_keysize		= CHACHA_KEY_SIZE,
-		.ivsize			= XCHACHA_IV_SIZE,
-		.chunksize		= CHACHA_BLOCK_SIZE,
-		.setkey			= chacha12_setkey,
-		.encrypt		= xchacha_mips,
-		.decrypt		= xchacha_mips,
-	}
-};
-
 bool chacha_is_arch_optimized(void)
 {
 	return true;
 }
 EXPORT_SYMBOL(chacha_is_arch_optimized);
 
-static int __init chacha_simd_mod_init(void)
-{
-	return IS_REACHABLE(CONFIG_CRYPTO_SKCIPHER) ?
-		crypto_register_skciphers(algs, ARRAY_SIZE(algs)) : 0;
-}
-
-static void __exit chacha_simd_mod_fini(void)
-{
-	if (IS_REACHABLE(CONFIG_CRYPTO_SKCIPHER))
-		crypto_unregister_skciphers(algs, ARRAY_SIZE(algs));
-}
-
-arch_initcall(chacha_simd_mod_init);
-module_exit(chacha_simd_mod_fini);
-
-MODULE_DESCRIPTION("ChaCha and XChaCha stream ciphers (MIPS accelerated)");
+MODULE_DESCRIPTION("ChaCha and HChaCha functions (MIPS optimized)");
 MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS_CRYPTO("chacha20");
-MODULE_ALIAS_CRYPTO("chacha20-mips");
-MODULE_ALIAS_CRYPTO("xchacha20");
-MODULE_ALIAS_CRYPTO("xchacha20-mips");
-MODULE_ALIAS_CRYPTO("xchacha12");
-MODULE_ALIAS_CRYPTO("xchacha12-mips");
-- 
2.49.0


