Return-Path: <linux-mips+bounces-9829-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A28B074A9
	for <lists+linux-mips@lfdr.de>; Wed, 16 Jul 2025 13:25:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 290F13A917F
	for <lists+linux-mips@lfdr.de>; Wed, 16 Jul 2025 11:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A21BC2F3C2F;
	Wed, 16 Jul 2025 11:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q1xC2W68"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E262F2C70;
	Wed, 16 Jul 2025 11:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752665139; cv=none; b=Z5JQ7LPtIbTmmu9MbmRxHeJKJUYTkTxXKQioVM97TNH/lei25fdZU/M6mUZAFAohOwD4mn9qBKVsfGFfMbTEs82+GUV5+8mabDmtFGb2ooRr9rGaB8x/94ZB6K2pXrArmGjGHPFVYk/BmzgvYJcy3i8Zc/aDIexvaJFpiIYOdTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752665139; c=relaxed/simple;
	bh=ANsNYVpqBxtVJsWkCTNCAC/n2kYbPgExmfS6YoFdW2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZlUazx1S6rZhLjMlZdJ+JsqYlOMoKYIvonFNIevmHAbn0W5Hz4V/DMWyzytO1+p6oDv8DgI+zBVkocJiv3TlBSg19vo52zBnmDsJTeYYVUv/FljOTrLyeixbVcH9C7dQFdyha9r+RTd3VE4ArKqeZiyYD/RlcLbBMJEemdIwFU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q1xC2W68; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 20259C4CEFA;
	Wed, 16 Jul 2025 11:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752665139;
	bh=ANsNYVpqBxtVJsWkCTNCAC/n2kYbPgExmfS6YoFdW2A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Q1xC2W685gHQ2LpJ3DrmgLU5YHh8pnRuBn1PPdLF0bFm7uBYz6AI270qAH1jJD669
	 lSTacbicET6lzu94LMPh4QAcf5VBnFj/B+tvSrNZgP7E/S1KHDHDLcbZPhd55cuLnC
	 HdmZVxZCgf0A/HefGCYHiHaWKbQj4/fKRlphHg1j1Y5stsddE85Hjz7OBxB6yUPOMU
	 mSfKqbiFMlgyI4DPeHaWXMCUjuynxc0wecr6OYCpFPOLaqExn4MpJFX9QZ2f1xZP80
	 qs4THQSpn9LEobvmPYKhqczp/a8JvvwvQO72+QuCNJJhVe0Kp69iqEs/LsPqUYbiLS
	 DeiJapKs9r80w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1646FC83F36;
	Wed, 16 Jul 2025 11:25:39 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Date: Wed, 16 Jul 2025 19:25:13 +0800
Subject: [PATCH v3 4/9] MIPS: dts: loongson: Add Smartloong-1C board
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250716-loongson1-arch-v3-4-d160974d696b@gmail.com>
References: <20250716-loongson1-arch-v3-0-d160974d696b@gmail.com>
In-Reply-To: <20250716-loongson1-arch-v3-0-d160974d696b@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752665136; l=6198;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=8k4NI0ImdMzubiiidq5o64B1uZ6t3883T78WhKntQoM=;
 b=9pz1M1MZPhg//wLZGLTgnuvISVqBE2o4ua8T8UsjvfFDXOfjTxD0kBAeu9EStCkKaCQiPaMgk
 qreAQArdxfCApjSBk7zTls+9m4yDKqgFeyuFFe2rRM+AXVAqzvBE+0d
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
Reply-To: keguang.zhang@gmail.com

From: Keguang Zhang <keguang.zhang@gmail.com>

Add a device tree for Smartloong-1C board, supporting CPU, clock, INTC,
UART, Ethernet, GPIO, USB host, RTC, watchdog, DMA, and NAND.

Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
---
 arch/mips/boot/dts/loongson/Makefile          |   1 +
 arch/mips/boot/dts/loongson/loongson1c.dtsi   | 141 ++++++++++++++++++++++++++
 arch/mips/boot/dts/loongson/smartloong-1c.dts | 110 ++++++++++++++++++++
 3 files changed, 252 insertions(+)

diff --git a/arch/mips/boot/dts/loongson/Makefile b/arch/mips/boot/dts/loongson/Makefile
index 1130efa12768..de4570380c3e 100644
--- a/arch/mips/boot/dts/loongson/Makefile
+++ b/arch/mips/boot/dts/loongson/Makefile
@@ -8,3 +8,4 @@ dtb-$(CONFIG_MACH_LOONGSON64)	+= loongson64v_4core_virtio.dtb
 
 dtb-$(CONFIG_MACH_LOONGSON32)	+= ls1b-demo.dtb
 dtb-$(CONFIG_MACH_LOONGSON32)	+= lsgz_1b_dev.dtb
