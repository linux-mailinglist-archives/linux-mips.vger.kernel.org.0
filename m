Return-Path: <linux-mips+bounces-9831-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9C4B074AD
	for <lists+linux-mips@lfdr.de>; Wed, 16 Jul 2025 13:25:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29C793A952F
	for <lists+linux-mips@lfdr.de>; Wed, 16 Jul 2025 11:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F542F4304;
	Wed, 16 Jul 2025 11:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qDU8d7Jh"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B22A2F3C20;
	Wed, 16 Jul 2025 11:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752665139; cv=none; b=m7dzgkOf7Y6a9keyAJYaNsKv+alblT37cn2ngt8Gk268MJJIvksYxjCjfSVqk3sCz41ieCS1nLR8zQ++Zv5VMZdzaIcpIw8JScXGhCzOuAQdm/EhLcSZXIr2S6rgU3E0kuMWqf+/3FxP+8161zS8ijjvr0xG0kfC1+el9QBN3RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752665139; c=relaxed/simple;
	bh=YWYaUSaGd4q2igk0hu/kcGpr8SEMGC8z/fdyiLomzPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S5CBkS2/65X5ds69tCXvDe1vUsNciiuaUlzFtTiaIxGor+h/JbyWFbvp6yHs9xqHMSpHSyLrs2BNlprL5ZAeo1HKYn589Ah+144tWrLyHDywvU42+LHiDgq2JZC3yBxAu0Q4OfB+jSh+nCRQSlCpUT3zEY2ZHGt/iLxZSdDC0YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qDU8d7Jh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A9A1C19422;
	Wed, 16 Jul 2025 11:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752665139;
	bh=YWYaUSaGd4q2igk0hu/kcGpr8SEMGC8z/fdyiLomzPU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qDU8d7JhzuvBA4LVfw5SKRoDFXU0Kpd527pyREloqozXkjT+ZetfDwGAtPN75vDLZ
	 BavxlsHJOzFEK87v5tTKXnJXm+PvB18+NJmCm07D0/cbjEqpncaa22/YxT0ozDdYUP
	 W6nNqJHD95ABHHtx+5MiWnogqhbrrEJvOyt3r2CF1lbLyGk280rtMo3goRLeGjdudK
	 XQ3xJg+VMugKoyxmLBxP4m6WReJQZ6ZGl1eMM7dufDRu773Jt7aRBpt0yk9NLQAo8q
	 v9vv4TcS8jAsa7KOAdh49UJ1+ErCt8PjOCQGIl6aDFZb7bAoA3nSRftlk3K13s0IFR
	 ae7ha5zlJ583g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43CBFC83F1B;
	Wed, 16 Jul 2025 11:25:39 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Date: Wed, 16 Jul 2025 19:25:16 +0800
Subject: [PATCH v3 7/9] MIPS: loongson32: Switch to generic core
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250716-loongson1-arch-v3-7-d160974d696b@gmail.com>
References: <20250716-loongson1-arch-v3-0-d160974d696b@gmail.com>
In-Reply-To: <20250716-loongson1-arch-v3-0-d160974d696b@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752665136; l=38933;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=gNAz/KYzHiQiKYNtodSEuIlhmgcYIUgHx7J+xTZ+mOk=;
 b=uF3WJYxteRgB0dTxhGBUrn+HgBCZQoyl76FiFsYuZcSZrHKqKv+mT3ouAh5eXIA/pnjDZ8nXg
 E3sU/ynarqKBReeycDGM9Y7XLqy6J4T55V7cEd5JU6Qy6gT6HkGk9YE
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
Reply-To: keguang.zhang@gmail.com

From: Keguang Zhang <keguang.zhang@gmail.com>

The generic MIPS core is fully compatible with Loongson-1 SoCs,
so migrate Loongson-1 to it.

Main changes are:
 - Merge CPU_LOONGSON1B and CPU_LOONGSON1C into a unified CPU_LOONGSON32,
   as both are based on the GS232 core.
 - Consolidate LOONGSON1_LS1B and LOONGSON1_LS1C Kconfig options into
   MACH_LOONGSON32.
 - Enable MACH_GENERIC_CORE and remove the legacy custom implementation.
 - Remove all Loongson-1 platform devices and associated code,
   which are now obsolete due to Device Tree support.
 - Misc cleanup.

Partially based on earlier work by Jiaxun Yang.

Link: https://lore.kernel.org/all/20190411121915.8040-4-jiaxun.yang@flygoat.com/
Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
---
 MAINTAINERS                                       |   1 -
 arch/mips/Kconfig                                 |  64 ++---
 arch/mips/include/asm/cpu-type.h                  |   3 +-
 arch/mips/include/asm/mach-loongson32/irq.h       | 107 --------
 arch/mips/include/asm/mach-loongson32/loongson1.h |  50 ----
 arch/mips/include/asm/mach-loongson32/platform.h  |  23 --
 arch/mips/include/asm/mach-loongson32/regs-mux.h  | 124 ----------
 arch/mips/loongson32/Kconfig                      |  37 ---
 arch/mips/loongson32/Makefile                     |  17 --
 arch/mips/loongson32/Platform                     |   1 -
 arch/mips/loongson32/common/Makefile              |   6 -
 arch/mips/loongson32/common/irq.c                 | 191 ---------------
 arch/mips/loongson32/common/platform.c            | 285 ----------------------
 arch/mips/loongson32/common/prom.c                |  42 ----
 arch/mips/loongson32/common/setup.c               |  26 --
 arch/mips/loongson32/common/time.c                |  23 --
 arch/mips/loongson32/ls1b/Makefile                |   6 -
 arch/mips/loongson32/ls1b/board.c                 |  55 -----
 arch/mips/loongson32/ls1c/Makefile                |   6 -
 arch/mips/loongson32/ls1c/board.c                 |  23 --
 20 files changed, 33 insertions(+), 1057 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0089ebca31cf..d42a83656879 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16684,7 +16684,6 @@ L:	linux-mips@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/*/loongson,ls1*.yaml
 F:	arch/mips/boot/dts/loongson/loongson1*
-F:	arch/mips/include/asm/mach-loongson32/
 F:	arch/mips/loongson32/
 F:	drivers/*/*loongson1*
 F:	drivers/mtd/nand/raw/loongson1-nand-controller.c
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 1e48184ecf1e..643236ab5a01 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -481,6 +481,23 @@ config LANTIQ
 
 config MACH_LOONGSON32
 	bool "Loongson 32-bit family of machines"
+	select MACH_GENERIC_CORE
+	select USE_OF
+	select BUILTIN_DTB
+	select BOOT_ELF32
+	select CEVT_R4K
+	select CSRC_R4K
+	select COMMON_CLK
+	select DMA_NONCOHERENT
+	select GENERIC_IRQ_SHOW_LEVEL
+	select IRQ_MIPS_CPU
+	select LS1X_IRQ
+	select SYS_HAS_CPU_LOONGSON32
+	select SYS_HAS_EARLY_PRINTK
+	select USE_GENERIC_EARLY_PRINTK_8250
+	select SYS_SUPPORTS_32BIT_KERNEL
+	select SYS_SUPPORTS_LITTLE_ENDIAN
+	select SYS_SUPPORTS_HIGHMEM
 	select SYS_SUPPORTS_ZBOOT
 	help
 	  This enables support for the Loongson-1 family of machines.
@@ -1386,25 +1403,20 @@ config CPU_LOONGSON2F
 	  have a similar programming interface with FPGA northbridge used in
 	  Loongson2E.
 
