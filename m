Return-Path: <linux-mips+bounces-9480-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0CDAE77E7
	for <lists+linux-mips@lfdr.de>; Wed, 25 Jun 2025 09:11:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C11055A57EC
	for <lists+linux-mips@lfdr.de>; Wed, 25 Jun 2025 07:10:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EF9E207A26;
	Wed, 25 Jun 2025 07:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bHR0hOQp"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C392045AD;
	Wed, 25 Jun 2025 07:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750835429; cv=none; b=gL6Y3/Oypn5M2jisvq2g1yn98jme1ve76ANJp9x8qt3wQ0jHQetlZSp6nnvgkwtp/3+87zGAQiMwlIVZfsHPtltJQLJyUL4VvlMJ033r6dx5tXul2aNvWqX4TkfYQ4dPZZrUd9cdAtIDw+FuqbBUJ5bj5EhDQjki6sdpz3FdYc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750835429; c=relaxed/simple;
	bh=wPEV3rkHpzYVStrK7S+qOEmN99dY6Jna9uLe/dZKuSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mM1hfzfnc1k2ylqRB5uo6B/djca9c/mln645gb9hJNMz++NEiUuJiP9og3tBhAzTX5UDtIp7UF0eXCrVOHncME+c8LbwA+M3jJ8AS411Ul6oFhpML6uqpzQrlkZ6RrrNM0syVX7AdvQVsVl/JLzMiuk6b30lV/2CDnHV9BRVcSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bHR0hOQp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB70C4CEF7;
	Wed, 25 Jun 2025 07:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750835429;
	bh=wPEV3rkHpzYVStrK7S+qOEmN99dY6Jna9uLe/dZKuSY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bHR0hOQpGCME4HCeGmCX904RXEPw/TVTjCShb++7vtpvuct9mHCrY3zmjEN3EOY1V
	 oc+LTrVLqyi0cKlotcCmSMOB8FKkw8Dd3Fy/b+uePu/qdN6BNQBAULp46mdxxZtTj3
	 mdwTUDBLqYDpifbNeaaeQ5Y0kDbuqjpG5o21k3CGocmTX9Rt78RohLYMG8qkf7vOYp
	 zusgIsPmXgmfMQwmrJPjaMjLTcMADjv8xcxlZYNroQzTFFD97pk5zBP3xV6LX1woWw
	 Qh1iNmOM11c5oKDqBHtp99vPiRBuJPm7QlmTpXX//ENMsdxfQKSS7wycNxJQTFVEuC
	 E+nYupYb1ivkQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 04/18] lib/crypto: sha512: Reorder some code in sha512.c
Date: Wed, 25 Jun 2025 00:08:05 -0700
Message-ID: <20250625070819.1496119-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250625070819.1496119-1-ebiggers@kernel.org>
References: <20250625070819.1496119-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Put the IVs before the round constants, since the IVs are used first.

Put __sha512_final() just above sha384_final() and sha512_final(), which
are the functions that call it.

No code changes other than reordering.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/sha512.c | 72 ++++++++++++++++++++++-----------------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/lib/crypto/sha512.c b/lib/crypto/sha512.c
index e650e2c3317b1..fe9d98b9b7db9 100644
--- a/lib/crypto/sha512.c
+++ b/lib/crypto/sha512.c
@@ -14,10 +14,24 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/overflow.h>
 #include <linux/wordpart.h>
 
