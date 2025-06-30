Return-Path: <linux-mips+bounces-9565-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44ED3AEE384
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 18:08:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B6BA3BA8EF
	for <lists+linux-mips@lfdr.de>; Mon, 30 Jun 2025 16:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8637C29DB7E;
	Mon, 30 Jun 2025 16:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t3JvUmlQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEF929C32B;
	Mon, 30 Jun 2025 16:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751299529; cv=none; b=VQJDeB+VSuYt1JFAwOhMrLhwY5hCNdFNNGVTBbYeE9HL5wBYvCV694WRkEMSwBXoTkdVAkKFtjx5JISKRHyglB2H7SxJKswpO9IdUZ+jXSBu9xyxAhXVOQfK5wc2AKWuyJMWjQ3UM7uF7K6qJLzKMszoA9HvoLpXMBGn9a4dBCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751299529; c=relaxed/simple;
	bh=x0Z9wiotmf8jNMw5UZ8kqkasukLKKyE27l+fQpQiAtU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GFFvxuuGKV04Wbc56Bd7SIOTUTrh0tC2EcT0XLPOKEgMLjdybN5oXDpghcWh6Lyoqfta8EtfanxS3jw5+dRgdHgNXt6eJmjbxQULRb9m6XWrjuQoTvQH8ZD/z+4J0Wydx4JI8JSI54AYNnmuqtsVfqPWnPRcK4OQEX2fpftXZqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t3JvUmlQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B986C4CEF3;
	Mon, 30 Jun 2025 16:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299528;
	bh=x0Z9wiotmf8jNMw5UZ8kqkasukLKKyE27l+fQpQiAtU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t3JvUmlQQ4INyHMwXd8NDAuXQfblNIw7bb2A+AkbC1bEfjMvbGr9VVWYBufCEWja+
	 vRPcUj3Eh3HA5CCYjFNEPIvrkd5V+fCYMMRfLjgfRMBAOIDzx501JkRTOw24STASVN
	 GlXEfFZ4QhPwvdzhL7Brq7NcN40QmKVHP3lciFUL9Eh22O7hkrRSsErLEcExvfFcRk
	 RtTIKQjSwaglVhNVylmaJW3TUINxj06OACBE4anK4ueu1Kh2nnmHyNEfuaK4GIntCE
	 GlPmSy5LDlWkdSrGWFPNlZVad3KFf1R78b5H9wRTMsFkiIVpiIi4UYjq+LAS4uKKW9
	 oLn9LSYQOwH8Q==
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
Subject: [PATCH v3 15/16] lib/crypto: x86/sha512: Remove unnecessary checks for nblocks==0
Date: Mon, 30 Jun 2025 09:03:19 -0700
Message-ID: <20250630160320.2888-16-ebiggers@kernel.org>
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

Since sha512_blocks() is called only with nblocks >= 1, remove
unnecessary checks for nblocks == 0 from the x86 SHA-512 assembly code.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/x86/sha512-avx-asm.S   | 6 +-----
 lib/crypto/x86/sha512-avx2-asm.S  | 5 +----
 lib/crypto/x86/sha512-ssse3-asm.S | 6 +-----
 3 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/lib/crypto/x86/sha512-avx-asm.S b/lib/crypto/x86/sha512-avx-asm.S
index 0b5f69179d624..7732aa8fd8506 100644
--- a/lib/crypto/x86/sha512-avx-asm.S
+++ b/lib/crypto/x86/sha512-avx-asm.S
@@ -270,17 +270,14 @@ frame_size = frame_WK + WK_SIZE
 #			    const u8 *data, size_t nblocks);
 # Purpose: Updates the SHA512 digest stored at "state" with the message
 # stored in "data".
 # The size of the message pointed to by "data" must be an integer multiple
 # of SHA512 message blocks.
-# "nblocks" is the message length in SHA512 blocks
+# "nblocks" is the message length in SHA512 blocks.  Must be >= 1.
 ########################################################################
 SYM_FUNC_START(sha512_transform_avx)
 
