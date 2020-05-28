Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95F3C1E663F
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2020 17:36:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404488AbgE1Pfy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 May 2020 11:35:54 -0400
Received: from mga04.intel.com ([192.55.52.120]:33229 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404485AbgE1Pfx (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 28 May 2020 11:35:53 -0400
IronPort-SDR: weYVim0vN1xihXBlG52xyb5CrTSRqt0Cgw2FQ5+dIE7kHRfplARiyp5c/0naZN0JbN0bFfR41G
 AXMxm7/Qq+Mg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2020 08:35:52 -0700
IronPort-SDR: ob8VrV8JoE9S0LGCeWhK9XQR66QpBwkdIGsPRbAo59IiD2UCgYp+XGcEWVpdu3ewODNRVQWpTU
 BpOi7rG6G0AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,445,1583222400"; 
   d="scan'208";a="267253181"
Received: from sgsxdev004.isng.intel.com (HELO localhost) ([10.226.88.13])
  by orsmga003.jf.intel.com with ESMTP; 28 May 2020 08:35:46 -0700
From:   "Ramuthevar,Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
To:     linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, miquel.raynal@bootlin.com
Cc:     richard@nod.at, vigneshr@ti.com, arnd@arndb.de,
        brendanhiggins@google.com, tglx@linutronix.de,
        boris.brezillon@collabora.com, anders.roxell@linaro.org,
        masonccyang@mxic.com.tw, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, hauke.mehrtens@intel.com,
        andriy.shevchenko@intel.com, qi-ming.wu@intel.com,
        cheol.yong.kim@intel.com,
        Ramuthevar Vadivel Murugan 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: [PATCH v9 1/2] dt-bindings: mtd: Add Nand Flash Controller support for Intel LGM SoC
Date:   Thu, 28 May 2020 23:34:18 +0800
Message-Id: <20200528153419.46775-2-vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200528153419.46775-1-vadivel.muruganx.ramuthevar@linux.intel.com>
References: <20200528153419.46775-1-vadivel.muruganx.ramuthevar@linux.intel.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>

Add YAML file for dt-bindings to support NAND Flash Controller
on Intel's Lightning Mountain SoC.

Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
---
 .../devicetree/bindings/mtd/intel,lgm-nand.yaml    | 93 ++++++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml

diff --git a/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
new file mode 100644
index 000000000000..afecc9920e04
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/intel,lgm-nand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Intel LGM SoC NAND Controller Device Tree Bindings
+
+allOf:
+  - $ref: "nand-controller.yaml"
+
+maintainers:
+  - Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
+
+properties:
+  compatible:
+    const: intel,lgm-nand-controller
+
+  reg:
+    maxItems: 6
+
+  reg-names:
+    items:
+       - const: ebunand
+       - const: hsnand
+       - const: nand_cs0
+       - const: nand_cs1
+       - const: addr_sel0
+       - const: addr_sel1
+
+  clocks:
+    maxItems: 1
+
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    items:
+      - const: tx
+      - const: rx
+
+patternProperties:
+  "^nand@[a-f0-9]+$":
+    type: object
+    properties:
+      reg:
+        minimum: 0
+        maximum: 7
+
+      nand-ecc-mode: true
+
+      nand-ecc-algo:
+        const: hw
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - dmas
+  - dma-names
+
+additionalProperties: false
+
+examples:
+  - |
+    nand-controller@e0f00000 {
+      compatible = "intel,lgm-nand";
+      reg = <0xe0f00000 0x100>,
+            <0xe1000000 0x300>,
+            <0xe1400000 0x8000>,
+            <0xe1c00000 0x1000>,
+            <0x17400000 0x4>,
+            <0x17c00000 0x4>;
+      reg-names = "ebunand", "hsnand", "nand_cs0", "nand_cs1",
+        "addr_sel0", "addr_sel1";
+      clocks = <&cgu0 125>;
+      dmas = <&dma0 8>, <&dma0 9>;
+      dma-names = "tx", "rx";
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      nand@0 {
+        reg = <0>;
+        nand-on-flash-bbt;
+        #address-cells = <1>;
+        #size-cells = <1>;
+      };
+    };
+
+...
-- 
2.11.0

