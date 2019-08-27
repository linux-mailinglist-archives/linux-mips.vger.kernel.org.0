Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07B9A9E346
	for <lists+linux-mips@lfdr.de>; Tue, 27 Aug 2019 10:54:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729493AbfH0IyU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 27 Aug 2019 04:54:20 -0400
Received: from forward101o.mail.yandex.net ([37.140.190.181]:59265 "EHLO
        forward101o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728999AbfH0IyT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 27 Aug 2019 04:54:19 -0400
Received: from mxback12j.mail.yandex.net (mxback12j.mail.yandex.net [IPv6:2a02:6b8:0:1619::87])
        by forward101o.mail.yandex.net (Yandex) with ESMTP id 86DE73C02213;
        Tue, 27 Aug 2019 11:53:59 +0300 (MSK)
Received: from smtp1p.mail.yandex.net (smtp1p.mail.yandex.net [2a02:6b8:0:1472:2741:0:8b6:6])
        by mxback12j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id xZPLybpHUP-rw1iYMdl;
        Tue, 27 Aug 2019 11:53:59 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1566896039;
        bh=CsoeEKAYNLsfsaC+bfVXBTx78Q1mmSh/vUaSOV3DIxc=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=P9jT3t2TWIdTeQ2XE4RnEYEzFGR6yRERDQNMpBzQZrSKKLtWd13IprtUKb2C9WSk4
         lqoX4DjRjPtt9exVrWjiRQBsp0oy/aQr9COFVHds+aI89idN20Mi6feMwGI6Wz6edq
         4Q1JxfOMVQFSnefGiozOxHLzY8LYIJbXywUo0N6s=
Authentication-Results: mxback12j.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp1p.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id JOqUfE8LDO-rntCjp2L;
        Tue, 27 Aug 2019 11:53:54 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 02/13] MIPS: Loongson64: Sepreate loongson2ef/loongson64 code
Date:   Tue, 27 Aug 2019 16:52:51 +0800
Message-Id: <20190827085302.5197-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
References: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

As later model of GSx64 family processors including 2-series-soc have
similar design with initial loongson3a while loongson2e/f seems less
identical, we seprate loongson2e/f support code out of mach-loongson64
to make our life easier.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kbuild.platforms                    |   1 +
 arch/mips/Kconfig                             |  51 +++++--
 arch/mips/include/asm/bootinfo.h              |   1 -
 .../mach-loongson2ef/cpu-feature-overrides.h  |  45 +++++++
 .../cs5536/cs5536.h                           |   0
 .../cs5536/cs5536_mfgpt.h                     |   0
 .../cs5536/cs5536_pci.h                       |   0
 .../cs5536/cs5536_vsm.h                       |   0
 .../loongson2ef.h}                            |  29 +---
 .../machine.h                                 |   6 -
 .../mc146818rtc.h                             |   5 +-
 .../mem.h                                     |   6 +-
 arch/mips/include/asm/mach-loongson2ef/pci.h  |  43 ++++++
 .../include/asm/mach-loongson2ef/spaces.h     |  10 ++
 .../mach-loongson64/cpu-feature-overrides.h   |   3 -
 arch/mips/include/asm/mach-loongson64/irq.h   |   7 +-
 .../asm/mach-loongson64/kernel-entry-init.h   |  74 ----------
 .../include/asm/mach-loongson64/loongson64.h  |  48 +++++++
 .../mips/include/asm/mach-loongson64/mmzone.h |  16 ---
 arch/mips/include/asm/mach-loongson64/pci.h   |  41 +-----
 .../include/asm/mach-loongson64/workarounds.h |   4 +-
 arch/mips/loongson2ef/Kconfig                 |  93 +++++++++++++
 arch/mips/loongson2ef/Makefile                |  18 +++
 arch/mips/loongson2ef/Platform                |  32 +++++
 .../common/Makefile                           |   0
 .../common/bonito-irq.c                       |   2 +-
 .../common/cmdline.c                          |   2 +-
 .../common/cs5536/Makefile                    |   0
 .../common/cs5536/cs5536_acc.c                |   0
 .../common/cs5536/cs5536_ehci.c               |   0
 .../common/cs5536/cs5536_ide.c                |   0
 .../common/cs5536/cs5536_isa.c                |   0
 .../common/cs5536/cs5536_mfgpt.c              |   0
 .../common/cs5536/cs5536_ohci.c               |   0
 .../common/cs5536/cs5536_pci.c                |   0
 .../common/early_printk.c                     |   2 +-
 arch/mips/loongson2ef/common/env.c            |  71 ++++++++++
 .../{loongson64 => loongson2ef}/common/init.c |   7 +-
 .../{loongson64 => loongson2ef}/common/irq.c  |   2 +-
 .../common/machtype.c                         |   3 +-
 .../{loongson64 => loongson2ef}/common/mem.c  |  40 +-----
 .../{loongson64 => loongson2ef}/common/pci.c  |  11 +-
 .../common/platform.c                         |   0
 .../{loongson64 => loongson2ef}/common/pm.c   |   2 +-
 .../common/reset.c                            |  23 +---
 .../{loongson64 => loongson2ef}/common/rtc.c  |   0
 .../common/serial.c                           |  37 +----
 .../common/setup.c                            |   2 +-
 .../{loongson64 => loongson2ef}/common/time.c |   2 +-
 .../common/uart_base.c                        |  10 +-
 .../fuloong-2e/Makefile                       |   0
 .../fuloong-2e/dma.c                          |   0
 .../fuloong-2e/irq.c                          |   2 +-
 .../fuloong-2e/reset.c                        |   2 +-
 .../lemote-2f/Makefile                        |   0
 .../lemote-2f/clock.c                         |   2 +-
 .../lemote-2f/dma.c                           |   0
 .../lemote-2f/ec_kb3310b.c                    |   0
 .../lemote-2f/ec_kb3310b.h                    |   0
 .../lemote-2f/irq.c                           |   2 +-
 .../lemote-2f/machtype.c                      |   2 +-
 .../lemote-2f/pm.c                            |   2 +-
 .../lemote-2f/reset.c                         |   2 +-
 arch/mips/loongson64/Kconfig                  | 126 +-----------------
 arch/mips/loongson64/Makefile                 |  23 +---
 arch/mips/loongson64/Platform                 |  26 +---
 .../loongson64/{loongson-3 => }/acpi_init.c   |   3 +-
 .../loongson64/{loongson-3 => }/cop2-ex.c     |   5 +-
 arch/mips/loongson64/{loongson-3 => }/dma.c   |   6 +-
 arch/mips/loongson64/{common => }/env.c       |  72 +++-------
 arch/mips/loongson64/{loongson-3 => }/hpet.c  |   0
 arch/mips/loongson64/{loongson-3 => }/irq.c   |  40 +++++-
 arch/mips/loongson64/loongson-3/Makefile      |  11 --
 arch/mips/loongson64/{loongson-3 => }/numa.c  |   4 +-
 arch/mips/loongson64/pci.c                    |  45 +++++++
 .../loongson64/{loongson-3 => }/platform.c    |   0
 arch/mips/loongson64/reset.c                  |  58 ++++++++
 arch/mips/loongson64/setup.c                  |  92 +++++++++++++
 arch/mips/loongson64/{loongson-3 => }/smp.c   |   4 +-
 arch/mips/loongson64/{loongson-3 => }/smp.h   |   0
 arch/mips/oprofile/op_model_loongson2.c       |   2 +-
 arch/mips/oprofile/op_model_loongson3.c       |   2 +-
 arch/mips/pci/Makefile                        |   2 +-
 arch/mips/pci/fixup-fuloong2e.c               |   2 +-
 arch/mips/pci/fixup-lemote2f.c                |   2 +-
 arch/mips/pci/ops-loongson2.c                 |   2 +-
 arch/mips/pci/ops-loongson3.c                 |   2 +-
 drivers/cpufreq/loongson2_cpufreq.c           |   2 +-
 drivers/gpio/gpio-loongson.c                  |   2 +-
 drivers/platform/mips/cpu_hwmon.c             |   2 +-
 90 files changed, 720 insertions(+), 578 deletions(-)
 create mode 100644 arch/mips/include/asm/mach-loongson2ef/cpu-feature-overrides.h
 rename arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/cs5536/cs5536.h (100%)
 rename arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/cs5536/cs5536_mfgpt.h (100%)
 rename arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/cs5536/cs5536_pci.h (100%)
 rename arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/cs5536/cs5536_vsm.h (100%)
 rename arch/mips/include/asm/{mach-loongson64/loongson.h => mach-loongson2ef/loongson2ef.h} (91%)
 rename arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/machine.h (80%)
 rename arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/mc146818rtc.h (80%)
 rename arch/mips/include/asm/{mach-loongson64 => mach-loongson2ef}/mem.h (86%)
 create mode 100644 arch/mips/include/asm/mach-loongson2ef/pci.h
 create mode 100644 arch/mips/include/asm/mach-loongson2ef/spaces.h
 delete mode 100644 arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
 create mode 100644 arch/mips/include/asm/mach-loongson64/loongson64.h
 create mode 100644 arch/mips/loongson2ef/Kconfig
 create mode 100644 arch/mips/loongson2ef/Makefile
 create mode 100644 arch/mips/loongson2ef/Platform
 rename arch/mips/{loongson64 => loongson2ef}/common/Makefile (100%)
 rename arch/mips/{loongson64 => loongson2ef}/common/bonito-irq.c (97%)
 rename arch/mips/{loongson64 => loongson2ef}/common/cmdline.c (97%)
 rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/Makefile (100%)
 rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/cs5536_acc.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/cs5536_ehci.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/cs5536_ide.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/cs5536_isa.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/cs5536_mfgpt.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/cs5536_ohci.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/common/cs5536/cs5536_pci.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/common/early_printk.c (97%)
 create mode 100644 arch/mips/loongson2ef/common/env.c
 rename arch/mips/{loongson64 => loongson2ef}/common/init.c (90%)
 rename arch/mips/{loongson64 => loongson2ef}/common/irq.c (98%)
 rename arch/mips/{loongson64 => loongson2ef}/common/machtype.c (94%)
 rename arch/mips/{loongson64 => loongson2ef}/common/mem.c (72%)
 rename arch/mips/{loongson64 => loongson2ef}/common/pci.c (89%)
 rename arch/mips/{loongson64 => loongson2ef}/common/platform.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/common/pm.c (99%)
 rename arch/mips/{loongson64 => loongson2ef}/common/reset.c (77%)
 rename arch/mips/{loongson64 => loongson2ef}/common/rtc.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/common/serial.c (63%)
 rename arch/mips/{loongson64 => loongson2ef}/common/setup.c (97%)
 rename arch/mips/{loongson64 => loongson2ef}/common/time.c (96%)
 rename arch/mips/{loongson64 => loongson2ef}/common/uart_base.c (77%)
 rename arch/mips/{loongson64 => loongson2ef}/fuloong-2e/Makefile (100%)
 rename arch/mips/{loongson64 => loongson2ef}/fuloong-2e/dma.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/fuloong-2e/irq.c (98%)
 rename arch/mips/{loongson64 => loongson2ef}/fuloong-2e/reset.c (93%)
 rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/Makefile (100%)
 rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/clock.c (98%)
 rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/dma.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/ec_kb3310b.c (100%)
 rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/ec_kb3310b.h (100%)
 rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/irq.c (99%)
 rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/machtype.c (98%)
 rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/pm.c (99%)
 rename arch/mips/{loongson64 => loongson2ef}/lemote-2f/reset.c (99%)
 rename arch/mips/loongson64/{loongson-3 => }/acpi_init.c (99%)
 rename arch/mips/loongson64/{loongson-3 => }/cop2-ex.c (88%)
 rename arch/mips/loongson64/{loongson-3 => }/dma.c (82%)
 rename arch/mips/loongson64/{common => }/env.c (79%)
 rename arch/mips/loongson64/{loongson-3 => }/hpet.c (100%)
 rename arch/mips/loongson64/{loongson-3 => }/irq.c (77%)
 delete mode 100644 arch/mips/loongson64/loongson-3/Makefile
 rename arch/mips/loongson64/{loongson-3 => }/numa.c (98%)
 create mode 100644 arch/mips/loongson64/pci.c
 rename arch/mips/loongson64/{loongson-3 => }/platform.c (100%)
 create mode 100644 arch/mips/loongson64/reset.c
 create mode 100644 arch/mips/loongson64/setup.c
 rename arch/mips/loongson64/{loongson-3 => }/smp.c (99%)
 rename arch/mips/loongson64/{loongson-3 => }/smp.h (100%)

diff --git a/arch/mips/Kbuild.platforms b/arch/mips/Kbuild.platforms
index 0de839882106..7c0d461483ef 100644
--- a/arch/mips/Kbuild.platforms
+++ b/arch/mips/Kbuild.platforms
@@ -17,6 +17,7 @@ platforms += jazz
 platforms += jz4740
 platforms += lantiq
 platforms += lasat
+platforms += loongson2ef
 platforms += loongson32
 platforms += loongson64
 platforms += mti-malta
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index cbc76f00d1fc..92a2ee773a40 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -445,18 +445,52 @@ config MACH_LOONGSON32
 	  the Institute of Computing Technology (ICT), Chinese Academy of
 	  Sciences (CAS).
 
+config MACH_LOONGSON2EF
+	bool "Loongson-2E/F family of machines"
+	select SYS_SUPPORTS_ZBOOT
+	help
+	  This enables the support of Loongson-2E/F family of machines.
+
+	  Loongson-2E/F is a family of single-core CPUs, They are 64-bit
+	  general-purpose MIPS-III compatible CPUs. Loongson-2E/F are developed
+	  by the Institute of Computing Technology (ICT), Chinese Academy of
+	  Sciences (CAS) in the People's Republic of China.
+	  The chief architect is Professor Weiwu Hu.
+
 config MACH_LOONGSON64
-	bool "Loongson-2/3 family of machines"
+	bool "Loongson GSx64 family of machines"
+	select ARCH_SPARSEMEM_ENABLE
+	select ARCH_MIGHT_HAVE_PC_PARPORT
+	select ARCH_MIGHT_HAVE_PC_SERIO
+	select GENERIC_ISA_DMA_SUPPORT_BROKEN
+	select BOOT_ELF32
+	select BOARD_SCACHE
+	select CSRC_R4K
+	select CEVT_R4K
+	select CPU_HAS_WB
+	select FORCE_PCI
+	select ISA
+	select I8259
+	select IRQ_MIPS_CPU
+	select NUMA
+	select NR_CPUS_DEFAULT_32
+	select SYS_HAS_CPU_LOONGSON64
+	select SYS_HAS_EARLY_PRINTK
+	select USE_GENERIC_EARLY_PRINTK_8250
+	select SYS_SUPPORTS_SMP
+	select SYS_SUPPORTS_HOTPLUG_CPU
+	select SYS_SUPPORTS_NUMA
+	select SYS_SUPPORTS_64BIT_KERNEL
+	select SYS_SUPPORTS_HIGHMEM
+	select SYS_SUPPORTS_LITTLE_ENDIAN
+	select ZONE_DMA32
 	select SYS_SUPPORTS_ZBOOT
 	help