-config CPU_LOONGSON1B
-	bool "Loongson 1B"
-	depends on SYS_HAS_CPU_LOONGSON1B
-	select CPU_LOONGSON32
-	select LEDS_GPIO_REGISTER
-	help
-	  The Loongson 1B is a 32-bit SoC, which implements the MIPS32
-	  Release 1 instruction set and part of the MIPS32 Release 2
-	  instruction set.
-
-config CPU_LOONGSON1C
-	bool "Loongson 1C"
-	depends on SYS_HAS_CPU_LOONGSON1C
-	select CPU_LOONGSON32
+config CPU_LOONGSON32
+	bool "Loongson 32-bit CPU"
+	depends on SYS_HAS_CPU_LOONGSON32
+	select CPU_MIPS32
+	select CPU_MIPSR2
+	select CPU_HAS_PREFETCH
+	select CPU_HAS_LOAD_STORE_LR
+	select CPU_SUPPORTS_32BIT_KERNEL
+	select CPU_SUPPORTS_HIGHMEM
+	select CPU_SUPPORTS_CPUFREQ
 	select LEDS_GPIO_REGISTER
 	help
-	  The Loongson 1C is a 32-bit SoC, which implements the MIPS32
-	  Release 1 instruction set and part of the MIPS32 Release 2
-	  instruction set.
+	  The Loongson GS232 microarchitecture implements the MIPS32 Release 1
+	  instruction set and part of the MIPS32 Release 2 instruction set.
 
 config CPU_MIPS32_R1
 	bool "MIPS32 Release 1"
@@ -1838,15 +1850,6 @@ config CPU_LOONGSON2EF
 	select CPU_SUPPORTS_HIGHMEM
 	select CPU_SUPPORTS_HUGEPAGES
 
-config CPU_LOONGSON32
-	bool
-	select CPU_MIPS32
-	select CPU_MIPSR2
-	select CPU_HAS_PREFETCH
-	select CPU_SUPPORTS_32BIT_KERNEL
-	select CPU_SUPPORTS_HIGHMEM
-	select CPU_SUPPORTS_CPUFREQ
-
 config CPU_BMIPS32_3300
 	select SMP_UP if SMP
 	bool
@@ -1884,10 +1887,7 @@ config SYS_HAS_CPU_LOONGSON2F
 	select CPU_SUPPORTS_CPUFREQ
 	select CPU_SUPPORTS_ADDRWINCFG if 64BIT
 
-config SYS_HAS_CPU_LOONGSON1B
-	bool
-
-config SYS_HAS_CPU_LOONGSON1C
+config SYS_HAS_CPU_LOONGSON32
 	bool
 
 config SYS_HAS_CPU_MIPS32_R1
@@ -2999,8 +2999,8 @@ choice
 	prompt "Kernel command line type"
 	depends on !CMDLINE_OVERRIDE
 	default MIPS_CMDLINE_FROM_DTB if USE_OF && !ATH79 && !MACH_INGENIC && \
-					 !MACH_LOONGSON64 && !MIPS_MALTA && \
-					 !CAVIUM_OCTEON_SOC
+					 !MACH_LOONGSON64 && !MACH_LOONGSON32 && \
+					 !MIPS_MALTA && !CAVIUM_OCTEON_SOC
 	default MIPS_CMDLINE_FROM_BOOTLOADER
 
 	config MIPS_CMDLINE_FROM_DTB
diff --git a/arch/mips/include/asm/cpu-type.h b/arch/mips/include/asm/cpu-type.h
index a4a66bd93748..fd37a44a2f19 100644
--- a/arch/mips/include/asm/cpu-type.h
+++ b/arch/mips/include/asm/cpu-type.h
@@ -24,8 +24,7 @@ static inline int __pure __get_cpu_type(const int cpu_type)
 	case CPU_LOONGSON64:
 #endif
 
-#if defined(CONFIG_SYS_HAS_CPU_LOONGSON1B) || \
-    defined(CONFIG_SYS_HAS_CPU_LOONGSON1C)
+#ifdef CONFIG_SYS_HAS_CPU_LOONGSON32
 	case CPU_LOONGSON32:
 #endif
 
