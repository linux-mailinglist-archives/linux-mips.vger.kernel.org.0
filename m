Return-Path: <linux-mips+bounces-9577-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CADFBAEE3B1
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 18:12:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5531B7AD4EF
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 16:10:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5889C2D4B6C;
	Mon, 30 Jun 2025 16:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hVQBIRMj"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190F92D3EE3;
	Mon, 30 Jun 2025 16:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751299766; cv=none; b=uDyqAKhZtDKDkPCEzcP2DN2To3QRMWLhkjqPNgsxw+HnJxpE6pxS15uxGzCmRnrmjWypJexQyaTqRYuN+BR2jpaWVcCsUz/T2Y15EKEvlWWl4U/Z+Tk8pkc+R5hPj5wP8gcuXSUaPfD2atpO3Uf/KBlUzeG27oUx470zRerXpjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751299766; c=relaxed/simple;
	bh=IkX8c809Bkwa5YKNS0n0XaW5ZPy/jAKfSUJXB4aJ5O4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O9IiEnGmp8bu3JVMwuPIFZr7YfCYg0CzekMoCaLk/pL2xsSMkkrtn1WiQoCupFyURIfFT7/04r86XYGLOsjS60ARhX3ZaAtc+T/sNMfpWbcEqTPAGLZweViKM/k3Z6xGRIWhtQENuY0d/EZriSJD+mLf2AGVwGQusAEEJvZenn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hVQBIRMj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DA14C4CEF3;
	Mon, 30 Jun 2025 16:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299765;
	bh=IkX8c809Bkwa5YKNS0n0XaW5ZPy/jAKfSUJXB4aJ5O4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hVQBIRMj89xj2I1q9MVzVBAjICgLzgrDPQGlkMEPYi6HkkfGwSqIKdUNwVzeBw43u
	 pLMZD2xvvsNNH+fstFXvgHc0S/K+L2xVKEbMCCPCufoZ0/heTewIkqVByYK1ZWhTw0
	 Hy2bV8iB2xINx5piSLStSpNhwTM8MqnEaLYJw7KNKk6zF0ZAJp4VPXHfuIPzb8qigv
	 gq/sjjO5QScDsTz4EmKmYti8u4FJjxfBDkmAGV/fHoJ21l17GLfNAP/9dbDQMNXKoT
	 xIgK7YllgkWIiNyIBpu/iZEwvbi6yxZxIbsudqsZ7UWS67uj446XOxPtm5262mi0PL
	 /HoSYTOI/uH3w==
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
Subject: [PATCH v2 10/14] crypto: sha256 - Use same state format as legacy drivers
Date: Mon, 30 Jun 2025 09:06:41 -0700
Message-ID: <20250630160645.3198-11-ebiggers@kernel.org>
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

Make the export and import functions for the sha224, sha256,
hmac(sha224), and hmac(sha256) shash algorithms use the same format as
the padlock-sha and nx-sha256 drivers, as required by Herbert.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 crypto/sha256.c | 95 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/crypto/sha256.c b/crypto/sha256.c
index d81166cbba953..052806559f06c 100644
--- a/crypto/sha256.c
+++ b/crypto/sha256.c
@@ -11,10 +11,47 @@
 #include <crypto/internal/hash.h>
 #include <crypto/sha2.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
