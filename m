Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AA37276C3B
	for <lists+linux-mips@lfdr.de>; Thu, 24 Sep 2020 10:42:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727320AbgIXImp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 24 Sep 2020 04:42:45 -0400
Received: from mga05.intel.com ([192.55.52.43]:47640 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726064AbgIXImp (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 24 Sep 2020 04:42:45 -0400
IronPort-SDR: aM2di68XctazK/IKMzcoSLcH/wd0aRgFNtzNS7QQ1SN6Dl15hYxB9Q4iNQ4W0R8j5per+ptGiL
 icWfymCdB2Eg==
X-IronPort-AV: E=McAfee;i="6000,8403,9753"; a="245936920"
X-IronPort-AV: E=Sophos;i="5.77,296,1596524400"; 
   d="scan'208";a="245936920"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2020 01:42:44 -0700
IronPort-SDR: Km/Iub+VG7BAkmgYwQ3GZCuzH4wGS96ZQqneJlZxSjCA0IN6LlrogODbD0BPzmb6CXYHS7x1q+
 apLXZA1I1E9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,296,1596524400"; 
   d="scan'208";a="291962626"
Received: from sgsxdev004.isng.intel.com (HELO localhost) ([10.226.88.13])
  by fmsmga008.fm.intel.com with ESMTP; 24 Sep 2020 01:42:40 -0700
From:   "Ramuthevar,Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
To:     miquel.raynal@bootlin.com, linux-kernel@vger.kernel.org
Cc:     linux-mtd@lists.infradead.org, richard@nod.at, vigneshr@ti.com,
        boris.brezillon@collabora.com, christophe.kerello@st.com,
        piotrs@cadence.com, robert.jarzmik@free.fr,
        brendanhiggins@google.com, devicetree@vger.kernel.org,
        tglx@linutronix.de, hauke.mehrtens@intel.com, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, arnd@arndb.de,
        andriy.shevchenko@intel.com, cheol.yong.kim@intel.com,
        qi-ming.wu@intel.com,
        Ramuthevar Vadivel Murugan 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: [PATCH v14 1/2] dt-bindings: mtd: Add Nand Flash Controller support for Intel LGM SoC
Date:   Thu, 24 Sep 2020 16:42:31 +0800
Message-Id: <20200924084232.41631-2-vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200924084232.41631-1-vadivel.muruganx.ramuthevar@linux.intel.com>
References: <20200924084232.41631-1-vadivel.muruganx.ramuthevar@linux.intel.com>
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>

Add YAML file for dt-bindings to support NAND Flash Controller
on Intel's Lightning Mountain SoC.

Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
---
 .../devicetree/bindings/mtd/intel,lgm-nand.yaml    | 99 ++++++++++++++++++++++
 1 file changed, 99 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml

diff --git a/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
new file mode 100644
index 000000000000..313daec4d783
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
@@ -0,0 +1,99 @@
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
+    const: intel,lgm-nand
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
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
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
+  - "#address-cells"
+  - "#size-cells"
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
+        nand-ecc-mode = "hw";
+      };
+    };
+
+...
-- 
2.11.0

