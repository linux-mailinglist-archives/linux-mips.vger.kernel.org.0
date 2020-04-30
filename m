Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 832801BF46F
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2020 11:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgD3Jqt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Apr 2020 05:46:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726378AbgD3Jqs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 30 Apr 2020 05:46:48 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3112C035494
        for <linux-mips@vger.kernel.org>; Thu, 30 Apr 2020 02:46:48 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id fu13so487653pjb.5
        for <linux-mips@vger.kernel.org>; Thu, 30 Apr 2020 02:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=QRQaecUXDcPETvtfYgRKmyA+FzXfMtWchS6xNAT+m1o=;
        b=aauuTE1STawJ6jhxsj8emmzl/WhEYxUVVQKPtMCjACpaB2hYKlgC6m+qFW3qM57ZW+
         K0XBMQqkOJU1PzSlAtfCt8bLX4OnRkkpT303smEJAu4dexUsWrXtHz6lTRvq9leGbN1Z
         ayATj0rwScnw88kyaV8UjBRBI+Kwbz9ag6ghno2ycYE0rvBFkEVQqDdF4xNuxLgQFROg
         QNqC72wE57QuB8Oa6tic2srXeBBj8GgW5U2lUT+arjEMyc65GPYjYPoSLPwbR+EcFV8H
         zBOGHADYY5hTr2nxQbo/YM11mmaO6ldQq1qvHywHc0eFmL8egAfqMiiCjcvItoijxE4B
         MVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=QRQaecUXDcPETvtfYgRKmyA+FzXfMtWchS6xNAT+m1o=;
        b=TgCpCGGNIeujI6JAcSlXJPHm7PDeCD3zTI552jVOwO7EmbZQjQsFXNefqCQLfG9ZMf
         zs7Z/RkB95hi1P+KU3K1y8gMTtmIB2oQqz7p3GpBNFLwNw5nfqeo+BHr+249mzHY+lJi
         NjzpqfKu69DHAZmopF1QEl6x2a+mTmxt4ToD/U0irW3x9OdKelPfiuc4HQk14c+NEN4m
         ZbBCcRI8EPWgZMAnFNP2XzScfmdVmoxUTWL7D4LISOt0bZ+SudX1b8NDA2Z3baWyBXq/
         5JhvwaU3kR/Pw4lISDYHgv1xWotNEDS+AoklJmbgUPLEmq0f/9CzQS47Buc+QxtKFVOA
         rhEA==
X-Gm-Message-State: AGi0PuYruastYGWYTc2cqI2gBaBjgh/Pi1NTLjoqovNGKqKn25R6AeDO
        zjcZPWka4TC6RPZaQciJEZg=
X-Google-Smtp-Source: APiQypIeKUkJbkn303IzAVHymuoONk556KIlzXS6niopptZ+LPmAEZwHzhzGpRKPyUGZUzfCt7OxIQ==
X-Received: by 2002:a17:90a:3450:: with SMTP id o74mr1947440pjb.159.1588240008402;
        Thu, 30 Apr 2020 02:46:48 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id y186sm3031729pfy.66.2020.04.30.02.46.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Apr 2020 02:46:47 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V2 1/2] MIPS: Loongson-3: Enable COP2 usage in kernel
Date:   Thu, 30 Apr 2020 17:46:34 +0800
Message-Id: <1588239995-23104-1-git-send-email-chenhc@lemote.com>
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
 arch/mips/boot/compressed/head.S   |  7 +++++++
 arch/mips/include/asm/mipsregs.h   |  1 +
 arch/mips/include/asm/stackframe.h | 12 +++++++++---
 arch/mips/kernel/head.S            | 18 +++++++++---------
 arch/mips/kernel/r4k_switch.S      |  3 +++
 arch/mips/kernel/traps.c           |  3 +++
 6 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/arch/mips/boot/compressed/head.S b/arch/mips/boot/compressed/head.S
index 409cb48..9824243 100644
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
+	or	t0, ST0_MM
+	mtc0    t0, CP0_STATUS
+#endif
+
 	/* Save boot rom start args */
 	move	s0, a0
 	move	s1, a1
diff --git a/arch/mips/include/asm/mipsregs.h b/arch/mips/include/asm/mipsregs.h
index 796fe47..57d7838 100644
--- a/arch/mips/include/asm/mipsregs.h
+++ b/arch/mips/include/asm/mipsregs.h
@@ -386,6 +386,7 @@
 #define ST0_CU1			0x20000000
 #define ST0_CU2			0x40000000
 #define ST0_CU3			0x80000000
