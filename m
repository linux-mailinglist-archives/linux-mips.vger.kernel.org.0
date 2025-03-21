Return-Path: <linux-mips+bounces-8258-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF43A6BBF7
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 14:47:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A6F818924BD
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 13:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D2EF13A3F7;
	Fri, 21 Mar 2025 13:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="ssfsiju5"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C4D78F5D;
	Fri, 21 Mar 2025 13:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742564831; cv=none; b=qxHLYI3tCijkPGParh4t52sS5aqw0szcUsw5RaqwTgoGyz9AACPnzxPsGf2vNo9yFmQ62kK9MmzH0tjWOvPAQ0CbUdgTPLcnAg25HNMwC7jf2l5aCIAzLVVdL/A/NR/0dAWmBwmmbyrF5bmwjzzsvyWeU6QGA/4r/rW3qYzTP8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742564831; c=relaxed/simple;
	bh=t3Vul1Mcdv+1GMUsDvialCECw43EJgBk3CYtRwp26xs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R0xaSLNWAab30Es3/IOJxoD3F9LWpLMuBmWibYn85GzfCEytlL53gsxFjP9+Q4eCshMYtEBGiw0pJMzM4CQQQi8jfKPDt9HorGvYpJlEy/kcgPIXZA8kDrYDCY0FkAYsNFozKEnQ5CSJ1Tx1njcAzCoszuPPsgcqSbXDKdoCLhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=ssfsiju5; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 55AAA2A40B8;
	Fri, 21 Mar 2025 14:47:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1742564826; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=VDAr/VH2Lf+cycxyiwdi2azDuqbXm7Z7t4Q1guYYuPs=;
	b=ssfsiju5hvXNTnRo+4qZzf7lMxY+1o0ogc5+aNiiL6cj0b/domA1Z4TXeeddQl5FEiveCT
	eFCW7I5ZSl01RAjh4gHklDTQ0W9weLOGsAbH+m8WJ/5rC4sdAQjjJ4+NeDPCqLrzu2hRlk
	vNcJ/VcHjl4WXH6SpV6OPQJJKYtOAd/JXYs/hT9lVKwdaBgAe77PBv5wBRLTkVw0x9+MbI
	yeJmoQLu0lceR/bFzpszTXAH0Zamh/ILHtbg2UA24dHJ6FSlAgh0kkwAnVT2MBByL1WMlv
	M+OMiDta25Xe+QaJx9D52Z2208GzUfSddG9ffFdBfjRpdVKCMj1SYzbPM6kapg==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benjamin.larsson@genexis.eu,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v1 7/8] mips: Add EcoNet MIPS platform support
Date: Fri, 21 Mar 2025 13:46:32 +0000
Message-Id: <20250321134633.2155141-8-cjd@cjdns.fr>
In-Reply-To: <20250321134633.2155141-1-cjd@cjdns.fr>
References: <20250321134633.2155141-1-cjd@cjdns.fr>
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
As is typical of embedded platforms, it's not realistic to imagine building
a fully functioning system from kernel sources alone. In the interest of
providing something without external dependencies, I have included build and
device tree for a minimal testing / PoC image that can be booted from memory
on these devices.
---
 arch/mips/Kbuild.platforms                    |  1 +
 arch/mips/Kconfig                             | 25 ++++++
 arch/mips/boot/compressed/uart-16550.c        |  5 ++
 arch/mips/boot/dts/Makefile                   |  1 +
 arch/mips/boot/dts/econet/Makefile            |  2 +
 arch/mips/boot/dts/econet/en751221.dtsi       | 62 +++++++++++++++
 .../boot/dts/econet/en751221_test_image.dts   | 19 +++++
 arch/mips/econet/Kconfig                      | 42 ++++++++++
 arch/mips/econet/Makefile                     |  2 +
 arch/mips/econet/Platform                     |  5 ++
 arch/mips/econet/init.c                       | 78 +++++++++++++++++++
 11 files changed, 242 insertions(+)
 create mode 100644 arch/mips/boot/dts/econet/Makefile
 create mode 100644 arch/mips/boot/dts/econet/en751221.dtsi
 create mode 100644 arch/mips/boot/dts/econet/en751221_test_image.dts
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
index 1924f2d83932..593ff00855b6 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -390,6 +390,30 @@ config MACH_DECSTATION
 
 	  otherwise choose R3000.
 
+config ECONET
+	bool "EcoNet MIPS family"
+	select BOOT_RAW
+	select CPU_BIG_ENDIAN
+	select DEBUG_ZBOOT
+	select EARLY_PRINTK_8250
+	select ECONET_TIMER_HPT
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
@@ -1019,6 +1043,7 @@ source "arch/mips/ath79/Kconfig"
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
diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
index ff468439a8c4..7375c6ced82b 100644
--- a/arch/mips/boot/dts/Makefile
+++ b/arch/mips/boot/dts/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 subdir-$(CONFIG_BMIPS_GENERIC)		+= brcm
 subdir-$(CONFIG_CAVIUM_OCTEON_SOC)	+= cavium-octeon
