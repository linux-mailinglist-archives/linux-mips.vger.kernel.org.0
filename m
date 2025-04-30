Return-Path: <linux-mips+bounces-8881-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3BAAA4D9F
	for <lists+linux-mips@lfdr.de>; Wed, 30 Apr 2025 15:35:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A9D64C68B7
	for <lists+linux-mips@lfdr.de>; Wed, 30 Apr 2025 13:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FB9825D8F8;
	Wed, 30 Apr 2025 13:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="G8Kc8hcy"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E4D25D55C;
	Wed, 30 Apr 2025 13:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746020105; cv=none; b=DbkeV7uEveoHvykS1f5gUT0Onr0guRrZW40TNZYGBpdTJcDGB/QMhzGHTlgSzDisv3sHPON35MtTswBGAOTcaaf1aQbzCZx9ItsmCksXeAZIhO+6PA5MZHZC3ZC5YiQzYNyv5vG7rUfSdyz0EOANkl25mWmUUWHDI395rZVeCRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746020105; c=relaxed/simple;
	bh=oX+Ztd25v66Sb5REJQd42xqs/ojNkFh/oLIAFsDAtw0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Cf67HA5Ocfklcxj7yL2hy4pGABf/dFCXVmd9vZRzFJpSNr+dHAT8sh7fK9AX7ntVR5FKfW3Ockragp84d5dcwFIF9ALaULKPOkD8qc3JWk99LiwFMofTQbLQILHVNHLJCwyTe0q0KyXzgaVt7OGK5DGwkTMV3flG8oGXNkXGLY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=G8Kc8hcy; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7AF2490EC6;
	Wed, 30 Apr 2025 15:34:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1746020098; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=YUv2jrm/2nVKMFeBecycu6Y/zhH0/c7aL9vxZ/qJMkw=;
	b=G8Kc8hcyd5GdtdaCifB3QF6pGWpG00Uibt3vBlMn0JacQLEObVTSaqpouJxYzbqEtr6ZIu
	Zb/5/tbqPgvRB6xLjwSZ61h8eUr3OW8Nyg2dSUj1ubJhXUvy9Np0bHRO0t+kUwM1kU9fLw
	hlo1IUyrNB6cbgllmLFq3dRmkeODzIlRpJwgWBdcgiYFtGsWv2ng3TrjFqfjH4gbwzjpyK
	4KUxviti6NlmZF4TaIjMkzrPK+KTSvTQ8+yXLunBnRS499SSA7QLXOa7y6oCr+zIa6snxP
	3rYHt5YdEopeeXLYxff1XubCeBcCjVSf81bHLwxn2WSKLOxYzppqtrXyqds6ig==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: tglx@linutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	daniel.lezcano@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benjamin.larsson@genexis.eu,
	linux-mediatek@lists.infradead.org,
	cjd@cjdns.fr
Subject: [PATCH v4 6/7] mips: dts: Add EcoNet DTS with EN751221 and SmartFiber XP8421-B board
Date: Wed, 30 Apr 2025 13:34:32 +0000
Message-Id: <20250430133433.22222-7-cjd@cjdns.fr>
In-Reply-To: <20250430133433.22222-1-cjd@cjdns.fr>
References: <20250430133433.22222-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add DTS files in support of EcoNet platform, including SmartFiber XP8421-B,
a low cost commercially available board based on EN751221.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 arch/mips/boot/dts/Makefile                   |  1 +
 arch/mips/boot/dts/econet/Makefile            |  2 +
 arch/mips/boot/dts/econet/en751221.dtsi       | 67 +++++++++++++++++++
 .../econet/en751221_smartfiber_xp8421-b.dts   | 19 ++++++
 arch/mips/econet/Kconfig                      | 11 +++
 5 files changed, 100 insertions(+)
 create mode 100644 arch/mips/boot/dts/econet/Makefile
 create mode 100644 arch/mips/boot/dts/econet/en751221.dtsi
 create mode 100644 arch/mips/boot/dts/econet/en751221_smartfiber_xp8421-b.dts

diff --git a/arch/mips/boot/dts/Makefile b/arch/mips/boot/dts/Makefile
index ff468439a8c4..7375c6ced82b 100644
--- a/arch/mips/boot/dts/Makefile
+++ b/arch/mips/boot/dts/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 subdir-$(CONFIG_BMIPS_GENERIC)		+= brcm
 subdir-$(CONFIG_CAVIUM_OCTEON_SOC)	+= cavium-octeon
