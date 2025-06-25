Return-Path: <linux-mips+bounces-9483-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D56FAE780A
	for <lists+linux-mips@lfdr.de>; Wed, 25 Jun 2025 09:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 804523BED76
	for <lists+linux-mips@lfdr.de>; Wed, 25 Jun 2025 07:11:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627F62139C8;
	Wed, 25 Jun 2025 07:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Quc/P6eu"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9DA211A15;
	Wed, 25 Jun 2025 07:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750835431; cv=none; b=td85UVC7mI0LPoXK6qIPCJTUFJpX4ni6KNFboliLk6qziDvtqnsLhOKsVWDCZInSQkaB7+mDLmPC3Sw9TriHoQ0NQqcBFCqLdilMUs5i7T8tXT67Azg2/+71U9lcb9kau2FYIRjMRKyvnEYA0mX/DOEEhk3lumIhhwVxjplFQYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750835431; c=relaxed/simple;
	bh=5WUT3FVFtGYY38nGQk9FGEw/eHR0uyP40u2JgCeMrws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RuFqgDcknZ0JXgf96Bek19fUhCOWGeGPdgFMrIzewROQgDwKSdrfeZoqgE/8hFEHU1NwAaWCoj5gsFZK5Do7p5BkeYtYcT85/alwLfr+DuvejqozfYT7G/vDSIp8E3iVT+UORphz0uQLKVoaIBLxkUjtaq4z1Dgd+UBRZoJ9D1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Quc/P6eu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A9AEC4CEF5;
	Wed, 25 Jun 2025 07:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750835430;
	bh=5WUT3FVFtGYY38nGQk9FGEw/eHR0uyP40u2JgCeMrws=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Quc/P6eu5iIScTCwgcuUNaTCGoZUIh6fp/hl7LHmviUQEmRe+t4LKdFCBH7navrfo
	 GICzrHziIKzqzyFPphpHP3vo3HEX/7j5OI/vmmZ+XLVowZee9Wyi8jJQ5wlh2uunHE
	 h3rFtEujKoiwh+eJKW6dE8GGHzKaTRDnO/rC1+Mcjz1eQ1WFW6US8zZ3MJsqT4zaqV
	 iK7S6x93chir8amN7aJinaXtXZEHsjWX0ZQ82+Yq2sYG/Uz8xB5Bh26wshdB7cCu1j
	 MWbfnItzcqqAhjD1xmylW17qmZH9qmFLwgW6njpigcrHg1Ehhg3WocNaQuohNf4WMK
	 H645fNotiWbsg==
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
Subject: [PATCH 07/18] lib/crypto: sha256: Reorder some code
Date: Wed, 25 Jun 2025 00:08:08 -0700
Message-ID: <20250625070819.1496119-8-ebiggers@kernel.org>
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

First, move the declarations of sha224_init/update/final to be just
above the corresponding SHA-256 code, matching the order that I used for
SHA-384 and SHA-512.  In sha2.h, the end result is that SHA-224,
SHA-256, SHA-384, and SHA-512 are all in the logical order.

Second, move sha224_block_init() and sha256_block_init() to be just
below crypto_sha256_state.  In later changes, these functions as well as
struct crypto_sha256_state will no longer be used by the library
functions.  They'll remain just for some legacy offload drivers.  This
gets them into a logical place in the file for that.

No code changes other than reordering.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/sha2.h | 60 +++++++++++++++++++++----------------------
 lib/crypto/sha256.c   | 12 ++++-----
 2 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/include/crypto/sha2.h b/include/crypto/sha2.h
index 296ce9d468bfc..bb181b7996cdc 100644
--- a/include/crypto/sha2.h
+++ b/include/crypto/sha2.h
@@ -69,10 +69,36 @@ extern const u8 sha512_zero_message_hash[SHA512_DIGEST_SIZE];
 struct crypto_sha256_state {
 	u32 state[SHA256_STATE_WORDS];
 	u64 count;
 };
 
