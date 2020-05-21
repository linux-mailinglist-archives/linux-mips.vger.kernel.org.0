Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E76761DC3C4
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2020 02:36:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726993AbgEUAfU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 May 2020 20:35:20 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:32994 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726844AbgEUAfT (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 May 2020 20:35:19 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 738A6803087B;
        Thu, 21 May 2020 00:35:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id TIlKOzCTfKMC; Thu, 21 May 2020 03:35:15 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Alexander Lobakin <alobakin@dlink.ru>,
        Daniel Silsby <dansilsby@gmail.com>,
        =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Ard Biesheuvel <ardb@kernel.org>,
        Cedric Hombourger <Cedric_Hombourger@mentor.com>,
        Jessica Yu <jeyu@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 04/14] mips: Add MIPS Warrior P5600 support
Date:   Thu, 21 May 2020 03:34:33 +0300
Message-ID: <20200521003443.11385-5-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200521003443.11385-1-Sergey.Semin@baikalelectronics.ru>
References: <20200521003443.11385-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

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

Co-developed-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
---
 arch/mips/Kconfig                | 37 +++++++++++++++++++++++++++-----
 arch/mips/Makefile               |  1 +
 arch/mips/include/asm/vermagic.h |  2 ++
 3 files changed, 35 insertions(+), 5 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index ec3cd300981b..b0eff203fbd8 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1682,6 +1682,28 @@ config CPU_MIPS64_R6
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
@@ -1858,7 +1880,8 @@ endchoice
 config CPU_MIPS32_3_5_FEATURES
 	bool "MIPS32 Release 3.5 Features"
 	depends on SYS_HAS_CPU_MIPS32_R3_5
-	depends on CPU_MIPS32_R2 || CPU_MIPS32_R5 || CPU_MIPS32_R6
+	depends on CPU_MIPS32_R2 || CPU_MIPS32_R5 || CPU_MIPS32_R6 || \
+		   CPU_P5600
 	help
 	  Choose this option to build a kernel for release 2 or later of the
 	  MIPS32 architecture including features from the 3.5 release such as
@@ -1878,7 +1901,7 @@ config CPU_MIPS32_3_5_EVA
 config CPU_MIPS32_R5_FEATURES
 	bool "MIPS32 Release 5 Features"
 	depends on SYS_HAS_CPU_MIPS32_R5
-	depends on CPU_MIPS32_R2 || CPU_MIPS32_R5
+	depends on CPU_MIPS32_R2 || CPU_MIPS32_R5 || CPU_P5600
 	help
 	  Choose this option to build a kernel for release 2 or later of the
 	  MIPS32 architecture including features from release 5 such as
@@ -2033,6 +2056,10 @@ config SYS_HAS_CPU_MIPS64_R6
 	bool
 	select ARCH_HAS_SYNC_DMA_FOR_CPU if DMA_NONCOHERENT
 
+config SYS_HAS_CPU_P5600
+	bool
+	select ARCH_HAS_SYNC_DMA_FOR_CPU if DMA_NONCOHERENT
+
 config SYS_HAS_CPU_R3000
 	bool
 
@@ -2117,7 +2144,7 @@ endmenu
 config CPU_MIPS32
 	bool
 	default y if CPU_MIPS32_R1 || CPU_MIPS32_R2 || CPU_MIPS32_R5 || \
-		     CPU_MIPS32_R6
+		     CPU_MIPS32_R6 || CPU_P5600
 
 config CPU_MIPS64
 	bool
@@ -2140,7 +2167,7 @@ config CPU_MIPSR2
 
 config CPU_MIPSR5
 	bool
-	default y if CPU_MIPS32_R5 || CPU_MIPS64_R5
+	default y if CPU_MIPS32_R5 || CPU_MIPS64_R5 || CPU_P5600
 	select CPU_HAS_RIXI
 	select CPU_HAS_DIEI if !CPU_DIEI_BROKEN
 	select MIPS_SPRAM
@@ -2753,7 +2780,7 @@ config RELOCATABLE
 	depends on CPU_MIPS32_R2 || CPU_MIPS64_R2 || \
 		   CPU_MIPS32_R5 || CPU_MIPS64_R5 || \
 		   CPU_MIPS32_R6 || CPU_MIPS64_R6 || \
-		   CAVIUM_OCTEON_SOC
+		   CPU_P5600 || CAVIUM_OCTEON_SOC
 	help
 	  This builds a kernel image that retains relocation information
 	  so it can be loaded someplace besides the default 1MB.
diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 08c8d93d61ba..a6ccf4c0190c 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -177,6 +177,7 @@ cflags-$(CONFIG_CPU_MIPS64_R1)	+= -march=mips64 -Wa,--trap
 cflags-$(CONFIG_CPU_MIPS64_R2)	+= -march=mips64r2 -Wa,--trap
 cflags-$(CONFIG_CPU_MIPS64_R5)	+= -march=mips64r5 -Wa,--trap
 cflags-$(CONFIG_CPU_MIPS64_R6)	+= -march=mips64r6 -Wa,--trap
+cflags-$(CONFIG_CPU_P5600)	+= -march=p5600 -Wa,--trap -modd-spreg
 cflags-$(CONFIG_CPU_R5000)	+= -march=r5000 -Wa,--trap
 cflags-$(CONFIG_CPU_R5500)	+= $(call cc-option,-march=r5500,-march=r5000) \
 			-Wa,--trap
diff --git a/arch/mips/include/asm/vermagic.h b/arch/mips/include/asm/vermagic.h
index 01d0ea9e9e23..4d2dae0c7c57 100644
--- a/arch/mips/include/asm/vermagic.h
+++ b/arch/mips/include/asm/vermagic.h
@@ -50,6 +50,8 @@
 #define MODULE_PROC_FAMILY "LOONGSON64 "
 #elif defined CONFIG_CPU_CAVIUM_OCTEON
 #define MODULE_PROC_FAMILY "OCTEON "
+#elif defined CONFIG_CPU_P5600
+#define MODULE_PROC_FAMILY "P5600 "
 #elif defined CONFIG_CPU_XLR
 #define MODULE_PROC_FAMILY "XLR "
 #elif defined CONFIG_CPU_XLP
-- 
2.25.1

