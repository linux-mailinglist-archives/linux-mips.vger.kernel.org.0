Return-Path: <linux-mips+bounces-9367-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7B0ADDEDC
	for <lists+linux-mips@lfdr.de>; Wed, 18 Jun 2025 00:30:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B90A9189C531
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 22:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7C0929C33D;
	Tue, 17 Jun 2025 22:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PTaZtDOX"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908A629B221;
	Tue, 17 Jun 2025 22:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750199400; cv=none; b=Cp+zBP/tTNFVlceBc4Ox0ikBMdy5ttbhnImGriouTD794XFOzsyqHnCnsJt5+PA7dq4dPR1QvAxpgyNV3vbrVWBS2lvA3qNQtbh3xwW6/roZQkPLl7aYDyZhyBs2iTBGEh5vyh51F9o1qSZSMtr0DgeD2gMWsU9cOpDj0XkFBXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750199400; c=relaxed/simple;
	bh=VbE9czpaU9jNxtjMDcOio0GOQz7YJt+xzskruq3kFzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D2Va0nJm9VgVPHdwhvizW7kyAOFaMCmtloYCAKMx57jO7Y9se6TsYC5Zk9OS7StwGy5Uxbr7VsV31DMyQskDZirwZGkC7kkjE7VGVJ6O58A8rJmAvTewyFaxPyZRY9DI73yWwjJkq9OiK72QP787XkMEJURoxaDnTJbjgtH+clc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PTaZtDOX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6A8C4CEF1;
	Tue, 17 Jun 2025 22:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750199400;
	bh=VbE9czpaU9jNxtjMDcOio0GOQz7YJt+xzskruq3kFzs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PTaZtDOXV75LW7zhlMetRWriUCGRO9uBwPIiM9o0/jEGpdN+igUnmxQnEp4plB8z2
	 45lRWfeggFJliDHOVY2MKce3WTRRndV5f2cx8yM9CqnvMAaGpPnoCiBrWww0aTm1Vw
	 mb/ykxw5+1+sj3X/ZWy1+swIdw1jIQK1T2UVoQzR0k5DDwYg9Um4xB5KgtupYEyyrY
	 xGTrU+hBphtguYh6B2FokcvxM265qfbLomsSN+rM0M8skgWVKadi9zOf4tpHUhOr3H
	 lnujVLmhVQ+4tf7rjpOMO0cB1eYfI9J3Y63Gi9APd8owp+0RFif64XVknd3zuXeD5x
	 tr1mB08xo0mnw==
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
Subject: [PATCH 5/9] lib/crypto/riscv: move arch/riscv/lib/crypto/ to lib/crypto/riscv/
Date: Tue, 17 Jun 2025 15:27:22 -0700
Message-ID: <20250617222726.365148-6-ebiggers@kernel.org>
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

Move the contents of arch/riscv/lib/crypto/ into lib/crypto/riscv/.

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
 arch/riscv/lib/Makefile                                         | 1 -
 lib/crypto/Kconfig                                              | 2 +-
 lib/crypto/Makefile                                             | 1 +
 {arch/riscv/lib/crypto => lib/crypto/riscv}/Kconfig             | 0
 {arch/riscv/lib/crypto => lib/crypto/riscv}/Makefile            | 0
 .../riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-glue.c | 0
 .../riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-zvkb.S | 0
 .../crypto/riscv}/sha256-riscv64-zvknha_or_zvknhb-zvkb.S        | 0
 {arch/riscv/lib/crypto => lib/crypto/riscv}/sha256.c            | 0
 9 files changed, 2 insertions(+), 2 deletions(-)
 rename {arch/riscv/lib/crypto => lib/crypto/riscv}/Kconfig (100%)
 rename {arch/riscv/lib/crypto => lib/crypto/riscv}/Makefile (100%)
 rename {arch/riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-glue.c (100%)
 rename {arch/riscv/lib/crypto => lib/crypto/riscv}/chacha-riscv64-zvkb.S (100%)
 rename {arch/riscv/lib/crypto => lib/crypto/riscv}/sha256-riscv64-zvknha_or_zvknhb-zvkb.S (100%)
 rename {arch/riscv/lib/crypto => lib/crypto/riscv}/sha256.c (100%)

diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 0baec92d2f55b..b1c46153606a6 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
-obj-y			+= crypto/
 lib-y			+= delay.o
 lib-y			+= memcpy.o
 lib-y			+= memset.o
 lib-y			+= memmove.o
 ifeq ($(CONFIG_KASAN_GENERIC)$(CONFIG_KASAN_SW_TAGS),)
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index f4f9a70dd0891..a2b58ca2df0cc 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -200,11 +200,11 @@ source "lib/crypto/mips/Kconfig"
 endif
 if PPC
 source "lib/crypto/powerpc/Kconfig"
 endif
 if RISCV
-source "arch/riscv/lib/crypto/Kconfig"
+source "lib/crypto/riscv/Kconfig"
 endif
 if S390
 source "arch/s390/lib/crypto/Kconfig"
 endif
 if SPARC
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 47c889b881b2a..0fe9200a031d6 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -105,5 +105,6 @@ libsm3-y					:= sm3.o
 
 obj-$(CONFIG_ARM) += arm/
 obj-$(CONFIG_ARM64) += arm64/
 obj-$(CONFIG_MIPS) += mips/
 obj-$(CONFIG_PPC) += powerpc/
+obj-$(CONFIG_RISCV) += riscv/
diff --git a/arch/riscv/lib/crypto/Kconfig b/lib/crypto/riscv/Kconfig
similarity index 100%
rename from arch/riscv/lib/crypto/Kconfig
rename to lib/crypto/riscv/Kconfig
diff --git a/arch/riscv/lib/crypto/Makefile b/lib/crypto/riscv/Makefile
similarity index 100%
rename from arch/riscv/lib/crypto/Makefile
rename to lib/crypto/riscv/Makefile
diff --git a/arch/riscv/lib/crypto/chacha-riscv64-glue.c b/lib/crypto/riscv/chacha-riscv64-glue.c
similarity index 100%
rename from arch/riscv/lib/crypto/chacha-riscv64-glue.c
rename to lib/crypto/riscv/chacha-riscv64-glue.c
diff --git a/arch/riscv/lib/crypto/chacha-riscv64-zvkb.S b/lib/crypto/riscv/chacha-riscv64-zvkb.S
similarity index 100%
rename from arch/riscv/lib/crypto/chacha-riscv64-zvkb.S
rename to lib/crypto/riscv/chacha-riscv64-zvkb.S
diff --git a/arch/riscv/lib/crypto/sha256-riscv64-zvknha_or_zvknhb-zvkb.S b/lib/crypto/riscv/sha256-riscv64-zvknha_or_zvknhb-zvkb.S
similarity index 100%
rename from arch/riscv/lib/crypto/sha256-riscv64-zvknha_or_zvknhb-zvkb.S
rename to lib/crypto/riscv/sha256-riscv64-zvknha_or_zvknhb-zvkb.S
diff --git a/arch/riscv/lib/crypto/sha256.c b/lib/crypto/riscv/sha256.c
similarity index 100%
rename from arch/riscv/lib/crypto/sha256.c
rename to lib/crypto/riscv/sha256.c
-- 
2.49.0


