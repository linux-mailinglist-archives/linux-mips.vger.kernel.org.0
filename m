Return-Path: <linux-mips+bounces-8489-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 995CFA7CB52
	for <lists+linux-mips@lfdr.de>; Sat,  5 Apr 2025 20:31:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E146616C685
	for <lists+linux-mips@lfdr.de>; Sat,  5 Apr 2025 18:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09AF11AA1D8;
	Sat,  5 Apr 2025 18:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vt1yl7Lh"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C966F1A9B2B;
	Sat,  5 Apr 2025 18:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743877854; cv=none; b=jKnaC6/sm+CJy193rQVcRqPYThQFQOsAVuQCU4BI9sB1VgsgPZsTc0xo+5Y9PzWYf+WQ6LKpRK/k8eO/HpolBxZU+JGbnxint5zY3+gOpbUAuUBe6bRODS/LZh1yqU9U8fEhMkC69nhIPngsMbzGZ8ou8nUcbyn5H3TVQ1ebBtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743877854; c=relaxed/simple;
	bh=/YsQAqEWiFVgtY7NB130SUnvpny2qsjrrQSIe4BWHhI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t15D0hL5wLUW2n6RW/5dbkSeHrIVFyI2InIbu8Xm+wnFEzKMGsnbNFh4oDTtb6/u2iOHdQaUN3H45SRshvXTSQE8gSbSVYUaY6fKXUCRtLUebwzOoNDqs/Q/lNMASdfkSQNJBpNCpznagBPiW/O1d28Gb5LK9eHLsZI5cWXmj8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vt1yl7Lh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56EB2C4CEEB;
	Sat,  5 Apr 2025 18:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743877854;
	bh=/YsQAqEWiFVgtY7NB130SUnvpny2qsjrrQSIe4BWHhI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vt1yl7LhoNBAre23bvVjNQQimbyoMqFuQeFMo/U+MgneXLvBOZdIQ3VzJVLNiCaUo
	 GsXFs93u7q+cyqywulR9bFvE7Ua1VmAEhrKVtimxgM6w2QktG1OdtG4HqaQvsfQA5S
	 39TBRSiLBNVzVyY+SyJOgdQ3U/smTyqSNW7tHwwdK2RwU9HrUdyIZk1Wa8xP+I3i1j
	 dao9ZIFX6i6tEHk+Dta1g3iUZwl45cY05XQXK4zU2qZPDQXSn+GbytrJrR/WUNY7LF
	 4T9ySj/RUuedagAt7Kn5YUbeEUD43AefnX1l1o+CCdvSkH+P9+oMLjEvt8lW3feOsE
	 XNGvQ5idyUpVg==
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
Subject: [PATCH 4/9] crypto: arm64/chacha - remove the skcipher algorithms
Date: Sat,  5 Apr 2025 11:26:04 -0700
Message-ID: <20250405182609.404216-5-ebiggers@kernel.org>
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
 arch/arm64/crypto/Kconfig            |   7 --
 arch/arm64/crypto/chacha-neon-core.S |   2 +-
 arch/arm64/crypto/chacha-neon-glue.c | 144 ++-------------------------
 3 files changed, 7 insertions(+), 146 deletions(-)

diff --git a/arch/arm64/crypto/Kconfig b/arch/arm64/crypto/Kconfig
index 3418c8d3c78d4..ce655da0fbeea 100644
--- a/arch/arm64/crypto/Kconfig
+++ b/arch/arm64/crypto/Kconfig
@@ -187,20 +187,13 @@ config CRYPTO_AES_ARM64_NEON_BLK
 	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_CHACHA20_NEON
 	tristate
 	depends on KERNEL_MODE_NEON
-	select CRYPTO_SKCIPHER
 	select CRYPTO_LIB_CHACHA_GENERIC
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
 	default CRYPTO_LIB_CHACHA_INTERNAL
-	help
-	  Length-preserving ciphers: ChaCha20, XChaCha20, and XChaCha12
-	  stream cipher algorithms
-
-	  Architecture: arm64 using:
-	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_AES_ARM64_BS
 	tristate "Ciphers: AES, modes: ECB/CBC/CTR/XCTR/XTS modes (bit-sliced NEON)"
 	depends on KERNEL_MODE_NEON
 	select CRYPTO_SKCIPHER
