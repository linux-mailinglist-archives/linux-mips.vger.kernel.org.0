Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62CC82E7CA2
	for <lists+linux-mips@lfdr.de>; Wed, 30 Dec 2020 22:24:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbgL3VXt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Dec 2020 16:23:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726214AbgL3VXt (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 30 Dec 2020 16:23:49 -0500
Received: from yawp.biot.com (yawp.biot.com [IPv6:2a01:4f8:10a:8e::fce2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C531DC06179E
        for <linux-mips@vger.kernel.org>; Wed, 30 Dec 2020 13:22:47 -0800 (PST)
Received: from debian-spamd by yawp.biot.com with sa-checked (Exim 4.93)
        (envelope-from <bert@biot.com>)
        id 1kuive-00Alx3-0H
        for linux-mips@vger.kernel.org; Wed, 30 Dec 2020 22:22:46 +0100
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on yawp
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.4
Received: from [2a02:578:460c:1:ae1f:6bff:fed1:9ca8] (helo=sumner.biot.com)
        by yawp.biot.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <bert@biot.com>)
        id 1kuiv9-00Alu0-D2; Wed, 30 Dec 2020 22:22:15 +0100
Received: from bert by sumner.biot.com with local (Exim 4.93)
        (envelope-from <bert@biot.com>)
        id 1kuiv8-00AvnV-H0; Wed, 30 Dec 2020 22:22:14 +0100
From:   Bert Vermeulen <bert@biot.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sander Vanheule <sander@svanheule.net>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Bert Vermeulen <bert@biot.com>,
        Birger Koblitz <mail@birger-koblitz.de>,
        John Crispin <john@phrozen.org>
Subject: [PATCH v3 1/4] Add support for Realtek RTL838x/RTL839x switch SoCs
Date:   Wed, 30 Dec 2020 22:22:02 +0100
Message-Id: <20201230212205.2605383-1-bert@biot.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The RTL838x/839x family of SoCs are Realtek switches with an embedded
MIPS core.

* RTL838x - 500MHz 4kce single core - 1Gbit ports and L2 features
* RTL839x - 700MHz 34Kc single core - 1Gbit ports and L2 features

These switches, depending on the exact part number, will have anywhere
between 8 and 50 ports. The MIPS core is wired to a switch cpu port which
has a tagging feature allowing us to make use of the DSA subsystem.
The SoCs are somewhat basic in certain areas, getting better with more
advanced features on newer series.

The switch functionality is MMIO-mapped via a large MFD region.

The SoCs have the following peripherals
* ethernet
* switch
* uart - ns16550a
* spi-flash interface
* gpio
* wdt
* led

The code was derived from various vendor SDKs based on Linux v2.6
kernels.

This patchset allows us to boot RTL838x/RTL839x units with basic support.
Most of the other drivers are already written and functional, and work to
get them upstream is already in progress.

Signed-off-by: Birger Koblitz <mail@birger-koblitz.de>
Signed-off-by: Bert Vermeulen <bert@biot.com>
Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Sander Vanheule <sander@svanheule.net>
---
 .../devicetree/bindings/mips/realtek-rtl.yaml | 24 ++++++
 arch/mips/boot/dts/Makefile                   |  1 +
 arch/mips/boot/dts/realtek/rtl838x.dtsi       | 21 +++++
 arch/mips/boot/dts/realtek/rtl839x.dtsi       | 21 +++++
 arch/mips/boot/dts/realtek/rtl83xx.dtsi       | 83 +++++++++++++++++++
 5 files changed, 150 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/realtek-rtl.yaml
 create mode 100644 arch/mips/boot/dts/realtek/rtl838x.dtsi
 create mode 100644 arch/mips/boot/dts/realtek/rtl839x.dtsi
 create mode 100644 arch/mips/boot/dts/realtek/rtl83xx.dtsi

diff --git a/Documentation/devicetree/bindings/mips/realtek-rtl.yaml b/Documentation/devicetree/bindings/mips/realtek-rtl.yaml
new file mode 100644
index 000000000000..aadff8ce0f49
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/realtek-rtl.yaml
@@ -0,0 +1,24 @@
+# SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mips/realtek-rtl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek RTL83xx/93xx SoC series device tree bindings
+
+maintainers:
+  - Bert Vermeulen <bert@biot.com>
+  - Sander Vanheule <sander@svanheule.net>
+
+properties:
+  $nodename:
+    const: "/"
+  compatible:
+    oneOf:
+      # RTL8382-based boards
+      - items:
+          - enum:
+              - cisco,sg220-26
+          - const: realtek,rtl8382-soc
+
+additionalProperties: true
diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
index 0259238d7a2e..60bd7d2a9ad8 100644
--- a/arch/mips/boot/dts/Makefile
+++ b/arch/mips/boot/dts/Makefile
@@ -14,6 +14,7 @@ subdir-$(CONFIG_FIT_IMAGE_FDT_NI169445)	+= ni
 subdir-$(CONFIG_MACH_PIC32)		+= pic32
 subdir-$(CONFIG_ATH79)			+= qca
 subdir-$(CONFIG_RALINK)			+= ralink
+subdir-$(CONFIG_MACH_REALTEK_RTL)	+= realtek
 subdir-$(CONFIG_FIT_IMAGE_FDT_XILFPGA)	+= xilfpga
 
 obj-$(CONFIG_BUILTIN_DTB)	:= $(addsuffix /, $(subdir-y))
diff --git a/arch/mips/boot/dts/realtek/rtl838x.dtsi b/arch/mips/boot/dts/realtek/rtl838x.dtsi
new file mode 100644
index 000000000000..6cc4ff5c0d19
--- /dev/null
+++ b/arch/mips/boot/dts/realtek/rtl838x.dtsi
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
+
+/ {
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			compatible = "mips,mips4KEc";
+			reg = <0>;
+			clocks = <&baseclk 0>;
+			clock-names = "cpu";
+		};
+	};
+
+	baseclk: baseclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <500000000>;
+	};
+};
diff --git a/arch/mips/boot/dts/realtek/rtl839x.dtsi b/arch/mips/boot/dts/realtek/rtl839x.dtsi
new file mode 100644
index 000000000000..2b5bad8fcf2f
--- /dev/null
+++ b/arch/mips/boot/dts/realtek/rtl839x.dtsi
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
+
+/ {
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			compatible = "mips,mips34Kc";
+			reg = <0>;
+			clocks = <&baseclk 0>;
+			clock-names = "cpu";
+		};
+	};
+
+	baseclk: baseclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <500000000>;
+	};
+};
diff --git a/arch/mips/boot/dts/realtek/rtl83xx.dtsi b/arch/mips/boot/dts/realtek/rtl83xx.dtsi
new file mode 100644
index 000000000000..17fa90002e00
--- /dev/null
+++ b/arch/mips/boot/dts/realtek/rtl83xx.dtsi
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+	};
+
+	cpuintc: cpuintc {
+		compatible = "mti,cpu-interrupt-controller";
+		#address-cells = <0>;
+		#interrupt-cells = <1>;
+		interrupt-controller;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0xb8000000 0x10000>;
+
+		spi: spi@1200 {
+			compatible = "realtek,rtl-spi";
+			reg = <0x1200 0x100>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
+		uart0: uart@2000 {
+			compatible = "ns16550a";
+			reg = <0x2000 0x100>;
+
+			clock-frequency = <200000000>;
+
+			interrupt-parent = <&intc>;
+			interrupts = <31>;
+
+			reg-io-width = <1>;
+			reg-shift = <2>;
+			fifo-size = <1>;
+			no-loopback-test;
+
+			status = "disabled";
+		};
+
+		uart1: uart@2100 {
+			compatible = "ns16550a";
+			reg = <0x2100 0x100>;
+
+			clock-frequency = <200000000>;
+
+			interrupt-parent = <&intc>;
+			interrupts = <30>;
+
+			reg-io-width = <1>;
+			reg-shift = <2>;
+			fifo-size = <1>;
+			no-loopback-test;
+
+			status = "disabled";
+		};
+
+		intc: interrupt-controller@3000 {
+			compatible = "realtek,rtl-intc";
+			#interrupt-cells = <1>;
+			interrupt-controller;
+			reg = <0x3000 0x20>;
+		};
+	};
+
+	switch_bus: switch-bus@bb000000 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0xbb000000 0x10000>;
+	};
+};
-- 
2.25.1

