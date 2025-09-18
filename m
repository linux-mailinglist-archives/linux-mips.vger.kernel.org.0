Return-Path: <linux-mips+bounces-9979-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC16B19555
	for <lists+linux-mips@lfdr.de>; Sun,  3 Aug 2025 22:47:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8C813A9871
	for <lists+linux-mips@lfdr.de>; Sun,  3 Aug 2025 20:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 645B22264B5;
	Sun,  3 Aug 2025 20:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VUXiCPfP"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359E9225417;
	Sun,  3 Aug 2025 20:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754253938; cv=none; b=mdqILjX0k04+cfsUInUT9MzbSBX0V+eQuRJlQhZGF8n9KmMenKfGZX9Gal+KvTuSBuO2OO+dLl7YPHA4QC7X2dcrN3SkPBphPrtLGO3fdHKLzplGS9CyWBeXWIqX5YlBBWxiG/UPSWIuNLSLaXqKEFf5Cf4dEBdMpHI3ca8Q/hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754253938; c=relaxed/simple;
	bh=boThjt8cR7TxwRjjaFjdaDJhkGbA4kE6Mndg6Kr8QuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=muaGbHJsp3sisTxFxqnm7en0E8y7vj1Esfx5YDk/pZg4t4G4hN6MAzRS8KaQ6mgbefHaswuVL/qeAzu9Fr5nv6P5IVZH1L4t3LKLY+XhwVZ/L84SaNdakMhFYN/lQIYuWmNdY2x6MnivYoRU428UR4eu8PD3RcjFCvz0nubHoGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VUXiCPfP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B487C4CEF9;
	Sun,  3 Aug 2025 20:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754253935;
	bh=boThjt8cR7TxwRjjaFjdaDJhkGbA4kE6Mndg6Kr8QuE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VUXiCPfPD93bd9FYKlJYo5VE1L3Vtp70mitexZQ/xQUiX7/AtdAwjmFCjnGZTeiLJ
	 FtuWf2ZYSozY8l7BTOQGmwbiGVQcEfnArJcC2shQsXP7wH0zokAFQsk1RgXW7lGgJF
	 RwhNNxnJwwJKIOHZPDASOV3WT8T5wBMTh1Z9lrQIXVQOg3Qa70nzP2Gq90KsS1YS/O
	 iM0SC6XVat7wu1BPipPdk54QNT7NoUuaLFl+GIG64YGWymlKdAyZIe3u3CqmMVizuT
	 v8zd44Bt8jio5UrS7+b5Cz3j0Azs6gY9mExSs9uMoHR+74UfJms1JZGmTti9DAVuwa
	 8lV9f4HcEuFkA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 7/7] lib/crypto: tests: Add KUnit tests for MD5 and HMAC-MD5
Date: Sun,  3 Aug 2025 13:44:33 -0700
Message-ID: <20250803204433.75703-8-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803204433.75703-1-ebiggers@kernel.org>
References: <20250803204433.75703-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a KUnit test suite for the MD5 library functions, including the
corresponding HMAC support.  The core test logic is in the
previously-added hash-test-template.h.  This commit just adds the actual
KUnit suite, and it adds the generated test vectors to the tree so that
gen-hash-testvecs.py won't have to be run at build time.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/tests/Kconfig        |  10 ++
 lib/crypto/tests/Makefile       |   1 +
 lib/crypto/tests/md5-testvecs.h | 186 ++++++++++++++++++++++++++++++++
 lib/crypto/tests/md5_kunit.c    |  39 +++++++
 4 files changed, 236 insertions(+)
 create mode 100644 lib/crypto/tests/md5-testvecs.h
 create mode 100644 lib/crypto/tests/md5_kunit.c

