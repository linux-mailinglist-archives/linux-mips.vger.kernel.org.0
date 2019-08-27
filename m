Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 677FD9E354
	for <lists+linux-mips@lfdr.de>; Tue, 27 Aug 2019 10:55:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727219AbfH0IzR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 27 Aug 2019 04:55:17 -0400
Received: from forward102j.mail.yandex.net ([5.45.198.243]:52428 "EHLO
        forward102j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725912AbfH0IzR (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 27 Aug 2019 04:55:17 -0400
Received: from mxback17o.mail.yandex.net (mxback17o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::68])
        by forward102j.mail.yandex.net (Yandex) with ESMTP id 017FCF2199C;
        Tue, 27 Aug 2019 11:55:09 +0300 (MSK)
Received: from smtp1p.mail.yandex.net (smtp1p.mail.yandex.net [2a02:6b8:0:1472:2741:0:8b6:6])
        by mxback17o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id yY6L4p7kYF-t8P0nJpJ;
        Tue, 27 Aug 2019 11:55:08 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; s=mail; t=1566896108;
        bh=owisGGSSSLuAIaTLqmdEsfbg56svw6meWRNkz/o/U7U=;
        h=In-Reply-To:Subject:To:From:Cc:References:Date:Message-Id;
        b=gynwRJy5sUPZRXbhhyJZPMH+jakf54awphvNB9p/l75CiF3HD6NTTr+ypUQzjIAkR
         aiXWaie8ngizQ8+7jPIw1MHMvWFWth5xEfoykbzJ6uv/f6ZuJyqUwAHybsg+eUjftm
         aVz2VlOgaLTkjqyim568po5IEGgPu1xgW+0YOfuM=
Authentication-Results: mxback17o.mail.yandex.net; dkim=pass header.i=@flygoat.com
Received: by smtp1p.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id JOqUfE8LDO-t1tCmVBW;
        Tue, 27 Aug 2019 11:55:06 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     chenhc@lemote.com, paul.burton@mips.com, tglx@linutronix.de,
        jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.co,
        devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 12/13] MIPS: Loongson64: Add generic dts
