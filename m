Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D323C1E228B
	for <lists+linux-mips@lfdr.de>; Tue, 26 May 2020 15:00:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389277AbgEZM75 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 26 May 2020 08:59:57 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:57316 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731776AbgEZM7k (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 26 May 2020 08:59:40 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id D6081803086F;
        Tue, 26 May 2020 12:59:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 9Q_ERQDKo20T; Tue, 26 May 2020 15:59:35 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Paul Burton <paulburton@kernel.org>,
        Olof Johansson <olof@lixom.net>, <linux-mips@vger.kernel.org>,
        <soc@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 3/6] dt-bindings: memory: Add Baikal-T1 L2-cache Control Block binding
Date:   Tue, 26 May 2020 15:59:25 +0300
Message-ID: <20200526125928.17096-4-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200526125928.17096-1-Sergey.Semin@baikalelectronics.ru>
References: <20200526125928.17096-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There is a single register provided by the SoC system controller,
which can be used to tune the L2-cache RAM up. It only provides a way
to change the L2-RAM access latencies. So aside from "be,bt1-l2-ctl"
compatible string the device node can be optionally equipped with the
properties of Tag/Data/WS latencies.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Olof Johansson <olof@lixom.net>
Cc: linux-mips@vger.kernel.org
Cc: soc@kernel.org

---

Changelog v2:
- Move driver to the memory subsystem.
- Use dual GPL/BSD license.
- Use single lined copyright header.
- Move "allOf" restrictions to the root level of the properties.
- Discard syscon compatible string and reg property.
- The DT node is supposed to be a child of the Baikal-T1 system controller
  node.

Changelog v3:
- Get the reg property back even though the driver is using the parental
  syscon regmap.
- The DT schema will live separately from the system controller, but the
  corresponding sub-node of the later DT schema will $ref this one.
- Set non-default latencies in the example.
---
 .../memory-controllers/baikal,bt1-l2-ctl.yaml | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/baikal,bt1-l2-ctl.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/baikal,bt1-l2-ctl.yaml b/Documentation/devicetree/bindings/memory-controllers/baikal,bt1-l2-ctl.yaml
new file mode 100644
index 000000000000..1fca282f64a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/baikal,bt1-l2-ctl.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2020 BAIKAL ELECTRONICS, JSC
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/baikal,bt1-l2-ctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Baikal-T1 L2-cache Control Block
+
+maintainers:
+  - Serge Semin <fancer.lancer@gmail.com>
+
+description: |
+  By means of the System Controller Baikal-T1 SoC exposes a few settings to
+  tune the MIPS P5600 CM2 L2 cache performance up. In particular it's possible
+  to change the Tag, Data and Way-select RAM access latencies. Baikal-T1
+  L2-cache controller block is responsible for the tuning. Its DT node is
+  supposed to be a child of the system controller.
+
+properties:
+  compatible:
+    const: baikal,bt1-l2-ctl
+
+  reg:
+    maxItems: 1
+
+  baikal,l2-ws-latency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Cycles of latency for Way-select RAM accesses
+    default: 0
+    minimum: 0
+    maximum: 3
+
+  baikal,l2-tag-latency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Cycles of latency for Tag RAM accesses
+    default: 0
+    minimum: 0
+    maximum: 3
+
+  baikal,l2-data-latency:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Cycles of latency for Data RAM accesses
+    default: 1
+    minimum: 0
+    maximum: 3
+
+additionalProperties: false
+
+required:
+  - compatible
+
+examples:
+  - |
+    l2@1f04d028 {
+      compatible = "baikal,bt1-l2-ctl";
+      reg = <0x1f04d028 0x004>;
+
+      baikal,l2-ws-latency = <1>;
+      baikal,l2-tag-latency = <1>;
+      baikal,l2-data-latency = <2>;
+    };
+...
-- 
2.26.2

