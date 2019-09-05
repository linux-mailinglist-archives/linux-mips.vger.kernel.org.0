Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2165DAA657
	for <lists+linux-mips@lfdr.de>; Thu,  5 Sep 2019 16:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389551AbfIEOrP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Sep 2019 10:47:15 -0400
Received: from forward102p.mail.yandex.net ([77.88.28.102]:52411 "EHLO
        forward102p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389424AbfIEOrP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 5 Sep 2019 10:47:15 -0400
Received: from mxback21o.mail.yandex.net (mxback21o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::72])
        by forward102p.mail.yandex.net (Yandex) with ESMTP id 52CD11D410D7;
        Thu,  5 Sep 2019 17:47:10 +0300 (MSK)
Received: from smtp2o.mail.yandex.net (smtp2o.mail.yandex.net [2a02:6b8:0:1a2d::26])
        by mxback21o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id GL3nnRFtUJ-lAaOgHgK;
        Thu, 05 Sep 2019 17:47:10 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1567694830;
        bh=/XMdPqFSv/Ey7BZiLDqI1bxotUzCQROUuUJZC4H4+JY=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=XmnBILRranXzYu76hpq2W1xWGgcfD+KJFJ8W2pwuTIPvtG5mFWdJX/26Lr3NhwibT
         NnF+Y+4vnAbRHQujO42cOaa90Rb8fU4NHEZLfyasezkkUYalBLxUqJU1N1dfCTezxk
         a7ngYDI8tcqcjLjEBARJFPEoXvXTCSHODoTv7C5E=
Authentication-Results: mxback21o.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp2o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id zkoybIaMjG-l2xW1tqC;
        Thu, 05 Sep 2019 17:47:08 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 14/19] MIPS: Loongson64: Add generic dts
Date:   Thu,  5 Sep 2019 22:43:11 +0800
Message-Id: <20190905144316.12527-15-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
References: <20190905144316.12527-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add generic device dts for Loongson-3 devices.
They seems identical but will be different later.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig                           |  4 +-
 arch/mips/boot/dts/Makefile                 |  1 +
 arch/mips/boot/dts/loongson/3a-package.dtsi | 69 +++++++++++++++++++++
 arch/mips/boot/dts/loongson/3a1000_780e.dts | 10 +++
 arch/mips/boot/dts/loongson/3a2000_780e.dts | 10 +++
 arch/mips/boot/dts/loongson/3a3000_780e.dts | 10 +++
 arch/mips/boot/dts/loongson/3b-package.dtsi | 69 +++++++++++++++++++++
 arch/mips/boot/dts/loongson/3b1x00_780e.dts | 10 +++
 arch/mips/boot/dts/loongson/Makefile        |  5 ++
 arch/mips/boot/dts/loongson/rs780e-pch.dtsi | 35 +++++++++++
 10 files changed, 222 insertions(+), 1 deletion(-)
 create mode 100644 arch/mips/boot/dts/loongson/3a-package.dtsi
 create mode 100644 arch/mips/boot/dts/loongson/3a1000_780e.dts
 create mode 100644 arch/mips/boot/dts/loongson/3a2000_780e.dts
 create mode 100644 arch/mips/boot/dts/loongson/3a3000_780e.dts
 create mode 100644 arch/mips/boot/dts/loongson/3b-package.dtsi
 create mode 100644 arch/mips/boot/dts/loongson/3b1x00_780e.dts
 create mode 100644 arch/mips/boot/dts/loongson/Makefile
 create mode 100644 arch/mips/boot/dts/loongson/rs780e-pch.dtsi

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index b6bdd96ec74e..5bad9aafcbdf 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -489,6 +489,8 @@ config MACH_LOONGSON64
 	select SYS_SUPPORTS_LITTLE_ENDIAN
 	select ZONE_DMA32
 	select SYS_SUPPORTS_ZBOOT
+	select USE_OF
+	select BUILTIN_DTB
 	help
 	  This enables the support of Loongson-3A/3B/2-series-soc processors
 