Date:   Tue, 27 Aug 2019 16:53:01 +0800
Message-Id: <20190827085302.5197-13-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
References: <20190827085302.5197-1-jiaxun.yang@flygoat.com>
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
 arch/mips/Kconfig                             |   4 +-
 arch/mips/boot/dts/Makefile                   |   1 +
 arch/mips/boot/dts/loongson/Makefile          |   8 +
 arch/mips/boot/dts/loongson/ls3-2nodes.dtsi   |   8 +
 arch/mips/boot/dts/loongson/ls3-4nodes.dtsi   |  15 ++
 arch/mips/boot/dts/loongson/ls3-cpus.dtsi     | 150 ++++++++++++++++++
 arch/mips/boot/dts/loongson/ls3-gs464.dtsi    |  18 +++
 arch/mips/boot/dts/loongson/ls3-gs464e.dtsi   |  18 +++
 .../boot/dts/loongson/ls3-rs780e-pch.dtsi     |  35 ++++
 arch/mips/boot/dts/loongson/ls3a-package.dtsi |  59 +++++++
 .../boot/dts/loongson/ls3a1000_780e_1way.dts  |  12 ++
 .../boot/dts/loongson/ls3a1000_780e_2way.dts  |  13 ++
 .../boot/dts/loongson/ls3a1000_780e_4way.dts  |  13 ++
 .../boot/dts/loongson/ls3a2000_780e_1way.dts  |  12 ++
 .../boot/dts/loongson/ls3a2000_780e_2way.dts  |  13 ++
 .../boot/dts/loongson/ls3a2000_780e_4way.dts  |  13 ++
 .../boot/dts/loongson/ls3a3000_780e_1way.dts  |  12 ++
 .../boot/dts/loongson/ls3a3000_780e_2way.dts  |  13 ++
 .../boot/dts/loongson/ls3a3000_780e_4way.dts  |  13 ++
 arch/mips/boot/dts/loongson/ls3b-package.dtsi |  59 +++++++
 .../mips/boot/dts/loongson/ls3b_780e_1way.dts |  13 ++
 .../mips/boot/dts/loongson/ls3b_780e_2way.dts |  13 ++
 22 files changed, 514 insertions(+), 1 deletion(-)
 create mode 100644 arch/mips/boot/dts/loongson/Makefile
 create mode 100644 arch/mips/boot/dts/loongson/ls3-2nodes.dtsi
 create mode 100644 arch/mips/boot/dts/loongson/ls3-4nodes.dtsi
 create mode 100644 arch/mips/boot/dts/loongson/ls3-cpus.dtsi
 create mode 100644 arch/mips/boot/dts/loongson/ls3-gs464.dtsi
 create mode 100644 arch/mips/boot/dts/loongson/ls3-gs464e.dtsi
 create mode 100644 arch/mips/boot/dts/loongson/ls3-rs780e-pch.dtsi
 create mode 100644 arch/mips/boot/dts/loongson/ls3a-package.dtsi
 create mode 100644 arch/mips/boot/dts/loongson/ls3a1000_780e_1way.dts
 create mode 100644 arch/mips/boot/dts/loongson/ls3a1000_780e_2way.dts
 create mode 100644 arch/mips/boot/dts/loongson/ls3a1000_780e_4way.dts
 create mode 100644 arch/mips/boot/dts/loongson/ls3a2000_780e_1way.dts
 create mode 100644 arch/mips/boot/dts/loongson/ls3a2000_780e_2way.dts
 create mode 100644 arch/mips/boot/dts/loongson/ls3a2000_780e_4way.dts
 create mode 100644 arch/mips/boot/dts/loongson/ls3a3000_780e_1way.dts
 create mode 100644 arch/mips/boot/dts/loongson/ls3a3000_780e_2way.dts
 create mode 100644 arch/mips/boot/dts/loongson/ls3a3000_780e_4way.dts
 create mode 100644 arch/mips/boot/dts/loongson/ls3b-package.dtsi
 create mode 100644 arch/mips/boot/dts/loongson/ls3b_780e_1way.dts
 create mode 100644 arch/mips/boot/dts/loongson/ls3b_780e_2way.dts

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 92a2ee773a40..1c27c3a4e036 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -485,6 +485,8 @@ config MACH_LOONGSON64
 	select SYS_SUPPORTS_LITTLE_ENDIAN
 	select ZONE_DMA32
 	select SYS_SUPPORTS_ZBOOT
+	select USE_OF
+	select BUILTIN_DTB
 	help
 	  This enables the support of Loongson-3A/3B/2-series-soc processors
 
