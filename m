Return-Path: <linux-mips+bounces-9242-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04769AD48B3
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 04:15:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25A923A5BAF
	for <lists+linux-mips@lfdr.de>; Wed, 11 Jun 2025 02:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2342A1DF965;
	Wed, 11 Jun 2025 02:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SRBS7SW8"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BD61DED53;
	Wed, 11 Jun 2025 02:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749607980; cv=none; b=M85cXvg69CNDUJn4OgmFMLnIzk5S6bjNwceuGO+YF7ZAwxEorP8x22Qfjycl3FOAyvpQN6JVW57T9sLb/cF+WDUF51alpIdpL9XvgbfhjqN+Hq3sFb1cVLfGsINE6MATl9kbIgDEA3gWCSNNwcy6/TXy7WGkaBdSiq2ecp/AY94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749607980; c=relaxed/simple;
	bh=CfGkdjItRjUxPxMuzjk2hmHTtGTMsfQDaBtxQ0B43iQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mTyaMtjWx71+a6ZpYHos7lUI/N3gmfMWMDW8lUw/w/ZAcLERrQmNcolhfiPdkEQbSV/pnM9Xqz2pMrG2LtmlhF5ZUAcmfRGWva+JUPyI4cw4IWdbAQnSp5XFSg+lzrCZ94cqglBlpv5cn00W9sf+sl9zGdhtG6Pi3AjLYxjDvjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SRBS7SW8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757C9C4CEF4;
	Wed, 11 Jun 2025 02:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749607979;
	bh=CfGkdjItRjUxPxMuzjk2hmHTtGTMsfQDaBtxQ0B43iQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SRBS7SW8VmFEJ0509uOL86wnk9Tx1wrf6gYUew2s1ujJ6OdYPHuwrCvUEfCLoSjX8
	 WwoHxf1HurvQAjWwoKYOETmw6DM1g7C5xr39n/gjn4Gbmegy1hA7S+jSz40kW9Kx2v
	 WC0PvLKZGpvQgqRruPy3sGcGnwNvIi4pPSUeFv6Va1/udN6ifk+e5oNF51Z7KHPcem
	 6xI1n/YfA6eHNzWoUsO3+3i9jU1vkIfCsx54Rge0mBlQKq/XD01CtZPgdTOnS2o69P
	 G0LG9Cu+ajcQADMD1qLeKwR+WfjVK3TAj47rvQqhv/QHxu0zE/AObXnmC2iEWjW+4s
	 R/fA3gadiYkqg==
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
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 16/16] crypto: sha512 - remove sha512_base.h
Date: Tue, 10 Jun 2025 19:09:23 -0700
Message-ID: <20250611020923.1482701-17-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611020923.1482701-1-ebiggers@kernel.org>
References: <20250611020923.1482701-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

sha512_base.h is no longer used, so remove it.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 include/crypto/sha512_base.h | 117 -----------------------------------
 1 file changed, 117 deletions(-)
 delete mode 100644 include/crypto/sha512_base.h

