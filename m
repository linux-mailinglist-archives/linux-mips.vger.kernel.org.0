Return-Path: <linux-mips+bounces-9566-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBBF4AEE392
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 18:09:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF69B1BC1368
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 16:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF0C32BDC28;
	Mon, 30 Jun 2025 16:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="No3QeIRm"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95AA2BD5AB;
	Mon, 30 Jun 2025 16:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751299529; cv=none; b=OSpSgpcWVM6Yqk8hRbChkPZGshW2FudL9qXdJj2rk3aJAC4NBStB28WE78/kVJWpkfUkXHPtGCKvt1OUKbzZSNcxI9prQIFaXKK9tfe8cYlonHuIN47At8e57XNeNFS6BqYlbYdoisEpYcFsw1VkaYaX7pGnRQaWHHf+GJVK3PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751299529; c=relaxed/simple;
	bh=Re8d5TuPUDJdqxyH89C7qlYblbZnrA5EjF86KsH1XwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bCupi5/YrAnmdOaaKnBw22Da6MA5Z5mKy+kRF8lgcZ1mcYDeqlud4sVwlv9TSxIoY8z5S5hlispsx3d9DkSGkMcmAC65KWiD2gOg4VW9f9IP2Nb2XWExw+3O+j3FV/5Tuw21+q+78755UQmXtmGhNc7+1T+WGiHPEmlqRuKdjps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=No3QeIRm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AA2BC4CEF2;
	Mon, 30 Jun 2025 16:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299529;
	bh=Re8d5TuPUDJdqxyH89C7qlYblbZnrA5EjF86KsH1XwY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=No3QeIRmm7nlNERtKsn+ZyD7ApGiWkaIJk7FG/8b02RBvVt8BnEm4mMr1kGFRguX7
	 bZse8gOMDl2RguH9Al5RMXRfo4nMMB50ohKZVkdfhLnFRIrOxW9gvzUC+n00XH0+iY
	 9TH1JM6PrKklHfOntc9odhZozTrfFL7mhOzBliq2FCV5TlP968eIkkL1Ao0AXuC2Xd
	 aiiB+i1f+mH0ulGtZTu7oHtA749yaAWdo2f/7TRILzujisMvwU7MP9ogNQ3M17vTMJ
	 4Qx9NLxIq4BVav5bn31e4LZnHmRGclQY/IXM+CjEJBahQ5XnqBxt8dyb/U4BzbSsRz
	 tM1D5LSdhxLZg==
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
Subject: [PATCH v3 16/16] crypto: sha512 - Remove sha512_base.h
Date: Mon, 30 Jun 2025 09:03:20 -0700
Message-ID: <20250630160320.2888-17-ebiggers@kernel.org>
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

sha512_base.h is no longer used, so remove it.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
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
2.50.0


