Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEEB124F7FD
	for <lists+linux-mips@lfdr.de>; Mon, 24 Aug 2020 11:24:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbgHXJYQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Aug 2020 05:24:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730362AbgHXJYD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 24 Aug 2020 05:24:03 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ED26C061574
        for <linux-mips@vger.kernel.org>; Mon, 24 Aug 2020 02:24:03 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id z23so3928202plo.8
        for <linux-mips@vger.kernel.org>; Mon, 24 Aug 2020 02:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=53wL1luOVctzzyDKPG600Ra3rdPA9TTvLMh1u20Etdg=;
        b=jaEvVS/nQ38wnLBKiqzOXSH58scAwWpqbgxKB+Hzy4lB6RmLMhedl2mwDBytzixR2m
         sF5RP/scg7VcydYlkjXC+iHXoWdtOBBGGy6Jh8sE9fuhU8NzFhTjKYFKi++7Z3u5s45k
         NMMrmNelkr1UJ/9e2qky7TP9zm4fs1113S9sZTltNA0QwVi02IdEj/oKZMOGgoCKUL4j
         4pUWDWCFu3a+sgZ1pjmwV+9ToxqHY642tCQ70jpXax1Eb+m9X/mHW/rUe7ZigFvgpiVM
         0r1wxuzWO2PNp+U8Qq4ONr606XhxYG5gSfvdXndwW/isyihgp07nyWGWAOHxW/3FdROS
         RyCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=53wL1luOVctzzyDKPG600Ra3rdPA9TTvLMh1u20Etdg=;
        b=OWF+/odZkzijlMVDAs5jA0z2yWypgyD17FIPSqmZrrwaLGbyYtoRx8upVKGsFC0g4w
         sriyt62viOHMq4gJTCs0gGuGGWVejnwaa6C/m7TXyiyVSAF5Pfr1FVyve5ci/30ZDucc
         yU3aR+a7Cj+6isqeS22IovkmrtcAMgygwcK+xRyNWfvqAqlid1wMzpdO19RusSvCbC/y
         JsV18haH+TNDmC2timr9547839kG4EhDM5v4HQzEAjPZT5ZsrTgAo+FOZLyUpkIvnJJf
         rf6vyhX7WE0EeTzkoBl4BIsxJWHlNxSu7hHu770+MzVOocZxwfwXfd4UW7bzANLW9v8r
         SlpA==
X-Gm-Message-State: AOAM530ZyGirwNVeQpl5WKtR2Oqzn1HmX1But5KEGcn0UbcIn31mABu+
        KBwB+QdNQ+yYH+5kx3agVfQxtyPQ9AmGU7+e
X-Google-Smtp-Source: ABdhPJy/Wte2XFWhK7rwEvtSx4hdMCDGcXOp1RhEzwPJVcHj8bbZPzmkXLmCx5K3kqISI0ThFB0gsw==
X-Received: by 2002:a17:90b:4d0b:: with SMTP id mw11mr3828767pjb.235.1598261042578;
        Mon, 24 Aug 2020 02:24:02 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id gz7sm9230808pjb.45.2020.08.24.02.24.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Aug 2020 02:24:02 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V4 1/2] MIPS: Loongson-3: Enable COP2 usage in kernel
Date:   Mon, 24 Aug 2020 17:27:16 +0800
Message-Id: <1598261237-21342-1-git-send-email-chenhc@lemote.com>
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

 arch/mips/boot/compressed/head.S   | 7 +++++++
 arch/mips/include/asm/mipsregs.h   | 7 +++++++
 arch/mips/include/asm/stackframe.h | 6 +++---
 arch/mips/kernel/head.S            | 2 +-
 arch/mips/kernel/process.c         | 2 +-
 arch/mips/kernel/r4k_switch.S      | 3 +++
 arch/mips/kernel/traps.c           | 2 +-
 7 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/arch/mips/boot/compressed/head.S b/arch/mips/boot/compressed/head.S
index 409cb48..4580316 100644
--- a/arch/mips/boot/compressed/head.S
+++ b/arch/mips/boot/compressed/head.S
@@ -14,11 +14,18 @@
 
 #include <asm/asm.h>
 #include <asm/regdef.h>
+#include <asm/mipsregs.h>
 
 	.set noreorder
 	.cprestore
 	LEAF(start)
 start:
+#ifdef CONFIG_CPU_LOONGSON64
+	mfc0    t0, CP0_STATUS
+	or	t0, ST0_CU2   /* make 16-bytes load/store instructions usable */
+	mtc0    t0, CP0_STATUS
+#endif
+
 	/* Save boot rom start args */
 	move	s0, a0
 	move	s1, a1
diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index 4ddc12e..cc93e3f 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -389,6 +389,13 @@
 #define ST0_CU3			0x80000000
 #define ST0_XX			0x80000000	/* MIPS IV naming */
 
+/* in-kernel enabled CUs */
+#ifdef CONFIG_CPU_LOONGSOON64
+#define ST0_KERNEL_CUMASK      (ST0_CU0 | ST_CU2)
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
index 58232ae..c2fde40 100644
--- a/arch/mips/kernel/r4k_switch.S
+++ b/arch/mips/kernel/r4k_switch.S
@@ -53,6 +53,9 @@
 	nor	a3, $0, a3
 	and	a2, a3
 	or	a2, t1
+#ifdef CONFIG_CPU_LOONGSON64
+	or	a2, ST0_CU2   /* make 16-bytes load/store instructions usable */
+#endif
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

