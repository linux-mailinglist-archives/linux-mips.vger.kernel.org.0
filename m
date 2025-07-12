Return-Path: <linux-mips+bounces-9788-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C96B02E1D
	for <lists+linux-mips@lfdr.de>; Sun, 13 Jul 2025 01:31:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AFCA1C21E7C
	for <lists+linux-mips@lfdr.de>; Sat, 12 Jul 2025 23:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1F1F246794;
	Sat, 12 Jul 2025 23:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="adPuDNFT"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81940246779;
	Sat, 12 Jul 2025 23:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752362791; cv=none; b=WtsF84dboeO6lIg6W8Do8kBhL2CWBX16u2vH8vYV5LFlMSUgGr6ki/AixT5hgXCtXneyoBOGv47C8b2gxvKqzEuHkyble6NWJf3mJ2VZQDkMm4ffIsVQsw8p3ZbaeHWVSVJ+U0nklHl42rFIDf2sWCzCatS2tlxFVpK7x8Z4l00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752362791; c=relaxed/simple;
	bh=rfJ72uWvvK+whDF9VjkI5SYPfCKh27VtzjmWTwXhIJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u4vbGcAfESRxVll2CPv20ijpr7N0tIXjLvLgIKZ/9kBlIC676eZ32fGqrr6qkOydMwyfmUjpWqib+TR1+do2aPG4hY93g1oQvj0MG0lhQZqX64PZze2hoKQon59x/4K777lfdtrQADJdOAf0SFWByny5pKmIXnnw67VBgixHk30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=adPuDNFT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B87F5C4CEF8;
	Sat, 12 Jul 2025 23:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362791;
	bh=rfJ72uWvvK+whDF9VjkI5SYPfCKh27VtzjmWTwXhIJA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=adPuDNFTOjCINdd++ewChJOGNbvpvPCdKMgJfTgRQVWFOLKuAr3v2d13HC1FITvPY
	 gL08rEFOe6I2qF2+ngmp0urjV0YUz6HmCSL1V8p3M1gV9CyYQMgLkCJS+O+7bq/Pd/
	 ELxAGoNm19hqjcz2MxC3qh2PLrusWwnTLczFTZqnDSGLkcEJvnUS8MeuaBWVioD+9M
	 Ek1NkQVcy8IFlqynbsqyE5FOtX0PqYijraDbs8A7GLcrL32Zrb9sK1oM6D6Bhe1T2G
	 AEDIb2+J1IXfEmKx8lL4J44Lyw1N73Qnd6JzBQB9Ltysfp/U2VnrpBGKTh7PN2Vof2
	 BtNUAszxW2+rQ==
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
Subject: [PATCH 23/26] ppp: mppe: Use SHA-1 library instead of crypto_shash
Date: Sat, 12 Jul 2025 16:23:14 -0700
Message-ID: <20250712232329.818226-24-ebiggers@kernel.org>
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

Use the SHA-1 library instead of crypto_shash.  This is simpler and
faster.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 drivers/net/ppp/Kconfig    |   3 +-
 drivers/net/ppp/ppp_mppe.c | 109 +++++++------------------------------
 2 files changed, 20 insertions(+), 92 deletions(-)

diff --git a/drivers/net/ppp/Kconfig b/drivers/net/ppp/Kconfig
index 8c9ed1889d1af..a1806b4b84beb 100644
--- a/drivers/net/ppp/Kconfig
+++ b/drivers/net/ppp/Kconfig
@@ -83,13 +83,12 @@ config PPP_FILTER
 	  If unsure, say N.
 
 config PPP_MPPE
 	tristate "PPP MPPE compression (encryption)"
 	depends on PPP
-	select CRYPTO
-	select CRYPTO_SHA1
 	select CRYPTO_LIB_ARC4
+	select CRYPTO_LIB_SHA1
 	help
 	  Support for the MPPE Encryption protocol, as employed by the
 	  Microsoft Point-to-Point Tunneling Protocol.
 
 	  See http://pptpclient.sourceforge.net/ for information on
diff --git a/drivers/net/ppp/ppp_mppe.c b/drivers/net/ppp/ppp_mppe.c
index bcc1eaedf58fb..126908549f9c7 100644
--- a/drivers/net/ppp/ppp_mppe.c
+++ b/drivers/net/ppp/ppp_mppe.c
@@ -41,11 +41,11 @@
  *                    MOD_DEC_USAGE_COUNT/MOD_INC_USAGE_COUNT which are
  *                    deprecated in 2.6
  */
 
 #include <crypto/arc4.h>
