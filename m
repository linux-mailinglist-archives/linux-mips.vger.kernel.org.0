Return-Path: <linux-mips+bounces-9370-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AB88DADDEF1
	for <lists+linux-mips@lfdr.de>; Wed, 18 Jun 2025 00:31:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAA4B3BCCB7
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 22:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3153F2E54D3;
	Tue, 17 Jun 2025 22:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rxMqdTMQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3AE62C0327;
	Tue, 17 Jun 2025 22:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750199402; cv=none; b=FvnA9/mJ0ymYTTeRvk9uFHLQh3+0dITuGPpCgRctFP6jwlQ0qVwYU5Ms/1y+gnIspFp386u7E24Gn3yaxMbsHQ1lLGM3FdQSo61KDFiaZGxpIUyIiLjJ+twBC4JSf9VtqMT+xbSUz0FSVUHs2MsKG54LcvNoSPgOHG1qtY6DCh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750199402; c=relaxed/simple;
	bh=8jdu9LHzVRz1BNvZSq3ZYEM4B1Z0nZLxiOO9k8V1IZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qj2nH6G7TAeiPsd9hwhh8XlIoGKfA5W/DNLAoRTCvt2yJJ+OwIbvMP3bnkIWgjbvO6T2blsEjbQBhYTgwlVyscuAA1HStB+uPeOdwO7X2ENrKdcIGWu2pLEpe9ucrpvNdnQj1jPiP9wQMCY4n7JlHNm0auMenuDzWTLn+dwvy50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rxMqdTMQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C3B4C4AF0D;
	Tue, 17 Jun 2025 22:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750199401;
	bh=8jdu9LHzVRz1BNvZSq3ZYEM4B1Z0nZLxiOO9k8V1IZ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rxMqdTMQBGpK7NKz+2Cv8yBMwsWxMBeJd9bTUuyDkYX7YYU+jrxrDq8PPMf7vBwnn
	 zHsuDv8GvDnH1VrOvFRDMxP2s0jrflOWxlc5FjbqcxIGJz81BNGH8vVOdp9FYbKNdq
	 4u38I0tsjDRhq4WCGyAY4HgmHpEwewKxTMFKHauMorBUtmLTbxHKTV90nIH6v1c3Az
	 26jdJsahBxuTEPhh5xCsx/sz5oa8BFGWnMGGIQfpoHPvDflcrEbxMjPMEZ2WgZMiqM
	 K2gyO9xDZuBgzO9nBJN9rKXK+5amrA1VSGV0uijZxomlNdlv/cflza6afeghUr4ytV
	 NUyzdpVJYvxCg==
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
Subject: [PATCH 8/9] lib/crypto/x86: move arch/x86/lib/crypto/ to lib/crypto/x86/
Date: Tue, 17 Jun 2025 15:27:25 -0700
Message-ID: <20250617222726.365148-9-ebiggers@kernel.org>
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

Move the contents of arch/x86/lib/crypto/ into lib/crypto/x86/.

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

