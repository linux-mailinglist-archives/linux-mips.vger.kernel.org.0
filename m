Return-Path: <linux-mips+bounces-3784-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F01F910EA0
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 19:32:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 643471C22C4C
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 17:32:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B14A1B4C3A;
	Thu, 20 Jun 2024 17:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JpTxVP9P"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432AC1B3731;
	Thu, 20 Jun 2024 17:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718904708; cv=none; b=AQ2J2a5Y/kXiAPpl9iMg6/SQRvgEaYIHq/2MTDvJozpdnpinaGhXnheVU0egy+ML2psoV4PFcCEGs9/y9SpUypke3IF7zpbtiLPMDikSn+Ge6584vWExCboUovrwTe6MKg27gkgj81JVrO0uoCNK8oJ00CMkUcll40HmBOE18s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718904708; c=relaxed/simple;
	bh=lF4uvVYi3A1DSRKU0b3lR3oI2v7WzpNONqhWSNs2bFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RPoHymlN7IKVHVdCiODi4Pl7An+Ow+FJSeqbXKFd5Bq4CEpWJCmC2zToPbBKCWpurNsOiGT7CbvkHi3qeL5T0FbFM++6uE51iqHsIUzhhAdQRHRz2emb7kb2wM+lSa25weWZAuCePHZFm3rLm9GBCH6d89qhX+70JwgQpPiAdRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JpTxVP9P; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 95F3F1C0006;
	Thu, 20 Jun 2024 17:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718904703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Z0Mp7tiPuxScQOYH3IwlMPJYbSkKmwXVwDonqT/zkQ=;
	b=JpTxVP9PYVck7dvvlz2iezrfZTsO1bMT+8yr02Zs3VLpeNPyXYh+2a8RZidy4eTJLyuU6A
	5ZB9+keKOxOAk7q7UQjOAKi5jEDv+XJZt3Bq1s+6a2dGXzyIkKRJKIXF2DSHDc7pL5CNLN
	x93srnzxRB/W4le4Tqt8KgUXE6NJftKy7yOrolI8pZnLBFg2nIQMWTAU5K019oV/d5i4I+
	0NpwlqMJ+KDNHOoNZLjQ/amwPCSZEFRzynUFOwbUSydBQMAr0Uoznmdx7DsgwPmCdoEddi
	urBSuXhTUP7vVm6ko0eRD0/p+RKfFVp6Yl1EKvXMIEMxpwR5pETTULFzmWMxWw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 20 Jun 2024 19:30:55 +0200
Subject: [PATCH v3 3/9] Revert "dt-bindings: pinctrl:
 mobileye,eyeq5-pinctrl: add bindings"
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240620-mbly-olb-v3-3-5f29f8ca289c@bootlin.com>
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

Switch from one sub-node per functionality in the system-controller to a
single node representing the entire OLB instance. This is the
recommended approach for controllers handling many different
functionalities; it is a single controller and should be represented by
a single devicetree node.

The pinctrl bindings is removed and all properties will be described by:
soc/mobileye/mobileye,eyeq5-olb.yaml

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 .../bindings/pinctrl/mobileye,eyeq5-pinctrl.yaml   | 242 ---------------------
 1 file changed, 242 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mobileye,eyeq5-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mobileye,eyeq5-pinctrl.yaml
