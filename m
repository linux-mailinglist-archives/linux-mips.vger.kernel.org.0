Return-Path: <linux-mips+bounces-9482-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90421AE77F1
	for <lists+linux-mips@lfdr.de>; Wed, 25 Jun 2025 09:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F4A41BC58C8
	for <lists+linux-mips@lfdr.de>; Wed, 25 Jun 2025 07:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D95020E00A;
	Wed, 25 Jun 2025 07:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UyXquyVZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E4620CCE5;
	Wed, 25 Jun 2025 07:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750835430; cv=none; b=aPxP+lLap/KvUyJ2zHybh/GMCNdYGURvCwApmUFgU0SQ5NjeV7q3NvK9Yoj0JancETdt0AxZiwGGkJvVMFz0mVGTfRg9C0JjD+ym5Fh4JD6s4Smq9JZdCY6CvdpCV/EKKMu46ZnNyBaKeDn9vli2ggNfV347GRadCZ9b8TzCWzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750835430; c=relaxed/simple;
	bh=2LrGs37CGEadHzUgE3udzC7iJiB7yoZqC5JHegQK+WQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kz6He9LX6aTZNsMv5oEz9Vp6/1bJK2X8x7WOI2pC/5wT8a1L2zaIIVHI6wEalHByoDmob3wJzDKScL9p28fzshM1Ff4gHmkTZznRofVVtBb2zDpO0oWdUYwmnACmT4y8n0vZegZBSQkDJkjMKSSEhGPAaANR1CX1N2ouPNzL25s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UyXquyVZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A66DCC4CEF2;
	Wed, 25 Jun 2025 07:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750835430;
	bh=2LrGs37CGEadHzUgE3udzC7iJiB7yoZqC5JHegQK+WQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UyXquyVZWgisY6zFwDG5d4ZzxprCHqDlisQ41lEvQ5IHurjnN/m8NqcWJG2vqieps
	 QNFaI0iSMcmJ46Ug61uPBEtuUygIKDzSDjAxynb4e32/Bzo9ew8IRX1nVeNa3fkzqN
	 syi5JxOKQKXDORFsRNuQUSvE2MTtpLQan5nDKmPDEZTdAAdaOORBOzhXfhVgW++ZhS
	 8aQcYq36vJoEcgEO11QoLWRlxYpBu5iW/xpJLuTKV0vQsT609fAI+9N0MKxz1aEcLo
	 feCNVsiIJhz/3Gd10BL2tMvEMtB3M5eyiDmrObThqsEaq+JwDKnQHAVQO+KU2HI6MX
	 nTvdfxLoh5QYA==
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
Subject: [PATCH 06/18] lib/crypto: sha512: Fix a grammatical error in kerneldoc comments
Date: Wed, 25 Jun 2025 00:08:07 -0700
Message-ID: <20250625070819.1496119-7-ebiggers@kernel.org>
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

"An HMAC", not "A HMAC".

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/sha2.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/crypto/sha2.h b/include/crypto/sha2.h
index 36a9dab805be7..296ce9d468bfc 100644
--- a/include/crypto/sha2.h
+++ b/include/crypto/sha2.h
@@ -247,11 +247,11 @@ struct hmac_sha384_ctx {
  */
 void hmac_sha384_preparekey(struct hmac_sha384_key *key,
 			    const u8 *raw_key, size_t raw_key_len);
 
 /**
- * hmac_sha384_init() - Initialize a HMAC-SHA384 context for a new message
+ * hmac_sha384_init() - Initialize an HMAC-SHA384 context for a new message
  * @ctx: (output) the HMAC context to initialize
  * @key: the prepared HMAC key
  *
  * If you don't need incremental computation, consider hmac_sha384() instead.
  *
@@ -262,11 +262,11 @@ static inline void hmac_sha384_init(struct hmac_sha384_ctx *ctx,
 {
 	__hmac_sha512_init(&ctx->ctx, &key->key);
 }
 
 /**
- * hmac_sha384_update() - Update a HMAC-SHA384 context with message data
+ * hmac_sha384_update() - Update an HMAC-SHA384 context with message data
  * @ctx: the HMAC context to update; must have been initialized
  * @data: the message data
  * @data_len: the data length in bytes
  *
  * This can be called any number of times.
@@ -278,11 +278,11 @@ static inline void hmac_sha384_update(struct hmac_sha384_ctx *ctx,
 {
 	__sha512_update(&ctx->ctx.sha_ctx, data, data_len);
 }
 
 /**
- * hmac_sha384_final() - Finish computing a HMAC-SHA384 value
+ * hmac_sha384_final() - Finish computing an HMAC-SHA384 value
  * @ctx: the HMAC context to finalize; must have been initialized
  * @out: (output) the resulting HMAC-SHA384 value
  *
  * After finishing, this zeroizes @ctx.  So the caller does not need to do it.
  *
@@ -405,11 +405,11 @@ struct hmac_sha512_ctx {
  */
 void hmac_sha512_preparekey(struct hmac_sha512_key *key,
 			    const u8 *raw_key, size_t raw_key_len);
 
 /**
- * hmac_sha512_init() - Initialize a HMAC-SHA512 context for a new message
+ * hmac_sha512_init() - Initialize an HMAC-SHA512 context for a new message
  * @ctx: (output) the HMAC context to initialize
  * @key: the prepared HMAC key
  *
  * If you don't need incremental computation, consider hmac_sha512() instead.
  *
@@ -420,11 +420,11 @@ static inline void hmac_sha512_init(struct hmac_sha512_ctx *ctx,
 {
 	__hmac_sha512_init(&ctx->ctx, &key->key);
 }
 
 /**
- * hmac_sha512_update() - Update a HMAC-SHA512 context with message data
+ * hmac_sha512_update() - Update an HMAC-SHA512 context with message data
  * @ctx: the HMAC context to update; must have been initialized
  * @data: the message data
  * @data_len: the data length in bytes
  *
  * This can be called any number of times.
@@ -436,11 +436,11 @@ static inline void hmac_sha512_update(struct hmac_sha512_ctx *ctx,
 {
 	__sha512_update(&ctx->ctx.sha_ctx, data, data_len);
 }
 
 /**
- * hmac_sha512_final() - Finish computing a HMAC-SHA512 value
+ * hmac_sha512_final() - Finish computing an HMAC-SHA512 value
  * @ctx: the HMAC context to finalize; must have been initialized
  * @out: (output) the resulting HMAC-SHA512 value
  *
  * After finishing, this zeroizes @ctx.  So the caller does not need to do it.
  *
-- 
2.50.0


