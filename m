Return-Path: <linux-mips+bounces-8576-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B1BA870AE
	for <lists+linux-mips@lfdr.de>; Sun, 13 Apr 2025 06:56:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 814EC17353E
	for <lists+linux-mips@lfdr.de>; Sun, 13 Apr 2025 04:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3039D1714B3;
	Sun, 13 Apr 2025 04:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aqBiDJNe"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0373416C69F;
	Sun, 13 Apr 2025 04:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744520142; cv=none; b=lymGSWT5RVqz42L7RQt3PRV6XMHUAtqJs+80Jwq1eSBFysJeIDzTHnMDKUTUau7cTzkZClUbz7pHRvYisO7/9w99nPljfkWDjxYuZVpx3eTVws3uAg83YdDiwXIxj6WwqLJSSVmeJMq2WOH2bPiQn26eiw77NnRgoys4P982DaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744520142; c=relaxed/simple;
	bh=hZyztrbmssg+PrHVWx2Hv09SPvgkFndX9/sdkxmFyCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uLcfqaW/R47knd9GftEBmSgtoUlrwkaU9/8ekRwUeMO6O976uzXKMYHhEcVBTz8J/FUPSTT4ZPthp/Th4nB558M7i/sk6Kq1deYzhr+VyaRTFjIzaAb8tmjfZ9xa0hoOf9OU/gUn4i/0GwNmQ/Z2kJRBmkSA92ftDtDnMrj6jgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aqBiDJNe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10ACDC4CEEC;
	Sun, 13 Apr 2025 04:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744520141;
	bh=hZyztrbmssg+PrHVWx2Hv09SPvgkFndX9/sdkxmFyCM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aqBiDJNeYaacGQKLSOrtH0dEmHnz8GG7mwtiNLcT21DVDsTUo4a2IaxaEIwwY+a7x
	 dvmdb7NMOO7O4OucwSb/wmk2V6lsZVQTSYVyXTArnKXrs8+w8OvXrsYRPELDOOAozO
	 Z/A4AacddrqD236XPJvlGqNyhS96sc+eDhjDcoCv2uwOCcNh/oW7sXbh+gNdHoBBkW
	 ggSTugWAcoP8HkugkbFl2TPVoL2KfFoQLFclwOoMmJ2EHXE254NfXXBUOJGpjBVCtA
	 cVqQiGeYDG457JRu4L36AywhK9aOWYtt2rOxA/DkCJV0zHKmer/ll2wBuioClhzJ+o
	 x5dfUmi2MXaNg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org
Subject: [PATCH 3/9] crypto: arm/poly1305 - remove redundant shash algorithm
Date: Sat, 12 Apr 2025 21:54:15 -0700
Message-ID: <20250413045421.55100-4-ebiggers@kernel.org>
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

Since crypto/poly1305.c now registers a poly1305-$(ARCH) shash algorithm
that uses the architecture's Poly1305 library functions, individual
architectures no longer need to do the same.  Therefore, remove the
redundant shash algorithm from the arch-specific code and leave just the
library functions there.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm/crypto/Kconfig         |   6 --
 arch/arm/crypto/poly1305-glue.c | 167 +-------------------------------
 2 files changed, 3 insertions(+), 170 deletions(-)

diff --git a/arch/arm/crypto/Kconfig b/arch/arm/crypto/Kconfig
index 332f2430beec..3530e7c80793 100644
--- a/arch/arm/crypto/Kconfig
+++ b/arch/arm/crypto/Kconfig
@@ -46,18 +46,12 @@ config CRYPTO_NHPOLY1305_NEON
 	  Architecture: arm using:
 	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_POLY1305_ARM
 	tristate
-	select CRYPTO_HASH
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
 	default CRYPTO_LIB_POLY1305_INTERNAL
-	help
-	  Poly1305 authenticator algorithm (RFC7539)
-
-	  Architecture: arm optionally using
-	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_BLAKE2S_ARM
 	bool "Hash functions: BLAKE2s"
 	select CRYPTO_ARCH_HAVE_LIB_BLAKE2S
 	help
diff --git a/arch/arm/crypto/poly1305-glue.c b/arch/arm/crypto/poly1305-glue.c
index 238dbf50d05d..6d6998b3ec7e 100644
--- a/arch/arm/crypto/poly1305-glue.c
+++ b/arch/arm/crypto/poly1305-glue.c
@@ -6,19 +6,16 @@
  */
 
 #include <asm/hwcap.h>
 #include <asm/neon.h>
 #include <asm/simd.h>
