Return-Path: <linux-mips+bounces-9555-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C60CAEE351
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 18:06:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BFB817D710
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 16:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF3BC291C2E;
	Mon, 30 Jun 2025 16:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JF6sLCEV"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2DC291C0F;
	Mon, 30 Jun 2025 16:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751299524; cv=none; b=nXa06VUYAJY9/5tx6YtCEk0ynehnDK74kqR6bv62WIOR76Bgqm7xOtUv6VMEZ6lYo6Tqlow8Vhv2CBfspai6LppJeGXLDBbnn5U8GB/xsB9tOI/TNxeEh4B8ZcqfB587kuC4jJ5ux3DWRo+CtHGQECBRK4oBdeur/EgneeHgoZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751299524; c=relaxed/simple;
	bh=yvRIGyqN+DTv9LrLTgtWFFljA03UEvTyM+LQvlz7nbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PTIAocjlbYyuMmWHqEIi8D5zkpuBQWrd2aQu+ZndKzJyhputl+pm1ac+1ROF5Oy+Lbr8zMFhf+d+85uxRmOhYMXsmPc7i8eKqB+/x3nZeTlbzEBdPesfabo3TGBraUaQf7EL2XJzyo9WysHi99OfvQt7PkhSF+SXxriZg+aDi7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JF6sLCEV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE655C4CEE3;
	Mon, 30 Jun 2025 16:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299524;
	bh=yvRIGyqN+DTv9LrLTgtWFFljA03UEvTyM+LQvlz7nbU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JF6sLCEVPHvLGEuPZjbm5dMHGbYO276013+KylR+lU+34N38RlvZ42RwM+jRFK1MV
	 u8xjn1UFXDPm7PIL4nHCAfWMViFt004SOCu2qR7qavbU8C11cd3CBGh7LPhYCyHFdM
	 S/Co0+XU+sCnghgFhbAuhSgRFLtRTHw+mEPcp03oplTgiHja9j4YZ9LrltsmXpHkdr
	 BNep3sQ3JaRQ287J9p5zSP63hw//bT2hC0EoQ681rxu1ibjQQLgkkvWkI0FsqKDua9
	 i+KN+E94C2ETEGSMmp+Mc+NqY57WfjZMUy5hfLg+XX79HGBTXJdsZanl08l/oKY/+b
	 wlGCRh4OPMe4g==
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
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v3 05/16] crypto: sha512 - Replace sha512_generic with wrapper around SHA-512 library
Date: Mon, 30 Jun 2025 09:03:09 -0700
Message-ID: <20250630160320.2888-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630160320.2888-1-ebiggers@kernel.org>
References: <20250630160320.2888-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Delete crypto/sha512_generic.c, which provided "generic" SHA-384 and
SHA-512 crypto_shash algorithms.  Replace it with crypto/sha512.c which
provides SHA-384, SHA-512, HMAC-SHA384, and HMAC-SHA512 crypto_shash
algorithms using the corresponding library functions.

This is a prerequisite for migrating all the arch-optimized SHA-512 code
(which is almost 3000 lines) to lib/crypto/ rather than duplicating it.

Since the replacement crypto_shash algorithms are implemented using the
(potentially arch-optimized) library functions, give them
cra_driver_names ending with "-lib" rather than "-generic".  Update
crypto/testmgr.c and one odd driver to take this change in driver name
into account.  Besides these cases which are accounted for, there are no
known cases where the cra_driver_name was being depended on.

This change does mean that the abstract partial block handling code in
crypto/shash.c, which got added in 6.16, no longer gets used.  But
that's fine; the library has to implement the partial block handling
anyway, and it's better to do it in the library since the block size and
other properties of the algorithm are all fixed at compile time there,
resulting in more streamlined code.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 crypto/Kconfig                        |   4 +-
 crypto/Makefile                       |   2 +-
 crypto/sha512.c                       | 258 ++++++++++++++++++++++++++
 crypto/sha512_generic.c               | 217 ----------------------
 crypto/testmgr.c                      |  10 +
 drivers/crypto/starfive/jh7110-hash.c |   8 +-
 include/crypto/sha512_base.h          |   3 -
 7 files changed, 276 insertions(+), 226 deletions(-)
 create mode 100644 crypto/sha512.c
 delete mode 100644 crypto/sha512_generic.c

diff --git a/crypto/Kconfig b/crypto/Kconfig
index e1cfd0d4cc8f8..cb40a9b469722 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -1000,12 +1000,14 @@ config CRYPTO_SHA256
 	  Used by the btrfs filesystem, Ceph, NFS, and SMB.
 
 config CRYPTO_SHA512
 	tristate "SHA-384 and SHA-512"
 	select CRYPTO_HASH
