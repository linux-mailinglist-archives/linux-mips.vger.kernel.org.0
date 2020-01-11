Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 617591382B3
	for <lists+linux-mips@lfdr.de>; Sat, 11 Jan 2020 18:48:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730734AbgAKRsS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 11 Jan 2020 12:48:18 -0500
Received: from pegase1.c-s.fr ([93.17.236.30]:13767 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730647AbgAKRsS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 11 Jan 2020 12:48:18 -0500
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 47w6lL6K8cz9tyVC;
        Sat, 11 Jan 2020 18:48:14 +0100 (CET)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=Ndqg+k0Q; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id kGPBY1kr8M4S; Sat, 11 Jan 2020 18:48:14 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 47w6lL4t6kz9tyVB;
        Sat, 11 Jan 2020 18:48:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1578764894; bh=rWzye87XejSTOoMHiw7Qf2ytvLtb8fImWFNoum8VhkY=;
        h=From:Subject:To:Cc:Date:From;
        b=Ndqg+k0Q+U706ClKg/A77m9CAJWL+dmX83zxMFCi51x4RXQvVbMRWXypUNrag2Xkw
         w673desfBUJ0oDhueeWvnNkiNtOU8McOEpwTZxrlULnTUURmT3pssRfdnR8TOrQN/N
         n9JZ9z1RZz3v0siXxWmqPLn1k/xAxa6yiIwv1AzM=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 589B28B791;
        Sat, 11 Jan 2020 18:48:16 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id V5T1u6D6LVz7; Sat, 11 Jan 2020 18:48:16 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 201C28B752;
        Sat, 11 Jan 2020 18:48:16 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
        id BA9BC63BCA; Sat, 11 Jan 2020 17:48:15 +0000 (UTC)
Message-Id: <e7becc50bee355e3872b84d91cc68ae8d7776bb9.1578764712.git.christophe.leroy@c-s.fr>
From:   Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] lib: vdso: mark __cvdso_clock_getres() as static
To:     arnd@arndb.de, tglx@linutronix.de, vincenzo.frascino@arm.com,
        luto@kernel.org
Cc:     linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        x86@kernel.org
Date:   Sat, 11 Jan 2020 17:48:15 +0000 (UTC)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When __cvdso_clock_getres() became __cvdso_clock_getres_common()
and a new __cvdso_clock_getres() was added, static qualifier was
forgotten.

Fixes: 502a590a170b ("lib/vdso: Move fallback invocation to the callers")
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 lib/vdso/gettimeofday.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 9ecfd3b547ba..42bd8ab955fa 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -221,6 +221,7 @@ int __cvdso_clock_getres_common(clockid_t clock, struct __kernel_timespec *res)
 	return 0;
 }
 
+static __maybe_unused
 int __cvdso_clock_getres(clockid_t clock, struct __kernel_timespec *res)
 {
 	int ret = __cvdso_clock_getres_common(clock, res);
-- 
2.13.3

