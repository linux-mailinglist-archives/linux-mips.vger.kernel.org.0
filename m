Return-Path: <linux-mips+bounces-9581-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A333AEE3E2
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 18:14:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F360D17DDF3
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 16:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99F3D2E2678;
	Mon, 30 Jun 2025 16:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jnBxR32k"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D01D2900AD;
	Mon, 30 Jun 2025 16:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751299768; cv=none; b=LVoVWk9JZKSI4moBeJ9jm/vrSRlW6tS6fviY8vPgv6/zrXBlvRxyzk7Qf7edoa8aycL4b7GwObuhuR6PQUEMlKJOu1XjG4Q3G9QxViLlcRfvNuVeP6gpDoUPknwPNjKqNtUIGEXq4yUwsHDRCbOc0CLN0McE7fGR5S9hCm8aqtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751299768; c=relaxed/simple;
	bh=pkoFPfsdz5mUfc5I4FK+MnyFLsCjGsnnD9jc5ME9fN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Na8mjWQpbhI8bPB3kwceZxUUFP+pIR20reE4hxS3/rD3ByQCjpKOHc5Cwv9quMBhYwqPD4VHLfobEZh5tFmQwfc3igIT/di0iWSlvIUntBPenfD74Ep6gIGPW7S/YMqZ5fSjYbynoaLAUoAijI81qOLL9PzHA0w3nyNt3YyFlXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jnBxR32k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EC2DC4CEF3;
	Mon, 30 Jun 2025 16:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299767;
	bh=pkoFPfsdz5mUfc5I4FK+MnyFLsCjGsnnD9jc5ME9fN4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jnBxR32keuveFDD/erORneyVQFZMExFVwQ2m1PRHBM8e09zhVEcpdxXezXwhIRIep
	 1b/hAsrsEPE4GO34uoemDkgD6DfhLn2c+0We3yqTqkDW1Zdqk+usXyKw0ahpO/QyDk
	 kq8OJiVNVNYv+79sZjwcLRLPE8u+AXxrFrb5rUo1EG4MgLQWKf4VRjl6PqF6ZW6RvL
	 tO/4ewF4TqSoMw0NJ2cWpzPbScaI6j0B3laWfK7QYlGoz9vuy6ps6Y8wwL6bttBzRT
	 i6YDWFUv5OhMZDpFhfE2wkKZC04+niDSZ+wBsXg2HLi3z3ji0M2HuML4L/kX6ufOLl
	 sxIXnWBzurdOw==
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
Subject: [PATCH v2 14/14] lib/crypto: sha256: Document the SHA-224 and SHA-256 API
Date: Mon, 30 Jun 2025 09:06:45 -0700
Message-ID: <20250630160645.3198-15-ebiggers@kernel.org>
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

Add kerneldoc comments, consistent with the kerneldoc comments of the
SHA-384 and SHA-512 API.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/sha2.h | 76 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/include/crypto/sha2.h b/include/crypto/sha2.h
index 2e3fc2cf4aa0d..e0a08f6addd00 100644
--- a/include/crypto/sha2.h
+++ b/include/crypto/sha2.h
@@ -153,17 +153,55 @@ void __hmac_sha256_init(struct __hmac_sha256_ctx *ctx,
  */
 struct sha224_ctx {
 	struct __sha256_ctx ctx;
 };
 
+/**
+ * sha224_init() - Initialize a SHA-224 context for a new message
+ * @ctx: the context to initialize
+ *
+ * If you don't need incremental computation, consider sha224() instead.
+ *
+ * Context: Any context.
+ */
 void sha224_init(struct sha224_ctx *ctx);
+
+/**
+ * sha224_update() - Update a SHA-224 context with message data
+ * @ctx: the context to update; must have been initialized
+ * @data: the message data
+ * @len: the data length in bytes
+ *
+ * This can be called any number of times.
+ *
+ * Context: Any context.
+ */
 static inline void sha224_update(struct sha224_ctx *ctx,
 				 const u8 *data, size_t len)
 {
 	__sha256_update(&ctx->ctx, data, len);
 }
+
+/**
+ * sha224_final() - Finish computing a SHA-224 message digest
+ * @ctx: the context to finalize; must have been initialized
+ * @out: (output) the resulting SHA-224 message digest
+ *
+ * After finishing, this zeroizes @ctx.  So the caller does not need to do it.
+ *
+ * Context: Any context.
+ */
 void sha224_final(struct sha224_ctx *ctx, u8 out[SHA224_DIGEST_SIZE]);
+
+/**
+ * sha224() - Compute SHA-224 message digest in one shot
+ * @data: the message data
+ * @len: the data length in bytes
+ * @out: (output) the resulting SHA-224 message digest
+ *
+ * Context: Any context.
+ */
 void sha224(const u8 *data, size_t len, u8 out[SHA224_DIGEST_SIZE]);
 
 /**
  * struct hmac_sha224_key - Prepared key for HMAC-SHA224
  * @key: private
@@ -273,17 +311,55 @@ void hmac_sha224_usingrawkey(const u8 *raw_key, size_t raw_key_len,
  */
 struct sha256_ctx {
 	struct __sha256_ctx ctx;
 };
 
+/**
+ * sha256_init() - Initialize a SHA-256 context for a new message
+ * @ctx: the context to initialize
+ *
+ * If you don't need incremental computation, consider sha256() instead.
+ *
+ * Context: Any context.
+ */
 void sha256_init(struct sha256_ctx *ctx);
+
+/**
+ * sha256_update() - Update a SHA-256 context with message data
+ * @ctx: the context to update; must have been initialized
+ * @data: the message data
+ * @len: the data length in bytes
+ *
+ * This can be called any number of times.
+ *
+ * Context: Any context.
+ */
 static inline void sha256_update(struct sha256_ctx *ctx,
 				 const u8 *data, size_t len)
 {
 	__sha256_update(&ctx->ctx, data, len);
 }
+
+/**
+ * sha256_final() - Finish computing a SHA-256 message digest
+ * @ctx: the context to finalize; must have been initialized
+ * @out: (output) the resulting SHA-256 message digest
+ *
+ * After finishing, this zeroizes @ctx.  So the caller does not need to do it.
+ *
+ * Context: Any context.
+ */
 void sha256_final(struct sha256_ctx *ctx, u8 out[SHA256_DIGEST_SIZE]);
+
+/**
+ * sha256() - Compute SHA-256 message digest in one shot
+ * @data: the message data
+ * @len: the data length in bytes
+ * @out: (output) the resulting SHA-256 message digest
+ *
+ * Context: Any context.
+ */
 void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE]);
 
 /**
  * struct hmac_sha256_key - Prepared key for HMAC-SHA256
  * @key: private
-- 
2.50.0