+	select CRYPTO_LIB_SHA512
 	help
-	  SHA-384 and SHA-512 secure hash algorithms (FIPS 180, ISO/IEC 10118-3)
+	  SHA-384 and SHA-512 secure hash algorithms (FIPS 180, ISO/IEC
+	  10118-3), including HMAC support.
 
 config CRYPTO_SHA3
 	tristate "SHA-3"
 	select CRYPTO_HASH
 	help
diff --git a/crypto/Makefile b/crypto/Makefile
index 017df3a2e4bb3..271c77462cec9 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -76,11 +76,11 @@ obj-$(CONFIG_CRYPTO_MD4) += md4.o
 obj-$(CONFIG_CRYPTO_MD5) += md5.o
 obj-$(CONFIG_CRYPTO_RMD160) += rmd160.o
 obj-$(CONFIG_CRYPTO_SHA1) += sha1_generic.o
 obj-$(CONFIG_CRYPTO_SHA256) += sha256.o
 CFLAGS_sha256.o += -DARCH=$(ARCH)
-obj-$(CONFIG_CRYPTO_SHA512) += sha512_generic.o
+obj-$(CONFIG_CRYPTO_SHA512) += sha512.o
 obj-$(CONFIG_CRYPTO_SHA3) += sha3_generic.o
 obj-$(CONFIG_CRYPTO_SM3_GENERIC) += sm3_generic.o
 obj-$(CONFIG_CRYPTO_STREEBOG) += streebog_generic.o
 obj-$(CONFIG_CRYPTO_WP512) += wp512.o
 CFLAGS_wp512.o := $(call cc-option,-fno-schedule-insns)  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=79149
