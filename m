Return-Path: <linux-mips+bounces-4026-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C76DA91C377
	for <lists+linux-mips@lfdr.de>; Fri, 28 Jun 2024 18:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B58128519B
	for <lists+linux-mips@lfdr.de>; Fri, 28 Jun 2024 16:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D57581CB328;
	Fri, 28 Jun 2024 16:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TvRt6fuJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D80D1C8FC3;
	Fri, 28 Jun 2024 16:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719591122; cv=none; b=b5+vVdwci3YFT2j8YWqxDYD6ZRQnbStIcTxr9+GmLSsGrIP+1dbeQdEhHhxlW+C0jltJhxgE7V+XIWmGC+bBoC9xqCC3B04jYpDzPlZqhEt0A4lMWcN6zp0i8TPQEP4XnbPW874U7lMkurkMUs/XqqbA5N+Zmq9zDe/uCZt/EWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719591122; c=relaxed/simple;
	bh=53tZpwObTZwGjXh7smbQhVOeFk8CQ2QZTT9+WlMyv68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d8jE0yzQoNoLtQb1nTfIrvza0njjKSd6BQFRhDL9a66YdUXoSVGzVp3K5XIQ9+eU5h9OMSlXgV0vP4o1m8YbheXgcYjauvMnqNVYQjW50X4H36iRszCx7MUH63xSnVb5OWZR5H4kE6+95spXKheRZjY20PLZmKjjMeF5VkDlLdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TvRt6fuJ; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BFE7D1BF213;
	Fri, 28 Jun 2024 16:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719591113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DUjUGJeQ+ewBheC0dqXOWHW/zt+4Fi5gvhxjbKZOTCg=;
	b=TvRt6fuJMKYXTKPqpv0J19+3NggjvD9qajRhy9ZGfSiO4igH7RGEswYO2KnsVX/8pTA1PL
	kFCWiNI2EquR++TuaD1pdNQCP63U/QRED/UwnX8n6R7dJTDzk0m5VOeFgX7FBrh3u3AQ+E
	45cmGq8hqh9n1QPk043zTSuV0Pk11g6Lozcn7aBLTWhb2zo6RlIASsbf9hQ1Bin/13lbLA
	xP2jXxaFhRgQ5iLiF/vGb9TUHBJHelAmFW0Q+1HgO6vbJCy/cmEAl2yorMzMyElBOuZcbd
	/4BInhJS6MEb1c7Rn9oK5vmvtOIyM8yjMO5J0hBUq7QLcRlBMzkdax+ltCGIbQ==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Fri, 28 Jun 2024 18:11:50 +0200
Subject: [PATCH 1/3] dt-bindings: soc: mobileye: add EyeQ OLB system
 controller
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240628-mbly-mips-v1-1-f53f5e4c422b@bootlin.com>
References: <20240628-mbly-mips-v1-0-f53f5e4c422b@bootlin.com>
In-Reply-To: <20240628-mbly-mips-v1-0-f53f5e4c422b@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.15-dev-13183
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 .../bindings/soc/mobileye/mobileye,eyeq5-olb.yaml  | 374 +++++++++++++++++++++
 1 file changed, 374 insertions(+)

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

-- 
2.45.2