-	  This enables the support of Loongson-2/3 family of machines.
+	  This enables the support of Loongson-3A/3B/2-series-soc processors
 
-	  Loongson-2 is a family of single-core CPUs and Loongson-3 is a
-	  family of multi-core CPUs. They are both 64-bit general-purpose
-	  MIPS-compatible CPUs. Loongson-2/3 are developed by the Institute
-	  of Computing Technology (ICT), Chinese Academy of Sciences (CAS)
-	  in the People's Republic of China. The chief architect is Professor
-	  Weiwu Hu.
+	  GSx64 is a family of general-purpose MIPS64R2+ procossor featured
+	  multi-core support. Their firmwares are passing parameters according
+	  to uniformed "Loongson Firmware Kernel Interface Specification".
 
 config MACH_PISTACHIO
 	bool "IMG Pistachio SoC based boards"
@@ -1033,6 +1067,7 @@ source "arch/mips/sibyte/Kconfig"
 source "arch/mips/txx9/Kconfig"
 source "arch/mips/vr41xx/Kconfig"
 source "arch/mips/cavium-octeon/Kconfig"
+source "arch/mips/loongson2ef/Kconfig"
 source "arch/mips/loongson32/Kconfig"
 source "arch/mips/loongson64/Kconfig"
 source "arch/mips/netlogic/Kconfig"
diff --git a/arch/mips/include/asm/bootinfo.h b/arch/mips/include/asm/bootinfo.h
index f711ccf7bace..6c1602af2bf4 100644
--- a/arch/mips/include/asm/bootinfo.h
+++ b/arch/mips/include/asm/bootinfo.h
@@ -70,7 +70,6 @@ enum loongson_machine_type {
 	MACH_DEXXON_GDIUM2F10,
 	MACH_LEMOTE_NAS,
 	MACH_LEMOTE_LL2F,
-	MACH_LOONGSON_GENERIC,
 	MACH_LOONGSON_END
 };
 
diff --git a/arch/mips/include/asm/mach-loongson2ef/cpu-feature-overrides.h b/arch/mips/include/asm/mach-loongson2ef/cpu-feature-overrides.h
new file mode 100644
index 000000000000..961ce43c6c98
--- /dev/null
+++ b/arch/mips/include/asm/mach-loongson2ef/cpu-feature-overrides.h
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2009 Wu Zhangjin <wuzhangjin@gmail.com>
+ * Copyright (C) 2009 Philippe Vachon <philippe@cowpig.ca>
+ * Copyright (C) 2009 Zhang Le <r0bertz@gentoo.org>
+ *
+ * reference: /proc/cpuinfo,
+ *	arch/mips/kernel/cpu-probe.c(cpu_probe_legacy),
+ *	arch/mips/kernel/proc.c(show_cpuinfo),
+ *	loongson2f user manual.
+ */
+
+#ifndef __ASM_MACH_LOONGSON2EF_CPU_FEATURE_OVERRIDES_H
+#define __ASM_MACH_LOONGSON2EF_CPU_FEATURE_OVERRIDES_H
+
+#define cpu_has_32fpr		1
+#define cpu_has_3k_cache	0
+#define cpu_has_4k_cache	1
+#define cpu_has_4kex		1
+#define cpu_has_64bits		1
+#define cpu_has_cache_cdex_p	0
+#define cpu_has_cache_cdex_s	0
+#define cpu_has_counter		1
+#define cpu_has_dc_aliases	(PAGE_SIZE < 0x4000)
+#define cpu_has_divec		0
+#define cpu_has_ejtag		0
+#define cpu_has_inclusive_pcaches	1
+#define cpu_has_llsc		1
+#define cpu_has_mcheck		0
+#define cpu_has_mdmx		0
+#define cpu_has_mips16		0
+#define cpu_has_mips16e2	0
+#define cpu_has_mips3d		0
+#define cpu_has_mipsmt		0
+#define cpu_has_smartmips	0
+#define cpu_has_tlb		1
+#define cpu_has_tx39_cache	0
+#define cpu_has_vce		0
+#define cpu_has_veic		0
+#define cpu_has_vint		0
+#define cpu_has_vtag_icache	0
+#define cpu_has_watch		1
+#define cpu_has_local_ebase	0
+
+#endif /* __ASM_MACH_LOONGSON2EF_CPU_FEATURE_OVERRIDES_H */
diff --git a/arch/mips/include/asm/mach-loongson64/cs5536/cs5536.h b/arch/mips/include/asm/mach-loongson2ef/cs5536/cs5536.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson64/cs5536/cs5536.h
rename to arch/mips/include/asm/mach-loongson2ef/cs5536/cs5536.h
diff --git a/arch/mips/include/asm/mach-loongson64/cs5536/cs5536_mfgpt.h b/arch/mips/include/asm/mach-loongson2ef/cs5536/cs5536_mfgpt.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson64/cs5536/cs5536_mfgpt.h
rename to arch/mips/include/asm/mach-loongson2ef/cs5536/cs5536_mfgpt.h
diff --git a/arch/mips/include/asm/mach-loongson64/cs5536/cs5536_pci.h b/arch/mips/include/asm/mach-loongson2ef/cs5536/cs5536_pci.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson64/cs5536/cs5536_pci.h
rename to arch/mips/include/asm/mach-loongson2ef/cs5536/cs5536_pci.h
diff --git a/arch/mips/include/asm/mach-loongson64/cs5536/cs5536_vsm.h b/arch/mips/include/asm/mach-loongson2ef/cs5536/cs5536_vsm.h
similarity index 100%
rename from arch/mips/include/asm/mach-loongson64/cs5536/cs5536_vsm.h
rename to arch/mips/include/asm/mach-loongson2ef/cs5536/cs5536_vsm.h
diff --git a/arch/mips/include/asm/mach-loongson64/loongson.h b/arch/mips/include/asm/mach-loongson2ef/loongson2ef.h
similarity index 91%
rename from arch/mips/include/asm/mach-loongson64/loongson.h
rename to arch/mips/include/asm/mach-loongson2ef/loongson2ef.h
index 40a24b76b874..b4524937df0e 100644
--- a/arch/mips/include/asm/mach-loongson64/loongson.h
+++ b/arch/mips/include/asm/mach-loongson2ef/loongson2ef.h
@@ -4,13 +4,12 @@
  * Author: Wu Zhangjin <wuzhangjin@gmail.com>
  */
 
-#ifndef __ASM_MACH_LOONGSON64_LOONGSON_H
-#define __ASM_MACH_LOONGSON64_LOONGSON_H
+#ifndef __ASM_MACH_LOONGSON2EF_LOONGSON2EF_H
+#define __ASM_MACH_LOONGSON2EF_LOONGSON2EF_H
 
 #include <linux/io.h>
 #include <linux/init.h>
 #include <linux/irq.h>
-#include <boot_param.h>
 
 /* loongson internal northbridge initialization */
 extern void bonito_irq_init(void);
@@ -22,7 +21,6 @@ extern void mach_prepare_shutdown(void);
 /* environment arguments from bootloader */
 extern u32 cpu_clock_freq;
 extern u32 memsize, highmemsize;
-extern const struct plat_smp_ops loongson3_smp_ops;
 
 /* loongson-specific command line, env and memory initialization */
 extern void __init prom_init_memory(void);
@@ -58,11 +56,6 @@ extern int mach_i8259_irq(void);
 #define LOONGSON_REG(x) \
 	(*(volatile u32 *)((char *)CKSEG1ADDR(LOONGSON_REG_BASE) + (x)))
 
-#define LOONGSON3_REG8(base, x) \
-	(*(volatile u8 *)((char *)TO_UNCAC(base) + (x)))
-
-#define LOONGSON3_REG32(base, x) \
-	(*(volatile u32 *)((char *)TO_UNCAC(base) + (x)))
 
 #define LOONGSON_IRQ_BASE	32
 #define LOONGSON2_PERFCNT_IRQ	(MIPS_CPU_IRQ_BASE + 6) /* cpu perf counter */
@@ -89,10 +82,6 @@ static inline void do_perfcnt_IRQ(void)
 #define LOONGSON_REG_BASE	0x1fe00000
 #define LOONGSON_REG_SIZE	0x00100000	/* 256Bytes + 256Bytes + ??? */
 #define LOONGSON_REG_TOP	(LOONGSON_REG_BASE+LOONGSON_REG_SIZE-1)
-/* Loongson-3 specific registers */
-#define LOONGSON3_REG_BASE	0x3ff00000
-#define LOONGSON3_REG_SIZE	0x00100000	/* 256Bytes + 256Bytes + ??? */
-#define LOONGSON3_REG_TOP	(LOONGSON3_REG_BASE+LOONGSON3_REG_SIZE-1)
 
 #define LOONGSON_LIO1_BASE	0x1ff00000
 #define LOONGSON_LIO1_SIZE	0x00100000	/* 1M */
@@ -247,19 +236,9 @@ static inline void do_perfcnt_IRQ(void)
 #define MAX_PACKAGES 4
 
 /* Chip Config registor of each physical cpu package, PRid >= Loongson-2F */
-extern u64 loongson_chipcfg[MAX_PACKAGES];
-#define LOONGSON_CHIPCFG(id) (*(volatile u32 *)(loongson_chipcfg[id]))
-
-/* Chip Temperature registor of each physical cpu package, PRid >= Loongson-3A */
-extern u64 loongson_chiptemp[MAX_PACKAGES];
-#define LOONGSON_CHIPTEMP(id) (*(volatile u32 *)(loongson_chiptemp[id]))
-
-/* Freq Control register of each physical cpu package, PRid >= Loongson-3B */
-extern u64 loongson_freqctrl[MAX_PACKAGES];
-#define LOONGSON_FREQCTRL(id) (*(volatile u32 *)(loongson_freqctrl[id]))
+#define LOONGSON_CHIPCFG(id) (*(volatile u32 *)(0xffffffffbfc00180))
 
 /* pcimap */
-
 #define LOONGSON_PCIMAP_PCIMAP_LO0	0x0000003f
 #define LOONGSON_PCIMAP_PCIMAP_LO0_SHIFT	0
 #define LOONGSON_PCIMAP_PCIMAP_LO1	0x00000fc0
@@ -352,4 +331,4 @@ extern unsigned long _loongson_addrwincfg_base;
 
 #endif	/* ! CONFIG_CPU_SUPPORTS_ADDRWINCFG */
 
-#endif /* __ASM_MACH_LOONGSON64_LOONGSON_H */
+#endif /* __ASM_MACH_LOONGSON2EF_LOONGSON_H */
diff --git a/arch/mips/include/asm/mach-loongson64/machine.h b/arch/mips/include/asm/mach-loongson2ef/machine.h
similarity index 80%
rename from arch/mips/include/asm/mach-loongson64/machine.h
rename to arch/mips/include/asm/mach-loongson2ef/machine.h
index 8ef7ea94a26d..2a032259041d 100644
--- a/arch/mips/include/asm/mach-loongson64/machine.h
+++ b/arch/mips/include/asm/mach-loongson2ef/machine.h
@@ -20,10 +20,4 @@
 
 #endif
 
-#ifdef CONFIG_LOONGSON_MACH3X
-
-#define LOONGSON_MACHTYPE MACH_LOONGSON_GENERIC
-
-#endif /* CONFIG_LOONGSON_MACH3X */
-
 #endif /* __ASM_MACH_LOONGSON64_MACHINE_H */
diff --git a/arch/mips/include/asm/mach-loongson64/mc146818rtc.h b/arch/mips/include/asm/mach-loongson2ef/mc146818rtc.h
similarity index 80%
rename from arch/mips/include/asm/mach-loongson64/mc146818rtc.h
rename to arch/mips/include/asm/mach-loongson2ef/mc146818rtc.h
index ebdccfee50be..7b42c9efccc0 100644
--- a/arch/mips/include/asm/mach-loongson64/mc146818rtc.h
+++ b/arch/mips/include/asm/mach-loongson2ef/mc146818rtc.h
@@ -1,8 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
  * Copyright (C) 1998, 2001, 03, 07 by Ralf Baechle (ralf@linux-mips.org)
  *
  * RTC routines for PC style attached Dallas chip.
diff --git a/arch/mips/include/asm/mach-loongson64/mem.h b/arch/mips/include/asm/mach-loongson2ef/mem.h
similarity index 86%
rename from arch/mips/include/asm/mach-loongson64/mem.h
rename to arch/mips/include/asm/mach-loongson2ef/mem.h
index ce33c174c04d..d1d759b8974e 100644
--- a/arch/mips/include/asm/mach-loongson64/mem.h
+++ b/arch/mips/include/asm/mach-loongson2ef/mem.h
@@ -4,8 +4,8 @@
  * Author: Wu Zhangjin <wuzhangjin@gmail.com>
  */
 
-#ifndef __ASM_MACH_LOONGSON64_MEM_H
-#define __ASM_MACH_LOONGSON64_MEM_H
+#ifndef __ASM_MACH_LOONGSON2EF_MEM_H
+#define __ASM_MACH_LOONGSON2EF_MEM_H
 
 /*
  * high memory space
@@ -34,4 +34,4 @@
 #define LOONGSON_MMIO_MEM_END	0x80000000
 #endif
 
-#endif /* __ASM_MACH_LOONGSON64_MEM_H */
+#endif /* __ASM_MACH_LOONGSON2EF_MEM_H */
diff --git a/arch/mips/include/asm/mach-loongson2ef/pci.h b/arch/mips/include/asm/mach-loongson2ef/pci.h
new file mode 100644
index 000000000000..df65d3c14896
--- /dev/null
+++ b/arch/mips/include/asm/mach-loongson2ef/pci.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2008 Zhang Le <r0bertz@gentoo.org>
+ * Copyright (c) 2009 Wu Zhangjin <wuzhangjin@gmail.com>
+ */
+
+#ifndef __ASM_MACH_LOONGSON2EF_PCI_H_
+#define __ASM_MACH_LOONGSON2EF_PCI_H_
+
+extern struct pci_ops loongson_pci_ops;
+
+/* this is an offset from mips_io_port_base */
+#define LOONGSON_PCI_IO_START	0x00004000UL
+
+#ifdef CONFIG_CPU_SUPPORTS_ADDRWINCFG
+
+/*
+ * we use address window2 to map cpu address space to pci space
+ * window2: cpu [1G, 2G] -> pci [1G, 2G]
+ * why not use window 0 & 1? because they are used by cpu when booting.
+ * window0: cpu [0, 256M] -> ddr [0, 256M]
+ * window1: cpu [256M, 512M] -> pci [256M, 512M]
+ */
+
+/* the smallest LOONGSON_CPU_MEM_SRC can be 512M */
+#define LOONGSON_CPU_MEM_SRC	0x40000000ul		/* 1G */
+#define LOONGSON_PCI_MEM_DST	LOONGSON_CPU_MEM_SRC
+
+#define LOONGSON_PCI_MEM_START	LOONGSON_PCI_MEM_DST
+#define LOONGSON_PCI_MEM_END	(0x80000000ul-1)	/* 2G */
+
+#define MMAP_CPUTOPCI_SIZE	(LOONGSON_PCI_MEM_END - \
+					LOONGSON_PCI_MEM_START + 1)
+
+#else	/* loongson2f/32bit & loongson2e */
+
+/* this pci memory space is mapped by pcimap in pci.c */
+#define LOONGSON_PCI_MEM_START	LOONGSON_PCILO1_BASE
+#define LOONGSON_PCI_MEM_END	(LOONGSON_PCILO1_BASE + 0x04000000 * 2)
+
+#endif	/* !CONFIG_CPU_SUPPORTS_ADDRWINCFG */
+
+#endif /* !__ASM_MACH_LOONGSON2EF_PCI_H_ */
diff --git a/arch/mips/include/asm/mach-loongson2ef/spaces.h b/arch/mips/include/asm/mach-loongson2ef/spaces.h
new file mode 100644
index 000000000000..ba4e8e9b618e
--- /dev/null
+++ b/arch/mips/include/asm/mach-loongson2ef/spaces.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_MACH_LOONGSON2EF_SPACES_H_
+#define __ASM_MACH_LOONGSON2EF_SPACES_H_
+
+#if defined(CONFIG_64BIT)
+#define CAC_BASE        _AC(0x9800000000000000, UL)
+#endif /* CONFIG_64BIT */
+
+#include <asm/mach-generic/spaces.h>
+#endif
diff --git a/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h b/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h
index 153b6042e174..e70e8abc8348 100644
--- a/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h
@@ -44,11 +44,8 @@
 #define cpu_has_vtag_icache	0
 #define cpu_has_watch		1
 #define cpu_has_local_ebase	0
