Return-Path: <linux-mips+bounces-9553-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D14AEE348
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 18:05:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10B247ABA5F
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 16:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ADFD290BA5;
	Mon, 30 Jun 2025 16:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MKVr3R9j"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D3E28FFE5;
	Mon, 30 Jun 2025 16:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751299523; cv=none; b=bHw7m3LvFIE5w56YyytjIxCWKtW+K2AKbHMnZ3Hzl4c2obundeS+FXo4zdbBcOcyQZDGFHMwryZDtxyv+lFG5oy0nuWekp6YMVtzjo3Rhok2iipMnN3ovMYszxBfgdNei3gXDyf+EhH/nDVM289G+0oFjenGiPay4ZL/L1QF3Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751299523; c=relaxed/simple;
	bh=m2Tqpcxe392TMDWwIQDZ7diXyctLde0ZUhfAzh0L8O0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S4ioiy5H6L1hVbcIv7vNOJk7TvYs95qA3MvreDUAXOkvcCXldOjF5wBEOFM5SIXQqbX/vqQZMgOP5VANrnNRMjavdyELPhe0B48yXjJ6/VYrHL9m7SqWD7O7U0z+DrXtZ7F5HD6ozNf0ZpqQvXnmhzRA+miSBZVxtvxpnHK61vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MKVr3R9j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAD15C4CEF1;
	Mon, 30 Jun 2025 16:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299523;
	bh=m2Tqpcxe392TMDWwIQDZ7diXyctLde0ZUhfAzh0L8O0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MKVr3R9jxuc0YdBb9mUnB/ZaPlKMJ+oVKqpsx1/waJ9k+r0x3YEEgl5OPCUiF72Bs
	 oERs2kKqM9P0C5S178q4XhoMZskxAqO3ubL7YrAaxDZhDZAvfcp7A263K4Ho4O4zR2
	 azodLw0bc57w/2+ir7MRKwakzvic358jY9oOKAd+YVf0znOaKyNyn7xIUE/RuhEaqQ
	 52HNCm3rLycIos/73ZbY5ePUhWOIoB3MKU22ykQ1/xEqbwj2h+4jqgPbrlalnYvoTo
	 CETeimyGRrWz5sDz08Xp4Kp6VafpNE22PphuRbFUytZrT8SRz73k5lSFXWEZWlv2gn
	 0dy27oJAnharA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v3 03/16] lib/crypto: sha512: Add HMAC-SHA384 and HMAC-SHA512 support
Date: Mon, 30 Jun 2025 09:03:07 -0700
Message-ID: <20250630160320.2888-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630160320.2888-1-ebiggers@kernel.org>
References: <20250630160320.2888-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since HMAC support is commonly needed and is fairly simple, include it
as a first-class citizen of the SHA-512 library.

The API supports both incremental and one-shot computation, and either
preparing the key ahead of time or just using a raw key.  The
implementation is much more streamlined than crypto/hmac.c.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/sha2.h | 222 ++++++++++++++++++++++++++++++++++++++++++
 lib/crypto/Kconfig    |   5 +-
 lib/crypto/sha512.c   | 141 ++++++++++++++++++++++++++-
 3 files changed, 364 insertions(+), 4 deletions(-)

diff --git a/include/crypto/sha2.h b/include/crypto/sha2.h
index f2a6e84b28400..296ce9d468bfc 100644
--- a/include/crypto/sha2.h
+++ b/include/crypto/sha2.h
@@ -145,10 +145,26 @@ struct __sha512_ctx {
 	u64 bytecount_hi;
 	u8 buf[SHA512_BLOCK_SIZE] __aligned(__alignof__(__be64));
 };
 void __sha512_update(struct __sha512_ctx *ctx, const u8 *data, size_t len);
 
