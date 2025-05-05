Return-Path: <linux-mips+bounces-8913-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D89AA9B60
	for <lists+linux-mips@lfdr.de>; Mon,  5 May 2025 20:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5676B1898B67
	for <lists+linux-mips@lfdr.de>; Mon,  5 May 2025 18:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8433126FA44;
	Mon,  5 May 2025 18:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pDa53t6D"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3F626F46F;
	Mon,  5 May 2025 18:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746469164; cv=none; b=TtAMRXFfkXdY8xjIaunTdULMwMR1uqKDqO2fcF7Ew6lbV+EmQp9US71sQiEwRwk/goCidiMzIuHhOfTfwltNNWKPkc8sof7oIPBKB/Crnncc/8afuJ+dW4SoGJ4fmiuYq/Bh3K+qkb8vopdfcyAkwKWERx4BzlZwK8NYUP8l4Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746469164; c=relaxed/simple;
	bh=b/9JYhuN7J7zBR7ary1s1WvggcmHZ7V9W2w6tJgLRtw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hFInGnphNeiTFw/MsKURA2nMFKmqWqjLTtemwDft6VcxsnBMf0Qwx1S1FEsdXYqG2K7EVyg8SgbE4W/KB6cF70SgFhu7i59eqSw1hd4XcymtdAELIvsnjCbEf0LUlYntDnFFahWtT9c3CTgh3fnx07HDPohptMWulaRzau4bcIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pDa53t6D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E8EEC4CEEE;
	Mon,  5 May 2025 18:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746469163;
	bh=b/9JYhuN7J7zBR7ary1s1WvggcmHZ7V9W2w6tJgLRtw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pDa53t6DCjWYM/LmZqGF9bnJJ573ftIBSUQsp8IeHuT5N7tEcbBprRacM6EAolgWa
	 KnM4f1Ecr4wsjUKSjvQrsrEOI61Z1Nenrn/tYHyD0VxpliwIloUv60+380sygQKeFn
	 FxwIMuAGqXJ/SCu+mhdkAvNtZ/VV+Hpcs9PRhT0j3hKSDgORzS83PV0rP1IGISbSpL
	 aTZfyBqlR/WkgLr3KGW3DlBmln+QJkH1npbWh+vtLcej0hH78R6O4qdEbRHUlUrbSw
	 ke0NPkusn8yL0Rp2/trfxhRJ3n8yZzmTAV2C0r7cHVP5MRtIDrFszeZGaEVvf/LP32
	 dPGvxobHLcyGg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-bcachefs@vger.kernel.org,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Theodore Ts'o <tytso@mit.edu>
Subject: [PATCH 2/4] crypto: lib/chacha - use struct assignment to copy state
Date: Mon,  5 May 2025 11:18:22 -0700
Message-ID: <20250505181824.647138-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250505181824.647138-1-ebiggers@kernel.org>
References: <20250505181824.647138-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

Use struct assignment instead of memcpy() in lib/crypto/chacha.c where
appropriate.  No functional change.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 lib/crypto/chacha.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/lib/crypto/chacha.c b/lib/crypto/chacha.c
index a7f5eb091839..ae50e441f9fb 100644
--- a/lib/crypto/chacha.c
+++ b/lib/crypto/chacha.c
@@ -74,15 +74,13 @@ static void chacha_permute(struct chacha_state *state, int nrounds)
  * The caller has already converted the endianness of the input.  This function
  * also handles incrementing the block counter in the input matrix.
  */
 void chacha_block_generic(struct chacha_state *state, u8 *stream, int nrounds)
 {
-	struct chacha_state permuted_state;
+	struct chacha_state permuted_state = *state;
 	int i;
 
-	memcpy(permuted_state.x, state->x, 64);
-
 	chacha_permute(&permuted_state, nrounds);
 
 	for (i = 0; i < ARRAY_SIZE(state->x); i++)
 		put_unaligned_le32(permuted_state.x[i] + state->x[i],
 				   &stream[i * sizeof(u32)]);
@@ -103,13 +101,11 @@ EXPORT_SYMBOL(chacha_block_generic);
  * of the state.  It should not be used for streaming directly.
  */
 void hchacha_block_generic(const struct chacha_state *state,
 			   u32 *stream, int nrounds)
 {
-	struct chacha_state permuted_state;
-
-	memcpy(permuted_state.x, state->x, 64);
+	struct chacha_state permuted_state = *state;
 
 	chacha_permute(&permuted_state, nrounds);
 
 	memcpy(&stream[0], &permuted_state.x[0], 16);
 	memcpy(&stream[4], &permuted_state.x[12], 16);
-- 
2.49.0