-
-#ifdef CONFIG_CPU_LOONGSON64
 #define cpu_has_wsbh		1
 #define cpu_has_ic_fills_f_dc	1
 #define cpu_hwrena_impl_bits	0xc0000000
-#endif
 
 #endif /* __ASM_MACH_LOONGSON64_CPU_FEATURE_OVERRIDES_H */
diff --git a/arch/mips/include/asm/mach-loongson64/irq.h b/arch/mips/include/asm/mach-loongson64/irq.h
index 557e069c400c..baed43285163 100644
--- a/arch/mips/include/asm/mach-loongson64/irq.h
+++ b/arch/mips/include/asm/mach-loongson64/irq.h
@@ -2,10 +2,9 @@
 #ifndef __ASM_MACH_LOONGSON64_IRQ_H_
 #define __ASM_MACH_LOONGSON64_IRQ_H_
 
+#include <loongson64.h>
 #include <boot_param.h>
 
-#ifdef CONFIG_CPU_LOONGSON64
-
 /* cpu core interrupt numbers */
 #define MIPS_CPU_IRQ_BASE 56
 
@@ -35,10 +34,8 @@
 
 #define LOONGSON_INT_COREx_INTy(x, y)	(1<<(x) | 1<<(y+4))	/* route to int y of core x */
 
-#endif
-
 extern void fixup_irqs(void);
-extern void loongson3_ipi_interrupt(struct pt_regs *regs);
+extern void loongson3_ipi_interrupt(void);
 
 #include_next <irq.h>
 #endif /* __ASM_MACH_LOONGSON64_IRQ_H_ */
diff --git a/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h b/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
deleted file mode 100644
index 74d94fc1ed53..000000000000
--- a/arch/mips/include/asm/mach-loongson64/kernel-entry-init.h
+++ /dev/null
@@ -1,74 +0,0 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 2005 Embedded Alley Solutions, Inc
- * Copyright (C) 2005 Ralf Baechle (ralf@linux-mips.org)
- * Copyright (C) 2009 Jiajie Chen (chenjiajie@cse.buaa.edu.cn)
- * Copyright (C) 2012 Huacai Chen (chenhc@lemote.com)
- */
-#ifndef __ASM_MACH_LOONGSON64_KERNEL_ENTRY_H
-#define __ASM_MACH_LOONGSON64_KERNEL_ENTRY_H
-
-#include <asm/cpu.h>
-
-/*
- * Override macros used in arch/mips/kernel/head.S.
- */
-	.macro	kernel_entry_setup
-#ifdef CONFIG_CPU_LOONGSON64
-	.set	push
-	.set	mips64
-	/* Set LPA on LOONGSON3 config3 */
-	mfc0	t0, CP0_CONFIG3
-	or	t0, (0x1 << 7)
-	mtc0	t0, CP0_CONFIG3
-	/* Set ELPA on LOONGSON3 pagegrain */
-	mfc0	t0, CP0_PAGEGRAIN
-	or	t0, (0x1 << 29)
-	mtc0	t0, CP0_PAGEGRAIN
-	/* Enable STFill Buffer */
-	mfc0	t0, CP0_PRID
-	andi	t0, (PRID_IMP_MASK | PRID_REV_MASK)
-	slti	t0, (PRID_IMP_LOONGSON_64 | PRID_REV_LOONGSON3A_R2_0)
-	bnez	t0, 1f
-	mfc0	t0, CP0_CONFIG6
-	or	t0, 0x100
-	mtc0	t0, CP0_CONFIG6
-1:
-	_ehb
-	.set	pop
-#endif
-	.endm
-
-/*
- * Do SMP slave processor setup.
- */
-	.macro	smp_slave_setup
-#ifdef CONFIG_CPU_LOONGSON64
-	.set	push
-	.set	mips64
-	/* Set LPA on LOONGSON3 config3 */
-	mfc0	t0, CP0_CONFIG3
-	or	t0, (0x1 << 7)
-	mtc0	t0, CP0_CONFIG3
-	/* Set ELPA on LOONGSON3 pagegrain */
-	mfc0	t0, CP0_PAGEGRAIN
-	or	t0, (0x1 << 29)
-	mtc0	t0, CP0_PAGEGRAIN
-	/* Enable STFill Buffer */
-	mfc0	t0, CP0_PRID
-	andi	t0, (PRID_IMP_MASK | PRID_REV_MASK)
-	slti	t0, (PRID_IMP_LOONGSON_64 | PRID_REV_LOONGSON3A_R2_0)
-	bnez	t0, 1f
-	mfc0	t0, CP0_CONFIG6
-	or	t0, 0x100
-	mtc0	t0, CP0_CONFIG6
-1:
-	_ehb
-	.set	pop
-#endif
-	.endm
-
-#endif /* __ASM_MACH_LOONGSON64_KERNEL_ENTRY_H */
diff --git a/arch/mips/include/asm/mach-loongson64/loongson64.h b/arch/mips/include/asm/mach-loongson64/loongson64.h
new file mode 100644
index 000000000000..d877adb99d33
--- /dev/null
+++ b/arch/mips/include/asm/mach-loongson64/loongson64.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2019 Jiaxun Yang <jiaxun.yang@flygoat.com>
+ * 
+ * Generic definitions for MACH_LOONGSON64 
+ */
+
+#ifndef __ASM_MACH_LOONGSON64_LOONGSON64_H
+#define __ASM_MACH_LOONGSON64_LOONGSON64_H
+
+#include <linux/types.h>
+#include <linux/init.h>
+
+#define MAX_PACKAGES 4
+
+#define LOONGSON_REG_BASE	0x1fe00000
+#define LOONGSON_REGBASE	0x100
+
+#define LOONGSON3_REG_BASE	0x3ff00000
+#define LOONGSON3_REG_SIZE	0x00100000	/* 256Bytes + 256Bytes + ??? */
+#define LOONGSON3_REG_TOP	(LOONGSON3_REG_BASE+LOONGSON3_REG_SIZE-1)
+
+#define LOONGSON_REG(x) \
+	(*(volatile u32 *)((char *)CKSEG1ADDR(LOONGSON_REG_BASE) + (x)))
+
+#define LOONGSON3_REG8(base, x) \
+	(*(volatile u8 *)((char *)TO_UNCAC(base) + (x)))
+
+#define LOONGSON3_REG32(base, x) \
+	(*(volatile u32 *)((char *)TO_UNCAC(base) + (x)))/* Loongson-3 specific registers */
+
+#define LOONGSON_PCIIO_SIZE	0x00100000	/* 1M */
+
+/* Chip Config registor of each physical cpu package, PRid >= Loongson-2F */
+extern u64 loongson_chipcfg[MAX_PACKAGES];
+#define LOONGSON_CHIPCFG(id) (*(volatile u32 *)(loongson_chipcfg[id]))
+
+/* Chip Temperature registor of each physical cpu package, PRid >= Loongson-3A */
+extern u64 loongson_chiptemp[MAX_PACKAGES];
+#define LOONGSON_CHIPTEMP(id) (*(volatile u32 *)(loongson_chiptemp[id]))
+
+/* Freq Control register of each physical cpu package, PRid >= Loongson-3B */
+extern u64 loongson_freqctrl[MAX_PACKAGES];
+#define LOONGSON_FREQCTRL(id) (*(volatile u32 *)(loongson_freqctrl[id]))
+
+extern const struct plat_smp_ops loongson3_smp_ops;
+extern void __init prom_init_lefi(void);
+#endif
diff --git a/arch/mips/include/asm/mach-loongson64/mmzone.h b/arch/mips/include/asm/mach-loongson64/mmzone.h
index 62073d60739f..eec8057d3ec9 100644
--- a/arch/mips/include/asm/mach-loongson64/mmzone.h
+++ b/arch/mips/include/asm/mach-loongson64/mmzone.h
@@ -19,30 +19,14 @@
 #define pa_to_nid(addr)  (((addr) & 0xf00000000000) >> NODE_ADDRSPACE_SHIFT)
 #define nid_to_addrbase(nid) ((nid) << NODE_ADDRSPACE_SHIFT)
 
-#define LEVELS_PER_SLICE 128
-
-struct slice_data {
-	unsigned long irq_enable_mask[2];
-	int level_to_irq[LEVELS_PER_SLICE];
-};
-
-struct hub_data {
-	cpumask_t	h_cpus;
-	unsigned long slice_map;
-	unsigned long irq_alloc_mask[2];
-	struct slice_data slice[2];
-};
-
 struct node_data {
 	struct pglist_data pglist;
-	struct hub_data hub;
 	cpumask_t cpumask;
 };
 
 extern struct node_data *__node_data[];
 
 #define NODE_DATA(n)		(&__node_data[(n)]->pglist)
-#define hub_data(n)		(&__node_data[(n)]->hub)
 
 extern void setup_zero_pages(void);
 extern void __init prom_init_numa_memory(void);
diff --git a/arch/mips/include/asm/mach-loongson64/pci.h b/arch/mips/include/asm/mach-loongson64/pci.h
index 05cc9052772f..a30024499590 100644
--- a/arch/mips/include/asm/mach-loongson64/pci.h
+++ b/arch/mips/include/asm/mach-loongson64/pci.h
@@ -4,47 +4,12 @@
  * Copyright (c) 2009 Wu Zhangjin <wuzhangjin@gmail.com>
  */
 
-#ifndef __ASM_MACH_LOONGSON64_PCI_H_
-#define __ASM_MACH_LOONGSON64_PCI_H_
+#ifndef __ASM_MACH_LOONGSON2EF_PCI_H_
+#define __ASM_MACH_LOONGSON2EF_PCI_H_
 
 extern struct pci_ops loongson_pci_ops;
 
-/* this is an offset from mips_io_port_base */
-#define LOONGSON_PCI_IO_START	0x00004000UL
-
-#ifdef CONFIG_CPU_SUPPORTS_ADDRWINCFG
-
-/*
- * we use address window2 to map cpu address space to pci space
- * window2: cpu [1G, 2G] -> pci [1G, 2G]
- * why not use window 0 & 1? because they are used by cpu when booting.
- * window0: cpu [0, 256M] -> ddr [0, 256M]
- * window1: cpu [256M, 512M] -> pci [256M, 512M]
- */
-
-/* the smallest LOONGSON_CPU_MEM_SRC can be 512M */
-#define LOONGSON_CPU_MEM_SRC	0x40000000ul		/* 1G */
-#define LOONGSON_PCI_MEM_DST	LOONGSON_CPU_MEM_SRC
-
-#define LOONGSON_PCI_MEM_START	LOONGSON_PCI_MEM_DST
-#define LOONGSON_PCI_MEM_END	(0x80000000ul-1)	/* 2G */
-
-#define MMAP_CPUTOPCI_SIZE	(LOONGSON_PCI_MEM_END - \
-					LOONGSON_PCI_MEM_START + 1)
-
-#else	/* loongson2f/32bit & loongson2e */
-
-/* this pci memory space is mapped by pcimap in pci.c */
-#ifdef CONFIG_CPU_LOONGSON64
 #define LOONGSON_PCI_MEM_START	0x40000000UL
 #define LOONGSON_PCI_MEM_END	0x7effffffUL
-#else
-#define LOONGSON_PCI_MEM_START	LOONGSON_PCILO1_BASE
-#define LOONGSON_PCI_MEM_END	(LOONGSON_PCILO1_BASE + 0x04000000 * 2)
-#endif
-/* this is an offset from mips_io_port_base */
-#define LOONGSON_PCI_IO_START	0x00004000UL
-
-#endif	/* !CONFIG_CPU_SUPPORTS_ADDRWINCFG */
 
-#endif /* !__ASM_MACH_LOONGSON64_PCI_H_ */
+#endif /* !__ASM_MACH_LOONGSON2EF_PCI_H_ */
diff --git a/arch/mips/include/asm/mach-loongson64/workarounds.h b/arch/mips/include/asm/mach-loongson64/workarounds.h
index 17b71172a097..e30415bef7b7 100644
--- a/arch/mips/include/asm/mach-loongson64/workarounds.h
+++ b/arch/mips/include/asm/mach-loongson64/workarounds.h
@@ -2,7 +2,7 @@
 #ifndef __ASM_MACH_LOONGSON64_WORKAROUNDS_H_
 #define __ASM_MACH_LOONGSON64_WORKAROUNDS_H_
 
-#define WORKAROUND_CPUFREQ	0x00000001
-#define WORKAROUND_CPUHOTPLUG	0x00000002
+#define WORKAROUND_CPUFREQ	BIT(1)
+#define WORKAROUND_CPUHOTPLUG   BIT(2)
 
 #endif
