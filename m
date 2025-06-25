Return-Path: <linux-mips+bounces-9488-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F00AE781D
	for <lists+linux-mips@lfdr.de>; Wed, 25 Jun 2025 09:13:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A5051BC5EBD
	for <lists+linux-mips@lfdr.de>; Wed, 25 Jun 2025 07:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A36E2206A9;
	Wed, 25 Jun 2025 07:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bGgwTm2q"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C6921D3DB;
	Wed, 25 Jun 2025 07:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750835433; cv=none; b=dkMaoXDBYsrGc1eSauJETUWc3GZz/HuX3G+dx2PrZx7dY/tCTrPLNuA5O2BV2Rr3p6lRnujIiKTs6V0ewQPTrJH/rjKXKF9jN+RspueXqKmcHIvl9s2hPUkngsVDx0Z5J/1SMZV66yAKToqaGWPq9HGSSKBjVKpyNLsUsxkJXhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750835433; c=relaxed/simple;
	bh=HcT0g5xVAWv/N1IR5pEWuUbH8BmCfR6q+xHzYq1G6lk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eESqB0T/AHHh24nYroYkPcp2eQbudlKPl/DLI/+IHej7sfw2dbZwP1QTY+0zOjgl2oJNJ6rSRPk6Or9KuLKobK7M68tLry7N646Qee1SsqlbNZUNXi/9C8GMmWotfRMEw3TzYnReS0s6yA/+zGTsVLboWrKO6WWxX0HF5oLMz7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bGgwTm2q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9681DC4CEF5;
	Wed, 25 Jun 2025 07:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750835432;
	bh=HcT0g5xVAWv/N1IR5pEWuUbH8BmCfR6q+xHzYq1G6lk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bGgwTm2qXC8YWw3rGgR+lHbPGOQQ/R4KGHs4yhXIoT3fqyhl19hbTUtM8dvXWJWpd
	 JFMRJljmUlGkBNKGbQwrg2OrYrBbOmmkLbfT89ahvff9JlIDOJ/YdVkFmjjkU/zMRL
	 N6xl6d93c+iiFynuJk60pUF1JidoqO9E+WChoY3Daba0yeF7mIFNFNGLvKocEfQlqh
	 qA/Lv7qPWcCLjw4RnDU3lGzC39o9L6Za9uBu1lYk9hQfwK6Ts6xdFbPF30wSGdQgPR
	 Bj/zByvKdS2wG1OPmCwaDByOfcnT3Hn8nMTz8VxHHnPMSflTbT1NLWINC0jTbgbIaA
	 Q3Z5Jzbp+07Ew==
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
Subject: [PATCH 12/18] lib/crypto: sha256: Add HMAC-SHA224 and HMAC-SHA256 support
Date: Wed, 25 Jun 2025 00:08:13 -0700
Message-ID: <20250625070819.1496119-13-ebiggers@kernel.org>
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

Since HMAC support is commonly needed and is fairly simple, include it
as a first-class citizen of the SHA-256 library.

The API supports both incremental and one-shot computation, and either
preparing the key ahead of time or just using a raw key.  The
implementation is much more streamlined than crypto/hmac.c.

I've kept it consistent with the HMAC-SHA384 and HMAC-SHA512 code as
much as possible.

Testing of these functions will be via sha224_kunit and sha256_kunit,
added by a later commit.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/sha2.h | 222 ++++++++++++++++++++++++++++++++++++++++++
 lib/crypto/sha256.c   | 145 +++++++++++++++++++++++++--
 2 files changed, 361 insertions(+), 6 deletions(-)

diff --git a/include/crypto/sha2.h b/include/crypto/sha2.h
index 18e1eec841b71..2e3fc2cf4aa0d 100644
--- a/include/crypto/sha2.h
+++ b/include/crypto/sha2.h
@@ -129,10 +129,26 @@ struct __sha256_ctx {
 	u64 bytecount;
 	u8 buf[SHA256_BLOCK_SIZE] __aligned(__alignof__(__be64));
 };
 void __sha256_update(struct __sha256_ctx *ctx, const u8 *data, size_t len);
 
