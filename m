Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01F39895D3
	for <lists+linux-mips@lfdr.de>; Mon, 12 Aug 2019 05:31:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726759AbfHLDbi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 11 Aug 2019 23:31:38 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40379 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726602AbfHLDbg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 11 Aug 2019 23:31:36 -0400
Received: by mail-wr1-f65.google.com with SMTP id r1so4223967wrl.7;
        Sun, 11 Aug 2019 20:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pX+X19b0YkyFPAZFTnPH3TVfzRvutgNdCw+9iXgOsdU=;
        b=Lpamp3vwhT6x6dNvYdI8KXfkPXFp3I/7a5n3xAvi8vvW7qbgTAiRVJVwHcBDS0QT17
         6K58SPa1RiEEEUerqHKSs3K0Lcfl1g7mp4QgrtoFF/YsJDlcPLQ78v2SLYSiits6PD+e
         9I2LL3B5b0nW6hNNgH9oXaoTmGOtmr6Jwa4MQ9OlmFBzxjTMopq6O7L3DteVnyvWtGBQ
         GvDlBFM0+e/a7Yb0p7ReWk+e/EtcPT8QoxMylka6UUGkfwEU/Ib3KkwVmgSevFJ/gKYS
         5f/sJEZw9Xnqsj45MH7KLCLuNwP/XAIc3NNy3thRGB5XY/98q2i8AzpqiiJbk9yakcpI
         99FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pX+X19b0YkyFPAZFTnPH3TVfzRvutgNdCw+9iXgOsdU=;
        b=AhaiZJIOAXmG4WC9vVgIMoA6W6T+pt9DsRXEMUZn819aDLjBCpPF8dVurg7KF+GAyp
         IYp9eslQ9CjoHojtdt64oe7AeljA+aPeqe3/TZEuYZ8Ir0FqIVKwWG590newTqmYqXEw
         5FdVnVoTs9H5yhunX8JippNxlQz2aXTibtKlk4qXRfIdK6gdfyJYgxquFRxbL7Oax2DN
         ZVG3be+fi0zOolSdgzfgyV4NCgFdonlomWfG/SfU7pb6CBpDjTEqZ3o1mG7jnwobu7x0
         qirQerJ9TaHAy0AeT3BiL3vDeZEhww67oFQ1b3Dp+TmkKrLy4LL5vbtJTLdS7w/eF86s
         Srdw==
X-Gm-Message-State: APjAAAWD61mRgWYn+E/7qjTguFCtqPyxOJPF0h07OgaLeMgTgIUnlSI7
        u3bHiV43kEATLMcwy8IUvKU=
X-Google-Smtp-Source: APXvYqzrIM/kxH8lA8H5QgWfz0l/KTO5OiXZQmgM4dB0M8sIgxXNQSrjbZOfjWipcsl6J7ATAfXeKA==
X-Received: by 2002:adf:b613:: with SMTP id f19mr5713852wre.192.1565580694370;
        Sun, 11 Aug 2019 20:31:34 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f8:222:2f1b::2])
        by smtp.gmail.com with ESMTPSA id f12sm117299330wrg.5.2019.08.11.20.31.33
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 11 Aug 2019 20:31:33 -0700 (PDT)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Vladimir Serbinenko <phcoder@gmail.com>,
        Jussi Kivilinna <jussi.kivilinna@iki.fi>,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH 3/5] lib/mpi: Fix for building for MIPS32 with Clang
Date:   Sun, 11 Aug 2019 20:31:18 -0700
Message-Id: <20190812033120.43013-4-natechancellor@gmail.com>
X-Mailer: git-send-email 2.23.0.rc2
In-Reply-To: <20190812033120.43013-1-natechancellor@gmail.com>
References: <20190812033120.43013-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Vladimir Serbinenko <phcoder@gmail.com>

clang doesn't recognise =l / =h assembly operand specifiers but apparently
handles C version well.

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
Link: https://github.com/gpg/libgcrypt/commit/1ecbd0bca31d462719a2a6590c1d03244e76ef89
Signed-off-by: Vladimir Serbinenko <phcoder@gmail.com>
[jk: add changelog, rebase on libgcrypt repository, reformat changed
 line so it does not go over 80 characters]
Signed-off-by: Jussi Kivilinna <jussi.kivilinna@iki.fi>
[nc: Added build error and tags to commit message
     Added Vladimir's signoff with his permission
     Adjusted Jussi's comment to wrap at 73 characters
     Modified commit subject to mirror MIPS64 commit
     Removed space between defined and (__clang__)]
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 lib/mpi/longlong.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/mpi/longlong.h b/lib/mpi/longlong.h
index 3bb6260d8f42..8a1507fc94dd 100644
--- a/lib/mpi/longlong.h
+++ b/lib/mpi/longlong.h
@@ -639,7 +639,8 @@ do { \
 	**************  MIPS  *****************
 	***************************************/
 #if defined(__mips__) && W_TYPE_SIZE == 32
-#if (__GNUC__ >= 5) || (__GNUC__ >= 4 && __GNUC_MINOR__ >= 4)
+#if defined(__clang__) || (__GNUC__ >= 5) || (__GNUC__ == 4 && \
+					      __GNUC_MINOR__ >= 4)
 #define umul_ppmm(w1, w0, u, v)			\
 do {						\
 	UDItype __ll = (UDItype)(u) * (v);	\
-- 
2.23.0.rc2

