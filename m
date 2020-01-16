Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1BE413ECDF
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2020 18:59:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394620AbgAPR6b (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jan 2020 12:58:31 -0500
Received: from pegase1.c-s.fr ([93.17.236.30]:12220 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394598AbgAPR63 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Jan 2020 12:58:29 -0500
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 47zBkp72vRz9v0MY;
        Thu, 16 Jan 2020 18:58:26 +0100 (CET)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=jazQCFCK; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id sWc84WilRORj; Thu, 16 Jan 2020 18:58:26 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 47zBkp5myMz9v0MW;
        Thu, 16 Jan 2020 18:58:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1579197506; bh=B22u4TdOal01xxsjkrua7iGmnqsKQfjsari1Wci2wQA=;
        h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
        b=jazQCFCKPDea5lYh2KgxAvOfg212DshtdG+JTeONviEiCNy0Rb1UeHG2HitQrkZta
         dph9+c7i0zIG8Jmr7NFpb7OgHOnMdwyB7SSii7h7rc1yCgtyKb8alaGGzLoYDhGQpU
         FC96U2rCRgY7UBaJdLOtZ1YGEFTk/Ou6UTLHKcpQ=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 5395C8B82D;
        Thu, 16 Jan 2020 18:58:28 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id l9JgyIsIeLnb; Thu, 16 Jan 2020 18:58:28 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 93F048B82E;
        Thu, 16 Jan 2020 18:58:27 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
        id 6D22D64A35; Thu, 16 Jan 2020 17:58:27 +0000 (UTC)
Message-Id: <7ac2f0d21652f95e2bbdfa6bd514ae6c7caf53ab.1579196675.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1579196675.git.christophe.leroy@c-s.fr>
References: <cover.1579196675.git.christophe.leroy@c-s.fr>
From:   Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v4 03/11] lib: vdso: only read hrtimer_res when needed in
 __cvdso_clock_getres()
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>, nathanl@linux.ibm.com,
        arnd@arndb.de, tglx@linutronix.de, vincenzo.frascino@arm.com,
        luto@kernel.org
Cc:     linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        x86@kernel.org
Date:   Thu, 16 Jan 2020 17:58:27 +0000 (UTC)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Only perform READ_ONCE(vd[CS_HRES_COARSE].hrtimer_res) for
HRES and RAW clocks.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 lib/vdso/gettimeofday.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 9563be3cb5fa..8b3084d9a3ec 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -326,7 +326,6 @@ static __maybe_unused
 int __cvdso_clock_getres_common(clockid_t clock, struct __kernel_timespec *res)
 {
 	const struct vdso_data *vd = __arch_get_vdso_data();
-	u64 hrtimer_res;
 	u32 msk;
 	u64 ns;
 
@@ -338,7 +337,6 @@ int __cvdso_clock_getres_common(clockid_t clock, struct __kernel_timespec *res)
 	    vd->clock_mode == VDSO_CLOCKMODE_TIMENS)
 		vd = __arch_get_timens_vdso_data();
 
-	hrtimer_res = READ_ONCE(vd[CS_HRES_COARSE].hrtimer_res);
 	/*
 	 * Convert the clockid to a bitmask and use it to check which
 	 * clocks are handled in the VDSO directly.
@@ -348,7 +346,7 @@ int __cvdso_clock_getres_common(clockid_t clock, struct __kernel_timespec *res)
 		/*
 		 * Preserves the behaviour of posix_get_hrtimer_res().
 		 */
-		ns = hrtimer_res;
+		ns = READ_ONCE(vd[CS_HRES_COARSE].hrtimer_res);
 	} else if (msk & VDSO_COARSE) {
 		/*
 		 * Preserves the behaviour of posix_get_coarse_res().
-- 
2.13.3

