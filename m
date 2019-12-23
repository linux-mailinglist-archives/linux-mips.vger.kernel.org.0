Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B31B1129774
	for <lists+linux-mips@lfdr.de>; Mon, 23 Dec 2019 15:31:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726933AbfLWObF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Dec 2019 09:31:05 -0500
Received: from pegase1.c-s.fr ([93.17.236.30]:6548 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726884AbfLWObE (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 23 Dec 2019 09:31:04 -0500
Received: from localhost (mailhub1-ext [192.168.12.233])
        by localhost (Postfix) with ESMTP id 47hMGT3tYfz9txhf;
        Mon, 23 Dec 2019 15:30:57 +0100 (CET)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=C9eeZNaE; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id hIex8qJqEKAO; Mon, 23 Dec 2019 15:30:57 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 47hMGT2gPfz9txjv;
        Mon, 23 Dec 2019 15:30:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1577111457; bh=pvdta7Gn2k+DdQszh3qC/bVMHcqn/+lDf822F1fVxgo=;
        h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
        b=C9eeZNaEwLksCAOPtOK2YA91yeobYcANmXFdPWJd7jgXKvdlEJgzrOAuz098CPWj/
         g5ke7y9h+SpSrlT7P7BkHLDP/vtYx20JVclWX5F0r/PuQePAftK/FAkQoEKDytP8zJ
         NWaC994zfdlrVAWsO1lrJBHI8e8kmzW5QmJ9MQEI=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 791168B7AB;
        Mon, 23 Dec 2019 15:31:02 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id 2XlQ65p-nunC; Mon, 23 Dec 2019 15:31:02 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr [172.25.230.100])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 3A9B08B7A1;
        Mon, 23 Dec 2019 15:31:02 +0100 (CET)
Received: by po16098vm.idsi0.si.c-s.fr (Postfix, from userid 0)
        id 40C4A637D4; Mon, 23 Dec 2019 14:31:02 +0000 (UTC)
Message-Id: <47701b5fb73cf536db074031db8e6e3fa3695168.1577111365.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1577111363.git.christophe.leroy@c-s.fr>
References: <cover.1577111363.git.christophe.leroy@c-s.fr>
From:   Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v2 01/10] lib: vdso: ensure all arches have 32bit fallback
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>, arnd@arndb.de,
        tglx@linutronix.de, vincenzo.frascino@arm.com, luto@kernel.org
Cc:     linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        x86@kernel.org
Date:   Mon, 23 Dec 2019 14:31:02 +0000 (UTC)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In order to simplify next step which moves fallback call at arch
level, ensure all arches have a 32bit fallback instead of handling
the lack of 32bit fallback in the common code based
on VDSO_HAS_32BIT_FALLBACK

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/arm/include/asm/vdso/gettimeofday.h          | 26 +++++++++++++++++++++
 arch/arm64/include/asm/vdso/compat_gettimeofday.h |  2 --
 arch/arm64/include/asm/vdso/gettimeofday.h        | 26 +++++++++++++++++++++
 arch/mips/include/asm/vdso/gettimeofday.h         | 28 +++++++++++++++++++++--
 arch/x86/include/asm/vdso/gettimeofday.h          | 28 +++++++++++++++++++++--
 lib/vdso/gettimeofday.c                           | 10 --------
 6 files changed, 104 insertions(+), 16 deletions(-)

diff --git a/arch/arm/include/asm/vdso/gettimeofday.h b/arch/arm/include/asm/vdso/gettimeofday.h
index 0ad2429c324f..55f8ad6e7777 100644
--- a/arch/arm/include/asm/vdso/gettimeofday.h
+++ b/arch/arm/include/asm/vdso/gettimeofday.h
@@ -70,6 +70,32 @@ static __always_inline int clock_getres_fallback(
 	return ret;
 }
 
+static __always_inline
+long clock_gettime32_fallback(clockid_t _clkid, struct old_timespec32 *_ts)
+{
+	struct __kernel_timespec ts;
+	int ret = clock_gettime_fallback(clock, &ts);
+
+	if (likely(!ret)) {
+		_ts->tv_sec = ts.tv_sec;
+		_ts->tv_nsec = ts.tv_nsec;
+	}
+	return ret;
+}
+
+static __always_inline
+long clock_getres32_fallback(clockid_t _clkid, struct old_timespec32 *_ts)
+{
+	struct __kernel_timespec ts;
+	int ret = clock_getres_fallback(clock, &ts);
+
+	if (likely(!ret && _ts)) {
+		_ts->tv_sec = ts.tv_sec;
+		_ts->tv_nsec = ts.tv_nsec;
+	}
+	return ret;
+}
+
 static __always_inline u64 __arch_get_hw_counter(int clock_mode)
 {
 #ifdef CONFIG_ARM_ARCH_TIMER
diff --git a/arch/arm64/include/asm/vdso/compat_gettimeofday.h b/arch/arm64/include/asm/vdso/compat_gettimeofday.h
index c50ee1b7d5cd..bab700e37a03 100644
--- a/arch/arm64/include/asm/vdso/compat_gettimeofday.h
+++ b/arch/arm64/include/asm/vdso/compat_gettimeofday.h
@@ -16,8 +16,6 @@
 
 #define VDSO_HAS_CLOCK_GETRES		1
 
-#define VDSO_HAS_32BIT_FALLBACK		1
-
 static __always_inline
 int gettimeofday_fallback(struct __kernel_old_timeval *_tv,
 			  struct timezone *_tz)
diff --git a/arch/arm64/include/asm/vdso/gettimeofday.h b/arch/arm64/include/asm/vdso/gettimeofday.h
index b08f476b72b4..c41c86a07423 100644
--- a/arch/arm64/include/asm/vdso/gettimeofday.h
+++ b/arch/arm64/include/asm/vdso/gettimeofday.h
@@ -66,6 +66,32 @@ int clock_getres_fallback(clockid_t _clkid, struct __kernel_timespec *_ts)
 	return ret;
 }
 
