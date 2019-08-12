Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87BC28A73C
	for <lists+linux-mips@lfdr.de>; Mon, 12 Aug 2019 21:36:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbfHLTgJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Aug 2019 15:36:09 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35503 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726880AbfHLTgI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 12 Aug 2019 15:36:08 -0400
Received: by mail-wr1-f66.google.com with SMTP id k2so19761991wrq.2;
        Mon, 12 Aug 2019 12:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k2Q5Zs7N8/j45SfwYDhEjobCOU8g/47tJEkHFeIxHdQ=;
        b=L+vcXW+KZ8BQTvrEhjNTM9/4fNSXashX2Z9MybFGgXHOgLaxQrwJaCZIw8tyuMHQbW
         oAI5ft/lKpjXyHMpeFPuVksxq3JQfhfXjNYkF1lbSDiy+gb8Xem7Hlz7OW9uBiMyLGU5
         t0/hPwXrEiZMfO0L7cw9BacR+cu+KpzHaOYoAVQMWS3pqGBFdgcoGoMiQifCB3Is8CxJ
         qJewGM+821XESthu8Qp2EFHTARjMpbjmSuagNrZ0if4y05JOIGEBF5ZDh4AKxS8OZty1
         s/ctoFI0rUGmTXxdr1EvvpwLj9Pa8F/3mtWmnEcHi/vOVca9MCmVJPRpUPNx74ElYrJq
         oVwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k2Q5Zs7N8/j45SfwYDhEjobCOU8g/47tJEkHFeIxHdQ=;
        b=Of8ciqMrej3C44n72Ki/BZ8ZumtHk+Nnr4lFa5tf8lokdT+j72v4WVMbV/cY/MEqCd
         46ciy1ucTx/8CWQQM6DBeFTn5xzYk9ilhXBS06PvNFtTG5Xr+dVexfjYImHm1aHepXdI
         kt6OlZDptricKN9TNpeBBtLREMbbkZgSubG79mGbnqeBvd/7YrtXFG8DLrN4H3gu0nB4
         heLj5I89kQvzqjGtBa73C2nGSj1FbRWvytsmJSir4gD9zFyKe+iiDUXSmuaBnK4Gbf3m
         XH8MFG0LHEfzc5LqRZ0VkpQYvilRKDPlcLBV69JfKdzKk37VITbbtm9r4GW+1oWS4x3R
         Ym9g==
X-Gm-Message-State: APjAAAXdYqYTbpQSltPPUoifGRUqYUcexcW/aW6os+Ul/a8sVT8hmxkm
        GR9qkw6H6IPW/Mj14luLdSk=
X-Google-Smtp-Source: APXvYqzswoVYVjt/R00117iT42wlOz4HmNFFf19yfz3oM8qk/uVTrP34TUwKNyiEzRSwhGx5aTwW8g==
X-Received: by 2002:adf:fe08:: with SMTP id n8mr40819056wrr.60.1565638566277;
        Mon, 12 Aug 2019 12:36:06 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f8:222:2f1b::2])
        by smtp.gmail.com with ESMTPSA id l3sm26874346wrb.41.2019.08.12.12.36.04
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 12:36:05 -0700 (PDT)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Ralf Baechle <ralf@linux-mips.org>,
        James Hogan <jhogan@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>
Cc:     linux-mips@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: [PATCH v2] lib/mpi: Eliminate unused umul_ppmm definitions for MIPS
Date:   Mon, 12 Aug 2019 12:32:57 -0700
Message-Id: <20190812193256.55103-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.23.0.rc2
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Clang errors out when building this macro:

lib/mpi/generic_mpih-mul1.c:37:24: error: invalid use of a cast in a
inline asm context requiring an l-value: remove the cast or build with
-fheinous-gnu-extensions
                umul_ppmm(prod_high, prod_low, s1_ptr[j], s2_limb);
                ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
lib/mpi/longlong.h:652:20: note: expanded from macro 'umul_ppmm'
        : "=l" ((USItype)(w0)), \
                ~~~~~~~~~~^~~
lib/mpi/generic_mpih-mul1.c:37:3: error: invalid output constraint '=h'
in asm
                umul_ppmm(prod_high, prod_low, s1_ptr[j], s2_limb);
                ^
