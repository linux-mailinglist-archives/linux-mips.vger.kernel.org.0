Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CE28DDEFE
	for <lists+linux-mips@lfdr.de>; Sun, 20 Oct 2019 17:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbfJTPC6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 20 Oct 2019 11:02:58 -0400
Received: from forward104o.mail.yandex.net ([37.140.190.179]:52281 "EHLO
        forward104o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726373AbfJTPC6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 20 Oct 2019 11:02:58 -0400
Received: from mxback17g.mail.yandex.net (mxback17g.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:317])
        by forward104o.mail.yandex.net (Yandex) with ESMTP id 438B6940F8E;
        Sun, 20 Oct 2019 18:02:33 +0300 (MSK)
Received: from iva8-ec9a273f19c6.qloud-c.yandex.net (iva8-ec9a273f19c6.qloud-c.yandex.net [2a02:6b8:c0c:1209:0:640:ec9a:273f])
        by mxback17g.mail.yandex.net (nwsmtp/Yandex) with ESMTP id YRmkWKzctA-2WXuikHm;
        Sun, 20 Oct 2019 18:02:33 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1571583753;
        bh=Y4vYyFP41D72LkvPQwyXU0TLzlTs6K2WdfDZDU5SKXM=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=Uu0YtpkSvJcGA/RttwLerACeh9Ur5fcVr9ukfVqLq+cpjCB0n/dlpIzCZ6FYnsb0+
         kRUuvTyR+NVqapYKaa2ZYJQaRRCpMmb7sDK8AaZF6+/K0yL00DgnFj8iQbWH+9eEiV
         dV3wOuqjEey10KrO1BCIw0lfmEweQPitYH0L8kq8=
Authentication-Results: mxback17g.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by iva8-ec9a273f19c6.qloud-c.yandex.net (nwsmtp/Yandex) with ESMTPSA id H3HbL3CO93-2MHiAMHX;
        Sun, 20 Oct 2019 18:02:29 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 5/6] MIPS: Loongson64: Move files to the top-level directory
