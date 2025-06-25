Return-Path: <linux-mips+bounces-9494-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5E9AE7834
	for <lists+linux-mips@lfdr.de>; Wed, 25 Jun 2025 09:14:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06F234A13C3
	for <lists+linux-mips@lfdr.de>; Wed, 25 Jun 2025 07:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CA902264D4;
	Wed, 25 Jun 2025 07:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eZmKP/fI"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575AF2264B6;
	Wed, 25 Jun 2025 07:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750835436; cv=none; b=sZjAGmLJeNuCl3EWqsFjwgfirVM61ka4LVYlRpdhujkZ+qI5un/i5XOnAtOzP6Jjkm89ijN1lioAiojmoiAJfgAHJ7a4Wl2nrborDvkiguZ2zUXAiD3B7h6vQBUER4AAK6SqCNDr39a62NvK1zzLV+cex5fWrVqL9/WgKCguhQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750835436; c=relaxed/simple;
	bh=pkoFPfsdz5mUfc5I4FK+MnyFLsCjGsnnD9jc5ME9fN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g7x+Ur/Jf/siwukPDo7pjM2MZ3zdyJmPfCSNgCZ0Uo2E5QNo2zrG+sPyfTeLhDNAxQeZRHuWeEN8XC0CW/53vn7Rl3qtb0zXGRn9VsB8mNVi6DQzOPgbvKoeyZReYqkkdmuVo4q3LE0Jwe/5/Vl6GHQdlqT5RpSf85TsUBbQo+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eZmKP/fI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 850B0C4CEF1;
	Wed, 25 Jun 2025 07:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750835435;
	bh=pkoFPfsdz5mUfc5I4FK+MnyFLsCjGsnnD9jc5ME9fN4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eZmKP/fIDXW6rkeKR6Thsj7qhzrxUo7+anqcEdA8gXs47TnZN6DL2kX7bOmniF+Af
	 +piPAyua5mV1/j2iaeJwcTEQSZit4PSpaEuHxsuX3Gh7qbJL1/S6+cmg48nAkVE0dN
	 ZyGYkK4KNRVoHZ8kRyXFP+D5WRT1bmxJwqycb3x7/rHw4Si1XjQgAf3mJF4Ppbc3st
	 vVZqoNdVE/MzcDZ1B21vwKhKKnzwJYGxof7gMCU3EX3I9Jd+xgPmhyMAFfRtKRsS7F
	 8ucsuq7Ii9jB5dRSQBWrDMV+5Y5BLLHL58mBqSOsHYMJPjSbhmNrrHgtHdtCEEmFJL
	 s0DeneNL1I14g==
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
Subject: [PATCH 18/18] lib/crypto: sha256: Document the SHA-224 and SHA-256 API
Date: Wed, 25 Jun 2025 00:08:19 -0700
Message-ID: <20250625070819.1496119-19-ebiggers@kernel.org>
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


