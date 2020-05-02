Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2C741C231E
	for <lists+linux-mips@lfdr.de>; Sat,  2 May 2020 06:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbgEBEzs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 2 May 2020 00:55:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726058AbgEBEzs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 2 May 2020 00:55:48 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA399C061A0C
        for <linux-mips@vger.kernel.org>; Fri,  1 May 2020 21:55:47 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id n16so5557351pgb.7
        for <linux-mips@vger.kernel.org>; Fri, 01 May 2020 21:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=vvFWEoiFYRMjBRfd1TEgJVtNRjVgQhJBIQzP+gLviEk=;
        b=VNIUouwTaY+DlYHgZTufw1TcaIp+yWxIOHR0B8z3PRZVblwo+BNHQWIcuHyhii7wa2
         ikWjn397c9GrLmhGDv01Fdk+wz0S+KT8Sglm2AJSalPKGl6kgObMzZJzFCgcUGeO4Uwf
         FS4hGgRdzSbGXvwoi6f5Gi9Ethn4X7OTnKHxXTP1597mJmb3yX93mHawxrDX+DPnV5DE
         ujyM7ANKOL1wyOoWb4XYBLfszR8Wz4+if1sw/pi13IenSax0QgMHk2WGyA1PEtkAWwbf
         fXseRckshM6eNjhk0NRUeZrYcayNWzz96ILheulpisqnSy+fU6pAcyPQYjDIGU1Lzmrm
         pTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=vvFWEoiFYRMjBRfd1TEgJVtNRjVgQhJBIQzP+gLviEk=;
        b=pX6I4mRp1EXY6WkAXjnFguV9FOe+hxKBvgZvkFNItz7WcwdCg0oUdw6Ys8bA7O19cp
         Ca2d5Cr/eMTugQmbc0BNwpTgflPQi0XxDuhO324itxMPinLeeDS1qodovpjSVnGTX2ff
         4VXKW3nWtFAdQ9eWd7AZgq2PqmDAhgNV8hi5XvCXqvAd014FGjbsdEpkN7TJJhJIgIf3
         BqqV3EPRcgp0vRFPugJn26vdtIWpD2OEGNysBAYofWuhO2rXizogqINMAgoy3DJzWw0j
         GSvPbFcxEo8wLSEp3UXXF225gfiz12fKQZAlEELrGRUdg9TjPN7e4MbxKlS81hQ9uQz8
         Nl+g==
X-Gm-Message-State: AGi0PuZBK8sEYtF3RERzJcRBvurTgVNwPj3dcTU7SRdseNPsumrzz8OI
        JTJ2mxwibtj0Li3vleZkFOVrB/KgUQc=
X-Google-Smtp-Source: APiQypI5JCFT230Omc2+il06JD2jzBCLcjXtndiCToPqsBYwZ8MwWCXfgiQAEgXPdziWTLthnoh60Q==
X-Received: by 2002:a62:e110:: with SMTP id q16mr6726369pfh.99.1588395347504;
        Fri, 01 May 2020 21:55:47 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id b1sm3555402pfi.140.2020.05.01.21.55.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 01 May 2020 21:55:46 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V3 1/2] MIPS: Loongson-3: Enable COP2 usage in kernel
Date:   Sat,  2 May 2020 12:55:43 +0800
Message-Id: <1588395344-5400-1-git-send-email-chenhc@lemote.com>
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

 arch/mips/boot/compressed/head.S   |  7 +++++++
 arch/mips/include/asm/stackframe.h | 12 +++++++++---
 arch/mips/kernel/head.S            | 18 +++++++++---------
 arch/mips/kernel/r4k_switch.S      |  3 +++
 arch/mips/kernel/traps.c           |  8 +++++++-
 5 files changed, 35 insertions(+), 13 deletions(-)

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
diff --git a/arch/mips/include/asm/stackframe.h b/arch/mips/include/asm/stackframe.h
index 4d6ad90..c9ee7de 100644
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
index 3b02ffe..bca6399 100644
--- a/arch/mips/kernel/head.S
+++ b/arch/mips/kernel/head.S
@@ -43,20 +43,20 @@
 	.set	pop
 	.endm
 
-	.macro	setup_c0_status_pri
-#ifdef CONFIG_64BIT
-	setup_c0_status ST0_KX 0
+#ifdef CONFIG_CPU_LOONGSON64
+#define ST0_SET ST0_KX | ST0_CU2
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
index 31968cb..5efc525 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -2108,9 +2108,15 @@ static void configure_status(void)
 	 * Disable coprocessors and select 32-bit or 64-bit addressing
 	 * and the 16/32 or 32/32 FPR register model.  Reset the BEV
 	 * flag that some firmware may have left set and the TS bit (for
-	 * IP27).  Set XX for ISA IV code to work.
+	 * IP27). Set XX for ISA IV code to work, and enable CU2 for
+	 * Loongson-3 to make 16-bytes load/store instructions usable.
 	 */
+#ifndef CONFIG_CPU_LOONGSON64
 	unsigned int status_set = ST0_CU0;
+#else
+	unsigned int status_set = ST0_CU0 | ST0_CU2;
+#endif
+
 #ifdef CONFIG_64BIT
 	status_set |= ST0_FR|ST0_KX|ST0_SX|ST0_UX;
 #endif
-- 
2.7.0

