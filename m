Return-Path: <linux-mips+bounces-9574-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D84EAEE402
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 18:15:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0131C1BC32CE
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 16:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A55342BEFF9;
	Mon, 30 Jun 2025 16:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VFsvTo3W"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708C42BDC3D;
	Mon, 30 Jun 2025 16:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751299764; cv=none; b=Hi39zs5UyDy5cmiWqNpShbDeicHlqj/VmyT5NsVCPa6h+B4lM7q/+U8FspauE2e6HZ2oULrK/t5PAKKBuO4RKeKpVbXtpZMo9S0V9kvEIKMQmiZUebm2AwF8AX+3asPf/Xjyh+plTezXvsRJiK/bAkrBoWc7UHTGO0ron4C69UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751299764; c=relaxed/simple;
	bh=efA+GKjUU+dJBfSOtRlsOSdIVA7dpLoqkdFFxQ9hafY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E6FNNvUryLX4XfDXp6zBVVQZgloCDiBcCqg8oXriD8t9yMULa7DH6OCKkoNvSc7G9TYgxuO3QyuS643NaWpVrUVJsibwKVmr4inq4SmmS0RuaNV/yM7pyCAa97ajJDk30F9nOCNBCv/xsIGTShFryjXp2VV3I1QMWAWBWweq5ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VFsvTo3W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4514C4CEF2;
	Mon, 30 Jun 2025 16:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299764;
	bh=efA+GKjUU+dJBfSOtRlsOSdIVA7dpLoqkdFFxQ9hafY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VFsvTo3WILvMQpHd+yvvsFjwF1nkjL4SABX/m6m4jRbLRUDpkUZ65baJWQEbTAY8q
	 BC651fUP9hJJGIgmt+qDICBAhcYpmkc8z0WllWHVMNLkgH78gULm5K68gRyHnoeW91
	 PqlppPQfoBY0IcrdKbXUDpxs4Ty9sI66Q0SmZ8v6Sk7fJGC/aEhFH47hWgSjPxKIKV
	 iqFwf2hu6SAs4XcoKT3EgkOrS51oiMWijrGql6rtRXyCqiDw5zncRc5xqtaaev/eb3
	 f9q/M7V/K0yoIaxDUOyez61A58OXHd8B0Mcvn32tYuKyQgKWFFZaLEdp3Ni3hACfBg
	 qiqQQFQg/ypOg==
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
Subject: [PATCH v2 07/14] lib/crypto: sha256: Propagate sha256_block_state type to implementations
Date: Mon, 30 Jun 2025 09:06:38 -0700
Message-ID: <20250630160645.3198-8-ebiggers@kernel.org>
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

The previous commit made the SHA-256 compression function state be
strongly typed, but it wasn't propagated all the way down to the
implementations of it.  Do that now.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 .../mips/cavium-octeon/crypto/octeon-sha256.c |  2 +-
 include/crypto/internal/sha2.h                |  8 +++----
 lib/crypto/arm/sha256-ce.S                    |  2 +-
 lib/crypto/arm/sha256.c                       |  8 +++----
 lib/crypto/arm64/sha256-ce.S                  |  2 +-
 lib/crypto/arm64/sha256.c                     |  8 +++----
 lib/crypto/powerpc/sha256.c                   |  2 +-
 .../sha256-riscv64-zvknha_or_zvknhb-zvkb.S    |  2 +-
 lib/crypto/riscv/sha256.c                     |  7 +++---
 lib/crypto/s390/sha256.c                      |  2 +-
 lib/crypto/sha256-generic.c                   | 24 ++++++++++++++-----
 lib/crypto/sparc/sha256.c                     |  4 ++--
 lib/crypto/x86/sha256-avx-asm.S               |  2 +-
 lib/crypto/x86/sha256-avx2-asm.S              |  2 +-
 lib/crypto/x86/sha256-ni-asm.S                |  2 +-
 lib/crypto/x86/sha256-ssse3-asm.S             |  2 +-
 lib/crypto/x86/sha256.c                       | 10 ++++----
 17 files changed, 51 insertions(+), 38 deletions(-)

