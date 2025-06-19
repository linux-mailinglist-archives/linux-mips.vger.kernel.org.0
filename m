Return-Path: <linux-mips+bounces-9434-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C733AE0FCC
	for <lists+linux-mips@lfdr.de>; Fri, 20 Jun 2025 00:56:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A10753BEDEF
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 22:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4457328C00B;
	Thu, 19 Jun 2025 22:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nde8eq+r"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095BD25E478;
	Thu, 19 Jun 2025 22:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750373798; cv=none; b=uJp4OnEyHBCORJXOOLkQBzckpd9NNJ4mXWmfb5OjQCMv5QuT3M8dYyai11SEPGz/kBZfeAFmLx9segYplRtjd8pcE9fNYUWt/MzmxCS2GYYjwNKct/OqKzquBkhGVTuwng0hWDJD2W8LIZWIvsCwAwBBk81dioQEZGp4/U2HSJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750373798; c=relaxed/simple;
	bh=UzPt9sdsQLdNib/j6Er/NNyzs7bxjPti+YIh2O07cks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GFwvqkTWqPnHOThvLh1FlWjYVPMy9msSHwLg5H8CEwMyO+6n/WKb3DvD3l65R7V2mSCzPjhOkP8fD65OyfRxezzUTvZLUKacjFiFfMyqv50S8F3BM0v/AQT3vq5QDDhOzcQkpUeN6++p7RwYddvgY1IqREwa4JNyg5obD+eo1tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nde8eq+r; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F4A6C4CEEA;
	Thu, 19 Jun 2025 22:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750373797;
	bh=UzPt9sdsQLdNib/j6Er/NNyzs7bxjPti+YIh2O07cks=;
	h=From:To:Cc:Subject:Date:From;
	b=Nde8eq+rYOu10Ukd5BPNu7CCiAmyo4obYligYd/Fbb0UtvZq95d7nMTUyzg4AIMAw
	 uwSdVINM2fIP71NI+WQrf39YT169lLcV7shEmmYRGv52IvcBDUmyinKboGjTmPWjHP
	 /8asLaV/AZr5L5cQof+/99rb4xl8/qO92UtEgliDM6bLZqiyrfhl52tA1Z7sqFeW/H
	 uM1tExk6QNeKLJAFoWhZFAYyQnetB2OHHrBQ3pj+hgAr7nkl+Wy6lZv9SUYIWGo5+O
	 BbcCXjKtVSHcRBsg+pMUKWU+72KRjg34ZPS3nh7ZbvT59FoY50Buh91HT5sz3j2C1i
	 b7yt6r6mG4szg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	=?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
	linux-mips@vger.kernel.org,
	llvm@lists.linux.dev,
	stable@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] lib/crypto: mips/chacha: Fix clang build and remove unneeded byteswap
Date: Thu, 19 Jun 2025 15:55:35 -0700
Message-ID: <20250619225535.679301-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MIPS32r2 ChaCha code has never been buildable with the clang
assembler.  First, clang doesn't support the 'rotl' pseudo-instruction:

    error: unknown instruction, did you mean: rol, rotr?

Second, clang requires that both operands of the 'wsbh' instruction be
explicitly given:

    error: too few operands for instruction

To fix this, align the code with the real instruction set by (1) using
the real instruction 'rotr' instead of the nonstandard pseudo-
instruction 'rotl', and (2) explicitly giving both operands to 'wsbh'.

To make removing the use of 'rotl' a bit easier, also remove the
unnecessary special-casing for big endian CPUs at
.Lchacha_mips_xor_bytes.  The tail handling is actually
endian-independent since it processes one byte at a time.  On big endian
CPUs the old code byte-swapped SAVED_X, then iterated through it in
reverse order.  But the byteswap and reverse iteration canceled out.

Tested with chacha20poly1305-selftest in QEMU using "-M malta" with both
little endian and big endian mips32r2 kernels.

Fixes: 49aa7c00eddf ("crypto: mips/chacha - import 32r2 ChaCha code from Zinc")
Cc: stable@vger.kernel.org
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505080409.EujEBwA0-lkp@intel.com/
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---

This applies on top of other pending lib/crypto patches and can be
retrieved from git at:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git mips-chacha-fix

 lib/crypto/mips/chacha-core.S | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/lib/crypto/mips/chacha-core.S b/lib/crypto/mips/chacha-core.S
index 5755f69cfe007..706aeb850fb0d 100644
--- a/lib/crypto/mips/chacha-core.S
+++ b/lib/crypto/mips/chacha-core.S
@@ -53,21 +53,17 @@
 #define IS_UNALIGNED	$s7
 
 #if __BYTE_ORDER__ == __ORDER_BIG_ENDIAN__
 #define MSB 0
 #define LSB 3
-#define ROTx rotl
-#define ROTR(n) rotr n, 24
 #define	CPU_TO_LE32(n) \
-	wsbh	n; \
+	wsbh	n, n; \
 	rotr	n, 16;
 #else
 #define MSB 3
 #define LSB 0
-#define ROTx rotr
 #define CPU_TO_LE32(n)
-#define ROTR(n)
 #endif
 
 #define FOR_EACH_WORD(x) \
 	x( 0); \
 	x( 1); \
@@ -190,14 +186,14 @@ CONCAT3(.Lchacha_mips_xor_aligned_, PLUS_ONE(x), _b: ;) \
 	addu	X(D), X(N); \
 	xor	X(V), X(A); \
 	xor	X(W), X(B); \
 	xor	X(Y), X(C); \
 	xor	X(Z), X(D); \
-	rotl	X(V), S;    \
-	rotl	X(W), S;    \
-	rotl	X(Y), S;    \
-	rotl	X(Z), S;
+	rotr	X(V), 32 - S; \
+	rotr	X(W), 32 - S; \
+	rotr	X(Y), 32 - S; \
+	rotr	X(Z), 32 - S;
 
 .text
 .set	reorder
 .set	noat
 .globl	chacha_crypt_arch
@@ -370,25 +366,23 @@ chacha_crypt_arch:
 	addu	IN, $at
 	addu	OUT, $at
 	/* First byte */
 	lbu	T1, 0(IN)
 	addiu	$at, BYTES, 1
-	CPU_TO_LE32(SAVED_X)
-	ROTR(SAVED_X)
 	xor	T1, SAVED_X
 	sb	T1, 0(OUT)
 	beqz	$at, .Lchacha_mips_xor_done
 	/* Second byte */
 	lbu	T1, 1(IN)
 	addiu	$at, BYTES, 2
-	ROTx	SAVED_X, 8
+	rotr	SAVED_X, 8
 	xor	T1, SAVED_X
 	sb	T1, 1(OUT)
 	beqz	$at, .Lchacha_mips_xor_done
 	/* Third byte */
 	lbu	T1, 2(IN)
-	ROTx	SAVED_X, 8
+	rotr	SAVED_X, 8
 	xor	T1, SAVED_X
 	sb	T1, 2(OUT)
 	b	.Lchacha_mips_xor_done
 
 .Lchacha_mips_no_full_block_unaligned:
-- 
2.50.0


