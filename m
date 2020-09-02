Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97FAB25A6D3
	for <lists+linux-mips@lfdr.de>; Wed,  2 Sep 2020 09:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbgIBHcX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 2 Sep 2020 03:32:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726489AbgIBHcT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 2 Sep 2020 03:32:19 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2786DC061244
        for <linux-mips@vger.kernel.org>; Wed,  2 Sep 2020 00:32:19 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id w7so2368064pfi.4
        for <linux-mips@vger.kernel.org>; Wed, 02 Sep 2020 00:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=5n7bgn4R3+/TM7Aq0opn1yMLhpKfeHQArQkUaqzLUrY=;
        b=FqgWUzqGQ5DuQzo4eqLQwpgXH/UaZgGKO8MoJ3u1fHqUoOCZsX/5inUlG1VJanK5kE
         9IDWOqSlGDljNLw1lmElFV8MGSy6hoY5ZK/zOpi4VRIwwN6SCtrzOJRwZ86siUnuTkzZ
         L/jnoy56okuG2e/G/Ma3uDwJZsTW5/dvr7R3jDCOYVr/v/o8ZbAsY3JuzIyLSHwesX/j
         xOHxa4PWA/6Pqdi1R+WDhsFLt6IvjYwmDbe5DWwMhe22DEuLZsi161Bn+b9prvjMSAxy
         eoanrlZGPgMNAaBN1hYGKsFIvr2psrhk4ct6FiiOR0g9X4mD7ZktfVA+ILXEe6zxPb2x
         hApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=5n7bgn4R3+/TM7Aq0opn1yMLhpKfeHQArQkUaqzLUrY=;
        b=n3ULLGKPS/k0w+ejRWWp2Y+5kPQHO8sHB1PzGOA474XoJW3KyVPZOtvTGQdIr4jF0c
         +DKotDdiR1MK1kWXRMWIE5G4apmxA/1NBZL0jzCS+iEc5iIVvZPaAAbXL5x6Ih/nZIp+
         5/7mQc65/txK4tX88gVLnRhCt+8kNGYvij77We/5qxTpr5SvG4Vcrt3tU1CAkWp7wAJj
         ef6TgYtDz48ojyF+wlUidQ+UupIQabJ32w/OhOs7YCJJ+akdRh6BkYnlTMdNi0mjDzX8
         q70d+CnOt6ZOid3usLIpUTFjvrIiGr7i6NIWRrkPewjJr7F1BToNsrl49j9swasXKWAp
         sFxw==
X-Gm-Message-State: AOAM531X7DIxMzwO6U4YMqgDJKcbBI1Io6Y/O/qUH1qRSHk8BCiPdIjr
        Y4re/1Mu/Za5R8U86zFcrl8=
X-Google-Smtp-Source: ABdhPJxMBpqvA+FtyTmBoDhGqNHTfLa9+SF568ZBMezvFyyDMraYQ4NVHeD3bnBf1zVeEj913rZFrQ==
X-Received: by 2002:a63:2d0:: with SMTP id 199mr947084pgc.408.1599031938697;
        Wed, 02 Sep 2020 00:32:18 -0700 (PDT)
Received: from software.domain.org ([45.77.13.216])
        by smtp.gmail.com with ESMTPSA id r10sm3518082pjp.49.2020.09.02.00.32.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Sep 2020 00:32:17 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V5 1/2] MIPS: Loongson-3: Enable COP2 usage in kernel
Date:   Wed,  2 Sep 2020 15:32:03 +0800
Message-Id: <1599031924-31659-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Loongson-3's COP2 is Multi-Media coprocessor, it is disabled in kernel
mode by default. However, gslq/gssq (16-bytes load/store instructions)
overrides the instruction format of lwc2/swc2. If we wan't to use gslq/
gssq for optimization in kernel, we should enable COP2 usage in kernel.

Please pay attention that in this patch we only enable COP2 in kernel,
which means it will lose ST0_CU2 when a process go to user space (try
to use COP2 in user space will trigger an exception and then grab COP2,
which is similar to FPU). And as a result, we need to modify the context
switching code because the new scheduled process doesn't contain ST0_CU2
in its THERAD_STATUS probably.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
V3: Stop using ST0_MM and use ST0_CU2 instead (Thank Thomas and Maciej).
V4: Adopt Thomas's suggestion to improve coding style.
V5: Use ST0_KERNEL_CUMASK in all possible places to avoid #ifdefs.

 arch/mips/boot/compressed/head.S   | 5 +++++
 arch/mips/include/asm/mipsregs.h   | 7 +++++++
 arch/mips/include/asm/stackframe.h | 6 +++---
 arch/mips/kernel/head.S            | 2 +-
 arch/mips/kernel/process.c         | 2 +-
 arch/mips/kernel/r4k_switch.S      | 1 +
 arch/mips/kernel/traps.c           | 2 +-
 7 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/arch/mips/boot/compressed/head.S b/arch/mips/boot/compressed/head.S
