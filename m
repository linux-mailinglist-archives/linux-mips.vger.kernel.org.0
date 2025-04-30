Return-Path: <linux-mips+bounces-8886-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 125ECAA4DBF
	for <lists+linux-mips@lfdr.de>; Wed, 30 Apr 2025 15:42:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 194C41BC54C9
	for <lists+linux-mips@lfdr.de>; Wed, 30 Apr 2025 13:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 256D125EF80;
	Wed, 30 Apr 2025 13:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="WcEEbiAp"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04F1259CBB;
	Wed, 30 Apr 2025 13:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746020508; cv=none; b=JbIgq9Qteud2Jtww0MquUJRv9pJ1RU+Vf5o2fmLjwRQuWiJckVLj1WhtNIv8s1towccCnfIwe+af3RnNGzmZSHewi69rMR4Azjks2m+qKEOsU0DHNIPaNwDGP27alhQVqwWBUFh2X8a/vSdiKDwBQN79heDgmuFSJGVzPq8hUUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746020508; c=relaxed/simple;
	bh=E/Q/2B/8HGFcYfTNIcOEC+iIF57GHPFB6Ji15bPzudk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TurZ7syW417Ismx5xoPPhHpHQoSwZUp8vrO957ezrHouEHicqxVVEBNp9bYOFSbDf90hnm7AKQ9jn2t4sFxV6d0EBLFT70/toHW4eJlCTh9Ex+QZXm2lrRXxEY+QfxgNWBxsGmG46s/b6HOhQg4s65WRNaX0fnxpz1SNBbhbGuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=WcEEbiAp; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D42C79184D;
	Wed, 30 Apr 2025 15:34:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1746020095; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=1zx7YDdH6fuEhBMxor2eO5pbMGS8qLPBBpxZ7MXsTD8=;
	b=WcEEbiApS6AuOHW9Htf7rgmnQl+A6oDWKM2lPAf4qUgo0dNcEIYZgk8uIRYRa7V1h/Q2Dj
	PiVlShfoNVFd07TwVX4b4fgwHN3XZYD2Q1Tc1DMoYSVvapM2ZOrRzfdC+D04L/XvZB+LF5
	qNRkWA/J13rzFYko9biVZ98UuxGunZQjgEQrDEES2yfvcXn1vam8Kq9MhG7TLaq7FBvE5W
	MpnO3GVrw0JBg+/zNKZKqbuDCMLRunpdYiP0iLo6TeFd0FlLVAqtcnQqNUDK6mQ5JgA4DM
	kaWujVJeefCrsFOyajXJ6KPf9yUxprum3HWL8cbc2445B/fj7cc9FhQclWRY3A==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: tglx@linutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	daniel.lezcano@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benjamin.larsson@genexis.eu,
	linux-mediatek@lists.infradead.org,
	cjd@cjdns.fr
Subject: [PATCH v4 4/7] mips: Add EcoNet MIPS platform support
Date: Wed, 30 Apr 2025 13:34:30 +0000
Message-Id: <20250430133433.22222-5-cjd@cjdns.fr>
In-Reply-To: <20250430133433.22222-1-cjd@cjdns.fr>
References: <20250430133433.22222-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add platform support for EcoNet MIPS SoCs.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 arch/mips/Kbuild.platforms             |  1 +
 arch/mips/Kconfig                      | 25 +++++++++
 arch/mips/boot/compressed/uart-16550.c |  5 ++
 arch/mips/econet/Kconfig               | 37 ++++++++++++
 arch/mips/econet/Makefile              |  2 +
 arch/mips/econet/Platform              |  5 ++
 arch/mips/econet/init.c                | 78 ++++++++++++++++++++++++++
 7 files changed, 153 insertions(+)
 create mode 100644 arch/mips/econet/Kconfig
 create mode 100644 arch/mips/econet/Makefile
 create mode 100644 arch/mips/econet/Platform
 create mode 100644 arch/mips/econet/init.c

