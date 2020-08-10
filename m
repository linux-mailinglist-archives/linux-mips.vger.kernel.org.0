Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5DF3240744
	for <lists+linux-mips@lfdr.de>; Mon, 10 Aug 2020 16:12:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727001AbgHJOMf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 10 Aug 2020 10:12:35 -0400
Received: from elvis.franken.de ([193.175.24.41]:42188 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726787AbgHJOMc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 10 Aug 2020 10:12:32 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1k58XO-00012o-01; Mon, 10 Aug 2020 16:12:30 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id F375AC0CC7; Mon, 10 Aug 2020 16:12:19 +0200 (CEST)
Date:   Mon, 10 Aug 2020 16:12:19 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Huacai Chen <chenhc@lemote.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>
Subject: Re: [PATCH V3 1/2] MIPS: Loongson-3: Enable COP2 usage in kernel
Message-ID: <20200810141219.GA2844@alpha.franken.de>
References: <1588395344-5400-1-git-send-email-chenhc@lemote.com>
 <D5AFA61A-5AAC-408C-9B3D-1E0829C9FB13@flygoat.com>
 <CAAhV-H6M-BnBMzFYUom04mdBZhA4+9M3JTUC-dvckTMUeFw9+w@mail.gmail.com>
 <20200805121021.GA12598@alpha.franken.de>
 <1c3cb503-720f-059e-2bac-ae692203c389@flygoat.com>
 <20200807131357.GA11979@alpha.franken.de>
 <410cf75c-4cf5-94d8-fbc9-821d38f8a299@flygoat.com>
 <96dbe0be-7af6-b182-bbe0-534883539812@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96dbe0be-7af6-b182-bbe0-534883539812@flygoat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Aug 09, 2020 at 10:53:13PM +0800, Jiaxun Yang wrote:
> Thus we still need to enable CU2 with exception for user space, and we can
> always enable CU2 in
> kernel since kernel won't be compiled with hard-float. :-)

I see, how about the patch below

Thomas.


diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index 4ddc12e4444a..f7144116b43b 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -389,6 +389,13 @@
 #define ST0_CU3			0x80000000
 #define ST0_XX			0x80000000	/* MIPS IV naming */
 
+/* in-kernel enabled CUs */
+#ifdef CONFIG_CPU_LOONGSOON64
+#define ST0_KERNEL_CUMASK	(ST0_CU0 | ST_CU2)
+#else
+#define ST0_KERNEL_CUMASK	ST0_CU0
+#endif
+
 /*
  * Bitfields and bit numbers in the coprocessor 0 IntCtl register. (MIPSR2)
  */
diff --git a/arch/mips/include/asm/stackframe.h b/arch/mips/include/asm/stackframe.h
index 3e8d2aaf96af..aa430a6c68b2 100644
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
index 7dd234e788e6..61b73580b877 100644
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
index ff5320b79100..90b869297893 100644
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
diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index b95ef98fc847..f4362ac172c6 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -2190,7 +2190,7 @@ static void configure_status(void)
 	 * flag that some firmware may have left set and the TS bit (for
 	 * IP27).  Set XX for ISA IV code to work.
 	 */
-	unsigned int status_set = ST0_CU0;
+	unsigned int status_set = ST0_KERNEL_CUMASK;
 #ifdef CONFIG_64BIT
 	status_set |= ST0_FR|ST0_KX|ST0_SX|ST0_UX;
 #endif

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
