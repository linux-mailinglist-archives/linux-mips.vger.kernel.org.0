Return-Path: <linux-mips+bounces-12331-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89210C811A5
	for <lists+linux-mips@lfdr.de>; Mon, 24 Nov 2025 15:44:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDC783AC571
	for <lists+linux-mips@lfdr.de>; Mon, 24 Nov 2025 14:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D14A3148C0;
	Mon, 24 Nov 2025 14:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="th+AGnXj"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973A4313E34;
	Mon, 24 Nov 2025 14:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763995291; cv=none; b=gH+wyvfUgsJjgFwirKTD7u5P86x5mJYroY1HkJg9/xUn7Z+YzklnpMjRaHEucnthfYXgc0we/m4QXRncXw3wlS5OSlptZSMqIGuRC4cvME5K32TYtNPNjQBkYdw4jbh72QgwsN+V/UaoUi2uAVmaOHGdFcrc987JyfjfK1ZHri0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763995291; c=relaxed/simple;
	bh=6Q+NmLl2C9ptZ9bkztHH+KYUMcsJXHivUSZ8co9WpOk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n3sC/k0b8LRuO+PmDtrFPSGN4Y3EMf47o6Om7nwhIJFKP0hxR4AkcKgQeBsSh6LOsBrhtz8FsZcApg/oFKhfDiJWQ+fGxulH8yM1pcQefnWwB5/yyxUXX9fax2eED61vG3CUC3+IEe80lz4UVIOaSenZMzjH0yvoWsgLv6qLHZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=th+AGnXj; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 079864E4189F;
	Mon, 24 Nov 2025 14:41:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CE37A606FC;
	Mon, 24 Nov 2025 14:41:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 81F8910371DB2;
	Mon, 24 Nov 2025 15:41:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763995286; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=klQnWzZzV5kOkpTDc5MuQiqgbTxND08gty2EDxoTZ9U=;
	b=th+AGnXjyLfMJ5lc16+skBJIeIAmY3nvrbQD2M3lOfM2SvBntx/SUjzW3nHILo3nnR0Mw5
	Bo6XZlwLlFNBRS1bfbtXpgPc6LCafvsnrO5t5PIJMnQKYTPbhUYnnSNYOgnElvccEECWrB
	bOHom8nVjecmZXw78spnVhe9dzKSR80tcD4Iu8po8Qoy/Cq4HJZHYaG3GLLH+0+ef+NNdB
	wn/3xIrN7EavFH0PiWMHO/g1uQrwJQKjCIIWyBuAhB0I+nvHFsfBhdMuKIzR5tSSnNX7RQ
	WQIm+pD64QCJqQ+3eZgcp9bF0BfjbKYMtZE+Q244b041pKF1/aNAM7e17+Uwug==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Mon, 24 Nov 2025 15:41:07 +0100
Subject: [PATCH v4 6/7] MIPS: mobileye: eyeq5: add two Cadence GEM Ethernet
 controllers
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251124-macb-phy-v4-6-955c625a81a7@bootlin.com>
References: <20251124-macb-phy-v4-0-955c625a81a7@bootlin.com>
In-Reply-To: <20251124-macb-phy-v4-0-955c625a81a7@bootlin.com>
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

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
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
2.51.2


