Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1CC9196EC8
	for <lists+linux-mips@lfdr.de>; Sun, 29 Mar 2020 19:36:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728537AbgC2Rgn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 29 Mar 2020 13:36:43 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83]:12476 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728285AbgC2RgK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 29 Mar 2020 13:36:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1585503366;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=Zg1B2MSlw8LBkeQrcB+SbHPflxN5qiikKNdtggvwHAA=;
        b=NRWEiUWc6buewPunl3ymSwFnhaLwWhtkGxTYzBZ7KNJpA3LvwjYMif4MkLTTqppEtF
        jNUjgmVmOy3FbrJPfizy4KjC+oF3S9xamG209PGfLABs0aeJH2OJrG7ctO52ujrB+vH6
        fHWGQoGoCvAMx0Ugb28zoQyFZ2wAwGSM2a8ri/sbNfI9NKBAW4jfKKbesQLDyxNNefzf
        FYbx5/o16a5VT+FIwqUkBqiIF2m/f9MUbwu0/n2XvnN82+rakrOBjOu67aNpf+9lXWJj
        OCSoT8lrwpvphmkQ4mQQ6mKbO7+2bibOPoC6h/L6jDXorZ2qnFZNJ28khftdHiDQah0d
        8Ihg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0pDz2rsNxxv"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.2.1 DYNA|AUTH)
        with ESMTPSA id m02241w2THZvBM8
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 29 Mar 2020 19:35:57 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Paul Cercueil <paul@crapouillou.net>,
        Paul Boddie <paul@boddie.org.uk>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andi Kleen <ak@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Kees Cook <keescook@chromium.org>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-gpio@vger.kernel.org, letux-kernel@openphoenux.org,
        mips-creator-ci20-dev@googlegroups.com,
        Rob Herring <robh@kernel.org>
Subject: [RFC v3 1/8] dt-bindings: display: convert ingenic,lcd.txt to ingenic,lcd.yaml
Date:   Sun, 29 Mar 2020 19:35:47 +0200
Message-Id: <a75c77fa8528f44832993f9780ae4ea409125a90.1585503354.git.hns@goldelico.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585503354.git.hns@goldelico.com>
References: <cover.1585503354.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

and add compatible: jz4780-lcd, including an example how to
configure both lcd controllers.

Also fix the clock names and examples.

Based on work by Paul Cercueil <paul@crapouillou.net> and
Sam Ravnborg <sam@ravnborg.org>

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
---
 .../bindings/display/ingenic,lcd.txt          |  45 ------
 .../bindings/display/ingenic,lcd.yaml         | 128 ++++++++++++++++++
 2 files changed, 128 insertions(+), 45 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/ingenic,lcd.txt
 create mode 100644 Documentation/devicetree/bindings/display/ingenic,lcd.yaml

