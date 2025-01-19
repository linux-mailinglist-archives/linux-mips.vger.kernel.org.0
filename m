Return-Path: <linux-mips+bounces-7523-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F503A1639D
	for <lists+linux-mips@lfdr.de>; Sun, 19 Jan 2025 19:44:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 339DF164883
	for <lists+linux-mips@lfdr.de>; Sun, 19 Jan 2025 18:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBDA61DFDAB;
	Sun, 19 Jan 2025 18:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="CpCVz7gi"
X-Original-To: linux-mips@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E6E1DF240
	for <linux-mips@vger.kernel.org>; Sun, 19 Jan 2025 18:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737312269; cv=none; b=TzFNu1DXTpF6SuPqxSdDC6khja4UNAlNNxBjYW9mIlgX3ofPTZdVQK74+fvMkbjJr0t3pcpNw5MtHDCOilGnNReTOMtyKi4umcHbL+a0Swp4+7+bEDuLNjo70BHT8ZJN5kil1A54CwmjKZVpVzY8Ols6tVXkQlRyU1BYRWa7Mho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737312269; c=relaxed/simple;
	bh=O3RVgBDqQ8ty40MmzDVyKK/AosSilQoJ9Z3By213rPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qxb8eAKxtmntjc2JQ0auLMkjTZ1ScBJWvic3zvyhJ9yKb7Mgh9swNcwLZHUF0hiFHAvmWnDrFv9lIib0plWyrMfJgeYblGdPOZL+rpW2FOnTDoBBsOr1XTzP4aDcYQlcJAuMNi+uayeDNmTiiAAZ4cMANrT7ahG4Xjbf5/I8Y4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=CpCVz7gi; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from terra.vega.svanheule.net (unknown [94.110.49.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 09C385A7E4C;
	Sun, 19 Jan 2025 19:34:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1737311690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kiaTltfe3TpwNCiKPtsYlqYsvoY4+IUaNYIQw82paTU=;
	b=CpCVz7giJzeehZYAXE5ub3tFDDN6vWbwVFpI75gp4OvOnWaC5gpFebPlq0I2UzxD7z/20F
	Whzf9VQ7ufWSNFOxA0GfrcEA3QCrZ8dkRWk8ek6uvqDSP3af6nvhQnb6hi67X97e6WcEuJ
	KLzWj3A/j/ZDoOGKHmLwhZVGd6XIIK4cGU9yxa5oFjNdADDPs+gKbWhSL7f0QnCNPisiKX
	WXya1NKuAUPJcDNAgtMi2cTkOmWVh0VfEwjN+dg3C1gPnBCq5cd3ycW7zJdQFT0PTahLoq
	jwfv8N7qaSchpaIcYBmAoIrPDdCwSmS+FO3LhNrF/aLND/y9SUtvqsYoUolBNQ==
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
Subject: [PATCH 1/9] mips: dts: realtek: Decouple RTL930x base DTSI
Date: Sun, 19 Jan 2025 19:34:16 +0100
Message-ID: <20250119183424.259353-2-sander@svanheule.net>
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

The RTL930x SoC series is sufficiently different to warrant its own base
dtsi. This ensures no properties need to be deleted or overwritten, and
prevents accidental inclusions of updates from rtl83xx.dtsi.

Signed-off-by: Sander Vanheule <sander@svanheule.net>
---
 arch/mips/boot/dts/realtek/rtl930x.dtsi | 133 +++++++++++++++---------
 1 file changed, 83 insertions(+), 50 deletions(-)

diff --git a/arch/mips/boot/dts/realtek/rtl930x.dtsi b/arch/mips/boot/dts/realtek/rtl930x.dtsi
index 17577457d159..67261d6fcaa7 100644
--- a/arch/mips/boot/dts/realtek/rtl930x.dtsi
+++ b/arch/mips/boot/dts/realtek/rtl930x.dtsi
@@ -1,10 +1,23 @@
 // SPDX-License-Identifier: GPL-2.0-or-later OR BSD-2-Clause
 
-#include "rtl83xx.dtsi"
-
 / {
 	compatible = "realtek,rtl9302-soc";
 
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
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -58,64 +71,84 @@ i2c1: i2c@388 {
 			status = "disabled";
 		};
 	};
-};
 
-&soc {
-	ranges = <0x0 0x18000000 0x20000>;
+	soc: soc@18000000 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x18000000 0x20000>;
 
-	intc: interrupt-controller@3000 {
-		compatible = "realtek,rtl9300-intc", "realtek,rtl-intc";
-		reg = <0x3000 0x18>, <0x3018 0x18>;
-		interrupt-controller;
-		#interrupt-cells = <1>;
+		intc: interrupt-controller@3000 {
+			compatible = "realtek,rtl9300-intc", "realtek,rtl-intc";
+			reg = <0x3000 0x18>, <0x3018 0x18>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
 
-		interrupt-parent = <&cpuintc>;
-		interrupts = <2>, <3>, <4>, <5>, <6>, <7>;
-	};
+			interrupt-parent = <&cpuintc>;
+			interrupts = <2>, <3>, <4>, <5>, <6>, <7>;
+		};
 
-	spi0: spi@1200 {
-		compatible = "realtek,rtl8380-spi";
-		reg = <0x1200 0x100>;
+		spi0: spi@1200 {
+			compatible = "realtek,rtl8380-spi";
+			reg = <0x1200 0x100>;
 
-		#address-cells = <1>;
-		#size-cells = <0>;
-	};
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
 
-	timer0: timer@3200 {
-		compatible = "realtek,rtl9302-timer", "realtek,otto-timer";
-		reg = <0x3200 0x10>, <0x3210 0x10>, <0x3220 0x10>,
-		    <0x3230 0x10>, <0x3240 0x10>;
+		timer0: timer@3200 {
+			compatible = "realtek,rtl9302-timer", "realtek,otto-timer";
+			reg = <0x3200 0x10>, <0x3210 0x10>, <0x3220 0x10>,
+			    <0x3230 0x10>, <0x3240 0x10>;
 
-		interrupt-parent = <&intc>;
-		interrupts = <7>, <8>, <9>, <10>, <11>;
-		clocks = <&lx_clk>;
-	};
+			interrupt-parent = <&intc>;
+			interrupts = <7>, <8>, <9>, <10>, <11>;
+			clocks = <&lx_clk>;
+		};
 
-	snand: spi@1a400 {
-		compatible = "realtek,rtl9301-snand";
-		reg = <0x1a400 0x44>;
-		interrupt-parent = <&intc>;
-		interrupts = <19>;
-		clocks = <&lx_clk>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		status = "disabled";
-	};
-};
+		snand: spi@1a400 {
+			compatible = "realtek,rtl9301-snand";
+			reg = <0x1a400 0x44>;
+			interrupt-parent = <&intc>;
+			interrupts = <19>;
+			clocks = <&lx_clk>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
 
-&uart0 {
-	/delete-property/ clock-frequency;
-	clocks = <&lx_clk>;
+		uart0: serial@2000 {
+			compatible = "ns16550a";
+			reg = <0x2000 0x100>;
 
-	interrupt-parent = <&intc>;
-	interrupts = <30>;
-};
+			clocks = <&lx_clk>;
 
-&uart1 {
-	/delete-property/ clock-frequency;
-	clocks = <&lx_clk>;
+			interrupt-parent = <&intc>;
+			interrupts = <30>;
 
-	interrupt-parent = <&intc>;
-	interrupts = <31>;
-};
+			reg-io-width = <1>;
+			reg-shift = <2>;
+			fifo-size = <1>;
+			no-loopback-test;
 
+			status = "disabled";
+		};
+
+		uart1: serial@2100 {
+			compatible = "ns16550a";
+			reg = <0x2100 0x100>;
+
+			clocks = <&lx_clk>;
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
+	};
+};
-- 
2.48.1