+/*
+ * HMAC key and message context structs, shared by HMAC-SHA384 and HMAC-SHA512.
+ * The hmac_sha384_* and hmac_sha512_* structs wrap this one so that the API has
+ * proper typing and doesn't allow mixing the functions arbitrarily.
+ */
+struct __hmac_sha512_key {
+	struct sha512_block_state istate;
+	struct sha512_block_state ostate;
+};
+struct __hmac_sha512_ctx {
+	struct __sha512_ctx sha_ctx;
+	struct sha512_block_state ostate;
+};
+void __hmac_sha512_init(struct __hmac_sha512_ctx *ctx,
+			const struct __hmac_sha512_key *key);
+
 /**
  * struct sha384_ctx - Context for hashing a message with SHA-384
  * @ctx: private
  */
 struct sha384_ctx {
@@ -200,10 +216,113 @@ void sha384_final(struct sha384_ctx *ctx, u8 out[SHA384_DIGEST_SIZE]);
  *
  * Context: Any context.
  */
 void sha384(const u8 *data, size_t len, u8 out[SHA384_DIGEST_SIZE]);
 
+/**
+ * struct hmac_sha384_key - Prepared key for HMAC-SHA384
+ * @key: private
+ */
+struct hmac_sha384_key {
+	struct __hmac_sha512_key key;
+};
+
+/**
+ * struct hmac_sha384_ctx - Context for computing HMAC-SHA384 of a message
+ * @ctx: private
+ */
+struct hmac_sha384_ctx {
+	struct __hmac_sha512_ctx ctx;
+};
+
+/**
+ * hmac_sha384_preparekey() - Prepare a key for HMAC-SHA384
+ * @key: (output) the key structure to initialize
+ * @raw_key: the raw HMAC-SHA384 key
+ * @raw_key_len: the key length in bytes.  All key lengths are supported.
+ *
+ * Note: the caller is responsible for zeroizing both the struct hmac_sha384_key
+ * and the raw key once they are no longer needed.
+ *
+ * Context: Any context.
+ */
+void hmac_sha384_preparekey(struct hmac_sha384_key *key,
+			    const u8 *raw_key, size_t raw_key_len);
+
+/**
+ * hmac_sha384_init() - Initialize an HMAC-SHA384 context for a new message
+ * @ctx: (output) the HMAC context to initialize
+ * @key: the prepared HMAC key
+ *
+ * If you don't need incremental computation, consider hmac_sha384() instead.
+ *
+ * Context: Any context.
+ */
+static inline void hmac_sha384_init(struct hmac_sha384_ctx *ctx,
+				    const struct hmac_sha384_key *key)
+{
+	__hmac_sha512_init(&ctx->ctx, &key->key);
+}
+
+/**
+ * hmac_sha384_update() - Update an HMAC-SHA384 context with message data
+ * @ctx: the HMAC context to update; must have been initialized
+ * @data: the message data
+ * @data_len: the data length in bytes
+ *
+ * This can be called any number of times.
+ *
+ * Context: Any context.
+ */
+static inline void hmac_sha384_update(struct hmac_sha384_ctx *ctx,
+				      const u8 *data, size_t data_len)
+{
+	__sha512_update(&ctx->ctx.sha_ctx, data, data_len);
+}
+
+/**
+ * hmac_sha384_final() - Finish computing an HMAC-SHA384 value
+ * @ctx: the HMAC context to finalize; must have been initialized
+ * @out: (output) the resulting HMAC-SHA384 value
+ *
+ * After finishing, this zeroizes @ctx.  So the caller does not need to do it.
+ *
+ * Context: Any context.
+ */
+void hmac_sha384_final(struct hmac_sha384_ctx *ctx, u8 out[SHA384_DIGEST_SIZE]);
+
+/**
+ * hmac_sha384() - Compute HMAC-SHA384 in one shot, using a prepared key
+ * @key: the prepared HMAC key
+ * @data: the message data
+ * @data_len: the data length in bytes
+ * @out: (output) the resulting HMAC-SHA384 value
+ *
+ * If you're using the key only once, consider using hmac_sha384_usingrawkey().
+ *
+ * Context: Any context.
+ */
+void hmac_sha384(const struct hmac_sha384_key *key,
+		 const u8 *data, size_t data_len, u8 out[SHA384_DIGEST_SIZE]);
+
+/**
+ * hmac_sha384_usingrawkey() - Compute HMAC-SHA384 in one shot, using a raw key
+ * @raw_key: the raw HMAC-SHA384 key
+ * @raw_key_len: the key length in bytes.  All key lengths are supported.
+ * @data: the message data
+ * @data_len: the data length in bytes
+ * @out: (output) the resulting HMAC-SHA384 value
+ *
+ * If you're using the key multiple times, prefer to use
+ * hmac_sha384_preparekey() followed by multiple calls to hmac_sha384() instead.
+ *
+ * Context: Any context.
+ */
+void hmac_sha384_usingrawkey(const u8 *raw_key, size_t raw_key_len,
+			     const u8 *data, size_t data_len,
+			     u8 out[SHA384_DIGEST_SIZE]);
+
 /**
  * struct sha512_ctx - Context for hashing a message with SHA-512
  * @ctx: private
  */
 struct sha512_ctx {
@@ -255,6 +374,109 @@ void sha512_final(struct sha512_ctx *ctx, u8 out[SHA512_DIGEST_SIZE]);
  *
  * Context: Any context.
  */
 void sha512(const u8 *data, size_t len, u8 out[SHA512_DIGEST_SIZE]);
 
+/**
+ * struct hmac_sha512_key - Prepared key for HMAC-SHA512
+ * @key: private
+ */
+struct hmac_sha512_key {
+	struct __hmac_sha512_key key;
+};
+
+/**
+ * struct hmac_sha512_ctx - Context for computing HMAC-SHA512 of a message
+ * @ctx: private
+ */
+struct hmac_sha512_ctx {
+	struct __hmac_sha512_ctx ctx;
+};
+
+/**
+ * hmac_sha512_preparekey() - Prepare a key for HMAC-SHA512
+ * @key: (output) the key structure to initialize
+ * @raw_key: the raw HMAC-SHA512 key
+ * @raw_key_len: the key length in bytes.  All key lengths are supported.
+ *
+ * Note: the caller is responsible for zeroizing both the struct hmac_sha512_key
+ * and the raw key once they are no longer needed.
+ *
+ * Context: Any context.
+ */
+void hmac_sha512_preparekey(struct hmac_sha512_key *key,
+			    const u8 *raw_key, size_t raw_key_len);
+
+/**
+ * hmac_sha512_init() - Initialize an HMAC-SHA512 context for a new message
+ * @ctx: (output) the HMAC context to initialize
+ * @key: the prepared HMAC key
+ *
+ * If you don't need incremental computation, consider hmac_sha512() instead.
+ *
+ * Context: Any context.
+ */
+static inline void hmac_sha512_init(struct hmac_sha512_ctx *ctx,
+				    const struct hmac_sha512_key *key)
+{
+	__hmac_sha512_init(&ctx->ctx, &key->key);
+}
+
+/**
+ * hmac_sha512_update() - Update an HMAC-SHA512 context with message data
+ * @ctx: the HMAC context to update; must have been initialized
+ * @data: the message data
+ * @data_len: the data length in bytes
+ *
+ * This can be called any number of times.
+ *
+ * Context: Any context.
+ */
+static inline void hmac_sha512_update(struct hmac_sha512_ctx *ctx,
+				      const u8 *data, size_t data_len)
+{
+	__sha512_update(&ctx->ctx.sha_ctx, data, data_len);
+}
+
+/**
+ * hmac_sha512_final() - Finish computing an HMAC-SHA512 value
+ * @ctx: the HMAC context to finalize; must have been initialized
+ * @out: (output) the resulting HMAC-SHA512 value
+ *
+ * After finishing, this zeroizes @ctx.  So the caller does not need to do it.
+ *
+ * Context: Any context.
+ */
+void hmac_sha512_final(struct hmac_sha512_ctx *ctx, u8 out[SHA512_DIGEST_SIZE]);
+
+/**
+ * hmac_sha512() - Compute HMAC-SHA512 in one shot, using a prepared key
+ * @key: the prepared HMAC key
+ * @data: the message data
+ * @data_len: the data length in bytes
+ * @out: (output) the resulting HMAC-SHA512 value
+ *
+ * If you're using the key only once, consider using hmac_sha512_usingrawkey().
+ *
+ * Context: Any context.
+ */
+void hmac_sha512(const struct hmac_sha512_key *key,
+		 const u8 *data, size_t data_len, u8 out[SHA512_DIGEST_SIZE]);
+
+/**
+ * hmac_sha512_usingrawkey() - Compute HMAC-SHA512 in one shot, using a raw key
+ * @raw_key: the raw HMAC-SHA512 key
+ * @raw_key_len: the key length in bytes.  All key lengths are supported.
+ * @data: the message data
+ * @data_len: the data length in bytes
+ * @out: (output) the resulting HMAC-SHA512 value
+ *
+ * If you're using the key multiple times, prefer to use
+ * hmac_sha512_preparekey() followed by multiple calls to hmac_sha512() instead.
+ *
+ * Context: Any context.
+ */
+void hmac_sha512_usingrawkey(const u8 *raw_key, size_t raw_key_len,
+			     const u8 *data, size_t data_len,
+			     u8 out[SHA512_DIGEST_SIZE]);
+
 #endif /* _CRYPTO_SHA2_H */
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 2d295c0e0f792..d1bee3787eb3c 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -168,12 +168,13 @@ config CRYPTO_LIB_SHA256_GENERIC
 	  enabled, this implementation serves the users of CRYPTO_LIB_SHA256.
 
 config CRYPTO_LIB_SHA512
 	tristate
 	help
-	  The SHA-384 and SHA-512 library functions.  Select this if your module
-	  uses any of these functions from <crypto/sha2.h>.
+	  The SHA-384, SHA-512, HMAC-SHA384, and HMAC-SHA512 library functions.
+	  Select this if your module uses any of these functions from
+	  <crypto/sha2.h>.
 
 config CRYPTO_LIB_SHA512_ARCH
 	bool
 	depends on CRYPTO_LIB_SHA512 && !UML
 
diff --git a/lib/crypto/sha512.c b/lib/crypto/sha512.c
index 536b71481b1ca..d514721491ca0 100644
--- a/lib/crypto/sha512.c
+++ b/lib/crypto/sha512.c
@@ -1,22 +1,24 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * SHA-384 and SHA-512 library functions
+ * SHA-384, SHA-512, HMAC-SHA384, and HMAC-SHA512 library functions
  *
  * Copyright (c) Jean-Luc Cooke <jlcooke@certainkey.com>
  * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
  * Copyright (c) 2003 Kyle McMartin <kyle@debian.org>
  * Copyright 2025 Google LLC
  */
 
+#include <crypto/hmac.h>
 #include <crypto/sha2.h>
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/overflow.h>
 #include <linux/string.h>
 #include <linux/unaligned.h>
+#include <linux/wordpart.h>
 
 static const struct sha512_block_state sha384_iv = {
 	.h = {
 		SHA384_H0, SHA384_H1, SHA384_H2, SHA384_H3,
 		SHA384_H4, SHA384_H5, SHA384_H6, SHA384_H7,
@@ -245,10 +247,145 @@ void sha512(const u8 *data, size_t len, u8 out[SHA512_DIGEST_SIZE])
 	sha512_update(&ctx, data, len);
 	sha512_final(&ctx, out);
 }
 EXPORT_SYMBOL_GPL(sha512);
 
+static void __hmac_sha512_preparekey(struct __hmac_sha512_key *key,
+				     const u8 *raw_key, size_t raw_key_len,
+				     const struct sha512_block_state *iv)
+{
+	union {
+		u8 b[SHA512_BLOCK_SIZE];
+		unsigned long w[SHA512_BLOCK_SIZE / sizeof(unsigned long)];
+	} derived_key = { 0 };
+
+	if (unlikely(raw_key_len > SHA512_BLOCK_SIZE)) {
+		if (iv == &sha384_iv)
+			sha384(raw_key, raw_key_len, derived_key.b);
+		else
+			sha512(raw_key, raw_key_len, derived_key.b);
+	} else {
+		memcpy(derived_key.b, raw_key, raw_key_len);
+	}
+
+	for (size_t i = 0; i < ARRAY_SIZE(derived_key.w); i++)
+		derived_key.w[i] ^= REPEAT_BYTE(HMAC_IPAD_VALUE);
+	key->istate = *iv;
+	sha512_blocks(&key->istate, derived_key.b, 1);
+
+	for (size_t i = 0; i < ARRAY_SIZE(derived_key.w); i++)
+		derived_key.w[i] ^= REPEAT_BYTE(HMAC_OPAD_VALUE ^
+						HMAC_IPAD_VALUE);
+	key->ostate = *iv;
+	sha512_blocks(&key->ostate, derived_key.b, 1);
+
+	memzero_explicit(&derived_key, sizeof(derived_key));
+}
+
+void hmac_sha384_preparekey(struct hmac_sha384_key *key,
+			    const u8 *raw_key, size_t raw_key_len)
+{
+	__hmac_sha512_preparekey(&key->key, raw_key, raw_key_len, &sha384_iv);
+}
+EXPORT_SYMBOL_GPL(hmac_sha384_preparekey);
+
+void hmac_sha512_preparekey(struct hmac_sha512_key *key,
+			    const u8 *raw_key, size_t raw_key_len)
+{
+	__hmac_sha512_preparekey(&key->key, raw_key, raw_key_len, &sha512_iv);
+}
+EXPORT_SYMBOL_GPL(hmac_sha512_preparekey);
+
+void __hmac_sha512_init(struct __hmac_sha512_ctx *ctx,
+			const struct __hmac_sha512_key *key)
+{
+	__sha512_init(&ctx->sha_ctx, &key->istate, SHA512_BLOCK_SIZE);
+	ctx->ostate = key->ostate;
+}
+EXPORT_SYMBOL_GPL(__hmac_sha512_init);
+
+static void __hmac_sha512_final(struct __hmac_sha512_ctx *ctx,
+				u8 *out, size_t digest_size)
+{
+	/* Generate the padded input for the outer hash in ctx->sha_ctx.buf. */
+	__sha512_final(&ctx->sha_ctx, ctx->sha_ctx.buf, digest_size);
+	memset(&ctx->sha_ctx.buf[digest_size], 0,
+	       SHA512_BLOCK_SIZE - digest_size);
+	ctx->sha_ctx.buf[digest_size] = 0x80;
+	*(__be32 *)&ctx->sha_ctx.buf[SHA512_BLOCK_SIZE - 4] =
+		cpu_to_be32(8 * (SHA512_BLOCK_SIZE + digest_size));
+
+	/* Compute the outer hash, which gives the HMAC value. */
+	sha512_blocks(&ctx->ostate, ctx->sha_ctx.buf, 1);
+	for (size_t i = 0; i < digest_size; i += 8)
+		put_unaligned_be64(ctx->ostate.h[i / 8], out + i);
+
+	memzero_explicit(ctx, sizeof(*ctx));
+}
+
+void hmac_sha384_final(struct hmac_sha384_ctx *ctx,
+		       u8 out[SHA384_DIGEST_SIZE])
+{
+	__hmac_sha512_final(&ctx->ctx, out, SHA384_DIGEST_SIZE);
+}
+EXPORT_SYMBOL_GPL(hmac_sha384_final);
+
+void hmac_sha512_final(struct hmac_sha512_ctx *ctx,
+		       u8 out[SHA512_DIGEST_SIZE])
+{
+	__hmac_sha512_final(&ctx->ctx, out, SHA512_DIGEST_SIZE);
+}
+EXPORT_SYMBOL_GPL(hmac_sha512_final);
+
+void hmac_sha384(const struct hmac_sha384_key *key,
+		 const u8 *data, size_t data_len, u8 out[SHA384_DIGEST_SIZE])
+{
+	struct hmac_sha384_ctx ctx;
+
+	hmac_sha384_init(&ctx, key);
+	hmac_sha384_update(&ctx, data, data_len);
+	hmac_sha384_final(&ctx, out);
+}
+EXPORT_SYMBOL_GPL(hmac_sha384);
+
+void hmac_sha512(const struct hmac_sha512_key *key,
+		 const u8 *data, size_t data_len, u8 out[SHA512_DIGEST_SIZE])
+{
+	struct hmac_sha512_ctx ctx;
+
+	hmac_sha512_init(&ctx, key);
+	hmac_sha512_update(&ctx, data, data_len);
+	hmac_sha512_final(&ctx, out);
+}
+EXPORT_SYMBOL_GPL(hmac_sha512);
+
+void hmac_sha384_usingrawkey(const u8 *raw_key, size_t raw_key_len,
+			     const u8 *data, size_t data_len,
+			     u8 out[SHA384_DIGEST_SIZE])
+{
+	struct hmac_sha384_key key;
+
+	hmac_sha384_preparekey(&key, raw_key, raw_key_len);
+	hmac_sha384(&key, data, data_len, out);
+
+	memzero_explicit(&key, sizeof(key));
+}
+EXPORT_SYMBOL_GPL(hmac_sha384_usingrawkey);
+
+void hmac_sha512_usingrawkey(const u8 *raw_key, size_t raw_key_len,
+			     const u8 *data, size_t data_len,
+			     u8 out[SHA512_DIGEST_SIZE])
+{
+	struct hmac_sha512_key key;
+
+	hmac_sha512_preparekey(&key, raw_key, raw_key_len);
+	hmac_sha512(&key, data, data_len, out);
+
+	memzero_explicit(&key, sizeof(key));
+}
+EXPORT_SYMBOL_GPL(hmac_sha512_usingrawkey);
+
 #ifdef sha512_mod_init_arch
 static int __init sha512_mod_init(void)
 {
 	sha512_mod_init_arch();
 	return 0;
@@ -259,7 +396,7 @@ static void __exit sha512_mod_exit(void)
 {
 }
 module_exit(sha512_mod_exit);
 #endif
 
-MODULE_DESCRIPTION("SHA-384 and SHA-512 library functions");
+MODULE_DESCRIPTION("SHA-384, SHA-512, HMAC-SHA384, and HMAC-SHA512 library functions");
 MODULE_LICENSE("GPL");
-- 
2.50.0