@@ -3047,7 +3049,7 @@ endchoice
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
diff --git a/arch/mips/boot/dts/loongson/3a-package.dtsi b/arch/mips/boot/dts/loongson/3a-package.dtsi
new file mode 100644
index 000000000000..739cf43c7310
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/3a-package.dtsi
@@ -0,0 +1,69 @@
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
+	package@0 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges = <0 0x1fe00000 0 0x1fe00000 0x100000
+				0 0x3ff00000 0 0x3ff00000 0x100000
+				0xEFD 0xFB000000 0xEFD 0xFB000000 0x10000000 /* 3A HT Config Space */>;
+
+		iointc: interrupt-controller@3ff01400 {
+			compatible = "loongson,ls3-iointc";
+			reg = <0 0x3ff01400 0x64>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			interrupt-parent = <&cpuintc>;
+			interrupts = <2>;
+			};
+
+		cpu_uart0: serial@1fe001e0 {
+			device_type = "serial";
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
+			device_type = "serial";
+			compatible = "ns16550a";
+			reg = <0 0x1fe001e8 0x8>;
+			clock-frequency = <33000000>;
+			interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&iointc>;
+			no-loopback-test;
+		};
+
+		htintc: interrupt-controller@0xEFDFB000080 {
+			compatible = "loongson,ls3-htintc";
+			reg = <0xEFD 0xFB000080 0x100>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			interrupt-parent = <&iointc>;
+			interrupts = <24 IRQ_TYPE_LEVEL_HIGH>,
+						<25 IRQ_TYPE_LEVEL_HIGH>,
+						<26 IRQ_TYPE_LEVEL_HIGH>,
+						<27 IRQ_TYPE_LEVEL_HIGH>;
+		};
+	};
+};
diff --git a/arch/mips/boot/dts/loongson/3a1000_780e.dts b/arch/mips/boot/dts/loongson/3a1000_780e.dts
new file mode 100644
index 000000000000..dc1afe9410c8
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/3a1000_780e.dts
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/dts-v1/;
+
+#include "3a-package.dtsi"
+#include "rs780e-pch.dtsi"
+
+/ {
+	compatible = "loongson,ls3a1000-780e";
+};
diff --git a/arch/mips/boot/dts/loongson/3a2000_780e.dts b/arch/mips/boot/dts/loongson/3a2000_780e.dts
new file mode 100644
index 000000000000..621e0d3b5fbd
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/3a2000_780e.dts
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/dts-v1/;
+
+#include "3a-package.dtsi"
+#include "rs780e-pch.dtsi"
+
+/ {
+	compatible = "loongson,ls3a2000-780e";
+};
diff --git a/arch/mips/boot/dts/loongson/3a3000_780e.dts b/arch/mips/boot/dts/loongson/3a3000_780e.dts
new file mode 100644
index 000000000000..f170f1c2189d
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/3a3000_780e.dts
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/dts-v1/;
+
+#include "3a-package.dtsi"
+#include "rs780e-pch.dtsi"
+
+/ {
+	compatible = "loongson,ls3a3000-780e";
+};
diff --git a/arch/mips/boot/dts/loongson/3b-package.dtsi b/arch/mips/boot/dts/loongson/3b-package.dtsi
new file mode 100644
index 000000000000..af6e115d33c0
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/3b-package.dtsi
@@ -0,0 +1,69 @@
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
+	package@0 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges = <0 0x1fe00000 0 0x1fe00000 0x100000
+				0 0x3ff00000 0 0x3ff00000 0x100000
+				0x1EFD 0xFB000000 0x1EFD 0xFB000000 0x10000000 /* 3B HT Config Space */>;
+
+		iointc: interrupt-controller@3ff01400 {
+			compatible = "loongson,ls3-iointc";
+			reg = <0 0x3ff01400 0x64>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			interrupt-parent = <&cpuintc>;
+			interrupts = <2>;
+			};
+
+		cpu_uart0: serial@1fe001e0 {
+			device_type = "serial";
+			compatible = "ns16550a";
+			reg = <0 0x1fe001e0 0x8>;
+			clock-frequency = <33000000>;
+			interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&iointc>;
+			no-loopback-test;
+		};
+
+		cpu_uart1: serial@1fe001e8 {
+			status = "disabled";
+			device_type = "serial";
+			compatible = "ns16550a";
+			reg = <0 0x1fe001e8 0x8>;
+			clock-frequency = <33000000>;
+			interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&iointc>;
+			no-loopback-test;
+		};
+
+		htintc: interrupt-controller@0x1EFDFB000080 {
+			compatible = "loongson,ls3-htintc";
+			reg = <0x1EFD 0xFB000080 0x100>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			interrupt-parent = <&iointc>;
+			interrupts = <24 IRQ_TYPE_LEVEL_HIGH>,
+						<25 IRQ_TYPE_LEVEL_HIGH>,
+						<26 IRQ_TYPE_LEVEL_HIGH>,
+						<27 IRQ_TYPE_LEVEL_HIGH>;
+		};
+	};
+};
diff --git a/arch/mips/boot/dts/loongson/3b1x00_780e.dts b/arch/mips/boot/dts/loongson/3b1x00_780e.dts
new file mode 100644
index 000000000000..9b0dff0b1482
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/3b1x00_780e.dts
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/dts-v1/;
+
+#include "3b-package.dtsi"
+#include "rs780e-pch.dtsi"
+
+/ {
+	compatible = "loongson,ls3b-780e";
+};
diff --git a/arch/mips/boot/dts/loongson/Makefile b/arch/mips/boot/dts/loongson/Makefile
new file mode 100644
index 000000000000..a225d84a521e
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/Makefile
@@ -0,0 +1,5 @@
+# SPDX_License_Identifier: GPL_2.0
+dtb-$(CONFIG_MACH_LOONGSON64)	+= 3a1000_780e.dtb 3a2000_780e.dtb 3a3000_780e.dtb 3b1x00_780e.dtb \
+
+
+obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .o, $(dtb-y))
diff --git a/arch/mips/boot/dts/loongson/rs780e-pch.dtsi b/arch/mips/boot/dts/loongson/rs780e-pch.dtsi
new file mode 100644
index 000000000000..915363eafa2f
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/rs780e-pch.dtsi
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/ {
+	pch {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges = <0x000 0x10000000 0x000 0x10000000 0x10000000
+			  0x000 0x40000000 0x000 0x40000000 0x40000000>;
+
+		isa {
+			compatible = "isa";
+			#address-cells = <2>;
+			#size-cells = <1>;
+			ranges = <1 0 0 0 0x1000>;
+
+			i8259: interrupt-controller@20 {
+				compatible = "intel,i8259";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+				plat-poll;
+				interrupts = <0>, <1>, <2>, <3>, <4>, <5>, <6>, <7>,
+							<8>, <9>, <10>, <11>, <12>, <13>, <14>, <15>;
+				interrupt-parent = <&htintc>;
+			};
+
+			rtc0: rtc@70 {
+				compatible = "motorola,mc146818";
+				reg = <1 0x70 0x8>;
+				interrupts = <8>;
+				interrupt-parent = <&i8259>;
+			};
+		};
+	};
+};
-- 
2.22.0

