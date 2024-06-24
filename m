Return-Path: <linux-mips+bounces-3877-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7851913FCF
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2024 03:24:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F57A1F22547
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2024 01:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC4418C05;
	Mon, 24 Jun 2024 01:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="wwS6LGoY"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E46111CAF
	for <linux-mips@vger.kernel.org>; Mon, 24 Jun 2024 01:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719192199; cv=none; b=LY3BBK27xL6ja/ZWKC9zNgLF2JxtW1J1EVzvh71ZY5u7858exq7K/Dr1YGxLlLYFKlX38lO3LwOh906cHnWeCukFz8Jat8gvz0qdX6OdUFXDaXPM4hUWaXizTPDcneh2kJHYshNQjkrvVNmm6+58jOEmWxi8GciE6ojykk9D5dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719192199; c=relaxed/simple;
	bh=pZ3kJvyDsz0CkfpuJLw99tu1PndX3crZKmTmSnWuplk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LQoWBaQxadKQrBS+I3Lg4DU3z4c8nBIGTFq6aKiiMRSVLzYcsmr7nyGq0womtcVrrHrFmECm7gAGWcMi/+1EbIghJsrC1NQhL490xLeHnsElES7nyhqjXEnUNMbdXAixIE9uFifN1wYqq0GNnXw3UcP9PtvqTZFvf8jIEK5qEBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=wwS6LGoY; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 067CA2C09B5;
	Mon, 24 Jun 2024 13:23:10 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1719192190;
	bh=KRRtnGUVLtgTf5B+yn8CVCgPF0u41rVrOBKi+rnH6nk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wwS6LGoYmbLV3jxG4kcOLD0799BtQATXIyq9k4kaJ8R+JLMhRYpG/qoCZ3PwE21UI
	 eL3FJEw1Mxt8Mi4ZNoeFzdVh8eDHeLM+8H6FFiZcAb+oDJkosAKtCkJd3JjxcRVq4X
	 SV8mLIgBX3Jg1HxiF1hl+IFq7DTAWZKd4jqc+XNK+Tw/Kg3hh291Q8AHrxQei4qVqW
	 MwyWTjjS72zZp5oaHEy/mtNMXe1zW4aKEIVHBgsnzL46ejIr/acFcF13C4QNPOyBsJ
	 e+9LeLUBTUIRCnO2yccTj/e+UmwDObd+6JzeT521sBC41tDjqaEVx4HCubOVtFGqzW
	 r+Hlhi95wLf8A==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6678ca7d0008>; Mon, 24 Jun 2024 13:23:09 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 4ECB013EE8E;
	Mon, 24 Jun 2024 13:23:09 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 4ACB9280AE5; Mon, 24 Jun 2024 13:23:09 +1200 (NZST)
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
Subject: [PATCH v2 8/8] mips: dts: realtek: Add RTL9302C board
Date: Mon, 24 Jun 2024 13:23:00 +1200
Message-ID: <20240624012300.1713290-9-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240624012300.1713290-1-chris.packham@alliedtelesis.co.nz>
References: <20240624012300.1713290-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=6678ca7d a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T1WGqf2p2xoA:10 a=FkagyKZCYwirPjr5IuAA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add support for the RTL930x SoC and the RTL9302C reference board.

The RTL930x family of SoCs are Realtek switches with an embedded MIPS
core (800MHz 34Kc). Most of the peripherals are similar to the RTL838x
SoC and can make use of many existing drivers.

Add in full DSA switch support is still a work in progress.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v2:
    - Use specific compatibles instead of rtl930x
    - Remove unnecessary irq flags (interrupt controller is one-cell)
    - Remove earlycon
    - Name clocks as recommended in dt schema

 arch/mips/boot/dts/realtek/Makefile     |  1 +
 arch/mips/boot/dts/realtek/rtl9302c.dts | 73 +++++++++++++++++++++++
 arch/mips/boot/dts/realtek/rtl930x.dtsi | 79 +++++++++++++++++++++++++
 3 files changed, 153 insertions(+)
 create mode 100644 arch/mips/boot/dts/realtek/rtl9302c.dts
 create mode 100644 arch/mips/boot/dts/realtek/rtl930x.dtsi

diff --git a/arch/mips/boot/dts/realtek/Makefile b/arch/mips/boot/dts/rea=
ltek/Makefile
index fba4e93187a6..8b991c6a5d6f 100644
--- a/arch/mips/boot/dts/realtek/Makefile
+++ b/arch/mips/boot/dts/realtek/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-y	+=3D cisco_sg220-26.dtb
+dtb-y	+=3D rtl9302c.dtb
diff --git a/arch/mips/boot/dts/realtek/rtl9302c.dts b/arch/mips/boot/dts=
/realtek/rtl9302c.dts
new file mode 100644
index 000000000000..67adcc472da2
--- /dev/null
+++ b/arch/mips/boot/dts/realtek/rtl9302c.dts
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
+	compatible =3D "realtek,rtl9302c", "realtek,rtl9302-soc";
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
+				label =3D "u-boot";
+				reg =3D <0x0 0xe0000>;
+				read-only;
+			};
+			partition@e0000 {
+				label =3D "u-boot-env";
+				reg =3D <0xe0000 0x10000>;
+			};
+			partition@f0000 {
+				label =3D "u-boot-env2";
+				reg =3D <0xf0000 0x10000>;
+				read-only;
+			};
+			partition@100000 {
+				label =3D "jffs";
+				reg =3D <0x100000 0x100000>;
+			};
+			partition@200000 {
+				label =3D "jffs2";
+				reg =3D <0x200000 0x100000>;
+			};
+			partition@300000 {
+				label =3D "runtime";
+				reg =3D <0x300000 0xe80000>;
+			};
+			partition@1180000 {
+				label =3D "runtime2";
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


