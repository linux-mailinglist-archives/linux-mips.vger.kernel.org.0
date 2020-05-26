Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CF5D1DC3C0
	for <lists+linux-mips@lfdr.de>; Thu, 21 May 2020 02:36:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbgEUAf0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 May 2020 20:35:26 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:32940 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726819AbgEUAfY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 20 May 2020 20:35:24 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 9836180307C7;
        Thu, 21 May 2020 00:35:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id QoM91emHazri; Thu, 21 May 2020 03:35:13 +0300 (MSK)
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
        Alexander Lobakin <alobakin@dlink.ru>,
        Huacai Chen <chenhc@lemote.com>,
        Daniel Silsby <dansilsby@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Cedric Hombourger <Cedric_Hombourger@mentor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Ingo Molnar <mingo@kernel.org>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Guenter Roeck <linux@roeck-us.net>,
        Zhou Yanjie <zhouyanjie@zoho.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Jessica Yu <jeyu@kernel.org>,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= 
        <zhouyanjie@wanyeetech.com>, YunQiang Su <syq@debian.org>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kvm@vger.kernel.org>
Subject: [PATCH v3 03/14] mips: Add MIPS Release 5 support
Date:   Thu, 21 May 2020 03:34:32 +0300
Message-ID: <20200521003443.11385-4-Sergey.Semin@baikalelectronics.ru>
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

There are five MIPS32/64 architecture releases currently available:
from 1 to 6 except fourth one, which was intentionally skipped.
Three of them can be called as major: 1st, 2nd and 6th, that not only
have some system level alterations, but also introduced significant
core/ISA level updates. The rest of the MIPS architecture releases are
minor.

Even though they don't have as much ISA/system/core level changes
as the major ones with respect to the previous releases, they still
provide a set of updates (I'd say they were intended to be the
intermediate releases before a major one) that might be useful for the
kernel and user-level code, when activated by the kernel or compiler.
In particular the following features were introduced or ended up being
available at/after MIPS32/64 Release 5 architecture:
+ the last release of the misaligned memory access instructions,
+ virtualisation - VZ ASE - is optional component of the arch,
+ SIMD - MSA ASE - is optional component of the arch,
+ DSP ASE is optional component of the arch,
+ CP0.Status.FR=1 for CP1.FIR.F64=1 (pure 64-bit FPU general registers)
  must be available if FPU is implemented,
+ CP1.FIR.Has2008 support is required so CP1.FCSR.{ABS2008,NAN2008} bits
  are available.
+ UFR/UNFR aliases to access CP0.Status.FR from user-space by means of
  ctc1/cfc1 instructions (enabled by CP0.Config5.UFR),
+ CP0.COnfig5.LLB=1 and eretnc instruction are implemented to without
  accidentally clearing LL-bit when returning from an interrupt,
  exception, or error trap,
+ XPA feature together with extended versions of CPx registers is
  introduced, which needs to have mfhc0/mthc0 instructions available.

So due to these changes GNU GCC provides an extended instructions set
support for MIPS32/64 Release 5 by default like eretnc/mfhc0/mthc0. Even
though the architecture alteration isn't that big, it still worth to be
taken into account by the kernel software. Finally we can't deny that
some optimization/limitations might be found in future and implemented
on some level in kernel or compiler. In this case having even
intermediate MIPS architecture releases support would be more than
useful.

So the most of the changes provided by this commit can be split into
either compile- or runtime configs related. The compile-time related
changes are caused by adding the new CONFIG_CPU_MIPS32_R5/CONFIG_CPU_MIPSR5
configs and concern the code activating MIPSR2 or MIPSR6 already
implemented features (like eretnc/LLbit, mthc0/mfhc0). In addition
CPU_HAS_MSA can be now freely enabled for MIPS32/64 release 5 based
platforms as this is done for CPU_MIPS32_R6 CPUs. The runtime changes
concerns the features which are handled with respect to the MIPS ISA
revision detected at run-time by means of CP0.Config.{AT,AR} bits. Alas
these fields can be used to detect either r1 or r2 or r6 releases.
But since we know which CPUs in fact support the R5 arch, we can manually
set MIPS_CPU_ISA_M32R5/MIPS_CPU_ISA_M64R5 bit of c->isa_level and then
use cpu_has_mips32r5/cpu_has_mips64r5 where it's appropriate.

Since XPA/EVA provide too complex alterationss and to have them used with
MIPS32 Release 2 charged kernels (for compatibility with current platform
configs) they are left to be setup as a separate kernel configs.

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

Changelog v3:
- Together with MIPS32 add MIPS64 Release 5 support.
---
 arch/mips/Kconfig                    | 56 +++++++++++++++++++++++++---
 arch/mips/Makefile                   |  2 +
 arch/mips/include/asm/asmmacro.h     | 18 +++++----
 arch/mips/include/asm/compiler.h     |  5 +++
 arch/mips/include/asm/cpu-features.h | 27 ++++++++++----
 arch/mips/include/asm/cpu-info.h     |  2 +-
 arch/mips/include/asm/cpu-type.h     |  7 +++-
 arch/mips/include/asm/cpu.h          | 10 +++--
 arch/mips/include/asm/fpu.h          |  4 +-
 arch/mips/include/asm/hazards.h      |  8 ++--
 arch/mips/include/asm/stackframe.h   |  2 +-
 arch/mips/include/asm/switch_to.h    |  8 ++--
 arch/mips/include/asm/vermagic.h     |  4 ++
 arch/mips/kernel/cpu-probe.c         | 17 +++++++++
 arch/mips/kernel/entry.S             |  6 +--
 arch/mips/kernel/proc.c              |  4 ++
 arch/mips/kernel/r4k_fpu.S           | 14 +++----
 arch/mips/kvm/vz.c                   |  6 +--
 arch/mips/lib/csum_partial.S         |  6 ++-
 arch/mips/mm/c-r4k.c                 |  7 ++--
 arch/mips/mm/sc-mips.c               |  7 ++--
 21 files changed, 163 insertions(+), 57 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 690718b3701a..ec3cd300981b 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1580,6 +1580,21 @@ config CPU_MIPS32_R2
 	  specific type of processor in your system, choose those that one
 	  otherwise CPU_MIPS32_R1 is a safe bet for any MIPS32 system.
 
