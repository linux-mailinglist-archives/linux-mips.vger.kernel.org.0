Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21E243930AF
	for <lists+linux-mips@lfdr.de>; Thu, 27 May 2021 16:21:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236285AbhE0OXC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 May 2021 10:23:02 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2375 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235487AbhE0OXC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 27 May 2021 10:23:02 -0400
Received: from dggeml759-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4FrVJq5ryMz66Bg;
        Thu, 27 May 2021 22:17:47 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggeml759-chm.china.huawei.com (10.1.199.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 27 May 2021 22:21:26 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 27 May 2021 22:21:19 +0800
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
To:     Andrew Morton <akpm@linux-foundation.org>
CC:     <linux-alpha@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-ia64@vger.kernel.org>, <linux-m68k@lists.linux-m68k.org>,
        <linux-mips@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
        <linux-riscv@lists.infradead.org>, <linux-s390@vger.kernel.org>,
        <sparclinux@vger.kernel.org>, <linux-mm@kvack.org>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Will Deacon" <will@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
        "David S. Miller" <davem@davemloft.net>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Richard Henderson <rth@twiddle.net>,
        Russell King <linux@armlinux.org.uk>
Subject: [PATCH] mm: generalize ZONE_[DMA|DMA32]
Date:   Thu, 27 May 2021 22:30:47 +0800
Message-ID: <20210527143047.123611-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

ZONE_[DMA|DMA32] configs have duplicate definitions on platforms
that subscribe them. Instead, just make them generic options which
can be selected on applicable platforms.

Also only x86/arm64 architectures could enable both ZONE_DMA and
ZONE_DMA32 if EXPERT, add ARCH_HAS_ZONE_DMA_SET to make dma zone
configurable and visible on the two architectures.

Cc: Andrew Morton <akpm@linux-foundation.org> 
Cc: Catalin Marinas <catalin.marinas@arm.com> 
Cc: Will Deacon <will@kernel.org> 
Cc: Geert Uytterhoeven <geert@linux-m68k.org> 
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de> 
Cc: "David S. Miller" <davem@davemloft.net> 
Cc: Ingo Molnar <mingo@redhat.com> 
Cc: Borislav Petkov <bp@alien8.de> 
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Richard Henderson <rth@twiddle.net> 
Cc: Russell King <linux@armlinux.org.uk>
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/alpha/Kconfig                     |  5 +----
 arch/arm/Kconfig                       |  3 ---
 arch/arm64/Kconfig                     |  9 +--------
 arch/ia64/Kconfig                      |  4 +---
 arch/m68k/Kconfig                      |  5 +----
 arch/microblaze/Kconfig                |  4 +---
 arch/mips/Kconfig                      |  7 -------
 arch/powerpc/Kconfig                   |  4 ----
 arch/powerpc/platforms/Kconfig.cputype |  1 +
 arch/riscv/Kconfig                     |  5 +----
 arch/s390/Kconfig                      |  4 +---
 arch/sparc/Kconfig                     |  5 +----
 arch/x86/Kconfig                       | 15 ++-------------
 mm/Kconfig                             | 11 +++++++++++
 14 files changed, 22 insertions(+), 60 deletions(-)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 5998106faa60..6a69a14c4825 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -40,6 +40,7 @@ config ALPHA
 	select MMU_GATHER_NO_RANGE
 	select SET_FS
 	select SPARSEMEM_EXTREME if SPARSEMEM
+	select ZONE_DMA
 	help
 	  The Alpha is a 64-bit general-purpose processor designed and
 	  marketed by the Digital Equipment Corporation of blessed memory,
@@ -65,10 +66,6 @@ config GENERIC_CALIBRATE_DELAY
 	bool
 	default y
 
-config ZONE_DMA
-	bool
-	default y
-
 config GENERIC_ISA_DMA
 	bool
 	default y
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 24804f11302d..000c3f80b58e 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -218,9 +218,6 @@ config GENERIC_CALIBRATE_DELAY
 config ARCH_MAY_HAVE_PC_FDC
 	bool
 
-config ZONE_DMA
-	bool
-
 config ARCH_SUPPORTS_UPROBES
 	def_bool y
 
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 9f1d8566bbf9..42794474f37f 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -42,6 +42,7 @@ config ARM64
 	select ARCH_HAS_SYSCALL_WRAPPER
 	select ARCH_HAS_TEARDOWN_DMA_OPS if IOMMU_SUPPORT
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
+	select ARCH_HAS_ZONE_DMA_SET if EXPERT
 	select ARCH_HAVE_ELF_PROT
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select ARCH_INLINE_READ_LOCK if !PREEMPTION
@@ -307,14 +308,6 @@ config GENERIC_CSUM
 config GENERIC_CALIBRATE_DELAY
 	def_bool y
 
-config ZONE_DMA
-	bool "Support DMA zone" if EXPERT
-	default y
-
-config ZONE_DMA32
-	bool "Support DMA32 zone" if EXPERT
-	default y
-
 config ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
 	def_bool y
 
diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
index 279252e3e0f7..fd8503a0088a 100644
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@ -60,6 +60,7 @@ config IA64
 	select NUMA if !FLATMEM
 	select PCI_MSI_ARCH_FALLBACKS if PCI_MSI
 	select SET_FS
+	select ZONE_DMA32
 	default y
 	help
 	  The Itanium Processor Family is Intel's 64-bit successor to
@@ -72,9 +73,6 @@ config 64BIT
 	select ATA_NONSTANDARD if ATA
 	default y
 
-config ZONE_DMA32
-	def_bool y
-
 config MMU
 	bool
 	default y
diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 372e4e69c43a..05a729c6ad7f 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -34,6 +34,7 @@ config M68K
 	select SET_FS
 	select UACCESS_MEMCPY if !MMU
 	select VIRT_TO_BUS
+	select ZONE_DMA
 
 config CPU_BIG_ENDIAN
 	def_bool y
@@ -62,10 +63,6 @@ config TIME_LOW_RES
 config NO_IOPORT_MAP
 	def_bool y
 
-config ZONE_DMA
-	bool
-	default y
-
 config HZ
 	int
 	default 1000 if CLEOPATRA
diff --git a/arch/microblaze/Kconfig b/arch/microblaze/Kconfig
index 0660f47012bc..14a67a42fcae 100644
--- a/arch/microblaze/Kconfig
+++ b/arch/microblaze/Kconfig
@@ -43,6 +43,7 @@ config MICROBLAZE
 	select MMU_GATHER_NO_RANGE
 	select SPARSE_IRQ
 	select SET_FS
+	select ZONE_DMA
 
 # Endianness selection
 choice
@@ -60,9 +61,6 @@ config CPU_LITTLE_ENDIAN
 
 endchoice
 
-config ZONE_DMA
-	def_bool y
-
 config ARCH_HAS_ILOG2_U32
 	def_bool n
 
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index ed51970c08e7..430d5324f1af 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -3277,13 +3277,6 @@ config I8253
 	select CLKSRC_I8253
 	select CLKEVT_I8253
 	select MIPS_EXTERNAL_TIMER
-
-config ZONE_DMA
-	bool
-
-config ZONE_DMA32
-	bool
-
 endmenu
 
 config TRAD_SIGNALS
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 088dd2afcfe4..0f78bb383a12 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -403,10 +403,6 @@ config PPC_ADV_DEBUG_DAC_RANGE
 config PPC_DAWR
 	bool
 
-config ZONE_DMA
-	bool
-	default y if PPC_BOOK3E_64
-
 config PGTABLE_LEVELS
 	int
 	default 2 if !PPC64
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index f998e655b570..7d271de8fcbd 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -111,6 +111,7 @@ config PPC_BOOK3E_64
 	select PPC_FPU # Make it a choice ?
 	select PPC_SMP_MUXED_IPI
 	select PPC_DOORBELL
+	select ZONE_DMA
 
 endchoice
 
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a8ad8eb76120..d29643dee126 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -103,6 +103,7 @@ config RISCV
 	select SYSCTL_EXCEPTION_TRACE
 	select THREAD_INFO_IN_TASK
 	select UACCESS_MEMCPY if !MMU
+	select ZONE_DMA32 if 64BIT
 
 config ARCH_MMAP_RND_BITS_MIN
 	default 18 if 64BIT
@@ -132,10 +133,6 @@ config MMU
 	  Select if you want MMU-based virtualised addressing space
 	  support by paged memory management. If unsure, say 'Y'.
 
-config ZONE_DMA32
-	bool
-	default y if 64BIT
-
 config VA_BITS
 	int
 	default 32 if 32BIT
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index b4c7c34069f8..daab9d56957a 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -2,9 +2,6 @@
 config MMU
 	def_bool y
 
-config ZONE_DMA
-	def_bool y
-
 config CPU_BIG_ENDIAN
 	def_bool y
 
@@ -210,6 +207,7 @@ config S390
 	select THREAD_INFO_IN_TASK
 	select TTY
 	select VIRT_CPU_ACCOUNTING
+	select ZONE_DMA
 	# Note: keep the above list sorted alphabetically
 
 config SCHED_OMIT_FRAME_POINTER
diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 164a5254c91c..39679664cc9a 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -59,6 +59,7 @@ config SPARC32
 	select CLZ_TAB
 	select HAVE_UID16
 	select OLD_SIGACTION
+	select ZONE_DMA
 
 config SPARC64
 	def_bool 64BIT
@@ -141,10 +142,6 @@ config HIGHMEM
 	default y if SPARC32
 	select KMAP_LOCAL
 
-config ZONE_DMA
-	bool
-	default y if SPARC32
-
 config GENERIC_ISA_DMA
 	bool
 	default y if SPARC32
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 0045e1b44190..11cf8a0d6800 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -33,6 +33,7 @@ config X86_64
 	select NEED_DMA_MAP_STATE
 	select SWIOTLB
 	select ARCH_HAS_ELFCORE_COMPAT
+	select ZONE_DMA32
 
 config FORCE_DYNAMIC_FTRACE
 	def_bool y
@@ -93,6 +94,7 @@ config X86
 	select ARCH_HAS_SYSCALL_WRAPPER
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
 	select ARCH_HAS_DEBUG_WX
+	select ARCH_HAS_ZONE_DMA_SET if EXPERT
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select ARCH_MIGHT_HAVE_ACPI_PDC		if ACPI
 	select ARCH_MIGHT_HAVE_PC_PARPORT
@@ -343,9 +345,6 @@ config ARCH_SUSPEND_POSSIBLE
 config ARCH_WANT_GENERAL_HUGETLB
 	def_bool y
 
-config ZONE_DMA32
-	def_bool y if X86_64
-
 config AUDIT_ARCH
 	def_bool y if X86_64
 
@@ -393,16 +392,6 @@ config CC_HAS_SANE_STACKPROTECTOR
 
 menu "Processor type and features"
 
-config ZONE_DMA
-	bool "DMA memory allocation support" if EXPERT
-	default y
-	help
-	  DMA memory allocation support allows devices with less than 32-bit
-	  addressing to allocate within the first 16MB of address space.
-	  Disable if no such devices will be used.
-
-	  If unsure, say Y.
-
 config SMP
 	bool "Symmetric multi-processing support"
 	help
diff --git a/mm/Kconfig b/mm/Kconfig
index 02d44e3420f5..68b0cbdc7968 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -789,6 +789,17 @@ config ARCH_HAS_CACHE_LINE_SIZE
 config ARCH_HAS_PTE_DEVMAP
 	bool
 
+config ARCH_HAS_ZONE_DMA_SET
+	bool
+
+config ZONE_DMA
+	bool "Support DMA zone" if ARCH_HAS_ZONE_DMA_SET
+	default y if ARM64
+
+config ZONE_DMA32
+	bool "Support DMA32 zone" if ARCH_HAS_ZONE_DMA_SET
+	default y if ARM64
+
 config ZONE_DEVICE
 	bool "Device memory (pmem, HMM, etc...) hotplug support"
 	depends on MEMORY_HOTPLUG
-- 
2.26.2

