Return-Path: <linux-mips+bounces-9601-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C147AF06B5
	for <lists+linux-mips@lfdr.de>; Wed,  2 Jul 2025 00:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D97C1C05E76
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jul 2025 22:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62C5228312E;
	Tue,  1 Jul 2025 22:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TLYvXWMm"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EC91465A1;
	Tue,  1 Jul 2025 22:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751410441; cv=none; b=mJKBfmf06Cw4gpnQarkfbttc5HLlbcEJMad2p0spCEN5skvTYNlMtgI1LB0sAB5ZdZGH1xinb9PjY74Q5Jus4EpAdy2FgIi6b2ypdWnKzU4bK8rs2gW/qlYzm012Fmg3ugyJ6RJRLEqp5WvPsMDJC3uFaOCgPWtYo6Pw3Zi5DmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751410441; c=relaxed/simple;
	bh=4lr2RLEbUpnITU4V7bmYHUkiT+nk+EHlKhuQ2bFKCrk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pcAVWvghQBNChkC1N6WByu/xe6YntDkD+o4POUBBbcBOhMhiG+MyVJ3nZEvimEDfohyhh5KbvpsxWKXtefTb7kzL4b2T6FcOm8lduT2OHCj3Vlq/X4vcdVuIs90keS0RK4rBhDfM6CHEpD+tKX7hwS5jNzaBXzh/Hlkcxf7qxPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TLYvXWMm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D1EDC4CEEB;
	Tue,  1 Jul 2025 22:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751410440;
	bh=4lr2RLEbUpnITU4V7bmYHUkiT+nk+EHlKhuQ2bFKCrk=;
	h=From:To:Cc:Subject:Date:From;
	b=TLYvXWMm4ggfYlz/+mG8RBgwc++pdGk2tNrSousr4zWJxrL7CLeX6bnYmtTpXEQC+
	 ZN2wolQSRt6hPLCfqniqhaGqM3BtCAboXZXnSPRmMRgeUsn1Ddaz+9MdSTL1IPnMPo
	 RsxkGVM+azP7d6iuha8Piuvh3zOkbFFj+rT6KtTSAAGfMkip4PYDSEXXJ4oHdweXRt
	 S8LnkVmvc0PlNGgQvdDvGGyRKo6+aBfPSV8azNebkja9l7kuXrAZFdrsv2NuFTf1Pg
	 tR+9b1vqOBTJ/32DSMz1yxtyymNRwyUfTnk+j9gLpVd1HW1XjbziJxlWPGxCy56960
	 5cGK2WUnDJtYw==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH] dt-bindings: gpio: Create a trivial GPIO schema
Date: Tue,  1 Jul 2025 17:53:50 -0500
Message-ID: <20250701225355.2977294-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Many simple GPIO controllers without interrupt capability have the same
schema other than their compatible value. Combine all these bindings
into a single schema. The criteria to be included here is must use 2
cells, have no interrupt capability, have 0 or 1 "reg" entries, and
have no other resources (like clocks).

Note that "ngpios" is now allowed in some cases it wasn't before and
constraints on it have been dropped.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
We could also do this for ones with interrupts, but that seems a bit
more varied.
---
 .../devicetree/bindings/gpio/fcs,fxl6408.yaml |  59 ----------
 .../bindings/gpio/gateworks,pld-gpio.txt      |  19 ----
 .../devicetree/bindings/gpio/gpio-lp3943.txt  |  37 -------
 .../bindings/gpio/gpio-max77620.txt           |  25 -----
 .../devicetree/bindings/gpio/gpio-moxtet.txt  |  18 ---
 .../devicetree/bindings/gpio/gpio-palmas.txt  |  27 -----
 .../bindings/gpio/gpio-pca9570.yaml           |  56 ----------
 .../bindings/gpio/gpio-tpic2810.yaml          |  51 ---------
 .../devicetree/bindings/gpio/gpio-ts4800.txt  |  20 ----
 .../devicetree/bindings/gpio/gpio-ts4900.txt  |  30 -----
 .../devicetree/bindings/gpio/gpio-xgene.txt   |  22 ----
 .../bindings/gpio/ibm,ppc4xx-gpio.txt         |  24 ----
 .../bindings/gpio/loongson,ls1x-gpio.yaml     |  49 ---------
 .../bindings/gpio/nintendo,hollywood-gpio.txt |  26 -----
 .../gpio/rockchip,rk3328-grf-gpio.yaml        |  50 ---------
 .../bindings/gpio/snps,creg-gpio.txt          |  21 ----
 .../devicetree/bindings/gpio/ti,7416374.yaml  |  56 ----------
 .../bindings/gpio/trivial-gpio.yaml           | 104 ++++++++++++++++++
 18 files changed, 104 insertions(+), 590 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/fcs,fxl6408.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/gateworks,pld-gpio.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-lp3943.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-max77620.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-moxtet.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-palmas.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-tpic2810.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-ts4800.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-ts4900.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-xgene.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/ibm,ppc4xx-gpio.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/loongson,ls1x-gpio.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/nintendo,hollywood-gpio.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/rockchip,rk3328-grf-gpio.yaml
 delete mode 100644 Documentation/devicetree/bindings/gpio/snps,creg-gpio.txt
 delete mode 100644 Documentation/devicetree/bindings/gpio/ti,7416374.yaml
 create mode 100644 Documentation/devicetree/bindings/gpio/trivial-gpio.yaml

