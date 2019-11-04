Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D102ED8D5
	for <lists+linux-mips@lfdr.de>; Mon,  4 Nov 2019 07:09:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbfKDGJJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Nov 2019 01:09:09 -0500
Received: from mail-pl1-f169.google.com ([209.85.214.169]:38142 "EHLO
        mail-pl1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbfKDGJI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 4 Nov 2019 01:09:08 -0500
Received: by mail-pl1-f169.google.com with SMTP id w8so7126948plq.5
        for <linux-mips@vger.kernel.org>; Sun, 03 Nov 2019 22:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8YRWvP1kdCKbDFIRjreV+8yWAHSvrES6GHPCNYvEJqc=;
        b=D+j0KDQf0PQ9+5anAD7UaDW0ZFX/oFit4/are+nAAT4w8WAHH4gbH1hkQcLNAgVBom
         s2ZL0n4+yZMQY6Ke15w9/PalLfdcd1x9VqOiSH3Gm2Q72DGR9YXhf3gbYwNRm3qSWddl
         rJuCuu/LrsO27hYbd3sF8VI4QahaRNJelDrOl/8LRSOvbRbRC9Rr4PHUJF0nig8JCJID
         MxnSvJtj8HKQK07PGfE1IbOBktJ4gzwvFejWJkvYPwk2GDsQsPSWbJN9DLHoMJxNQ1cC
         jZLDCqr31GhJdRueuRU5lWkos7iHDgmiFKDWj8T20NjK6wEZq8LG51Zxj98B1DW88gKI
         qALg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=8YRWvP1kdCKbDFIRjreV+8yWAHSvrES6GHPCNYvEJqc=;
        b=WWuMXx74uLKiFgem0bIbwuGXavQYGkTSUmk7cnH9V0UlFjaqcRrVdXPnMVVPAuJMnR
         r5YHIycYoHHbz90JhQlkkO8mahw8rmJouql/S7jDFPPsQkHsJqasEX5Hrqmmo0GyNYCT
         6/3jmxR9JGem/LRAYTpu1D+6lvqaKKyvJz4H/3ChBsUB2kybQqguDH4HShNOs2Dr6nLE
         XL1vSOERAgv6/Xwxmno8YkkehEA5MS1ygHd/sT6nXNfj4vxZ1ZCBBJr3VqlddhNalZeN
         YXclDMkHLlGEf+PVSDwGqhagrv1H4T69HoDGLOAXVGy926ikeGQK3adqGegpizgriciB
         yPNA==
X-Gm-Message-State: APjAAAV7hJXT+ccYpb4CDPu5AKr0AbyQjjbFTBneCcx6kV7exVGAMLk+
        mbMqKlgjgI34HdjbXkdPLNY=
X-Google-Smtp-Source: APXvYqyAcye0RRv5XzIJtqg/V5+dXSQWuJtz+ldRocTjz5hIuAvdALE2adt7BYnAKu8mwp+Dlu6rSw==
X-Received: by 2002:a17:902:6184:: with SMTP id u4mr25722558plj.85.1572847747941;
        Sun, 03 Nov 2019 22:09:07 -0800 (PST)
Received: from software.domain.org (li566-100.members.linode.com. [192.155.80.100])
        by smtp.gmail.com with ESMTPSA id w6sm14165963pfw.84.2019.11.03.22.08.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 03 Nov 2019 22:09:07 -0800 (PST)
From:   Huacai Chen <chenhc@lemote.com>
To:     Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>
Cc:     Paul Burton <paul.burton@mips.com>,
        Paul Burton <paulburton@kernel.org>, linux-mips@linux-mips.org,
        linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH V2 2/2] MIPS: Loongson: Unify LOONGSON3/LOONGSON64 Kconfig usage
Date:   Mon,  4 Nov 2019 14:11:21 +0800
Message-Id: <1572847881-21712-2-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1572847881-21712-1-git-send-email-chenhc@lemote.com>
References: <1572847881-21712-1-git-send-email-chenhc@lemote.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There are mixed LOONGSON3/LOONGSON64 usages in recently changes, let's
establish some rules:

1, In Kconfig symbols, we only use CPU_LOONGSON64, MACH_LOONGSON64 and
SYS_HAS_CPU_LOONGSON64, all other derived symbols use "LOONGSON3" since
they all not widely-used symbols and sometimes not suitable for all
64-bit Loongson processors. E.g., we use symbols LOONGSON3_ENHANCEMENT,
CPU_LOONGSON3_WORKAROUNDS, etc.

2, Hide GSx64/GSx64E in Kconfig title since it is not useful for
general users. However, in the full description we use a more detailed
manner. E.g., GS264/GS464/GS464E/GS464V.

All Kconfig titles and descriptions of Loongson processors and machines
have also been updated in this patch for consistency.

Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 arch/mips/Kconfig               | 35 +++++++++++++++++++++--------------
 arch/mips/include/asm/hazards.h |  4 ++--
 arch/mips/loongson64/Kconfig    |  2 +-
 3 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 02b869d..7831111 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -444,7 +444,7 @@ config LASAT
 	select SYS_SUPPORTS_LITTLE_ENDIAN
 
 config MACH_LOONGSON32
-	bool "Loongson-1 family of machines"
+	bool "Loongson 32-bit family of machines"
 	select SYS_SUPPORTS_ZBOOT
 	help
 	  This enables support for the Loongson-1 family of machines.
@@ -460,7 +460,7 @@ config MACH_LOONGSON2EF
 	  This enables the support of early Loongson-2E/F family of machines.
 
 config MACH_LOONGSON64
-	bool "Loongson-2/3 GSx64 family of machines"
+	bool "Loongson 64-bit family of machines"
 	select ARCH_SPARSEMEM_ENABLE
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_MIGHT_HAVE_PC_SERIO
@@ -489,8 +489,12 @@ config MACH_LOONGSON64
 	select ZONE_DMA32
 	select NUMA
 	help
-	  This enables the support of Loongson-2/3 family of processors with
-	  GSx64 microarchitecture.
+	  This enables the support of Loongson-2/3 family of machines.
+
+	  Loongson-2 and Loongson-3 are 64-bit general-purpose processors with
+	  GS264/GS464/GS464E/GS464V microarchitecture (except old Loongson-2E
+	  and Loongson-2F which will be removed), developed by the Institute
+	  of Computing Technology (ICT), Chinese Academy of Sciences (CAS).
 
 config MACH_PISTACHIO
 	bool "IMG Pistachio SoC based boards"
@@ -1432,7 +1436,7 @@ choice
 	default CPU_R4X00
 
 config CPU_LOONGSON64
-	bool "Loongson GSx64 CPU"
+	bool "Loongson 64-bit CPU"
 	depends on SYS_HAS_CPU_LOONGSON64
 	select ARCH_HAS_PHYS_TO_DMA
 	select CPU_SUPPORTS_64BIT_KERNEL
@@ -1448,17 +1452,20 @@ config CPU_LOONGSON64
 	select GPIOLIB
 	select SWIOTLB
 	help
-		The Loongson GSx64 series of processor cores implements the
-		MIPS64R2 instruction set with many extensions.
+		The Loongson GSx64(GS264/GS464/GS464E/GS464V) series of processor
+		cores implements the MIPS64R2 instruction set with many extensions,
+		including most 64-bit Loongson-2 (2H, 2K) and Loongson-3 (3A1000,
+		3B1000, 3B1500, 3A2000, 3A3000 and 3A4000) processors. However, old
+		Loongson-2E/2F is not covered here and will be removed in future.
 
-config LOONGSON64_ENHANCEMENT
-	bool "New Loongson GSx64E CPU Enhancements"
+config LOONGSON3_ENHANCEMENT
+	bool "New Loongson-3 CPU Enhancements"
 	default n
 	select CPU_MIPSR2
 	select CPU_HAS_PREFETCH
 	depends on CPU_LOONGSON64
 	help