deleted file mode 100644
index 5f00604bf48c..000000000000
--- a/Documentation/devicetree/bindings/pinctrl/mobileye,eyeq5-pinctrl.yaml
+++ /dev/null
@@ -1,242 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/pinctrl/mobileye,eyeq5-pinctrl.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Mobileye EyeQ5 pin controller
-
-description: >
-  The EyeQ5 pin controller handles the two pin banks of the system. It belongs
-  to a system-controller block called OLB.
-
-  Pin control is about bias (pull-down, pull-up), drive strength and muxing. Pin
-  muxing supports two functions for each pin: first is GPIO, second is
-  pin-dependent.
-
-  Pins and groups are bijective.
-
-maintainers:
-  - Grégory Clement <gregory.clement@bootlin.com>
-  - Théo Lebrun <theo.lebrun@bootlin.com>
-  - Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
-
-$ref: pinctrl.yaml#
-
-properties:
-  compatible:
-    enum:
-      - mobileye,eyeq5-pinctrl
-
-  reg:
-    maxItems: 1
-
-patternProperties:
-  "-pins?$":
-    type: object
-    description: Pin muxing configuration.
-    $ref: pinmux-node.yaml#
-    additionalProperties: false
-    properties:
-      pins: true
-      function:
-        enum: [gpio,
-               # Bank A
-               timer0, timer1, timer2, timer5, uart0, uart1, can0, can1, spi0,
-               spi1, refclk0,
-               # Bank B
-               timer3, timer4, timer6, uart2, can2, spi2, spi3, mclk0]
-      bias-disable: true
-      bias-pull-down: true
-      bias-pull-up: true
-      drive-strength: true
-    required:
-      - pins
-      - function
-    allOf:
-      - if:
-          properties:
-            function:
-              const: gpio
-        then:
-          properties:
-            pins:
-              items: # PA0 - PA28, PB0 - PB22
-                pattern: '^(P(A|B)1?[0-9]|PA2[0-8]|PB2[0-2])$'
-      - if:
-          properties:
-            function:
-              const: timer0
-        then:
-          properties:
-            pins:
-              items:
-                enum: [PA0, PA1]
-      - if:
-          properties:
-            function:
-              const: timer1
-        then:
-          properties:
-            pins:
-              items:
-                enum: [PA2, PA3]
-      - if:
-          properties:
-            function:
-              const: timer2
-        then:
-          properties:
-            pins:
-              items:
-                enum: [PA4, PA5]
-      - if:
-          properties:
-            function:
-              const: timer5
-        then:
-          properties:
-            pins:
-              items:
-                enum: [PA6, PA7, PA8, PA9]
-      - if:
-          properties:
-            function:
-              const: uart0
-        then:
-          properties:
-            pins:
-              items:
-                enum: [PA10, PA11]
-      - if:
-          properties:
-            function:
-              const: uart1
-        then:
-          properties:
-            pins:
-              items:
-                enum: [PA12, PA13]
-      - if:
-          properties:
-            function:
-              const: can0
-        then:
-          properties:
-            pins:
-              items:
-                enum: [PA14, PA15]
-      - if:
-          properties:
-            function:
-              const: can1
-        then:
-          properties:
-            pins:
-              items:
-                enum: [PA16, PA17]
-      - if:
-          properties:
-            function:
-              const: spi0
-        then:
-          properties:
-            pins:
-              items:
-                enum: [PA18, PA19, PA20, PA21, PA22]
-      - if:
-          properties:
-            function:
-              const: spi1
-        then:
-          properties:
-            pins:
-              items:
-                enum: [PA23, PA24, PA25, PA26, PA27]
-      - if:
-          properties:
-            function:
-              const: refclk0
-        then:
-          properties:
-            pins:
-              items:
-                enum: [PA28]
-      - if:
-          properties:
-            function:
-              const: timer3
-        then:
-          properties:
-            pins:
-              items:
-                enum: [PB0, PB1]
-      - if:
-          properties:
-            function:
-              const: timer4
-        then:
-          properties:
-            pins:
-              items:
-                enum: [PB2, PB3]
-      - if:
-          properties:
-            function:
-              const: timer6
-        then:
-          properties:
-            pins:
-              items:
-                enum: [PB4, PB5, PB6, PB7]
-      - if:
-          properties:
-            function:
-              const: uart2
-        then:
-          properties:
-            pins:
-              items:
-                enum: [PB8, PB9]
-      - if:
-          properties:
-            function:
-              const: can2
-        then:
-          properties:
-            pins:
-              items:
-                enum: [PB10, PB11]
-      - if:
-          properties:
-            function:
-              const: spi2
-        then:
-          properties:
-            pins:
-              items:
-                enum: [PB12, PB13, PB14, PB15, PB16]
-      - if:
-          properties:
-            function:
-              const: spi3
-        then:
-          properties:
-            pins:
-              items:
-                enum: [PB17, PB18, PB19, PB20, PB21]
-      - if:
-          properties:
-            function:
-              const: mclk0
-        then:
-          properties:
-            pins:
-              items:
-                enum: [PB22]
-
-required:
-  - compatible
-  - reg
-
-additionalProperties: false

-- 
2.45.2


