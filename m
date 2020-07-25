Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B42D122D7D7
	for <lists+linux-mips@lfdr.de>; Sat, 25 Jul 2020 15:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726652AbgGYNZj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 25 Jul 2020 09:25:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726639AbgGYNZj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 25 Jul 2020 09:25:39 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC0F0C0619D3
        for <linux-mips@vger.kernel.org>; Sat, 25 Jul 2020 06:25:38 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id k8so210918wma.2
        for <linux-mips@vger.kernel.org>; Sat, 25 Jul 2020 06:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sNDB1lwSbhA7GI0Ygi3PqgzM1hEid/zge3LhuhDk23w=;
        b=OcSX2fDZk/WSPw+Din9mBDwmMnEbQF04xDdgVHVF7AYEnW3XuUYXCUga/5VFi4+xt4
         qbJJCvD2lY+HJFBwp5/ArBPQVsBXn1lGWP9GanS8TuSTfx0QXJSvSCY20Pc4FPAGg7f2
         peeHgxXNYBLAbr1GtxYzNXYZtRQFo05HXqobbEwi5jU/es1LPvR6+UxjJFCBw4+QZ8r2
         csyaMjwazoQ8KzdxZWKramRU81l+5rVzOfaeFS56+CXHJ9Mgwxvveubr1gg9koO3iXFN
         pw5iJYQKQwrk4+jlwLt9tayJKbuLivUDk1I6u1rOxE5YbMvSXpzry5Wih98Ij+JU45Ep
         lgng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sNDB1lwSbhA7GI0Ygi3PqgzM1hEid/zge3LhuhDk23w=;
        b=spBPFbFTc29LYf0VwSlEQqT7exJsxy5BDT2GGbwvEtkxzHpov7/74DLQ8X9ds0EMmZ
         cocsmhyBLsdfF8xN8Mh9SEDs65I3dMsoEj2X/Go28oUGwkPq9L1uPFmiDXifJGDG6iVI
         as9SGiNg7PgozG0gFKOtBBWuVel1TFd0TrRGIzTmfL8J1NOKQS4kh6mH7mENDkxu77K5
         rVGNBLLXws0NnPp47FKWc54/xbDZl3yzsr/dkg2zAtgl8xrJ26IRXZ1XtYmxQ2tOLSrU
         iMxLdX2cUQhjMmKD2lk7/VpmHYGsaqRqO/N+mxFp3lNtG6NZYaAtyHdqJdRdvDXD3N8f
         ga9A==
X-Gm-Message-State: AOAM5324wExfJ4AsnRgjbq/uCzm254PQsiWwtBZbE2ipjuCFbc4L6oL/
        TY007LF9au7cqeUXekt+Lxt4DsHV
X-Google-Smtp-Source: ABdhPJx7Qczm+eLQUKEjL3O6y2Xf8iHrTmzYEwI7227+NPXYKfR5mCzHMd6a1WWT+E8am6dSghA8Dw==
X-Received: by 2002:a1c:6804:: with SMTP id d4mr10490995wmc.175.1595683536547;
        Sat, 25 Jul 2020 06:25:36 -0700 (PDT)
