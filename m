Return-Path: <linux-mips+bounces-7527-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8BFA163A8
	for <lists+linux-mips@lfdr.de>; Sun, 19 Jan 2025 19:44:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B1443A5D09
	for <lists+linux-mips@lfdr.de>; Sun, 19 Jan 2025 18:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69D881DFE2A;
	Sun, 19 Jan 2025 18:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="MrXWG2BB"
X-Original-To: linux-mips@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F541DFD9E
	for <linux-mips@vger.kernel.org>; Sun, 19 Jan 2025 18:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737312271; cv=none; b=STRzAb1jxfW35MVDvsdmmKi2fh94r0IIO8zNocaYMpzbWQS8HQFzN3Zf16fLqfRNpkTtFaOLZyXAqMmL+Q0NXPhpO6OWFZrpzJV/g1rFwfoaEMOP4JSoOtOSnmGMlqDGyHeI7bICWXGDN9w5qSAWHf7HkLfaZTHHAjvOK2NGoJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737312271; c=relaxed/simple;
	bh=7s6X85dGKcKt5k7mqwpvUEVLA1joFbe4Mqz6Q3UURz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NvsmGL5u8z5zcCJkjUsyrhcK38cQxQAjDfhMy4kWHA8p+m0HRRR+zEg/JMExjDzagCBbWjq0HE1gLSP3Y81kpJHs7tbXArtgr4ymC5CYmos13yUE0fGH3RHfezVQF/Yon0NoenDIMYOVj1bWZ4nw8UbSvWvuJY1HIDNhr/rYTAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=MrXWG2BB; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from terra.vega.svanheule.net (unknown [94.110.49.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 9C29A5A7E4F;
	Sun, 19 Jan 2025 19:34:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1737311691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AAtOPeGdFJYu13oCktZjkO7SD0htkFwt14XxJEDOn3U=;
	b=MrXWG2BB03kP3f7jqTD4qhtMaXJUsObRdgrDGCRvZvjcVjUFIBHiW4EFWO1ITVfGHDYkG9
	Iu381a9x+cGs6ecKhCQOzdOyBEBrF4CgRi5EVFrUnm2QCNf1MFuVdkMnwrkhZgsUrpBdtk
	dGBjy8U6wHzqFxtQ4rSGrbcsNmz2d2FWZTbUYiixxHSL9Sigu9mjD13gnfC6LVfc0NPTs9
	Q0zrCPvsadBsChS37FPSH+qtu01QoT49gXF/kIxuP99gC4l0NcwMnlnZvamL1N4hMVVKI9
	MahNpH2ccVOYJYk5DbGZ1gBdwceOlkCxTod6kpQ1DZHvMuqabj7LqzeXopdV0g==
From: Sander Vanheule <sander@svanheule.net>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Sander Vanheule <sander@svanheule.net>
Subject: [PATCH 4/9] mips: dts: realtek: Fold rtl83xx into rtl838x
Date: Sun, 19 Jan 2025 19:34:19 +0100
Message-ID: <20250119183424.259353-5-sander@svanheule.net>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250119183424.259353-1-sander@svanheule.net>
References: <20250119183424.259353-1-sander@svanheule.net>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtl83xx.dtsi was once (presumably) created as a base for both RTL838x
and RTL839x SoCs. Both SoCs have a different CPU and the peripherals
require different compatibles. Fold rtl83xx.dtsi into rtl838x.dtsi,
currently only supporting RTL838x SoCs, and create the RTL839x base
include later when required.

Signed-off-by: Sander Vanheule <sander@svanheule.net>
---
 arch/mips/boot/dts/realtek/cisco_sg220-26.dts |  1 -
 arch/mips/boot/dts/realtek/rtl838x.dtsi       | 56 ++++++++++++++++++
 arch/mips/boot/dts/realtek/rtl83xx.dtsi       | 59 -------------------
 3 files changed, 56 insertions(+), 60 deletions(-)
 delete mode 100644 arch/mips/boot/dts/realtek/rtl83xx.dtsi

diff --git a/arch/mips/boot/dts/realtek/cisco_sg220-26.dts b/arch/mips/boot/dts/realtek/cisco_sg220-26.dts
index 1cdbb09297ef..cb85d172a1d3 100644
--- a/arch/mips/boot/dts/realtek/cisco_sg220-26.dts
+++ b/arch/mips/boot/dts/realtek/cisco_sg220-26.dts
@@ -2,7 +2,6 @@
 
 /dts-v1/;
 
-#include "rtl83xx.dtsi"
 #include "rtl838x.dtsi"
 
 / {
diff --git a/arch/mips/boot/dts/realtek/rtl838x.dtsi b/arch/mips/boot/dts/realtek/rtl838x.dtsi
index d2c6baabb38c..907449094536 100644
--- a/arch/mips/boot/dts/realtek/rtl838x.dtsi
+++ b/arch/mips/boot/dts/realtek/rtl838x.dtsi
@@ -1,6 +1,14 @@
 // SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
 
 / {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -18,4 +26,52 @@ baseclk: baseclk {
 		#clock-cells = <0>;
 		clock-frequency = <500000000>;
 	};
+
+	cpuintc: cpuintc {
+		compatible = "mti,cpu-interrupt-controller";
+		#address-cells = <0>;
+		#interrupt-cells = <1>;
+		interrupt-controller;
+	};
+
+	soc@18000000 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x18000000 0x10000>;
+
+		uart0: serial@2000 {
+			compatible = "ns16550a";
+			reg = <0x2000 0x100>;
+
+			clock-frequency = <200000000>;
+
+			interrupt-parent = <&cpuintc>;
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
+		uart1: serial@2100 {
+			compatible = "ns16550a";
+			reg = <0x2100 0x100>;
+
+			clock-frequency = <200000000>;
+
+			interrupt-parent = <&cpuintc>;
+			interrupts = <30>;
+
+			reg-io-width = <1>;
+			reg-shift = <2>;
+			fifo-size = <1>;
+			no-loopback-test;
+
+			status = "disabled";
+		};
+	};
 };
diff --git a/arch/mips/boot/dts/realtek/rtl83xx.dtsi b/arch/mips/boot/dts/realtek/rtl83xx.dtsi
deleted file mode 100644
index 1039cb50c7da..000000000000
--- a/arch/mips/boot/dts/realtek/rtl83xx.dtsi
+++ /dev/null
@@ -1,59 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
-
-/ {
-	#address-cells = <1>;
-	#size-cells = <1>;
-
-	aliases {
-		serial0 = &uart0;
-		serial1 = &uart1;
-	};
-
-	cpuintc: cpuintc {
-		compatible = "mti,cpu-interrupt-controller";
-		#address-cells = <0>;
-		#interrupt-cells = <1>;
-		interrupt-controller;
-	};
-
-	soc@18000000 {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges = <0x0 0x18000000 0x10000>;
-
-		uart0: serial@2000 {
-			compatible = "ns16550a";
-			reg = <0x2000 0x100>;
-
-			clock-frequency = <200000000>;
-
-			interrupt-parent = <&cpuintc>;
-			interrupts = <31>;
-
-			reg-io-width = <1>;
-			reg-shift = <2>;
-			fifo-size = <1>;
-			no-loopback-test;
-
-			status = "disabled";
-		};
-
-		uart1: serial@2100 {
-			compatible = "ns16550a";
-			reg = <0x2100 0x100>;
-
-			clock-frequency = <200000000>;
-
-			interrupt-parent = <&cpuintc>;
-			interrupts = <30>;
-
-			reg-io-width = <1>;
-			reg-shift = <2>;
-			fifo-size = <1>;
-			no-loopback-test;
-
-			status = "disabled";
-		};
-	};
-};
-- 
2.48.1


