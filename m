Return-Path: <linux-mips+bounces-9766-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FB5B02D8F
	for <lists+linux-mips@lfdr.de>; Sun, 13 Jul 2025 01:26:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1300F189E7F0
	for <lists+linux-mips@lfdr.de>; Sat, 12 Jul 2025 23:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72FBA230D1E;
	Sat, 12 Jul 2025 23:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FLdhoQ9O"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E76C230BC5;
	Sat, 12 Jul 2025 23:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752362781; cv=none; b=T5XCjrEY9BwXLpSGBrRO9TAjaRc7ygDdKbpXWT4Yfsi817QLEXbuhxbsJrMFXodKLsFQQ82uCJfh/F6yiuqBKBnKSyBpKCF9gJTRcXx9VpFoqPGXEqNTa/cgcYyKcZnzwWlQnwGg7neKZ92AmW5U7dg7fIC+SDmZNB7drZosgyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752362781; c=relaxed/simple;
	bh=8Vb27gWyZe63wNRoxap9QiheYDb0OlWgd9TqwRTjPok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=diUDn8Jhs7twJelNSQspg2y1gPvNYXJhjMrHWIODuDnJdHNbzZH332rQfzdO00XOAutRfUVahbLmSOGJXK4c6bo1+IKNTZG3xI/yMTbTLhBzGdpRQO6CJ6FsS2+xMXZnSaXO41OyrtOKwhuUz6otEoLrTCQDddjWEK5dVqjn0kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FLdhoQ9O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F89CC4CEF1;
	Sat, 12 Jul 2025 23:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752362780;
	bh=8Vb27gWyZe63wNRoxap9QiheYDb0OlWgd9TqwRTjPok=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FLdhoQ9O/rEdQQwDfB++qTeJwUvBRaf0giyFlD0IE9HPCHMIxwRbbPZX6O9u0CZjm
	 1S7td9m5IXWuVpnSg/lTQZoSA8mLrhcxCEDqQskG1J2oHW5dy7RINPivna14fk/R8B
	 gWAVbX+5VllXd3iKDgmQQHr9MQexHmWBc6Z7aOQc4C9Fwh4fK6K91WkCXRGU1rSLYk
	 6jWE5tjg5pnd6IcAkotb4VGlAL+H2SxWbnMZRfBajfIAsz67vR45SAVVWMThixpDBx
	 g4AqUUXLUdKDs0Wb0sr/Mv7RDTWACPNNTvEudIe/btKC3CDRVi5U5opkfD1yPWVEvt
	 DswyfbkvbZOAg==
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
Subject: [PATCH 01/26] crypto: x86/sha1 - Rename conflicting symbol
Date: Sat, 12 Jul 2025 16:22:52 -0700
Message-ID: <20250712232329.818226-2-ebiggers@kernel.org>
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

Rename x86's sha1_update() to sha1_update_x86(), since it conflicts with
the upcoming sha1_update() library function.

Note: the affected code will be superseded by later commits that migrate
the arch-optimized SHA-1 code into the library.  This commit simply
keeps the kernel building for the initial introduction of the library.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/x86/crypto/sha1_ssse3_glue.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/x86/crypto/sha1_ssse3_glue.c b/arch/x86/crypto/sha1_ssse3_glue.c
index 0a912bfc86c51..826579a7473c4 100644
--- a/arch/x86/crypto/sha1_ssse3_glue.c
+++ b/arch/x86/crypto/sha1_ssse3_glue.c
@@ -32,11 +32,11 @@ static const struct x86_cpu_id module_cpu_ids[] = {
 	X86_MATCH_FEATURE(X86_FEATURE_SSSE3, NULL),
 	{}
 };
 MODULE_DEVICE_TABLE(x86cpu, module_cpu_ids);
 
-static inline int sha1_update(struct shash_desc *desc, const u8 *data,
+static inline int sha1_update_x86(struct shash_desc *desc, const u8 *data,
 			      unsigned int len, sha1_block_fn *sha1_xform)
 {
 	int remain;
 
 	/*
@@ -67,11 +67,11 @@ asmlinkage void sha1_transform_ssse3(struct sha1_state *state,
 				     const u8 *data, int blocks);
 
 static int sha1_ssse3_update(struct shash_desc *desc, const u8 *data,
 			     unsigned int len)
 {
-	return sha1_update(desc, data, len, sha1_transform_ssse3);
+	return sha1_update_x86(desc, data, len, sha1_transform_ssse3);
 }
 
 static int sha1_ssse3_finup(struct shash_desc *desc, const u8 *data,
 			      unsigned int len, u8 *out)
 {
@@ -111,11 +111,11 @@ asmlinkage void sha1_transform_avx(struct sha1_state *state,
 				   const u8 *data, int blocks);
 
 static int sha1_avx_update(struct shash_desc *desc, const u8 *data,
 			     unsigned int len)
 {
-	return sha1_update(desc, data, len, sha1_transform_avx);
+	return sha1_update_x86(desc, data, len, sha1_transform_avx);
 }
 
 static int sha1_avx_finup(struct shash_desc *desc, const u8 *data,
 			      unsigned int len, u8 *out)
 {
@@ -188,11 +188,11 @@ static inline void sha1_apply_transform_avx2(struct sha1_state *state,
 }
 
 static int sha1_avx2_update(struct shash_desc *desc, const u8 *data,
 			     unsigned int len)
 {
-	return sha1_update(desc, data, len, sha1_apply_transform_avx2);
+	return sha1_update_x86(desc, data, len, sha1_apply_transform_avx2);
 }
 
 static int sha1_avx2_finup(struct shash_desc *desc, const u8 *data,
 			      unsigned int len, u8 *out)
 {
@@ -232,11 +232,11 @@ asmlinkage void sha1_ni_transform(struct sha1_state *digest, const u8 *data,
 				  int rounds);
 
 static int sha1_ni_update(struct shash_desc *desc, const u8 *data,
 			     unsigned int len)
 {
-	return sha1_update(desc, data, len, sha1_ni_transform);
+	return sha1_update_x86(desc, data, len, sha1_ni_transform);
 }
 
 static int sha1_ni_finup(struct shash_desc *desc, const u8 *data,
 			      unsigned int len, u8 *out)
 {
-- 
2.50.1


