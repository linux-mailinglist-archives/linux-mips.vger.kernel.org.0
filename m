Return-Path: <linux-mips+bounces-8577-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7B3A870AF
	for <lists+linux-mips@lfdr.de>; Sun, 13 Apr 2025 06:56:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7353317364D
	for <lists+linux-mips@lfdr.de>; Sun, 13 Apr 2025 04:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F8017A30A;
	Sun, 13 Apr 2025 04:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qurcntK5"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DE417A2F6;
	Sun, 13 Apr 2025 04:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744520142; cv=none; b=XXeZaKq2ntjFXSNrOTAqmP0Kbd0zvzPP3Sb92A06HmIwC0YkTrQD46xFsJ0vbr64qA/olDeFD5WI5yL8/BrTKFZ/pVqpQTY1xKjZdg5AIZUYj+5rPSE5qyM1/QHqIJ56/X8CL651XfpgR12xXc7A8lIFMU49tGcOfTwvif42Pfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744520142; c=relaxed/simple;
	bh=9FIfB3SWlQ3XpNk3Dx8kombdj2eN1jWYviON2vPLySA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qXPOWKcf1WirskzDtvn76RmCKu0epQIclvuSnAT1iGVhy+VYhY72297wWFxK5uQh0k8O/oTTHYfn4lXipqcHASd/s1S81QmYdBgfwOGGxqy4DxU1zK12gDHGLYgnzpiaxaHSZuK71+pJo7WEwWdIQNy/+TIaZvOsC0qCJbjK0go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qurcntK5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6BB1C4CEEF;
	Sun, 13 Apr 2025 04:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744520142;
	bh=9FIfB3SWlQ3XpNk3Dx8kombdj2eN1jWYviON2vPLySA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qurcntK5oD7ir9QIYy87uFOTG7DZ5ai9xFFMpiTEhR/j4EdtY12M1OVTdVtw/NJsu
	 rsi1wNoL03woAdSu5nYj1OYQmu0DYRKWlULNk+FTWgaf2Zblpp5kLX7C7phu3fINkJ
	 FaacxnBSITxJUiMkcoVJmZVe9NRVMocxReuTm9Pemzo9v6gGJxHgF6uHuS4P1oa0cy
	 e52Y1ytSrBM2Ff5pvBoMUuPsuevuOXObpmTux9yE2jVJ0ejIcew5LdtJJw2W2JfmFM
	 qFMw+xdBSJRuCKY61p/OVXS05LkzuFyjgccxIl3qFqMfmh5X9gWRb5IiP+vnLiXMN2
	 d51Zcu6bAdL7w==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org
Subject: [PATCH 4/9] crypto: arm64/poly1305 - remove redundant shash algorithm
Date: Sat, 12 Apr 2025 21:54:16 -0700
Message-ID: <20250413045421.55100-5-ebiggers@kernel.org>
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
 arch/arm64/crypto/Kconfig         |   6 --
 arch/arm64/crypto/poly1305-glue.c | 140 ++----------------------------
 2 files changed, 6 insertions(+), 140 deletions(-)

diff --git a/arch/arm64/crypto/Kconfig b/arch/arm64/crypto/Kconfig
index ce655da0fbee..c47a7649a241 100644
--- a/arch/arm64/crypto/Kconfig
+++ b/arch/arm64/crypto/Kconfig
@@ -26,18 +26,12 @@ config CRYPTO_NHPOLY1305_NEON
 	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_POLY1305_NEON
 	tristate
 	depends on KERNEL_MODE_NEON
-	select CRYPTO_HASH
 	select CRYPTO_ARCH_HAVE_LIB_POLY1305
 	default CRYPTO_LIB_POLY1305_INTERNAL
-	help
-	  Poly1305 authenticator algorithm (RFC7539)
-
-	  Architecture: arm64 using:
-	  - NEON (Advanced SIMD) extensions
 
 config CRYPTO_SHA1_ARM64_CE
 	tristate "Hash functions: SHA-1 (ARMv8 Crypto Extensions)"
 	depends on KERNEL_MODE_NEON
 	select CRYPTO_HASH
diff --git a/arch/arm64/crypto/poly1305-glue.c b/arch/arm64/crypto/poly1305-glue.c
index 89415731d9be..cb152ceac14a 100644
--- a/arch/arm64/crypto/poly1305-glue.c
+++ b/arch/arm64/crypto/poly1305-glue.c
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
 
 asmlinkage void poly1305_init_arm64(void *state, const u8 *key);
 asmlinkage void poly1305_blocks(void *state, const u8 *src, u32 len, u32 hibit);
 asmlinkage void poly1305_blocks_neon(void *state, const u8 *src, u32 len, u32 hibit);
 asmlinkage void poly1305_emit(void *state, u8 *digest, const u32 *nonce);
