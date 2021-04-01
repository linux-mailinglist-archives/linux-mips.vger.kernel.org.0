Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3888351230
	for <lists+linux-mips@lfdr.de>; Thu,  1 Apr 2021 11:30:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233866AbhDAJ0M (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 1 Apr 2021 05:26:12 -0400
Received: from foss.arm.com ([217.140.110.172]:34688 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233504AbhDAJ0D (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 1 Apr 2021 05:26:03 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC6DF31B;
        Thu,  1 Apr 2021 02:26:02 -0700 (PDT)
Received: from p8cg001049571a15.arm.com (unknown [10.163.70.228])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9E3BB3F719;
        Thu,  1 Apr 2021 02:25:56 -0700 (PDT)
From:   Anshuman Khandual <anshuman.khandual@arm.com>
To:     linux-mm@kvack.org
Cc:     Anshuman Khandual <anshuman.khandual@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-xtensa@linux-xtensa.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V2 RESEND] mm/memtest: Add ARCH_USE_MEMTEST
Date:   Thu,  1 Apr 2021 14:56:33 +0530
Message-Id: <1617269193-22294-1-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

early_memtest() does not get called from all architectures. Hence enabling
CONFIG_MEMTEST and providing a valid memtest=[1..N] kernel command line
option might not trigger the memory pattern tests as would be expected in
normal circumstances. This situation is misleading.

The change here prevents the above mentioned problem after introducing a
new config option ARCH_USE_MEMTEST that should be subscribed on platforms
that call early_memtest(), in order to enable the config CONFIG_MEMTEST.
Conversely CONFIG_MEMTEST cannot be enabled on platforms where it would
not be tested anyway.

Cc: Russell King <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Chris Zankel <chris@zankel.net>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mips@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-xtensa@linux-xtensa.org
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Acked-by: Catalin Marinas <catalin.marinas@arm.com> (arm64)
Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This patch applies on v5.12-rc5 and has been tested on arm64 platform.
But it has been just build tested on all other platforms.

Changes in V2:

https://patchwork.kernel.org/project/linux-mm/patch/1614573126-7740-1-git-send-email-anshuman.khandual@arm.com/

- Added ARCH_USE_MEMTEST in the sorted alphabetical order on platforms

Changes in V1:

https://patchwork.kernel.org/project/linux-mm/patch/1612498242-31579-1-git-send-email-anshuman.khandual@arm.com/

 arch/arm/Kconfig     | 1 +
 arch/arm64/Kconfig   | 1 +
 arch/mips/Kconfig    | 1 +
 arch/powerpc/Kconfig | 1 +
 arch/x86/Kconfig     | 1 +
 arch/xtensa/Kconfig  | 1 +
 lib/Kconfig.debug    | 9 ++++++++-
 7 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 5da96f5df48f..49878877df88 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -33,6 +33,7 @@ config ARM
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF
+	select ARCH_USE_MEMTEST
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_IPC_PARSE_VERSION
 	select ARCH_WANT_LD_ORPHAN_WARN
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index e4e1b6550115..63c380587a77 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -67,6 +67,7 @@ config ARM64
 	select ARCH_KEEP_MEMBLOCK
 	select ARCH_USE_CMPXCHG_LOCKREF
 	select ARCH_USE_GNU_PROPERTY
+	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_USE_QUEUED_SPINLOCKS
 	select ARCH_USE_SYM_ANNOTATIONS
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index d89efba3d8a4..93a4f502f962 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -14,6 +14,7 @@ config MIPS
 	select ARCH_SUPPORTS_UPROBES
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF if 64BIT
+	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_USE_QUEUED_SPINLOCKS
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 386ae12d8523..3778ad17f56a 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -149,6 +149,7 @@ config PPC
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC	if PPC32 || PPC_BOOK3S_64
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF		if PPC64
+	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS		if PPC_QUEUED_SPINLOCKS
 	select ARCH_USE_QUEUED_SPINLOCKS	if PPC_QUEUED_SPINLOCKS
 	select ARCH_WANT_IPC_PARSE_VERSION
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 2792879d398e..2cb76fd5258e 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -100,6 +100,7 @@ config X86
 	select ARCH_SUPPORTS_LTO_CLANG		if X86_64
 	select ARCH_SUPPORTS_LTO_CLANG_THIN	if X86_64
 	select ARCH_USE_BUILTIN_BSWAP
+	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_USE_QUEUED_SPINLOCKS
 	select ARCH_USE_SYM_ANNOTATIONS
diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index 9ad6b7b82707..524413aabbc4 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -7,6 +7,7 @@ config XTENSA
 	select ARCH_HAS_SYNC_DMA_FOR_CPU if MMU
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE if MMU
 	select ARCH_HAS_DMA_SET_UNCACHED if MMU
+	select ARCH_USE_MEMTEST
 	select ARCH_USE_QUEUED_RWLOCKS
 	select ARCH_USE_QUEUED_SPINLOCKS
 	select ARCH_WANT_FRAME_POINTERS
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 2779c29d9981..a3fd69e6f6af 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2515,11 +2515,18 @@ config TEST_FPU
 
 endif # RUNTIME_TESTING_MENU
 
+config ARCH_USE_MEMTEST
+	bool
+	help
+	  An architecture should select this when it uses early_memtest()
+	  during boot process.
+
 config MEMTEST
 	bool "Memtest"
+	depends on ARCH_USE_MEMTEST
 	help
 	  This option adds a kernel parameter 'memtest', which allows memtest
-	  to be set.
+	  to be set and executed.
 	        memtest=0, mean disabled; -- default
 	        memtest=1, mean do 1 test pattern;
 	        ...
-- 
2.20.1

