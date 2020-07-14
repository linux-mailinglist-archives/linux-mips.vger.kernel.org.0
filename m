Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ACEF21F20C
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2020 14:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728200AbgGNM6C (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Jul 2020 08:58:02 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:33238 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726914AbgGNM6B (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Jul 2020 08:58:01 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id CD47B8040A6C;
        Tue, 14 Jul 2020 12:57:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id g7syMbi31EHN; Tue, 14 Jul 2020 15:57:57 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Gleixner <tglx@linutronix.de>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Arnd Bergmann <arnd@arndb.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, James Hogan <jhogan@kernel.org>,
        <linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Rob Herring <robh@kernel.org>
Subject: [PATCH v5 3/6] dt-bindings: bus: Add MIPS CDMM controller
Date:   Tue, 14 Jul 2020 15:57:49 +0300
Message-ID: <20200714125753.22466-4-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200714125753.22466-1-Sergey.Semin@baikalelectronics.ru>
References: <20200714125753.22466-1-Sergey.Semin@baikalelectronics.ru>
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

---

Changelog prev:
- Lowercase the example hex'es.

Changelog v5:
- Consider address and size cells being <1> by default for the examples.
---
 .../bindings/bus/mti,mips-cdmm.yaml           | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/mti,mips-cdmm.yaml

diff --git a/Documentation/devicetree/bindings/bus/mti,mips-cdmm.yaml b/Documentation/devicetree/bindings/bus/mti,mips-cdmm.yaml
new file mode 100644
index 000000000000..9cc2d5f1beef
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
+      reg = <0x1bde8000 0x8000>;
+    };
+...
-- 
2.26.2

