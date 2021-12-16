Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B53F8476FBF
	for <lists+linux-mips@lfdr.de>; Thu, 16 Dec 2021 12:15:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236581AbhLPLOJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Dec 2021 06:14:09 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:29203 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbhLPLN7 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 16 Dec 2021 06:13:59 -0500
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.57])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4JF8ZR1lZmz8vph;
        Thu, 16 Dec 2021 19:11:43 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 16 Dec 2021 19:13:57 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 16 Dec 2021 19:13:56 +0800
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
To:     <dennis@kernel.org>, <akpm@linux-foundation.org>,
        <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>
CC:     <tj@kernel.org>, <gregkh@linuxfoundation.org>, <cl@linux.com>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <tsbogend@alpha.franken.de>, <mpe@ellerman.id.au>,
        <benh@kernel.crashing.org>, <paulus@samba.org>,
        <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <davem@davemloft.net>,
        <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
        <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-ia64@vger.kernel.org>, <linux-mips@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
        <sparclinux@vger.kernel.org>, <x86@kernel.org>,
        <wangkefeng.wang@huawei.com>
Subject: [PATCH 1/4] mm: percpu: Generalize percpu related config
Date:   Thu, 16 Dec 2021 19:23:56 +0800
Message-ID: <20211216112359.103822-2-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20211216112359.103822-1-wangkefeng.wang@huawei.com>
References: <20211216112359.103822-1-wangkefeng.wang@huawei.com>
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

The HAVE_SETUP_PER_CPU_AREA/NEED_PER_CPU_EMBED_FIRST_CHUNK/
NEED_PER_CPU_PAGE_FIRST_CHUNK/USE_PERCPU_NUMA_NODE_ID configs,
which have duplicate definitions on platforms that subscribe it.

Move them into mm, drop these redundant definitions and instead
just select it on applicable platforms.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>	[arm64]
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/arm64/Kconfig   | 20 ++++----------------
 arch/ia64/Kconfig    |  9 ++-------
 arch/mips/Kconfig    | 10 ++--------
 arch/powerpc/Kconfig | 17 ++++-------------
 arch/riscv/Kconfig   | 10 ++--------
 arch/sparc/Kconfig   | 12 +++---------
 arch/x86/Kconfig     | 17 ++++-------------
 mm/Kconfig           | 12 ++++++++++++
 8 files changed, 33 insertions(+), 74 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index c4207cf9bb17..4ff73299f8a9 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1135,6 +1135,10 @@ config NUMA
 	select GENERIC_ARCH_NUMA
 	select ACPI_NUMA if ACPI
 	select OF_NUMA
+	select HAVE_SETUP_PER_CPU_AREA
+	select NEED_PER_CPU_EMBED_FIRST_CHUNK
+	select NEED_PER_CPU_PAGE_FIRST_CHUNK
+	select USE_PERCPU_NUMA_NODE_ID
 	help
 	  Enable NUMA (Non-Uniform Memory Access) support.
 
@@ -1151,22 +1155,6 @@ config NODES_SHIFT
 	  Specify the maximum number of NUMA Nodes available on the target
 	  system.  Increases memory reserved to accommodate various tables.
 
-config USE_PERCPU_NUMA_NODE_ID
-	def_bool y
-	depends on NUMA
-
-config HAVE_SETUP_PER_CPU_AREA
-	def_bool y
-	depends on NUMA
-
-config NEED_PER_CPU_EMBED_FIRST_CHUNK
-	def_bool y
-	depends on NUMA
-
-config NEED_PER_CPU_PAGE_FIRST_CHUNK
-	def_bool y
-	depends on NUMA
-
 source "kernel/Kconfig.hz"
 
 config ARCH_SPARSEMEM_ENABLE
diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
index 1e33666fa679..703952819e10 100644
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@ -32,6 +32,7 @@ config IA64
 	select HAVE_FTRACE_MCOUNT_RECORD
 	select HAVE_DYNAMIC_FTRACE if (!ITANIUM)
 	select HAVE_FUNCTION_TRACER
+	select HAVE_SETUP_PER_CPU_AREA
 	select TTY
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_VIRT_CPU_ACCOUNTING
@@ -88,9 +89,6 @@ config GENERIC_CALIBRATE_DELAY
 	bool
 	default y
 
-config HAVE_SETUP_PER_CPU_AREA
-	def_bool y
-
 config DMI
 	bool
 	default y
@@ -292,6 +290,7 @@ config NUMA
 	bool "NUMA support"
 	depends on !FLATMEM
 	select SMP
