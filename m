Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF82A1BD872
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2020 11:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbgD2Jix (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Apr 2020 05:38:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726620AbgD2Jiw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Apr 2020 05:38:52 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DB11C03C1AD
        for <linux-mips@vger.kernel.org>; Wed, 29 Apr 2020 02:38:52 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id h12so2173256pjz.1
        for <linux-mips@vger.kernel.org>; Wed, 29 Apr 2020 02:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id;
        bh=u/rfhRPQOCX0W0m3TNZ5JYDpXq2ur9PNnnbOehRDR1o=;
        b=dmqAgNv7tI0RlOXw4wyl5ZlGKZVdFvvmqX0MyRRX/UjDwKEEZ1ZAdfvx2WGCcXbFZ+
         Z1zFJZKHauVbWWVFjuwfnQQf459wO7eVy+mzzZNi4yeVlOs+rdzXN93tVYVe69BOtqf1
         eFW8nAguEhAsaDTCTuAIJ+nunhPfuOuL7B+iyLP8dxtQCAj1UK3ucDXaV2p+c6+ISafJ
         dmCI5A9750peQClDqhWh34FjhPaQ7OPDoBvhLXOnWZCzjscu410pWPS5mc+9LTxz1jiR
         trvqpAFtqg5KodiUrolB0yD5vev6Xsa8ICU/C0EyywuWgGP/MZ0bQa78J3/ZNfHuGvRr
         4i5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
        bh=u/rfhRPQOCX0W0m3TNZ5JYDpXq2ur9PNnnbOehRDR1o=;
        b=HcEw49mSuXrk66PqOO2Km8a1Z7Y6uZySxfdZfgnIUs1Ikw8v2ScaFQZWGkd9bUlPJz
         Wx2lMAZHLDRFPP8+bZKwH4zhe8HMwTaBo04xOOvxUEt/MKVoqWPc2bb5K3bSA42bYUHg
         H8GnY9WCnMnmCUbX4l94LGQpeqizA6+yJMIOLS3PDIYyAxSKT9vagr88Vx9Hd5/i8ST5
         MgPZxHIfigJLhQS2eREdWDVXFWYHbGUwPy04I4cpy+Ti9oNr6pHoZjwvNlIYMNJGKYLw
         Lbk0YKIgnXqQBxdHGcs8WHG1TMjr9T/rRX7aWguElz1tWpjWlHVWoMZprRq8fK7FK3zX
         nRgw==
X-Gm-Message-State: AGi0PuZEwc1K1iHbOTvVFUa9yzGZHogj4jJlNMZA3Qf52q+oK28c+KTJ
        KpPcqWb4R7as9P4bFO6nPcE=
X-Google-Smtp-Source: APiQypKo/ceXem+sV4EjXByF6BFOimymS3FlfLsFqaXRnnPIpU2Qu+Lqd5iiW+nQIMDB7Q13YtJgvw==
X-Received: by 2002:a17:902:b78c:: with SMTP id e12mr33547010pls.88.1588153132046;
        Wed, 29 Apr 2020 02:38:52 -0700 (PDT)
Received: from software.domain.org (28.144.92.34.bc.googleusercontent.com. [34.92.144.28])
        by smtp.gmail.com with ESMTPSA id v133sm709251pfc.113.2020.04.29.02.38.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Apr 2020 02:38:51 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>, chenj <chenj@lemote.com>
Subject: [PATCH 1/2] MIPS: Loongson-3: Enable COP2 usage in kernel
Date:   Wed, 29 Apr 2020 17:38:40 +0800
Message-Id: <1588153121-28507-1-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: chenj <chenj@lemote.com>

Loongson-3's COP2 is Multi-Media coprocessor, it is disabled in kernel
mode by default. However, gslq/gssq (16-bytes load/store instructions)
overrides the instruction format of lwc2/swc2. If we wan't to use gslq/
gssq for optimization in kernel, we should enable COP2 usage in kernel.
---
 arch/mips/boot/compressed/head.S   |  7 +++++++
 arch/mips/include/asm/mipsregs.h   |  1 +
 arch/mips/include/asm/stackframe.h | 12 ++++++++++++
 arch/mips/kernel/head.S            | 16 ++++++++++++++++
 arch/mips/kernel/r4k_switch.S      |  3 +++
 arch/mips/kernel/traps.c           |  3 +++
 6 files changed, 42 insertions(+)

diff --git a/arch/mips/boot/compressed/head.S b/arch/mips/boot/compressed/head.S
index 409cb48..855ca8c 100644
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
index ce40fbf..0f71540 100644
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
index 4d6ad90..c204850 100644
--- a/arch/mips/include/asm/stackframe.h
+++ b/arch/mips/include/asm/stackframe.h
@@ -450,7 +450,11 @@
  */
 		.macro	CLI
 		mfc0	t0, CP0_STATUS
+#ifdef CONFIG_CPU_LOONGSON64
+		li	t1, ST0_CU0 | ST0_MM | STATMASK
+#else
 		li	t1, ST0_CU0 | STATMASK
+#endif
 		or	t0, t1
 		xori	t0, STATMASK
 		mtc0	t0, CP0_STATUS
@@ -463,7 +467,11 @@
  */
 		.macro	STI
 		mfc0	t0, CP0_STATUS
+#ifdef CONFIG_CPU_LOONGSON64
+		li	t1, ST0_CU0 | ST0_MM | STATMASK
+#else
 		li	t1, ST0_CU0 | STATMASK
+#endif
 		or	t0, t1
 		xori	t0, STATMASK & ~1
 		mtc0	t0, CP0_STATUS
@@ -477,7 +485,11 @@
  */
 		.macro	KMODE
 		mfc0	t0, CP0_STATUS
+#ifdef CONFIG_CPU_LOONGSON64
+		li	t1, ST0_CU0 | ST0_MM | (STATMASK & ~1)
+#else
 		li	t1, ST0_CU0 | (STATMASK & ~1)
+#endif
 #if defined(CONFIG_CPU_R3000) || defined(CONFIG_CPU_TX39XX)
 		andi	t2, t0, ST0_IEP
 		srl	t2, 2
diff --git a/arch/mips/kernel/head.S b/arch/mips/kernel/head.S
index 3b02ffe..cdac82d 100644
--- a/arch/mips/kernel/head.S
+++ b/arch/mips/kernel/head.S
@@ -45,18 +45,34 @@
 
 	.macro	setup_c0_status_pri
 #ifdef CONFIG_64BIT
+#ifdef CONFIG_CPU_LOONGSON64
+	setup_c0_status ST0_KX|ST0_MM 0
+#else
 	setup_c0_status ST0_KX 0
+#endif
+#else
+#ifdef CONFIG_CPU_LOONGSON64
+	setup_c0_status ST0_MM 0
 #else
 	setup_c0_status 0 0
 #endif
+#endif
 	.endm
 
 	.macro	setup_c0_status_sec
 #ifdef CONFIG_64BIT
+#ifdef CONFIG_CPU_LOONGSON64
+	setup_c0_status ST0_KX|ST0_MM ST0_BEV
+#else
 	setup_c0_status ST0_KX ST0_BEV
+#endif
+#else
+#ifdef CONFIG_CPU_LOONGSON64
+	setup_c0_status ST0_MM ST0_BEV
 #else
 	setup_c0_status 0 ST0_BEV
 #endif
+#endif
 	.endm
 
 #ifndef CONFIG_NO_EXCEPT_FILL
diff --git a/arch/mips/kernel/r4k_switch.S b/arch/mips/kernel/r4k_switch.S
index 58232ae..154ae7d 100644
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
index 31968cb..1731436 100644
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

