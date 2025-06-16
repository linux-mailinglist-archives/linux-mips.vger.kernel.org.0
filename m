Return-Path: <linux-mips+bounces-9323-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2104BADA5E0
	for <lists+linux-mips@lfdr.de>; Mon, 16 Jun 2025 03:42:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4077C18902BE
	for <lists+linux-mips@lfdr.de>; Mon, 16 Jun 2025 01:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ABDD288CB2;
	Mon, 16 Jun 2025 01:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r8XR/DR/"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570F0288CA4;
	Mon, 16 Jun 2025 01:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750038117; cv=none; b=HWCPtrNKgXxnYf3HhJtqvfBdZA6c7plez5n1e80C+9u/zSIo4f0dxXzqRMteAC238bA3Gup2cvVYn0tgh3tVvaHMKkkyeOedGErjqfIC/IekMPfYCmYQbyyvRZ/ZkSj2hfyWPsn5OERevXC5QiFEAEfAu/Jre2vfRofKvvO9A1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750038117; c=relaxed/simple;
	bh=UT3F63GhPfuN8dwm7ZZEQWDXVa1RJDqASWr59Op8UtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q59ooBX7yxiOiqxgXc6wnxc2RJIWvgOfsGLM8VRu7HyWSrlY2EByw5yyXmeM3ioZno4A8x3C5PShbupYrbXeTW3+2685WR+ZYli45uPGBUMP2wYfr8MpWRhBmiRmpG6Nb+O++Ak04+kJNFAsa8Vs2x3vHHMgkAxtslvz6Dwj+UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r8XR/DR/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88D81C4CEF5;
	Mon, 16 Jun 2025 01:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750038116;
	bh=UT3F63GhPfuN8dwm7ZZEQWDXVa1RJDqASWr59Op8UtU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r8XR/DR/zNKcRCabaDN0YDhDtUAzk2t0BSYHybIqrhpWgOMy7c+ipYWtq8lvKoxM3
	 NVSEplCh9dnzb46ryLAdrl/LFQydRCSw7C+tdhLNRZ5KFe5WX6cIWPLWmDEo15tfp5
	 JKP3vT+ETTEbtIIUm16r4V9s3V9O7lAS6tsNEkYLpK/x1IYMWAoCOgKU1EbzrichHG
	 O8oacmgZeGIq9UdflKNJ4hYka29HKQfbZT6z0NogYS1HOyJy8Lr6VhyUvGB+JJ80p+
	 T4FYX9rUjIZi2gWeW/Izrp0SUIY9wtU/xzivgFB9uu9BsNYLLZaEfOZkfeVOiCdrlp
	 2EEQWrZ6i5lZg==
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
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v2 08/17] crypto: sha512 - use same state format as legacy drivers
Date: Sun, 15 Jun 2025 18:40:10 -0700
Message-ID: <20250616014019.415791-9-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616014019.415791-1-ebiggers@kernel.org>
References: <20250616014019.415791-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

Make the export and import functions for the sha384, sha512,
hmac(sha384), and hmac(sha512) shash algorithms use the same format as
the padlock-sha and nx-sha512 drivers, as required by Herbert.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 crypto/sha512.c | 84 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/crypto/sha512.c b/crypto/sha512.c
index ad9c8b2ddb129..0eed801346018 100644
--- a/crypto/sha512.c
+++ b/crypto/sha512.c
@@ -10,10 +10,36 @@
 #include <crypto/internal/hash.h>
 #include <crypto/sha2.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
