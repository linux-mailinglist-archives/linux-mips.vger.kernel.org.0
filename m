Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 597AE1396FE
	for <lists+linux-mips@lfdr.de>; Mon, 13 Jan 2020 18:08:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728558AbgAMRIl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Jan 2020 12:08:41 -0500
Received: from pegase1.c-s.fr ([93.17.236.30]:2142 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727323AbgAMRIl (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 13 Jan 2020 12:08:41 -0500
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 47xKmf0c4xz9txyr;
        Mon, 13 Jan 2020 18:08:34 +0100 (CET)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=VCsSI0Ym; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id YpE9yvHpzNph; Mon, 13 Jan 2020 18:08:34 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 47xKmd6Vt6z9txyq;
        Mon, 13 Jan 2020 18:08:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1578935313; bh=HWz0NtVtGF6JzuFvn1IEu26bS25Q46p2uQtnUn88eHs=;
        h=From:Subject:To:Cc:Date:From;
        b=VCsSI0YmRfqt3jhfrCAg6RSUj1sPG5J+ypYkfjIgakQ3Ukz7AtoB6jArFcyzqYdsZ
         GlhNVPJmOaYwxRRlvFQOZdIwpAANt/SritBFT2Q6XoBOZFXYKGIL0rKzuczCydlRP5
         jjqR1csQiqmNFtLuAyN1E7m3v17abUHCf230875A=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 3C3628B7C9;
        Mon, 13 Jan 2020 18:08:39 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id 8wXE7irLHIRC; Mon, 13 Jan 2020 18:08:39 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id ECB1A8B7BE;
        Mon, 13 Jan 2020 18:08:38 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
        id 8DBC464A1D; Mon, 13 Jan 2020 17:08:38 +0000 (UTC)
Message-Id: <cover.1578934751.git.christophe.leroy@c-s.fr>
From:   Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v3 00/12] powerpc: switch VDSO to C implementation.
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>, arnd@arndb.de,
        tglx@linutronix.de, vincenzo.frascino@arm.com, luto@kernel.org
Cc:     linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        x86@kernel.org
Date:   Mon, 13 Jan 2020 17:08:38 +0000 (UTC)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This is a third tentative to switch powerpc VDSO to generic C implementation.

This version should work on PPC64 (untested). VDSO32 for PPC64 is
impossible to build and has been de-activated, because the powerpc
ASM header files for C are not prepared to build 32 bits code with CONFIG_PPC64.

powerpc is a bit special for VDSO as well as system calls in the
way that it requires setting CR SO bit which cannot be done in C.
Therefore, entry/exit and fallback need to be performed in ASM.

On a powerpc8xx, with current powerpc/32 ASM VDSO:

gettimeofday:    vdso: 737 nsec/call
clock-getres-realtime:    vdso: 475 nsec/call
clock-gettime-realtime:    vdso: 892 nsec/call

The first patch adds VDSO generic C support without any changes to common code.
Performance is as follows:

gettimeofday:    vdso: 1379 nsec/call
clock-getres-realtime-coarse:    vdso: 984 nsec/call
clock-gettime-realtime-coarse:    vdso: 868 nsec/call
clock-getres-realtime:    vdso: 922 nsec/call
clock-gettime-realtime:    vdso: 1511 nsec/call
clock-getres-monotonic-raw:    vdso: 968 nsec/call
clock-gettime-monotonic-raw:    vdso: 1576 nsec/call

Then a few changes in the common code have allowed performance improvement. At
the end of the series we have:

gettimeofday:    vdso: 899 nsec/call
clock-getres-realtime-coarse:    vdso: 546 nsec/call
clock-gettime-realtime-coarse:    vdso: 615 nsec/call
clock-getres-realtime:    vdso: 545 nsec/call
clock-gettime-realtime:    vdso: 1064 nsec/call
clock-getres-monotonic-raw:    vdso: 546 nsec/call
clock-gettime-monotonic-raw:    vdso: 1125 nsec/call

Christophe Leroy (12):
  powerpc/64: Don't provide time functions in compat VDSO32
  powerpc/vdso: Switch VDSO to generic C implementation.
  lib: vdso: mark __cvdso_clock_getres() as static
  lib: vdso: inline do_hres() and do_coarse()
  lib: vdso: Avoid duplication in __cvdso_clock_getres()
  lib: vdso: __iter_div_u64_rem() is suboptimal for 32 bit time
  powerpc/vdso: simplify __get_datapage()
  lib: vdso: allow arches to provide vdso data pointer
  powerpc/vdso: provide inline alternative to __get_datapage()
  powerpc/vdso: provide vdso data pointer from the ASM caller.
  lib: vdso: split clock verification out of __arch_get_hw_counter()
  powerpc/vdso: provide __arch_is_hw_counter_valid()

 arch/powerpc/Kconfig                         |   2 +
 arch/powerpc/include/asm/vdso/gettimeofday.h | 104 +++++++++++
 arch/powerpc/include/asm/vdso/vsyscall.h     |  25 +++
 arch/powerpc/include/asm/vdso_datapage.h     |  52 +++---
 arch/powerpc/kernel/asm-offsets.c            |  46 +----
 arch/powerpc/kernel/time.c                   |  90 ----------
 arch/powerpc/kernel/vdso.c                   |  58 ++----
 arch/powerpc/kernel/vdso32/Makefile          |  30 +++-
 arch/powerpc/kernel/vdso32/datapage.S        |  10 +-
 arch/powerpc/kernel/vdso32/gettimeofday.S    | 258 ++++-----------------------
 arch/powerpc/kernel/vdso32/vdso32.lds.S      |   9 +-
 arch/powerpc/kernel/vdso32/vgettimeofday.c   |  29 +++
 arch/powerpc/kernel/vdso64/Makefile          |  23 ++-
 arch/powerpc/kernel/vdso64/datapage.S        |  13 +-
 arch/powerpc/kernel/vdso64/gettimeofday.S    | 257 ++++----------------------
 arch/powerpc/kernel/vdso64/vdso64.lds.S      |   7 +-
 arch/powerpc/kernel/vdso64/vgettimeofday.c   |  29 +++
 lib/vdso/gettimeofday.c                      | 130 +++++++++++---
 18 files changed, 457 insertions(+), 715 deletions(-)
 create mode 100644 arch/powerpc/include/asm/vdso/gettimeofday.h
 create mode 100644 arch/powerpc/include/asm/vdso/vsyscall.h
 create mode 100644 arch/powerpc/kernel/vdso32/vgettimeofday.c
 create mode 100644 arch/powerpc/kernel/vdso64/vgettimeofday.c

-- 
2.13.3

