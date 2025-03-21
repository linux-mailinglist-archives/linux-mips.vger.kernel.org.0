Return-Path: <linux-mips+bounces-8280-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A63A6C33D
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 20:18:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 596A83BE981
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 19:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ABE323814B;
	Fri, 21 Mar 2025 19:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Rz5VjWfa"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC34123717F;
	Fri, 21 Mar 2025 19:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742584459; cv=none; b=HnlCiyZDosB+mtCA2ngU/CYb0ThvPa5nW30YUvlWOL0Hf12yfhwoYNQ528UY4anHBx0LoaRposuyQ/5sphY7W2I5rQLOqBZspF/B5IZWxcaHy/YAgGmGG4rRkKOZ9wuZ8va+KeUnhDamYmBQcexWA5WBgKO8UAakatZosZ6iIx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742584459; c=relaxed/simple;
	bh=Cv7vLcfgOv6uKlsX/JtMj9JikAiWXJetkuXDHqYwelc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HVLnZA4JF5fmhxm7MpwU1g+VLur+LjCZ9PzONLm0ilgbiWjgwmJ4BBK2iSASSX5YMcSTCxd8b5RIL5xXRp7cBYhUXh1A3SivLLXM55abcHoGhHeXqzkzHY0xzLNep5t98Q4jPakASybUf5shbM7r5BVu7hnIDmaKo8UzQbUfIk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Rz5VjWfa; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4B7C44559;
	Fri, 21 Mar 2025 19:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742584455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4TDi+sQdkyFFFV9+gkQoSurbLJHpubG1wu6RejRj0Wc=;
	b=Rz5VjWfaclIqbA3odhQ6Q0lHzRF1fnnN/dczLLLrNnYkLXzupqfBP2Mu1kbJqwNwXUJq2Q
	B5FPvKSNXsYVCsdJst1vRo+fMLWyppbncolUAzSxSTXiqox77xR499d60WW0qWkgkhAYoR
	F82n0YEFzGDXBjqq1W9WbytbeMa5EIrar4umV36glLUb3cd4gttwV6Jp4qOjzBOd9d4no2
	lJovYpKdIPPN/OcX1oUVON5H21wkO1/J81prkndIWE2fXCW2CDKMJOlykIO1k43S0ee2di
	CtwKLWn/dunLqCD07wCyKjkSgsiKki9GBourKW85xu/tpiDJA14uU2BumJK6wA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 21 Mar 2025 20:09:43 +0100
Subject: [PATCH net-next 12/13] MIPS: mobileye: eyeq5: add two Cadence GEM
 Ethernet controllers
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250321-macb-v1-12-537b7e37971d@bootlin.com>
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
In-Reply-To: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
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
 Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-mips@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheduledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepvfhhrohoucfnvggsrhhunhcuoehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelvefhkeeufedvkefghefhgfdukeejlefgtdehtdeivddtteetgedvieelieeuhfenucfkphepjeejrddufeehrdekuddrieehnecuvehluhhsthgvrhfuihiivgepuddunecurfgrrhgrmhepihhnvghtpeejjedrudefhedrkedurdeihedphhgvlhhopegludelvddrudeikedruddrfedtngdpmhgrihhlfhhrohhmpehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvkedprhgtphhtthhopehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhhishgtvheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtohepkhhusggrs
 ehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihgtohhlrghsrdhfvghrrhgvsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
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
2.48.1


