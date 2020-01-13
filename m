Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A312813970D
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2020 18:09:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728778AbgAMRJC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Jan 2020 12:09:02 -0500
Received: from pegase1.c-s.fr ([93.17.236.30]:40965 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728848AbgAMRIv (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 13 Jan 2020 12:08:51 -0500
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 47xKms1KbYz9v0Y0;
        Mon, 13 Jan 2020 18:08:45 +0100 (CET)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=ltBD6+si; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id 2grE1wQ3VL1l; Mon, 13 Jan 2020 18:08:45 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 47xKms0BhPz9v0Xy;
        Mon, 13 Jan 2020 18:08:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1578935325; bh=XLnzIcQo2gdn6/h4SDeOO8peJAxsTTmgC8iXnixatHk=;
        h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
        b=ltBD6+siFYlWWG5dz6TSocWL3jpuQkzoWPC3xPxE01ZHvMRMiVv8yn+46Fn1vDAQs
         162dR8qUJMY1/1TefqinYBAAfHQyr5UsbSxiugQLjDb7t5oItKvK/H3exuotlqfipX
         mp3zxCOe4hj+Y66sTj0SUCkp01MdjmZBIT0gxDk4=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 563FC8B7C9;
        Mon, 13 Jan 2020 18:08:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id nXhUeUXxlMgG; Mon, 13 Jan 2020 18:08:50 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 249F18B7BE;
        Mon, 13 Jan 2020 18:08:50 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
        id E5E5D64A1D; Mon, 13 Jan 2020 17:08:49 +0000 (UTC)
Message-Id: <bb92e7208d820f74188ab3edc1d56e6733f2df29.1578934751.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1578934751.git.christophe.leroy@c-s.fr>
References: <cover.1578934751.git.christophe.leroy@c-s.fr>
From:   Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v3 11/12] lib: vdso: split clock verification out of
 __arch_get_hw_counter()
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>, arnd@arndb.de,
        tglx@linutronix.de, vincenzo.frascino@arm.com, luto@kernel.org
Cc:     linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        x86@kernel.org
Date:   Mon, 13 Jan 2020 17:08:49 +0000 (UTC)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

__arch_get_hw_counter() returns the current value of the counter if
the counter is valid or a negative number if the counter is not valid.

This is suboptimal because the validity is checked twice: once before
reading the counter and once after reading the counter.

Optionaly split the verification out of __arch_get_hw_counter()
by providing an optional __arch_is_hw_counter_valid() function.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 lib/vdso/gettimeofday.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index ea1a55507af5..001f6329e846 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -67,11 +67,18 @@ static __always_inline int do_hres(const struct vdso_data *vd, clockid_t clk,
 
 	do {
 		seq = vdso_read_begin(vd);
+#ifdef __arch_is_hw_counter_valid
+		if (unlikely(!__arch_is_hw_counter_valid(vd->clock_mode)))
+			return -1;
+#endif
+
 		cycles = __arch_get_hw_counter(vd->clock_mode);
 		ns = vdso_ts->nsec;
 		last = vd->cycle_last;
+#ifndef __arch_is_hw_counter_valid
 		if (unlikely((s64)cycles < 0))
 			return -1;
+#endif
 
 		ns += vdso_calc_delta(cycles, last, vd->mask, vd->mult);
 		nsec = ns >> vd->shift;
-- 
2.13.3

