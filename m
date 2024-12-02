Return-Path: <linux-mips+bounces-6816-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABBF9DF7AA
	for <lists+linux-mips@lfdr.de>; Mon,  2 Dec 2024 02:10:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 964E7B20B47
	for <lists+linux-mips@lfdr.de>; Mon,  2 Dec 2024 01:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF182868B;
	Mon,  2 Dec 2024 01:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PTN2LPBv"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00D3208A9;
	Mon,  2 Dec 2024 01:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733101771; cv=none; b=r4Q13wqDJs3zOM5iM0bXowmL9JseoCYCsul/BF0ROeSSG1POpmsHtqNqOS82OAFAdRLCCGFddgdPODF1ZOZRB4twKfUhV0L6KGS73LYHKMbc8DZPzW7p6T8SRp1ax0WRHyhjzCS8NNr36r6BYYWd8X9iSzT7Q9vXniS7kYEus6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733101771; c=relaxed/simple;
	bh=48Or9xwF9GsBObnGMTpzHdwryZKU+/oW0Q6oQoXh2Y4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ncVL8aLLdkPRCGBwrUYAbLebkNtZ+7Tr6St4/ZcBpN1TTE51VYAsL9FIdSxIUyRH3dk1TLXMtenrFsiysC9CktWEOS0+X0Rt3ijjiL3DoF9dhJZjxzjfoIc2AC/xCKrmXvBYB9+CfUvbBJaXx3+L3KMXl4s4JuxG8ZfrpHBvD6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PTN2LPBv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1D5CC4CEDE;
	Mon,  2 Dec 2024 01:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733101770;
	bh=48Or9xwF9GsBObnGMTpzHdwryZKU+/oW0Q6oQoXh2Y4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PTN2LPBvDFMpBM1INVa2CmJ6Ayvd+TTM0S6aFUWZt7prBE6KPQy5WArd72LTwSoSo
	 4+gqOucbOfOFCqGcp5ykRwcC3ktpLLYu1yJkwzip4uSgEs8ZWqItg+fi7jvYolfOgW
	 yGB+oc7ovzTUN+OwU0M6OaejnqrIH9GXsPGhIe1G17U75RpxoUKSjL5JkBe9VTb1kT
	 wfQPG3e4by1PlB+u81BOUM/fS9lS6yKxKnqjdz/7ZRjXKP7PEZ0XhM8njzgJFumhol
	 yKDitZLH2bnCSLISS8rRyT3ybbuOaLgIKBXZ4Z/m8evh3D0LJNSWcLXCXAYoA4nAeH
	 kQ5AyxP2bL9Vg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v4 02/19] lib/crc32: improve support for arch-specific overrides
Date: Sun,  1 Dec 2024 17:08:27 -0800
Message-ID: <20241202010844.144356-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241202010844.144356-1-ebiggers@kernel.org>
References: <20241202010844.144356-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

Currently the CRC32 library functions are defined as weak symbols, and
the arm64 and riscv architectures override them.

This method of arch-specific overrides has the limitation that it only
works when both the base and arch code is built-in.  Also, it makes the
arch-specific code be silently not used if it is accidentally built with
lib-y instead of obj-y; unfortunately the RISC-V code does this.

This commit reorganizes the code to have explicit *_arch() functions
that are called when they are enabled, similar to how some of the crypto
library code works (e.g. chacha_crypt() calls chacha_crypt_arch()).

Make the existing kconfig choice for the CRC32 implementation also
control whether the arch-optimized implementation (if one is available)
is enabled or not.  Make it enabled by default if CRC32 is also enabled.

The result is that arch-optimized CRC32 library functions will be
included automatically when appropriate, but it is now possible to
disable them.  They can also now be built as a loadable module if the
CRC32 library functions happen to be used only by loadable modules, in
which case the arch and base CRC32 modules will be automatically loaded
via direct symbol dependency when appropriate.

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/arm64/Kconfig                        |  1 +
 arch/arm64/lib/Makefile                   |  3 +-
 arch/arm64/lib/crc32-glue.c               | 13 ++++-
 arch/riscv/Kconfig                        |  1 +
 arch/riscv/lib/Makefile                   |  3 +-
 arch/riscv/lib/{crc32.c => crc32-riscv.c} | 13 ++++-
 crypto/crc32_generic.c                    |  4 +-
 crypto/crc32c_generic.c                   |  4 +-
 include/linux/crc32.h                     | 35 +++++++++---
 lib/Kconfig                               | 70 +++++++++++++++++------
 lib/crc32.c                               | 22 +++----
 11 files changed, 118 insertions(+), 51 deletions(-)
 rename arch/riscv/lib/{crc32.c => crc32-riscv.c} (94%)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 100570a048c5..71f6310c8240 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -19,10 +19,11 @@ config ARM64
 	select ARCH_ENABLE_MEMORY_HOTREMOVE
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 	select ARCH_HAS_CACHE_LINE_SIZE
 	select ARCH_HAS_CC_PLATFORM
