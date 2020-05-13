Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 051381D1028
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2020 12:47:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730736AbgEMKrq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 May 2020 06:47:46 -0400
Received: from mga01.intel.com ([192.55.52.88]:50939 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727794AbgEMKrq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 13 May 2020 06:47:46 -0400
IronPort-SDR: 91CA+HzxPwjrqLo161FTkHT5bg6WNux2a0f2KmV+FWN8WhNpBSe2MDzyo1wRxHgScGE3QmdjOK
 edx6uSh3QYYQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2020 03:47:45 -0700
IronPort-SDR: S6daGABgkKc6bwDyiE3pVeYKUbpHehu/hFxeatBrciRecw6es59KkINBePXwWB4eaTDkPMIeia
 TkMmQTnkzu4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,387,1583222400"; 
   d="scan'208";a="280462681"
Received: from sgsxdev004.isng.intel.com (HELO localhost) ([10.226.88.13])
  by orsmga002.jf.intel.com with ESMTP; 13 May 2020 03:47:41 -0700
From:   "Ramuthevar,Vadivel MuruganX" 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
To:     linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org
Cc:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        arnd@arndb.de, brendanhiggins@google.com, tglx@linutronix.de,
        boris.brezillon@collabora.com, anders.roxell@linaro.org,
        masonccyang@mxic.com.tw, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, hauke.mehrtens@intel.com,
        andriy.shevchenko@intel.com, qi-ming.wu@intel.com,
        cheol.yong.kim@intel.com,
        Ramuthevar Vadivel Murugan 
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: [PATCH v6 1/2] dt-bindings: mtd: Add Nand Flash Controller support for Intel LGM SoC
Date:   Wed, 13 May 2020 18:46:14 +0800
Message-Id: <20200513104615.7905-2-vadivel.muruganx.ramuthevar@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200513104615.7905-1-vadivel.muruganx.ramuthevar@linux.intel.com>
References: <20200513104615.7905-1-vadivel.muruganx.ramuthevar@linux.intel.com>
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>

Add YAML file for dt-bindings to support NAND Flash Controller
on Intel's Lightning Mountain SoC.

Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
---
 .../devicetree/bindings/mtd/intel,lgm-nand.yaml    | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml

diff --git a/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
new file mode 100644
index 000000000000..d9e0df8553fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/intel,lgm-nand.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: GPL-2.0
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
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    enum:
+      - rx
+      - tx
+
+  pinctrl-names: true
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
+  - clocks
+  - clock-names
+  - dmas
+
+additionalProperties: false
+
+examples:
+  - |
+    nand-controller@e0f00000 {
+      compatible = "intel,nand-controller";
+      reg = <0xe0f00000 0x100>,
+            <0xe1000000 0x300>,
+            <0xe1400000 0x8000>,
+            <0xe1c00000 0x1000>;
+      reg-names = "ebunand", "hsnand", "nand_cs0", "nand_cs1",
+        "addr_sel0","addr_sel1";
+      clocks = <&cgu0 125>;
+      dma-names = "tx", "rx";
+      #address-cells = <1>;
+      #size-cells = <0>;
+      #clock-cells = <1>;
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

