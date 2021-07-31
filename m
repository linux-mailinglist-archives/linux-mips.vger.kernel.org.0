Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D0373DC394
	for <lists+linux-mips@lfdr.de>; Sat, 31 Jul 2021 07:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231529AbhGaFhO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 31 Jul 2021 01:37:14 -0400
Received: from condef-03.nifty.com ([202.248.20.68]:19434 "EHLO
        condef-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229766AbhGaFhO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 31 Jul 2021 01:37:14 -0400
Received: from conuserg-07.nifty.com ([10.126.8.70])by condef-03.nifty.com with ESMTP id 16V5V6NS027464;
        Sat, 31 Jul 2021 14:31:07 +0900
Received: from localhost.localdomain ([133.106.57.58]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 16V5MZEI012804;
        Sat, 31 Jul 2021 14:22:37 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 16V5MZEI012804
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1627708963;
        bh=v2JzCXW0kB79Gx/GTs/BwqvDDHBVY3jhvWmRUXq8+Pc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ko3lEQNCt9aWa1WNoNyxb6btsGCxhZPPcXe/0g12g6hbIKJiPPwNUlhMbBg2ms4+Y
         J2kw+iq+wPcdaEaoi798dmW/20yK7a5FAc8WQwaavAEST9z0IXh7H2G26Mr/gDPA6P
         vnGsB2ADPPLLE+dnNkCylZK1SGKAzTH6Sg++M+wNsRw0FK+qhmnyHg5ozhBAN4Bx2k
         sCT+TDOxVJpi65KOMkaArhLLXmmlKYa8QBtUsORXb0WW+Wah704V+1mSHYlm6aRe6p
         CXRaal+Hl95/oIyAosFZC+nJtzQDShnsaStcabP657GJMNqw7QQjCr12ng22h08dsY
         yqZJk+tRs/kyA==
X-Nifty-SrcIP: [133.106.57.58]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Ard Biesheuvel <ardb@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ley Foon Tan <ley.foon.tan@intel.com>, x86@kernel.org,
        linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Nick Hu <nickhu@andestech.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Mike Rapoport <rppt@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        linux-riscv@lists.infradead.org, YiFei Zhu <yifeifz2@illinois.edu>,
        Greentime Hu <green.hu@gmail.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Michal Simek <monstr@monstr.eu>, Helge Deller <deller@gmx.de>,
        linux-sh@vger.kernel.org, Vineet Gupta <vgupta@synopsys.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Guo Ren <guoren@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Richard Weinberger <richard@nod.at>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Rich Felker <dalias@libc.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Heiko Carstens <hca@linux.ibm.com>,
        Jeff Dike <jdike@addtoit.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        linux-hexagon@vger.kernel.org, linux-xtensa@linux-xtensa.org,
        "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
        linux-s390@vger.kernel.org,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-um@lists.infradead.org,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Brian Cain <bcain@codeaurora.org>, linux-csky@vger.kernel.org,
        Stafford Horne <shorne@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Chris Zankel <chris@zankel.net>,
        Vasily Gorbik <gor@linux.ibm.com>,
        linux-snps-arc@lists.infradead.org,
        Jonas Bonn <jonas@southpole.se>, linux-parisc@vger.kernel.org,
        Kees Cook <keescook@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Colin Ian King <colin.king@canonical.com>,
        "David S. Miller" <davem@davemloft.net>,
        linux-kernel@vger.kernel.org, Vincent Chen <deanbo422@gmail.com>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Paul Mackerras <paulus@samba.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linuxppc-dev@lists.ozlabs.org, openrisc@lists.librecores.org
Subject: [PATCH 2/3] trace: refactor TRACE_IRQFLAGS_SUPPORT in Kconfig
Date:   Sat, 31 Jul 2021 14:22:32 +0900
Message-Id: <20210731052233.4703-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210731052233.4703-1-masahiroy@kernel.org>
References: <20210731052233.4703-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Make architectures select TRACE_IRQFLAGS_SUPPORT instead of
having many defines.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/Kconfig                  | 3 +++
 arch/arc/Kconfig              | 4 +---
 arch/arm/Kconfig              | 5 +----
 arch/arm64/Kconfig            | 4 +---
 arch/csky/Kconfig             | 4 +---
 arch/hexagon/Kconfig          | 4 +---
 arch/microblaze/Kconfig       | 1 +
 arch/microblaze/Kconfig.debug | 5 -----
 arch/mips/Kconfig             | 1 +
 arch/mips/Kconfig.debug       | 4 ----
 arch/nds32/Kconfig            | 4 +---
 arch/nios2/Kconfig            | 3 ---
 arch/openrisc/Kconfig         | 4 +---
 arch/parisc/Kconfig           | 1 +
 arch/parisc/Kconfig.debug     | 3 ---
 arch/powerpc/Kconfig          | 5 +----
 arch/riscv/Kconfig            | 4 +---
 arch/s390/Kconfig             | 1 +
 arch/s390/Kconfig.debug       | 3 ---
 arch/sh/Kconfig               | 1 +
 arch/sh/Kconfig.debug         | 3 ---
 arch/sparc/Kconfig            | 1 +
 arch/sparc/Kconfig.debug      | 4 ----
 arch/um/Kconfig               | 5 +----
 arch/x86/Kconfig              | 1 +
 arch/x86/Kconfig.debug        | 3 ---
 arch/xtensa/Kconfig           | 4 +---
 27 files changed, 21 insertions(+), 64 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 129df498a8e1..9471a0feecaf 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -197,6 +197,9 @@ config HAVE_FUNCTION_ERROR_INJECTION
 config HAVE_NMI
 	bool
 
+config TRACE_IRQFLAGS_SUPPORT
+	bool
+
 #
 # An arch should select this if it provides all these things:
 #
diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
index d8f51eb8963b..0c81df3a5c7a 100644
--- a/arch/arc/Kconfig
+++ b/arch/arc/Kconfig
@@ -49,9 +49,7 @@ config ARC
 	select PERF_USE_VMALLOC if ARC_CACHE_VIPT_ALIASING
 	select HAVE_ARCH_JUMP_LABEL if ISA_ARCV2 && !CPU_ENDIAN_BE32
 	select SET_FS
-
-config TRACE_IRQFLAGS_SUPPORT
-	def_bool y
+	select TRACE_IRQFLAGS_SUPPORT
 
 config LOCKDEP_SUPPORT
 	def_bool y
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 82f908fa5676..3564647283e1 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -128,6 +128,7 @@ config ARM
 	select RTC_LIB
 	select SET_FS
 	select SYS_SUPPORTS_APM_EMULATION
+	select TRACE_IRQFLAGS_SUPPORT if !CPU_V7M
 	# Above selects are sorted alphabetically; please add new ones
 	# according to that.  Thanks.
 	help
@@ -191,10 +192,6 @@ config LOCKDEP_SUPPORT
 	bool
 	default y
 
-config TRACE_IRQFLAGS_SUPPORT
-	bool
-	default !CPU_V7M
-
 config ARCH_HAS_ILOG2_U32
 	bool
 
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b5b13a932561..67b04ae5d010 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -221,6 +221,7 @@ config ARM64
 	select SYSCTL_EXCEPTION_TRACE
 	select THREAD_INFO_IN_TASK
 	select HAVE_ARCH_USERFAULTFD_MINOR if USERFAULTFD
+	select TRACE_IRQFLAGS_SUPPORT
 	help
 	  ARM 64-bit (AArch64) Linux support.
 
@@ -288,9 +289,6 @@ config ILLEGAL_POINTER_VALUE
 config LOCKDEP_SUPPORT
 	def_bool y
 
-config TRACE_IRQFLAGS_SUPPORT
-	def_bool y
-
 config GENERIC_BUG
 	def_bool y
 	depends on BUG
diff --git a/arch/csky/Kconfig b/arch/csky/Kconfig
index 2716f6395ba7..9d4d898df76b 100644
--- a/arch/csky/Kconfig
+++ b/arch/csky/Kconfig
@@ -82,6 +82,7 @@ config CSKY
 	select PCI_SYSCALL if PCI
 	select PCI_MSI if PCI
 	select SET_FS
+	select TRACE_IRQFLAGS_SUPPORT
 
 config LOCKDEP_SUPPORT
 	def_bool y
@@ -139,9 +140,6 @@ config STACKTRACE_SUPPORT
 config TIME_LOW_RES
 	def_bool y
 
-config TRACE_IRQFLAGS_SUPPORT
-	def_bool y
-
 config CPU_TLB_SIZE
 	int
 	default "128"	if (CPU_CK610 || CPU_CK807 || CPU_CK810)
diff --git a/arch/hexagon/Kconfig b/arch/hexagon/Kconfig
index e5a852080730..f993c4deaf23 100644
--- a/arch/hexagon/Kconfig
+++ b/arch/hexagon/Kconfig
@@ -31,6 +31,7 @@ config HEXAGON
 	select GENERIC_CPU_DEVICES
 	select SET_FS
 	select ARCH_WANT_LD_ORPHAN_WARN
+	select TRACE_IRQFLAGS_SUPPORT
 	help
 	  Qualcomm Hexagon is a processor architecture designed for high
 	  performance and low power across a wide variety of applications.
@@ -52,9 +53,6 @@ config EARLY_PRINTK
 config MMU
 	def_bool y
 
-config TRACE_IRQFLAGS_SUPPORT
-	def_bool y
-
 config GENERIC_CSUM
 	def_bool y
 
diff --git a/arch/microblaze/Kconfig b/arch/microblaze/Kconfig
index 14a67a42fcae..59798e43cdb0 100644
--- a/arch/microblaze/Kconfig
+++ b/arch/microblaze/Kconfig
@@ -44,6 +44,7 @@ config MICROBLAZE
 	select SPARSE_IRQ
 	select SET_FS
 	select ZONE_DMA
+	select TRACE_IRQFLAGS_SUPPORT
 
 # Endianness selection
 choice
diff --git a/arch/microblaze/Kconfig.debug b/arch/microblaze/Kconfig.debug
index 865527ac332a..a4e40e534e6a 100644
--- a/arch/microblaze/Kconfig.debug
+++ b/arch/microblaze/Kconfig.debug
@@ -1,6 +1 @@
 # SPDX-License-Identifier: GPL-2.0-only
-# For a description of the syntax of this configuration file,
-# see Documentation/kbuild/kconfig-language.rst.
-
-config TRACE_IRQFLAGS_SUPPORT
-	def_bool y
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index cee6087cd686..3017c9e8bb07 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -97,6 +97,7 @@ config MIPS
 	select PCI_MSI_ARCH_FALLBACKS if PCI_MSI
 	select RTC_LIB
 	select SYSCTL_EXCEPTION_TRACE
+	select TRACE_IRQFLAGS_SUPPORT
 	select VIRT_TO_BUS
 	select ARCH_HAS_ELFCORE_COMPAT
 
diff --git a/arch/mips/Kconfig.debug b/arch/mips/Kconfig.debug
index 43dbf5930796..f4ae7900fcd3 100644
--- a/arch/mips/Kconfig.debug
+++ b/arch/mips/Kconfig.debug
@@ -1,9 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
-config TRACE_IRQFLAGS_SUPPORT
-	bool
-	default y
-
 config EARLY_PRINTK
 	bool "Early printk" if EXPERT
 	depends on SYS_HAS_EARLY_PRINTK
diff --git a/arch/nds32/Kconfig b/arch/nds32/Kconfig
index 62313902d75d..dd50123335d8 100644
--- a/arch/nds32/Kconfig
+++ b/arch/nds32/Kconfig
@@ -48,6 +48,7 @@ config NDS32
 	select HAVE_FTRACE_MCOUNT_RECORD
 	select HAVE_DYNAMIC_FTRACE
 	select SET_FS
+	select TRACE_IRQFLAGS_SUPPORT
 	help
 	  Andes(nds32) Linux support.
 
@@ -64,9 +65,6 @@ config GENERIC_LOCKBREAK
 	def_bool y
 	depends on PREEMPTION
 
-config TRACE_IRQFLAGS_SUPPORT
-	def_bool y
-
 config STACKTRACE_SUPPORT
 	def_bool y
 
diff --git a/arch/nios2/Kconfig b/arch/nios2/Kconfig
index c24955c81c92..eabdc41f67f6 100644
--- a/arch/nios2/Kconfig
+++ b/arch/nios2/Kconfig
@@ -43,9 +43,6 @@ config NO_IOPORT_MAP
 config FPU
 	def_bool n
 
-config TRACE_IRQFLAGS_SUPPORT
-	def_bool n
-
 menu "Kernel features"
 
 source "kernel/Kconfig.hz"
diff --git a/arch/openrisc/Kconfig b/arch/openrisc/Kconfig
index 591acc5990dc..ebc5e7eafc5c 100644
--- a/arch/openrisc/Kconfig
+++ b/arch/openrisc/Kconfig
@@ -39,6 +39,7 @@ config OPENRISC
 	select GENERIC_IRQ_MULTI_HANDLER
 	select MMU_GATHER_NO_RANGE if MMU
 	select SET_FS
+	select TRACE_IRQFLAGS_SUPPORT
 
 config CPU_BIG_ENDIAN
 	def_bool y
@@ -52,9 +53,6 @@ config GENERIC_HWEIGHT
 config NO_IOPORT_MAP
 	def_bool y
 
-config TRACE_IRQFLAGS_SUPPORT
-	def_bool y
-
 # For now, use generic checksum functions
 #These can be reimplemented in assembly later if so inclined
 config GENERIC_CSUM
diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index bde9907bc5b2..57a0d0896ef6 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -67,6 +67,7 @@ config PARISC
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS
 	select HAVE_SOFTIRQ_ON_OWN_STACK if IRQSTACKS
 	select SET_FS
+	select TRACE_IRQFLAGS_SUPPORT
 
 	help
 	  The PA-RISC microprocessor is designed by Hewlett-Packard and used
diff --git a/arch/parisc/Kconfig.debug b/arch/parisc/Kconfig.debug
index 1478ded0e247..f66554cd5c45 100644
--- a/arch/parisc/Kconfig.debug
+++ b/arch/parisc/Kconfig.debug
@@ -1,4 +1 @@
 # SPDX-License-Identifier: GPL-2.0
-
-config TRACE_IRQFLAGS_SUPPORT
-	def_bool y
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index d01e3401581d..76a28452c042 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -94,10 +94,6 @@ config STACKTRACE_SUPPORT
 	bool
 	default y
 
-config TRACE_IRQFLAGS_SUPPORT
-	bool
-	default y
-
 config LOCKDEP_SUPPORT
 	bool
 	default y
@@ -271,6 +267,7 @@ config PPC
 	select STRICT_KERNEL_RWX if STRICT_MODULE_RWX
 	select SYSCTL_EXCEPTION_TRACE
 	select THREAD_INFO_IN_TASK
+	select TRACE_IRQFLAGS_SUPPORT
 	select VIRT_TO_BUS			if !PPC64
 	#
 	# Please keep this list sorted alphabetically.
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 8fcceb8eda07..15f012b9c6d7 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -109,6 +109,7 @@ config RISCV
 	select SPARSE_IRQ
 	select SYSCTL_EXCEPTION_TRACE
 	select THREAD_INFO_IN_TASK
+	select TRACE_IRQFLAGS_SUPPORT
 	select UACCESS_MEMCPY if !MMU
 	select ZONE_DMA32 if 64BIT
 
@@ -178,9 +179,6 @@ config ARCH_SUPPORTS_UPROBES
 config STACKTRACE_SUPPORT
 	def_bool y
 
-config TRACE_IRQFLAGS_SUPPORT
-	def_bool y
-
 config GENERIC_BUG
 	def_bool y
 	depends on BUG
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index a0e2130f0100..8bce206e93a3 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -207,6 +207,7 @@ config S390
 	select SWIOTLB
 	select SYSCTL_EXCEPTION_TRACE
 	select THREAD_INFO_IN_TASK
+	select TRACE_IRQFLAGS_SUPPORT
 	select TTY
 	select VIRT_CPU_ACCOUNTING
 	select ZONE_DMA
diff --git a/arch/s390/Kconfig.debug b/arch/s390/Kconfig.debug
index 9ea6e61d5858..e94a2a7f6bf4 100644
--- a/arch/s390/Kconfig.debug
+++ b/arch/s390/Kconfig.debug
@@ -1,8 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
-config TRACE_IRQFLAGS_SUPPORT
-	def_bool y
-
 config EARLY_PRINTK
 	def_bool y
 
diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 45a0549421cd..8efeffcdf4cf 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -72,6 +72,7 @@ config SUPERH
 	select RTC_LIB
 	select SET_FS
 	select SPARSE_IRQ
+	select TRACE_IRQFLAGS_SUPPORT
 	help
 	  The SuperH is a RISC processor targeted for use in embedded systems
 	  and consumer electronics; it was also used in the Sega Dreamcast
diff --git a/arch/sh/Kconfig.debug b/arch/sh/Kconfig.debug
index 28a43d63bde1..958f790273ab 100644
--- a/arch/sh/Kconfig.debug
+++ b/arch/sh/Kconfig.debug
@@ -1,8 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
-config TRACE_IRQFLAGS_SUPPORT
-	def_bool y
-
 config SH_STANDARD_BIOS
 	bool "Use LinuxSH standard BIOS"
 	help
diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index c5fa7932b550..fb8bdd40c72a 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -50,6 +50,7 @@ config SPARC
 	select NEED_DMA_MAP_STATE
 	select NEED_SG_DMA_LENGTH
 	select SET_FS
+	select TRACE_IRQFLAGS_SUPPORT
 
 config SPARC32
 	def_bool !64BIT
diff --git a/arch/sparc/Kconfig.debug b/arch/sparc/Kconfig.debug
index 50a918d496c8..6b2bec1888b3 100644
--- a/arch/sparc/Kconfig.debug
+++ b/arch/sparc/Kconfig.debug
@@ -1,9 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
-config TRACE_IRQFLAGS_SUPPORT
-	bool
-	default y
-
 config DEBUG_DCFLUSH
 	bool "D-cache flush debugging"
 	depends on SPARC64 && DEBUG_KERNEL
diff --git a/arch/um/Kconfig b/arch/um/Kconfig
index 0561b73cfd9a..0a699440c4c5 100644
--- a/arch/um/Kconfig
+++ b/arch/um/Kconfig
@@ -20,6 +20,7 @@ config UML
 	select GENERIC_CPU_DEVICES
 	select HAVE_GCC_PLUGINS
 	select SET_FS
+	select TRACE_IRQFLAGS_SUPPORT
 	select TTY # Needed for line.c
 
 config MMU
@@ -50,10 +51,6 @@ config ISA
 config SBUS
 	bool
 
-config TRACE_IRQFLAGS_SUPPORT
-	bool
-	default y
-
 config LOCKDEP_SUPPORT
 	bool
 	default y
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 49270655e827..171faee05035 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -261,6 +261,7 @@ config X86
 	select STACK_VALIDATION			if HAVE_STACK_VALIDATION && (HAVE_STATIC_CALL_INLINE || RETPOLINE)
 	select SYSCTL_EXCEPTION_TRACE
 	select THREAD_INFO_IN_TASK
+	select TRACE_IRQFLAGS_SUPPORT
 	select USER_STACKTRACE_SUPPORT
 	select VIRT_TO_BUS
 	select HAVE_ARCH_KCSAN			if X86_64
diff --git a/arch/x86/Kconfig.debug b/arch/x86/Kconfig.debug
index 80b57e7f4947..d3a6f74a94bd 100644
--- a/arch/x86/Kconfig.debug
+++ b/arch/x86/Kconfig.debug
@@ -1,8 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
-config TRACE_IRQFLAGS_SUPPORT
-	def_bool y
-
 config TRACE_IRQFLAGS_NMI_SUPPORT
 	def_bool y
 
diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index 2332b2156993..90aabb27f7d7 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -41,6 +41,7 @@ config XTENSA
 	select MODULES_USE_ELF_RELA
 	select PERF_USE_VMALLOC
 	select SET_FS
+	select TRACE_IRQFLAGS_SUPPORT
 	select VIRT_TO_BUS
 	help
 	  Xtensa processors are 32-bit RISC machines designed by Tensilica
@@ -72,9 +73,6 @@ config LOCKDEP_SUPPORT
 config STACKTRACE_SUPPORT
 	def_bool y
 
-config TRACE_IRQFLAGS_SUPPORT
-	def_bool y
-
 config MMU
 	def_bool n
 
-- 
2.27.0