+	select ARCH_HAS_CRC32
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL
 	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DMA_OPS if XEN
 	select ARCH_HAS_DMA_PREP_COHERENT
diff --git a/arch/arm64/lib/Makefile b/arch/arm64/lib/Makefile
index 8e882f479d98..5fbcf0d56665 100644
--- a/arch/arm64/lib/Makefile
+++ b/arch/arm64/lib/Makefile
@@ -11,11 +11,12 @@ CFLAGS_xor-neon.o		+= $(CC_FLAGS_FPU)
 CFLAGS_REMOVE_xor-neon.o	+= $(CC_FLAGS_NO_FPU)
 endif
 
 lib-$(CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE) += uaccess_flushcache.o
 
-obj-$(CONFIG_CRC32) += crc32.o crc32-glue.o
+obj-$(CONFIG_CRC32_ARCH) += crc32-arm64.o
+crc32-arm64-y := crc32.o crc32-glue.o
 
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
 
 obj-$(CONFIG_ARM64_MTE) += mte.o
 
diff --git a/arch/arm64/lib/crc32-glue.c b/arch/arm64/lib/crc32-glue.c
index ad015223d15d..d7f6e1cbf0d2 100644
--- a/arch/arm64/lib/crc32-glue.c
+++ b/arch/arm64/lib/crc32-glue.c
@@ -1,9 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 #include <linux/crc32.h>
 #include <linux/linkage.h>
+#include <linux/module.h>
 
 #include <asm/alternative.h>
 #include <asm/cpufeature.h>
 #include <asm/neon.h>
 #include <asm/simd.h>
@@ -19,11 +20,11 @@ asmlinkage u32 crc32_be_arm64(u32 crc, unsigned char const *p, size_t len);
 
 asmlinkage u32 crc32_le_arm64_4way(u32 crc, unsigned char const *p, size_t len);
 asmlinkage u32 crc32c_le_arm64_4way(u32 crc, unsigned char const *p, size_t len);
 asmlinkage u32 crc32_be_arm64_4way(u32 crc, unsigned char const *p, size_t len);
 
-u32 __pure crc32_le(u32 crc, unsigned char const *p, size_t len)
+u32 __pure crc32_le_arch(u32 crc, const u8 *p, size_t len)
 {
 	if (!alternative_has_cap_likely(ARM64_HAS_CRC32))
 		return crc32_le_base(crc, p, len);
 
 	if (len >= min_len && cpu_have_named_feature(PMULL) && crypto_simd_usable()) {
@@ -38,12 +39,13 @@ u32 __pure crc32_le(u32 crc, unsigned char const *p, size_t len)
 			return crc;
 	}
 
 	return crc32_le_arm64(crc, p, len);
 }
+EXPORT_SYMBOL(crc32_le_arch);
 
-u32 __pure __crc32c_le(u32 crc, unsigned char const *p, size_t len)
+u32 __pure crc32c_le_arch(u32 crc, const u8 *p, size_t len)
 {
 	if (!alternative_has_cap_likely(ARM64_HAS_CRC32))
 		return crc32c_le_base(crc, p, len);
 
 	if (len >= min_len && cpu_have_named_feature(PMULL) && crypto_simd_usable()) {
@@ -58,12 +60,13 @@ u32 __pure __crc32c_le(u32 crc, unsigned char const *p, size_t len)
 			return crc;
 	}
 
 	return crc32c_le_arm64(crc, p, len);
 }
+EXPORT_SYMBOL(crc32c_le_arch);
 
-u32 __pure crc32_be(u32 crc, unsigned char const *p, size_t len)
+u32 __pure crc32_be_arch(u32 crc, const u8 *p, size_t len)
 {
 	if (!alternative_has_cap_likely(ARM64_HAS_CRC32))
 		return crc32_be_base(crc, p, len);
 
 	if (len >= min_len && cpu_have_named_feature(PMULL) && crypto_simd_usable()) {
@@ -78,5 +81,9 @@ u32 __pure crc32_be(u32 crc, unsigned char const *p, size_t len)
 			return crc;
 	}
 
 	return crc32_be_arm64(crc, p, len);
 }
