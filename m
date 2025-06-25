Return-Path: <linux-mips+bounces-9493-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E192CAE7841
	for <lists+linux-mips@lfdr.de>; Wed, 25 Jun 2025 09:15:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24AFA6A03E2
	for <lists+linux-mips@lfdr.de>; Wed, 25 Jun 2025 07:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 877422264C7;
	Wed, 25 Jun 2025 07:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bH9JuMjc"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576112264BA;
	Wed, 25 Jun 2025 07:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750835436; cv=none; b=qFWhXB/IsvntcnkE6NmnEO68jqCh7pmuI4ztbuK0SP9VMCZytrN1QTfxrfku4WANikc+moWDphiLm4BzBTyNBUbNlT1vXpqc4098jeb3+JW7TmyG/FeHe+or5uTe45S3lnfy8Y7qf3Ovv0lKhhj1UuKKsivgnfwFBc3rUk0Za98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750835436; c=relaxed/simple;
	bh=Y+OM4xhFGnbbVJB2/pk7w3PVA+sL8KWZ8Ahn07y2y1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L0dCymTNOtzycKi51/FhbJFNUR8a9wsr0F/qNxoknrIh/I9vIUnCrV+03F+ZYP3HTBJ58KQX9OMyV6gJf6O+w/SNPTd0nYl08SibQ0lJ9ujrVVn5YrdTz6ObPVBUz2/cmJtM3/RS1HS4UciNSqVAWSuvyJGihB8SiUy7j/odaZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bH9JuMjc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EFCAC4CEF2;
	Wed, 25 Jun 2025 07:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750835435;
	bh=Y+OM4xhFGnbbVJB2/pk7w3PVA+sL8KWZ8Ahn07y2y1A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bH9JuMjcvx3J7GtUczSjT11nGI4YWbo07MYlZLzC2HhSWEMCp2w/3F76EUQDdl9aH
	 x3U0E8JYWVjle7diqxhGtq75vEUoC36KAdmOt5ehtup8q9m0RB23nlpgatFdW+xPro
	 JnvpTRlkc04oJMwRgnosZlVo8rkhPtz1xEyaez2xP71hb1UjwpZwEHoEgz9hwvZZ8w
	 Xg73giZDP2UVojmC6ER8rObGC/udaKqdU8qwkmAQlqBDk2z567b670tXgzD5vy92Bv
	 LTPxk9gDYjyHb92F+u8ONsV4Eu9yHAg8GfgBAM3Y1PeC6Az6HX0fnNqfEvvqWnzfdm
	 PfOgccGBMYwtA==
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
Subject: [PATCH 17/18] lib/crypto: sha256: Sync sha256_update() with sha512_update()
Date: Wed, 25 Jun 2025 00:08:18 -0700
Message-ID: <20250625070819.1496119-18-ebiggers@kernel.org>
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

The BLOCK_HASH_UPDATE_BLOCKS macro is difficult to read.  For now, let's
just write the update explicitly in the straightforward way, mirroring
sha512_update().  It's possible that we'll bring back a macro for this
later, but it needs to be properly justified and hopefully a bit more
readable.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/sha256.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/lib/crypto/sha256.c b/lib/crypto/sha256.c
index 0de49bf8e8b8b..c93bf4699160c 100644
--- a/lib/crypto/sha256.c
+++ b/lib/crypto/sha256.c
@@ -8,11 +8,10 @@
  * Copyright (c) 2014 Red Hat Inc.
  * Copyright 2025 Google LLC
  */
 
 #include <crypto/hmac.h>
-#include <crypto/internal/blockhash.h>
 #include <crypto/sha2.h>
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/unaligned.h>
@@ -177,12 +176,35 @@ EXPORT_SYMBOL_GPL(sha256_init);
 void __sha256_update(struct __sha256_ctx *ctx, const u8 *data, size_t len)
 {
 	size_t partial = ctx->bytecount % SHA256_BLOCK_SIZE;
 
 	ctx->bytecount += len;
-	BLOCK_HASH_UPDATE_BLOCKS(sha256_blocks, &ctx->state, data, len,
-				 SHA256_BLOCK_SIZE, ctx->buf, partial);
+
+	if (partial + len >= SHA256_BLOCK_SIZE) {
+		size_t nblocks;
+
+		if (partial) {
+			size_t l = SHA256_BLOCK_SIZE - partial;
+
+			memcpy(&ctx->buf[partial], data, l);
+			data += l;
+			len -= l;
+
+			sha256_blocks(&ctx->state, ctx->buf, 1);
+		}
+
+		nblocks = len / SHA256_BLOCK_SIZE;
+		len %= SHA256_BLOCK_SIZE;
+
+		if (nblocks) {
+			sha256_blocks(&ctx->state, data, nblocks);
+			data += nblocks * SHA256_BLOCK_SIZE;
+		}
+		partial = 0;
+	}
+	if (len)
+		memcpy(&ctx->buf[partial], data, len);
 }
 EXPORT_SYMBOL(__sha256_update);
 
 static void __sha256_final(struct __sha256_ctx *ctx,
 			   u8 *out, size_t digest_size)
-- 
2.50.0


