Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D5571E73D4
	for <lists+linux-mips@lfdr.de>; Fri, 29 May 2020 05:45:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388157AbgE2DpK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 May 2020 23:45:10 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:34698 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388037AbgE2DpH (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 May 2020 23:45:07 -0400
Received: from localhost.localdomain (unknown [142.147.94.151])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 64EFC20C78;
        Fri, 29 May 2020 03:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1590723907; bh=2cEIuI6+psD3ss7p0sSGZm8xPOEI0C01ISZixgr8xyE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=F0iBabDWP5/amkyM9Z/quqSbNN7mVwXv7d/c/UpnWMQfNv8wHk+Ogt2EYEENRtLIY
         f8a1hBrrHMCHVOBAhdGIWvcL66nVwBYo589wPjETdzMHDbcW6kRJf1WdTgJy/AI5v0
         +w1O/6YHl9gX0cpHhrQdORJJSmcdo+6flAz+/e7LJ53pxPUJ3b/FBwb4B+2zkuxmvN
         vsTBNGBuW4S9hi99eijEbcjKwunhKqGUezhVsFeqTwsNfcwWlalfWlFU5/Eo21ZiKc
         CSMJR6BObRsEQ5/vj9mYnYCSgqZLrmH/M+WJ+YmPEGn5FxjwKIDgvwWvxfbcQLR94h
         gLHASQonPHl6w==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     maz@kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] MIPS: Loongson64: DeviceTree for LS7A PCH
Date:   Fri, 29 May 2020 11:43:19 +0800
Message-Id: <20200529034338.1137776-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.27.0.rc0
In-Reply-To: <20200529034338.1137776-1-jiaxun.yang@flygoat.com>
References: <20200529034338.1137776-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

DeviceTree for Loongson-3 Quad core + LS7A boards
and Loongson-3 Release 4 + LS7A boards.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/boot/dts/loongson/Makefile          |   5 +-
 .../dts/loongson/loongson3-r4-package.dtsi    |  74 +++++++
 .../dts/loongson/loongson3_4core_ls7a.dts     |  25 +++
 .../boot/dts/loongson/loongson3_r4_ls7a.dts   |  10 +
 arch/mips/boot/dts/loongson/ls7a-pch.dtsi     | 185 ++++++++++++++++++
 .../asm/mach-loongson64/builtin_dtbs.h        |   2 +
 6 files changed, 300 insertions(+), 1 deletion(-)
 create mode 100644 arch/mips/boot/dts/loongson/loongson3-r4-package.dtsi
 create mode 100644 arch/mips/boot/dts/loongson/loongson3_4core_ls7a.dts
 create mode 100644 arch/mips/boot/dts/loongson/loongson3_r4_ls7a.dts
 create mode 100644 arch/mips/boot/dts/loongson/ls7a-pch.dtsi

diff --git a/arch/mips/boot/dts/loongson/Makefile b/arch/mips/boot/dts/loongson/Makefile
index 56d379471262..8f94fcb5d32e 100644
--- a/arch/mips/boot/dts/loongson/Makefile
+++ b/arch/mips/boot/dts/loongson/Makefile
@@ -1,4 +1,7 @@
 # SPDX_License_Identifier: GPL_2.0
-dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson3_4core_rs780e.dtb loongson3_8core_rs780e.dtb
+dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson3_4core_rs780e.dtb
+dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson3_8core_rs780e.dtb
+dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson3_4core_ls7a.dtb
+dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson3_r4_ls7a.dtb
 
 obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .o, $(dtb-y))