arch/x86/lib/crypto/.gitignore is intentionally kept for now.  See
https://lore.kernel.org/r/CAHk-=whu2fb22rEy6+oKx1-+NCHuWucZepvD0H2MD38DrJVKtg@mail.gmail.com/
I'll remove it later after some time has passed.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/x86/lib/Makefile                                           | 2 --
 lib/crypto/Kconfig                                              | 2 +-
 lib/crypto/Makefile                                             | 1 +
 lib/crypto/x86/.gitignore                                       | 2 ++
 {arch/x86/lib/crypto => lib/crypto/x86}/Kconfig                 | 0
 {arch/x86/lib/crypto => lib/crypto/x86}/Makefile                | 0
 {arch/x86/lib/crypto => lib/crypto/x86}/blake2s-core.S          | 0
 {arch/x86/lib/crypto => lib/crypto/x86}/blake2s-glue.c          | 0
 {arch/x86/lib/crypto => lib/crypto/x86}/chacha-avx2-x86_64.S    | 0
 .../x86/lib/crypto => lib/crypto/x86}/chacha-avx512vl-x86_64.S  | 0
 {arch/x86/lib/crypto => lib/crypto/x86}/chacha-ssse3-x86_64.S   | 0
 {arch/x86/lib/crypto => lib/crypto/x86}/chacha_glue.c           | 0
 .../lib/crypto => lib/crypto/x86}/poly1305-x86_64-cryptogams.pl | 0
 {arch/x86/lib/crypto => lib/crypto/x86}/poly1305_glue.c         | 0
 {arch/x86/lib/crypto => lib/crypto/x86}/sha256-avx-asm.S        | 0
 {arch/x86/lib/crypto => lib/crypto/x86}/sha256-avx2-asm.S       | 0
 {arch/x86/lib/crypto => lib/crypto/x86}/sha256-ni-asm.S         | 0
 {arch/x86/lib/crypto => lib/crypto/x86}/sha256-ssse3-asm.S      | 0
 {arch/x86/lib/crypto => lib/crypto/x86}/sha256.c                | 0
 19 files changed, 4 insertions(+), 3 deletions(-)
 create mode 100644 lib/crypto/x86/.gitignore
 rename {arch/x86/lib/crypto => lib/crypto/x86}/Kconfig (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/Makefile (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/blake2s-core.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/blake2s-glue.c (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/chacha-avx2-x86_64.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/chacha-avx512vl-x86_64.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/chacha-ssse3-x86_64.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/chacha_glue.c (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/poly1305-x86_64-cryptogams.pl (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/poly1305_glue.c (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/sha256-avx-asm.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/sha256-avx2-asm.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/sha256-ni-asm.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/sha256-ssse3-asm.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/sha256.c (100%)

diff --git a/arch/x86/lib/Makefile b/arch/x86/lib/Makefile
index 4fa5c4e1ba8a0..7cf8681cba0f2 100644
--- a/arch/x86/lib/Makefile
+++ b/arch/x86/lib/Makefile
@@ -1,12 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Makefile for x86 specific library files.
 #
 
-obj-y += crypto/
-
 # Produces uninteresting flaky coverage.
 KCOV_INSTRUMENT_delay.o	:= n
 
 # KCSAN uses udelay for introducing watchpoint delay; avoid recursion.
 KCSAN_SANITIZE_delay.o := n
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index b98543c7ef231..2460ddff967fc 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -209,10 +209,10 @@ source "lib/crypto/s390/Kconfig"
 endif
 if SPARC
 source "lib/crypto/sparc/Kconfig"
 endif
 if X86
-source "arch/x86/lib/crypto/Kconfig"
+source "lib/crypto/x86/Kconfig"
 endif
 endif
 
 endmenu
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 748d1fc6b6be2..16f5d76d92710 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -108,5 +108,6 @@ obj-$(CONFIG_ARM64) += arm64/
 obj-$(CONFIG_MIPS) += mips/
 obj-$(CONFIG_PPC) += powerpc/
 obj-$(CONFIG_RISCV) += riscv/
 obj-$(CONFIG_S390) += s390/
 obj-$(CONFIG_SPARC) += sparc/
+obj-$(CONFIG_X86) += x86/
diff --git a/lib/crypto/x86/.gitignore b/lib/crypto/x86/.gitignore
new file mode 100644
index 0000000000000..580c839bb1776
--- /dev/null
+++ b/lib/crypto/x86/.gitignore
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+poly1305-x86_64-cryptogams.S
diff --git a/arch/x86/lib/crypto/Kconfig b/lib/crypto/x86/Kconfig
similarity index 100%
rename from arch/x86/lib/crypto/Kconfig
rename to lib/crypto/x86/Kconfig
diff --git a/arch/x86/lib/crypto/Makefile b/lib/crypto/x86/Makefile
similarity index 100%
rename from arch/x86/lib/crypto/Makefile
rename to lib/crypto/x86/Makefile
diff --git a/arch/x86/lib/crypto/blake2s-core.S b/lib/crypto/x86/blake2s-core.S
similarity index 100%
rename from arch/x86/lib/crypto/blake2s-core.S
rename to lib/crypto/x86/blake2s-core.S
diff --git a/arch/x86/lib/crypto/blake2s-glue.c b/lib/crypto/x86/blake2s-glue.c
similarity index 100%
rename from arch/x86/lib/crypto/blake2s-glue.c
rename to lib/crypto/x86/blake2s-glue.c
diff --git a/arch/x86/lib/crypto/chacha-avx2-x86_64.S b/lib/crypto/x86/chacha-avx2-x86_64.S
similarity index 100%
rename from arch/x86/lib/crypto/chacha-avx2-x86_64.S
rename to lib/crypto/x86/chacha-avx2-x86_64.S
diff --git a/arch/x86/lib/crypto/chacha-avx512vl-x86_64.S b/lib/crypto/x86/chacha-avx512vl-x86_64.S
similarity index 100%
rename from arch/x86/lib/crypto/chacha-avx512vl-x86_64.S
rename to lib/crypto/x86/chacha-avx512vl-x86_64.S
diff --git a/arch/x86/lib/crypto/chacha-ssse3-x86_64.S b/lib/crypto/x86/chacha-ssse3-x86_64.S
similarity index 100%
rename from arch/x86/lib/crypto/chacha-ssse3-x86_64.S
rename to lib/crypto/x86/chacha-ssse3-x86_64.S
diff --git a/arch/x86/lib/crypto/chacha_glue.c b/lib/crypto/x86/chacha_glue.c
similarity index 100%
rename from arch/x86/lib/crypto/chacha_glue.c
rename to lib/crypto/x86/chacha_glue.c
diff --git a/arch/x86/lib/crypto/poly1305-x86_64-cryptogams.pl b/lib/crypto/x86/poly1305-x86_64-cryptogams.pl
similarity index 100%
rename from arch/x86/lib/crypto/poly1305-x86_64-cryptogams.pl
rename to lib/crypto/x86/poly1305-x86_64-cryptogams.pl
diff --git a/arch/x86/lib/crypto/poly1305_glue.c b/lib/crypto/x86/poly1305_glue.c
similarity index 100%
rename from arch/x86/lib/crypto/poly1305_glue.c
rename to lib/crypto/x86/poly1305_glue.c
diff --git a/arch/x86/lib/crypto/sha256-avx-asm.S b/lib/crypto/x86/sha256-avx-asm.S
similarity index 100%
rename from arch/x86/lib/crypto/sha256-avx-asm.S
rename to lib/crypto/x86/sha256-avx-asm.S
diff --git a/arch/x86/lib/crypto/sha256-avx2-asm.S b/lib/crypto/x86/sha256-avx2-asm.S
similarity index 100%
rename from arch/x86/lib/crypto/sha256-avx2-asm.S
rename to lib/crypto/x86/sha256-avx2-asm.S
diff --git a/arch/x86/lib/crypto/sha256-ni-asm.S b/lib/crypto/x86/sha256-ni-asm.S
similarity index 100%
rename from arch/x86/lib/crypto/sha256-ni-asm.S
rename to lib/crypto/x86/sha256-ni-asm.S
diff --git a/arch/x86/lib/crypto/sha256-ssse3-asm.S b/lib/crypto/x86/sha256-ssse3-asm.S
similarity index 100%
rename from arch/x86/lib/crypto/sha256-ssse3-asm.S
rename to lib/crypto/x86/sha256-ssse3-asm.S
diff --git a/arch/x86/lib/crypto/sha256.c b/lib/crypto/x86/sha256.c
similarity index 100%
rename from arch/x86/lib/crypto/sha256.c
rename to lib/crypto/x86/sha256.c
-- 
2.49.0