diff --git a/arch/mips/include/asm/mach-loongson32/irq.h b/arch/mips/include/asm/mach-loongson32/irq.h
deleted file mode 100644
index 6115f025ba21..000000000000
--- a/arch/mips/include/asm/mach-loongson32/irq.h
+++ /dev/null
@@ -1,107 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Copyright (c) 2011 Zhang, Keguang <keguang.zhang@gmail.com>
- *
- * IRQ mappings for Loongson 1
- */
-
-#ifndef __ASM_MACH_LOONGSON32_IRQ_H
-#define __ASM_MACH_LOONGSON32_IRQ_H
-
-/*
- * CPU core Interrupt Numbers
- */
-#define MIPS_CPU_IRQ_BASE		0
-#define MIPS_CPU_IRQ(x)			(MIPS_CPU_IRQ_BASE + (x))
-
-#define SOFTINT0_IRQ			MIPS_CPU_IRQ(0)
-#define SOFTINT1_IRQ			MIPS_CPU_IRQ(1)
-#define INT0_IRQ			MIPS_CPU_IRQ(2)
-#define INT1_IRQ			MIPS_CPU_IRQ(3)
-#define INT2_IRQ			MIPS_CPU_IRQ(4)
-#define INT3_IRQ			MIPS_CPU_IRQ(5)
-#define INT4_IRQ			MIPS_CPU_IRQ(6)
-#define TIMER_IRQ			MIPS_CPU_IRQ(7)		/* cpu timer */
-
-#define MIPS_CPU_IRQS		(MIPS_CPU_IRQ(7) + 1 - MIPS_CPU_IRQ_BASE)
-
-/*
- * INT0~3 Interrupt Numbers
- */
-#define LS1X_IRQ_BASE			MIPS_CPU_IRQS
-#define LS1X_IRQ(n, x)			(LS1X_IRQ_BASE + (n << 5) + (x))
-
-#define LS1X_UART0_IRQ			LS1X_IRQ(0, 2)
-#if defined(CONFIG_LOONGSON1_LS1B)
-#define LS1X_UART1_IRQ			LS1X_IRQ(0, 3)
-#define LS1X_UART2_IRQ			LS1X_IRQ(0, 4)
-#define LS1X_UART3_IRQ			LS1X_IRQ(0, 5)
-#elif defined(CONFIG_LOONGSON1_LS1C)
-#define LS1X_UART1_IRQ			LS1X_IRQ(0, 4)
-#define LS1X_UART2_IRQ			LS1X_IRQ(0, 5)
-#endif
-#define LS1X_CAN0_IRQ			LS1X_IRQ(0, 6)
-#define LS1X_CAN1_IRQ			LS1X_IRQ(0, 7)
-#define LS1X_SPI0_IRQ			LS1X_IRQ(0, 8)
-#define LS1X_SPI1_IRQ			LS1X_IRQ(0, 9)
-#define LS1X_AC97_IRQ			LS1X_IRQ(0, 10)
-#define LS1X_DMA0_IRQ			LS1X_IRQ(0, 13)
-#define LS1X_DMA1_IRQ			LS1X_IRQ(0, 14)
-#define LS1X_DMA2_IRQ			LS1X_IRQ(0, 15)
-#if defined(CONFIG_LOONGSON1_LS1C)
-#define LS1X_NAND_IRQ			LS1X_IRQ(0, 16)
-#endif
-#define LS1X_PWM0_IRQ			LS1X_IRQ(0, 17)
-#define LS1X_PWM1_IRQ			LS1X_IRQ(0, 18)
-#define LS1X_PWM2_IRQ			LS1X_IRQ(0, 19)
-#define LS1X_PWM3_IRQ			LS1X_IRQ(0, 20)
-#define LS1X_RTC_INT0_IRQ		LS1X_IRQ(0, 21)
-#define LS1X_RTC_INT1_IRQ		LS1X_IRQ(0, 22)
-#define LS1X_RTC_INT2_IRQ		LS1X_IRQ(0, 23)
-#if defined(CONFIG_LOONGSON1_LS1B)
-#define LS1X_TOY_INT0_IRQ		LS1X_IRQ(0, 24)
-#define LS1X_TOY_INT1_IRQ		LS1X_IRQ(0, 25)
-#define LS1X_TOY_INT2_IRQ		LS1X_IRQ(0, 26)
-#define LS1X_RTC_TICK_IRQ		LS1X_IRQ(0, 27)
-#define LS1X_TOY_TICK_IRQ		LS1X_IRQ(0, 28)
-#define LS1X_UART4_IRQ			LS1X_IRQ(0, 29)
-#define LS1X_UART5_IRQ			LS1X_IRQ(0, 30)
-#elif defined(CONFIG_LOONGSON1_LS1C)
-#define LS1X_UART3_IRQ			LS1X_IRQ(0, 29)
-#define LS1X_ADC_IRQ			LS1X_IRQ(0, 30)
-#define LS1X_SDIO_IRQ			LS1X_IRQ(0, 31)
-#endif
-
-#define LS1X_EHCI_IRQ			LS1X_IRQ(1, 0)
-#define LS1X_OHCI_IRQ			LS1X_IRQ(1, 1)
-#if defined(CONFIG_LOONGSON1_LS1B)
-#define LS1X_GMAC0_IRQ			LS1X_IRQ(1, 2)
-#define LS1X_GMAC1_IRQ			LS1X_IRQ(1, 3)
-#elif defined(CONFIG_LOONGSON1_LS1C)
-#define LS1X_OTG_IRQ			LS1X_IRQ(1, 2)
-#define LS1X_GMAC0_IRQ			LS1X_IRQ(1, 3)
-#define LS1X_CAM_IRQ			LS1X_IRQ(1, 4)
-#define LS1X_UART4_IRQ			LS1X_IRQ(1, 5)
-#define LS1X_UART5_IRQ			LS1X_IRQ(1, 6)
-#define LS1X_UART6_IRQ			LS1X_IRQ(1, 7)
-#define LS1X_UART7_IRQ			LS1X_IRQ(1, 8)
-#define LS1X_UART8_IRQ			LS1X_IRQ(1, 9)
-#define LS1X_UART9_IRQ			LS1X_IRQ(1, 13)
-#define LS1X_UART10_IRQ			LS1X_IRQ(1, 14)
-#define LS1X_UART11_IRQ			LS1X_IRQ(1, 15)
-#define LS1X_I2C0_IRQ			LS1X_IRQ(1, 17)
-#define LS1X_I2C1_IRQ			LS1X_IRQ(1, 18)
-#define LS1X_I2C2_IRQ			LS1X_IRQ(1, 19)
-#endif
-
-#if defined(CONFIG_LOONGSON1_LS1B)
-#define INTN	4
-#elif defined(CONFIG_LOONGSON1_LS1C)
-#define INTN	5
-#endif
-
-#define LS1X_IRQS		(LS1X_IRQ(INTN, 31) + 1 - LS1X_IRQ_BASE)
-
-#define NR_IRQS			(MIPS_CPU_IRQS + LS1X_IRQS)
-
-#endif /* __ASM_MACH_LOONGSON32_IRQ_H */
diff --git a/arch/mips/include/asm/mach-loongson32/loongson1.h b/arch/mips/include/asm/mach-loongson32/loongson1.h
deleted file mode 100644
index 84f45461c832..000000000000
--- a/arch/mips/include/asm/mach-loongson32/loongson1.h
+++ /dev/null
@@ -1,50 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Copyright (c) 2011 Zhang, Keguang <keguang.zhang@gmail.com>
- *
- * Register mappings for Loongson 1
- */
-
-#ifndef __ASM_MACH_LOONGSON32_LOONGSON1_H
-#define __ASM_MACH_LOONGSON32_LOONGSON1_H
-
-#if defined(CONFIG_LOONGSON1_LS1B)
-#define DEFAULT_MEMSIZE			64	/* If no memsize provided */
-#elif defined(CONFIG_LOONGSON1_LS1C)
-#define DEFAULT_MEMSIZE			32
-#endif
-
-/* Loongson 1 Register Bases */
-#define LS1X_MUX_BASE			0x1fd00420
-#define LS1X_INTC_BASE			0x1fd01040
-#define LS1X_GPIO0_BASE			0x1fd010c0
-#define LS1X_GPIO1_BASE			0x1fd010c4
-#define LS1X_DMAC_BASE			0x1fd01160
-#define LS1X_CBUS_BASE			0x1fd011c0
-#define LS1X_EHCI_BASE			0x1fe00000
-#define LS1X_OHCI_BASE			0x1fe08000
-#define LS1X_GMAC0_BASE			0x1fe10000
-#define LS1X_GMAC1_BASE			0x1fe20000
-
-#define LS1X_UART0_BASE			0x1fe40000
-#define LS1X_UART1_BASE			0x1fe44000
-#define LS1X_UART2_BASE			0x1fe48000
-#define LS1X_UART3_BASE			0x1fe4c000
-#define LS1X_CAN0_BASE			0x1fe50000
-#define LS1X_CAN1_BASE			0x1fe54000
-#define LS1X_I2C0_BASE			0x1fe58000
-#define LS1X_I2C1_BASE			0x1fe68000
-#define LS1X_I2C2_BASE			0x1fe70000
-#define LS1X_PWM0_BASE			0x1fe5c000
-#define LS1X_PWM1_BASE			0x1fe5c010
-#define LS1X_PWM2_BASE			0x1fe5c020
-#define LS1X_PWM3_BASE			0x1fe5c030
-#define LS1X_WDT_BASE			0x1fe5c060
-#define LS1X_RTC_BASE			0x1fe64000
-#define LS1X_AC97_BASE			0x1fe74000
-#define LS1X_NAND_BASE			0x1fe78000
-#define LS1X_CLK_BASE			0x1fe78030
-
-#include <regs-mux.h>
-
-#endif /* __ASM_MACH_LOONGSON32_LOONGSON1_H */
diff --git a/arch/mips/include/asm/mach-loongson32/platform.h b/arch/mips/include/asm/mach-loongson32/platform.h
deleted file mode 100644
index f74292b13bc3..000000000000
--- a/arch/mips/include/asm/mach-loongson32/platform.h
+++ /dev/null
@@ -1,23 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Copyright (c) 2011 Zhang, Keguang <keguang.zhang@gmail.com>
- */
-
-#ifndef __ASM_MACH_LOONGSON32_PLATFORM_H
-#define __ASM_MACH_LOONGSON32_PLATFORM_H
-
-#include <linux/platform_device.h>
-
-extern struct platform_device ls1x_uart_pdev;
-extern struct platform_device ls1x_eth0_pdev;
-extern struct platform_device ls1x_eth1_pdev;
-extern struct platform_device ls1x_ehci_pdev;
-extern struct platform_device ls1x_gpio0_pdev;
-extern struct platform_device ls1x_gpio1_pdev;
-extern struct platform_device ls1x_rtc_pdev;
-extern struct platform_device ls1x_wdt_pdev;
-
-void __init ls1x_rtc_set_extclk(struct platform_device *pdev);
-void __init ls1x_serial_set_uartclk(struct platform_device *pdev);
-
-#endif /* __ASM_MACH_LOONGSON32_PLATFORM_H */
diff --git a/arch/mips/include/asm/mach-loongson32/regs-mux.h b/arch/mips/include/asm/mach-loongson32/regs-mux.h
deleted file mode 100644
index 95788a4f03a0..000000000000
--- a/arch/mips/include/asm/mach-loongson32/regs-mux.h
+++ /dev/null
@@ -1,124 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Copyright (c) 2014 Zhang, Keguang <keguang.zhang@gmail.com>
- *
- * Loongson 1 MUX Register Definitions.
- */
-
-#ifndef __ASM_MACH_LOONGSON32_REGS_MUX_H
-#define __ASM_MACH_LOONGSON32_REGS_MUX_H
-
-#define LS1X_MUX_REG(x) \
-		((void __iomem *)KSEG1ADDR(LS1X_MUX_BASE + (x)))
-
-#define LS1X_MUX_CTRL0			LS1X_MUX_REG(0x0)
-#define LS1X_MUX_CTRL1			LS1X_MUX_REG(0x4)
-
-#if defined(CONFIG_LOONGSON1_LS1B)
-/* MUX CTRL0 Register Bits */
-#define UART0_USE_PWM23			BIT(28)
-#define UART0_USE_PWM01			BIT(27)
-#define UART1_USE_LCD0_5_6_11		BIT(26)
-#define I2C2_USE_CAN1			BIT(25)
-#define I2C1_USE_CAN0			BIT(24)
-#define NAND3_USE_UART5			BIT(23)
-#define NAND3_USE_UART4			BIT(22)
-#define NAND3_USE_UART1_DAT		BIT(21)
-#define NAND3_USE_UART1_CTS		BIT(20)
-#define NAND3_USE_PWM23			BIT(19)
-#define NAND3_USE_PWM01			BIT(18)
-#define NAND2_USE_UART5			BIT(17)
-#define NAND2_USE_UART4			BIT(16)
-#define NAND2_USE_UART1_DAT		BIT(15)
-#define NAND2_USE_UART1_CTS		BIT(14)
-#define NAND2_USE_PWM23			BIT(13)
-#define NAND2_USE_PWM01			BIT(12)
-#define NAND1_USE_UART5			BIT(11)
-#define NAND1_USE_UART4			BIT(10)
-#define NAND1_USE_UART1_DAT		BIT(9)
-#define NAND1_USE_UART1_CTS		BIT(8)
-#define NAND1_USE_PWM23			BIT(7)
-#define NAND1_USE_PWM01			BIT(6)
-#define GMAC1_USE_UART1			BIT(4)
-#define GMAC1_USE_UART0			BIT(3)
-#define LCD_USE_UART0_DAT		BIT(2)
-#define LCD_USE_UART15			BIT(1)
-#define LCD_USE_UART0			BIT(0)
-
-/* MUX CTRL1 Register Bits */
-#define USB_RESET			BIT(31)
-#define SPI1_CS_USE_PWM01		BIT(24)
-#define SPI1_USE_CAN			BIT(23)
-#define DISABLE_DDR_CONFSPACE		BIT(20)
-#define DDR32TO16EN			BIT(16)
-#define GMAC1_SHUT			BIT(13)
-#define GMAC0_SHUT			BIT(12)
-#define USB_SHUT			BIT(11)
-#define UART1_3_USE_CAN1		BIT(5)
-#define UART1_2_USE_CAN0		BIT(4)
-#define GMAC1_USE_TXCLK			BIT(3)
-#define GMAC0_USE_TXCLK			BIT(2)
-#define GMAC1_USE_PWM23			BIT(1)
-#define GMAC0_USE_PWM01			BIT(0)
-
-#elif defined(CONFIG_LOONGSON1_LS1C)
-
-/* SHUT_CTRL Register Bits */
-#define UART_SPLIT			GENMASK(31, 30)
-#define OUTPUT_CLK			GENMASK(29, 26)
-#define ADC_SHUT			BIT(25)
-#define SDIO_SHUT			BIT(24)
-#define DMA2_SHUT			BIT(23)
-#define DMA1_SHUT			BIT(22)
-#define DMA0_SHUT			BIT(21)
-#define SPI1_SHUT			BIT(20)
-#define SPI0_SHUT			BIT(19)
-#define I2C2_SHUT			BIT(18)
-#define I2C1_SHUT			BIT(17)
-#define I2C0_SHUT			BIT(16)
-#define AC97_SHUT			BIT(15)
-#define I2S_SHUT			BIT(14)
-#define UART3_SHUT			BIT(13)
-#define UART2_SHUT			BIT(12)
-#define UART1_SHUT			BIT(11)
-#define UART0_SHUT			BIT(10)
-#define CAN1_SHUT			BIT(9)
-#define CAN0_SHUT			BIT(8)
-#define ECC_SHUT			BIT(7)
-#define GMAC_SHUT			BIT(6)
-#define USBHOST_SHUT			BIT(5)
-#define USBOTG_SHUT			BIT(4)
-#define SDRAM_SHUT			BIT(3)
-#define SRAM_SHUT			BIT(2)
-#define CAM_SHUT			BIT(1)
-#define LCD_SHUT			BIT(0)
-
-#define UART_SPLIT_SHIFT                        30
-#define OUTPUT_CLK_SHIFT                        26
-
-/* MISC_CTRL Register Bits */
-#define USBHOST_RSTN			BIT(31)
-#define PHY_INTF_SELI			GENMASK(30, 28)
-#define AC97_EN				BIT(25)
-#define SDIO_DMA_EN			GENMASK(24, 23)
-#define ADC_DMA_EN			BIT(22)
-#define SDIO_USE_SPI1			BIT(17)
-#define SDIO_USE_SPI0			BIT(16)
-#define SRAM_CTRL			GENMASK(15, 0)
-
-#define PHY_INTF_SELI_SHIFT                     28
-#define SDIO_DMA_EN_SHIFT                       23
-#define SRAM_CTRL_SHIFT				0
-
-#define LS1X_CBUS_REG(n, x) \
-		((void __iomem *)KSEG1ADDR(LS1X_CBUS_BASE + (n * 0x04) + (x)))
-
-#define LS1X_CBUS_FIRST(n)		LS1X_CBUS_REG(n, 0x00)
-#define LS1X_CBUS_SECOND(n)		LS1X_CBUS_REG(n, 0x10)
-#define LS1X_CBUS_THIRD(n)		LS1X_CBUS_REG(n, 0x20)
-#define LS1X_CBUS_FOURTHT(n)		LS1X_CBUS_REG(n, 0x30)
-#define LS1X_CBUS_FIFTHT(n)		LS1X_CBUS_REG(n, 0x40)
-
-#endif
-
-#endif /* __ASM_MACH_LOONGSON32_REGS_MUX_H */
diff --git a/arch/mips/loongson32/Kconfig b/arch/mips/loongson32/Kconfig
index 52e925309f15..461d518b0033 100644
--- a/arch/mips/loongson32/Kconfig
+++ b/arch/mips/loongson32/Kconfig
@@ -1,41 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-if MACH_LOONGSON32
-
-choice
-	prompt "Machine Type"
-
-config LOONGSON1_LS1B
-	bool "Loongson LS1B board"
-	select CEVT_R4K if !MIPS_EXTERNAL_TIMER
-	select CSRC_R4K if !MIPS_EXTERNAL_TIMER
-	select SYS_HAS_CPU_LOONGSON1B
-	select DMA_NONCOHERENT
-	select BOOT_ELF32
-	select IRQ_MIPS_CPU
-	select SYS_SUPPORTS_32BIT_KERNEL
-	select SYS_SUPPORTS_LITTLE_ENDIAN
-	select SYS_SUPPORTS_HIGHMEM
-	select SYS_HAS_EARLY_PRINTK
-	select USE_GENERIC_EARLY_PRINTK_8250
-	select COMMON_CLK
-
-config LOONGSON1_LS1C
-	bool "Loongson LS1C board"
-	select CEVT_R4K if !MIPS_EXTERNAL_TIMER
-	select CSRC_R4K if !MIPS_EXTERNAL_TIMER
-	select SYS_HAS_CPU_LOONGSON1C
-	select DMA_NONCOHERENT
-	select BOOT_ELF32
-	select IRQ_MIPS_CPU
-	select SYS_SUPPORTS_32BIT_KERNEL
-	select SYS_SUPPORTS_LITTLE_ENDIAN
-	select SYS_SUPPORTS_HIGHMEM
-	select SYS_HAS_EARLY_PRINTK
-	select USE_GENERIC_EARLY_PRINTK_8250
-	select COMMON_CLK
-endchoice
-
-endif # MACH_LOONGSON32
 
 config BUILTIN_DTB_NAME
 	string "Source file for built-in DTB"
