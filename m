Return-Path: <linux-mips+bounces-4237-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 322CA92C9DB
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jul 2024 06:36:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A22891F23564
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jul 2024 04:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E305824AF;
	Wed, 10 Jul 2024 04:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="Jah4YT0p"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AA233986
	for <linux-mips@vger.kernel.org>; Wed, 10 Jul 2024 04:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720586146; cv=none; b=SWFXiJ+w6OYzcgoUB5EzlWtI7P9cqxepCg99rk4ebhBBdE8bYb5Bcpz05bt9GqA2fgxnbpwPMwkXmSD+OZuAa71xY7tIuHa8XEz8geNcDOjDUuO9A2D5Y48V8JwQewy7JrENq/gwj/PAH2DkctQetD1Z0dL34egCXkFaIqsppAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720586146; c=relaxed/simple;
	bh=hRZzGjrt0hquIi3POY55JN8Q3hPxvvZ0ojrAk6LeAVk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bds+aovCcMj2o3A9gCAQca993xEop4d0xuyt6oAvA5nWtDtHo8MF9djZi78YzUxDWdZv2QjU4p7+s6EoiT3q1Uo3fdljRkcwOMdeDEWBur3258Hks2TFLLAn1nmBT/GUM3UH/17fiB1QgG0kpXaXJK1OZkqG3r3Y+YMO0lAtwoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=Jah4YT0p; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 1ED622C0CFC;
	Wed, 10 Jul 2024 16:35:31 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1720586131;
	bh=WTZKQA+YIenNM6vFmAZK99aqBjDZ/vJ4/ScqR97QI0Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Jah4YT0pVpD5yQXRu+xPqS4mwUYlpquaTQjAkRUdLf+FlU6DRMXXQHoHA/I56NJTX
	 MaF2U66CVm91cFAdrC3BDfHQWnZzGD477VLq/VsLm2uCFz/J1sjAYZ/BQl2O4cjkeR
	 Tq4Dti9IB6QEbld7IusCRR8bOmQ8IGwso9ITYEfyKaelutOziyaMHMpXnPZ8x6BfYo
	 4Xq4sj1qhCJnlLeo5tHfB/Y6agVIQpIQLXOfXPi78FgmmX5eTGI5THD72eRmt3b01K
	 lVA/uBJTEjFpaDWjPZm4hOV5PvSBwEUNc8evptVFcwsx3J91oKBVlvD6+Sx+UkXrek
	 XtRNVsW1AsC5Q==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B668e0f92000a>; Wed, 10 Jul 2024 16:35:30 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 2C61013EE8E;
	Wed, 10 Jul 2024 16:35:30 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 2A17A28206C; Wed, 10 Jul 2024 16:35:30 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: tglx@linutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	daniel.lezcano@linaro.org,
	paulburton@kernel.org,
	peterz@infradead.org,
	mail@birger-koblitz.de,
	bert@biot.com,
	john@phrozen.org,
	sander@svanheule.net
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	kabel@kernel.org,
	ericwouds@gmail.com,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v5 10/10] mips: dts: realtek: Add RTL9302C board
Date: Wed, 10 Jul 2024 16:35:24 +1200
Message-ID: <20240710043524.1535151-11-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240710043524.1535151-1-chris.packham@alliedtelesis.co.nz>
References: <20240710043524.1535151-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=668e0f92 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=4kmOji7k6h8A:10 a=FkagyKZCYwirPjr5IuAA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add support for the RTL9302 SoC and the RTL9302C_2xRTL8224_2XGE
reference board.

The RTL930x family of SoCs are Realtek switches with an embedded MIPS
core (800MHz 34Kc). Most of the peripherals are similar to the RTL838x
SoC and can make use of many existing drivers.

Add in full DSA switch support is still a work in progress.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v5:
    - Use same mtd partition names as Realtek reference software
    Changes in v4:
    - None
    Changes in v3:
    - Use full board name
    Changes in v2:
    - Use specific compatibles instead of rtl930x
    - Remove unnecessary irq flags (interrupt controller is one-cell)
    - Remove earlycon
    - Name clocks as recommended in dt schema

 arch/mips/boot/dts/realtek/Makefile           |  1 +
 .../cameo-rtl9302c-2x-rtl8224-2xge.dts        | 73 +++++++++++++++++
 arch/mips/boot/dts/realtek/rtl930x.dtsi       | 79 +++++++++++++++++++
 3 files changed, 153 insertions(+)
 create mode 100644 arch/mips/boot/dts/realtek/cameo-rtl9302c-2x-rtl8224-=
2xge.dts
 create mode 100644 arch/mips/boot/dts/realtek/rtl930x.dtsi

