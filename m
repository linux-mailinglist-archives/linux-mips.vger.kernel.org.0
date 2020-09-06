Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3142B25F036
	for <lists+linux-mips@lfdr.de>; Sun,  6 Sep 2020 21:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbgIFTbe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 6 Sep 2020 15:31:34 -0400
Received: from crapouillou.net ([89.234.176.41]:36050 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726063AbgIFTbd (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 6 Sep 2020 15:31:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1599420597; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/cPaq6OOhUYjFsmDjXU2CSlSg6qf83UC/Fmqp/j1WCw=;
        b=xz4j9otBzfSToFA1b+uA+VVFzB4h/BFnz4IjDnHQiC5Hwr/Bouj0C8av4BPt6W5OpvZTJz
        fWI2ayBX41wpaAtftYAdhYFRYwO1cQ6RGH9+3ZRaZFTZNEmX4HW/PzIRlm6a9N3Iwwclu6
        jePo7VL/o3OHSsShNyrpSpigaiAMPKc=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "Maciej W . Rozycki" <macro@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>, od@zcrc.me,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 12/15] MIPS: jz4740: Drop all obsolete files
Date:   Sun,  6 Sep 2020 21:29:32 +0200
Message-Id: <20200906192935.107086-13-paul@crapouillou.net>
In-Reply-To: <20200906192935.107086-1-paul@crapouillou.net>
References: <20200906192935.107086-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Support for Ingenic SoCs is now provided by the arch/mips/generic/ code,
so all files in the arch/mips/jz4740/ folder can dropped, except for the
Kconfig, and the cpu-feature-overrides.h header file.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: No change
    
    v3: - Don't rename the folder to ingenic, it will be done in a follow-up patch.
        - Don't remove cpu-feature-overrides.h

 arch/mips/include/asm/mach-jz4740/irq.h |  13 ---
 arch/mips/jz4740/Makefile               |   9 --
 arch/mips/jz4740/Platform               |   3 -
 arch/mips/jz4740/setup.c                | 145 ------------------------
 4 files changed, 170 deletions(-)
 delete mode 100644 arch/mips/include/asm/mach-jz4740/irq.h
 delete mode 100644 arch/mips/jz4740/Makefile
 delete mode 100644 arch/mips/jz4740/Platform
 delete mode 100644 arch/mips/jz4740/setup.c

diff --git a/arch/mips/include/asm/mach-jz4740/irq.h b/arch/mips/include/asm/mach-jz4740/irq.h
deleted file mode 100644
index 27c543bd340f..000000000000
--- a/arch/mips/include/asm/mach-jz4740/irq.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- *  Copyright (C) 2009-2010, Lars-Peter Clausen <lars@metafoo.de>
- *  JZ4740 IRQ definitions
- */
-
-#ifndef __ASM_MACH_JZ4740_IRQ_H__
-#define __ASM_MACH_JZ4740_IRQ_H__
-
-#define MIPS_CPU_IRQ_BASE 0
-#define NR_IRQS 256
-
-#endif
diff --git a/arch/mips/jz4740/Makefile b/arch/mips/jz4740/Makefile
deleted file mode 100644
index f96c0f5eca44..000000000000
--- a/arch/mips/jz4740/Makefile
+++ /dev/null
@@ -1,9 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-#
-# Makefile for the Ingenic JZ4740.
-#
-
-# Object file lists.
-obj-y += setup.o
-
-CFLAGS_setup.o = -I$(src)/../../../scripts/dtc/libfdt
diff --git a/arch/mips/jz4740/Platform b/arch/mips/jz4740/Platform
deleted file mode 100644
index bd35d0621b13..000000000000
--- a/arch/mips/jz4740/Platform
+++ /dev/null
@@ -1,3 +0,0 @@
-cflags-$(CONFIG_MACH_INGENIC)	+= -I$(srctree)/arch/mips/include/asm/mach-jz4740
-load-$(CONFIG_MACH_INGENIC)	+= 0xffffffff80010000
-zload-$(CONFIG_MACH_INGENIC)	+= 0xffffffff81000000
diff --git a/arch/mips/jz4740/setup.c b/arch/mips/jz4740/setup.c
deleted file mode 100644
index 51d906325ce6..000000000000
--- a/arch/mips/jz4740/setup.c
+++ /dev/null
@@ -1,145 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  Copyright (C) 2009-2010, Lars-Peter Clausen <lars@metafoo.de>
- *  Copyright (C) 2011, Maarten ter Huurne <maarten@treewalker.org>
- *  JZ4740 setup code
- */
-
-#include <linux/clocksource.h>
-#include <linux/init.h>
-#include <linux/io.h>
-#include <linux/irqchip.h>
-#include <linux/kernel.h>
-#include <linux/libfdt.h>
-#include <linux/of_clk.h>
-#include <linux/of_fdt.h>
-#include <linux/pm.h>
-#include <linux/sizes.h>
-#include <linux/suspend.h>
-
-#include <asm/bootinfo.h>
-#include <asm/fw/fw.h>
-#include <asm/prom.h>
-#include <asm/reboot.h>
-#include <asm/time.h>
-
-static unsigned long __init get_board_mach_type(const void *fdt)
-{
-	if (!fdt_node_check_compatible(fdt, 0, "ingenic,x2000"))
-		return MACH_INGENIC_X2000;
-	if (!fdt_node_check_compatible(fdt, 0, "ingenic,x1830"))
-		return MACH_INGENIC_X1830;
-	if (!fdt_node_check_compatible(fdt, 0, "ingenic,x1000"))
-		return MACH_INGENIC_X1000;
-	if (!fdt_node_check_compatible(fdt, 0, "ingenic,jz4780"))
-		return MACH_INGENIC_JZ4780;
-	if (!fdt_node_check_compatible(fdt, 0, "ingenic,jz4770"))
-		return MACH_INGENIC_JZ4770;
-	if (!fdt_node_check_compatible(fdt, 0, "ingenic,jz4725b"))
-		return MACH_INGENIC_JZ4725B;
-
-	return MACH_INGENIC_JZ4740;
-}
-
-void __init plat_mem_setup(void)
-{
-	void *dtb = (void *)fw_passed_dtb;
-
-	__dt_setup_arch(dtb);
-
-	/*
-	 * Old devicetree files for the qi,lb60 board did not have a /memory
-	 * node. Hardcode the memory info here.
-	 */
-	if (!fdt_node_check_compatible(dtb, 0, "qi,lb60") &&
-	    fdt_path_offset(dtb, "/memory") < 0)
-		early_init_dt_add_memory_arch(0, SZ_32M);
-
-	mips_machtype = get_board_mach_type(dtb);
-}
-
-void __init device_tree_init(void)
-{
-	if (!initial_boot_params)
-		return;
-
-	unflatten_and_copy_device_tree();
-}
-
-const char *get_system_type(void)
-{
-	switch (mips_machtype) {
-	case MACH_INGENIC_X2000:
-		return "X2000";
-	case MACH_INGENIC_X1830:
-		return "X1830";
-	case MACH_INGENIC_X1000:
-		return "X1000";
-	case MACH_INGENIC_JZ4780:
-		return "JZ4780";
-	case MACH_INGENIC_JZ4770:
-		return "JZ4770";
-	case MACH_INGENIC_JZ4725B:
-		return "JZ4725B";
-	default:
-		return "JZ4740";
-	}
-}
-
-void __init arch_init_irq(void)
-{
-	irqchip_init();
-}
-
-void __init plat_time_init(void)
-{
-	of_clk_init(NULL);
-	timer_probe();
-}
-
-void __init prom_init(void)
-{
-	fw_init_cmdline();
-}
-
-void __init prom_free_prom_memory(void)
-{
-}
-
-static void jz4740_wait_instr(void)
-{
-	__asm__(".set push;\n"
-		".set mips3;\n"
-		"wait;\n"
-		".set pop;\n"
-	);
-}
-
-static void jz4740_halt(void)
-{
-	for (;;)
-		jz4740_wait_instr();
-}
-
-static int __maybe_unused jz4740_pm_enter(suspend_state_t state)
-{
-	jz4740_wait_instr();
-
-	return 0;
-}
-
-static const struct platform_suspend_ops jz4740_pm_ops __maybe_unused = {
-	.valid = suspend_valid_only_mem,
-	.enter = jz4740_pm_enter,
-};
-
-static int __init jz4740_pm_init(void)
-{
-	if (IS_ENABLED(CONFIG_PM_SLEEP))
-		suspend_set_ops(&jz4740_pm_ops);
-	_machine_halt = jz4740_halt;
-
-	return 0;
-
-}
-late_initcall(jz4740_pm_init);
-- 
2.28.0

