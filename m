Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16FD214534F
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jan 2020 12:00:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728609AbgAVLAQ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Jan 2020 06:00:16 -0500
Received: from fd.dlink.ru ([178.170.168.18]:55464 "EHLO fd.dlink.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726191AbgAVLAQ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 22 Jan 2020 06:00:16 -0500
Received: by fd.dlink.ru (Postfix, from userid 5000)
        id 3456F1B217DC; Wed, 22 Jan 2020 14:00:12 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru 3456F1B217DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dlink.ru; s=mail;
        t=1579690812; bh=qLEPzs8U1PssaEz2uw9E/aiieQ+E7tcvMolWYw7FhMw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=LGG5NVFJu2zzNHMu2yzdNUWGlSsmwHAzaubUKTd5BaiWLp0isOkImYzT5eOCZ+KvD
         4frjdewKjcwprv54jOyyXlCg/T4DezSTWpwQeyZT8waoc77muAZPWeowW9lD15aAN9
         Y2gB/7MBXwiUdt/79x/ySk+NOOxCjjozkZ038wFM=
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.dlink.ru
X-Spam-Level: 
X-Spam-Status: No, score=-99.2 required=7.5 tests=BAYES_50,UPPERCASE_50_75,
        URIBL_BLOCKED,USER_IN_WHITELIST autolearn=disabled version=3.4.2
Received: from mail.rzn.dlink.ru (mail.rzn.dlink.ru [178.170.168.13])
        by fd.dlink.ru (Postfix) with ESMTP id E08AB1B21769;
        Wed, 22 Jan 2020 13:59:24 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru E08AB1B21769
Received: from mail.rzn.dlink.ru (localhost [127.0.0.1])
        by mail.rzn.dlink.ru (Postfix) with ESMTP id 89A6E1B217C5;
        Wed, 22 Jan 2020 13:59:23 +0300 (MSK)
Received: from localhost.localdomain (unknown [196.196.203.126])
        by mail.rzn.dlink.ru (Postfix) with ESMTPA;
        Wed, 22 Jan 2020 13:59:23 +0300 (MSK)
From:   Alexander Lobakin <alobakin@dlink.ru>
To:     Paul Burton <paulburton@kernel.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Alexander Lobakin <alobakin@dlink.ru>,
        Michal Simek <michal.simek@xilinx.com>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH mips-next 4/5] MIPS: sort MIPS and MIPS_GENERIC Kconfig selects alphabetically (again)
Date:   Wed, 22 Jan 2020 13:58:51 +0300
Message-Id: <20200122105852.8788-5-alobakin@dlink.ru>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122105852.8788-1-alobakin@dlink.ru>
References: <20200122105852.8788-1-alobakin@dlink.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Cycles "sort selects alphabetically -> add new options at the end or at
random place -> repeat" go on and on.
Please double-check when adding new options and make sure that they
don't break the existing order to prevent dumb commits like this one
from appearing.

Signed-off-by: Alexander Lobakin <alobakin@dlink.ru>
---
 arch/mips/Kconfig | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 8ff846ef2345..488ce71cce73 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -5,9 +5,11 @@ config MIPS
 	select ARCH_32BIT_OFF_T if !64BIT
 	select ARCH_BINFMT_ELF_STATE if MIPS_FP_SUPPORT
 	select ARCH_CLOCKSOURCE_DATA
+	select ARCH_HAS_FORTIFY_SOURCE
+	select ARCH_HAS_KCOV
+	select ARCH_HAS_PTE_SPECIAL if !(32BIT && CPU_HAS_RIXI)
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
-	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_SUPPORTS_UPROBES
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF if 64BIT
@@ -48,7 +50,6 @@ config MIPS
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if CPU_SUPPORTS_HUGEPAGES
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_CBPF_JIT if !64BIT && !CPU_MICROMIPS
-	select HAVE_EBPF_JIT if 64BIT && !CPU_MICROMIPS && TARGET_ISA_REV >= 2
 	select HAVE_CONTEXT_TRACKING
 	select HAVE_COPY_THREAD_TLS
 	select HAVE_C_RECORDMCOUNT
@@ -56,11 +57,14 @@ config MIPS
 	select HAVE_DEBUG_STACKOVERFLOW
 	select HAVE_DMA_CONTIGUOUS
 	select HAVE_DYNAMIC_FTRACE
+	select HAVE_EBPF_JIT if 64BIT && !CPU_MICROMIPS && TARGET_ISA_REV >= 2
 	select HAVE_EXIT_THREAD
 	select HAVE_FAST_GUP
 	select HAVE_FTRACE_MCOUNT_RECORD
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_TRACER
+	select HAVE_GCC_PLUGINS
+	select HAVE_GENERIC_VDSO
 	select HAVE_IDE
 	select HAVE_IOREMAP_PROT
 	select HAVE_IRQ_EXIT_ON_IRQ_STACK
@@ -79,18 +83,14 @@ config MIPS
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_VIRT_CPU_ACCOUNTING_GEN if 64BIT || !SMP
-	select HAVE_GENERIC_VDSO
 	select IRQ_FORCED_THREADING
 	select ISA if EISA
-	select MODULES_USE_ELF_RELA if MODULES && 64BIT
 	select MODULES_USE_ELF_REL if MODULES
+	select MODULES_USE_ELF_RELA if MODULES && 64BIT
 	select PERF_USE_VMALLOC
 	select RTC_LIB
 	select SYSCTL_EXCEPTION_TRACE
 	select VIRT_TO_BUS
-	select ARCH_HAS_PTE_SPECIAL if !(32BIT && CPU_HAS_RIXI)
-	select ARCH_HAS_KCOV
-	select HAVE_GCC_PLUGINS
 
 menu "Machine selection"
 
@@ -105,8 +105,8 @@ config MIPS_GENERIC
 	select CEVT_R4K
 	select CLKSRC_MIPS_GIC
 	select COMMON_CLK
-	select CPU_MIPSR2_IRQ_VI
 	select CPU_MIPSR2_IRQ_EI
+	select CPU_MIPSR2_IRQ_VI
 	select CSRC_R4K
 	select DMA_PERDEV_COHERENT
 	select HAVE_PCI
@@ -131,11 +131,12 @@ config MIPS_GENERIC
 	select SYS_SUPPORTS_HIGHMEM
 	select SYS_SUPPORTS_LITTLE_ENDIAN
 	select SYS_SUPPORTS_MICROMIPS
-	select SYS_SUPPORTS_MIPS_CPS
 	select SYS_SUPPORTS_MIPS16
+	select SYS_SUPPORTS_MIPS_CPS
 	select SYS_SUPPORTS_MULTITHREADING
 	select SYS_SUPPORTS_RELOCATABLE
 	select SYS_SUPPORTS_SMARTMIPS
+	select UHI_BOOT
 	select USB_EHCI_BIG_ENDIAN_DESC if CPU_BIG_ENDIAN
 	select USB_EHCI_BIG_ENDIAN_MMIO if CPU_BIG_ENDIAN
 	select USB_OHCI_BIG_ENDIAN_DESC if CPU_BIG_ENDIAN
@@ -143,7 +144,6 @@ config MIPS_GENERIC
 	select USB_UHCI_BIG_ENDIAN_DESC if CPU_BIG_ENDIAN
 	select USB_UHCI_BIG_ENDIAN_MMIO if CPU_BIG_ENDIAN
 	select USE_OF
-	select UHI_BOOT
 	help
 	  Select this to build a kernel which aims to support multiple boards,
 	  generally using a flattened device tree passed from the bootloader
-- 
2.25.0