diff --git a/include/crypto/sha512_base.h b/include/crypto/sha512_base.h
deleted file mode 100644
index d1361b3eb70b0..0000000000000
--- a/include/crypto/sha512_base.h
+++ /dev/null
@@ -1,117 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * sha512_base.h - core logic for SHA-512 implementations
- *
- * Copyright (C) 2015 Linaro Ltd <ard.biesheuvel@linaro.org>
- */
-
-#ifndef _CRYPTO_SHA512_BASE_H
-#define _CRYPTO_SHA512_BASE_H
-
-#include <crypto/internal/hash.h>
-#include <crypto/sha2.h>
-#include <linux/compiler.h>
-#include <linux/math.h>
-#include <linux/string.h>
-#include <linux/types.h>
-#include <linux/unaligned.h>
-
-typedef void (sha512_block_fn)(struct sha512_state *sst, u8 const *src,
-			       int blocks);
-
-static inline int sha384_base_init(struct shash_desc *desc)
-{
-	struct sha512_state *sctx = shash_desc_ctx(desc);
-
-	sctx->state[0] = SHA384_H0;
-	sctx->state[1] = SHA384_H1;
-	sctx->state[2] = SHA384_H2;
-	sctx->state[3] = SHA384_H3;
-	sctx->state[4] = SHA384_H4;
-	sctx->state[5] = SHA384_H5;
-	sctx->state[6] = SHA384_H6;
-	sctx->state[7] = SHA384_H7;
-	sctx->count[0] = sctx->count[1] = 0;
-
-	return 0;
-}
-
-static inline int sha512_base_init(struct shash_desc *desc)
-{
-	struct sha512_state *sctx = shash_desc_ctx(desc);
-
-	sctx->state[0] = SHA512_H0;
-	sctx->state[1] = SHA512_H1;
-	sctx->state[2] = SHA512_H2;
-	sctx->state[3] = SHA512_H3;
-	sctx->state[4] = SHA512_H4;
-	sctx->state[5] = SHA512_H5;
-	sctx->state[6] = SHA512_H6;
-	sctx->state[7] = SHA512_H7;
-	sctx->count[0] = sctx->count[1] = 0;
-
-	return 0;
-}
-
-static inline int sha512_base_do_update_blocks(struct shash_desc *desc,
-					       const u8 *data,
-					       unsigned int len,
-					       sha512_block_fn *block_fn)
-{
-	unsigned int remain = len - round_down(len, SHA512_BLOCK_SIZE);
-	struct sha512_state *sctx = shash_desc_ctx(desc);
-
-	len -= remain;
-	sctx->count[0] += len;
-	if (sctx->count[0] < len)
-		sctx->count[1]++;
-	block_fn(sctx, data, len / SHA512_BLOCK_SIZE);
-	return remain;
-}
-
-static inline int sha512_base_do_finup(struct shash_desc *desc, const u8 *src,
-				       unsigned int len,
-				       sha512_block_fn *block_fn)
-{
-	unsigned int bit_offset = SHA512_BLOCK_SIZE / 8 - 2;
-	struct sha512_state *sctx = shash_desc_ctx(desc);
-	union {
-		__be64 b64[SHA512_BLOCK_SIZE / 4];
-		u8 u8[SHA512_BLOCK_SIZE * 2];
-	} block = {};
-
-	if (len >= SHA512_BLOCK_SIZE) {
-		int remain;
-
-		remain = sha512_base_do_update_blocks(desc, src, len, block_fn);
-		src += len - remain;
-		len = remain;
-	}
-
-	if (len >= bit_offset * 8)
-		bit_offset += SHA512_BLOCK_SIZE / 8;
-	memcpy(&block, src, len);
-	block.u8[len] = 0x80;
-	sctx->count[0] += len;
-	block.b64[bit_offset] = cpu_to_be64(sctx->count[1] << 3 |
-					    sctx->count[0] >> 61);
-	block.b64[bit_offset + 1] = cpu_to_be64(sctx->count[0] << 3);
-	block_fn(sctx, block.u8, (bit_offset + 2) * 8 / SHA512_BLOCK_SIZE);
-	memzero_explicit(&block, sizeof(block));
-
-	return 0;
-}
-
-static inline int sha512_base_finish(struct shash_desc *desc, u8 *out)
-{
-	unsigned int digest_size = crypto_shash_digestsize(desc->tfm);
-	struct sha512_state *sctx = shash_desc_ctx(desc);
-	__be64 *digest = (__be64 *)out;
-	int i;
-
-	for (i = 0; digest_size > 0; i++, digest_size -= sizeof(__be64))
-		put_unaligned_be64(sctx->state[i], digest++);
-	return 0;
-}
-
-#endif /* _CRYPTO_SHA512_BASE_H */
-- 
2.49.0


