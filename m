Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAD6512976A
	for <lists+linux-mips@lfdr.de>; Mon, 23 Dec 2019 15:31:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbfLWObf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Dec 2019 09:31:35 -0500
Received: from pegase1.c-s.fr ([93.17.236.30]:18097 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726943AbfLWObK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 23 Dec 2019 09:31:10 -0500
Received: from localhost (mailhub1-ext [192.168.12.233])
        by localhost (Postfix) with ESMTP id 47hMGb4QXVz9txjy;
        Mon, 23 Dec 2019 15:31:03 +0100 (CET)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=HzWceXyE; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id bkTv1TgFVniR; Mon, 23 Dec 2019 15:31:03 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 47hMGb3Gynz9txjx;
        Mon, 23 Dec 2019 15:31:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1577111463; bh=N2ZgUlBGtsvYJmL4aNIvn4kelyr3xUIlcSwbXOh8dAY=;
        h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
        b=HzWceXyEVD1Emm0wwEOE1bCdfm4qtJn+RLfuJ+8Hl/RwcdV35a4DNiyknWPUyNLZq
         wVAMMpO7O4TDPh8O30kOtwmkeCpiX9AOkoMz5d8KvvzSAP/UyJu/lPQ2RvdFwZHmwj
         97Amm7bJkkQbo4p6/X7Ca0N8qAiBNpv9MLgC0LWY=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 8E2F98B7AB;
        Mon, 23 Dec 2019 15:31:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id LhG5tUkjJ7iO; Mon, 23 Dec 2019 15:31:08 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr [172.25.230.100])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 67BCF8B7A1;
        Mon, 23 Dec 2019 15:31:08 +0100 (CET)
Received: by po16098vm.idsi0.si.c-s.fr (Postfix, from userid 0)
        id 71E13637D4; Mon, 23 Dec 2019 14:31:08 +0000 (UTC)
Message-Id: <fc1ff722c7cbe63a63ae02ade3a714d2049d54a5.1577111367.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1577111363.git.christophe.leroy@c-s.fr>
References: <cover.1577111363.git.christophe.leroy@c-s.fr>
From:   Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v2 07/10] lib: vdso: don't use READ_ONCE() in
 __c_kernel_time()
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>, arnd@arndb.de,
        tglx@linutronix.de, vincenzo.frascino@arm.com, luto@kernel.org
Cc:     linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        x86@kernel.org
Date:   Mon, 23 Dec 2019 14:31:08 +0000 (UTC)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

READ_ONCE() forces the read of the 64 bit value of
vd[CS_HRES_COARSE].basetime[CLOCK_REALTIME].sec allthough
only the lower part is needed.

This results in a suboptimal code:

00000af4 <__c_kernel_time>:
 af4:	2c 03 00 00 	cmpwi   r3,0
 af8:	81 44 00 20 	lwz     r10,32(r4)
 afc:	81 64 00 24 	lwz     r11,36(r4)
 b00:	41 82 00 08 	beq     b08 <__c_kernel_time+0x14>
 b04:	91 63 00 00 	stw     r11,0(r3)
 b08:	7d 63 5b 78 	mr      r3,r11
 b0c:	4e 80 00 20 	blr

By removing the READ_ONCE(), only the lower part is read from
memory, and the code is cleaner:

00000af4 <__c_kernel_time>:
 af4:	7c 69 1b 79 	mr.     r9,r3
 af8:	80 64 00 24 	lwz     r3,36(r4)
 afc:	4d 82 00 20 	beqlr
 b00:	90 69 00 00 	stw     r3,0(r9)
 b04:	4e 80 00 20 	blr

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 lib/vdso/gettimeofday.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 17b4cff6e5f0..5a17a9d2e6cd 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -144,7 +144,7 @@ __cvdso_gettimeofday(const struct vdso_data *vd, struct __kernel_old_timeval *tv
 static __maybe_unused __kernel_old_time_t
 __cvdso_time(const struct vdso_data *vd, __kernel_old_time_t *time)
 {
-	__kernel_old_time_t t = READ_ONCE(vd[CS_HRES_COARSE].basetime[CLOCK_REALTIME].sec);
+	__kernel_old_time_t t = vd[CS_HRES_COARSE].basetime[CLOCK_REALTIME].sec;
 
 	if (time)
 		*time = t;
-- 
2.13.3

