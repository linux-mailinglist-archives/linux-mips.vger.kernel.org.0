Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 656193D952F
	for <lists+linux-mips@lfdr.de>; Wed, 28 Jul 2021 20:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbhG1SVe (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 28 Jul 2021 14:21:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbhG1SVd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 28 Jul 2021 14:21:33 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AADF1C061757;
        Wed, 28 Jul 2021 11:21:30 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id n11so2034249wmd.2;
        Wed, 28 Jul 2021 11:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=aF3/VHib9GfO0nFJBohIRSm4KR3E1di5VfkCUNhyYTc=;
        b=j+7JSdyL/y+5Tp4kgvBfv3a7O8SxDct7cjXFxt3kfO/nBdrjysT8zMYTtmjcjmICNe
         xXtbgscX5Z0OO2TGenxgzYhXqChAYsMPuE9fLcrY9TZtp3bbRqYTnkU3W1it9aR9oxTs
         /v02VoW84XyvkeNvrYtqh6CQGDoQDDz1s6G4NMTxlSbXIMfdT05h/dXKstyEPoePxH2I
         HeZwsjiPBjbjexDG8zIAI1QxlM/cASCcmgVGwALVa66j6CeDbILQqX+Phg4+t/OT6goC
         npeNIatPb4N8bnvQAhNzyfwiViindBb/BAgUbh2gX2h54t86yGRFpLKg6AUGjq2lr+K1
         hfyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=aF3/VHib9GfO0nFJBohIRSm4KR3E1di5VfkCUNhyYTc=;
        b=GeK+jEEZUFRqi8Cmq1NMwBHEGfMUfg964BKRXSeMECGXVEMdoFsWNWXz6d0kGAS7do
         C6pvuyxA588wwdaoVvCEGF5oJ867kY3FTBO2Afp4i9kdkCMQTTV060xXdBGI9vwqrsN0
         xyUdnXczN1enQoirPitxAxCVnHBRGLqAhUdVnx3YEJrScdgbKCF3aExy668Z+vl22HGb
         5x+lrJ1FWtHy3JEAHJUcgtQHQEi4bwVPrBJt7usHgB5wsYC7Ova0gIcrTo5Tuchu5Nl+
         HIUV+BLI+OSqVG89gcoZJdm1h2PjP2m0PHjJdliET/TL1jgTsapTwFv0kEGomH7OFuIc
         EhFQ==
X-Gm-Message-State: AOAM530YXPDgMdwoRPKNWyhwtc7rsOjpzNiK5Xi3YmKSPp5o+FI01EIS
        RpMU0gOyTDxULWbhuptRx+4=
X-Google-Smtp-Source: ABdhPJx0eEbkPeH6aJH3m0u5RZgt9e6APmNbopPFI39+3QwRNHGBoeSXptg7zSKawFDABm59R+KI5g==
X-Received: by 2002:a05:600c:2e4a:: with SMTP id q10mr10720693wmf.133.1627496489195;
        Wed, 28 Jul 2021 11:21:29 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2d7f:fa00:1d1c:996c:af83:88fd])
        by smtp.gmail.com with ESMTPSA id i5sm620880wrs.85.2021.07.28.11.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 11:21:28 -0700 (PDT)
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
To:     Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
        Randy Dunlap <rdunlap@infradead.org>
Cc:     x86@kernel.org, linux-alpha@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        uclinux-h8-devel@lists.sourceforge.jp, linux-ia64@vger.kernel.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-xtensa@linux-xtensa.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] arch: Kconfig: clean up obsolete use of HAVE_IDE
Date:   Wed, 28 Jul 2021 20:21:15 +0200
Message-Id: <20210728182115.4401-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The arch-specific Kconfig files use HAVE_IDE to indicate if IDE is
supported.

As IDE support and the HAVE_IDE config vanishes with commit b7fb14d3ac63
("ide: remove the legacy ide driver"), there is no need to mention
HAVE_IDE in all those arch-specific Kconfig files.

The issue was identified with ./scripts/checkkconfigsymbols.py.