+EXPORT_SYMBOL(crc32_be_arch);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("arm64-optimized CRC32 functions");
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d4a7ca0388c0..7d5718667e39 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -22,10 +22,11 @@ config RISCV
 	select ARCH_ENABLE_MEMORY_HOTPLUG if SPARSEMEM_VMEMMAP
 	select ARCH_ENABLE_MEMORY_HOTREMOVE if MEMORY_HOTPLUG
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 	select ARCH_HAS_BINFMT_FLAT
+	select ARCH_HAS_CRC32 if RISCV_ISA_ZBC
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL if MMU
 	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DEBUG_WX
 	select ARCH_HAS_FAST_MULTIPLIER
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 8eec6b69a875..79368a895fee 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -13,10 +13,9 @@ ifeq ($(CONFIG_MMU), y)
 lib-$(CONFIG_RISCV_ISA_V)	+= uaccess_vector.o
 endif
 lib-$(CONFIG_MMU)	+= uaccess.o
 lib-$(CONFIG_64BIT)	+= tishift.o
 lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
-lib-$(CONFIG_RISCV_ISA_ZBC)	+= crc32.o
-
+obj-$(CONFIG_CRC32_ARCH)	+= crc32-riscv.o
 obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
 lib-$(CONFIG_RISCV_ISA_V)	+= xor.o
 lib-$(CONFIG_RISCV_ISA_V)	+= riscv_v_helpers.o
diff --git a/arch/riscv/lib/crc32.c b/arch/riscv/lib/crc32-riscv.c
similarity index 94%
rename from arch/riscv/lib/crc32.c
rename to arch/riscv/lib/crc32-riscv.c
index 333fb7af1192..a3ff7db2a1ce 100644
--- a/arch/riscv/lib/crc32.c
+++ b/arch/riscv/lib/crc32-riscv.c
@@ -12,10 +12,11 @@
 #include <linux/types.h>
 #include <linux/minmax.h>
 #include <linux/crc32poly.h>
 #include <linux/crc32.h>
 #include <linux/byteorder/generic.h>
+#include <linux/module.h>
 
 /*
  * Refer to https://www.corsix.org/content/barrett-reduction-polynomials for
  * better understanding of how this math works.
  *
@@ -215,21 +216,23 @@ static inline u32 __pure crc32_le_generic(u32 crc, unsigned char const *p,
 
 legacy:
 	return crc_fb(crc, p, len);
 }
 
-u32 __pure crc32_le(u32 crc, unsigned char const *p, size_t len)
+u32 __pure crc32_le_arch(u32 crc, const u8 *p, size_t len)
 {
 	return crc32_le_generic(crc, p, len, CRC32_POLY_LE, CRC32_POLY_QT_LE,
 				crc32_le_base);
 }
+EXPORT_SYMBOL(crc32_le_arch);
 
-u32 __pure __crc32c_le(u32 crc, unsigned char const *p, size_t len)
+u32 __pure crc32c_le_arch(u32 crc, const u8 *p, size_t len)
 {
 	return crc32_le_generic(crc, p, len, CRC32C_POLY_LE,
 				CRC32C_POLY_QT_LE, crc32c_le_base);
 }
+EXPORT_SYMBOL(crc32c_le_arch);
 
 static inline u32 crc32_be_unaligned(u32 crc, unsigned char const *p,
 				     size_t len)
 {
 	size_t bits = len * 8;
@@ -251,11 +254,11 @@ static inline u32 crc32_be_unaligned(u32 crc, unsigned char const *p,
 	crc ^= crc_low;
 
 	return crc;
 }
 
-u32 __pure crc32_be(u32 crc, unsigned char const *p, size_t len)
+u32 __pure crc32_be_arch(u32 crc, const u8 *p, size_t len)
 {
 	size_t offset, head_len, tail_len;
 	unsigned long const *p_ul;
 	unsigned long s;
 
@@ -290,5 +293,9 @@ u32 __pure crc32_be(u32 crc, unsigned char const *p, size_t len)
 	return crc;
 
 legacy:
 	return crc32_be_base(crc, p, len);
 }
+EXPORT_SYMBOL(crc32_be_arch);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Accelerated CRC32 implementation with Zbc extension");
diff --git a/crypto/crc32_generic.c b/crypto/crc32_generic.c
index 6a55d206fab3..cc064ea8240e 100644
--- a/crypto/crc32_generic.c
+++ b/crypto/crc32_generic.c
@@ -158,16 +158,16 @@ static struct shash_alg algs[] = {{
 }};
 
 static int __init crc32_mod_init(void)
 {
 	/* register the arch flavor only if it differs from the generic one */
