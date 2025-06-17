Return-Path: <linux-mips+bounces-9369-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C9806ADDEE4
	for <lists+linux-mips@lfdr.de>; Wed, 18 Jun 2025 00:30:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A7F87AC653
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 22:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8CC42BEC28;
	Tue, 17 Jun 2025 22:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CKc8qPKa"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848BE2BDC28;
	Tue, 17 Jun 2025 22:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750199401; cv=none; b=BgCCOCkPbzR1L9D8Ecpx5aa93WQFwkTv+hpFyHcyRbB+/q5U/2j2CYSHllVFoXHJJV3OA2pCSOtB+3XM2kJc0awRk8U9IVLPZYZRfO9hU0HHG71kPgW2HW/pV4EuOiTswe8mA8IQSvwBwv25ItC8HZGvQAkOozcFXlmX390qPvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750199401; c=relaxed/simple;
	bh=hkPIvoqxShZhMTTDhLVtDi8Yqmn39FL66nVo8qVRu1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XNjtubKqPUZ3qCEMKpSvblnHExajfaCawLTN+k4lXIS7JJ7hJJQUPIMMJk/2PhERzXngzwaD3gUanLcais3siwoY7Hp8SdSrtvaV0JA83hlNzvlF6LcxwuO5/o0LNW7rrER3sWLZ2iHgJG9Qb09L2XqZAgrVCsS1GJhrHz2l78o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CKc8qPKa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC62AC4CEF6;
	Tue, 17 Jun 2025 22:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750199401;
	bh=hkPIvoqxShZhMTTDhLVtDi8Yqmn39FL66nVo8qVRu1Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CKc8qPKacvgviafDJA8lSI2yrliEIiRaHqww9PSNVArp3EkmSThFIj0ix9/MqJPwg
	 3t0MqZLXdwckLnEcpIcbnuhL8zrVWrFYzDDuEke7tXOvMfDa3J7RRrKLmU+uetbjZ4
	 bG1iU16tXN1rrqNMaQxv+54OWdd/MEWLvXU9V0sacQR86Pehnf0mSBErESrSvBLLqb
	 ntGC/IsNfd2afRrg89OWW2gQnIbUZFr5ADvscwB9ZsXqG8WMWm0JAyG4OPxWA5H3Q7
	 T9Uy/6lgMcgbVxTl3aSfMvp3Nmeamfxr1OxiYp1oJMF4LdCD3rAm7+Q0WUupeSaq0t
	 O5Ni41xVr1NEw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 7/9] lib/crypto/sparc: move arch/sparc/lib/crypto/ to lib/crypto/sparc/
Date: Tue, 17 Jun 2025 15:27:24 -0700
Message-ID: <20250617222726.365148-8-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617222726.365148-1-ebiggers@kernel.org>
References: <20250617222726.365148-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

Move the contents of arch/sparc/lib/crypto/ into lib/crypto/sparc/.

The new code organization makes a lot more sense for how this code
actually works and is developed.  In particular, it makes it possible to
build each algorithm as a single module, with better inlining and dead
code elimination.  For a more detailed explanation, see the patchset
which did this for the CRC library code:
https://lore.kernel.org/r/20250607200454.73587-1-ebiggers@kernel.org/.
Also see the patchset which did this for SHA-512:
https://lore.kernel.org/linux-crypto/20250616014019.415791-1-ebiggers@kernel.org/

This is just a preparatory commit, which does the move to get the files
into their new location but keeps them building the same way as before.
Later commits will make the actual improvements to the way the
arch-optimized code is integrated for each algorithm.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/sparc/lib/Makefile                                  | 1 -
 lib/crypto/Kconfig                                       | 2 +-
 lib/crypto/Makefile                                      | 1 +
 {arch/sparc/lib/crypto => lib/crypto/sparc}/Kconfig      | 0
 {arch/sparc/lib/crypto => lib/crypto/sparc}/Makefile     | 0
 {arch/sparc/lib/crypto => lib/crypto/sparc}/sha256.c     | 0
 {arch/sparc/lib/crypto => lib/crypto/sparc}/sha256_asm.S | 0
 7 files changed, 2 insertions(+), 2 deletions(-)
 rename {arch/sparc/lib/crypto => lib/crypto/sparc}/Kconfig (100%)
 rename {arch/sparc/lib/crypto => lib/crypto/sparc}/Makefile (100%)
 rename {arch/sparc/lib/crypto => lib/crypto/sparc}/sha256.c (100%)
 rename {arch/sparc/lib/crypto => lib/crypto/sparc}/sha256_asm.S (100%)

diff --git a/arch/sparc/lib/Makefile b/arch/sparc/lib/Makefile
index 5cf9781d68b40..ef8860eb3f3d1 100644
--- a/arch/sparc/lib/Makefile
+++ b/arch/sparc/lib/Makefile
@@ -2,11 +2,10 @@
 # Makefile for Sparc library files..
 #
 
 asflags-y := -ansi -DST_DIV0=0x02
 
-obj-y                 += crypto/
 lib-$(CONFIG_SPARC32) += ashrdi3.o
 lib-$(CONFIG_SPARC32) += memcpy.o memset.o
 lib-y                 += strlen.o
 lib-y                 += checksum_$(BITS).o
 lib-$(CONFIG_SPARC32) += blockops.o
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 278b7ef5ec4f9..b98543c7ef231 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -206,11 +206,11 @@ source "lib/crypto/riscv/Kconfig"
 endif
 if S390
 source "lib/crypto/s390/Kconfig"
 endif
 if SPARC
-source "arch/sparc/lib/crypto/Kconfig"
+source "lib/crypto/sparc/Kconfig"
 endif
 if X86
 source "arch/x86/lib/crypto/Kconfig"
 endif
 endif
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 4cda1f5cd21d4..748d1fc6b6be2 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -107,5 +107,6 @@ obj-$(CONFIG_ARM) += arm/
 obj-$(CONFIG_ARM64) += arm64/
 obj-$(CONFIG_MIPS) += mips/
 obj-$(CONFIG_PPC) += powerpc/
 obj-$(CONFIG_RISCV) += riscv/
 obj-$(CONFIG_S390) += s390/
+obj-$(CONFIG_SPARC) += sparc/
diff --git a/arch/sparc/lib/crypto/Kconfig b/lib/crypto/sparc/Kconfig
similarity index 100%
rename from arch/sparc/lib/crypto/Kconfig
rename to lib/crypto/sparc/Kconfig
diff --git a/arch/sparc/lib/crypto/Makefile b/lib/crypto/sparc/Makefile
similarity index 100%
rename from arch/sparc/lib/crypto/Makefile
rename to lib/crypto/sparc/Makefile
diff --git a/arch/sparc/lib/crypto/sha256.c b/lib/crypto/sparc/sha256.c
similarity index 100%
rename from arch/sparc/lib/crypto/sha256.c
rename to lib/crypto/sparc/sha256.c
diff --git a/arch/sparc/lib/crypto/sha256_asm.S b/lib/crypto/sparc/sha256_asm.S
similarity index 100%
rename from arch/sparc/lib/crypto/sha256_asm.S
rename to lib/crypto/sparc/sha256_asm.S
-- 
2.49.0


