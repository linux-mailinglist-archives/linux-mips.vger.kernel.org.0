Return-Path: <linux-mips+bounces-12508-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BBDCC7EE5
	for <lists+linux-mips@lfdr.de>; Wed, 17 Dec 2025 14:45:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 063683005036
	for <lists+linux-mips@lfdr.de>; Wed, 17 Dec 2025 13:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 040FB34E76E;
	Wed, 17 Dec 2025 13:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oEzWvkPN"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3207D35B144;
	Wed, 17 Dec 2025 13:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765978599; cv=none; b=nhqfWnq4/q2S1rQUK8myKWMzJfsj/thnM74asXW9n2PJ6nvmBjjqpL63IxYueCIT0mflEpZq5+l4ABS4QiBYMHdLW8OYcCjAKyviLYilXtuvoDnLQ28gI4h7YvqvPzTQi8cTJ9fjdillIWcRd+jfFlPqd+WV0w6ogrjcEoxeeGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765978599; c=relaxed/simple;
	bh=sslnhmtniMZV42xzxVC4LsXb62PKVYAfQ/bfvPyLa6o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PG/oeU6uqIIlxQNHztouw8ms7B4geG/XM8WaKjU6gS1sb8gbtf4PtB914z6LZm/8hnnr9StExeTNh9FY8+JGIaZ4xOACKIM9hTZsrXclAzSa+GSOe2mVZyKzfLFy9i4SqKdn6+h+e6Y2f0YC6Cee90HZ7+vRXeVstwGL7yprC5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oEzWvkPN; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0D7DC1A2284;
	Wed, 17 Dec 2025 13:36:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D310A6072F;
	Wed, 17 Dec 2025 13:36:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 95E90102F0AD3;
	Wed, 17 Dec 2025 14:36:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765978591; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pGicD0qEh1bfDkjguRf0vlh0XMNSXXQl+wrdVsY3VFE=;
	b=oEzWvkPN5B3qWGUXm0B/4gKzXJiAYHtHJ0pbL5IvOdhsZVhr3iYU3WqUopeLzZ35m5zOk5
	tN8IffIyhfA3JX47xjBsQ5nTWyKspz+TSM+65wBVaBv6Nv2T4C75ZYFlAvt2ybGBD1TdNK
	AzmNeskkyIExk2qgd+DlyUdozzdBmYrLyMCucylQD20pR68trq0vL4zHWh9tu3rtd0O9VR
	4XeeQ0mthTBVH+6V/5M+Q9wq70YNKmIZPpAaCzNpZrZFmL9yNZ6nQvVsJz9O4OmXXWty2V
	Aput3Gr8U59UaR7Yf4h2EAI4/1yrDJGLSs5M3Q64V4MO9Sed9KJ0W2y5B19gSw==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 17 Dec 2025 14:36:01 +0100
Subject: [PATCH 11/13] MIPS: Add Mobileye EyeQ6Lplus evaluation board dts
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251217-eyeq6lplus-v1-11-e9cdbd3af4c2@bootlin.com>
References: <20251217-eyeq6lplus-v1-0-e9cdbd3af4c2@bootlin.com>
In-Reply-To: <20251217-eyeq6lplus-v1-0-e9cdbd3af4c2@bootlin.com>
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

The board comes with 2GB of RAM, an SPI NAND connected to the octoSPI
controller, and the two SPI controllers are connected to each other via
an intermediate MCU for loopback testing. The UART of the SoC is used
as the serial console.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 arch/mips/boot/dts/mobileye/Makefile            |   1 +
 arch/mips/boot/dts/mobileye/eyeq6lplus-epm6.dts | 112 ++++++++++++++++++++++++
 2 files changed, 113 insertions(+)

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
index 000000000000..e42d05a4d213
--- /dev/null
+++ b/arch/mips/boot/dts/mobileye/eyeq6lplus-epm6.dts
@@ -0,0 +1,112 @@
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
+	spidev@0 {
+		compatible = "lwn,bk4-spi";
+		spi-max-frequency = <5000000>;
+		reg = <0>;
+	};
+};
+
+&spi1 {
+	pinctrl-0 = <&spi1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+	slave {
+		compatible = "lwn,bk4-spi";
+		spi-max-frequency = <5000000>;
+	};
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