+/*
+ * HMAC key and message context structs, shared by HMAC-SHA224 and HMAC-SHA256.
+ * The hmac_sha224_* and hmac_sha256_* structs wrap this one so that the API has
+ * proper typing and doesn't allow mixing the functions arbitrarily.
+ */
+struct __hmac_sha256_key {
+	struct sha256_block_state istate;
+	struct sha256_block_state ostate;
+};
+struct __hmac_sha256_ctx {
+	struct __sha256_ctx sha_ctx;
+	struct sha256_block_state ostate;
+};
+void __hmac_sha256_init(struct __hmac_sha256_ctx *ctx,
+			const struct __hmac_sha256_key *key);
+
 /**
  * struct sha224_ctx - Context for hashing a message with SHA-224
  * @ctx: private
  */
 struct sha224_ctx {
@@ -146,10 +162,113 @@ static inline void sha224_update(struct sha224_ctx *ctx,
 	__sha256_update(&ctx->ctx, data, len);
 }
 void sha224_final(struct sha224_ctx *ctx, u8 out[SHA224_DIGEST_SIZE]);
 void sha224(const u8 *data, size_t len, u8 out[SHA224_DIGEST_SIZE]);
 
+/**
+ * struct hmac_sha224_key - Prepared key for HMAC-SHA224
+ * @key: private
+ */
+struct hmac_sha224_key {
+	struct __hmac_sha256_key key;
+};
+
+/**
+ * struct hmac_sha224_ctx - Context for computing HMAC-SHA224 of a message
+ * @ctx: private
+ */
+struct hmac_sha224_ctx {
+	struct __hmac_sha256_ctx ctx;
+};
+
+/**
+ * hmac_sha224_preparekey() - Prepare a key for HMAC-SHA224
+ * @key: (output) the key structure to initialize
+ * @raw_key: the raw HMAC-SHA224 key
+ * @raw_key_len: the key length in bytes.  All key lengths are supported.
+ *
+ * Note: the caller is responsible for zeroizing both the struct hmac_sha224_key
+ * and the raw key once they are no longer needed.
+ *
+ * Context: Any context.
+ */
+void hmac_sha224_preparekey(struct hmac_sha224_key *key,
+			    const u8 *raw_key, size_t raw_key_len);
+
+/**
+ * hmac_sha224_init() - Initialize an HMAC-SHA224 context for a new message
+ * @ctx: (output) the HMAC context to initialize
+ * @key: the prepared HMAC key
+ *
+ * If you don't need incremental computation, consider hmac_sha224() instead.
+ *
+ * Context: Any context.
+ */
+static inline void hmac_sha224_init(struct hmac_sha224_ctx *ctx,
+				    const struct hmac_sha224_key *key)
+{
+	__hmac_sha256_init(&ctx->ctx, &key->key);
+}
+
+/**
+ * hmac_sha224_update() - Update an HMAC-SHA224 context with message data
+ * @ctx: the HMAC context to update; must have been initialized
+ * @data: the message data
+ * @data_len: the data length in bytes
+ *
+ * This can be called any number of times.
+ *
+ * Context: Any context.
+ */
+static inline void hmac_sha224_update(struct hmac_sha224_ctx *ctx,
+				      const u8 *data, size_t data_len)
+{
+	__sha256_update(&ctx->ctx.sha_ctx, data, data_len);
+}
+
+/**
+ * hmac_sha224_final() - Finish computing an HMAC-SHA224 value
+ * @ctx: the HMAC context to finalize; must have been initialized
+ * @out: (output) the resulting HMAC-SHA224 value
+ *
+ * After finishing, this zeroizes @ctx.  So the caller does not need to do it.
+ *
+ * Context: Any context.
+ */
+void hmac_sha224_final(struct hmac_sha224_ctx *ctx, u8 out[SHA224_DIGEST_SIZE]);
+
+/**
+ * hmac_sha224() - Compute HMAC-SHA224 in one shot, using a prepared key
+ * @key: the prepared HMAC key
+ * @data: the message data
+ * @data_len: the data length in bytes
+ * @out: (output) the resulting HMAC-SHA224 value
+ *
+ * If you're using the key only once, consider using hmac_sha224_usingrawkey().
+ *
+ * Context: Any context.
+ */
+void hmac_sha224(const struct hmac_sha224_key *key,
+		 const u8 *data, size_t data_len, u8 out[SHA224_DIGEST_SIZE]);
+
+/**
+ * hmac_sha224_usingrawkey() - Compute HMAC-SHA224 in one shot, using a raw key
+ * @raw_key: the raw HMAC-SHA224 key
+ * @raw_key_len: the key length in bytes.  All key lengths are supported.
+ * @data: the message data
+ * @data_len: the data length in bytes
+ * @out: (output) the resulting HMAC-SHA224 value
+ *
+ * If you're using the key multiple times, prefer to use
+ * hmac_sha224_preparekey() followed by multiple calls to hmac_sha224() instead.
+ *
+ * Context: Any context.
+ */
+void hmac_sha224_usingrawkey(const u8 *raw_key, size_t raw_key_len,
+			     const u8 *data, size_t data_len,
+			     u8 out[SHA224_DIGEST_SIZE]);
+
 /**
  * struct sha256_ctx - Context for hashing a message with SHA-256
  * @ctx: private
  */
 struct sha256_ctx {
@@ -163,10 +282,113 @@ static inline void sha256_update(struct sha256_ctx *ctx,
 	__sha256_update(&ctx->ctx, data, len);
 }
 void sha256_final(struct sha256_ctx *ctx, u8 out[SHA256_DIGEST_SIZE]);
 void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE]);
 
