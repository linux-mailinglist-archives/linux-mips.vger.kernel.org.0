Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E89913ECDE
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2020 18:59:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394542AbgAPR62 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jan 2020 12:58:28 -0500
Received: from pegase1.c-s.fr ([93.17.236.30]:50290 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393889AbgAPR61 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Jan 2020 12:58:27 -0500
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 47zBkl4Rxnz9v0MT;
        Thu, 16 Jan 2020 18:58:23 +0100 (CET)
Authentication-Results: localhost; dkim=pass
        reason="1024-bit key; insecure key"
        header.d=c-s.fr header.i=@c-s.fr header.b=PU7eTaOI; dkim-adsp=pass;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id SjVALX4P8BV2; Thu, 16 Jan 2020 18:58:23 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 47zBkl379cz9v0MQ;
        Thu, 16 Jan 2020 18:58:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
        t=1579197503; bh=UUBKk15KITQNNRJp5evVzKMcsza8d4oSE6jeKhRMcDE=;
        h=From:Subject:To:Cc:Date:From;
        b=PU7eTaOIhtqxVjMZbHoIHKjqp9r3ETp1+1A3ditRGh62MKQuHKKpA1ukHm+n4/PQ8
         KC/rDW+iuJ+YJeQ+75hFrx42zs79+bFb+B+mlB6Spffdcew/8JaUUYE+lQ+28d9Voa
         cGAdfy+u4wFjdM2xKEN8a7q76RRkglF0nFieQvTc=
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 187F68B82D;
        Thu, 16 Jan 2020 18:58:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id Q42v6gYwsPbp; Thu, 16 Jan 2020 18:58:24 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 8EC048B82C;
        Thu, 16 Jan 2020 18:58:24 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
        id 3689964A35; Thu, 16 Jan 2020 17:58:24 +0000 (UTC)
Message-Id: <cover.1579196675.git.christophe.leroy@c-s.fr>
From:   Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v4 00/11] powerpc: switch VDSO to C implementation.
To:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>, nathanl@linux.ibm.com,
        arnd@arndb.de, tglx@linutronix.de, vincenzo.frascino@arm.com,
        luto@kernel.org
Cc:     linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        x86@kernel.org
Date:   Thu, 16 Jan 2020 17:58:24 +0000 (UTC)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This is a fourth tentative to switch powerpc VDSO to generic C implementation.

This version should work on PPC64 (untested). VDSO32 for PPC64 is
impossible to build and has been de-activated, because the powerpc
ASM header files for C are not prepared to build 32 bits code with CONFIG_PPC64.

powerpc is a bit special for VDSO as well as system calls in the
way that it requires setting CR SO bit which cannot be done in C.
Therefore, entry/exit and fallback need to be performed in ASM.

Note that on previous patches, a buggy version of vdsotest was used which was
underestimating the time in gettimeofday compared to clock-get... functions.

This series applies on a merge of powerpc/merge and tip/timers/core branches,
series "lib/vdso: Bugfix and consolidation"
(https://lore.kernel.org/patchwork/project/lkml/list/?series=425784)
applied after the above merge.

On a powerpc8xx, with current powerpc/32 ASM VDSO:

gettimeofday:    vdso: 907 nsec/call
clock-getres-realtime:    vdso: 484 nsec/call
clock-gettime-realtime:    vdso: 899 nsec/call

The first patch adds VDSO generic C support without any changes to common code.
Performance is as follows:

gettimeofday:    vdso: 1211 nsec/call
clock-getres-realtime:    vdso: 722 nsec/call
clock-gettime-realtime:    vdso: 1216 nsec/call

Then a few changes in the common code have allowed performance improvement. At
the end of the series we have:

gettimeofday:    vdso: 974 nsec/call
clock-getres-realtime:    vdso: 545 nsec/call
clock-gettime-realtime:    vdso: 941 nsec/call

The final result is rather close to pure ASM VDSO:
* 7% more on gettimeofday (9 cycles)
* 5% more on clock-gettime-realtime (6 cycles)
* 12% more on clock-getres-realtime (8 cycles)

Due to the unavoidable ASM trampoline, we won't get much closer but that should be
acceptable for a port from ASM to a generic C code (here, 1 cycle is about 7,5 ns)

Christophe Leroy (11):
  powerpc/64: Don't provide time functions in compat VDSO32
  powerpc/vdso: Switch VDSO to generic C implementation.
  lib: vdso: only read hrtimer_res when needed in __cvdso_clock_getres()
  powerpc/vdso: simplify __get_datapage()
  lib: vdso: allow arches to provide vdso data pointer
  powerpc/vdso: provide inline alternative to __get_datapage()
  powerpc/vdso: provide vdso data pointer from the ASM caller.
  lib: vdso: allow fixed clock mode
  powerpc/vdso: override __arch_vdso_capable()
  lib: vdso: Allow arches to override the ns shift operation
  powerpc/32: provide vdso_shift_ns()

 arch/powerpc/Kconfig                         |   2 +
 arch/powerpc/include/asm/clocksource.h       |   6 +
 arch/powerpc/include/asm/vdso/gettimeofday.h | 117 ++++++++++++
 arch/powerpc/include/asm/vdso/vsyscall.h     |  25 +++
 arch/powerpc/include/asm/vdso_datapage.h     |  52 +++---
 arch/powerpc/kernel/asm-offsets.c            |  46 +----
 arch/powerpc/kernel/time.c                   |  91 +---------
 arch/powerpc/kernel/vdso.c                   |  58 ++----
 arch/powerpc/kernel/vdso32/Makefile          |  27 ++-
 arch/powerpc/kernel/vdso32/datapage.S        |  10 +-
 arch/powerpc/kernel/vdso32/gettimeofday.S    | 258 ++++-----------------------
 arch/powerpc/kernel/vdso32/vdso32.lds.S      |   9 +-
 arch/powerpc/kernel/vdso32/vgettimeofday.c   |  29 +++
 arch/powerpc/kernel/vdso64/Makefile          |  23 ++-
 arch/powerpc/kernel/vdso64/datapage.S        |  13 +-
 arch/powerpc/kernel/vdso64/gettimeofday.S    | 257 ++++----------------------
 arch/powerpc/kernel/vdso64/vdso64.lds.S      |   7 +-
 arch/powerpc/kernel/vdso64/vgettimeofday.c   |  29 +++
 lib/vdso/gettimeofday.c                      | 107 ++++++++---
 19 files changed, 457 insertions(+), 709 deletions(-)
 create mode 100644 arch/powerpc/include/asm/clocksource.h
 create mode 100644 arch/powerpc/include/asm/vdso/gettimeofday.h
 create mode 100644 arch/powerpc/include/asm/vdso/vsyscall.h
 create mode 100644 arch/powerpc/kernel/vdso32/vgettimeofday.c
 create mode 100644 arch/powerpc/kernel/vdso64/vgettimeofday.c

-- 
2.13.3