diff --git a/arch/mips/loongson2ef/Kconfig b/arch/mips/loongson2ef/Kconfig
new file mode 100644
index 000000000000..cb2f523d9e30
--- /dev/null
+++ b/arch/mips/loongson2ef/Kconfig
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: GPL-2.0
+if MACH_LOONGSON2EF
+
+choice
+	prompt "Machine Type"
+
+config LEMOTE_FULOONG2E
+	bool "Lemote Fuloong(2e) mini-PC"
+	select ARCH_SPARSEMEM_ENABLE
+	select ARCH_MIGHT_HAVE_PC_PARPORT
+	select ARCH_MIGHT_HAVE_PC_SERIO
+	select CEVT_R4K
+	select CSRC_R4K
+	select SYS_HAS_CPU_LOONGSON2E
+	select DMA_NONCOHERENT
+	select BOOT_ELF32
+	select BOARD_SCACHE
+	select HAVE_PCI
+	select I8259
+	select ISA
+	select IRQ_MIPS_CPU
+	select SYS_SUPPORTS_64BIT_KERNEL
+	select SYS_SUPPORTS_LITTLE_ENDIAN
+	select SYS_SUPPORTS_HIGHMEM
+	select SYS_HAS_EARLY_PRINTK
+	select GENERIC_ISA_DMA_SUPPORT_BROKEN
+	select CPU_HAS_WB
+	select LOONGSON_MC146818
+	help
+	  Lemote Fuloong(2e) mini-PC board based on the Chinese Loongson-2E CPU and
+	  an FPGA northbridge
+
+	  Lemote Fuloong(2e) mini PC have a VIA686B south bridge.
+
+config LEMOTE_MACH2F
+	bool "Lemote Loongson 2F family machines"
+	select ARCH_SPARSEMEM_ENABLE
+	select ARCH_MIGHT_HAVE_PC_PARPORT
+	select ARCH_MIGHT_HAVE_PC_SERIO
+	select BOARD_SCACHE
+	select BOOT_ELF32
+	select CEVT_R4K if ! MIPS_EXTERNAL_TIMER
+	select CPU_HAS_WB
+	select CS5536
+	select CSRC_R4K if ! MIPS_EXTERNAL_TIMER
+	select DMA_NONCOHERENT
+	select GENERIC_ISA_DMA_SUPPORT_BROKEN
+	select HAVE_CLK
+	select HAVE_PCI
+	select I8259
+	select IRQ_MIPS_CPU
+	select ISA
+	select SYS_HAS_CPU_LOONGSON2F
+	select SYS_HAS_EARLY_PRINTK
+	select SYS_SUPPORTS_64BIT_KERNEL
+	select SYS_SUPPORTS_HIGHMEM
+	select SYS_SUPPORTS_LITTLE_ENDIAN
+	select LOONGSON_MC146818
+	help
+	  Lemote Loongson 2F family machines utilize the 2F revision of
+	  Loongson processor and the AMD CS5536 south bridge.
+
+	  These family machines include fuloong2f mini PC, yeeloong2f notebook,
+	  LingLoong allinone PC and so forth.
+
+endchoice
+
+config CS5536
+	bool
+
+config CS5536_MFGPT
+	bool "CS5536 MFGPT Timer"
+	depends on CS5536 && !HIGH_RES_TIMERS
+	select MIPS_EXTERNAL_TIMER
+	help
+	  This option enables the mfgpt0 timer of AMD CS5536. With this timer
+	  switched on you can not use high resolution timers.
+
+	  If you want to enable the Loongson2 CPUFreq Driver, Please enable
+	  this option at first, otherwise, You will get wrong system time.
+
+	  If unsure, say Yes.
+
+config LOONGSON_UART_BASE
+	bool
+	default y
+	depends on EARLY_PRINTK || SERIAL_8250
+
+config LOONGSON_MC146818
+	bool
+	default n
+
+endif # MACH_LOONGSON2EF
diff --git a/arch/mips/loongson2ef/Makefile b/arch/mips/loongson2ef/Makefile
new file mode 100644
index 000000000000..0535d244d75b
--- /dev/null
+++ b/arch/mips/loongson2ef/Makefile
@@ -0,0 +1,18 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Common code for all Loongson based systems
+#
+
+obj-y += common/
+
+#
+# Lemote Fuloong mini-PC (Loongson 2E-based)
+#
+
+obj-$(CONFIG_LEMOTE_FULOONG2E)	+= fuloong-2e/
+
+#
+# Lemote loongson2f family machines
+#
+
+obj-$(CONFIG_LEMOTE_MACH2F)  += lemote-2f/
diff --git a/arch/mips/loongson2ef/Platform b/arch/mips/loongson2ef/Platform
new file mode 100644
index 000000000000..3aca42963f35
--- /dev/null
+++ b/arch/mips/loongson2ef/Platform
@@ -0,0 +1,32 @@
+#
+# Loongson Processors' Support
+#
+
+# Only gcc >= 4.4 have Loongson specific support
+cflags-$(CONFIG_CPU_LOONGSON2EF)	+= -Wa,--trap
+cflags-$(CONFIG_CPU_LOONGSON2E) += \
+	$(call cc-option,-march=loongson2e,-march=r4600)
+cflags-$(CONFIG_CPU_LOONGSON2F) += \
+	$(call cc-option,-march=loongson2f,-march=r4600)
+# Enable the workarounds for Loongson2f
+ifdef CONFIG_CPU_LOONGSON2F_WORKAROUNDS
+  ifeq ($(call as-option,-Wa$(comma)-mfix-loongson2f-nop,),)
+    $(error only binutils >= 2.20.2 have needed option -mfix-loongson2f-nop)
+  else
+    cflags-$(CONFIG_CPU_NOP_WORKAROUNDS) += -Wa$(comma)-mfix-loongson2f-nop
+  endif
+  ifeq ($(call as-option,-Wa$(comma)-mfix-loongson2f-jump,),)
+    $(error only binutils >= 2.20.2 have needed option -mfix-loongson2f-jump)
+  else
+    cflags-$(CONFIG_CPU_JUMP_WORKAROUNDS) += -Wa$(comma)-mfix-loongson2f-jump
+  endif
+endif
+
+#
+# Loongson Machines' Support
+#
+
+platform-$(CONFIG_MACH_LOONGSON2EF) += loongson2ef/
+cflags-$(CONFIG_MACH_LOONGSON2EF) += -I$(srctree)/arch/mips/include/asm/mach-loongson2ef -mno-branch-likely
+load-$(CONFIG_LEMOTE_FULOONG2E) += 0xffffffff80100000
+load-$(CONFIG_LEMOTE_MACH2F) += 0xffffffff80200000
diff --git a/arch/mips/loongson64/common/Makefile b/arch/mips/loongson2ef/common/Makefile
similarity index 100%
rename from arch/mips/loongson64/common/Makefile
rename to arch/mips/loongson2ef/common/Makefile
diff --git a/arch/mips/loongson64/common/bonito-irq.c b/arch/mips/loongson2ef/common/bonito-irq.c
similarity index 97%
rename from arch/mips/loongson64/common/bonito-irq.c
rename to arch/mips/loongson2ef/common/bonito-irq.c
index 82352cc25e4c..e59248c53bc5 100644
--- a/arch/mips/loongson64/common/bonito-irq.c
+++ b/arch/mips/loongson2ef/common/bonito-irq.c
@@ -10,7 +10,7 @@
 #include <linux/interrupt.h>
 #include <linux/compiler.h>
 
-#include <loongson.h>
+#include <loongson2ef.h>
 
 static inline void bonito_irq_enable(struct irq_data *d)
 {
diff --git a/arch/mips/loongson64/common/cmdline.c b/arch/mips/loongson2ef/common/cmdline.c
similarity index 97%
rename from arch/mips/loongson64/common/cmdline.c
rename to arch/mips/loongson2ef/common/cmdline.c
index a735460682cf..ab126a7cefdc 100644
--- a/arch/mips/loongson64/common/cmdline.c
+++ b/arch/mips/loongson2ef/common/cmdline.c
@@ -15,7 +15,7 @@
  */
 #include <asm/bootinfo.h>
 
-#include <loongson.h>
+#include <loongson2ef.h>
 
 void __init prom_init_cmdline(void)
 {
diff --git a/arch/mips/loongson64/common/cs5536/Makefile b/arch/mips/loongson2ef/common/cs5536/Makefile
similarity index 100%
rename from arch/mips/loongson64/common/cs5536/Makefile
rename to arch/mips/loongson2ef/common/cs5536/Makefile
diff --git a/arch/mips/loongson64/common/cs5536/cs5536_acc.c b/arch/mips/loongson2ef/common/cs5536/cs5536_acc.c
similarity index 100%
rename from arch/mips/loongson64/common/cs5536/cs5536_acc.c
rename to arch/mips/loongson2ef/common/cs5536/cs5536_acc.c
diff --git a/arch/mips/loongson64/common/cs5536/cs5536_ehci.c b/arch/mips/loongson2ef/common/cs5536/cs5536_ehci.c
similarity index 100%
rename from arch/mips/loongson64/common/cs5536/cs5536_ehci.c
rename to arch/mips/loongson2ef/common/cs5536/cs5536_ehci.c
diff --git a/arch/mips/loongson64/common/cs5536/cs5536_ide.c b/arch/mips/loongson2ef/common/cs5536/cs5536_ide.c
similarity index 100%
rename from arch/mips/loongson64/common/cs5536/cs5536_ide.c
rename to arch/mips/loongson2ef/common/cs5536/cs5536_ide.c
diff --git a/arch/mips/loongson64/common/cs5536/cs5536_isa.c b/arch/mips/loongson2ef/common/cs5536/cs5536_isa.c
similarity index 100%
rename from arch/mips/loongson64/common/cs5536/cs5536_isa.c
rename to arch/mips/loongson2ef/common/cs5536/cs5536_isa.c
diff --git a/arch/mips/loongson64/common/cs5536/cs5536_mfgpt.c b/arch/mips/loongson2ef/common/cs5536/cs5536_mfgpt.c
similarity index 100%
rename from arch/mips/loongson64/common/cs5536/cs5536_mfgpt.c
rename to arch/mips/loongson2ef/common/cs5536/cs5536_mfgpt.c
diff --git a/arch/mips/loongson64/common/cs5536/cs5536_ohci.c b/arch/mips/loongson2ef/common/cs5536/cs5536_ohci.c
similarity index 100%
rename from arch/mips/loongson64/common/cs5536/cs5536_ohci.c
rename to arch/mips/loongson2ef/common/cs5536/cs5536_ohci.c
diff --git a/arch/mips/loongson64/common/cs5536/cs5536_pci.c b/arch/mips/loongson2ef/common/cs5536/cs5536_pci.c
similarity index 100%
rename from arch/mips/loongson64/common/cs5536/cs5536_pci.c
rename to arch/mips/loongson2ef/common/cs5536/cs5536_pci.c
diff --git a/arch/mips/loongson64/common/early_printk.c b/arch/mips/loongson2ef/common/early_printk.c
similarity index 97%
rename from arch/mips/loongson64/common/early_printk.c
rename to arch/mips/loongson2ef/common/early_printk.c
index 5e2a151aa30c..e22d16728e13 100644
--- a/arch/mips/loongson64/common/early_printk.c
+++ b/arch/mips/loongson2ef/common/early_printk.c
@@ -8,7 +8,7 @@
 #include <linux/serial_reg.h>
 #include <asm/setup.h>
 
-#include <loongson.h>
+#include <loongson2ef.h>
 
 #define PORT(base, offset) (u8 *)(base + offset)
 
diff --git a/arch/mips/loongson2ef/common/env.c b/arch/mips/loongson2ef/common/env.c
new file mode 100644
index 000000000000..03a8d0165d2e
--- /dev/null
+++ b/arch/mips/loongson2ef/common/env.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Based on Ocelot Linux port, which is
+ * Copyright 2001 MontaVista Software Inc.
+ * Author: jsun@mvista.com or jsun@junsun.net
+ *
+ * Copyright 2003 ICT CAS
+ * Author: Michael Guo <guoyi@ict.ac.cn>
+ *
+ * Copyright (C) 2007 Lemote Inc. & Institute of Computing Technology
+ * Author: Fuxin Zhang, zhangfx@lemote.com
+ *
+ * Copyright (C) 2009 Lemote Inc.
+ * Author: Wu Zhangjin, wuzhangjin@gmail.com
+ */
+#include <linux/export.h>
+#include <asm/bootinfo.h>
+#include <loongson2ef.h>
+
+u32 cpu_clock_freq;
+EXPORT_SYMBOL(cpu_clock_freq);
+
+unsigned long long smp_group[4];
+
+#define parse_even_earlier(res, option, p)				\
+do {									\
+	unsigned int tmp __maybe_unused;				\
+									\
+	if (strncmp(option, (char *)p, strlen(option)) == 0)		\
+		tmp = kstrtou32((char *)p + strlen(option"="), 10, &res); \
+} while (0)
+
+void __init prom_init_env(void)
+{
+	/* pmon passes arguments in 32bit pointers */
+	unsigned int processor_id;
+	int *_prom_envp;
+	long l;
+
+	/* firmware arguments are initialized in head.S */
+	_prom_envp = (int *)fw_arg2;
+
+	l = (long)*_prom_envp;
+	while (l != 0) {
+		parse_even_earlier(cpu_clock_freq, "cpuclock", l);
+		parse_even_earlier(memsize, "memsize", l);
+		parse_even_earlier(highmemsize, "highmemsize", l);
+		_prom_envp++;
+		l = (long)*_prom_envp;
+	}
+	if (memsize == 0)
+		memsize = 256;
+
+	pr_info("memsize=%u, highmemsize=%u\n", memsize, highmemsize);
+
+	if (cpu_clock_freq == 0) {
+		processor_id = (&current_cpu_data)->processor_id;
+		switch (processor_id & PRID_REV_MASK) {
+		case PRID_REV_LOONGSON2E:
+			cpu_clock_freq = 533080000;
+			break;
+		case PRID_REV_LOONGSON2F:
+			cpu_clock_freq = 797000000;
+			break;
+		default:
+			cpu_clock_freq = 100000000;
+			break;
+		}
+	}
+	pr_info("CpuClock = %u\n", cpu_clock_freq);
+}
diff --git a/arch/mips/loongson64/common/init.c b/arch/mips/loongson2ef/common/init.c
similarity index 90%
rename from arch/mips/loongson64/common/init.c
rename to arch/mips/loongson2ef/common/init.c
index 912fe61c4fc7..b65763818911 100644
--- a/arch/mips/loongson64/common/init.c
+++ b/arch/mips/loongson2ef/common/init.c
@@ -10,7 +10,7 @@
 #include <asm/smp-ops.h>
 #include <asm/cacheflush.h>
 
-#include <loongson.h>
+#include <loongson2ef.h>
 
 /* Loongson CPU address windows config space base address */
 unsigned long __maybe_unused _loongson_addrwincfg_base;
@@ -39,15 +39,10 @@ void __init prom_init(void)
 	set_io_port_base((unsigned long)
 		ioremap(LOONGSON_PCIIO_BASE, LOONGSON_PCIIO_SIZE));
 
-#ifdef CONFIG_NUMA
-	prom_init_numa_memory();
-#else
 	prom_init_memory();
-#endif
 
 	/*init the uart base address */
 	prom_init_uart_base();
-	register_smp_ops(&loongson3_smp_ops);
 	board_nmi_handler_setup = mips_nmi_setup;
 }
 
diff --git a/arch/mips/loongson64/common/irq.c b/arch/mips/loongson2ef/common/irq.c
similarity index 98%
rename from arch/mips/loongson64/common/irq.c
rename to arch/mips/loongson2ef/common/irq.c
index 0ea93c1c0a97..96d492511e41 100644
--- a/arch/mips/loongson64/common/irq.c
+++ b/arch/mips/loongson2ef/common/irq.c
@@ -6,7 +6,7 @@
 #include <linux/delay.h>
 #include <linux/interrupt.h>
 
-#include <loongson.h>
+#include <loongson2ef.h>
 /*
  * the first level int-handler will jump here if it is a bonito irq
  */
diff --git a/arch/mips/loongson64/common/machtype.c b/arch/mips/loongson2ef/common/machtype.c
similarity index 94%
rename from arch/mips/loongson64/common/machtype.c
rename to arch/mips/loongson2ef/common/machtype.c
index 4e42d929f1c7..d2ea4d25246a 100644
--- a/arch/mips/loongson64/common/machtype.c
+++ b/arch/mips/loongson2ef/common/machtype.c
@@ -8,7 +8,7 @@
 #include <linux/errno.h>
 #include <asm/bootinfo.h>
 
-#include <loongson.h>
+#include <loongson2ef.h>
 #include <machine.h>
 
 /* please ensure the length of the machtype string is less than 50 */
@@ -23,7 +23,6 @@ static const char *system_types[] = {
 	[MACH_DEXXON_GDIUM2F10]	= "dexxon-gdium-2f",
 	[MACH_LEMOTE_NAS]	= "lemote-nas-2f",
 	[MACH_LEMOTE_LL2F]	= "lemote-lynloong-2f",
-	[MACH_LOONGSON_GENERIC]	= "generic-loongson-machine",
 	[MACH_LOONGSON_END]	= NULL,
 };
 
diff --git a/arch/mips/loongson64/common/mem.c b/arch/mips/loongson2ef/common/mem.c
similarity index 72%
rename from arch/mips/loongson64/common/mem.c
rename to arch/mips/loongson2ef/common/mem.c
index 4abb92e0fc39..c90beb048233 100644
--- a/arch/mips/loongson64/common/mem.c
+++ b/arch/mips/loongson2ef/common/mem.c
@@ -7,12 +7,10 @@
 
 #include <asm/bootinfo.h>
 
-#include <loongson.h>
-#include <boot_param.h>
+#include <loongson2ef.h>
 #include <mem.h>
 #include <pci.h>
 
-#ifndef CONFIG_LEFI_FIRMWARE_INTERFACE
 
 u32 memsize, highmemsize;
 
@@ -51,42 +49,6 @@ void __init prom_init_memory(void)
 #endif /* !CONFIG_64BIT */
 }
 
