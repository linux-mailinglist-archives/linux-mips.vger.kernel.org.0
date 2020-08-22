Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4453624E635
	for <lists+linux-mips@lfdr.de>; Sat, 22 Aug 2020 10:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbgHVIDD (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 22 Aug 2020 04:03:03 -0400
Received: from mx2.suse.de ([195.135.220.15]:34720 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727103AbgHVIDD (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 22 Aug 2020 04:03:03 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 091FFAC79;
        Sat, 22 Aug 2020 08:03:29 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Paravirt: remove remaining pieces of paravirt
Date:   Sat, 22 Aug 2020 10:02:51 +0200
Message-Id: <20200822080251.65555-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.16.4
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit 35546aeede8e ("MIPS: Retire kvm paravirt") removed
kvm paravirt support, but missed arch/mips/include/mach-paravirt.
Remove it as well.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 .../asm/mach-paravirt/cpu-feature-overrides.h      | 35 ---------------
 arch/mips/include/asm/mach-paravirt/irq.h          | 19 --------
 .../include/asm/mach-paravirt/kernel-entry-init.h  | 52 ----------------------
 3 files changed, 106 deletions(-)
 delete mode 100644 arch/mips/include/asm/mach-paravirt/cpu-feature-overrides.h
 delete mode 100644 arch/mips/include/asm/mach-paravirt/irq.h
 delete mode 100644 arch/mips/include/asm/mach-paravirt/kernel-entry-init.h

diff --git a/arch/mips/include/asm/mach-paravirt/cpu-feature-overrides.h b/arch/mips/include/asm/mach-paravirt/cpu-feature-overrides.h
deleted file mode 100644
index 23ecf816daa7..000000000000
--- a/arch/mips/include/asm/mach-paravirt/cpu-feature-overrides.h
+++ /dev/null
@@ -1,35 +0,0 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 2013 Cavium, Inc.
- */
-#ifndef __ASM_MACH_PARAVIRT_CPU_FEATURE_OVERRIDES_H
-#define __ASM_MACH_PARAVIRT_CPU_FEATURE_OVERRIDES_H
-
-#define cpu_has_4kex		1
-#define cpu_has_3k_cache	0
-#define cpu_has_tx39_cache	0
-#define cpu_has_counter		1
-#define cpu_has_llsc		1
-/*
- * We Disable LL/SC on non SMP systems as it is faster to disable
- * interrupts for atomic access than a LL/SC.
- */
-#ifdef CONFIG_SMP
-# define kernel_uses_llsc	1
-#else
-# define kernel_uses_llsc	0
-#endif
-
-#ifdef CONFIG_CPU_CAVIUM_OCTEON
-#define cpu_dcache_line_size()	128
-#define cpu_icache_line_size()	128
-#define cpu_has_octeon_cache	1
-#define cpu_has_4k_cache	0
-#else
-#define cpu_has_4k_cache	1
-#endif
-
-#endif /* __ASM_MACH_PARAVIRT_CPU_FEATURE_OVERRIDES_H */
diff --git a/arch/mips/include/asm/mach-paravirt/irq.h b/arch/mips/include/asm/mach-paravirt/irq.h
deleted file mode 100644
index 9b4d35eca977..000000000000
--- a/arch/mips/include/asm/mach-paravirt/irq.h
+++ /dev/null
@@ -1,19 +0,0 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 2013 Cavium, Inc.
- */
-#ifndef __ASM_MACH_PARAVIRT_IRQ_H__
-#define  __ASM_MACH_PARAVIRT_IRQ_H__
-
-#define NR_IRQS 64
-#define MIPS_CPU_IRQ_BASE 1
-
-#define MIPS_IRQ_PCIA (MIPS_CPU_IRQ_BASE + 8)
-
-#define MIPS_IRQ_MBOX0 (MIPS_CPU_IRQ_BASE + 32)
-#define MIPS_IRQ_MBOX1 (MIPS_CPU_IRQ_BASE + 33)
-
-#endif /* __ASM_MACH_PARAVIRT_IRQ_H__ */
diff --git a/arch/mips/include/asm/mach-paravirt/kernel-entry-init.h b/arch/mips/include/asm/mach-paravirt/kernel-entry-init.h
deleted file mode 100644
index c9f5769dfc8f..000000000000
--- a/arch/mips/include/asm/mach-paravirt/kernel-entry-init.h
+++ /dev/null
@@ -1,52 +0,0 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 2013 Cavium, Inc
- */
-#ifndef __ASM_MACH_PARAVIRT_KERNEL_ENTRY_H
-#define __ASM_MACH_PARAVIRT_KERNEL_ENTRY_H
-
-#define CP0_EBASE $15, 1
-
-	.macro  kernel_entry_setup
-#ifdef CONFIG_SMP
-	mfc0	t0, CP0_EBASE
-	andi	t0, t0, 0x3ff		# CPUNum
-	beqz	t0, 1f
-	# CPUs other than zero goto smp_bootstrap
-	j	smp_bootstrap
-#endif /* CONFIG_SMP */
-
-1:
-	.endm
-
-/*
- * Do SMP slave processor setup necessary before we can safely execute
- * C code.
- */
-	.macro  smp_slave_setup
-	mfc0	t0, CP0_EBASE
-	andi	t0, t0, 0x3ff		# CPUNum
-	slti	t1, t0, NR_CPUS
-	bnez	t1, 1f
-2:
-	di
-	wait
-	b	2b			# Unknown CPU, loop forever.
-1:
-	PTR_LA	t1, paravirt_smp_sp
-	PTR_SLL	t0, PTR_SCALESHIFT
-	PTR_ADDU t1, t1, t0
-3:
-	PTR_L	sp, 0(t1)
-	beqz	sp, 3b			# Spin until told to proceed.
-
-	PTR_LA	t1, paravirt_smp_gp
-	PTR_ADDU t1, t1, t0
-	sync
-	PTR_L	gp, 0(t1)
-	.endm
-
-#endif /* __ASM_MACH_PARAVIRT_KERNEL_ENTRY_H */
-- 
2.16.4

