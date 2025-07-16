Return-Path: <linux-mips+bounces-9826-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1472B074A6
	for <lists+linux-mips@lfdr.de>; Wed, 16 Jul 2025 13:25:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8DF43A7718
	for <lists+linux-mips@lfdr.de>; Wed, 16 Jul 2025 11:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855ED2F3C18;
	Wed, 16 Jul 2025 11:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cij7O6FS"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BED263C90;
	Wed, 16 Jul 2025 11:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752665139; cv=none; b=nq+1t4KTNsww7OvHKaBIJkAZ90lZ3Xdnzk7l99rQhpJVkIhMvJGSladu0RE0Eyba2YU8UN3JF9adUbtDqKJxKG3R4Lif40X7jakYLxV5hcu0O2vFAxPCCK/w6cl2sXbEr+t1U6Kal6yE6KtfwKTQx4kMiUGobOcT8gDjqKfhScw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752665139; c=relaxed/simple;
	bh=sgNg/eoMDH0AcU4WLY41olq2zGHZNg0xjpCBn9ABAgY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ffBQ3b5FFQmuuewtuRB/bUZhbmnNd0NPPzLWz9kgBKlbfMPFA+RvvQ2lY268tQJnf7AzjOzc4/BgXTiBxF6WevVxkUhgOEYQhsw+0892fd6RFviZD9hm/HuxhbRSqOANsEeIpNvXO+CJlpoIPACXZH7+AZv3KGfrsINquDQJXNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cij7O6FS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 051C9C4CEF8;
	Wed, 16 Jul 2025 11:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752665139;
	bh=sgNg/eoMDH0AcU4WLY41olq2zGHZNg0xjpCBn9ABAgY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cij7O6FSYYLcnXysyph8b9ycEdUi8dsSAD+1YbYLJSgDZTcWuzcIp8CAu2ykMY9QR
	 ALLt/UD4voXjH5IWkodPS5wNFWXeal+H0YVOdAN73vl29WPiHA81CJgZ3lGI3HwS3L
	 rpUpMCv6Vlsxm0nL92oSymXj/ARPoRIbu4mDkfbWgCC2r6esdtKnVOhVNCGGdNC7l9
	 oFvUUfVFsNyHpCzld3ImfbzRb9bqaOhEz6OyM4GfkSAVYZ9Td6OIFxR8SLLlijipeF
	 br2szy8+2tUEjajZW6/CFwY2DIf3mDy5lATHV/rU0xlHeEgag3s0i1mXU9uJGRCQTY
	 psjY3OP/t2sow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB7CBC83F34;
	Wed, 16 Jul 2025 11:25:38 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Date: Wed, 16 Jul 2025 19:25:11 +0800
Subject: [PATCH v3 2/9] MIPS: dts: loongson: Add LS1B-DEMO board
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250716-loongson1-arch-v3-2-d160974d696b@gmail.com>
References: <20250716-loongson1-arch-v3-0-d160974d696b@gmail.com>
In-Reply-To: <20250716-loongson1-arch-v3-0-d160974d696b@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752665136; l=12519;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=5MqJxPmRjh3ik9Nyz+/0iY/ygphCzapZIygNanhDkRI=;
 b=Uz5R7T15aiqnx5jSGYnmTV4t/uHhjUQqOSghKJQvvWdF7sKBrDEHcJTLB7czzXwFV3gNofLZa
 dcWXPfl7vKOAWs1XcWVFx8l8lj7ROOcAQizTq+VAt8W4kYnPJLho4Us
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
Reply-To: keguang.zhang@gmail.com

From: Keguang Zhang <keguang.zhang@gmail.com>

Add a device tree for LS1B-DEMO board, supporting CPU, clock, INTC,
UART, Ethernet, GPIO, USB host, RTC, watchdog, DMA, NAND, and AC97.

Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
---
 MAINTAINERS                                 |   1 +
 arch/mips/boot/dts/Makefile                 |   1 +
 arch/mips/boot/dts/loongson/Makefile        |   2 +
 arch/mips/boot/dts/loongson/loongson1.dtsi  | 136 +++++++++++++++++++
 arch/mips/boot/dts/loongson/loongson1b.dtsi | 198 ++++++++++++++++++++++++++++
 arch/mips/boot/dts/loongson/ls1b-demo.dts   | 125 ++++++++++++++++++
 6 files changed, 463 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c3f7fbd0d67a..0089ebca31cf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16683,6 +16683,7 @@ M:	Keguang Zhang <keguang.zhang@gmail.com>
 L:	linux-mips@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/*/loongson,ls1*.yaml
+F:	arch/mips/boot/dts/loongson/loongson1*
 F:	arch/mips/include/asm/mach-loongson32/
 F:	arch/mips/loongson32/
 F:	drivers/*/*loongson1*
diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
index 7375c6ced82b..6d9dbe945541 100644
--- a/arch/mips/boot/dts/Makefile
+++ b/arch/mips/boot/dts/Makefile
@@ -8,6 +8,7 @@ subdir-$(CONFIG_FIT_IMAGE_FDT_BOSTON)	+= img
 subdir-$(CONFIG_MACH_INGENIC)		+= ingenic
 subdir-$(CONFIG_LANTIQ)			+= lantiq
 subdir-$(CONFIG_MACH_LOONGSON64)	+= loongson
+subdir-$(CONFIG_MACH_LOONGSON32)	+= loongson
 subdir-$(CONFIG_SOC_VCOREIII)		+= mscc
 subdir-$(CONFIG_MIPS_MALTA)		+= mti
 subdir-$(CONFIG_LEGACY_BOARD_SEAD3)	+= mti
diff --git a/arch/mips/boot/dts/loongson/Makefile b/arch/mips/boot/dts/loongson/Makefile
index 5e3ab984d70f..88b87c94c545 100644
--- a/arch/mips/boot/dts/loongson/Makefile
+++ b/arch/mips/boot/dts/loongson/Makefile
@@ -5,3 +5,5 @@ dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64c_4core_rs780e.dtb
 dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64c_8core_rs780e.dtb
 dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64g_4core_ls7a.dtb
 dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64v_4core_virtio.dtb
