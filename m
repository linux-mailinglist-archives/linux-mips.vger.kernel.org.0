Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AFEB25F73E
	for <lists+linux-mips@lfdr.de>; Mon,  7 Sep 2020 12:06:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728331AbgIGKGv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Sep 2020 06:06:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728317AbgIGKGu (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 7 Sep 2020 06:06:50 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3F0FC061573
        for <linux-mips@vger.kernel.org>; Mon,  7 Sep 2020 03:06:48 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id kk9so3896932pjb.2
        for <linux-mips@vger.kernel.org>; Mon, 07 Sep 2020 03:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Z9TpHfumO0CTgwEuoa23RwPOaRJrW5ZKiBcljLeWhrE=;
        b=KGCOfRmyVHPFBfs3Iybn5Ucua2Asg9BarQrRUu3SP+fnlQCDJ2Y1eL5gJP/jzZg0Cs
         nzI67UvpaFmSisN+HzxDg6qNsPp2IFQdfJBiGe5TDbDQe4o++Aw+uI6jmbeG4z/F6wze
         8+QGOjalayBJHZWyqgeS0B8SlCbsVuPvHFTgP7AUtTx3UslqNBwpVfSzpd4nH0Iw+flN
         5kq6WVENFbYumowaMLNKGWlWJ3w5muTvhCJsNqkG4Qkt18l0bchNv5u7FlivLdxY3Weh
         svJ6KrW0rn+DTmXmuozljwptMy6eya6xtmAOGcDWVGY7BgXzzHMuiWof3mNVcHd6tWgH
         mkZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=Z9TpHfumO0CTgwEuoa23RwPOaRJrW5ZKiBcljLeWhrE=;
        b=e/nr2lFdAA+w/4UYd+gOWJSuEG0D1epS+/jzmIw6kdLH98SYmwx1xKZzZvGFptXIzI
         cFriMjJBt21/nzIvIMc7BD9VMf4Mn+mr0/xKEl59ngxy3nYp5KqKlF/NyQs14EUaTX4K
         Km17RQGfNhPmCSY7festWcCRyG3KBzeyTQLuA+ruAuNiuC1LOZ1v1u0J9iWcjdA5uqQq
         PtXxqXZSPY7VaEfkYfhk4Wi48lTRqxtipVYYfkfAv8aTU6pSImbTXzQBHVkYfAW/StsS
         EwT4EeRM9PRjb2zVi51+SeWUi0qZ/cjJur+puwz/33NI3WkHymgWP2MY2u6xTKndAc+c
         23eQ==
X-Gm-Message-State: AOAM532xf4JPOV3gKzikjIojIj0iC+AgfLKUUfEcAILlDNozhh2Mc3Be
        9uZGSMVVepxpsCSdPMXlb3M=
X-Google-Smtp-Source: ABdhPJxLoM6qiAYG/Zy5ktwnbYS14ef+7jqMQFhbOt/qiwHaybPpa+OFcpkLIxs6KTq4Sci2z6/p9A==
X-Received: by 2002:a17:90a:46c2:: with SMTP id x2mr19660150pjg.184.1599473208206;
        Mon, 07 Sep 2020 03:06:48 -0700 (PDT)
Received: from software.domain.org ([45.77.13.216])
        by smtp.gmail.com with ESMTPSA id 64sm7992238pgi.90.2020.09.07.03.06.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Sep 2020 03:06:47 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V6 2/3] MIPS: Loongson-3: Enable COP2 usage in kernel
Date:   Mon,  7 Sep 2020 18:06:08 +0800
Message-Id: <1599473169-6599-2-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1599473169-6599-1-git-send-email-chenhc@lemote.com>
References: <1599473169-6599-1-git-send-email-chenhc@lemote.com>
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
V6: Modify switch_to() and don't touch r4k_switch.S.

 arch/mips/boot/compressed/head.S   | 5 +++++
 arch/mips/include/asm/mipsregs.h   | 7 +++++++
 arch/mips/include/asm/stackframe.h | 6 +++---
 arch/mips/kernel/head.S            | 2 +-
 arch/mips/kernel/process.c         | 4 ++--
 arch/mips/kernel/traps.c           | 2 +-
 6 files changed, 19 insertions(+), 7 deletions(-)

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