-#include <linux/unaligned.h>
-#include <crypto/algapi.h>
-#include <crypto/internal/hash.h>
-#include <crypto/internal/poly1305.h>
+#include <crypto/poly1305.h>
 #include <crypto/internal/simd.h>
 #include <linux/cpufeature.h>
-#include <linux/crypto.h>
 #include <linux/jump_label.h>
 #include <linux/module.h>
+#include <linux/unaligned.h>
 
 void poly1305_init_arm(void *state, const u8 *key);
 void poly1305_blocks_arm(void *state, const u8 *src, u32 len, u32 hibit);
 void poly1305_blocks_neon(void *state, const u8 *src, u32 len, u32 hibit);
 void poly1305_emit_arm(void *state, u8 *digest, const u32 *nonce);
@@ -38,106 +35,10 @@ void poly1305_init_arch(struct poly1305_desc_ctx *dctx, const u8 key[POLY1305_KE
 	dctx->s[3] = get_unaligned_le32(key + 28);
 	dctx->buflen = 0;
 }
 EXPORT_SYMBOL(poly1305_init_arch);
 
-static int arm_poly1305_init(struct shash_desc *desc)
-{
-	struct poly1305_desc_ctx *dctx = shash_desc_ctx(desc);
-
-	dctx->buflen = 0;
-	dctx->rset = 0;
-	dctx->sset = false;
-
-	return 0;
-}
-
-static void arm_poly1305_blocks(struct poly1305_desc_ctx *dctx, const u8 *src,
-				 u32 len, u32 hibit, bool do_neon)
-{
-	if (unlikely(!dctx->sset)) {
-		if (!dctx->rset) {
-			poly1305_init_arm(&dctx->h, src);
-			src += POLY1305_BLOCK_SIZE;
-			len -= POLY1305_BLOCK_SIZE;
-			dctx->rset = 1;
-		}
-		if (len >= POLY1305_BLOCK_SIZE) {
-			dctx->s[0] = get_unaligned_le32(src +  0);
-			dctx->s[1] = get_unaligned_le32(src +  4);
-			dctx->s[2] = get_unaligned_le32(src +  8);
-			dctx->s[3] = get_unaligned_le32(src + 12);
-			src += POLY1305_BLOCK_SIZE;
-			len -= POLY1305_BLOCK_SIZE;
-			dctx->sset = true;
-		}
-		if (len < POLY1305_BLOCK_SIZE)
-			return;
-	}
-
-	len &= ~(POLY1305_BLOCK_SIZE - 1);
-
-	if (static_branch_likely(&have_neon) && likely(do_neon))
-		poly1305_blocks_neon(&dctx->h, src, len, hibit);
-	else
-		poly1305_blocks_arm(&dctx->h, src, len, hibit);
-}
-
-static void arm_poly1305_do_update(struct poly1305_desc_ctx *dctx,
-				    const u8 *src, u32 len, bool do_neon)
-{
-	if (unlikely(dctx->buflen)) {
-		u32 bytes = min(len, POLY1305_BLOCK_SIZE - dctx->buflen);
-
-		memcpy(dctx->buf + dctx->buflen, src, bytes);
-		src += bytes;
-		len -= bytes;
-		dctx->buflen += bytes;
-
-		if (dctx->buflen == POLY1305_BLOCK_SIZE) {
-			arm_poly1305_blocks(dctx, dctx->buf,
-					    POLY1305_BLOCK_SIZE, 1, false);
-			dctx->buflen = 0;
-		}
-	}
-
-	if (likely(len >= POLY1305_BLOCK_SIZE)) {
-		arm_poly1305_blocks(dctx, src, len, 1, do_neon);
-		src += round_down(len, POLY1305_BLOCK_SIZE);
-		len %= POLY1305_BLOCK_SIZE;
-	}
-
-	if (unlikely(len)) {
-		dctx->buflen = len;
-		memcpy(dctx->buf, src, len);
-	}
-}
-
-static int arm_poly1305_update(struct shash_desc *desc,
-			       const u8 *src, unsigned int srclen)
-{
-	struct poly1305_desc_ctx *dctx = shash_desc_ctx(desc);
-
-	arm_poly1305_do_update(dctx, src, srclen, false);
-	return 0;
-}
-
-static int __maybe_unused arm_poly1305_update_neon(struct shash_desc *desc,
-						   const u8 *src,
-						   unsigned int srclen)
-{
-	struct poly1305_desc_ctx *dctx = shash_desc_ctx(desc);
-	bool do_neon = crypto_simd_usable() && srclen > 128;
-
-	if (static_branch_likely(&have_neon) && do_neon)
-		kernel_neon_begin();
-	arm_poly1305_do_update(dctx, src, srclen, do_neon);
-	if (static_branch_likely(&have_neon) && do_neon)
-		kernel_neon_end();
-	return 0;
-}
-
 void poly1305_update_arch(struct poly1305_desc_ctx *dctx, const u8 *src,
 			  unsigned int nbytes)
 {
 	bool do_neon = IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
 		       crypto_simd_usable();
@@ -197,49 +98,10 @@ void poly1305_final_arch(struct poly1305_desc_ctx *dctx, u8 *dst)
 	poly1305_emit_arm(&dctx->h, dst, dctx->s);
 	*dctx = (struct poly1305_desc_ctx){};
 }
 EXPORT_SYMBOL(poly1305_final_arch);
 
-static int arm_poly1305_final(struct shash_desc *desc, u8 *dst)
-{
-	struct poly1305_desc_ctx *dctx = shash_desc_ctx(desc);
-
-	if (unlikely(!dctx->sset))
-		return -ENOKEY;
-
-	poly1305_final_arch(dctx, dst);
-	return 0;
-}
-
-static struct shash_alg arm_poly1305_algs[] = {{
-	.init			= arm_poly1305_init,
-	.update			= arm_poly1305_update,
-	.final			= arm_poly1305_final,
-	.digestsize		= POLY1305_DIGEST_SIZE,
-	.descsize		= sizeof(struct poly1305_desc_ctx),
-
-	.base.cra_name		= "poly1305",
-	.base.cra_driver_name	= "poly1305-arm-old",
-	.base.cra_priority	= 150,
-	.base.cra_blocksize	= POLY1305_BLOCK_SIZE,
-	.base.cra_module	= THIS_MODULE,
-#ifdef CONFIG_KERNEL_MODE_NEON
-}, {
-	.init			= arm_poly1305_init,
-	.update			= arm_poly1305_update_neon,
-	.final			= arm_poly1305_final,
-	.digestsize		= POLY1305_DIGEST_SIZE,
-	.descsize		= sizeof(struct poly1305_desc_ctx),
-
-	.base.cra_name		= "poly1305",
-	.base.cra_driver_name	= "poly1305-neon",
-	.base.cra_priority	= 200,
-	.base.cra_blocksize	= POLY1305_BLOCK_SIZE,
-	.base.cra_module	= THIS_MODULE,
-#endif
-}};
-
 bool poly1305_is_arch_optimized(void)
 {
 	/* We always can use at least the ARM scalar implementation. */
 	return true;
 }
@@ -248,34 +110,11 @@ EXPORT_SYMBOL(poly1305_is_arch_optimized);
 static int __init arm_poly1305_mod_init(void)
 {
 	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
 	    (elf_hwcap & HWCAP_NEON))
 		static_branch_enable(&have_neon);
-	else if (IS_REACHABLE(CONFIG_CRYPTO_HASH))
-		/* register only the first entry */
-		return crypto_register_shash(&arm_poly1305_algs[0]);
-
-	return IS_REACHABLE(CONFIG_CRYPTO_HASH) ?
-		crypto_register_shashes(arm_poly1305_algs,
-					ARRAY_SIZE(arm_poly1305_algs)) : 0;
-}
-
-static void __exit arm_poly1305_mod_exit(void)
-{
-	if (!IS_REACHABLE(CONFIG_CRYPTO_HASH))
-		return;
-	if (!static_branch_likely(&have_neon)) {
-		crypto_unregister_shash(&arm_poly1305_algs[0]);
-		return;
-	}
-	crypto_unregister_shashes(arm_poly1305_algs,
-				  ARRAY_SIZE(arm_poly1305_algs));
+	return 0;
 }
-
 arch_initcall(arm_poly1305_mod_init);
-module_exit(arm_poly1305_mod_exit);
 
 MODULE_DESCRIPTION("Accelerated Poly1305 transform for ARM");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS_CRYPTO("poly1305");
-MODULE_ALIAS_CRYPTO("poly1305-arm");
-MODULE_ALIAS_CRYPTO("poly1305-neon");
-- 
2.49.0