diff --git a/Documentation/devicetree/bindings/gpio/fcs,fxl6408.yaml b/Documentation/devicetree/bindings/gpio/fcs,fxl6408.yaml
deleted file mode 100644
index b74fa81e7d05..000000000000
--- a/Documentation/devicetree/bindings/gpio/fcs,fxl6408.yaml
+++ /dev/null
@@ -1,59 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/gpio/fcs,fxl6408.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Fairchild FXL6408 I2C GPIO Expander
-
-maintainers:
-  - Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
-
-properties:
-  compatible:
-    enum:
-      - fcs,fxl6408
-
-  reg:
-    maxItems: 1
-
-  "#gpio-cells":
-    const: 2
-
-  gpio-controller: true
-
-  gpio-line-names:
-    minItems: 1
-    maxItems: 8
-
-patternProperties:
-  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
-    type: object
-    required:
-      - gpio-hog
-
-required:
-  - compatible
-  - reg
-  - gpio-controller
-  - "#gpio-cells"
-
-additionalProperties: false
-
-examples:
-  - |
-    i2c {
-        #address-cells = <1>;
-        #size-cells = <0>;
-
-        gpio_expander_43: gpio-expander@43 {
-            compatible = "fcs,fxl6408";
-            reg = <0x43>;
-            gpio-controller;
-            #gpio-cells = <2>;
-            gpio-line-names = "Wi-Fi_W_DISABLE", "Wi-Fi_WKUP_WLAN",
-                              "PWR_EN_+V3.3_WiFi_N", "PCIe_REF_CLK_EN",
-                              "USB_RESET_N", "USB_BYPASS_N", "Wi-Fi_PDn",
-                              "Wi-Fi_WKUP_BT";
-        };
-    };
diff --git a/Documentation/devicetree/bindings/gpio/gateworks,pld-gpio.txt b/Documentation/devicetree/bindings/gpio/gateworks,pld-gpio.txt
deleted file mode 100644
index d543fd1b8b23..000000000000
--- a/Documentation/devicetree/bindings/gpio/gateworks,pld-gpio.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-Gateworks PLD GPIO controller bindings
-
-The GPIO controller should be a child node on an I2C bus.
-
-Required properties:
-- compatible: Should be "gateworks,pld-gpio"
-- reg: I2C slave address
-- gpio-controller: Marks the device node as a GPIO controller.
-- #gpio-cells: Should be <2>. The first cell is the gpio number and
-  the second cell is used to specify optional parameters.
-
-Example:
-
-pld@56 {
-	compatible = "gateworks,pld-gpio";
-	reg = <0x56>;
-	gpio-controller;
-	#gpio-cells = <2>;
-};
diff --git a/Documentation/devicetree/bindings/gpio/gpio-lp3943.txt b/Documentation/devicetree/bindings/gpio/gpio-lp3943.txt
deleted file mode 100644
index 80fcb7d70e13..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-lp3943.txt
+++ /dev/null
@@ -1,37 +0,0 @@
-TI/National Semiconductor LP3943 GPIO controller
-
-Required properties:
-  - compatible: "ti,lp3943-gpio"
-  - gpio-controller: Marks the device node as a GPIO controller.
-  - #gpio-cells: Should be 2. See gpio.txt in this directory for a
-                 description of the cells format.
-
-Example:
-Simple LED controls with LP3943 GPIO controller
-
-&i2c4 {
-	lp3943@60 {
-		compatible = "ti,lp3943";
-		reg = <0x60>;
-
-		gpioex: gpio {
-			compatible = "ti,lp3943-gpio";
-			gpio-controller;
-			#gpio-cells = <2>;
-		};
-	};
-};
-
-leds {
-	compatible = "gpio-leds";
-	indicator1 {
-		label = "indi1";
-		gpios = <&gpioex 9 GPIO_ACTIVE_LOW>;
-	};
-
-	indicator2 {
-		label = "indi2";
-		gpios = <&gpioex 10 GPIO_ACTIVE_LOW>;
-		default-state = "off";
-	};
-};
diff --git a/Documentation/devicetree/bindings/gpio/gpio-max77620.txt b/Documentation/devicetree/bindings/gpio/gpio-max77620.txt
deleted file mode 100644
index 410e716fd3d2..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-max77620.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-GPIO driver for MAX77620 Power management IC from Maxim Semiconductor.
-
-Device has 8 GPIO pins which can be configured as GPIO as well as the
-special IO functions.
-
-Required properties:
--------------------
-- gpio-controller : 	Marks the device node as a gpio controller.
-- #gpio-cells : 	Should be two.  The first cell is the pin number and
-			the second cell is used to specify the gpio polarity:
-				0 = active high
-				1 = active low
-For more details, please refer generic GPIO DT binding document
-<devicetree/bindings/gpio/gpio.txt>.
-
-Example:
---------
-#include <dt-bindings/mfd/max77620.h>
-...
-max77620@3c {
-	compatible = "maxim,max77620";
-
-	gpio-controller;
-	#gpio-cells = <2>;
-};
diff --git a/Documentation/devicetree/bindings/gpio/gpio-moxtet.txt b/Documentation/devicetree/bindings/gpio/gpio-moxtet.txt
deleted file mode 100644
index 410759de9f09..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-moxtet.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-Turris Mox Moxtet GPIO expander via Moxtet bus
-
-Required properties:
- - compatible		: Should be "cznic,moxtet-gpio".
- - gpio-controller	: Marks the device node as a GPIO controller.
- - #gpio-cells		: Should be two. For consumer use see gpio.txt.
-
-Other properties are required for a Moxtet bus device, please refer to
-Documentation/devicetree/bindings/bus/moxtet.txt.
-
-Example:
-
-	moxtet_sfp: gpio@0 {
-		compatible = "cznic,moxtet-gpio";
-		gpio-controller;
-		#gpio-cells = <2>;
-		reg = <0>;
-	}
diff --git a/Documentation/devicetree/bindings/gpio/gpio-palmas.txt b/Documentation/devicetree/bindings/gpio/gpio-palmas.txt
deleted file mode 100644
index 08b5b52a3ae0..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-palmas.txt
+++ /dev/null
@@ -1,27 +0,0 @@
-Palmas GPIO controller bindings
-
-Required properties:
-- compatible:
-  - "ti,palams-gpio" for palma series of the GPIO controller
-  - "ti,tps80036-gpio" for Palma series device TPS80036.
-  - "ti,tps65913-gpio" for palma series device TPS65913.
-  - "ti,tps65914-gpio" for palma series device TPS65914.
-- #gpio-cells : Should be two.
-  - first cell is the gpio pin number
-  - second cell is used to specify the gpio polarity:
-      0 = active high
-      1 = active low
-- gpio-controller : Marks the device node as a GPIO controller.
-
-Note: This gpio node will be sub node of palmas node.
-
-Example:
-	palmas: tps65913@58 {
-		:::::::::::
-		palmas_gpio: palmas_gpio {
-			compatible = "ti,palmas-gpio";
-			gpio-controller;
-			#gpio-cells = <2>;
-		};
-		:::::::::::
-	};
diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
deleted file mode 100644
index 6f73961001b7..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
+++ /dev/null
@@ -1,56 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/gpio/gpio-pca9570.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: PCA9570 I2C GPO expander
-
-maintainers:
-  - Sungbo Eo <mans0n@gorani.run>
-
-properties:
-  compatible:
-    enum:
-      - dlg,slg7xl45106
-      - nxp,pca9570
-      - nxp,pca9571
-
-  reg:
-    maxItems: 1
-
-  gpio-controller: true
-
-  '#gpio-cells':
-    const: 2
-
-  gpio-line-names:
-    minItems: 4
-    maxItems: 8
-
-  label:
-    description: A descriptive name for this device.
-
-required:
-  - compatible
-  - reg
-  - gpio-controller
-  - "#gpio-cells"
-
-additionalProperties: false
-
-examples:
-  - |
-    i2c {
-        #address-cells = <1>;
-        #size-cells = <0>;
-
-        gpio@24 {
-            compatible = "nxp,pca9570";
-            reg = <0x24>;
-            gpio-controller;
-            #gpio-cells = <2>;
-        };
-    };
-
-...
diff --git a/Documentation/devicetree/bindings/gpio/gpio-tpic2810.yaml b/Documentation/devicetree/bindings/gpio/gpio-tpic2810.yaml
deleted file mode 100644
index 157969bc4c46..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-tpic2810.yaml
+++ /dev/null
@@ -1,51 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/gpio/gpio-tpic2810.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: TPIC2810 GPIO controller
-
-maintainers:
-  - Aswath Govindraju <a-govindraju@ti.com>
-
-properties:
-  compatible:
-    enum:
-      - ti,tpic2810
-
-  reg:
-    maxItems: 1
-
-  gpio-controller: true
-
-  "#gpio-cells":
-    const: 2
-
-  gpio-line-names:
-    minItems: 1
-    maxItems: 32
-
-required:
-  - compatible
-  - reg
-  - gpio-controller
-  - "#gpio-cells"
-
-additionalProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/gpio/gpio.h>
-
-    i2c {
-        #address-cells = <1>;
-        #size-cells = <0>;
-        gpio@60 {
-            compatible = "ti,tpic2810";
-            reg = <0x60>;
-            gpio-controller;
-            #gpio-cells = <2>;
-            gpio-line-names = "LED A", "LED B", "LED C";
-        };
-    };
diff --git a/Documentation/devicetree/bindings/gpio/gpio-ts4800.txt b/Documentation/devicetree/bindings/gpio/gpio-ts4800.txt
deleted file mode 100644
index 92ea9c8f6399..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-ts4800.txt
+++ /dev/null
@@ -1,20 +0,0 @@
-* TS-4800 FPGA's GPIO controller bindings
-
-Required properties:
-- compatible: Must be "technologic,ts4800-gpio".
-- #gpio-cells: Should be two. The first cell is the pin number.
-- reg: Physical base address of the controller and length
-       of memory mapped region.
-
-Optional property:
-- ngpios: See "gpio.txt"
-
-Example:
-
-gpio1: gpio {
-	compatible = "technologic,ts4800-gpio";
-	reg = <0x10020 0x6>;
-	ngpios = <8>;
-	gpio-controller;
-	#gpio-cells = <2>;
-};
diff --git a/Documentation/devicetree/bindings/gpio/gpio-ts4900.txt b/Documentation/devicetree/bindings/gpio/gpio-ts4900.txt
deleted file mode 100644
index 3f8e71b1ab2a..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-ts4900.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-* Technologic Systems I2C-FPGA's GPIO controller bindings
-
-This bindings describes the GPIO controller for Technologic's FPGA core.
-TS-4900's FPGA encodes the GPIO state on 3 bits, whereas the TS-7970's FPGA
-uses 2 bits: it doesn't use a dedicated input bit.
-
-Required properties:
-- compatible: Should be one of the following
-		"technologic,ts4900-gpio"
-		"technologic,ts7970-gpio"
-- reg: Physical base address of the controller and length
-       of memory mapped region.
-- #gpio-cells: Should be two. The first cell is the pin number.
-- gpio-controller: Marks the device node as a gpio controller.
-
-Optional property:
-- ngpios: Number of GPIOs this controller is instantiated with,
-  the default is 32. See gpio.txt for more details.
-
-Example:
-
-&i2c2 {
-	gpio8: gpio@28 {
-		compatible = "technologic,ts4900-gpio";
-		reg = <0x28>;
-		#gpio-cells = <2>;
-		gpio-controller;
-		ngpios = <32>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/gpio/gpio-xgene.txt b/Documentation/devicetree/bindings/gpio/gpio-xgene.txt
deleted file mode 100644
index 86dbb05e7758..000000000000
--- a/Documentation/devicetree/bindings/gpio/gpio-xgene.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-APM X-Gene SoC GPIO controller bindings
-
-This is a gpio controller that is part of the flash controller.
-This gpio controller controls a total of 48 gpios.
-
-Required properties:
-- compatible: "apm,xgene-gpio" for X-Gene GPIO controller
-- reg: Physical base address and size of the controller's registers
-- #gpio-cells: Should be two.
-	- first cell is the pin number
-	- second cell is used to specify the gpio polarity:
-		0 = active high
-		1 = active low
-- gpio-controller: Marks the device node as a GPIO controller.
-
-Example:
-	gpio0: gpio0@1701c000 {
-		compatible = "apm,xgene-gpio";
-		reg = <0x0 0x1701c000 0x0 0x40>;
-		gpio-controller;
-		#gpio-cells = <2>;
-	};
diff --git a/Documentation/devicetree/bindings/gpio/ibm,ppc4xx-gpio.txt b/Documentation/devicetree/bindings/gpio/ibm,ppc4xx-gpio.txt
deleted file mode 100644
index d58b3958f3ea..000000000000
--- a/Documentation/devicetree/bindings/gpio/ibm,ppc4xx-gpio.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-* IBM/AMCC/APM GPIO Controller for PowerPC 4XX series and compatible SoCs
-
-All GPIOs are pin-shared with other functions. DCRs control whether a
-particular pin that has GPIO capabilities acts as a GPIO or is used for
-another purpose. GPIO outputs are separately programmable to emulate
-an open-drain driver.
-
-Required properties:
-	- compatible: must be "ibm,ppc4xx-gpio"
-	- reg: address and length of the register set for the device
-	- #gpio-cells: must be set to 2. The first cell is the pin number
-		and the second cell is used to specify the gpio polarity:
-		0 = active high
-		1 = active low
-	- gpio-controller: marks the device node as a gpio controller.
-
-Example:
-
-GPIO0: gpio@ef600b00 {
-	compatible = "ibm,ppc4xx-gpio";
-	reg = <0xef600b00 0x00000048>;
-	#gpio-cells = <2>;
-	gpio-controller;
-};
diff --git a/Documentation/devicetree/bindings/gpio/loongson,ls1x-gpio.yaml b/Documentation/devicetree/bindings/gpio/loongson,ls1x-gpio.yaml
deleted file mode 100644
index 1a472c05697c..000000000000
--- a/Documentation/devicetree/bindings/gpio/loongson,ls1x-gpio.yaml
+++ /dev/null
@@ -1,49 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/gpio/loongson,ls1x-gpio.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Loongson-1 GPIO controller
-
-maintainers:
-  - Keguang Zhang <keguang.zhang@gmail.com>
-
-properties:
-  compatible:
-    const: loongson,ls1x-gpio
-
-  reg:
-    maxItems: 1
-
-  gpio-controller: true
-
-  "#gpio-cells":
-    const: 2
-
-  ngpios:
-    minimum: 1
-    maximum: 32
-
-required:
-  - compatible
-  - reg
-  - gpio-controller
-  - "#gpio-cells"
-  - ngpios
-
-additionalProperties: false
-
-examples:
-  - |
-    gpio0: gpio@1fd010c0 {
-        compatible = "loongson,ls1x-gpio";
-        reg = <0x1fd010c0 0x4>;
-
-        gpio-controller;
-        #gpio-cells = <2>;
-
-        ngpios = <32>;
-    };
-
-...
diff --git a/Documentation/devicetree/bindings/gpio/nintendo,hollywood-gpio.txt b/Documentation/devicetree/bindings/gpio/nintendo,hollywood-gpio.txt
deleted file mode 100644
index df63da46309c..000000000000
--- a/Documentation/devicetree/bindings/gpio/nintendo,hollywood-gpio.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-Nintendo Wii (Hollywood) GPIO controller
-
-Required properties:
-- compatible: "nintendo,hollywood-gpio"
-- reg: Physical base address and length of the controller's registers.
-- gpio-controller: Marks the device node as a GPIO controller.
-- #gpio-cells: Should be <2>. The first cell is the pin number and the
-  second cell is used to specify optional parameters:
-   - bit 0 specifies polarity (0 for normal, 1 for inverted).
-
-Optional properties:
-- ngpios: see Documentation/devicetree/bindings/gpio/gpio.txt
-- interrupt-controller: Marks the device node as an interrupt controller.
-- #interrupt-cells: Should be two.
-- interrupts: Interrupt specifier for the controller's Broadway (PowerPC)
-  interrupt.
-
-Example:
-
-	GPIO: gpio@d8000c0 {
-		#gpio-cells = <2>;
-		compatible = "nintendo,hollywood-gpio";
-		reg = <0x0d8000c0 0x40>;
-		gpio-controller;
-		ngpios = <24>;
-	}
diff --git a/Documentation/devicetree/bindings/gpio/rockchip,rk3328-grf-gpio.yaml b/Documentation/devicetree/bindings/gpio/rockchip,rk3328-grf-gpio.yaml
deleted file mode 100644
index d8cce73ea0ae..000000000000
--- a/Documentation/devicetree/bindings/gpio/rockchip,rk3328-grf-gpio.yaml
+++ /dev/null
@@ -1,50 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/gpio/rockchip,rk3328-grf-gpio.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Rockchip RK3328 General Register Files GPIO controller
-
-description:
-  The Rockchip RK3328 General Register File (GRF) outputs only the
-  GPIO_MUTE pin, originally for codec mute control, but it can also be used
-  for general purpose. It is manipulated by the GRF_SOC_CON10 register.
-  If needed in the future support for the HDMI pins can also be added.
-  The GPIO node should be declared as the child of the GRF node.
-
-  The GPIO_MUTE pin is referred to in the format
-
-  <&grf_gpio 0 GPIO_ACTIVE_LOW>
-
-  The first cell is the pin number and
-  the second cell is used to specify the GPIO polarity
-    0 = Active high
-    1 = Active low
-
-maintainers:
-  - Heiko Stuebner <heiko@sntech.de>
-
-properties:
-  compatible:
-    const: rockchip,rk3328-grf-gpio
-
-  gpio-controller: true
-
-  "#gpio-cells":
-    const: 2
-
-required:
-  - compatible
-  - gpio-controller
-  - "#gpio-cells"
-
-additionalProperties: false
-
-examples:
-  - |
-    grf_gpio: gpio {
-      compatible = "rockchip,rk3328-grf-gpio";
-      gpio-controller;
-      #gpio-cells = <2>;
-    };
diff --git a/Documentation/devicetree/bindings/gpio/snps,creg-gpio.txt b/Documentation/devicetree/bindings/gpio/snps,creg-gpio.txt
deleted file mode 100644
index 1b30812b015b..000000000000
--- a/Documentation/devicetree/bindings/gpio/snps,creg-gpio.txt
+++ /dev/null
@@ -1,21 +0,0 @@
-Synopsys GPIO via CREG (Control REGisters) driver
-
-Required properties:
-- compatible : "snps,creg-gpio-hsdk" or "snps,creg-gpio-axs10x".
-- reg : Exactly one register range with length 0x4.
-- #gpio-cells : Since the generic GPIO binding is used, the
-  amount of cells must be specified as 2. The first cell is the
-  pin number, the second cell is used to specify optional parameters:
-  See "gpio-specifier" in .../devicetree/bindings/gpio/gpio.txt.
-- gpio-controller : Marks the device node as a GPIO controller.
-- ngpios: Number of GPIO pins.
-
-Example:
-
-gpio: gpio@f00014b0 {
-	compatible = "snps,creg-gpio-hsdk";
-	reg = <0xf00014b0 0x4>;
-	gpio-controller;
-	#gpio-cells = <2>;
-	ngpios = <2>;
-};
diff --git a/Documentation/devicetree/bindings/gpio/ti,7416374.yaml b/Documentation/devicetree/bindings/gpio/ti,7416374.yaml
deleted file mode 100644
index 33472f091101..000000000000
--- a/Documentation/devicetree/bindings/gpio/ti,7416374.yaml
+++ /dev/null
@@ -1,56 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/gpio/ti,7416374.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: TI 74XX MMIO GPIO
-
-maintainers:
-  - Frank Li <Frank.Li@nxp.com>
-
-properties:
-  compatible:
-    enum:
-      - ti,741g125 # for 741G125 (1-bit Input),
-      - ti,741g174 # for 741G74 (1-bit Output),
-      - ti,742g125 # for 742G125 (2-bit Input),
-      - ti,7474    # for 7474 (2-bit Output),
-      - ti,74125   # for 74125 (4-bit Input),
-      - ti,74175   # for 74175 (4-bit Output),
-      - ti,74365   # for 74365 (6-bit Input),
-      - ti,74174   # for 74174 (6-bit Output),
-      - ti,74244   # for 74244 (8-bit Input),
-      - ti,74273   # for 74273 (8-bit Output),
-      - ti,741624  # for 741624 (16-bit Input),
-      - ti,7416374 # for 7416374 (16-bit Output).
-
-  reg:
-    maxItems: 1
-
-  gpio-controller: true
-
-  '#gpio-cells':
-    const: 2
-    description: |
-      The first cell is the pin number and
-      the second cell is used to specify the GPIO polarity:
-        0 = Active High,
-        1 = Active Low.
-
-required:
-  - compatible
-  - reg
-  - gpio-controller
-  - '#gpio-cells'
-
-additionalProperties: false
-
-examples:
-  - |
-    gpio@30008004 {
-        compatible = "ti,74174";
-        reg = <0x30008004 0x1>;
-        gpio-controller;
-        #gpio-cells = <2>;
-    };
diff --git a/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml b/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml
new file mode 100644
index 000000000000..dd271aa9d97c
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/trivial-gpio.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/trivial-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Trivial 2-cell GPIO controllers
+
+maintainers:
+  - Bartosz Golaszewski <brgl@bgdev.pl>
+
+properties:
+  compatible:
+    enum:
+      - apm,xgene-gpio
+      - cznic,moxtet-gpio
+      - dlg,slg7xl45106
+      - fcs,fxl6408
+      - gateworks,pld-gpio
+      - ibm,ppc4xx-gpio
+      - loongson,ls1x-gpio
+      - maxim,max77620
+      - nintendo,hollywood-gpio
+      - nxp,pca9570
+      - nxp,pca9571
+      - rockchip,rk3328-grf-gpio
+      - snps,creg-gpio-hsdk
+      - technologic,ts4800-gpio
+      - technologic,ts4900-gpio
+      - technologic,ts7970-gpio
+      - ti,741g125 # for 741G125 (1-bit Input),
+      - ti,741g174 # for 741G74 (1-bit Output),
+      - ti,742g125 # for 742G125 (2-bit Input),
+      - ti,7474    # for 7474 (2-bit Output),
+      - ti,74125   # for 74125 (4-bit Input),
+      - ti,74175   # for 74175 (4-bit Output),
+      - ti,74365   # for 74365 (6-bit Input),
+      - ti,74174   # for 74174 (6-bit Output),
+      - ti,74244   # for 74244 (8-bit Input),
+      - ti,74273   # for 74273 (8-bit Output),
+      - ti,741624  # for 741624 (16-bit Input),
+      - ti,7416374 # for 7416374 (16-bit Output).
+      - ti,lp3943-gpio
+      - ti,palmas-gpio
+      - ti,tpic2810
+      - ti,tps80036-gpio
+      - ti,tps65913-gpio
+      - ti,tps65914-gpio
+
+  reg:
+    maxItems: 1
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-controller: true
+
+  gpio-line-names: true
+
+  ngpios: true
+
+  # Don't add more properties
+
+patternProperties:
+  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
+    type: object
+    required:
+      - gpio-hog
+
+required:
+  - compatible
+  - '#gpio-cells'
+  - gpio-controller
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - maxim,max77620
+              - rockchip,rk3328-grf-gpio
+              - ti,lp3943-gpio
+              - ti,palmas-gpio
+              - ti,tps80036-gpio
+              - ti,tps65913-gpio
+              - ti,tps65914-gpio
+    then:
+      properties:
+        reg: false
+    else:
+      required:
+        - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    gpio@1701c000 {
+        compatible = "apm,xgene-gpio";
+        reg = <0x1701c000 0x40>;
+        gpio-controller;
+        #gpio-cells = <2>;
+    };
-- 
2.47.2


