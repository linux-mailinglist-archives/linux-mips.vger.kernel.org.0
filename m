Return-Path: <linux-mips+bounces-8574-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 868D1A870A7
	for <lists+linux-mips@lfdr.de>; Sun, 13 Apr 2025 06:55:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49861173378
	for <lists+linux-mips@lfdr.de>; Sun, 13 Apr 2025 04:55:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9B70155C82;
	Sun, 13 Apr 2025 04:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="raC1yaz/"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAACB1514E4;
	Sun, 13 Apr 2025 04:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744520140; cv=none; b=qnpI0QvAgwoPiLcEvZjY/vQx7zbGC6FlV/u9u/aPLibEozersaXCNNc+znMy+o6rr+L5h00FVsVe7Izx+KuKXspi43tAtpMhRV3FfEVgTuQWFcPgpxXf2oZ9rTE5VRFRFq0kf3Yuh6PgqTCLgrlqIHHxuaE+3JBIbEmP94KgCW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744520140; c=relaxed/simple;
	bh=0eZGQ4HOV8ila8DyyAF1mDleVNmhJHh2p5GKktNCdP0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K2uJ0x8PDgfbyNNOM4KITzGDpLol+DbWi8QSygxat/VAb9v4wesVPyshPL2oDo+sFL+uLEDztEG/HvWt2PqQhB9wWczEm1bE56axR7AclLZgfgiJ2CH/MtZnjO+D95PF2/8aBGwItnRsemF5KjxmMNMRq2uEuyrJU3raFteDT7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=raC1yaz/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7EE6C4CEEC;
	Sun, 13 Apr 2025 04:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744520140;
	bh=0eZGQ4HOV8ila8DyyAF1mDleVNmhJHh2p5GKktNCdP0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=raC1yaz/NDXB5M5reoTn4t/01dfz407KBNfd0K/poDFbBFUEXP/CzzQ/h7BteTKya
	 +l7uKwR0/amZTMR3DiCT4nH7nArCjhZueQexvrtZHd1cqtpaZmRDLh5ctmFa/17nNz
	 YvKl3VfyjfrY+n4+fVBaZFVabVob+HzAYlmZBeuLJed3kN9mqzNFK1Dr+NpPQHmKfv
	 aTwBkkxbcyoedBvl/d93d69Apzs8J+eTE/mQIYs1kMuv509JB0qmRvALse4njknTIM
	 +MqCByN2EQaGo2r6lHoqjSObkDTt2F9oRPuZ1LRLrdmx8gkUI1M9HlEWVfoq+o2o+e
	 OGm+yRM8WpVlw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	Danny Tsen <dtsen@linux.ibm.com>
Subject: [PATCH 1/9] crypto: powerpc/poly1305 - implement library instead of shash
Date: Sat, 12 Apr 2025 21:54:13 -0700
Message-ID: <20250413045421.55100-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413045421.55100-1-ebiggers@kernel.org>
References: <20250413045421.55100-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

Currently the Power10 optimized Poly1305 is only wired up to the
crypto_shash API, which makes it unavailable to users of the library
API.  The crypto_shash API for Poly1305 is going to change to be
implemented on top of the library API, so the library API needs to be
supported.  And of course it's needed anyway to serve the library users.

Therefore, change the Power10 optimized Poly1305 code to implement the
library API instead of the crypto_shash API.

Cc: Danny Tsen <dtsen@linux.ibm.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/powerpc/crypto/Kconfig             |  11 +-
 arch/powerpc/crypto/poly1305-p10-glue.c | 132 +++++++-----------------
 2 files changed, 39 insertions(+), 104 deletions(-)

diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
index 47dccdd49637..cbcf76953d83 100644
--- a/arch/powerpc/crypto/Kconfig
+++ b/arch/powerpc/crypto/Kconfig
@@ -98,20 +98,15 @@ config CRYPTO_CHACHA20_P10
 	select CRYPTO_LIB_CHACHA_GENERIC
 	select CRYPTO_ARCH_HAVE_LIB_CHACHA
 	default CRYPTO_LIB_CHACHA_INTERNAL
 
 config CRYPTO_POLY1305_P10
-	tristate "Hash functions: Poly1305 (P10 or later)"
+	tristate
 	depends on PPC64 && CPU_LITTLE_ENDIAN && VSX
-	select CRYPTO_HASH
+	select CRYPTO_ARCH_HAVE_LIB_POLY1305
 	select CRYPTO_LIB_POLY1305_GENERIC
-	help
-	  Poly1305 authenticator algorithm (RFC7539)
-
-	  Architecture: PowerPC64
-	  - Power10 or later
-	  - Little-endian
+	default CRYPTO_LIB_POLY1305_INTERNAL
 
 config CRYPTO_DEV_VMX
         bool "Support for VMX cryptographic acceleration instructions"
         depends on PPC64 && VSX
         help
