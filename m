Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 204A119150E
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2020 16:42:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727216AbgCXPk3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Mar 2020 11:40:29 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17892 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727872AbgCXPk3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 24 Mar 2020 11:40:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585064351;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=eqrTGrEfjHrJZd+3Y2jXuS4MZhGqDiyBbWoWPPQJbs4=;
        b=YWN30i0YC5Ca4xekgCFiFe8i9+eQvQVaoqwWmvi1VxxI6IjYw3ufw829yAmZepUy
        3H4qn9CigqJageIMLr7Um3uP1YMSITJZbru7E4h06P5RnvXJvRR4CwTL9Ryx21cNdCO
        fb++/gSQmY+p7FzOG9uCop/UeKnccMllWCqcUfpc=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1585064348627275.59168232814375; Tue, 24 Mar 2020 23:39:08 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Message-ID: <20200324153624.23109-10-jiaxun.yang@flygoat.com>
Subject: [PATCH v6 09/11] MIPS: Loongson64: Add generic dts
Date:   Tue, 24 Mar 2020 23:36:06 +0800
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200324153624.23109-1-jiaxun.yang@flygoat.com>
References: <20200324153624.23109-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add generic device dts for Loongson-3 devices.
They are currently almost identical but will be different later.
Some PCH devices like PCI Host Bridge is still enabled by platform
code for now.

Co-developed-by: Huacai Chen <chenhc@lemote.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/Kconfig                             |  6 +-
 arch/mips/boot/dts/Makefile                   |  1 +
 arch/mips/boot/dts/loongson/Makefile          |  4 ++
 .../boot/dts/loongson/loongson3-package.dtsi  | 62 +++++++++++++++++++
 .../dts/loongson/loongson3_4core_rs780e.dts   | 25 ++++++++
 .../dts/loongson/loongson3_8core_rs780e.dts   | 25 ++++++++
 arch/mips/boot/dts/loongson/rs780e-pch.dtsi   | 26 ++++++++
 7 files changed, 147 insertions(+), 2 deletions(-)
 create mode 100644 arch/mips/boot/dts/loongson/Makefile
 create mode 100644 arch/mips/boot/dts/loongson/loongson3-package.dtsi
 create mode 100644 arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dts
 create mode 100644 arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dts
 create mode 100644 arch/mips/boot/dts/loongson/rs780e-pch.dtsi

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index ca3045b2a2d9..4a0b2f494d79 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -486,9 +486,11 @@ config MACH_LOONGSON64
 =09select SYS_SUPPORTS_HIGHMEM
 =09select SYS_SUPPORTS_LITTLE_ENDIAN
 =09select SYS_SUPPORTS_ZBOOT
-=09select LOONGSON_MC146818
 =09select ZONE_DMA32
 =09select NUMA
+=09select COMMON_CLK
+=09select USE_OF
+=09select BUILTIN_DTB
 =09help
 =09  This enables the support of Loongson-2/3 family of machines.
=20
@@ -3081,7 +3083,7 @@ endchoice
 choice
 =09prompt "Kernel command line type" if !CMDLINE_OVERRIDE
 =09default MIPS_CMDLINE_FROM_DTB if USE_OF && !ATH79 && !MACH_INGENIC && \
-=09=09=09=09=09 !MIPS_MALTA && \
+=09=09=09=09=09 !MACH_LOONGSON64 && !MIPS_MALTA && \
 =09=09=09=09=09 !CAVIUM_OCTEON_SOC
 =09default MIPS_CMDLINE_FROM_BOOTLOADER
=20
diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
index 1e79cab8e269..d429a69bfe30 100644
--- a/arch/mips/boot/dts/Makefile
+++ b/arch/mips/boot/dts/Makefile
@@ -4,6 +4,7 @@ subdir-y=09+=3D cavium-octeon
 subdir-y=09+=3D img
 subdir-y=09+=3D ingenic
 subdir-y=09+=3D lantiq
+subdir-y=09+=3D loongson
 subdir-y=09+=3D mscc
 subdir-y=09+=3D mti
 subdir-y=09+=3D netlogic
