Return-Path: <linux-mips+bounces-3785-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 298D6910EAB
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 19:32:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4968A1C23103
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 17:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B9F81B580A;
	Thu, 20 Jun 2024 17:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Pb6JpKYh"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6791B47B2;
	Thu, 20 Jun 2024 17:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718904709; cv=none; b=ezqbUxYWuJYKMjcDvgGixJMGQwbWTTQbV6xILTtY84IYmlMfunAMDgkjsKAdCGW8hwQ09mDZv9CPnUifmmQ1cedwdFlNbFgFD5yV0UUtMcrnuWncr9jkIQRA+7BRgBVhni0e98Kxj82oxjgiEz4YI4naPxkUbSN/WCn3eDbqW4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718904709; c=relaxed/simple;
	bh=4H4wXk7hZPQfxxLVqLH3jjQuollqBVQfWbKHI422gL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ljo4d6RQpWB21h0lpfUpEyvvzq/8O5//0II4XYJ3ycqbaU8rPMAI7NqUKNsph2PMohVtKNPhkwLhyjwrdli4+gpm88gt87OunjqlGUYzYgQ5mWDxRPLF0euXC/en52VD9YW4l3TwoAeFKqIq1qLlZAJNPQjl/DMLIjQRM8vgxN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Pb6JpKYh; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A294A1C0003;
	Thu, 20 Jun 2024 17:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718904704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aPkbTrntGG7PQb6h4JvbtXFqJl4BhNA8xkpz5OlKfp0=;
	b=Pb6JpKYhLQpfEgujaOld4SEolzlthLuvzdb5KP+e7Qqj1PO63uBf9qmeZ6O9j00pCfTBme
	1e/evEuBV9ytLmFmMKNiGbIU6QkB6w0HsX3OZz8YuuZ/e4AUbpIOb239Zq2qGq0qt204bV
	N+Y2EhLWZ0olRwd87fMIaV4egGK6NDtrTY4mddA/9ApJeNoBO7MzJSVuZkyuZ3AyaCy/IM
	VqbNa9Sb6+zKcu5qS6KzTiFSap0huIJU67q4k6wxyDTkT5FP2buC3zfM6VOoCzXEmRVmfQ
	8p7deervvtOFppEGADlVTCQNQilq45zEJRb8BpJUmMyqkzcjw3ZTFVowvNmJnA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 20 Jun 2024 19:30:56 +0200
Subject: [PATCH v3 4/9] dt-bindings: soc: mobileye: add EyeQ OLB system
 controller
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240620-mbly-olb-v3-4-5f29f8ca289c@bootlin.com>
References: <20240620-mbly-olb-v3-0-5f29f8ca289c@bootlin.com>
In-Reply-To: <20240620-mbly-olb-v3-0-5f29f8ca289c@bootlin.com>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Lee Jones <lee@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.0
X-GND-Sasl: theo.lebrun@bootlin.com

Add documentation to describe the "Other Logic Block" system-controller.
It deals with three platforms: EyeQ5, EyeQ6L and EyeQ6H. First two have
a single instance, whereas EyeQ6H has seven named instances.

Features provided are:
 - Clocks, children to main crystal. Some PLLs and divider clocks.
 - Resets. Some instances DO NOT have reset.
 - Pinctrl. Only EyeQ5 has such feature.

Those are NOT the only features exposed in OLB system-controllers! Many
individual registers, related to IP block integration, can be found.
Additional features will be exposed over time.

We simplify devicetree phandles to OLB in two ways:

 - Compatibles exposing a single clock do not ask for a index argument.
   This means we use EyeQ6H OLB south (it has four clocks):

      clocks = <&olb_south EQ6HC_SOUTH_PLL_PER>;

   But use EyeQ6H OLB east (it has one clock):

      clocks = <&olb_east>;

 - Compatibles exposing a single reset domain do not ask for a domain
   index, only a reset index.
   This means we use EyeQ5 OLB (it has three domains):

     resets = <&olb 0 10>;

   But use EyeQ6H west reset (it has one domain):

      resets = <&olb_west 3>;

