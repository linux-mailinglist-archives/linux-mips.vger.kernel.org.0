Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 971B21AFCFD
	for <lists+linux-mips@lfdr.de>; Sun, 19 Apr 2020 20:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbgDSSFD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 19 Apr 2020 14:05:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726441AbgDSSFC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 19 Apr 2020 14:05:02 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 041FDC061A0C;
        Sun, 19 Apr 2020 11:05:01 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id z25so2599260otq.13;
        Sun, 19 Apr 2020 11:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vR4OoJO7KozFHQiJz0C5ZTDf3DqjOZtDT398xwIxeeI=;
        b=azl4wDkCSMKJ74rVGH7e1BnRmpVBfcQ7l8xnoRK30SrYkmN+CZ6M80VBfoPVg9KZYT
         GXVcJXJDswjIsXDIsI5AbRwsfHlvAOF5y/yPJhWWpsv34rXVXgmh2sk6+qK+QH7wr//o
         /5dx81w4IWfLZP2q7JiEiKCpCDrpRwJDzPx3Z/9ge7u3t+/xfyDWFDobJAMZ/yKsRaDf
         zRnPvBL2IIOoaVK85go5mH+1yKK5ib/ay8dl2ULsQ7x6d6stm63Y9bHln9iBC+tEqK6K
         iI8w/wn96e2omY2gpTIOsshgpARiKwxuM9T8pZ28HU1FI2Kt+VNEPjdld61o93TjO0mu
         UGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vR4OoJO7KozFHQiJz0C5ZTDf3DqjOZtDT398xwIxeeI=;
        b=OTnQlmte6mPeJDu2YGXwdzgmfjXgkCDAL5eTouIqNbV+hYRBI1hNzLM/Oy8g64wtUk
         N0mm9Lf1gW8oagaXcqHT8kh+Vrb4bI7Nh2Q7RV+/k4Z0dGqWLxYo/ZXJtxCH/op0KkHq
         /LJNN3h3vX3FxNxpdIwRojDHesNr4wSG0NSi6KO9HhsPGNjPopRQ5B8qnrLfEWoNDUYV
         44iEGAQ4Qz1HgpzhFJejrvdqtzJ1EyLGNDWNh5eYBs5x1d/eJNCsfKU10lSBtCy6cel3
         DTHcDwqbyTMUgqomOype2PE3zZ1AmO+53yrVmoi8KMzpM4MmybOOKGgvOoO7eRfHx6US
         WRcQ==
X-Gm-Message-State: AGi0PuYsUW18hOQnRmfxsJaEf1Yg89R6tHpWEGSwjikovyEUnf9LTxHx
        8JB83bXNXIxIVDu7wkjRW8M=
X-Google-Smtp-Source: APiQypI0AU/HahbKPMUS1RsluleWWt9SOsw+UeMO8nWI4CcYjCtnEZeQtXTleysjo3v8fs3oxuuXVw==
X-Received: by 2002:a9d:3c8:: with SMTP id f66mr6551784otf.368.1587319500354;
        Sun, 19 Apr 2020 11:05:00 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::3])
        by smtp.gmail.com with ESMTPSA id t10sm3720075oou.38.2020.04.19.11.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 11:05:00 -0700 (PDT)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Dmitry Golovin <dima@golovin.in>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH 2/2] MIPS: VDSO: Do not disable VDSO when linking with ld.lld
Date:   Sun, 19 Apr 2020 11:04:45 -0700
Message-Id: <20200419180445.26722-2-natechancellor@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200419180445.26722-1-natechancellor@gmail.com>
References: <20200419180445.26722-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Currently, when linking with ld.lld, this warning pops up:

    arch/mips/vdso/Makefile:70: MIPS VDSO requires binutils >= 2.25

ld-ifversion calls ld-version, which calls scripts/ld-version.sh, which
is specific to GNU ld. ld.lld has a completely different versioning
scheme (as it follows LLVM's versioning) and it does not have the issue
mentioned in the comment above this block so it should not be subjected
to this check.

With this patch, the VDSO successfully links and shows P_MIPS_PC32 in
vgettimeofday.o.

$ llvm-objdump -Dr arch/mips/vdso/vgettimeofday.o | grep R_MIPS_PC32
			00000024:  R_MIPS_PC32	_start
			000000b0:  R_MIPS_PC32	_start
			000002bc:  R_MIPS_PC32	_start
			0000036c:  R_MIPS_PC32	_start
			00000468:  R_MIPS_PC32	_start

Link: https://github.com/ClangBuiltLinux/linux/issues/785
Link: https://github.com/llvm/llvm-project/commit/e364e2e9ce50c12eb2bf093560e1a1a8544d455a
Reported-by: Dmitry Golovin <dima@golovin.in>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 arch/mips/vdso/Makefile | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/mips/vdso/Makefile b/arch/mips/vdso/Makefile
index d7fe8408603e..f99e583d14a1 100644
--- a/arch/mips/vdso/Makefile
+++ b/arch/mips/vdso/Makefile
@@ -65,9 +65,11 @@ DISABLE_VDSO := n
 # the comments on that file.
 #
 ifndef CONFIG_CPU_MIPSR6
-  ifeq ($(call ld-ifversion, -lt, 225000000, y),y)
-    $(warning MIPS VDSO requires binutils >= 2.25)
-    DISABLE_VDSO := y
+  ifndef CONFIG_LD_IS_LLD
+    ifeq ($(call ld-ifversion, -lt, 225000000, y),y)
+      $(warning MIPS VDSO requires binutils >= 2.25)
+      DISABLE_VDSO := y
+    endif
   endif
 endif
 
-- 
2.26.1

