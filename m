Return-Path: <linux-mips+bounces-9485-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF883AE7816
	for <lists+linux-mips@lfdr.de>; Wed, 25 Jun 2025 09:13:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36D345A675D
	for <lists+linux-mips@lfdr.de>; Wed, 25 Jun 2025 07:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26314215798;
	Wed, 25 Jun 2025 07:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MieT5Uj1"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76A0215062;
	Wed, 25 Jun 2025 07:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750835432; cv=none; b=Syj7TniiqNHCGRolwbdPxyJgqPDKlbGWs54DhqlrcFkBch47eM3YFT6QkvkLqE9qCxYc35Nxc8hvPY5UMXYaVYJxTRvZI/+FRffT/MU60Rfqp8XnCVvC2AlCNRzREADVlb+dIqiVA50Ix/dYnB/VWSJ6peENwIivE3o+31NfOqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750835432; c=relaxed/simple;
	bh=Zeed4/7J1MAgm4uZ7/OtehAGBMIbM4x8fqn9JGGd45g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fCe+DKgnCdhII3M3OE5qDTPp3cMA1iisy4wieX+0uzRywKlDwOBm06B/LV9u2EtFrL18FpHhJ6/qVSHpX368APgPgsye6PPaB7Qwhik8F+pHKHAdYp4IXC819UQMPPCg+TxxBH3BJcTGw1kOclC3z2Gnhfg85QcDMGDFD9YdrsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MieT5Uj1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2662DC116B1;
	Wed, 25 Jun 2025 07:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750835431;
	bh=Zeed4/7J1MAgm4uZ7/OtehAGBMIbM4x8fqn9JGGd45g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MieT5Uj1Ihmp2UzLvUIECVvfhjk3XRQ+K6PX9V8lIBOWFnkgYKRzwd0E+mvcxKkHj
	 19idi9jXV7eRt+u/ctsOrGBbUX0KEZPV4Yqlr/wUuRLD5RXeNVnd3ztGGL0yDg4VZ3
	 NWARw2GjVQOG9URFFYU3D1CSUx3UZqvkFB6oXi8nQbOruRj4I+CF2PIa4gmuuYIh2s
	 IBYHZ6Sq2S4J951FOW9I20ct1vHE6hNGWiYGsYgHVhfhGBtBde6iuHOBFNAko+e3pO
	 sj2/YhXEbYitj7xuTJe6Pss/9dxrb6Sr79+OPLcr+Nz3u4AmjUc8Lgta+bpUxsbEVt
	 gYFnuHNLcMl4w==
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
Subject: [PATCH 09/18] lib/crypto: sha256: Add sha224() and sha224_update()
Date: Wed, 25 Jun 2025 00:08:10 -0700
Message-ID: <20250625070819.1496119-10-ebiggers@kernel.org>
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

Add a one-shot SHA-224 computation function sha224(), for consistency
with sha256(), sha384(), and sha512() which all already exist.

Similarly, add sha224_update().  While for now it's identical to
sha256_update(), omitting it makes the API harder to use since users
have to "know" which functions are the same between SHA-224 and SHA-256.
Also, this is a prerequisite for using different context types for each.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/sha2.h           | 10 ++++++++--
 lib/crypto/sha256.c             | 10 ++++++++++
 lib/crypto/tests/sha224_kunit.c | 13 +------------
 3 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/include/crypto/sha2.h b/include/crypto/sha2.h
index bb181b7996cdc..e31da0743a522 100644
--- a/include/crypto/sha2.h
+++ b/include/crypto/sha2.h
@@ -112,22 +112,28 @@ struct sha512_state {
 	u64 state[SHA512_DIGEST_SIZE / 8];
 	u64 count[2];
 	u8 buf[SHA512_BLOCK_SIZE];
 };
 
+void sha256_update(struct sha256_state *sctx, const u8 *data, size_t len);
+
 static inline void sha224_init(struct sha256_state *sctx)
 {
 	sha224_block_init(&sctx->ctx);
 }
-/* Simply use sha256_update as it is equivalent to sha224_update. */
+static inline void sha224_update(struct sha256_state *sctx,
+				 const u8 *data, size_t len)
+{
+	sha256_update(sctx, data, len);
+}
 void sha224_final(struct sha256_state *sctx, u8 out[SHA224_DIGEST_SIZE]);
+void sha224(const u8 *data, size_t len, u8 out[SHA224_DIGEST_SIZE]);
 
 static inline void sha256_init(struct sha256_state *sctx)
 {
 	sha256_block_init(&sctx->ctx);
 }
-void sha256_update(struct sha256_state *sctx, const u8 *data, size_t len);
 void sha256_final(struct sha256_state *sctx, u8 out[SHA256_DIGEST_SIZE]);
 void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE]);
 
 /* State for the SHA-512 (and SHA-384) compression function */
 struct sha512_block_state {
diff --git a/lib/crypto/sha256.c b/lib/crypto/sha256.c
index 573ccecbf48bf..ccaae70880166 100644
--- a/lib/crypto/sha256.c
+++ b/lib/crypto/sha256.c
@@ -68,10 +68,20 @@ void sha256_final(struct sha256_state *sctx, u8 out[SHA256_DIGEST_SIZE])
 {
 	__sha256_final(sctx, out, SHA256_DIGEST_SIZE);
 }
 EXPORT_SYMBOL(sha256_final);
 
+void sha224(const u8 *data, size_t len, u8 out[SHA224_DIGEST_SIZE])
+{
+	struct sha256_state sctx;
+
+	sha224_init(&sctx);
+	sha224_update(&sctx, data, len);
+	sha224_final(&sctx, out);
+}
+EXPORT_SYMBOL(sha224);
+
 void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE])
 {
 	struct sha256_state sctx;
 
 	sha256_init(&sctx);
diff --git a/lib/crypto/tests/sha224_kunit.c b/lib/crypto/tests/sha224_kunit.c
index 5015861a55112..c484c1d4a2a5e 100644
--- a/lib/crypto/tests/sha224_kunit.c
+++ b/lib/crypto/tests/sha224_kunit.c
@@ -3,26 +3,15 @@
  * Copyright 2025 Google LLC
  */
 #include <crypto/sha2.h>
 #include "sha224-testvecs.h"
 
-/* TODO: add sha224() to the library itself */
-static inline void sha224(const u8 *data, size_t len,
-			  u8 out[SHA224_DIGEST_SIZE])
-{
-	struct sha256_state state;
-
-	sha224_init(&state);
-	sha256_update(&state, data, len);
-	sha224_final(&state, out);
-}
-
 #define HASH sha224
 #define HASH_CTX sha256_state
 #define HASH_SIZE SHA224_DIGEST_SIZE
 #define HASH_INIT sha224_init
-#define HASH_UPDATE sha256_update
+#define HASH_UPDATE sha224_update
 #define HASH_FINAL sha224_final
 #define HASH_TESTVECS sha224_testvecs
 /* TODO: add HMAC-SHA224 support to the library, then enable the tests for it */
 #include "hash-test-template.h"
 
-- 
2.50.0


