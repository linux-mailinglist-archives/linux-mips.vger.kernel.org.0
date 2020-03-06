Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4376C17BC8B
	for <lists+linux-mips@lfdr.de>; Fri,  6 Mar 2020 13:18:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbgCFMSE (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 6 Mar 2020 07:18:04 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:35022 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726524AbgCFMSD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 6 Mar 2020 07:18:03 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 7C5F78030797;
        Fri,  6 Mar 2020 12:11:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id LsuhP8CWDhqB; Fri,  6 Mar 2020 15:11:26 +0300 (MSK)
From:   <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 08/22] mips: Add MIPS Warrior P5600 support
Date:   Fri, 6 Mar 2020 15:08:32 +0300
In-Reply-To: <20200306120847.32690-1-Sergey.Semin@baikalelectronics.ru>
References: <20200306120847.32690-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Message-Id: <20200306121127.7C5F78030797@mail.baikalelectronics.ru>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Serge Semin <Sergey.Semin@baikalelectronics.ru>

This is a MIPS32 Release 5 based IP core with XPA, EVA, dual/quad issue
exec pipes, MMU with two-levels TLB, UCA, MSA, MDU core level features
and system level features like up to six P5600 calculation cores, CM2
with L2 cache, IOCU/IOMMU (though might be unused depending on the
system-specific IP core configuration), GIC, CPC, virtualisation module,
eJTAG and PDtrace.

As being MIPS32 Release 5 based core it provides all the features
available by the CPU_MIPS32_R5 config, while adding a few more like
UCA attribute support, availability of CPU-freq (by means of L2/CM
clock ratio setting), EI/VI GIC modes detection at runtime.

In addition to this if P5600 architecture is enabled modern GNU GCC
provides a specific tuning for P5600 processors with respect to the
classic MIPS32 Release 5. First of all branch-likely avoidance is
activated only when the code is compiled with the speed optimization
(avoidance is always enabled for the pure MIPS32 Release 5
architecture). Secondly the madd/msub avoidance is enabled since
madd/msub utilization isn't profitable due to overhead of getting the
result out of the HI/LO registers. Multiply-accumulate instructions are
activated and utilized together with the necessary code reorder when
multiply-add/multiply-subtract statements are met. Finally load/store
bonding is activated by default. All of these optimizations may make
the code relatively faster than if just MIP32 release 5 architecture
was requested.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
---
 arch/mips/Kconfig              | 38 +++++++++++++++++++++++++++++-----
 arch/mips/Makefile             |  1 +
 arch/mips/include/asm/module.h |  2 ++
 3 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index d427d18b4bd3..fd1366921a80 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1650,6 +1650,28 @@ config CPU_MIPS64_R6
 	  family, are based on a MIPS64r6 processor. If you own an older
 	  processor, you probably need to select MIPS64r1 or MIPS64r2 instead.
 
+config CPU_P5600
+	bool "MIPS Warrior P5600"
+	depends on SYS_HAS_CPU_P5600
+	select CPU_HAS_PREFETCH
+	select CPU_SUPPORTS_32BIT_KERNEL
+	select CPU_SUPPORTS_HIGHMEM
+	select CPU_SUPPORTS_MSA
+	select CPU_SUPPORTS_UNCACHED_ACCELERATED
+	select CPU_SUPPORTS_CPUFREQ
+	select CPU_MIPSR2_IRQ_VI
+	select CPU_MIPSR2_IRQ_EI
+	select HAVE_KVM
+	select MIPS_O32_FP64_SUPPORT
+	help
+	  Choose this option to build a kernel for MIPS Warrior P5600 CPU.
+	  It's based on MIPS32r5 ISA with XPA, EVA, dual/quad issue exec pipes,
+	  MMU with two-levels TLB, UCA, MSA, MDU core level features and system
+	  level features like up to six P5600 calculation cores, CM2 with L2
+	  cache, IOCU/IOMMU (though might be unused depending on the system-
+	  specific IP core configuration), GIC, CPC, virtualisation module,
+	  eJTAG and PDtrace.
+
 config CPU_R3000
 	bool "R3000"
 	depends on SYS_HAS_CPU_R3000
@@ -1826,7 +1848,8 @@ endchoice
 config CPU_MIPS32_3_5_FEATURES
 	bool "MIPS32 Release 3.5 Features"
 	depends on SYS_HAS_CPU_MIPS32_R3_5