+static inline void sha224_block_init(struct crypto_sha256_state *sctx)
+{
+	sctx->state[0] = SHA224_H0;
+	sctx->state[1] = SHA224_H1;
+	sctx->state[2] = SHA224_H2;
+	sctx->state[3] = SHA224_H3;
+	sctx->state[4] = SHA224_H4;
+	sctx->state[5] = SHA224_H5;
+	sctx->state[6] = SHA224_H6;
+	sctx->state[7] = SHA224_H7;
+	sctx->count = 0;
+}
+
+static inline void sha256_block_init(struct crypto_sha256_state *sctx)
+{
+	sctx->state[0] = SHA256_H0;
+	sctx->state[1] = SHA256_H1;
+	sctx->state[2] = SHA256_H2;
+	sctx->state[3] = SHA256_H3;
+	sctx->state[4] = SHA256_H4;
+	sctx->state[5] = SHA256_H5;
+	sctx->state[6] = SHA256_H6;
+	sctx->state[7] = SHA256_H7;
+	sctx->count = 0;
+}
+
 struct sha256_state {
 	union {
 		struct crypto_sha256_state ctx;
 		struct {
 			u32 state[SHA256_STATE_WORDS];
@@ -86,51 +112,25 @@ struct sha512_state {
 	u64 state[SHA512_DIGEST_SIZE / 8];
 	u64 count[2];
 	u8 buf[SHA512_BLOCK_SIZE];
 };
 
-static inline void sha256_block_init(struct crypto_sha256_state *sctx)
+static inline void sha224_init(struct sha256_state *sctx)
 {
-	sctx->state[0] = SHA256_H0;
-	sctx->state[1] = SHA256_H1;
-	sctx->state[2] = SHA256_H2;
-	sctx->state[3] = SHA256_H3;
-	sctx->state[4] = SHA256_H4;
-	sctx->state[5] = SHA256_H5;
-	sctx->state[6] = SHA256_H6;
-	sctx->state[7] = SHA256_H7;
-	sctx->count = 0;
+	sha224_block_init(&sctx->ctx);
 }
+/* Simply use sha256_update as it is equivalent to sha224_update. */
+void sha224_final(struct sha256_state *sctx, u8 out[SHA224_DIGEST_SIZE]);
 
 static inline void sha256_init(struct sha256_state *sctx)
 {
 	sha256_block_init(&sctx->ctx);
 }
 void sha256_update(struct sha256_state *sctx, const u8 *data, size_t len);
 void sha256_final(struct sha256_state *sctx, u8 out[SHA256_DIGEST_SIZE]);
 void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE]);
 
-static inline void sha224_block_init(struct crypto_sha256_state *sctx)
-{
-	sctx->state[0] = SHA224_H0;
-	sctx->state[1] = SHA224_H1;
-	sctx->state[2] = SHA224_H2;
-	sctx->state[3] = SHA224_H3;
-	sctx->state[4] = SHA224_H4;
-	sctx->state[5] = SHA224_H5;
-	sctx->state[6] = SHA224_H6;
-	sctx->state[7] = SHA224_H7;
-	sctx->count = 0;
-}
-
-static inline void sha224_init(struct sha256_state *sctx)
-{
-	sha224_block_init(&sctx->ctx);
-}
-/* Simply use sha256_update as it is equivalent to sha224_update. */
-void sha224_final(struct sha256_state *sctx, u8 out[SHA224_DIGEST_SIZE]);
-
 /* State for the SHA-512 (and SHA-384) compression function */
 struct sha512_block_state {
 	u64 h[8];
 };
 
diff --git a/lib/crypto/sha256.c b/lib/crypto/sha256.c
index 6bfa4ae8dfb59..573ccecbf48bf 100644
--- a/lib/crypto/sha256.c
+++ b/lib/crypto/sha256.c
@@ -56,22 +56,22 @@ static inline void __sha256_final(struct sha256_state *sctx, u8 *out,
 	sha256_finup(&sctx->ctx, sctx->buf, partial, out, digest_size,
 		     sha256_purgatory(), false);
 	memzero_explicit(sctx, sizeof(*sctx));
 }
 
-void sha256_final(struct sha256_state *sctx, u8 out[SHA256_DIGEST_SIZE])
-{
-	__sha256_final(sctx, out, SHA256_DIGEST_SIZE);
-}
-EXPORT_SYMBOL(sha256_final);
-
 void sha224_final(struct sha256_state *sctx, u8 out[SHA224_DIGEST_SIZE])
 {
 	__sha256_final(sctx, out, SHA224_DIGEST_SIZE);
 }
 EXPORT_SYMBOL(sha224_final);
 
+void sha256_final(struct sha256_state *sctx, u8 out[SHA256_DIGEST_SIZE])
+{
+	__sha256_final(sctx, out, SHA256_DIGEST_SIZE);
+}
+EXPORT_SYMBOL(sha256_final);
+
 void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE])
 {
 	struct sha256_state sctx;
 
 	sha256_init(&sctx);
-- 
2.50.0


