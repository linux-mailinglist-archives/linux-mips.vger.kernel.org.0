Return-Path: <linux-mips+bounces-9771-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD99B02DBC
	for <lists+linux-mips@lfdr.de>; Sun, 13 Jul 2025 01:27:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1FEFA42AE5
	for <lists+linux-mips@lfdr.de>; Sat, 12 Jul 2025 23:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A69962367AC;
	Sat, 12 Jul 2025 23:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K8YbndeO"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A9A236437;
	Sat, 12 Jul 2025 23:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752362783; cv=none; b=KFZGf1DZhKCT3iYxfpOdDY4bT9btMFOUZULcQU716rdC83UlEVAsbZBboTPz5+hoZAfKHMHtFLZSv6PQJeVVX5QhrwTKUB1N0r/rFW4GsoywQX6/CkY1rlt10hGBYjPp3wH5QReTpKLCQ8w2v+8jUoJE3qCHZ8ToYjiedJDvyX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752362783; c=relaxed/simple;
	bh=n359i41djwWU+CGbW44dWKxffZV+egIZKibwbQ46oIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fv2lZV8aUWG0DzAyqTYkigxrYAOiOvcxVsE2ThBGPguMLwk46yHb19vrjY9siiRjTehfhJfuHcQEvpENNuZTF09QdBEOiTJGhreO58Ezy7grDXhOVmfRIUsWx01eTjKMAhm7HakxTAHsjto/mDWKSMsaBIZVfMtZtJFoJFGZy48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K8YbndeO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFA18C4CEF5;
	Sat, 12 Jul 2025 23:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362783;
	bh=n359i41djwWU+CGbW44dWKxffZV+egIZKibwbQ46oIQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K8YbndeO+dMZGy3v3A29yW4ag3kUQJAE3I0HlAMkkp1SkG9D5Q8ojJFLySi0YHm/Q
	 DRNs3LUUmZe7vOScPcD8GdnNrJN4Iynsvd5PuxN51Ri5Zz/OD9JnoVqZDgBIspgBZJ
	 uLEJF8hZ5RNCal9KNkWNmPI/OT8wlhEAjp4pxLD5WSJQEWvDhJKpiwtoPs7t2CPqZl
	 fxjRCRMHRBzbHPJ4jp1LbQppuQU8wI8Wq3MjL2iMdrvaTQU8yofE9FK0aqLGCan2iw
	 ufT012XOOlulVEJ5QKifmXRld5x5wGSlbRCejtvEMqX6JadX77XNhU3+YbvUfUuJlB
	 CLnVb3YUz8dmA==
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
Subject: [PATCH 06/26] crypto: sha1 - Use same state format as legacy drivers
Date: Sat, 12 Jul 2025 16:22:57 -0700
Message-ID: <20250712232329.818226-7-ebiggers@kernel.org>
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

Same as sha256 and sha512: Use the state format that the generic partial
block handling code produces, as requested by Herbert, even though this
is applicable only to legacy drivers.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 crypto/sha1.c | 66 +++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/crypto/sha1.c b/crypto/sha1.c
index 00e273b0401db..ecef4bf2d9c00 100644
--- a/crypto/sha1.c
+++ b/crypto/sha1.c
@@ -10,10 +10,47 @@
 #include <crypto/internal/hash.h>
 #include <crypto/sha1.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
+/*
+ * Export and import functions.  crypto_shash wants a particular format that
+ * matches that used by some legacy drivers.  It currently is the same as the
+ * library SHA context, except the value in bytecount must be block-aligned and
+ * the remainder must be stored in an extra u8 appended to the struct.
+ */
+
+#define SHA1_SHASH_STATE_SIZE (sizeof(struct sha1_ctx) + 1)
+static_assert(sizeof(struct sha1_ctx) == sizeof(struct sha1_state));
+static_assert(offsetof(struct sha1_ctx, state) == offsetof(struct sha1_state, state));
+static_assert(offsetof(struct sha1_ctx, bytecount) == offsetof(struct sha1_state, count));
+static_assert(offsetof(struct sha1_ctx, buf) == offsetof(struct sha1_state, buffer));
+
+static int __crypto_sha1_export(const struct sha1_ctx *ctx0, void *out)
+{
+	struct sha1_ctx ctx = *ctx0;
+	unsigned int partial;
+	u8 *p = out;
+
+	partial = ctx.bytecount % SHA1_BLOCK_SIZE;
+	ctx.bytecount -= partial;
+	memcpy(p, &ctx, sizeof(ctx));
+	p += sizeof(ctx);
+	*p = partial;
+	return 0;
+}
+
+static int __crypto_sha1_import(struct sha1_ctx *ctx, const void *in)
+{
+	const u8 *p = in;
+
+	memcpy(ctx, p, sizeof(*ctx));
+	p += sizeof(*ctx);
+	ctx->bytecount += *p;
+	return 0;
+}
+
 const u8 sha1_zero_message_hash[SHA1_DIGEST_SIZE] = {
 	0xda, 0x39, 0xa3, 0xee, 0x5e, 0x6b, 0x4b, 0x0d,
 	0x32, 0x55, 0xbf, 0xef, 0x95, 0x60, 0x18, 0x90,
 	0xaf, 0xd8, 0x07, 0x09
 };
