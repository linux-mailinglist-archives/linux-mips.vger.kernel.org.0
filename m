Return-Path: <linux-mips+bounces-9785-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD380B02E00
	for <lists+linux-mips@lfdr.de>; Sun, 13 Jul 2025 01:30:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AE9716E055
	for <lists+linux-mips@lfdr.de>; Sat, 12 Jul 2025 23:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528882441A0;
	Sat, 12 Jul 2025 23:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WtGAriuO"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D21F24337B;
	Sat, 12 Jul 2025 23:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752362790; cv=none; b=EmNIdsP1IaAhozmZylkRp30z7Nco6lP9SdPjij5EV9Zc55/n1j+MN1vKd5hGN7TtOxk5lID7/9lWTJA683BUMJWyH9tbD2QgubFlCxpKHu+iY2ZoVb0NFyUaj36dyoH6UdiryhkI/JZnf4VVJ5T3EoC8XirIu/07d/VAgQw7yvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752362790; c=relaxed/simple;
	bh=KDQk7Ir1m956D0f1p9m7xAyJlDKZMG/Uv5S3nHotAXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J2aOQXUXuzYjmjIXmX1pIyCczaZ0q97+PCIwLt6yxmuGmoOPf0kxnob5eYKIweI5i85eUa11oE4Z5z6R5UwgmYS98w5sYij0Qiwey7AVpoWHw2Xlx+aN9nsIQUiG+Lr/l5wlNed1IC2tET6RWfDGVk1E7X7mA4x0s9canP0cQl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WtGAriuO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5734BC4CEF5;
	Sat, 12 Jul 2025 23:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362789;
	bh=KDQk7Ir1m956D0f1p9m7xAyJlDKZMG/Uv5S3nHotAXE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WtGAriuOY7k91SmjWU1Jatz3UxR2BoHMvt2+41ewmLk75abevvy+rjaJDEKA9dayT
	 4HnruTxiMdXn9C2lbXUTYijPl6AGxeUiVHGzv2Mci1g3kf1n8j8iqK/Gw4UhDfA1OM
	 LEGQqPAvwRxD68ZByGUo/zfUhFtcAtZjF5EdvVBpUtFrWQZfMdAZzLC+bqW3uQZhM0
	 78Q9KCitYCnlEFnRK/ju2eh+jLK5DHwcHu4G++4VwfzzEeTmEfmKN7aI+ajzvGYgYp
	 L16hAYEY2uFqQu6UpZuTAuo837yuo7jq8gjxWFDQqb9fzhSIEx19EAKXI/j3/CqaeY
	 kvMR31cHKCF7g==
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
Subject: [PATCH 20/26] lib/digsig: Use SHA-1 library instead of crypto_shash
Date: Sat, 12 Jul 2025 16:23:11 -0700
Message-ID: <20250712232329.818226-21-ebiggers@kernel.org>
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

Use the SHA-1 library functions instead of crypto_shash.  This is
simpler and faster.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/Kconfig  |  3 +--
 lib/digsig.c | 46 ++++++----------------------------------------
 2 files changed, 7 insertions(+), 42 deletions(-)

diff --git a/lib/Kconfig b/lib/Kconfig
index 37db228f70a99..670c19800c26c 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -561,12 +561,11 @@ config MPILIB
 	  which is used by IMA/EVM digital signature extension.
 
 config SIGNATURE
 	tristate
 	depends on KEYS
-	select CRYPTO
-	select CRYPTO_SHA1
+	select CRYPTO_LIB_SHA1
 	select MPILIB
 	help
 	  Digital signature verification. Currently only RSA is supported.
 	  Implementation is done using GnuPG MPI library
 
diff --git a/lib/digsig.c b/lib/digsig.c
index 04b5e55ed95f5..5ddcc52f76863 100644
--- a/lib/digsig.c
+++ b/lib/digsig.c
@@ -16,19 +16,15 @@
 
 #include <linux/err.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/key.h>
-#include <linux/crypto.h>
-#include <crypto/hash.h>
 #include <crypto/sha1.h>
 #include <keys/user-type.h>
 #include <linux/mpi.h>
 #include <linux/digsig.h>
 
-static struct crypto_shash *shash;
-
 static const char *pkcs_1_v1_5_decode_emsa(const unsigned char *msg,
 						unsigned long  msglen,
 						unsigned long  modulus_bitlen,
 						unsigned long *outlen)
 {
@@ -197,16 +193,16 @@ static int digsig_verify_rsa(struct key *key,
  *
  */
 int digsig_verify(struct key *keyring, const char *sig, int siglen,
 						const char *data, int datalen)
 {
-	int err = -ENOMEM;
 	struct signature_hdr *sh = (struct signature_hdr *)sig;
-	struct shash_desc *desc = NULL;
+	struct sha1_ctx ctx;
 	unsigned char hash[SHA1_DIGEST_SIZE];
 	struct key *key;
 	char name[20];
+	int err;
 
 	if (siglen < sizeof(*sh) + 2)
 		return -EINVAL;
 
 	if (sh->algo != PUBKEY_ALGO_RSA)
@@ -229,51 +225,21 @@ int digsig_verify(struct key *keyring, const char *sig, int siglen,
 	if (IS_ERR(key)) {
 		pr_err("key not found, id: %s\n", name);
 		return PTR_ERR(key);
 	}
 
-	desc = kzalloc(sizeof(*desc) + crypto_shash_descsize(shash),
-		       GFP_KERNEL);
-	if (!desc)
-		goto err;
-
-	desc->tfm = shash;
-
-	crypto_shash_init(desc);
-	crypto_shash_update(desc, data, datalen);
-	crypto_shash_update(desc, sig, sizeof(*sh));
-	crypto_shash_final(desc, hash);
-
-	kfree(desc);
+	sha1_init(&ctx);
+	sha1_update(&ctx, data, datalen);
+	sha1_update(&ctx, sig, sizeof(*sh));
+	sha1_final(&ctx, hash);
 
 	/* pass signature mpis address */
 	err = digsig_verify_rsa(key, sig + sizeof(*sh), siglen - sizeof(*sh),
 			     hash, sizeof(hash));
 
-err:
 	key_put(key);
 
 	return err ? -EINVAL : 0;
 }
 EXPORT_SYMBOL_GPL(digsig_verify);
 
-static int __init digsig_init(void)
-{
-	shash = crypto_alloc_shash("sha1", 0, 0);
-	if (IS_ERR(shash)) {
-		pr_err("shash allocation failed\n");
-		return  PTR_ERR(shash);
-	}
-
-	return 0;
-
-}
-
-static void __exit digsig_cleanup(void)
-{
-	crypto_free_shash(shash);
-}
-
-module_init(digsig_init);
-module_exit(digsig_cleanup);
-
 MODULE_LICENSE("GPL");
-- 
2.50.1


