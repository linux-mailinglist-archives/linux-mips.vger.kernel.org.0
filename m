Return-Path: <linux-mips+bounces-9623-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C6BAF92B5
	for <lists+linux-mips@lfdr.de>; Fri,  4 Jul 2025 14:35:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A11C5478A2
	for <lists+linux-mips@lfdr.de>; Fri,  4 Jul 2025 12:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD812D94BC;
	Fri,  4 Jul 2025 12:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LHUToJCj"
X-Original-To: linux-mips@vger.kernel.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C590C2D876F;
	Fri,  4 Jul 2025 12:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751632491; cv=none; b=Hpiy42XXVAhasnYtZTibeah5BtcIEKxP2dCPgBNUkRIpc1q4SK3zmPpj4wkWgwpN1VXYqVuHDLoYiYseeU+JDAb4575S6ZgfrvmLWNzjndQ9Sk6yDk/DuZe0vFYccmZ96Ur86DzGzn0gFxWKPwbQ7IC1LtQ4mTTJmVLegchMVOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751632491; c=relaxed/simple;
	bh=5Tas9+eQ6WOuKWE768dbMyplk9/e25+akoD7xZlU0bQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O0u/7begjFMrxoITb66biXx38WtnMROKrdVTj8nea3UC+hQav//0PZtueO/LCrir4l9UxJtQxq6oG3KAR5x0Me02ylf6gTB0+Oc1OfwiEZJslwvdqhdIhAlych025rEjasyWgzPqMwoKcHHx5JmzXpYoAuXbChFny4L/DT1oWB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LHUToJCj; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 9DA9A582F8E;
	Fri,  4 Jul 2025 11:47:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BF04D205B2;
	Fri,  4 Jul 2025 11:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1751629631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GoiwShPkk8gSyNHjpMAydVKBu25Rjqwdofoj4nra1qU=;
	b=LHUToJCj3HiybVWWr6VHQN81Y0aa/sAGOpVu/uD743l/Rx4qb/Ld4y8PjmIfVnvjWeiFp+
	sKUlldRImTwbF32//KXY+W0o0+pOXimYMdgeWy5y26dbdFTiNXd4cwgdG2yLGIUidIPYh1
	3AYdwkXV216o6/psh32H5bKszRULvIBz6r6CBaIYIWX5YAjkthmTR4H3egykySyqeoSuwR
	+nVVIssmMqlZfLMRdkmDksXU5bYRz+QuRpOzcDPJLjHAzZMkFKfPYnKEe04AtPCJU9RQlz
	IdWFtZWk0XF1SCAl4snDZlGACGhB3Zi0H+tRQBahPOpDYpEhhxJzZEhEvqX0cQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 04 Jul 2025 13:47:07 +0200
Subject: [PATCH 2/6] MIPS: mobileye: eyeq5: add 5 I2C controller nodes
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250704-of-commits-v1-2-dc2006bf2846@bootlin.com>
References: <20250704-of-commits-v1-0-dc2006bf2846@bootlin.com>
In-Reply-To: <20250704-of-commits-v1-0-dc2006bf2846@bootlin.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvfedtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpefvhhorohcunfgvsghruhhnuceothhhvghordhlvggsrhhunhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleevhfekueefvdekgfehhffgudekjeelgfdthedtiedvtdetteegvdeileeiuefhnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemieeigegsmehftdhffhemfhgvuddtmeelvghfugenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemieeigegsmehftdhffhemfhgvuddtmeelvghfugdphhgvlhhopegludelvddrudeikedruddtrddvudeingdpmhgrihhlfhhrohhmpehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedugedprhgtphhtthhopehvlhgrughimhhirhdrkhhonhgurhgrthhivghvsehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopehthhgvohdrlhgvsghruhhnsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughirdhshhihthhisehkvghrnhgvlhdrohhrg
 hdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghhrvghgohhrhidrtghlvghmvghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehtrgiffhhikhdrsggrhihouhhksehmohgsihhlvgihvgdrtghomhdprhgtphhtthhopehlihhnuhhsrdifrghllhgvihhjsehlihhnrghrohdrohhrgh
X-GND-Sasl: theo.lebrun@bootlin.com

Add the SoC I2C controller nodes to the platform devicetree. Use a
default bus frequency of 400kHz. They are AMBA devices that are matched
on PeriphID.

Set transfer timeout to 10ms instead of Linux's default of 200ms.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 arch/mips/boot/dts/mobileye/eyeq5.dtsi | 75 ++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/mips/boot/dts/mobileye/eyeq5.dtsi b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
index a84e6e720619ef99e1405ae6296d8bad1aa3fa23..b9b6f2684e675020d0377147a04d7ad5bfc272c1 100644
--- a/arch/mips/boot/dts/mobileye/eyeq5.dtsi
+++ b/arch/mips/boot/dts/mobileye/eyeq5.dtsi
@@ -110,6 +110,81 @@ soc: soc {
 		ranges;
 		compatible = "simple-bus";
 
+		i2c0: i2c@300000 {
+			compatible = "mobileye,eyeq5-i2c", "arm,primecell";
+			reg = <0 0x300000 0x0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SHARED 1 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <400000>; /* Fast mode */
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&olb 35>, <&olb EQ5C_PER_I2C>;
+			clock-names = "i2cclk", "apb_pclk";
+			resets = <&olb 0 13>;
+			i2c-transfer-timeout-us = <10000>;
+			mobileye,olb = <&olb 0>;
+		};
+
+		i2c1: i2c@400000 {
+			compatible = "mobileye,eyeq5-i2c", "arm,primecell";
+			reg = <0 0x400000 0x0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SHARED 2 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <400000>; /* Fast mode */
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&olb 35>, <&olb EQ5C_PER_I2C>;
+			clock-names = "i2cclk", "apb_pclk";
+			resets = <&olb 0 14>;
+			i2c-transfer-timeout-us = <10000>;
+			mobileye,olb = <&olb 1>;
+		};
+
+		i2c2: i2c@500000 {
+			compatible = "mobileye,eyeq5-i2c", "arm,primecell";
+			reg = <0 0x500000 0x0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SHARED 3 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <400000>; /* Fast mode */
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&olb 35>, <&olb EQ5C_PER_I2C>;
+			clock-names = "i2cclk", "apb_pclk";
+			resets = <&olb 0 15>;
+			i2c-transfer-timeout-us = <10000>;
+			mobileye,olb = <&olb 2>;
+		};
+
+		i2c3: i2c@600000 {
+			compatible = "mobileye,eyeq5-i2c", "arm,primecell";
+			reg = <0 0x600000 0x0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SHARED 4 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <400000>; /* Fast mode */
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&olb 35>, <&olb EQ5C_PER_I2C>;
+			clock-names = "i2cclk", "apb_pclk";
+			resets = <&olb 0 16>;
+			i2c-transfer-timeout-us = <10000>;
+			mobileye,olb = <&olb 3>;
+		};
+
+		i2c4: i2c@700000 {
+			compatible = "mobileye,eyeq5-i2c", "arm,primecell";
+			reg = <0 0x700000 0x0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SHARED 5 IRQ_TYPE_LEVEL_HIGH>;
+			clock-frequency = <400000>; /* Fast mode */
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&olb 35>, <&olb EQ5C_PER_I2C>;
+			clock-names = "i2cclk", "apb_pclk";
+			resets = <&olb 0 17>;
+			i2c-transfer-timeout-us = <10000>;
+			mobileye,olb = <&olb 4>;
+		};
+
 		uart0: serial@800000 {
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0 0x800000 0x0 0x1000>;

-- 
2.50.0