+static const struct sha512_block_state sha384_iv = {
+	.h = {
+		SHA384_H0, SHA384_H1, SHA384_H2, SHA384_H3,
+		SHA384_H4, SHA384_H5, SHA384_H6, SHA384_H7,
+	},
+};
+
+static const struct sha512_block_state sha512_iv = {
+	.h = {
+		SHA512_H0, SHA512_H1, SHA512_H2, SHA512_H3,
+		SHA512_H4, SHA512_H5, SHA512_H6, SHA512_H7,
+	},
+};
+
 static const u64 sha512_K[80] = {
 	0x428a2f98d728ae22ULL, 0x7137449123ef65cdULL, 0xb5c0fbcfec4d3b2fULL,
 	0xe9b5dba58189dbbcULL, 0x3956c25bf348b538ULL, 0x59f111f1b605d019ULL,
 	0x923f82a4af194f9bULL, 0xab1c5ed5da6d8118ULL, 0xd807aa98a3030242ULL,
 	0x12835b0145706fbeULL, 0x243185be4ee4b28cULL, 0x550c7dc3d5ffb4e2ULL,
@@ -44,24 +58,10 @@ static const u64 sha512_K[80] = {
 	0x28db77f523047d84ULL, 0x32caab7b40c72493ULL, 0x3c9ebe0a15c9bebcULL,
 	0x431d67c49c100d4cULL, 0x4cc5d4becb3e42b6ULL, 0x597f299cfc657e2aULL,
 	0x5fcb6fab3ad6faecULL, 0x6c44198c4a475817ULL,
 };
 
-static const struct sha512_block_state sha384_iv = {
-	.h = {
-		SHA384_H0, SHA384_H1, SHA384_H2, SHA384_H3,
-		SHA384_H4, SHA384_H5, SHA384_H6, SHA384_H7,
-	},
-};
-
-static const struct sha512_block_state sha512_iv = {
-	.h = {
-		SHA512_H0, SHA512_H1, SHA512_H2, SHA512_H3,
-		SHA512_H4, SHA512_H5, SHA512_H6, SHA512_H7,
-	},
-};
-
 #define Ch(x, y, z) ((z) ^ ((x) & ((y) ^ (z))))
 #define Maj(x, y, z) (((x) & (y)) | ((z) & ((x) | (y))))
 #define e0(x) (ror64((x), 28) ^ ror64((x), 34) ^ ror64((x), 39))
 #define e1(x) (ror64((x), 14) ^ ror64((x), 18) ^ ror64((x), 41))
 #define s0(x) (ror64((x), 1) ^ ror64((x), 8) ^ ((x) >> 7))
@@ -134,32 +134,10 @@ sha512_blocks_generic(struct sha512_block_state *state,
 #include "sha512.h" /* $(SRCARCH)/sha512.h */
 #else
 #define sha512_blocks sha512_blocks_generic
 #endif
 
-static void __sha512_final(struct __sha512_ctx *ctx,
-			   u8 *out, size_t digest_size)
-{
-	u64 bitcount_hi = (ctx->bytecount_hi << 3) | (ctx->bytecount_lo >> 61);
-	u64 bitcount_lo = ctx->bytecount_lo << 3;
-	size_t partial = ctx->bytecount_lo % SHA512_BLOCK_SIZE;
-
-	ctx->buf[partial++] = 0x80;
-	if (partial > SHA512_BLOCK_SIZE - 16) {
-		memset(&ctx->buf[partial], 0, SHA512_BLOCK_SIZE - partial);
-		sha512_blocks(&ctx->state, ctx->buf, 1);
-		partial = 0;
-	}
-	memset(&ctx->buf[partial], 0, SHA512_BLOCK_SIZE - 16 - partial);
-	*(__be64 *)&ctx->buf[SHA512_BLOCK_SIZE - 16] = cpu_to_be64(bitcount_hi);
-	*(__be64 *)&ctx->buf[SHA512_BLOCK_SIZE - 8] = cpu_to_be64(bitcount_lo);
-	sha512_blocks(&ctx->state, ctx->buf, 1);
-
-	for (size_t i = 0; i < digest_size; i += 8)
-		put_unaligned_be64(ctx->state.h[i / 8], out + i);
-}
-
 static void __sha512_init(struct __sha512_ctx *ctx,
 			  const struct sha512_block_state *iv,
 			  u64 initial_bytecount)
 {
 	ctx->state = *iv;
@@ -211,10 +189,32 @@ void __sha512_update(struct __sha512_ctx *ctx, const u8 *data, size_t len)
 	if (len)
 		memcpy(&ctx->buf[partial], data, len);
 }
 EXPORT_SYMBOL_GPL(__sha512_update);
 
+static void __sha512_final(struct __sha512_ctx *ctx,
+			   u8 *out, size_t digest_size)
+{
+	u64 bitcount_hi = (ctx->bytecount_hi << 3) | (ctx->bytecount_lo >> 61);
+	u64 bitcount_lo = ctx->bytecount_lo << 3;
+	size_t partial = ctx->bytecount_lo % SHA512_BLOCK_SIZE;
+
+	ctx->buf[partial++] = 0x80;
+	if (partial > SHA512_BLOCK_SIZE - 16) {
+		memset(&ctx->buf[partial], 0, SHA512_BLOCK_SIZE - partial);
+		sha512_blocks(&ctx->state, ctx->buf, 1);
+		partial = 0;
+	}
+	memset(&ctx->buf[partial], 0, SHA512_BLOCK_SIZE - 16 - partial);
+	*(__be64 *)&ctx->buf[SHA512_BLOCK_SIZE - 16] = cpu_to_be64(bitcount_hi);
+	*(__be64 *)&ctx->buf[SHA512_BLOCK_SIZE - 8] = cpu_to_be64(bitcount_lo);
+	sha512_blocks(&ctx->state, ctx->buf, 1);
+
+	for (size_t i = 0; i < digest_size; i += 8)
+		put_unaligned_be64(ctx->state.h[i / 8], out + i);
+}
+
 void sha384_final(struct sha384_ctx *ctx, u8 out[SHA384_DIGEST_SIZE])
 {
 	__sha512_final(&ctx->ctx, out, SHA384_DIGEST_SIZE);
 	memzero_explicit(ctx, sizeof(*ctx));
 }
-- 
2.50.0