+subdir-$(CONFIG_ECONET)			+= econet
 subdir-$(CONFIG_EYEQ)			+= mobileye
 subdir-$(CONFIG_FIT_IMAGE_FDT_MARDUK)   += img
 subdir-$(CONFIG_FIT_IMAGE_FDT_BOSTON)	+= img
diff --git a/arch/mips/boot/dts/econet/Makefile b/arch/mips/boot/dts/econet/Makefile
new file mode 100644
index 000000000000..524ba10ce750
--- /dev/null
+++ b/arch/mips/boot/dts/econet/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_SOC_ECONET_EN751221_TEST_IMAGE)	+= en751221_test_image.dtb
diff --git a/arch/mips/boot/dts/econet/en751221.dtsi b/arch/mips/boot/dts/econet/en751221.dtsi
new file mode 100644
index 000000000000..e4404aed5705
--- /dev/null
+++ b/arch/mips/boot/dts/econet/en751221.dtsi
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+/ {
+	compatible = "econet,en751221";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	hpt_clock: hpt_clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <200000000>;  /* 200 MHz */
+	};
+
+	cpus: cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "mips,mips24KEc";
+			reg = <0>;
+		};
+	};
+
+	cpuintc: interrupt-controller {
+		#address-cells = <0>;
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		compatible = "mti,cpu-interrupt-controller";
+	};
+
+	intc: interrupt-controller@1fb40000 {
+		compatible = "econet,en751221-intc";
+		reg = <0x1fb40000 0x100>;
+		interrupt-parent = <&cpuintc>;
+		interrupts = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <1>;
+		econet,shadow-interrupts = <7 2>, <8 3>, <13 12>, <30 29>;
+	};
+
+	uart: serial@1fbf0000 {
+		compatible = "ns16550";
+		reg = <0x1fbf0000 0x30>;
+		reg-io-width = <4>;
+		reg-shift = <2>;
+		interrupt-parent = <&intc>;
+		interrupts = <0>;
+		clock-frequency = <1843200>;
+	};
+
+	timer_hpt: timer_hpt@1fbf0400 {
+		compatible = "econet,timer-hpt";
+		reg = <0x1fbf0400 0x100>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <30>;
+		clocks = <&hpt_clock>;
+	};
+};
diff --git a/arch/mips/boot/dts/econet/en751221_test_image.dts b/arch/mips/boot/dts/econet/en751221_test_image.dts
new file mode 100644
index 000000000000..bc140c4043b2
--- /dev/null
+++ b/arch/mips/boot/dts/econet/en751221_test_image.dts
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "en751221.dtsi"
+
+/ {
+	model = "Generic EN751221";
+
+	memory@0 {
+		/* We hope at least 64MB will be available wherever we are run */
+		device_type = "memory";
+		reg = <0x00000000 0x4000000>;
+	};
+
+	chosen {
+		bootargs = "console=ttyS0,115200";
+		linux,usable-memory-range = <0x00020000 0x3fe0000>;
+	};
+};
diff --git a/arch/mips/econet/Kconfig b/arch/mips/econet/Kconfig
new file mode 100644
index 000000000000..12f85d638e47
--- /dev/null
+++ b/arch/mips/econet/Kconfig
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: GPL-2.0
+if ECONET
+
+config SOC_ECONET_EN751221
+	bool
+	select COMMON_CLK
+	select ECONET_EN751221_INTC
+	select IRQ_MIPS_CPU
+	select SMP
+	select SMP_UP
+	select SYS_SUPPORTS_SMP
+
+choice
+	prompt "EcoNet SoC selection"
+	default SOC_ECONET_EN751221_FAMILY
+	help
+	  Select EcoNet MIPS SoC type. Individual SoCs within a family are
+	  similar enough that is it enough to select the right family, and
+	  then customize to the specific SoC using the device tree only.
+
+	config SOC_ECONET_EN751221_FAMILY
+		bool "EN751221 family"
+		select SOC_ECONET_EN751221
+		help
+		  The EN751221 family includes EN7512, RN7513, EN7521, EN7526.
+		  They are based on single core MIPS 34Kc processors. To boot
+		  this kernel, you will need a device tree such as
+		  MIPS_RAW_APPENDED_DTB=y, and a root filesystem.
+
+	config SOC_ECONET_EN751221_TEST_IMAGE
+		bool "EN751221 test image"
+		select SOC_ECONET_EN751221
+		select BUILTIN_DTB
+		help
+		  Build a minimal kernel that will boot on any EN751221 board
+		  with at least 64MB of memory. This has a builtin device tree
+		  so it can boot with nothing more than an appended initramfs.
+		  This is good for validating that a given SoC is EN751221
+		  compatible, or for regression testing.
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
index 000000000000..bb659876d855
--- /dev/null
+++ b/arch/mips/econet/Platform
@@ -0,0 +1,5 @@
+# To address a 7.2MB kernel size limit in the EcoNet SDK bootloader,
+# we put the load address well above where the bootloader loads and then use
+# zboot. So please set CONFIG_ZBOOT_LOAD_ADDRESS to the address where your
+# bootloader actually places the kernel.
+load-$(CONFIG_ECONET)	+= 0xffffffff81000000
\ No newline at end of file
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
2.30.2


