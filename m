Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2F2832BD90
	for <lists+linux-mips@lfdr.de>; Wed,  3 Mar 2021 23:24:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242613AbhCCQQO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Mar 2021 11:16:14 -0500
Received: from mail.loongson.cn ([114.242.206.163]:47256 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1353415AbhCCG0I (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 3 Mar 2021 01:26:08 -0500
Received: from localhost.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxOdSiKz9gd7ATAA--.25147S3;
        Wed, 03 Mar 2021 14:24:40 +0800 (CST)
From:   Qing Zhang <zhangqing@loongson.cn>
To:     Rob Herring <robh+dt@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xingxing Su <suxingxing@loongson.cn>
Subject: [PATCH v2 1/7] MIPS: Loongson64: DeviceTree for 2K1000
Date:   Wed,  3 Mar 2021 14:24:28 +0800
Message-Id: <20210303062434.22280-2-zhangqing@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210303062434.22280-1-zhangqing@loongson.cn>
References: <20210303062434.22280-1-zhangqing@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxOdSiKz9gd7ATAA--.25147S3
X-Coremail-Antispam: 1UD129KBjvJXoW3WFW5Cw4fGrWUAr1rAry5urg_yoW3Kw45pF
        12kw4DGr48Wr15Cw45JFyqyF1UCa95CF95Ww1DJFW8ArWkK34jvr47tFyrJrn3GrWDXw1I
        qFZY9ry8KF17Jw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUPG14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS
        0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2
        IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0
        Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2
        xKxwCY02Avz4vE14v_GF1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
        x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
        v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
        x2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
        Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIF
        yTuYvjfUjksgUUUUU
X-CM-SenderInfo: x2kd0wptlqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add DeviceTree files for Loongson 2K1000 processor,currently only
supports single-core boot.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Qing Zhang <zhangqing@loongson.cn>
Signed-off-by: Xingxing Su <suxingxing@loongson.cn>
---

v2:
- NO changes

 arch/mips/boot/dts/loongson/Makefile          |   1 +
 .../boot/dts/loongson/loongson64-2k1000.dtsi  | 243 ++++++++++++++++++
 .../dts/loongson/loongson64_2core_2k1000.dts  |  10 +
 .../asm/mach-loongson64/builtin_dtbs.h        |   1 +
 4 files changed, 255 insertions(+)
 create mode 100644 arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
 create mode 100644 arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dts

diff --git a/arch/mips/boot/dts/loongson/Makefile b/arch/mips/boot/dts/loongson/Makefile
index 8fd0efb37423..72267bfda9b4 100644
--- a/arch/mips/boot/dts/loongson/Makefile
+++ b/arch/mips/boot/dts/loongson/Makefile
@@ -1,4 +1,5 @@
 # SPDX_License_Identifier: GPL_2.0
+dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64_2core_2k1000.dtb
 dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64c_4core_ls7a.dtb
 dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64c_4core_rs780e.dtb
 dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64c_8core_rs780e.dtb
diff --git a/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
new file mode 100644
index 000000000000..fd0e99bfe57b
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi
@@ -0,0 +1,243 @@
+// SPDX-License-Identifier: GPL-3.0
+
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	compatible = "loongson,loongson2k1000";
+
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "loongson,gs264";
+			reg = <0x0>;
+			#clock-cells = <1>;
+			clocks = <&cpu_clk>;
+		};
+	};
+
+	memory {
+		compatible = "memory";
+		device_type = "memory";
+		reg = <0x00000000 0x00200000 0x00000000 0x0ee00000>, /* 238 MB at 2 MB */
+			<0x00000000 0x20000000 0x00000000 0x1f000000>, /* 496 MB at 512 MB */
+			<0x00000001 0x10000000 0x00000001 0xb0000000>; /* 6912 MB at 4352MB */
+	};
+
+	cpu_clk: cpu_clk {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <800000000>;
+	};
+
+	cpuintc: interrupt-controller {
+		#address-cells = <0>;
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		compatible = "mti,cpu-interrupt-controller";
+	};
+
+	package0: bus@10000000 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0 0x10000000 0 0x10000000 0 0x10000000 /* ioports */
+			0 0x40000000 0 0x40000000 0 0x40000000
+			0xfe 0x00000000 0xfe 0x00000000 0 0x40000000>;
+
+		liointc0: interrupt-controller@1fe11400 {
+			compatible = "loongson,liointc-2.0";
+			reg = <0 0x1fe11400 0 0x40>,
+				<0 0x1fe11040 0 0x8>,
+				<0 0x1fe11140 0 0x8>;
+			reg-names = "main", "isr0", "isr1";
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			interrupt-parent = <&cpuintc>;
+			interrupts = <2>;
+			interrupt-names = "int0";
+
+			loongson,parent_int_map = <0xffffffff>, /* int0 */
+						<0x00000000>, /* int1 */
+						<0x00000000>, /* int2 */
+						<0x00000000>; /* int3 */
+		};
+
+		liointc1: interrupt-controller@1fe11440 {
+			compatible = "loongson,liointc-2.0";
+			reg = <0 0x1fe11440 0 0x40>,
+				<0 0x1fe11048 0 0x8>,
+				<0 0x1fe11148 0 0x8>;
+			reg-names = "main", "isr0", "isr1";
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			interrupt-parent = <&cpuintc>;
+			interrupts = <3>;
+			interrupt-names = "int1";
+
+			loongson,parent_int_map = <0x00000000>, /* int0 */
+						<0xffffffff>, /* int1 */
+						<0x00000000>, /* int2 */
+						<0x00000000>; /* int3 */
+		};
+
+		uart0: serial@1fe00000 {
+			compatible = "ns16550a";
+			reg = <0 0x1fe00000 0 0x8>;
+			clock-frequency = <125000000>;
+			interrupt-parent = <&liointc0>;
+			interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+			no-loopback-test;
+		};
+
+		pci@1a000000 {
+			compatible = "loongson,ls2k-pci";
+			device_type = "pci";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <2>;
+
+			reg = <0 0x1a000000 0 0x02000000>,
+				<0xfe 0x00000000 0 0x20000000>;
+
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x18000000  0x0 0x00010000>,
+				 <0x02000000 0x0 0x40000000 0x0 0x40000000  0x0 0x40000000>;
+
+			ehci@4,1 {
+				compatible = "pci0014,7a14.0",
+						   "pci0014,7a14",
+						   "pciclass0c0320",
+						   "pciclass0c03";
+
+				reg = <0x2100 0x0 0x0 0x0 0x0>;
+				interrupts = <18 IRQ_TYPE_LEVEL_LOW>;
+				interrupt-parent = <&liointc1>;
+			};
+
+			ehci@4,2 {
+				compatible = "pci0014,7a24.0",
+						   "pci0014,7a24",
+						   "pciclass0c0310",
+						   "pciclass0c03";
+
+				reg = <0x2200 0x0 0x0 0x0 0x0>;
+				interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
+				interrupt-parent = <&liointc1>;
+			};
+
+			sata@8,0 {
+				compatible = "pci0014,7a08.0",
+						   "pci0014,7a08",
+						   "pciclass010601",
+						   "pciclass0106";
+
+				reg = <0x4000 0x0 0x0 0x0 0x0>;
+				interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
+				interrupt-parent = <&liointc0>;
+			};
+
+			pci_bridge@9,0 {
+				compatible = "pci0014,7a19.0",
+						   "pci0014,7a19",
+						   "pciclass060400",
+						   "pciclass0604";
+
+				reg = <0x4800 0x0 0x0 0x0 0x0>;
+				#interrupt-cells = <1>;
+				interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+				interrupt-parent = <&liointc1>;
+				interrupt-map-mask = <0 0 0 0>;
+				interrupt-map = <0 0 0 0 &liointc1 0 IRQ_TYPE_LEVEL_LOW>;
+				external-facing;
+			};
+
+			pci_bridge@a,0 {
+				compatible = "pci0014,7a19.0",
+						   "pci0014,7a19",
+						   "pciclass060400",
+						   "pciclass0604";
+
+				reg = <0x5000 0x0 0x0 0x0 0x0>;
+				#interrupt-cells = <1>;
+				interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
+				interrupt-parent = <&liointc1>;
+				interrupt-map-mask = <0 0 0 0>;
+				interrupt-map = <0 0 0 0 &liointc1 1 IRQ_TYPE_LEVEL_LOW>;
+				external-facing;
+			};
+
+			pci_bridge@b,0 {
+				compatible = "pci0014,7a19.0",
+						   "pci0014,7a19",
+						   "pciclass060400",
+						   "pciclass0604";
+
+				reg = <0x5800 0x0 0x0 0x0 0x0>;
+				#interrupt-cells = <1>;
+				interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+				interrupt-parent = <&liointc1>;
+				interrupt-map-mask = <0 0 0 0>;
+				interrupt-map = <0 0 0 0 &liointc1 2 IRQ_TYPE_LEVEL_LOW>;
+				external-facing;
+			};
+
+			pci_bridge@c,0 {
+				compatible = "pci0014,7a19.0",
+						   "pci0014,7a19",
+						   "pciclass060400",
+						   "pciclass0604";
+
+				reg = <0x6000 0x0 0x0 0x0 0x0>;
+				#interrupt-cells = <1>;
+				interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+				interrupt-parent = <&liointc1>;
+				interrupt-map-mask = <0 0 0 0>;
+				interrupt-map = <0 0 0 0 &liointc1 3 IRQ_TYPE_LEVEL_LOW>;
+				external-facing;
+			};
+
+			pci_bridge@d,0 {
+				compatible = "pci0014,7a19.0",
+						   "pci0014,7a19",
+						   "pciclass060400",
+						   "pciclass0604";
+
+				reg = <0x6800 0x0 0x0 0x0 0x0>;
+				#interrupt-cells = <1>;
+				interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
+				interrupt-parent = <&liointc1>;
+				interrupt-map-mask = <0 0 0 0>;
+				interrupt-map = <0 0 0 0 &liointc1 4 IRQ_TYPE_LEVEL_LOW>;
+				external-facing;
+			};
+
+			pci_bridge@e,0 {
+				compatible = "pci0014,7a19.0",
+						   "pci0014,7a19",
+						   "pciclass060400",
+						   "pciclass0604";
+
+				reg = <0x7000 0x0 0x0 0x0 0x0>;
+				#interrupt-cells = <1>;
+				interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
+				interrupt-parent = <&liointc1>;
+				interrupt-map-mask = <0 0 0 0>;
+				interrupt-map = <0 0 0 0 &liointc1 5 IRQ_TYPE_LEVEL_LOW>;
+				external-facing;
+			};
+
+		};
+	};
+};
+
diff --git a/arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dts b/arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dts
new file mode 100644
index 000000000000..e31d2ee65cd5
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dts
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/dts-v1/;
+
+#include "loongson64-2k1000.dtsi"
+
+/ {
+	compatible = "loongson,loongson64-2core-2k1000";
+};
+
diff --git a/arch/mips/include/asm/mach-loongson64/builtin_dtbs.h b/arch/mips/include/asm/mach-loongson64/builtin_dtbs.h
index 839410cda621..8be710557bdb 100644
--- a/arch/mips/include/asm/mach-loongson64/builtin_dtbs.h
+++ b/arch/mips/include/asm/mach-loongson64/builtin_dtbs.h
@@ -8,6 +8,7 @@
 #ifndef __ASM_MACH_LOONGSON64_BUILTIN_DTBS_H_
 #define __ASM_MACH_LOONGSON64_BUILTIN_DTBS_H_
 
+extern u32 __dtb_loongson64_2core_2k1000_begin[];
 extern u32 __dtb_loongson64c_4core_ls7a_begin[];
 extern u32 __dtb_loongson64c_4core_rs780e_begin[];
 extern u32 __dtb_loongson64c_8core_rs780e_begin[];
-- 
2.20.1