Received: from localhost.localdomain (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr. [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
        by smtp.gmail.com with ESMTPSA id g16sm4903175wrs.88.2020.07.25.06.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2020 06:25:35 -0700 (PDT)
From:   Romain Naour <romain.naour@gmail.com>
To:     linux-mips@vger.kernel.org
Cc:     Romain Naour <romain.naour@gmail.com>
Subject: [PATCH] mips: Do not include hi and lo in clobber list for R6
Date:   Sat, 25 Jul 2020 15:25:33 +0200
Message-Id: <20200725132533.1326827-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From [1]
"GCC 10 (PR 91233) won't silently allow registers that are not architecturally
available to be present in the clobber list anymore, resulting in build failure
for mips*r6 targets in form of:
...
.../sysdep.h:146:2: error: the register ‘lo’ cannot be clobbered in ‘asm’ for the current target
  146 |  __asm__ volatile (      \
      |  ^~~~~~~

This is because base R6 ISA doesn't define hi and lo registers w/o DSP extension.
This patch provides the alternative clobber list for r6 targets that won't include
those registers."

Since kernel 5.4 and mips support for generic vDSO [2], the kernel fail to build
for mips r6 cpus with gcc 10 for the same reason as glibc.

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=020b2a97bb15f807c0482f0faee2184ed05bcad8
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=24640f233b466051ad3a5d2786d2951e43026c9d

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 arch/mips/include/asm/vdso/gettimeofday.h | 45 +++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/mips/include/asm/vdso/gettimeofday.h b/arch/mips/include/asm/vdso/gettimeofday.h
index c63ddcaea54c..6192d94928b9 100644
--- a/arch/mips/include/asm/vdso/gettimeofday.h
+++ b/arch/mips/include/asm/vdso/gettimeofday.h
@@ -30,12 +30,21 @@ static __always_inline long gettimeofday_fallback(
 	register long nr asm("v0") = __NR_gettimeofday;
 	register long error asm("a3");
 
+#if __mips_isa_rev >= 6
+	asm volatile(
+	"       syscall\n"
+	: "=r" (ret), "=r" (error)
+	: "r" (tv), "r" (tz), "r" (nr)
+	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
+	  "$14", "$15", "$24", "$25", "memory");
+#else
 	asm volatile(
 	"       syscall\n"
 	: "=r" (ret), "=r" (error)
 	: "r" (tv), "r" (tz), "r" (nr)
 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
 	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
+#endif
 
 	return error ? -ret : ret;
 }
@@ -54,12 +63,21 @@ static __always_inline long clock_gettime_fallback(
 #endif
 	register long error asm("a3");
 
+#if __mips_isa_rev >= 6
+	asm volatile(
+	"       syscall\n"
+	: "=r" (ret), "=r" (error)
+	: "r" (clkid), "r" (ts), "r" (nr)
+	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
+	  "$14", "$15", "$24", "$25", "memory");
+#else
 	asm volatile(
 	"       syscall\n"
 	: "=r" (ret), "=r" (error)
 	: "r" (clkid), "r" (ts), "r" (nr)
 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
 	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
+#endif
 
 	return error ? -ret : ret;
 }
@@ -78,12 +96,21 @@ static __always_inline int clock_getres_fallback(
 #endif
 	register long error asm("a3");
 
+#if __mips_isa_rev >= 6
+	asm volatile(
+	"       syscall\n"
+	: "=r" (ret), "=r" (error)
+	: "r" (clkid), "r" (ts), "r" (nr)
+	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
+	  "$14", "$15", "$24", "$25", "memory");
+#else
 	asm volatile(
 	"       syscall\n"
 	: "=r" (ret), "=r" (error)
 	: "r" (clkid), "r" (ts), "r" (nr)
 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
 	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
+#endif
 
 	return error ? -ret : ret;
 }
@@ -100,12 +127,21 @@ static __always_inline long clock_gettime32_fallback(
 	register long nr asm("v0") = __NR_clock_gettime;
 	register long error asm("a3");
 
+#if __mips_isa_rev >= 6
+	asm volatile(
+	"       syscall\n"
+	: "=r" (ret), "=r" (error)
+	: "r" (clkid), "r" (ts), "r" (nr)
+	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
+	  "$14", "$15", "$24", "$25", "memory");
+#else
 	asm volatile(
 	"       syscall\n"
 	: "=r" (ret), "=r" (error)
 	: "r" (clkid), "r" (ts), "r" (nr)
 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
 	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
+#endif
 
 	return error ? -ret : ret;
 }
@@ -120,12 +156,21 @@ static __always_inline int clock_getres32_fallback(
 	register long nr asm("v0") = __NR_clock_getres;
 	register long error asm("a3");
 
+#if __mips_isa_rev >= 6
+	asm volatile(
+	"       syscall\n"
+	: "=r" (ret), "=r" (error)
+	: "r" (clkid), "r" (ts), "r" (nr)
+	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
+	  "$14", "$15", "$24", "$25", "memory");
+#else
 	asm volatile(
 	"       syscall\n"
 	: "=r" (ret), "=r" (error)
 	: "r" (clkid), "r" (ts), "r" (nr)
 	: "$1", "$3", "$8", "$9", "$10", "$11", "$12", "$13",
 	  "$14", "$15", "$24", "$25", "hi", "lo", "memory");
+#endif
 
 	return error ? -ret : ret;
 }
-- 
2.25.4