About pinctrl subnodes: all pins have two functionality, either GPIO or
something-else. The latter is pin dependent, we express constraints
using many if-then.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 .../bindings/soc/mobileye/mobileye,eyeq5-olb.yaml  | 374 +++++++++++++++++++++
 MAINTAINERS                                        |   2 +
 include/dt-bindings/clock/mobileye,eyeq5-clk.h     |  21 ++
 3 files changed, 397 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq5-olb.yaml b/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq5-olb.yaml
new file mode 100644
index 000000000000..f7e606d45ebc
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq5-olb.yaml
@@ -0,0 +1,374 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/mobileye/mobileye,eyeq5-olb.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mobileye EyeQ SoC system controller
+
+maintainers:
+  - Grégory Clement <gregory.clement@bootlin.com>
+  - Théo Lebrun <theo.lebrun@bootlin.com>
+  - Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
+
+description:
+  OLB ("Other Logic Block") is a hardware block grouping smaller blocks. Clocks,
+  resets, pinctrl are being handled from here. EyeQ5 and EyeQ6L host a single
+  instance. EyeQ6H hosts seven instances.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mobileye,eyeq5-olb
+          - mobileye,eyeq6l-olb
+          - mobileye,eyeq6h-acc-olb
+          - mobileye,eyeq6h-central-olb
+          - mobileye,eyeq6h-east-olb
+          - mobileye,eyeq6h-west-olb
+          - mobileye,eyeq6h-south-olb
+          - mobileye,eyeq6h-ddr0-olb
+          - mobileye,eyeq6h-ddr1-olb
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  '#reset-cells':
+    description:
+      First cell is domain and optional if compatible has a single reset domain.
+      Second cell is reset index inside that domain.
+    enum: [ 1, 2 ]
+
+  '#clock-cells':
+    description:
+      Cell is clock index. Optional if compatible has a single clock.
+    enum: [ 0, 1 ]
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
+        enum: [gpio,
+               # Bank A
+               timer0, timer1, timer2, timer5, uart0, uart1, can0, can1, spi0,
+               spi1, refclk0,
+               # Bank B
+               timer3, timer4, timer6, uart2, can2, spi2, spi3, mclk0]
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
+              items: # PA0 - PA28, PB0 - PB22
+                pattern: '^(P(A|B)1?[0-9]|PA2[0-8]|PB2[0-2])$'
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
+              const: timer2
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PA4, PA5]
+      - if:
+          properties:
+            function:
+              const: timer5
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PA6, PA7, PA8, PA9]
+      - if:
+          properties:
+            function:
+              const: uart0
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PA10, PA11]
+      - if:
+          properties:
+            function:
+              const: uart1
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PA12, PA13]
+      - if:
+          properties:
+            function:
+              const: can0
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PA14, PA15]
+      - if:
+          properties:
+            function:
+              const: can1
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PA16, PA17]
+      - if:
+          properties:
+            function:
+              const: spi0
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PA18, PA19, PA20, PA21, PA22]
+      - if:
+          properties:
+            function:
+              const: spi1
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PA23, PA24, PA25, PA26, PA27]
+      - if:
+          properties:
+            function:
+              const: refclk0
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PA28]
+      - if:
+          properties:
+            function:
+              const: timer3
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PB0, PB1]
+      - if:
+          properties:
+            function:
+              const: timer4
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PB2, PB3]
+      - if:
+          properties:
+            function:
+              const: timer6
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PB4, PB5, PB6, PB7]
+      - if:
+          properties:
+            function:
+              const: uart2
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PB8, PB9]
+      - if:
+          properties:
+            function:
+              const: can2
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PB10, PB11]
+      - if:
+          properties:
+            function:
+              const: spi2
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PB12, PB13, PB14, PB15, PB16]
+      - if:
+          properties:
+            function:
+              const: spi3
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PB17, PB18, PB19, PB20, PB21]
+      - if:
+          properties:
+            function:
+              const: mclk0
+        then:
+          properties:
+            pins:
+              items:
+                enum: [PB22]
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+allOf:
+    # Compatibles exposing a single reset domain.
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mobileye,eyeq6h-acc-olb
+              - mobileye,eyeq6h-east-olb
+              - mobileye,eyeq6h-west-olb
+    then:
+      properties:
+        '#reset-cells':
+          const: 1
+      required:
+        - '#reset-cells'
+
+    # Compatibles exposing two reset domains.
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mobileye,eyeq5-olb
+              - mobileye,eyeq6l-olb
+    then:
+      properties:
+        '#reset-cells':
+          const: 2
+      required:
+        - '#reset-cells'
+
+    # Compatibles not exposing resets.
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mobileye,eyeq6h-central-olb
+              - mobileye,eyeq6h-south-olb
+              - mobileye,eyeq6h-ddr0-olb
+              - mobileye,eyeq6h-ddr1-olb
+    then:
+      properties:
+        '#reset-cells': false
+
+    # Compatibles exposing a single clock.
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mobileye,eyeq6h-central-olb
+              - mobileye,eyeq6h-east-olb
+              - mobileye,eyeq6h-west-olb
+              - mobileye,eyeq6h-ddr0-olb
+              - mobileye,eyeq6h-ddr1-olb
+    then:
+      properties:
+        '#clock-cells':
+          const: 0
+    else:
+      properties:
+        '#clock-cells':
+          const: 1
+
+    # Only EyeQ5 has pinctrl in OLB.
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              const: mobileye,eyeq5-olb
+    then:
+      patternProperties:
+        '-pins?$': false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      system-controller@e00000 {
+        compatible = "mobileye,eyeq5-olb", "syscon";
+        reg = <0 0xe00000 0x0 0x400>;
+        #reset-cells = <2>;
+        #clock-cells = <1>;
+        clocks = <&xtal>;
+        clock-names = "ref";
+      };
+    };
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      system-controller@d2003000 {
+        compatible = "mobileye,eyeq6h-acc-olb", "syscon";
+        reg = <0x0 0xd2003000 0x0 0x1000>;
+        #reset-cells = <1>;
+        #clock-cells = <1>;
+        clocks = <&xtal>;
+        clock-names = "ref";
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index aa3b947fb080..fcc9f4364a5d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14926,9 +14926,11 @@ M:	Théo Lebrun <theo.lebrun@bootlin.com>
 L:	linux-mips@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/mips/mobileye.yaml
+F:	Documentation/devicetree/bindings/soc/mobileye/
 F:	arch/mips/boot/dts/mobileye/
 F:	arch/mips/configs/eyeq5_defconfig
 F:	arch/mips/mobileye/board-epm5.its.S
+F:	include/dt-bindings/clock/mobileye,eyeq5-clk.h
 
 MODULE SUPPORT
 M:	Luis Chamberlain <mcgrof@kernel.org>
diff --git a/include/dt-bindings/clock/mobileye,eyeq5-clk.h b/include/dt-bindings/clock/mobileye,eyeq5-clk.h
index 26d8930335e4..b433c1772c28 100644
--- a/include/dt-bindings/clock/mobileye,eyeq5-clk.h
+++ b/include/dt-bindings/clock/mobileye,eyeq5-clk.h
@@ -19,4 +19,25 @@
 
 #define EQ5C_DIV_OSPI	10
 
+#define EQ6LC_PLL_DDR		0
+#define EQ6LC_PLL_CPU		1
+#define EQ6LC_PLL_PER		2
+#define EQ6LC_PLL_VDI		3
+
+#define EQ6HC_SOUTH_PLL_VDI		0
+#define EQ6HC_SOUTH_PLL_PCIE		1
+#define EQ6HC_SOUTH_PLL_PER		2
+#define EQ6HC_SOUTH_PLL_ISP		3
+
+#define EQ6HC_SOUTH_DIV_EMMC		4
+#define EQ6HC_SOUTH_DIV_OSPI_REF	5
+#define EQ6HC_SOUTH_DIV_OSPI_SYS	6
+#define EQ6HC_SOUTH_DIV_TSU		7
+
+#define EQ6HC_ACC_PLL_XNN		0
+#define EQ6HC_ACC_PLL_VMP		1
+#define EQ6HC_ACC_PLL_PMA		2
+#define EQ6HC_ACC_PLL_MPC		3
+#define EQ6HC_ACC_PLL_NOC		4
+
 #endif

-- 
2.45.2