lib/mpi/longlong.h:653:7: note: expanded from macro 'umul_ppmm'
             "=h" ((USItype)(w1)) \
             ^
2 errors generated.

The C version that is used for GCC 4.4 and up works well with clang;
however, it is not currently being used because Clang masks itself
as GCC 4.2.1 for compatibility reasons. As Nick points out, we require
GCC 4.6 and newer in the kernel so we can eliminate all of the
versioning checks and just use the C version of umul_ppmm for all
supported compilers.

Link: https://github.com/ClangBuiltLinux/linux/issues/605
Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

This supersedes the following two patches:

https://lore.kernel.org/lkml/20190812033120.43013-4-natechancellor@gmail.com/

https://lore.kernel.org/lkml/20190812033120.43013-5-natechancellor@gmail.com/

I labelled this as a v2 so those don't get applied.

 lib/mpi/longlong.h | 36 +-----------------------------------
 1 file changed, 1 insertion(+), 35 deletions(-)

diff --git a/lib/mpi/longlong.h b/lib/mpi/longlong.h
index 3bb6260d8f42..2dceaca27489 100644
--- a/lib/mpi/longlong.h
+++ b/lib/mpi/longlong.h
@@ -639,30 +639,12 @@ do { \
 	**************  MIPS  *****************
 	***************************************/
 #if defined(__mips__) && W_TYPE_SIZE == 32
-#if (__GNUC__ >= 5) || (__GNUC__ >= 4 && __GNUC_MINOR__ >= 4)
 #define umul_ppmm(w1, w0, u, v)			\
 do {						\
 	UDItype __ll = (UDItype)(u) * (v);	\
 	w1 = __ll >> 32;			\
 	w0 = __ll;				\
 } while (0)
-#elif __GNUC__ > 2 || __GNUC_MINOR__ >= 7
-#define umul_ppmm(w1, w0, u, v) \
-	__asm__ ("multu %2,%3" \
-	: "=l" ((USItype)(w0)), \
-	     "=h" ((USItype)(w1)) \
-	: "d" ((USItype)(u)), \
-	     "d" ((USItype)(v)))
-#else
-#define umul_ppmm(w1, w0, u, v) \
-	__asm__ ("multu %2,%3\n" \
-	   "mflo %0\n" \
-	   "mfhi %1" \
-	: "=d" ((USItype)(w0)), \
-	     "=d" ((USItype)(w1)) \
-	: "d" ((USItype)(u)), \
-	     "d" ((USItype)(v)))
-#endif
 #define UMUL_TIME 10
 #define UDIV_TIME 100
 #endif /* __mips__ */
@@ -687,7 +669,7 @@ do {									\
 		 : "d" ((UDItype)(u)),					\
 		   "d" ((UDItype)(v)));					\
 } while (0)
-#elif (__GNUC__ >= 5) || (__GNUC__ >= 4 && __GNUC_MINOR__ >= 4)
+#else
 #define umul_ppmm(w1, w0, u, v) \
 do {									\
 	typedef unsigned int __ll_UTItype __attribute__((mode(TI)));	\
@@ -695,22 +677,6 @@ do {									\
 	w1 = __ll >> 64;						\
 	w0 = __ll;							\
 } while (0)
-#elif __GNUC__ > 2 || __GNUC_MINOR__ >= 7
-#define umul_ppmm(w1, w0, u, v) \
-	__asm__ ("dmultu %2,%3" \
-	: "=l" ((UDItype)(w0)), \
-	     "=h" ((UDItype)(w1)) \
-	: "d" ((UDItype)(u)), \
-	     "d" ((UDItype)(v)))
-#else
-#define umul_ppmm(w1, w0, u, v) \
-	__asm__ ("dmultu %2,%3\n" \
-	   "mflo %0\n" \
-	   "mfhi %1" \
-	: "=d" ((UDItype)(w0)), \
-	     "=d" ((UDItype)(w1)) \
-	: "d" ((UDItype)(u)), \
-	     "d" ((UDItype)(v)))
 #endif
 #define UMUL_TIME 20
 #define UDIV_TIME 140
-- 
2.23.0.rc2