diff --git a/arch/powerpc/crypto/poly1305-p10-glue.c b/arch/powerpc/crypto/poly1305-p10-glue.c
index 369686e9370b..87bd5eba4497 100644
--- a/arch/powerpc/crypto/poly1305-p10-glue.c
+++ b/arch/powerpc/crypto/poly1305-p10-glue.c
@@ -2,28 +2,26 @@
 /*
  * Poly1305 authenticator algorithm, RFC7539.
  *
  * Copyright 2023- IBM Corp. All rights reserved.
  */
-
-#include <crypto/algapi.h>
-#include <linux/crypto.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/jump_label.h>
-#include <crypto/internal/hash.h>
-#include <crypto/internal/poly1305.h>
 #include <crypto/internal/simd.h>
+#include <crypto/poly1305.h>
 #include <linux/cpufeature.h>
 #include <linux/unaligned.h>
 #include <asm/simd.h>
 #include <asm/switch_to.h>
 
 asmlinkage void poly1305_p10le_4blocks(void *h, const u8 *m, u32 mlen);
 asmlinkage void poly1305_64s(void *h, const u8 *m, u32 mlen, int highbit);
 asmlinkage void poly1305_emit_64(void *h, void *s, u8 *dst);
 
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_p10);
+
 static void vsx_begin(void)
 {
 	preempt_disable();
 	enable_kernel_vsx();
 }
@@ -32,82 +30,50 @@ static void vsx_end(void)
 {
 	disable_kernel_vsx();
 	preempt_enable();
 }
 
-static int crypto_poly1305_p10_init(struct shash_desc *desc)
+void poly1305_init_arch(struct poly1305_desc_ctx *dctx, const u8 key[POLY1305_KEY_SIZE])
 {
-	struct poly1305_desc_ctx *dctx = shash_desc_ctx(desc);
-
-	poly1305_core_init(&dctx->h);
+	if (!static_key_enabled(&have_p10))
+		return poly1305_init_generic(dctx, key);
+
+	dctx->h = (struct poly1305_state){};
+	dctx->core_r.key.r64[0] = get_unaligned_le64(key + 0);
+	dctx->core_r.key.r64[1] = get_unaligned_le64(key + 8);
+	dctx->s[0] = get_unaligned_le32(key + 16);
+	dctx->s[1] = get_unaligned_le32(key + 20);
+	dctx->s[2] = get_unaligned_le32(key + 24);
+	dctx->s[3] = get_unaligned_le32(key + 28);
 	dctx->buflen = 0;
-	dctx->rset = 0;
-	dctx->sset = false;
-
-	return 0;
 }
+EXPORT_SYMBOL(poly1305_init_arch);
 
-static unsigned int crypto_poly1305_setdctxkey(struct poly1305_desc_ctx *dctx,
-					       const u8 *inp, unsigned int len)
+void poly1305_update_arch(struct poly1305_desc_ctx *dctx,
+			  const u8 *src, unsigned int srclen)
 {
-	unsigned int acc = 0;
-
-	if (unlikely(!dctx->sset)) {
-		if (!dctx->rset && len >= POLY1305_BLOCK_SIZE) {
-			struct poly1305_core_key *key = &dctx->core_r;
-
-			key->key.r64[0] = get_unaligned_le64(&inp[0]);
-			key->key.r64[1] = get_unaligned_le64(&inp[8]);
-			inp += POLY1305_BLOCK_SIZE;
-			len -= POLY1305_BLOCK_SIZE;
-			acc += POLY1305_BLOCK_SIZE;
-			dctx->rset = 1;
-		}
-		if (len >= POLY1305_BLOCK_SIZE) {
-			dctx->s[0] = get_unaligned_le32(&inp[0]);
-			dctx->s[1] = get_unaligned_le32(&inp[4]);
-			dctx->s[2] = get_unaligned_le32(&inp[8]);
-			dctx->s[3] = get_unaligned_le32(&inp[12]);
-			acc += POLY1305_BLOCK_SIZE;
-			dctx->sset = true;
-		}
-	}
-	return acc;
-}
+	unsigned int bytes;
 