+dtb-$(CONFIG_MACH_LOONGSON32)	+= smartloong-1c.dtb
diff --git a/arch/mips/boot/dts/loongson/loongson1c.dtsi b/arch/mips/boot/dts/loongson/loongson1c.dtsi
new file mode 100644
index 000000000000..5e80c6a657af
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/loongson1c.dtsi
@@ -0,0 +1,141 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023-2025 Keguang Zhang <keguang.zhang@gmail.com>
+ */
+
+/dts-v1/;
+#include "loongson1.dtsi"
+
+/ {
+	clkc: clock-controller@1fe78030 {
+		compatible = "loongson,ls1c-clk";
+		reg = <0x1fe78030 0x8>;
+		clocks = <&xtal>;
+		#clock-cells = <1>;
+	};
+};
+
+&soc {
+	syscon: syscon@420 {
+		compatible = "loongson,ls1c-syscon", "syscon";
+		reg = <0x420 0x8>;
+	};
+
+	intc4: interrupt-controller@10a0 {
+		compatible = "loongson,ls1x-intc";
+		reg = <0x10a0 0x18>;
+		interrupt-controller;
+		interrupt-parent = <&cpu_intc>;
+		interrupts = <6>;
+		#interrupt-cells = <2>;
+	};
+
+	gpio2: gpio@10c8 {
+		compatible = "loongson,ls1x-gpio";
+		reg = <0x10c8 0x4>;
+		gpio-controller;
+		ngpios = <32>;
+		#gpio-cells = <2>;
+	};
+
+	gpio3: gpio@10cc {
+		compatible = "loongson,ls1x-gpio";
+		reg = <0x10cc 0x4>;
+		gpio-controller;
+		ngpios = <32>;
+		#gpio-cells = <2>;
+	};
+
+	dma: dma-controller@1160 {
+		compatible = "loongson,ls1c-apbdma", "loongson,ls1b-apbdma";
+		reg = <0x1160 0x4>;
+		interrupt-parent = <&intc0>;
+		interrupts = <13 IRQ_TYPE_EDGE_RISING>,
+			     <14 IRQ_TYPE_EDGE_RISING>,
+			     <15 IRQ_TYPE_EDGE_RISING>;
+		interrupt-names = "ch0", "ch1", "ch2";
+		#dma-cells = <1>;
+	};
+
+	emac: ethernet@110000 {
+		compatible = "loongson,ls1c-emac", "snps,dwmac-3.50a";
+		reg = <0x110000 0x10000>;
+		clocks = <&clkc LS1X_CLKID_AHB>;
+		clock-names = "stmmaceth";
+		interrupt-parent = <&intc1>;
+		interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "macirq";
+		loongson,ls1-syscon = <&syscon>;
+		snps,pbl = <1>;
+		status = "disabled";
+	};
+
+	ehci: usb@120000 {
+		compatible = "generic-ehci";
+		reg = <0x120000 0x100>;
+		interrupt-parent = <&intc1>;
+		interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+		status = "disabled";
+	};
+
+	ohci: usb@128000 {
+		compatible = "generic-ohci";
+		reg = <0x128000 0x100>;
+		interrupt-parent = <&intc1>;
+		interrupts = <1 IRQ_TYPE_LEVEL_HIGH>;
+		status = "disabled";
+	};
+};
+
+&apb {
+	watchdog: watchdog@1c060 {
+		compatible = "loongson,ls1c-wdt";
+		reg = <0x1c060 0xc>;
+		clocks = <&clkc LS1X_CLKID_APB>;
+		status = "disabled";
+	};
+
+	rtc: rtc@24000 {
+		compatible = "loongson,ls1c-rtc";
+		reg = <0x24000 0x78>;
+		status = "disabled";
+	};
+
+	nand: nand-controller@38000 {
+		compatible = "loongson,ls1c-nand-controller";
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
+&gpio0 {
+	ngpios = <32>;
+};
+
+&gpio1 {
+	ngpios = <32>;
+};
+
+&uart1 {
+	interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&uart2 {
+	interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+};
+
+&uart3 {
+	interrupts = <29 IRQ_TYPE_LEVEL_HIGH>;
+};
diff --git a/arch/mips/boot/dts/loongson/smartloong-1c.dts b/arch/mips/boot/dts/loongson/smartloong-1c.dts
new file mode 100644
index 000000000000..e6c6c2f00c42
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/smartloong-1c.dts
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023-2025 Keguang Zhang <keguang.zhang@gmail.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+#include "loongson1c.dtsi"
+
+/ {
+	compatible = "loongmasses,smartloong-1c", "loongson,ls1c";
+	model = "Smartloong-1C Board";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x4000000>;
+	};
+
+	aliases {
+		gpio0 = &gpio0;
+		gpio1 = &gpio1;
+		gpio2 = &gpio2;
+		gpio3 = &gpio3;
+		serial0 = &uart2;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led0 {
+			label = "led0";
+			gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		led1 {
+			label = "led1";
+			gpios = <&gpio1 21 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "nand-disk";
+		};
+	};
+};
+
+&xtal {
+	clock-frequency = <24000000>;
+};
+
+&emac {
+	phy-handle = <&phy0>;
+	phy-mode = "rmii";
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy0: ethernet-phy@13 {
+			reg = <0x13>;
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
+&uart2 {
+	status = "okay";
+};
+
+&watchdog {
+	status = "okay";
+};

-- 
2.43.0



