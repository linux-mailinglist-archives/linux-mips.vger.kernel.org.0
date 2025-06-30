Return-Path: <linux-mips+bounces-9573-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA481AEE3FA
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 18:15:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 597A41BC1DBD
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 16:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 349412BD5AF;
	Mon, 30 Jun 2025 16:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uJU/z1sv"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04AA8290080;
	Mon, 30 Jun 2025 16:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751299764; cv=none; b=NAbHeR527v24D161Zpm8kJnUeez+GcYIrj1Hv0AJSnoNwEMxZE1EwWPfO53XUucdAROAh/KyjnrVzycPTJie/fuZu3o5TD1qarv2iqk2Sji+/SFI+BVQXzF/soD4ELm1SB2Dt9bv1X/OIJFDmKyJDNAPOMu3gWxz77ACkTCOkTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751299764; c=relaxed/simple;
	bh=ROSuDg+acrxeVuKH4kzaDK5UEZ7KG7ix2MxLeoctiw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jsxx1Zu+R8SwPtsiJBI3S3+wbCcwuJ8pVyLSn6dXwsfvk3Ms7jkrF4atkl+LyNhrMnWzx9+HmNpY8zdgGLF3Ogynitpet3v6gU/UfKbpiMD6ZxyfF3XsCtV0heqOx6Oe4ejZTCcBpnL01T/wdiwZJOxhcPZ7NYvn2isnpQSPraU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uJU/z1sv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35CD0C4CEF3;
	Mon, 30 Jun 2025 16:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299763;
	bh=ROSuDg+acrxeVuKH4kzaDK5UEZ7KG7ix2MxLeoctiw8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uJU/z1sv9CCeVa5wUp0YRKYkwt8VxWa5ArV1UvR4AvEbeWC8xRil6XmrSl11H2Hqi
	 Uo+xyyvvPzz5xS4mvdUQJRbwpJ8ZiqOn+h1q8si/P8g299fIOwU7Wqan96eZq5Oghn
	 JXaZ05m0OvPgRDj+SX5aXcvfhUkwp8DnHT/WtYhwRCkP161NlE8tUQ2k+HiQgPjvNY
	 BSCsVLbd3sVvcTeyeV58tV+cacS28M/9HcYfdR/lKmZW/oK96H3Hf5IVIdxO5tzc8T
	 x2j/aBuavHwk6qoEdR21kmbnkijGt3RM6NGgIjT6e9FZZHUahvVqypyPXfh+bN6tCg
	 ewd1pOoi/5WcQ==
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
Subject: [PATCH v2 06/14] lib/crypto: sha256: Make library API use strongly-typed contexts
Date: Mon, 30 Jun 2025 09:06:37 -0700
Message-ID: <20250630160645.3198-7-ebiggers@kernel.org>
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

Currently the SHA-224 and SHA-256 library functions can be mixed
arbitrarily, even in ways that are incorrect, for example using
sha224_init() and sha256_final().  This is because they operate on the
same structure, sha256_state.

Introduce stronger typing, as I did for SHA-384 and SHA-512.

Also as I did for SHA-384 and SHA-512, use the names *_ctx instead of
*_state.  The *_ctx names have the following small benefits:

- They're shorter.
- They avoid an ambiguity with the compression function state.
- They're consistent with the well-known OpenSSL API.
- Users usually name the variable 'sctx' anyway, which suggests that
  *_ctx would be the more natural name for the actual struct.

Therefore: update the SHA-224 and SHA-256 APIs, implementation, and
calling code accordingly.

In the new structs, also strongly-type the compression function state.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/riscv/purgatory/purgatory.c |   8 +--
 arch/s390/purgatory/purgatory.c  |   2 +-
 arch/x86/purgatory/purgatory.c   |   2 +-
 crypto/sha256.c                  |  16 ++---
 drivers/char/tpm/tpm2-sessions.c |  12 ++--
 include/crypto/sha2.h            |  52 ++++++++++++----
 kernel/kexec_file.c              |  10 ++--
 lib/crypto/sha256.c              | 100 ++++++++++++++++++++++---------
 8 files changed, 139 insertions(+), 63 deletions(-)

