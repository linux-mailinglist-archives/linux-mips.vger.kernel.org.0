Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D0A5613ECD0
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2020 18:59:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394634AbgAPR6v (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jan 2020 12:58:51 -0500
Received: from pegase1.c-s.fr ([93.17.236.30]:35922 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394671AbgAPR6h (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Jan 2020 12:58:37 -0500
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 47zBkx5Pynz9v4gt;
        Thu, 16 Jan 2020 18:58:33 +0100 (CET)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=gxE//bpY; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id jfl2bkZ8t9tf; Thu, 16 Jan 2020 18:58:33 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 47zBkx3Rwbz9v4gc;
        Thu, 16 Jan 2020 18:58:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1579197513; bh=UFDJu66szbpL4Xw0xXz0xNV43kPco38dmpx+eBljPF4=;
        h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
        b=gxE//bpYKFxAWuGDDXDIa3xdSWFzMMRq4FuxjO1eMSFN2a05pq5qLbwB0TN6BrWmJ
         ZnzwYy+g3jHvmO2BCygYehv9TiPmItAeN3sPUHsDnH/0B45RoA8w+Zipz7TfG4jVK+
         1LBc5voMUebWSGExFornSGTfsSHNAHbcf+37K/PM=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 206E98B82A;
        Thu, 16 Jan 2020 18:58:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id X73jTLr1bjTq; Thu, 16 Jan 2020 18:58:35 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id C8E018B82D;
        Thu, 16 Jan 2020 18:58:34 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
        id 9F40364A33; Thu, 16 Jan 2020 17:58:34 +0000 (UTC)
Message-Id: <c8ce9baaef0dc7273e4bcc31f353b17b655113d1.1579196675.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1579196675.git.christophe.leroy@c-s.fr>
References: <cover.1579196675.git.christophe.leroy@c-s.fr>
From:   Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v4 10/11] lib: vdso: Allow arches to override the ns shift
 operation
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>, nathanl@linux.ibm.com,
        arnd@arndb.de, tglx@linutronix.de, vincenzo.frascino@arm.com,
        luto@kernel.org
Cc:     linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        x86@kernel.org
Date:   Thu, 16 Jan 2020 17:58:34 +0000 (UTC)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On powerpc/32, GCC (8.1) generates pretty bad code for the
ns >>= vd->shift operation taking into account that the
shift is always < 32 and the upper part of the result is
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
arches.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 lib/vdso/gettimeofday.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 724b45c3e8ac..9ba92058cfd7 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -39,6 +39,13 @@ u64 vdso_calc_delta(u64 cycles, u64 last, u64 mask, u32 mult)
 }
 #endif
 
+#ifndef vdso_shift_ns
+static __always_inline u64 vdso_shift_ns(u64 ns, unsigned long shift)
+{
+	return ns >> shift;
+}
+#endif
+
 #ifndef __arch_vdso_hres_capable
 static inline bool __arch_vdso_hres_capable(void)
 {
@@ -148,7 +155,7 @@ static __always_inline int do_hres(const struct vdso_data *vd, clockid_t clk,
 		ns = vdso_ts->nsec;
 		last = vd->cycle_last;
 		ns += vdso_calc_delta(cycles, last, vd->mask, vd->mult);
-		ns >>= vd->shift;
+		ns = vdso_shift_ns(ns, vd->shift);
 		sec = vdso_ts->sec;
 	} while (unlikely(vdso_read_retry(vd, seq)));
 
-- 
2.13.3

