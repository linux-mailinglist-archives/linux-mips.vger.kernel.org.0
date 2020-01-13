Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13C551396FF
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2020 18:08:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728741AbgAMRIm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Jan 2020 12:08:42 -0500
Received: from pegase1.c-s.fr ([93.17.236.30]:8701 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727331AbgAMRIm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 13 Jan 2020 12:08:42 -0500
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 47xKmf61Mcz9txyt;
        Mon, 13 Jan 2020 18:08:34 +0100 (CET)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=Q0nb64Sa; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id oKTfeMayUSd4; Mon, 13 Jan 2020 18:08:34 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 47xKmf4yBYz9txys;
        Mon, 13 Jan 2020 18:08:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1578935314; bh=PWRUMcmoHAjONpDuJZiavA8lZ2SQsMCwaOs7HJNDLqQ=;
        h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
        b=Q0nb64Sam3YtaHJEU52QFKqYqgpJJHb/XChp51T/PS7nWsqFdJS8sst/ZieoEKNds
         weZzhlZwBJJo0ppwwuE/BtXDBWlGIBCFOxvwz1S7ttIduzhOZlvDibtpmkI820d8YF
         Zbv15zKrt8Wyk58vDkR8leDrBY1Fv19FRz3fOhhs=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 087988B7C9;
        Mon, 13 Jan 2020 18:08:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id 2sWrwDBoPypz; Mon, 13 Jan 2020 18:08:39 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id C4A9B8B7BE;
        Mon, 13 Jan 2020 18:08:39 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
        id 9A82B64A1D; Mon, 13 Jan 2020 17:08:39 +0000 (UTC)
Message-Id: <f64d31871148a75db9b6aeec7fbad0e3ea1b0737.1578934751.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1578934751.git.christophe.leroy@c-s.fr>
References: <cover.1578934751.git.christophe.leroy@c-s.fr>
From:   Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v3 01/12] powerpc/64: Don't provide time functions in
 compat VDSO32
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>, arnd@arndb.de,
        tglx@linutronix.de, vincenzo.frascino@arm.com, luto@kernel.org
Cc:     linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        x86@kernel.org
Date:   Mon, 13 Jan 2020 17:08:39 +0000 (UTC)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In order to allow use of generic C VDSO, remove time functions
from the 32 bits VDSO on PPC64.

This (temporary) removal is needed because powerpc kernel C headers
are not prepared for building 32 bits code on PPC64.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/vdso32/Makefile     | 3 ++-
 arch/powerpc/kernel/vdso32/vdso32.lds.S | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/vdso32/Makefile b/arch/powerpc/kernel/vdso32/Makefile
index 06f54d947057..738d52105392 100644
--- a/arch/powerpc/kernel/vdso32/Makefile
+++ b/arch/powerpc/kernel/vdso32/Makefile
@@ -3,7 +3,8 @@
 # List of files in the vdso, has to be asm only for now
 
 obj-vdso32-$(CONFIG_PPC64) = getcpu.o
-obj-vdso32 = sigtramp.o gettimeofday.o datapage.o cacheflush.o note.o \
+obj-vdso32-$(CONFIG_PPC32) = gettimeofday.o
+obj-vdso32 = sigtramp.o datapage.o cacheflush.o note.o \
 		$(obj-vdso32-y)
 
 # Build rules
diff --git a/arch/powerpc/kernel/vdso32/vdso32.lds.S b/arch/powerpc/kernel/vdso32/vdso32.lds.S
index 00c025ba4a92..9400b182e163 100644
--- a/arch/powerpc/kernel/vdso32/vdso32.lds.S
+++ b/arch/powerpc/kernel/vdso32/vdso32.lds.S
@@ -144,7 +144,7 @@ VERSION
 		__kernel_datapage_offset;
 
 		__kernel_get_syscall_map;
-#ifndef CONFIG_PPC_BOOK3S_601
+#if defined(CONFIG_PPC32) && !defined(CONFIG_PPC_BOOK3S_601)
 		__kernel_gettimeofday;
 		__kernel_clock_gettime;
 		__kernel_clock_getres;
-- 
2.13.3