+	select USE_PERCPU_NUMA_NODE_ID
 	help
 	  Say Y to compile the kernel to support NUMA (Non-Uniform Memory
 	  Access).  This option is for configuring high-end multiprocessor
@@ -311,10 +310,6 @@ config HAVE_ARCH_NODEDATA_EXTENSION
 	def_bool y
 	depends on NUMA
 
-config USE_PERCPU_NUMA_NODE_ID
-	def_bool y
-	depends on NUMA
-
 config HAVE_MEMORYLESS_NODES
 	def_bool NUMA
 
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 0215dc1529e9..9e77659641a2 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2666,6 +2666,8 @@ config NUMA
 	bool "NUMA Support"
 	depends on SYS_SUPPORTS_NUMA
 	select SMP
+	select HAVE_SETUP_PER_CPU_AREA
+	select NEED_PER_CPU_EMBED_FIRST_CHUNK
 	help
 	  Say Y to compile the kernel to support NUMA (Non-Uniform Memory
 	  Access).  This option improves performance on systems with more
@@ -2676,14 +2678,6 @@ config NUMA
 config SYS_SUPPORTS_NUMA
 	bool
 
-config HAVE_SETUP_PER_CPU_AREA
-	def_bool y
-	depends on NUMA
-
-config NEED_PER_CPU_EMBED_FIRST_CHUNK
-	def_bool y
-	depends on NUMA
-
 config RELOCATABLE
 	bool "Relocatable kernel"
 	depends on SYS_SUPPORTS_RELOCATABLE
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index dea74d7717c0..8badd39854a0 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -55,15 +55,6 @@ config ARCH_MMAP_RND_COMPAT_BITS_MIN
 	default 9 if PPC_16K_PAGES	#  9 = 23 (8MB) - 14 (16K)
 	default 11			# 11 = 23 (8MB) - 12 (4K)
 
-config HAVE_SETUP_PER_CPU_AREA
-	def_bool PPC64
-
-config NEED_PER_CPU_EMBED_FIRST_CHUNK
-	def_bool y if PPC64
-
-config NEED_PER_CPU_PAGE_FIRST_CHUNK
-	def_bool y if PPC64
-
 config NR_IRQS
 	int "Number of virtual interrupt numbers"
 	range 32 1048576
@@ -240,6 +231,7 @@ config PPC
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE
 	select HAVE_RSEQ
+	select HAVE_SETUP_PER_CPU_AREA		if PPC64
 	select HAVE_SOFTIRQ_ON_OWN_STACK
 	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r2)
 	select HAVE_STACKPROTECTOR		if PPC64 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r13)
@@ -254,6 +246,8 @@ config PPC
 	select MMU_GATHER_RCU_TABLE_FREE
 	select MODULES_USE_ELF_RELA
 	select NEED_DMA_MAP_STATE		if PPC64 || NOT_COHERENT_CACHE
+	select NEED_PER_CPU_EMBED_FIRST_CHUNK	if PPC64
+	select NEED_PER_CPU_PAGE_FIRST_CHUNK	if PPC64
 	select NEED_SG_DMA_LENGTH
 	select OF
 	select OF_DMA_DEFAULT_COHERENT		if !NOT_COHERENT_CACHE
@@ -659,6 +653,7 @@ config NUMA
 	bool "NUMA Memory Allocation and Scheduler Support"
 	depends on PPC64 && SMP
 	default y if PPC_PSERIES || PPC_POWERNV
+	select USE_PERCPU_NUMA_NODE_ID
 	help
 	  Enable NUMA (Non-Uniform Memory Access) support.
 
@@ -672,10 +667,6 @@ config NODES_SHIFT
 	default "4"
 	depends on NUMA
 
-config USE_PERCPU_NUMA_NODE_ID
-	def_bool y
-	depends on NUMA
-
 config HAVE_MEMORYLESS_NODES
 	def_bool y
 	depends on NUMA
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 821252b65f89..bf66bcbc5a39 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -334,6 +334,8 @@ config NUMA
 	select GENERIC_ARCH_NUMA
 	select OF_NUMA
 	select ARCH_SUPPORTS_NUMA_BALANCING
+	select USE_PERCPU_NUMA_NODE_ID
+	select NEED_PER_CPU_EMBED_FIRST_CHUNK
 	help
 	  Enable NUMA (Non-Uniform Memory Access) support.
 