+config CPU_MIPS32_R5
+	bool "MIPS32 Release 5"
+	depends on SYS_HAS_CPU_MIPS32_R5
+	select CPU_HAS_PREFETCH
+	select CPU_SUPPORTS_32BIT_KERNEL
+	select CPU_SUPPORTS_HIGHMEM
+	select CPU_SUPPORTS_MSA
+	select HAVE_KVM
+	select MIPS_O32_FP64_SUPPORT
+	help
+	  Choose this option to build a kernel for release 5 or later of the
+	  MIPS32 architecture.  New MIPS processors, starting with the Warrior
+	  family, are based on a MIPS32r5 processor. If you own an older
+	  processor, you probably need to select MIPS32r1 or MIPS32r2 instead.
+
 config CPU_MIPS32_R6
 	bool "MIPS32 Release 6"
 	depends on SYS_HAS_CPU_MIPS32_R6
@@ -1632,6 +1647,23 @@ config CPU_MIPS64_R2
 	  specific type of processor in your system, choose those that one
 	  otherwise CPU_MIPS64_R1 is a safe bet for any MIPS64 system.
 
+config CPU_MIPS64_R5
+	bool "MIPS64 Release 5"
+	depends on SYS_HAS_CPU_MIPS64_R5
+	select CPU_HAS_PREFETCH
+	select CPU_SUPPORTS_32BIT_KERNEL
+	select CPU_SUPPORTS_64BIT_KERNEL
+	select CPU_SUPPORTS_HIGHMEM
+	select CPU_SUPPORTS_HUGEPAGES
+	select CPU_SUPPORTS_MSA
+	select MIPS_O32_FP64_SUPPORT if 32BIT || MIPS32_O32
+	select HAVE_KVM
+	help
+	  Choose this option to build a kernel for release 5 or later of the
+	  MIPS64 architecture.  This is a intermediate MIPS architecture
+	  release partly implementing release 6 features. Though there is no
+	  any hardware known to be based on this release.
+
 config CPU_MIPS64_R6
 	bool "MIPS64 Release 6"
 	depends on SYS_HAS_CPU_MIPS64_R6
@@ -1826,7 +1858,7 @@ endchoice
 config CPU_MIPS32_3_5_FEATURES
 	bool "MIPS32 Release 3.5 Features"
 	depends on SYS_HAS_CPU_MIPS32_R3_5
-	depends on CPU_MIPS32_R2 || CPU_MIPS32_R6
+	depends on CPU_MIPS32_R2 || CPU_MIPS32_R5 || CPU_MIPS32_R6
 	help
 	  Choose this option to build a kernel for release 2 or later of the
 	  MIPS32 architecture including features from the 3.5 release such as
@@ -1846,7 +1878,7 @@ config CPU_MIPS32_3_5_EVA
 config CPU_MIPS32_R5_FEATURES
 	bool "MIPS32 Release 5 Features"
 	depends on SYS_HAS_CPU_MIPS32_R5
-	depends on CPU_MIPS32_R2
+	depends on CPU_MIPS32_R2 || CPU_MIPS32_R5
 	help
 	  Choose this option to build a kernel for release 2 or later of the
 	  MIPS32 architecture including features from release 5 such as
@@ -2084,11 +2116,13 @@ endmenu
 #
 config CPU_MIPS32
 	bool
-	default y if CPU_MIPS32_R1 || CPU_MIPS32_R2 || CPU_MIPS32_R6
+	default y if CPU_MIPS32_R1 || CPU_MIPS32_R2 || CPU_MIPS32_R5 || \
+		     CPU_MIPS32_R6
 
 config CPU_MIPS64
 	bool
-	default y if CPU_MIPS64_R1 || CPU_MIPS64_R2 || CPU_MIPS64_R6
+	default y if CPU_MIPS64_R1 || CPU_MIPS64_R2 || CPU_MIPS64_R5 || \
+		     CPU_MIPS64_R6
 
 #
 # These indicate the revision of the architecture
@@ -2104,6 +2138,13 @@ config CPU_MIPSR2
 	select CPU_HAS_DIEI if !CPU_DIEI_BROKEN
 	select MIPS_SPRAM
 
+config CPU_MIPSR5
+	bool
+	default y if CPU_MIPS32_R5 || CPU_MIPS64_R5
+	select CPU_HAS_RIXI
+	select CPU_HAS_DIEI if !CPU_DIEI_BROKEN
+	select MIPS_SPRAM
+
 config CPU_MIPSR6
 	bool
 	default y if CPU_MIPS32_R6 || CPU_MIPS64_R6
@@ -2118,6 +2159,7 @@ config TARGET_ISA_REV
 	int
 	default 1 if CPU_MIPSR1
 	default 2 if CPU_MIPSR2
+	default 5 if CPU_MIPSR5
 	default 6 if CPU_MIPSR6
 	default 0
 	help
@@ -2707,7 +2749,11 @@ config NEED_PER_CPU_EMBED_FIRST_CHUNK
 
 config RELOCATABLE
 	bool "Relocatable kernel"
