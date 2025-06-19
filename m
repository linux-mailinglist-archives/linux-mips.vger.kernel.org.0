Return-Path: <linux-mips+bounces-9422-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BA5AE0DC5
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 21:22:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D45316F3D9
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 19:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5D14247282;
	Thu, 19 Jun 2025 19:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J/8283iY"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2172246BB7;
	Thu, 19 Jun 2025 19:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750360928; cv=none; b=WIJe4MxpiEd9xqlL2b+riIT8AhJnPmwSlAnjYpEYd3pqv5qTj+0kzURM2BQvNLVpvauF640lCV+GACJmihsTyDLx0BZBlOFDI3ZjAH0xDiV+b0bT9XetgsZ6ZCu2S0IctBW+MFu4gTDrUw4JtqX6gwYKooYUraPLbp6doy0oSiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750360928; c=relaxed/simple;
	bh=7v+MyTeQcOpDaV4LB38tDUhI6A7m5o/4ae4xLDxCiqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WGSKDww8802zFZ0ye32bVUbSwDWW/SQ3GGi+y7MVCWoG4iCn86MAvxY5gbs/RjLKgG6NwrVEaYyC2PnYJg3pS/JOTdj2FhD1g3bonWc2vXhc5HgLAr9NEeJVeRSPLNug/LP4GDkd2u91iiyP+RZa7/N7abhjv3CGV/beV3r2UeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J/8283iY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB8D2C4CEEA;
	Thu, 19 Jun 2025 19:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750360928;
	bh=7v+MyTeQcOpDaV4LB38tDUhI6A7m5o/4ae4xLDxCiqY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J/8283iYv8EIsY7VeLxKAGdNzaGSoYqyndLVstHfyjRBZP1o1pPBwQxMUA6H+7wUH
	 snIjJBMJHLdbQxXfpvn7VI/E/IcpSWaGGnrptQoBPst3LIFeIcBtS9izH49da54K03
	 9ikt2btjP1vQfUct8pw1PUQK78WHLvyJy86yfAE+lryrdXbQcHP/y0KZKOf0Gx/OdZ
	 Lq6N7SP62AxHxJzfIXs5EuQrwpSEBdr115um089ahtmQ1ZNb5X4GkCDSHNpxvYLhQ5
	 9XfhB+rfs/w7wOSHBo8dgwV6xlUbpgFWEtfLviY+vjABxyTTECiL3LYoPMEcuOuabi
	 TUnpE8ZkUUNTQ==
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
Subject: [PATCH v2 4/9] lib/crypto: powerpc: move arch/powerpc/lib/crypto/ into lib/crypto/
Date: Thu, 19 Jun 2025 12:19:03 -0700
Message-ID: <20250619191908.134235-5-ebiggers@kernel.org>
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

Move the contents of arch/powerpc/lib/crypto/ into lib/crypto/powerpc/.

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
 arch/powerpc/lib/Makefile                                       | 2 --
 lib/crypto/Kconfig                                              | 2 +-
 lib/crypto/Makefile                                             | 1 +
 {arch/powerpc/lib/crypto => lib/crypto/powerpc}/Kconfig         | 0
 {arch/powerpc/lib/crypto => lib/crypto/powerpc}/Makefile        | 0
 .../powerpc/lib/crypto => lib/crypto/powerpc}/chacha-p10-glue.c | 0
 .../powerpc/lib/crypto => lib/crypto/powerpc}/chacha-p10le-8x.S | 0
 .../lib/crypto => lib/crypto/powerpc}/poly1305-p10-glue.c       | 0
 .../lib/crypto => lib/crypto/powerpc}/poly1305-p10le_64.S       | 0
 .../powerpc/lib/crypto => lib/crypto/powerpc}/sha256-spe-asm.S  | 0
 {arch/powerpc/lib/crypto => lib/crypto/powerpc}/sha256.c        | 0
 11 files changed, 2 insertions(+), 3 deletions(-)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/Kconfig (100%)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/Makefile (100%)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/chacha-p10-glue.c (100%)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/chacha-p10le-8x.S (100%)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/poly1305-p10-glue.c (100%)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/poly1305-p10le_64.S (100%)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/sha256-spe-asm.S (100%)
 rename {arch/powerpc/lib/crypto => lib/crypto/powerpc}/sha256.c (100%)

diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index 481f968e42c7b..27f8a01438603 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -1,12 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Makefile for ppc-specific library files..
 #
 
-obj-y += crypto/
-
 CFLAGS_code-patching.o += -fno-stack-protector
 CFLAGS_feature-fixups.o += -fno-stack-protector
 
 CFLAGS_REMOVE_code-patching.o = $(CC_FLAGS_FTRACE)
 CFLAGS_REMOVE_feature-fixups.o = $(CC_FLAGS_FTRACE)
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 43c44316fbbdc..f4f9a70dd0891 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -197,11 +197,11 @@ source "lib/crypto/arm64/Kconfig"
 endif
 if MIPS
 source "lib/crypto/mips/Kconfig"
 endif
 if PPC
-source "arch/powerpc/lib/crypto/Kconfig"
+source "lib/crypto/powerpc/Kconfig"
 endif
 if RISCV
 source "arch/riscv/lib/crypto/Kconfig"
 endif
 if S390
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 74331243b8c44..47c889b881b2a 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -104,5 +104,6 @@ obj-$(CONFIG_CRYPTO_LIB_SM3)			+= libsm3.o
 libsm3-y					:= sm3.o
 
 obj-$(CONFIG_ARM) += arm/
 obj-$(CONFIG_ARM64) += arm64/
 obj-$(CONFIG_MIPS) += mips/
+obj-$(CONFIG_PPC) += powerpc/
diff --git a/arch/powerpc/lib/crypto/Kconfig b/lib/crypto/powerpc/Kconfig
similarity index 100%
rename from arch/powerpc/lib/crypto/Kconfig
rename to lib/crypto/powerpc/Kconfig
diff --git a/arch/powerpc/lib/crypto/Makefile b/lib/crypto/powerpc/Makefile
similarity index 100%
rename from arch/powerpc/lib/crypto/Makefile
rename to lib/crypto/powerpc/Makefile
diff --git a/arch/powerpc/lib/crypto/chacha-p10-glue.c b/lib/crypto/powerpc/chacha-p10-glue.c
similarity index 100%
rename from arch/powerpc/lib/crypto/chacha-p10-glue.c
rename to lib/crypto/powerpc/chacha-p10-glue.c
diff --git a/arch/powerpc/lib/crypto/chacha-p10le-8x.S b/lib/crypto/powerpc/chacha-p10le-8x.S
similarity index 100%
rename from arch/powerpc/lib/crypto/chacha-p10le-8x.S
rename to lib/crypto/powerpc/chacha-p10le-8x.S
diff --git a/arch/powerpc/lib/crypto/poly1305-p10-glue.c b/lib/crypto/powerpc/poly1305-p10-glue.c
similarity index 100%
rename from arch/powerpc/lib/crypto/poly1305-p10-glue.c
rename to lib/crypto/powerpc/poly1305-p10-glue.c
diff --git a/arch/powerpc/lib/crypto/poly1305-p10le_64.S b/lib/crypto/powerpc/poly1305-p10le_64.S
similarity index 100%
rename from arch/powerpc/lib/crypto/poly1305-p10le_64.S
rename to lib/crypto/powerpc/poly1305-p10le_64.S
diff --git a/arch/powerpc/lib/crypto/sha256-spe-asm.S b/lib/crypto/powerpc/sha256-spe-asm.S
similarity index 100%
rename from arch/powerpc/lib/crypto/sha256-spe-asm.S
rename to lib/crypto/powerpc/sha256-spe-asm.S
diff --git a/arch/powerpc/lib/crypto/sha256.c b/lib/crypto/powerpc/sha256.c
similarity index 100%
rename from arch/powerpc/lib/crypto/sha256.c
rename to lib/crypto/powerpc/sha256.c
-- 
2.50.0