@@ -349,14 +351,6 @@ config NODES_SHIFT
 	  Specify the maximum number of NUMA Nodes available on the target
 	  system.  Increases memory reserved to accommodate various tables.
 
-config USE_PERCPU_NUMA_NODE_ID
-	def_bool y
-	depends on NUMA
-
-config NEED_PER_CPU_EMBED_FIRST_CHUNK
-	def_bool y
-	depends on NUMA
-
 config RISCV_ISA_C
 	bool "Emit compressed instructions when building Linux"
 	default y
diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index 66fc08646be5..1cab1b284f1a 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -97,6 +97,9 @@ config SPARC64
 	select PCI_DOMAINS if PCI
 	select ARCH_HAS_GIGANTIC_PAGE
 	select HAVE_SOFTIRQ_ON_OWN_STACK
+	select HAVE_SETUP_PER_CPU_AREA
+	select NEED_PER_CPU_EMBED_FIRST_CHUNK
+	select NEED_PER_CPU_PAGE_FIRST_CHUNK
 
 config ARCH_PROC_KCORE_TEXT
 	def_bool y
@@ -123,15 +126,6 @@ config AUDIT_ARCH
 	bool
 	default y
 
-config HAVE_SETUP_PER_CPU_AREA
-	def_bool y if SPARC64
-
-config NEED_PER_CPU_EMBED_FIRST_CHUNK
-	def_bool y if SPARC64
-
-config NEED_PER_CPU_PAGE_FIRST_CHUNK
-	def_bool y if SPARC64
-
 config MMU
 	bool
 	default y
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 7399327d1eff..ca120a1f5857 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -239,6 +239,7 @@ config X86
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE		if X86_64 && (UNWINDER_FRAME_POINTER || UNWINDER_ORC) && STACK_VALIDATION
 	select HAVE_FUNCTION_ARG_ACCESS_API
+	select HAVE_SETUP_PER_CPU_AREA
 	select HAVE_SOFTIRQ_ON_OWN_STACK
 	select HAVE_STACKPROTECTOR		if CC_HAS_SANE_STACKPROTECTOR
 	select HAVE_STACK_VALIDATION		if X86_64
@@ -252,6 +253,8 @@ config X86
 	select HAVE_GENERIC_VDSO
 	select HOTPLUG_SMT			if SMP
 	select IRQ_FORCED_THREADING
+	select NEED_PER_CPU_EMBED_FIRST_CHUNK
+	select NEED_PER_CPU_PAGE_FIRST_CHUNK
 	select NEED_SG_DMA_LENGTH
 	select PCI_DOMAINS			if PCI
 	select PCI_LOCKLESS_CONFIG		if PCI
@@ -331,15 +334,6 @@ config ARCH_HAS_CPU_RELAX
 config ARCH_HAS_FILTER_PGPROT
 	def_bool y
 
-config HAVE_SETUP_PER_CPU_AREA
-	def_bool y
-
-config NEED_PER_CPU_EMBED_FIRST_CHUNK
-	def_bool y
-
-config NEED_PER_CPU_PAGE_FIRST_CHUNK
-	def_bool y
-
 config ARCH_HIBERNATION_POSSIBLE
 	def_bool y
 
@@ -1557,6 +1551,7 @@ config NUMA
 	depends on SMP
 	depends on X86_64 || (X86_32 && HIGHMEM64G && X86_BIGSMP)
 	default y if X86_BIGSMP
+	select USE_PERCPU_NUMA_NODE_ID
 	help
 	  Enable NUMA (Non-Uniform Memory Access) support.
 
@@ -2430,10 +2425,6 @@ config ARCH_HAS_ADD_PAGES
 config ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
 	def_bool y
 
-config USE_PERCPU_NUMA_NODE_ID
-	def_bool y
-	depends on NUMA
-
 menu "Power management and ACPI options"
 
 config ARCH_HIBERNATION_HEADER
diff --git a/mm/Kconfig b/mm/Kconfig
index 28edafc820ad..6bc5d780c51b 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -432,6 +432,18 @@ config NEED_PER_CPU_KM
 	bool
 	default y
 
+config NEED_PER_CPU_EMBED_FIRST_CHUNK
+	bool
+
+config NEED_PER_CPU_PAGE_FIRST_CHUNK
+	bool
+
+config USE_PERCPU_NUMA_NODE_ID
+	bool
+
+config HAVE_SETUP_PER_CPU_AREA
+	bool
+
 config CLEANCACHE
 	bool "Enable cleancache driver to cache clean pages if tmem is present"
 	help
-- 
2.18.0.huawei.25