@@ -3074,7 +3076,7 @@ endchoice
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
index 000000000000..25dca8a89d5d
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/Makefile
@@ -0,0 +1,8 @@
+# SPDX_License_Identifier: GPL_2.0
+dtb-$(CONFIG_MACH_LOONGSON64)	+= ls3a1000_780e_1way.dtb ls3a1000_780e_2way.dtb ls3a1000_780e_4way.dtb \
+								ls3b_780e_1way.dtb ls3b_780e_2way.dtb \
+								ls3a2000_780e_1way.dtb ls3a2000_780e_2way.dtb ls3a2000_780e_4way.dtb \
+								ls3a3000_780e_1way.dtb ls3a3000_780e_2way.dtb ls3a3000_780e_4way.dtb
+
+
+obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .o, $(dtb-y))
diff --git a/arch/mips/boot/dts/loongson/ls3-2nodes.dtsi b/arch/mips/boot/dts/loongson/ls3-2nodes.dtsi
new file mode 100644
index 000000000000..3103a4f96f68
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/ls3-2nodes.dtsi
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
+
+&cpu4 { status = "okay"; };
+&cpu5 { status = "okay"; };
+&cpu6 { status = "okay"; };
+&cpu7 { status = "okay"; };
+
+&scache1 { status = "okay"; };
diff --git a/arch/mips/boot/dts/loongson/ls3-4nodes.dtsi b/arch/mips/boot/dts/loongson/ls3-4nodes.dtsi
new file mode 100644
index 000000000000..be8cca52c072
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/ls3-4nodes.dtsi
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/include/ "ls3-2nodes.dtsi"
+
+&cpu8 { status = "okay"; };
+&cpu9 { status = "okay"; };
+&cpu10 { status = "okay"; };
+&cpu11 { status = "okay"; };
+&cpu12 { status = "okay"; };
+&cpu13 { status = "okay"; };
+&cpu14 { status = "okay"; };
+&cpu15 { status = "okay"; };
+
+&scache2 { status = "okay"; };
+&scache3 { status = "okay"; };
diff --git a/arch/mips/boot/dts/loongson/ls3-cpus.dtsi b/arch/mips/boot/dts/loongson/ls3-cpus.dtsi
new file mode 100644
index 000000000000..7e4705cd8a7c
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/ls3-cpus.dtsi
@@ -0,0 +1,150 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	/*
+	 * Loongson-3 may have as many as 4 nodes, each node has 4 cores.
+	 * Each core has its own pcache and cores in the same node share scache.
+	 * CPU 0-3 should always exist in all the systems.
+	 */
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			reg = <0x0>;
+			next-level-cache = <&scache0>;
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			reg = <0x1>;
+			next-level-cache = <&scache0>;
+		};
+
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			reg = <0x2>;
+			next-level-cache = <&scache0>;
+		};
+
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			reg = <0x3>;
+			next-level-cache = <&scache0>;
+		};
+
+		cpu4: cpu@4 {
+			status = "disabled";
+			device_type = "cpu";
+			reg = <0x4>;
+			next-level-cache = <&scache1>;
+		};
+
+		cpu5: cpu@5 {
+			status = "disabled";
+			device_type = "cpu";
+			reg = <0x5>;
+			next-level-cache = <&scache1>;
+		};
+
+		cpu6: cpu@6 {
+			status = "disabled";
+			device_type = "cpu";
+			reg = <0x6>;
+			next-level-cache = <&scache1>;
+		};
+
+		cpu7: cpu@7 {
+			status = "disabled";
+			device_type = "cpu";
+			reg = <0x7>;
+			next-level-cache = <&scache1>;
+		};
+
+		cpu8: cpu@8 {
+			status = "disabled";
+			device_type = "cpu";
+			reg = <0x8>;
+			next-level-cache = <&scache2>;
+		};
+
+		cpu9: cpu@9 {
+			status = "disabled";
+			device_type = "cpu";
+			reg = <0x9>;
+			next-level-cache = <&scache2>;
+		};
+
+		cpu10: cpu@a {
+			status = "disabled";
+			device_type = "cpu";
+			reg = <0xa>;
+			next-level-cache = <&scache2>;
+		};
+
+		cpu11: cpu@b {
+			status = "disabled";
+			device_type = "cpu";
+			reg = <0xb>;
+			next-level-cache = <&scache2>;
+		};
+
+		cpu12: cpu@c {
+			status = "disabled";
+			device_type = "cpu";
+			reg = <0xc>;
+			next-level-cache = <&scache3>;
+		};
+
+		cpu13: cpu@d {
+			status = "disabled";
+			device_type = "cpu";
+			reg = <0xd>;
+			next-level-cache = <&scache3>;
+		};
+
+		cpu14: cpu@e {
+			status = "disabled";
+			device_type = "cpu";
+			reg = <0xe>;
+			next-level-cache = <&scache3>;
+		};
+
+		cpu15: cpu@f {
+			status = "disabled";
+			device_type = "cpu";
+			reg = <0xf>;
+			next-level-cache = <&scache3>;
+		};
+
+		scache0: l2-cache0 {
+			compatible = "cache";
+		};
+
+		scache1: l2-cache1 {
+			status = "disabled";
+			compatible = "cache";
+		};
+
+		scache2: l2-cache2 {
+			status = "disabled";
+			compatible = "cache";
+		};
+
+		scache3: l2-cache3 {
+			status = "disabled";
+			compatible = "cache";
+		};
+	};
+	
+	cpuintc: interrupt-controller {
+		#address-cells = <0>;
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		compatible = "mti,cpu-interrupt-controller";
+	};
+};
diff --git a/arch/mips/boot/dts/loongson/ls3-gs464.dtsi b/arch/mips/boot/dts/loongson/ls3-gs464.dtsi
new file mode 100644
index 000000000000..54d7be042150
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/ls3-gs464.dtsi
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0
+
+&cpu0 { compatible = "loongson,gs464"; };
+&cpu1 { compatible = "loongson,gs464"; };
+&cpu2 { compatible = "loongson,gs464"; };
+&cpu3 { compatible = "loongson,gs464"; };
+&cpu4 { compatible = "loongson,gs464"; };
+&cpu5 { compatible = "loongson,gs464"; };
+&cpu6 { compatible = "loongson,gs464"; };
+&cpu7 { compatible = "loongson,gs464"; };
+&cpu8 { compatible = "loongson,gs464"; };
+&cpu9 { compatible = "loongson,gs464"; };
+&cpu10 { compatible = "loongson,gs464"; };
+&cpu11 { compatible = "loongson,gs464"; };
+&cpu12 { compatible = "loongson,gs464"; };
+&cpu13 { compatible = "loongson,gs464"; };
+&cpu14 { compatible = "loongson,gs464"; };
+&cpu15 { compatible = "loongson,gs464"; };
diff --git a/arch/mips/boot/dts/loongson/ls3-gs464e.dtsi b/arch/mips/boot/dts/loongson/ls3-gs464e.dtsi
new file mode 100644
index 000000000000..c5f545ef8d94
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/ls3-gs464e.dtsi
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0
+
+&cpu0 { compatible = "loongson,gs464e"; };
+&cpu1 { compatible = "loongson,gs464e"; };
+&cpu2 { compatible = "loongson,gs464e"; };
+&cpu3 { compatible = "loongson,gs464e"; };
+&cpu4 { compatible = "loongson,gs464e"; };
+&cpu5 { compatible = "loongson,gs464e"; };
+&cpu6 { compatible = "loongson,gs464e"; };
+&cpu7 { compatible = "loongson,gs464e"; };
+&cpu8 { compatible = "loongson,gs464e"; };
+&cpu9 { compatible = "loongson,gs464e"; };
+&cpu10 { compatible = "loongson,gs464e"; };
+&cpu11 { compatible = "loongson,gs464e"; };
+&cpu12 { compatible = "loongson,gs464e"; };
+&cpu13 { compatible = "loongson,gs464e"; };
+&cpu14 { compatible = "loongson,gs464e"; };
+&cpu15 { compatible = "loongson,gs464e"; };
diff --git a/arch/mips/boot/dts/loongson/ls3-rs780e-pch.dtsi b/arch/mips/boot/dts/loongson/ls3-rs780e-pch.dtsi
new file mode 100644
index 000000000000..e971a44efc56
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/ls3-rs780e-pch.dtsi
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
+	    isa {
+		    compatible = "isa";
+		    #address-cells = <2>;
+		    #size-cells = <1>;
+		    ranges = <1 0 0 0 0x1000>;
+
+            i8259: interrupt-controller@20 {
+		        compatible = "intel,i8259";
+		        interrupt-controller;
+		        #interrupt-cells = <1>;
+                plat-poll;
+		        interrupts = <0>, <1>, <2>, <3>, <4>, <5>, <6>, <7>,
+                            <8>, <9>, <10>, <11>, <12>, <13>, <14>, <15>;
+		        interrupt-parent = <&htintc>;
+	        };
+
+		    rtc0: rtc@70 {
+			    compatible = "motorola,mc146818";
+			    reg = <1 0x70 0x8>;
+			    interrupts = <8>;
+			    interrupt-parent = <&i8259>;
+		    };
+	    };
+    };  
+};
diff --git a/arch/mips/boot/dts/loongson/ls3a-package.dtsi b/arch/mips/boot/dts/loongson/ls3a-package.dtsi
new file mode 100644
index 000000000000..23e5c3a6a71e
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/ls3a-package.dtsi
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	package@0 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges = <0 0x1fe00000 0 0x1fe00000 0x100000
+                0 0x3ff00000 0 0x3ff00000 0x100000
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
diff --git a/arch/mips/boot/dts/loongson/ls3a1000_780e_1way.dts b/arch/mips/boot/dts/loongson/ls3a1000_780e_1way.dts
new file mode 100644
index 000000000000..6cf90d032cf6
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/ls3a1000_780e_1way.dts
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/dts-v1/;
+
+#include "ls3-cpus.dtsi"
+#include "ls3-gs464.dtsi"
+#include "ls3a-package.dtsi"
+#include "ls3-rs780e-pch.dtsi"
+
+/ {
+    compatible = "loongson,ls3a1000-780e-1way";
+};
diff --git a/arch/mips/boot/dts/loongson/ls3a1000_780e_2way.dts b/arch/mips/boot/dts/loongson/ls3a1000_780e_2way.dts
new file mode 100644
index 000000000000..cb1325a2bd64
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/ls3a1000_780e_2way.dts
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/dts-v1/;
+
+#include "ls3-cpus.dtsi"
+#include "ls3-gs464.dtsi"
+#include "ls3a-package.dtsi"
+#include "ls3-2nodes.dtsi"
+#include "ls3-rs780e-pch.dtsi"
+
+/ {
+    compatible = "loongson,ls3a1000-780e-2way";
+};
diff --git a/arch/mips/boot/dts/loongson/ls3a1000_780e_4way.dts b/arch/mips/boot/dts/loongson/ls3a1000_780e_4way.dts
new file mode 100644
index 000000000000..e6fa9859fa4f
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/ls3a1000_780e_4way.dts
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/dts-v1/;
+
+#include "ls3-cpus.dtsi"
+#include "ls3-gs464.dtsi"
+#include "ls3a-package.dtsi"
+#include "ls3-4nodes.dtsi"
+#include "ls3-rs780e-pch.dtsi"
+
+/ {
+    compatible = "loongson,ls3a1000-780e-4way";
+};
diff --git a/arch/mips/boot/dts/loongson/ls3a2000_780e_1way.dts b/arch/mips/boot/dts/loongson/ls3a2000_780e_1way.dts
new file mode 100644
index 000000000000..a726f0186355
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/ls3a2000_780e_1way.dts
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/dts-v1/;
+
+#include "ls3-cpus.dtsi"
+#include "ls3-gs464e.dtsi"
+#include "ls3a-package.dtsi"
+#include "ls3-rs780e-pch.dtsi"
+
+/ {
+    compatible = "loongson,ls3a2000-780e-1way";
+};
diff --git a/arch/mips/boot/dts/loongson/ls3a2000_780e_2way.dts b/arch/mips/boot/dts/loongson/ls3a2000_780e_2way.dts
new file mode 100644
index 000000000000..19268b640cae
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/ls3a2000_780e_2way.dts
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/dts-v1/;
+
+#include "ls3-cpus.dtsi"
+#include "ls3-gs464e.dtsi"
+#include "ls3a-package.dtsi"
+#include "ls3-2nodes.dtsi"
+#include "ls3-rs780e-pch.dtsi"
+
+/ {
+    compatible = "loongson,ls3a2000-780e-2way";
+};
diff --git a/arch/mips/boot/dts/loongson/ls3a2000_780e_4way.dts b/arch/mips/boot/dts/loongson/ls3a2000_780e_4way.dts
new file mode 100644
index 000000000000..2b491396225b
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/ls3a2000_780e_4way.dts
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/dts-v1/;
+
+#include "ls3-cpus.dtsi"
+#include "ls3-gs464e.dtsi"
+#include "ls3a-package.dtsi"
+#include "ls3-4nodes.dtsi"
+#include "ls3-rs780e-pch.dtsi"
+
+/ {
+    compatible = "loongson,ls3a2000-780e-4way";
+};
diff --git a/arch/mips/boot/dts/loongson/ls3a3000_780e_1way.dts b/arch/mips/boot/dts/loongson/ls3a3000_780e_1way.dts
new file mode 100644
index 000000000000..628c5d0a7a25
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/ls3a3000_780e_1way.dts
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/dts-v1/;
+
+#include "ls3-cpus.dtsi"
+#include "ls3-gs464e.dtsi"
+#include "ls3a-package.dtsi"
+#include "ls3-rs780e-pch.dtsi"
+
+/ {
+    compatible = "loongson,ls3a3000-780e-1way";
+};
diff --git a/arch/mips/boot/dts/loongson/ls3a3000_780e_2way.dts b/arch/mips/boot/dts/loongson/ls3a3000_780e_2way.dts
new file mode 100644
index 000000000000..1390767ed462
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/ls3a3000_780e_2way.dts
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/dts-v1/;
+
+#include "ls3-cpus.dtsi"
+#include "ls3-gs464e.dtsi"
+#include "ls3a-package.dtsi"
+#include "ls3-2nodes.dtsi"
+#include "ls3-rs780e-pch.dtsi"
+
+/ {
+    compatible = "loongson,ls3a3000-780e-2way";
+};
diff --git a/arch/mips/boot/dts/loongson/ls3a3000_780e_4way.dts b/arch/mips/boot/dts/loongson/ls3a3000_780e_4way.dts
new file mode 100644
index 000000000000..3f94c05e944a
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/ls3a3000_780e_4way.dts
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/dts-v1/;
+
+#include "ls3-cpus.dtsi"
+#include "ls3-gs464e.dtsi"
+#include "ls3a-package.dtsi"
+#include "ls3-4nodes.dtsi"
+#include "ls3-rs780e-pch.dtsi"
+
+/ {
+    compatible = "loongson,ls3a3000-780e-4way";
+};
diff --git a/arch/mips/boot/dts/loongson/ls3b-package.dtsi b/arch/mips/boot/dts/loongson/ls3b-package.dtsi
new file mode 100644
index 000000000000..f7e71cd5ba5b
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/ls3b-package.dtsi
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	package@0 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <1>;
+		ranges = <0 0x1fe00000 0 0x1fe00000 0x100000
+                0 0x3ff00000 0 0x3ff00000 0x100000
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
diff --git a/arch/mips/boot/dts/loongson/ls3b_780e_1way.dts b/arch/mips/boot/dts/loongson/ls3b_780e_1way.dts
new file mode 100644
index 000000000000..9b73e0e49408
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/ls3b_780e_1way.dts
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/dts-v1/;
+
+#include "ls3-cpus.dtsi"
+#include "ls3-gs464.dtsi"
+#include "ls3b-package.dtsi"
+#include "ls3-2nodes.dtsi" /* Yes, ls3b have 2 nodes per way */
+#include "ls3-rs780e-pch.dtsi"
+
+/ {
+    compatible = "loongson,ls3b-780e-1way";
+};
diff --git a/arch/mips/boot/dts/loongson/ls3b_780e_2way.dts b/arch/mips/boot/dts/loongson/ls3b_780e_2way.dts
new file mode 100644
index 000000000000..6090de8a32d3
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/ls3b_780e_2way.dts
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/dts-v1/;
+
+#include "ls3-cpus.dtsi"
+#include "ls3-gs464.dtsi"
+#include "ls3b-package.dtsi"
+#include "ls3-4nodes.dtsi" /* Yes, ls3b have 2 nodes per way */
+#include "ls3-rs780e-pch.dtsi"
+
+/ {
+    compatible = "loongson,ls3b-780e-2way";
+};
-- 
2.22.0

