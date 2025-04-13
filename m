Return-Path: <linux-mips+bounces-8583-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0DBA8726A
	for <lists+linux-mips@lfdr.de>; Sun, 13 Apr 2025 17:45:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 842C03B90F2
	for <lists+linux-mips@lfdr.de>; Sun, 13 Apr 2025 15:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B698A1E0DB3;
	Sun, 13 Apr 2025 15:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JDwna0zr"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774121DF97C;
	Sun, 13 Apr 2025 15:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744559079; cv=none; b=ZRHkEvJ5Fqo+aLiqgfOF+0c/Ay0QM2A+xIsZpJBroRJQPphaWoQWMrwQzn+oCLw2EO3gqAjCcoSPMy92TK5iPJqj6pg4GH4VwuK5avbch8HqhksKU80KuRjsgM6pIzpEXJQuFyWHmCRM4NbHUev8EtdN4lRzLFIYecN1vMWXXxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744559079; c=relaxed/simple;
	bh=Q3pbBZfq4LkSSwii8rxYHn7G8WTtl1ZlV3cJjcDN4u0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hpMcQyCFIoYNs3O/0BCz3V4/+R+03stiEcuZiqf+mZFNo2isvB7cl5ERMEkPueSYGB2eQ7NDKPDwLuMP6UFiCNzXd+yy3IHtG4QuN8yxv1OkrBgTjeB2sEdIHsDD/uwLbW8CcXCSpTLfeZ6AQkgCeBSZnfiZ2u32oQGbE+4IhyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JDwna0zr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 456E3C4CEDD;
	Sun, 13 Apr 2025 15:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744559078;
	bh=Q3pbBZfq4LkSSwii8rxYHn7G8WTtl1ZlV3cJjcDN4u0=;
	h=From:To:Cc:Subject:Date:From;
	b=JDwna0zrYAOhK3tZ5qTXnsHj/m8//yZi2GG7Fa6yOacOJ0ovfC4bF041jHOIMhzi6
	 q8IBg0tS0KLospth+KMpSYYsSiD3Yesq+l41uOziyt35gzzvp5khseW2PrfK0JL7ja
	 Kh44y7nSfCyUyog0VEPuaZsz2ZF0r/vZ/EJTgnaZy0GLfAROktSsA0Z72rsRnUVqsz
	 0BH0FPfNETMbZlqPdWVsZR7zhLSZlrmFKV/AjfrkrBhNOeNVDlQ2ldUVu89fclbgJg
	 rP9UoeH3mYoSVowF843cl6KeIDS46c3kl9N9IXHkGwU6ETRDxAbdzBrUcVfK23/M8k
	 nwhkgGKJ5HVeg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-crypto@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH] lib/crc: make the CPU feature static keys __ro_after_init
Date: Sun, 13 Apr 2025 08:43:50 -0700
Message-ID: <20250413154350.10819-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

All of the CRC library's CPU feature static_keys are initialized by
initcalls and never change afterwards, so there's no need for them to be
in the regular .data section.  Put them in .data..ro_after_init instead.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---

I'm planning to take this via the crc tree.

 arch/arm/lib/crc-t10dif-glue.c       | 4 ++--
 arch/arm/lib/crc32-glue.c            | 4 ++--
 arch/arm64/lib/crc-t10dif-glue.c     | 4 ++--
 arch/loongarch/lib/crc32-loongarch.c | 2 +-
 arch/mips/lib/crc32-mips.c           | 2 +-
 arch/powerpc/lib/crc-t10dif-glue.c   | 2 +-
 arch/powerpc/lib/crc32-glue.c        | 2 +-
 arch/s390/lib/crc32-glue.c           | 2 +-
 arch/sparc/lib/crc32_glue.c          | 2 +-
 arch/x86/lib/crc-t10dif-glue.c       | 2 +-
 arch/x86/lib/crc32-glue.c            | 4 ++--
 arch/x86/lib/crc64-glue.c            | 2 +-
 12 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm/lib/crc-t10dif-glue.c b/arch/arm/lib/crc-t10dif-glue.c
index 6efad3d78284..382437094bdd 100644
--- a/arch/arm/lib/crc-t10dif-glue.c
+++ b/arch/arm/lib/crc-t10dif-glue.c
@@ -14,12 +14,12 @@
 #include <crypto/internal/simd.h>
 
 #include <asm/neon.h>
 #include <asm/simd.h>
 