+subdir-$(CONFIG_ECONET)			+= econet
 subdir-$(CONFIG_EYEQ)			+= mobileye
 subdir-$(CONFIG_FIT_IMAGE_FDT_MARDUK)   += img
 subdir-$(CONFIG_FIT_IMAGE_FDT_BOSTON)	+= img
diff --git a/arch/mips/boot/dts/econet/Makefile b/arch/mips/boot/dts/econet/Makefile
new file mode 100644
index 000000000000..b467d5624e39
--- /dev/null
+++ b/arch/mips/boot/dts/econet/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_DTB_ECONET_SMARTFIBER_XP8421_B)	+= en751221_smartfiber_xp8421-b.dtb
diff --git a/arch/mips/boot/dts/econet/en751221.dtsi b/arch/mips/boot/dts/econet/en751221.dtsi
new file mode 100644
index 000000000000..66197e73d4f0
--- /dev/null
+++ b/arch/mips/boot/dts/econet/en751221.dtsi
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/dts-v1/;
+
+/ {
+	compatible = "econet,en751221";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	hpt_clock: clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <200000000>;  /* 200 MHz */
+	};
+
+	cpus: cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "mips,mips24KEc";
+			reg = <0>;
+		};
+	};
+
+	cpuintc: interrupt-controller {
+		compatible = "mti,cpu-interrupt-controller";
+		interrupt-controller;
+		#address-cells = <0>;
+		#interrupt-cells = <1>;
+	};
+
+	intc: interrupt-controller@1fb40000 {
+		compatible = "econet,en751221-intc";
+		reg = <0x1fb40000 0x100>;
+		interrupt-parent = <&cpuintc>;
+		interrupts = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <1>;
+		econet,shadow-interrupts = <7 2>, <8 3>, <13 12>, <30 29>;
+	};
+
+	uart: serial@1fbf0000 {
+		compatible = "ns16550";
+		reg = <0x1fbf0000 0x30>;
+		reg-io-width = <4>;
+		reg-shift = <2>;
+		interrupt-parent = <&intc>;
+		interrupts = <0>;
+		/*
+		 * Conversion of baud rate to clock frequency requires a
+		 * computation that is not in the ns16550 driver, so this
+		 * uart is fixed at 115200 baud.
+		 */
+		clock-frequency = <1843200>;
+	};
+
+	timer_hpt: timer@1fbf0400 {
+		compatible = "econet,en751221-timer";
+		reg = <0x1fbf0400 0x100>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <30>;
+		clocks = <&hpt_clock>;
+	};
+};
diff --git a/arch/mips/boot/dts/econet/en751221_smartfiber_xp8421-b.dts b/arch/mips/boot/dts/econet/en751221_smartfiber_xp8421-b.dts
new file mode 100644
index 000000000000..8223c5bce67f
--- /dev/null
+++ b/arch/mips/boot/dts/econet/en751221_smartfiber_xp8421-b.dts
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/dts-v1/;
+
+#include "en751221.dtsi"
+
+/ {
+	model = "SmartFiber XP8421-B";
+	compatible = "smartfiber,xp8421-b", "econet,en751221";
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x00000000 0x1c000000>;
+	};
+
+	chosen {
+		stdout-path = "/serial@1fbf0000:115200";
+		linux,usable-memory-range = <0x00020000 0x1bfe0000>;
+	};
+};
diff --git a/arch/mips/econet/Kconfig b/arch/mips/econet/Kconfig
index d03f90f3daa4..fd69884cc9a8 100644
--- a/arch/mips/econet/Kconfig
+++ b/arch/mips/econet/Kconfig
@@ -32,6 +32,17 @@ choice
 
 	config DTB_ECONET_NONE
 		bool "None"
+
+	config DTB_ECONET_SMARTFIBER_XP8421_B
+		bool "EN751221 SmartFiber XP8421-B"
+		depends on SOC_ECONET_EN751221
+		select BUILTIN_DTB
+		help
+		  The SmartFiber XP8421-B is a device based on the EN751221 SoC.
+		  It has 512MB of memory and 256MB of NAND flash. This kernel
+		  needs only an appended initramfs to boot. It can be loaded
+		  through XMODEM and booted from memory in the bootloader, or
+		  it can be packed in tclinux.trx format and written to flash.
 endchoice
 
 endif
-- 
2.39.5


