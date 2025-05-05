Return-Path: <linux-mips+bounces-8915-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2848BAA9B6C
	for <lists+linux-mips@lfdr.de>; Mon,  5 May 2025 20:20:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DE5FE7A9C07
	for <lists+linux-mips@lfdr.de>; Mon,  5 May 2025 18:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 684D02701D5;
	Mon,  5 May 2025 18:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qjLazIDP"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BE92701C9;
	Mon,  5 May 2025 18:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746469166; cv=none; b=ehCmW45Y3DS3hn1n6/Y//hEfjGR0OIrHW/ZmOlm+cMddBCqC2FKOxD0FuR0toAf73+pW1GdTbsksO4DdWMeG0ixu3BtmDwip8GsanFunltWNtrpG0/sABVHTXuLM1YrYsMDfAP0T9neFUgalV2cxuDJJrA96e/zybghAoKnWqrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746469166; c=relaxed/simple;
	bh=uslrcW8Rjh8Vtp1jwkYS+gns1NocaM1ysr80C17p+10=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pEPv8byS10PIOTLiXhNxV42YstkyOUn+jyXvUACFDYmBFKPVUFXSumU/KtRTy7l3Fy2TlYnQWPKJxgxzbt+bMch7HmBl6H/nisBPuZSGHcrFupynaMyPXu73hHbqGjROkHIpS+1qViyCPkzeaUnnqOQpCgy+gu6Le8bgkUYMoRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qjLazIDP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6333BC4CEEF;
	Mon,  5 May 2025 18:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746469164;
	bh=uslrcW8Rjh8Vtp1jwkYS+gns1NocaM1ysr80C17p+10=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qjLazIDPDkm/C095UjRbYZiH2s5N7gpqYt3hMK3JSviK+dnBWkx8DT34stTwvRWa1
	 uUtdO0i0UEOfXdoCL9knyjf2nfgVeTT2W+a8+QuZeFSaGqfhUQssF3B+Zu2avSGq67
	 xd9zRgby65l75mxRUMgJ8mIB34uhHYW9XqvipSYtBOSCKEkOTEuzevxNKHxZbkUy8c
	 kr0qCDllV/5OLtzYqjvDqCzj+9Le6N5jMBFbPAIGwstCX3DSTeBpVC8eixdn3W1XoB
	 9UB09lQN5DAc8rMGmN5uWYfVcXSoWJTv53n9I1Z2RSVh3pov8ByWjjIvVLik3+NFBX
	 foUo9yue0AqVg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-bcachefs@vger.kernel.org,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Theodore Ts'o <tytso@mit.edu>
Subject: [PATCH 4/4] crypto: lib/chacha - add array bounds to function prototypes
Date: Mon,  5 May 2025 11:18:24 -0700
Message-ID: <20250505181824.647138-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250505181824.647138-1-ebiggers@kernel.org>
References: <20250505181824.647138-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

Add explicit array bounds to the function prototypes for the parameters
that didn't already get handled by the conversion to use chacha_state:

- chacha_block_*():
  Change 'u8 *out' or 'u8 *stream' to u8 out[CHACHA_BLOCK_SIZE].

- hchacha_block_*():
  Change 'u32 *out' or 'u32 *stream' to u32 out[HCHACHA_OUT_WORDS].

- chacha_init():
  Change 'const u32 *key' to 'const u32 key[CHACHA_KEY_WORDS]'.
  Change 'const u8 *iv' to 'const u8 iv[CHACHA_IV_SIZE]'.

No functional changes.  This just makes it clear when fixed-size arrays
are expected.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm/lib/crypto/chacha-glue.c           | 12 ++++-----
 arch/arm/lib/crypto/chacha-scalar-core.S    |  2 +-
 arch/arm64/lib/crypto/chacha-neon-glue.c    | 10 ++++----
 arch/mips/lib/crypto/chacha-glue.c          |  2 +-
 arch/powerpc/lib/crypto/chacha-p10-glue.c   |  4 +--
 arch/riscv/lib/crypto/chacha-riscv64-glue.c |  3 ++-
 arch/s390/lib/crypto/chacha-glue.c          |  4 +--
 arch/x86/lib/crypto/chacha_glue.c           |  8 +++---
 crypto/chacha.c                             |  4 +--
 include/crypto/chacha.h                     | 27 ++++++++++++---------
 lib/crypto/chacha.c                         | 15 ++++++------
 lib/crypto/chacha20poly1305.c               |  2 --
 12 files changed, 49 insertions(+), 44 deletions(-)

