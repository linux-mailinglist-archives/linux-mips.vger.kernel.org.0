Return-Path: <linux-mips+bounces-12010-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AD3C27A51
	for <lists+linux-mips@lfdr.de>; Sat, 01 Nov 2025 09:55:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1B4A401F1C
	for <lists+linux-mips@lfdr.de>; Sat,  1 Nov 2025 08:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52C982BD590;
	Sat,  1 Nov 2025 08:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="g5V50wtv"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B5F2C08CB;
	Sat,  1 Nov 2025 08:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761987251; cv=none; b=MZUdwgbCJ3GWRKaflpNIzLWlAT7gWeEB3qxDJFzIpdVn9s5PUIWCST96/KDzES0ztukLPI9QUqP3gtwVQmj2cDYMvDvOHk5IL9uAuVORDQBX1NRWb3NoXYYM871HL6FEHl79mQ8VH+7hMz0A8QEkkZcUIztSoUKR6bi3MmolmIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761987251; c=relaxed/simple;
	bh=ResRIcKzFjxpKsW/Yno1nuGatpU78DmUNiS6kkM8130=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uhR9Tsn4gOhSqsXLgqTlsPe2fG2uEVQjkdxeiNVpB5UiwIqau1PGlo8YUyprg2WoIbeRTKa/sm85dfXcdGsIkRpQ7TQMM55YzdpeEv/8ruA0UnbrSHrlnRamVNbkjaBZb4PQCZifLt8Ilv4O4oUCZrdAxGWTh96xvoAZKTOi3Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=g5V50wtv; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 029F94E4145F;
	Sat,  1 Nov 2025 08:54:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CB43D6070B;
	Sat,  1 Nov 2025 08:54:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CF79B1181ABE5;
	Sat,  1 Nov 2025 09:54:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761987244; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ruvqMdrCplni8HhZlBta1yqMIH8AkjPXDgnT9COO8UQ=;
	b=g5V50wtvw08Inzzz98zK3gmXL9bTUiRKpx+u4+JBpo6HvbROvr+1K0OodMXd0AGL9zPRCU
	9GTt/0uozWzUgNj3c1fLqtyupWEHv+qJDSKcbwCtY7UNvBydYpR80cR2+/YO/S+2V+8i8N
	V5uoPV5BWGRtDHz2UIpYC6aZjBDk4wDXRoOkt8o/fWF+xhl0RjrOD09nyUERKpXfeV7REt
	2JjL2IlMpbx8fDlzyOmIYf14gqWZZFvLzl8GYXcoSSfwqcC7eNXUhUd2MxoapB16DqH6d8
	TpeFEPRhmoVw37X9qtGZJbShH1bMZhRsuNkorYozyWGYFOfvwWsNNxRX01Cz6Q==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Sat, 01 Nov 2025 09:53:34 +0100
Subject: [PATCH v2 6/7] MIPS: mobileye: eyeq5: add two Cadence GEM Ethernet
 controllers
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251101-macb-phy-v2-6-c1519eef16d3@bootlin.com>
References: <20251101-macb-phy-v2-0-c1519eef16d3@bootlin.com>
In-Reply-To: <20251101-macb-phy-v2-0-c1519eef16d3@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Add both MACB/GEM instances found in the Mobileye EyeQ5 SoC.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 arch/mips/boot/dts/mobileye/eyeq5.dtsi | 45 ++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/mips/boot/dts/mobileye/eyeq5.dtsi b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
index 36a73e8a63a1..cec5ad875228 100644
--- a/arch/mips/boot/dts/mobileye/eyeq5.dtsi
+++ b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
@@ -77,6 +77,8 @@ aliases {
 		serial0 = &uart0;
 		serial1 = &uart1;
 		serial2 = &uart2;
+		ethernet0 = &macb0;
+		ethernet1 = &macb1;
 	};
 
 	cpu_intc: interrupt-controller {
@@ -231,6 +233,7 @@ olb: system-controller@e00000 {
 			#clock-cells = <1>;
 			clocks = <&xtal>;
 			clock-names = "ref";
+			#phy-cells = <1>;
 		};
 
 		gic: interrupt-controller@140000 {
@@ -305,6 +308,48 @@ gpio1: gpio@1500000 {
 			#interrupt-cells = <2>;
 			resets = <&olb 0 26>;
 		};
+
+		iocu-bus {
+			compatible = "simple-bus";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			dma-coherent;
+			dma-ranges = <0x10 0x00000000 0x0 0x0 0x10 0>;
+
+			macb0: ethernet@2a00000 {
+				compatible = "mobileye,eyeq5-gem";
+				reg = <0x0 0x02a00000 0x0 0x4000>;
+				interrupt-parent = <&gic>;
+				/* One interrupt per queue */
+				interrupts = <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>;
+				clock-names = "pclk", "hclk", "tsu_clk";
+				clocks = <&pclk>, <&pclk>, <&tsu_clk>;
+				nvmem-cells = <&eth0_mac>;
+				nvmem-cell-names = "mac-address";
+				phys = <&olb 0>;
+			};
+
+			macb1: ethernet@2b00000 {
+				compatible = "mobileye,eyeq5-gem";
+				reg = <0x0 0x02b00000 0x0 0x4000>;
+				interrupt-parent = <&gic>;
+				/* One interrupt per queue */
+				interrupts = <GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH>,
+					     <GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH>;
+				clock-names = "pclk", "hclk", "tsu_clk";
+				clocks = <&pclk>, <&pclk>, <&tsu_clk>;
+				nvmem-cells = <&eth1_mac>;
+				nvmem-cell-names = "mac-address";
+				phys = <&olb 1>;
+			};
+		};
+
 	};
 };
 

-- 
2.51.1