-	depends on SYS_SUPPORTS_RELOCATABLE && (CPU_MIPS32_R2 || CPU_MIPS64_R2 || CPU_MIPS32_R6 || CPU_MIPS64_R6 || CAVIUM_OCTEON_SOC)
+	depends on SYS_SUPPORTS_RELOCATABLE
+	depends on CPU_MIPS32_R2 || CPU_MIPS64_R2 || \
+		   CPU_MIPS32_R5 || CPU_MIPS64_R5 || \
+		   CPU_MIPS32_R6 || CPU_MIPS64_R6 || \
+		   CAVIUM_OCTEON_SOC
 	help
 	  This builds a kernel image that retains relocation information
 	  so it can be loaded someplace besides the default 1MB.
diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index e1c44aed8156..08c8d93d61ba 100644
--- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -171,9 +171,11 @@ cflags-$(CONFIG_CPU_R4X00)	+= -march=r4600 -Wa,--trap
 cflags-$(CONFIG_CPU_TX49XX)	+= -march=r4600 -Wa,--trap
 cflags-$(CONFIG_CPU_MIPS32_R1)	+= -march=mips32 -Wa,--trap
 cflags-$(CONFIG_CPU_MIPS32_R2)	+= -march=mips32r2 -Wa,--trap
+cflags-$(CONFIG_CPU_MIPS32_R5)	+= -march=mips32r5 -Wa,--trap -modd-spreg
 cflags-$(CONFIG_CPU_MIPS32_R6)	+= -march=mips32r6 -Wa,--trap -modd-spreg
 cflags-$(CONFIG_CPU_MIPS64_R1)	+= -march=mips64 -Wa,--trap
 cflags-$(CONFIG_CPU_MIPS64_R2)	+= -march=mips64r2 -Wa,--trap
+cflags-$(CONFIG_CPU_MIPS64_R5)	+= -march=mips64r5 -Wa,--trap
 cflags-$(CONFIG_CPU_MIPS64_R6)	+= -march=mips64r6 -Wa,--trap
 cflags-$(CONFIG_CPU_R5000)	+= -march=r5000 -Wa,--trap
 cflags-$(CONFIG_CPU_R5500)	+= $(call cc-option,-march=r5500,-march=r5000) \
diff --git a/arch/mips/include/asm/asmmacro.h b/arch/mips/include/asm/asmmacro.h
index 655f40ddb6d1..86f2323ebe6b 100644
--- a/arch/mips/include/asm/asmmacro.h
+++ b/arch/mips/include/asm/asmmacro.h
@@ -44,7 +44,8 @@
 	.endm
 #endif
 
-#if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR6)
+#if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR5) || \
+    defined(CONFIG_CPU_MIPSR6)
 	.macro	local_irq_enable reg=t0
 	ei
 	irq_enable_hazard
@@ -54,7 +55,7 @@
 	di
 	irq_disable_hazard
 	.endm
-#else
+#else /* !CONFIG_CPU_MIPSR2 && !CONFIG_CPU_MIPSR5 && !CONFIG_CPU_MIPSR6 */
 	.macro	local_irq_enable reg=t0
 	mfc0	\reg, CP0_STATUS
 	ori	\reg, \reg, 1
@@ -79,7 +80,7 @@
 	sw      \reg, TI_PRE_COUNT($28)
 #endif
 	.endm
-#endif /* CONFIG_CPU_MIPSR2 */
+#endif  /* !CONFIG_CPU_MIPSR2 && !CONFIG_CPU_MIPSR5 && !CONFIG_CPU_MIPSR6 */
 
 	.macro	fpu_save_16even thread tmp=t0
 	.set	push
@@ -131,7 +132,7 @@
 
 	.macro	fpu_save_double thread status tmp
 #if defined(CONFIG_64BIT) || defined(CONFIG_CPU_MIPSR2) || \
-		defined(CONFIG_CPU_MIPSR6)
+    defined(CONFIG_CPU_MIPSR5) || defined(CONFIG_CPU_MIPSR6)
 	sll	\tmp, \status, 5
 	bgez	\tmp, 10f
 	fpu_save_16odd \thread
@@ -190,7 +191,7 @@
 
 	.macro	fpu_restore_double thread status tmp
 #if defined(CONFIG_64BIT) || defined(CONFIG_CPU_MIPSR2) || \
-		defined(CONFIG_CPU_MIPSR6)
+    defined(CONFIG_CPU_MIPSR5) || defined(CONFIG_CPU_MIPSR6)
 	sll	\tmp, \status, 5
 	bgez	\tmp, 10f				# 16 register mode?
 
@@ -200,16 +201,17 @@
 	fpu_restore_16even \thread \tmp
 	.endm
 
-#if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR6)
+#if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR5) || \
+    defined(CONFIG_CPU_MIPSR6)
 	.macro	_EXT	rd, rs, p, s
 	ext	\rd, \rs, \p, \s
 	.endm
-#else /* !CONFIG_CPU_MIPSR2 || !CONFIG_CPU_MIPSR6 */
+#else /* !CONFIG_CPU_MIPSR2 && !CONFIG_CPU_MIPSR5 && !CONFIG_CPU_MIPSR6 */
 	.macro	_EXT	rd, rs, p, s
 	srl	\rd, \rs, \p
 	andi	\rd, \rd, (1 << \s) - 1
 	.endm