diff --git a/arch/riscv/purgatory/purgatory.c b/arch/riscv/purgatory/purgatory.c
index 80596ab5fb622..bbd5cfa4d7412 100644
--- a/arch/riscv/purgatory/purgatory.c
+++ b/arch/riscv/purgatory/purgatory.c
@@ -18,18 +18,18 @@ u8 purgatory_sha256_digest[SHA256_DIGEST_SIZE] __section(".kexec-purgatory");
 struct kexec_sha_region purgatory_sha_regions[KEXEC_SEGMENT_MAX] __section(".kexec-purgatory");
 
 static int verify_sha256_digest(void)
 {
 	struct kexec_sha_region *ptr, *end;
-	struct sha256_state ss;
+	struct sha256_ctx sctx;
 	u8 digest[SHA256_DIGEST_SIZE];
 
-	sha256_init(&ss);
+	sha256_init(&sctx);
 	end = purgatory_sha_regions + ARRAY_SIZE(purgatory_sha_regions);
 	for (ptr = purgatory_sha_regions; ptr < end; ptr++)
-		sha256_update(&ss, (uint8_t *)(ptr->start), ptr->len);
-	sha256_final(&ss, digest);
+		sha256_update(&sctx, (uint8_t *)(ptr->start), ptr->len);
+	sha256_final(&sctx, digest);
 	if (memcmp(digest, purgatory_sha256_digest, sizeof(digest)) != 0)
 		return 1;
 	return 0;
 }
 