diff --git a/arch/arm/lib/crypto/chacha-glue.c b/arch/arm/lib/crypto/chacha-glue.c
index 0c2b4c62d484..88ec96415283 100644
--- a/arch/arm/lib/crypto/chacha-glue.c
+++ b/arch/arm/lib/crypto/chacha-glue.c
@@ -21,13 +21,13 @@ asmlinkage void chacha_block_xor_neon(const struct chacha_state *state,
 				      u8 *dst, const u8 *src, int nrounds);
 asmlinkage void chacha_4block_xor_neon(const struct chacha_state *state,
 				       u8 *dst, const u8 *src,
 				       int nrounds, unsigned int nbytes);
 asmlinkage void hchacha_block_arm(const struct chacha_state *state,
-				  u32 *out, int nrounds);
+				  u32 out[HCHACHA_OUT_WORDS], int nrounds);
 asmlinkage void hchacha_block_neon(const struct chacha_state *state,
-				   u32 *out, int nrounds);
+				   u32 out[HCHACHA_OUT_WORDS], int nrounds);
 
 asmlinkage void chacha_doarm(u8 *dst, const u8 *src, unsigned int bytes,
 			     const struct chacha_state *state, int nrounds);
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(use_neon);
@@ -62,18 +62,18 @@ static void chacha_doneon(struct chacha_state *state, u8 *dst, const u8 *src,
 			memcpy(dst, buf, bytes);
 		state->x[12]++;
 	}
 }
 
-void hchacha_block_arch(const struct chacha_state *state, u32 *stream,
-			int nrounds)
+void hchacha_block_arch(const struct chacha_state *state,
+			u32 out[HCHACHA_OUT_WORDS], int nrounds)
 {
 	if (!IS_ENABLED(CONFIG_KERNEL_MODE_NEON) || !neon_usable()) {
-		hchacha_block_arm(state, stream, nrounds);
+		hchacha_block_arm(state, out, nrounds);
 	} else {
 		kernel_neon_begin();
-		hchacha_block_neon(state, stream, nrounds);
+		hchacha_block_neon(state, out, nrounds);
 		kernel_neon_end();
 	}
 }
 EXPORT_SYMBOL(hchacha_block_arch);
 
diff --git a/arch/arm/lib/crypto/chacha-scalar-core.S b/arch/arm/lib/crypto/chacha-scalar-core.S
index d20b5de755cc..4951df05c158 100644
--- a/arch/arm/lib/crypto/chacha-scalar-core.S
+++ b/arch/arm/lib/crypto/chacha-scalar-core.S
@@ -406,11 +406,11 @@ ENTRY(chacha_doarm)
 	b		0b
 ENDPROC(chacha_doarm)
 
 /*
  * void hchacha_block_arm(const struct chacha_state *state,
- *			  u32 out[8], int nrounds);
+ *			  u32 out[HCHACHA_OUT_WORDS], int nrounds);
  */
 ENTRY(hchacha_block_arm)
 	push		{r1,r4-r11,lr}
 
 	cmp		r2, #12			// ChaCha12 ?
diff --git a/arch/arm64/lib/crypto/chacha-neon-glue.c b/arch/arm64/lib/crypto/chacha-neon-glue.c
index 7b451b3c7240..d0188f974ca5 100644
--- a/arch/arm64/lib/crypto/chacha-neon-glue.c
+++ b/arch/arm64/lib/crypto/chacha-neon-glue.c
@@ -32,11 +32,11 @@ asmlinkage void chacha_block_xor_neon(const struct chacha_state *state,
 				      u8 *dst, const u8 *src, int nrounds);
 asmlinkage void chacha_4block_xor_neon(const struct chacha_state *state,
 				       u8 *dst, const u8 *src,
 				       int nrounds, int bytes);
 asmlinkage void hchacha_block_neon(const struct chacha_state *state,
-				   u32 *out, int nrounds);
+				   u32 out[HCHACHA_OUT_WORDS], int nrounds);
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
 
 static void chacha_doneon(struct chacha_state *state, u8 *dst, const u8 *src,
 			  int bytes, int nrounds)
@@ -59,18 +59,18 @@ static void chacha_doneon(struct chacha_state *state, u8 *dst, const u8 *src,
 		dst += l;
 		state->x[12] += DIV_ROUND_UP(l, CHACHA_BLOCK_SIZE);
 	}
 }
 
