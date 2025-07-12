Return-Path: <linux-mips+bounces-9791-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9F9B02E26
	for <lists+linux-mips@lfdr.de>; Sun, 13 Jul 2025 01:31:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 912511893086
	for <lists+linux-mips@lfdr.de>; Sat, 12 Jul 2025 23:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC5D248863;
	Sat, 12 Jul 2025 23:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fX0E8o1k"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 947D72472BD;
	Sat, 12 Jul 2025 23:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752362792; cv=none; b=dTG9KHaMSPBQwqewle2OdrqmHDr6JMZrQ9BFvMz++1AG8OdNrdlRiYZIT/aHbIn6z3Dz1P4cby3QuaE5y5Ta4nLM0bx1xRz7oFfF/F5TKcsaUV0OQP1fAjPXkkzSCMaUU72xn0dipp4pFIMfgskC9+C/MbWnrPPmjyDDkMSPVx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752362792; c=relaxed/simple;
	bh=yc9nP0AyrYTSdnZBDBrGS14R619T+8Od6p+X/EDi6Wk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tBKYwSFpu/k+c9UO0XOukIk0aPvr77iaumcFLjJqcY7OmikQby4zD8FQKOZHzili86uYlU0RFgvGqP4ilY56GLsDDPpBN79DZ6XNkH5tVBY+dAR7YOmV0gfynoHTBy08ibQozu5JCoP2kb+WfT/QlYHQqf4fLnjOL+p8phkSnDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fX0E8o1k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25260C4CEF7;
	Sat, 12 Jul 2025 23:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362792;
	bh=yc9nP0AyrYTSdnZBDBrGS14R619T+8Od6p+X/EDi6Wk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fX0E8o1k57ipPAfx4Uzk0gPIv9zXrwOi7EklV1MTTwN4CCofX0j1AgCETrLo46xpR
	 Fb/HAiIDk0Q2P043QlgVPWAz6ctV/JLTH2RJwvNw1pAU/2HI7xBrHJ7zDBInTtl6pG
	 mzEoqG3qquK7rGUpI1L2ysFaTLshgPnAeVAFNEt+PnuRxP2jzd7FmS0aJqJE6xV0G4
	 UAiLiC0Y1UK5bxhY8SxwNggognGdbLAPtfPBg71+lwZI1/NRIuLrUi/bGrX7oCfzlo
	 jkJE8G03Pxs0HpkZAiPARUZk5aGWGElD8l3JOFy2Vc19sZYmnKIZ8d0fCNYAFiC01z
	 WBJQa9HaiH7NQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 26/26] lib/crypto: sha1: Remove low-level functions from API
Date: Sat, 12 Jul 2025 16:23:17 -0700
Message-ID: <20250712232329.818226-27-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250712232329.818226-1-ebiggers@kernel.org>
References: <20250712232329.818226-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that there are no users of the low-level SHA-1 interface, remove it.

Specifically:

- Remove SHA1_DIGEST_WORDS (no longer used)
- Remove sha1_init_raw() (no longer used)
- Rename sha1_transform() to sha1_block_generic() and make it static
- Move SHA1_WORKSPACE_WORDS into lib/crypto/sha1.c

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/sha1.h | 10 -------
 lib/crypto/sha1.c     | 63 ++++++++++++-------------------------------
 2 files changed, 17 insertions(+), 56 deletions(-)

diff --git a/include/crypto/sha1.h b/include/crypto/sha1.h
index 162a529ec8413..34658f4d76e3b 100644
--- a/include/crypto/sha1.h
+++ b/include/crypto/sha1.h
@@ -24,20 +24,10 @@ struct sha1_state {
 	u32 state[SHA1_DIGEST_SIZE / 4];
 	u64 count;
 	u8 buffer[SHA1_BLOCK_SIZE];
 };
 
-/*
- * An implementation of SHA-1's compression function.  Don't use in new code!
- * You shouldn't be using SHA-1, and even if you *have* to use SHA-1, this isn't
- * the correct way to hash something with SHA-1 (use crypto_shash instead).
- */
-#define SHA1_DIGEST_WORDS	(SHA1_DIGEST_SIZE / 4)
-#define SHA1_WORKSPACE_WORDS	16
-void sha1_init_raw(__u32 *buf);
-void sha1_transform(__u32 *digest, const char *data, __u32 *W);
-
 /* State for the SHA-1 compression function */
 struct sha1_block_state {
 	u32 h[SHA1_DIGEST_SIZE / 4];
 };
 