-	  New Loongson GSx64E cores (since Loongson-3A R2, as opposed to Loongson-3A
+	  New Loongson-3 cores (since Loongson-3A R2, as opposed to Loongson-3A
 	  R1, Loongson-3B R1 and Loongson-3B R2) has many enhancements, such as
 	  FTLB, L1-VCache, EI/DI/Wait/Prefetch instruction, DSP/DSPr2 ASE, User
 	  Local register, Read-Inhibit/Execute-Inhibit, SFB (Store Fill Buffer),
@@ -1467,17 +1474,17 @@ config LOONGSON64_ENHANCEMENT
 	  This option enable those enhancements which are not probed at run
 	  time. If you want a generic kernel to run on all Loongson 3 machines,
 	  please say 'N' here. If you want a high-performance kernel to run on
-	  new Loongson 3 machines only, please say 'Y' here.
+	  new Loongson-3 machines only, please say 'Y' here.
 
 config CPU_LOONGSON3_WORKAROUNDS
-	bool "Old Loongson 3 LLSC Workarounds"
+	bool "Old Loongson-3 LLSC Workarounds"
 	default y if SMP
 	depends on CPU_LOONGSON64
 	help
-	  Loongson 3 processors have the llsc issues which require workarounds.
+	  Loongson-3 processors have the llsc issues which require workarounds.
 	  Without workarounds the system may hang unexpectedly.
 
-	  Newer Loongson 3 will fix these issues and no workarounds are needed.
+	  Newer Loongson-3 will fix these issues and no workarounds are needed.
 	  The workarounds have no significant side effect on them but may
 	  decrease the performance of the system so this option should be
 	  disabled unless the kernel is intended to be run on old systems.
diff --git a/arch/mips/include/asm/hazards.h b/arch/mips/include/asm/hazards.h
index ea6a8c4..a4f48b0 100644
--- a/arch/mips/include/asm/hazards.h
+++ b/arch/mips/include/asm/hazards.h
@@ -23,7 +23,7 @@
  * TLB hazards
  */
 #if (defined(CONFIG_CPU_MIPSR2) || defined(CONFIG_CPU_MIPSR6)) && \
-	!defined(CONFIG_CPU_CAVIUM_OCTEON) && !defined(CONFIG_LOONGSON64_ENHANCEMENT)
+	!defined(CONFIG_CPU_CAVIUM_OCTEON) && !defined(CONFIG_LOONGSON3_ENHANCEMENT)
 
 /*
  * MIPSR2 defines ehb for hazard avoidance
@@ -158,7 +158,7 @@ do {									\
 } while (0)
 
 #elif defined(CONFIG_MIPS_ALCHEMY) || defined(CONFIG_CPU_CAVIUM_OCTEON) || \
-	defined(CONFIG_CPU_LOONGSON2EF) || defined(CONFIG_LOONGSON64_ENHANCEMENT) || \
+	defined(CONFIG_CPU_LOONGSON2EF) || defined(CONFIG_LOONGSON3_ENHANCEMENT) || \
 	defined(CONFIG_CPU_R10000) || defined(CONFIG_CPU_R5500) || defined(CONFIG_CPU_XLR)
 
 /*
diff --git a/arch/mips/loongson64/Kconfig b/arch/mips/loongson64/Kconfig
index b1aefd0..48b29c1 100644
--- a/arch/mips/loongson64/Kconfig
+++ b/arch/mips/loongson64/Kconfig
@@ -3,7 +3,7 @@ if MACH_LOONGSON64
 
 config RS780_HPET
 	bool "RS780/SBX00 HPET Timer"
-	depends on CONFIG_MACH_LOONGSON64
+	depends on MACH_LOONGSON64
 	select MIPS_EXTERNAL_TIMER
 	help
 	  This option enables the hpet timer of AMD RS780/SBX00.
-- 
2.7.0

