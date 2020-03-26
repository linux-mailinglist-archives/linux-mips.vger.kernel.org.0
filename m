Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64C63193875
	for <lists+linux-mips@lfdr.de>; Thu, 26 Mar 2020 07:18:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbgCZGS2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 26 Mar 2020 02:18:28 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17981 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726346AbgCZGS1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Thu, 26 Mar 2020 02:18:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585203481;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=gGd3RxAxyUkb4OJvY+SCCfsP9WVGN6zphOE5v3hmzUk=;
        b=Ps1UAMS/fyZXD3PGV7o5nOk3/k8/dgxOfZPHFVbg9783hxnTPJKUf0hQ7l9OYShD
        m2NTU1XJ/TmP0IAKwWGJh8isB+Afad1Jcp6r93TSifCwrn/RTbQA4F5rgkdPgsod6if
        0rVe/hEBUO6TBHk8oi4zQDVR1lxRHYxeYx3Iaz64=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1585203479196345.30714156357374; Thu, 26 Mar 2020 14:17:59 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, maz@kernel.org, chenhc@lemote.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <20200326061704.387483-5-jiaxun.yang@flygoat.com>
Subject: [PATCH 2/2] MIPS: Kill RM7K & RM9K IRQ Code
Date:   Thu, 26 Mar 2020 14:17:00 +0800
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200326061704.387483-1-jiaxun.yang@flygoat.com>
References: <20200326061704.387483-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

RM7000 IRQ driver never got really used by any of the platform,
and rm9k_cpu_irq_init only exist in a header.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig                        |  3 --
 arch/mips/include/asm/irq_cpu.h          |  2 --
 arch/mips/include/asm/mach-generic/irq.h |  6 ----
 arch/mips/kernel/Makefile                |  1 -
 arch/mips/kernel/irq-rm7000.c            | 45 ------------------------
 5 files changed, 57 deletions(-)
 delete mode 100644 arch/mips/kernel/irq-rm7000.c

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index a1f973cc0265..7cda047766bd 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1309,9 +1309,6 @@ config SYS_SUPPORTS_HUGETLBFS
 config MIPS_HUGE_TLB_SUPPORT
 =09def_bool HUGETLB_PAGE || TRANSPARENT_HUGEPAGE
=20
-config IRQ_CPU_RM7K
-=09bool
-
 config IRQ_MSP_SLP
 =09bool
=20
diff --git a/arch/mips/include/asm/irq_cpu.h b/arch/mips/include/asm/irq_cp=
u.h
index 8d321180b5c2..83d7331ab215 100644
--- a/arch/mips/include/asm/irq_cpu.h
+++ b/arch/mips/include/asm/irq_cpu.h
@@ -10,8 +10,6 @@
 #define _ASM_IRQ_CPU_H
=20
 extern void mips_cpu_irq_init(void);
-extern void rm7k_cpu_irq_init(void);
-extern void rm9k_cpu_irq_init(void);
=20
 #ifdef CONFIG_IRQ_DOMAIN
 struct device_node;
diff --git a/arch/mips/include/asm/mach-generic/irq.h b/arch/mips/include/a=
sm/mach-generic/irq.h
index 72ac2c202c55..ac711b0d6225 100644
--- a/arch/mips/include/asm/mach-generic/irq.h
+++ b/arch/mips/include/asm/mach-generic/irq.h
@@ -28,12 +28,6 @@
 #endif /* CONFIG_I8259 */
 #endif
=20
-#ifdef CONFIG_IRQ_CPU_RM7K
-#ifndef RM7K_CPU_IRQ_BASE
-#define RM7K_CPU_IRQ_BASE (MIPS_CPU_IRQ_BASE+8)
-#endif
-#endif
-
 #endif /* CONFIG_IRQ_MIPS_CPU */
=20
 #endif /* __ASM_MACH_GENERIC_IRQ_H */
diff --git a/arch/mips/kernel/Makefile b/arch/mips/kernel/Makefile
index d6e97df51cfb..c0a7e3f266e1 100644
--- a/arch/mips/kernel/Makefile
+++ b/arch/mips/kernel/Makefile
@@ -64,7 +64,6 @@ obj-$(CONFIG_MIPS_VPE_APSP_API) +=3D rtlx.o
 obj-$(CONFIG_MIPS_VPE_APSP_API_CMP) +=3D rtlx-cmp.o
 obj-$(CONFIG_MIPS_VPE_APSP_API_MT) +=3D rtlx-mt.o
=20
-obj-$(CONFIG_IRQ_CPU_RM7K)=09+=3D irq-rm7000.o
 obj-$(CONFIG_MIPS_MSC)=09=09+=3D irq-msc01.o
 obj-$(CONFIG_IRQ_TXX9)=09=09+=3D irq_txx9.o
 obj-$(CONFIG_IRQ_GT641XX)=09+=3D irq-gt641xx.o
diff --git a/arch/mips/kernel/irq-rm7000.c b/arch/mips/kernel/irq-rm7000.c
deleted file mode 100644
index e1a497f639d7..000000000000
--- a/arch/mips/kernel/irq-rm7000.c
+++ /dev/null
@@ -1,45 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (C) 2003 Ralf Baechle
- *
- * Handler for RM7000 extended interrupts.  These are a non-standard
- * feature so we handle them separately from standard interrupts.
- */
-#include <linux/init.h>
-#include <linux/interrupt.h>
-#include <linux/irq.h>
-#include <linux/kernel.h>
-
-#include <asm/irq_cpu.h>
-#include <asm/mipsregs.h>
-
-static inline void unmask_rm7k_irq(struct irq_data *d)
-{
-=09set_c0_intcontrol(0x100 << (d->irq - RM7K_CPU_IRQ_BASE));
-}
-
-static inline void mask_rm7k_irq(struct irq_data *d)
-{
-=09clear_c0_intcontrol(0x100 << (d->irq - RM7K_CPU_IRQ_BASE));
-}
-
-static struct irq_chip rm7k_irq_controller =3D {
-=09.name =3D "RM7000",
-=09.irq_ack =3D mask_rm7k_irq,
-=09.irq_mask =3D mask_rm7k_irq,
-=09.irq_mask_ack =3D mask_rm7k_irq,
-=09.irq_unmask =3D unmask_rm7k_irq,
-=09.irq_eoi =3D unmask_rm7k_irq
-};
-
-void __init rm7k_cpu_irq_init(void)
-{
-=09int base =3D RM7K_CPU_IRQ_BASE;
-=09int i;
-
-=09clear_c0_intcontrol(0x00000f00);=09=09/* Mask all */
-
-=09for (i =3D base; i < base + 4; i++)
-=09=09irq_set_chip_and_handler(i, &rm7k_irq_controller,
-=09=09=09=09=09 handle_percpu_irq);
-}
--=20
2.26.0.rc2