-#include <crypto/hash.h>
+#include <crypto/sha1.h>
 #include <linux/err.h>
 #include <linux/fips.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
@@ -53,11 +53,10 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/mm.h>
 #include <linux/ppp_defs.h>
 #include <linux/ppp-comp.h>
-#include <linux/scatterlist.h>
 #include <linux/unaligned.h>
 
 #include "ppp_mppe.h"
 
 MODULE_AUTHOR("Frank Cusack <fcusack@fcusack.com>");
@@ -65,35 +64,19 @@ MODULE_DESCRIPTION("Point-to-Point Protocol Microsoft Point-to-Point Encryption
 MODULE_LICENSE("Dual BSD/GPL");
 MODULE_ALIAS("ppp-compress-" __stringify(CI_MPPE));
 MODULE_VERSION("1.0.2");
 
 #define SHA1_PAD_SIZE 40
-
-/*
- * kernel crypto API needs its arguments to be in kmalloc'd memory, not in the module
- * static data area.  That means sha_pad needs to be kmalloc'd.
- */
-
-struct sha_pad {
-	unsigned char sha_pad1[SHA1_PAD_SIZE];
-	unsigned char sha_pad2[SHA1_PAD_SIZE];
-};
-static struct sha_pad *sha_pad;
-
-static inline void sha_pad_init(struct sha_pad *shapad)
-{
-	memset(shapad->sha_pad1, 0x00, sizeof(shapad->sha_pad1));
-	memset(shapad->sha_pad2, 0xF2, sizeof(shapad->sha_pad2));
-}
+static const u8 sha_pad1[SHA1_PAD_SIZE] = { 0 };
+static const u8 sha_pad2[SHA1_PAD_SIZE] = { [0 ... SHA1_PAD_SIZE - 1] = 0xF2 };
 
 /*
  * State for an MPPE (de)compressor.
  */
 struct ppp_mppe_state {
 	struct arc4_ctx arc4;
-	struct shash_desc *sha1;
-	unsigned char *sha1_digest;
+	unsigned char sha1_digest[SHA1_DIGEST_SIZE];
 	unsigned char master_key[MPPE_MAX_KEY_LEN];
 	unsigned char session_key[MPPE_MAX_KEY_LEN];
 	unsigned keylen;	/* key length in bytes             */
 	/* NB: 128-bit == 16, 40-bit == 8! */
 	/* If we want to support 56-bit,   */
@@ -128,28 +111,27 @@ struct ppp_mppe_state {
  * Key Derivation, from RFC 3078, RFC 3079.
  * Equivalent to Get_Key() for MS-CHAP as described in RFC 3079.
  */
 static void get_new_key_from_sha(struct ppp_mppe_state * state)
 {
-	crypto_shash_init(state->sha1);
-	crypto_shash_update(state->sha1, state->master_key,
-			    state->keylen);
-	crypto_shash_update(state->sha1, sha_pad->sha_pad1,
-			    sizeof(sha_pad->sha_pad1));
-	crypto_shash_update(state->sha1, state->session_key,
-			    state->keylen);
-	crypto_shash_update(state->sha1, sha_pad->sha_pad2,
-			    sizeof(sha_pad->sha_pad2));
-	crypto_shash_final(state->sha1, state->sha1_digest);
+	struct sha1_ctx ctx;
+
+	sha1_init(&ctx);
+	sha1_update(&ctx, state->master_key, state->keylen);
+	sha1_update(&ctx, sha_pad1, sizeof(sha_pad1));
+	sha1_update(&ctx, state->session_key, state->keylen);
+	sha1_update(&ctx, sha_pad2, sizeof(sha_pad2));
+	sha1_final(&ctx, state->sha1_digest);
 }
 
 /*
  * Perform the MPPE rekey algorithm, from RFC 3078, sec. 7.3.
  * Well, not what's written there, but rather what they meant.
  */
 static void mppe_rekey(struct ppp_mppe_state * state, int initial_key)
 {
+	static_assert(SHA1_DIGEST_SIZE >= MPPE_MAX_KEY_LEN);
 	get_new_key_from_sha(state);
 	if (!initial_key) {
 		arc4_setkey(&state->arc4, state->sha1_digest, state->keylen);
 		arc4_crypt(&state->arc4, state->session_key, state->sha1_digest,
 			   state->keylen);
@@ -169,43 +151,19 @@ static void mppe_rekey(struct ppp_mppe_state * state, int initial_key)
  * Allocate space for a (de)compressor.
  */
 static void *mppe_alloc(unsigned char *options, int optlen)
 {
 	struct ppp_mppe_state *state;
-	struct crypto_shash *shash;
-	unsigned int digestsize;
 
 	if (optlen != CILEN_MPPE + sizeof(state->master_key) ||
 	    options[0] != CI_MPPE || options[1] != CILEN_MPPE ||
 	    fips_enabled)
-		goto out;
+		return NULL;
 
 	state = kzalloc(sizeof(*state), GFP_KERNEL);
 	if (state == NULL)
-		goto out;
-
-
-	shash = crypto_alloc_shash("sha1", 0, 0);
-	if (IS_ERR(shash))
-		goto out_free;
-
-	state->sha1 = kmalloc(sizeof(*state->sha1) +
-				     crypto_shash_descsize(shash),
-			      GFP_KERNEL);
-	if (!state->sha1) {
-		crypto_free_shash(shash);
-		goto out_free;
-	}
-	state->sha1->tfm = shash;
-
-	digestsize = crypto_shash_digestsize(shash);
-	if (digestsize < MPPE_MAX_KEY_LEN)
-		goto out_free;
-
-	state->sha1_digest = kmalloc(digestsize, GFP_KERNEL);
-	if (!state->sha1_digest)
-		goto out_free;
+		return NULL;
 
 	/* Save keys. */
 	memcpy(state->master_key, &options[CILEN_MPPE],
 	       sizeof(state->master_key));
 	memcpy(state->session_key, state->master_key,
@@ -215,34 +173,20 @@ static void *mppe_alloc(unsigned char *options, int optlen)
 	 * We defer initial key generation until mppe_init(), as mppe_alloc()
 	 * is called frequently during negotiation.
 	 */
 
 	return (void *)state;
-
-out_free:
-	kfree(state->sha1_digest);
-	if (state->sha1) {
-		crypto_free_shash(state->sha1->tfm);
-		kfree_sensitive(state->sha1);
-	}
-	kfree(state);
-out:
-	return NULL;
 }
 
 /*
  * Deallocate space for a (de)compressor.
  */
 static void mppe_free(void *arg)
 {
 	struct ppp_mppe_state *state = (struct ppp_mppe_state *) arg;
-	if (state) {
-		kfree(state->sha1_digest);
-		crypto_free_shash(state->sha1->tfm);
-		kfree_sensitive(state->sha1);
-		kfree_sensitive(state);
-	}
+
+	kfree_sensitive(state);
 }
 
 /*
  * Initialize (de)compressor state.
  */
@@ -647,42 +591,27 @@ static struct compressor ppp_mppe = {
 	.decomp_stat    = mppe_comp_stats,
 	.owner          = THIS_MODULE,
 	.comp_extra     = MPPE_PAD,
 };
 
-/*
- * ppp_mppe_init()
- *
- * Prior to allowing load, try to load the arc4 and sha1 crypto
- * libraries.  The actual use will be allocated later, but
- * this way the module will fail to insmod if they aren't available.
- */
-
 static int __init ppp_mppe_init(void)
 {
 	int answer;
-	if (fips_enabled || !crypto_has_ahash("sha1", 0, CRYPTO_ALG_ASYNC))
-		return -ENODEV;
 
-	sha_pad = kmalloc(sizeof(struct sha_pad), GFP_KERNEL);
-	if (!sha_pad)
-		return -ENOMEM;
-	sha_pad_init(sha_pad);
+	if (fips_enabled)
+		return -ENODEV;
 
 	answer = ppp_register_compressor(&ppp_mppe);
 
 	if (answer == 0)
 		printk(KERN_INFO "PPP MPPE Compression module registered\n");
-	else
-		kfree(sha_pad);
 
 	return answer;
 }
 
 static void __exit ppp_mppe_cleanup(void)
 {
 	ppp_unregister_compressor(&ppp_mppe);
-	kfree(sha_pad);
 }
 
 module_init(ppp_mppe_init);
 module_exit(ppp_mppe_cleanup);
-- 
2.50.1