diff --git a/lib/crypto/sha1.c b/lib/crypto/sha1.c
index 89831f7f27793..87a76bf97f445 100644
--- a/lib/crypto/sha1.c
+++ b/lib/crypto/sha1.c
@@ -49,11 +49,11 @@ static const struct sha1_block_state sha1_iv = {
 #else
   #define setW(x, val) (W(x) = (val))
 #endif
 
 /* This "rolls" over the 512-bit array */
-#define W(x) (array[(x)&15])
+#define W(x) (workspace[(x)&15])
 
 /*
  * Where do we get the source from? The first 16 iterations get it from
  * the input data, the next mix it from the 512-bit array.
  */
@@ -70,38 +70,24 @@ static const struct sha1_block_state sha1_iv = {
 #define T_16_19(t, A, B, C, D, E) SHA_ROUND(t, SHA_MIX, (((C^D)&B)^D) , 0x5a827999, A, B, C, D, E )
 #define T_20_39(t, A, B, C, D, E) SHA_ROUND(t, SHA_MIX, (B^C^D) , 0x6ed9eba1, A, B, C, D, E )
 #define T_40_59(t, A, B, C, D, E) SHA_ROUND(t, SHA_MIX, ((B&C)+(D&(B^C))) , 0x8f1bbcdc, A, B, C, D, E )
 #define T_60_79(t, A, B, C, D, E) SHA_ROUND(t, SHA_MIX, (B^C^D) ,  0xca62c1d6, A, B, C, D, E )
 
-/**
- * sha1_transform - single block SHA1 transform (deprecated)
- *
- * @digest: 160 bit digest to update
- * @data:   512 bits of data to hash
- * @array:  16 words of workspace (see note)
- *
- * This function executes SHA-1's internal compression function.  It updates the
- * 160-bit internal state (@digest) with a single 512-bit data block (@data).
- *
- * Don't use this function.  SHA-1 is no longer considered secure.  And even if
- * you do have to use SHA-1, this isn't the correct way to hash something with
- * SHA-1 as this doesn't handle padding and finalization.
- *
- * Note: If the hash is security sensitive, the caller should be sure
- * to clear the workspace. This is left to the caller to avoid
- * unnecessary clears between chained hashing operations.
- */
-void sha1_transform(__u32 *digest, const char *data, __u32 *array)
+#define SHA1_WORKSPACE_WORDS 16
+
+static void sha1_block_generic(struct sha1_block_state *state,
+			       const u8 data[SHA1_BLOCK_SIZE],
+			       u32 workspace[SHA1_WORKSPACE_WORDS])
 {
 	__u32 A, B, C, D, E;
 	unsigned int i = 0;
 
-	A = digest[0];
-	B = digest[1];
-	C = digest[2];
-	D = digest[3];
-	E = digest[4];
+	A = state->h[0];
+	B = state->h[1];
+	C = state->h[2];
+	D = state->h[3];
+	E = state->h[4];
 
 	/* Round 1 - iterations 0-16 take their input from 'data' */
 	for (; i < 16; ++i)
 		T_0_15(i, A, B, C, D, E);
 
@@ -119,39 +105,24 @@ void sha1_transform(__u32 *digest, const char *data, __u32 *array)
 
 	/* Round 4 */
 	for (; i < 80; ++i)
 		T_60_79(i, A, B, C, D, E);
 
-	digest[0] += A;
-	digest[1] += B;
-	digest[2] += C;
-	digest[3] += D;
-	digest[4] += E;
-}
-EXPORT_SYMBOL(sha1_transform);
-
-/**
- * sha1_init_raw - initialize the vectors for a SHA1 digest
- * @buf: vector to initialize
- */
-void sha1_init_raw(__u32 *buf)
-{
-	buf[0] = 0x67452301;
-	buf[1] = 0xefcdab89;
-	buf[2] = 0x98badcfe;
-	buf[3] = 0x10325476;
-	buf[4] = 0xc3d2e1f0;
+	state->h[0] += A;
+	state->h[1] += B;
+	state->h[2] += C;
+	state->h[3] += D;
+	state->h[4] += E;
 }
-EXPORT_SYMBOL(sha1_init_raw);
 
 static void __maybe_unused sha1_blocks_generic(struct sha1_block_state *state,
 					       const u8 *data, size_t nblocks)
 {
 	u32 workspace[SHA1_WORKSPACE_WORDS];
 
 	do {
-		sha1_transform(state->h, data, workspace);
+		sha1_block_generic(state, data, workspace);
 		data += SHA1_BLOCK_SIZE;
 	} while (--nblocks);
 
 	memzero_explicit(workspace, sizeof(workspace));
 }
-- 
2.50.1


