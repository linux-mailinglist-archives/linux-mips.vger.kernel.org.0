Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E6A625F034
	for <lists+linux-mips@lfdr.de>; Sun,  6 Sep 2020 21:31:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbgIFTb0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 6 Sep 2020 15:31:26 -0400
Received: from crapouillou.net ([89.234.176.41]:36026 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726063AbgIFTb0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 6 Sep 2020 15:31:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1599420596; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ifTdJhqEx3w2gbCRfzqzsoExLqID2IYDPNezUL4oQ44=;
        b=xuty6oiBl3M2yZ6DolF/Gol2zb9dG54PlT56kH8WkyRwhJ0lrJKAP7U50MIgMAx6TDgnyV
        TkPB1p7KoUNz7QGbWUylc+ZSrWULd6TgmlpV80cdIPgwZtfz+gyVjHaWbdZ96vU5D/fw4u
        LycWRGmeHbp0fwilXcFa4q+XXUCexUE=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "Maciej W . Rozycki" <macro@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>, od@zcrc.me,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 11/15] MIPS: generic: Add support for Ingenic SoCs
Date:   Sun,  6 Sep 2020 21:29:31 +0200
Message-Id: <20200906192935.107086-12-paul@crapouillou.net>
In-Reply-To: <20200906192935.107086-1-paul@crapouillou.net>
References: <20200906192935.107086-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add support for Ingenic SoCs in arch/mips/generic/.

The Kconfig changes are here to ensure that it is possible to compile
either a generic kernel that supports Ingenic SoCs, or a Ingenic-only
kernel, both using the same code base, to avoid duplicated code.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: Rework the code around "system_type" to match the changes
    	done in the previous patches.
    
    v3: For Ingenic-only kernel builds, we will now also include
        arch/mips/include/mach-jz4740. That way, the
    	cpu-feature-overrides.h functionality is not lost.

 arch/mips/Kbuild.platforms        |   1 -
 arch/mips/Kconfig                 |  32 +++++----
 arch/mips/generic/Kconfig         |   6 ++
 arch/mips/generic/Makefile        |   1 +
 arch/mips/generic/Platform        |   3 +
 arch/mips/generic/board-ingenic.c | 108 ++++++++++++++++++++++++++++++
 arch/mips/jz4740/Kconfig          |  16 +++--
 7 files changed, 149 insertions(+), 18 deletions(-)
 create mode 100644 arch/mips/generic/board-ingenic.c

diff --git a/arch/mips/Kbuild.platforms b/arch/mips/Kbuild.platforms
index af336a274a7a..5483e38b5dc7 100644
--- a/arch/mips/Kbuild.platforms
+++ b/arch/mips/Kbuild.platforms
@@ -13,7 +13,6 @@ platform-$(CONFIG_MIPS_COBALT)		+= cobalt/
 platform-$(CONFIG_MACH_DECSTATION)	+= dec/
 platform-$(CONFIG_MIPS_GENERIC)		+= generic/
 platform-$(CONFIG_MACH_JAZZ)		+= jazz/
-platform-$(CONFIG_MACH_INGENIC)		+= jz4740/
 platform-$(CONFIG_LANTIQ)		+= lantiq/
 platform-$(CONFIG_MACH_LOONGSON2EF)	+= loongson2ef/
 platform-$(CONFIG_MACH_LOONGSON32)	+= loongson32/
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 795b33ad4e64..61e8d32eea1b 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -96,6 +96,23 @@ config MIPS_FIXUP_BIGPHYS_ADDR
 config MIPS_GENERIC
 	bool
 
+config MACH_INGENIC
+	bool
+	select SYS_SUPPORTS_32BIT_KERNEL
+	select SYS_SUPPORTS_LITTLE_ENDIAN
+	select SYS_SUPPORTS_ZBOOT
+	select CPU_SUPPORTS_HUGEPAGES
+	select DMA_NONCOHERENT
+	select IRQ_MIPS_CPU
+	select PINCTRL
+	select GPIOLIB
+	select COMMON_CLK
+	select GENERIC_IRQ_CHIP
+	select BUILTIN_DTB if MIPS_NO_APPENDED_DTB
+	select USE_OF
+	select CPU_SUPPORTS_CPUFREQ
+	select MIPS_EXTERNAL_TIMER
+
 menu "Machine selection"
 
 choice
