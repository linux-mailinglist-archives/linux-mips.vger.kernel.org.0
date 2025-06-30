Return-Path: <linux-mips+bounces-9552-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB838AEE342
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 18:05:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E03F817D69B
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 16:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AB6A290080;
	Mon, 30 Jun 2025 16:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BHeiGcd6"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266E528FAB9;
	Mon, 30 Jun 2025 16:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751299523; cv=none; b=q2ig3wE8jExXZyhHRm5UjIfAZaNDWvMIheY2fCv1KT/Uk/mTK8/awy7R/upmk24c3D+8vXnRAFSGHtOALOl9fGU0Lvw19+mE0rncYx6N3P+AyGRa0frUJf5zyd1nvpkQhy7Z+bAaKU6Tw5WXUmPN+5VOSxQefQI+F1J66NmixKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751299523; c=relaxed/simple;
	bh=eAlFTDD9aXKbjy6HE+rdkdPi0a/NSm/FPRsme2GVGco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tt4VZQKBDhpKW9/hTPjeTNhyt8g1F/5B8kBePh7uy7Kdk9tYWVMwe5L2xRIyuCJdP0/3B3RFx/DXu1wpTbOhg1EAPVWDrpmADs3ODso9VZcwlOcPrF8348C+DHSXM9MPGom2nV9RbnEPVTtQsjXDIeTpzvA0rtQvUpfNHHAjbfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BHeiGcd6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 687F0C4CEF3;
	Mon, 30 Jun 2025 16:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299522;
	bh=eAlFTDD9aXKbjy6HE+rdkdPi0a/NSm/FPRsme2GVGco=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BHeiGcd62HEts1mhgVsYRzmrDKMThTLQzMKUc3qgPUlWgBVbFY28hsE/C9laDkrqA
	 1fn7CxdoaA1kDYfO/WHa0e6r2flYkYp45CJ/FGbNVGvoGOsLPXajCcEifQUpKqqYxI
	 LYhUp0t3ZC8Pb8KyuvEOzAyiQDaK3MHIa5dhFIi/ARrqmr5nYRJoXDsTWLcfB3f2mK
	 fYz6j1Oz1yDGgCy/NcnAvRQc8dBkLBtGexLaNc/5a9l/rFP5gDrIxckZ/l2zvkBtip
	 RgXDth/m6lpPUFzUXbbOICnj95qePHy4OqgkJ/3Gp2v7nBrlMpaoJG1tGJTQpK8Rem
	 WJ3ICXpPZdbCQ==
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
Subject: [PATCH v3 02/16] lib/crypto: sha512: Add support for SHA-384 and SHA-512
Date: Mon, 30 Jun 2025 09:03:06 -0700
Message-ID: <20250630160320.2888-3-ebiggers@kernel.org>
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

Add basic support for SHA-384 and SHA-512 to lib/crypto/.

Various in-kernel users will be able to use this instead of the
old-school crypto API, which is harder to use and has more overhead.

The basic support added by this commit consists of the API and its
documentation, backed by a C implementation of the algorithms.
sha512_block_generic() is derived from crypto/sha512_generic.c.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/sha2.h | 128 ++++++++++++++++++++
 lib/crypto/Kconfig    |  10 ++
 lib/crypto/Makefile   |   6 +
 lib/crypto/sha512.c   | 265 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 409 insertions(+)
 create mode 100644 lib/crypto/sha512.c

diff --git a/include/crypto/sha2.h b/include/crypto/sha2.h
index 4912572578dc2..f2a6e84b28400 100644
--- a/include/crypto/sha2.h
+++ b/include/crypto/sha2.h
@@ -127,6 +127,134 @@ static inline void sha224_init(struct sha256_state *sctx)
 	sha224_block_init(&sctx->ctx);
 }
 /* Simply use sha256_update as it is equivalent to sha224_update. */
 void sha224_final(struct sha256_state *sctx, u8 out[SHA224_DIGEST_SIZE]);
 
