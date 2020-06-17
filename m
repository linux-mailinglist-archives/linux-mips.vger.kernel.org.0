Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 022A21FD8D2
	for <lists+linux-mips@lfdr.de>; Thu, 18 Jun 2020 00:32:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727029AbgFQWcT (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 17 Jun 2020 18:32:19 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:57354 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726913AbgFQWcS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 17 Jun 2020 18:32:18 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 19B26803202A;
        Wed, 17 Jun 2020 22:32:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id BF6jUKbQ7f0p; Thu, 18 Jun 2020 01:32:11 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Gleixner <tglx@linutronix.de>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        <linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 3/6] dt-bindings: bus: Add MIPS CDMM controller
Date:   Thu, 18 Jun 2020 01:31:57 +0300
Message-ID: <20200617223201.23259-4-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200617223201.23259-1-Sergey.Semin@baikalelectronics.ru>
References: <20200617223201.23259-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

It's a Common Device Memory Map controller embedded into the MIPS IP
cores, which dts node is supposed to have compatible and reg properties.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reviewed-by: Rob Herring <robh@kernel.org>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: linux-mips@vger.kernel.org

---

Changelog prev:
- Lowercase the example hex'es.
---
 .../bindings/bus/mti,mips-cdmm.yaml           | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/mti,mips-cdmm.yaml

diff --git a/Documentation/devicetree/bindings/bus/mti,mips-cdmm.yaml b/Documentation/devicetree/bindings/bus/mti,mips-cdmm.yaml
new file mode 100644
index 000000000000..b3ba98515cbe
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/mti,mips-cdmm.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bus/mti,mips-cdmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MIPS Common Device Memory Map
+
+description: |
+  Defines a location of the MIPS Common Device Memory Map registers.
+
+maintainers:
+  - James Hogan <jhogan@kernel.org>
+
+properties:
+  compatible:
+    const: mti,mips-cdmm
+
+  reg:
+    description: |
+      Base address and size of an unoccupied memory region, which will be
+      used to map the MIPS CDMM registers block.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    cdmm@1bde8000 {
+      compatible = "mti,mips-cdmm";
+      reg = <0 0x1bde8000 0 0x8000>;
+    };
+...
-- 
2.26.2