diff --git a/arch/arm64/crypto/chacha-neon-core.S b/arch/arm64/crypto/chacha-neon-core.S
index b70ac76f2610c..80079586ecc7a 100644
--- a/arch/arm64/crypto/chacha-neon-core.S
+++ b/arch/arm64/crypto/chacha-neon-core.S
@@ -1,7 +1,7 @@
 /*
- * ChaCha/XChaCha NEON helper functions
+ * ChaCha/HChaCha NEON helper functions
  *
  * Copyright (C) 2016-2018 Linaro, Ltd. <ard.biesheuvel@linaro.org>
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
diff --git a/arch/arm64/crypto/chacha-neon-glue.c b/arch/arm64/crypto/chacha-neon-glue.c
index bb9b52321bda7..a0c336b284027 100644
--- a/arch/arm64/crypto/chacha-neon-glue.c
+++ b/arch/arm64/crypto/chacha-neon-glue.c
@@ -1,8 +1,7 @@
 /*
- * ARM NEON and scalar accelerated ChaCha and XChaCha stream ciphers,
- * including ChaCha20 (RFC7539)
+ * ChaCha and HChaCha functions (ARM64 optimized)
  *
  * Copyright (C) 2016 - 2017 Linaro, Ltd. <ard.biesheuvel@linaro.org>
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
@@ -17,14 +16,12 @@
  * it under the terms of the GNU General Public License as published by
  * the Free Software Foundation; either version 2 of the License, or
  * (at your option) any later version.
  */
 
-#include <crypto/algapi.h>
-#include <crypto/internal/chacha.h>
+#include <crypto/chacha.h>
 #include <crypto/internal/simd.h>
-#include <crypto/internal/skcipher.h>
 #include <linux/jump_label.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
 #include <asm/hwcap.h>
@@ -93,151 +90,22 @@ void chacha_crypt_arch(u32 *state, u8 *dst, const u8 *src, unsigned int bytes,
 		dst += todo;
 	} while (bytes);
 }
 EXPORT_SYMBOL(chacha_crypt_arch);
 
