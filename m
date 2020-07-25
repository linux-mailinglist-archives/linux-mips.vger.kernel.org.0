Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98A2722D83D
	for <lists+linux-mips@lfdr.de>; Sat, 25 Jul 2020 16:54:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727019AbgGYOyI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 25 Jul 2020 10:54:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726995AbgGYOyH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 25 Jul 2020 10:54:07 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97925C08C5C0
        for <linux-mips@vger.kernel.org>; Sat, 25 Jul 2020 07:54:07 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id 88so10800740wrh.3
        for <linux-mips@vger.kernel.org>; Sat, 25 Jul 2020 07:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=13suLKCjI0rGo6JSyVvaKk0802KzAQ/+fJkCrwWDmpw=;
        b=q4GsrEd+kw5lImpieod1fTiA7mVF6Gjs1cdyLBUux+xr4JCGjgdkAzdqnTzpTJko61
         YGIR1KAjAi4Q5yPcGDzGOZM86L+An1C0oS8Fx+KfQskxus/kH7lu4wAUnH1CtJ+x7HXf
         7+rU5xy7/RsF5RNocLeJemgGKSRozv2F5nRKyZYvL96wrlLl4k7sqiVHacfpWepJlXGU
         OEwnB/nC9WGH7AvU3pihLD9oeG9GPHZWZXYjemaPHxy56yK6g3NRE/dTV0Z73o/kxhvv
         2KJdpEVrjwLoR8QhyPITzTDa8LXUOhK4ESEL7DScFGnhXWHRbo/7avGCdtRxMCru+3qn
         CPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=13suLKCjI0rGo6JSyVvaKk0802KzAQ/+fJkCrwWDmpw=;
        b=q0GW1BGptRpmOh5Skr1sc8n8ojJGxfs4goD14bSLbn4UIOm2MYoRNr/+F79inRwUAe
         +N0o3Cv9dkDzFbURh4R6N3dgmsGTZ7HT9HqUgU7mAQIexg9vPaZVXHark6bI1keG6oyu
         hcrwihFmBDVELFENhPLg3LIopf7JYLq+9W/eFlyREBA/U85N8R1Wzfx+UvWhAaw49Vgo
         jLEJfgRVYbcCVvQqQ5fEIT6YAI92E1BEOzlTCa4rDU3rq4VE1ke5QOz4VApgbD2wz8c7
         WGCgHdULREcMrr4q8rdCHdib/C1/vtvCqSfCUi1R4cO8RiOIaxdsabdRuP7M2whIEIRn
         l9lQ==
X-Gm-Message-State: AOAM533MfrizrrkpfAtYXtSUj0mFA2x23JswDz87GdOhcT+/I6rriiWW
        vX0lcmFxkEA4mg/AcXFTC5PJ96bb
X-Google-Smtp-Source: ABdhPJybhv7UJZhliTq2dN2rxyIbar2eBTBz65QrGwrI6q8XYjj0z853MDQcfYPs1AYxzJi+95cm5A==
X-Received: by 2002:adf:a3d0:: with SMTP id m16mr12275654wrb.232.1595688845577;
        Sat, 25 Jul 2020 07:54:05 -0700 (PDT)
Received: from localhost.localdomain (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr. [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
        by smtp.gmail.com with ESMTPSA id q2sm1399468wro.8.2020.07.25.07.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2020 07:54:05 -0700 (PDT)
From:   Romain Naour <romain.naour@gmail.com>
To:     linux-mips@vger.kernel.org
Cc:     Romain Naour <romain.naour@gmail.com>
Subject: [PATCHv2] mips: Do not include hi and lo in clobber list for R6
Date:   Sat, 25 Jul 2020 16:54:01 +0200
Message-Id: <20200725145401.1357002-1-romain.naour@gmail.com>
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
v2 use MIPS_ISA_REV instead of __mips_isa_rev (Alexander Lobakin)
---
 arch/mips/include/asm/vdso/gettimeofday.h | 45 +++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/mips/include/asm/vdso/gettimeofday.h b/arch/mips/include/asm/vdso/gettimeofday.h
index c63ddcaea54c..e377a7201a33 100644
--- a/arch/mips/include/asm/vdso/gettimeofday.h
+++ b/arch/mips/include/asm/vdso/gettimeofday.h
@@ -30,12 +30,21 @@ static __always_inline long gettimeofday_fallback(
 	register long nr asm("v0") = __NR_gettimeofday;
 	register long error asm("a3");
 
+#if MIPS_ISA_REV >= 6
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
 
+#if MIPS_ISA_REV >= 6
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
 
+#if MIPS_ISA_REV >= 6
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
 
+#if MIPS_ISA_REV >= 6
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
 
+#if MIPS_ISA_REV >= 6
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

