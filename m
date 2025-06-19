Return-Path: <linux-mips+bounces-9420-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 765E9AE0DBC
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 21:22:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C33353A92D5
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 19:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEB642459F2;
	Thu, 19 Jun 2025 19:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tGGN1SzU"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51182459C7;
	Thu, 19 Jun 2025 19:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750360927; cv=none; b=HEQGQcoaY0U4Du5OxLOxr5cRmhIXWzJcIaa8NtZBdbGR7Pgfx2zlPmzQp8J6FhORTdc96FBV1Idc8ytdSEe1km3SbqXJOMDO+iMgYTiZIQEYgvV98OIoPPzOEOrgrVRDxAdVJmB5RVKoQY9iIX8RXN4HzGu5U7dEyGkzTbZfPpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750360927; c=relaxed/simple;
	bh=RMLJ2Mc60dhI22NguMJn4nG7jrjmEH17chdDqFFaLzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f30C3YUSAiFPHuCmPfhbahvgZwa03UIgnvZRXwomOTpwkh+UtSOwlsYu6TXSdlUmrfNRnKHw62NKLTEXWnQSJdYUTNvcrECKHTZTX70cQJusVzK440d3x3YhNy0NViqFQSG/OsOArVepHhbIZjsk76jP8Y7wgE98Dho2rsr1dc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tGGN1SzU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00851C4CEEA;
	Thu, 19 Jun 2025 19:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750360927;
	bh=RMLJ2Mc60dhI22NguMJn4nG7jrjmEH17chdDqFFaLzo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tGGN1SzUeo0PuplVPxRVxBWPvKtOHQGiUm/80p/SW+CPV1xWBJdQfrSAMxgeEPyWC
	 0K99EWQdzu7SPhal6ukdB6UbrOO1TNOaoUIZayhzCcHKW08Yz0l1dsGg9sIJZeDJ/n
	 jJjGnFhXhgXQe95KfsKkux/9i5OlxMTsThazJc3Kl4+Sckl6AJl1exj+7mJJlOnrlL
	 7VzPmwr1VvPKqsCQq0vaG9JEsFdKARjqyibpxTkuZjZr7X1v44mkO8jMFu6VkIFuFD
	 jOyoDqQ0tysL2Jg4xtbltA2P/Dq8gVdum9QCZTfkf8ILS0PdXQhJzbspvDWytj0KS/
	 AkStSCm+BjtFA==
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
Subject: [PATCH v2 2/9] lib/crypto: arm64: move arch/arm64/lib/crypto/ into lib/crypto/
Date: Thu, 19 Jun 2025 12:19:01 -0700
Message-ID: <20250619191908.134235-3-ebiggers@kernel.org>
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

Move the contents of arch/arm64/lib/crypto/ into lib/crypto/arm64/.

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

