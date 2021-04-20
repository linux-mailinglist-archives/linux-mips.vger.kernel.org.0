Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C21836616A
	for <lists+linux-mips@lfdr.de>; Tue, 20 Apr 2021 23:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233991AbhDTVPD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 20 Apr 2021 17:15:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233682AbhDTVPB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 20 Apr 2021 17:15:01 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A83EC06174A;
        Tue, 20 Apr 2021 14:14:27 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id e5so10488754wrg.7;
        Tue, 20 Apr 2021 14:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SINGf1VJr4PNrGueUhLZgsExg6JWOkA8GlI6O69q3t4=;
        b=vGZm5f2Ap4gpn9RbnMUT8dngwXlHZ1uwp+IKLgiGcqtfAE2mg70/uX9cPKtHCkUnaQ
         qi+evVM8hUg65R053u6sym4g/zexb80tAYadeN8zwB+h/OgRLnUnjvBLIuZMtyzgnH5X
         QEaLpIF5+1ME6vCqaRC9bWAeyQG/e1Ipt7Ehn6SVLOC6xOI4iJgwL4sF2qZS9ne5wgRp
         gVVsl6wcTuHX4F2Bn0jLS00tgYk8fUE4/PNDkCKnONMg/2fi7qsWIQrwxGDrP3+tw9WH
         HjZiW1xqEK2MIpCK2H5CHk56SwhRJuFlaORVcdfrzq1JaOWUneHOpNNTrtOQpWvONH9l
         iixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SINGf1VJr4PNrGueUhLZgsExg6JWOkA8GlI6O69q3t4=;
        b=pm3x8VwIYUx4KTUMvUs4aYLK9izx7ipK2weKKezyqRcMuwl9+HrGM7G2SJM7R91u9w
         8kQehpyKjNcLL8Tje3Oi90DAphx5SDpt/FFXY6HoKtebmeJKdLHKwMJcCsHKLQvyCkM8
         R/nE1TQWlwIwHtt7FcEwqlyelJuF0W9IpBrfIjlmVhKCH5vtBkSopiG+B8x43suV/ixn
         +AbP8RlUNQShc0Z7p52fVueCOdRw6jXZhIGfF35wAd3jSPDGibWy3X0eNbR1nZVuPTqd
         LyR64wjYOKYyPDW1H9tUy57E0ghFXpxaLwgRC73jG/aiPMNBVFXTpA7/Q+rEcaHbK89q
         OtZw==
X-Gm-Message-State: AOAM532aTjKwlKFEtvgYjyt/aN1PUPbOKVTY2Q6+Cfxo+udUeTRm1Y1k
        wlRS8DPAEGh60CGSXhoZr3jlOPpWZG2cbA==
X-Google-Smtp-Source: ABdhPJxyQ+lMPlzzKCAN+cLa8XeWnATkygaRTFknNeY1r9EvSRDJF8QYOodNDbnGOT98uq7J/LBOzg==
X-Received: by 2002:a5d:534e:: with SMTP id t14mr22486791wrv.239.1618953265807;
        Tue, 20 Apr 2021 14:14:25 -0700 (PDT)
Received: from localhost.localdomain (host-84-13-30-150.opaltelecom.net. [84.13.30.150])
        by smtp.gmail.com with ESMTPSA id b15sm250296wrt.57.2021.04.20.14.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 14:14:25 -0700 (PDT)
From:   Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Romain Naour <romain.naour@gmail.com>,
        Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH v4] mips: Do not include hi and lo in clobber list for R6
Date:   Tue, 20 Apr 2021 22:12:10 +0100
Message-Id: <20210420211210.702980-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Romain Naour <romain.naour@gmail.com>