+/**
+ * struct hmac_sha256_key - Prepared key for HMAC-SHA256
+ * @key: private
+ */
+struct hmac_sha256_key {
+	struct __hmac_sha256_key key;
+};
+
+/**
+ * struct hmac_sha256_ctx - Context for computing HMAC-SHA256 of a message
+ * @ctx: private
+ */
+struct hmac_sha256_ctx {
+	struct __hmac_sha256_ctx ctx;
+};
+
+/**
+ * hmac_sha256_preparekey() - Prepare a key for HMAC-SHA256
+ * @key: (output) the key structure to initialize
+ * @raw_key: the raw HMAC-SHA256 key
+ * @raw_key_len: the key length in bytes.  All key lengths are supported.
+ *
+ * Note: the caller is responsible for zeroizing both the struct hmac_sha256_key
+ * and the raw key once they are no longer needed.
+ *
+ * Context: Any context.
+ */
+void hmac_sha256_preparekey(struct hmac_sha256_key *key,
+			    const u8 *raw_key, size_t raw_key_len);
+
+/**
+ * hmac_sha256_init() - Initialize an HMAC-SHA256 context for a new message
+ * @ctx: (output) the HMAC context to initialize
+ * @key: the prepared HMAC key
+ *
+ * If you don't need incremental computation, consider hmac_sha256() instead.
+ *
+ * Context: Any context.
+ */
+static inline void hmac_sha256_init(struct hmac_sha256_ctx *ctx,
+				    const struct hmac_sha256_key *key)
+{
+	__hmac_sha256_init(&ctx->ctx, &key->key);
+}
+
+/**
+ * hmac_sha256_update() - Update an HMAC-SHA256 context with message data
+ * @ctx: the HMAC context to update; must have been initialized
+ * @data: the message data
+ * @data_len: the data length in bytes
+ *
+ * This can be called any number of times.
+ *
+ * Context: Any context.
+ */
+static inline void hmac_sha256_update(struct hmac_sha256_ctx *ctx,
+				      const u8 *data, size_t data_len)
+{
+	__sha256_update(&ctx->ctx.sha_ctx, data, data_len);
+}
+
+/**
+ * hmac_sha256_final() - Finish computing an HMAC-SHA256 value
+ * @ctx: the HMAC context to finalize; must have been initialized
+ * @out: (output) the resulting HMAC-SHA256 value
+ *
+ * After finishing, this zeroizes @ctx.  So the caller does not need to do it.
+ *
+ * Context: Any context.
+ */
+void hmac_sha256_final(struct hmac_sha256_ctx *ctx, u8 out[SHA256_DIGEST_SIZE]);
+
+/**
+ * hmac_sha256() - Compute HMAC-SHA256 in one shot, using a prepared key
+ * @key: the prepared HMAC key
+ * @data: the message data
+ * @data_len: the data length in bytes
+ * @out: (output) the resulting HMAC-SHA256 value
+ *
+ * If you're using the key only once, consider using hmac_sha256_usingrawkey().
+ *
+ * Context: Any context.
+ */
+void hmac_sha256(const struct hmac_sha256_key *key,
+		 const u8 *data, size_t data_len, u8 out[SHA256_DIGEST_SIZE]);
+
+/**
+ * hmac_sha256_usingrawkey() - Compute HMAC-SHA256 in one shot, using a raw key
+ * @raw_key: the raw HMAC-SHA256 key
+ * @raw_key_len: the key length in bytes.  All key lengths are supported.
+ * @data: the message data
+ * @data_len: the data length in bytes
+ * @out: (output) the resulting HMAC-SHA256 value
+ *
+ * If you're using the key multiple times, prefer to use
+ * hmac_sha256_preparekey() followed by multiple calls to hmac_sha256() instead.
+ *
+ * Context: Any context.
+ */
+void hmac_sha256_usingrawkey(const u8 *raw_key, size_t raw_key_len,
+			     const u8 *data, size_t data_len,
+			     u8 out[SHA256_DIGEST_SIZE]);
+
 /* State for the SHA-512 (and SHA-384) compression function */
 struct sha512_block_state {
 	u64 h[8];
 };
 
