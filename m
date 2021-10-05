Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C050442268B
	for <lists+linux-mips@lfdr.de>; Tue,  5 Oct 2021 14:29:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234446AbhJEMb2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 5 Oct 2021 08:31:28 -0400
Received: from mo4-p03-ob.smtp.rzone.de ([85.215.255.103]:34273 "EHLO
        mo4-p03-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234190AbhJEMb1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 5 Oct 2021 08:31:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1633436965;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=x7dhUfYAyldR+2XONzbmm7gdBhyCHC2ANYgFAuyisGI=;
    b=CKaz9NYEbBfyG2cgQDuN6jcgwzS/EOQg5eVPH/PAbDoMlGOyhMsazThA71BlfTKgOO
    nXmaCJfiHdOvEOuzkOg/Kl1RnusnXaB6U0SlueZilFI2GgI45zJsDltrF8dI+OhNWnts
    xP+laEMUM+Ie1gQ7t95ptDqXDaN1wfdPf66M2z3Ip6cOu3DxVfYoh+RkeSq7rXEoNpdz
    6xdksGKsseCrZ6kUmBgQD5o5j9etglD9boOtbSf29RjOXm6Wsl9pns2AoHTaOB+IUE14
    AeBPCaxeyaE9++aVpQ7NqHYfnQNDWbFXEXmiI6kJ6QL32PIgwd7IoTg1VQHpJuzqb3lM
    PoOQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lByOdcKlH0"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id I01f74x95CTO50e
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 5 Oct 2021 14:29:24 +0200 (CEST)
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
        Andrzej Hajda <a.hajda@samsung.com>,
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
Subject: [PATCH v5 3/7] dt-bindings: display: Add ingenic,jz4780-dw-hdmi DT Schema
Date:   Tue,  5 Oct 2021 14:29:15 +0200
Message-Id: <518d5db83e84e3f0326854c5afb53a92e7ae4e41.1633436959.git.hns@goldelico.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <cover.1633436959.git.hns@goldelico.com>
References: <cover.1633436959.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Sam Ravnborg <sam@ravnborg.org>

Add DT bindings for the hdmi driver for the Ingenic JZ4780 SoC.
Based on .txt binding from Zubair Lutfullah Kakakhel

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
---
 .../bindings/display/ingenic-jz4780-hdmi.yaml | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml

diff --git a/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml b/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
new file mode 100644
index 000000000000..5bcb342da86f
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/ingenic-jz4780-hdmi.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/ingenic-jz4780-hdmi.yaml#
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
+  ddc-i2c-bus:
+    description: An I2C interface if the internal DDC I2C driver is not to be used
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
+additionalProperties: false
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
-- 
2.33.0

