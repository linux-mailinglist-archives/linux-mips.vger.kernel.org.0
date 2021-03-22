Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E27ED344CC1
	for <lists+linux-mips@lfdr.de>; Mon, 22 Mar 2021 18:06:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231453AbhCVRGF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 22 Mar 2021 13:06:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:41712 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232110AbhCVRFu (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 22 Mar 2021 13:05:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AB609619A4;
        Mon, 22 Mar 2021 17:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616432749;
        bh=PKLOobpob5JmNqoCPmm+ghhVZ/0dRKl7lczhmQX5p5k=;
        h=From:To:Cc:Subject:Date:From;
        b=uR//tcQTy5RhYfdZ5Y8WJWBKyQ5/Fkhb00TM9w7dXuAigu53AmYICge794j7jfMP1
         sJCiQiFNd/TRBNO582A6waDXssUcvFYVze7N6TaS1/kJHQPFTm30C6SspOBKWAl3EH
         ZVE1Sn6Fcil7iYL8K5b/zeyoczUex6QFblr1FHImoxhQt6E5cO8o3AkIZK5AMHWCCf
         aPevfTbQRt6iN82nj8Y0QeWHQ1Z6f3A3Y35H9GQDG2yAGLEPFa0EhjCzzl+Mz1fwGf
         v8SEFv08rtrdbDmiP/trQ686RIzsoGaQaUcdnzj3XKXC6U3TTFF8cvUn+G5/imZvl7
         2cVhehF2Jx6pg==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Eric Biggers <ebiggers@google.com>,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [PATCH] crypto: poly1305: fix poly1305_core_setkey() declaration
Date:   Mon, 22 Mar 2021 18:05:15 +0100
Message-Id: <20210322170542.1791154-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

gcc-11 points out a mismatch between the declaration and the definition
of poly1305_core_setkey():

lib/crypto/poly1305-donna32.c:13:67: error: argument 2 of type ‘const u8[16]’ {aka ‘const unsigned char[16]’} with mismatched bound [-Werror=array-parameter=]
   13 | void poly1305_core_setkey(struct poly1305_core_key *key, const u8 raw_key[16])
      |                                                          ~~~~~~~~~^~~~~~~~~~~
In file included from lib/crypto/poly1305-donna32.c:11:
include/crypto/internal/poly1305.h:21:68: note: previously declared as ‘const u8 *’ {aka ‘const unsigned char *’}
   21 | void poly1305_core_setkey(struct poly1305_core_key *key, const u8 *raw_key);

This is harmless in principle, as the calling conventions are the same,
but the more specific prototype allows better type checking in the
caller.

Change the declaration to match the actual function definition.
The poly1305_simd_init() is a bit suspicious here, as it previously
had a 32-byte argument type, but looks like it needs to take the
16-byte POLY1305_BLOCK_SIZE array instead.

Fixes: 1c08a104360f ("crypto: poly1305 - add new 32 and 64-bit generic versions")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/crypto/poly1305-glue.c    | 2 +-
 arch/arm64/crypto/poly1305-glue.c  | 2 +-
 arch/mips/crypto/poly1305-glue.c   | 2 +-
 arch/x86/crypto/poly1305_glue.c    | 6 +++---
 include/crypto/internal/poly1305.h | 3 ++-
 include/crypto/poly1305.h          | 6 ++++--
 lib/crypto/poly1305-donna32.c      | 3 ++-
 lib/crypto/poly1305-donna64.c      | 3 ++-
 lib/crypto/poly1305.c              | 3 ++-
 9 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/arch/arm/crypto/poly1305-glue.c b/arch/arm/crypto/poly1305-glue.c
index 3023c1acfa19..c31bd8f7c092 100644
--- a/arch/arm/crypto/poly1305-glue.c
+++ b/arch/arm/crypto/poly1305-glue.c
@@ -29,7 +29,7 @@ void __weak poly1305_blocks_neon(void *state, const u8 *src, u32 len, u32 hibit)
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
 
-void poly1305_init_arch(struct poly1305_desc_ctx *dctx, const u8 *key)
+void poly1305_init_arch(struct poly1305_desc_ctx *dctx, const u8 key[POLY1305_KEY_SIZE])
 {
 	poly1305_init_arm(&dctx->h, key);
 	dctx->s[0] = get_unaligned_le32(key + 16);
diff --git a/arch/arm64/crypto/poly1305-glue.c b/arch/arm64/crypto/poly1305-glue.c
index 683de671741a..9c3d86e397bf 100644
--- a/arch/arm64/crypto/poly1305-glue.c
+++ b/arch/arm64/crypto/poly1305-glue.c
@@ -25,7 +25,7 @@ asmlinkage void poly1305_emit(void *state, u8 *digest, const u32 *nonce);
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
 
-void poly1305_init_arch(struct poly1305_desc_ctx *dctx, const u8 *key)
+void poly1305_init_arch(struct poly1305_desc_ctx *dctx, const u8 key[POLY1305_KEY_SIZE])
 {
 	poly1305_init_arm64(&dctx->h, key);
 	dctx->s[0] = get_unaligned_le32(key + 16);
diff --git a/arch/mips/crypto/poly1305-glue.c b/arch/mips/crypto/poly1305-glue.c
index fc881b46d911..bc6110fb98e0 100644
--- a/arch/mips/crypto/poly1305-glue.c
+++ b/arch/mips/crypto/poly1305-glue.c
@@ -17,7 +17,7 @@ asmlinkage void poly1305_init_mips(void *state, const u8 *key);
 asmlinkage void poly1305_blocks_mips(void *state, const u8 *src, u32 len, u32 hibit);
 asmlinkage void poly1305_emit_mips(void *state, u8 *digest, const u32 *nonce);
 
-void poly1305_init_arch(struct poly1305_desc_ctx *dctx, const u8 *key)
+void poly1305_init_arch(struct poly1305_desc_ctx *dctx, const u8 key[POLY1305_KEY_SIZE])
 {
 	poly1305_init_mips(&dctx->h, key);
 	dctx->s[0] = get_unaligned_le32(key + 16);
diff --git a/arch/x86/crypto/poly1305_glue.c b/arch/x86/crypto/poly1305_glue.c
index 646da46e8d10..1dfb8af48a3c 100644
--- a/arch/x86/crypto/poly1305_glue.c
+++ b/arch/x86/crypto/poly1305_glue.c
@@ -16,7 +16,7 @@
 #include <asm/simd.h>
 
 asmlinkage void poly1305_init_x86_64(void *ctx,
-				     const u8 key[POLY1305_KEY_SIZE]);
+				     const u8 key[POLY1305_BLOCK_SIZE]);
 asmlinkage void poly1305_blocks_x86_64(void *ctx, const u8 *inp,
 				       const size_t len, const u32 padbit);
 asmlinkage void poly1305_emit_x86_64(void *ctx, u8 mac[POLY1305_DIGEST_SIZE],
@@ -81,7 +81,7 @@ static void convert_to_base2_64(void *ctx)
 	state->is_base2_26 = 0;
 }
 
-static void poly1305_simd_init(void *ctx, const u8 key[POLY1305_KEY_SIZE])
+static void poly1305_simd_init(void *ctx, const u8 key[POLY1305_BLOCK_SIZE])
 {
 	poly1305_init_x86_64(ctx, key);
 }
@@ -129,7 +129,7 @@ static void poly1305_simd_emit(void *ctx, u8 mac[POLY1305_DIGEST_SIZE],
 		poly1305_emit_avx(ctx, mac, nonce);
 }
 
-void poly1305_init_arch(struct poly1305_desc_ctx *dctx, const u8 *key)
+void poly1305_init_arch(struct poly1305_desc_ctx *dctx, const u8 key[POLY1305_KEY_SIZE])
 {
 	poly1305_simd_init(&dctx->h, key);
 	dctx->s[0] = get_unaligned_le32(&key[16]);
diff --git a/include/crypto/internal/poly1305.h b/include/crypto/internal/poly1305.h
index 064e52ca5248..196aa769f296 100644
--- a/include/crypto/internal/poly1305.h
+++ b/include/crypto/internal/poly1305.h
@@ -18,7 +18,8 @@
  * only the ε-almost-∆-universal hash function (not the full MAC) is computed.
  */
 
-void poly1305_core_setkey(struct poly1305_core_key *key, const u8 *raw_key);
+void poly1305_core_setkey(struct poly1305_core_key *key,
+			  const u8 raw_key[POLY1305_BLOCK_SIZE]);
 static inline void poly1305_core_init(struct poly1305_state *state)
 {
 	*state = (struct poly1305_state){};
diff --git a/include/crypto/poly1305.h b/include/crypto/poly1305.h
index f1f67fc749cf..090692ec3bc7 100644
--- a/include/crypto/poly1305.h
+++ b/include/crypto/poly1305.h
@@ -58,8 +58,10 @@ struct poly1305_desc_ctx {
 	};
 };
 
-void poly1305_init_arch(struct poly1305_desc_ctx *desc, const u8 *key);
-void poly1305_init_generic(struct poly1305_desc_ctx *desc, const u8 *key);
+void poly1305_init_arch(struct poly1305_desc_ctx *desc,
+			const u8 key[POLY1305_KEY_SIZE]);
+void poly1305_init_generic(struct poly1305_desc_ctx *desc,
+			   const u8 key[POLY1305_KEY_SIZE]);
 
 static inline void poly1305_init(struct poly1305_desc_ctx *desc, const u8 *key)
 {
diff --git a/lib/crypto/poly1305-donna32.c b/lib/crypto/poly1305-donna32.c
index 3cc77d94390b..7fb71845cc84 100644
--- a/lib/crypto/poly1305-donna32.c
+++ b/lib/crypto/poly1305-donna32.c
@@ -10,7 +10,8 @@
 #include <asm/unaligned.h>
 #include <crypto/internal/poly1305.h>
 
-void poly1305_core_setkey(struct poly1305_core_key *key, const u8 raw_key[16])
+void poly1305_core_setkey(struct poly1305_core_key *key,
+			  const u8 raw_key[POLY1305_BLOCK_SIZE])
 {
 	/* r &= 0xffffffc0ffffffc0ffffffc0fffffff */
 	key->key.r[0] = (get_unaligned_le32(&raw_key[0])) & 0x3ffffff;
diff --git a/lib/crypto/poly1305-donna64.c b/lib/crypto/poly1305-donna64.c
index 6ae181bb4345..d34cf4053668 100644
--- a/lib/crypto/poly1305-donna64.c
+++ b/lib/crypto/poly1305-donna64.c
@@ -12,7 +12,8 @@
 
 typedef __uint128_t u128;
 
-void poly1305_core_setkey(struct poly1305_core_key *key, const u8 raw_key[16])
+void poly1305_core_setkey(struct poly1305_core_key *key,
+			  const u8 raw_key[POLY1305_BLOCK_SIZE])
 {
 	u64 t0, t1;
 
diff --git a/lib/crypto/poly1305.c b/lib/crypto/poly1305.c
index 9d2d14df0fee..26d87fc3823e 100644
--- a/lib/crypto/poly1305.c
+++ b/lib/crypto/poly1305.c
@@ -12,7 +12,8 @@
 #include <linux/module.h>
 #include <asm/unaligned.h>
 
-void poly1305_init_generic(struct poly1305_desc_ctx *desc, const u8 *key)
+void poly1305_init_generic(struct poly1305_desc_ctx *desc,
+			   const u8 key[POLY1305_KEY_SIZE])
 {
 	poly1305_core_setkey(&desc->core_r, key);
 	desc->s[0] = get_unaligned_le32(key + 16);
-- 
2.29.2

