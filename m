Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB3F13971C
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2020 18:09:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728795AbgAMRJ1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Jan 2020 12:09:27 -0500
Received: from pegase1.c-s.fr ([93.17.236.30]:44559 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728760AbgAMRIo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 13 Jan 2020 12:08:44 -0500
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 47xKmh6GKJz9txyv;
        Mon, 13 Jan 2020 18:08:36 +0100 (CET)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=mBpCKKG/; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id 47SfHxDpbXMG; Mon, 13 Jan 2020 18:08:36 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 47xKmh5CtGz9txyq;
        Mon, 13 Jan 2020 18:08:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1578935316; bh=FbDYhvBTgQ/Lrh5RwFYuCQEYwJvHYlZlnPbutz2hvUg=;
        h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
        b=mBpCKKG/R/EQyJZFZ9dsTIMC+sg7c/c1wXtd7QEgOWLNi3i2AAC9Vfv/Ud7HFmFuU
         HmlggOZhmWRHXKl/lKRl+RpCLeyu9Xi5gNGL0xjvd+JpWn5zcRECBbDM9OHFWWIXGo
         YorKxdnV/93taISEusU2hS50irb55O/OVnGaRC+k=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 0E6EF8B7C9;
        Mon, 13 Jan 2020 18:08:42 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id 6e0G3CbwxoJN; Mon, 13 Jan 2020 18:08:41 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id D00BE8B7BE;
        Mon, 13 Jan 2020 18:08:41 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
        id A66B564A1D; Mon, 13 Jan 2020 17:08:41 +0000 (UTC)
Message-Id: <9f0f72424a8f0260470ecd50d5803db685285ba5.1578934751.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1578934751.git.christophe.leroy@c-s.fr>
References: <cover.1578934751.git.christophe.leroy@c-s.fr>
From:   Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v3 03/12] lib: vdso: mark __cvdso_clock_getres() as static
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>, arnd@arndb.de,
        tglx@linutronix.de, vincenzo.frascino@arm.com, luto@kernel.org
Cc:     linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        x86@kernel.org
Date:   Mon, 13 Jan 2020 17:08:41 +0000 (UTC)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When __cvdso_clock_getres() became __cvdso_clock_getres_common()
and a new __cvdso_clock_getres() was added, static qualifier was
forgotten.

This change allows the compiler to inline __cvdso_clock_getres_common(),
and the performance improvement is significant:

Before:
clock-getres-realtime-coarse:    vdso: 984 nsec/call
clock-getres-realtime:    vdso: 922 nsec/call
clock-getres-monotonic-raw:    vdso: 968 nsec/call

After:
clock-getres-realtime-coarse:    vdso: 753 nsec/call
clock-getres-realtime:    vdso: 691 nsec/call
clock-getres-monotonic-raw:    vdso: 737 nsec/call

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