+/* State for the SHA-512 (and SHA-384) compression function */
+struct sha512_block_state {
+	u64 h[8];
+};
+
+/*
+ * Context structure, shared by SHA-384 and SHA-512.  The sha384_ctx and
+ * sha512_ctx structs wrap this one so that the API has proper typing and
+ * doesn't allow mixing the SHA-384 and SHA-512 functions arbitrarily.
+ */
+struct __sha512_ctx {
+	struct sha512_block_state state;
+	u64 bytecount_lo;
+	u64 bytecount_hi;
+	u8 buf[SHA512_BLOCK_SIZE] __aligned(__alignof__(__be64));
+};
+void __sha512_update(struct __sha512_ctx *ctx, const u8 *data, size_t len);
+
+/**
+ * struct sha384_ctx - Context for hashing a message with SHA-384
+ * @ctx: private
+ */
+struct sha384_ctx {
+	struct __sha512_ctx ctx;
+};
+
+/**
+ * sha384_init() - Initialize a SHA-384 context for a new message
+ * @ctx: the context to initialize
+ *
+ * If you don't need incremental computation, consider sha384() instead.
+ *
+ * Context: Any context.
+ */
+void sha384_init(struct sha384_ctx *ctx);
+
+/**
+ * sha384_update() - Update a SHA-384 context with message data
+ * @ctx: the context to update; must have been initialized
+ * @data: the message data
+ * @len: the data length in bytes
+ *
+ * This can be called any number of times.
+ *
+ * Context: Any context.
+ */
+static inline void sha384_update(struct sha384_ctx *ctx,
+				 const u8 *data, size_t len)
+{
+	__sha512_update(&ctx->ctx, data, len);
+}
+
+/**
+ * sha384_final() - Finish computing a SHA-384 message digest
+ * @ctx: the context to finalize; must have been initialized
+ * @out: (output) the resulting SHA-384 message digest
+ *
+ * After finishing, this zeroizes @ctx.  So the caller does not need to do it.
+ *
+ * Context: Any context.
+ */
+void sha384_final(struct sha384_ctx *ctx, u8 out[SHA384_DIGEST_SIZE]);
+
+/**
+ * sha384() - Compute SHA-384 message digest in one shot
+ * @data: the message data
+ * @len: the data length in bytes
+ * @out: (output) the resulting SHA-384 message digest
+ *
+ * Context: Any context.
+ */
+void sha384(const u8 *data, size_t len, u8 out[SHA384_DIGEST_SIZE]);
+
+/**
+ * struct sha512_ctx - Context for hashing a message with SHA-512
+ * @ctx: private
+ */
+struct sha512_ctx {
+	struct __sha512_ctx ctx;
+};
+
+/**
+ * sha512_init() - Initialize a SHA-512 context for a new message
+ * @ctx: the context to initialize
+ *
+ * If you don't need incremental computation, consider sha512() instead.
+ *
+ * Context: Any context.
+ */
+void sha512_init(struct sha512_ctx *ctx);
+
+/**
+ * sha512_update() - Update a SHA-512 context with message data
+ * @ctx: the context to update; must have been initialized
+ * @data: the message data
+ * @len: the data length in bytes
+ *
+ * This can be called any number of times.
+ *
+ * Context: Any context.
+ */
+static inline void sha512_update(struct sha512_ctx *ctx,
+				 const u8 *data, size_t len)
+{
+	__sha512_update(&ctx->ctx, data, len);
+}
+
+/**
+ * sha512_final() - Finish computing a SHA-512 message digest
+ * @ctx: the context to finalize; must have been initialized
+ * @out: (output) the resulting SHA-512 message digest
+ *
+ * After finishing, this zeroizes @ctx.  So the caller does not need to do it.
+ *
+ * Context: Any context.
+ */
+void sha512_final(struct sha512_ctx *ctx, u8 out[SHA512_DIGEST_SIZE]);
+
+/**
+ * sha512() - Compute SHA-512 message digest in one shot
+ * @data: the message data
+ * @len: the data length in bytes
+ * @out: (output) the resulting SHA-512 message digest
+ *
+ * Context: Any context.
+ */
+void sha512(const u8 *data, size_t len, u8 out[SHA512_DIGEST_SIZE]);
+
 #endif /* _CRYPTO_SHA2_H */
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 1ec1466108ccd..2d295c0e0f792 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -165,10 +165,20 @@ config CRYPTO_LIB_SHA256_GENERIC
 	  This symbol can be selected by arch implementations of the SHA-256
 	  library interface that require the generic code as a fallback, e.g.,
 	  for SIMD implementations. If no arch specific implementation is
 	  enabled, this implementation serves the users of CRYPTO_LIB_SHA256.
 