Add a gitignore entry for the removed directory arch/arm64/lib/crypto/
so that people don't accidentally commit leftover generated files.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm64/lib/.gitignore                                     | 4 ++++
 arch/arm64/lib/Makefile                                       | 3 ---
 arch/arm64/lib/crypto/.gitignore                              | 3 ---
 lib/crypto/Kconfig                                            | 2 +-
 lib/crypto/Makefile                                           | 3 ++-
 lib/crypto/arm64/.gitignore                                   | 2 ++
 {arch/arm64/lib/crypto => lib/crypto/arm64}/Kconfig           | 0
 {arch/arm64/lib/crypto => lib/crypto/arm64}/Makefile          | 0
 .../arm64/lib/crypto => lib/crypto/arm64}/chacha-neon-core.S  | 0
 .../arm64/lib/crypto => lib/crypto/arm64}/chacha-neon-glue.c  | 0
 {arch/arm64/lib/crypto => lib/crypto/arm64}/poly1305-armv8.pl | 0
 {arch/arm64/lib/crypto => lib/crypto/arm64}/poly1305-glue.c   | 0
 {arch/arm64/lib/crypto => lib/crypto/arm64}/sha2-armv8.pl     | 0
 {arch/arm64/lib/crypto => lib/crypto/arm64}/sha256-ce.S       | 0
 {arch/arm64/lib/crypto => lib/crypto/arm64}/sha256.c          | 0
 15 files changed, 9 insertions(+), 8 deletions(-)
 create mode 100644 arch/arm64/lib/.gitignore
 delete mode 100644 arch/arm64/lib/crypto/.gitignore
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/Kconfig (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/Makefile (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/chacha-neon-core.S (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/chacha-neon-glue.c (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/poly1305-armv8.pl (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/poly1305-glue.c (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/sha2-armv8.pl (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/sha256-ce.S (100%)
 rename {arch/arm64/lib/crypto => lib/crypto/arm64}/sha256.c (100%)

diff --git a/arch/arm64/lib/.gitignore b/arch/arm64/lib/.gitignore
new file mode 100644
index 0000000000000..647d7a922e680
--- /dev/null
+++ b/arch/arm64/lib/.gitignore
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+# This now-removed directory used to contain generated files.
+/crypto/
diff --git a/arch/arm64/lib/Makefile b/arch/arm64/lib/Makefile
index 027bfa9689c6a..d97e290619bc5 100644
--- a/arch/arm64/lib/Makefile
+++ b/arch/arm64/lib/Makefile
@@ -1,9 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
-
-obj-y += crypto/
-
 lib-y		:= clear_user.o delay.o copy_from_user.o		\
 		   copy_to_user.o copy_page.o				\
 		   clear_page.o csum.o insn.o memchr.o memcpy.o		\
 		   memset.o memcmp.o strcmp.o strncmp.o strlen.o	\
 		   strnlen.o strchr.o strrchr.o tishift.o
diff --git a/arch/arm64/lib/crypto/.gitignore b/arch/arm64/lib/crypto/.gitignore
deleted file mode 100644
index 12d74d8b03d0a..0000000000000
--- a/arch/arm64/lib/crypto/.gitignore
+++ /dev/null
@@ -1,3 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-poly1305-core.S
-sha256-core.S
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index e14bef8e87af2..fdeb91bf00328 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -191,11 +191,11 @@ config CRYPTO_LIB_SM3
 if !KMSAN # avoid false positives from assembly
 if ARM
 source "lib/crypto/arm/Kconfig"
 endif
 if ARM64
-source "arch/arm64/lib/crypto/Kconfig"
+source "lib/crypto/arm64/Kconfig"
 endif
 if MIPS
 source "arch/mips/lib/crypto/Kconfig"
 endif
 if PPC
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index ddf04e2270f1e..63ab907e8f53b 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -81,11 +81,11 @@ clean-files += arm/sha512-core.S
 AFLAGS_arm/sha512-core.o += $(aflags-thumb2-y)
 endif
 
 ifeq ($(CONFIG_ARM64),y)
 libsha512-y += arm64/sha512-core.o
-$(obj)/arm64/sha512-core.S: $(src)/../../arch/arm64/lib/crypto/sha2-armv8.pl
+$(obj)/arm64/sha512-core.S: $(src)/arm64/sha2-armv8.pl
 	$(call cmd,perlasm_with_args)
 clean-files += arm64/sha512-core.S
 libsha512-$(CONFIG_KERNEL_MODE_NEON) += arm64/sha512-ce-core.o
 endif
 
@@ -102,5 +102,6 @@ obj-$(CONFIG_CRYPTO_SELFTESTS)			+= simd.o
 
 obj-$(CONFIG_CRYPTO_LIB_SM3)			+= libsm3.o
 libsm3-y					:= sm3.o
 
 obj-$(CONFIG_ARM) += arm/
+obj-$(CONFIG_ARM64) += arm64/
diff --git a/lib/crypto/arm64/.gitignore b/lib/crypto/arm64/.gitignore
index 670a4d97b5684..f6c4e8ef80dae 100644
--- a/lib/crypto/arm64/.gitignore
+++ b/lib/crypto/arm64/.gitignore
@@ -1,2 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
+poly1305-core.S
+sha256-core.S
 sha512-core.S
diff --git a/arch/arm64/lib/crypto/Kconfig b/lib/crypto/arm64/Kconfig
similarity index 100%
rename from arch/arm64/lib/crypto/Kconfig
rename to lib/crypto/arm64/Kconfig
diff --git a/arch/arm64/lib/crypto/Makefile b/lib/crypto/arm64/Makefile
similarity index 100%
rename from arch/arm64/lib/crypto/Makefile
rename to lib/crypto/arm64/Makefile
diff --git a/arch/arm64/lib/crypto/chacha-neon-core.S b/lib/crypto/arm64/chacha-neon-core.S
similarity index 100%
rename from arch/arm64/lib/crypto/chacha-neon-core.S
rename to lib/crypto/arm64/chacha-neon-core.S
diff --git a/arch/arm64/lib/crypto/chacha-neon-glue.c b/lib/crypto/arm64/chacha-neon-glue.c
similarity index 100%
rename from arch/arm64/lib/crypto/chacha-neon-glue.c
rename to lib/crypto/arm64/chacha-neon-glue.c
diff --git a/arch/arm64/lib/crypto/poly1305-armv8.pl b/lib/crypto/arm64/poly1305-armv8.pl
similarity index 100%
rename from arch/arm64/lib/crypto/poly1305-armv8.pl
rename to lib/crypto/arm64/poly1305-armv8.pl
diff --git a/arch/arm64/lib/crypto/poly1305-glue.c b/lib/crypto/arm64/poly1305-glue.c
similarity index 100%
rename from arch/arm64/lib/crypto/poly1305-glue.c
rename to lib/crypto/arm64/poly1305-glue.c
diff --git a/arch/arm64/lib/crypto/sha2-armv8.pl b/lib/crypto/arm64/sha2-armv8.pl
similarity index 100%
rename from arch/arm64/lib/crypto/sha2-armv8.pl
rename to lib/crypto/arm64/sha2-armv8.pl
diff --git a/arch/arm64/lib/crypto/sha256-ce.S b/lib/crypto/arm64/sha256-ce.S
similarity index 100%
rename from arch/arm64/lib/crypto/sha256-ce.S
rename to lib/crypto/arm64/sha256-ce.S
diff --git a/arch/arm64/lib/crypto/sha256.c b/lib/crypto/arm64/sha256.c
similarity index 100%
rename from arch/arm64/lib/crypto/sha256.c
rename to lib/crypto/arm64/sha256.c
-- 
2.50.0