-#endif /* !CONFIG_CPU_MIPSR2 || !CONFIG_CPU_MIPSR6 */
+#endif /* !CONFIG_CPU_MIPSR2 && !CONFIG_CPU_MIPSR5 && !CONFIG_CPU_MIPSR6 */
 
 /*
  * Temporary until all gas have MT ASE support
diff --git a/arch/mips/include/asm/compiler.h b/arch/mips/include/asm/compiler.h
index f77e99f1722e..a2cb2d2b1c07 100644
--- a/arch/mips/include/asm/compiler.h
+++ b/arch/mips/include/asm/compiler.h
@@ -57,6 +57,11 @@
 #define MIPS_ISA_ARCH_LEVEL MIPS_ISA_LEVEL
 #define MIPS_ISA_LEVEL_RAW mips64r6
 #define MIPS_ISA_ARCH_LEVEL_RAW MIPS_ISA_LEVEL_RAW
+#elif defined(CONFIG_CPU_MIPSR5)
+#define MIPS_ISA_LEVEL "mips64r5"
+#define MIPS_ISA_ARCH_LEVEL MIPS_ISA_LEVEL
+#define MIPS_ISA_LEVEL_RAW mips64r5
+#define MIPS_ISA_ARCH_LEVEL_RAW MIPS_ISA_LEVEL_RAW
 #else
 /* MIPS64 is a superset of MIPS32 */
 #define MIPS_ISA_LEVEL "mips64r2"
diff --git a/arch/mips/include/asm/cpu-features.h b/arch/mips/include/asm/cpu-features.h
index de44c92b1c1f..8ecd13e3c9c2 100644
--- a/arch/mips/include/asm/cpu-features.h
+++ b/arch/mips/include/asm/cpu-features.h
@@ -284,6 +284,9 @@
 #ifndef cpu_has_mips32r2
 # define cpu_has_mips32r2	__isa_range_or_flag(2, 6, MIPS_CPU_ISA_M32R2)
 #endif
+#ifndef cpu_has_mips32r5
+# define cpu_has_mips32r5	__isa_range_or_flag(5, 6, MIPS_CPU_ISA_M32R5)
+#endif
 #ifndef cpu_has_mips32r6
 # define cpu_has_mips32r6	__isa_ge_or_flag(6, MIPS_CPU_ISA_M32R6)
 #endif
@@ -293,6 +296,10 @@
 #ifndef cpu_has_mips64r2
 # define cpu_has_mips64r2	__isa_range_or_flag(2, 6, MIPS_CPU_ISA_M64R2)
 #endif
+#ifndef cpu_has_mips64r5
+# define cpu_has_mips64r5	(cpu_has_64bits && \
+				 __isa_range_or_flag(5, 6, MIPS_CPU_ISA_M64R5))
+#endif
 #ifndef cpu_has_mips64r6
 # define cpu_has_mips64r6	__isa_ge_and_flag(6, MIPS_CPU_ISA_M64R6)
 #endif
@@ -313,19 +320,25 @@
 				(cpu_has_mips_3 | cpu_has_mips_4_5_64_r2_r6)
 #define cpu_has_mips_4_5_64_r2_r6					\
 				(cpu_has_mips_4_5 | cpu_has_mips64r1 |	\
-				 cpu_has_mips_r2 | cpu_has_mips_r6)
+				 cpu_has_mips_r2 | cpu_has_mips_r5 | \
+				 cpu_has_mips_r6)
 
-#define cpu_has_mips32	(cpu_has_mips32r1 | cpu_has_mips32r2 | cpu_has_mips32r6)
-#define cpu_has_mips64	(cpu_has_mips64r1 | cpu_has_mips64r2 | cpu_has_mips64r6)
+#define cpu_has_mips32	(cpu_has_mips32r1 | cpu_has_mips32r2 | \
+			 cpu_has_mips32r5 | cpu_has_mips32r6)
+#define cpu_has_mips64	(cpu_has_mips64r1 | cpu_has_mips64r2 | \
+			 cpu_has_mips64r5 | cpu_has_mips64r6)
 #define cpu_has_mips_r1 (cpu_has_mips32r1 | cpu_has_mips64r1)
 #define cpu_has_mips_r2 (cpu_has_mips32r2 | cpu_has_mips64r2)
+#define cpu_has_mips_r5	(cpu_has_mips32r5 | cpu_has_mips64r5)
 #define cpu_has_mips_r6	(cpu_has_mips32r6 | cpu_has_mips64r6)
 #define cpu_has_mips_r	(cpu_has_mips32r1 | cpu_has_mips32r2 | \
-			 cpu_has_mips32r6 | cpu_has_mips64r1 | \
-			 cpu_has_mips64r2 | cpu_has_mips64r6)
+			 cpu_has_mips32r5 | cpu_has_mips32r6 | \
+			 cpu_has_mips64r1 | cpu_has_mips64r2 | \
+			 cpu_has_mips64r5 | cpu_has_mips64r6)
 
-/* MIPSR2 and MIPSR6 have a lot of similarities */
-#define cpu_has_mips_r2_r6	(cpu_has_mips_r2 | cpu_has_mips_r6)
+/* MIPSR2 - MIPSR6 have a lot of similarities */
+#define cpu_has_mips_r2_r6	(cpu_has_mips_r2 | cpu_has_mips_r5 | \
+				 cpu_has_mips_r6)
 
 /*
  * cpu_has_mips_r2_exec_hazard - return if IHB is required on current processor
diff --git a/arch/mips/include/asm/cpu-info.h b/arch/mips/include/asm/cpu-info.h
index ed7ffe4e63a3..bce3ea7fff7c 100644
--- a/arch/mips/include/asm/cpu-info.h
+++ b/arch/mips/include/asm/cpu-info.h
@@ -142,7 +142,7 @@ struct proc_cpuinfo_notifier_args {
 static inline unsigned int cpu_cluster(struct cpuinfo_mips *cpuinfo)
 {
 	/* Optimisation for systems where multiple clusters aren't used */
-	if (!IS_ENABLED(CONFIG_CPU_MIPSR6))
+	if (!IS_ENABLED(CONFIG_CPU_MIPSR5) && !IS_ENABLED(CONFIG_CPU_MIPSR6))
 		return 0;
 
 	return (cpuinfo->globalnumber & MIPS_GLOBALNUMBER_CLUSTER) >>