+config CRYPTO_LIB_SHA512
+	tristate
+	help
+	  The SHA-384 and SHA-512 library functions.  Select this if your module
+	  uses any of these functions from <crypto/sha2.h>.
+
+config CRYPTO_LIB_SHA512_ARCH
+	bool
+	depends on CRYPTO_LIB_SHA512 && !UML
+
 config CRYPTO_LIB_SM3
 	tristate
 
 if !KMSAN # avoid false positives from assembly
 if ARM
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index b0c0f8aea2695..f6b6f370451ec 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -62,10 +62,16 @@ obj-$(CONFIG_CRYPTO_LIB_SHA256)			+= libsha256.o
 libsha256-y					:= sha256.o
 
 obj-$(CONFIG_CRYPTO_LIB_SHA256_GENERIC)		+= libsha256-generic.o
 libsha256-generic-y				:= sha256-generic.o
 
+obj-$(CONFIG_CRYPTO_LIB_SHA512) += libsha512.o
+libsha512-y := sha512.o
+ifeq ($(CONFIG_CRYPTO_LIB_SHA512_ARCH),y)
+CFLAGS_sha512.o += -I$(src)/$(SRCARCH)
+endif # CONFIG_CRYPTO_LIB_SHA512_ARCH
+
 obj-$(CONFIG_MPILIB) += mpi/
 
 obj-$(CONFIG_CRYPTO_SELFTESTS_FULL)		+= simd.o
 
 obj-$(CONFIG_CRYPTO_LIB_SM3)			+= libsm3.o
