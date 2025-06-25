Return-Path: <linux-mips+bounces-9479-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F852AE77DE
	for <lists+linux-mips@lfdr.de>; Wed, 25 Jun 2025 09:10:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EFA61BC4F71
	for <lists+linux-mips@lfdr.de>; Wed, 25 Jun 2025 07:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 307D52040B6;
	Wed, 25 Jun 2025 07:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eaWrFSUh"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A78202983;
	Wed, 25 Jun 2025 07:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750835429; cv=none; b=YjAorFMGnOi4nr0vqaSNhyTzHLNAHMdZ5KCuSzcE3A784Cyuc4M1Vb0S7i7zCS2GXywJ8LLK5htf8rhTcHar0tSpcWwgpaRtC6gXO+C4G/1TruJR5bEgNSFNb8LfTTdTabON3zOjP+eF271318kgVrkVYPxCqStTEgZNRo6esOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750835429; c=relaxed/simple;
	bh=MVpW9jOYl5nfA5iSMc4oN4R/qeu/fhMbVZxtFi5zdFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ee7TXIwcXbcnI7xqSwFDZuOGIRSWj1jcZ5auTcVkC6VyIm8ansi8F+8bVuGhptBhxjb+VBpPjykiARv6+n563dEbekHH8DanxMQ49gxhTUw36BzWezEy+8flathvUsaGkts5HHjE6+dg+M9Y7bwwQVRT/5lYAPNCn2p1XqvKnwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eaWrFSUh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35A21C4CEF8;
	Wed, 25 Jun 2025 07:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750835428;
	bh=MVpW9jOYl5nfA5iSMc4oN4R/qeu/fhMbVZxtFi5zdFA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eaWrFSUhcCI7riLUfFOXOKpU7RRqzyayHnNsr0WqvQSAzXanOJBDrb0E5xCtJtois
	 8LShoehuDb1UkTBdzvjnDGljGp3yrYnOf2GxQfhGzZJE6b/KqYJikZ8wgjHjdNfNPi
	 mSTR1FAb33fdLl/btE0meQ09o5r4K6cPrIg9STvdmgXdU1T4r2tm+MQ235u9xHlGPe
	 cdGa0cns8ZIr3XYa0cJBGr4rbTwGYLKfBa7QGwMZwnJsPNjVGxQI3of78cc5JJiyZm
	 wU21Gged0J0nqc1T/laJis8r+d0qh5/kKhXdRXWILByu9uENEwQX2fTTLyncyq9hrE
	 LX8wskdgDHsZg==
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
Subject: [PATCH 03/18] crypto: sha512 - Use the correct legacy export format
Date: Wed, 25 Jun 2025 00:08:04 -0700
Message-ID: <20250625070819.1496119-4-ebiggers@kernel.org>
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

It appears the legacy export format is intended to have the value of the
bytecount field be block-aligned, so update __crypto_sha512_export() and
__crypto_sha512_import() to match.

Fixes: e62c2fe56418 ("crypto: sha512 - Use same state format as legacy drivers")
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 crypto/sha512.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/crypto/sha512.c b/crypto/sha512.c
index 0eed801346018..5bda259dd22fe 100644
--- a/crypto/sha512.c
+++ b/crypto/sha512.c
@@ -13,30 +13,42 @@
 #include <linux/module.h>
 
 /*
  * Export and import functions.  crypto_shash wants a particular format that
  * matches that used by some legacy drivers.  It currently is the same as the
- * library SHA context but with the partial block length as a u8 appended to it.
+ * library SHA context, except the value in bytecount_lo must be block-aligned
+ * and the remainder must be stored in an extra u8 appended to the struct.
  */
 
 #define SHA512_SHASH_STATE_SIZE 209
 static_assert(offsetof(struct __sha512_ctx, state) == 0);
 static_assert(offsetof(struct __sha512_ctx, bytecount_lo) == 64);
 static_assert(offsetof(struct __sha512_ctx, bytecount_hi) == 72);
 static_assert(offsetof(struct __sha512_ctx, buf) == 80);
 static_assert(sizeof(struct __sha512_ctx) + 1 == SHA512_SHASH_STATE_SIZE);
 
-static int __crypto_sha512_export(const struct __sha512_ctx *ctx, void *out)
+static int __crypto_sha512_export(const struct __sha512_ctx *ctx0, void *out)
 {
-	memcpy(out, ctx, sizeof(*ctx));
-	*((u8 *)out + sizeof(*ctx)) = ctx->bytecount_lo % SHA512_BLOCK_SIZE;
+	struct __sha512_ctx ctx = *ctx0;
+	unsigned int partial;
+	u8 *p = out;
+
+	partial = ctx.bytecount_lo % SHA512_BLOCK_SIZE;
+	ctx.bytecount_lo -= partial;
+	memcpy(p, &ctx, sizeof(ctx));
+	p += sizeof(ctx);
+	*p = partial;
 	return 0;
 }
 
 static int __crypto_sha512_import(struct __sha512_ctx *ctx, const void *in)
 {
-	memcpy(ctx, in, sizeof(*ctx));
+	const u8 *p = in;
+
+	memcpy(ctx, p, sizeof(*ctx));
+	p += sizeof(*ctx);
+	ctx->bytecount_lo += *p;
 	return 0;
 }
 
 /* SHA-384 */
 
-- 
2.50.0