+/*
+ * Export and import functions.  crypto_shash wants a particular format that
+ * matches that used by some legacy drivers.  It currently is the same as the
+ * library SHA context but with the partial block length as a u8 appended to it.
+ */
+
+#define SHA512_SHASH_STATE_SIZE 209
+static_assert(offsetof(struct __sha512_ctx, state) == 0);
+static_assert(offsetof(struct __sha512_ctx, bytecount_lo) == 64);
+static_assert(offsetof(struct __sha512_ctx, bytecount_hi) == 72);
+static_assert(offsetof(struct __sha512_ctx, buf) == 80);
+static_assert(sizeof(struct __sha512_ctx) + 1 == SHA512_SHASH_STATE_SIZE);
+
+static int __crypto_sha512_export(const struct __sha512_ctx *ctx, void *out)
+{
+	memcpy(out, ctx, sizeof(*ctx));
+	*((u8 *)out + sizeof(*ctx)) = ctx->bytecount_lo % SHA512_BLOCK_SIZE;
+	return 0;
+}
+
+static int __crypto_sha512_import(struct __sha512_ctx *ctx, const void *in)
+{
+	memcpy(ctx, in, sizeof(*ctx));
+	return 0;
+}
+
 /* SHA-384 */
 
 const u8 sha384_zero_message_hash[SHA384_DIGEST_SIZE] = {
 	0x38, 0xb0, 0x60, 0xa7, 0x51, 0xac, 0x96, 0x38,
 	0x4c, 0xd9, 0x32, 0x7e, 0xb1, 0xb1, 0xe3, 0x6a,
@@ -50,10 +76,20 @@ static int crypto_sha384_digest(struct shash_desc *desc,
 {
 	sha384(data, len, out);
 	return 0;
 }
 
+static int crypto_sha384_export(struct shash_desc *desc, void *out)
+{
+	return __crypto_sha512_export(&SHA384_CTX(desc)->ctx, out);
+}
+
+static int crypto_sha384_import(struct shash_desc *desc, const void *in)
+{
+	return __crypto_sha512_import(&SHA384_CTX(desc)->ctx, in);
+}
+
 /* SHA-512 */
 
 const u8 sha512_zero_message_hash[SHA512_DIGEST_SIZE] = {
 	0xcf, 0x83, 0xe1, 0x35, 0x7e, 0xef, 0xb8, 0xbd,
 	0xf1, 0x54, 0x28, 0x50, 0xd6, 0x6d, 0x80, 0x07,
@@ -92,10 +128,20 @@ static int crypto_sha512_digest(struct shash_desc *desc,
 {
 	sha512(data, len, out);
 	return 0;
 }
 
+static int crypto_sha512_export(struct shash_desc *desc, void *out)
+{
+	return __crypto_sha512_export(&SHA512_CTX(desc)->ctx, out);
+}
+
+static int crypto_sha512_import(struct shash_desc *desc, const void *in)
+{
+	return __crypto_sha512_import(&SHA512_CTX(desc)->ctx, in);
+}
+
 /* HMAC-SHA384 */
 
 #define HMAC_SHA384_KEY(tfm) ((struct hmac_sha384_key *)crypto_shash_ctx(tfm))
 #define HMAC_SHA384_CTX(desc) ((struct hmac_sha384_ctx *)shash_desc_ctx(desc))
 
@@ -131,10 +177,23 @@ static int crypto_hmac_sha384_digest(struct shash_desc *desc,
 {
 	hmac_sha384(HMAC_SHA384_KEY(desc->tfm), data, len, out);
 	return 0;
 }
 
+static int crypto_hmac_sha384_export(struct shash_desc *desc, void *out)
+{
+	return __crypto_sha512_export(&HMAC_SHA384_CTX(desc)->ctx.sha_ctx, out);
+}
+
+static int crypto_hmac_sha384_import(struct shash_desc *desc, const void *in)
+{
+	struct hmac_sha384_ctx *ctx = HMAC_SHA384_CTX(desc);
+
+	ctx->ctx.ostate = HMAC_SHA384_KEY(desc->tfm)->key.ostate;
+	return __crypto_sha512_import(&ctx->ctx.sha_ctx, in);
+}
+
 /* HMAC-SHA512 */
 
 #define HMAC_SHA512_KEY(tfm) ((struct hmac_sha512_key *)crypto_shash_ctx(tfm))
 #define HMAC_SHA512_CTX(desc) ((struct hmac_sha512_ctx *)shash_desc_ctx(desc))
 
@@ -170,10 +229,23 @@ static int crypto_hmac_sha512_digest(struct shash_desc *desc,
 {
 	hmac_sha512(HMAC_SHA512_KEY(desc->tfm), data, len, out);
 	return 0;
 }
 
+static int crypto_hmac_sha512_export(struct shash_desc *desc, void *out)
+{
+	return __crypto_sha512_export(&HMAC_SHA512_CTX(desc)->ctx.sha_ctx, out);
+}
+
+static int crypto_hmac_sha512_import(struct shash_desc *desc, const void *in)
+{
+	struct hmac_sha512_ctx *ctx = HMAC_SHA512_CTX(desc);
+
+	ctx->ctx.ostate = HMAC_SHA512_KEY(desc->tfm)->key.ostate;
+	return __crypto_sha512_import(&ctx->ctx.sha_ctx, in);
+}
+
 /* Algorithm definitions */
 
 static struct shash_alg algs[] = {
 	{
 		.base.cra_name		= "sha384",
@@ -184,11 +256,14 @@ static struct shash_alg algs[] = {
 		.digestsize		= SHA384_DIGEST_SIZE,
 		.init			= crypto_sha384_init,
 		.update			= crypto_sha384_update,
 		.final			= crypto_sha384_final,
 		.digest			= crypto_sha384_digest,
+		.export			= crypto_sha384_export,
+		.import			= crypto_sha384_import,
 		.descsize		= sizeof(struct sha384_ctx),
+		.statesize		= SHA512_SHASH_STATE_SIZE,
 	},
 	{
 		.base.cra_name		= "sha512",
 		.base.cra_driver_name	= "sha512-lib",
 		.base.cra_priority	= 100,
@@ -197,11 +272,14 @@ static struct shash_alg algs[] = {
 		.digestsize		= SHA512_DIGEST_SIZE,
 		.init			= crypto_sha512_init,
 		.update			= crypto_sha512_update,
 		.final			= crypto_sha512_final,
 		.digest			= crypto_sha512_digest,
+		.export			= crypto_sha512_export,
+		.import			= crypto_sha512_import,
 		.descsize		= sizeof(struct sha512_ctx),
+		.statesize		= SHA512_SHASH_STATE_SIZE,
 	},
 	{
 		.base.cra_name		= "hmac(sha384)",
 		.base.cra_driver_name	= "hmac-sha384-lib",
 		.base.cra_priority	= 100,
@@ -212,11 +290,14 @@ static struct shash_alg algs[] = {
 		.setkey			= crypto_hmac_sha384_setkey,
 		.init			= crypto_hmac_sha384_init,
 		.update			= crypto_hmac_sha384_update,
 		.final			= crypto_hmac_sha384_final,
 		.digest			= crypto_hmac_sha384_digest,
+		.export			= crypto_hmac_sha384_export,
+		.import			= crypto_hmac_sha384_import,
 		.descsize		= sizeof(struct hmac_sha384_ctx),
+		.statesize		= SHA512_SHASH_STATE_SIZE,
 	},
 	{
 		.base.cra_name		= "hmac(sha512)",
 		.base.cra_driver_name	= "hmac-sha512-lib",
 		.base.cra_priority	= 100,
@@ -227,11 +308,14 @@ static struct shash_alg algs[] = {
 		.setkey			= crypto_hmac_sha512_setkey,
 		.init			= crypto_hmac_sha512_init,
 		.update			= crypto_hmac_sha512_update,
 		.final			= crypto_hmac_sha512_final,
 		.digest			= crypto_hmac_sha512_digest,
+		.export			= crypto_hmac_sha512_export,
+		.import			= crypto_hmac_sha512_import,
 		.descsize		= sizeof(struct hmac_sha512_ctx),
+		.statesize		= SHA512_SHASH_STATE_SIZE,
 	},
 };
 
 static int __init crypto_sha512_mod_init(void)
 {
-- 
2.49.0