-#else /* CONFIG_LEFI_FIRMWARE_INTERFACE */
-
-void __init prom_init_memory(void)
-{
-	int i;
-	u32 node_id;
-	u32 mem_type;
-
-	/* parse memory information */
-	for (i = 0; i < loongson_memmap->nr_map; i++) {
-		node_id = loongson_memmap->map[i].node_id;
-		mem_type = loongson_memmap->map[i].mem_type;
-
-		if (node_id == 0) {
-			switch (mem_type) {
-			case SYSTEM_RAM_LOW:
-				add_memory_region(loongson_memmap->map[i].mem_start,
-					(u64)loongson_memmap->map[i].mem_size << 20,
-					BOOT_MEM_RAM);
-				break;
-			case SYSTEM_RAM_HIGH:
-				add_memory_region(loongson_memmap->map[i].mem_start,
-					(u64)loongson_memmap->map[i].mem_size << 20,
-					BOOT_MEM_RAM);
-				break;
-			case SYSTEM_RAM_RESERVED:
-				add_memory_region(loongson_memmap->map[i].mem_start,
-					(u64)loongson_memmap->map[i].mem_size << 20,
-					BOOT_MEM_RESERVED);
-				break;
-			}
-		}
-	}
-}
-
-#endif /* CONFIG_LEFI_FIRMWARE_INTERFACE */
 
 /* override of arch/mips/mm/cache.c: __uncached_access */
 int __uncached_access(struct file *file, unsigned long addr)
diff --git a/arch/mips/loongson64/common/pci.c b/arch/mips/loongson2ef/common/pci.c
similarity index 89%
rename from arch/mips/loongson64/common/pci.c
rename to arch/mips/loongson2ef/common/pci.c
index 2d9755c49524..3df8d1695243 100644
--- a/arch/mips/loongson64/common/pci.c
+++ b/arch/mips/loongson2ef/common/pci.c
@@ -6,8 +6,7 @@
 #include <linux/pci.h>
 
 #include <pci.h>
-#include <loongson.h>
-#include <boot_param.h>
+#include <loongson2ef.h>
 
 static struct resource loongson_pci_mem_resource = {
 	.name	= "pci memory space",
@@ -81,16 +80,8 @@ static int __init pcibios_init(void)
 	setup_pcimap();
 
 	loongson_pci_controller.io_map_base = mips_io_port_base;
-#ifdef CONFIG_LEFI_FIRMWARE_INTERFACE
-	loongson_pci_mem_resource.start = loongson_sysconf.pci_mem_start_addr;
-	loongson_pci_mem_resource.end = loongson_sysconf.pci_mem_end_addr;
-#endif
 	register_pci_controller(&loongson_pci_controller);
 
-#ifdef CONFIG_CPU_LOONGSON64
-	sbx00_acpi_init();
-#endif
-
 	return 0;
 }
 
diff --git a/arch/mips/loongson64/common/platform.c b/arch/mips/loongson2ef/common/platform.c
similarity index 100%
rename from arch/mips/loongson64/common/platform.c
rename to arch/mips/loongson2ef/common/platform.c
diff --git a/arch/mips/loongson64/common/pm.c b/arch/mips/loongson2ef/common/pm.c
similarity index 99%
rename from arch/mips/loongson64/common/pm.c
rename to arch/mips/loongson2ef/common/pm.c
index b8aed878d912..0e3c9f245215 100644
--- a/arch/mips/loongson64/common/pm.c
+++ b/arch/mips/loongson2ef/common/pm.c
@@ -12,7 +12,7 @@
 #include <asm/i8259.h>
 #include <asm/mipsregs.h>
 
-#include <loongson.h>
+#include <loongson2ef.h>
 
 static unsigned int __maybe_unused cached_master_mask;	/* i8259A */
 static unsigned int __maybe_unused cached_slave_mask;
diff --git a/arch/mips/loongson64/common/reset.c b/arch/mips/loongson2ef/common/reset.c
similarity index 77%
rename from arch/mips/loongson64/common/reset.c
rename to arch/mips/loongson2ef/common/reset.c
index ce39e918e4d5..fc296ac979c6 100644
--- a/arch/mips/loongson64/common/reset.c
+++ b/arch/mips/loongson2ef/common/reset.c
@@ -12,8 +12,7 @@
 #include <asm/idle.h>
 #include <asm/reboot.h>
 
-#include <loongson.h>
-#include <boot_param.h>
+#include <loongson2ef.h>
 
 static inline void loongson_reboot(void)
 {
@@ -35,26 +34,15 @@ static inline void loongson_reboot(void)
 
 static void loongson_restart(char *command)
 {
-#ifndef CONFIG_LEFI_FIRMWARE_INTERFACE
 	/* do preparation for reboot */
 	mach_prepare_reboot();
 
 	/* reboot via jumping to boot base address */
 	loongson_reboot();
-#else
-	void (*fw_restart)(void) = (void *)loongson_sysconf.restart_addr;
-
-	fw_restart();
-	while (1) {
-		if (cpu_wait)
-			cpu_wait();
-	}
-#endif
 }
 
 static void loongson_poweroff(void)
 {
-#ifndef CONFIG_LEFI_FIRMWARE_INTERFACE
 	mach_prepare_shutdown();
 
 	/*
@@ -62,15 +50,6 @@ static void loongson_poweroff(void)
 	 * a generic delay loop, machine_hang(), so simply return.
 	 */
 	return;
-#else
-	void (*fw_poweroff)(void) = (void *)loongson_sysconf.poweroff_addr;
-
-	fw_poweroff();
-	while (1) {
-		if (cpu_wait)
-			cpu_wait();
-	}
-#endif
 }
 
 static void loongson_halt(void)
diff --git a/arch/mips/loongson64/common/rtc.c b/arch/mips/loongson2ef/common/rtc.c
similarity index 100%
rename from arch/mips/loongson64/common/rtc.c
rename to arch/mips/loongson2ef/common/rtc.c
diff --git a/arch/mips/loongson64/common/serial.c b/arch/mips/loongson2ef/common/serial.c
similarity index 63%
rename from arch/mips/loongson64/common/serial.c
rename to arch/mips/loongson2ef/common/serial.c
index ffefc1cb2612..4203486b1570 100644
--- a/arch/mips/loongson64/common/serial.c
+++ b/arch/mips/loongson2ef/common/serial.c
@@ -16,7 +16,7 @@
 
 #include <asm/bootinfo.h>
 
-#include <loongson.h>
+#include <loongson2ef.h>
 #include <machine.h>
 
 #define PORT(int, clk)			\
@@ -38,7 +38,7 @@
 	.regshift	= 0,					\
 }
 
