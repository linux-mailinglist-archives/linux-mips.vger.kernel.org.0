Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3E3C1B80C1
	for <lists+linux-mips@lfdr.de>; Fri, 24 Apr 2020 22:35:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726363AbgDXUe7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Apr 2020 16:34:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726323AbgDXUe6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Apr 2020 16:34:58 -0400
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5302::12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45951C09B04C;
        Fri, 24 Apr 2020 13:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587760495;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=29yW4jl8Gijq7hbCacHTWUb9S7HTZuMHUBBgy2QivvI=;
        b=IHnYTPAK2/DwQ5BgVkj074QV5TotlCBuH8e42FKIappEDK2chZK4ltSdIM3Vj2qctU
        ohZBVtZ5JTDFBTIvVYlEpZDEA57G452/YI5GUa6hUtaH1QdoBEigfqCNh1TB+NO38DyE
        dejOLB7SPCtNoAQkP6LVJp8sLvtVCf0o26t4gwyXQjiZO3gUCVlb1VkFsOBlcx5aO0/+
        x6inTyHT+l/kDVmEu+6uFskdSxaMlci9HsjiFPMvpBjqA7xpdycHR5peBeXPc65c7AyJ
        y5QY77SotR3Fu+bsnyWhGLEdNfbZYZinc4TTAgP+FVcoWQqtaVkM0gaRZBVVbL7sINV8
        dGXQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6GK44R2FE"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id R0acebw3OKYJEV9
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 24 Apr 2020 22:34:19 +0200 (CEST)
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
Cc:     Jonathan Bakker <xc-racer2@live.ca>,
        Philipp Rossak <embed3d@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        openpvrsgx-devgroup@letux.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v7 01/12] dt-bindings: add img,pvrsgx.yaml for Imagination GPUs
Date:   Fri, 24 Apr 2020 22:34:04 +0200
Message-Id: <3a451e360fed84bc40287678b4d6be13821cfbc0.1587760454.git.hns@goldelico.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1587760454.git.hns@goldelico.com>
References: <cover.1587760454.git.hns@goldelico.com>
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
interfaced to the SoC (registers and interrupt).

The interface also consists of clocks, reset, power but
information from data sheets is vague and some SoC integrators
(TI) deciced to use a PRCM wrapper (ti,sysc) which does
all clock, reset and power-management through registers
outside of the sgx register block.

Therefore all these properties are optional.

Tested by make dt_binding_check

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 .../devicetree/bindings/gpu/img,pvrsgx.yaml   | 150 ++++++++++++++++++
 1 file changed, 150 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml

diff --git a/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml b/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
new file mode 100644
index 000000000000..33a9c4c6e784
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpu/img,pvrsgx.yaml
@@ -0,0 +1,150 @@
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
+  register area. If not, an optional clock can be specified here.
+
+properties:
+  $nodename:
+    pattern: '^gpu@[a-f0-9]+$'
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
+          - const: ti,omap4470-sgx544-112
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
+  interrupt-names:
+    maxItems: 1
+    items:
+      - const: sgx
+
+  clocks:
+    maxItems: 4
+
+  clock-names:
+    maxItems: 4
+    items:
+      - const: core
+      - const: sys
+      - const: mem
+      - const: hyd
+
+  sgx-supply: true
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
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