index 409cb48..9fc88ec 100644
--- a/arch/mips/boot/compressed/head.S
+++ b/arch/mips/boot/compressed/head.S
@@ -14,11 +14,16 @@
 
 #include <asm/asm.h>
 #include <asm/regdef.h>
+#include <asm/mipsregs.h>
 
 	.set noreorder
 	.cprestore
 	LEAF(start)
 start:
+	mfc0    t0, CP0_STATUS
+	or	t0, ST0_KERNEL_CUMASK
+	mtc0    t0, CP0_STATUS
+
 	/* Save boot rom start args */
 	move	s0, a0
 	move	s1, a1
diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index 1a03fdc2..36b8433 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -389,6 +389,13 @@
 #define ST0_CU3			0x80000000
 #define ST0_XX			0x80000000	/* MIPS IV naming */
 
+/* in-kernel enabled CUs */
+#ifdef CONFIG_CPU_LOONGSON64
+#define ST0_KERNEL_CUMASK      (ST0_CU0 | ST0_CU2)
+#else
+#define ST0_KERNEL_CUMASK      ST0_CU0
+#endif
+
 /*
  * Bitfields and bit numbers in the coprocessor 0 IntCtl register. (MIPSR2)
  */
diff --git a/arch/mips/include/asm/stackframe.h b/arch/mips/include/asm/stackframe.h
index 3e8d2aa..aa430a6 100644
--- a/arch/mips/include/asm/stackframe.h
+++ b/arch/mips/include/asm/stackframe.h
@@ -450,7 +450,7 @@
  */
 		.macro	CLI
 		mfc0	t0, CP0_STATUS
-		li	t1, ST0_CU0 | STATMASK
+		li	t1, ST0_KERNEL_CUMASK | STATMASK
 		or	t0, t1
 		xori	t0, STATMASK
 		mtc0	t0, CP0_STATUS
@@ -463,7 +463,7 @@
  */
 		.macro	STI
 		mfc0	t0, CP0_STATUS
-		li	t1, ST0_CU0 | STATMASK
+		li	t1, ST0_KERNEL_CUMASK | STATMASK
 		or	t0, t1
 		xori	t0, STATMASK & ~1
 		mtc0	t0, CP0_STATUS
@@ -477,7 +477,7 @@
  */
 		.macro	KMODE
 		mfc0	t0, CP0_STATUS
-		li	t1, ST0_CU0 | (STATMASK & ~1)
+		li	t1, ST0_KERNEL_CUMASK | (STATMASK & ~1)
 #if defined(CONFIG_CPU_R3000) || defined(CONFIG_CPU_TX39XX)
 		andi	t2, t0, ST0_IEP
 		srl	t2, 2
diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
index 7dd234e..61b7358 100644
--- a/arch/mips/kernel/head.S
+++ b/arch/mips/kernel/head.S
@@ -35,7 +35,7 @@
 	.macro	setup_c0_status set clr
 	.set	push
 	mfc0	t0, CP0_STATUS
-	or	t0, ST0_CU0|\set|0x1f|\clr
+	or	t0, ST0_KERNEL_CUMASK|\set|0x1f|\clr
 	xor	t0, 0x1f|\clr
 	mtc0	t0, CP0_STATUS
 	.set	noreorder
diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
index f5dc316..9412314 100644
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -68,7 +68,7 @@ void start_thread(struct pt_regs * regs, unsigned long pc, unsigned long sp)
 	unsigned long status;
 
 	/* New thread loses kernel privileges. */
-	status = regs->cp0_status & ~(ST0_CU0|ST0_CU1|ST0_FR|KU_MASK);
+	status = regs->cp0_status & ~(ST0_CU0|ST0_CU1|ST0_CU2|ST0_FR|KU_MASK);
 	status |= KU_USER;
 	regs->cp0_status = status;
 	lose_fpu(0);
diff --git a/arch/mips/kernel/r4k_switch.S b/arch/mips/kernel/r4k_switch.S
index 58232ae..8f33bbc 100644
--- a/arch/mips/kernel/r4k_switch.S
+++ b/arch/mips/kernel/r4k_switch.S
@@ -53,6 +53,7 @@
 	nor	a3, $0, a3
 	and	a2, a3
 	or	a2, t1
+	or	a2, ST0_KERNEL_CUMASK
 	mtc0	a2, CP0_STATUS
 	move	v0, a0
 	jr	ra
diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 38aa07c..14225b6 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -2192,7 +2192,7 @@ static void configure_status(void)
 	 * flag that some firmware may have left set and the TS bit (for
 	 * IP27).  Set XX for ISA IV code to work.
 	 */
-	unsigned int status_set = ST0_CU0;
+	unsigned int status_set = ST0_KERNEL_CUMASK;
 #ifdef CONFIG_64BIT
 	status_set |= ST0_FR|ST0_KX|ST0_SX|ST0_UX;
 #endif
-- 
2.7.0