diff --git a/arch/mips/include/asm/cpu-type.h b/arch/mips/include/asm/cpu-type.h
index 49f0061a6051..75a7a382da09 100644
--- a/arch/mips/include/asm/cpu-type.h
+++ b/arch/mips/include/asm/cpu-type.h
@@ -51,13 +51,18 @@ static inline int __pure __get_cpu_type(const int cpu_type)
 	case CPU_M14KEC:
 	case CPU_INTERAPTIV:
 	case CPU_PROAPTIV:
-	case CPU_P5600:
+#endif
+
+#ifdef CONFIG_SYS_HAS_CPU_MIPS32_R5
 	case CPU_M5150:
+	case CPU_P5600:
 #endif
 
 #if defined(CONFIG_SYS_HAS_CPU_MIPS32_R2) || \
+    defined(CONFIG_SYS_HAS_CPU_MIPS32_R5) || \
     defined(CONFIG_SYS_HAS_CPU_MIPS32_R6) || \
     defined(CONFIG_SYS_HAS_CPU_MIPS64_R2) || \
+    defined(CONFIG_SYS_HAS_CPU_MIPS64_R5) || \
     defined(CONFIG_SYS_HAS_CPU_MIPS64_R6)
 	case CPU_QEMU_GENERIC:
 #endif
diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index 216a22916740..2e2035a13a55 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -343,14 +343,16 @@ enum cpu_type_enum {
 #define MIPS_CPU_ISA_M32R2	0x00000020
 #define MIPS_CPU_ISA_M64R1	0x00000040
 #define MIPS_CPU_ISA_M64R2	0x00000080
-#define MIPS_CPU_ISA_M32R6	0x00000100
-#define MIPS_CPU_ISA_M64R6	0x00000200
+#define MIPS_CPU_ISA_M32R5	0x00000100
+#define MIPS_CPU_ISA_M64R5	0x00000200
+#define MIPS_CPU_ISA_M32R6	0x00000400
+#define MIPS_CPU_ISA_M64R6	0x00000800
 
 #define MIPS_CPU_ISA_32BIT (MIPS_CPU_ISA_II | MIPS_CPU_ISA_M32R1 | \
-	MIPS_CPU_ISA_M32R2 | MIPS_CPU_ISA_M32R6)
+	MIPS_CPU_ISA_M32R2 | MIPS_CPU_ISA_M32R5 | MIPS_CPU_ISA_M32R6)
 #define MIPS_CPU_ISA_64BIT (MIPS_CPU_ISA_III | MIPS_CPU_ISA_IV | \
 	MIPS_CPU_ISA_V | MIPS_CPU_ISA_M64R1 | MIPS_CPU_ISA_M64R2 | \
-	MIPS_CPU_ISA_M64R6)
+	MIPS_CPU_ISA_M64R5 | MIPS_CPU_ISA_M64R6)
 
 /*
  * CPU Option encodings
diff --git a/arch/mips/include/asm/fpu.h b/arch/mips/include/asm/fpu.h
index 9476e0498d59..f0b37663fade 100644
--- a/arch/mips/include/asm/fpu.h
+++ b/arch/mips/include/asm/fpu.h
@@ -71,8 +71,8 @@ static inline int __enable_fpu(enum fpu_mode mode)
 		goto fr_common;
 
 	case FPU_64BIT:
-#if !(defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR6) \
-      || defined(CONFIG_64BIT))
+#if !(defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR5) || \
+      defined(CONFIG_CPU_MIPSR6) || defined(CONFIG_64BIT))
 		/* we only have a 32-bit FPU */
 		return SIGFPE;
 #endif
diff --git a/arch/mips/include/asm/hazards.h b/arch/mips/include/asm/hazards.h
index a0b92205f933..f855478d12fa 100644
--- a/arch/mips/include/asm/hazards.h
+++ b/arch/mips/include/asm/hazards.h
@@ -22,8 +22,9 @@
 /*
  * TLB hazards
  */
-#if (defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR6)) && \
-	!defined(CONFIG_CPU_CAVIUM_OCTEON) && !defined(CONFIG_CPU_LOONGSON64)
+#if (defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR5) || \
+     defined(CONFIG_CPU_MIPSR6)) && \
+    !defined(CONFIG_CPU_CAVIUM_OCTEON) && !defined(CONFIG_CPU_LOONGSON64)
 
 /*
  * MIPSR2 defines ehb for hazard avoidance
@@ -278,7 +279,8 @@ do {									\
 
 #define __disable_fpu_hazard
 
-#elif defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR6)
+#elif defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR5) || \
+      defined(CONFIG_CPU_MIPSR6)
 
 #define __enable_fpu_hazard						\
 	___ehb
diff --git a/arch/mips/include/asm/stackframe.h b/arch/mips/include/asm/stackframe.h
index 4d6ad907ae54..3e8d2aaf96af 100644
--- a/arch/mips/include/asm/stackframe.h
+++ b/arch/mips/include/asm/stackframe.h
@@ -424,7 +424,7 @@
 
 		.macro	RESTORE_SP_AND_RET docfi=0
 		RESTORE_SP \docfi
-#ifdef CONFIG_CPU_MIPSR6
+#if defined(CONFIG_CPU_MIPSR5) || defined(CONFIG_CPU_MIPSR6)
 		eretnc
 #else
 		.set	push
diff --git a/arch/mips/include/asm/switch_to.h b/arch/mips/include/asm/switch_to.h
index 09cbe9042828..0b0a93bf83cd 100644
--- a/arch/mips/include/asm/switch_to.h
+++ b/arch/mips/include/asm/switch_to.h
@@ -67,11 +67,11 @@ do {									\
 #endif
 
 /*
- * Clear LLBit during context switches on MIPSr6 such that eretnc can be used
+ * Clear LLBit during context switches on MIPSr5+ such that eretnc can be used
  * unconditionally when returning to userland in entry.S.
  */
