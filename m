Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50E01139701
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2020 18:08:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728797AbgAMRIp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Jan 2020 12:08:45 -0500
Received: from pegase1.c-s.fr ([93.17.236.30]:40965 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728774AbgAMRIp (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 13 Jan 2020 12:08:45 -0500
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 47xKmk07Phz9txyw;
        Mon, 13 Jan 2020 18:08:38 +0100 (CET)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=RhThshVb; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id hi6YDy-nSTFK; Mon, 13 Jan 2020 18:08:37 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 47xKmj68nxz9txyq;
        Mon, 13 Jan 2020 18:08:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1578935317; bh=aRVCODNqlpogffdcxAo9rl2jrXtK1fAZ2Yi8uLoDcQI=;
        h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
        b=RhThshVbUL4jv+5S+SxWZzpxtdMaaFBZAob5AEBGqwjBsuHm1Wx+s+wNNOGbyb8Q5
         4Te2ejtiGvX8509XCo5J8GSBHWfFu6v/aQQFmgOxj5BGbYNc8lQPKjaNoPy8gV3mwo
         FX0G38hQ5jQO+raWCdy2z6YMeXqRUvBTTTsbbSMk=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 309198B7C9;
        Mon, 13 Jan 2020 18:08:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id uDhYnHcG98bc; Mon, 13 Jan 2020 18:08:43 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id DDE338B7BE;
        Mon, 13 Jan 2020 18:08:42 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
        id AD1B964A1D; Mon, 13 Jan 2020 17:08:42 +0000 (UTC)
Message-Id: <25d3e027aeef5cdbe1b205ecfbf8d80270fc2bd9.1578934751.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1578934751.git.christophe.leroy@c-s.fr>
References: <cover.1578934751.git.christophe.leroy@c-s.fr>
From:   Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v3 04/12] lib: vdso: inline do_hres() and do_coarse()
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>, arnd@arndb.de,
        tglx@linutronix.de, vincenzo.frascino@arm.com, luto@kernel.org
Cc:     linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        x86@kernel.org
Date:   Mon, 13 Jan 2020 17:08:42 +0000 (UTC)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

do_hres() is called from several places, so GCC doesn't inline
it at first.

do_hres() takes a struct __kernel_timespec * parameter for
passing the result. In the 32 bits case, this parameter corresponds
to a local var in the caller. In order to provide a pointer
to this structure, the caller has to put it in its stack and
do_hres() has to write the result in the stack. This is suboptimal,
especially on RISC processor like powerpc.

By making GCC inline the function, the struct __kernel_timespec
remains a local var using registers, avoiding the need to write and
read stack.

The improvement is significant on powerpc:
Before:
gettimeofday:    vdso: 1379 nsec/call
clock-gettime-realtime-coarse:    vdso: 868 nsec/call
clock-gettime-realtime:    vdso: 1511 nsec/call
clock-gettime-monotonic-raw:    vdso: 1576 nsec/call

After:
gettimeofday:    vdso: 1078 nsec/call
clock-gettime-realtime-coarse:    vdso: 807 nsec/call
clock-gettime-realtime:    vdso: 1256 nsec/call
clock-gettime-monotonic-raw:    vdso: 1316 nsec/call

At the same time, change the return type of do_coarse() to int, this
increase readability of the if/elseif/elseif/else  section
in __cvdso_clock_gettime_common()

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 lib/vdso/gettimeofday.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 42bd8ab955fa..d75e44ba716f 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -38,8 +38,8 @@ u64 vdso_calc_delta(u64 cycles, u64 last, u64 mask, u32 mult)
 }
 #endif
 
-static int do_hres(const struct vdso_data *vd, clockid_t clk,
-		   struct __kernel_timespec *ts)
+static __always_inline int do_hres(const struct vdso_data *vd, clockid_t clk,
+				   struct __kernel_timespec *ts)
 {
 	const struct vdso_timestamp *vdso_ts = &vd->basetime[clk];
 	u64 cycles, last, sec, ns;
@@ -68,8 +68,8 @@ static int do_hres(const struct vdso_data *vd, clockid_t clk,
 	return 0;
 }
 
-static void do_coarse(const struct vdso_data *vd, clockid_t clk,
-		      struct __kernel_timespec *ts)
+static __always_inline int do_coarse(const struct vdso_data *vd, clockid_t clk,
+				     struct __kernel_timespec *ts)
 {
 	const struct vdso_timestamp *vdso_ts = &vd->basetime[clk];
 	u32 seq;
@@ -79,6 +79,8 @@ static void do_coarse(const struct vdso_data *vd, clockid_t clk,
 		ts->tv_sec = vdso_ts->sec;
 		ts->tv_nsec = vdso_ts->nsec;
 	} while (unlikely(vdso_read_retry(vd, seq)));
+
+	return 0;
 }
 
 static __maybe_unused int
@@ -96,15 +98,16 @@ __cvdso_clock_gettime_common(clockid_t clock, struct __kernel_timespec *ts)
 	 * clocks are handled in the VDSO directly.
 	 */
 	msk = 1U << clock;
-	if (likely(msk & VDSO_HRES)) {
-		return do_hres(&vd[CS_HRES_COARSE], clock, ts);
-	} else if (msk & VDSO_COARSE) {
-		do_coarse(&vd[CS_HRES_COARSE], clock, ts);
-		return 0;
-	} else if (msk & VDSO_RAW) {
-		return do_hres(&vd[CS_RAW], clock, ts);
-	}
-	return -1;
+	if (likely(msk & VDSO_HRES))
+		vd += CS_HRES_COARSE;
+	else if (msk & VDSO_COARSE)
+		return do_coarse(&vd[CS_HRES_COARSE], clock, ts);
+	else if (msk & VDSO_RAW)
+		vd += CS_RAW;
+	else
+		return -1;
+
+	return do_hres(vd, clock, ts);
 }
 
 static __maybe_unused int
-- 
2.13.3

