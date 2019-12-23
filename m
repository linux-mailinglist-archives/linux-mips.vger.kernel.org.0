Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49B1712976D
	for <lists+linux-mips@lfdr.de>; Mon, 23 Dec 2019 15:31:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727109AbfLWObf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Dec 2019 09:31:35 -0500
Received: from pegase1.c-s.fr ([93.17.236.30]:20713 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727050AbfLWObK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 23 Dec 2019 09:31:10 -0500
Received: from localhost (mailhub1-ext [192.168.12.233])
        by localhost (Postfix) with ESMTP id 47hMGc4X9kz9txk0;
        Mon, 23 Dec 2019 15:31:04 +0100 (CET)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=bC4sfPet; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id pExXBshqEC32; Mon, 23 Dec 2019 15:31:04 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 47hMGc3Ssxz9txjx;
        Mon, 23 Dec 2019 15:31:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1577111464; bh=JG69RWeha6scpE4l/gVcRXcizrOVP3foZOy4iqNP618=;
        h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
        b=bC4sfPetFvQitz/cwbqgoP0D7XeTFqeBALfhCtuKUQ5tMvQT7pHJQS1+b0l9JrPcz
         eexkkMeeDT2T/XBLr2WnAlkrSdW2CUB8+pi/JPWE4HSu5wiK5QvoZWzR/uDslt9/8p
         wZELsHr6VHtkcMUSktuN1Njvgb6csIiPiSV/VV5s=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 932568B7AB;
        Mon, 23 Dec 2019 15:31:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id ZDsnIZyOiV_3; Mon, 23 Dec 2019 15:31:09 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr [172.25.230.100])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 6EFD88B7A1;
        Mon, 23 Dec 2019 15:31:09 +0100 (CET)
Received: by po16098vm.idsi0.si.c-s.fr (Postfix, from userid 0)
        id 79148637D4; Mon, 23 Dec 2019 14:31:09 +0000 (UTC)
Message-Id: <fdf1a968a8f7edd61456f1689ac44082ebb19c15.1577111367.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1577111363.git.christophe.leroy@c-s.fr>
References: <cover.1577111363.git.christophe.leroy@c-s.fr>
From:   Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v2 08/10] lib: vdso: Avoid duplication in
 __cvdso_clock_getres()
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>, arnd@arndb.de,
        tglx@linutronix.de, vincenzo.frascino@arm.com, luto@kernel.org
Cc:     linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        x86@kernel.org
Date:   Mon, 23 Dec 2019 14:31:09 +0000 (UTC)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

VDSO_HRES and VDSO_RAW clocks are handled the same way.

Don't duplicate code.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 lib/vdso/gettimeofday.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 5a17a9d2e6cd..aa4a167bf1e0 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -172,7 +172,7 @@ int __cvdso_clock_getres(const struct vdso_data *vd, clockid_t clock,
 	 * clocks are handled in the VDSO directly.
 	 */
 	msk = 1U << clock;
-	if (msk & VDSO_HRES) {
+	if (msk & (VDSO_HRES | VDSO_RAW)) {
 		/*
 		 * Preserves the behaviour of posix_get_hrtimer_res().
 		 */
@@ -182,11 +182,6 @@ int __cvdso_clock_getres(const struct vdso_data *vd, clockid_t clock,
 		 * Preserves the behaviour of posix_get_coarse_res().
 		 */
 		ns = LOW_RES_NSEC;
-	} else if (msk & VDSO_RAW) {
-		/*
-		 * Preserves the behaviour of posix_get_hrtimer_res().
-		 */
-		ns = hrtimer_res;
 	} else {
 		return -1;
 	}
-- 
2.13.3