diff --git a/arch/mips/Kbuild.platforms b/arch/mips/Kbuild.platforms
index bca37ddf974b..41a00fa860c1 100644
--- a/arch/mips/Kbuild.platforms
+++ b/arch/mips/Kbuild.platforms
@@ -11,6 +11,7 @@ platform-$(CONFIG_CAVIUM_OCTEON_SOC)	+= cavium-octeon/
 platform-$(CONFIG_EYEQ)			+= mobileye/
 platform-$(CONFIG_MIPS_COBALT)		+= cobalt/
 platform-$(CONFIG_MACH_DECSTATION)	+= dec/
+platform-$(CONFIG_ECONET)		+= econet/
 platform-$(CONFIG_MIPS_GENERIC)		+= generic/
 platform-$(CONFIG_MACH_JAZZ)		+= jazz/
 platform-$(CONFIG_LANTIQ)		+= lantiq/
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index e0e6ce2592b4..c3dbdc808664 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -391,6 +391,30 @@ config MACH_DECSTATION
 
 	  otherwise choose R3000.
 
+config ECONET
+	bool "EcoNet MIPS family"
+	select BOOT_RAW
+	select CPU_BIG_ENDIAN
+	select DEBUG_ZBOOT
+	select EARLY_PRINTK_8250
+	select ECONET_EN751221_TIMER
+	select SERIAL_OF_PLATFORM
+	select SYS_SUPPORTS_BIG_ENDIAN
+	select SYS_HAS_CPU_MIPS32_R1
+	select SYS_HAS_CPU_MIPS32_R2
+	select SYS_HAS_EARLY_PRINTK
+	select SYS_SUPPORTS_32BIT_KERNEL
+	select SYS_SUPPORTS_MIPS16
+	select SYS_SUPPORTS_ZBOOT_UART16550
+	select USE_GENERIC_EARLY_PRINTK_8250
+	select USE_OF
+	help
+	  EcoNet EN75xx MIPS devices are big endian MIPS machines used
+	  in XPON (fiber) and DSL applications. They have SPI, PCI, USB,
+	  GPIO, and Ethernet, with optional XPON, DSL, and VoIP DSP cores.
+	  Don't confuse these with the Airoha ARM devices sometimes referred
+	  to as "EcoNet", this family is for MIPS based devices only.
+
 config MACH_JAZZ
 	bool "Jazz family of machines"
 	select ARC_MEMORY
@@ -1021,6 +1045,7 @@ source "arch/mips/ath79/Kconfig"
 source "arch/mips/bcm47xx/Kconfig"
 source "arch/mips/bcm63xx/Kconfig"
 source "arch/mips/bmips/Kconfig"
+source "arch/mips/econet/Kconfig"
 source "arch/mips/generic/Kconfig"
 source "arch/mips/ingenic/Kconfig"
 source "arch/mips/jazz/Kconfig"
diff --git a/arch/mips/boot/compressed/uart-16550.c b/arch/mips/boot/compressed/uart-16550.c
index db618e72a0c4..529e77a6487c 100644
--- a/arch/mips/boot/compressed/uart-16550.c
+++ b/arch/mips/boot/compressed/uart-16550.c
@@ -20,6 +20,11 @@
 #define PORT(offset) (CKSEG1ADDR(INGENIC_UART_BASE_ADDR) + (4 * offset))
 #endif
 
+#ifdef CONFIG_ECONET
+#define EN75_UART_BASE	0x1fbf0003
+#define PORT(offset)	(CKSEG1ADDR(EN75_UART_BASE) + (4 * (offset)))
+#endif
+
 #ifndef IOTYPE
 #define IOTYPE char
 #endif