-#define __clear_r6_hw_ll_bit() do {					\
-	if (cpu_has_mips_r6)						\
+#define __clear_r5_hw_ll_bit() do {					\
+	if (cpu_has_mips_r5 || cpu_has_mips_r6)				\
 		write_c0_lladdr(0);					\
 } while (0)
 
@@ -129,7 +129,7 @@ do {									\
 		}							\
 		clear_c0_status(ST0_CU2);				\
 	}								\
-	__clear_r6_hw_ll_bit();						\
+	__clear_r5_hw_ll_bit();						\
 	__clear_software_ll_bit();					\
 	if (cpu_has_userlocal)						\
 		write_c0_userlocal(task_thread_info(next)->tp_value);	\
diff --git a/arch/mips/include/asm/vermagic.h b/arch/mips/include/asm/vermagic.h
index 24dc3d35161c..01d0ea9e9e23 100644
--- a/arch/mips/include/asm/vermagic.h
+++ b/arch/mips/include/asm/vermagic.h
@@ -8,12 +8,16 @@
 #define MODULE_PROC_FAMILY "MIPS32_R1 "
 #elif defined CONFIG_CPU_MIPS32_R2
 #define MODULE_PROC_FAMILY "MIPS32_R2 "
+#elif defined CONFIG_CPU_MIPS32_R5
+#define MODULE_PROC_FAMILY "MIPS32_R5 "
 #elif defined CONFIG_CPU_MIPS32_R6
 #define MODULE_PROC_FAMILY "MIPS32_R6 "
 #elif defined CONFIG_CPU_MIPS64_R1
 #define MODULE_PROC_FAMILY "MIPS64_R1 "
 #elif defined CONFIG_CPU_MIPS64_R2
 #define MODULE_PROC_FAMILY "MIPS64_R2 "
