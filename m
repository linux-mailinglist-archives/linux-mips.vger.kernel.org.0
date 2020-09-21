Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC61271EAB
	for <lists+linux-mips@lfdr.de>; Mon, 21 Sep 2020 11:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726387AbgIUJNo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Sep 2020 05:13:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726334AbgIUJNo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 21 Sep 2020 05:13:44 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8350DC061755
        for <linux-mips@vger.kernel.org>; Mon, 21 Sep 2020 02:13:44 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id o20so8711761pfp.11
        for <linux-mips@vger.kernel.org>; Mon, 21 Sep 2020 02:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=b1gHFKFo4USm94RTrarho+SUQzHRp0+TqUOuxK0E1m0=;
        b=GUCLDMTiychlhvi4PmVvIueCYbQYHXCFxsviuZbeOBBWnKAq2lHT5PuVWNWjcH9nJl
         q6BvWooQX1Ti0EJY6DRnNKYz7F6A6He0SIQW2iPxMnwsDZhZ9eJKYm4szpdgel5joAQ3
         Wp+A5MojUd7g678UEYfnWtaT9zAp3DASvKFne8eU5/gI40rJ+5s2oDn6yVOcbSRazdwB
         qEGQvMAWUFllGlDuhNlw1n3inw99jepzxO7C+UE0KI+BF5B3uqZSPSFhTUG4JvyjZ0VP
         tcfsALRtzpCy8oJ/HRtHzSB+Bb66MhN7QOY4NRzpeftl9zpgqKEQqXoTO4Vihwv6Z/m9
         vQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=b1gHFKFo4USm94RTrarho+SUQzHRp0+TqUOuxK0E1m0=;
        b=KJbP+IlFqVU0S7KP9g8Nk/xTLqhvTS/V/LFFPSHl508vv+WuCwH3MNSCkf0ZokLgOG
         oIcU5xoBxlvNMiPBUixHf5IPauF6N/DzDtQdAE477B+kfToDSGIsUSfwox70ETl3H7Ma
         36FMGufcrIqZDTC6GDWoGN60co5K/jvpB6Y2FXutg7RO9qrXw/fwJYw6m9ceXVAosGNi
         V6Ta31m7MXPJWSs/qhr3BvGaxVBtmRSXIBqUC5p6DMOJkytfGR3bLo3cVEM+3u1f/Cpi
         +lKaZadZuaYmzTCPTw11hwcKvYHSsirIxhT/gxfhSbnJ20XeevuP2bvfkfeFAC9lnclt
         haew==
X-Gm-Message-State: AOAM531Rq74J4WZkIF7PyRMln5BFi/ruRiJj51V/F4zOcdVrxinNuxkJ
        dWbTPtXsdIxe8eJpRbymMog=
X-Google-Smtp-Source: ABdhPJzbCpIzYOXSEoQTdlRI4qyi72cCo5+8c5RrZUkvJOBwgzGHkTgF0hTbisRQmMJdhxirQJl2Rw==
X-Received: by 2002:a17:902:9a90:b029:d2:26da:7e87 with SMTP id w16-20020a1709029a90b02900d226da7e87mr3146090plp.15.1600679624032;
        Mon, 21 Sep 2020 02:13:44 -0700 (PDT)
Received: from software.domain.org ([45.77.13.216])
        by smtp.gmail.com with ESMTPSA id 134sm11723885pfa.93.2020.09.21.02.13.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 02:13:43 -0700 (PDT)
Sender: Huacai Chen <chenhuacai@gmail.com>
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V7 2/3] MIPS: Loongson-3: Enable COP2 usage in kernel
Date:   Mon, 21 Sep 2020 17:12:27 +0800
Message-Id: <1600679548-29154-2-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1600679548-29154-1-git-send-email-chenhc@lemote.com>
References: <1600679548-29154-1-git-send-email-chenhc@lemote.com>
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

For zboot, we disable gslq/gssq be generated by toolchain.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
V3: Stop using ST0_MM and use ST0_CU2 instead (Thank Thomas and Maciej).
V4: Adopt Thomas's suggestion to improve coding style.
V5: Use ST0_KERNEL_CUMASK in all possible places to avoid #ifdefs.
V6: Modify switch_to() and don't touch r4k_switch.S.
V7: For zboot, disable gslq/gssq be generated by toolchain.

 arch/mips/boot/compressed/Makefile | 5 +++++
 arch/mips/include/asm/mipsregs.h   | 7 +++++++
 arch/mips/include/asm/stackframe.h | 6 +++---
 arch/mips/kernel/head.S            | 2 +-
 arch/mips/kernel/process.c         | 4 ++--
 arch/mips/kernel/traps.c           | 2 +-
 6 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/arch/mips/boot/compressed/Makefile b/arch/mips/boot/compressed/Makefile
index 9a9ba77..2c491c1 100644
--- a/arch/mips/boot/compressed/Makefile
+++ b/arch/mips/boot/compressed/Makefile
@@ -22,6 +22,11 @@ KBUILD_CFLAGS := $(filter-out -pg, $(KBUILD_CFLAGS))
 
 KBUILD_CFLAGS := $(filter-out -fstack-protector, $(KBUILD_CFLAGS))
 
+# Disable lq/sq in zboot
+ifdef CONFIG_CPU_LOONGSON64
+KBUILD_CFLAGS := $(filter-out -march=loongson3a, $(KBUILD_CFLAGS)) -march=mips64r2
+endif
+
 KBUILD_CFLAGS := $(KBUILD_CFLAGS) -D__KERNEL__ -D__DISABLE_EXPORTS \
 	-DBOOT_HEAP_SIZE=$(BOOT_HEAP_SIZE) -D"VMLINUX_LOAD_ADDRESS_ULL=$(VMLINUX_LOAD_ADDRESS)ull"
 
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
index f5dc316..b36297e 100644
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
@@ -133,7 +133,7 @@ int copy_thread(unsigned long clone_flags, unsigned long usp,
 	childregs = (struct pt_regs *) childksp - 1;
 	/*  Put the stack after the struct pt_regs.  */
 	childksp = (unsigned long) childregs;
-	p->thread.cp0_status = read_c0_status() & ~(ST0_CU2|ST0_CU1);
+	p->thread.cp0_status = (read_c0_status() & ~(ST0_CU2|ST0_CU1)) | ST0_KERNEL_CUMASK;
 	if (unlikely(p->flags & PF_KTHREAD)) {
 		/* kernel thread */
 		unsigned long status = p->thread.cp0_status;
diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index cf788591..e035295 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -2204,7 +2204,7 @@ static void configure_status(void)
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

