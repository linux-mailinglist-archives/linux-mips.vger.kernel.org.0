Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70ADEED1D0
	for <lists+linux-mips@lfdr.de>; Sun,  3 Nov 2019 06:19:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbfKCFTG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 3 Nov 2019 01:19:06 -0400
Received: from mail-pf1-f169.google.com ([209.85.210.169]:33523 "EHLO
        mail-pf1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbfKCFTG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 3 Nov 2019 01:19:06 -0400
Received: by mail-pf1-f169.google.com with SMTP id c184so9919565pfb.0
        for <linux-mips@vger.kernel.org>; Sat, 02 Nov 2019 22:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=nj4hOG+L/Kk6ro/1lZv1Zj/SYoikPSRyVkL0knXkzLI=;
        b=NJ5aT3JEmTEkDdlR9Au5VmJaeNzbO3YEjh8gLCUagkrhOyHZN6XHVuAHVW0L09mGq5
         AfhQYl83ap4kKpWeSf6XHVNFBzC27GYovpbafmEN6TgdAz3/i603QWKp9BmyrtEgH4b7
         BUKoFIiDB1Ev+M3m/1X0JfQeeoOcrMKPcALQxssXx/0jw7TuAO+RXL8iMZ9LHl/s/olO
         r5qDuaPTUJDpXRqWw0vCDXE8d60bzfncjqpTLIWFGmbC/EuUS50Dj5a1GqfuoeC47pAs
         LUrr9QyftO2F4beqdkBCUnu0uRT84eYOvVJOeENHIF6XZouhiLcqHMUJ2MQHJKExiylO
         KLpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=nj4hOG+L/Kk6ro/1lZv1Zj/SYoikPSRyVkL0knXkzLI=;
        b=M60hWjZDKu1w7aVFdVeWBsIjdP9dN9y2GkqS7OOF5XGOQ4ksDYyZs9ZmY/yFm+NK+6
         QC0r7EKe7Ji02f12QcZb+ovQ+Yc92Ko7XEkfPvRJB8i2TUdi/kCKcPAMR7i9gLqvCBwb
         qHyyoy7dqrLONmeTB3nxFq3XQ3WWpOi4GRY1CQhZVEF1GVHGk+U1ShPWKfY7+LP2KTcj
         hMkR42d7jq7RelEe5Uq2ObHCkCCkXO0/WS1B6F0OH6qpLCYmFsY1DUikhK/S0hn8BHkm
         +7BJL+wEfBGORgW9yJh+74sonpQDdidi/Ez0Cqenc5qQsEjpVpxXdymai00IQluzAYby
         O63A==
X-Gm-Message-State: APjAAAWSO6yxR2rse7JVQ5rhrP11BOrEl5Nb4JofHIkeG+dQCG4/m469
        45F1ig/5fewKM5jo3/0T89Q=
X-Google-Smtp-Source: APXvYqwgK2VTjBoGOvu0JnbBvl58FDQlG3XV/iDg7RErJ2aa6uH8JaIMbg/63IriCscxMcLfk2WTBw==
X-Received: by 2002:a63:1812:: with SMTP id y18mr21311731pgl.302.1572758345577;
        Sat, 02 Nov 2019 22:19:05 -0700 (PDT)
Received: from software.domain.org (li566-100.members.linode.com. [192.155.80.100])
        by smtp.gmail.com with ESMTPSA id v2sm11191426pgf.39.2019.11.02.22.18.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 02 Nov 2019 22:19:05 -0700 (PDT)
From:   Huacai Chen <chenhc@lemote.com>
To:     Ralf Baechle <ralf@linux-mips.org>, James Hogan <jhogan@kernel.org>
Cc:     Paul Burton <paul.burton@mips.com>, linux-mips@linux-mips.org,
        linux-mips@vger.kernel.org, Fuxin Zhang <zhangfx@lemote.com>,
        Zhangjin Wu <wuzhangjin@gmail.com>,
        Huacai Chen <chenhuacai@gmail.com>,
        Huacai Chen <chenhc@lemote.com>
Subject: [PATCH 3/3] MIPS: Loongson: Unify LOONGSON3/LOONGSON64 Kconfig usage
Date:   Sun,  3 Nov 2019 13:20:17 +0800
Message-Id: <1572758417-29265-3-git-send-email-chenhc@lemote.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1572758417-29265-1-git-send-email-chenhc@lemote.com>
References: <1572758417-29265-1-git-send-email-chenhc@lemote.com>
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
 arch/mips/Kconfig               | 39 +++++++++++++++++++++++----------------
 arch/mips/include/asm/hazards.h |  4 ++--
 arch/mips/loongson64/Kconfig    |  2 +-
 3 files changed, 26 insertions(+), 19 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index b578eae..13bd1d2 100644
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
@@ -454,7 +454,7 @@ config MACH_LOONGSON32
 	  Sciences (CAS).
 
 config MACH_LOONGSON64
-	bool "Loongson-2/3 GSx64 family of machines"
+	bool "Loongson 64-bit family of machines"
 	select ARCH_SPARSEMEM_ENABLE
 	select ARCH_MIGHT_HAVE_PC_PARPORT
 	select ARCH_MIGHT_HAVE_PC_SERIO
@@ -483,8 +483,12 @@ config MACH_LOONGSON64
 	select ZONE_DMA32
 	select NUMA
 	help
-	  This enables the support of Loongson-2/3 family of processors with
-	  GSx64 microarchitecture.
+	  This enables the support of Loongson-2/3 family of machines.
+
+	  Loongson-2 and Loongson-3 are 64-bit general-purpose processors with
+	  GS264/GS464/GS464E/GS464V microarchitecture (except old Loongson-2E
+	  and Loongson-2F which have been removed), developed by the Institute
+	  of Computing Technology (ICT), Chinese Academy of Sciences (CAS).
 
 config MACH_PISTACHIO
 	bool "IMG Pistachio SoC based boards"
@@ -1425,7 +1429,7 @@ choice
 	default CPU_R4X00
 
 config CPU_LOONGSON64
-	bool "Loongson GSx64 CPU"
+	bool "Loongson 64-bit CPU"
 	depends on SYS_HAS_CPU_LOONGSON64
 	select ARCH_HAS_PHYS_TO_DMA
 	select CPU_SUPPORTS_64BIT_KERNEL
@@ -1441,17 +1445,20 @@ config CPU_LOONGSON64
 	select GPIOLIB
 	select SWIOTLB
 	help
-		The Loongson GSx64 series of processor cores implements the
-		MIPS64R2 instruction set with many extensions.
+		The Loongson GSx64(GS264/GS464/GS464E/GS464V) series of processor
+		cores implements the MIPS64R2 instruction set with many extensions,
+		including most 64-bit Loongson-2 (2H, 2K) and Loongson-3 (3A1000,
+		3B1000, 3B1500, 3A2000, 3A3000 and 3A4000) processors. However, old
+		Loongson-2E and Loongson-2F have been removed now.
 
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
@@ -1460,17 +1467,17 @@ config LOONGSON64_ENHANCEMENT
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
@@ -1478,7 +1485,7 @@ config CPU_LOONGSON3_WORKAROUNDS
 	  If unsure, please say Y.
 
 config CPU_LOONGSON1B
-	bool "Loongson 1B"
+	bool "Loongson 1B CPU"
 	depends on SYS_HAS_CPU_LOONGSON1B
 	select CPU_LOONGSON32
 	select LEDS_GPIO_REGISTER
@@ -1488,7 +1495,7 @@ config CPU_LOONGSON1B
 	  instruction set.
 
 config CPU_LOONGSON1C
-	bool "Loongson 1C"
+	bool "Loongson 1C CPU"
 	depends on SYS_HAS_CPU_LOONGSON1C
 	select CPU_LOONGSON32
 	select LEDS_GPIO_REGISTER
diff --git a/arch/mips/include/asm/hazards.h b/arch/mips/include/asm/hazards.h
index dbe2a30..d1ec7ea 100644
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
@@ -159,7 +159,7 @@ do {									\
 
 #elif defined(CONFIG_MIPS_ALCHEMY) || defined(CONFIG_CPU_CAVIUM_OCTEON) || \
 	defined(CONFIG_CPU_R10000) || defined(CONFIG_CPU_R5500) || defined(CONFIG_CPU_XLR) || \
-	defined(CONFIG_LOONGSON64_ENHANCEMENT)
+	defined(CONFIG_LOONGSON3_ENHANCEMENT)
 
 /*
  * R10000 rocks - all hazards handled in hardware, so this becomes a nobrainer.
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