-static DEFINE_STATIC_KEY_FALSE(have_neon);
-static DEFINE_STATIC_KEY_FALSE(have_pmull);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_pmull);
 
 #define CRC_T10DIF_PMULL_CHUNK_SIZE	16U
 
 asmlinkage u16 crc_t10dif_pmull64(u16 init_crc, const u8 *buf, size_t len);
 asmlinkage void crc_t10dif_pmull8(u16 init_crc, const u8 *buf, size_t len,
diff --git a/arch/arm/lib/crc32-glue.c b/arch/arm/lib/crc32-glue.c
index 4340351dbde8..7ef7db9c0de7 100644
--- a/arch/arm/lib/crc32-glue.c
+++ b/arch/arm/lib/crc32-glue.c
@@ -16,12 +16,12 @@
 
 #include <asm/hwcap.h>
 #include <asm/neon.h>
 #include <asm/simd.h>
 
-static DEFINE_STATIC_KEY_FALSE(have_crc32);
-static DEFINE_STATIC_KEY_FALSE(have_pmull);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_crc32);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_pmull);
 
 #define PMULL_MIN_LEN	64	/* min size of buffer for pmull functions */
 
 asmlinkage u32 crc32_pmull_le(const u8 buf[], u32 len, u32 init_crc);
 asmlinkage u32 crc32_armv8_le(u32 init_crc, const u8 buf[], u32 len);
diff --git a/arch/arm64/lib/crc-t10dif-glue.c b/arch/arm64/lib/crc-t10dif-glue.c
index bacd18f23168..99d0b5668a28 100644
--- a/arch/arm64/lib/crc-t10dif-glue.c
+++ b/arch/arm64/lib/crc-t10dif-glue.c
@@ -15,12 +15,12 @@
 #include <crypto/internal/simd.h>
 
 #include <asm/neon.h>
 #include <asm/simd.h>
 
-static DEFINE_STATIC_KEY_FALSE(have_asimd);
-static DEFINE_STATIC_KEY_FALSE(have_pmull);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_asimd);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_pmull);
 
 #define CRC_T10DIF_PMULL_CHUNK_SIZE	16U
 
 asmlinkage void crc_t10dif_pmull_p8(u16 init_crc, const u8 *buf, size_t len,
 				    u8 out[16]);
diff --git a/arch/loongarch/lib/crc32-loongarch.c b/arch/loongarch/lib/crc32-loongarch.c
index c44ee4f32557..8e6d1f517e73 100644
--- a/arch/loongarch/lib/crc32-loongarch.c
+++ b/arch/loongarch/lib/crc32-loongarch.c
@@ -24,11 +24,11 @@ do {							\
 } while (0)
 
 #define CRC32(crc, value, size)		_CRC32(crc, value, size, crc)
 #define CRC32C(crc, value, size)	_CRC32(crc, value, size, crcc)
 