-static int crypto_poly1305_p10_update(struct shash_desc *desc,
-				      const u8 *src, unsigned int srclen)
-{
-	struct poly1305_desc_ctx *dctx = shash_desc_ctx(desc);
-	unsigned int bytes, used;
+	if (!static_key_enabled(&have_p10))
+		return poly1305_update_generic(dctx, src, srclen);
 
 	if (unlikely(dctx->buflen)) {
 		bytes = min(srclen, POLY1305_BLOCK_SIZE - dctx->buflen);
 		memcpy(dctx->buf + dctx->buflen, src, bytes);
 		src += bytes;
 		srclen -= bytes;
 		dctx->buflen += bytes;
-
-		if (dctx->buflen == POLY1305_BLOCK_SIZE) {
-			if (likely(!crypto_poly1305_setdctxkey(dctx, dctx->buf,
-							       POLY1305_BLOCK_SIZE))) {
-				vsx_begin();
-				poly1305_64s(&dctx->h, dctx->buf,
-						  POLY1305_BLOCK_SIZE, 1);
-				vsx_end();
-			}
-			dctx->buflen = 0;
-		}
+		if (dctx->buflen < POLY1305_BLOCK_SIZE)
+			return;
+		vsx_begin();
+		poly1305_64s(&dctx->h, dctx->buf, POLY1305_BLOCK_SIZE, 1);
+		vsx_end();
+		dctx->buflen = 0;
 	}
 
 	if (likely(srclen >= POLY1305_BLOCK_SIZE)) {
 		bytes = round_down(srclen, POLY1305_BLOCK_SIZE);
-		used = crypto_poly1305_setdctxkey(dctx, src, bytes);
-		if (likely(used)) {
-			srclen -= used;
-			src += used;
-		}
 		if (crypto_simd_usable() && (srclen >= POLY1305_BLOCK_SIZE*4)) {
 			vsx_begin();
 			poly1305_p10le_4blocks(&dctx->h, src, srclen);
 			vsx_end();
 			src += srclen - (srclen % (POLY1305_BLOCK_SIZE * 4));
@@ -124,63 +90,37 @@ static int crypto_poly1305_p10_update(struct shash_desc *desc,
 
 	if (unlikely(srclen)) {
 		dctx->buflen = srclen;
 		memcpy(dctx->buf, src, srclen);
 	}
-
-	return 0;
 }
+EXPORT_SYMBOL(poly1305_update_arch);
 
-static int crypto_poly1305_p10_final(struct shash_desc *desc, u8 *dst)
+void poly1305_final_arch(struct poly1305_desc_ctx *dctx, u8 *dst)
 {
-	struct poly1305_desc_ctx *dctx = shash_desc_ctx(desc);
+	if (!static_key_enabled(&have_p10))
+		return poly1305_final_generic(dctx, dst);
 
-	if (unlikely(!dctx->sset))
-		return -ENOKEY;
-
-	if ((dctx->buflen)) {
+	if (dctx->buflen) {
 		dctx->buf[dctx->buflen++] = 1;
 		memset(dctx->buf + dctx->buflen, 0,
 		       POLY1305_BLOCK_SIZE - dctx->buflen);
 		vsx_begin();
 		poly1305_64s(&dctx->h, dctx->buf, POLY1305_BLOCK_SIZE, 0);
 		vsx_end();
-		dctx->buflen = 0;
 	}
 
 	poly1305_emit_64(&dctx->h, &dctx->s, dst);
-	return 0;
 }
-
-static struct shash_alg poly1305_alg = {
-	.digestsize	= POLY1305_DIGEST_SIZE,
-	.init		= crypto_poly1305_p10_init,
-	.update		= crypto_poly1305_p10_update,
-	.final		= crypto_poly1305_p10_final,
-	.descsize	= sizeof(struct poly1305_desc_ctx),
-	.base		= {
-		.cra_name		= "poly1305",
-		.cra_driver_name	= "poly1305-p10",
-		.cra_priority		= 300,
-		.cra_blocksize		= POLY1305_BLOCK_SIZE,
-		.cra_module		= THIS_MODULE,
-	},
-};
+EXPORT_SYMBOL(poly1305_final_arch);
 
 static int __init poly1305_p10_init(void)
 {
-	return crypto_register_shash(&poly1305_alg);
-}
-
-static void __exit poly1305_p10_exit(void)
-{
-	crypto_unregister_shash(&poly1305_alg);
+	if (cpu_has_feature(CPU_FTR_ARCH_31))
+		static_branch_enable(&have_p10);
+	return 0;
 }
-
-module_cpu_feature_match(PPC_MODULE_FEATURE_P10, poly1305_p10_init);
-module_exit(poly1305_p10_exit);
+arch_initcall(poly1305_p10_init);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Danny Tsen <dtsen@linux.ibm.com>");
 MODULE_DESCRIPTION("Optimized Poly1305 for P10");
-MODULE_ALIAS_CRYPTO("poly1305");
-MODULE_ALIAS_CRYPTO("poly1305-p10");

base-commit: 3be3f70ee95da03a87d94c4a714ee679a5c7b34d
-- 
2.49.0