+static __always_inline
+long clock_gettime32_fallback(clockid_t _clkid, struct old_timespec32 *_ts)
+{
+	struct __kernel_timespec ts;
+	int ret = clock_gettime_fallback(clock, &ts);
+
+	if (likely(!ret)) {
+		_ts->tv_sec = ts.tv_sec;
+		_ts->tv_nsec = ts.tv_nsec;
+	}
+	return ret;
+}
+
+static __always_inline
+long clock_getres32_fallback(clockid_t _clkid, struct old_timespec32 *_ts)
+{
+	struct __kernel_timespec ts;
+	int ret = clock_getres_fallback(clock, &ts);
+
+	if (likely(!ret && _ts)) {
+		_ts->tv_sec = ts.tv_sec;
+		_ts->tv_nsec = ts.tv_nsec;
+	}
+	return ret;
+}
+
 static __always_inline u64 __arch_get_hw_counter(s32 clock_mode)
 {
 	u64 res;
diff --git a/arch/mips/include/asm/vdso/gettimeofday.h b/arch/mips/include/asm/vdso/gettimeofday.h
index b08825531e9f..60608e930a5c 100644
--- a/arch/mips/include/asm/vdso/gettimeofday.h
+++ b/arch/mips/include/asm/vdso/gettimeofday.h
@@ -109,8 +109,6 @@ static __always_inline int clock_getres_fallback(
 
 #if _MIPS_SIM != _MIPS_SIM_ABI64
 
-#define VDSO_HAS_32BIT_FALLBACK	1
-
 static __always_inline long clock_gettime32_fallback(
 					clockid_t _clkid,
 					struct old_timespec32 *_ts)
@@ -150,6 +148,32 @@ static __always_inline int clock_getres32_fallback(
 
 	return error ? -ret : ret;
 }
+#else
+static __always_inline
+long clock_gettime32_fallback(clockid_t _clkid, struct old_timespec32 *_ts)
+{
+	struct __kernel_timespec ts;
+	int ret = clock_gettime_fallback(clock, &ts);
+
+	if (likely(!ret)) {
+		_ts->tv_sec = ts.tv_sec;
+		_ts->tv_nsec = ts.tv_nsec;
+	}
+	return ret;
+}
+
+static __always_inline
+long clock_getres32_fallback(clockid_t _clkid, struct old_timespec32 *_ts)
+{
+	struct __kernel_timespec ts;
+	int ret = clock_getres_fallback(clock, &ts);
+
+	if (likely(!ret && _ts)) {
+		_ts->tv_sec = ts.tv_sec;
+		_ts->tv_nsec = ts.tv_nsec;
+	}
+	return ret;
+}
 #endif
 
 #ifdef CONFIG_CSRC_R4K
diff --git a/arch/x86/include/asm/vdso/gettimeofday.h b/arch/x86/include/asm/vdso/gettimeofday.h
index e9ee139cf29e..e1e16c2fdba0 100644
--- a/arch/x86/include/asm/vdso/gettimeofday.h
+++ b/arch/x86/include/asm/vdso/gettimeofday.h
@@ -94,9 +94,33 @@ long clock_getres_fallback(clockid_t _clkid, struct __kernel_timespec *_ts)
 	return ret;
 }
 
-#else
+static __always_inline
+long clock_gettime32_fallback(clockid_t _clkid, struct old_timespec32 *_ts)
+{
+	struct __kernel_timespec ts;
+	int ret = clock_gettime_fallback(clock, &ts);
 
-#define VDSO_HAS_32BIT_FALLBACK	1
+	if (likely(!ret)) {
+		_ts->tv_sec = ts.tv_sec;
+		_ts->tv_nsec = ts.tv_nsec;
+	}
+	return ret;
+}
+
+static __always_inline
+long clock_getres32_fallback(clockid_t _clkid, struct old_timespec32 *_ts)
+{
+	struct __kernel_timespec ts;
+	int ret = clock_getres_fallback(clock, &ts);
+
+	if (likely(!ret && _ts)) {
+		_ts->tv_sec = ts.tv_sec;
+		_ts->tv_nsec = ts.tv_nsec;
+	}
+	return ret;
+}
+
+#else
 
 static __always_inline
 long clock_gettime_fallback(clockid_t _clkid, struct __kernel_timespec *_ts)
diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 9ecfd3b547ba..59189ed49352 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -125,13 +125,8 @@ __cvdso_clock_gettime32(clockid_t clock, struct old_timespec32 *res)
 
 	ret = __cvdso_clock_gettime_common(clock, &ts);
 
-#ifdef VDSO_HAS_32BIT_FALLBACK
 	if (unlikely(ret))
 		return clock_gettime32_fallback(clock, res);
-#else
-	if (unlikely(ret))
-		ret = clock_gettime_fallback(clock, &ts);
-#endif
 
 	if (likely(!ret)) {
 		res->tv_sec = ts.tv_sec;
@@ -238,13 +233,8 @@ __cvdso_clock_getres_time32(clockid_t clock, struct old_timespec32 *res)
 
 	ret = __cvdso_clock_getres_common(clock, &ts);
 
-#ifdef VDSO_HAS_32BIT_FALLBACK
 	if (unlikely(ret))
 		return clock_getres32_fallback(clock, res);
-#else
-	if (unlikely(ret))
-		ret = clock_getres_fallback(clock, &ts);
-#endif
 
 	if (likely(!ret && res)) {
 		res->tv_sec = ts.tv_sec;
-- 
2.13.3

