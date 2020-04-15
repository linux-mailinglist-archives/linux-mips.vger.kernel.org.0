Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 572491A96B7
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2020 10:36:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405008AbgDOIg3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 15 Apr 2020 04:36:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2408101AbgDOIgI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 15 Apr 2020 04:36:08 -0400
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5302::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2391CC061A0E;
        Wed, 15 Apr 2020 01:36:06 -0700 (PDT)
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M7O2CKN9ej"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.4.0 DYNA|AUTH)
        with ESMTPSA id 6028a2w3F8ZL0Ii
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 15 Apr 2020 10:35:21 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Philipp Rossak <embed3d@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        openpvrsgx-devgroup@letux.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v6 01/12] dt-bindings: add img,pvrsgx.yaml for Imagination GPUs
Date:   Wed, 15 Apr 2020 10:35:08 +0200
Message-Id: <06fb6569259bb9183d0a0d0fe70ec4f3033b8aab.1586939718.git.hns@goldelico.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1586939718.git.hns@goldelico.com>
References: <cover.1586939718.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The Imagination PVR/SGX GPU is part of several SoC from
multiple vendors, e.g. TI OMAP, Ingenic JZ4780, Intel Poulsbo,
Allwinner A83 and others.

With this binding, we describe how the SGX processor is
interfaced to the SoC (registers, interrupt etc.).

In most cases, Clock, Reset and power management is handled
by a parent node or elsewhere (e.g. code in the driver).

Tested by make dt_binding_check dtbs_check

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 .../devicetree/bindings/gpu/img,pvrsgx.yaml   | 122 ++++++++++++++++++
 1 file changed, 122 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml

diff --git a/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml b/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
new file mode 100644
index 000000000000..e3a4208dfab1
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
@@ -0,0 +1,122 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpu/img,pvrsgx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Imagination PVR/SGX GPU
+
+maintainers:
+  - H. Nikolaus Schaller <hns@goldelico.com>
+
+description: |+
+  This binding describes the Imagination SGX5 series of 3D accelerators which
+  are found in several different SoC like TI OMAP, Sitara, Ingenic JZ4780,
+  Allwinner A83, and Intel Poulsbo and CedarView and more.
+
+  For an extensive list see: https://en.wikipedia.org/wiki/PowerVR#Implementations
+
+  The SGX node is usually a child node of some DT node belonging to the SoC
+  which handles clocks, reset and general address space mapping of the SGX
+  register area.
+
+properties:
+  compatible:
+    oneOf:
+      - description: SGX530-121 based SoC
+        items:
+          - enum:
+            - ti,omap3-sgx530-121 # BeagleBoard A/B/C, OpenPandora 600MHz and similar
+          - const: img,sgx530-121
+          - const: img,sgx530
+
+      - description: SGX530-125 based SoC
+        items:
+          - enum:
+            - ti,am3352-sgx530-125 # BeagleBone Black
+            - ti,am3517-sgx530-125
+            - ti,am4-sgx530-125
+            - ti,omap3-sgx530-125 # BeagleBoard XM, GTA04, OpenPandora 1GHz and similar
+            - ti,ti81xx-sgx530-125
+          - const: ti,omap3-sgx530-125
+          - const: img,sgx530-125
+          - const: img,sgx530
+
+      - description: SGX535-116 based SoC
+        items:
+          - const: intel,poulsbo-gma500-sgx535 # Atom Z5xx
+          - const: img,sgx535-116
+          - const: img,sgx535
+
+      - description: SGX540-116 based SoC
+        items:
+          - const: intel,medfield-gma-sgx540 # Atom Z24xx
+          - const: img,sgx540-116
+          - const: img,sgx540
+
+      - description: SGX540-120 based SoC
+        items:
+          - enum:
+            - samsung,s5pv210-sgx540-120
+            - ti,omap4-sgx540-120 # Pandaboard, Pandaboard ES and similar
+          - const: img,sgx540-120
+          - const: img,sgx540
+
+      - description: SGX540-130 based SoC
+        items:
+          - enum:
+            - ingenic,jz4780-sgx540-130 # CI20
+          - const: img,sgx540-130
+          - const: img,sgx540
+
+      - description: SGX544-112 based SoC
+        items:
+          - const: "ti,omap4470-sgx544-112
+          - const: img,sgx544-112
+          - const: img,sgx544
+
+      - description: SGX544-115 based SoC
+        items:
+          - enum:
+            - allwinner,sun8i-a31-sgx544-115
+            - allwinner,sun8i-a31s-sgx544-115
+            - allwinner,sun8i-a83t-sgx544-115 # Banana-Pi-M3 (Allwinner A83T) and similar
+          - const: img,sgx544-115
+          - const: img,sgx544
+
+      - description: SGX544-116 based SoC
+        items:
+          - enum:
+            - ti,dra7-sgx544-116 # DRA7
+            - ti,omap5-sgx544-116 # OMAP5 UEVM, Pyra Handheld and similar
+          - const: img,sgx544-116
+          - const: img,sgx544
+
+      - description: SGX545 based SoC
+        items:
+          - const: intel,cedarview-gma3600-sgx545 # Atom N2600, D2500
+          - const: img,sgx545-116
+          - const: img,sgx545
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+examples:
+  - |+
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    gpu: gpu@fe00 {
+      compatible = "ti,omap5-sgx544-116", "img,sgx544-116", "img,sgx544";
+      reg = <0xfe00 0x200>;
+      interrupts = <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
+    };
+
+...
-- 
2.25.1

