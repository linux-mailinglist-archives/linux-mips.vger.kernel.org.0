Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA41D13ECC8
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2020 18:58:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394143AbgAPR6f (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jan 2020 12:58:35 -0500
Received: from pegase1.c-s.fr ([93.17.236.30]:56142 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394666AbgAPR6f (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Jan 2020 12:58:35 -0500
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 47zBkw4Y6lz9v4gn;
        Thu, 16 Jan 2020 18:58:32 +0100 (CET)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=UQil0z6K; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id mhPOBAGVB8j6; Thu, 16 Jan 2020 18:58:32 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 47zBkw3RdHz9v4gc;
        Thu, 16 Jan 2020 18:58:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1579197512; bh=dI2VkNAhHWcekKp95TXfWTj0joevEjoDA4cLyXKcRJs=;
        h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
        b=UQil0z6KPtZoE4IIgyqrDBSU9X++9rjj8ncIeY6CZXiPoACTViMiHr1hq6MyLqjFs
         NYsS+kkgITXlInWdQjntooTn54GkdBh+PsKIX4v6NrruyU3YXO9ZTwlCbRP6T1mThA
         NiCgtiKs/DT7XbSGH03WuzM4g4BuDwB/Ys2ivoQU=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 0913F8B82A;
        Thu, 16 Jan 2020 18:58:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id eHJ2rsSqhfWE; Thu, 16 Jan 2020 18:58:33 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id BFACF8B82D;
        Thu, 16 Jan 2020 18:58:33 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
        id 9828464A33; Thu, 16 Jan 2020 17:58:33 +0000 (UTC)
Message-Id: <2bf9735a6ae5ff9b350b667c0b8434cf2bbe9b50.1579196675.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1579196675.git.christophe.leroy@c-s.fr>
References: <cover.1579196675.git.christophe.leroy@c-s.fr>
From:   Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v4 09/11] powerpc/vdso: override __arch_vdso_capable()
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>, nathanl@linux.ibm.com,
        arnd@arndb.de, tglx@linutronix.de, vincenzo.frascino@arm.com,
        luto@kernel.org
Cc:     linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        x86@kernel.org
Date:   Thu, 16 Jan 2020 17:58:33 +0000 (UTC)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When the timebase is used, make __arch_vdso_capable() always
return true. When the RTC clock is used, make __arch_vdso_capable()
always return false.

Before the patch:
clock-gettime-realtime:    vdso: 1086 nsec/call

After the patch:
clock-gettime-realtime:    vdso: 1033 nsec/call

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/vdso/gettimeofday.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/include/asm/vdso/gettimeofday.h b/arch/powerpc/include/asm/vdso/gettimeofday.h
index 0a247f9b9af9..74b6eef8fbe9 100644
--- a/arch/powerpc/include/asm/vdso/gettimeofday.h
+++ b/arch/powerpc/include/asm/vdso/gettimeofday.h
@@ -74,6 +74,12 @@ static __always_inline u64 __arch_get_hw_counter(s32 clock_mode)
 
 const struct vdso_data *__arch_get_vdso_data(void);
 
+static inline bool __arch_vdso_capable(const struct vdso_data *vd)
+{
+	return !__USE_RTC();
+}
+#define __arch_vdso_capable __arch_vdso_capable
+
 /*
  * powerpc specific delta calculation.
  *
-- 
2.13.3