Fixes: b7fb14d3ac63 ("ide: remove the legacy ide driver")
Suggested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 arch/alpha/Kconfig            | 1 -
 arch/arm/Kconfig              | 6 ------
 arch/arm/mach-davinci/Kconfig | 1 -
 arch/h8300/Kconfig.cpu        | 1 -
 arch/ia64/Kconfig             | 1 -
 arch/m68k/Kconfig             | 1 -
 arch/mips/Kconfig             | 1 -
 arch/parisc/Kconfig           | 1 -
 arch/powerpc/Kconfig          | 1 -
 arch/sh/Kconfig               | 1 -
 arch/sparc/Kconfig            | 1 -
 arch/x86/Kconfig              | 1 -
 arch/xtensa/Kconfig           | 1 -
 13 files changed, 18 deletions(-)

diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index 77d3280dc678..a6d4c2f744e3 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -14,7 +14,6 @@ config ALPHA
 	select PCI_SYSCALL if PCI
 	select HAVE_AOUT
 	select HAVE_ASM_MODVERSIONS
-	select HAVE_IDE
 	select HAVE_PCSPKR_PLATFORM
 	select HAVE_PERF_EVENTS
 	select NEED_DMA_MAP_STATE
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 82f908fa5676..2fb7012c3246 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -95,7 +95,6 @@ config ARM
 	select HAVE_FUNCTION_TRACER if !XIP_KERNEL
 	select HAVE_GCC_PLUGINS
 	select HAVE_HW_BREAKPOINT if PERF_EVENTS && (CPU_V6 || CPU_V6K || CPU_V7)
-	select HAVE_IDE if PCI || ISA || PCMCIA
 	select HAVE_IRQ_TIME_ACCOUNTING
 	select HAVE_KERNEL_GZIP
 	select HAVE_KERNEL_LZ4
@@ -361,7 +360,6 @@ config ARCH_FOOTBRIDGE
 	bool "FootBridge"
 	select CPU_SA110
 	select FOOTBRIDGE
-	select HAVE_IDE
 	select NEED_MACH_IO_H if !MMU
 	select NEED_MACH_MEMORY_H
 	help
@@ -430,7 +428,6 @@ config ARCH_PXA
 	select GENERIC_IRQ_MULTI_HANDLER
 	select GPIO_PXA
 	select GPIOLIB
-	select HAVE_IDE
 	select IRQ_DOMAIN
 	select PLAT_PXA
 	select SPARSE_IRQ
@@ -446,7 +443,6 @@ config ARCH_RPC
 	select ARM_HAS_SG_CHAIN
 	select CPU_SA110
 	select FIQ
-	select HAVE_IDE
 	select HAVE_PATA_PLATFORM
 	select ISA_DMA_API
 	select LEGACY_TIMER_TICK
@@ -469,7 +465,6 @@ config ARCH_SA1100
 	select CPU_SA1100
 	select GENERIC_IRQ_MULTI_HANDLER
 	select GPIOLIB
-	select HAVE_IDE
 	select IRQ_DOMAIN
 	select ISA
 	select NEED_MACH_MEMORY_H
@@ -505,7 +500,6 @@ config ARCH_OMAP1
 	select GENERIC_IRQ_CHIP
 	select GENERIC_IRQ_MULTI_HANDLER
 	select GPIOLIB
-	select HAVE_IDE
 	select HAVE_LEGACY_CLK
 	select IRQ_DOMAIN
 	select NEED_MACH_IO_H if PCCARD
diff --git a/arch/arm/mach-davinci/Kconfig b/arch/arm/mach-davinci/Kconfig
index de11030748d0..1d3aef84287d 100644
--- a/arch/arm/mach-davinci/Kconfig
+++ b/arch/arm/mach-davinci/Kconfig
@@ -9,7 +9,6 @@ menuconfig ARCH_DAVINCI
 	select PM_GENERIC_DOMAINS_OF if PM && OF
 	select REGMAP_MMIO
 	select RESET_CONTROLLER
-	select HAVE_IDE
 	select PINCTRL_SINGLE
 
 if ARCH_DAVINCI
diff --git a/arch/h8300/Kconfig.cpu b/arch/h8300/Kconfig.cpu
index 2b9cbaf41cd0..e4467d40107d 100644
--- a/arch/h8300/Kconfig.cpu
+++ b/arch/h8300/Kconfig.cpu
@@ -44,7 +44,6 @@ config H8300_H8MAX
 	bool "H8MAX"
 	select H83069
 	select RAMKERNEL
-	select HAVE_IDE
 	help
 	  H8MAX Evaluation Board Support
 	  More Information. (Japanese Only)
diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
index cf425c2c63af..4993c7ac7ff6 100644
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@ -25,7 +25,6 @@ config IA64
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_UNSTABLE_SCHED_CLOCK
 	select HAVE_EXIT_THREAD