@@ -34,96 +31,10 @@ void poly1305_init_arch(struct poly1305_desc_ctx *dctx, const u8 key[POLY1305_KE
 	dctx->s[3] = get_unaligned_le32(key + 28);
 	dctx->buflen = 0;
 }
 EXPORT_SYMBOL(poly1305_init_arch);
 
-static int neon_poly1305_init(struct shash_desc *desc)
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
-static void neon_poly1305_blocks(struct poly1305_desc_ctx *dctx, const u8 *src,
-				 u32 len, u32 hibit, bool do_neon)
-{
-	if (unlikely(!dctx->sset)) {
-		if (!dctx->rset) {
-			poly1305_init_arm64(&dctx->h, src);
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
-		poly1305_blocks(&dctx->h, src, len, hibit);
-}
-
-static void neon_poly1305_do_update(struct poly1305_desc_ctx *dctx,
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
-			neon_poly1305_blocks(dctx, dctx->buf,
-					     POLY1305_BLOCK_SIZE, 1, false);
-			dctx->buflen = 0;
-		}
-	}
-
-	if (likely(len >= POLY1305_BLOCK_SIZE)) {
-		neon_poly1305_blocks(dctx, src, len, 1, do_neon);
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
-static int neon_poly1305_update(struct shash_desc *desc,
-				const u8 *src, unsigned int srclen)
-{
-	bool do_neon = crypto_simd_usable() && srclen > 128;
-	struct poly1305_desc_ctx *dctx = shash_desc_ctx(desc);
-
-	if (static_branch_likely(&have_neon) && do_neon)
-		kernel_neon_begin();
-	neon_poly1305_do_update(dctx, src, srclen, do_neon);
-	if (static_branch_likely(&have_neon) && do_neon)
-		kernel_neon_end();
-	return 0;
-}
-
 void poly1305_update_arch(struct poly1305_desc_ctx *dctx, const u8 *src,
 			  unsigned int nbytes)
 {
 	if (unlikely(dctx->buflen)) {
 		u32 bytes = min(nbytes, POLY1305_BLOCK_SIZE - dctx->buflen);
@@ -179,61 +90,22 @@ void poly1305_final_arch(struct poly1305_desc_ctx *dctx, u8 *dst)
 	poly1305_emit(&dctx->h, dst, dctx->s);
 	memzero_explicit(dctx, sizeof(*dctx));
 }
 EXPORT_SYMBOL(poly1305_final_arch);
 
-static int neon_poly1305_final(struct shash_desc *desc, u8 *dst)
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
-static struct shash_alg neon_poly1305_alg = {
-	.init			= neon_poly1305_init,
-	.update			= neon_poly1305_update,
-	.final			= neon_poly1305_final,
-	.digestsize		= POLY1305_DIGEST_SIZE,
-	.descsize		= sizeof(struct poly1305_desc_ctx),
-
-	.base.cra_name		= "poly1305",
-	.base.cra_driver_name	= "poly1305-neon",
-	.base.cra_priority	= 200,
-	.base.cra_blocksize	= POLY1305_BLOCK_SIZE,
-	.base.cra_module	= THIS_MODULE,
-};
-
 bool poly1305_is_arch_optimized(void)
 {
 	/* We always can use at least the ARM64 scalar implementation. */
 	return true;
 }
 EXPORT_SYMBOL(poly1305_is_arch_optimized);
 
 static int __init neon_poly1305_mod_init(void)
 {
-	if (!cpu_have_named_feature(ASIMD))
-		return 0;
-
-	static_branch_enable(&have_neon);
-
-	return IS_REACHABLE(CONFIG_CRYPTO_HASH) ?
-		crypto_register_shash(&neon_poly1305_alg) : 0;
-}
-
-static void __exit neon_poly1305_mod_exit(void)
-{
-	if (IS_REACHABLE(CONFIG_CRYPTO_HASH) && cpu_have_named_feature(ASIMD))
-		crypto_unregister_shash(&neon_poly1305_alg);
+	if (cpu_have_named_feature(ASIMD))
+		static_branch_enable(&have_neon);
+	return 0;
 }
-
 arch_initcall(neon_poly1305_mod_init);
-module_exit(neon_poly1305_mod_exit);
 
-MODULE_DESCRIPTION("Poly1305 transform using NEON instructions");
+MODULE_DESCRIPTION("Poly1305 authenticator (ARM64 optimized)");
 MODULE_LICENSE("GPL v2");
-MODULE_ALIAS_CRYPTO("poly1305");
-MODULE_ALIAS_CRYPTO("poly1305-neon");
-- 
2.49.0