+#define ST0_MM			0x40000000	/* Loongson-3 naming */
 #define ST0_XX			0x80000000	/* MIPS IV naming */
 
 /*
diff --git a/arch/mips/include/asm/stackframe.h b/arch/mips/include/asm/stackframe.h
index 4d6ad90..7c05a06 100644
--- a/arch/mips/include/asm/stackframe.h
+++ b/arch/mips/include/asm/stackframe.h
@@ -42,6 +42,12 @@
 	cfi_restore \reg \offset \docfi
 	.endm
 
+#ifdef CONFIG_CPU_LOONGSON64
+#define ST0_CUMASK (ST0_CU0 | ST0_CU2)
+#else
+#define ST0_CUMASK ST0_CU0
+#endif
+
 #if defined(CONFIG_CPU_R3000) || defined(CONFIG_CPU_TX39XX)
 #define STATMASK 0x3f
 #else
@@ -450,7 +456,7 @@
  */
 		.macro	CLI
 		mfc0	t0, CP0_STATUS
-		li	t1, ST0_CU0 | STATMASK
+		li	t1, ST0_CUMASK | STATMASK
 		or	t0, t1
 		xori	t0, STATMASK
 		mtc0	t0, CP0_STATUS
@@ -463,7 +469,7 @@
  */
 		.macro	STI
 		mfc0	t0, CP0_STATUS
-		li	t1, ST0_CU0 | STATMASK
+		li	t1, ST0_CUMASK | STATMASK
 		or	t0, t1
 		xori	t0, STATMASK & ~1
 		mtc0	t0, CP0_STATUS
@@ -477,7 +483,7 @@
  */
 		.macro	KMODE
 		mfc0	t0, CP0_STATUS
-		li	t1, ST0_CU0 | (STATMASK & ~1)
+		li	t1, ST0_CUMASK | (STATMASK & ~1)
 #if defined(CONFIG_CPU_R3000) || defined(CONFIG_CPU_TX39XX)
 		andi	t2, t0, ST0_IEP
 		srl	t2, 2
diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
index 3b02ffe..af88da1 100644
--- a/arch/mips/kernel/head.S
+++ b/arch/mips/kernel/head.S
@@ -43,20 +43,20 @@
 	.set	pop
 	.endm
 
-	.macro	setup_c0_status_pri
-#ifdef CONFIG_64BIT
-	setup_c0_status ST0_KX 0
+#ifdef CONFIG_CPU_LOONGSON64
+#define ST0_SET ST0_KX | ST0_MM
+#elif defined(CONFIG_64BIT)
+#define ST0_SET ST0_KX
 #else
-	setup_c0_status 0 0
+#define ST0_SET 0
 #endif
+
+	.macro	setup_c0_status_pri
+	setup_c0_status ST0_SET 0
 	.endm
 
 	.macro	setup_c0_status_sec
-#ifdef CONFIG_64BIT
-	setup_c0_status ST0_KX ST0_BEV
-#else
-	setup_c0_status 0 ST0_BEV
-#endif
+	setup_c0_status ST0_SET ST0_BEV
 	.endm
 
 #ifndef CONFIG_NO_EXCEPT_FILL
diff --git a/arch/mips/kernel/r4k_switch.S b/arch/mips/kernel/r4k_switch.S
index 58232ae..62e8413 100644
--- a/arch/mips/kernel/r4k_switch.S
+++ b/arch/mips/kernel/r4k_switch.S
@@ -53,6 +53,9 @@
 	nor	a3, $0, a3
 	and	a2, a3
 	or	a2, t1
+#ifdef CONFIG_CPU_LOONGSON64
+	or	a2, ST0_MM
+#endif
 	mtc0	a2, CP0_STATUS
 	move	v0, a0
 	jr	ra
diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 31968cb..b76b6e4 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -2114,6 +2114,9 @@ static void configure_status(void)
 #ifdef CONFIG_64BIT
 	status_set |= ST0_FR|ST0_KX|ST0_SX|ST0_UX;
 #endif
+#ifdef CONFIG_CPU_LOONGSON64
+	status_set |= ST0_MM;
+#endif
 	if (current_cpu_data.isa_level & MIPS_CPU_ISA_IV)
 		status_set |= ST0_XX;
 	if (cpu_has_dsp)
-- 
2.7.0