@@ -394,20 +411,11 @@ config MACH_JAZZ
 	  Members include the Acer PICA, MIPS Magnum 4000, MIPS Millennium and
 	  Olivetti M700-10 workstations.
 
-config MACH_INGENIC
+config MACH_INGENIC_SOC
 	bool "Ingenic SoC based machines"
-	select SYS_SUPPORTS_32BIT_KERNEL
-	select SYS_SUPPORTS_LITTLE_ENDIAN
+	select MIPS_GENERIC
+	select MACH_INGENIC
 	select SYS_SUPPORTS_ZBOOT_UART16550
-	select CPU_SUPPORTS_HUGEPAGES
-	select DMA_NONCOHERENT
-	select IRQ_MIPS_CPU
-	select PINCTRL
-	select GPIOLIB
-	select COMMON_CLK
-	select GENERIC_IRQ_CHIP
-	select BUILTIN_DTB if MIPS_NO_APPENDED_DTB
-	select USE_OF
 
 config LANTIQ
 	bool "Lantiq based platforms"
diff --git a/arch/mips/generic/Kconfig b/arch/mips/generic/Kconfig
index 5216c850b7e2..55d9aed7ced9 100644
--- a/arch/mips/generic/Kconfig
+++ b/arch/mips/generic/Kconfig
@@ -73,6 +73,12 @@ config FIT_IMAGE_FDT_OCELOT
 	  from Microsemi in the FIT kernel image.
 	  This requires u-boot on the platform.
 
+config BOARD_INGENIC
+	bool "Support boards based on Ingenic SoCs"
+	select MACH_INGENIC_GENERIC
+	help
+	  Enable support for boards based on Ingenic SoCs.
+
 config VIRT_BOARD_RANCHU
 	bool "Support Ranchu platform for Android emulator"
 	help
diff --git a/arch/mips/generic/Makefile b/arch/mips/generic/Makefile
index 2384a6b09e4c..e37a59bae0a6 100644
--- a/arch/mips/generic/Makefile
+++ b/arch/mips/generic/Makefile
@@ -11,4 +11,5 @@ obj-y += proc.o
 obj-$(CONFIG_YAMON_DT_SHIM)		+= yamon-dt.o
 obj-$(CONFIG_LEGACY_BOARD_SEAD3)	+= board-sead3.o
 obj-$(CONFIG_LEGACY_BOARD_OCELOT)	+= board-ocelot.o
+obj-$(CONFIG_MACH_INGENIC)			+= board-ingenic.o
 obj-$(CONFIG_VIRT_BOARD_RANCHU)		+= board-ranchu.o
diff --git a/arch/mips/generic/Platform b/arch/mips/generic/Platform
index 4cefecf7d14b..7d511fc28a01 100644
--- a/arch/mips/generic/Platform
+++ b/arch/mips/generic/Platform
@@ -8,7 +8,10 @@
 # option) any later version.
 #
 
+# Note: order matters, keep the asm/mach-generic include last.
+cflags-$(CONFIG_MACH_INGENIC_SOC)	+= -I$(srctree)/arch/mips/include/asm/mach-jz4740
 cflags-$(CONFIG_MIPS_GENERIC)	+= -I$(srctree)/arch/mips/include/asm/mach-generic
+
 load-$(CONFIG_MIPS_GENERIC)	+= 0xffffffff80100000
 zload-$(CONFIG_MIPS_GENERIC)	+= 0xffffffff81000000
 all-$(CONFIG_MIPS_GENERIC)	:= vmlinux.gz.itb
