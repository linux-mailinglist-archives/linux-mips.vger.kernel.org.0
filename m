Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C30F51E25C4
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 17:42:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729989AbgEZPle (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 11:41:34 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:58516 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729212AbgEZPle (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 May 2020 11:41:34 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 46050803086B;
        Tue, 26 May 2020 15:41:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id DHI_9ZiuWhHA; Tue, 26 May 2020 18:41:30 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Arnd Bergmann <arnd@arndb.de>, <linux-mips@vger.kernel.org>,
        <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/7] dt-bindings: watchdog: Convert DW WDT binding to DT schema
Date:   Tue, 26 May 2020 18:41:17 +0300
Message-ID: <20200526154123.24402-2-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200526154123.24402-1-Sergey.Semin@baikalelectronics.ru>
References: <20200526154123.24402-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Modern device tree bindings are supposed to be created as YAML-files
in accordance with dt-schema. This commit replaces the DW Watchdog
legacy bare text bindings with YAML file. As before the binding states
that the corresponding dts node is supposed to have a registers
range, a watchdog timer references clock source, optional reset line and
pre-timeout interrupt.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reviewed-by: Rob Herring <robh@kernel.org>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-mips@vger.kernel.org

---

Changelog v2:
- Rearrange SoBs.
- Discard BE copyright header.
- Replace "additionalProperties: false" with "unevaluatedProperties: false"
  property.
- Discard interrupts property from the required properties list.
- Remove a label definition from the binding example.
- Move the asynchronous APB3 clock support into a dedicated patch.
---
 .../devicetree/bindings/watchdog/dw_wdt.txt   | 24 ---------
 .../bindings/watchdog/snps,dw-wdt.yaml        | 50 +++++++++++++++++++
 2 files changed, 50 insertions(+), 24 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/watchdog/dw_wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/dw_wdt.txt b/Documentation/devicetree/bindings/watchdog/dw_wdt.txt
deleted file mode 100644
index eb0914420c7c..000000000000
--- a/Documentation/devicetree/bindings/watchdog/dw_wdt.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-Synopsys Designware Watchdog Timer
-
-Required Properties:
-
-- compatible	: Should contain "snps,dw-wdt"
-- reg		: Base address and size of the watchdog timer registers.
-- clocks	: phandle + clock-specifier for the clock that drives the
-		watchdog timer.
-
-Optional Properties:
-
-- interrupts	: The interrupt used for the watchdog timeout warning.
-- resets	: phandle pointing to the system reset controller with
-		line index for the watchdog.
-
-Example:
-
-	watchdog0: wd@ffd02000 {
-		compatible = "snps,dw-wdt";
-		reg = <0xffd02000 0x1000>;
-		interrupts = <0 171 4>;
-		clocks = <&per_base_clk>;
-		resets = <&rst WDT0_RESET>;
-	};
diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
new file mode 100644
index 000000000000..4f6944756ab4
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/snps,dw-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys Designware Watchdog Timer
+
+allOf:
+  - $ref: "watchdog.yaml#"
+
+maintainers:
+  - Jamie Iles <jamie@jamieiles.com>
+
+properties:
+  compatible:
+    const: snps,dw-wdt
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: DW Watchdog pre-timeout interrupt
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Watchdog timer reference clock
+
+  resets:
+    description: Phandle to the DW Watchdog reset lane
+    maxItems: 1
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+examples:
+  - |
+    watchdog@ffd02000 {
+      compatible = "snps,dw-wdt";
+      reg = <0xffd02000 0x1000>;
+      interrupts = <0 171 4>;
+      clocks = <&per_base_clk>;
+      resets = <&wdt_rst>;
+    };
+...
-- 
2.26.2