Date:   Sun, 20 Oct 2019 23:01:36 +0800
Message-Id: <20191020150137.19256-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191020150137.19256-1-jiaxun.yang@flygoat.com>
References: <20191020144318.18341-1-jiaxun.yang@flygoat.com>
 <20191020150137.19256-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Current Loongson-3 code can share among all Loongson64 processors.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig                             | 26 +++++++++++++
 arch/mips/configs/loongson3_defconfig         |  1 -
 .../mach-loongson64/cpu-feature-overrides.h   |  1 -
 arch/mips/loongson64/Kconfig                  | 38 +------------------
 arch/mips/loongson64/Makefile                 | 17 +++++----
 .../loongson64/{loongson-3 => }/acpi_init.c   |  0
 arch/mips/loongson64/{common => }/cmdline.c   |  0
 arch/mips/loongson64/common/Makefile          | 16 --------
 .../loongson64/{loongson-3 => }/cop2-ex.c     |  0
 arch/mips/loongson64/{loongson-3 => }/dma.c   |  0
 arch/mips/loongson64/{common => }/env.c       |  0
 arch/mips/loongson64/{loongson-3 => }/hpet.c  |  0
 arch/mips/loongson64/{common => }/init.c      |  0
 arch/mips/loongson64/{loongson-3 => }/irq.c   |  0
 arch/mips/loongson64/loongson-3/Makefile      | 11 ------
 arch/mips/loongson64/{loongson-3 => }/numa.c  |  0
 arch/mips/loongson64/{common => }/pci.c       |  0
 .../loongson64/{loongson-3 => }/platform.c    |  0
 arch/mips/loongson64/{common => }/pm.c        |  0
 arch/mips/loongson64/{common => }/reset.c     |  0
 arch/mips/loongson64/{common => }/rtc.c       |  0
 arch/mips/loongson64/{common => }/setup.c     |  0
 arch/mips/loongson64/{loongson-3 => }/smp.c   |  0
 arch/mips/loongson64/{loongson-3 => }/smp.h   |  0
 arch/mips/loongson64/{common => }/time.c      |  0
 arch/mips/pci/Makefile                        |  2 +-
 drivers/platform/mips/Kconfig                 |  4 +-
 27 files changed, 39 insertions(+), 77 deletions(-)
 rename arch/mips/loongson64/{loongson-3 => }/acpi_init.c (100%)
 rename arch/mips/loongson64/{common => }/cmdline.c (100%)
 delete mode 100644 arch/mips/loongson64/common/Makefile
 rename arch/mips/loongson64/{loongson-3 => }/cop2-ex.c (100%)
 rename arch/mips/loongson64/{loongson-3 => }/dma.c (100%)
 rename arch/mips/loongson64/{common => }/env.c (100%)
 rename arch/mips/loongson64/{loongson-3 => }/hpet.c (100%)
 rename arch/mips/loongson64/{common => }/init.c (100%)
 rename arch/mips/loongson64/{loongson-3 => }/irq.c (100%)
 delete mode 100644 arch/mips/loongson64/loongson-3/Makefile
 rename arch/mips/loongson64/{loongson-3 => }/numa.c (100%)
 rename arch/mips/loongson64/{common => }/pci.c (100%)
 rename arch/mips/loongson64/{loongson-3 => }/platform.c (100%)
 rename arch/mips/loongson64/{common => }/pm.c (100%)
 rename arch/mips/loongson64/{common => }/reset.c (100%)
 rename arch/mips/loongson64/{common => }/rtc.c (100%)
 rename arch/mips/loongson64/{common => }/setup.c (100%)
 rename arch/mips/loongson64/{loongson-3 => }/smp.c (100%)
 rename arch/mips/loongson64/{loongson-3 => }/smp.h (100%)
 rename arch/mips/loongson64/{common => }/time.c (100%)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 7d6b1c993e28..94249c69bd14 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -461,7 +461,33 @@ config MACH_LOONGSON2EF
 
 config MACH_LOONGSON64
 	bool "Loongson-2/3 GSx64 family of machines"
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
+	select NR_CPUS_DEFAULT_4
+	select USE_GENERIC_EARLY_PRINTK_8250
+	select SYS_HAS_CPU_LOONGSON64
+	select SYS_HAS_EARLY_PRINTK
+	select SYS_SUPPORTS_SMP
+	select SYS_SUPPORTS_HOTPLUG_CPU
+	select SYS_SUPPORTS_NUMA
+	select SYS_SUPPORTS_64BIT_KERNEL
+	select SYS_SUPPORTS_HIGHMEM
+	select SYS_SUPPORTS_LITTLE_ENDIAN
 	select SYS_SUPPORTS_ZBOOT
+	select LOONGSON_MC146818
+	select ZONE_DMA32
+	select NUMA
 	help
 	  This enables the support of Loongson-2/3 family of processors with
 	  GSx64 microarchitecture.
diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
index 90ee0084d786..caad7bf7902c 100644
--- a/arch/mips/configs/loongson3_defconfig
+++ b/arch/mips/configs/loongson3_defconfig
@@ -24,7 +24,6 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_SYSCTL_SYSCALL=y
 CONFIG_EMBEDDED=y
 CONFIG_MACH_LOONGSON64=y
-CONFIG_LOONGSON_MACH3X=y
 CONFIG_SMP=y
 CONFIG_HZ_256=y
 CONFIG_KEXEC=y
diff --git a/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h b/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h
index 895607eb81ca..7dc8d75445a9 100644
--- a/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h
+++ b/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h
@@ -43,7 +43,6 @@
 #define cpu_has_vint		0
 #define cpu_has_vtag_icache	0
 #define cpu_has_watch		1
