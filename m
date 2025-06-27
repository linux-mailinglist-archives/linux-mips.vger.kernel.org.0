Return-Path: <linux-mips+bounces-9534-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B34E4AEB26E
	for <lists+linux-mips@lfdr.de>; Fri, 27 Jun 2025 11:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DB21562258
	for <lists+linux-mips@lfdr.de>; Fri, 27 Jun 2025 09:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9278C2D97B1;
	Fri, 27 Jun 2025 09:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="G4QL6NBE"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E3E2D8797;
	Fri, 27 Jun 2025 09:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751015398; cv=none; b=b3WiykvARFXNdEZK10RP/tFIpSLL2LkBXAzIrMUDXkjLo2Kl7A7PyisoNCNNHxlyhqbf9/GmJHKbaFeeZwmV2/vfUGCnlcFEi2lHAkU8zXbK9z52mxcoJnVPpuUbufBytA+L4PyNw2iPasgfQFFEbyJCquKXDqkIGsE0bbWHrNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751015398; c=relaxed/simple;
	bh=cBhIOlwAofvTclnsunNvhkbXKF+FQBchShW9Almz/3U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rrLaz3T7bf3GzFtkLGPgKZ3vLc29GI6a4IrkbuXtyhqr/O4lHk1WDHlWQzb5/plSeXmCJxspY8IIREY6PDKWzewLo0FFu16vNfK/MNUQ4UWuiua+KKkhjTZIpItDENQ3mxY21rbuD+dFt5t0eO4MjvGentd4PlMMmHEICWlPqpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=G4QL6NBE; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 507DB4391A;
	Fri, 27 Jun 2025 09:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751015394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ESDHlSmA/zmR11x7Wk/z9wZ37h0LK4bQV9lMVDCCDjg=;
	b=G4QL6NBE8G5iXAl7fnjHFZeICL/10N9cWpd7a15MIbBbYsdL7ET9CxGcbql+NL8XLy6euC
	7yatE9e+iy50vH6QCaAqMUaUPw6khWAwVvDYY7prV2BMuVkyUjJidM9oVIzeva2jvJm/93
	4lZLGSlTDSmB4hw1F7tQrmJQ2kc27BgKsrumrsygiX3jA4oCKqIriDjYHC540fAy/ymAIk
	zEO12LTbTcEWjdSxTCSVgPBxessPMiFR+IfVqBMNlKW2kwFCTsSpv+cTS8ovGEHjFZ38lK
	dfNvMZ+5Elq5Hhk7zaLdh2W2wLs3zBk8bRPOh90wiDY5ZDYYw54XaY7MT7J6Ig==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 27 Jun 2025 11:09:03 +0200
Subject: [PATCH net-next v2 17/18] MIPS: mobileye: eyeq5: add two Cadence
 GEM Ethernet controllers
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250627-macb-v2-17-ff8207d0bb77@bootlin.com>
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
In-Reply-To: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, 
 Harini Katakam <harini.katakam@xilinx.com>, 
 Rafal Ozieblo <rafalo@cadence.com>, 
 Haavard Skinnemoen <hskinnemoen@atmel.com>, Jeff Garzik <jeff@garzik.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-mips@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelvefhkeeufedvkefghefhgfdukeejlefgtdehtdeivddtteetgedvieelieeuhfenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeiieegsgemfhdtfhhfmehfvgdutdemlegvfhgunecuvehluhhsthgvrhfuihiivgepudehnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemieeigegsmehftdhffhemfhgvuddtmeelvghfugdphhgvlhhopegludelvddrudeikedruddtrddvudegngdpmhgrihhlfhhrohhmpehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefvddprhgtphhtthhopehrihgthhgrrhgutghotghhrhgrnhesghhmrghilhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehvlhgrughimhhirhdrkhhonhgurhgrthhivghvsehmohgsihhlvgihvgdrt
 ghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopehprggsvghnihesrhgvughhrghtrdgtohhm
X-GND-Sasl: theo.lebrun@bootlin.com

Add both MACB/GEM instances found in the Mobileye EyeQ5 SoC.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 arch/mips/boot/dts/mobileye/eyeq5.dtsi | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/mips/boot/dts/mobileye/eyeq5.dtsi b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
index a84e6e720619ef99e1405ae6296d8bad1aa3fa23..420cb27607bfdd8d5ea510fb668b0a1c85dd7d83 100644
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
@@ -178,6 +180,38 @@ timer {
 				clocks = <&olb EQ5C_CPU_CORE0>;
 			};
 		};
+
+		macb0: ethernet@2a00000 {
+			compatible = "mobileye,eyeq5-gem";
+			reg = <0x0 0x02a00000 0x0 0x4000>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>, /* queue0 */
+				     <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>, /* queue1 */
+				     <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>, /* queue2 */
+				     <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>; /* queue3 */
+			clock-names = "pclk", "hclk", "tsu_clk";
+			clocks = <&pclk>, <&pclk>, <&tsu_clk>;
+			dma-coherent;
+			nvmem-cells = <&eth0_mac>;
+			nvmem-cell-names = "mac-address";
+			mobileye,olb = <&olb 0x128 0x134>;
+		};
+
+		macb1: ethernet@2b00000 {
+			compatible = "mobileye,eyeq5-gem";
+			reg = <0x0 0x02b00000 0x0 0x4000>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH>, /* queue0 */
+				     <GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH>, /* queue1 */
+				     <GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH>, /* queue2 */
+				     <GIC_SHARED 24 IRQ_TYPE_LEVEL_HIGH>; /* queue3 */
+			clock-names = "pclk", "hclk", "tsu_clk";
+			clocks = <&pclk>, <&pclk>, <&tsu_clk>;
+			dma-coherent;
+			nvmem-cells = <&eth1_mac>;
+			nvmem-cell-names = "mac-address";
+			mobileye,olb = <&olb 0x12c 0x138>;
+		};
 	};
 };
 

-- 
2.50.0


