Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AA0614DE6E
	for <lists+linux-mips@lfdr.de>; Thu, 30 Jan 2020 17:08:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727328AbgA3QIm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Jan 2020 11:08:42 -0500
Received: from pegase1.c-s.fr ([93.17.236.30]:42999 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727374AbgA3QIm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 30 Jan 2020 11:08:42 -0500
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 487ldf4nKzz9v6KS;
        Thu, 30 Jan 2020 17:08:38 +0100 (CET)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=k1nV5HNo; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id zEchKtxoY4H7; Thu, 30 Jan 2020 17:08:38 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 487ldf3KlDz9v6KL;
        Thu, 30 Jan 2020 17:08:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1580400518; bh=4Kvsye4EMnIWruMrubU2uEdzOim6m1UTTTl/5OsNwDs=;
        h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
        b=k1nV5HNo6Z2IrIBX+SaaIKQiwfqmxiGqGobyiJMGtGs/qsVlUVN6uqGFGqCXCQBBX
         oYi0dvc9bnGnv2gGUmnZDs/rlVHOXIphaNA3L790NbL4gYT4lQFP/lWLd3BOJcHwdr
         Z34gMu3hoEcwW/wmPHOdvX3sxhvVNl4WXKQxEebM=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id DFEE78B87B;
        Thu, 30 Jan 2020 17:08:39 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id OdXw842o2kSJ; Thu, 30 Jan 2020 17:08:39 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 8723C8B877;
        Thu, 30 Jan 2020 17:08:39 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
        id 53A6765283; Thu, 30 Jan 2020 16:08:39 +0000 (UTC)
Message-Id: <b3d449de856982ed060a71e6ace8eeca4654e685.1580399657.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1580399657.git.christophe.leroy@c-s.fr>
References: <cover.1580399657.git.christophe.leroy@c-s.fr>
From:   Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v5 5/6] lib/vdso: Allow architectures to override the ns shift
 operation
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>, nathanl@linux.ibm.com,
        arnd@arndb.de, tglx@linutronix.de, vincenzo.frascino@arm.com,
        luto@kernel.org
Cc:     linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        x86@kernel.org
Date:   Thu, 30 Jan 2020 16:08:39 +0000 (UTC)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On powerpc/32, GCC (8.1) generates pretty bad code for the
ns >>= vd->shift operation taking into account that the
shift is always <= 32 and the upper part of the result is
likely to be nul. GCC makes reversed assumptions considering
the shift to be likely >= 32 and the upper part to be like not nul.

unsigned long long shift(unsigned long long x, unsigned char s)
{
	return x >> s;
}

results in:

00000018 <shift>:
  18:	35 25 ff e0 	addic.  r9,r5,-32
  1c:	41 80 00 10 	blt     2c <shift+0x14>
  20:	7c 64 4c 30 	srw     r4,r3,r9
  24:	38 60 00 00 	li      r3,0
  28:	4e 80 00 20 	blr
  2c:	54 69 08 3c 	rlwinm  r9,r3,1,0,30
  30:	21 45 00 1f 	subfic  r10,r5,31
  34:	7c 84 2c 30 	srw     r4,r4,r5
  38:	7d 29 50 30 	slw     r9,r9,r10
  3c:	7c 63 2c 30 	srw     r3,r3,r5
  40:	7d 24 23 78 	or      r4,r9,r4
  44:	4e 80 00 20 	blr

Even when forcing the shift with an &= 31, it still considers
the shift as likely >= 32.

Define a vdso_shift_ns() macro that can be overriden by
architectures.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 lib/vdso/gettimeofday.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 0b4b71880f22..a5ee53d1ecee 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -38,6 +38,13 @@ u64 vdso_calc_delta(u64 cycles, u64 last, u64 mask, u32 mult)
 }
 #endif
 
+#ifndef vdso_shift_ns
+static __always_inline u64 vdso_shift_ns(u64 ns, unsigned long shift)
+{
+	return ns >> shift;
+}
+#endif
+
 #ifdef CONFIG_TIME_NS
 static int do_hres_timens(const struct vdso_data *vdns, clockid_t clk,
 			  struct __kernel_timespec *ts)
@@ -134,7 +141,7 @@ static __always_inline int do_hres(const struct vdso_data *vd, clockid_t clk,
 #endif
 
 		ns += vdso_calc_delta(cycles, last, vd->mask, vd->mult);
-		ns >>= vd->shift;
+		ns = vdso_shift_ns(ns, vd->shift);
 		sec = vdso_ts->sec;
 	} while (unlikely(vdso_read_retry(vd, seq)));
 
-- 
2.25.0