+
+dtb-$(CONFIG_MACH_LOONGSON32)	+= ls1b-demo.dtb
diff --git a/arch/mips/boot/dts/loongson/loongson1.dtsi b/arch/mips/boot/dts/loongson/loongson1.dtsi
new file mode 100644
index 000000000000..5ba5a5d131ba
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/loongson1.dtsi
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023-2025 Keguang Zhang <keguang.zhang@gmail.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/clock/loongson,ls1x-clk.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	xtal: clock {
+		compatible = "fixed-clock";
+		clock-output-names = "xtal";
+		#clock-cells = <0>;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			reg = <0>;
+			device_type = "cpu";
+			clocks = <&clkc LS1X_CLKID_CPU>;
+			#clock-cells = <1>;
+		};
+	};
+
+	cpu_intc: interrupt-controller {
+		compatible = "mti,cpu-interrupt-controller";
+		interrupt-controller;
+		#interrupt-cells = <1>;
+		#address-cells = <0>;
+	};
+
+	soc: bus@1fd00000 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x1fd00000 0x130000>;
+
+		intc0: interrupt-controller@1040 {
+			compatible = "loongson,ls1x-intc";
+			reg = <0x1040 0x18>;
+			interrupt-controller;
+			interrupt-parent = <&cpu_intc>;
+			interrupts = <2>;
+			#interrupt-cells = <2>;
+		};
+
+		intc1: interrupt-controller@1058 {
+			compatible = "loongson,ls1x-intc";
+			reg = <0x1058 0x18>;
+			interrupt-controller;
+			interrupt-parent = <&cpu_intc>;
+			interrupts = <3>;
+			#interrupt-cells = <2>;
+		};
+
+		intc2: interrupt-controller@1070 {
+			compatible = "loongson,ls1x-intc";
+			reg = <0x1070 0x18>;
+			interrupt-controller;
+			interrupt-parent = <&cpu_intc>;
+			interrupts = <4>;
+			#interrupt-cells = <2>;
+		};
+
+		intc3: interrupt-controller@1088 {
+			compatible = "loongson,ls1x-intc";
+			reg = <0x1088 0x18>;
+			interrupt-controller;
+			interrupt-parent = <&cpu_intc>;
+			interrupts = <5>;
+			#interrupt-cells = <2>;
+		};
+
+		gpio0: gpio@10c0 {
+			compatible = "loongson,ls1x-gpio";
+			reg = <0x10c0 0x4>;
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		gpio1: gpio@10c4 {
+			compatible = "loongson,ls1x-gpio";
+			reg = <0x10c4 0x4>;
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+	};
+
+	apb: bus@1fe40000 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x1fe40000 0xc0000>;
+
+		uart0: serial@0 {
+			compatible = "ns16550a";
+			reg = <0x0 0x8>;
+			clocks = <&clkc LS1X_CLKID_APB>;
+			interrupt-parent = <&intc0>;
+			interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		uart1: serial@4000 {
+			compatible = "ns16550a";
+			reg = <0x4000 0x8>;
+			clocks = <&clkc LS1X_CLKID_APB>;
+			interrupt-parent = <&intc0>;
+			status = "disabled";
+		};
+
+		uart2: serial@8000 {
+			compatible = "ns16550a";
+			reg = <0x8000 0x8>;
+			clocks = <&clkc LS1X_CLKID_APB>;
+			interrupt-parent = <&intc0>;
+			status = "disabled";
+		};
+
+		uart3: serial@c000 {
+			compatible = "ns16550a";
+			reg = <0xc000 0x8>;
+			clocks = <&clkc LS1X_CLKID_APB>;
+			interrupt-parent = <&intc0>;
+			status = "disabled";
+		};
+	};
+};
diff --git a/arch/mips/boot/dts/loongson/loongson1b.dtsi b/arch/mips/boot/dts/loongson/loongson1b.dtsi
new file mode 100644
index 000000000000..776d272b0f43
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/loongson1b.dtsi
@@ -0,0 +1,198 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023-2025 Keguang Zhang <keguang.zhang@gmail.com>
+ */
+
+/dts-v1/;
+#include "loongson1.dtsi"
+
+/ {
+	cpu_opp_table: opp-table {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-44000000 {
+			opp-hz = /bits/ 64 <44000000>;
+		};
+		opp-47142000 {
+			opp-hz = /bits/ 64 <47142000>;
+		};
+		opp-50769000 {
+			opp-hz = /bits/ 64 <50769000>;
+		};
+		opp-55000000 {
+			opp-hz = /bits/ 64 <55000000>;
+		};
+		opp-60000000 {
+			opp-hz = /bits/ 64 <60000000>;
+		};
+		opp-66000000 {
+			opp-hz = /bits/ 64 <66000000>;
+		};
+		opp-73333000 {
+			opp-hz = /bits/ 64 <73333000>;
+		};
+		opp-82500000 {
+			opp-hz = /bits/ 64 <82500000>;
+		};
+		opp-94285000 {
+			opp-hz = /bits/ 64 <94285000>;
+		};
+		opp-110000000 {
+			opp-hz = /bits/ 64 <110000000>;
+		};
+		opp-132000000 {
+			opp-hz = /bits/ 64 <132000000>;
+		};
+		opp-165000000 {
+			opp-hz = /bits/ 64 <165000000>;
+		};
+		opp-220000000 {
+			opp-hz = /bits/ 64 <220000000>;
+		};
+	};
+
+	clkc: clock-controller@1fe78030 {
+		compatible = "loongson,ls1b-clk";
+		reg = <0x1fe78030 0x8>;
+		clocks = <&xtal>;
+		#clock-cells = <1>;
+	};
+};
+
+&soc {
+	syscon: syscon@420 {
+		compatible = "loongson,ls1b-syscon", "syscon";
+		reg = <0x420 0x8>;
+	};
+
+	dma: dma-controller@1160 {
+		compatible = "loongson,ls1b-apbdma";
+		reg = <0x1160 0x4>;
+		interrupt-parent = <&intc0>;
+		interrupts = <13 IRQ_TYPE_EDGE_RISING>,
+			     <14 IRQ_TYPE_EDGE_RISING>,
+			     <15 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "ch0", "ch1", "ch2";
+		#dma-cells = <1>;
+	};
+
+	ehci: usb@100000 {
+		compatible = "generic-ehci";
+		reg = <0x100000 0x100>;
+		interrupt-parent = <&intc1>;
+		interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+		status = "disabled";
+	};
+
+	ohci: usb@108000 {
+		compatible = "generic-ohci";
+		reg = <0x108000 0x100>;
+		interrupt-parent = <&intc1>;
+		interrupts = <1 IRQ_TYPE_LEVEL_HIGH>;
+		status = "disabled";
+	};
+
+	gmac0: ethernet@110000 {
+		compatible = "loongson,ls1b-gmac", "snps,dwmac-3.50a";
+		reg = <0x110000 0x10000>;
+		clocks = <&clkc LS1X_CLKID_AHB>;
+		clock-names = "stmmaceth";
+		interrupt-parent = <&intc1>;
+		interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "macirq";
+		loongson,ls1-syscon = <&syscon>;
+		snps,pbl = <1>;
+		status = "disabled";
+	};
+
+	gmac1: ethernet@120000 {
+		compatible = "loongson,ls1b-gmac", "snps,dwmac-3.50a";
+		reg = <0x120000 0x10000>;
+		clocks = <&clkc LS1X_CLKID_AHB>;
+		clock-names = "stmmaceth";
+		interrupt-parent = <&intc1>;
+		interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "macirq";
+		loongson,ls1-syscon = <&syscon>;
+		snps,pbl = <1>;
+		status = "disabled";
+	};
+};
+
+&apb {
+	clocksource: timer@1c030 {
+		compatible = "loongson,ls1b-pwmtimer";
+		reg = <0x1c030 0x10>;
+		clocks = <&clkc LS1X_CLKID_APB>;
+		interrupt-parent = <&intc0>;
+		interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	watchdog: watchdog@1c060 {
+		compatible = "loongson,ls1b-wdt";
+		reg = <0x1c060 0xc>;
+		clocks = <&clkc LS1X_CLKID_APB>;
+		status = "disabled";
+	};
+
+	rtc: rtc@24000 {
+		compatible = "loongson,ls1b-rtc";
+		reg = <0x24000 0x78>;
+		interrupt-parent = <&intc0>;
+		interrupts = <24 IRQ_TYPE_LEVEL_HIGH>;
+		status = "disabled";
+	};
+
+	ac97: audio-controller@34000 {
+		compatible = "loongson,ls1b-ac97";
+		reg = <0x34000 0x60>, <0x32420 0x4>, <0x34c4c 0x4>;
+		reg-names = "ac97", "audio-tx", "audio-rx";
+		dmas = <&dma 1>, <&dma 2>;
+		dma-names = "tx", "rx";
+		#sound-dai-cells = <0>;
+		status = "disabled";
+	};
+
+	nand: nand-controller@38000 {
+		compatible = "loongson,ls1b-nand-controller";
+		reg = <0x38000 0x24>, <0x38040 0x4>;
+		reg-names = "nand", "nand-dma";
+		dmas = <&dma 0>;
+		dma-names = "rxtx";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+
+		nand@0 {
+			reg = <0>;
+			label = "ls1x-nand";
+			nand-use-soft-ecc-engine;
+			nand-ecc-algo = "hamming";
+		};
+	};
+};
+
+&cpu0 {
+	operating-points-v2 = <&cpu_opp_table>;
+};
+
+&gpio0 {
+	ngpios = <31>;
+};
+
+&gpio1 {
+	ngpios = <30>;
+};
+
+&uart1 {
+	interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&uart2 {
+	interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&uart3 {
+	interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+};
diff --git a/arch/mips/boot/dts/loongson/ls1b-demo.dts b/arch/mips/boot/dts/loongson/ls1b-demo.dts
new file mode 100644
index 000000000000..13f8b102e100
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/ls1b-demo.dts
@@ -0,0 +1,125 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023-2025 Keguang Zhang <keguang.zhang@gmail.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+#include "loongson1b.dtsi"
+
+/ {
+	compatible = "loongson,ls1b-demo", "loongson,ls1b";
+	model = "LS1B-DEMO Board";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x10000000>;
+	};
+
+	aliases {
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
+		gpio0 = &gpio0;
+		gpio1 = &gpio1;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:38400n8";
+	};
+
+	codec: audio-codec {
+		compatible = "realtek,alc203";
+		#sound-dai-cells = <0>;
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "ls1b-alc203";
+		simple-audio-card,format = "ac97";
+		simple-audio-card,widgets =
+			"Speaker", "Line Out Jack",
+			"Headphone", "Headphone Jack",
+			"Microphone", "Microphone Jack";
+		simple-audio-card,routing =
+			"Line Out Jack", "TX",
+			"Headphone Jack", "TX",
+			"RX", "Microphone Jack";
+
+		simple-audio-card,cpu {
+			sound-dai = <&ac97>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&codec>;
+		};
+	};
+};
+
+&xtal {
+	clock-frequency = <33000000>;
+};
+
+&gmac0 {
+	phy-handle = <&phy0>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy0: ethernet-phy@0 {
+			reg = <0x0>;
+		};
+	};
+};
+
+&nand {
+	status = "okay";
+
+	nand@0 {
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "kernel";
+				reg = <0x0 0x1000000>;
+			};
+
+			partition@1000000 {
+				label = "rootfs";
+				reg = <0x1000000 0x7000000>;
+			};
+		};
+	};
+};
+
+&ac97 {
+	status = "okay";
+};
+
+&ehci {
+	status = "okay";
+};
+
+&ohci {
+	status = "okay";
+};
+
+&rtc {
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&watchdog {
+	status = "okay";
+};

-- 
2.43.0



