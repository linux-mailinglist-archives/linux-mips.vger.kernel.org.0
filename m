Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6BC72F67CF
	for <lists+linux-mips@lfdr.de>; Thu, 14 Jan 2021 18:36:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727837AbhANRfJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 Jan 2021 12:35:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbhANRfI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 14 Jan 2021 12:35:08 -0500
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C257C061575;
        Thu, 14 Jan 2021 09:34:28 -0800 (PST)
Received: by mail-qv1-xf2a.google.com with SMTP id h1so2644523qvy.12;
        Thu, 14 Jan 2021 09:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kCQuRKJV8MS0m+eS6ZaaNMBFzL9uXXb/X61hiZ7gM1w=;
        b=nmjRDHivPRnxjCnygAiO4DRZKHedxcYS3uMPQWKUARkCymm6aB/ztJP68umUNk9Tm7
         8wHVpiFXZNy0F5wvlQKi9JRo+v216h77Q8qMxhhd+FFVYlRKNs9C/o98ghcLxbVjtUPC
         HFZa+NF8ydfsMf0cExZF9mKohymgwORaAmtvmQZkbSeWluYY1NWLICtwJ9qIoBFytAzW
         VQermUSWchvsjj+orETAB6GmND8A3naujrL6d+gZBgx4ElzHLw+HzyPXPcMAIuLB6pbw
         5+GxjZwfF5lqECIIWzM+XiW80Nxhfb+SapxwuDbgWG3+vBV/ZYQ+EP/qAQgaqVO1bx3x
         97Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kCQuRKJV8MS0m+eS6ZaaNMBFzL9uXXb/X61hiZ7gM1w=;
        b=Gcmhn90ebTSurSkLk+DkuYA1DlGTesMYLLDBrKA7AYNw/1RwAxzXNcnwgQ8ZmTg7TC
         MqsRgDUBGhd3rfEPHxvujWAghPcpM+iWZO3jtSswyzE47/bC17DkghrokeCC24P2pDl9
         qGLVKx1mEMJtYXSf6QNP1Wg9Voc7jcz2ZLQNl7QMXe1rqURZwKMD8s+zhkyFyc40Mz6e
         PuV31m9+4hKYbjs+NyEhvOrQEiFJGCBV2xL5TgyGMDxhUCbuBzXYIwFRun8kAtz4aoET
         jw/Y8vTgqzA+AI+5pWDBydQSnICHheEt/KN7m9rlDmElsUkNVFLvm3lkOqHUfzVQswEw
         RnuA==
X-Gm-Message-State: AOAM530EW33v0ojAPzUeUXygWbsJ2hkYFYOPf+bQN0LITxEgAvIZyTXF
        xXfYHCuqFV6ClRAnQMLtPwE=
X-Google-Smtp-Source: ABdhPJzomWKsf7Q8OnaVXMfF/LpqtkUAU9s6ZbSBGU3NRoP3pbuf1MfHAtooVDij5KzKIiEIWsjA+w==
X-Received: by 2002:ad4:4a72:: with SMTP id cn18mr8231457qvb.50.1610645667500;
        Thu, 14 Jan 2021 09:34:27 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:45f1:1d00::1])
        by smtp.gmail.com with ESMTPSA id y10sm3384190qkb.115.2021.01.14.09.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 09:34:26 -0800 (PST)
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Nathan Chancellor <natechancellor@gmail.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] MIPS: Compare __SYNC_loongson3_war against 0
Date:   Thu, 14 Jan 2021 10:34:16 -0700
Message-Id: <20210114173416.738455-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When building with clang when CONFIG_CPU_LOONGSON3_WORKAROUNDS is
enabled:

 In file included from lib/errseq.c:4:
 In file included from ./include/linux/atomic.h:7:
 ./arch/mips/include/asm/atomic.h:52:1: warning: converting the result of
 '<<' to a boolean always evaluates to true
 [-Wtautological-constant-compare]
 ATOMIC_OPS(atomic64, s64)
 ^
 ./arch/mips/include/asm/atomic.h:40:9: note: expanded from macro
 'ATOMIC_OPS'
         return cmpxchg(&v->counter, o, n);
                ^
 ./arch/mips/include/asm/cmpxchg.h:194:7: note: expanded from macro
 'cmpxchg'
         if (!__SYNC_loongson3_war)
              ^
 ./arch/mips/include/asm/sync.h:147:34: note: expanded from macro
 '__SYNC_loongson3_war'
 # define __SYNC_loongson3_war   (1 << 31)
                                    ^

While it is not wrong that the result of this shift is always true in a
boolean context, it is not a problem here. Regardless, the warning is
really noisy so rather than making the shift a boolean implicitly, use
it in an equality comparison so the shift is used as an integer value.

Fixes: 4d1dbfe6cbec ("MIPS: atomic: Emit Loongson3 sync workarounds within asm")
Fixes: a91f2a1dba44 ("MIPS: cmpxchg: Omit redundant barriers for Loongson3")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 arch/mips/include/asm/atomic.h  | 2 +-
 arch/mips/include/asm/cmpxchg.h | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/mips/include/asm/atomic.h b/arch/mips/include/asm/atomic.h
index f904084fcb1f..27ad76791539 100644
--- a/arch/mips/include/asm/atomic.h
+++ b/arch/mips/include/asm/atomic.h
@@ -248,7 +248,7 @@ static __inline__ int pfx##_sub_if_positive(type i, pfx##_t * v)	\
 	 * bltz that can branch	to code outside of the LL/SC loop. As	\
 	 * such, we don't need to emit another barrier here.		\
 	 */								\
-	if (!__SYNC_loongson3_war)					\
+	if (__SYNC_loongson3_war == 0)					\
 		smp_mb__after_atomic();					\
 									\
 	return result;							\
diff --git a/arch/mips/include/asm/cmpxchg.h b/arch/mips/include/asm/cmpxchg.h
index 5b0b3a6777ea..ed8f3f3c4304 100644
--- a/arch/mips/include/asm/cmpxchg.h
+++ b/arch/mips/include/asm/cmpxchg.h
@@ -99,7 +99,7 @@ unsigned long __xchg(volatile void *ptr, unsigned long x, int size)
 	 * contains a completion barrier prior to the LL, so we don't	\
 	 * need to emit an extra one here.				\
 	 */								\
-	if (!__SYNC_loongson3_war)					\
+	if (__SYNC_loongson3_war == 0)					\
 		smp_mb__before_llsc();					\
 									\
 	__res = (__typeof__(*(ptr)))					\
@@ -191,7 +191,7 @@ unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
 	 * contains a completion barrier prior to the LL, so we don't	\
 	 * need to emit an extra one here.				\
 	 */								\
-	if (!__SYNC_loongson3_war)					\
+	if (__SYNC_loongson3_war == 0)					\
 		smp_mb__before_llsc();					\
 									\
 	__res = cmpxchg_local((ptr), (old), (new));			\
@@ -201,7 +201,7 @@ unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
 	 * contains a completion barrier after the SC, so we don't	\
 	 * need to emit an extra one here.				\
 	 */								\
-	if (!__SYNC_loongson3_war)					\
+	if (__SYNC_loongson3_war == 0)					\
 		smp_llsc_mb();						\
 									\
 	__res;								\

base-commit: 7c53f6b671f4aba70ff15e1b05148b10d58c2837
-- 
2.30.0