-	depends on CPU_MIPS32_R2 || CPU_MIPS32_R5 || CPU_MIPS32_R6
+	depends on CPU_MIPS32_R2 || CPU_MIPS32_R5 || CPU_MIPS32_R6 || \
+		   CPU_P5600
 	help
 	  Choose this option to build a kernel for release 2 or later of the
 	  MIPS32 architecture including features from the 3.5 release such as
@@ -1846,7 +1869,7 @@ config CPU_MIPS32_3_5_EVA
 config CPU_MIPS32_R5_FEATURES
 	bool "MIPS32 Release 5 Features"
 	depends on SYS_HAS_CPU_MIPS32_R5
-	depends on CPU_MIPS32_R2 || CPU_MIPS32_R5
+	depends on CPU_MIPS32_R2 || CPU_MIPS32_R5 || CPU_P5600
 	help
 	  Choose this option to build a kernel for release 2 or later of the
 	  MIPS32 architecture including features from release 5 such as
@@ -2001,6 +2024,10 @@ config SYS_HAS_CPU_MIPS64_R6
 	bool
 	select ARCH_HAS_SYNC_DMA_FOR_CPU if DMA_NONCOHERENT
 
+config SYS_HAS_CPU_P5600
+	bool
+	select ARCH_HAS_SYNC_DMA_FOR_CPU if DMA_NONCOHERENT
+
 config SYS_HAS_CPU_R3000
 	bool
 
@@ -2085,7 +2112,7 @@ endmenu
 config CPU_MIPS32
 	bool
 	default y if CPU_MIPS32_R1 || CPU_MIPS32_R2 || CPU_MIPS32_R5 || \
-		     CPU_MIPS32_R6
+		     CPU_MIPS32_R6 || CPU_P5600
 
 config CPU_MIPS64
 	bool
@@ -2107,7 +2134,7 @@ config CPU_MIPSR2
 
 config CPU_MIPSR5
 	bool
-	default y if CPU_MIPS32_R5
+	default y if CPU_MIPS32_R5 || CPU_P5600
 	select CPU_HAS_RIXI
 	select CPU_HAS_DIEI if !CPU_DIEI_BROKEN
 	select MIPS_SPRAM
@@ -2718,7 +2745,8 @@ config RELOCATABLE
 	bool "Relocatable kernel"
 	depends on SYS_SUPPORTS_RELOCATABLE
 	depends on CPU_MIPS32_R2 || CPU_MIPS64_R2 || CPU_MIPS32_R5 || \
-		   CPU_MIPS32_R6 || CPU_MIPS64_R6 || CAVIUM_OCTEON_SOC
+		   CPU_MIPS32_R6 || CPU_MIPS64_R6 || CPU_P5600 || \
+		   CAVIUM_OCTEON_SOC
 	help
 	  This builds a kernel image that retains relocation information
 	  so it can be loaded someplace besides the default 1MB.
diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 9172fb0f630b..264dead560f4 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -176,6 +176,7 @@ cflags-$(CONFIG_CPU_MIPS32_R6)	+= -march=mips32r6 -Wa,--trap -modd-spreg
 cflags-$(CONFIG_CPU_MIPS64_R1)	+= -march=mips64 -Wa,--trap
 cflags-$(CONFIG_CPU_MIPS64_R2)	+= -march=mips64r2 -Wa,--trap
 cflags-$(CONFIG_CPU_MIPS64_R6)	+= -march=mips64r6 -Wa,--trap
+cflags-$(CONFIG_CPU_P5600)	+= -march=p5600 -Wa,--trap -modd-spreg
 cflags-$(CONFIG_CPU_R5000)	+= -march=r5000 -Wa,--trap
 cflags-$(CONFIG_CPU_R5500)	+= $(call cc-option,-march=r5500,-march=r5000) \
 			-Wa,--trap
diff --git a/arch/mips/include/asm/module.h b/arch/mips/include/asm/module.h
index 65067edc52e0..fe4637ddbf49 100644
--- a/arch/mips/include/asm/module.h
+++ b/arch/mips/include/asm/module.h
@@ -99,6 +99,8 @@ search_module_dbetables(unsigned long addr)
 #define MODULE_PROC_FAMILY "MIPS64_R2 "
 #elif defined CONFIG_CPU_MIPS64_R6
 #define MODULE_PROC_FAMILY "MIPS64_R6 "
+#elif defined CONFIG_CPU_P5600
+#define MODULE_PROC_FAMILY "P5600 "
 #elif defined CONFIG_CPU_R3000
 #define MODULE_PROC_FAMILY "R3000 "
 #elif defined CONFIG_CPU_TX39XX
-- 
2.25.1

