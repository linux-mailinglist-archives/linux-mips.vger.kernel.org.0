Return-Path: <linux-mips+bounces-12571-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C84DCD8E17
	for <lists+linux-mips@lfdr.de>; Tue, 23 Dec 2025 11:42:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 814ED301FBDF
	for <lists+linux-mips@lfdr.de>; Tue, 23 Dec 2025 10:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 233E33328ED;
	Tue, 23 Dec 2025 10:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="V7YExRNq"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E5C330B02;
	Tue, 23 Dec 2025 10:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484175; cv=none; b=MJc07P+BBlH0LcpDxlbKD/jwu1EVYwmpTFLlnJCrlVh6HVLjrd5laRK0rd0HHR91GveFXzw6RI7gDsDykmnxHXIfte2NPm0ZAAtjV0MlgA27T/vlk9O8JGftSrmiMZl73pXpJVmnYTRH96irfUWc0nII2Fz6K+ZRdw3BeyXNITA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484175; c=relaxed/simple;
	bh=SJ2r+C12LPa/0lr2hOAGRSmhr681Trh1CqqgDD7JLGI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UwWIkXJc89k66dNN0w/Nmjf94HOPxoKj9zYuB3WXIcnd3EGYCiwqZDmBStO9KbdcEXvVauvRlrMpZM3BG6wuUYtflpfdBaeLaIFCM+V5hWwckRCRfsyV4iHh+2XyFKvG1P4xVdNiKrc+DKSwJaE/YMDkJxBxMmqbObzhUsBKvOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=V7YExRNq; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D3F251A23A2;
	Tue, 23 Dec 2025 10:02:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A914760716;
	Tue, 23 Dec 2025 10:02:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 27FE810AB09C2;
	Tue, 23 Dec 2025 11:02:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766484167; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PlMp1lApSMMRZliO9gXs3dnWGLZFEXZmWjXmvxtawak=;
	b=V7YExRNqYR44R4/bFYkR0ksYvoylloWDxJyyu53GLEIpm3CNbtu+L0Idk0j/RO6ZjymwU7
	vcnoZ4hOyu0zHvRs70HmRlZV44ZYRejJFQ8aV59ovc+KjLfKPBN+xTrPOaPbemmocBnquq
	o9cvZOGYuooI4dvGRZGsqnWC+qT5PnJA0n4g3tIUxAhx3Xh/pzag1AFTWTA7TFYEo3fafS
	lTChixxBo/yTpWEAZOpUrtmT71cBlxuLPGFMqzKj+vn8U/pVms8y6o22qb+q/+eXPHLZuu
	TvsHHdWffzg4zoHzyWRp1mkWMXNszCVMSFO58AjWs9BsPcGSiNMNf+O3Xk+ClA==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Tue, 23 Dec 2025 11:02:26 +0100
Subject: [PATCH v2 11/13] MIPS: Add Mobileye EyeQ6Lplus evaluation board
 dts
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-eyeq6lplus-v2-11-cd1fd21d182c@bootlin.com>
References: <20251223-eyeq6lplus-v2-0-cd1fd21d182c@bootlin.com>
In-Reply-To: <20251223-eyeq6lplus-v2-0-cd1fd21d182c@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linusw@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Add the device tree of the evaluation board of the EyeQ6Lplus SoC.

The board comes with 2GB of RAM and an SPI NAND connected to the octoSPI
controller The UART of the SoC is used as the serial console.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 arch/mips/boot/dts/mobileye/Makefile            |   1 +
 arch/mips/boot/dts/mobileye/eyeq6lplus-epm6.dts | 103 ++++++++++++++++++++++++
 2 files changed, 104 insertions(+)

diff --git a/arch/mips/boot/dts/mobileye/Makefile b/arch/mips/boot/dts/mobileye/Makefile
index 7cc89968aaac..9305dd01f4c8 100644
--- a/arch/mips/boot/dts/mobileye/Makefile
+++ b/arch/mips/boot/dts/mobileye/Makefile
@@ -3,3 +3,4 @@
 
 dtb-$(CONFIG_MACH_EYEQ5)		+= eyeq5-epm5.dtb
 dtb-$(CONFIG_MACH_EYEQ6H)		+= eyeq6h-epm6.dtb
+dtb-$(CONFIG_MACH_EYEQ6LPLUS)		+= eyeq6lplus-epm6.dtb
diff --git a/arch/mips/boot/dts/mobileye/eyeq6lplus-epm6.dts b/arch/mips/boot/dts/mobileye/eyeq6lplus-epm6.dts
new file mode 100644
index 000000000000..404d0ff09f5a
--- /dev/null
+++ b/arch/mips/boot/dts/mobileye/eyeq6lplus-epm6.dts
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Copyright 2025 Mobileye Vision Technologies Ltd.
+ */
+
+/dts-v1/;
+
+#include "eyeq6lplus.dtsi"
+
+/ {
+	compatible = "mobileye,eyeq6lplus-epm6", "mobileye,eyeq6lplus";
+	model = "Mobileye EyeQ6Lplus Evaluation board";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:921600n8";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x1 0x00000000 0x0 0x80000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* These reserved memory regions are also defined in bootmanager
+		 * for configuring inbound translation for BARS, don't change
+		 * these without syncing with bootmanager
+		 */
+		mhm_reserved_0: the-mhm-reserved-0 {
+			reg = <0x1 0x00000000 0x0 0x0000800>;
+		};
+		bm_logs_reserved: bm-logs-reserved {
+			reg = <0x1 0x0000800 0x0 0x000f800>;
+		};
+		shmem0_reserved: shmem@804000000 {
+			reg = <0x1 0x04000000 0x0 0x1000000>;
+		};
+		shmem1_reserved: shmem@805000000 {
+			reg = <0x1 0x05000000 0x0 0x1000000>;
+		};
+		mini_coredump0_reserved: mini-coredump0@806200000 {
+			reg = <0x1 0x06200000 0x0 0x100000>;
+		};
+		mailbox_reserved: mailbox-reserved {
+			reg = <0x1 0x06300000 0x0 0x000300>;
+		};
+		sys_logs_reserved: sys-logs-reserved {
+			reg = <0x1 0x10000000 0x0 0x800000>;
+		};
+		csl_policy_logs_reserved: csl-policy-logs-reserved {
+			reg = <0x1 0x10800000 0x0 0x10000>;
+		};
+	};
+};
+
+&ospi {
+	status = "okay";
+	flash@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		spi-max-frequency = <40000000>;
+		cdns,read-delay = <0>;
+		cdns,tshsl-ns = <400>;
+		cdns,tsd2d-ns = <120>;
+		cdns,tchsh-ns = <40>;
+		cdns,tslch-ns = <20>;
+		spi-tx-bus-width = <1>;
+		spi-rx-bus-width = <8>;
+	};
+};
+
+&spi0 {
+	pinctrl-0 = <&spi0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&spi1 {
+	pinctrl-0 = <&spi1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+};

-- 
2.52.0


