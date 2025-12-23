Return-Path: <linux-mips+bounces-12563-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F28CD8B2E
	for <lists+linux-mips@lfdr.de>; Tue, 23 Dec 2025 11:04:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C1F7304E57C
	for <lists+linux-mips@lfdr.de>; Tue, 23 Dec 2025 10:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2469B32BF38;
	Tue, 23 Dec 2025 10:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="clI+oVo9"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58441329388
	for <linux-mips@vger.kernel.org>; Tue, 23 Dec 2025 10:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484161; cv=none; b=PY6GYe7QJ1wegIlIpeSCVCiKhwcqu7/ojE6cOVYJ/tlXiXLQ0fUZDhJ+/kazxbS5HW5w25cMCPH57CxGd9hVanQFIMqBXl1Rw0SMo8iM2eXIP9FM9OgUKHkX90whcR6V0xiBF5BRa3ZQXqbp01ZT24BrW1I7GdYU8cFKVW4a9jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484161; c=relaxed/simple;
	bh=5W8FAdYrqff+vquTCrZKd1PmdDy+vbh7BiDr9EvmBWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LhORPa2NNyBxEhgb2+HEgUv/z7BCVvdpZhohtK9wMmk/Y2rg0YnQufnQKdJPM1FtLG+tESQn4Pn6nZFNFCBtl7ziEFf5nH996lRi+u2pkAuoz7/+zNapXaSPoXVbTmmEUHwFVqV+++NQDlOANl8YBxOvsxPg7+q6G1acPeujJdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=clI+oVo9; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 011FCC1AE1F;
	Tue, 23 Dec 2025 10:02:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 13ADB60716;
	Tue, 23 Dec 2025 10:02:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A56D110AB09BC;
	Tue, 23 Dec 2025 11:02:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766484151; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Tj/pSt+Thd3LIY7vzJ8DdTOz+NL4kR0oF20NUeJ/M4g=;
	b=clI+oVo90CrjOMRS56mW8P/9OO59RIA+h7pWK/MvTc+8nwayhwpxPC6SzvFklwKLzTqxeb
	C9v7jxYlPoOXumdgNTn6Ydqp03fx0/fz0CqCYPawJfH0f0PtyR+HWyYwDMaFDQsXTf10YS
	3xHE4X0XIZ9mGBICGES/ZRlqSDxac/mmbQcPfJDv4VOWCr1SSrxOtz8f3LD9IZwnrIGdhS
	TpZnbupGFNEXcNqO78HV8uySL7LLoQPp3z9d3GD0JOsyf0PN0iAv1m0BtvWhWW4oWcKYJn
	k4fy8O+d6cj5sVq63cUNVbgUSBGqJWyVUCk3oTVD3VD78t9omgBd6RioibIPeg==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Tue, 23 Dec 2025 11:02:17 +0100
Subject: [PATCH v2 02/13] dt-bindings: soc: mobileye: Add EyeQ6Lplus OLB
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-eyeq6lplus-v2-2-cd1fd21d182c@bootlin.com>
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

The "Other Logic Block" found in the EyeQ6Lplus from Mobileye provides
various functions for the controllers present in the SoC.

The OLB produces 22 clocks derived from its input, which is connected
to the main oscillator of the SoC.

It provides reset signals via two reset domains.

It also controls 32 pins to be either a GPIO or an alternate function.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 .../soc/mobileye/mobileye,eyeq6lplus-olb.yaml      | 208 +++++++++++++++++++++
 .../dt-bindings/clock/mobileye,eyeq6lplus-clk.h    |  37 ++++
 2 files changed, 245 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq6lplus-olb.yaml b/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq6lplus-olb.yaml
