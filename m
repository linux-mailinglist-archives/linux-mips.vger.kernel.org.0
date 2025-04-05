Return-Path: <linux-mips+bounces-8494-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A1DA7CB67
	for <lists+linux-mips@lfdr.de>; Sat,  5 Apr 2025 20:32:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29F303B7DD3
	for <lists+linux-mips@lfdr.de>; Sat,  5 Apr 2025 18:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6D001EF385;
	Sat,  5 Apr 2025 18:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ju1cg6yr"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B1F1E835F;
	Sat,  5 Apr 2025 18:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743877857; cv=none; b=ksM6ATDfW2vU4dAYiGKplE2wQMcdAi/SZRokbzkSN2vjF6cIBctkK3f49Ejy8rNnYE7m9282yqMGc5nDrDVhYWMbvSERN7o4lUzicJMuJibePv+rFIj4HEW/IIeBWVDAwSbTg3ZmZQjP7b4v2+ToJpghVBApTK0AjdwEqL+icSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743877857; c=relaxed/simple;
	bh=xm9pQBjynxcvCeIRTBV15aMlBzjyI8/pKv+7T2s3kQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bM2CEbJRGiLpco+bSSM99UKsi4iT/33fkTA9A2QFji+1aiw0R3I9oVT07m13wtOGuVkOv7np8SRzouYhCT8TDDp8Wnsj9IgixVYUyRJ3+VVqdFqW+64Tj+SxkHulxEAw8+xbBbAVOoAk70pvnY0H8a+2k7GaA61KBxh6MM/Q5Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ju1cg6yr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B91BCC4CEEE;
	Sat,  5 Apr 2025 18:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743877857;
	bh=xm9pQBjynxcvCeIRTBV15aMlBzjyI8/pKv+7T2s3kQY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ju1cg6yronHNVCwqCj3RXAUddHMdeVnV37A1BlKl8lKfGjcLZ1O5Jr47JPwtgEb8w
	 kBtjrQz3oQTK0rF2GIxt9Jca1cQ2ovIovsG6x4ozwgzI/GbWA8lRcEtmfqMDHrTqpT
	 GkdEJQJ46F2Rn2YbfgjD6ZNJWzdg9KZ4ECZmXWRKimG527EO6mCfbyhULimX30AAin
	 iZ+x9yi8figCx1FLSGpxDTsI1oClBdWm+rRR1K6l7HqAHfcbGiEQ2Yy0vRh9G1DEDV
	 Fz64+CRHAlOrMoZ3dqTecWbhgJP5bMpDNyYjfK3/ZQdfcw+7ZrPkaN6Q+fqq/Aktxg
	 VZhaClah8z4gQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 9/9] crypto: chacha - remove <crypto/internal/chacha.h>
Date: Sat,  5 Apr 2025 11:26:09 -0700
Message-ID: <20250405182609.404216-10-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250405182609.404216-1-ebiggers@kernel.org>
References: <20250405182609.404216-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

<crypto/internal/chacha.h> is now included only by crypto/chacha.c, so
fold it into there.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 crypto/chacha.c                  | 35 +++++++++++++++++++++++++-
 include/crypto/internal/chacha.h | 43 --------------------------------
 2 files changed, 34 insertions(+), 44 deletions(-)
 delete mode 100644 include/crypto/internal/chacha.h

diff --git a/crypto/chacha.c b/crypto/chacha.c
index 2009038c5e56c..5103bc0b2881f 100644
--- a/crypto/chacha.c
+++ b/crypto/chacha.c
@@ -6,14 +6,47 @@
  * Copyright (C) 2018 Google LLC
  */
 
 #include <linux/unaligned.h>
 #include <crypto/algapi.h>
-#include <crypto/internal/chacha.h>
+#include <crypto/chacha.h>
 #include <crypto/internal/skcipher.h>
 #include <linux/module.h>
 
+struct chacha_ctx {
+	u32 key[8];
+	int nrounds;
+};
+
+static int chacha_setkey(struct crypto_skcipher *tfm,
+			 const u8 *key, unsigned int keysize, int nrounds)
+{
+	struct chacha_ctx *ctx = crypto_skcipher_ctx(tfm);
+	int i;
+
+	if (keysize != CHACHA_KEY_SIZE)
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(ctx->key); i++)
+		ctx->key[i] = get_unaligned_le32(key + i * sizeof(u32));
+
+	ctx->nrounds = nrounds;
+	return 0;
+}
+
+static int chacha20_setkey(struct crypto_skcipher *tfm,
+			   const u8 *key, unsigned int keysize)
+{
+	return chacha_setkey(tfm, key, keysize, 20);
+}
+
+static int chacha12_setkey(struct crypto_skcipher *tfm,
+			   const u8 *key, unsigned int keysize)
+{
+	return chacha_setkey(tfm, key, keysize, 12);
+}
+
 static int chacha_stream_xor(struct skcipher_request *req,
 			     const struct chacha_ctx *ctx, const u8 *iv,
 			     bool arch)
 {
 	struct skcipher_walk walk;
diff --git a/include/crypto/internal/chacha.h b/include/crypto/internal/chacha.h
deleted file mode 100644
index b085dc1ac1516..0000000000000
--- a/include/crypto/internal/chacha.h
+++ /dev/null
@@ -1,43 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-
-#ifndef _CRYPTO_INTERNAL_CHACHA_H
-#define _CRYPTO_INTERNAL_CHACHA_H
-
-#include <crypto/chacha.h>
-#include <crypto/internal/skcipher.h>
-#include <linux/crypto.h>
-
-struct chacha_ctx {
-	u32 key[8];
-	int nrounds;
-};
-
-static inline int chacha_setkey(struct crypto_skcipher *tfm, const u8 *key,
-				unsigned int keysize, int nrounds)
-{
-	struct chacha_ctx *ctx = crypto_skcipher_ctx(tfm);
-	int i;
-
-	if (keysize != CHACHA_KEY_SIZE)
-		return -EINVAL;
-
-	for (i = 0; i < ARRAY_SIZE(ctx->key); i++)
-		ctx->key[i] = get_unaligned_le32(key + i * sizeof(u32));
-
-	ctx->nrounds = nrounds;
-	return 0;
-}
-
-static inline int chacha20_setkey(struct crypto_skcipher *tfm, const u8 *key,
-				  unsigned int keysize)
-{
-	return chacha_setkey(tfm, key, keysize, 20);
-}
-
-static inline int chacha12_setkey(struct crypto_skcipher *tfm, const u8 *key,
-				  unsigned int keysize)
-{
-	return chacha_setkey(tfm, key, keysize, 12);
-}
-
-#endif /* _CRYPTO_CHACHA_H */
-- 
2.49.0


