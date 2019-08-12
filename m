Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D2AA895D2
	for <lists+linux-mips@lfdr.de>; Mon, 12 Aug 2019 05:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726774AbfHLDbi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 11 Aug 2019 23:31:38 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:33547 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726719AbfHLDbi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 11 Aug 2019 23:31:38 -0400
Received: by mail-wm1-f68.google.com with SMTP id p77so9967109wme.0;
        Sun, 11 Aug 2019 20:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XMXycnbWce+UbHDUEMzCA5GYy2ZL0FeWSfMNGV83HYk=;
        b=RSssZDQZI5E1WNiEoK8bq05Ikm9QZ+rPBWB9lbPt9P+0BhxSYiDfhnfhzBA59cC8sZ
         B4yA3aAWDw4yONakpXjKdVspeFrzNV/hw25jlh6Z1JdYaPA1HT31SYRIjHr2PDEXMZ+A
         +t0lsWe/ikHKcqzY/rOieBz8ntTQXKsoEsCrAjdaAfMf7JVxXSloKBf09pOFvhLRvSQM
         w0NkBKisbSX9aoA0vU1FDQHNrm5lz9+nfdL4Z6/gANQ5ohNjksHC+8EKlZRdTivBulsS
         leTzsX2C5BhEkB734XIYKO1fCoh8p95VxXVZaudiedFqpAudmHXFgU4+fUsxfHmYrbi8
         Ttsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XMXycnbWce+UbHDUEMzCA5GYy2ZL0FeWSfMNGV83HYk=;
        b=B0C1G2p1rRaPDRxgJhlpFCVwMmZP42C/fwbVnCOP/smZSTecsHucwVxOjWsdGaLuJt
         ScGXFRNZ1XfYXW/J69g+yMCVEnFXOrIQC5fn4dZVjXkNdh2taJkbfvUFh7KM4EEnymhx
         NQZ/1SxxAH54KAQbc8y+v36Fa+QNEQYl2GDnOsrBbeK+IesMXZsl1M4LFykdczcnPKtp
         FYojX8/RF/AtX9hGNIAm5Zxqkpv1r7ur+HYAwKvbT2WLqyc8Ksf2L7ks76PxW1gK3UG4
         J4pno7/uMLqRy7R5BlMKaGAjGSAZMcgYkEr8IDB65868nO31gU1529NlV4/h3ArdCL9R
         Bffw==
X-Gm-Message-State: APjAAAWko8lQYwc4+8tahNaYXcBc5EeJQs50guQ7AUf/5LIO7N2KSidz
        /2tSENVafPVmUYFkmMy2a14=
X-Google-Smtp-Source: APXvYqwzB/UTyeXNHuh5wTyPS+UJ020FG9M7u3PcN0r6+cmxCdQkw3YnAHwNnx6NmYzpbmsWZImSCw==
X-Received: by 2002:a05:600c:228e:: with SMTP id 14mr425013wmf.101.1565580695864;
        Sun, 11 Aug 2019 20:31:35 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f8:222:2f1b::2])
        by smtp.gmail.com with ESMTPSA id f12sm117299330wrg.5.2019.08.11.20.31.35
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 11 Aug 2019 20:31:35 -0700 (PDT)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com, Werner Koch <wk@gnupg.org>,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH 4/5] lib/mpi: Fix for building for MIPS64 with Clang
Date:   Sun, 11 Aug 2019 20:31:19 -0700
Message-Id: <20190812033120.43013-5-natechancellor@gmail.com>
X-Mailer: git-send-email 2.23.0.rc2
In-Reply-To: <20190812033120.43013-1-natechancellor@gmail.com>
References: <20190812033120.43013-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Werner Koch <wk@gnupg.org>

* mpi/longlong.h [MIPS64][__clang__]: Use the C version like we
already do for 32 bit MIPS

clang errors:

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

Fixes: 5ce3e312ec5c ("crypto: GnuPG based MPI lib - header files (part 2)")
Link: https://github.com/ClangBuiltLinux/linux/issues/605
Link: https://github.com/gpg/libgcrypt/commit/e7ae0ae243c8978a67c802169183187d88557be8
Signed-off-by: Werner Koch <wk@gnupg.org>
[nc: Added build error and tags to commit message
     Modified subject line
     Removed GnuPG-bug-id
     Removed space between defined and (__clang__)]
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 lib/mpi/longlong.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/mpi/longlong.h b/lib/mpi/longlong.h
index 8a1507fc94dd..5636e6a09f7a 100644
--- a/lib/mpi/longlong.h
+++ b/lib/mpi/longlong.h
@@ -688,7 +688,8 @@ do {									\
 		 : "d" ((UDItype)(u)),					\
 		   "d" ((UDItype)(v)));					\
 } while (0)
-#elif (__GNUC__ >= 5) || (__GNUC__ >= 4 && __GNUC_MINOR__ >= 4)
+#elif defined(__clang__) || (__GNUC__ >= 5) || (__GNUC__ == 4 && \
+						__GNUC_MINOR__ >= 4)
 #define umul_ppmm(w1, w0, u, v) \
 do {									\
 	typedef unsigned int __ll_UTItype __attribute__((mode(TI)));	\
-- 
2.23.0.rc2