-static int chacha_neon_stream_xor(struct skcipher_request *req,
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
-			nbytes = rounddown(nbytes, walk.stride);
-
-		if (!static_branch_likely(&have_neon) ||
-		    !crypto_simd_usable()) {
-			chacha_crypt_generic(state, walk.dst.virt.addr,
-					     walk.src.virt.addr, nbytes,
-					     ctx->nrounds);
-		} else {
-			kernel_neon_begin();
-			chacha_doneon(state, walk.dst.virt.addr,
-				      walk.src.virt.addr, nbytes, ctx->nrounds);
-			kernel_neon_end();
-		}
-		err = skcipher_walk_done(&walk, walk.nbytes - nbytes);
-	}
-
-	return err;
-}
-
-static int chacha_neon(struct skcipher_request *req)
-{
-	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
-	struct chacha_ctx *ctx = crypto_skcipher_ctx(tfm);
-
-	return chacha_neon_stream_xor(req, ctx, req->iv);
-}
-
-static int xchacha_neon(struct skcipher_request *req)
-{
-	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
-	struct chacha_ctx *ctx = crypto_skcipher_ctx(tfm);
-	struct chacha_ctx subctx;
-	u32 state[16];
-	u8 real_iv[16];
-
-	chacha_init(state, ctx->key, req->iv);
-	hchacha_block_arch(state, subctx.key, ctx->nrounds);
-	subctx.nrounds = ctx->nrounds;
-
-	memcpy(&real_iv[0], req->iv + 24, 8);
-	memcpy(&real_iv[8], req->iv + 16, 8);
-	return chacha_neon_stream_xor(req, &subctx, real_iv);
-}
-
-static struct skcipher_alg algs[] = {
-	{
-		.base.cra_name		= "chacha20",
-		.base.cra_driver_name	= "chacha20-neon",
-		.base.cra_priority	= 300,
-		.base.cra_blocksize	= 1,
-		.base.cra_ctxsize	= sizeof(struct chacha_ctx),
-		.base.cra_module	= THIS_MODULE,
-
-		.min_keysize		= CHACHA_KEY_SIZE,
-		.max_keysize		= CHACHA_KEY_SIZE,
-		.ivsize			= CHACHA_IV_SIZE,
-		.chunksize		= CHACHA_BLOCK_SIZE,
-		.walksize		= 5 * CHACHA_BLOCK_SIZE,
-		.setkey			= chacha20_setkey,
-		.encrypt		= chacha_neon,
-		.decrypt		= chacha_neon,
-	}, {
-		.base.cra_name		= "xchacha20",
-		.base.cra_driver_name	= "xchacha20-neon",
-		.base.cra_priority	= 300,
-		.base.cra_blocksize	= 1,
-		.base.cra_ctxsize	= sizeof(struct chacha_ctx),
-		.base.cra_module	= THIS_MODULE,
-
-		.min_keysize		= CHACHA_KEY_SIZE,
-		.max_keysize		= CHACHA_KEY_SIZE,
-		.ivsize			= XCHACHA_IV_SIZE,
-		.chunksize		= CHACHA_BLOCK_SIZE,
-		.walksize		= 5 * CHACHA_BLOCK_SIZE,
-		.setkey			= chacha20_setkey,
-		.encrypt		= xchacha_neon,
-		.decrypt		= xchacha_neon,
-	}, {
-		.base.cra_name		= "xchacha12",
-		.base.cra_driver_name	= "xchacha12-neon",
-		.base.cra_priority	= 300,
-		.base.cra_blocksize	= 1,
-		.base.cra_ctxsize	= sizeof(struct chacha_ctx),
-		.base.cra_module	= THIS_MODULE,
-
-		.min_keysize		= CHACHA_KEY_SIZE,
-		.max_keysize		= CHACHA_KEY_SIZE,
-		.ivsize			= XCHACHA_IV_SIZE,
-		.chunksize		= CHACHA_BLOCK_SIZE,
-		.walksize		= 5 * CHACHA_BLOCK_SIZE,
-		.setkey			= chacha12_setkey,
-		.encrypt		= xchacha_neon,
-		.decrypt		= xchacha_neon,
-	}
-};
-
 bool chacha_is_arch_optimized(void)
 {
 	return static_key_enabled(&have_neon);
 }
 EXPORT_SYMBOL(chacha_is_arch_optimized);
 
 static int __init chacha_simd_mod_init(void)
 {
-	if (!cpu_have_named_feature(ASIMD))
-		return 0;
-
-	static_branch_enable(&have_neon);
-
-	return IS_REACHABLE(CONFIG_CRYPTO_SKCIPHER) ?
-		crypto_register_skciphers(algs, ARRAY_SIZE(algs)) : 0;
+	if (cpu_have_named_feature(ASIMD))
+		static_branch_enable(&have_neon);
+	return 0;
 }
-
-static void __exit chacha_simd_mod_fini(void)
-{
-	if (IS_REACHABLE(CONFIG_CRYPTO_SKCIPHER) && cpu_have_named_feature(ASIMD))
-		crypto_unregister_skciphers(algs, ARRAY_SIZE(algs));
-}
-
 arch_initcall(chacha_simd_mod_init);
-module_exit(chacha_simd_mod_fini);
 
-MODULE_DESCRIPTION("ChaCha and XChaCha stream ciphers (NEON accelerated)");
+MODULE_DESCRIPTION("ChaCha and HChaCha functions (ARM64 optimized)");
 MODULE_AUTHOR("Ard Biesheuvel <ard.biesheuvel@linaro.org>");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS_CRYPTO("chacha20");
-MODULE_ALIAS_CRYPTO("chacha20-neon");
-MODULE_ALIAS_CRYPTO("xchacha20");
-MODULE_ALIAS_CRYPTO("xchacha20-neon");
-MODULE_ALIAS_CRYPTO("xchacha12");
-MODULE_ALIAS_CRYPTO("xchacha12-neon");
-- 
2.49.0


