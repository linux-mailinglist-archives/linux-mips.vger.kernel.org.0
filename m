Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17786139717
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2020 18:09:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728801AbgAMRJV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Jan 2020 12:09:21 -0500
Received: from pegase1.c-s.fr ([93.17.236.30]:19156 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728795AbgAMRIr (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 13 Jan 2020 12:08:47 -0500
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 47xKmm0TxYz9txyy;
        Mon, 13 Jan 2020 18:08:40 +0100 (CET)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=HkoD9yf+; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id AhN4_motg1-N; Mon, 13 Jan 2020 18:08:40 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 47xKml6VQMz9txyq;
        Mon, 13 Jan 2020 18:08:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1578935319; bh=cvbU2rxV7d1q9wYdCmwBCFoJiVS7xULkB1KeM2H3ETE=;
        h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
        b=HkoD9yf+S0JdjhQBX9GLB+qrGSymRCPhEkMAxEXjLEOdNAvKhhDlUPDxpHh2HNFdW
         CzpaCaMCDNxStXTyqbU29ulrMrxuqmxqG9L9O5BEemjhOeEc4b7csNcBH3AfmVw6h4
         iLOxo05eaysCpZu+S4hyZQS04XqsjNjJCjw0g14w=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 353978B7C9;
        Mon, 13 Jan 2020 18:08:45 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id MStqpQe-bhfD; Mon, 13 Jan 2020 18:08:45 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id E7BFB8B7BE;
        Mon, 13 Jan 2020 18:08:44 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
        id BDD3E64A1D; Mon, 13 Jan 2020 17:08:44 +0000 (UTC)
Message-Id: <5b38617a2ca4f719760aafbdb6115eaad28c0640.1578934751.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1578934751.git.christophe.leroy@c-s.fr>
References: <cover.1578934751.git.christophe.leroy@c-s.fr>
From:   Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v3 06/12] lib: vdso: __iter_div_u64_rem() is suboptimal
 for 32 bit time
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>, arnd@arndb.de,
        tglx@linutronix.de, vincenzo.frascino@arm.com, luto@kernel.org
Cc:     linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        x86@kernel.org
Date:   Mon, 13 Jan 2020 17:08:44 +0000 (UTC)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Using __iter_div_ulong_rem() is suboptimal on 32 bits.
Nanoseconds are only 32 bits, and VDSO data is updated every 10ms
so nsec will never overflow 32 bits.

Add an equivalent of __iter_div_u64_rem() but based
on unsigned long to better fit with 32 bits arches.

Before:
gettimeofday:    vdso: 1078 nsec/call
clock-gettime-monotonic-raw:    vdso: 1317 nsec/call
clock-gettime-monotonic:    vdso: 1255 nsec/call

After:
gettimeofday:    vdso: 1032 nsec/call
clock-gettime-monotonic-raw:    vdso: 1312 nsec/call
clock-gettime-monotonic:    vdso: 1243 nsec/call
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 lib/vdso/gettimeofday.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index decd3f2b37af..da15a8842825 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -38,12 +38,32 @@ u64 vdso_calc_delta(u64 cycles, u64 last, u64 mask, u32 mult)
 }
 #endif
 
+static __always_inline u32
+__iter_div_ulong_rem(unsigned long dividend, u32 divisor, unsigned long *remainder)
+{
+	u32 ret = 0;
+
+	while (dividend >= divisor) {
+		/* The following asm() prevents the compiler from
+		   optimising this loop into a modulo operation.  */
+		asm("" : "+rm"(dividend));
+
+		dividend -= divisor;
+		ret++;
+	}
+
+	*remainder = dividend;
+
+	return ret;
+}
+
 static __always_inline int do_hres(const struct vdso_data *vd, clockid_t clk,
 				   struct __kernel_timespec *ts)
 {
 	const struct vdso_timestamp *vdso_ts = &vd->basetime[clk];
 	u64 cycles, last, sec, ns;
 	u32 seq;
+	unsigned long nsec;
 
 	do {
 		seq = vdso_read_begin(vd);
@@ -54,7 +74,7 @@ static __always_inline int do_hres(const struct vdso_data *vd, clockid_t clk,
 			return -1;
 
 		ns += vdso_calc_delta(cycles, last, vd->mask, vd->mult);
-		ns >>= vd->shift;
+		nsec = ns >> vd->shift;
 		sec = vdso_ts->sec;
 	} while (unlikely(vdso_read_retry(vd, seq)));
 
@@ -62,8 +82,8 @@ static __always_inline int do_hres(const struct vdso_data *vd, clockid_t clk,
 	 * Do this outside the loop: a race inside the loop could result
 	 * in __iter_div_u64_rem() being extremely slow.
 	 */
-	ts->tv_sec = sec + __iter_div_u64_rem(ns, NSEC_PER_SEC, &ns);
-	ts->tv_nsec = ns;
+	ts->tv_sec = sec + __iter_div_ulong_rem(nsec, NSEC_PER_SEC, &nsec);
+	ts->tv_nsec = nsec;
 
 	return 0;
 }
-- 
2.13.3