+#elif defined CONFIG_CPU_MIPS64_R5
+#define MODULE_PROC_FAMILY "MIPS64_R5 "
 #elif defined CONFIG_CPU_MIPS64_R6
 #define MODULE_PROC_FAMILY "MIPS64_R6 "
 #elif defined CONFIG_CPU_R3000
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index f21a2304401f..cd4776faa9a5 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -92,6 +92,7 @@ static void cpu_set_fpu_2008(struct cpuinfo_mips *c)
 {
 	if (c->isa_level & (MIPS_CPU_ISA_M32R1 | MIPS_CPU_ISA_M64R1 |
 			    MIPS_CPU_ISA_M32R2 | MIPS_CPU_ISA_M64R2 |
+			    MIPS_CPU_ISA_M32R5 | MIPS_CPU_ISA_M64R5 |
 			    MIPS_CPU_ISA_M32R6 | MIPS_CPU_ISA_M64R6)) {
 		unsigned long sr, fir, fcsr, fcsr0, fcsr1;
 
@@ -172,6 +173,7 @@ static void cpu_set_nofpu_2008(struct cpuinfo_mips *c)
 	case STRICT:
 		if (c->isa_level & (MIPS_CPU_ISA_M32R1 | MIPS_CPU_ISA_M64R1 |
 				    MIPS_CPU_ISA_M32R2 | MIPS_CPU_ISA_M64R2 |
+				    MIPS_CPU_ISA_M32R5 | MIPS_CPU_ISA_M64R5 |
 				    MIPS_CPU_ISA_M32R6 | MIPS_CPU_ISA_M64R6)) {
 			c->options |= MIPS_CPU_NAN_2008 | MIPS_CPU_NAN_LEGACY;
 		} else {
@@ -263,9 +265,11 @@ static void cpu_set_nofpu_id(struct cpuinfo_mips *c)
 	value = 0;
 	if (c->isa_level & (MIPS_CPU_ISA_M32R1 | MIPS_CPU_ISA_M64R1 |
 			    MIPS_CPU_ISA_M32R2 | MIPS_CPU_ISA_M64R2 |
+			    MIPS_CPU_ISA_M32R5 | MIPS_CPU_ISA_M64R5 |
 			    MIPS_CPU_ISA_M32R6 | MIPS_CPU_ISA_M64R6))
 		value |= MIPS_FPIR_D | MIPS_FPIR_S;
 	if (c->isa_level & (MIPS_CPU_ISA_M32R2 | MIPS_CPU_ISA_M64R2 |
+			    MIPS_CPU_ISA_M32R5 | MIPS_CPU_ISA_M64R5 |
 			    MIPS_CPU_ISA_M32R6 | MIPS_CPU_ISA_M64R6))
 		value |= MIPS_FPIR_F64 | MIPS_FPIR_L | MIPS_FPIR_W;
 	if (c->options & MIPS_CPU_NAN_2008)
@@ -286,6 +290,7 @@ static void cpu_set_fpu_opts(struct cpuinfo_mips *c)
 
 	if (c->isa_level & (MIPS_CPU_ISA_M32R1 | MIPS_CPU_ISA_M64R1 |
 			    MIPS_CPU_ISA_M32R2 | MIPS_CPU_ISA_M64R2 |
+			    MIPS_CPU_ISA_M32R5 | MIPS_CPU_ISA_M64R5 |
 			    MIPS_CPU_ISA_M32R6 | MIPS_CPU_ISA_M64R6)) {
 		if (c->fpu_id & MIPS_FPIR_3D)
 			c->ases |= MIPS_ASE_MIPS3D;
@@ -532,6 +537,10 @@ static inline void cpu_probe_vmbits(struct cpuinfo_mips *c)
 static void set_isa(struct cpuinfo_mips *c, unsigned int isa)
 {
 	switch (isa) {
+	case MIPS_CPU_ISA_M64R5:
+		c->isa_level |= MIPS_CPU_ISA_M32R5 | MIPS_CPU_ISA_M64R5;
+		set_elf_base_platform("mips64r5");
+		/* fall through */
 	case MIPS_CPU_ISA_M64R2:
 		c->isa_level |= MIPS_CPU_ISA_M32R2 | MIPS_CPU_ISA_M64R2;
 		set_elf_base_platform("mips64r2");
@@ -563,6 +572,10 @@ static void set_isa(struct cpuinfo_mips *c, unsigned int isa)
 		set_elf_base_platform("mips32r6");
 		/* Break here so we don't add incompatible ISAs */
 		break;
+	case MIPS_CPU_ISA_M32R5:
+		c->isa_level |= MIPS_CPU_ISA_M32R5;
+		set_elf_base_platform("mips32r5");
+		/* fall through */
 	case MIPS_CPU_ISA_M32R2:
 		c->isa_level |= MIPS_CPU_ISA_M32R2;
 		set_elf_base_platform("mips32r2");
@@ -1751,6 +1764,10 @@ static inline void cpu_probe_mips(struct cpuinfo_mips *c, unsigned int cpu)
 	spram_config();
 
 	switch (__get_cpu_type(c->cputype)) {
+	case CPU_M5150:
+	case CPU_P5600:
+		set_isa(c, MIPS_CPU_ISA_M32R5);
+		break;
 	case CPU_I6500:
 		c->options |= MIPS_CPU_SHARED_FTLB_ENTRIES;
 		/* fall-through */
diff --git a/arch/mips/kernel/entry.S b/arch/mips/kernel/entry.S
index 4849a48afc0f..4b896f5023ff 100644
--- a/arch/mips/kernel/entry.S
+++ b/arch/mips/kernel/entry.S
@@ -169,8 +169,8 @@ syscall_exit_work:
 	jal	syscall_trace_leave
 	b	resume_userspace
 
-#if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR6) || \
-    defined(CONFIG_MIPS_MT)
+#if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR5) || \
+    defined(CONFIG_CPU_MIPSR6) || defined(CONFIG_MIPS_MT)
 
 /*
  * MIPS32R2 Instruction Hazard Barrier - must be called
@@ -183,4 +183,4 @@ LEAF(mips_ihb)
 	nop
 	END(mips_ihb)
 
-#endif /* CONFIG_CPU_MIPSR2 or CONFIG_CPU_MIPSR6 or CONFIG_MIPS_MT */
+#endif /* CONFIG_CPU_MIPSR2 - CONFIG_CPU_MIPSR6 or CONFIG_MIPS_MT */
diff --git a/arch/mips/kernel/proc.c b/arch/mips/kernel/proc.c
index f8d36710cd58..4184d641f05e 100644
--- a/arch/mips/kernel/proc.c
+++ b/arch/mips/kernel/proc.c
@@ -98,12 +98,16 @@ static int show_cpuinfo(struct seq_file *m, void *v)
 		seq_printf(m, "%s", " mips32r1");
 	if (cpu_has_mips32r2)
 		seq_printf(m, "%s", " mips32r2");
+	if (cpu_has_mips32r5)
+		seq_printf(m, "%s", " mips32r5");
 	if (cpu_has_mips32r6)
 		seq_printf(m, "%s", " mips32r6");
 	if (cpu_has_mips64r1)
 		seq_printf(m, "%s", " mips64r1");
 	if (cpu_has_mips64r2)
 		seq_printf(m, "%s", " mips64r2");
+	if (cpu_has_mips64r5)
+		seq_printf(m, "%s", " mips64r5");
 	if (cpu_has_mips64r6)
 		seq_printf(m, "%s", " mips64r6");
 	seq_printf(m, "\n");
diff --git a/arch/mips/kernel/r4k_fpu.S b/arch/mips/kernel/r4k_fpu.S
index 59be5c812aa2..b91e91106475 100644
--- a/arch/mips/kernel/r4k_fpu.S
+++ b/arch/mips/kernel/r4k_fpu.S
@@ -41,7 +41,7 @@
 LEAF(_save_fp)
 EXPORT_SYMBOL(_save_fp)
 #if defined(CONFIG_64BIT) || defined(CONFIG_CPU_MIPSR2) || \
-		defined(CONFIG_CPU_MIPSR6)
+    defined(CONFIG_CPU_MIPSR5) || defined(CONFIG_CPU_MIPSR6)
 	mfc0	t0, CP0_STATUS
 #endif
 	fpu_save_double a0 t0 t1		# clobbers t1
@@ -53,7 +53,7 @@ EXPORT_SYMBOL(_save_fp)
  */
 LEAF(_restore_fp)
 #if defined(CONFIG_64BIT) || defined(CONFIG_CPU_MIPSR2) || \
-		defined(CONFIG_CPU_MIPSR6)
+    defined(CONFIG_CPU_MIPSR5) || defined(CONFIG_CPU_MIPSR6)
 	mfc0	t0, CP0_STATUS
 #endif
 	fpu_restore_double a0 t0 t1		# clobbers t1
@@ -103,10 +103,10 @@ LEAF(_save_fp_context)
 	.set	pop
 
 #if defined(CONFIG_64BIT) || defined(CONFIG_CPU_MIPSR2) || \
-		defined(CONFIG_CPU_MIPSR6)
+    defined(CONFIG_CPU_MIPSR5) || defined(CONFIG_CPU_MIPSR6)
 	.set	push
 	SET_HARDFLOAT
-#ifdef CONFIG_CPU_MIPSR2
+#if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR5)
 	.set	mips32r2
 	.set	fp=64
 	mfc0	t0, CP0_STATUS
@@ -170,11 +170,11 @@ LEAF(_save_fp_context)
 LEAF(_restore_fp_context)
 	EX	lw t1, 0(a1)
 
-#if defined(CONFIG_64BIT) || defined(CONFIG_CPU_MIPSR2)  || \
-		defined(CONFIG_CPU_MIPSR6)
+#if defined(CONFIG_64BIT) || defined(CONFIG_CPU_MIPSR2) || \
+    defined(CONFIG_CPU_MIPSR5) || defined(CONFIG_CPU_MIPSR6)
 	.set	push
 	SET_HARDFLOAT
-#ifdef CONFIG_CPU_MIPSR2
+#if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR5)
 	.set	mips32r2
 	.set	fp=64
 	mfc0	t0, CP0_STATUS
diff --git a/arch/mips/kvm/vz.c b/arch/mips/kvm/vz.c
index dde20887a70d..66432b5ab229 100644
--- a/arch/mips/kvm/vz.c
+++ b/arch/mips/kvm/vz.c
@@ -2980,7 +2980,7 @@ static int kvm_vz_vcpu_setup(struct kvm_vcpu *vcpu)
 	 */
 
 	/* PageGrain */
-	if (cpu_has_mips_r6)
+	if (cpu_has_mips_r5 || cpu_has_mips_r6)
 		kvm_write_sw_gc0_pagegrain(cop0, PG_RIE | PG_XIE | PG_IEC);
 	/* Wired */
 	if (cpu_has_mips_r6)
@@ -2988,7 +2988,7 @@ static int kvm_vz_vcpu_setup(struct kvm_vcpu *vcpu)
 				       read_gc0_wired() & MIPSR6_WIRED_LIMIT);
 	/* Status */
 	kvm_write_sw_gc0_status(cop0, ST0_BEV | ST0_ERL);
-	if (cpu_has_mips_r6)
+	if (cpu_has_mips_r5 || cpu_has_mips_r6)
 		kvm_change_sw_gc0_status(cop0, ST0_FR, read_gc0_status());
 	/* IntCtl */
 	kvm_write_sw_gc0_intctl(cop0, read_gc0_intctl() &
@@ -3086,7 +3086,7 @@ static int kvm_vz_vcpu_setup(struct kvm_vcpu *vcpu)
 	}
 
 	/* reset HTW registers */
-	if (cpu_guest_has_htw && cpu_has_mips_r6) {
+	if (cpu_guest_has_htw && (cpu_has_mips_r5 || cpu_has_mips_r6)) {
 		/* PWField */
 		kvm_write_sw_gc0_pwfield(cop0, 0x0c30c302);
 		/* PWSize */
diff --git a/arch/mips/lib/csum_partial.S b/arch/mips/lib/csum_partial.S
index fda7b57b826e..87fda0713b84 100644
--- a/arch/mips/lib/csum_partial.S
+++ b/arch/mips/lib/csum_partial.S
@@ -279,7 +279,8 @@ EXPORT_SYMBOL(csum_partial)
 #endif
 
 	/* odd buffer alignment? */
-#if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_LOONGSON64)
+#if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR5) || \
+    defined(CONFIG_CPU_LOONGSON64)
 	.set	push
 	.set	arch=mips32r2
 	wsbh	v1, sum
@@ -732,7 +733,8 @@ EXPORT_SYMBOL(csum_partial)
 	addu	sum, v1
 #endif
 
-#if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_LOONGSON64)
+#if defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR5) || \
+    defined(CONFIG_CPU_LOONGSON64)
 	.set	push
 	.set	arch=mips32r2
 	wsbh	v1, sum
diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 36a311348739..558b6fbbb6e8 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -1703,9 +1703,10 @@ static void setup_scache(void)
 		return;
 
 	default:
-		if (c->isa_level & (MIPS_CPU_ISA_M32R1 | MIPS_CPU_ISA_M32R2 |
-				    MIPS_CPU_ISA_M32R6 | MIPS_CPU_ISA_M64R1 |
-				    MIPS_CPU_ISA_M64R2 | MIPS_CPU_ISA_M64R6)) {
+		if (c->isa_level & (MIPS_CPU_ISA_M32R1 | MIPS_CPU_ISA_M64R1 |
+				    MIPS_CPU_ISA_M32R2 | MIPS_CPU_ISA_M64R2 |
+				    MIPS_CPU_ISA_M32R5 | MIPS_CPU_ISA_M64R5 |
+				    MIPS_CPU_ISA_M32R6 | MIPS_CPU_ISA_M64R6)) {
 #ifdef CONFIG_MIPS_CPU_SCACHE
 			if (mips_sc_init ()) {
 				scache_size = c->scache.ways * c->scache.sets * c->scache.linesz;
diff --git a/arch/mips/mm/sc-mips.c b/arch/mips/mm/sc-mips.c
index dbdbfe5d8408..eedad47df24f 100644
--- a/arch/mips/mm/sc-mips.c
+++ b/arch/mips/mm/sc-mips.c
@@ -194,9 +194,10 @@ static inline int __init mips_sc_probe(void)
 		return mips_sc_probe_cm3();
 
 	/* Ignore anything but MIPSxx processors */
-	if (!(c->isa_level & (MIPS_CPU_ISA_M32R1 | MIPS_CPU_ISA_M32R2 |
-			      MIPS_CPU_ISA_M32R6 | MIPS_CPU_ISA_M64R1 |
-			      MIPS_CPU_ISA_M64R2 | MIPS_CPU_ISA_M64R6)))
+	if (!(c->isa_level & (MIPS_CPU_ISA_M32R1 | MIPS_CPU_ISA_M64R1 |
+			      MIPS_CPU_ISA_M32R2 | MIPS_CPU_ISA_M64R2 |
+			      MIPS_CPU_ISA_M32R5 | MIPS_CPU_ISA_M64R5 |
+			      MIPS_CPU_ISA_M32R6 | MIPS_CPU_ISA_M64R6)))
 		return 0;
 
 	/* Does this MIPS32/MIPS64 CPU have a config2 register? */
-- 
2.25.1