-
 #define cpu_has_wsbh		1
 #define cpu_has_ic_fills_f_dc	1
 #define cpu_hwrena_impl_bits	0xc0000000
diff --git a/arch/mips/loongson64/Kconfig b/arch/mips/loongson64/Kconfig
index 3215b768bb88..b1aefd06e3f5 100644
--- a/arch/mips/loongson64/Kconfig
+++ b/arch/mips/loongson64/Kconfig
@@ -1,45 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 if MACH_LOONGSON64
 
-choice
-	prompt "Machine Type"
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
-	select USE_GENERIC_EARLY_PRINTK_8250
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
-	select NUMA
-	help
-		Generic Loongson 3 family machines utilize the 3A/3B revision
-		of Loongson processor and RS780/SBX00 chipset.
-endchoice
-
 config RS780_HPET
 	bool "RS780/SBX00 HPET Timer"
-	depends on LOONGSON_MACH3X
+	depends on CONFIG_MACH_LOONGSON64
 	select MIPS_EXTERNAL_TIMER
 	help
 	  This option enables the hpet timer of AMD RS780/SBX00.
diff --git a/arch/mips/loongson64/Makefile b/arch/mips/loongson64/Makefile
index dc16a23c171f..0b3c65b52965 100644
--- a/arch/mips/loongson64/Makefile
+++ b/arch/mips/loongson64/Makefile
@@ -1,12 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
-# Common code for all Loongson based systems
+# Makefile for Loongson-3 family machines
 #
+obj-$(CONFIG_MACH_LOONGSON64) += irq.o cop2-ex.o platform.o acpi_init.o dma.o \
+				setup.o init.o cmdline.o env.o time.o reset.o \
 