diff --git a/arch/mips/boot/dts/realtek/Makefile b/arch/mips/boot/dts/rea=
ltek/Makefile
index fba4e93187a6..d2709798763f 100644
--- a/arch/mips/boot/dts/realtek/Makefile
+++ b/arch/mips/boot/dts/realtek/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-y	+=3D cisco_sg220-26.dtb
+dtb-y	+=3D cameo-rtl9302c-2x-rtl8224-2xge.dtb
diff --git a/arch/mips/boot/dts/realtek/cameo-rtl9302c-2x-rtl8224-2xge.dt=
s b/arch/mips/boot/dts/realtek/cameo-rtl9302c-2x-rtl8224-2xge.dts
new file mode 100644
index 000000000000..77d2566545f2
--- /dev/null
+++ b/arch/mips/boot/dts/realtek/cameo-rtl9302c-2x-rtl8224-2xge.dts
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/dts-v1/;
+
+#include "rtl930x.dtsi"
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/thermal/thermal.h>
+
+/ {
+	compatible =3D "cameo,rtl9302c-2x-rtl8224-2xge", "realtek,rtl9302-soc";
+	model =3D "RTL9302C Development Board";
+
+	memory@0 {
+		device_type =3D "memory";
+		reg =3D <0x0 0x8000000>;
+	};
+
+	chosen {
+		stdout-path =3D "serial0:115200n8";
+	};
+};
+
+&uart0 {
+	status =3D "okay";
+};
+
+&spi0 {
+	status =3D "okay";
+	flash@0 {
+		compatible =3D "jedec,spi-nor";
+		reg =3D <0>;
+		spi-max-frequency =3D <10000000>;
+
+		partitions {
+			compatible =3D "fixed-partitions";
+			#address-cells =3D <1>;
+			#size-cells =3D <1>;
+
+			partition@0 {
+				label =3D "LOADER";
+				reg =3D <0x0 0xe0000>;
+				read-only;
+			};
+			partition@e0000 {
+				label =3D "BDINFO";
+				reg =3D <0xe0000 0x10000>;
+			};
+			partition@f0000 {
+				label =3D "SYSINFO";
+				reg =3D <0xf0000 0x10000>;
+				read-only;
+			};
+			partition@100000 {
+				label =3D "JFFS2 CFG";
+				reg =3D <0x100000 0x100000>;
+			};
+			partition@200000 {
+				label =3D "JFFS2 LOG";
+				reg =3D <0x200000 0x100000>;
+			};
+			partition@300000 {
+				label =3D "RUNTIME";
+				reg =3D <0x300000 0xe80000>;
+			};
+			partition@1180000 {
+				label =3D "RUNTIME2";
+				reg =3D <0x1180000 0xe80000>;
+			};
+		};
+	};
+};
diff --git a/arch/mips/boot/dts/realtek/rtl930x.dtsi b/arch/mips/boot/dts=
/realtek/rtl930x.dtsi
new file mode 100644
index 000000000000..f271940f82be
--- /dev/null
+++ b/arch/mips/boot/dts/realtek/rtl930x.dtsi
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
+
+#include "rtl83xx.dtsi"
+
+/ {
+	compatible =3D "realtek,rtl9302-soc";
+
+	cpus {
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+
+		cpu@0 {
+			device_type =3D "cpu";
+			compatible =3D "mips,mips34Kc";
+			reg =3D <0>;
+			clocks =3D <&baseclk 0>;
+			clock-names =3D "cpu";
+		};
+	};
+
+	baseclk: clock-800mhz {
+		compatible =3D "fixed-clock";
+		#clock-cells =3D <0>;
+		clock-frequency =3D <800000000>;
+	};
+
+	lx_clk: clock-175mhz {
+		compatible =3D "fixed-clock";
+		#clock-cells =3D <0>;
+		clock-frequency  =3D <175000000>;
+	};
+};
+
+&soc {
+	intc: interrupt-controller@3000 {
+		compatible =3D "realtek,rtl9300-intc", "realtek,rtl-intc";
+		reg =3D <0x3000 0x18>, <0x3018 0x18>;
+		interrupt-controller;
+		#interrupt-cells =3D <1>;
+
+		interrupt-parent =3D <&cpuintc>;
+		interrupts =3D <2>, <3>, <4>, <5>, <6>, <7>;
+	};
+
+	spi0: spi@1200 {
+		compatible =3D "realtek,rtl8380-spi";
+		reg =3D <0x1200 0x100>;
+
+		#address-cells =3D <1>;
+		#size-cells =3D <0>;
+	};
+
+	timer0: timer@3200 {
+		compatible =3D "realtek,rtl9302-timer", "realtek,otto-timer";
+		reg =3D <0x3200 0x10>, <0x3210 0x10>, <0x3220 0x10>,
+		    <0x3230 0x10>, <0x3240 0x10>;
+
+		interrupt-parent =3D <&intc>;
+		interrupts =3D <7>, <8>, <9>, <10>, <11>;
+		clocks =3D <&lx_clk>;
+	};
+};
+
+&uart0 {
+	/delete-property/ clock-frequency;
+	clocks =3D <&lx_clk>;
+
+	interrupt-parent =3D <&intc>;
+	interrupts =3D <30>;
+};
+
+&uart1 {
+	/delete-property/ clock-frequency;
+	clocks =3D <&lx_clk>;
+
+	interrupt-parent =3D <&intc>;
+	interrupts =3D <31>;
+};
+
--=20
2.45.2


