Return-Path: <linux-mips+bounces-12501-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 995D2CC7F1B
	for <lists+linux-mips@lfdr.de>; Wed, 17 Dec 2025 14:47:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 64D2C3048639
	for <lists+linux-mips@lfdr.de>; Wed, 17 Dec 2025 13:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4369434E746;
	Wed, 17 Dec 2025 13:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="koUragWV"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE083491F2;
	Wed, 17 Dec 2025 13:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765978585; cv=none; b=i/Wfc+MLCNH3d7voDkR+TjO59r+ACn5y8BbvrFUuUwSxesILHK532J27MdMV8BxD6ujZAgvuYqEgGVm9dTQR/XmtW4Odb2nXckocIeI+OxyvPn0pO6Bx01pafqoy/UC7GjzOlFGDl5g/cwgtImkE6EeGSyKTfsrxf+Ed1sPqXgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765978585; c=relaxed/simple;
	bh=o+GupeOY+r8YgZyrxObSLVD5EDmnxFMJhuyE/zSzo5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N7j8jOTZaFvaHMIWx+Tl6PfqKRnpEzfK0dl1xSDXRongvAX2m4hwxFw49NZkBEkhp2BVfASbYilQY8l1yebOMbgb3hUfp/2qGZaZcqO0Y7Kbioe0+75afXG26fDKlJOo/mBfOaNdYGf8se28N9BbhxxznvmowZhoGuvn+sEMAk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=koUragWV; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E73D81A2288;
	Wed, 17 Dec 2025 13:36:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BCBFD6072F;
	Wed, 17 Dec 2025 13:36:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 46B08102F0ACD;
	Wed, 17 Dec 2025 14:36:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765978573; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wJxpBB208Og7ZQlj+uLD1FyOcfIwt0XO1SwVAEfmt+E=;
	b=koUragWVKqMauhHvBk2M5mCyonIS/bLwFPekO8yZSjZBUrMYwRw13+uqyT4vAdJkYvKPBX
	OKuo/rwYo+nHQGdbQepwzxaiVDWPGQbIPCrPiqMclN5U3MSIsImgDrdBYgqRRwMhTXW+FS
	vRnJI2iByHgKkKyn5WgIWh9K2zcYExrnA7VuzcrQQfCtqnWmq8kyo36i+Zfl9yksaHd0aa
	fwtFfua8Oyr73ZJPraPB9UkC9lhUrzKVcMnA56LB5s2C7VrYgGWNaAzG5QTSr7ohqxuNuW
	iBSMtKsfMokedl4BSEonVK054DsQtqHCt79Nlhbzf1cU8anRbtt8yx4UKb+5/g==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 17 Dec 2025 14:35:52 +0100
Subject: [PATCH 02/13] dt-bindings: soc: mobileye: Add EyeQ6Lplus OLB
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251217-eyeq6lplus-v1-2-e9cdbd3af4c2@bootlin.com>
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

The "Other Logic Block" found in the EyeQ6Lplus from Mobileye provides
various functions for the controllers present in the SoC.

The OLB produces 22 clocks derived from its input, which is connected
to the main oscillator of the SoC.

It provides reset signals via two reset domains.

It also controls 32 pins to be either a GPIO or an alternate function.

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