-void hchacha_block_arch(const struct chacha_state *state, u32 *stream,
-			int nrounds)
+void hchacha_block_arch(const struct chacha_state *state,
+			u32 out[HCHACHA_OUT_WORDS], int nrounds)
 {
 	if (!static_branch_likely(&have_neon) || !crypto_simd_usable()) {
-		hchacha_block_generic(state, stream, nrounds);
+		hchacha_block_generic(state, out, nrounds);
 	} else {
 		kernel_neon_begin();
-		hchacha_block_neon(state, stream, nrounds);
+		hchacha_block_neon(state, out, nrounds);
 		kernel_neon_end();
 	}
 }
 EXPORT_SYMBOL(hchacha_block_arch);
 
diff --git a/arch/mips/lib/crypto/chacha-glue.c b/arch/mips/lib/crypto/chacha-glue.c
index 75df4040cded..88c097594eb0 100644
--- a/arch/mips/lib/crypto/chacha-glue.c
+++ b/arch/mips/lib/crypto/chacha-glue.c
@@ -13,11 +13,11 @@ asmlinkage void chacha_crypt_arch(struct chacha_state *state,
 				  u8 *dst, const u8 *src,
 				  unsigned int bytes, int nrounds);
 EXPORT_SYMBOL(chacha_crypt_arch);
 
 asmlinkage void hchacha_block_arch(const struct chacha_state *state,
-				   u32 *stream, int nrounds);
+				   u32 out[HCHACHA_OUT_WORDS], int nrounds);
 EXPORT_SYMBOL(hchacha_block_arch);
 
 bool chacha_is_arch_optimized(void)
 {
 	return true;
diff --git a/arch/powerpc/lib/crypto/chacha-p10-glue.c b/arch/powerpc/lib/crypto/chacha-p10-glue.c
index a6e6a8da1b8b..fcd23c6f1590 100644
--- a/arch/powerpc/lib/crypto/chacha-p10-glue.c
+++ b/arch/powerpc/lib/crypto/chacha-p10-glue.c
@@ -47,13 +47,13 @@ static void chacha_p10_do_8x(struct chacha_state *state, u8 *dst, const u8 *src,
 	if (bytes > 0)
 		chacha_crypt_generic(state, dst, src, bytes, nrounds);
 }
 
 void hchacha_block_arch(const struct chacha_state *state,
-			u32 *stream, int nrounds)
+			u32 out[HCHACHA_OUT_WORDS], int nrounds)
 {
-	hchacha_block_generic(state, stream, nrounds);
+	hchacha_block_generic(state, out, nrounds);
 }
 EXPORT_SYMBOL(hchacha_block_arch);
 
 void chacha_crypt_arch(struct chacha_state *state, u8 *dst, const u8 *src,
 		       unsigned int bytes, int nrounds)
diff --git a/arch/riscv/lib/crypto/chacha-riscv64-glue.c b/arch/riscv/lib/crypto/chacha-riscv64-glue.c
index 57541621981e..8c3f11d79be3 100644
--- a/arch/riscv/lib/crypto/chacha-riscv64-glue.c
+++ b/arch/riscv/lib/crypto/chacha-riscv64-glue.c
@@ -16,11 +16,12 @@
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(use_zvkb);
 
 asmlinkage void chacha_zvkb(struct chacha_state *state, const u8 *in, u8 *out,
 			    size_t nblocks, int nrounds);
 
-void hchacha_block_arch(const struct chacha_state *state, u32 *out, int nrounds)
+void hchacha_block_arch(const struct chacha_state *state,
+			u32 out[HCHACHA_OUT_WORDS], int nrounds)
 {
 	hchacha_block_generic(state, out, nrounds);
 }
 EXPORT_SYMBOL(hchacha_block_arch);
 
diff --git a/arch/s390/lib/crypto/chacha-glue.c b/arch/s390/lib/crypto/chacha-glue.c
index 0a9fd50c1bd8..f95ba3483bbc 100644
--- a/arch/s390/lib/crypto/chacha-glue.c
+++ b/arch/s390/lib/crypto/chacha-glue.c
@@ -15,14 +15,14 @@
 #include <linux/sizes.h>
 #include <asm/fpu.h>
 #include "chacha-s390.h"
 
 void hchacha_block_arch(const struct chacha_state *state,
-			u32 *stream, int nrounds)
+			u32 out[HCHACHA_OUT_WORDS], int nrounds)
 {
 	/* TODO: implement hchacha_block_arch() in assembly */
-	hchacha_block_generic(state, stream, nrounds);
+	hchacha_block_generic(state, out, nrounds);
 }
 EXPORT_SYMBOL(hchacha_block_arch);
 
 void chacha_crypt_arch(struct chacha_state *state, u8 *dst, const u8 *src,
 		       unsigned int bytes, int nrounds)