-	test msglen, msglen
-	je .Lnowork
-
 	# Save GPRs
 	push	%rbx
 	push	%r12
 	push	%r13
 	push	%r14
@@ -360,11 +357,10 @@ SYM_FUNC_START(sha512_transform_avx)
 	pop	%r14
 	pop	%r13
 	pop	%r12
 	pop	%rbx
 
-.Lnowork:
 	RET
 SYM_FUNC_END(sha512_transform_avx)
 
 ########################################################################
 ### Binary Data
diff --git a/lib/crypto/x86/sha512-avx2-asm.S b/lib/crypto/x86/sha512-avx2-asm.S
index 2309c01e316b9..22bdbfd899d0f 100644
--- a/lib/crypto/x86/sha512-avx2-asm.S
+++ b/lib/crypto/x86/sha512-avx2-asm.S
@@ -562,11 +562,11 @@ frame_size = frame_CTX + CTX_SIZE
 #			     const u8 *data, size_t nblocks);
 # Purpose: Updates the SHA512 digest stored at "state" with the message
 # stored in "data".
 # The size of the message pointed to by "data" must be an integer multiple
 # of SHA512 message blocks.
-# "nblocks" is the message length in SHA512 blocks
+# "nblocks" is the message length in SHA512 blocks.  Must be >= 1.
 ########################################################################
 SYM_FUNC_START(sha512_transform_rorx)
 
 	# Save GPRs
 	push	%rbx
@@ -580,11 +580,10 @@ SYM_FUNC_START(sha512_transform_rorx)
 	mov	%rsp, %rbp
 	sub	$frame_size, %rsp
 	and	$~(0x20 - 1), %rsp
 
 	shl	$7, NUM_BLKS	# convert to bytes
-	jz	.Ldone_hash
 	add	INP, NUM_BLKS	# pointer to end of data
 	mov	NUM_BLKS, frame_INPEND(%rsp)
 
 	## load initial digest
 	mov	8*0(CTX1), a
@@ -666,12 +665,10 @@ SYM_FUNC_START(sha512_transform_rorx)
 	mov	frame_INP(%rsp), INP
 	add	$128, INP
 	cmp	frame_INPEND(%rsp), INP
 	jne	.Lloop0
 
-.Ldone_hash:
-
 	# Restore Stack Pointer
 	mov	%rbp, %rsp
 	pop	%rbp
 
 	# Restore GPRs
diff --git a/lib/crypto/x86/sha512-ssse3-asm.S b/lib/crypto/x86/sha512-ssse3-asm.S
index 12e78142f2e38..4cae7445b2a86 100644
--- a/lib/crypto/x86/sha512-ssse3-asm.S
+++ b/lib/crypto/x86/sha512-ssse3-asm.S
@@ -269,17 +269,14 @@ frame_size = frame_WK + WK_SIZE
 #			      const u8 *data, size_t nblocks);
 # Purpose: Updates the SHA512 digest stored at "state" with the message
 # stored in "data".
 # The size of the message pointed to by "data" must be an integer multiple
 # of SHA512 message blocks.
-# "nblocks" is the message length in SHA512 blocks
+# "nblocks" is the message length in SHA512 blocks.  Must be >= 1.
 ########################################################################
 SYM_FUNC_START(sha512_transform_ssse3)
 
-	test msglen, msglen
-	je .Lnowork
-
 	# Save GPRs
 	push	%rbx
 	push	%r12
 	push	%r13
 	push	%r14
@@ -359,11 +356,10 @@ SYM_FUNC_START(sha512_transform_ssse3)
 	pop	%r14
 	pop	%r13
 	pop	%r12
 	pop	%rbx
 
-.Lnowork:
 	RET
 SYM_FUNC_END(sha512_transform_ssse3)
 
 ########################################################################
 ### Binary Data
-- 
2.50.0


