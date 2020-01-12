Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD327138589
	for <lists+linux-mips@lfdr.de>; Sun, 12 Jan 2020 09:22:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732406AbgALIWP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 12 Jan 2020 03:22:15 -0500
Received: from forward106j.mail.yandex.net ([5.45.198.249]:38382 "EHLO
        forward106j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732380AbgALIWP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Sun, 12 Jan 2020 03:22:15 -0500
Received: from forward103q.mail.yandex.net (forward103q.mail.yandex.net [IPv6:2a02:6b8:c0e:50:0:640:b21c:d009])
        by forward106j.mail.yandex.net (Yandex) with ESMTP id 7AB3B11A0A31;
        Sun, 12 Jan 2020 11:16:25 +0300 (MSK)
Received: from mxback8q.mail.yandex.net (mxback8q.mail.yandex.net [IPv6:2a02:6b8:c0e:42:0:640:b38f:32ec])
        by forward103q.mail.yandex.net (Yandex) with ESMTP id 7395861E000A;
        Sun, 12 Jan 2020 11:16:25 +0300 (MSK)
Received: from vla1-ee05250d997a.qloud-c.yandex.net (vla1-ee05250d997a.qloud-c.yandex.net [2a02:6b8:c0d:3495:0:640:ee05:250d])
        by mxback8q.mail.yandex.net (mxback/Yandex) with ESMTP id x630NXtli7-GPpeQjPA;
        Sun, 12 Jan 2020 11:16:25 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1578816985;
        bh=+I+2B6DVh3pvC30SC/PFZ8sM04FtO0EJQ8OdPf7+0Hg=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=iS/Wa9MuAAbRyZ6I81eOjQIeLCHX0EdkTnBHC11/J2/IAkN6okfSyJbnT6cM9lZad
         lGyB6p37cRyZTXGCKGAcYW9wGoJEBYLAdFkFbkdzM7HdVHRSE+L9L/+uQ+Kxl2lYnT
         QL0UnSO6uZjVLceZfqAc3+DHcES9lwmDm5iQTGyM=
Authentication-Results: mxback8q.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by vla1-ee05250d997a.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id 3jM5RHRYtF-FnV41IQM;
        Sun, 12 Jan 2020 11:15:54 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v3 09/10] MIPS: Loongson64: Add generic dts
Date:   Sun, 12 Jan 2020 16:14:15 +0800
Message-Id: <20200112081416.722218-10-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200112081416.722218-1-jiaxun.yang@flygoat.com>
References: <20200112081416.722218-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add generic device dts for Loongson-3 devices.
They seems identical but will be different later.
Some PCH devices like PCI Host Bridge is still enabled by platform
code for now.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig                             |  6 +-
 arch/mips/boot/dts/Makefile                   |  1 +
 arch/mips/boot/dts/loongson/Makefile          |  5 ++
 .../boot/dts/loongson/loongson3-package.dtsi  | 62 +++++++++++++++++++
 .../dts/loongson/loongson3_4core_rs780e.dts   | 25 ++++++++
 .../dts/loongson/loongson3_8core_rs780e.dts   | 25 ++++++++
 arch/mips/boot/dts/loongson/rs780e-pch.dtsi   | 26 ++++++++
 arch/mips/include/asm/mach-loongson64/irq.h   |  3 +-
 8 files changed, 150 insertions(+), 3 deletions(-)
 create mode 100644 arch/mips/boot/dts/loongson/Makefile
 create mode 100644 arch/mips/boot/dts/loongson/loongson3-package.dtsi
 create mode 100644 arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dts
 create mode 100644 arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dts
 create mode 100644 arch/mips/boot/dts/loongson/rs780e-pch.dtsi

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 4b83507499f4..47909e733c2d 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -489,9 +489,11 @@ config MACH_LOONGSON64
 	select SYS_SUPPORTS_HIGHMEM
 	select SYS_SUPPORTS_LITTLE_ENDIAN
 	select SYS_SUPPORTS_ZBOOT
-	select LOONGSON_MC146818
 	select ZONE_DMA32
 	select NUMA
+	select COMMON_CLK
+	select USE_OF
+	select BUILTIN_DTB
 	help
 	  This enables the support of Loongson-2/3 family of machines.
 
@@ -3085,7 +3087,7 @@ endchoice
 choice
 	prompt "Kernel command line type" if !CMDLINE_OVERRIDE
 	default MIPS_CMDLINE_FROM_DTB if USE_OF && !ATH79 && !MACH_INGENIC && \
-					 !MIPS_MALTA && \
+					 !MACH_LOONGSON64 && !MIPS_MALTA && \
 					 !CAVIUM_OCTEON_SOC
 	default MIPS_CMDLINE_FROM_BOOTLOADER
 
diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
index 1e79cab8e269..d429a69bfe30 100644
--- a/arch/mips/boot/dts/Makefile
+++ b/arch/mips/boot/dts/Makefile
@@ -4,6 +4,7 @@ subdir-y	+= cavium-octeon
 subdir-y	+= img
 subdir-y	+= ingenic
 subdir-y	+= lantiq
+subdir-y	+= loongson
 subdir-y	+= mscc
 subdir-y	+= mti
 subdir-y	+= netlogic
