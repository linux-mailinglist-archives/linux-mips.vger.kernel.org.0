Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9C72358BFB
	for <lists+linux-mips@lfdr.de>; Thu,  8 Apr 2021 20:14:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231716AbhDHSO4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 8 Apr 2021 14:14:56 -0400
Received: from mx2.suse.de ([195.135.220.15]:37066 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232267AbhDHSO4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 8 Apr 2021 14:14:56 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id E0B44B17A;
        Thu,  8 Apr 2021 18:14:42 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     hch@lst.de
Subject: [PATCH] MIPS: uaccess: Reduce number of nested macros
Date:   Thu,  8 Apr 2021 20:14:37 +0200
Message-Id: <20210408181437.19570-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Clean up macros even further after removal get_fs/set_fs.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/include/asm/uaccess.h | 157 +++++++++++++++-----------------
 1 file changed, 71 insertions(+), 86 deletions(-)

diff --git a/arch/mips/include/asm/uaccess.h b/arch/mips/include/asm/uaccess.h
index 91bc7fb7dca1..e0dedd47e4e6 100644
--- a/arch/mips/include/asm/uaccess.h
+++ b/arch/mips/include/asm/uaccess.h
@@ -102,8 +102,15 @@ static inline int __access_ok(const void __user *p, unsigned long size)
  *
  * Returns zero on success, or -EFAULT on error.
  */
-#define put_user(x,ptr) \
-	__put_user_check((x), (ptr), sizeof(*(ptr)))
+#define put_user(x, ptr)						\
+({									\
+	__typeof__(*(ptr)) __user *__p = (ptr);				\
+									\
+	might_fault();							\
+	access_ok(__p, sizeof(*__p)) ?					\
+		__put_user((x), __p) :					\
+		-EFAULT;						\
+})
 
 /*
  * get_user: - Get a simple variable from user space.
@@ -123,8 +130,15 @@ static inline int __access_ok(const void __user *p, unsigned long size)
  * Returns zero on success, or -EFAULT on error.
  * On error, the variable @x is set to zero.
  */
-#define get_user(x,ptr) \
-	__get_user_check((x), (ptr), sizeof(*(ptr)))
+#define get_user(x, ptr)						\
+({									\
+	const __typeof__(*(ptr)) __user *__p = (ptr);			\
+									\
+	might_fault();							\
+	access_ok(__p, sizeof(*__p)) ?					\
+		__get_user((x), __p) :					\
+		((x) = 0, -EFAULT);					\
+})
 
 /*
  * __put_user: - Write a simple value into user space, with less checking.
@@ -146,8 +160,32 @@ static inline int __access_ok(const void __user *p, unsigned long size)
  *
  * Returns zero on success, or -EFAULT on error.
  */
-#define __put_user(x,ptr) \
-	__put_user_nocheck((x), (ptr), sizeof(*(ptr)))
+#define __put_user(x, ptr)						\
+({									\
+	__typeof__(*(ptr)) __user *__pu_ptr = (ptr);			\
+	__typeof__(*(ptr)) __pu_val = (x);				\
+	int __pu_err = 0;						\
+									\
+	__chk_user_ptr(__pu_ptr);					\
+	switch (sizeof(*__pu_ptr)) {					\
+	case 1:								\
+		__put_data_asm(user_sb, __pu_ptr);			\
+		break;							\
+	case 2:								\
+		__put_data_asm(user_sh, __pu_ptr);			\
+		break;							\
+	case 4:								\
+		__put_data_asm(user_sw, __pu_ptr);			\
+		break;							\
+	case 8:								\
+		__PUT_DW(user_sd, __pu_ptr);				\
+		break;							\
+	default:							\
+		BUILD_BUG();						\
+	}								\
+									\
+	__pu_err;							\
+})
 
 /*
  * __get_user: - Get a simple variable from user space, with less checking.
@@ -170,8 +208,31 @@ static inline int __access_ok(const void __user *p, unsigned long size)
  * Returns zero on success, or -EFAULT on error.
  * On error, the variable @x is set to zero.
  */
-#define __get_user(x,ptr) \
-	__get_user_nocheck((x), (ptr), sizeof(*(ptr)))
+#define __get_user(x, ptr)						\
+({									\
+	const __typeof__(*(ptr)) __user *__gu_ptr = (ptr);		\
+	int __gu_err = 0;						\
+									\
+	__chk_user_ptr(__gu_ptr);					\
+	switch (sizeof(*__gu_ptr)) {					\
+	case 1:								\
+		__get_data_asm((x), user_lb, __gu_ptr);			\
+		break;							\
+	case 2:								\
+		__get_data_asm((x), user_lh, __gu_ptr);			\
+		break;							\
+	case 4:								\
+		__get_data_asm((x), user_lw, __gu_ptr);			\
+		break;							\
+	case 8:								\
+		__GET_DW((x), user_ld, __gu_ptr);			\
+		break;							\
+	default:							\
+		BUILD_BUG();						\
+	}								\
+									\
+	__gu_err;							\
+})
 
 struct __large_struct { unsigned long buf[100]; };
 #define __m(x) (*(struct __large_struct __user *)(x))
@@ -183,43 +244,6 @@ struct __large_struct { unsigned long buf[100]; };
 #define __GET_DW(val, insn, ptr) __get_data_asm(val, insn, ptr)
 #endif
 
-extern void __get_user_unknown(void);
-
-#define __get_user_common(val, size, ptr)				\
-do {									\
-	switch (size) {							\
-	case 1: __get_data_asm(val, user_lb, ptr); break;		\
-	case 2: __get_data_asm(val, user_lh, ptr); break;		\
-	case 4: __get_data_asm(val, user_lw, ptr); break;		\
-	case 8: __GET_DW(val, user_ld, ptr); break;			\
-	default: __get_user_unknown(); break;				\
-	}								\
-} while (0)
-
-#define __get_user_nocheck(x, ptr, size)				\
-({									\
-	int __gu_err;							\
-									\
-	__chk_user_ptr(ptr);						\
-	__get_user_common((x), size, ptr);				\
-									\
-	__gu_err;							\
-})
-
-#define __get_user_check(x, ptr, size)					\
-({									\
-	int __gu_err = -EFAULT;						\
-	const __typeof__(*(ptr)) __user * __gu_ptr = (ptr);		\
-									\
-	might_fault();							\
-	if (likely(access_ok(__gu_ptr, size))) {			\
-		__get_user_common((x), size, __gu_ptr);			\
-	} else								\
-		(x) = 0;						\
-									\
-	__gu_err;							\
-})
-
 #define __get_data_asm(val, insn, addr)					\
 {									\
 	long __gu_tmp;							\
@@ -297,7 +321,7 @@ do {									\
 			 (__force type *)(src));			\
 		break;							\
 	default:							\
-		__get_user_unknown();					\
+		BUILD_BUG();						\
 		break;							\
 	}								\
 	if (unlikely(__gu_err))						\
@@ -315,43 +339,6 @@ do {									\
 #define __PUT_DW(insn, ptr) __put_data_asm(insn, ptr)
 #endif
 
-#define __put_user_common(ptr, size)					\
-do {									\
-	switch (size) {							\
-	case 1: __put_data_asm(user_sb, ptr); break;			\
-	case 2: __put_data_asm(user_sh, ptr); break;			\
-	case 4: __put_data_asm(user_sw, ptr); break;			\
-	case 8: __PUT_DW(user_sd, ptr); break;				\
-	default: __put_user_unknown(); break;				\
-	}								\
-} while (0)
-
-#define __put_user_nocheck(x, ptr, size)				\
-({									\
-	__typeof__(*(ptr)) __pu_val;					\
-	int __pu_err = 0;						\
-									\
-	__pu_val = (x);							\
-	__chk_user_ptr(ptr);						\
-	__put_user_common(ptr, size);					\
-									\
-	__pu_err;							\
-})
-
-#define __put_user_check(x, ptr, size)					\
-({									\
-	__typeof__(*(ptr)) __user *__pu_addr = (ptr);			\
-	__typeof__(*(ptr)) __pu_val = (x);				\
-	int __pu_err = -EFAULT;						\
-									\
-	might_fault();							\
-	if (likely(access_ok(__pu_addr, size))) {			\
-		__put_user_common(__pu_addr, size);			\
-	}								\
-									\
-	__pu_err;							\
-})
-
 #define __put_data_asm(insn, ptr)					\
 {									\
 	__asm__ __volatile__(						\
@@ -390,8 +377,6 @@ do {									\
 	  "i" (-EFAULT));						\
 }
 
-extern void __put_user_unknown(void);
-
 #define __put_kernel_nofault(dst, src, type, err_label)			\
 do {									\
 	type __pu_val;					\
@@ -412,7 +397,7 @@ do {									\
 		__PUT_DW(kernel_sd, (type *)(dst));			\
 		break;							\
 	default:							\
-		__put_user_unknown();					\
+		BUILD_BUG();						\
 		break;							\
 	}								\
 	if (unlikely(__pu_err))						\
-- 
2.29.2