new file mode 100644
index 000000000000..8334876cf4e6
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq6lplus-olb.yaml
@@ -0,0 +1,208 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/mobileye/mobileye,eyeq6lplus-olb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mobileye EyeQ6Lplus SoC system controller
+
+maintainers:
+  - Benoît Monin <benoit.monin@bootlin.com>
+  - Grégory Clement <gregory.clement@bootlin.com>
+  - Théo Lebrun <theo.lebrun@bootlin.com>
+  - Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
+
+description:
+  OLB ("Other Logic Block") is a hardware block grouping smaller blocks.
+  Clocks, resets, pinctrl are being handled from here. EyeQ6Lplus hosts
+  a single instance providing 22 clocks, two reset domains and one bank
+  of 32 pins.
+
+properties:
+  compatible:
+    items:
+      - const: mobileye,eyeq6lplus-olb
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  '#reset-cells':
+    description:
+      First cell is reset domain index.
+      Second cell is reset index inside that domain.
+    const: 2
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    maxItems: 1
+    description:
+      Input parent clock to all PLLs. Expected to be the main crystal.
+
+  clock-names:
+    const: ref
+
+patternProperties:
+  '-pins?$':
+    type: object
+    description: Pin muxing configuration.
+    $ref: /schemas/pinctrl/pinmux-node.yaml#
+    additionalProperties: false
+    properties:
+      pins: true
+      function:
+        enum: [gpio, timer0, timer1, uart_ssi, spi0, uart0, timer2, timer3,
+               timer_ext0, spi1, timer_ext1, ext_ref_clk, mipi_ref_clk]
+      bias-disable: true
+      bias-pull-down: true
+      bias-pull-up: true
+      drive-strength: true
+    required:
+      - pins
+      - function
+    allOf:
+      - if:
+          properties:
+            function:
+              const: gpio
+        then:
+          properties:
+            pins:
+              items: # PA0 - PA31
+                pattern: '^(PA[1,2]?[0-9]|PA3[0,1])$'
+      - if:
+          properties:
+            function:
+              const: timer0
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PA0, PA1]
+      - if:
+          properties:
+            function:
+              const: timer1
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PA2, PA3]
+      - if:
+          properties:
+            function:
+              const: uart_ssi
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PA4, PA5]
+      - if:
+          properties:
+            function:
+              const: spi0
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PA6, PA7, PA8, PA9, PA10]
+      - if:
+          properties:
+            function:
+              const: uart0
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PA11, PA12]
+      - if:
+          properties:
+            function:
+              const: timer2
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PA13, PA14]
+      - if:
+          properties:
+            function:
+              const: timer3
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PA15, PA16]
+      - if:
+          properties:
+            function:
+              const: timer_ext0
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PA17, PA18, PA19, PA20]
+      - if:
+          properties:
+            function:
+              const: spi1
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PA21, PA22, PA23, PA24, PA25]
+      - if:
+          properties:
+            function:
+              const: timer_ext1
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PA26, PA27, PA28, PA29]
+      - if:
+          properties:
+            function:
+              const: ext_ref_clk
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PA30]
+      - if:
+          properties:
+            function:
+              const: mipi_ref_clk
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PA31]
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - clocks
+  - clock-names
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      system-controller@e8400000 {
+        compatible = "mobileye,eyeq6lplus-olb", "syscon";
+        reg = <0 0xe8400000 0x0 0x80000>;
+        #reset-cells = <2>;
+        #clock-cells = <1>;
+        clocks = <&xtal>;
+        clock-names = "ref";
+      };
+    };
diff --git a/include/dt-bindings/clock/mobileye,eyeq6lplus-clk.h b/include/dt-bindings/clock/mobileye,eyeq6lplus-clk.h
new file mode 100644
index 000000000000..20d84ee24ad5
--- /dev/null
+++ b/include/dt-bindings/clock/mobileye,eyeq6lplus-clk.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2025 Mobileye Vision Technologies Ltd.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_MOBILEYE_EYEQ6LPLUS_CLK_H
+#define _DT_BINDINGS_CLOCK_MOBILEYE_EYEQ6LPLUS_CLK_H
+
+#define EQ6LPC_PLL_CPU		0
+#define EQ6LPC_PLL_DDR		1
+#define EQ6LPC_PLL_PER		2
+#define EQ6LPC_PLL_VDI		3
+#define EQ6LPC_PLL_ACC		4
+
+#define EQ6LPC_CPU_OCC		5
+
+#define EQ6LPC_ACC_VDI		6
+#define EQ6LPC_ACC_OCC		7
+#define EQ6LPC_ACC_FCMU		8
+
+#define EQ6LPC_DDR_OCC		9
+
+#define EQ6LPC_PER_OCC		10
+#define EQ6LPC_PER_I2C_SER	11
+#define EQ6LPC_PER_PCLK		12
+#define EQ6LPC_PER_TSU		13
+#define EQ6LPC_PER_OSPI		14
+#define EQ6LPC_PER_GPIO		15
+#define EQ6LPC_PER_TIMER	16
+#define EQ6LPC_PER_I2C		17
+#define EQ6LPC_PER_UART		18
+#define EQ6LPC_PER_SPI		19
+#define EQ6LPC_PER_PERIPH	20
+
+#define EQ6LPC_VDI_OCC		21
+
+#endif

-- 
2.52.0