diff --git a/lib/crypto/sha512.c b/lib/crypto/sha512.c
new file mode 100644
index 0000000000000..536b71481b1ca
--- /dev/null
+++ b/lib/crypto/sha512.c
@@ -0,0 +1,265 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * SHA-384 and SHA-512 library functions
+ *
+ * Copyright (c) Jean-Luc Cooke <jlcooke@certainkey.com>
+ * Copyright (c) Andrew McDonald <andrew@mcdonald.org.uk>
+ * Copyright (c) 2003 Kyle McMartin <kyle@debian.org>
+ * Copyright 2025 Google LLC
+ */
+
+#include <crypto/sha2.h>
+#include <linux/export.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/overflow.h>
+#include <linux/string.h>
+#include <linux/unaligned.h>
+
+static const struct sha512_block_state sha384_iv = {
+	.h = {
+		SHA384_H0, SHA384_H1, SHA384_H2, SHA384_H3,
+		SHA384_H4, SHA384_H5, SHA384_H6, SHA384_H7,
+	},
+};
+
+static const struct sha512_block_state sha512_iv = {
+	.h = {
+		SHA512_H0, SHA512_H1, SHA512_H2, SHA512_H3,
+		SHA512_H4, SHA512_H5, SHA512_H6, SHA512_H7,
+	},
+};
+
+static const u64 sha512_K[80] = {
+	0x428a2f98d728ae22ULL, 0x7137449123ef65cdULL, 0xb5c0fbcfec4d3b2fULL,
+	0xe9b5dba58189dbbcULL, 0x3956c25bf348b538ULL, 0x59f111f1b605d019ULL,
+	0x923f82a4af194f9bULL, 0xab1c5ed5da6d8118ULL, 0xd807aa98a3030242ULL,
+	0x12835b0145706fbeULL, 0x243185be4ee4b28cULL, 0x550c7dc3d5ffb4e2ULL,
+	0x72be5d74f27b896fULL, 0x80deb1fe3b1696b1ULL, 0x9bdc06a725c71235ULL,
+	0xc19bf174cf692694ULL, 0xe49b69c19ef14ad2ULL, 0xefbe4786384f25e3ULL,
+	0x0fc19dc68b8cd5b5ULL, 0x240ca1cc77ac9c65ULL, 0x2de92c6f592b0275ULL,
+	0x4a7484aa6ea6e483ULL, 0x5cb0a9dcbd41fbd4ULL, 0x76f988da831153b5ULL,
+	0x983e5152ee66dfabULL, 0xa831c66d2db43210ULL, 0xb00327c898fb213fULL,
+	0xbf597fc7beef0ee4ULL, 0xc6e00bf33da88fc2ULL, 0xd5a79147930aa725ULL,
+	0x06ca6351e003826fULL, 0x142929670a0e6e70ULL, 0x27b70a8546d22ffcULL,
+	0x2e1b21385c26c926ULL, 0x4d2c6dfc5ac42aedULL, 0x53380d139d95b3dfULL,
+	0x650a73548baf63deULL, 0x766a0abb3c77b2a8ULL, 0x81c2c92e47edaee6ULL,
+	0x92722c851482353bULL, 0xa2bfe8a14cf10364ULL, 0xa81a664bbc423001ULL,
+	0xc24b8b70d0f89791ULL, 0xc76c51a30654be30ULL, 0xd192e819d6ef5218ULL,
+	0xd69906245565a910ULL, 0xf40e35855771202aULL, 0x106aa07032bbd1b8ULL,
+	0x19a4c116b8d2d0c8ULL, 0x1e376c085141ab53ULL, 0x2748774cdf8eeb99ULL,
+	0x34b0bcb5e19b48a8ULL, 0x391c0cb3c5c95a63ULL, 0x4ed8aa4ae3418acbULL,
+	0x5b9cca4f7763e373ULL, 0x682e6ff3d6b2b8a3ULL, 0x748f82ee5defb2fcULL,
+	0x78a5636f43172f60ULL, 0x84c87814a1f0ab72ULL, 0x8cc702081a6439ecULL,
+	0x90befffa23631e28ULL, 0xa4506cebde82bde9ULL, 0xbef9a3f7b2c67915ULL,
+	0xc67178f2e372532bULL, 0xca273eceea26619cULL, 0xd186b8c721c0c207ULL,
+	0xeada7dd6cde0eb1eULL, 0xf57d4f7fee6ed178ULL, 0x06f067aa72176fbaULL,
+	0x0a637dc5a2c898a6ULL, 0x113f9804bef90daeULL, 0x1b710b35131c471bULL,
+	0x28db77f523047d84ULL, 0x32caab7b40c72493ULL, 0x3c9ebe0a15c9bebcULL,
+	0x431d67c49c100d4cULL, 0x4cc5d4becb3e42b6ULL, 0x597f299cfc657e2aULL,
+	0x5fcb6fab3ad6faecULL, 0x6c44198c4a475817ULL,
+};
+
+#define Ch(x, y, z) ((z) ^ ((x) & ((y) ^ (z))))
+#define Maj(x, y, z) (((x) & (y)) | ((z) & ((x) | (y))))
+#define e0(x) (ror64((x), 28) ^ ror64((x), 34) ^ ror64((x), 39))
+#define e1(x) (ror64((x), 14) ^ ror64((x), 18) ^ ror64((x), 41))
+#define s0(x) (ror64((x), 1) ^ ror64((x), 8) ^ ((x) >> 7))
+#define s1(x) (ror64((x), 19) ^ ror64((x), 61) ^ ((x) >> 6))
+
+static void sha512_block_generic(struct sha512_block_state *state,
+				 const u8 *data)
+{
+	u64 a = state->h[0];
+	u64 b = state->h[1];
+	u64 c = state->h[2];
+	u64 d = state->h[3];
+	u64 e = state->h[4];
+	u64 f = state->h[5];
+	u64 g = state->h[6];
+	u64 h = state->h[7];
+	u64 t1, t2;
+	u64 W[16];
+
+	for (int j = 0; j < 16; j++)
+		W[j] = get_unaligned_be64(data + j * sizeof(u64));
+
+	for (int i = 0; i < 80; i += 8) {
+		if ((i & 15) == 0 && i != 0) {
+			for (int j = 0; j < 16; j++) {
+				W[j & 15] += s1(W[(j - 2) & 15]) +
+					     W[(j - 7) & 15] +
+					     s0(W[(j - 15) & 15]);
+			}
+		}
+		t1 = h + e1(e) + Ch(e, f, g) + sha512_K[i]   + W[(i & 15)];
+		t2 = e0(a) + Maj(a, b, c);    d += t1;    h = t1 + t2;
+		t1 = g + e1(d) + Ch(d, e, f) + sha512_K[i+1] + W[(i & 15) + 1];
+		t2 = e0(h) + Maj(h, a, b);    c += t1;    g = t1 + t2;
+		t1 = f + e1(c) + Ch(c, d, e) + sha512_K[i+2] + W[(i & 15) + 2];
+		t2 = e0(g) + Maj(g, h, a);    b += t1;    f = t1 + t2;
+		t1 = e + e1(b) + Ch(b, c, d) + sha512_K[i+3] + W[(i & 15) + 3];
+		t2 = e0(f) + Maj(f, g, h);    a += t1;    e = t1 + t2;
+		t1 = d + e1(a) + Ch(a, b, c) + sha512_K[i+4] + W[(i & 15) + 4];
+		t2 = e0(e) + Maj(e, f, g);    h += t1;    d = t1 + t2;
+		t1 = c + e1(h) + Ch(h, a, b) + sha512_K[i+5] + W[(i & 15) + 5];
+		t2 = e0(d) + Maj(d, e, f);    g += t1;    c = t1 + t2;
+		t1 = b + e1(g) + Ch(g, h, a) + sha512_K[i+6] + W[(i & 15) + 6];
+		t2 = e0(c) + Maj(c, d, e);    f += t1;    b = t1 + t2;
+		t1 = a + e1(f) + Ch(f, g, h) + sha512_K[i+7] + W[(i & 15) + 7];
+		t2 = e0(b) + Maj(b, c, d);    e += t1;    a = t1 + t2;
+	}
+
+	state->h[0] += a;
+	state->h[1] += b;
+	state->h[2] += c;
+	state->h[3] += d;
+	state->h[4] += e;
+	state->h[5] += f;
+	state->h[6] += g;
+	state->h[7] += h;
+}
+
+static void __maybe_unused
+sha512_blocks_generic(struct sha512_block_state *state,
+		      const u8 *data, size_t nblocks)
+{
+	do {
+		sha512_block_generic(state, data);
+		data += SHA512_BLOCK_SIZE;
+	} while (--nblocks);
+}
+
+#ifdef CONFIG_CRYPTO_LIB_SHA512_ARCH
+#include "sha512.h" /* $(SRCARCH)/sha512.h */
+#else
+#define sha512_blocks sha512_blocks_generic
+#endif
+
+static void __sha512_init(struct __sha512_ctx *ctx,
+			  const struct sha512_block_state *iv,
+			  u64 initial_bytecount)
+{
+	ctx->state = *iv;
+	ctx->bytecount_lo = initial_bytecount;
+	ctx->bytecount_hi = 0;
+}
+
+void sha384_init(struct sha384_ctx *ctx)
+{
+	__sha512_init(&ctx->ctx, &sha384_iv, 0);
+}
+EXPORT_SYMBOL_GPL(sha384_init);
+
+void sha512_init(struct sha512_ctx *ctx)
+{
+	__sha512_init(&ctx->ctx, &sha512_iv, 0);
+}
+EXPORT_SYMBOL_GPL(sha512_init);
+
+void __sha512_update(struct __sha512_ctx *ctx, const u8 *data, size_t len)
+{
+	size_t partial = ctx->bytecount_lo % SHA512_BLOCK_SIZE;
+
+	if (check_add_overflow(ctx->bytecount_lo, len, &ctx->bytecount_lo))
+		ctx->bytecount_hi++;
+
+	if (partial + len >= SHA512_BLOCK_SIZE) {
+		size_t nblocks;
+
+		if (partial) {
+			size_t l = SHA512_BLOCK_SIZE - partial;
+
+			memcpy(&ctx->buf[partial], data, l);
+			data += l;
+			len -= l;
+
+			sha512_blocks(&ctx->state, ctx->buf, 1);
+		}
+
+		nblocks = len / SHA512_BLOCK_SIZE;
+		len %= SHA512_BLOCK_SIZE;
+
+		if (nblocks) {
+			sha512_blocks(&ctx->state, data, nblocks);
+			data += nblocks * SHA512_BLOCK_SIZE;
+		}
+		partial = 0;
+	}
+	if (len)
+		memcpy(&ctx->buf[partial], data, len);
+}
+EXPORT_SYMBOL_GPL(__sha512_update);
+
+static void __sha512_final(struct __sha512_ctx *ctx,
+			   u8 *out, size_t digest_size)
+{
+	u64 bitcount_hi = (ctx->bytecount_hi << 3) | (ctx->bytecount_lo >> 61);
+	u64 bitcount_lo = ctx->bytecount_lo << 3;
+	size_t partial = ctx->bytecount_lo % SHA512_BLOCK_SIZE;
+
+	ctx->buf[partial++] = 0x80;
+	if (partial > SHA512_BLOCK_SIZE - 16) {
+		memset(&ctx->buf[partial], 0, SHA512_BLOCK_SIZE - partial);
+		sha512_blocks(&ctx->state, ctx->buf, 1);
+		partial = 0;
+	}
+	memset(&ctx->buf[partial], 0, SHA512_BLOCK_SIZE - 16 - partial);
+	*(__be64 *)&ctx->buf[SHA512_BLOCK_SIZE - 16] = cpu_to_be64(bitcount_hi);
+	*(__be64 *)&ctx->buf[SHA512_BLOCK_SIZE - 8] = cpu_to_be64(bitcount_lo);
+	sha512_blocks(&ctx->state, ctx->buf, 1);
+
+	for (size_t i = 0; i < digest_size; i += 8)
+		put_unaligned_be64(ctx->state.h[i / 8], out + i);
+}
+
+void sha384_final(struct sha384_ctx *ctx, u8 out[SHA384_DIGEST_SIZE])
+{
+	__sha512_final(&ctx->ctx, out, SHA384_DIGEST_SIZE);
+	memzero_explicit(ctx, sizeof(*ctx));
+}
+EXPORT_SYMBOL_GPL(sha384_final);
+
+void sha512_final(struct sha512_ctx *ctx, u8 out[SHA512_DIGEST_SIZE])
+{
+	__sha512_final(&ctx->ctx, out, SHA512_DIGEST_SIZE);
+	memzero_explicit(ctx, sizeof(*ctx));
+}
+EXPORT_SYMBOL_GPL(sha512_final);
+
+void sha384(const u8 *data, size_t len, u8 out[SHA384_DIGEST_SIZE])
+{
+	struct sha384_ctx ctx;
+
+	sha384_init(&ctx);
+	sha384_update(&ctx, data, len);
+	sha384_final(&ctx, out);
+}
+EXPORT_SYMBOL_GPL(sha384);
+
+void sha512(const u8 *data, size_t len, u8 out[SHA512_DIGEST_SIZE])
+{
+	struct sha512_ctx ctx;
+
+	sha512_init(&ctx);
+	sha512_update(&ctx, data, len);
+	sha512_final(&ctx, out);
+}
+EXPORT_SYMBOL_GPL(sha512);
+
+#ifdef sha512_mod_init_arch
+static int __init sha512_mod_init(void)
+{
+	sha512_mod_init_arch();
+	return 0;
+}
+subsys_initcall(sha512_mod_init);
+
+static void __exit sha512_mod_exit(void)
+{
+}
+module_exit(sha512_mod_exit);
+#endif
+
+MODULE_DESCRIPTION("SHA-384 and SHA-512 library functions");
+MODULE_LICENSE("GPL");
-- 
2.50.0


