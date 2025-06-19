Return-Path: <linux-mips+bounces-9424-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0732AE0DD5
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 21:23:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 46F6218924F5
	for <lists+linux-mips@lfdr.de>; Thu, 19 Jun 2025 19:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9727128BA9A;
	Thu, 19 Jun 2025 19:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ckfubopa"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF2525D527;
	Thu, 19 Jun 2025 19:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750360929; cv=none; b=NEya4KpxLonZTTvcFAqjh4NLMWwqwStIpjlJN9A6QrCnoVPYj3/scteLQZtnA5Khb9H8CrZokkwaZ625efuLELuOQDMvghQd5d1KvFGq26iITf+RQtxvzGYDmjshHZgBAjuRME32x0g++WNbMqtAPQiNQEVnQA7yrl2lPVoZ9ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750360929; c=relaxed/simple;
	bh=3DyeUW/WI822CziP8LflvlPGRnidGfXtAs+o4+U8YL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZCmMuTM5lqjrJqrzu7obJTFYMFaeXsaF2V0dSNMkxjRs+78Mx8UxpoEWsa1NagrezycX5M4UUb3hRJ7DlsLGUj5XzwQq0Mzoe49jjW8zbB1z6VQcgVfwlfTyNTb3klwt8ue4oaD09+F4QxinoMhavsfaty7PYNY1BlpGVBTGk/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ckfubopa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E70CEC4CEEA;
	Thu, 19 Jun 2025 19:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750360929;
	bh=3DyeUW/WI822CziP8LflvlPGRnidGfXtAs+o4+U8YL0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CkfubopaY6VurlxxTDeKt8EuEdcI0jI8Ltmpks0RGHy/xxpDowfcQFmgSd56Dojjl
	 8GXxHra63v7nHHvUxy5f9ZrcMNoQzOhVQW42dqFNm775PqtCJx02qBK6gIVVFTNygI
	 l9uYbgRMBSgv0j9EzGm/JjC2KNcgiaQEngRGSKXkudVKWSI8Mi3c94FQ2hmZZgK5Vw
	 3rKGG8cLGgKOzR4GHC/Q1KDQ56GrawR15ExRtAkzK7JlISUNzUrdgWpXQ1sFulToOQ
	 faEt5eEfuWqmFWmpwIynw0lVykla8gG7dwdRNImsH3tEbqP474rmedKVJoMjBMNlhK
	 muEWsRTZZp9yA==
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
Subject: [PATCH v2 6/9] lib/crypto: s390: move arch/s390/lib/crypto/ into lib/crypto/
Date: Thu, 19 Jun 2025 12:19:05 -0700
Message-ID: <20250619191908.134235-7-ebiggers@kernel.org>
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

Move the contents of arch/s390/lib/crypto/ into lib/crypto/s390/.

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
 arch/s390/lib/Makefile                                  | 1 -
 lib/crypto/Kconfig                                      | 2 +-
 lib/crypto/Makefile                                     | 1 +
 {arch/s390/lib/crypto => lib/crypto/s390}/Kconfig       | 0
 {arch/s390/lib/crypto => lib/crypto/s390}/Makefile      | 0
 {arch/s390/lib/crypto => lib/crypto/s390}/chacha-glue.c | 0
 {arch/s390/lib/crypto => lib/crypto/s390}/chacha-s390.S | 0
 {arch/s390/lib/crypto => lib/crypto/s390}/chacha-s390.h | 0
 {arch/s390/lib/crypto => lib/crypto/s390}/sha256.c      | 0
 9 files changed, 2 insertions(+), 2 deletions(-)
 rename {arch/s390/lib/crypto => lib/crypto/s390}/Kconfig (100%)
 rename {arch/s390/lib/crypto => lib/crypto/s390}/Makefile (100%)
 rename {arch/s390/lib/crypto => lib/crypto/s390}/chacha-glue.c (100%)
 rename {arch/s390/lib/crypto => lib/crypto/s390}/chacha-s390.S (100%)
 rename {arch/s390/lib/crypto => lib/crypto/s390}/chacha-s390.h (100%)
 rename {arch/s390/lib/crypto => lib/crypto/s390}/sha256.c (100%)

diff --git a/arch/s390/lib/Makefile b/arch/s390/lib/Makefile
index cd35cdbfa8713..271a1c407121c 100644
--- a/arch/s390/lib/Makefile
+++ b/arch/s390/lib/Makefile
@@ -1,11 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Makefile for s390-specific library files..
 #
 
-obj-y += crypto/
 lib-y += delay.o string.o uaccess.o find.o spinlock.o tishift.o
 lib-y += csum-partial.o
 obj-y += mem.o xor.o
 lib-$(CONFIG_KPROBES) += probes.o
 lib-$(CONFIG_UPROBES) += probes.o
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index a2b58ca2df0cc..278b7ef5ec4f9 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -203,11 +203,11 @@ source "lib/crypto/powerpc/Kconfig"
 endif
 if RISCV
 source "lib/crypto/riscv/Kconfig"
 endif
 if S390
-source "arch/s390/lib/crypto/Kconfig"
+source "lib/crypto/s390/Kconfig"
 endif
 if SPARC
 source "arch/sparc/lib/crypto/Kconfig"
 endif
 if X86
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 0fe9200a031d6..4cda1f5cd21d4 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -106,5 +106,6 @@ libsm3-y					:= sm3.o
 obj-$(CONFIG_ARM) += arm/
 obj-$(CONFIG_ARM64) += arm64/
 obj-$(CONFIG_MIPS) += mips/
 obj-$(CONFIG_PPC) += powerpc/
 obj-$(CONFIG_RISCV) += riscv/
+obj-$(CONFIG_S390) += s390/
diff --git a/arch/s390/lib/crypto/Kconfig b/lib/crypto/s390/Kconfig
similarity index 100%
rename from arch/s390/lib/crypto/Kconfig
rename to lib/crypto/s390/Kconfig
diff --git a/arch/s390/lib/crypto/Makefile b/lib/crypto/s390/Makefile
similarity index 100%
rename from arch/s390/lib/crypto/Makefile
rename to lib/crypto/s390/Makefile
diff --git a/arch/s390/lib/crypto/chacha-glue.c b/lib/crypto/s390/chacha-glue.c
similarity index 100%
rename from arch/s390/lib/crypto/chacha-glue.c
rename to lib/crypto/s390/chacha-glue.c
diff --git a/arch/s390/lib/crypto/chacha-s390.S b/lib/crypto/s390/chacha-s390.S
similarity index 100%
rename from arch/s390/lib/crypto/chacha-s390.S
rename to lib/crypto/s390/chacha-s390.S
diff --git a/arch/s390/lib/crypto/chacha-s390.h b/lib/crypto/s390/chacha-s390.h
similarity index 100%
rename from arch/s390/lib/crypto/chacha-s390.h
rename to lib/crypto/s390/chacha-s390.h
diff --git a/arch/s390/lib/crypto/sha256.c b/lib/crypto/s390/sha256.c
similarity index 100%
rename from arch/s390/lib/crypto/sha256.c
rename to lib/crypto/s390/sha256.c
-- 
2.50.0


