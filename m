Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A42F173F58
	for <lists+linux-mips@lfdr.de>; Fri, 28 Feb 2020 19:20:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726811AbgB1STq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 28 Feb 2020 13:19:46 -0500
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.104]:14927 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726562AbgB1STq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 28 Feb 2020 13:19:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1582913983;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=Z24TgJFOcoIvJO9KSWhl04XKycU4Iur75xW70ibCPIo=;
        b=VgpjZG41nuJLEzccIg2AyPEm3tFH1q6OlkV193kEa1gxA62W4whi3fA0r2D33HWgb5
        TNcgggmppDG/obGPUQsJaI+PGvrFxDBYBnTC1OnvMF23iOxcm1zLH2RktWY6/wNswYDL
        jIIpyjFxswaf6asq9FetEPvs03DNs4MhpHybae/G8/cltFPbM5/I0kvtmGqwQCQ1vx1F
        lAWzXtwvdpD08v2g6l9PGh86bBUWh8tTIHr9GAIAbspiBDcBHOVviwwJycjWeiWim/2k
        6ATiGrK6rvt1pnGwdYQO9W/XTM5KDLZbdQvjx/wDn9Xwqe4Is2ZEvkkjKDgtMnLY17o3
        Wr8A==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6G1+ULkA="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
        with ESMTPSA id y0a02cw1SIJZ2Ln
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 28 Feb 2020 19:19:35 +0100 (CET)
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
        Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-gpio@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, Sam Ravnborg <sam@ravnborg.org>,
        Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
        Rob Herring <robh@kernel.org>
Subject: [RFC v2 1/8] dt-bindings: display: add ingenic-jz4780-lcd DT Schema
Date:   Fri, 28 Feb 2020 19:19:26 +0100
Message-Id: <b4a73a1c542fab9d05d12b56c547b555b6a9b062.1582913973.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1582913973.git.hns@goldelico.com>
References: <cover.1582913973.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Sam Ravnborg <sam@ravnborg.org>

Add DT bindings for the LCD controller on the jz4780 SoC
Based on .txt binding from Zubair Lutfullah Kakakhel

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
---
 .../bindings/display/ingenic-jz4780-lcd.yaml  | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.yaml

diff --git a/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.yaml b/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.yaml
new file mode 100644
index 000000000000..c71415a3a342
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ingenic-jz4780-lcd.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/ingenic-jz4780-lcd.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bindings for Ingenic JZ4780 LCD Controller
+
+maintainers:
+  - Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
+  - H. Nikolaus Schaller <hns@goldelico.com>
+
+description: |
+  LCD Controller is the Display Controller for the Ingenic JZ4780 SoC
+
+properties:
+  compatible:
+    items:
+      - const: ingenic,jz4780-lcd
+
+  reg:
+    maxItems: 1
+    description: the address & size of the LCD controller registers
+
+  interrupts:
+    maxItems: 1
+    description: Specifies the interrupt provided by parent
+
+  clocks:
+    maxItems: 2
+    description: Clock specifiers for the JZ4780_CLK_TVE JZ4780_CLK_LCD0PIXCLK
+
+  clock-names:
+    items:
+      - const: lcd_clk
+      - const: lcd_pixclk
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
+    #include <dt-bindings/clock/jz4780-cgu.h>
+    lcd: jz4780-lcdk@0x13050000 {
+        compatible = "ingenic,jz4780-lcd";
+        reg = <0x13050000 0x1800>;
+
+        clocks = <&cgu JZ4780_CLK_TVE>, <&cgu JZ4780_CLK_LCD0PIXCLK>;
+        clock-names = "lcd_clk", "lcd_pixclk";
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
+...
-- 
2.23.0

