Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18857242329
	for <lists+linux-mips@lfdr.de>; Wed, 12 Aug 2020 02:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726577AbgHLAQm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 11 Aug 2020 20:16:42 -0400
Received: from crapouillou.net ([89.234.176.41]:52202 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726143AbgHLAQk (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 11 Aug 2020 20:16:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1597191329; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3dJm1ZH5p8lYwtRXVe8apAlfRROtFBbP9Bcob8mp6U4=;
        b=dJQhojNyTwfdUj7hkxWCaqb1SEcXzn3bY555DHQSUJdmCIKtPGOGQwhvEo9g+wAgOGqsMD
        8MXsR7U/qUGZTAg0KSIW/leoDoY+74KGeJ6zrSo56vJ17lSixq2PqGf3eOpP+PcqP0vI0i
        Jd9wDl3lUVRa19icuVCI3qU9CQrFxpw=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Paul Burton <paulburton@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        od@zcrc.me, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 11/13] MIPS: jz4740: Drop folder
Date:   Wed, 12 Aug 2020 02:15:08 +0200
Message-Id: <20200812001510.460382-12-paul@crapouillou.net>
In-Reply-To: <20200812001510.460382-1-paul@crapouillou.net>
References: <20200812001510.460382-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Support for Ingenic SoCs is now provided by the arch/mips/generic/ code,
so the arch/mips/jz4740/ folder can be completely dropped. The exception
is the Kconfig, which has been moved to arch/mips/ingenic/Kconfig in the
process.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: No change

 arch/mips/Kconfig                             |   2 +-
 .../asm/mach-jz4740/cpu-feature-overrides.h   |  50 ------
 arch/mips/include/asm/mach-jz4740/irq.h       |  13 --
 arch/mips/{jz4740 => ingenic}/Kconfig         |   0
 arch/mips/jz4740/Makefile                     |   9 --
 arch/mips/jz4740/Platform                     |   3 -
 arch/mips/jz4740/setup.c                      | 145 ------------------
 7 files changed, 1 insertion(+), 221 deletions(-)
 delete mode 100644 arch/mips/include/asm/mach-jz4740/cpu-feature-overrides.h
 delete mode 100644 arch/mips/include/asm/mach-jz4740/irq.h
 rename arch/mips/{jz4740 => ingenic}/Kconfig (100%)
 delete mode 100644 arch/mips/jz4740/Makefile
 delete mode 100644 arch/mips/jz4740/Platform
 delete mode 100644 arch/mips/jz4740/setup.c

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 5b7c7c87f9b2..a4bfb95cc2a2 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1037,8 +1037,8 @@ source "arch/mips/bcm47xx/Kconfig"
 source "arch/mips/bcm63xx/Kconfig"
 source "arch/mips/bmips/Kconfig"
 source "arch/mips/generic/Kconfig"
+source "arch/mips/ingenic/Kconfig"
 source "arch/mips/jazz/Kconfig"
-source "arch/mips/jz4740/Kconfig"
 source "arch/mips/lantiq/Kconfig"
 source "arch/mips/pic32/Kconfig"
 source "arch/mips/pistachio/Kconfig"
diff --git a/arch/mips/include/asm/mach-jz4740/cpu-feature-overrides.h b/arch/mips/include/asm/mach-jz4740/cpu-feature-overrides.h
deleted file mode 100644
index 7c5e576f9d96..000000000000
--- a/arch/mips/include/asm/mach-jz4740/cpu-feature-overrides.h
+++ /dev/null
@@ -1,50 +0,0 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- */
-#ifndef __ASM_MACH_JZ4740_CPU_FEATURE_OVERRIDES_H
-#define __ASM_MACH_JZ4740_CPU_FEATURE_OVERRIDES_H
-
-#define cpu_has_tlb 1
-#define cpu_has_4kex		1
-#define cpu_has_3k_cache	0
-#define cpu_has_4k_cache	1
-#define cpu_has_tx39_cache	0
-#define cpu_has_counter		0
-#define cpu_has_watch		1
-#define cpu_has_divec		1
-#define cpu_has_vce		0
-#define cpu_has_cache_cdex_p	0
-#define cpu_has_cache_cdex_s	0
-#define cpu_has_prefetch	1
-#define cpu_has_mcheck 1
-#define cpu_has_ejtag 1
-#define cpu_has_llsc		1
-#define cpu_has_mips16 0
-#define cpu_has_mips16e2	0
-#define cpu_has_mdmx 0
-#define cpu_has_mips3d 0
-#define cpu_has_smartmips 0
-#define kernel_uses_llsc	1
-#define cpu_has_vtag_icache	1
-#define cpu_has_dc_aliases	0
-#define cpu_has_ic_fills_f_dc	0
-#define cpu_has_pindexed_dcache 0
-#define cpu_has_mips32r1	1
-#define cpu_has_mips64r1	0
-#define cpu_has_mips64r2	0
-#define cpu_has_dsp		0
-#define cpu_has_dsp2		0
-#define cpu_has_mipsmt		0
-#define cpu_has_userlocal	0
-#define cpu_has_nofpuex 0
-#define cpu_has_64bits		0
-#define cpu_has_64bit_zero_reg 0
-#define cpu_has_inclusive_pcaches 0
-
-#define cpu_dcache_line_size()	32
-#define cpu_icache_line_size()	32
-
-#endif
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
diff --git a/arch/mips/jz4740/Kconfig b/arch/mips/ingenic/Kconfig
similarity index 100%
rename from arch/mips/jz4740/Kconfig
rename to arch/mips/ingenic/Kconfig
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