diff --git a/Documentation/devicetree/bindings/display/ingenic,lcd.txt b/Documentation/devicetree/bindings/display/ingenic,lcd.txt
deleted file mode 100644
index 01e3261defb6..000000000000
--- a/Documentation/devicetree/bindings/display/ingenic,lcd.txt
+++ /dev/null
@@ -1,45 +0,0 @@
-Ingenic JZ47xx LCD driver
-
-Required properties:
-- compatible: one of:
-  * ingenic,jz4740-lcd
-  * ingenic,jz4725b-lcd
-  * ingenic,jz4770-lcd
-- reg: LCD registers location and length
-- clocks: LCD pixclock and device clock specifiers.
-	   The device clock is only required on the JZ4740.
-- clock-names: "lcd_pclk" and "lcd"
-- interrupts: Specifies the interrupt line the LCD controller is connected to.
-
-Example:
-
-panel {
-	compatible = "sharp,ls020b1dd01d";
-
-	backlight = <&backlight>;
-	power-supply = <&vcc>;
-
-	port {
-		panel_input: endpoint {
-			remote-endpoint = <&panel_output>;
-		};
-	};
-};
-
-
-lcd: lcd-controller@13050000 {
-	compatible = "ingenic,jz4725b-lcd";
-	reg = <0x13050000 0x1000>;
-
-	interrupt-parent = <&intc>;
-	interrupts = <31>;
-
-	clocks = <&cgu JZ4725B_CLK_LCD>;
-	clock-names = "lcd";
-
-	port {
-		panel_output: endpoint {
-			remote-endpoint = <&panel_input>;
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/ingenic,lcd.yaml b/Documentation/devicetree/bindings/display/ingenic,lcd.yaml
new file mode 100644
index 000000000000..8b6467cfc191
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ingenic,lcd.yaml
@@ -0,0 +1,128 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/ingenic,lcd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bindings for Ingenic JZ4780 LCD Controller
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+
+description: |
+  LCD Controller is the Display Controller for the Ingenic JZ47xx SoC
+
+properties:
+  compatible:
+    oneOf:
+     - const: ingenic,jz4725b-lcd
+     - const: ingenic,jz4740-lcd
+     - const: ingenic,jz4770-lcd
+     - const: ingenic,jz4780-lcd
+
+  reg:
+    maxItems: 1
+    description: LCD registers location and length
+
+  interrupts:
+    maxItems: 1
+    description: Specifies the interrupt provided by parent
+
+  clocks:
+    maxItems: 2
+    description: Clock specifiers for LCD pixclock and device clock.
+      The device clock is only required on the JZ4740 and JZ4780
+
+  clock-names:
+    items:
+      - const: lcd
+      - const: lcd_pclk
+
+  port:
+    type: object
+    description: |
+      A port node with endpoint definitions as defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt
+
+required:
+    - compatible
+    - reg
+    - interrupts
+    - clocks
+    - clock-names
+    - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/jz4725b-cgu.h>
+
+    panel {
+      compatible = "sharp,ls020b1dd01d";
+
+      backlight = <&backlight>;
+      power-supply = <&vcc>;
+
+      port {
+        panel_input: endpoint {
+          remote-endpoint = <&panel_output>;
+          };
+        };
+      };
+
+    lcd: lcd-controller@13050000 {
+      compatible = "ingenic,jz4725b-lcd";
+      reg = <0x13050000 0x1000>;
+
+      interrupt-parent = <&intc>;
+      interrupts = <31>;
+
+      clocks = <&cgu JZ4725B_CLK_LCD>;
+      clock-names = "lcd", "lcd_pclk";
+
+      port {
+        panel_output: endpoint {
+          remote-endpoint = <&panel_input>;
+          };
+        };
+      };
+
+  - |
+    #include <dt-bindings/clock/jz4780-cgu.h>
+
+    lcdc0: lcdc0@13050000 {
+        compatible = "ingenic,jz4780-lcd";
+        reg = <0x13050000 0x1800>;
+
+        clocks = <&cgu JZ4780_CLK_TVE>, <&cgu JZ4780_CLK_LCD0PIXCLK>;
+        clock-names = "lcd", "lcd_pclk";
+
+        interrupt-parent = <&intc>;
+        interrupts = <31>;
+
+        jz4780_lcd_out: port {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            jz4780_out_hdmi: endpoint@0 {
+                reg = <0>;
+                remote-endpoint = <&hdmi_in_lcd>;
+            };
+        };
+    };
+
+    lcdc1: lcdc1@130a0000 {
+        compatible = "ingenic,jz4780-lcd";
+        reg = <0x130a0000 0x1800>;
+
+        clocks = <&cgu JZ4780_CLK_TVE>, <&cgu JZ4780_CLK_LCD1PIXCLK>;
+        clock-names = "lcd", "lcd_pclk";
+
+        interrupt-parent = <&intc>;
+        interrupts = <31>;
+
+        status = "disabled";
+    };
+
+...
-- 
2.25.1