diff --git a/arch/mips/loongson32/Makefile b/arch/mips/loongson32/Makefile
index ba10954b4b21..a4e40e534e6a 100644
--- a/arch/mips/loongson32/Makefile
+++ b/arch/mips/loongson32/Makefile
@@ -1,18 +1 @@
 # SPDX-License-Identifier: GPL-2.0-only
-#
-# Common code for all Loongson 1 based systems
-#
-
-obj-$(CONFIG_MACH_LOONGSON32) += common/
-
-#
-# Loongson LS1B board
-#
-
-obj-$(CONFIG_LOONGSON1_LS1B)  += ls1b/
-
-#
-# Loongson LS1C board
-#
-
-obj-$(CONFIG_LOONGSON1_LS1C)  += ls1c/
diff --git a/arch/mips/loongson32/Platform b/arch/mips/loongson32/Platform
index 3b9673e7a2fa..67fd07450488 100644
--- a/arch/mips/loongson32/Platform
+++ b/arch/mips/loongson32/Platform
@@ -1,3 +1,2 @@
 cflags-$(CONFIG_CPU_LOONGSON32)		+= -march=mips32r2 -Wa,--trap
-cflags-$(CONFIG_MACH_LOONGSON32)	+= -I$(srctree)/arch/mips/include/asm/mach-loongson32
 load-$(CONFIG_CPU_LOONGSON32)		+= 0xffffffff80200000