-	select HAVE_IDE
 	select HAVE_KPROBES
 	select HAVE_KRETPROBES
 	select HAVE_FTRACE_MCOUNT_RECORD
diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 96989ad46f66..d632a1d576f9 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -23,7 +23,6 @@ config M68K
 	select HAVE_DEBUG_BUGVERBOSE
 	select HAVE_EFFICIENT_UNALIGNED_ACCESS if !CPU_HAS_NO_UNALIGNED
 	select HAVE_FUTEX_CMPXCHG if MMU && FUTEX
-	select HAVE_IDE
 	select HAVE_MOD_ARCH_SPECIFIC
 	select HAVE_UID16
 	select MMU_GATHER_NO_RANGE if MMU
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index cee6087cd686..6dfb27d531dd 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -71,7 +71,6 @@ config MIPS
 	select HAVE_FUNCTION_TRACER
 	select HAVE_GCC_PLUGINS
 	select HAVE_GENERIC_VDSO
-	select HAVE_IDE
 	select HAVE_IOREMAP_PROT
 	select HAVE_IRQ_EXIT_ON_IRQ_STACK
 	select HAVE_IRQ_TIME_ACCOUNTING
diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
index bde9907bc5b2..4f8c1fbf8f2f 100644
--- a/arch/parisc/Kconfig
+++ b/arch/parisc/Kconfig
@@ -3,7 +3,6 @@ config PARISC
 	def_bool y
 	select ARCH_32BIT_OFF_T if !64BIT
 	select ARCH_MIGHT_HAVE_PC_PARPORT
-	select HAVE_IDE
 	select HAVE_FUNCTION_TRACER
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_SYSCALL_TRACEPOINTS
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 53db06ba4223..2e213ec6ec05 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -220,7 +220,6 @@ config PPC
 	select HAVE_HARDLOCKUP_DETECTOR_ARCH	if PPC_BOOK3S_64 && SMP
 	select HAVE_HARDLOCKUP_DETECTOR_PERF	if PERF_EVENTS && HAVE_PERF_EVENTS_NMI && !HAVE_HARDLOCKUP_DETECTOR_ARCH
 	select HAVE_HW_BREAKPOINT		if PERF_EVENTS && (PPC_BOOK3S || PPC_8xx)
-	select HAVE_IDE
 	select HAVE_IOREMAP_PROT
 	select HAVE_IRQ_EXIT_ON_IRQ_STACK
 	select HAVE_IRQ_TIME_ACCOUNTING
diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 45a0549421cd..b683b69a4556 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -39,7 +39,6 @@ config SUPERH
 	select HAVE_FUTEX_CMPXCHG if FUTEX
 	select HAVE_FTRACE_MCOUNT_RECORD
 	select HAVE_HW_BREAKPOINT
-	select HAVE_IDE if HAS_IOPORT_MAP
 	select HAVE_IOREMAP_PROT if MMU && !X2TLB
 	select HAVE_KERNEL_BZIP2
 	select HAVE_KERNEL_GZIP
diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index c5fa7932b550..f0c0f955e169 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -19,7 +19,6 @@ config SPARC
 	select OF
 	select OF_PROMTREE
 	select HAVE_ASM_MODVERSIONS
-	select HAVE_IDE
 	select HAVE_ARCH_KGDB if !SMP || SPARC64
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_ARCH_SECCOMP if SPARC64
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 89a286d5e4b9..ff0769cd4b31 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -202,7 +202,6 @@ config X86
 	select HAVE_FUNCTION_TRACER
 	select HAVE_GCC_PLUGINS
 	select HAVE_HW_BREAKPOINT
-	select HAVE_IDE
 	select HAVE_IOREMAP_PROT
 	select HAVE_IRQ_EXIT_ON_IRQ_STACK	if X86_64
 	select HAVE_IRQ_TIME_ACCOUNTING
diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
index 1bdb55c2d0c1..b843902ad9fd 100644
--- a/arch/xtensa/Kconfig
+++ b/arch/xtensa/Kconfig
@@ -327,7 +327,6 @@ config XTENSA_PLATFORM_ISS
 
 config XTENSA_PLATFORM_XT2000
 	bool "XT2000"
-	select HAVE_IDE
 	help
 	  XT2000 is the name of Tensilica's feature-rich emulation platform.
 	  This hardware is capable of running a full Linux distribution.
-- 
2.17.1