@@ -45,10 +82,20 @@ static int crypto_sha1_digest(struct shash_desc *desc,
 {
 	sha1(data, len, out);
 	return 0;
 }
 
+static int crypto_sha1_export(struct shash_desc *desc, void *out)
+{
+	return __crypto_sha1_export(SHA1_CTX(desc), out);
+}
+
+static int crypto_sha1_import(struct shash_desc *desc, const void *in)
+{
+	return __crypto_sha1_import(SHA1_CTX(desc), in);
+}
+
 #define HMAC_SHA1_KEY(tfm) ((struct hmac_sha1_key *)crypto_shash_ctx(tfm))
 #define HMAC_SHA1_CTX(desc) ((struct hmac_sha1_ctx *)shash_desc_ctx(desc))
 
 static int crypto_hmac_sha1_setkey(struct crypto_shash *tfm,
 				   const u8 *raw_key, unsigned int keylen)
@@ -81,10 +128,23 @@ static int crypto_hmac_sha1_digest(struct shash_desc *desc,
 {
 	hmac_sha1(HMAC_SHA1_KEY(desc->tfm), data, len, out);
 	return 0;
 }
 
+static int crypto_hmac_sha1_export(struct shash_desc *desc, void *out)
+{
+	return __crypto_sha1_export(&HMAC_SHA1_CTX(desc)->sha_ctx, out);
+}
+
+static int crypto_hmac_sha1_import(struct shash_desc *desc, const void *in)
+{
+	struct hmac_sha1_ctx *ctx = HMAC_SHA1_CTX(desc);
+
+	ctx->ostate = HMAC_SHA1_KEY(desc->tfm)->ostate;
+	return __crypto_sha1_import(&ctx->sha_ctx, in);
+}
+
 static struct shash_alg algs[] = {
 	{
 		.base.cra_name		= "sha1",
 		.base.cra_driver_name	= "sha1-lib",
 		.base.cra_priority	= 300,
@@ -93,11 +153,14 @@ static struct shash_alg algs[] = {
 		.digestsize		= SHA1_DIGEST_SIZE,
 		.init			= crypto_sha1_init,
 		.update			= crypto_sha1_update,
 		.final			= crypto_sha1_final,
 		.digest			= crypto_sha1_digest,
+		.export			= crypto_sha1_export,
+		.import			= crypto_sha1_import,
 		.descsize		= sizeof(struct sha1_ctx),
+		.statesize		= SHA1_SHASH_STATE_SIZE,
 	},
 	{
 		.base.cra_name		= "hmac(sha1)",
 		.base.cra_driver_name	= "hmac-sha1-lib",
 		.base.cra_priority	= 300,
@@ -108,11 +171,14 @@ static struct shash_alg algs[] = {
 		.setkey			= crypto_hmac_sha1_setkey,
 		.init			= crypto_hmac_sha1_init,
 		.update			= crypto_hmac_sha1_update,
 		.final			= crypto_hmac_sha1_final,
 		.digest			= crypto_hmac_sha1_digest,
+		.export			= crypto_hmac_sha1_export,
+		.import			= crypto_hmac_sha1_import,
 		.descsize		= sizeof(struct hmac_sha1_ctx),
+		.statesize		= SHA1_SHASH_STATE_SIZE,
 	},
 };
 
 static int __init crypto_sha1_mod_init(void)
 {
-- 
2.50.1