diff --git a/lib/crypto/tests/Kconfig b/lib/crypto/tests/Kconfig
index de7e8babb6afc..c21d53fd4b0ce 100644
--- a/lib/crypto/tests/Kconfig
+++ b/lib/crypto/tests/Kconfig
@@ -1,7 +1,17 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 
+config CRYPTO_LIB_MD5_KUNIT_TEST
+	tristate "KUnit tests for MD5" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS || CRYPTO_SELFTESTS
+	select CRYPTO_LIB_BENCHMARK_VISIBLE
+	select CRYPTO_LIB_MD5
+	help
+	  KUnit tests for the MD5 cryptographic hash function and its
+	  corresponding HMAC.
+
 config CRYPTO_LIB_POLY1305_KUNIT_TEST
 	tristate "KUnit tests for Poly1305" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS || CRYPTO_SELFTESTS
 	select CRYPTO_LIB_BENCHMARK_VISIBLE
diff --git a/lib/crypto/tests/Makefile b/lib/crypto/tests/Makefile
index 8601dccd6fdda..f6f82c6f9cb5d 100644
--- a/lib/crypto/tests/Makefile
+++ b/lib/crypto/tests/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 
+obj-$(CONFIG_CRYPTO_LIB_MD5_KUNIT_TEST) += md5_kunit.o
 obj-$(CONFIG_CRYPTO_LIB_POLY1305_KUNIT_TEST) += poly1305_kunit.o
 obj-$(CONFIG_CRYPTO_LIB_SHA1_KUNIT_TEST) += sha1_kunit.o
 obj-$(CONFIG_CRYPTO_LIB_SHA256_KUNIT_TEST) += sha224_kunit.o sha256_kunit.o
 obj-$(CONFIG_CRYPTO_LIB_SHA512_KUNIT_TEST) += sha384_kunit.o sha512_kunit.o