-obj-$(CONFIG_MACH_LOONGSON64) += common/
-
-#
-# All Loongson-3 family machines
-#
-
-obj-$(CONFIG_CPU_LOONGSON64)  += loongson-3/
+obj-$(CONFIG_SMP)	+= smp.o
+obj-$(CONFIG_NUMA)	+= numa.o
+obj-$(CONFIG_RS780_HPET) += hpet.o
+obj-$(CONFIG_PCI) += pci.o
+obj-$(CONFIG_LOONGSON_MC146818) += rtc.o
+obj-$(CONFIG_SUSPEND) += pm.o
diff --git a/arch/mips/loongson64/loongson-3/acpi_init.c b/arch/mips/loongson64/acpi_init.c
similarity index 100%
rename from arch/mips/loongson64/loongson-3/acpi_init.c
rename to arch/mips/loongson64/acpi_init.c
diff --git a/arch/mips/loongson64/common/cmdline.c b/arch/mips/loongson64/cmdline.c
similarity index 100%
rename from arch/mips/loongson64/common/cmdline.c
rename to arch/mips/loongson64/cmdline.c
diff --git a/arch/mips/loongson64/common/Makefile b/arch/mips/loongson64/common/Makefile
deleted file mode 100644
index c476401c9b13..000000000000
--- a/arch/mips/loongson64/common/Makefile
+++ /dev/null
@@ -1,16 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-#
-# Makefile for loongson based machines.
-#
-
-obj-y += setup.o init.o cmdline.o env.o time.o reset.o
-
-obj-$(CONFIG_PCI) += pci.o
-
-obj-$(CONFIG_LOONGSON_MC146818) += rtc.o
-
-#
-# Suspend Support
-#
-
-obj-$(CONFIG_SUSPEND) += pm.o
diff --git a/arch/mips/loongson64/loongson-3/cop2-ex.c b/arch/mips/loongson64/cop2-ex.c
similarity index 100%
rename from arch/mips/loongson64/loongson-3/cop2-ex.c
rename to arch/mips/loongson64/cop2-ex.c
diff --git a/arch/mips/loongson64/loongson-3/dma.c b/arch/mips/loongson64/dma.c
similarity index 100%
rename from arch/mips/loongson64/loongson-3/dma.c
rename to arch/mips/loongson64/dma.c
diff --git a/arch/mips/loongson64/common/env.c b/arch/mips/loongson64/env.c
similarity index 100%
rename from arch/mips/loongson64/common/env.c
rename to arch/mips/loongson64/env.c
diff --git a/arch/mips/loongson64/loongson-3/hpet.c b/arch/mips/loongson64/hpet.c
similarity index 100%
rename from arch/mips/loongson64/loongson-3/hpet.c
rename to arch/mips/loongson64/hpet.c
diff --git a/arch/mips/loongson64/common/init.c b/arch/mips/loongson64/init.c
similarity index 100%
rename from arch/mips/loongson64/common/init.c
rename to arch/mips/loongson64/init.c
diff --git a/arch/mips/loongson64/loongson-3/irq.c b/arch/mips/loongson64/irq.c
similarity index 100%
rename from arch/mips/loongson64/loongson-3/irq.c
rename to arch/mips/loongson64/irq.c
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
similarity index 100%
rename from arch/mips/loongson64/loongson-3/numa.c
rename to arch/mips/loongson64/numa.c
diff --git a/arch/mips/loongson64/common/pci.c b/arch/mips/loongson64/pci.c
similarity index 100%
rename from arch/mips/loongson64/common/pci.c
rename to arch/mips/loongson64/pci.c
diff --git a/arch/mips/loongson64/loongson-3/platform.c b/arch/mips/loongson64/platform.c
similarity index 100%
rename from arch/mips/loongson64/loongson-3/platform.c
rename to arch/mips/loongson64/platform.c
diff --git a/arch/mips/loongson64/common/pm.c b/arch/mips/loongson64/pm.c
similarity index 100%
rename from arch/mips/loongson64/common/pm.c
rename to arch/mips/loongson64/pm.c
diff --git a/arch/mips/loongson64/common/reset.c b/arch/mips/loongson64/reset.c
similarity index 100%
rename from arch/mips/loongson64/common/reset.c
rename to arch/mips/loongson64/reset.c
diff --git a/arch/mips/loongson64/common/rtc.c b/arch/mips/loongson64/rtc.c
similarity index 100%
rename from arch/mips/loongson64/common/rtc.c
rename to arch/mips/loongson64/rtc.c
diff --git a/arch/mips/loongson64/common/setup.c b/arch/mips/loongson64/setup.c
similarity index 100%
rename from arch/mips/loongson64/common/setup.c
rename to arch/mips/loongson64/setup.c
diff --git a/arch/mips/loongson64/loongson-3/smp.c b/arch/mips/loongson64/smp.c
similarity index 100%
rename from arch/mips/loongson64/loongson-3/smp.c
rename to arch/mips/loongson64/smp.c
diff --git a/arch/mips/loongson64/loongson-3/smp.h b/arch/mips/loongson64/smp.h
similarity index 100%
rename from arch/mips/loongson64/loongson-3/smp.h
rename to arch/mips/loongson64/smp.h
diff --git a/arch/mips/loongson64/common/time.c b/arch/mips/loongson64/time.c
similarity index 100%
rename from arch/mips/loongson64/common/time.c
rename to arch/mips/loongson64/time.c
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
diff --git a/drivers/platform/mips/Kconfig b/drivers/platform/mips/Kconfig
index 62ea1934fb6a..f4d0a86c00d0 100644
--- a/drivers/platform/mips/Kconfig
+++ b/drivers/platform/mips/Kconfig
@@ -17,8 +17,8 @@ menuconfig MIPS_PLATFORM_DEVICES
 if MIPS_PLATFORM_DEVICES
 
 config CPU_HWMON
-	tristate "Loongson CPU HWMon Driver"
-	depends on LOONGSON_MACH3X
+	tristate "Loongson-3 CPU HWMon Driver"
+	depends on CONFIG_MACH_LOONGSON64
 	select HWMON
 	default y
 	help
-- 
2.23.0