diff --git a/arch/s390/purgatory/purgatory.c b/arch/s390/purgatory/purgatory.c
index 030efda05dbe5..ecb38102187c2 100644
--- a/arch/s390/purgatory/purgatory.c
+++ b/arch/s390/purgatory/purgatory.c
@@ -14,11 +14,11 @@
 
 int verify_sha256_digest(void)
 {
 	struct kexec_sha_region *ptr, *end;
 	u8 digest[SHA256_DIGEST_SIZE];
-	struct sha256_state sctx;
+	struct sha256_ctx sctx;
 
 	sha256_init(&sctx);
 	end = purgatory_sha_regions + ARRAY_SIZE(purgatory_sha_regions);
 
 	for (ptr = purgatory_sha_regions; ptr < end; ptr++)
diff --git a/arch/x86/purgatory/purgatory.c b/arch/x86/purgatory/purgatory.c
index aea47e7939637..655139dd05325 100644
--- a/arch/x86/purgatory/purgatory.c
+++ b/arch/x86/purgatory/purgatory.c
@@ -23,11 +23,11 @@ struct kexec_sha_region purgatory_sha_regions[KEXEC_SEGMENT_MAX] __section(".kex
 
 static int verify_sha256_digest(void)
 {
 	struct kexec_sha_region *ptr, *end;
 	u8 digest[SHA256_DIGEST_SIZE];
-	struct sha256_state sctx;
+	struct sha256_ctx sctx;
 
 	sha256_init(&sctx);
 	end = purgatory_sha_regions + ARRAY_SIZE(purgatory_sha_regions);
 
 	for (ptr = purgatory_sha_regions; ptr < end; ptr++)
diff --git a/crypto/sha256.c b/crypto/sha256.c
index 4aeb213bab117..15c57fba256b7 100644
--- a/crypto/sha256.c
+++ b/crypto/sha256.c
@@ -135,28 +135,28 @@ static int crypto_sha224_final_lib(struct shash_desc *desc, u8 *out)
 	return 0;
 }
 
 static int crypto_sha256_import_lib(struct shash_desc *desc, const void *in)
 {
-	struct sha256_state *sctx = shash_desc_ctx(desc);
+	struct __sha256_ctx *sctx = shash_desc_ctx(desc);
 	const u8 *p = in;
 
 	memcpy(sctx, p, sizeof(*sctx));
 	p += sizeof(*sctx);
-	sctx->count += *p;
+	sctx->bytecount += *p;
 	return 0;
 }
 
 static int crypto_sha256_export_lib(struct shash_desc *desc, void *out)
 {
-	struct sha256_state *sctx0 = shash_desc_ctx(desc);
-	struct sha256_state sctx = *sctx0;
+	struct __sha256_ctx *sctx0 = shash_desc_ctx(desc);
+	struct __sha256_ctx sctx = *sctx0;
 	unsigned int partial;
 	u8 *p = out;
 
-	partial = sctx.count % SHA256_BLOCK_SIZE;
-	sctx.count -= partial;
+	partial = sctx.bytecount % SHA256_BLOCK_SIZE;
+	sctx.bytecount -= partial;
 	memcpy(p, &sctx, sizeof(sctx));
 	p += sizeof(sctx);
 	*p = partial;
 	return 0;
 }
@@ -199,11 +199,11 @@ static struct shash_alg algs[] = {
 		.digestsize		= SHA256_DIGEST_SIZE,
 		.init			= crypto_sha256_init,
 		.update			= crypto_sha256_update_lib,
 		.final			= crypto_sha256_final_lib,
 		.digest			= crypto_sha256_digest_lib,
-		.descsize		= sizeof(struct sha256_state),
+		.descsize		= sizeof(struct sha256_ctx),
 		.statesize		= sizeof(struct crypto_sha256_state) +
 					  SHA256_BLOCK_SIZE + 1,
 		.import			= crypto_sha256_import_lib,
 		.export			= crypto_sha256_export_lib,
 	},
@@ -214,11 +214,11 @@ static struct shash_alg algs[] = {
 		.base.cra_module	= THIS_MODULE,
 		.digestsize		= SHA224_DIGEST_SIZE,
 		.init			= crypto_sha224_init,
 		.update			= crypto_sha256_update_lib,
 		.final			= crypto_sha224_final_lib,
-		.descsize		= sizeof(struct sha256_state),
+		.descsize		= sizeof(struct sha224_ctx),
 		.statesize		= sizeof(struct crypto_sha256_state) +
 					  SHA256_BLOCK_SIZE + 1,
 		.import			= crypto_sha256_import_lib,
 		.export			= crypto_sha256_export_lib,
 	},
diff --git a/drivers/char/tpm/tpm2-sessions.c b/drivers/char/tpm/tpm2-sessions.c
index 7b5049b3d476e..bdb119453dfbe 100644
--- a/drivers/char/tpm/tpm2-sessions.c
+++ b/drivers/char/tpm/tpm2-sessions.c
@@ -388,11 +388,11 @@ static int tpm2_create_primary(struct tpm_chip *chip, u32 hierarchy,
  * It turns out the crypto hmac(sha256) is hard for us to consume
  * because it assumes a fixed key and the TPM seems to change the key
  * on every operation, so we weld the hmac init and final functions in
  * here to give it the same usage characteristics as a regular hash
  */
-static void tpm2_hmac_init(struct sha256_state *sctx, u8 *key, u32 key_len)
+static void tpm2_hmac_init(struct sha256_ctx *sctx, u8 *key, u32 key_len)
 {
 	u8 pad[SHA256_BLOCK_SIZE];
 	int i;
 
 	sha256_init(sctx);
@@ -404,11 +404,11 @@ static void tpm2_hmac_init(struct sha256_state *sctx, u8 *key, u32 key_len)
 		pad[i] ^= HMAC_IPAD_VALUE;
 	}
 	sha256_update(sctx, pad, sizeof(pad));
 }
 
-static void tpm2_hmac_final(struct sha256_state *sctx, u8 *key, u32 key_len,
+static void tpm2_hmac_final(struct sha256_ctx *sctx, u8 *key, u32 key_len,
 			    u8 *out)
 {
 	u8 pad[SHA256_BLOCK_SIZE];
 	int i;
 
@@ -438,11 +438,11 @@ static void tpm2_KDFa(u8 *key, u32 key_len, const char *label, u8 *u,
 {
 	u32 counter = 1;
 	const __be32 bits = cpu_to_be32(bytes * 8);
 
 	while (bytes > 0) {
-		struct sha256_state sctx;
+		struct sha256_ctx sctx;
 		__be32 c = cpu_to_be32(counter);
 
 		tpm2_hmac_init(&sctx, key, key_len);
 		sha256_update(&sctx, (u8 *)&c, sizeof(c));
 		sha256_update(&sctx, label, strlen(label)+1);
@@ -465,11 +465,11 @@ static void tpm2_KDFa(u8 *key, u32 key_len, const char *label, u8 *u,
  * in this KDF.
  */
 static void tpm2_KDFe(u8 z[EC_PT_SZ], const char *str, u8 *pt_u, u8 *pt_v,
 		      u8 *out)
 {
-	struct sha256_state sctx;
+	struct sha256_ctx sctx;
 	/*
 	 * this should be an iterative counter, but because we know
 	 *  we're only taking 32 bytes for the point using a sha256
 	 *  hash which is also 32 bytes, there's only one loop
 	 */
@@ -590,11 +590,11 @@ void tpm_buf_fill_hmac_session(struct tpm_chip *chip, struct tpm_buf *buf)
 	struct tpm_header *head = (struct tpm_header *)buf->data;
 	off_t offset_s = TPM_HEADER_SIZE, offset_p;
 	u8 *hmac = NULL;
 	u32 attrs;
 	u8 cphash[SHA256_DIGEST_SIZE];
-	struct sha256_state sctx;
+	struct sha256_ctx sctx;
 
 	if (!auth)
 		return;
 
 	/* save the command code in BE format */
@@ -748,11 +748,11 @@ int tpm_buf_check_hmac_response(struct tpm_chip *chip, struct tpm_buf *buf,
 	struct tpm_header *head = (struct tpm_header *)buf->data;
 	struct tpm2_auth *auth = chip->auth;
 	off_t offset_s, offset_p;
 	u8 rphash[SHA256_DIGEST_SIZE];
 	u32 attrs, cc;
-	struct sha256_state sctx;
+	struct sha256_ctx sctx;
 	u16 tag = be16_to_cpu(head->tag);
 	int parm_len, len, i, handles;
 
 	if (!auth)
 		return rc;
diff --git a/include/crypto/sha2.h b/include/crypto/sha2.h
index e31da0743a522..18e1eec841b71 100644
--- a/include/crypto/sha2.h
+++ b/include/crypto/sha2.h
@@ -112,29 +112,59 @@ struct sha512_state {
 	u64 state[SHA512_DIGEST_SIZE / 8];
 	u64 count[2];
 	u8 buf[SHA512_BLOCK_SIZE];
 };
 
-void sha256_update(struct sha256_state *sctx, const u8 *data, size_t len);
+/* State for the SHA-256 (and SHA-224) compression function */
+struct sha256_block_state {
+	u32 h[SHA256_STATE_WORDS];
+};
 
-static inline void sha224_init(struct sha256_state *sctx)
-{
-	sha224_block_init(&sctx->ctx);
-}
-static inline void sha224_update(struct sha256_state *sctx,
+/*
+ * Context structure, shared by SHA-224 and SHA-256.  The sha224_ctx and
+ * sha256_ctx structs wrap this one so that the API has proper typing and
+ * doesn't allow mixing the SHA-224 and SHA-256 functions arbitrarily.
+ */
+struct __sha256_ctx {
+	struct sha256_block_state state;
+	u64 bytecount;
+	u8 buf[SHA256_BLOCK_SIZE] __aligned(__alignof__(__be64));
+};
+void __sha256_update(struct __sha256_ctx *ctx, const u8 *data, size_t len);
+
+/**
+ * struct sha224_ctx - Context for hashing a message with SHA-224
+ * @ctx: private
+ */
+struct sha224_ctx {
+	struct __sha256_ctx ctx;
+};
+
+void sha224_init(struct sha224_ctx *ctx);
+static inline void sha224_update(struct sha224_ctx *ctx,
 				 const u8 *data, size_t len)
 {
-	sha256_update(sctx, data, len);
+	__sha256_update(&ctx->ctx, data, len);
 }
-void sha224_final(struct sha256_state *sctx, u8 out[SHA224_DIGEST_SIZE]);
+void sha224_final(struct sha224_ctx *ctx, u8 out[SHA224_DIGEST_SIZE]);
 void sha224(const u8 *data, size_t len, u8 out[SHA224_DIGEST_SIZE]);
 
-static inline void sha256_init(struct sha256_state *sctx)
+/**
+ * struct sha256_ctx - Context for hashing a message with SHA-256
+ * @ctx: private
+ */
+struct sha256_ctx {
+	struct __sha256_ctx ctx;
+};
+
+void sha256_init(struct sha256_ctx *ctx);
+static inline void sha256_update(struct sha256_ctx *ctx,
+				 const u8 *data, size_t len)
 {
-	sha256_block_init(&sctx->ctx);
+	__sha256_update(&ctx->ctx, data, len);
 }
-void sha256_final(struct sha256_state *sctx, u8 out[SHA256_DIGEST_SIZE]);
+void sha256_final(struct sha256_ctx *ctx, u8 out[SHA256_DIGEST_SIZE]);
 void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE]);
 
 /* State for the SHA-512 (and SHA-384) compression function */
 struct sha512_block_state {
 	u64 h[8];
diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index 69fe76fd92334..b835033c65eb1 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -749,11 +749,11 @@ int kexec_add_buffer(struct kexec_buf *kbuf)
 }
 
 /* Calculate and store the digest of segments */
 static int kexec_calculate_store_digests(struct kimage *image)
 {
-	struct sha256_state state;
+	struct sha256_ctx sctx;
 	int ret = 0, i, j, zero_buf_sz, sha_region_sz;
 	size_t nullsz;
 	u8 digest[SHA256_DIGEST_SIZE];
 	void *zero_buf;
 	struct kexec_sha_region *sha_regions;
@@ -768,11 +768,11 @@ static int kexec_calculate_store_digests(struct kimage *image)
 	sha_region_sz = KEXEC_SEGMENT_MAX * sizeof(struct kexec_sha_region);
 	sha_regions = vzalloc(sha_region_sz);
 	if (!sha_regions)
 		return -ENOMEM;
 
-	sha256_init(&state);
+	sha256_init(&sctx);
 
 	for (j = i = 0; i < image->nr_segments; i++) {
 		struct kexec_segment *ksegment;
 
 #ifdef CONFIG_CRASH_HOTPLUG
@@ -794,11 +794,11 @@ static int kexec_calculate_store_digests(struct kimage *image)
 		 * the current index
 		 */
 		if (check_ima_segment_index(image, i))
 			continue;
 
-		sha256_update(&state, ksegment->kbuf, ksegment->bufsz);
+		sha256_update(&sctx, ksegment->kbuf, ksegment->bufsz);
 
 		/*
 		 * Assume rest of the buffer is filled with zero and
 		 * update digest accordingly.
 		 */
@@ -806,20 +806,20 @@ static int kexec_calculate_store_digests(struct kimage *image)
 		while (nullsz) {
 			unsigned long bytes = nullsz;
 
 			if (bytes > zero_buf_sz)
 				bytes = zero_buf_sz;
-			sha256_update(&state, zero_buf, bytes);
+			sha256_update(&sctx, zero_buf, bytes);
 			nullsz -= bytes;
 		}
 
 		sha_regions[j].start = ksegment->mem;
 		sha_regions[j].len = ksegment->memsz;
 		j++;
 	}
 
-	sha256_final(&state, digest);
+	sha256_final(&sctx, digest);
 
 	ret = kexec_purgatory_get_set_symbol(image, "purgatory_sha_regions",
 					     sha_regions, sha_region_sz, 0);
 	if (ret)
 		goto out_free_sha_regions;
diff --git a/lib/crypto/sha256.c b/lib/crypto/sha256.c
index ccaae70880166..3e7797a4489de 100644
--- a/lib/crypto/sha256.c
+++ b/lib/crypto/sha256.c
@@ -16,10 +16,24 @@
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/string.h>
 
+static const struct sha256_block_state sha224_iv = {
+	.h = {
+		SHA224_H0, SHA224_H1, SHA224_H2, SHA224_H3,
+		SHA224_H4, SHA224_H5, SHA224_H6, SHA224_H7,
+	},
+};
+
+static const struct sha256_block_state sha256_iv = {
+	.h = {
+		SHA256_H0, SHA256_H1, SHA256_H2, SHA256_H3,
+		SHA256_H4, SHA256_H5, SHA256_H6, SHA256_H7,
+	},
+};
+
 /*
  * If __DISABLE_EXPORTS is defined, then this file is being compiled for a
  * pre-boot environment.  In that case, ignore the kconfig options, pull the
  * generic code into the same translation unit, and use that only.
  */
@@ -30,65 +44,97 @@
 static inline bool sha256_purgatory(void)
 {
 	return __is_defined(__DISABLE_EXPORTS);
 }
 
-static inline void sha256_blocks(u32 state[SHA256_STATE_WORDS], const u8 *data,
-				 size_t nblocks)
+static inline void sha256_blocks(struct sha256_block_state *state,
+				 const u8 *data, size_t nblocks)
+{
+	sha256_choose_blocks(state->h, data, nblocks, sha256_purgatory(), false);
+}
+
+static void __sha256_init(struct __sha256_ctx *ctx,
+			  const struct sha256_block_state *iv,
+			  u64 initial_bytecount)
+{
+	ctx->state = *iv;
+	ctx->bytecount = initial_bytecount;
+}
+
+void sha224_init(struct sha224_ctx *ctx)
+{
+	__sha256_init(&ctx->ctx, &sha224_iv, 0);
+}
+EXPORT_SYMBOL_GPL(sha224_init);
+
+void sha256_init(struct sha256_ctx *ctx)
 {
-	sha256_choose_blocks(state, data, nblocks, sha256_purgatory(), false);
+	__sha256_init(&ctx->ctx, &sha256_iv, 0);
 }
+EXPORT_SYMBOL_GPL(sha256_init);
 
-void sha256_update(struct sha256_state *sctx, const u8 *data, size_t len)
+void __sha256_update(struct __sha256_ctx *ctx, const u8 *data, size_t len)
 {
-	size_t partial = sctx->count % SHA256_BLOCK_SIZE;
+	size_t partial = ctx->bytecount % SHA256_BLOCK_SIZE;
 
-	sctx->count += len;
-	BLOCK_HASH_UPDATE_BLOCKS(sha256_blocks, sctx->ctx.state, data, len,
-				 SHA256_BLOCK_SIZE, sctx->buf, partial);
+	ctx->bytecount += len;
+	BLOCK_HASH_UPDATE_BLOCKS(sha256_blocks, &ctx->state, data, len,
+				 SHA256_BLOCK_SIZE, ctx->buf, partial);
 }
-EXPORT_SYMBOL(sha256_update);
+EXPORT_SYMBOL(__sha256_update);
 
-static inline void __sha256_final(struct sha256_state *sctx, u8 *out,
-				  size_t digest_size)
+static void __sha256_final(struct __sha256_ctx *ctx,
+			   u8 *out, size_t digest_size)
 {
-	size_t partial = sctx->count % SHA256_BLOCK_SIZE;
+	u64 bitcount = ctx->bytecount << 3;
+	size_t partial = ctx->bytecount % SHA256_BLOCK_SIZE;
+
+	ctx->buf[partial++] = 0x80;
+	if (partial > SHA256_BLOCK_SIZE - 8) {
+		memset(&ctx->buf[partial], 0, SHA256_BLOCK_SIZE - partial);
+		sha256_blocks(&ctx->state, ctx->buf, 1);
+		partial = 0;
+	}
+	memset(&ctx->buf[partial], 0, SHA256_BLOCK_SIZE - 8 - partial);
+	*(__be64 *)&ctx->buf[SHA256_BLOCK_SIZE - 8] = cpu_to_be64(bitcount);
+	sha256_blocks(&ctx->state, ctx->buf, 1);
 
-	sha256_finup(&sctx->ctx, sctx->buf, partial, out, digest_size,
-		     sha256_purgatory(), false);
-	memzero_explicit(sctx, sizeof(*sctx));
+	for (size_t i = 0; i < digest_size; i += 4)
+		put_unaligned_be32(ctx->state.h[i / 4], out + i);
 }
 
-void sha224_final(struct sha256_state *sctx, u8 out[SHA224_DIGEST_SIZE])
+void sha224_final(struct sha224_ctx *ctx, u8 out[SHA224_DIGEST_SIZE])
 {
-	__sha256_final(sctx, out, SHA224_DIGEST_SIZE);
+	__sha256_final(&ctx->ctx, out, SHA224_DIGEST_SIZE);
+	memzero_explicit(ctx, sizeof(*ctx));
 }
 EXPORT_SYMBOL(sha224_final);
 
-void sha256_final(struct sha256_state *sctx, u8 out[SHA256_DIGEST_SIZE])
+void sha256_final(struct sha256_ctx *ctx, u8 out[SHA256_DIGEST_SIZE])
 {
-	__sha256_final(sctx, out, SHA256_DIGEST_SIZE);
+	__sha256_final(&ctx->ctx, out, SHA256_DIGEST_SIZE);
+	memzero_explicit(ctx, sizeof(*ctx));
 }
 EXPORT_SYMBOL(sha256_final);
 
 void sha224(const u8 *data, size_t len, u8 out[SHA224_DIGEST_SIZE])
 {
-	struct sha256_state sctx;
+	struct sha224_ctx ctx;
 
-	sha224_init(&sctx);
-	sha224_update(&sctx, data, len);
-	sha224_final(&sctx, out);
+	sha224_init(&ctx);
+	sha224_update(&ctx, data, len);
+	sha224_final(&ctx, out);
 }
 EXPORT_SYMBOL(sha224);
 
 void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE])
 {
-	struct sha256_state sctx;
+	struct sha256_ctx ctx;
 
-	sha256_init(&sctx);
-	sha256_update(&sctx, data, len);
-	sha256_final(&sctx, out);
+	sha256_init(&ctx);
+	sha256_update(&ctx, data, len);
+	sha256_final(&ctx, out);
 }
 EXPORT_SYMBOL(sha256);
 
 MODULE_DESCRIPTION("SHA-256 Algorithm");
 MODULE_LICENSE("GPL");
-- 
2.50.0