diff --git a/arch/mips/econet/Kconfig b/arch/mips/econet/Kconfig
new file mode 100644
index 000000000000..d03f90f3daa4
--- /dev/null
+++ b/arch/mips/econet/Kconfig
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: GPL-2.0
+if ECONET
+
+choice
+	prompt "EcoNet SoC selection"
+	default SOC_ECONET_EN751221
+	help
+	  Select EcoNet MIPS SoC type. Individual SoCs within a family are
+	  very similar, so is it enough to select the right family, and
+	  then customize to the specific SoC using the device tree only.
+
+	config SOC_ECONET_EN751221
+		bool "EN751221 family"
+		select COMMON_CLK
+		select ECONET_EN751221_INTC
+		select IRQ_MIPS_CPU
+		select SMP
+		select SMP_UP
+		select SYS_SUPPORTS_SMP
+		help
+		  The EN751221 family includes EN7512, RN7513, EN7521, EN7526.
+		  They are based on single core MIPS 34Kc processors. To boot
+		  this kernel, you will need a device tree such as
+		  MIPS_RAW_APPENDED_DTB=y, and a root filesystem.
+endchoice
+
+choice
+	prompt "Devicetree selection"
+	default DTB_ECONET_NONE
+	help
+	  Select the devicetree.
+
+	config DTB_ECONET_NONE
+		bool "None"
+endchoice
+
+endif
diff --git a/arch/mips/econet/Makefile b/arch/mips/econet/Makefile
new file mode 100644
index 000000000000..7e4529e7d3d7
--- /dev/null
+++ b/arch/mips/econet/Makefile
@@ -0,0 +1,2 @@
+
+obj-y := init.o
diff --git a/arch/mips/econet/Platform b/arch/mips/econet/Platform
new file mode 100644
index 000000000000..ea5616447bcd
--- /dev/null
+++ b/arch/mips/econet/Platform
@@ -0,0 +1,5 @@
+# To address a 7.2MB kernel size limit in the EcoNet SDK bootloader,
+# we put the load address well above where the bootloader loads and then use
+# zboot. So please set CONFIG_ZBOOT_LOAD_ADDRESS to the address where your
+# bootloader actually places the kernel.
+load-$(CONFIG_ECONET)	+= 0xffffffff81000000
diff --git a/arch/mips/econet/init.c b/arch/mips/econet/init.c
new file mode 100644
index 000000000000..6f43ffb209cb
--- /dev/null
+++ b/arch/mips/econet/init.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * EcoNet setup code
+ *
+ * Copyright (C) 2025 Caleb James DeLisle <cjd@cjdns.fr>
+ */
+
+#include <linux/init.h>
+#include <linux/of_clk.h>
+#include <linux/irqchip.h>
+
+#include <asm/addrspace.h>
+#include <asm/io.h>
+#include <asm/bootinfo.h>
+#include <asm/time.h>
+#include <asm/prom.h>
+#include <asm/smp-ops.h>
+#include <asm/reboot.h>
+
+#define CR_AHB_RSTCR		((void __iomem *)CKSEG1ADDR(0x1fb00040))
+#define RESET			BIT(31)
+
+#define UART_BASE		CKSEG1ADDR(0x1fbf0003)
+#define UART_REG_SHIFT		2
+
+static void hw_reset(char *command)
+{
+	iowrite32(RESET, CR_AHB_RSTCR);
+}
+
+/* 1. Bring up early printk. */
+void __init prom_init(void)
+{
+	setup_8250_early_printk_port(UART_BASE, UART_REG_SHIFT, 0);
+	_machine_restart = hw_reset;
+}
+
+/* 2. Parse the DT and find memory */
+void __init plat_mem_setup(void)
+{
+	void *dtb;
+
+	set_io_port_base(KSEG1);
+
+	dtb = get_fdt();
+	if (!dtb)
+		panic("no dtb found");
+
+	__dt_setup_arch(dtb);
+
+	early_init_dt_scan_memory();
+}
+
+/* 3. Overload __weak device_tree_init(), add SMP_UP ops */
+void __init device_tree_init(void)
+{
+	unflatten_and_copy_device_tree();
+
+	register_up_smp_ops();
+}
+
+const char *get_system_type(void)
+{
+	return "EcoNet-EN75xx";
+}
+
+/* 4. Initialize the IRQ subsystem */
+void __init arch_init_irq(void)
+{
+	irqchip_init();
+}
+
+/* 5. Timers */
+void __init plat_time_init(void)
+{
+	of_clk_init(NULL);
+	timer_probe();
+}
-- 
2.39.5


