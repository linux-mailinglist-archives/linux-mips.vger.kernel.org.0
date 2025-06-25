Return-Path: <linux-mips+bounces-9490-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9F1AE7820
	for <lists+linux-mips@lfdr.de>; Wed, 25 Jun 2025 09:13:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A09554A0F7E
	for <lists+linux-mips@lfdr.de>; Wed, 25 Jun 2025 07:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76D44221DB6;
	Wed, 25 Jun 2025 07:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WxdR8L6a"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB0222126E;
	Wed, 25 Jun 2025 07:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750835434; cv=none; b=k1NnUq93uHuEqe1UDan48h7y6oAhk3Hmck+KAiJTWBkbnZDiffGcnYbFXgKYObcMjM090BFhCddekyxk2cZVh/WpEJWzPMLcKh0svaOjLe1shjnLvn6pi3u8syZWDDmrQ5kriUxDgpN+9A0LykmVoIAlzu7v/8ysaPrUlYCwvEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750835434; c=relaxed/simple;
	bh=IkX8c809Bkwa5YKNS0n0XaW5ZPy/jAKfSUJXB4aJ5O4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g1cj1LGif6d2KS+q+1ksV0jXaotty+PHj6EwrIL0c6tip3ITzS9eVeS/OzhlKG8zsGQkYgjPYGdU8uPEJlNdMvEKeZUdS9FwZLvEa46KWwnKAi8AurJMBOE9I5TR4nRiJk2tXQSTXI4L5HG8j4zxgyCcJBDsRTP5WT59DTYWfug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WxdR8L6a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9507DC4CEF3;
	Wed, 25 Jun 2025 07:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750835433;
	bh=IkX8c809Bkwa5YKNS0n0XaW5ZPy/jAKfSUJXB4aJ5O4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WxdR8L6aeMZxRKJr8FD2AsRFrBKpUzk1K4lUjaxONdjsjrofU9tvADZLCp7CkzrlK
	 m0K7EkyB+j5p5vLFZt6YAEpKOvT0LVBlHYDPmc3fOUaIicfbg2NYypwvKJ45xTvdGK
	 WDLnxSIouflaXT1XNx17bdfFWsUAHXRg2Ak7p6epGMBwfJGCdOvWmgBbH/JLeo/+bd
	 +6uAIVeAU7zJw/K/Pygyx77H3LapMXvu0bWMAOf5L/L0okQKFfIP2Q83geBPW7cVfI
	 CYF0Du6S/hnBtCKQ/96pidTDm63RqkmUO71j3+3VNjhpIYFQkdWzSe4ss0z4MJZf2H
	 pR0iU1NIwFyPA==
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
Subject: [PATCH 14/18] crypto: sha256 - Use same state format as legacy drivers
Date: Wed, 25 Jun 2025 00:08:15 -0700
Message-ID: <20250625070819.1496119-15-ebiggers@kernel.org>
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