-static DEFINE_STATIC_KEY_FALSE(have_crc32);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_crc32);
 
 u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
 {
 	if (!static_branch_likely(&have_crc32))
 		return crc32_le_base(crc, p, len);
diff --git a/arch/mips/lib/crc32-mips.c b/arch/mips/lib/crc32-mips.c
index 676a4b3e290b..84df361e7181 100644
--- a/arch/mips/lib/crc32-mips.c
+++ b/arch/mips/lib/crc32-mips.c
@@ -60,11 +60,11 @@ do {							\
 	_CRC32(crc, value, size, crc32)
 
 #define CRC32C(crc, value, size) \
 	_CRC32(crc, value, size, crc32c)
 
-static DEFINE_STATIC_KEY_FALSE(have_crc32);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_crc32);
 
 u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
 {
 	if (!static_branch_likely(&have_crc32))
 		return crc32_le_base(crc, p, len);
diff --git a/arch/powerpc/lib/crc-t10dif-glue.c b/arch/powerpc/lib/crc-t10dif-glue.c
index f411b0120cc5..ddd5c4088f50 100644
--- a/arch/powerpc/lib/crc-t10dif-glue.c
+++ b/arch/powerpc/lib/crc-t10dif-glue.c
@@ -19,11 +19,11 @@
 #define VMX_ALIGN		16
 #define VMX_ALIGN_MASK		(VMX_ALIGN-1)
 
 #define VECTOR_BREAKPOINT	64
 
-static DEFINE_STATIC_KEY_FALSE(have_vec_crypto);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_vec_crypto);
 
 u32 __crct10dif_vpmsum(u32 crc, unsigned char const *p, size_t len);
 
 u16 crc_t10dif_arch(u16 crci, const u8 *p, size_t len)
 {
diff --git a/arch/powerpc/lib/crc32-glue.c b/arch/powerpc/lib/crc32-glue.c
index dbd10f339183..42f2dd3c85dd 100644
--- a/arch/powerpc/lib/crc32-glue.c
+++ b/arch/powerpc/lib/crc32-glue.c
@@ -11,11 +11,11 @@
 #define VMX_ALIGN		16
 #define VMX_ALIGN_MASK		(VMX_ALIGN-1)
 
 #define VECTOR_BREAKPOINT	512
 
-static DEFINE_STATIC_KEY_FALSE(have_vec_crypto);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_vec_crypto);
 
 u32 __crc32c_vpmsum(u32 crc, const u8 *p, size_t len);
 
 u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
 {
diff --git a/arch/s390/lib/crc32-glue.c b/arch/s390/lib/crc32-glue.c
index 124214a27340..8f20a8e595c3 100644
--- a/arch/s390/lib/crc32-glue.c
+++ b/arch/s390/lib/crc32-glue.c
@@ -16,11 +16,11 @@
 
 #define VX_MIN_LEN		64
 #define VX_ALIGNMENT		16L
 #define VX_ALIGN_MASK		(VX_ALIGNMENT - 1)
 
-static DEFINE_STATIC_KEY_FALSE(have_vxrs);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_vxrs);
 
 /*
  * DEFINE_CRC32_VX() - Define a CRC-32 function using the vector extension
  *
  * Creates a function to perform a particular CRC-32 computation. Depending
diff --git a/arch/sparc/lib/crc32_glue.c b/arch/sparc/lib/crc32_glue.c
index a70752c729cf..d34e7cc7e1a1 100644
--- a/arch/sparc/lib/crc32_glue.c
+++ b/arch/sparc/lib/crc32_glue.c
@@ -15,11 +15,11 @@
 #include <linux/kernel.h>
 #include <linux/crc32.h>
 #include <asm/pstate.h>
 #include <asm/elf.h>
 
-static DEFINE_STATIC_KEY_FALSE(have_crc32c_opcode);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_crc32c_opcode);
 
 u32 crc32_le_arch(u32 crc, const u8 *data, size_t len)
 {
 	return crc32_le_base(crc, data, len);
 }
diff --git a/arch/x86/lib/crc-t10dif-glue.c b/arch/x86/lib/crc-t10dif-glue.c
index f89c335cde3c..d073b3678edc 100644
--- a/arch/x86/lib/crc-t10dif-glue.c
+++ b/arch/x86/lib/crc-t10dif-glue.c
@@ -7,11 +7,11 @@
 
 #include <linux/crc-t10dif.h>
 #include <linux/module.h>
 #include "crc-pclmul-template.h"
 
-static DEFINE_STATIC_KEY_FALSE(have_pclmulqdq);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_pclmulqdq);
 
 DECLARE_CRC_PCLMUL_FUNCS(crc16_msb, u16);
 
 u16 crc_t10dif_arch(u16 crc, const u8 *p, size_t len)
 {
diff --git a/arch/x86/lib/crc32-glue.c b/arch/x86/lib/crc32-glue.c
index e3f93b17ac3f..e6a6285cfca8 100644
--- a/arch/x86/lib/crc32-glue.c
+++ b/arch/x86/lib/crc32-glue.c
@@ -9,12 +9,12 @@
 
 #include <linux/crc32.h>
 #include <linux/module.h>
 #include "crc-pclmul-template.h"
 
-static DEFINE_STATIC_KEY_FALSE(have_crc32);
-static DEFINE_STATIC_KEY_FALSE(have_pclmulqdq);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_crc32);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_pclmulqdq);
 
 DECLARE_CRC_PCLMUL_FUNCS(crc32_lsb, u32);
 
 u32 crc32_le_arch(u32 crc, const u8 *p, size_t len)
 {
diff --git a/arch/x86/lib/crc64-glue.c b/arch/x86/lib/crc64-glue.c
index b0e1b719ecbf..1214ee726c16 100644
--- a/arch/x86/lib/crc64-glue.c
+++ b/arch/x86/lib/crc64-glue.c
@@ -7,11 +7,11 @@
 
 #include <linux/crc64.h>
 #include <linux/module.h>
 #include "crc-pclmul-template.h"
 
-static DEFINE_STATIC_KEY_FALSE(have_pclmulqdq);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_pclmulqdq);
 
 DECLARE_CRC_PCLMUL_FUNCS(crc64_msb, u64);
 DECLARE_CRC_PCLMUL_FUNCS(crc64_lsb, u64);
 
 u64 crc64_be_arch(u64 crc, const u8 *p, size_t len)

base-commit: e8c24520a1338f938774268a9bafb679ace93b76
-- 
2.49.0


