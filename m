Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26D4A45AB0B
	for <lists+linux-mips@lfdr.de>; Tue, 23 Nov 2021 19:14:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239786AbhKWSRT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 Nov 2021 13:17:19 -0500
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.121]:33050 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239768AbhKWSRS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 Nov 2021 13:17:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1637691244;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=Q3ovXE46CMHAv4DP0A184nGXTqyiNm+RsxkVkHssYI8=;
    b=lv2sEMNGNAA14RR0Imo6JX7JHenLQncCAUSqlhYg4wf3DnPVSQhS1/D1xuYm+BpoKk
    +58kuzgFOp//jsitLXEeTnKEDWrfrdi9csz+wGjIH3BAR6400OByxkSJes+cUQPGPbPB
    QF2tQpNx1hyV2K2lAmXgKl+Izyn1Nd51RD6LhlnnuZOwqbmAQi2D70KfdGqHirq8i2UQ
    hRuH2aXNAFhYGXdR8Jrsad5smp5Vc8ozht/XUPIRGB8JljMBSZCYzc304sllwv5n7uKI
    +gahl2vuK7lPIhUgCLUY3yhMfj+gB2wO0Y4t/DyE5YPBnPDDolifSp6q/KtmwOpNKjeY
    FMCA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lByOdcKVX0"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 47.34.6 DYNA|AUTH)
    with ESMTPSA id g09b5fxANIE37mZ
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 23 Nov 2021 19:14:03 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Paul Cercueil <paul@crapouillou.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kees Cook <keescook@chromium.org>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Harry Wentland <harry.wentland@amd.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Paul Boddie <paul@boddie.org.uk>
Cc:     devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        Jonas Karlman <jonas@kwiboo.se>,
        dri-devel@lists.freedesktop.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v8 3/8] dt-bindings: display: Add ingenic,jz4780-dw-hdmi DT Schema
Date:   Tue, 23 Nov 2021 19:13:56 +0100
Message-Id: <f97179a630e7d0fc739a118e2b321e1a6432876b.1637691240.git.hns@goldelico.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1637691240.git.hns@goldelico.com>
References: <cover.1637691240.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Sam Ravnborg <sam@ravnborg.org>

Add DT bindings for the hdmi driver for the Ingenic JZ4780 SoC.
Based on .txt binding from Zubair Lutfullah Kakakhel

We also add generic ddc-i2c-bus to synopsys,dw-hdmi.yaml

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
---
 .../display/bridge/ingenic,jz4780-hdmi.yaml   | 76 +++++++++++++++++++
 .../display/bridge/synopsys,dw-hdmi.yaml      |  3 +
 2 files changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
new file mode 100644
index 0000000000000..190ca4521b1d0
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bridge/ingenic,jz4780-hdmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bindings for Ingenic JZ4780 HDMI Transmitter
+
+maintainers:
+  - H. Nikolaus Schaller <hns@goldelico.com>
+
+description: |
+  The HDMI Transmitter in the Ingenic JZ4780 is a Synopsys DesignWare HDMI 1.4
+  TX controller IP with accompanying PHY IP.
+
+allOf:
+  - $ref: bridge/synopsys,dw-hdmi.yaml#
+
+properties:
+  compatible:
+    const: ingenic,jz4780-dw-hdmi
+
+  reg-io-width:
+    const: 4
+
+  clocks:
+    maxItems: 2
+
+  hdmi-5v-supply:
+    description: Optional regulator to provide +5V at the connector
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+required:
+    - compatible
+    - clocks
+    - clock-names
+    - ports
+    - reg-io-width
+
+unevaluatedPropertes: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/jz4780-cgu.h>
+
+    hdmi: hdmi@10180000 {
+        compatible = "ingenic,jz4780-dw-hdmi";
+        reg = <0x10180000 0x8000>;
+        reg-io-width = <4>;
+        ddc-i2c-bus = <&i2c4>;
+        interrupt-parent = <&intc>;
+        interrupts = <3>;
+        clocks = <&cgu JZ4780_CLK_AHB0>, <&cgu JZ4780_CLK_HDMI>;
+        clock-names = "iahb", "isfr";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            hdmi_in: port@0 {
+                reg = <0>;
+                dw_hdmi_in: endpoint {
+                    remote-endpoint = <&jz4780_lcd_out>;
+                };
+            };
+            hdmi_out: port@1 {
+                reg = <1>;
+                dw_hdmi_out: endpoint {
+                    remote-endpoint = <&hdmi_con>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
index 9be44a682e67a..9cbeabaee0968 100644
--- a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
@@ -50,6 +50,9 @@ properties:
   interrupts:
     maxItems: 1
 
+  ddc-i2c-bus:
+    description: An I2C interface if the internal DDC I2C driver is not to be used
+
 additionalProperties: true
 
 ...
-- 
2.33.0