diff --git a/arch/mips/generic/board-ingenic.c b/arch/mips/generic/board-ingenic.c
new file mode 100644
index 000000000000..0d7de8f9713d
--- /dev/null
+++ b/arch/mips/generic/board-ingenic.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Support for Ingenic SoCs
+ *
+ * Copyright (C) 2009-2010, Lars-Peter Clausen <lars@metafoo.de>
+ * Copyright (C) 2011, Maarten ter Huurne <maarten@treewalker.org>
+ * Copyright (C) 2020 Paul Cercueil <paul@crapouillou.net>
+ */
+
+#include <linux/of_address.h>
+#include <linux/of_fdt.h>
+#include <linux/pm.h>
+#include <linux/sizes.h>
+#include <linux/suspend.h>
+#include <linux/types.h>
+
+#include <asm/bootinfo.h>
+#include <asm/machine.h>
+#include <asm/reboot.h>
+
+static __init char *ingenic_get_system_type(unsigned long machtype)
+{
+	switch (machtype) {
+	case MACH_INGENIC_X1830:
+		return "X1830";
+	case MACH_INGENIC_X1000:
+		return "X1000";
+	case MACH_INGENIC_JZ4780:
+		return "JZ4780";
+	case MACH_INGENIC_JZ4770:
+		return "JZ4770";
+	case MACH_INGENIC_JZ4725B:
+		return "JZ4725B";
+	default:
+		return "JZ4740";
+	}
+}
+
+static __init const void *ingenic_fixup_fdt(const void *fdt, const void *match_data)
+{
+	/*
+	 * Old devicetree files for the qi,lb60 board did not have a /memory
+	 * node. Hardcode the memory info here.
+	 */
+	if (!fdt_node_check_compatible(fdt, 0, "qi,lb60") &&
+	    fdt_path_offset(fdt, "/memory") < 0)
+		early_init_dt_add_memory_arch(0, SZ_32M);
+
+	mips_machtype = (unsigned long)match_data;
+	system_type = ingenic_get_system_type(mips_machtype);
+
+	return fdt;
+}
+
+static const struct of_device_id ingenic_of_match[] __initconst = {
+	{ .compatible = "ingenic,jz4740", .data = (void *)MACH_INGENIC_JZ4740 },
+	{ .compatible = "ingenic,jz4725b", .data = (void *)MACH_INGENIC_JZ4725B },
+	{ .compatible = "ingenic,jz4770", .data = (void *)MACH_INGENIC_JZ4770 },
+	{ .compatible = "ingenic,jz4780", .data = (void *)MACH_INGENIC_JZ4780 },
+	{ .compatible = "ingenic,x1000", .data = (void *)MACH_INGENIC_X1000 },
+	{ .compatible = "ingenic,x1830", .data = (void *)MACH_INGENIC_X1830 },
+	{}
+};
+
+MIPS_MACHINE(ingenic) = {
+	.matches = ingenic_of_match,
+	.fixup_fdt = ingenic_fixup_fdt,
+};
+
+static void ingenic_wait_instr(void)
+{
+	__asm__(".set push;\n"
+		".set mips3;\n"
+		"wait;\n"
+		".set pop;\n"
+	);
+}
+
+static void ingenic_halt(void)
+{
+	for (;;)
+		ingenic_wait_instr();
+}
+
+static int __maybe_unused ingenic_pm_enter(suspend_state_t state)
+{
+	ingenic_wait_instr();
+
+	return 0;
+}
+
+static const struct platform_suspend_ops ingenic_pm_ops __maybe_unused = {
+	.valid = suspend_valid_only_mem,
+	.enter = ingenic_pm_enter,
+};
+
+static int __init ingenic_pm_init(void)
+{
+	if (boot_cpu_type() == CPU_XBURST) {
+		if (IS_ENABLED(CONFIG_PM_SLEEP))
+			suspend_set_ops(&ingenic_pm_ops);
+		_machine_halt = ingenic_halt;
+	}
+
+	return 0;
+
+}
+late_initcall(ingenic_pm_init);
diff --git a/arch/mips/jz4740/Kconfig b/arch/mips/jz4740/Kconfig
index c2a6fbf8e411..3238e16febd5 100644
--- a/arch/mips/jz4740/Kconfig
+++ b/arch/mips/jz4740/Kconfig
@@ -1,15 +1,21 @@
 # SPDX-License-Identifier: GPL-2.0
+
+config MACH_INGENIC_GENERIC
+	bool
+	select MACH_INGENIC
+	select MACH_JZ4740
+	select MACH_JZ4770
+	select MACH_JZ4780
+	select MACH_X1000
+
 choice
 	prompt "Machine type"
-	depends on MACH_INGENIC
+	depends on MACH_INGENIC_SOC
 	default INGENIC_GENERIC_BOARD
 
 config INGENIC_GENERIC_BOARD
 	bool "Generic board"
-	select MACH_JZ4740
-	select MACH_JZ4770
-	select MACH_JZ4780
-	select MACH_X1000
+	select MACH_INGENIC_GENERIC
 
 config JZ4740_QI_LB60
 	bool "Qi Hardware Ben NanoNote"
-- 
2.28.0

