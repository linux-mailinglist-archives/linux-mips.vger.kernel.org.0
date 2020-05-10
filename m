Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E25E01CC6ED
	for <lists+linux-mips@lfdr.de>; Sun, 10 May 2020 07:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728098AbgEJFPc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 10 May 2020 01:15:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725907AbgEJFPc (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 10 May 2020 01:15:32 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C19FC061A0C
        for <linux-mips@vger.kernel.org>; Sat,  9 May 2020 22:15:32 -0700 (PDT)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1jXeJB-0006T9-0V; Sun, 10 May 2020 07:15:25 +0200
Received: from ore by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1jXeJ9-0001cv-Ui; Sun, 10 May 2020 07:15:23 +0200
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Oleksij Rempel <o.rempel@pengutronix.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-serial@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v1] dt-bindings: serial: qca,ar9330-uart: Convert to json-schema
Date:   Sun, 10 May 2020 07:15:22 +0200
Message-Id: <20200510051522.6191-1-o.rempel@pengutronix.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mips@vger.kernel.org
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Convert the Qualcomm Atheros AR9330 High-Speed UART
Device Tree binding documentation to json-schema.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 .../bindings/serial/qca,ar9330-uart.txt       | 31 ------------
 .../bindings/serial/qca,ar9330-uart.yaml      | 50 +++++++++++++++++++
 2 files changed, 50 insertions(+), 31 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/serial/qca,ar9330-uart.txt
 create mode 100644 Documentation/devicetree/bindings/serial/qca,ar9330-uart.yaml

diff --git a/Documentation/devicetree/bindings/serial/qca,ar9330-uart.txt b/Documentation/devicetree/bindings/serial/qca,ar9330-uart.txt
deleted file mode 100644
index 7d65126bd1d77..0000000000000
--- a/Documentation/devicetree/bindings/serial/qca,ar9330-uart.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-* Qualcomm Atheros AR9330 High-Speed UART
-
-Required properties:
-
-- compatible: Must be "qca,ar9330-uart"
-
-- reg: Specifies the physical base address of the controller and
-  the length of the memory mapped region.
-
-- interrupts: Specifies the interrupt source of the parent interrupt
-  controller. The format of the interrupt specifier depends on the
-  parent interrupt controller.
-
-Additional requirements:
-
-  Each UART port must have an alias correctly numbered in "aliases"
-  node.
-
-Example:
-
-	aliases {
-		serial0 = &uart0;
-	};
-
-	uart0: uart@18020000 {
-		compatible = "qca,ar9330-uart";
-		reg = <0x18020000 0x14>;
-
-		interrupt-parent = <&intc>;
-		interrupts = <3>;
-	};
diff --git a/Documentation/devicetree/bindings/serial/qca,ar9330-uart.yaml b/Documentation/devicetree/bindings/serial/qca,ar9330-uart.yaml
new file mode 100644
index 0000000000000..a344369285b6a
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/qca,ar9330-uart.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serial/qca,ar9330-uart.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Atheros AR9330 High-Speed UART
+
+maintainers:
+  - Oleksij Rempel <o.rempel@pengutronix.de>
+
+allOf:
+  - $ref: /schemas/serial.yaml#
+
+properties:
+  compatible:
+    const: qca,ar9330-uart
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
+    const: uart
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    serial@18020000 {
+      compatible = "qca,ar9330-uart";
+      reg = <0x18020000 0x14>;
+      clocks = <&ref>;
+      clock-names = "uart";
+      interrupt-parent = <&intc>;
+      interrupts = <3>;
+    };
+...
-- 
2.26.2