diff --git a/arch/x86/lib/crypto/chacha_glue.c b/arch/x86/lib/crypto/chacha_glue.c
index 6f00a56e3e9a..10b2c945f541 100644
--- a/arch/x86/lib/crypto/chacha_glue.c
+++ b/arch/x86/lib/crypto/chacha_glue.c
@@ -17,11 +17,11 @@ asmlinkage void chacha_block_xor_ssse3(const struct chacha_state *state,
 				       unsigned int len, int nrounds);
 asmlinkage void chacha_4block_xor_ssse3(const struct chacha_state *state,
 					u8 *dst, const u8 *src,
 					unsigned int len, int nrounds);
 asmlinkage void hchacha_block_ssse3(const struct chacha_state *state,
-				    u32 *out, int nrounds);
+				    u32 out[HCHACHA_OUT_WORDS], int nrounds);
 
 asmlinkage void chacha_2block_xor_avx2(const struct chacha_state *state,
 				       u8 *dst, const u8 *src,
 				       unsigned int len, int nrounds);
 asmlinkage void chacha_4block_xor_avx2(const struct chacha_state *state,
@@ -125,17 +125,17 @@ static void chacha_dosimd(struct chacha_state *state, u8 *dst, const u8 *src,
 		state->x[12]++;
 	}
 }
 
 void hchacha_block_arch(const struct chacha_state *state,
-			u32 *stream, int nrounds)
+			u32 out[HCHACHA_OUT_WORDS], int nrounds)
 {
 	if (!static_branch_likely(&chacha_use_simd)) {
-		hchacha_block_generic(state, stream, nrounds);
+		hchacha_block_generic(state, out, nrounds);
 	} else {
 		kernel_fpu_begin();
-		hchacha_block_ssse3(state, stream, nrounds);
+		hchacha_block_ssse3(state, out, nrounds);
 		kernel_fpu_end();
 	}
 }
 EXPORT_SYMBOL(hchacha_block_arch);
 
diff --git a/crypto/chacha.c b/crypto/chacha.c
index 73ce62a9ac22..c3a11f4e2d13 100644
--- a/crypto/chacha.c
+++ b/crypto/chacha.c
@@ -44,12 +44,12 @@ static int chacha12_setkey(struct crypto_skcipher *tfm,
 {
 	return chacha_setkey(tfm, key, keysize, 12);
 }
 
 static int chacha_stream_xor(struct skcipher_request *req,
-			     const struct chacha_ctx *ctx, const u8 *iv,
-			     bool arch)
+			     const struct chacha_ctx *ctx,
+			     const u8 iv[CHACHA_IV_SIZE], bool arch)
 {
 	struct skcipher_walk walk;
 	struct chacha_state state;
 	int err;
 
diff --git a/include/crypto/chacha.h b/include/crypto/chacha.h
index 7c2e6c68919b..91f6b4cf561c 100644
--- a/include/crypto/chacha.h
+++ b/include/crypto/chacha.h
@@ -24,32 +24,36 @@
 
 #define CHACHA_KEY_SIZE		32
 #define CHACHA_BLOCK_SIZE	64
 #define CHACHAPOLY_IV_SIZE	12
 
-#define CHACHA_STATE_WORDS	(CHACHA_BLOCK_SIZE / sizeof(u32))
+#define CHACHA_KEY_WORDS	8
+#define CHACHA_STATE_WORDS	16
+#define HCHACHA_OUT_WORDS	8
 
 /* 192-bit nonce, then 64-bit stream position */
 #define XCHACHA_IV_SIZE		32
 
 struct chacha_state {
 	u32 x[CHACHA_STATE_WORDS];
 };
 
-void chacha_block_generic(struct chacha_state *state, u8 *stream, int nrounds);
-static inline void chacha20_block(struct chacha_state *state, u8 *stream)
+void chacha_block_generic(struct chacha_state *state,
+			  u8 out[CHACHA_BLOCK_SIZE], int nrounds);
+static inline void chacha20_block(struct chacha_state *state,
+				  u8 out[CHACHA_BLOCK_SIZE])
 {
-	chacha_block_generic(state, stream, 20);
+	chacha_block_generic(state, out, 20);
 }
 
-void hchacha_block_arch(const struct chacha_state *state, u32 *out,
-			int nrounds);
-void hchacha_block_generic(const struct chacha_state *state, u32 *out,
-			   int nrounds);
+void hchacha_block_arch(const struct chacha_state *state,
+			u32 out[HCHACHA_OUT_WORDS], int nrounds);
+void hchacha_block_generic(const struct chacha_state *state,
+			   u32 out[HCHACHA_OUT_WORDS], int nrounds);
 
-static inline void hchacha_block(const struct chacha_state *state, u32 *out,
-				 int nrounds)
+static inline void hchacha_block(const struct chacha_state *state,
+				 u32 out[HCHACHA_OUT_WORDS], int nrounds)
 {
 	if (IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA))
 		hchacha_block_arch(state, out, nrounds);
 	else
 		hchacha_block_generic(state, out, nrounds);
@@ -69,11 +73,12 @@ static inline void chacha_init_consts(struct chacha_state *state)
 	state->x[2]  = CHACHA_CONSTANT_2_BY;
 	state->x[3]  = CHACHA_CONSTANT_TE_K;
 }
 
 static inline void chacha_init(struct chacha_state *state,
-			       const u32 *key, const u8 *iv)
+			       const u32 key[CHACHA_KEY_WORDS],
+			       const u8 iv[CHACHA_IV_SIZE])
 {
 	chacha_init_consts(state);
 	state->x[4]  = key[0];
 	state->x[5]  = key[1];
 	state->x[6]  = key[2];
diff --git a/lib/crypto/chacha.c b/lib/crypto/chacha.c
index ae50e441f9fb..ced87dd31a97 100644
--- a/lib/crypto/chacha.c
+++ b/lib/crypto/chacha.c
@@ -65,49 +65,50 @@ static void chacha_permute(struct chacha_state *state, int nrounds)
 }
 
 /**
  * chacha_block_generic - generate one keystream block and increment block counter
  * @state: input state matrix
- * @stream: output keystream block (64 bytes)
+ * @out: output keystream block
  * @nrounds: number of rounds (20 or 12; 20 is recommended)
  *
  * This is the ChaCha core, a function from 64-byte strings to 64-byte strings.
  * The caller has already converted the endianness of the input.  This function
  * also handles incrementing the block counter in the input matrix.
  */
