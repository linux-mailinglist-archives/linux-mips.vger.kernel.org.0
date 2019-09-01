Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B4DFA4A2A
	for <lists+linux-mips@lfdr.de>; Sun,  1 Sep 2019 17:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729172AbfIAPsW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 1 Sep 2019 11:48:22 -0400
Received: from pio-pvt-msa2.bahnhof.se ([79.136.2.41]:57476 "EHLO
        pio-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729151AbfIAPsW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 1 Sep 2019 11:48:22 -0400
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 10373402D7
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:38:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.899
X-Spam-Level: 
X-Spam-Status: No, score=-1.899 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, URIBL_BLOCKED=0.001]
        autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 9DN2j69RFKgk for <linux-mips@vger.kernel.org>;
        Sun,  1 Sep 2019 17:38:45 +0200 (CEST)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 41CE63FBF6
        for <linux-mips@vger.kernel.org>; Sun,  1 Sep 2019 17:38:45 +0200 (CEST)
Date:   Sun, 1 Sep 2019 17:38:44 +0200
From:   Fredrik Noring <noring@nocrew.org>
To:     linux-mips@vger.kernel.org
Subject: [PATCH 006/120] MIPS: R5900: Workaround for the short loop bug
Message-ID: <d59a6bef6541d35d4460b966c0fe651aac507730.1567326213.git.noring@nocrew.org>
References: <cover.1567326213.git.noring@nocrew.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cover.1567326213.git.noring@nocrew.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The short loop bug under certain conditions causes loops to execute
only once or twice. The Gnu assembler (GAS) has the following note
about it:

    On the R5900 short loops need to be fixed by inserting a NOP in the
    branch delay slot.

    The short loop bug under certain conditions causes loops to execute
    only once or twice. We must ensure that the assembler never
    generates loops that satisfy all of the following conditions:

    - a loop consists of less than or equal to six instructions
      (including the branch delay slot);
    - a loop contains only one conditional branch instruction at the
      end of the loop;
    - a loop does not contain any other branch or jump instructions;
    - a branch delay slot of the loop is not NOP (EE 2.9 or later).

    We need to do this because of a hardware bug in the R5900 chip.

GAS handles the short loop bug in most cases. However, GAS is unable
to adjust machine code having the noreorder directive, as used by the
kernel on several occasions.

The short loop bug also affects user space code, which is why generic
MIPS code cannot execute unadjusted on the R5900. The GAS and GCC option
-mfix-r5900 is recommended for such cases.

Signed-off-by: Fredrik Noring <noring@nocrew.org>
---
 arch/mips/boot/compressed/head.S |  7 +++---
 arch/mips/include/asm/asmmacro.h | 41 ++++++++++++++++++++++++++++++++
 arch/mips/include/asm/string.h   |  3 +++
 arch/mips/lib/delay.c            |  7 +++---
 arch/mips/lib/memset.S           |  2 ++
 5 files changed, 52 insertions(+), 8 deletions(-)

diff --git a/arch/mips/boot/compressed/head.S b/arch/mips/boot/compressed/head.S
index 409cb483a9ff..e3dc831e2616 100644
--- a/arch/mips/boot/compressed/head.S
+++ b/arch/mips/boot/compressed/head.S
@@ -15,7 +15,6 @@
 #include <asm/asm.h>
 #include <asm/regdef.h>
 
-	.set noreorder
 	.cprestore
 	LEAF(start)
 start:
@@ -26,11 +25,11 @@ start:
 	move	s3, a3
 
 	/* Clear BSS */
-	PTR_LA	a0, _edata
+	PTR_LA	a0, _edata - 4
 	PTR_LA	a2, _end
-1:	sw	zero, 0(a0)
+1:	addiu	a0, a0, 4
+	sw	zero, 0(a0)
 	bne	a2, a0, 1b
-	 addiu	a0, a0, 4
 
 	PTR_LA	a0, (.heap)	     /* heap address */
 	PTR_LA	sp, (.stack + 8192)  /* stack address */
diff --git a/arch/mips/include/asm/asmmacro.h b/arch/mips/include/asm/asmmacro.h
index feb069cbf44e..aa58474c739f 100644
--- a/arch/mips/include/asm/asmmacro.h
+++ b/arch/mips/include/asm/asmmacro.h
@@ -654,4 +654,45 @@
 	.set	pop
 	.endm
 