-	return crypto_register_shashes(algs, 1 + (&crc32_le != &crc32_le_base));
+	return crypto_register_shashes(algs, 1 + IS_ENABLED(CONFIG_CRC32_ARCH));
 }
 
 static void __exit crc32_mod_fini(void)
 {
-	crypto_unregister_shashes(algs, 1 + (&crc32_le != &crc32_le_base));
+	crypto_unregister_shashes(algs, 1 + IS_ENABLED(CONFIG_CRC32_ARCH));
 }
 
 subsys_initcall(crc32_mod_init);
 module_exit(crc32_mod_fini);
 
diff --git a/crypto/crc32c_generic.c b/crypto/crc32c_generic.c
index 635599b255ec..04b03d825cf4 100644
--- a/crypto/crc32c_generic.c
+++ b/crypto/crc32c_generic.c
@@ -198,16 +198,16 @@ static struct shash_alg algs[] = {{
 }};
 
 static int __init crc32c_mod_init(void)
 {
 	/* register the arch flavor only if it differs from the generic one */
-	return crypto_register_shashes(algs, 1 + (&__crc32c_le != &crc32c_le_base));
+	return crypto_register_shashes(algs, 1 + IS_ENABLED(CONFIG_CRC32_ARCH));
 }
 
 static void __exit crc32c_mod_fini(void)
 {
-	crypto_unregister_shashes(algs, 1 + (&__crc32c_le != &crc32c_le_base));
+	crypto_unregister_shashes(algs, 1 + IS_ENABLED(CONFIG_CRC32_ARCH));
 }
 
 subsys_initcall(crc32c_mod_init);
 module_exit(crc32c_mod_fini);
 
diff --git a/include/linux/crc32.h b/include/linux/crc32.h
index 5b07fc9081c4..58c632533b08 100644
--- a/include/linux/crc32.h
+++ b/include/linux/crc32.h
@@ -6,14 +6,38 @@
 #define _LINUX_CRC32_H
 
 #include <linux/types.h>
 #include <linux/bitrev.h>
 