-static struct plat_serial8250_port uart8250_data[][MAX_UARTS + 1] = {
+static struct plat_serial8250_port uart8250_data[][16] = {
 	[MACH_LOONGSON_UNKNOWN]	= {},
 	[MACH_LEMOTE_FL2E]	= {PORT(4, 1843200), {} },
 	[MACH_LEMOTE_FL2F]	= {PORT(3, 1843200), {} },
@@ -47,7 +47,6 @@ static struct plat_serial8250_port uart8250_data[][MAX_UARTS + 1] = {
 	[MACH_DEXXON_GDIUM2F10]	= {PORT_M(3, 3686400), {} },
 	[MACH_LEMOTE_NAS]	= {PORT_M(3, 3686400), {} },
 	[MACH_LEMOTE_LL2F]	= {PORT(3, 1843200), {} },
-	[MACH_LOONGSON_GENERIC]	= {PORT_M(2, 25000000), {} },
 	[MACH_LOONGSON_END]	= {},
 };
 
@@ -58,7 +57,6 @@ static struct platform_device uart8250_device = {
 
 static int __init serial_init(void)
 {
-	int i;
 	unsigned char iotype;
 
 	iotype = uart8250_data[mips_machtype][0].iotype;
@@ -73,36 +71,7 @@ static int __init serial_init(void)
 		uart8250_data[mips_machtype][0].iobase =
 			loongson_uart_base[0] - LOONGSON_PCIIO_BASE;
 
-	if (loongson_sysconf.uarts[0].uartclk)
-		uart8250_data[mips_machtype][0].uartclk =
-			loongson_sysconf.uarts[0].uartclk;
-
-	for (i = 1; i < loongson_sysconf.nr_uarts; i++) {
-		iotype = loongson_sysconf.uarts[i].iotype;
-		uart8250_data[mips_machtype][i].iotype = iotype;
-		loongson_uart_base[i] = loongson_sysconf.uarts[i].uart_base;
-
-		if (UPIO_MEM == iotype) {
-			uart8250_data[mips_machtype][i].irq =
-				MIPS_CPU_IRQ_BASE + loongson_sysconf.uarts[i].int_offset;
-			uart8250_data[mips_machtype][i].mapbase =
-				loongson_uart_base[i];
-			uart8250_data[mips_machtype][i].membase =
-				ioremap_nocache(loongson_uart_base[i], 8);
-		} else if (UPIO_PORT == iotype) {
-			uart8250_data[mips_machtype][i].irq =
-				loongson_sysconf.uarts[i].int_offset;
-			uart8250_data[mips_machtype][i].iobase =
-				loongson_uart_base[i] - LOONGSON_PCIIO_BASE;
-		}
-
-		uart8250_data[mips_machtype][i].uartclk =
-			loongson_sysconf.uarts[i].uartclk;
-		uart8250_data[mips_machtype][i].flags =
-			UPF_BOOT_AUTOCONF | UPF_SKIP_TEST;
-	}
-
-	memset(&uart8250_data[mips_machtype][loongson_sysconf.nr_uarts],
+	memset(&uart8250_data[mips_machtype][1],
 			0, sizeof(struct plat_serial8250_port));
 	uart8250_device.dev.platform_data = uart8250_data[mips_machtype];
 
diff --git a/arch/mips/loongson64/common/setup.c b/arch/mips/loongson2ef/common/setup.c
similarity index 97%
rename from arch/mips/loongson64/common/setup.c
rename to arch/mips/loongson2ef/common/setup.c
index bc2da4c140c4..278d2b62d9a6 100644
--- a/arch/mips/loongson64/common/setup.c
+++ b/arch/mips/loongson2ef/common/setup.c
@@ -9,7 +9,7 @@
 #include <asm/wbflush.h>
 #include <asm/bootinfo.h>
 
-#include <loongson.h>
+#include <loongson2ef.h>
 
 #ifdef CONFIG_VT
 #include <linux/console.h>
diff --git a/arch/mips/loongson64/common/time.c b/arch/mips/loongson2ef/common/time.c
similarity index 96%
rename from arch/mips/loongson64/common/time.c
rename to arch/mips/loongson2ef/common/time.c
index e78760ce475b..b29f89a9db8e 100644
--- a/arch/mips/loongson64/common/time.c
+++ b/arch/mips/loongson2ef/common/time.c
@@ -10,7 +10,7 @@
 #include <asm/time.h>
 #include <asm/hpet.h>
 
-#include <loongson.h>
+#include <loongson2ef.h>
 #include <cs5536/cs5536_mfgpt.h>
 
 void __init plat_time_init(void)
diff --git a/arch/mips/loongson64/common/uart_base.c b/arch/mips/loongson2ef/common/uart_base.c
similarity index 77%
rename from arch/mips/loongson64/common/uart_base.c
rename to arch/mips/loongson2ef/common/uart_base.c
index e88d937f10fe..27d073f1cd48 100644
--- a/arch/mips/loongson64/common/uart_base.c
+++ b/arch/mips/loongson2ef/common/uart_base.c
@@ -7,12 +7,12 @@
 #include <linux/export.h>
 #include <asm/bootinfo.h>
 
-#include <loongson.h>
+#include <loongson2ef.h>
 
 /* raw */
-unsigned long loongson_uart_base[MAX_UARTS] = {};
+unsigned long loongson_uart_base[16] = {};
 /* ioremapped */
-unsigned long _loongson_uart_base[MAX_UARTS] = {};
+unsigned long _loongson_uart_base[16] = {};
 
 EXPORT_SYMBOL(loongson_uart_base);
 EXPORT_SYMBOL(_loongson_uart_base);
@@ -20,10 +20,6 @@ EXPORT_SYMBOL(_loongson_uart_base);
 void prom_init_loongson_uart_base(void)
 {
 	switch (mips_machtype) {
-	case MACH_LOONGSON_GENERIC:
-		/* The CPU provided serial port (CPU) */
-		loongson_uart_base[0] = LOONGSON_REG_BASE + 0x1e0;
-		break;
 	case MACH_LEMOTE_FL2E:
 		loongson_uart_base[0] = LOONGSON_PCIIO_BASE + 0x3f8;
 		break;
diff --git a/arch/mips/loongson64/fuloong-2e/Makefile b/arch/mips/loongson2ef/fuloong-2e/Makefile
similarity index 100%
rename from arch/mips/loongson64/fuloong-2e/Makefile
rename to arch/mips/loongson2ef/fuloong-2e/Makefile
diff --git a/arch/mips/loongson64/fuloong-2e/dma.c b/arch/mips/loongson2ef/fuloong-2e/dma.c
similarity index 100%
rename from arch/mips/loongson64/fuloong-2e/dma.c
rename to arch/mips/loongson2ef/fuloong-2e/dma.c
diff --git a/arch/mips/loongson64/fuloong-2e/irq.c b/arch/mips/loongson2ef/fuloong-2e/irq.c
similarity index 98%
rename from arch/mips/loongson64/fuloong-2e/irq.c
rename to arch/mips/loongson2ef/fuloong-2e/irq.c
index 32278e7bf85c..caaf9e907dd2 100644
--- a/arch/mips/loongson64/fuloong-2e/irq.c
+++ b/arch/mips/loongson2ef/fuloong-2e/irq.c
@@ -8,7 +8,7 @@
 #include <asm/irq_cpu.h>
 #include <asm/i8259.h>
 
-#include <loongson.h>
+#include <loongson2ef.h>
 
 static void i8259_irqdispatch(void)
 {
diff --git a/arch/mips/loongson64/fuloong-2e/reset.c b/arch/mips/loongson2ef/fuloong-2e/reset.c
similarity index 93%
rename from arch/mips/loongson64/fuloong-2e/reset.c
rename to arch/mips/loongson2ef/fuloong-2e/reset.c
index 8273de1cf4bb..df60685d0626 100644
--- a/arch/mips/loongson64/fuloong-2e/reset.c
+++ b/arch/mips/loongson2ef/fuloong-2e/reset.c
@@ -6,7 +6,7 @@
  * Author: Wu Zhangjin, wuzhangjin@gmail.com
  */
 
-#include <loongson.h>
+#include <loongson2ef.h>
 
 void mach_prepare_reboot(void)
 {
diff --git a/arch/mips/loongson64/lemote-2f/Makefile b/arch/mips/loongson2ef/lemote-2f/Makefile
similarity index 100%
rename from arch/mips/loongson64/lemote-2f/Makefile
rename to arch/mips/loongson2ef/lemote-2f/Makefile
diff --git a/arch/mips/loongson64/lemote-2f/clock.c b/arch/mips/loongson2ef/lemote-2f/clock.c
similarity index 98%
rename from arch/mips/loongson64/lemote-2f/clock.c
rename to arch/mips/loongson2ef/lemote-2f/clock.c
index 8281334df9c8..83f7b9cabcd1 100644
--- a/arch/mips/loongson64/lemote-2f/clock.c
+++ b/arch/mips/loongson2ef/lemote-2f/clock.c
@@ -15,7 +15,7 @@
 #include <linux/spinlock.h>
 
 #include <asm/clock.h>
-#include <asm/mach-loongson64/loongson.h>
+#include <asm/mach-loongson2ef/loongson2ef.h>
 
 static LIST_HEAD(clock_list);
 static DEFINE_SPINLOCK(clock_lock);
diff --git a/arch/mips/loongson64/lemote-2f/dma.c b/arch/mips/loongson2ef/lemote-2f/dma.c
similarity index 100%
rename from arch/mips/loongson64/lemote-2f/dma.c
rename to arch/mips/loongson2ef/lemote-2f/dma.c
diff --git a/arch/mips/loongson64/lemote-2f/ec_kb3310b.c b/arch/mips/loongson2ef/lemote-2f/ec_kb3310b.c
similarity index 100%
rename from arch/mips/loongson64/lemote-2f/ec_kb3310b.c
rename to arch/mips/loongson2ef/lemote-2f/ec_kb3310b.c
diff --git a/arch/mips/loongson64/lemote-2f/ec_kb3310b.h b/arch/mips/loongson2ef/lemote-2f/ec_kb3310b.h
similarity index 100%
rename from arch/mips/loongson64/lemote-2f/ec_kb3310b.h
rename to arch/mips/loongson2ef/lemote-2f/ec_kb3310b.h
diff --git a/arch/mips/loongson64/lemote-2f/irq.c b/arch/mips/loongson2ef/lemote-2f/irq.c
similarity index 99%
rename from arch/mips/loongson64/lemote-2f/irq.c
rename to arch/mips/loongson2ef/lemote-2f/irq.c
index c58a044c6c07..2906f6fb2243 100644
--- a/arch/mips/loongson64/lemote-2f/irq.c
+++ b/arch/mips/loongson2ef/lemote-2f/irq.c
@@ -12,7 +12,7 @@
 #include <asm/i8259.h>
 #include <asm/mipsregs.h>
 
-#include <loongson.h>
+#include <loongson2ef.h>
 #include <machine.h>
 
 #define LOONGSON_TIMER_IRQ	(MIPS_CPU_IRQ_BASE + 7) /* cpu timer */
diff --git a/arch/mips/loongson64/lemote-2f/machtype.c b/arch/mips/loongson2ef/lemote-2f/machtype.c
similarity index 98%
rename from arch/mips/loongson64/lemote-2f/machtype.c
rename to arch/mips/loongson2ef/lemote-2f/machtype.c
index 9462a3ab57be..0200e4223771 100644
--- a/arch/mips/loongson64/lemote-2f/machtype.c
+++ b/arch/mips/loongson2ef/lemote-2f/machtype.c
@@ -5,7 +5,7 @@
  */
 #include <asm/bootinfo.h>
 
-#include <loongson.h>
+#include <loongson2ef.h>
 
 void __init mach_prom_init_machtype(void)
 {
diff --git a/arch/mips/loongson64/lemote-2f/pm.c b/arch/mips/loongson2ef/lemote-2f/pm.c
similarity index 99%
rename from arch/mips/loongson64/lemote-2f/pm.c
rename to arch/mips/loongson2ef/lemote-2f/pm.c
index 3d0027229e3c..339601752d40 100644
--- a/arch/mips/loongson64/lemote-2f/pm.c
+++ b/arch/mips/loongson2ef/lemote-2f/pm.c
@@ -16,7 +16,7 @@
 #include <asm/mipsregs.h>
 #include <asm/bootinfo.h>
 
-#include <loongson.h>
+#include <loongson2ef.h>
 
 #include <cs5536/cs5536_mfgpt.h>
 #include "ec_kb3310b.h"
diff --git a/arch/mips/loongson64/lemote-2f/reset.c b/arch/mips/loongson2ef/lemote-2f/reset.c
similarity index 99%
rename from arch/mips/loongson64/lemote-2f/reset.c
rename to arch/mips/loongson2ef/lemote-2f/reset.c
index 0db0934302ea..faec0d919889 100644
--- a/arch/mips/loongson64/lemote-2f/reset.c
+++ b/arch/mips/loongson2ef/lemote-2f/reset.c
@@ -13,7 +13,7 @@
 
 #include <asm/bootinfo.h>
 
-#include <loongson.h>
+#include <loongson2ef.h>
 
 #include <cs5536/cs5536.h>
 #include "ec_kb3310b.h"
diff --git a/arch/mips/loongson64/Kconfig b/arch/mips/loongson64/Kconfig
index d08b20ff2b27..025cd274146f 100644
--- a/arch/mips/loongson64/Kconfig
+++ b/arch/mips/loongson64/Kconfig
@@ -1,119 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 if MACH_LOONGSON64
 
-choice
-	prompt "Machine Type"
-
-config LEMOTE_FULOONG2E
-	bool "Lemote Fuloong(2e) mini-PC"
-	select ARCH_SPARSEMEM_ENABLE
-	select ARCH_MIGHT_HAVE_PC_PARPORT
-	select ARCH_MIGHT_HAVE_PC_SERIO
-	select CEVT_R4K
-	select CSRC_R4K
-	select SYS_HAS_CPU_LOONGSON2E
-	select DMA_NONCOHERENT
-	select BOOT_ELF32
-	select BOARD_SCACHE
-	select HAVE_PCI
-	select I8259
-	select ISA
-	select IRQ_MIPS_CPU
-	select SYS_SUPPORTS_64BIT_KERNEL
-	select SYS_SUPPORTS_LITTLE_ENDIAN
-	select SYS_SUPPORTS_HIGHMEM
-	select SYS_HAS_EARLY_PRINTK
-	select GENERIC_ISA_DMA_SUPPORT_BROKEN
-	select CPU_HAS_WB
-	select LOONGSON_MC146818
-	help
-	  Lemote Fuloong(2e) mini-PC board based on the Chinese Loongson-2E CPU and
-	  an FPGA northbridge
-
-	  Lemote Fuloong(2e) mini PC have a VIA686B south bridge.
-
-config LEMOTE_MACH2F
-	bool "Lemote Loongson 2F family machines"
-	select ARCH_SPARSEMEM_ENABLE
-	select ARCH_MIGHT_HAVE_PC_PARPORT
-	select ARCH_MIGHT_HAVE_PC_SERIO
-	select BOARD_SCACHE
-	select BOOT_ELF32
-	select CEVT_R4K if ! MIPS_EXTERNAL_TIMER
-	select CPU_HAS_WB
-	select CS5536
-	select CSRC_R4K if ! MIPS_EXTERNAL_TIMER
-	select DMA_NONCOHERENT
-	select GENERIC_ISA_DMA_SUPPORT_BROKEN
-	select HAVE_CLK
-	select HAVE_PCI
-	select I8259
-	select IRQ_MIPS_CPU
-	select ISA
-	select SYS_HAS_CPU_LOONGSON2F
-	select SYS_HAS_EARLY_PRINTK
-	select SYS_SUPPORTS_64BIT_KERNEL
-	select SYS_SUPPORTS_HIGHMEM
-	select SYS_SUPPORTS_LITTLE_ENDIAN
-	select LOONGSON_MC146818
-	help
-	  Lemote Loongson 2F family machines utilize the 2F revision of
-	  Loongson processor and the AMD CS5536 south bridge.
-
-	  These family machines include fuloong2f mini PC, yeeloong2f notebook,
-	  LingLoong allinone PC and so forth.
-
-config LOONGSON_MACH3X
-	bool "Generic Loongson 3 family machines"
-	select ARCH_SPARSEMEM_ENABLE
-	select ARCH_MIGHT_HAVE_PC_PARPORT
-	select ARCH_MIGHT_HAVE_PC_SERIO
-	select GENERIC_ISA_DMA_SUPPORT_BROKEN
-	select BOOT_ELF32
-	select BOARD_SCACHE
-	select CSRC_R4K
-	select CEVT_R4K
-	select CPU_HAS_WB
-	select FORCE_PCI
-	select ISA
-	select I8259
-	select IRQ_MIPS_CPU
-	select NR_CPUS_DEFAULT_4
-	select SYS_HAS_CPU_LOONGSON64
-	select SYS_HAS_EARLY_PRINTK
-	select SYS_SUPPORTS_SMP
-	select SYS_SUPPORTS_HOTPLUG_CPU
-	select SYS_SUPPORTS_NUMA
-	select SYS_SUPPORTS_64BIT_KERNEL
-	select SYS_SUPPORTS_HIGHMEM
-	select SYS_SUPPORTS_LITTLE_ENDIAN
-	select LOONGSON_MC146818
-	select ZONE_DMA32
-	select LEFI_FIRMWARE_INTERFACE
-	help
-		Generic Loongson 3 family machines utilize the 3A/3B revision
-		of Loongson processor and RS780/SBX00 chipset.
-endchoice
-
-config CS5536
-	bool
-
-config CS5536_MFGPT
-	bool "CS5536 MFGPT Timer"
-	depends on CS5536 && !HIGH_RES_TIMERS
-	select MIPS_EXTERNAL_TIMER
-	help
-	  This option enables the mfgpt0 timer of AMD CS5536. With this timer
-	  switched on you can not use high resolution timers.
-
-	  If you want to enable the Loongson2 CPUFreq Driver, Please enable
-	  this option at first, otherwise, You will get wrong system time.
-
-	  If unsure, say Yes.
-
 config RS780_HPET
 	bool "RS780/SBX00 HPET Timer"
-	depends on LOONGSON_MACH3X
+	depends on MACH_LOONGSON64
 	select MIPS_EXTERNAL_TIMER
 	help
 	  This option enables the hpet timer of AMD RS780/SBX00.
@@ -123,16 +13,4 @@ config RS780_HPET
 
 	  If unsure, say Yes.
 
-config LOONGSON_UART_BASE
-	bool
-	default y
-	depends on EARLY_PRINTK || SERIAL_8250
-
-config LOONGSON_MC146818
-	bool
-	default n
-
-config LEFI_FIRMWARE_INTERFACE
-	bool
-
-endif # MACH_LOONGSON64
+endif
diff --git a/arch/mips/loongson64/Makefile b/arch/mips/loongson64/Makefile
index c74bc0251e9d..3c92e04e3827 100644
--- a/arch/mips/loongson64/Makefile
+++ b/arch/mips/loongson64/Makefile
@@ -1,24 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
-# Common code for all Loongson based systems
+# Makefile for Loongson64 family machines
 #
+obj-y			+= irq.o cop2-ex.o platform.o acpi_init.o dma.o env.o platform.o reset.o setup.o pci.o
 
-obj-$(CONFIG_MACH_LOONGSON64) += common/
+obj-$(CONFIG_SMP)	+= smp.o
 
-#
-# Lemote Fuloong mini-PC (Loongson 2E-based)
-#
-
-obj-$(CONFIG_LEMOTE_FULOONG2E)	+= fuloong-2e/
-
-#
-# Lemote loongson2f family machines
-#
-
-obj-$(CONFIG_LEMOTE_MACH2F)  += lemote-2f/
-
-#
-# All Loongson-3 family machines
-#
+obj-$(CONFIG_NUMA)	+= numa.o
 
-obj-$(CONFIG_CPU_LOONGSON64)  += loongson-3/
+obj-$(CONFIG_RS780_HPET) += hpet.o
diff --git a/arch/mips/loongson64/Platform b/arch/mips/loongson64/Platform
index b4d2582eb1ef..7f4006833fa5 100644
--- a/arch/mips/loongson64/Platform
+++ b/arch/mips/loongson64/Platform
@@ -1,27 +1,7 @@
 #
-# Loongson Processors' Support
+# Loongson64 Processors' Support
 #
 
-# Only gcc >= 4.4 have Loongson specific support
-cflags-$(CONFIG_CPU_LOONGSON2EF)	+= -Wa,--trap
-cflags-$(CONFIG_CPU_LOONGSON2E) += \
-	$(call cc-option,-march=loongson2e,-march=r4600)
-cflags-$(CONFIG_CPU_LOONGSON2F) += \
-	$(call cc-option,-march=loongson2f,-march=r4600)
-# Enable the workarounds for Loongson2f
-ifdef CONFIG_CPU_LOONGSON2F_WORKAROUNDS
-  ifeq ($(call as-option,-Wa$(comma)-mfix-loongson2f-nop,),)
-    $(error only binutils >= 2.20.2 have needed option -mfix-loongson2f-nop)
-  else
-    cflags-$(CONFIG_CPU_NOP_WORKAROUNDS) += -Wa$(comma)-mfix-loongson2f-nop
-  endif
-  ifeq ($(call as-option,-Wa$(comma)-mfix-loongson2f-jump,),)
-    $(error only binutils >= 2.20.2 have needed option -mfix-loongson2f-jump)
-  else
-    cflags-$(CONFIG_CPU_JUMP_WORKAROUNDS) += -Wa$(comma)-mfix-loongson2f-jump
-  endif
-endif
-
 cflags-$(CONFIG_CPU_LOONGSON64)	+= -Wa,--trap
 
 #
@@ -72,6 +52,4 @@ endif
 
 platform-$(CONFIG_MACH_LOONGSON64) += loongson64/
 cflags-$(CONFIG_MACH_LOONGSON64) += -I$(srctree)/arch/mips/include/asm/mach-loongson64 -mno-branch-likely
-load-$(CONFIG_LEMOTE_FULOONG2E) += 0xffffffff80100000
-load-$(CONFIG_LEMOTE_MACH2F) += 0xffffffff80200000
-load-$(CONFIG_LOONGSON_MACH3X) += 0xffffffff80200000
+load-$(CONFIG_MACH_LOONGSON64) += 0xffffffff80200000
diff --git a/arch/mips/loongson64/loongson-3/acpi_init.c b/arch/mips/loongson64/acpi_init.c
similarity index 99%
rename from arch/mips/loongson64/loongson-3/acpi_init.c
rename to arch/mips/loongson64/acpi_init.c
index 8d7c119ddf91..3dd8135d2911 100644
--- a/arch/mips/loongson64/loongson-3/acpi_init.c
+++ b/arch/mips/loongson64/acpi_init.c
@@ -99,7 +99,8 @@ void acpi_registers_setup(void)
 	pm_iowrite(0x2f, ACPI_END >> 8);
 
 	/* IO Decode: When AcpiDecodeEnable set, South-Bridge uses the contents
-	 * of the PM registers at index 0x20~0x2B to decode ACPI I/O address. */
+	 * of the PM registers at index 0x20~0x2B to decode ACPI I/O address.
+	 */
 	pm_iowrite(0x0e, 1 << 3);
 
 	/* SCI_EN set */
diff --git a/arch/mips/loongson64/loongson-3/cop2-ex.c b/arch/mips/loongson64/cop2-ex.c
similarity index 88%
rename from arch/mips/loongson64/loongson-3/cop2-ex.c
rename to arch/mips/loongson64/cop2-ex.c
index 9efdfe430ff0..508c707627ba 100644
--- a/arch/mips/loongson64/loongson-3/cop2-ex.c
+++ b/arch/mips/loongson64/cop2-ex.c
@@ -1,8 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
  * Copyright (C) 2014 Lemote Corporation.
  *   written by Huacai Chen <chenhc@lemote.com>
  *
diff --git a/arch/mips/loongson64/loongson-3/dma.c b/arch/mips/loongson64/dma.c
similarity index 82%
rename from arch/mips/loongson64/loongson-3/dma.c
rename to arch/mips/loongson64/dma.c
index 5e86635f71db..e2c3354d1d30 100644
--- a/arch/mips/loongson64/loongson-3/dma.c
+++ b/arch/mips/loongson64/dma.c
@@ -6,7 +6,8 @@
 dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
 {
 	/* We extract 2bit node id (bit 44~47, only bit 44~45 used now) from
-	 * Loongson-3's 48bit address space and embed it into 40bit */
+	 * Loongson-3's 48bit address space and embed it into 40bit
+	 */
 	long nid = (paddr >> 44) & 0x3;
 	return ((nid << 44) ^ paddr) | (nid << 37);
 }
@@ -14,7 +15,8 @@ dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
 phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t daddr)
 {
 	/* We extract 2bit node id (bit 44~47, only bit 44~45 used now) from
-	 * Loongson-3's 48bit address space and embed it into 40bit */
+	 * Loongson-3's 48bit address space and embed it into 40bit
+	 */
 	long nid = (daddr >> 37) & 0x3;
 	return ((nid << 37) ^ daddr) | (nid << 44);
 }
diff --git a/arch/mips/loongson64/common/env.c b/arch/mips/loongson64/env.c
similarity index 79%
rename from arch/mips/loongson64/common/env.c
rename to arch/mips/loongson64/env.c
index 09d5cf4676ca..93658cfbf3a6 100644
--- a/arch/mips/loongson64/common/env.c
+++ b/arch/mips/loongson64/env.c
@@ -15,7 +15,10 @@
  */
 #include <linux/export.h>
 #include <asm/bootinfo.h>
-#include <loongson.h>
+#include <asm/time.h>
+#include <asm/prom.h>
+
+#include <loongson64.h>
 #include <boot_param.h>
 #include <workarounds.h>
 
@@ -30,45 +33,17 @@ u64 loongson_freqctrl[MAX_PACKAGES];
 
 unsigned long long smp_group[4];
 
-#define parse_even_earlier(res, option, p)				\
-do {									\
-	unsigned int tmp __maybe_unused;				\
-									\
-	if (strncmp(option, (char *)p, strlen(option)) == 0)		\
-		tmp = kstrtou32((char *)p + strlen(option"="), 10, &res); \
-} while (0)
 
-void __init prom_init_env(void)
+void __init prom_init_lefi(void)
 {
 	/* pmon passes arguments in 32bit pointers */
 	unsigned int processor_id;
 
-#ifndef CONFIG_LEFI_FIRMWARE_INTERFACE
-	int *_prom_envp;
-	long l;
-
-	/* firmware arguments are initialized in head.S */
-	_prom_envp = (int *)fw_arg2;
-
-	l = (long)*_prom_envp;
-	while (l != 0) {
-		parse_even_earlier(cpu_clock_freq, "cpuclock", l);
-		parse_even_earlier(memsize, "memsize", l);
-		parse_even_earlier(highmemsize, "highmemsize", l);
-		_prom_envp++;
-		l = (long)*_prom_envp;
-	}
-	if (memsize == 0)
-		memsize = 256;
-
-	loongson_sysconf.nr_uarts = 1;
-
-	pr_info("memsize=%u, highmemsize=%u\n", memsize, highmemsize);
-#else
 	struct boot_params *boot_p;
 	struct loongson_params *loongson_p;
 	struct system_loongson *esys;
 	struct efi_cpuinfo_loongson *ecpu;
+	struct board_devices *eboard;
 	struct irq_source_routing_table *eirq_source;
 
 	/* firmware arguments are initialized in head.S */
@@ -79,12 +54,15 @@ void __init prom_init_env(void)
 		((u64)loongson_p + loongson_p->system_offset);
 	ecpu = (struct efi_cpuinfo_loongson *)
 		((u64)loongson_p + loongson_p->cpu_offset);
+	eboard	= (struct board_devices *)
+		((u64)loongson_p + loongson_p->boarddev_table_offset);
 	eirq_source = (struct irq_source_routing_table *)
 		((u64)loongson_p + loongson_p->irq_offset);
 	loongson_memmap = (struct efi_memory_map_loongson *)
 		((u64)loongson_p + loongson_p->memory_offset);
 
 	cpu_clock_freq = ecpu->cpu_clock_freq;
+	mips_hpt_frequency = cpu_clock_freq / 2;
 	loongson_sysconf.cputype = ecpu->cputype;
 	switch (ecpu->cputype) {
 	case Legacy_3A:
@@ -151,6 +129,7 @@ void __init prom_init_env(void)
 	loongson_sysconf.pci_mem_start_addr = eirq_source->pci_mem_start_addr;
 	loongson_sysconf.pci_mem_end_addr = eirq_source->pci_mem_end_addr;
 	loongson_sysconf.pci_io_base = eirq_source->pci_io_start_addr;
+	set_io_port_base(loongson_sysconf.pci_io_base);
 	loongson_sysconf.dma_mask_bits = eirq_source->dma_mask_bits;
 	if (loongson_sysconf.dma_mask_bits < 32 ||
 		loongson_sysconf.dma_mask_bits > 64)
@@ -165,6 +144,9 @@ void __init prom_init_env(void)
 		loongson_sysconf.poweroff_addr, loongson_sysconf.restart_addr,
 		loongson_sysconf.vgabios_addr);
 
+	if (eboard->name)
+		mips_set_machine_name(eboard->name);
+
 	memset(loongson_sysconf.ecname, 0, 32);
 	if (esys->has_ec)
 		memcpy(loongson_sysconf.ecname, esys->ec_name, 32);
@@ -182,31 +164,7 @@ void __init prom_init_env(void)
 	if (loongson_sysconf.nr_sensors)
 		memcpy(loongson_sysconf.sensors, esys->sensors,
 			sizeof(struct sensor_device) * loongson_sysconf.nr_sensors);
-#endif
-	if (cpu_clock_freq == 0) {
-		processor_id = (&current_cpu_data)->processor_id;
-		switch (processor_id & PRID_REV_MASK) {
-		case PRID_REV_LOONGSON2E:
-			cpu_clock_freq = 533080000;
-			break;
-		case PRID_REV_LOONGSON2F:
-			cpu_clock_freq = 797000000;
-			break;
-		case PRID_REV_LOONGSON3A_R1:
-		case PRID_REV_LOONGSON3A_R2_0:
-		case PRID_REV_LOONGSON3A_R2_1:
-		case PRID_REV_LOONGSON3A_R3_0:
-		case PRID_REV_LOONGSON3A_R3_1:
-			cpu_clock_freq = 900000000;
-			break;
-		case PRID_REV_LOONGSON3B_R1:
-		case PRID_REV_LOONGSON3B_R2:
-			cpu_clock_freq = 1000000000;
-			break;
-		default:
-			cpu_clock_freq = 100000000;
-			break;
-		}
-	}
+	processor_id = (&current_cpu_data)->processor_id;
+
 	pr_info("CpuClock = %u\n", cpu_clock_freq);
 }
diff --git a/arch/mips/loongson64/loongson-3/hpet.c b/arch/mips/loongson64/hpet.c
similarity index 100%
rename from arch/mips/loongson64/loongson-3/hpet.c
rename to arch/mips/loongson64/hpet.c
diff --git a/arch/mips/loongson64/loongson-3/irq.c b/arch/mips/loongson64/irq.c
similarity index 77%
rename from arch/mips/loongson64/loongson-3/irq.c
rename to arch/mips/loongson64/irq.c
index 5605061f5f98..4d7b80a0ffb9 100644
--- a/arch/mips/loongson64/loongson-3/irq.c
+++ b/arch/mips/loongson64/irq.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-#include <loongson.h>
+#include <loongson64.h>
 #include <irq.h>
 #include <linux/interrupt.h>
 #include <linux/init.h>
@@ -10,6 +10,19 @@
 
 #include "smp.h"
 
+/* ICU Configuration Regs - r/w */
+
+#define LOONGSON_INTEDGE		LOONGSON_REG(LOONGSON_REGBASE + 0x24)
+#define LOONGSON_INTSTEER		LOONGSON_REG(LOONGSON_REGBASE + 0x28)
+#define LOONGSON_INTPOL			LOONGSON_REG(LOONGSON_REGBASE + 0x2c)
+
+/* ICU Enable Regs - IntEn & IntISR are r/o. */
+
+#define LOONGSON_INTENSET		LOONGSON_REG(LOONGSON_REGBASE + 0x30)
+#define LOONGSON_INTENCLR		LOONGSON_REG(LOONGSON_REGBASE + 0x34)
+#define LOONGSON_INTEN			LOONGSON_REG(LOONGSON_REGBASE + 0x38)
+#define LOONGSON_INTISR			LOONGSON_REG(LOONGSON_REGBASE + 0x3c)
+
 extern void loongson3_send_irq_by_ipi(int cpu, int irqs);
 
 unsigned int irq_cpu[16] = {[0 ... 15] = -1};
@@ -78,13 +91,17 @@ static void ht_irqdispatch(void)
 
 #define UNUSED_IPS (CAUSEF_IP5 | CAUSEF_IP4 | CAUSEF_IP1 | CAUSEF_IP0)
 
-void mach_irq_dispatch(unsigned int pending)
+asmlinkage void plat_irq_dispatch(void)
 {
+	unsigned int pending;
+
+	pending = read_c0_cause() & read_c0_status() & ST0_IM;
+
 	if (pending & CAUSEF_IP7)
 		do_IRQ(LOONGSON_TIMER_IRQ);
 #if defined(CONFIG_SMP)
 	if (pending & CAUSEF_IP6)
-		loongson3_ipi_interrupt(NULL);
+		loongson3_ipi_interrupt();
 #endif
 	if (pending & CAUSEF_IP3)
 		ht_irqdispatch();
@@ -127,10 +144,25 @@ void irq_router_init(void)
 		LOONGSON_INT_ROUTER_INTEN | (0xffff << 16) | 0x1 << 10;
 }
 
-void __init mach_init_irq(void)
+void __init arch_init_irq(void)
 {
 	struct irq_chip *chip;
 
+	/*
+	 * Clear all of the interrupts while we change the able around a bit.
+	 * int-handler is not on bootstrap
+	 */
+	clear_c0_status(ST0_IM | ST0_BEV);
+
+	/* no steer */
+	LOONGSON_INTSTEER = 0;
+
+	/*
+	 * Mask out all interrupt by writing "1" to all bit position in
+	 * the interrupt reset reg.
+	 */
+	LOONGSON_INTENCLR = ~0;
+
 	clear_c0_status(ST0_IM | ST0_BEV);
 
 	irq_router_init();
diff --git a/arch/mips/loongson64/loongson-3/Makefile b/arch/mips/loongson64/loongson-3/Makefile
deleted file mode 100644
index df39598742b2..000000000000
--- a/arch/mips/loongson64/loongson-3/Makefile
+++ /dev/null
@@ -1,11 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-#
-# Makefile for Loongson-3 family machines
-#
-obj-y			+= irq.o cop2-ex.o platform.o acpi_init.o dma.o
-
-obj-$(CONFIG_SMP)	+= smp.o
-
-obj-$(CONFIG_NUMA)	+= numa.o
-
-obj-$(CONFIG_RS780_HPET) += hpet.o
diff --git a/arch/mips/loongson64/loongson-3/numa.c b/arch/mips/loongson64/numa.c
similarity index 98%
rename from arch/mips/loongson64/loongson-3/numa.c
rename to arch/mips/loongson64/numa.c
index 414e97de5dc0..de3d3d682694 100644
--- a/arch/mips/loongson64/loongson-3/numa.c
+++ b/arch/mips/loongson64/numa.c
@@ -98,6 +98,7 @@ static void __init init_topology_matrix(void)
 static unsigned long nid_to_addroffset(unsigned int nid)
 {
 	unsigned long result;
+
 	switch (nid) {
 	case 0:
 	default:
@@ -119,7 +120,7 @@ static unsigned long nid_to_addroffset(unsigned int nid)
 static void __init szmem(unsigned int node)
 {
 	u32 i, mem_type;
-	static unsigned long num_physpages = 0;
+	static unsigned long num_physpages;
 	u64 node_id, node_psize, start_pfn, end_pfn, mem_start, mem_size;
 
 	/* Parse memory information and activate */
@@ -276,4 +277,3 @@ void __init prom_init_numa_memory(void)
 	enable_lpa();
 	prom_meminit();
 }
-EXPORT_SYMBOL(prom_init_numa_memory);
diff --git a/arch/mips/loongson64/pci.c b/arch/mips/loongson64/pci.c
new file mode 100644
index 000000000000..4e896817aadc
--- /dev/null
+++ b/arch/mips/loongson64/pci.c
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2007 Lemote, Inc. & Institute of Computing Technology
+ * Author: Fuxin Zhang, zhangfx@lemote.com
+ */
+#include <linux/pci.h>
+
+#include <pci.h>
+#include <loongson64.h>
+
+static struct resource loongson_pci_mem_resource = {
+	.name	= "PCI Memory Space",
+	.flags	= IORESOURCE_MEM,
+};
+
+static struct resource loongson_pci_io_resource = {
+	.name	= "PCI IO Space",
+	.end	= IO_SPACE_LIMIT,
+	.flags	= IORESOURCE_IO,
+};
+
+static struct pci_controller  loongson_pci_controller = {
+	.pci_ops	= &loongson_pci_ops,
+	.io_resource	= &loongson_pci_io_resource,
+	.mem_resource	= &loongson_pci_mem_resource,
+	.mem_offset	= 0x00000000UL,
+	.io_offset	= 0x00000000UL,
+};
+
+extern int sbx00_acpi_init(void);
+
+static int __init pcibios_init(void)
+{
+	loongson_pci_controller.io_map_base = mips_io_port_base;
+	loongson_pci_mem_resource.start = loongson_sysconf.pci_mem_start_addr;
+	loongson_pci_mem_resource.end = loongson_sysconf.pci_mem_end_addr;
+
+	register_pci_controller(&loongson_pci_controller);
+
+	sbx00_acpi_init();
+
+	return 0;
+}
+
+arch_initcall(pcibios_init);
diff --git a/arch/mips/loongson64/loongson-3/platform.c b/arch/mips/loongson64/platform.c
similarity index 100%
rename from arch/mips/loongson64/loongson-3/platform.c
rename to arch/mips/loongson64/platform.c
diff --git a/arch/mips/loongson64/reset.c b/arch/mips/loongson64/reset.c
new file mode 100644
index 000000000000..0bbd2a38c127
--- /dev/null
+++ b/arch/mips/loongson64/reset.c
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *
+ * Copyright (C) 2007 Lemote, Inc. & Institute of Computing Technology
+ * Author: Fuxin Zhang, zhangfx@lemote.com
+ * Copyright (C) 2009 Lemote, Inc.
+ * Author: Zhangjin Wu, wuzhangjin@gmail.com
+ */
+#include <linux/init.h>
+#include <linux/pm.h>
+
+#include <asm/idle.h>
+#include <asm/reboot.h>
+
+#include <loongson64.h>
+#include <boot_param.h>
+
+static void loongson_restart(char *command)
+{
+	void (*fw_restart)(void) = (void *)loongson_sysconf.restart_addr;
+
+	fw_restart();
+	while (1) {
+		if (cpu_wait)
+			cpu_wait();
+	}
+}
+
+static void loongson_poweroff(void)
+{
+	void (*fw_poweroff)(void) = (void *)loongson_sysconf.poweroff_addr;
+
+	fw_poweroff();
+	while (1) {
+		if (cpu_wait)
+			cpu_wait();
+	}
+}
+
+static void loongson_halt(void)
+{
+	pr_notice("\n\n** You can safely turn off the power now **\n\n");
+	while (1) {
+		if (cpu_wait)
+			cpu_wait();
+	}
+}
+
+static int __init mips_reboot_setup(void)
+{
+	_machine_restart = loongson_restart;
+	_machine_halt = loongson_halt;
+	pm_power_off = loongson_poweroff;
+
+	return 0;
+}
+
+arch_initcall(mips_reboot_setup);
diff --git a/arch/mips/loongson64/setup.c b/arch/mips/loongson64/setup.c
new file mode 100644
index 000000000000..24432adc8350
--- /dev/null
+++ b/arch/mips/loongson64/setup.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+#include <asm/bootinfo.h>
+#include <linux/memblock.h>
+#include <asm/bootinfo.h>
+#include <asm/prom.h>
+#include <asm/traps.h>
+#include <asm/setup.h>
+#include <asm/smp-ops.h>
+#include <asm/cacheflush.h>
+
+#include <loongson64.h>
+
+static void wbflush_loongson(void)
+{
+	asm(".set\tpush\n\t"
+	    ".set\tnoreorder\n\t"
+	    ".set mips3\n\t"
+	    "sync\n\t"
+	    "nop\n\t"
+	    ".set\tpop\n\t"
+	    ".set mips0\n\t");
+}
+
+void (*__wbflush)(void) = wbflush_loongson;
+EXPORT_SYMBOL(__wbflush);
+
+const char *get_system_type(void)
+{
+	return mips_get_machine_name();
+}
+
+static void __init mips_nmi_setup(void)
+{
+	void *base;
+	extern char except_vec_nmi;
+
+	base = (void *)(CAC_BASE + 0x380);
+	memcpy(base, &except_vec_nmi, 0x80);
+	flush_icache_range((unsigned long)base, (unsigned long)base + 0x80);
+}
+
+void __init prom_init_cmdline(void)
+{
+	int prom_argc;
+	/* pmon passes arguments in 32bit pointers */
+	int *_prom_argv;
+	int i;
+	long l;
+
+	/* firmware arguments are initialized in head.S */
+	prom_argc = fw_arg0;
+	_prom_argv = (int *)fw_arg1;
+
+	/* arg[0] is "g", the rest is boot parameters */
+	arcs_cmdline[0] = '\0';
+	for (i = 1; i < prom_argc; i++) {
+		l = (long)_prom_argv[i];
+		if (strlen(arcs_cmdline) + strlen(((char *)l) + 1)
+		    >= sizeof(arcs_cmdline))
+			break;
+		strcat(arcs_cmdline, ((char *)l));
+		strcat(arcs_cmdline, " ");
+	}
+}
+
+void __init prom_init(void)
+{
+	prom_init_cmdline();
+	setup_8250_early_printk_port(CKSEG1ADDR(LOONGSON_REG_BASE + 0x1e0), 0, 0);
+
+	prom_init_lefi();
+	prom_init_numa_memory();
+
+	register_smp_ops(&loongson3_smp_ops);
+	board_nmi_handler_setup = mips_nmi_setup;
+}
+
+void __init prom_free_prom_memory(void)
+{
+}
+
+void __init plat_mem_setup(void)
+{
+}
+
+void __init plat_time_init(void)
+{
+#ifdef CONFIG_RS780_HPET
+	setup_hpet_timer();
+#endif
+}
+
diff --git a/arch/mips/loongson64/loongson-3/smp.c b/arch/mips/loongson64/smp.c
similarity index 99%
rename from arch/mips/loongson64/loongson-3/smp.c
rename to arch/mips/loongson64/smp.c
index ce68cdaaf33c..8ad845e522fb 100644
--- a/arch/mips/loongson64/loongson-3/smp.c
+++ b/arch/mips/loongson64/smp.c
@@ -17,7 +17,7 @@
 #include <asm/clock.h>
 #include <asm/tlbflush.h>
 #include <asm/cacheflush.h>
-#include <loongson.h>
+#include <loongson64.h>
 #include <workarounds.h>
 
 #include "smp.h"
@@ -252,7 +252,7 @@ void loongson3_send_irq_by_ipi(int cpu, int irqs)
 	loongson3_ipi_write32(irqs << IPI_IRQ_OFFSET, ipi_set0_regs[cpu_logical_map(cpu)]);
 }
 
-void loongson3_ipi_interrupt(struct pt_regs *regs)
+void loongson3_ipi_interrupt()
 {
 	int i, cpu = smp_processor_id();
 	unsigned int action, c0count, irqs;
diff --git a/arch/mips/loongson64/loongson-3/smp.h b/arch/mips/loongson64/smp.h
similarity index 100%
rename from arch/mips/loongson64/loongson-3/smp.h
rename to arch/mips/loongson64/smp.h
diff --git a/arch/mips/oprofile/op_model_loongson2.c b/arch/mips/oprofile/op_model_loongson2.c
index b249ec0bebb2..8f739679a5e8 100644
--- a/arch/mips/oprofile/op_model_loongson2.c
+++ b/arch/mips/oprofile/op_model_loongson2.c
@@ -13,7 +13,7 @@
 #include <linux/oprofile.h>
 #include <linux/interrupt.h>
 
-#include <loongson.h>			/* LOONGSON2_PERFCNT_IRQ */
+#include <loongson2ef.h>			/* LOONGSON2_PERFCNT_IRQ */
 #include "op_impl.h"
 
 #define LOONGSON2_CPU_TYPE	"mips/loongson2"
diff --git a/arch/mips/oprofile/op_model_loongson3.c b/arch/mips/oprofile/op_model_loongson3.c
index 436b1fc99f2c..222077e49bc6 100644
--- a/arch/mips/oprofile/op_model_loongson3.c
+++ b/arch/mips/oprofile/op_model_loongson3.c
@@ -13,7 +13,7 @@
 #include <linux/interrupt.h>
 #include <linux/uaccess.h>
 #include <irq.h>
-#include <loongson.h>
+#include <loongson64.h>
 #include "op_impl.h"
 
 #define LOONGSON3_PERFCNT_OVERFLOW	(1ULL << 63)
diff --git a/arch/mips/pci/Makefile b/arch/mips/pci/Makefile
index d6de4cb2e31c..342ce10ef593 100644
--- a/arch/mips/pci/Makefile
+++ b/arch/mips/pci/Makefile
@@ -35,7 +35,7 @@ obj-$(CONFIG_LASAT)		+= pci-lasat.o
 obj-$(CONFIG_MIPS_COBALT)	+= fixup-cobalt.o
 obj-$(CONFIG_LEMOTE_FULOONG2E)	+= fixup-fuloong2e.o ops-loongson2.o
 obj-$(CONFIG_LEMOTE_MACH2F)	+= fixup-lemote2f.o ops-loongson2.o
-obj-$(CONFIG_LOONGSON_MACH3X)	+= fixup-loongson3.o ops-loongson3.o
+obj-$(CONFIG_MACH_LOONGSON64)	+= fixup-loongson3.o ops-loongson3.o
 obj-$(CONFIG_MIPS_MALTA)	+= fixup-malta.o pci-malta.o
 obj-$(CONFIG_PMC_MSP7120_GW)	+= fixup-pmcmsp.o ops-pmcmsp.o
 obj-$(CONFIG_PMC_MSP7120_EVAL)	+= fixup-pmcmsp.o ops-pmcmsp.o
diff --git a/arch/mips/pci/fixup-fuloong2e.c b/arch/mips/pci/fixup-fuloong2e.c
index 91aa923234bc..60b6caec02c0 100644
--- a/arch/mips/pci/fixup-fuloong2e.c
+++ b/arch/mips/pci/fixup-fuloong2e.c
@@ -10,7 +10,7 @@
 #include <linux/init.h>
 #include <linux/pci.h>
 
-#include <loongson.h>
+#include <loongson2ef.h>
 
 /* South bridge slot number is set by the pci probe process */
 static u8 sb_slot = 5;
diff --git a/arch/mips/pci/fixup-lemote2f.c b/arch/mips/pci/fixup-lemote2f.c
index 632ff2daa338..f998ca1555a5 100644
--- a/arch/mips/pci/fixup-lemote2f.c
+++ b/arch/mips/pci/fixup-lemote2f.c
@@ -10,7 +10,7 @@
 #include <linux/init.h>
 #include <linux/pci.h>
 
-#include <loongson.h>
+#include <loongson2ef.h>
 #include <cs5536/cs5536.h>
 #include <cs5536/cs5536_pci.h>
 
diff --git a/arch/mips/pci/ops-loongson2.c b/arch/mips/pci/ops-loongson2.c
index 0d1b36ba1c21..f5f479252a3a 100644
--- a/arch/mips/pci/ops-loongson2.c
+++ b/arch/mips/pci/ops-loongson2.c
@@ -13,7 +13,7 @@
 #include <linux/kernel.h>
 #include <linux/export.h>
 
-#include <loongson.h>
+#include <loongson2ef.h>
 
 #ifdef CONFIG_CS5536
 #include <cs5536/cs5536_pci.h>
diff --git a/arch/mips/pci/ops-loongson3.c b/arch/mips/pci/ops-loongson3.c
index 2f6ad36bdea6..7f66c8cde773 100644
--- a/arch/mips/pci/ops-loongson3.c
+++ b/arch/mips/pci/ops-loongson3.c
@@ -5,7 +5,7 @@
 
 #include <asm/mips-boards/bonito64.h>
 
-#include <loongson.h>
+#include <loongson64.h>
 
 #define PCI_ACCESS_READ  0
 #define PCI_ACCESS_WRITE 1
diff --git a/drivers/cpufreq/loongson2_cpufreq.c b/drivers/cpufreq/loongson2_cpufreq.c
index 890813e0bb76..a3b6f17e6e0a 100644
--- a/drivers/cpufreq/loongson2_cpufreq.c
+++ b/drivers/cpufreq/loongson2_cpufreq.c
@@ -23,7 +23,7 @@
 #include <asm/clock.h>
 #include <asm/idle.h>
 
-#include <asm/mach-loongson64/loongson.h>
+#include <asm/mach-loongson2ef/loongson2ef.h>
 
 static uint nowait;
 
diff --git a/drivers/gpio/gpio-loongson.c b/drivers/gpio/gpio-loongson.c
index a42145873cc9..7b72846a6dc7 100644
--- a/drivers/gpio/gpio-loongson.c
+++ b/drivers/gpio/gpio-loongson.c
@@ -17,7 +17,7 @@
 #include <linux/platform_device.h>
 #include <linux/bitops.h>
 #include <asm/types.h>
-#include <loongson.h>
+#include <loongson2ef.h>
 
 #define STLS2F_N_GPIO		4
 #define STLS3A_N_GPIO		16
diff --git a/drivers/platform/mips/cpu_hwmon.c b/drivers/platform/mips/cpu_hwmon.c
index a7f184bb47e0..7b5805b4988c 100644
--- a/drivers/platform/mips/cpu_hwmon.c
+++ b/drivers/platform/mips/cpu_hwmon.c
@@ -6,7 +6,7 @@
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
 
-#include <loongson.h>
+#include <loongson64.h>
 #include <boot_param.h>
 #include <loongson_hwmon.h>
 
-- 
2.22.0

