Return-Path: <linux-mips+bounces-9421-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6C0AE0DC7
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 21:22:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2BE821890C5D
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 19:22:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5062D246787;
	Thu, 19 Jun 2025 19:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JdVrvlVo"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B44E246770;
	Thu, 19 Jun 2025 19:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750360928; cv=none; b=Fri+H7uW0ZYmN5bQwb+KyrW6rQ0gchVOg97eJtdYKknQogn0hzaw5X6ytG6elp39VxwlK0D9UAvpe7uz55dRu20tfabM91SKFfurDh37uTv9JLIsevl41dy6DU9ThWplBvXXx38KLrgLrJmu+tjpuSTxYWsOdQ4sK5zBbU+peNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750360928; c=relaxed/simple;
	bh=ElmQYzEq2VpH5qDwci77lBilaBOMdPQESLW1rZ2SRRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kQf+YGlKglDop6uVAXcuuygNROZ2R9ke/3hKlMst0flqTKxiPrE+DNbFN1iVM0AqN10DCX8c62G+otEeE1KGm6zl1MKOJnbAVk0FBg17zqU7rLKIzbuwI6a8xT07sBJlZTXoB7jwjFylIcubeOVA2AB5SFk9HJRYmyCEW3NI9eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JdVrvlVo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7655EC4CEF4;
	Thu, 19 Jun 2025 19:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750360927;
	bh=ElmQYzEq2VpH5qDwci77lBilaBOMdPQESLW1rZ2SRRM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JdVrvlVoT1rtjzzaiUrJC17MtKX7Yf1MYoVVn55rjbbBkeAyoyDAWcKiRxC1s4GCz
	 bcaelq71ZOJTM97boLCl0atez/vFDxJXitE/4z++ykOXNxIccnJ1WybTUdkYzbFGXG
	 Y8hzHw+grTUKsz7NPQjENahSCa73vi4pxsFRkq/MqHQPxz971u/dTf2DpYCkQhPPmB
	 llp3Om+CL2tH037cOojS9FSg0cP1sKARmB++dbAAzreVsNdpYK4/oqdCRYZm6lwUnk
	 BRaznLPDKnueBbfcH5+h3ElAsf3JTTU2fDJzk+zBp+1cbnuqHQxhaBLQ13BYY6QDgE
	 OrMdX3QCoJVXQ==
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
Subject: [PATCH v2 3/9] lib/crypto: mips: move arch/mips/lib/crypto/ into lib/crypto/
Date: Thu, 19 Jun 2025 12:19:02 -0700
Message-ID: <20250619191908.134235-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250619191908.134235-1-ebiggers@kernel.org>
References: <20250619191908.134235-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

Move the contents of arch/mips/lib/crypto/ into lib/crypto/mips/.

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

Add a gitignore entry for the removed directory arch/mips/lib/crypto/ so
that people don't accidentally commit leftover generated files.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/mips/lib/.gitignore                                   | 4 ++++
 arch/mips/lib/Makefile                                     | 2 --
 lib/crypto/Kconfig                                         | 2 +-
 lib/crypto/Makefile                                        | 1 +
 {arch/mips/lib/crypto => lib/crypto/mips}/.gitignore       | 0
 {arch/mips/lib/crypto => lib/crypto/mips}/Kconfig          | 0
 {arch/mips/lib/crypto => lib/crypto/mips}/Makefile         | 0
 {arch/mips/lib/crypto => lib/crypto/mips}/chacha-core.S    | 0
 {arch/mips/lib/crypto => lib/crypto/mips}/chacha-glue.c    | 0
 {arch/mips/lib/crypto => lib/crypto/mips}/poly1305-glue.c  | 0
 {arch/mips/lib/crypto => lib/crypto/mips}/poly1305-mips.pl | 0
 11 files changed, 6 insertions(+), 3 deletions(-)
 create mode 100644 arch/mips/lib/.gitignore
 rename {arch/mips/lib/crypto => lib/crypto/mips}/.gitignore (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/Kconfig (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/Makefile (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/chacha-core.S (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/chacha-glue.c (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/poly1305-glue.c (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/poly1305-mips.pl (100%)

diff --git a/arch/mips/lib/.gitignore b/arch/mips/lib/.gitignore
new file mode 100644
index 0000000000000..647d7a922e680
--- /dev/null
+++ b/arch/mips/lib/.gitignore
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+# This now-removed directory used to contain generated files.
+/crypto/
diff --git a/arch/mips/lib/Makefile b/arch/mips/lib/Makefile
index 9d75845ef78e1..9c024e6d5e54c 100644
--- a/arch/mips/lib/Makefile
+++ b/arch/mips/lib/Makefile
@@ -1,12 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Makefile for MIPS-specific library files..
 #
 
-obj-y	+= crypto/
-
 lib-y	+= bitops.o csum_partial.o delay.o memcpy.o memset.o \
 	   mips-atomic.o strncpy_user.o \
 	   strnlen_user.o uncached.o
 
 obj-y			+= iomap_copy.o
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index fdeb91bf00328..43c44316fbbdc 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -194,11 +194,11 @@ source "lib/crypto/arm/Kconfig"
 endif
 if ARM64
 source "lib/crypto/arm64/Kconfig"
 endif
 if MIPS
-source "arch/mips/lib/crypto/Kconfig"
+source "lib/crypto/mips/Kconfig"
 endif
 if PPC
 source "arch/powerpc/lib/crypto/Kconfig"
 endif
 if RISCV
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 63ab907e8f53b..74331243b8c44 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -103,5 +103,6 @@ obj-$(CONFIG_CRYPTO_SELFTESTS)			+= simd.o
 obj-$(CONFIG_CRYPTO_LIB_SM3)			+= libsm3.o
 libsm3-y					:= sm3.o
 
 obj-$(CONFIG_ARM) += arm/
 obj-$(CONFIG_ARM64) += arm64/
+obj-$(CONFIG_MIPS) += mips/
diff --git a/arch/mips/lib/crypto/.gitignore b/lib/crypto/mips/.gitignore
similarity index 100%
rename from arch/mips/lib/crypto/.gitignore
rename to lib/crypto/mips/.gitignore
diff --git a/arch/mips/lib/crypto/Kconfig b/lib/crypto/mips/Kconfig
similarity index 100%
rename from arch/mips/lib/crypto/Kconfig
rename to lib/crypto/mips/Kconfig
diff --git a/arch/mips/lib/crypto/Makefile b/lib/crypto/mips/Makefile
similarity index 100%
rename from arch/mips/lib/crypto/Makefile
rename to lib/crypto/mips/Makefile
diff --git a/arch/mips/lib/crypto/chacha-core.S b/lib/crypto/mips/chacha-core.S
similarity index 100%
rename from arch/mips/lib/crypto/chacha-core.S
rename to lib/crypto/mips/chacha-core.S
diff --git a/arch/mips/lib/crypto/chacha-glue.c b/lib/crypto/mips/chacha-glue.c
similarity index 100%
rename from arch/mips/lib/crypto/chacha-glue.c
rename to lib/crypto/mips/chacha-glue.c
diff --git a/arch/mips/lib/crypto/poly1305-glue.c b/lib/crypto/mips/poly1305-glue.c
similarity index 100%
rename from arch/mips/lib/crypto/poly1305-glue.c
rename to lib/crypto/mips/poly1305-glue.c
diff --git a/arch/mips/lib/crypto/poly1305-mips.pl b/lib/crypto/mips/poly1305-mips.pl
similarity index 100%
rename from arch/mips/lib/crypto/poly1305-mips.pl
rename to lib/crypto/mips/poly1305-mips.pl
-- 
2.50.0