diff --git a/arch/mips/cavium-octeon/crypto/octeon-sha256.c b/arch/mips/cavium-octeon/crypto/octeon-sha256.c
index c20038239cb6b..f8664818d04ec 100644
--- a/arch/mips/cavium-octeon/crypto/octeon-sha256.c
+++ b/arch/mips/cavium-octeon/crypto/octeon-sha256.c
@@ -20,11 +20,11 @@
 
 /*
  * We pass everything as 64-bit. OCTEON can handle misaligned data.
  */
 
-void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
+void sha256_blocks_arch(struct sha256_block_state *state,
 			const u8 *data, size_t nblocks)
 {
 	struct octeon_cop2_state cop2_state;
 	u64 *state64 = (u64 *)state;
 	unsigned long flags;
diff --git a/include/crypto/internal/sha2.h b/include/crypto/internal/sha2.h
index 5a25ccc493886..f0f455477bbd7 100644
--- a/include/crypto/internal/sha2.h
+++ b/include/crypto/internal/sha2.h
@@ -15,23 +15,23 @@ bool sha256_is_arch_optimized(void);
 static inline bool sha256_is_arch_optimized(void)
 {
 	return false;
 }
 #endif
-void sha256_blocks_generic(u32 state[SHA256_STATE_WORDS],
+void sha256_blocks_generic(struct sha256_block_state *state,
 			   const u8 *data, size_t nblocks);
-void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
+void sha256_blocks_arch(struct sha256_block_state *state,
 			const u8 *data, size_t nblocks);
 
 static __always_inline void sha256_choose_blocks(
 	u32 state[SHA256_STATE_WORDS], const u8 *data, size_t nblocks,
 	bool force_generic, bool force_simd)
 {
 	if (!IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_SHA256) || force_generic)
-		sha256_blocks_generic(state, data, nblocks);
+		sha256_blocks_generic((struct sha256_block_state *)state, data, nblocks);
 	else
-		sha256_blocks_arch(state, data, nblocks);
+		sha256_blocks_arch((struct sha256_block_state *)state, data, nblocks);
 }
 
 static __always_inline void sha256_finup(
 	struct crypto_sha256_state *sctx, u8 buf[SHA256_BLOCK_SIZE],
 	size_t len, u8 out[SHA256_DIGEST_SIZE], size_t digest_size,
diff --git a/lib/crypto/arm/sha256-ce.S b/lib/crypto/arm/sha256-ce.S
index ac2c9b01b22d2..7481ac8e6c0d9 100644
--- a/lib/crypto/arm/sha256-ce.S
+++ b/lib/crypto/arm/sha256-ce.S
@@ -65,11 +65,11 @@
 	.word		0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3
 	.word		0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208
 	.word		0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2
 
 	/*
-	 * void sha256_ce_transform(u32 state[SHA256_STATE_WORDS],
+	 * void sha256_ce_transform(struct sha256_block_state *state,
 	 *			    const u8 *data, size_t nblocks);
 	 */
 ENTRY(sha256_ce_transform)
 	/* load state */
 	vld1.32		{dga-dgb}, [r0]
diff --git a/lib/crypto/arm/sha256.c b/lib/crypto/arm/sha256.c
index 2c9cfdaaa0691..7d90823586952 100644
--- a/lib/crypto/arm/sha256.c
+++ b/lib/crypto/arm/sha256.c
@@ -8,21 +8,21 @@
 #include <crypto/internal/sha2.h>
 #include <crypto/internal/simd.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
-asmlinkage void sha256_block_data_order(u32 state[SHA256_STATE_WORDS],
+asmlinkage void sha256_block_data_order(struct sha256_block_state *state,
 					const u8 *data, size_t nblocks);
-asmlinkage void sha256_block_data_order_neon(u32 state[SHA256_STATE_WORDS],
+asmlinkage void sha256_block_data_order_neon(struct sha256_block_state *state,
 					     const u8 *data, size_t nblocks);
-asmlinkage void sha256_ce_transform(u32 state[SHA256_STATE_WORDS],
+asmlinkage void sha256_ce_transform(struct sha256_block_state *state,
 				    const u8 *data, size_t nblocks);
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_ce);
 
-void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
+void sha256_blocks_arch(struct sha256_block_state *state,
 			const u8 *data, size_t nblocks)
 {
 	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
 	    static_branch_likely(&have_neon) && crypto_simd_usable()) {
 		kernel_neon_begin();
diff --git a/lib/crypto/arm64/sha256-ce.S b/lib/crypto/arm64/sha256-ce.S
index f3e21c6d87d2e..b99d9589c4217 100644
--- a/lib/crypto/arm64/sha256-ce.S
+++ b/lib/crypto/arm64/sha256-ce.S
@@ -69,11 +69,11 @@
 	.word		0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3
 	.word		0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208
 	.word		0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2
 
 	/*
-	 * size_t __sha256_ce_transform(u32 state[SHA256_STATE_WORDS],
+	 * size_t __sha256_ce_transform(struct sha256_block_state *state,
 	 *				const u8 *data, size_t nblocks);
 	 */
 	.text
 SYM_FUNC_START(__sha256_ce_transform)
 	/* load round constants */
diff --git a/lib/crypto/arm64/sha256.c b/lib/crypto/arm64/sha256.c
index fb9bff40357be..609ffb8151987 100644
--- a/lib/crypto/arm64/sha256.c
+++ b/lib/crypto/arm64/sha256.c
@@ -8,21 +8,21 @@
 #include <crypto/internal/sha2.h>
 #include <crypto/internal/simd.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
-asmlinkage void sha256_block_data_order(u32 state[SHA256_STATE_WORDS],
+asmlinkage void sha256_block_data_order(struct sha256_block_state *state,
 					const u8 *data, size_t nblocks);
-asmlinkage void sha256_block_neon(u32 state[SHA256_STATE_WORDS],
+asmlinkage void sha256_block_neon(struct sha256_block_state *state,
 				  const u8 *data, size_t nblocks);
-asmlinkage size_t __sha256_ce_transform(u32 state[SHA256_STATE_WORDS],
+asmlinkage size_t __sha256_ce_transform(struct sha256_block_state *state,
 					const u8 *data, size_t nblocks);
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_ce);
 
-void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
+void sha256_blocks_arch(struct sha256_block_state *state,
 			const u8 *data, size_t nblocks)
 {
 	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
 	    static_branch_likely(&have_neon) && crypto_simd_usable()) {
 		if (static_branch_likely(&have_ce)) {
diff --git a/lib/crypto/powerpc/sha256.c b/lib/crypto/powerpc/sha256.c
index 6b0f079587eb6..c3f844ae0aceb 100644
--- a/lib/crypto/powerpc/sha256.c
+++ b/lib/crypto/powerpc/sha256.c
@@ -40,11 +40,11 @@ static void spe_end(void)
 	disable_kernel_spe();
 	/* reenable preemption */
 	preempt_enable();
 }
 
-void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
+void sha256_blocks_arch(struct sha256_block_state *state,
 			const u8 *data, size_t nblocks)
 {
 	do {
 		/* cut input data into smaller blocks */
 		u32 unit = min_t(size_t, nblocks,
diff --git a/lib/crypto/riscv/sha256-riscv64-zvknha_or_zvknhb-zvkb.S b/lib/crypto/riscv/sha256-riscv64-zvknha_or_zvknhb-zvkb.S
index fad501ad06171..1618d1220a6e7 100644
--- a/lib/crypto/riscv/sha256-riscv64-zvknha_or_zvknhb-zvkb.S
+++ b/lib/crypto/riscv/sha256-riscv64-zvknha_or_zvknhb-zvkb.S
@@ -104,11 +104,11 @@
 	sha256_4rounds	\last, \k1, W1, W2, W3, W0
 	sha256_4rounds	\last, \k2, W2, W3, W0, W1
 	sha256_4rounds	\last, \k3, W3, W0, W1, W2
 .endm
 
-// void sha256_transform_zvknha_or_zvknhb_zvkb(u32 state[SHA256_STATE_WORDS],
+// void sha256_transform_zvknha_or_zvknhb_zvkb(struct sha256_block_state *state,
 //					       const u8 *data, size_t nblocks);
 SYM_FUNC_START(sha256_transform_zvknha_or_zvknhb_zvkb)
 
 	// Load the round constants into K0-K15.
 	vsetivli	zero, 4, e32, m1, ta, ma
diff --git a/lib/crypto/riscv/sha256.c b/lib/crypto/riscv/sha256.c
index aa77349d08f30..a2079aa3ae925 100644
--- a/lib/crypto/riscv/sha256.c
+++ b/lib/crypto/riscv/sha256.c
@@ -13,16 +13,17 @@
 #include <crypto/internal/sha2.h>
 #include <crypto/internal/simd.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
-asmlinkage void sha256_transform_zvknha_or_zvknhb_zvkb(
-	u32 state[SHA256_STATE_WORDS], const u8 *data, size_t nblocks);
+asmlinkage void
+sha256_transform_zvknha_or_zvknhb_zvkb(struct sha256_block_state *state,
+				       const u8 *data, size_t nblocks);
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_extensions);
 
-void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
+void sha256_blocks_arch(struct sha256_block_state *state,
 			const u8 *data, size_t nblocks)
 {
 	if (static_branch_likely(&have_extensions) && crypto_simd_usable()) {
 		kernel_vector_begin();
 		sha256_transform_zvknha_or_zvknhb_zvkb(state, data, nblocks);
diff --git a/lib/crypto/s390/sha256.c b/lib/crypto/s390/sha256.c
index 7dfe120fafaba..fb565718f7539 100644
--- a/lib/crypto/s390/sha256.c
+++ b/lib/crypto/s390/sha256.c
@@ -10,11 +10,11 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_cpacf_sha256);
 
-void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
+void sha256_blocks_arch(struct sha256_block_state *state,
 			const u8 *data, size_t nblocks)
 {
 	if (static_branch_likely(&have_cpacf_sha256))
 		cpacf_kimd(CPACF_KIMD_SHA_256, state, data,
 			   nblocks * SHA256_BLOCK_SIZE);
diff --git a/lib/crypto/sha256-generic.c b/lib/crypto/sha256-generic.c
index 2968d95d04038..99f904033c261 100644
--- a/lib/crypto/sha256-generic.c
+++ b/lib/crypto/sha256-generic.c
@@ -68,11 +68,11 @@ static inline void BLEND_OP(int I, u32 *W)
 	t2 = e0(a) + Maj(a, b, c);				\
 	d += t1;						\
 	h = t1 + t2;						\
 } while (0)
 
-static void sha256_block_generic(u32 state[SHA256_STATE_WORDS],
+static void sha256_block_generic(struct sha256_block_state *state,
 				 const u8 *input, u32 W[64])
 {
 	u32 a, b, c, d, e, f, g, h;
 	int i;
 
@@ -99,12 +99,18 @@ static void sha256_block_generic(u32 state[SHA256_STATE_WORDS],
 		BLEND_OP(i + 6, W);
 		BLEND_OP(i + 7, W);
 	}
 
 	/* load the state into our registers */
-	a = state[0];  b = state[1];  c = state[2];  d = state[3];
-	e = state[4];  f = state[5];  g = state[6];  h = state[7];
+	a = state->h[0];
+	b = state->h[1];
+	c = state->h[2];
+	d = state->h[3];
+	e = state->h[4];
+	f = state->h[5];
+	g = state->h[6];
+	h = state->h[7];
 
 	/* now iterate */
 	for (i = 0; i < 64; i += 8) {
 		SHA256_ROUND(i + 0, a, b, c, d, e, f, g, h);
 		SHA256_ROUND(i + 1, h, a, b, c, d, e, f, g);
@@ -114,15 +120,21 @@ static void sha256_block_generic(u32 state[SHA256_STATE_WORDS],
 		SHA256_ROUND(i + 5, d, e, f, g, h, a, b, c);
 		SHA256_ROUND(i + 6, c, d, e, f, g, h, a, b);
 		SHA256_ROUND(i + 7, b, c, d, e, f, g, h, a);
 	}
 
-	state[0] += a; state[1] += b; state[2] += c; state[3] += d;
-	state[4] += e; state[5] += f; state[6] += g; state[7] += h;
+	state->h[0] += a;
+	state->h[1] += b;
+	state->h[2] += c;
+	state->h[3] += d;
+	state->h[4] += e;
+	state->h[5] += f;
+	state->h[6] += g;
+	state->h[7] += h;
 }
 
-void sha256_blocks_generic(u32 state[SHA256_STATE_WORDS],
+void sha256_blocks_generic(struct sha256_block_state *state,
 			   const u8 *data, size_t nblocks)
 {
 	u32 W[64];
 
 	do {
diff --git a/lib/crypto/sparc/sha256.c b/lib/crypto/sparc/sha256.c
index 8bdec2db08b30..060664b88a6d3 100644
--- a/lib/crypto/sparc/sha256.c
+++ b/lib/crypto/sparc/sha256.c
@@ -17,14 +17,14 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_sha256_opcodes);
 
-asmlinkage void sha256_sparc64_transform(u32 state[SHA256_STATE_WORDS],
+asmlinkage void sha256_sparc64_transform(struct sha256_block_state *state,
 					 const u8 *data, size_t nblocks);
 
-void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
+void sha256_blocks_arch(struct sha256_block_state *state,
 			const u8 *data, size_t nblocks)
 {
 	if (static_branch_likely(&have_sha256_opcodes))
 		sha256_sparc64_transform(state, data, nblocks);
 	else
diff --git a/lib/crypto/x86/sha256-avx-asm.S b/lib/crypto/x86/sha256-avx-asm.S
index 0d7b2c3e45d9a..73bcff2b548f4 100644
--- a/lib/crypto/x86/sha256-avx-asm.S
+++ b/lib/crypto/x86/sha256-avx-asm.S
@@ -339,11 +339,11 @@ a = TMP_
         add     y0, h                   # h = h + S1 + CH + k + w + S0 + MAJ
         ROTATE_ARGS
 .endm
 
 ########################################################################
-## void sha256_transform_avx(u32 state[SHA256_STATE_WORDS],
+## void sha256_transform_avx(struct sha256_block_state *state,
 ##			     const u8 *data, size_t nblocks);
 ########################################################################
 .text
 SYM_FUNC_START(sha256_transform_avx)
 	ANNOTATE_NOENDBR	# since this is called only via static_call
diff --git a/lib/crypto/x86/sha256-avx2-asm.S b/lib/crypto/x86/sha256-avx2-asm.S
index 25d3380321ec3..45787570387f2 100644
--- a/lib/crypto/x86/sha256-avx2-asm.S
+++ b/lib/crypto/x86/sha256-avx2-asm.S
@@ -516,11 +516,11 @@ STACK_SIZE	= _CTX      + _CTX_SIZE
 	ROTATE_ARGS
 
 .endm
 
 ########################################################################
-## void sha256_transform_rorx(u32 state[SHA256_STATE_WORDS],
+## void sha256_transform_rorx(struct sha256_block_state *state,
 ##			      const u8 *data, size_t nblocks);
 ########################################################################
 .text
 SYM_FUNC_START(sha256_transform_rorx)
 	ANNOTATE_NOENDBR	# since this is called only via static_call
diff --git a/lib/crypto/x86/sha256-ni-asm.S b/lib/crypto/x86/sha256-ni-asm.S
index d3548206cf3d4..4af7d22e29e47 100644
--- a/lib/crypto/x86/sha256-ni-asm.S
+++ b/lib/crypto/x86/sha256-ni-asm.S
@@ -104,11 +104,11 @@
  * input data, and the number of 64-byte blocks to process.  Once all blocks
  * have been processed, the state is updated with the new state.  This function
  * only processes complete blocks.  State initialization, buffering of partial
  * blocks, and digest finalization is expected to be handled elsewhere.
  *
- * void sha256_ni_transform(u32 state[SHA256_STATE_WORDS],
+ * void sha256_ni_transform(struct sha256_block_state *state,
  *			    const u8 *data, size_t nblocks);
  */
 .text
 SYM_FUNC_START(sha256_ni_transform)
 	ANNOTATE_NOENDBR	# since this is called only via static_call
diff --git a/lib/crypto/x86/sha256-ssse3-asm.S b/lib/crypto/x86/sha256-ssse3-asm.S
index 7f24a4cdcb257..407b30adcd37f 100644
--- a/lib/crypto/x86/sha256-ssse3-asm.S
+++ b/lib/crypto/x86/sha256-ssse3-asm.S
@@ -346,11 +346,11 @@ a = TMP_
 	add     y0, h		      # h = h + S1 + CH + k + w + S0 + MAJ
 	ROTATE_ARGS
 .endm
 
 ########################################################################
-## void sha256_transform_ssse3(u32 state[SHA256_STATE_WORDS],
+## void sha256_transform_ssse3(struct sha256_block_state *state,
 ##			       const u8 *data, size_t nblocks);
 ########################################################################
 .text
 SYM_FUNC_START(sha256_transform_ssse3)
 	ANNOTATE_NOENDBR	# since this is called only via static_call
diff --git a/lib/crypto/x86/sha256.c b/lib/crypto/x86/sha256.c
index baba74d7d26f2..cbb45defbefab 100644
--- a/lib/crypto/x86/sha256.c
+++ b/lib/crypto/x86/sha256.c
@@ -9,24 +9,24 @@
 #include <crypto/internal/simd.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/static_call.h>
 
-asmlinkage void sha256_transform_ssse3(u32 state[SHA256_STATE_WORDS],
+asmlinkage void sha256_transform_ssse3(struct sha256_block_state *state,
 				       const u8 *data, size_t nblocks);
-asmlinkage void sha256_transform_avx(u32 state[SHA256_STATE_WORDS],
+asmlinkage void sha256_transform_avx(struct sha256_block_state *state,
 				     const u8 *data, size_t nblocks);
-asmlinkage void sha256_transform_rorx(u32 state[SHA256_STATE_WORDS],
+asmlinkage void sha256_transform_rorx(struct sha256_block_state *state,
 				      const u8 *data, size_t nblocks);
-asmlinkage void sha256_ni_transform(u32 state[SHA256_STATE_WORDS],
+asmlinkage void sha256_ni_transform(struct sha256_block_state *state,
 				    const u8 *data, size_t nblocks);
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_sha256_x86);
 
 DEFINE_STATIC_CALL(sha256_blocks_x86, sha256_transform_ssse3);
 
-void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
+void sha256_blocks_arch(struct sha256_block_state *state,
 			const u8 *data, size_t nblocks)
 {
 	if (static_branch_likely(&have_sha256_x86) && crypto_simd_usable()) {
 		kernel_fpu_begin();
 		static_call(sha256_blocks_x86)(state, data, nblocks);
-- 
2.50.0