diff --git a/arch/mips/loongson32/common/Makefile b/arch/mips/loongson32/common/Makefile
deleted file mode 100644
index f3950d308187..000000000000
--- a/arch/mips/loongson32/common/Makefile
+++ /dev/null
@@ -1,6 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-#
-# Makefile for common code of loongson1 based machines.
-#
-
-obj-y	+= time.o irq.o platform.o prom.o setup.o
diff --git a/arch/mips/loongson32/common/irq.c b/arch/mips/loongson32/common/irq.c
deleted file mode 100644
index 9a50070f74f7..000000000000
--- a/arch/mips/loongson32/common/irq.c
+++ /dev/null
@@ -1,191 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (c) 2011 Zhang, Keguang <keguang.zhang@gmail.com>
- */
-
-#include <linux/interrupt.h>
-#include <linux/irq.h>
-#include <asm/irq_cpu.h>
-
-#include <loongson1.h>
-#include <irq.h>
-
-#define LS1X_INTC_REG(n, x) \
-		((void __iomem *)KSEG1ADDR(LS1X_INTC_BASE + (n * 0x18) + (x)))
-
-#define LS1X_INTC_INTISR(n)		LS1X_INTC_REG(n, 0x0)
-#define LS1X_INTC_INTIEN(n)		LS1X_INTC_REG(n, 0x4)
-#define LS1X_INTC_INTSET(n)		LS1X_INTC_REG(n, 0x8)
-#define LS1X_INTC_INTCLR(n)		LS1X_INTC_REG(n, 0xc)
-#define LS1X_INTC_INTPOL(n)		LS1X_INTC_REG(n, 0x10)
-#define LS1X_INTC_INTEDGE(n)		LS1X_INTC_REG(n, 0x14)
-
-static void ls1x_irq_ack(struct irq_data *d)
-{
-	unsigned int bit = (d->irq - LS1X_IRQ_BASE) & 0x1f;
-	unsigned int n = (d->irq - LS1X_IRQ_BASE) >> 5;
-
-	__raw_writel(__raw_readl(LS1X_INTC_INTCLR(n))
-			| (1 << bit), LS1X_INTC_INTCLR(n));
-}
-
-static void ls1x_irq_mask(struct irq_data *d)
-{
-	unsigned int bit = (d->irq - LS1X_IRQ_BASE) & 0x1f;
-	unsigned int n = (d->irq - LS1X_IRQ_BASE) >> 5;
-
-	__raw_writel(__raw_readl(LS1X_INTC_INTIEN(n))
-			& ~(1 << bit), LS1X_INTC_INTIEN(n));
-}
-
-static void ls1x_irq_mask_ack(struct irq_data *d)
-{
-	unsigned int bit = (d->irq - LS1X_IRQ_BASE) & 0x1f;
-	unsigned int n = (d->irq - LS1X_IRQ_BASE) >> 5;
-
-	__raw_writel(__raw_readl(LS1X_INTC_INTIEN(n))
-			& ~(1 << bit), LS1X_INTC_INTIEN(n));
-	__raw_writel(__raw_readl(LS1X_INTC_INTCLR(n))
-			| (1 << bit), LS1X_INTC_INTCLR(n));
-}
-
-static void ls1x_irq_unmask(struct irq_data *d)
-{
-	unsigned int bit = (d->irq - LS1X_IRQ_BASE) & 0x1f;
-	unsigned int n = (d->irq - LS1X_IRQ_BASE) >> 5;
-
-	__raw_writel(__raw_readl(LS1X_INTC_INTIEN(n))
-			| (1 << bit), LS1X_INTC_INTIEN(n));
-}
-
-static int ls1x_irq_settype(struct irq_data *d, unsigned int type)
-{
-	unsigned int bit = (d->irq - LS1X_IRQ_BASE) & 0x1f;
-	unsigned int n = (d->irq - LS1X_IRQ_BASE) >> 5;
-
-	switch (type) {
-	case IRQ_TYPE_LEVEL_HIGH:
-		__raw_writel(__raw_readl(LS1X_INTC_INTPOL(n))
-			| (1 << bit), LS1X_INTC_INTPOL(n));
-		__raw_writel(__raw_readl(LS1X_INTC_INTEDGE(n))
-			& ~(1 << bit), LS1X_INTC_INTEDGE(n));
-		break;
-	case IRQ_TYPE_LEVEL_LOW:
-		__raw_writel(__raw_readl(LS1X_INTC_INTPOL(n))
-			& ~(1 << bit), LS1X_INTC_INTPOL(n));
-		__raw_writel(__raw_readl(LS1X_INTC_INTEDGE(n))
-			& ~(1 << bit), LS1X_INTC_INTEDGE(n));
-		break;
-	case IRQ_TYPE_EDGE_RISING:
-		__raw_writel(__raw_readl(LS1X_INTC_INTPOL(n))
-			| (1 << bit), LS1X_INTC_INTPOL(n));
-		__raw_writel(__raw_readl(LS1X_INTC_INTEDGE(n))
-			| (1 << bit), LS1X_INTC_INTEDGE(n));
-		break;
-	case IRQ_TYPE_EDGE_FALLING:
-		__raw_writel(__raw_readl(LS1X_INTC_INTPOL(n))
-			& ~(1 << bit), LS1X_INTC_INTPOL(n));
-		__raw_writel(__raw_readl(LS1X_INTC_INTEDGE(n))
-			| (1 << bit), LS1X_INTC_INTEDGE(n));
-		break;
-	case IRQ_TYPE_EDGE_BOTH:
-		__raw_writel(__raw_readl(LS1X_INTC_INTPOL(n))
-			& ~(1 << bit), LS1X_INTC_INTPOL(n));
-		__raw_writel(__raw_readl(LS1X_INTC_INTEDGE(n))
-			| (1 << bit), LS1X_INTC_INTEDGE(n));
-		break;
-	case IRQ_TYPE_NONE:
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static struct irq_chip ls1x_irq_chip = {
-	.name		= "LS1X-INTC",
-	.irq_ack	= ls1x_irq_ack,
-	.irq_mask	= ls1x_irq_mask,
-	.irq_mask_ack	= ls1x_irq_mask_ack,
-	.irq_unmask	= ls1x_irq_unmask,
-	.irq_set_type   = ls1x_irq_settype,
-};
-
-static void ls1x_irq_dispatch(int n)
-{
-	u32 int_status, irq;
-
-	/* Get pending sources, masked by current enables */
-	int_status = __raw_readl(LS1X_INTC_INTISR(n)) &
-			__raw_readl(LS1X_INTC_INTIEN(n));
-
-	if (int_status) {
-		irq = LS1X_IRQ(n, __ffs(int_status));
-		do_IRQ(irq);
-	}
-}
-
-asmlinkage void plat_irq_dispatch(void)
-{
-	unsigned int pending;
-
-	pending = read_c0_cause() & read_c0_status() & ST0_IM;
-
-	if (pending & CAUSEF_IP7)
-		do_IRQ(TIMER_IRQ);
-	else if (pending & CAUSEF_IP2)
-		ls1x_irq_dispatch(0); /* INT0 */
-	else if (pending & CAUSEF_IP3)
-		ls1x_irq_dispatch(1); /* INT1 */
-	else if (pending & CAUSEF_IP4)
-		ls1x_irq_dispatch(2); /* INT2 */
-	else if (pending & CAUSEF_IP5)
-		ls1x_irq_dispatch(3); /* INT3 */
-	else if (pending & CAUSEF_IP6)
-		ls1x_irq_dispatch(4); /* INT4 */
-	else
-		spurious_interrupt();
-
-}
-
-static void __init ls1x_irq_init(int base)
-{
-	int n;
-
-	/* Disable interrupts and clear pending,
-	 * setup all IRQs as high level triggered
-	 */
-	for (n = 0; n < INTN; n++) {
-		__raw_writel(0x0, LS1X_INTC_INTIEN(n));
-		__raw_writel(0xffffffff, LS1X_INTC_INTCLR(n));
-		__raw_writel(0xffffffff, LS1X_INTC_INTPOL(n));
-		/* set DMA0, DMA1 and DMA2 to edge trigger */
-		__raw_writel(n ? 0x0 : 0xe000, LS1X_INTC_INTEDGE(n));
-	}
-
-
-	for (n = base; n < NR_IRQS; n++) {
-		irq_set_chip_and_handler(n, &ls1x_irq_chip,
-					 handle_level_irq);
-	}
-
-	if (request_irq(INT0_IRQ, no_action, IRQF_NO_THREAD, "cascade", NULL))
-		pr_err("Failed to request irq %d (cascade)\n", INT0_IRQ);
-	if (request_irq(INT1_IRQ, no_action, IRQF_NO_THREAD, "cascade", NULL))
-		pr_err("Failed to request irq %d (cascade)\n", INT1_IRQ);
-	if (request_irq(INT2_IRQ, no_action, IRQF_NO_THREAD, "cascade", NULL))
-		pr_err("Failed to request irq %d (cascade)\n", INT2_IRQ);
-	if (request_irq(INT3_IRQ, no_action, IRQF_NO_THREAD, "cascade", NULL))
-		pr_err("Failed to request irq %d (cascade)\n", INT3_IRQ);
-#if defined(CONFIG_LOONGSON1_LS1C)
-	if (request_irq(INT4_IRQ, no_action, IRQF_NO_THREAD, "cascade", NULL))
-		pr_err("Failed to request irq %d (cascade)\n", INT4_IRQ);
-#endif
-}
-
-void __init arch_init_irq(void)
-{
-	mips_cpu_irq_init();
-	ls1x_irq_init(LS1X_IRQ_BASE);
-}
diff --git a/arch/mips/loongson32/common/platform.c b/arch/mips/loongson32/common/platform.c
deleted file mode 100644
index 623eb4bc7b41..000000000000
--- a/arch/mips/loongson32/common/platform.c
+++ /dev/null
@@ -1,285 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (c) 2011-2016 Zhang, Keguang <keguang.zhang@gmail.com>
- */
-
-#include <linux/clk.h>
-#include <linux/dma-mapping.h>
-#include <linux/err.h>
-#include <linux/mtd/partitions.h>
-#include <linux/sizes.h>
-#include <linux/phy.h>
-#include <linux/serial_8250.h>
-#include <linux/stmmac.h>
-#include <linux/usb/ehci_pdriver.h>
-
-#include <platform.h>
-#include <loongson1.h>
-
-/* 8250/16550 compatible UART */
-#define LS1X_UART(_id)						\
-	{							\
-		.mapbase	= LS1X_UART ## _id ## _BASE,	\
-		.irq		= LS1X_UART ## _id ## _IRQ,	\
-		.iotype		= UPIO_MEM,			\
-		.flags		= UPF_IOREMAP | UPF_FIXED_TYPE, \
-		.type		= PORT_16550A,			\
-	}
-
-static struct plat_serial8250_port ls1x_serial8250_pdata[] = {
-	LS1X_UART(0),
-	LS1X_UART(1),
-	LS1X_UART(2),
-	LS1X_UART(3),
-	{},
-};
-
-struct platform_device ls1x_uart_pdev = {
-	.name		= "serial8250",
-	.id		= PLAT8250_DEV_PLATFORM,
-	.dev		= {
-		.platform_data = ls1x_serial8250_pdata,
-	},
-};
-
-void __init ls1x_serial_set_uartclk(struct platform_device *pdev)
-{
-	struct clk *clk;
-	struct plat_serial8250_port *p;
-
-	clk = clk_get(&pdev->dev, pdev->name);
-	if (IS_ERR(clk)) {
-		pr_err("unable to get %s clock, err=%ld",
-		       pdev->name, PTR_ERR(clk));
-		return;
-	}
-	clk_prepare_enable(clk);
-
-	for (p = pdev->dev.platform_data; p->flags != 0; ++p)
-		p->uartclk = clk_get_rate(clk);
-}
-
-/* Synopsys Ethernet GMAC */
-static struct stmmac_mdio_bus_data ls1x_mdio_bus_data = {
-	.phy_mask	= 0,
-};
-
-static struct stmmac_dma_cfg ls1x_eth_dma_cfg = {
-	.pbl		= 1,
-};
-
-int ls1x_eth_mux_init(struct platform_device *pdev, void *priv)
-{
-	struct plat_stmmacenet_data *plat_dat = NULL;
-	u32 val;
-
-	val = __raw_readl(LS1X_MUX_CTRL1);
-
-#if defined(CONFIG_LOONGSON1_LS1B)
-	plat_dat = dev_get_platdata(&pdev->dev);
-	if (plat_dat->bus_id) {
-		__raw_writel(__raw_readl(LS1X_MUX_CTRL0) | GMAC1_USE_UART1 |
-			     GMAC1_USE_UART0, LS1X_MUX_CTRL0);
-		switch (plat_dat->phy_interface) {
-		case PHY_INTERFACE_MODE_RGMII:
-			val &= ~(GMAC1_USE_TXCLK | GMAC1_USE_PWM23);
-			break;
-		case PHY_INTERFACE_MODE_MII:
-			val |= (GMAC1_USE_TXCLK | GMAC1_USE_PWM23);
-			break;
-		default:
-			pr_err("unsupported mii mode %d\n",
-			       plat_dat->phy_interface);
-			return -ENOTSUPP;
-		}
-		val &= ~GMAC1_SHUT;
-	} else {
-		switch (plat_dat->phy_interface) {
-		case PHY_INTERFACE_MODE_RGMII:
-			val &= ~(GMAC0_USE_TXCLK | GMAC0_USE_PWM01);
-			break;
-		case PHY_INTERFACE_MODE_MII:
-			val |= (GMAC0_USE_TXCLK | GMAC0_USE_PWM01);
-			break;
-		default:
-			pr_err("unsupported mii mode %d\n",
-			       plat_dat->phy_interface);
-			return -ENOTSUPP;
-		}
-		val &= ~GMAC0_SHUT;
-	}
-	__raw_writel(val, LS1X_MUX_CTRL1);
-#elif defined(CONFIG_LOONGSON1_LS1C)
-	plat_dat = dev_get_platdata(&pdev->dev);
-
-	val &= ~PHY_INTF_SELI;
-	if (plat_dat->phy_interface == PHY_INTERFACE_MODE_RMII)
-		val |= 0x4 << PHY_INTF_SELI_SHIFT;
-	__raw_writel(val, LS1X_MUX_CTRL1);
-
-	val = __raw_readl(LS1X_MUX_CTRL0);
-	__raw_writel(val & (~GMAC_SHUT), LS1X_MUX_CTRL0);
-#endif
-
-	return 0;
-}
-
-static struct plat_stmmacenet_data ls1x_eth0_pdata = {
-	.bus_id			= 0,
-	.phy_addr		= -1,
-#if defined(CONFIG_LOONGSON1_LS1B)
-	.phy_interface		= PHY_INTERFACE_MODE_MII,
-#elif defined(CONFIG_LOONGSON1_LS1C)
-	.phy_interface		= PHY_INTERFACE_MODE_RMII,
-#endif
-	.mdio_bus_data		= &ls1x_mdio_bus_data,
-	.dma_cfg		= &ls1x_eth_dma_cfg,
-	.has_gmac		= 1,
-	.tx_coe			= 1,
-	.rx_queues_to_use	= 1,
-	.tx_queues_to_use	= 1,
-	.init			= ls1x_eth_mux_init,
-};
-
-static struct resource ls1x_eth0_resources[] = {
-	[0] = {
-		.start	= LS1X_GMAC0_BASE,
-		.end	= LS1X_GMAC0_BASE + SZ_64K - 1,
-		.flags	= IORESOURCE_MEM,
-	},
-	[1] = {
-		.name	= "macirq",
-		.start	= LS1X_GMAC0_IRQ,
-		.flags	= IORESOURCE_IRQ,
-	},
-};
-
-struct platform_device ls1x_eth0_pdev = {
-	.name		= "stmmaceth",
-	.id		= 0,
-	.num_resources	= ARRAY_SIZE(ls1x_eth0_resources),
-	.resource	= ls1x_eth0_resources,
-	.dev		= {
-		.platform_data = &ls1x_eth0_pdata,
-	},
-};
-
-#ifdef CONFIG_LOONGSON1_LS1B
-static struct plat_stmmacenet_data ls1x_eth1_pdata = {
-	.bus_id			= 1,
-	.phy_addr		= -1,
-	.phy_interface		= PHY_INTERFACE_MODE_MII,
-	.mdio_bus_data		= &ls1x_mdio_bus_data,
-	.dma_cfg		= &ls1x_eth_dma_cfg,
-	.has_gmac		= 1,
-	.tx_coe			= 1,
-	.rx_queues_to_use	= 1,
-	.tx_queues_to_use	= 1,
-	.init			= ls1x_eth_mux_init,
-};
-
-static struct resource ls1x_eth1_resources[] = {
-	[0] = {
-		.start	= LS1X_GMAC1_BASE,
-		.end	= LS1X_GMAC1_BASE + SZ_64K - 1,
-		.flags	= IORESOURCE_MEM,
-	},
-	[1] = {
-		.name	= "macirq",
-		.start	= LS1X_GMAC1_IRQ,
-		.flags	= IORESOURCE_IRQ,
-	},
-};
-
-struct platform_device ls1x_eth1_pdev = {
-	.name		= "stmmaceth",
-	.id		= 1,
-	.num_resources	= ARRAY_SIZE(ls1x_eth1_resources),
-	.resource	= ls1x_eth1_resources,
-	.dev		= {
-		.platform_data = &ls1x_eth1_pdata,
-	},
-};
-#endif	/* CONFIG_LOONGSON1_LS1B */
-
-/* GPIO */
-static struct resource ls1x_gpio0_resources[] = {
-	[0] = {
-		.start	= LS1X_GPIO0_BASE,
-		.end	= LS1X_GPIO0_BASE + SZ_4 - 1,
-		.flags	= IORESOURCE_MEM,
-	},
-};
-
-struct platform_device ls1x_gpio0_pdev = {
-	.name		= "ls1x-gpio",
-	.id		= 0,
-	.num_resources	= ARRAY_SIZE(ls1x_gpio0_resources),
-	.resource	= ls1x_gpio0_resources,
-};
-
-static struct resource ls1x_gpio1_resources[] = {
-	[0] = {
-		.start	= LS1X_GPIO1_BASE,
-		.end	= LS1X_GPIO1_BASE + SZ_4 - 1,
-		.flags	= IORESOURCE_MEM,
-	},
-};
-
-struct platform_device ls1x_gpio1_pdev = {
-	.name		= "ls1x-gpio",
-	.id		= 1,
-	.num_resources	= ARRAY_SIZE(ls1x_gpio1_resources),
-	.resource	= ls1x_gpio1_resources,
-};
-
-/* USB EHCI */
-static u64 ls1x_ehci_dmamask = DMA_BIT_MASK(32);
-
-static struct resource ls1x_ehci_resources[] = {
-	[0] = {
-		.start	= LS1X_EHCI_BASE,
-		.end	= LS1X_EHCI_BASE + SZ_32K - 1,
-		.flags	= IORESOURCE_MEM,
-	},
-	[1] = {
-		.start	= LS1X_EHCI_IRQ,
-		.flags	= IORESOURCE_IRQ,
-	},
-};
-
-static struct usb_ehci_pdata ls1x_ehci_pdata = {
-};
-
-struct platform_device ls1x_ehci_pdev = {
-	.name		= "ehci-platform",
-	.id		= -1,
-	.num_resources	= ARRAY_SIZE(ls1x_ehci_resources),
-	.resource	= ls1x_ehci_resources,
-	.dev		= {
-		.dma_mask = &ls1x_ehci_dmamask,
-		.platform_data = &ls1x_ehci_pdata,
-	},
-};
-
-/* Real Time Clock */
-struct platform_device ls1x_rtc_pdev = {
-	.name		= "ls1x-rtc",
-	.id		= -1,
-};
-
-/* Watchdog */
-static struct resource ls1x_wdt_resources[] = {
-	{
-		.start	= LS1X_WDT_BASE,
-		.end	= LS1X_WDT_BASE + SZ_16 - 1,
-		.flags	= IORESOURCE_MEM,
-	},
-};
-
-struct platform_device ls1x_wdt_pdev = {
-	.name		= "ls1x-wdt",
-	.id		= -1,
-	.num_resources	= ARRAY_SIZE(ls1x_wdt_resources),
-	.resource	= ls1x_wdt_resources,
-};
diff --git a/arch/mips/loongson32/common/prom.c b/arch/mips/loongson32/common/prom.c
deleted file mode 100644
index fc580a22748e..000000000000
--- a/arch/mips/loongson32/common/prom.c
+++ /dev/null
@@ -1,42 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (c) 2011 Zhang, Keguang <keguang.zhang@gmail.com>
- *
- * Modified from arch/mips/pnx833x/common/prom.c.
- */
-
-#include <linux/io.h>
-#include <linux/init.h>
-#include <linux/memblock.h>
-#include <linux/serial_reg.h>
-#include <asm/fw/fw.h>
-
-#include <loongson1.h>
-
-unsigned long memsize;
-
-void __init prom_init(void)
-{
-	void __iomem *uart_base;
-
-	fw_init_cmdline();
-
-	memsize = fw_getenvl("memsize");
-	if(!memsize)
-		memsize = DEFAULT_MEMSIZE;
-
-	if (strstr(arcs_cmdline, "console=ttyS3"))
-		uart_base = ioremap(LS1X_UART3_BASE, 0x0f);
-	else if (strstr(arcs_cmdline, "console=ttyS2"))
-		uart_base = ioremap(LS1X_UART2_BASE, 0x0f);
-	else if (strstr(arcs_cmdline, "console=ttyS1"))
-		uart_base = ioremap(LS1X_UART1_BASE, 0x0f);
-	else
-		uart_base = ioremap(LS1X_UART0_BASE, 0x0f);
-	setup_8250_early_printk_port((unsigned long)uart_base, 0, 0);
-}
-
-void __init plat_mem_setup(void)
-{
-	memblock_add(0x0, (memsize << 20));
-}
diff --git a/arch/mips/loongson32/common/setup.c b/arch/mips/loongson32/common/setup.c
deleted file mode 100644
index 4733fe037176..000000000000
--- a/arch/mips/loongson32/common/setup.c
+++ /dev/null
@@ -1,26 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (c) 2011 Zhang, Keguang <keguang.zhang@gmail.com>
- */
-
-#include <linux/io.h>
-#include <linux/init.h>
-#include <linux/smp.h>
-#include <asm/cpu-info.h>
-#include <asm/bootinfo.h>
-
-const char *get_system_type(void)
-{
-	unsigned int processor_id = (&current_cpu_data)->processor_id;
-
-	switch (processor_id & PRID_REV_MASK) {
-	case PRID_REV_LOONGSON1B:
-#if defined(CONFIG_LOONGSON1_LS1B)
-		return "LOONGSON LS1B";
-#elif defined(CONFIG_LOONGSON1_LS1C)
-		return "LOONGSON LS1C";
-#endif
-	default:
-		return "LOONGSON (unknown)";
-	}
-}
diff --git a/arch/mips/loongson32/common/time.c b/arch/mips/loongson32/common/time.c
deleted file mode 100644
index 74ad2b17918d..000000000000
--- a/arch/mips/loongson32/common/time.c
+++ /dev/null
@@ -1,23 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (c) 2014 Zhang, Keguang <keguang.zhang@gmail.com>
- */
-
-#include <linux/clk.h>
-#include <linux/of_clk.h>
-#include <asm/time.h>
-
-void __init plat_time_init(void)
-{
-	struct clk *clk = NULL;
-
-	/* initialize LS1X clocks */
-	of_clk_init(NULL);
-
-	/* setup mips r4k timer */
-	clk = clk_get(NULL, "cpu_clk");
-	if (IS_ERR(clk))
-		panic("unable to get cpu clock, err=%ld", PTR_ERR(clk));
-
-	mips_hpt_frequency = clk_get_rate(clk) / 2;
-}
diff --git a/arch/mips/loongson32/ls1b/Makefile b/arch/mips/loongson32/ls1b/Makefile
deleted file mode 100644
index 33c574dc0f7f..000000000000
--- a/arch/mips/loongson32/ls1b/Makefile
+++ /dev/null
@@ -1,6 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-#
-# Makefile for loongson1B based machines.
-#
-
-obj-y += board.o
diff --git a/arch/mips/loongson32/ls1b/board.c b/arch/mips/loongson32/ls1b/board.c
deleted file mode 100644
index fe115bdcb22c..000000000000
--- a/arch/mips/loongson32/ls1b/board.c
+++ /dev/null
@@ -1,55 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (c) 2011-2016 Zhang, Keguang <keguang.zhang@gmail.com>
- */
-
-#include <linux/leds.h>
-#include <linux/mtd/partitions.h>
-#include <linux/sizes.h>
-
-#include <loongson1.h>
-#include <platform.h>
-
-static const struct gpio_led ls1x_gpio_leds[] __initconst = {
-	{
-		.name			= "LED9",
-		.default_trigger	= "heartbeat",
-		.gpio			= 38,
-		.active_low		= 1,
-		.default_state		= LEDS_GPIO_DEFSTATE_OFF,
-	}, {
-		.name			= "LED6",
-		.default_trigger	= "nand-disk",
-		.gpio			= 39,
-		.active_low		= 1,
-		.default_state		= LEDS_GPIO_DEFSTATE_OFF,
-	},
-};
-
-static const struct gpio_led_platform_data ls1x_led_pdata __initconst = {
-	.num_leds	= ARRAY_SIZE(ls1x_gpio_leds),
-	.leds		= ls1x_gpio_leds,
-};
-
-static struct platform_device *ls1b_platform_devices[] __initdata = {
-	&ls1x_uart_pdev,
-	&ls1x_eth0_pdev,
-	&ls1x_eth1_pdev,
-	&ls1x_ehci_pdev,
-	&ls1x_gpio0_pdev,
-	&ls1x_gpio1_pdev,
-	&ls1x_rtc_pdev,
-	&ls1x_wdt_pdev,
-};
-
-static int __init ls1b_platform_init(void)
-{
-	ls1x_serial_set_uartclk(&ls1x_uart_pdev);
-
-	gpio_led_register_device(-1, &ls1x_led_pdata);
-
-	return platform_add_devices(ls1b_platform_devices,
-				   ARRAY_SIZE(ls1b_platform_devices));
-}
-
-arch_initcall(ls1b_platform_init);
diff --git a/arch/mips/loongson32/ls1c/Makefile b/arch/mips/loongson32/ls1c/Makefile
deleted file mode 100644
index 1cf3aa264d55..000000000000
--- a/arch/mips/loongson32/ls1c/Makefile
+++ /dev/null
@@ -1,6 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-#
-# Makefile for loongson1C based machines.
-#
-
-obj-y += board.o
diff --git a/arch/mips/loongson32/ls1c/board.c b/arch/mips/loongson32/ls1c/board.c
deleted file mode 100644
index 9dcfe9de55b0..000000000000
--- a/arch/mips/loongson32/ls1c/board.c
+++ /dev/null
@@ -1,23 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (c) 2016 Yang Ling <gnaygnil@gmail.com>
- */
-
-#include <platform.h>
-
-static struct platform_device *ls1c_platform_devices[] __initdata = {
-	&ls1x_uart_pdev,
-	&ls1x_eth0_pdev,
-	&ls1x_rtc_pdev,
-	&ls1x_wdt_pdev,
-};
-
-static int __init ls1c_platform_init(void)
-{
-	ls1x_serial_set_uartclk(&ls1x_uart_pdev);
-
-	return platform_add_devices(ls1c_platform_devices,
-				   ARRAY_SIZE(ls1c_platform_devices));
-}
-
-arch_initcall(ls1c_platform_init);

-- 
2.43.0