diff --git a/lib/crypto/sha256.c b/lib/crypto/sha256.c
index 3e7797a4489de..165c894a47aa0 100644
--- a/lib/crypto/sha256.c
+++ b/lib/crypto/sha256.c
@@ -1,24 +1,22 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * SHA-256, as specified in
- * http://csrc.nist.gov/groups/STM/cavp/documents/shs/sha256-384-512.pdf
- *
- * SHA-256 code by Jean-Luc Cooke <jlcooke@certainkey.com>.
+ * SHA-224, SHA-256, HMAC-SHA224, and HMAC-SHA256 library functions
  *
  * Copyright (c) Jean-Luc Cooke <jlcooke@certainkey.com>
  * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
  * Copyright (c) 2002 James Morris <jmorris@intercode.com.au>
  * Copyright (c) 2014 Red Hat Inc.
  */
 
+#include <crypto/hmac.h>
 #include <crypto/internal/blockhash.h>
 #include <crypto/internal/sha2.h>
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/string.h>
+#include <linux/wordpart.h>
 
 static const struct sha256_block_state sha224_iv = {
 	.h = {
 		SHA224_H0, SHA224_H1, SHA224_H2, SHA224_H3,
 		SHA224_H4, SHA224_H5, SHA224_H6, SHA224_H7,
@@ -134,7 +132,142 @@ void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE])
 	sha256_update(&ctx, data, len);
 	sha256_final(&ctx, out);
 }
 EXPORT_SYMBOL(sha256);
 
