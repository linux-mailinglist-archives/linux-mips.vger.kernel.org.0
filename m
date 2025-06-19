Return-Path: <linux-mips+bounces-9423-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0632AE0DCC
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 21:22:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 263257AF8A4
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 19:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C02C278158;
	Thu, 19 Jun 2025 19:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KgvoC/BR"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35ED024729D;
	Thu, 19 Jun 2025 19:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750360929; cv=none; b=D6l/65ATv0G0PL69HvLYJyW8tfBQS8NWf9gAjOxMgzym/rLzoq9QkCIacNG+qGD17oXOV89YEMwyFLxJG3KElP/LvkXZvHFnDrn8YV3aEYQI5fbR3ZqJ+mTkOovwBHGLIHpPIvGQ3gPuR7FIfb6cCxUlzAAWH1EeEAZrUuAMIRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750360929; c=relaxed/simple;
	bh=olGuQl6hXdBWJzjyuen1xpyitMxkK608OWYpY9JoADg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C4XZapPt5KgyRqkts04dDWAlD94JbkHkQMHCz+U5ZgLVC/s5yEBz/IuUy1Lgfkz/pYdiQSG1OCYwemMy5fLMT3aPMMCmRjHk6NpEGjz4ylMibZmuSuKli6zjexWPsUUdFHFfSeKuDkkuPlxH51nNQn0mqwDiVFqSs0HnJoMVVU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KgvoC/BR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C698C4CEF2;
	Thu, 19 Jun 2025 19:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750360928;
	bh=olGuQl6hXdBWJzjyuen1xpyitMxkK608OWYpY9JoADg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KgvoC/BReFq1Lm55icK7ABnxNL5KdGaV5L4vxKrywBy7UfLviPfht7YJ0+aDH8XkE
	 PykslUmioa2H8UJWvJJ3G0GfVQSNo7J81My9lz/C2tHV92+8y250WL3lyixxQCG63Y
	 alFfFntKrRy1O2+H0Jovai2Z69VT6/YjPmUxYE29HEcsdPRWt8BcQsqR+XlJFxY4gi
	 ll9qJvMNNdzgp9slPesfx6+JndPYMinTFvyQ/AZSjcSxLCRz0ICJk1P7FiRssZSozY
	 bbkdhtkDDRs1CgETKB7RMcQBlEd1Lql2PMTEEjQylAcS1/jqGv1rl5l8BpcMvWIAPp
	 trU2POGmbT9Yg==
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
Subject: [PATCH v2 5/9] lib/crypto: riscv: move arch/riscv/lib/crypto/ into lib/crypto/
Date: Thu, 19 Jun 2025 12:19:04 -0700
Message-ID: <20250619191908.134235-6-ebiggers@kernel.org>
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
2.50.0