diff --git a/arch/mips/boot/dts/loongson/Makefile b/arch/mips/boot/dts/loon=
gson/Makefile
new file mode 100644
index 000000000000..56d379471262
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/Makefile
@@ -0,0 +1,4 @@
+# SPDX_License_Identifier: GPL_2.0
+dtb-$(CONFIG_MACH_LOONGSON64)=09+=3D loongson3_4core_rs780e.dtb loongson3_=
8core_rs780e.dtb
+
+obj-$(CONFIG_BUILTIN_DTB)=09+=3D $(addsuffix .o, $(dtb-y))
diff --git a/arch/mips/boot/dts/loongson/loongson3-package.dtsi b/arch/mips=
/boot/dts/loongson/loongson3-package.dtsi
new file mode 100644
index 000000000000..d09c313603f1
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/loongson3-package.dtsi
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+=09#address-cells =3D <2>;
+=09#size-cells =3D <2>;
+
+=09cpuintc: interrupt-controller {
+=09=09#address-cells =3D <0>;
+=09=09#interrupt-cells =3D <1>;
+=09=09interrupt-controller;
+=09=09compatible =3D "mti,cpu-interrupt-controller";
+=09};
+
+=09package0: bus@1fe00000 {
+=09=09compatible =3D "simple-bus";
+=09=09#address-cells =3D <2>;
+=09=09#size-cells =3D <1>;
+=09=09ranges =3D <0 0x1fe00000 0 0x1fe00000 0x100000
+=09=09=090 0x3ff00000 0 0x3ff00000 0x100000
+=09=09=090xefd 0xfb000000 0xefd 0xfb000000 0x10000000 /* 3A HT Config Spac=
e */
+=09=09=090x1efd 0xfb000000 0x1efd 0xfb000000 0x10000000 /* 3B HT Config Sp=
ace */>;
+
+=09=09liointc: interrupt-controller@3ff01400 {
+=09=09=09compatible =3D "loongson,liointc-1.0";
+=09=09=09reg =3D <0 0x3ff01400 0x64>;
+
+=09=09=09interrupt-controller;
+=09=09=09#interrupt-cells =3D <2>;
+
+=09=09=09interrupt-parent =3D <&cpuintc>;
+=09=09=09interrupts =3D <2>, <3>;
+=09=09=09interrupt-names =3D "int0", "int1";
+
+=09=09=09loongson,parent_int_map =3D <0xf0ffffff>, /* int0 */
+=09=09=09=09=09=09<0x0f000000>, /* int1 */
+=09=09=09=09=09=09<0x00000000>, /* int2 */
+=09=09=09=09=09=09<0x00000000>; /* int3 */
+
+=09=09};
+
+=09=09cpu_uart0: serial@1fe001e0 {
+=09=09=09compatible =3D "ns16550a";
+=09=09=09reg =3D <0 0x1fe001e0 0x8>;
+=09=09=09clock-frequency =3D <33000000>;
+=09=09=09interrupt-parent =3D <&liointc>;
+=09=09=09interrupts =3D <10 IRQ_TYPE_LEVEL_HIGH>;
+=09=09=09no-loopback-test;
+=09=09};
+
+=09=09cpu_uart1: serial@1fe001e8 {
+=09=09=09status =3D "disabled";
+=09=09=09compatible =3D "ns16550a";
+=09=09=09reg =3D <0 0x1fe001e8 0x8>;
+=09=09=09clock-frequency =3D <33000000>;
+=09=09=09interrupts =3D <10 IRQ_TYPE_LEVEL_HIGH>;
+=09=09=09interrupt-parent =3D <&liointc>;
+=09=09=09no-loopback-test;
+=09=09};
+=09};
+};
diff --git a/arch/mips/boot/dts/loongson/loongson3_4core_rs780e.dts b/arch/=
mips/boot/dts/loongson/loongson3_4core_rs780e.dts
new file mode 100644
index 000000000000..6b5694ca0f95
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
+=09compatible =3D "loongson,loongson3-4core-rs780e";
+};
+
+&package0 {
+=09htpic: interrupt-controller@efdfb000080 {
+=09=09compatible =3D "loongson,htpic-1.0";
+=09=09reg =3D <0xefd 0xfb000080 0x40>;
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <1>;
+
+=09=09interrupt-parent =3D <&liointc>;
+=09=09interrupts =3D <24 IRQ_TYPE_LEVEL_HIGH>,
+=09=09=09=09<25 IRQ_TYPE_LEVEL_HIGH>,
+=09=09=09=09<26 IRQ_TYPE_LEVEL_HIGH>,
+=09=09=09=09<27 IRQ_TYPE_LEVEL_HIGH>;
+=09};
+};
diff --git a/arch/mips/boot/dts/loongson/loongson3_8core_rs780e.dts b/arch/=
mips/boot/dts/loongson/loongson3_8core_rs780e.dts
new file mode 100644
index 000000000000..ffefa2f829b0
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
+=09compatible =3D "loongson,loongson3-8core-rs780e";
+};
+
+&package0 {
+=09htpic: interrupt-controller@1efdfb000080 {
+=09=09compatible =3D "loongson,htpic-1.0";
+=09=09reg =3D <0x1efd 0xfb000080 0x40>;
+=09=09interrupt-controller;
+=09=09#interrupt-cells =3D <1>;
+
+=09=09interrupt-parent =3D <&liointc>;
+=09=09interrupts =3D <24 IRQ_TYPE_LEVEL_HIGH>,
+=09=09=09=09<25 IRQ_TYPE_LEVEL_HIGH>,
+=09=09=09=09<26 IRQ_TYPE_LEVEL_HIGH>,
+=09=09=09=09<27 IRQ_TYPE_LEVEL_HIGH>;
+=09};
+};
diff --git a/arch/mips/boot/dts/loongson/rs780e-pch.dtsi b/arch/mips/boot/d=
ts/loongson/rs780e-pch.dtsi
new file mode 100644
index 000000000000..45c54d555fa4
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/rs780e-pch.dtsi
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/ {
+=09bus@10000000 {
+=09=09compatible =3D "simple-bus";
+=09=09#address-cells =3D <2>;
+=09=09#size-cells =3D <2>;
+=09=09ranges =3D <0 0x10000000 0 0x10000000 0 0x10000000
+=09=09=09=090 0x40000000 0 0x40000000 0 0x40000000
+=09=09=09=090xfd 0xfe000000 0xfd 0xfe000000  0 0x2000000 /* PCI Config Spa=
ce */>;
+
+=09=09isa {
+=09=09=09compatible =3D "isa";
+=09=09=09#address-cells =3D <2>;
+=09=09=09#size-cells =3D <1>;
+=09=09=09ranges =3D <1 0 0 0 0x1000>;
+
+=09=09=09rtc0: rtc@70 {
+=09=09=09=09compatible =3D "motorola,mc146818";
+=09=09=09=09reg =3D <1 0x70 0x8>;
+=09=09=09=09interrupts =3D <8>;
+=09=09=09=09interrupt-parent =3D <&htpic>;
+=09=09=09};
+=09=09};
+=09};
+};
--=20
2.26.0.rc2


