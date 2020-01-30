Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BF0014DE6A
	for <lists+linux-mips@lfdr.de>; Thu, 30 Jan 2020 17:08:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727368AbgA3QIk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Jan 2020 11:08:40 -0500
Received: from pegase1.c-s.fr ([93.17.236.30]:4782 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727348AbgA3QIk (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 30 Jan 2020 11:08:40 -0500
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 487ldd2zQzz9v6KQ;
        Thu, 30 Jan 2020 17:08:37 +0100 (CET)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=X9LhxdZE; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id XQHp63Tpvetz; Thu, 30 Jan 2020 17:08:37 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 487ldd1fxlz9v6KL;
        Thu, 30 Jan 2020 17:08:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1580400517; bh=opdc97PQgpxv6WQptdNj4QCI44pmYV4DmS9A7ZMKMhQ=;
        h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
        b=X9LhxdZERdpj1RBH8cqlpbU6LLGFypCEgKkf8NcHPPpy3gWter1LkiyWIlC6uktg6
         kzf/3qWUxytjj5VRX1tRXLg5+Z5BtjWDg3U6VgiPHUlvsfk0pt0sYCjp1Uri9fEIoW
         V+Q6tiVn2QT+7A17JjIukPkJRO0tRsoFs8M72X+I=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id BD1698B87B;
        Thu, 30 Jan 2020 17:08:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id a3HgqEy-UMm0; Thu, 30 Jan 2020 17:08:38 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 815438B877;
        Thu, 30 Jan 2020 17:08:38 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
        id 4DDC065283; Thu, 30 Jan 2020 16:08:38 +0000 (UTC)
Message-Id: <47500ae9aa628aead4c5b5a71d5279268cdddb48.1580399657.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1580399657.git.christophe.leroy@c-s.fr>
References: <cover.1580399657.git.christophe.leroy@c-s.fr>
From:   Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v5 4/6] lib/vdso: Allow fixed clock mode
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>, nathanl@linux.ibm.com,
        arnd@arndb.de, tglx@linutronix.de, vincenzo.frascino@arm.com,
        luto@kernel.org
Cc:     linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        x86@kernel.org
Date:   Thu, 30 Jan 2020 16:08:38 +0000 (UTC)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Some architectures have a fixed clocksource which is known at compile
time and cannot be replaced or disabled at runtime, e.g. timebase on
PowerPC. For such cases the clock mode check in the VDSO code is
pointless.

Therefore, give architectures the opportunity to redefine the way
clock_mode is checked by moving the check into an
__arch_vdso_capable() macro.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 lib/vdso/gettimeofday.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 72d65dd50cb4..0b4b71880f22 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -120,12 +120,18 @@ static __always_inline int do_hres(const struct vdso_data *vd, clockid_t clk,
 			cpu_relax();
 		}
 		smp_rmb();
+#ifdef __arch_vdso_capable
+		if (unlikely(!__arch_vdso_capable(vd->clock_mode)))
+			return -1;
+#endif
 
 		cycles = __arch_get_hw_counter(vd->clock_mode);
 		ns = vdso_ts->nsec;
 		last = vd->cycle_last;
+#ifndef __arch_vdso_capable
 		if (unlikely((s64)cycles < 0))
 			return -1;
+#endif
 
 		ns += vdso_calc_delta(cycles, last, vd->mask, vd->mult);
 		ns >>= vd->shift;
-- 
2.25.0