From [1]
"GCC 10 (PR 91233) won't silently allow registers that are not
architecturally available to be present in the clobber list anymore,
resulting in build failure for mips*r6 targets in form of:
...
.../sysdep.h:146:2: error: the register ‘lo’ cannot be clobbered in ‘asm’ for the current target
  146 |  __asm__ volatile (      \
      |  ^~~~~~~

This is because base R6 ISA doesn't define hi and lo registers w/o DSP
extension. This patch provides the alternative clobber list for r6 targets
that won't include those registers."

Since kernel 5.4 and mips support for generic vDSO [2], the kernel fail to
build for mips r6 cpus with gcc 10 for the same reason as glibc.

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=020b2a97bb15f807c0482f0faee2184ed05bcad8
[2] '24640f233b46 ("mips: Add support for generic vDSO")'

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---

v4: [sudip] added macro VDSO_SYSCALL_CLOBBERS and fix checkpatch errors with commit message.
v3 Avoid duplicate code (Maciej W. Rozycki)
v2 use MIPS_ISA_REV instead of __mips_isa_rev (Alexander Lobakin)

I have reused the original patch by Romain and have retained his s-o-b
and author name as he is the original author of this patch. I have just
added the macro. Build tested with gcc-10.3.1 and gcc-9.3.0.

 arch/mips/include/asm/vdso/gettimeofday.h | 26 ++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/arch/mips/include/asm/vdso/gettimeofday.h b/arch/mips/include/asm/vdso/gettimeofday.h
index 2203e2d0ae2a..44a45f3fa4b0 100644
--- a/arch/mips/include/asm/vdso/gettimeofday.h
+++ b/arch/mips/include/asm/vdso/gettimeofday.h
@@ -20,6 +20,12 @@
 
 #define VDSO_HAS_CLOCK_GETRES		1
 
+#if MIPS_ISA_REV < 6
+#define VDSO_SYSCALL_CLOBBERS "hi", "lo",
+#else
+#define VDSO_SYSCALL_CLOBBERS
+#endif
+
 static __always_inline long gettimeofday_fallback(
 				struct __kernel_old_timeval *_tv,
 				struct timezone *_tz)
@@ -35,7 +41,9 @@ static __always_inline long gettimeofday_fallback(
 	: "=r" (ret), "=r" (error)
 	: "r" (tv), "r" (tz), "r" (nr)
 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
-	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
+	  "$14", "$15", "$24", "$25",
+	  VDSO_SYSCALL_CLOBBERS
+	  "memory");
 
 	return error ? -ret : ret;
 }
@@ -59,7 +67,9 @@ static __always_inline long clock_gettime_fallback(
 	: "=r" (ret), "=r" (error)
 	: "r" (clkid), "r" (ts), "r" (nr)
 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
-	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
+	  "$14", "$15", "$24", "$25",
+	  VDSO_SYSCALL_CLOBBERS
+	  "memory");
 
 	return error ? -ret : ret;
 }
@@ -83,7 +93,9 @@ static __always_inline int clock_getres_fallback(
 	: "=r" (ret), "=r" (error)
 	: "r" (clkid), "r" (ts), "r" (nr)
 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
-	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
+	  "$14", "$15", "$24", "$25",
+	  VDSO_SYSCALL_CLOBBERS
+	  "memory");
 
 	return error ? -ret : ret;
 }
@@ -105,7 +117,9 @@ static __always_inline long clock_gettime32_fallback(
 	: "=r" (ret), "=r" (error)
 	: "r" (clkid), "r" (ts), "r" (nr)
 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
-	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
+	  "$14", "$15", "$24", "$25",
+	  VDSO_SYSCALL_CLOBBERS
+	  "memory");
 
 	return error ? -ret : ret;
 }
@@ -125,7 +139,9 @@ static __always_inline int clock_getres32_fallback(
 	: "=r" (ret), "=r" (error)
 	: "r" (clkid), "r" (ts), "r" (nr)
 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
-	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
+	  "$14", "$15", "$24", "$25",
+	  VDSO_SYSCALL_CLOBBERS
+	  "memory");
 
 	return error ? -ret : ret;
 }
-- 
2.30.2

