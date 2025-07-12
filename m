Return-Path: <linux-mips+bounces-9779-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA6FB02DF5
	for <lists+linux-mips@lfdr.de>; Sun, 13 Jul 2025 01:29:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17678A4319D
	for <lists+linux-mips@lfdr.de>; Sat, 12 Jul 2025 23:28:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DC3923C4E1;
	Sat, 12 Jul 2025 23:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rz40jc33"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033B523BD05;
	Sat, 12 Jul 2025 23:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752362787; cv=none; b=tyDoMSqTK3nvw4UoYgu44dDivDI7KjDRGc5sXNBsOkwQxrWqOSi/TGOzARykff0lVx1EHSmWz8NswrTmlbILVSz7ztA8ilG8wdW8nLJCafBoPOUyaDGAX1mH+1mR/Z6DBmP9NtuBi0DEliTC9w6DK3jQ1Ca3wtqD67p6y9t5bEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752362787; c=relaxed/simple;
	bh=GJ7nKp2NVjns7Vn/yd3vh/j/wSpE2hgTFf8rr99laVc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A/1UQL5oMF2ThLRNR7LSX3jk8wVAHacJgx3zbgUnbpY884tOuBsSGzC8gwZ/n0McOtsyPFxgTAYrgquSDYabWtQlmwUu6B/K6Dons5yyp5MztbStLUCocbliy83IQwKq8rBnpx/FHr/F2c5Wc+XCdaz5R0mJovycPXHcx+Gy2gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rz40jc33; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89025C4CEF7;
	Sat, 12 Jul 2025 23:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362786;
	bh=GJ7nKp2NVjns7Vn/yd3vh/j/wSpE2hgTFf8rr99laVc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rz40jc33/xphGqSYpQPco+3iJDZjL56YDYjR8lxUDvHZC9qTvA05p/dSIALTZNGLa
	 yXvMs5aBqkFHImLl8aUETc28cZI9qr1/dmBFyRLyOgDtANWvrLelg0XRsRp+H1fo49
	 2DXRpbcKWE/DMscKaQTB1MFDsjuADixByyVL5OJsS9GQAlJAw6f+QBrnQF+UwZ7wEq
	 b+hYHp4Q85Y8NjEOgve5GU4izy0luLiGraER+1MUi9nok4+Y53XmfRQ4/acQ0DDxuF
	 YuAIzEJHyD9PML6iIifGmew7AXaHbdsozX5EIyYP5MW3xQ6bkeFEF23ba0B568EVUx
	 Tvva3Jqe3BFgg==
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
Subject: [PATCH 14/26] crypto: sha1 - Remove sha1_base.h
Date: Sat, 12 Jul 2025 16:23:05 -0700
Message-ID: <20250712232329.818226-15-ebiggers@kernel.org>
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

sha1_base.h is no longer used, so remove it.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/sha1_base.h | 82 --------------------------------------
 1 file changed, 82 deletions(-)
 delete mode 100644 include/crypto/sha1_base.h

diff --git a/include/crypto/sha1_base.h b/include/crypto/sha1_base.h
deleted file mode 100644
index 62701d136c793..0000000000000
--- a/include/crypto/sha1_base.h
+++ /dev/null
@@ -1,82 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * sha1_base.h - core logic for SHA-1 implementations
- *
- * Copyright (C) 2015 Linaro Ltd <ard.biesheuvel@linaro.org>
- */
-
-#ifndef _CRYPTO_SHA1_BASE_H
-#define _CRYPTO_SHA1_BASE_H
-
-#include <crypto/internal/hash.h>
-#include <crypto/sha1.h>
-#include <linux/math.h>
-#include <linux/string.h>
-#include <linux/types.h>
-#include <linux/unaligned.h>
-
-typedef void (sha1_block_fn)(struct sha1_state *sst, u8 const *src, int blocks);
-
-static inline int sha1_base_init(struct shash_desc *desc)
-{
-	struct sha1_state *sctx = shash_desc_ctx(desc);
-
-	sctx->state[0] = SHA1_H0;
-	sctx->state[1] = SHA1_H1;
-	sctx->state[2] = SHA1_H2;
-	sctx->state[3] = SHA1_H3;
-	sctx->state[4] = SHA1_H4;
-	sctx->count = 0;
-
-	return 0;
-}
-
-static inline int sha1_base_do_update_blocks(struct shash_desc *desc,
-					     const u8 *data,
-					     unsigned int len,
-					     sha1_block_fn *block_fn)
-{
-	unsigned int remain = len - round_down(len, SHA1_BLOCK_SIZE);
-	struct sha1_state *sctx = shash_desc_ctx(desc);
-
-	sctx->count += len - remain;
-	block_fn(sctx, data, len / SHA1_BLOCK_SIZE);
-	return remain;
-}
-
-static inline int sha1_base_do_finup(struct shash_desc *desc,
-				     const u8 *src, unsigned int len,
-				     sha1_block_fn *block_fn)
-{
-	unsigned int bit_offset = SHA1_BLOCK_SIZE / 8 - 1;
-	struct sha1_state *sctx = shash_desc_ctx(desc);
-	union {
-		__be64 b64[SHA1_BLOCK_SIZE / 4];
-		u8 u8[SHA1_BLOCK_SIZE * 2];
-	} block = {};
-
-	if (len >= bit_offset * 8)
-		bit_offset += SHA1_BLOCK_SIZE / 8;
-	memcpy(&block, src, len);
-	block.u8[len] = 0x80;
-	sctx->count += len;
-	block.b64[bit_offset] = cpu_to_be64(sctx->count << 3);
-	block_fn(sctx, block.u8, (bit_offset + 1) * 8 / SHA1_BLOCK_SIZE);
-	memzero_explicit(&block, sizeof(block));
-
-	return 0;
-}
-
-static inline int sha1_base_finish(struct shash_desc *desc, u8 *out)
-{
-	struct sha1_state *sctx = shash_desc_ctx(desc);
-	__be32 *digest = (__be32 *)out;
-	int i;
-
-	for (i = 0; i < SHA1_DIGEST_SIZE / sizeof(__be32); i++)
-		put_unaligned_be32(sctx->state[i], digest++);
-
-	return 0;
-}
-
-#endif /* _CRYPTO_SHA1_BASE_H */
-- 
2.50.1