+/*
+ * Export and import functions.  crypto_shash wants a particular format that
+ * matches that used by some legacy drivers.  It currently is the same as the
+ * library SHA context, except the value in bytecount must be block-aligned and
+ * the remainder must be stored in an extra u8 appended to the struct.
+ */
+
+#define SHA256_SHASH_STATE_SIZE 105
+static_assert(offsetof(struct __sha256_ctx, state) == 0);
+static_assert(offsetof(struct __sha256_ctx, bytecount) == 32);
+static_assert(offsetof(struct __sha256_ctx, buf) == 40);
+static_assert(sizeof(struct __sha256_ctx) + 1 == SHA256_SHASH_STATE_SIZE);
+
+static int __crypto_sha256_export(const struct __sha256_ctx *ctx0, void *out)
+{
+	struct __sha256_ctx ctx = *ctx0;
+	unsigned int partial;
+	u8 *p = out;
+
+	partial = ctx.bytecount % SHA256_BLOCK_SIZE;
+	ctx.bytecount -= partial;
+	memcpy(p, &ctx, sizeof(ctx));
+	p += sizeof(ctx);
+	*p = partial;
+	return 0;
+}
+
+static int __crypto_sha256_import(struct __sha256_ctx *ctx, const void *in)
+{
+	const u8 *p = in;
+
+	memcpy(ctx, p, sizeof(*ctx));
+	p += sizeof(*ctx);
+	ctx->bytecount += *p;
+	return 0;
+}
+
 /* SHA-224 */
 
 const u8 sha224_zero_message_hash[SHA224_DIGEST_SIZE] = {
 	0xd1, 0x4a, 0x02, 0x8c, 0x2a, 0x3a, 0x2b, 0xc9, 0x47,
 	0x61, 0x02, 0xbb, 0x28, 0x82, 0x34, 0xc4, 0x15, 0xa2,
@@ -49,10 +86,20 @@ static int crypto_sha224_digest(struct shash_desc *desc,
 {
 	sha224(data, len, out);
 	return 0;
 }
 
+static int crypto_sha224_export(struct shash_desc *desc, void *out)
+{
+	return __crypto_sha256_export(&SHA224_CTX(desc)->ctx, out);
+}
+
+static int crypto_sha224_import(struct shash_desc *desc, const void *in)
+{
+	return __crypto_sha256_import(&SHA224_CTX(desc)->ctx, in);
+}
+
 /* SHA-256 */
 
 const u8 sha256_zero_message_hash[SHA256_DIGEST_SIZE] = {
 	0xe3, 0xb0, 0xc4, 0x42, 0x98, 0xfc, 0x1c, 0x14,
 	0x9a, 0xfb, 0xf4, 0xc8, 0x99, 0x6f, 0xb9, 0x24,
@@ -87,10 +134,20 @@ static int crypto_sha256_digest(struct shash_desc *desc,
 {
 	sha256(data, len, out);
 	return 0;
 }
 
+static int crypto_sha256_export(struct shash_desc *desc, void *out)
+{
+	return __crypto_sha256_export(&SHA256_CTX(desc)->ctx, out);
+}
+
+static int crypto_sha256_import(struct shash_desc *desc, const void *in)
+{
+	return __crypto_sha256_import(&SHA256_CTX(desc)->ctx, in);
+}
+
 /* HMAC-SHA224 */
 
 #define HMAC_SHA224_KEY(tfm) ((struct hmac_sha224_key *)crypto_shash_ctx(tfm))
 #define HMAC_SHA224_CTX(desc) ((struct hmac_sha224_ctx *)shash_desc_ctx(desc))
 
@@ -126,10 +183,23 @@ static int crypto_hmac_sha224_digest(struct shash_desc *desc,
 {
 	hmac_sha224(HMAC_SHA224_KEY(desc->tfm), data, len, out);
 	return 0;
 }
 
+static int crypto_hmac_sha224_export(struct shash_desc *desc, void *out)
+{
+	return __crypto_sha256_export(&HMAC_SHA224_CTX(desc)->ctx.sha_ctx, out);
+}
+
+static int crypto_hmac_sha224_import(struct shash_desc *desc, const void *in)
+{
+	struct hmac_sha224_ctx *ctx = HMAC_SHA224_CTX(desc);
+
+	ctx->ctx.ostate = HMAC_SHA224_KEY(desc->tfm)->key.ostate;
+	return __crypto_sha256_import(&ctx->ctx.sha_ctx, in);
+}
+
 /* HMAC-SHA256 */
 
 #define HMAC_SHA256_KEY(tfm) ((struct hmac_sha256_key *)crypto_shash_ctx(tfm))
 #define HMAC_SHA256_CTX(desc) ((struct hmac_sha256_ctx *)shash_desc_ctx(desc))
 
@@ -165,10 +235,23 @@ static int crypto_hmac_sha256_digest(struct shash_desc *desc,
 {
 	hmac_sha256(HMAC_SHA256_KEY(desc->tfm), data, len, out);
 	return 0;
 }
 
+static int crypto_hmac_sha256_export(struct shash_desc *desc, void *out)
+{
+	return __crypto_sha256_export(&HMAC_SHA256_CTX(desc)->ctx.sha_ctx, out);
+}
+
+static int crypto_hmac_sha256_import(struct shash_desc *desc, const void *in)
+{
+	struct hmac_sha256_ctx *ctx = HMAC_SHA256_CTX(desc);
+
+	ctx->ctx.ostate = HMAC_SHA256_KEY(desc->tfm)->key.ostate;
+	return __crypto_sha256_import(&ctx->ctx.sha_ctx, in);
+}
+
 /* Algorithm definitions */
 
 static struct shash_alg algs[] = {
 	{
 		.base.cra_name		= "sha224",
@@ -179,11 +262,14 @@ static struct shash_alg algs[] = {
 		.digestsize		= SHA224_DIGEST_SIZE,
 		.init			= crypto_sha224_init,
 		.update			= crypto_sha224_update,
 		.final			= crypto_sha224_final,
 		.digest			= crypto_sha224_digest,
+		.export			= crypto_sha224_export,
+		.import			= crypto_sha224_import,
 		.descsize		= sizeof(struct sha224_ctx),
+		.statesize		= SHA256_SHASH_STATE_SIZE,
 	},
 	{
 		.base.cra_name		= "sha256",
 		.base.cra_driver_name	= "sha256-lib",
 		.base.cra_priority	= 300,
@@ -192,11 +278,14 @@ static struct shash_alg algs[] = {
 		.digestsize		= SHA256_DIGEST_SIZE,
 		.init			= crypto_sha256_init,
 		.update			= crypto_sha256_update,
 		.final			= crypto_sha256_final,
 		.digest			= crypto_sha256_digest,
+		.export			= crypto_sha256_export,
+		.import			= crypto_sha256_import,
 		.descsize		= sizeof(struct sha256_ctx),
+		.statesize		= SHA256_SHASH_STATE_SIZE,
 	},
 	{
 		.base.cra_name		= "hmac(sha224)",
 		.base.cra_driver_name	= "hmac-sha224-lib",
 		.base.cra_priority	= 300,
@@ -207,11 +296,14 @@ static struct shash_alg algs[] = {
 		.setkey			= crypto_hmac_sha224_setkey,
 		.init			= crypto_hmac_sha224_init,
 		.update			= crypto_hmac_sha224_update,
 		.final			= crypto_hmac_sha224_final,
 		.digest			= crypto_hmac_sha224_digest,
+		.export			= crypto_hmac_sha224_export,
+		.import			= crypto_hmac_sha224_import,
 		.descsize		= sizeof(struct hmac_sha224_ctx),
+		.statesize		= SHA256_SHASH_STATE_SIZE,
 	},
 	{
 		.base.cra_name		= "hmac(sha256)",
 		.base.cra_driver_name	= "hmac-sha256-lib",
 		.base.cra_priority	= 300,
@@ -222,11 +314,14 @@ static struct shash_alg algs[] = {
 		.setkey			= crypto_hmac_sha256_setkey,
 		.init			= crypto_hmac_sha256_init,
 		.update			= crypto_hmac_sha256_update,
 		.final			= crypto_hmac_sha256_final,
 		.digest			= crypto_hmac_sha256_digest,
+		.export			= crypto_hmac_sha256_export,
+		.import			= crypto_hmac_sha256_import,
 		.descsize		= sizeof(struct hmac_sha256_ctx),
+		.statesize		= SHA256_SHASH_STATE_SIZE,
 	},
 };
 
 static int __init crypto_sha256_mod_init(void)
 {
-- 
2.50.0


