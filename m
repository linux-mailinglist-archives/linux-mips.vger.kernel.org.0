Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA2C11A68B6
	for <lists+linux-mips@lfdr.de>; Mon, 13 Apr 2020 17:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730234AbgDMP1Y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Apr 2020 11:27:24 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:39804 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730200AbgDMP1V (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Apr 2020 11:27:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1586791631; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=svBPomRYOQMkWm7TLmaQJsZw2d9nkPIM8zkco3T/OhU=;
        b=Q7vXtZVTlFbxEJxC/7D2O1FsmvIwynqW6+pMOwJxAc/aabeJrzuouGFZOH8jZ9Vuvyw1ka
        YGs/Xb9UCBCmkGTPJG6CLM512ly89tPlOg6htwJBgmaaZeElHsUBnMQStBKp8jhCakcKzH
        pUGZKjkbSWc8ly5x4BHNL12PmNnx4EA=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     od@zcrc.me,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 02/13] dt-bindings: mmc: Convert jz4740-mmc doc to YAML
Date:   Mon, 13 Apr 2020 17:26:22 +0200
Message-Id: <20200413152633.198301-2-paul@crapouillou.net>
In-Reply-To: <20200413152633.198301-1-paul@crapouillou.net>
References: <20200413152633.198301-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Convert the jz4740-mmc.txt documentation to YAML.

The ingenic,jz4770-mmc compatible string was added in the process, with
a fallback to ingenic,jz4760-mmc.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 .../devicetree/bindings/mmc/ingenic,mmc.yaml  | 79 +++++++++++++++++++
 .../devicetree/bindings/mmc/jz4740.txt        | 41 ----------
 2 files changed, 79 insertions(+), 41 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml
 delete mode 100644 Documentation/devicetree/bindings/mmc/jz4740.txt

diff --git a/Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml b/Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml
new file mode 100644
index 000000000000..e60bfe980ab3
--- /dev/null
+++ b/Documentation/devicetree/bindings/mmc/ingenic,mmc.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mmc/ingenic,mmc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic SoCs MMC Controller DT bindings
+
+maintainers:
+  - Paul Cercueil <paul@crapouillou.net>
+
+allOf:
+  - $ref: mmc-controller.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+        - ingenic,jz4740-mmc
+        - ingenic,jz4725b-mmc
+        - ingenic,jz4760-mmc
+        - ingenic,jz4780-mmc
+        - ingenic,x1000-mmc
+      - items:
+        - const: ingenic,jz4770-mmc
+        - const: ingenic,jz4760-mmc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: mmc
+
+  dmas:
+    items:
+      - description: DMA controller phandle and request line for RX
+      - description: DMA controller phandle and request line for TX
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - dmas
+  - dma-names
+
+examples:
+  - |
+    #include <dt-bindings/clock/jz4780-cgu.h>
+    #include <dt-bindings/dma/jz4780-dma.h>
+    mmc0: mmc@13450000 {
+      compatible = "ingenic,jz4780-mmc";
+      reg = <0x13450000 0x1000>;
+
+      interrupt-parent = <&intc>;
+      interrupts = <37>;
+
+      clocks = <&cgu JZ4780_CLK_MSC0>;
+      clock-names = "mmc";
+
+      cap-sd-highspeed;
+      cap-mmc-highspeed;
+      cap-sdio-irq;
+      dmas = <&dma JZ4780_DMA_MSC0_RX 0xffffffff>,
+             <&dma JZ4780_DMA_MSC0_TX 0xffffffff>;
+      dma-names = "rx", "tx";
+    };
diff --git a/Documentation/devicetree/bindings/mmc/jz4740.txt b/Documentation/devicetree/bindings/mmc/jz4740.txt
deleted file mode 100644
index 453d3b9d145d..000000000000
--- a/Documentation/devicetree/bindings/mmc/jz4740.txt
+++ /dev/null
@@ -1,41 +0,0 @@
-* Ingenic XBurst MMC controllers
-
-This file documents the device tree properties used for the MMC controller in
-Ingenic JZ4740/JZ4760/JZ4780/X1000 SoCs. These are in addition to the core MMC
-properties described in mmc.txt.
-
-Required properties:
-- compatible: Should be one of the following:
-  - "ingenic,jz4740-mmc" for the JZ4740
-  - "ingenic,jz4725b-mmc" for the JZ4725B
-  - "ingenic,jz4760-mmc" for the JZ4760
-  - "ingenic,jz4780-mmc" for the JZ4780
-  - "ingenic,x1000-mmc" for the X1000
-- reg: Should contain the MMC controller registers location and length.
-- interrupts: Should contain the interrupt specifier of the MMC controller.
-- clocks: Clock for the MMC controller.
-
-Optional properties:
-- dmas: List of DMA specifiers with the controller specific format
-        as described in the generic DMA client binding. A tx and rx
-        specifier is required.
-- dma-names: RX and TX  DMA request names.
-        Should be "rx" and "tx", in that order.
-
-For additional details on DMA client bindings see ../dma/dma.txt.
-
-Example:
-
-mmc0: mmc@13450000 {
-	compatible = "ingenic,jz4780-mmc";
-	reg = <0x13450000 0x1000>;
-
-	interrupt-parent = <&intc>;
-	interrupts = <37>;
-
-	clocks = <&cgu JZ4780_CLK_MSC0>;
-	clock-names = "mmc";
-
-	dmas = <&dma JZ4780_DMA_MSC0_RX 0xffffffff>, <&dma JZ4780_DMA_MSC0_TX 0xffffffff>;
-	dma-names = "rx", "tx";
-};
-- 
2.25.1