diff --git a/crypto/sha512.c b/crypto/sha512.c
new file mode 100644
index 0000000000000..d1e5400fe5906
--- /dev/null
+++ b/crypto/sha512.c
@@ -0,0 +1,258 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Crypto API support for SHA-384, SHA-512, HMAC-SHA384, and HMAC-SHA512
+ *
+ * Copyright (c) Jean-Luc Cooke <jlcooke@certainkey.com>
+ * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
+ * Copyright (c) 2003 Kyle McMartin <kyle@debian.org>
+ * Copyright 2025 Google LLC
+ */
+#include <crypto/internal/hash.h>
+#include <crypto/sha2.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+
+/* SHA-384 */
+
+const u8 sha384_zero_message_hash[SHA384_DIGEST_SIZE] = {
+	0x38, 0xb0, 0x60, 0xa7, 0x51, 0xac, 0x96, 0x38,
+	0x4c, 0xd9, 0x32, 0x7e, 0xb1, 0xb1, 0xe3, 0x6a,
+	0x21, 0xfd, 0xb7, 0x11, 0x14, 0xbe, 0x07, 0x43,
+	0x4c, 0x0c, 0xc7, 0xbf, 0x63, 0xf6, 0xe1, 0xda,
+	0x27, 0x4e, 0xde, 0xbf, 0xe7, 0x6f, 0x65, 0xfb,
+	0xd5, 0x1a, 0xd2, 0xf1, 0x48, 0x98, 0xb9, 0x5b
+};
+EXPORT_SYMBOL_GPL(sha384_zero_message_hash);
+
+#define SHA384_CTX(desc) ((struct sha384_ctx *)shash_desc_ctx(desc))
+
+static int crypto_sha384_init(struct shash_desc *desc)
+{
+	sha384_init(SHA384_CTX(desc));
+	return 0;
+}
+
+static int crypto_sha384_update(struct shash_desc *desc,
+				const u8 *data, unsigned int len)
+{
+	sha384_update(SHA384_CTX(desc), data, len);
+	return 0;
+}
+
+static int crypto_sha384_final(struct shash_desc *desc, u8 *out)
+{
+	sha384_final(SHA384_CTX(desc), out);
+	return 0;
+}
+
+static int crypto_sha384_digest(struct shash_desc *desc,
+				const u8 *data, unsigned int len, u8 *out)
+{
+	sha384(data, len, out);
+	return 0;
+}
+
+/* SHA-512 */
+
+const u8 sha512_zero_message_hash[SHA512_DIGEST_SIZE] = {
+	0xcf, 0x83, 0xe1, 0x35, 0x7e, 0xef, 0xb8, 0xbd,
+	0xf1, 0x54, 0x28, 0x50, 0xd6, 0x6d, 0x80, 0x07,
+	0xd6, 0x20, 0xe4, 0x05, 0x0b, 0x57, 0x15, 0xdc,
+	0x83, 0xf4, 0xa9, 0x21, 0xd3, 0x6c, 0xe9, 0xce,
+	0x47, 0xd0, 0xd1, 0x3c, 0x5d, 0x85, 0xf2, 0xb0,
+	0xff, 0x83, 0x18, 0xd2, 0x87, 0x7e, 0xec, 0x2f,
+	0x63, 0xb9, 0x31, 0xbd, 0x47, 0x41, 0x7a, 0x81,
+	0xa5, 0x38, 0x32, 0x7a, 0xf9, 0x27, 0xda, 0x3e
+};
+EXPORT_SYMBOL_GPL(sha512_zero_message_hash);
+
+#define SHA512_CTX(desc) ((struct sha512_ctx *)shash_desc_ctx(desc))
+
+static int crypto_sha512_init(struct shash_desc *desc)
+{
+	sha512_init(SHA512_CTX(desc));
+	return 0;
+}
+
+static int crypto_sha512_update(struct shash_desc *desc,
+				const u8 *data, unsigned int len)
+{
+	sha512_update(SHA512_CTX(desc), data, len);
+	return 0;
+}
+
+static int crypto_sha512_final(struct shash_desc *desc, u8 *out)
+{
+	sha512_final(SHA512_CTX(desc), out);
+	return 0;
+}
+
+static int crypto_sha512_digest(struct shash_desc *desc,
+				const u8 *data, unsigned int len, u8 *out)
+{
+	sha512(data, len, out);
+	return 0;
+}
+
+/* HMAC-SHA384 */
+
+#define HMAC_SHA384_KEY(tfm) ((struct hmac_sha384_key *)crypto_shash_ctx(tfm))
+#define HMAC_SHA384_CTX(desc) ((struct hmac_sha384_ctx *)shash_desc_ctx(desc))
+
+static int crypto_hmac_sha384_setkey(struct crypto_shash *tfm,
+				     const u8 *raw_key, unsigned int keylen)
+{
+	hmac_sha384_preparekey(HMAC_SHA384_KEY(tfm), raw_key, keylen);
+	return 0;
+}
+
+static int crypto_hmac_sha384_init(struct shash_desc *desc)
+{
+	hmac_sha384_init(HMAC_SHA384_CTX(desc), HMAC_SHA384_KEY(desc->tfm));
+	return 0;
+}
+
+static int crypto_hmac_sha384_update(struct shash_desc *desc,
+				     const u8 *data, unsigned int len)
+{
+	hmac_sha384_update(HMAC_SHA384_CTX(desc), data, len);
+	return 0;
+}
+
+static int crypto_hmac_sha384_final(struct shash_desc *desc, u8 *out)
+{
+	hmac_sha384_final(HMAC_SHA384_CTX(desc), out);
+	return 0;
+}
+
+static int crypto_hmac_sha384_digest(struct shash_desc *desc,
+				     const u8 *data, unsigned int len,
+				     u8 *out)
+{
+	hmac_sha384(HMAC_SHA384_KEY(desc->tfm), data, len, out);
+	return 0;
+}
+
+/* HMAC-SHA512 */
+
+#define HMAC_SHA512_KEY(tfm) ((struct hmac_sha512_key *)crypto_shash_ctx(tfm))
+#define HMAC_SHA512_CTX(desc) ((struct hmac_sha512_ctx *)shash_desc_ctx(desc))
+
+static int crypto_hmac_sha512_setkey(struct crypto_shash *tfm,
+				     const u8 *raw_key, unsigned int keylen)
+{
+	hmac_sha512_preparekey(HMAC_SHA512_KEY(tfm), raw_key, keylen);
+	return 0;
+}
+
+static int crypto_hmac_sha512_init(struct shash_desc *desc)
+{
+	hmac_sha512_init(HMAC_SHA512_CTX(desc), HMAC_SHA512_KEY(desc->tfm));
+	return 0;
+}
+
+static int crypto_hmac_sha512_update(struct shash_desc *desc,
+				     const u8 *data, unsigned int len)
+{
+	hmac_sha512_update(HMAC_SHA512_CTX(desc), data, len);
+	return 0;
+}
+
+static int crypto_hmac_sha512_final(struct shash_desc *desc, u8 *out)
+{
+	hmac_sha512_final(HMAC_SHA512_CTX(desc), out);
+	return 0;
+}
+
+static int crypto_hmac_sha512_digest(struct shash_desc *desc,
+				     const u8 *data, unsigned int len,
+				     u8 *out)
+{
+	hmac_sha512(HMAC_SHA512_KEY(desc->tfm), data, len, out);
+	return 0;
+}
+
+/* Algorithm definitions */
+
+static struct shash_alg algs[] = {
+	{
+		.base.cra_name		= "sha384",
+		.base.cra_driver_name	= "sha384-lib",
+		.base.cra_priority	= 300,
+		.base.cra_blocksize	= SHA384_BLOCK_SIZE,
+		.base.cra_module	= THIS_MODULE,
+		.digestsize		= SHA384_DIGEST_SIZE,
+		.init			= crypto_sha384_init,
+		.update			= crypto_sha384_update,
+		.final			= crypto_sha384_final,
+		.digest			= crypto_sha384_digest,
+		.descsize		= sizeof(struct sha384_ctx),
+	},
+	{
+		.base.cra_name		= "sha512",
+		.base.cra_driver_name	= "sha512-lib",
+		.base.cra_priority	= 300,
+		.base.cra_blocksize	= SHA512_BLOCK_SIZE,
+		.base.cra_module	= THIS_MODULE,
+		.digestsize		= SHA512_DIGEST_SIZE,
+		.init			= crypto_sha512_init,
+		.update			= crypto_sha512_update,
+		.final			= crypto_sha512_final,
+		.digest			= crypto_sha512_digest,
+		.descsize		= sizeof(struct sha512_ctx),
+	},
+	{
+		.base.cra_name		= "hmac(sha384)",
+		.base.cra_driver_name	= "hmac-sha384-lib",
+		.base.cra_priority	= 300,
+		.base.cra_blocksize	= SHA384_BLOCK_SIZE,
+		.base.cra_ctxsize	= sizeof(struct hmac_sha384_key),
+		.base.cra_module	= THIS_MODULE,
+		.digestsize		= SHA384_DIGEST_SIZE,
+		.setkey			= crypto_hmac_sha384_setkey,
+		.init			= crypto_hmac_sha384_init,
+		.update			= crypto_hmac_sha384_update,
+		.final			= crypto_hmac_sha384_final,
+		.digest			= crypto_hmac_sha384_digest,
+		.descsize		= sizeof(struct hmac_sha384_ctx),
+	},
+	{
+		.base.cra_name		= "hmac(sha512)",
+		.base.cra_driver_name	= "hmac-sha512-lib",
+		.base.cra_priority	= 300,
+		.base.cra_blocksize	= SHA512_BLOCK_SIZE,
+		.base.cra_ctxsize	= sizeof(struct hmac_sha512_key),
+		.base.cra_module	= THIS_MODULE,
+		.digestsize		= SHA512_DIGEST_SIZE,
+		.setkey			= crypto_hmac_sha512_setkey,
+		.init			= crypto_hmac_sha512_init,
+		.update			= crypto_hmac_sha512_update,
+		.final			= crypto_hmac_sha512_final,
+		.digest			= crypto_hmac_sha512_digest,
+		.descsize		= sizeof(struct hmac_sha512_ctx),
+	},
+};
+
+static int __init crypto_sha512_mod_init(void)
+{
+	return crypto_register_shashes(algs, ARRAY_SIZE(algs));
+}
+module_init(crypto_sha512_mod_init);
+
+static void __exit crypto_sha512_mod_exit(void)
+{
+	crypto_unregister_shashes(algs, ARRAY_SIZE(algs));
+}
+module_exit(crypto_sha512_mod_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Crypto API support for SHA-384, SHA-512, HMAC-SHA384, and HMAC-SHA512");
+
+MODULE_ALIAS_CRYPTO("sha384");
+MODULE_ALIAS_CRYPTO("sha384-lib");
+MODULE_ALIAS_CRYPTO("sha512");
+MODULE_ALIAS_CRYPTO("sha512-lib");
+MODULE_ALIAS_CRYPTO("hmac(sha384)");
+MODULE_ALIAS_CRYPTO("hmac-sha384-lib");
+MODULE_ALIAS_CRYPTO("hmac(sha512)");
+MODULE_ALIAS_CRYPTO("hmac-sha512-lib");
diff --git a/crypto/sha512_generic.c b/crypto/sha512_generic.c
deleted file mode 100644
index 7368173f545eb..0000000000000
--- a/crypto/sha512_generic.c
+++ /dev/null
@@ -1,217 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/* SHA-512 code by Jean-Luc Cooke <jlcooke@certainkey.com>
- *
- * Copyright (c) Jean-Luc Cooke <jlcooke@certainkey.com>
- * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
- * Copyright (c) 2003 Kyle McMartin <kyle@debian.org>
- */
-#include <crypto/internal/hash.h>
-#include <crypto/sha2.h>
-#include <crypto/sha512_base.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/unaligned.h>
-
-const u8 sha384_zero_message_hash[SHA384_DIGEST_SIZE] = {
-	0x38, 0xb0, 0x60, 0xa7, 0x51, 0xac, 0x96, 0x38,
-	0x4c, 0xd9, 0x32, 0x7e, 0xb1, 0xb1, 0xe3, 0x6a,
-	0x21, 0xfd, 0xb7, 0x11, 0x14, 0xbe, 0x07, 0x43,
-	0x4c, 0x0c, 0xc7, 0xbf, 0x63, 0xf6, 0xe1, 0xda,
-	0x27, 0x4e, 0xde, 0xbf, 0xe7, 0x6f, 0x65, 0xfb,
-	0xd5, 0x1a, 0xd2, 0xf1, 0x48, 0x98, 0xb9, 0x5b
-};
-EXPORT_SYMBOL_GPL(sha384_zero_message_hash);
-
-const u8 sha512_zero_message_hash[SHA512_DIGEST_SIZE] = {
-	0xcf, 0x83, 0xe1, 0x35, 0x7e, 0xef, 0xb8, 0xbd,
-	0xf1, 0x54, 0x28, 0x50, 0xd6, 0x6d, 0x80, 0x07,
-	0xd6, 0x20, 0xe4, 0x05, 0x0b, 0x57, 0x15, 0xdc,
-	0x83, 0xf4, 0xa9, 0x21, 0xd3, 0x6c, 0xe9, 0xce,
-	0x47, 0xd0, 0xd1, 0x3c, 0x5d, 0x85, 0xf2, 0xb0,
-	0xff, 0x83, 0x18, 0xd2, 0x87, 0x7e, 0xec, 0x2f,
-	0x63, 0xb9, 0x31, 0xbd, 0x47, 0x41, 0x7a, 0x81,
-	0xa5, 0x38, 0x32, 0x7a, 0xf9, 0x27, 0xda, 0x3e
-};
-EXPORT_SYMBOL_GPL(sha512_zero_message_hash);
-
-static inline u64 Ch(u64 x, u64 y, u64 z)
-{
-        return z ^ (x & (y ^ z));
-}
-
-static inline u64 Maj(u64 x, u64 y, u64 z)
-{
-        return (x & y) | (z & (x | y));
-}
-
-static const u64 sha512_K[80] = {
-        0x428a2f98d728ae22ULL, 0x7137449123ef65cdULL, 0xb5c0fbcfec4d3b2fULL,
-        0xe9b5dba58189dbbcULL, 0x3956c25bf348b538ULL, 0x59f111f1b605d019ULL,
-        0x923f82a4af194f9bULL, 0xab1c5ed5da6d8118ULL, 0xd807aa98a3030242ULL,
-        0x12835b0145706fbeULL, 0x243185be4ee4b28cULL, 0x550c7dc3d5ffb4e2ULL,
-        0x72be5d74f27b896fULL, 0x80deb1fe3b1696b1ULL, 0x9bdc06a725c71235ULL,
-        0xc19bf174cf692694ULL, 0xe49b69c19ef14ad2ULL, 0xefbe4786384f25e3ULL,
-        0x0fc19dc68b8cd5b5ULL, 0x240ca1cc77ac9c65ULL, 0x2de92c6f592b0275ULL,
-        0x4a7484aa6ea6e483ULL, 0x5cb0a9dcbd41fbd4ULL, 0x76f988da831153b5ULL,
-        0x983e5152ee66dfabULL, 0xa831c66d2db43210ULL, 0xb00327c898fb213fULL,
-        0xbf597fc7beef0ee4ULL, 0xc6e00bf33da88fc2ULL, 0xd5a79147930aa725ULL,
-        0x06ca6351e003826fULL, 0x142929670a0e6e70ULL, 0x27b70a8546d22ffcULL,
-        0x2e1b21385c26c926ULL, 0x4d2c6dfc5ac42aedULL, 0x53380d139d95b3dfULL,
-        0x650a73548baf63deULL, 0x766a0abb3c77b2a8ULL, 0x81c2c92e47edaee6ULL,
-        0x92722c851482353bULL, 0xa2bfe8a14cf10364ULL, 0xa81a664bbc423001ULL,
-        0xc24b8b70d0f89791ULL, 0xc76c51a30654be30ULL, 0xd192e819d6ef5218ULL,
-        0xd69906245565a910ULL, 0xf40e35855771202aULL, 0x106aa07032bbd1b8ULL,
-        0x19a4c116b8d2d0c8ULL, 0x1e376c085141ab53ULL, 0x2748774cdf8eeb99ULL,
-        0x34b0bcb5e19b48a8ULL, 0x391c0cb3c5c95a63ULL, 0x4ed8aa4ae3418acbULL,
-        0x5b9cca4f7763e373ULL, 0x682e6ff3d6b2b8a3ULL, 0x748f82ee5defb2fcULL,
-        0x78a5636f43172f60ULL, 0x84c87814a1f0ab72ULL, 0x8cc702081a6439ecULL,
-        0x90befffa23631e28ULL, 0xa4506cebde82bde9ULL, 0xbef9a3f7b2c67915ULL,
-        0xc67178f2e372532bULL, 0xca273eceea26619cULL, 0xd186b8c721c0c207ULL,
-        0xeada7dd6cde0eb1eULL, 0xf57d4f7fee6ed178ULL, 0x06f067aa72176fbaULL,
-        0x0a637dc5a2c898a6ULL, 0x113f9804bef90daeULL, 0x1b710b35131c471bULL,
-        0x28db77f523047d84ULL, 0x32caab7b40c72493ULL, 0x3c9ebe0a15c9bebcULL,
-        0x431d67c49c100d4cULL, 0x4cc5d4becb3e42b6ULL, 0x597f299cfc657e2aULL,
-        0x5fcb6fab3ad6faecULL, 0x6c44198c4a475817ULL,
-};
-
-#define e0(x)       (ror64(x,28) ^ ror64(x,34) ^ ror64(x,39))
-#define e1(x)       (ror64(x,14) ^ ror64(x,18) ^ ror64(x,41))
-#define s0(x)       (ror64(x, 1) ^ ror64(x, 8) ^ (x >> 7))
-#define s1(x)       (ror64(x,19) ^ ror64(x,61) ^ (x >> 6))
-
-static inline void LOAD_OP(int I, u64 *W, const u8 *input)
-{
-	W[I] = get_unaligned_be64((__u64 *)input + I);
-}
-
-static inline void BLEND_OP(int I, u64 *W)
-{
-	W[I & 15] += s1(W[(I-2) & 15]) + W[(I-7) & 15] + s0(W[(I-15) & 15]);
-}
-
-static void
-sha512_transform(u64 *state, const u8 *input)
-{
-	u64 a, b, c, d, e, f, g, h, t1, t2;
-
-	int i;
-	u64 W[16];
-
-	/* load the state into our registers */
-	a=state[0];   b=state[1];   c=state[2];   d=state[3];
-	e=state[4];   f=state[5];   g=state[6];   h=state[7];
-
-	/* now iterate */
-	for (i=0; i<80; i+=8) {
-		if (!(i & 8)) {
-			int j;
-
-			if (i < 16) {
-				/* load the input */
-				for (j = 0; j < 16; j++)
-					LOAD_OP(i + j, W, input);
-			} else {
-				for (j = 0; j < 16; j++) {
-					BLEND_OP(i + j, W);
-				}
-			}
-		}
-
-		t1 = h + e1(e) + Ch(e,f,g) + sha512_K[i  ] + W[(i & 15)];
-		t2 = e0(a) + Maj(a,b,c);    d+=t1;    h=t1+t2;
-		t1 = g + e1(d) + Ch(d,e,f) + sha512_K[i+1] + W[(i & 15) + 1];
-		t2 = e0(h) + Maj(h,a,b);    c+=t1;    g=t1+t2;
-		t1 = f + e1(c) + Ch(c,d,e) + sha512_K[i+2] + W[(i & 15) + 2];
-		t2 = e0(g) + Maj(g,h,a);    b+=t1;    f=t1+t2;
-		t1 = e + e1(b) + Ch(b,c,d) + sha512_K[i+3] + W[(i & 15) + 3];
-		t2 = e0(f) + Maj(f,g,h);    a+=t1;    e=t1+t2;
-		t1 = d + e1(a) + Ch(a,b,c) + sha512_K[i+4] + W[(i & 15) + 4];
-		t2 = e0(e) + Maj(e,f,g);    h+=t1;    d=t1+t2;
-		t1 = c + e1(h) + Ch(h,a,b) + sha512_K[i+5] + W[(i & 15) + 5];
-		t2 = e0(d) + Maj(d,e,f);    g+=t1;    c=t1+t2;
-		t1 = b + e1(g) + Ch(g,h,a) + sha512_K[i+6] + W[(i & 15) + 6];
-		t2 = e0(c) + Maj(c,d,e);    f+=t1;    b=t1+t2;
-		t1 = a + e1(f) + Ch(f,g,h) + sha512_K[i+7] + W[(i & 15) + 7];
-		t2 = e0(b) + Maj(b,c,d);    e+=t1;    a=t1+t2;
-	}
-
-	state[0] += a; state[1] += b; state[2] += c; state[3] += d;
-	state[4] += e; state[5] += f; state[6] += g; state[7] += h;
-}
-
-void sha512_generic_block_fn(struct sha512_state *sst, u8 const *src,
-			     int blocks)
-{
-	do {
-		sha512_transform(sst->state, src);
-		src += SHA512_BLOCK_SIZE;
-	} while (--blocks);
-}
-EXPORT_SYMBOL_GPL(sha512_generic_block_fn);
-
-static int crypto_sha512_update(struct shash_desc *desc, const u8 *data,
-				unsigned int len)
-{
-	return sha512_base_do_update_blocks(desc, data, len,
-					    sha512_generic_block_fn);
-}
-
-static int crypto_sha512_finup(struct shash_desc *desc, const u8 *data,
-			       unsigned int len, u8 *hash)
-{
-	sha512_base_do_finup(desc, data, len, sha512_generic_block_fn);
-	return sha512_base_finish(desc, hash);
-}
-
-static struct shash_alg sha512_algs[2] = { {
-	.digestsize	=	SHA512_DIGEST_SIZE,
-	.init		=	sha512_base_init,
-	.update		=	crypto_sha512_update,
-	.finup		=	crypto_sha512_finup,
-	.descsize	=	SHA512_STATE_SIZE,
-	.base		=	{
-		.cra_name	=	"sha512",
-		.cra_driver_name =	"sha512-generic",
-		.cra_priority	=	100,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY |
-					CRYPTO_AHASH_ALG_FINUP_MAX,
-		.cra_blocksize	=	SHA512_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-}, {
-	.digestsize	=	SHA384_DIGEST_SIZE,
-	.init		=	sha384_base_init,
-	.update		=	crypto_sha512_update,
-	.finup		=	crypto_sha512_finup,
-	.descsize	=	SHA512_STATE_SIZE,
-	.base		=	{
-		.cra_name	=	"sha384",
-		.cra_driver_name =	"sha384-generic",
-		.cra_priority	=	100,
-		.cra_flags	=	CRYPTO_AHASH_ALG_BLOCK_ONLY |
-					CRYPTO_AHASH_ALG_FINUP_MAX,
-		.cra_blocksize	=	SHA384_BLOCK_SIZE,
-		.cra_module	=	THIS_MODULE,
-	}
-} };
-
-static int __init sha512_generic_mod_init(void)
-{
-	return crypto_register_shashes(sha512_algs, ARRAY_SIZE(sha512_algs));
-}
-
-static void __exit sha512_generic_mod_fini(void)
-{
-	crypto_unregister_shashes(sha512_algs, ARRAY_SIZE(sha512_algs));
-}
-
-module_init(sha512_generic_mod_init);
-module_exit(sha512_generic_mod_fini);
-
-MODULE_LICENSE("GPL");
-MODULE_DESCRIPTION("SHA-512 and SHA-384 Secure Hash Algorithms");
-
-MODULE_ALIAS_CRYPTO("sha384");
-MODULE_ALIAS_CRYPTO("sha384-generic");
-MODULE_ALIAS_CRYPTO("sha512");
-MODULE_ALIAS_CRYPTO("sha512-generic");
diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index 32f753d6c4302..9d8b11ea4af7f 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -4313,49 +4313,55 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.alg = "authenc(hmac(sha256),rfc3686(ctr(aes)))",
 		.test = alg_test_null,
 		.fips_allowed = 1,
 	}, {
 		.alg = "authenc(hmac(sha384),cbc(des))",
+		.generic_driver = "authenc(hmac-sha384-lib,cbc(des-generic))",
 		.test = alg_test_aead,
 		.suite = {
 			.aead = __VECS(hmac_sha384_des_cbc_tv_temp)
 		}
 	}, {
 		.alg = "authenc(hmac(sha384),cbc(des3_ede))",
+		.generic_driver = "authenc(hmac-sha384-lib,cbc(des3_ede-generic))",
 		.test = alg_test_aead,
 		.suite = {
 			.aead = __VECS(hmac_sha384_des3_ede_cbc_tv_temp)
 		}
 	}, {
 		.alg = "authenc(hmac(sha384),ctr(aes))",
 		.test = alg_test_null,
 		.fips_allowed = 1,
 	}, {
 		.alg = "authenc(hmac(sha384),cts(cbc(aes)))",
+		.generic_driver = "authenc(hmac-sha384-lib,cts(cbc(aes-generic)))",
 		.test = alg_test_aead,
 		.suite = {
 			.aead = __VECS(krb5_test_aes256_cts_hmac_sha384_192)
 		}
 	}, {
 		.alg = "authenc(hmac(sha384),rfc3686(ctr(aes)))",
 		.test = alg_test_null,
 		.fips_allowed = 1,
 	}, {
 		.alg = "authenc(hmac(sha512),cbc(aes))",
+		.generic_driver = "authenc(hmac-sha512-lib,cbc(aes-generic))",
 		.fips_allowed = 1,
 		.test = alg_test_aead,
 		.suite = {
 			.aead = __VECS(hmac_sha512_aes_cbc_tv_temp)
 		}
 	}, {
 		.alg = "authenc(hmac(sha512),cbc(des))",
+		.generic_driver = "authenc(hmac-sha512-lib,cbc(des-generic))",
 		.test = alg_test_aead,
 		.suite = {
 			.aead = __VECS(hmac_sha512_des_cbc_tv_temp)
 		}
 	}, {
 		.alg = "authenc(hmac(sha512),cbc(des3_ede))",
+		.generic_driver = "authenc(hmac-sha512-lib,cbc(des3_ede-generic))",
 		.test = alg_test_aead,
 		.suite = {
 			.aead = __VECS(hmac_sha512_des3_ede_cbc_tv_temp)
 		}
 	}, {
@@ -5155,17 +5161,19 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.suite = {
 			.hash = __VECS(hmac_sha3_512_tv_template)
 		}
 	}, {
 		.alg = "hmac(sha384)",
+		.generic_driver = "hmac-sha384-lib",
 		.test = alg_test_hash,
 		.fips_allowed = 1,
 		.suite = {
 			.hash = __VECS(hmac_sha384_tv_template)
 		}
 	}, {
 		.alg = "hmac(sha512)",
+		.generic_driver = "hmac-sha512-lib",
 		.test = alg_test_hash,
 		.fips_allowed = 1,
 		.suite = {
 			.hash = __VECS(hmac_sha512_tv_template)
 		}
@@ -5491,17 +5499,19 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.suite = {
 			.hash = __VECS(sha3_512_tv_template)
 		}
 	}, {
 		.alg = "sha384",
+		.generic_driver = "sha384-lib",
 		.test = alg_test_hash,
 		.fips_allowed = 1,
 		.suite = {
 			.hash = __VECS(sha384_tv_template)
 		}
 	}, {
 		.alg = "sha512",
+		.generic_driver = "sha512-lib",
 		.test = alg_test_hash,
 		.fips_allowed = 1,
 		.suite = {
 			.hash = __VECS(sha512_tv_template)
 		}
diff --git a/drivers/crypto/starfive/jh7110-hash.c b/drivers/crypto/starfive/jh7110-hash.c
index 2c60a1047bc39..4abbff07412ff 100644
--- a/drivers/crypto/starfive/jh7110-hash.c
+++ b/drivers/crypto/starfive/jh7110-hash.c
@@ -503,17 +503,17 @@ static int starfive_sha256_init_tfm(struct crypto_ahash *hash)
 				      STARFIVE_HASH_SHA256, 0);
 }
 
 static int starfive_sha384_init_tfm(struct crypto_ahash *hash)
 {
-	return starfive_hash_init_tfm(hash, "sha384-generic",
+	return starfive_hash_init_tfm(hash, "sha384-lib",
 				      STARFIVE_HASH_SHA384, 0);
 }
 
 static int starfive_sha512_init_tfm(struct crypto_ahash *hash)
 {
-	return starfive_hash_init_tfm(hash, "sha512-generic",
+	return starfive_hash_init_tfm(hash, "sha512-lib",
 				      STARFIVE_HASH_SHA512, 0);
 }
 
 static int starfive_sm3_init_tfm(struct crypto_ahash *hash)
 {
@@ -533,17 +533,17 @@ static int starfive_hmac_sha256_init_tfm(struct crypto_ahash *hash)
 				      STARFIVE_HASH_SHA256, 1);
 }
 
 static int starfive_hmac_sha384_init_tfm(struct crypto_ahash *hash)
 {
-	return starfive_hash_init_tfm(hash, "hmac(sha384-generic)",
+	return starfive_hash_init_tfm(hash, "hmac-sha384-lib",
 				      STARFIVE_HASH_SHA384, 1);
 }
 
 static int starfive_hmac_sha512_init_tfm(struct crypto_ahash *hash)
 {
-	return starfive_hash_init_tfm(hash, "hmac(sha512-generic)",
+	return starfive_hash_init_tfm(hash, "hmac-sha512-lib",
 				      STARFIVE_HASH_SHA512, 1);
 }
 
 static int starfive_hmac_sm3_init_tfm(struct crypto_ahash *hash)
 {
diff --git a/include/crypto/sha512_base.h b/include/crypto/sha512_base.h
index aa814bab442d4..d1361b3eb70b0 100644
--- a/include/crypto/sha512_base.h
+++ b/include/crypto/sha512_base.h
@@ -112,9 +112,6 @@ static inline int sha512_base_finish(struct shash_desc *desc, u8 *out)
 	for (i = 0; digest_size > 0; i++, digest_size -= sizeof(__be64))
 		put_unaligned_be64(sctx->state[i], digest++);
 	return 0;
 }
 
-void sha512_generic_block_fn(struct sha512_state *sst, u8 const *src,
-			     int blocks);
-
 #endif /* _CRYPTO_SHA512_BASE_H */
-- 
2.50.0