+#ifdef CONFIG_CPU_R5900
+/*
+ * Workaround for the R5900 short loop bug
+ *
+ * The short loop bug under certain conditions causes loops to execute only
+ * once or twice. The Gnu assembler (GAS) has the following note about it:
+ *
+ *     On the R5900 short loops need to be fixed by inserting a NOP in the
+ *     branch delay slot.
+ *
+ *     The short loop bug under certain conditions causes loops to execute
+ *     only once or twice. We must ensure that the assembler never
+ *     generates loops that satisfy all of the following conditions:
+ *
+ *     - a loop consists of less than or equal to six instructions
+ *       (including the branch delay slot);
+ *     - a loop contains only one conditional branch instruction at the
+ *       end of the loop;
+ *     - a loop does not contain any other branch or jump instructions;
+ *     - a branch delay slot of the loop is not NOP (EE 2.9 or later).
+ *
+ *     We need to do this because of a hardware bug in the R5900 chip.
+ *
+ * GAS handles the short loop bug in most cases. However, GAS is unable to
+ * adjust machine code having the noreorder directive, as used by the kernel
+ * on several occasions. The short_loop_war macro defined here can be used
+ * to insert necessary NOPs by placing it just before the jump instruction.
+ */
+	.macro	short_loop_war loop_target
+	.set	instruction_count,2 + (. - \loop_target) / 4
+	.ifgt	7 - instruction_count
+	.rept	7 - instruction_count
+	nop
+	.endr
+	.endif
+	.endm
+#else
+	.macro	short_loop_war loop_target
+	.endm
+#endif
+
 #endif /* _ASM_ASMMACRO_H */
diff --git a/arch/mips/include/asm/string.h b/arch/mips/include/asm/string.h
index 29030cb398ee..35c9dc3815f4 100644
--- a/arch/mips/include/asm/string.h
+++ b/arch/mips/include/asm/string.h
@@ -10,6 +10,9 @@
 #ifndef _ASM_STRING_H
 #define _ASM_STRING_H
 
+#if defined(CONFIG_CPU_R5900)
+#define IN_STRING_C
+#endif
 
 /*
  * Most of the inline functions are rather naive implementations so I just
diff --git a/arch/mips/lib/delay.c b/arch/mips/lib/delay.c
index 68c495ed71e3..0b370b831708 100644
--- a/arch/mips/lib/delay.c
+++ b/arch/mips/lib/delay.c
@@ -27,11 +27,10 @@
 void __delay(unsigned long loops)
 {
 	__asm__ __volatile__ (
-	"	.set	noreorder				\n"
 	"	.align	3					\n"
-	"1:	bnez	%0, 1b					\n"
-	"	 " __stringify(LONG_SUBU) "	%0, %1		\n"
-	"	.set	reorder					\n"
+	"	" __stringify(LONG_ADDU) "	%0, %1		\n"
+	"1:	" __stringify(LONG_SUBU) "	%0, %1		\n"
+	"	bnez	%0, 1b					\n"
 	: "=r" (loops)
 	: GCC_DADDI_IMM_ASM() (1), "0" (loops));
 }
diff --git a/arch/mips/lib/memset.S b/arch/mips/lib/memset.S
index 418611ef13cf..70db395159f1 100644
--- a/arch/mips/lib/memset.S
+++ b/arch/mips/lib/memset.S
@@ -9,6 +9,7 @@
  * Copyright (C) 2011, 2012 MIPS Technologies, Inc.
  */
 #include <asm/asm.h>
+#include <asm/asmmacro.h>
 #include <asm/asm-offsets.h>
 #include <asm/export.h>
 #include <asm/regdef.h>
@@ -222,6 +223,7 @@
 1:	PTR_ADDIU	a0, 1			/* fill bytewise */
 	R10KCBARRIER(0(ra))
 	.set		noreorder
+	short_loop_war(1b)
 	bne		t1, a0, 1b
 	 EX(sb, a1, -1(a0), .Lsmall_fixup\@)
 	.set		reorder
-- 
2.21.0

