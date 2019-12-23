Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F0AD129771
	for <lists+linux-mips@lfdr.de>; Mon, 23 Dec 2019 15:31:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726994AbfLWObH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Dec 2019 09:31:07 -0500
Received: from pegase1.c-s.fr ([93.17.236.30]:38665 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726943AbfLWObG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 23 Dec 2019 09:31:06 -0500
Received: from localhost (mailhub1-ext [192.168.12.233])
        by localhost (Postfix) with ESMTP id 47hMGW3VmLz9txhj;
        Mon, 23 Dec 2019 15:30:59 +0100 (CET)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=Qj9FKBHM; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id LIL9pRTQWaO2; Mon, 23 Dec 2019 15:30:59 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 47hMGW2Hnkz9txhg;
        Mon, 23 Dec 2019 15:30:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1577111459; bh=o7emI0agsMOH48CbNwosCV8op5LYe8FM1Ks4MgVPYns=;
        h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
        b=Qj9FKBHMuY0RRfNbOXsqQ8E+KL1fR3ZgxUrpNf3HarY3lPxPrTAfqokClU23/DkIj
         U5B85uRpLkPs/m0bEq1zPcTwgymtrDiClZV+z532uMrnb7SHTgTKxeG1X83M5w47Aw
         IJvQYAXDAzMKevrTvvGquV1w/aN9xnyKpSIRUU7Q=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 6BB178B7AB;
        Mon, 23 Dec 2019 15:31:04 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id cwh0CNl0fPeX; Mon, 23 Dec 2019 15:31:04 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr [172.25.230.100])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 441C48B7A1;
        Mon, 23 Dec 2019 15:31:04 +0100 (CET)
Received: by po16098vm.idsi0.si.c-s.fr (Postfix, from userid 0)
        id 4E61A637D4; Mon, 23 Dec 2019 14:31:04 +0000 (UTC)
Message-Id: <481907f7211425380ba1637a978c8a12143d2705.1577111366.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1577111363.git.christophe.leroy@c-s.fr>
References: <cover.1577111363.git.christophe.leroy@c-s.fr>
From:   Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v2 03/10] lib: vdso: Change
 __cvdso_clock_gettime/getres_common() to __cvdso_clock_gettime/getres()
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>, arnd@arndb.de,
        tglx@linutronix.de, vincenzo.frascino@arm.com, luto@kernel.org
Cc:     linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        x86@kernel.org
Date:   Mon, 23 Dec 2019 14:31:04 +0000 (UTC)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

__cvdso_clock_getres() just calls __cvdso_clock_getres_common().
__cvdso_clock_gettime() just calls __cvdso_clock_getres_common().

Drop __cvdso_clock_getres() and __cvdso_clock_gettime()
Rename __cvdso_clock_gettime_common() into __cvdso_clock_gettime()
Rename __cvdso_clock_getres_common() into __cvdso_clock_getres()

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 lib/vdso/gettimeofday.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 4618e274f1d5..c6eeeb47f446 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -79,7 +79,7 @@ static void do_coarse(const struct vdso_data *vd, clockid_t clk,
 }
 
 static __maybe_unused int
-__cvdso_clock_gettime_common(clockid_t clock, struct __kernel_timespec *ts)
+__cvdso_clock_gettime(clockid_t clock, struct __kernel_timespec *ts)
 {
 	const struct vdso_data *vd = __arch_get_vdso_data();
 	u32 msk;
@@ -105,16 +105,10 @@ __cvdso_clock_gettime_common(clockid_t clock, struct __kernel_timespec *ts)
 }
 
 static __maybe_unused int
-__cvdso_clock_gettime(clockid_t clock, struct __kernel_timespec *ts)
-{
-	return __cvdso_clock_gettime_common(clock, ts);
-}
-
-static __maybe_unused int
 __cvdso_clock_gettime32(clockid_t clock, struct old_timespec32 *res)
 {
 	struct __kernel_timespec ts;
-	int ret = __cvdso_clock_gettime_common(clock, &ts);
+	int ret = __cvdso_clock_gettime(clock, &ts);
 
 	if (likely(!ret)) {
 		res->tv_sec = ts.tv_sec;
@@ -161,7 +155,7 @@ static __maybe_unused __kernel_old_time_t __cvdso_time(__kernel_old_time_t *time
 
 #ifdef VDSO_HAS_CLOCK_GETRES
 static __maybe_unused
-int __cvdso_clock_getres_common(clockid_t clock, struct __kernel_timespec *res)
+int __cvdso_clock_getres(clockid_t clock, struct __kernel_timespec *res)
 {
 	const struct vdso_data *vd = __arch_get_vdso_data();
 	u64 hrtimer_res;
@@ -204,16 +198,11 @@ int __cvdso_clock_getres_common(clockid_t clock, struct __kernel_timespec *res)
 	return 0;
 }
 
-int __cvdso_clock_getres(clockid_t clock, struct __kernel_timespec *res)
-{
-	return __cvdso_clock_getres_common(clock, res);
-}
-
 static __maybe_unused int
 __cvdso_clock_getres_time32(clockid_t clock, struct old_timespec32 *res)
 {
 	struct __kernel_timespec ts;
-	int ret = __cvdso_clock_getres_common(clock, &ts);
+	int ret = __cvdso_clock_getres(clock, &ts);
 
 	if (likely(!ret && res)) {
 		res->tv_sec = ts.tv_sec;
-- 
2.13.3