-MODULE_DESCRIPTION("SHA-256 Algorithm");
+static void __hmac_sha256_preparekey(struct __hmac_sha256_key *key,
+				     const u8 *raw_key, size_t raw_key_len,
+				     const struct sha256_block_state *iv)
+{
+	union {
+		u8 b[SHA256_BLOCK_SIZE];
+		unsigned long w[SHA256_BLOCK_SIZE / sizeof(unsigned long)];
+	} derived_key = { 0 };
+
+	if (unlikely(raw_key_len > SHA256_BLOCK_SIZE)) {
+		if (iv == &sha224_iv)
+			sha224(raw_key, raw_key_len, derived_key.b);
+		else
+			sha256(raw_key, raw_key_len, derived_key.b);
+	} else {
+		memcpy(derived_key.b, raw_key, raw_key_len);
+	}
+
+	for (size_t i = 0; i < ARRAY_SIZE(derived_key.w); i++)
+		derived_key.w[i] ^= REPEAT_BYTE(HMAC_IPAD_VALUE);
+	key->istate = *iv;
+	sha256_blocks(&key->istate, derived_key.b, 1);
+
+	for (size_t i = 0; i < ARRAY_SIZE(derived_key.w); i++)
+		derived_key.w[i] ^= REPEAT_BYTE(HMAC_OPAD_VALUE ^
+						HMAC_IPAD_VALUE);
+	key->ostate = *iv;
+	sha256_blocks(&key->ostate, derived_key.b, 1);
+
+	memzero_explicit(&derived_key, sizeof(derived_key));
+}
+
+void hmac_sha224_preparekey(struct hmac_sha224_key *key,
+			    const u8 *raw_key, size_t raw_key_len)
+{
+	__hmac_sha256_preparekey(&key->key, raw_key, raw_key_len, &sha224_iv);
+}
+EXPORT_SYMBOL_GPL(hmac_sha224_preparekey);
+
+void hmac_sha256_preparekey(struct hmac_sha256_key *key,
+			    const u8 *raw_key, size_t raw_key_len)
+{
+	__hmac_sha256_preparekey(&key->key, raw_key, raw_key_len, &sha256_iv);
+}
+EXPORT_SYMBOL_GPL(hmac_sha256_preparekey);
+
+void __hmac_sha256_init(struct __hmac_sha256_ctx *ctx,
+			const struct __hmac_sha256_key *key)
+{
+	__sha256_init(&ctx->sha_ctx, &key->istate, SHA256_BLOCK_SIZE);
+	ctx->ostate = key->ostate;
+}
+EXPORT_SYMBOL_GPL(__hmac_sha256_init);
+
+static void __hmac_sha256_final(struct __hmac_sha256_ctx *ctx,
+				u8 *out, size_t digest_size)
+{
+	/* Generate the padded input for the outer hash in ctx->sha_ctx.buf. */
+	__sha256_final(&ctx->sha_ctx, ctx->sha_ctx.buf, digest_size);
+	memset(&ctx->sha_ctx.buf[digest_size], 0,
+	       SHA256_BLOCK_SIZE - digest_size);
+	ctx->sha_ctx.buf[digest_size] = 0x80;
+	*(__be32 *)&ctx->sha_ctx.buf[SHA256_BLOCK_SIZE - 4] =
+		cpu_to_be32(8 * (SHA256_BLOCK_SIZE + digest_size));
+
+	/* Compute the outer hash, which gives the HMAC value. */
+	sha256_blocks(&ctx->ostate, ctx->sha_ctx.buf, 1);
+	for (size_t i = 0; i < digest_size; i += 4)
+		put_unaligned_be32(ctx->ostate.h[i / 4], out + i);
+
+	memzero_explicit(ctx, sizeof(*ctx));
+}
+
+void hmac_sha224_final(struct hmac_sha224_ctx *ctx,
+		       u8 out[SHA224_DIGEST_SIZE])
+{
+	__hmac_sha256_final(&ctx->ctx, out, SHA224_DIGEST_SIZE);
+}
+EXPORT_SYMBOL_GPL(hmac_sha224_final);
+
+void hmac_sha256_final(struct hmac_sha256_ctx *ctx,
+		       u8 out[SHA256_DIGEST_SIZE])
+{
+	__hmac_sha256_final(&ctx->ctx, out, SHA256_DIGEST_SIZE);
+}
+EXPORT_SYMBOL_GPL(hmac_sha256_final);
+
+void hmac_sha224(const struct hmac_sha224_key *key,
+		 const u8 *data, size_t data_len, u8 out[SHA224_DIGEST_SIZE])
+{
+	struct hmac_sha224_ctx ctx;
+
+	hmac_sha224_init(&ctx, key);
+	hmac_sha224_update(&ctx, data, data_len);
+	hmac_sha224_final(&ctx, out);
+}
+EXPORT_SYMBOL_GPL(hmac_sha224);
+
+void hmac_sha256(const struct hmac_sha256_key *key,
+		 const u8 *data, size_t data_len, u8 out[SHA256_DIGEST_SIZE])
+{
+	struct hmac_sha256_ctx ctx;
+
+	hmac_sha256_init(&ctx, key);
+	hmac_sha256_update(&ctx, data, data_len);
+	hmac_sha256_final(&ctx, out);
+}
+EXPORT_SYMBOL_GPL(hmac_sha256);
+
+void hmac_sha224_usingrawkey(const u8 *raw_key, size_t raw_key_len,
+			     const u8 *data, size_t data_len,
+			     u8 out[SHA224_DIGEST_SIZE])
+{
+	struct hmac_sha224_key key;
+
+	hmac_sha224_preparekey(&key, raw_key, raw_key_len);
+	hmac_sha224(&key, data, data_len, out);
+
+	memzero_explicit(&key, sizeof(key));
+}
+EXPORT_SYMBOL_GPL(hmac_sha224_usingrawkey);
+
+void hmac_sha256_usingrawkey(const u8 *raw_key, size_t raw_key_len,
+			     const u8 *data, size_t data_len,
+			     u8 out[SHA256_DIGEST_SIZE])
+{
+	struct hmac_sha256_key key;
+
+	hmac_sha256_preparekey(&key, raw_key, raw_key_len);
+	hmac_sha256(&key, data, data_len, out);
+
+	memzero_explicit(&key, sizeof(key));
+}
+EXPORT_SYMBOL_GPL(hmac_sha256_usingrawkey);
+
+MODULE_DESCRIPTION("SHA-224, SHA-256, HMAC-SHA224, and HMAC-SHA256 library functions");
 MODULE_LICENSE("GPL");
-- 
2.50.0