diff --git a/arch/mips/boot/dts/loongson/loongson3-r4-package.dtsi b/arch/mips/boot/dts/loongson/loongson3-r4-package.dtsi
new file mode 100644
index 000000000000..e3d33f31e2b6
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/loongson3-r4-package.dtsi
@@ -0,0 +1,74 @@
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
+			0xefd 0xfb000000 0xefd 0xfb000000 0x10000000>;
+
+		liointc: interrupt-controller@3ff01400 {
+			compatible = "loongson,liointc-1.0";
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
+			reg = <0 0x1fe00100 0x10>;
+			clock-frequency = <100000000>;
+			interrupt-parent = <&liointc>;
+			interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
+			no-loopback-test;
+		};
+
+		cpu_uart1: serial@1fe001e8 {
+			status = "disabled";
+			compatible = "ns16550a";
+			reg = <0 0x1fe00110 0x10>;
+			clock-frequency = <100000000>;
+			interrupts = <15 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&liointc>;
+			no-loopback-test;
+		};
+
+		htvec: interrupt-controller@efdfb000080 {
+			compatible = "loongson,htvec-1.0";
+			reg = <0xefd 0xfb000080 0x40>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			interrupt-parent = <&liointc>;
+			interrupts = <24 IRQ_TYPE_LEVEL_HIGH>,
+				     <25 IRQ_TYPE_LEVEL_HIGH>,
+				     <26 IRQ_TYPE_LEVEL_HIGH>,
+				     <27 IRQ_TYPE_LEVEL_HIGH>;
+		};
+	};
+};
diff --git a/arch/mips/boot/dts/loongson/loongson3_4core_ls7a.dts b/arch/mips/boot/dts/loongson/loongson3_4core_ls7a.dts
new file mode 100644
index 000000000000..4eadcf99423d
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/loongson3_4core_ls7a.dts
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/dts-v1/;
+
+#include "loongson3-package.dtsi"
+#include "ls7a-pch.dtsi"
+
+/ {
+	compatible = "loongson,loongson3-4core-ls7a";
+};
+
+&package0 {
+	htvec: interrupt-controller@efdfb000080 {
+		compatible = "loongson,htvec-1.0";
+		reg = <0xefd 0xfb000080 0x40>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		interrupt-parent = <&liointc>;
+		interrupts = <24 IRQ_TYPE_LEVEL_HIGH>,
+				<25 IRQ_TYPE_LEVEL_HIGH>,
+				<26 IRQ_TYPE_LEVEL_HIGH>,
+				<27 IRQ_TYPE_LEVEL_HIGH>;
+	};
+};
diff --git a/arch/mips/boot/dts/loongson/loongson3_r4_ls7a.dts b/arch/mips/boot/dts/loongson/loongson3_r4_ls7a.dts
new file mode 100644
index 000000000000..d171f3a1a0ef
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/loongson3_r4_ls7a.dts
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/dts-v1/;
+
+#include "loongson3-r4-package.dtsi"
+#include "ls7a-pch.dtsi"
+
+/ {
+	compatible = "loongson,loongson3-r4-ls7a";
+};
diff --git a/arch/mips/boot/dts/loongson/ls7a-pch.dtsi b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
new file mode 100644
index 000000000000..9c124601fe4c
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/ls7a-pch.dtsi
@@ -0,0 +1,185 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/ {
+	bus@10000000 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0 0x00000000 0 0x00000000 0 0x00040000 /* PIO */
+				0 0x10000000 0 0x10000000 0 0xf000000 /* CONF & APB */
+				0 0x20000000 0 0x20000000 0 0x10000000
+				0 0x40000000 0 0x40000000 0 0x40000000 /* PCI MEM */
+				0xe00 0x00000000 0xe00 0x00000000 0x100 0x0000000>;
+
+		pic: interrupt-controller@10000000 {
+			compatible = "loongson,pch-pic-1.0";
+			reg = <0 0x10000000 0 0x400>;
+			interrupt-controller;
+			interrupt-parent = <&htvec>;
+			loongson,pic-base-vec = <64>;
+			#interrupt-cells = <2>;
+		};
+
+		pci@1a000000 {
+			compatible = "loongson,ls7a-pci";
+			device_type = "pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <2>;
+			msi-parent = <&msi>;
+
+			reg = <0 0x1a000000 0 0x02000000>,
+				<0xefe 0x00000000 0 0x20000000>;
+
+			ranges = <0x01000000 0x0 0x00020000 0x0 0x00020000 0x0 0x00020000>,
+					<0x02000000 0x0 0x40000000 0x0 0x40000000 0x0 0x40000000>;
+
+			ohci@4,0 {
+				compatible = "pci0014,7a24.0",
+						   "pci0014,7a24",
+						   "pciclass0c0310",
+						   "pciclass0c03";
+
+				reg = <0x2000 0x0 0x0 0x0 0x0>;
+				interrupts = <49 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pic>;
+			};
+
+			ehci@4,1 {
+				compatible = "pci0014,7a14.0",
+						   "pci0014,7a14",
+						   "pciclass0c0320",
+						   "pciclass0c03";
+
+				reg = <0x2100 0x0 0x0 0x0 0x0>;
+				interrupts = <48 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pic>;
+			};
+
+			ohci@5,0 {
+				compatible = "pci0014,7a24.0",
+						   "pci0014,7a24",
+						   "pciclass0c0310",
+						   "pciclass0c03";
+
+				reg = <0x2800 0x0 0x0 0x0 0x0>;
+				interrupts = <51 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pic>;
+			};
+
+			ehci@5,1 {
+				compatible = "pci0014,7a14.0",
+						   "pci0014,7a14",
+						   "pciclass0c0320",
+						   "pciclass0c03";
+
+				reg = <0x2900 0x0 0x0 0x0 0x0>;
+				interrupts = <50 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pic>;
+			};
+
+			sata@8,0 {
+				compatible = "pci0014,7a08.0",
+						   "pci0014,7a08",
+						   "pciclass010601",
+						   "pciclass0106";
+
+				reg = <0x4000 0x0 0x0 0x0 0x0>;
+				interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pic>;
+			};
+
+			sata@8,1 {
+				compatible = "pci0014,7a08.0",
+						   "pci0014,7a08",
+						   "pciclass010601",
+						   "pciclass0106";
+
+				reg = <0x4100 0x0 0x0 0x0 0x0>;
+				interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pic>;
+			};
+
+			sata@8,2 {
+				compatible = "pci0014,7a08.0",
+						   "pci0014,7a08",
+						   "pciclass010601",
+						   "pciclass0106";
+
+				reg = <0x4200 0x0 0x0 0x0 0x0>;
+				interrupts = <18 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pic>;
+			};
+
+			pci_bridge@9,0 {
+				compatible = "pci0014,7a19.0",
+						   "pci0014,7a19",
+						   "pciclass060400",
+						   "pciclass0604";
+
+				reg = <0x4800 0x0 0x0 0x0 0x0>;
+				interrupts = <32 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pic>;
+
+				#interrupt-cells = <1>;
+				interrupt-map-mask = <0 0 0 0>;
+				interrupt-map = <0 0 0 0 &pic 32 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			pci_bridge@b,0 {
+				compatible = "pci0014,7a09.0",
+						   "pci0014,7a09",
+						   "pciclass060400",
+						   "pciclass0604";
+
+				reg = <0x5800 0x0 0x0 0x0 0x0>;
+				interrupts = <34 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pic>;
+
+				#interrupt-cells = <1>;
+				interrupt-map-mask = <0 0 0 0>;
+				interrupt-map = <0 0 0 0 &pic 34 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			pci_bridge@d,0 {
+				compatible = "pci0014,7a19.0",
+						   "pci0014,7a19",
+						   "pciclass060400",
+						   "pciclass0604";
+
+				reg = <0x6800 0x0 0x0 0x0 0x0>;
+				interrupts = <36 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pic>;
+
+				#interrupt-cells = <1>;
+				interrupt-map-mask = <0 0 0 0>;
+				interrupt-map = <0 0 0 0 &pic 36 IRQ_TYPE_LEVEL_HIGH>;
+			};
+
+			pci_bridge@11,0 {
+				compatible = "pci0014,7a29.0",
+						   "pci0014,7a29",
+						   "pciclass060400",
+						   "pciclass0604";
+
+				reg = <0x8800 0x0 0x0 0x0 0x0>;
+				interrupts = <42 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-parent = <&pic>;
+
+				#interrupt-cells = <1>;
+				interrupt-map-mask = <0 0 0 0>;
+				interrupt-map = <0 0 0 0 &pic 42 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		msi: msi-controller@2ff00000 {
+			compatible = "loongson,pch-msi-1.0";
+			reg = <0 0x2ff00000 0 0x8>;
+			interrupt-controller;
+			msi-controller;
+			loongson,msi-base-vec = <0>;
+			loongson,msi-num-vecs = <64>;
+			interrupt-parent = <&htvec>;
+		};
+	};
+};
diff --git a/arch/mips/include/asm/mach-loongson64/builtin_dtbs.h b/arch/mips/include/asm/mach-loongson64/builtin_dtbs.h
index 853c6d80887b..cf563fafc0ea 100644
--- a/arch/mips/include/asm/mach-loongson64/builtin_dtbs.h
+++ b/arch/mips/include/asm/mach-loongson64/builtin_dtbs.h
@@ -10,4 +10,6 @@
 
 extern u32 __dtb_loongson3_4core_rs780e_begin[];
 extern u32 __dtb_loongson3_8core_rs780e_begin[];
+extern u32 __dtb_loongson3_4core_ls7a_begin[];
+extern u32 __dtb_loongson3_r4_ls7a_begin[];
 #endif
-- 
2.27.0.rc0

