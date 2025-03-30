Return-Path: <linux-mips+bounces-8415-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCFAA75B39
	for <lists+linux-mips@lfdr.de>; Sun, 30 Mar 2025 19:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAD1A3AA196
	for <lists+linux-mips@lfdr.de>; Sun, 30 Mar 2025 17:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FBF71E0E0C;
	Sun, 30 Mar 2025 17:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="PRdHDok8"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976961DFE26;
	Sun, 30 Mar 2025 17:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743354238; cv=none; b=LjhSJ9PG4WNxc6ZIyAcYo607tsOtWJmD9n4FVDgSq4w41u7rrLy7bFkqv2ZVmQonxkfSTw5RSx/fk7PpRqNqkxxbYneamBipEP6ijTF4hLRZYiO2FAGphmji0F45G5Ogoxf1+ObSubnEZiOB+2XvcQiJEGvQdlzO+OBpXdz9CJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743354238; c=relaxed/simple;
	bh=BnyPuU1fA8N7ttrMYYig7rRkfqvLrY1o10550usoT1M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ao1mrgo7DlM3/ZbRWXXfH8rWgBSUIDd00e0ALNG6ZSz1m2nguVIWABiywVxQNcSYahvrppZWV+z6apYVvwMDoaa+RuiF8X9szUU5E/MWG6mbDN1Zx7EsLb7nihYSbXrq4TWKBevIEub1rDaBk1R9WXjgqeJvYvE7fDvWip5Rx74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=PRdHDok8; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB5532FC928;
	Sun, 30 Mar 2025 19:03:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1743354234; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=hkLMSOjML/6N8DjLAPOdlpsVnmShX6qoQxfMpsHdiGM=;
	b=PRdHDok8gcx7WyR8qx08NP40qJpAYubJHFl3/gaob7srq1s24jDF/qO/c1BFG4hD9XAV6P
	stWub7sDCHvsllzclSHifpT1MHpn9AOnomUUTsXjaBcUbQk7nmOvy6NVz1qeeHj8Nd9gMj
	mUz4CwNQmIbOGg4NCMyKadHVI8gCRD/qr4Tvt34E/IBW1S7q99efvk+vV84fn/vBVEZ6nu
	3LsAMZAFfD33F3rlWli6pGsTM/6ZUVpCyvMbwfjqvUAN+hVLl/rXPMgqwlyU7i0XmvOWb0
	HTxIxW82ApH8VqhvrTLZPOd4SQarR5pISAuzPWUUYFLR34TstbXzUKkXlmZ6ww==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benjamin.larsson@genexis.eu,
	linux-mediatek@lists.infradead.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v3 09/10] mips: dts: Add EcoNet DTS with EN751221 and SmartFiber XP8421-B board
Date: Sun, 30 Mar 2025 17:03:05 +0000
Message-Id: <20250330170306.2584136-10-cjd@cjdns.fr>
In-Reply-To: <20250330170306.2584136-1-cjd@cjdns.fr>
References: <20250330170306.2584136-1-cjd@cjdns.fr>
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
To my knowledge, evaluation boards from EcoNet are not currently available.
SmartFiber XP8421-B is currently manufactured, low cost, and can be
purchased as single units by the general public.
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