-void chacha_block_generic(struct chacha_state *state, u8 *stream, int nrounds)
+void chacha_block_generic(struct chacha_state *state,
+			  u8 out[CHACHA_BLOCK_SIZE], int nrounds)
 {
 	struct chacha_state permuted_state = *state;
 	int i;
 
 	chacha_permute(&permuted_state, nrounds);
 
 	for (i = 0; i < ARRAY_SIZE(state->x); i++)
 		put_unaligned_le32(permuted_state.x[i] + state->x[i],
-				   &stream[i * sizeof(u32)]);
+				   &out[i * sizeof(u32)]);
 
 	state->x[12]++;
 }
 EXPORT_SYMBOL(chacha_block_generic);
 
 /**
  * hchacha_block_generic - abbreviated ChaCha core, for XChaCha
  * @state: input state matrix
- * @stream: output (8 32-bit words)
+ * @out: the output words
  * @nrounds: number of rounds (20 or 12; 20 is recommended)
  *
  * HChaCha is the ChaCha equivalent of HSalsa and is an intermediate step
  * towards XChaCha (see https://cr.yp.to/snuffle/xsalsa-20081128.pdf).  HChaCha
  * skips the final addition of the initial state, and outputs only certain words
  * of the state.  It should not be used for streaming directly.
  */
 void hchacha_block_generic(const struct chacha_state *state,
-			   u32 *stream, int nrounds)
+			   u32 out[HCHACHA_OUT_WORDS], int nrounds)
 {
 	struct chacha_state permuted_state = *state;
 
 	chacha_permute(&permuted_state, nrounds);
 
-	memcpy(&stream[0], &permuted_state.x[0], 16);
-	memcpy(&stream[4], &permuted_state.x[12], 16);
+	memcpy(&out[0], &permuted_state.x[0], 16);
+	memcpy(&out[4], &permuted_state.x[12], 16);
 }
 EXPORT_SYMBOL(hchacha_block_generic);
diff --git a/lib/crypto/chacha20poly1305.c b/lib/crypto/chacha20poly1305.c
index 2e7bbc1a67ea..fbd3690e2531 100644
--- a/lib/crypto/chacha20poly1305.c
+++ b/lib/crypto/chacha20poly1305.c
@@ -16,12 +16,10 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/mm.h>
 #include <linux/module.h>
 
-#define CHACHA_KEY_WORDS	(CHACHA_KEY_SIZE / sizeof(u32))
-
 static void chacha_load_key(u32 *k, const u8 *in)
 {
 	k[0] = get_unaligned_le32(in);
 	k[1] = get_unaligned_le32(in + 4);
 	k[2] = get_unaligned_le32(in + 8);
-- 
2.49.0


