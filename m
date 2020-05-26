Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B2381E25AB
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 17:42:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730166AbgEZPlg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 11:41:36 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:58552 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729478AbgEZPlf (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 May 2020 11:41:35 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 10BC98030869;
        Tue, 26 May 2020 15:41:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 6TNrqTLnLn94; Tue, 26 May 2020 18:41:31 +0300 (MSK)
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
Subject: [PATCH v3 3/7] dt-bindings: watchdog: dw-wdt: Add watchdog TOPs array property
Date:   Tue, 26 May 2020 18:41:19 +0300
Message-ID: <20200526154123.24402-4-Sergey.Semin@baikalelectronics.ru>
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

In case if DW Watchdog IP core is built with WDT_USE_FIX_TOP == false,
a custom timeout periods are used to preset the timer counter. In
this case that periods should be specified in a new "snps,watchdog-tops"
property of the DW watchdog dts node.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reviewed-by: Rob Herring <robh@kernel.org>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-mips@vger.kernel.org

---

Changelog v2:
- Rearrange SoBs.
- Move $ref to the root level of the "snps,watchdog-tops" property
  so does the constraints.
- Add default TOP values array.
- Discard the label definition from the new bindings example.

Changelog v3:
- Remove items property and move the minItems and maxItems constraints to
  the root level of the snps,watchdog-tops property.
---
 .../bindings/watchdog/snps,dw-wdt.yaml        | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
index 5bf6dc6377f3..d9fc7bb851b1 100644
--- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
@@ -39,6 +39,23 @@ properties:
     description: Phandle to the DW Watchdog reset lane
     maxItems: 1
 
+  snps,watchdog-tops:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: |
+      DW APB Watchdog custom timer intervals - Timeout Period ranges (TOPs).
+      Each TOP is a number loaded into the watchdog counter at the moment of
+      the timer restart. The counter decrementing happens each tick of the
+      reference clock. Therefore the TOPs array is equivalent to an array of
+      the timer expiration intervals supported by the DW APB Watchdog. Note
+      DW APB Watchdog IP-core might be synthesized with fixed TOP values,
+      in which case this property is unnecessary with default TOPs utilized.
+    default: [0x0001000 0x0002000 0x0004000 0x0008000
+      0x0010000 0x0020000 0x0040000 0x0080000
+      0x0100000 0x0200000 0x0400000 0x0800000
+      0x1000000 0x2000000 0x4000000 0x8000000]
+    minItems: 16
+    maxItems: 16
+
 unevaluatedProperties: false
 
 required:
@@ -55,4 +72,19 @@ examples:
       clocks = <&per_base_clk>;
       resets = <&wdt_rst>;
     };
+
+  - |
+    watchdog@ffd02000 {
+      compatible = "snps,dw-wdt";
+      reg = <0xffd02000 0x1000>;
+      interrupts = <0 171 4>;
+      clocks = <&per_base_clk>;
+      clock-names = "tclk";
+      snps,watchdog-tops = <0x000000FF 0x000001FF 0x000003FF
+                            0x000007FF 0x0000FFFF 0x0001FFFF
+                            0x0003FFFF 0x0007FFFF 0x000FFFFF
+                            0x001FFFFF 0x003FFFFF 0x007FFFFF
+                            0x00FFFFFF 0x01FFFFFF 0x03FFFFFF
+                            0x07FFFFFF>;
+    };
 ...
-- 
2.26.2