diff --git a/arch/mips/boot/dts/loongson/Makefile b/arch/mips/boot/dts/loongson/Makefile
new file mode 100644
index 000000000000..c0cedbaa9a78
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/Makefile
@@ -0,0 +1,5 @@
+# SPDX_License_Identifier: GPL_2.0
+dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson3_4core_rs780e.dtb loongson3_8core_rs780e.dtb\
+
+
+obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .o, $(dtb-y))
diff --git a/arch/mips/boot/dts/loongson/loongson3-package.dtsi b/arch/mips/boot/dts/loongson/loongson3-package.dtsi
new file mode 100644
index 000000000000..8a8d8c442dfe
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/loongson3-package.dtsi
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpuintc: interrupt-controller {
+		#address-cells = <0>;
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		compatible = "mti,cpu-interrupt-controller";
+	};
+
+	package0: bus@1fe00000 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges = <0 0x1fe00000 0 0x1fe00000 0x100000
+			0 0x3ff00000 0 0x3ff00000 0x100000
+			0xefd 0xfb000000 0xefd 0xfb000000 0x10000000 /* 3A HT Config Space */
+			0x1efd 0xfb000000 0x1efd 0xfb000000 0x10000000 /* 3B HT Config Space */>;
+
+		iointc: interrupt-controller@3ff01400 {
+			compatible = "loongson,iointc-1.0";
+			reg = <0 0x3ff01400 0x64>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			interrupt-parent = <&cpuintc>;
+			interrupts = <2>, <3>;
+			interrupt-names = "int0", "int1";
+
+			loongson,parent_int_map = <0xf0ffffff>, /* int0 */
+						<0x0f000000>, /* int1 */
+						<0x00000000>, /* int2 */
+						<0x00000000>; /* int3 */	
+
+		};
+
+		cpu_uart0: serial@1fe001e0 {
+			compatible = "ns16550a";
+			reg = <0 0x1fe001e0 0x8>;
+			clock-frequency = <33000000>;
+			interrupt-parent = <&iointc>;
+			interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
+			no-loopback-test;
+		};
+
+		cpu_uart1: serial@1fe001e8 {
+			status = "disabled";
+			compatible = "ns16550a";
+			reg = <0 0x1fe001e8 0x8>;
+			clock-frequency = <33000000>;
+			interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&iointc>;
+			no-loopback-test;
+		};
+	};
+};
diff --git a/arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dts b/arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dts
new file mode 100644
index 000000000000..ef50ed9a4d59
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dts
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/dts-v1/;
+
+#include "loongson3-package.dtsi"
+#include "rs780e-pch.dtsi"
+
+/ {
+	compatible = "loongson,loongson3-4core-780e";
+};
+
+&package0 {
+	htpic: interrupt-controller@efdfb000080 {
+		compatible = "loongson,htpic-1.0";
+		reg = <0xefd 0xfb000080 0x40>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		interrupt-parent = <&iointc>;
+		interrupts = <24 IRQ_TYPE_LEVEL_HIGH>,
+				<25 IRQ_TYPE_LEVEL_HIGH>,
+				<26 IRQ_TYPE_LEVEL_HIGH>,
+				<27 IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
diff --git a/arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dts b/arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dts
new file mode 100644
index 000000000000..409473f1751b
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dts
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/dts-v1/;
+
+#include "loongson3-package.dtsi"
+#include "rs780e-pch.dtsi"
+
+/ {
+	compatible = "loongson,loongson3-8core-780e";
+};
+
+&package0 {
+	htpic: interrupt-controller@1efdfb000080 {
+		compatible = "loongson,htpic-1.0";
+		reg = <0x1efd 0xfb000080 0x40>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		interrupt-parent = <&iointc>;
+		interrupts = <24 IRQ_TYPE_LEVEL_HIGH>,
+				<25 IRQ_TYPE_LEVEL_HIGH>,
+				<26 IRQ_TYPE_LEVEL_HIGH>,
+				<27 IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
diff --git a/arch/mips/boot/dts/loongson/rs780e-pch.dtsi b/arch/mips/boot/dts/loongson/rs780e-pch.dtsi
new file mode 100644
index 000000000000..45c54d555fa4
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/rs780e-pch.dtsi
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/ {
+	bus@10000000 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0 0x10000000 0 0x10000000 0 0x10000000
+				0 0x40000000 0 0x40000000 0 0x40000000
+				0xfd 0xfe000000 0xfd 0xfe000000  0 0x2000000 /* PCI Config Space */>;
+
+		isa {
+			compatible = "isa";
+			#address-cells = <2>;
+			#size-cells = <1>;
+			ranges = <1 0 0 0 0x1000>;
+
+			rtc0: rtc@70 {
+				compatible = "motorola,mc146818";
+				reg = <1 0x70 0x8>;
+				interrupts = <8>;
+				interrupt-parent = <&htpic>;
+			};
+		};
+	};
+};
diff --git a/arch/mips/include/asm/mach-loongson64/irq.h b/arch/mips/include/asm/mach-loongson64/irq.h
index 12208119aac0..20e3d4e67788 100644
--- a/arch/mips/include/asm/mach-loongson64/irq.h
+++ b/arch/mips/include/asm/mach-loongson64/irq.h
@@ -4,8 +4,9 @@
 
 #include <boot_param.h>
 
+#define NR_IRQS 512
 /* cpu core interrupt numbers */
-#define MIPS_CPU_IRQ_BASE 56
+#define MIPS_CPU_IRQ_BASE 16
 
 #include_next <irq.h>
 #endif /* __ASM_MACH_LOONGSON64_IRQ_H_ */
-- 
2.24.1