-u32 __pure crc32_le(u32 crc, unsigned char const *p, size_t len);
-u32 __pure crc32_le_base(u32 crc, unsigned char const *p, size_t len);
-u32 __pure crc32_be(u32 crc, unsigned char const *p, size_t len);
-u32 __pure crc32_be_base(u32 crc, unsigned char const *p, size_t len);
+u32 __pure crc32_le_arch(u32 crc, const u8 *p, size_t len);
+u32 __pure crc32_le_base(u32 crc, const u8 *p, size_t len);
+u32 __pure crc32_be_arch(u32 crc, const u8 *p, size_t len);
+u32 __pure crc32_be_base(u32 crc, const u8 *p, size_t len);
+u32 __pure crc32c_le_arch(u32 crc, const u8 *p, size_t len);
+u32 __pure crc32c_le_base(u32 crc, const u8 *p, size_t len);
+
+static inline u32 __pure crc32_le(u32 crc, const u8 *p, size_t len)
+{
+	if (IS_ENABLED(CONFIG_CRC32_ARCH))
+		return crc32_le_arch(crc, p, len);
+	return crc32_le_base(crc, p, len);
+}
+
+static inline u32 __pure crc32_be(u32 crc, const u8 *p, size_t len)
+{
+	if (IS_ENABLED(CONFIG_CRC32_ARCH))
+		return crc32_be_arch(crc, p, len);
+	return crc32_be_base(crc, p, len);
+}
+
+/* TODO: leading underscores should be dropped once callers have been updated */
+static inline u32 __pure __crc32c_le(u32 crc, const u8 *p, size_t len)
+{
+	if (IS_ENABLED(CONFIG_CRC32_ARCH))
+		return crc32c_le_arch(crc, p, len);
+	return crc32c_le_base(crc, p, len);
+}
 
 /**
  * crc32_le_combine - Combine two crc32 check values into one. For two
  * 		      sequences of bytes, seq1 and seq2 with lengths len1
  * 		      and len2, crc32_le() check values were calculated
@@ -36,13 +60,10 @@ u32 __attribute_const__ crc32_le_shift(u32 crc, size_t len);
 static inline u32 crc32_le_combine(u32 crc1, u32 crc2, size_t len2)
 {
 	return crc32_le_shift(crc1, len2) ^ crc2;
 }
 
-u32 __pure __crc32c_le(u32 crc, unsigned char const *p, size_t len);
-u32 __pure crc32c_le_base(u32 crc, unsigned char const *p, size_t len);
-
 /**
  * __crc32c_le_combine - Combine two crc32c check values into one. For two
  * 			 sequences of bytes, seq1 and seq2 with lengths len1
  * 			 and len2, __crc32c_le() check values were calculated
  * 			 for each, crc1 and crc2.
diff --git a/lib/Kconfig b/lib/Kconfig
index 5a318f753b2f..8858030bebae 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -188,10 +188,13 @@ config CRC32
 	  This option is provided for the case where no in-kernel-tree
 	  modules require CRC32/CRC32c functions, but a module built outside
 	  the kernel tree does. Such modules that use library CRC32/CRC32c
 	  functions require M here.
 
+config ARCH_HAS_CRC32
+	bool
+
 config CRC32_SELFTEST
 	tristate "CRC32 perform self test on init"
 	depends on CRC32
 	help
 	  This option enables the CRC32 library functions to perform a
@@ -200,54 +203,89 @@ config CRC32_SELFTEST
 	  and computes the total elapsed time and number of bytes processed.
 
 choice
 	prompt "CRC32 implementation"
 	depends on CRC32
-	default CRC32_SLICEBY8
+	default CRC32_IMPL_ARCH_PLUS_SLICEBY8 if ARCH_HAS_CRC32
+	default CRC32_IMPL_SLICEBY8 if !ARCH_HAS_CRC32
 	help
-	  This option allows a kernel builder to override the default choice
-	  of CRC32 algorithm.  Choose the default ("slice by 8") unless you
-	  know that you need one of the others.
+	  This option allows you to override the default choice of CRC32
+	  implementation.  Choose the default unless you know that you need one
+	  of the others.
 
-config CRC32_SLICEBY8
+config CRC32_IMPL_ARCH_PLUS_SLICEBY8
+	bool "Arch-optimized, with fallback to slice-by-8" if ARCH_HAS_CRC32
+	help
+	  Use architecture-optimized implementation of CRC32.  Fall back to
+	  slice-by-8 in cases where the arch-optimized implementation cannot be
+	  used, e.g. if the CPU lacks support for the needed instructions.
+
+	  This is the default when an arch-optimized implementation exists.
+
+config CRC32_IMPL_ARCH_PLUS_SLICEBY1
+	bool "Arch-optimized, with fallback to slice-by-1" if ARCH_HAS_CRC32
+	help
+	  Use architecture-optimized implementation of CRC32, but fall back to
+	  slice-by-1 instead of slice-by-8 in order to reduce the binary size.
+
+config CRC32_IMPL_SLICEBY8
 	bool "Slice by 8 bytes"
 	help
 	  Calculate checksum 8 bytes at a time with a clever slicing algorithm.
-	  This is the fastest algorithm, but comes with a 8KiB lookup table.
-	  Most modern processors have enough cache to hold this table without
-	  thrashing the cache.
-
-	  This is the default implementation choice.  Choose this one unless
-	  you have a good reason not to.
+	  This is much slower than the architecture-optimized implementation of
+	  CRC32 (if the selected arch has one), but it is portable and is the
+	  fastest implementation when no arch-optimized implementation is
+	  available.  It uses an 8KiB lookup table.  Most modern processors have
+	  enough cache to hold this table without thrashing the cache.
 
-config CRC32_SLICEBY4
+config CRC32_IMPL_SLICEBY4
 	bool "Slice by 4 bytes"
 	help
 	  Calculate checksum 4 bytes at a time with a clever slicing algorithm.
 	  This is a bit slower than slice by 8, but has a smaller 4KiB lookup
 	  table.
 
 	  Only choose this option if you know what you are doing.
 
-config CRC32_SARWATE
-	bool "Sarwate's Algorithm (one byte at a time)"
+config CRC32_IMPL_SLICEBY1
+	bool "Slice by 1 byte (Sarwate's algorithm)"
 	help
 	  Calculate checksum a byte at a time using Sarwate's algorithm.  This
-	  is not particularly fast, but has a small 256 byte lookup table.
+	  is not particularly fast, but has a small 1KiB lookup table.
 
 	  Only choose this option if you know what you are doing.
 
-config CRC32_BIT
+config CRC32_IMPL_BIT
 	bool "Classic Algorithm (one bit at a time)"
 	help
 	  Calculate checksum one bit at a time.  This is VERY slow, but has
 	  no lookup table.  This is provided as a debugging option.
 
 	  Only choose this option if you are debugging crc32.
 
 endchoice
 
+config CRC32_ARCH
+	tristate
+	default CRC32 if CRC32_IMPL_ARCH_PLUS_SLICEBY8 || CRC32_IMPL_ARCH_PLUS_SLICEBY1
+
+config CRC32_SLICEBY8
+	bool
+	default y if CRC32_IMPL_SLICEBY8 || CRC32_IMPL_ARCH_PLUS_SLICEBY8
+
+config CRC32_SLICEBY4
+	bool
+	default y if CRC32_IMPL_SLICEBY4
+
+config CRC32_SARWATE
+	bool
+	default y if CRC32_IMPL_SLICEBY1 || CRC32_IMPL_ARCH_PLUS_SLICEBY1
+
+config CRC32_BIT
+	bool
+	default y if CRC32_IMPL_BIT
+
 config CRC64
 	tristate "CRC64 functions"
 	help
 	  This option is provided for the case where no in-kernel-tree
 	  modules require CRC64 functions, but a module built outside
diff --git a/lib/crc32.c b/lib/crc32.c
index c67059b0082b..47151624332e 100644
--- a/lib/crc32.c
+++ b/lib/crc32.c
@@ -181,39 +181,31 @@ static inline u32 __pure crc32_le_generic(u32 crc, unsigned char const *p,
 #endif
 	return crc;
 }
 
 #if CRC_LE_BITS == 1
-u32 __pure __weak crc32_le(u32 crc, unsigned char const *p, size_t len)
+u32 __pure crc32_le_base(u32 crc, const u8 *p, size_t len)
 {
 	return crc32_le_generic(crc, p, len, NULL, CRC32_POLY_LE);
 }
-u32 __pure __weak __crc32c_le(u32 crc, unsigned char const *p, size_t len)
+u32 __pure crc32c_le_base(u32 crc, const u8 *p, size_t len)
 {
 	return crc32_le_generic(crc, p, len, NULL, CRC32C_POLY_LE);
 }
 #else
-u32 __pure __weak crc32_le(u32 crc, unsigned char const *p, size_t len)
+u32 __pure crc32_le_base(u32 crc, const u8 *p, size_t len)
 {
 	return crc32_le_generic(crc, p, len, crc32table_le, CRC32_POLY_LE);
 }
-u32 __pure __weak __crc32c_le(u32 crc, unsigned char const *p, size_t len)
+u32 __pure crc32c_le_base(u32 crc, const u8 *p, size_t len)
 {
 	return crc32_le_generic(crc, p, len, crc32ctable_le, CRC32C_POLY_LE);
 }
 #endif
-EXPORT_SYMBOL(crc32_le);
-EXPORT_SYMBOL(__crc32c_le);
-
-u32 __pure crc32_le_base(u32, unsigned char const *, size_t) __alias(crc32_le);
 EXPORT_SYMBOL(crc32_le_base);
-
-u32 __pure crc32c_le_base(u32, unsigned char const *, size_t) __alias(__crc32c_le);
 EXPORT_SYMBOL(crc32c_le_base);
 
-u32 __pure crc32_be_base(u32, unsigned char const *, size_t) __alias(crc32_be);
-
 /*
  * This multiplies the polynomials x and y modulo the given modulus.
  * This follows the "little-endian" CRC convention that the lsbit
  * represents the highest power of x, and the msbit represents x^0.
  */
@@ -333,16 +325,16 @@ static inline u32 __pure crc32_be_generic(u32 crc, unsigned char const *p,
 # endif
 	return crc;
 }
 
 #if CRC_BE_BITS == 1
-u32 __pure __weak crc32_be(u32 crc, unsigned char const *p, size_t len)
+u32 __pure crc32_be_base(u32 crc, const u8 *p, size_t len)
 {
 	return crc32_be_generic(crc, p, len, NULL, CRC32_POLY_BE);
 }
 #else
-u32 __pure __weak crc32_be(u32 crc, unsigned char const *p, size_t len)
+u32 __pure crc32_be_base(u32 crc, const u8 *p, size_t len)
 {
 	return crc32_be_generic(crc, p, len, crc32table_be, CRC32_POLY_BE);
 }
 #endif
-EXPORT_SYMBOL(crc32_be);
+EXPORT_SYMBOL(crc32_be_base);
-- 
2.47.1