diff --git a/lib/crypto/tests/md5-testvecs.h b/lib/crypto/tests/md5-testvecs.h
new file mode 100644
index 0000000000000..be6727feb2966
--- /dev/null
+++ b/lib/crypto/tests/md5-testvecs.h
@@ -0,0 +1,186 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* This file was generated by: ./scripts/crypto/gen-hash-testvecs.py md5 */
+
+static const struct {
+	size_t data_len;
+	u8 digest[MD5_DIGEST_SIZE];
+} hash_testvecs[] = {
+	{
+		.data_len = 0,
+		.digest = {
+			0xd4, 0x1d, 0x8c, 0xd9, 0x8f, 0x00, 0xb2, 0x04,
+			0xe9, 0x80, 0x09, 0x98, 0xec, 0xf8, 0x42, 0x7e,
+		},
+	},
+	{
+		.data_len = 1,
+		.digest = {
+			0x16, 0x7b, 0x86, 0xf2, 0x1d, 0xf3, 0x76, 0xc9,
+			0x6f, 0x10, 0xa0, 0x61, 0x5b, 0x14, 0x20, 0x0b,
+		},
+	},
+	{
+		.data_len = 2,
+		.digest = {
+			0x2d, 0x30, 0x96, 0xc7, 0x43, 0x40, 0xed, 0xb2,
+			0xfb, 0x84, 0x63, 0x9a, 0xec, 0xc7, 0x3c, 0x3c,
+		},
+	},
+	{
+		.data_len = 3,
+		.digest = {
+			0xe5, 0x0f, 0xce, 0xe0, 0xc8, 0xff, 0x4e, 0x08,
+			0x5e, 0x19, 0xe5, 0xf2, 0x08, 0x11, 0x19, 0x16,
+		},
+	},
+	{
+		.data_len = 16,
+		.digest = {
+			0xe8, 0xca, 0x29, 0x05, 0x2f, 0xd1, 0xf3, 0x99,
+			0x40, 0x71, 0xf5, 0xc2, 0xf7, 0xf8, 0x17, 0x3e,
+		},
+	},
+	{
+		.data_len = 32,
+		.digest = {
+			0xe3, 0x20, 0xc1, 0xd8, 0x21, 0x14, 0x44, 0x59,
+			0x1a, 0xf5, 0x91, 0xaf, 0x69, 0xbe, 0x93, 0x9d,
+		},
+	},
+	{
+		.data_len = 48,
+		.digest = {
+			0xfb, 0x06, 0xb0, 0xf0, 0x00, 0x10, 0x4b, 0x68,
+			0x3d, 0x75, 0xf9, 0x70, 0xde, 0xbb, 0x32, 0x16,
+		},
+	},
+	{
+		.data_len = 49,
+		.digest = {
+			0x52, 0x86, 0x48, 0x8b, 0xae, 0x91, 0x7c, 0x4e,
+			0xc2, 0x2a, 0x69, 0x07, 0x35, 0xcc, 0xb2, 0x88,
+		},
+	},
+	{
+		.data_len = 63,
+		.digest = {
+			0xfa, 0xd3, 0xf6, 0xe6, 0x7b, 0x1a, 0xc6, 0x05,
+			0x73, 0x35, 0x02, 0xab, 0xc7, 0xb3, 0x47, 0xcb,
+		},
+	},
+	{
+		.data_len = 64,
+		.digest = {
+			0xc5, 0x59, 0x29, 0xe9, 0x0a, 0x4a, 0x86, 0x43,
+			0x7c, 0xaf, 0xdf, 0x83, 0xd3, 0xb8, 0x33, 0x5f,
+		},
+	},
+	{
+		.data_len = 65,
+		.digest = {
+			0x80, 0x05, 0x75, 0x39, 0xec, 0x44, 0x8a, 0x81,
+			0xe7, 0x6e, 0x8d, 0xd1, 0xc6, 0xeb, 0xc2, 0xf0,
+		},
+	},
+	{
+		.data_len = 127,
+		.digest = {
+			0x3f, 0x02, 0xe8, 0xc6, 0xb8, 0x6a, 0x39, 0xc3,
+			0xa4, 0x1c, 0xd9, 0x8f, 0x4a, 0x71, 0x40, 0x30,
+		},
+	},
+	{
+		.data_len = 128,
+		.digest = {
+			0x89, 0x4f, 0x79, 0x3e, 0xff, 0x0c, 0x22, 0x60,
+			0xa2, 0xdc, 0x10, 0x5f, 0x23, 0x0a, 0xe7, 0xc6,
+		},
+	},
+	{
+		.data_len = 129,
+		.digest = {
+			0x06, 0x56, 0x61, 0xb8, 0x8a, 0x82, 0x77, 0x1b,
+			0x2c, 0x35, 0xb8, 0x9f, 0xd6, 0xf7, 0xbd, 0x5a,
+		},
+	},
+	{
+		.data_len = 256,
+		.digest = {
+			0x5d, 0xdf, 0x7d, 0xc8, 0x43, 0x96, 0x3b, 0xdb,
+			0xc7, 0x0e, 0x44, 0x42, 0x23, 0xf7, 0xed, 0xdf,
+		},
+	},
+	{
+		.data_len = 511,
+		.digest = {
+			0xf6, 0x5f, 0x26, 0x51, 0x8a, 0x5a, 0x46, 0x8f,
+			0x48, 0x72, 0x90, 0x74, 0x9d, 0x87, 0xbd, 0xdf,
+		},
+	},
+	{
+		.data_len = 513,
+		.digest = {
+			0xd8, 0x2c, 0xc9, 0x76, 0xfa, 0x67, 0x2e, 0xa6,
+			0xc8, 0x12, 0x4a, 0x64, 0xaa, 0x0b, 0x3d, 0xbd,
+		},
+	},
+	{
+		.data_len = 1000,
+		.digest = {
+			0xe2, 0x7e, 0xb4, 0x5f, 0xe1, 0x74, 0x51, 0xfc,
+			0xe0, 0xc8, 0xd5, 0xe6, 0x8b, 0x40, 0xd2, 0x0e,
+		},
+	},
+	{
+		.data_len = 3333,
+		.digest = {
+			0xcd, 0x7d, 0x56, 0xa9, 0x4c, 0x47, 0xea, 0xc2,
+			0x34, 0x0b, 0x84, 0x05, 0xf9, 0xad, 0xbb, 0x46,
+		},
+	},
+	{
+		.data_len = 4096,
+		.digest = {
+			0x63, 0x6e, 0x58, 0xb3, 0x94, 0x6b, 0x83, 0x5f,
+			0x1f, 0x0e, 0xd3, 0x66, 0x78, 0x71, 0x98, 0x42,
+		},
+	},
+	{
+		.data_len = 4128,
+		.digest = {
+			0x9d, 0x68, 0xfc, 0x26, 0x8b, 0x4c, 0xa8, 0xe7,
+			0x30, 0x0b, 0x19, 0x52, 0x6e, 0xa5, 0x65, 0x1c,
+		},
+	},
+	{
+		.data_len = 4160,
+		.digest = {
+			0x1c, 0xaa, 0x7d, 0xee, 0x91, 0x01, 0xe2, 0x5a,
+			0xec, 0xe9, 0xde, 0x57, 0x0a, 0xb6, 0x4c, 0x2f,
+		},
+	},
+	{
+		.data_len = 4224,
+		.digest = {
+			0x1b, 0x31, 0xe3, 0x14, 0x07, 0x16, 0x17, 0xc6,
+			0x98, 0x79, 0x88, 0x23, 0xb6, 0x3b, 0x25, 0xc4,
+		},
+	},
+	{
+		.data_len = 16384,
+		.digest = {
+			0xc6, 0x3d, 0x56, 0x90, 0xf0, 0xf6, 0xe6, 0x50,
+			0xf4, 0x76, 0x78, 0x67, 0xa3, 0xdd, 0x62, 0x7b,
+		},
+	},
+};
+
+static const u8 hash_testvec_consolidated[MD5_DIGEST_SIZE] = {
+	0x70, 0x86, 0x9e, 0x6c, 0xa4, 0xc6, 0x71, 0x43,
+	0x26, 0x02, 0x1b, 0x3f, 0xfd, 0x56, 0x9f, 0xa6,
+};
+
+static const u8 hmac_testvec_consolidated[MD5_DIGEST_SIZE] = {
+	0x10, 0x02, 0x74, 0xf6, 0x4d, 0xb3, 0x3c, 0xc7,
+	0xa1, 0xf7, 0xe6, 0xd4, 0x32, 0x64, 0xfa, 0x6d,
+};
diff --git a/lib/crypto/tests/md5_kunit.c b/lib/crypto/tests/md5_kunit.c
new file mode 100644
index 0000000000000..38bd52c25ae3e
--- /dev/null
+++ b/lib/crypto/tests/md5_kunit.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2025 Google LLC
+ */
+#include <crypto/md5.h>
+#include "md5-testvecs.h"
+
+#define HASH md5
+#define HASH_CTX md5_ctx
+#define HASH_SIZE MD5_DIGEST_SIZE
+#define HASH_INIT md5_init
+#define HASH_UPDATE md5_update
+#define HASH_FINAL md5_final
+#define HMAC_KEY hmac_md5_key
+#define HMAC_CTX hmac_md5_ctx
+#define HMAC_PREPAREKEY hmac_md5_preparekey
+#define HMAC_INIT hmac_md5_init
+#define HMAC_UPDATE hmac_md5_update
+#define HMAC_FINAL hmac_md5_final
+#define HMAC hmac_md5
+#define HMAC_USINGRAWKEY hmac_md5_usingrawkey
+#include "hash-test-template.h"
+
+static struct kunit_case hash_test_cases[] = {
+	HASH_KUNIT_CASES,
+	KUNIT_CASE(benchmark_hash),
+	{},
+};
+
+static struct kunit_suite hash_test_suite = {
+	.name = "md5",
+	.test_cases = hash_test_cases,
+	.suite_init = hash_suite_init,
+	.suite_exit = hash_suite_exit,
+};
+kunit_test_suite(hash_test_suite);
+
+MODULE_DESCRIPTION("KUnit tests and benchmark for MD5 and HMAC-MD5");
+MODULE_LICENSE("GPL");
-- 
2.50.1


