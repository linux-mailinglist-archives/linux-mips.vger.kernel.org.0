Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3FAE1CCA4D
	for <lists+linux-mips@lfdr.de>; Sun, 10 May 2020 12:33:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728689AbgEJKc5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 10 May 2020 06:32:57 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:46426 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726630AbgEJKc5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 10 May 2020 06:32:57 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 1922980307CB;
        Sun, 10 May 2020 10:32:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 1LZ__DtdoItH; Sun, 10 May 2020 13:32:53 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Maxim Kaurkin <maxim.kaurkin@baikalelectronics.ru>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>, <linux-mips@vger.kernel.org>,
        <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: hwmon: Add Baikal-T1 PVT sensor binding
Date:   Sun, 10 May 2020 13:32:10 +0300
Message-ID: <20200510103211.27905-2-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20200510103211.27905-1-Sergey.Semin@baikalelectronics.ru>
References: <20200306132611.103408030701@mail.baikalelectronics.ru>
 <20200510103211.27905-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Baikal-T1 SoC is equipped with an embedded process, voltage and
temperature sensor to monitor the chip internal environment like
temperature, supply voltage and transistors performance.

This bindings describes the external Baikal-T1 PVT control interfaces
like MMIO registers space, interrupt request number and clocks source.
These are then used by the corresponding hwmon device driver to
implement the sysfs files-based access to the sensors functionality.

Co-developed-by: Maxim Kaurkin <maxim.kaurkin@baikalelectronics.ru>
Signed-off-by: Maxim Kaurkin <maxim.kaurkin@baikalelectronics.ru>
Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-mips@vger.kernel.org

---

Changelog v2:
- Lowercase the node-name in the example.
- Add dual-license header.
- Don't use a multi-arg clock phandle reference in the examples dt-binding
  property. Thus reundant include pre-processor statement can be removed.
- Replace "additionalProperties: false" property with
  "unevaluatedProperties: false".
- Discard label definition from the example.
- Align settings of the "#thermal-sensor-cells" property with two spaces
  ahead of the property line start.
---
 .../bindings/hwmon/baikal,bt1-pvt.yaml        | 95 +++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/baikal,bt1-pvt.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/baikal,bt1-pvt.yaml b/Documentation/devicetree/bindings/hwmon/baikal,bt1-pvt.yaml
new file mode 100644
index 000000000000..c44500ab3045
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/baikal,bt1-pvt.yaml
@@ -0,0 +1,95 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2020 BAIKAL ELECTRONICS, JSC
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/baikal,bt1-pvt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Baikal-T1 PVT Sensor
+
+maintainers:
+  - Serge Semin <fancer.lancer@gmail.com>
+
+description: |
+  Baikal-T1 SoC provides an embedded process, voltage and temperature
+  sensor to monitor an internal SoC environment (chip temperature, supply
+  voltage and process monitor) and on time detect critical situations,
+  which may cause the system instability and even damages. The IP-block
+  is based on the Analog Bits PVT sensor, but is equipped with a dedicated
+  control wrapper, which provides a MMIO registers-based access to the
+  sensor core functionality (APB3-bus based) and exposes an additional
+  functions like thresholds/data ready interrupts, its status and masks,
+  measurements timeout. Its internal structure is depicted on the next
+  diagram:
+
+     Analog Bits core                     Bakal-T1 PVT control block
+  +--------------------+                  +------------------------+
+  | Temperature sensor |-+         +------| Sensors control        |
+  |--------------------| |<---En---|      |------------------------|
+  | Voltage sensor     |-|<--Mode--| +--->| Sampled data           |
+  |--------------------| |<--Trim--+ |    |------------------------|
+  | Low-Vt sensor      |-|           | +--| Thresholds comparator  |
+  |--------------------| |---Data----| |  |------------------------|
+  | High-Vt sensor     |-|           | +->| Interrupts status      |
+  |--------------------| |--Valid--+-+ |  |------------------------|
+  | Standard-Vt sensor |-+         +---+--| Interrupts mask        |
+  +--------------------+                  |------------------------|
+           ^                              | Interrupts timeout     |
+           |                              +------------------------+
+           |                                        ^  ^
+  Rclk-----+----------------------------------------+  |
+  APB3-------------------------------------------------+
+
+  This bindings describes the external Baikal-T1 PVT control interfaces
+  like MMIO registers space, interrupt request number and clocks source.
+  These are then used by the corresponding hwmon device driver to
+  implement the sysfs files-based access to the sensors functionality.
+
+properties:
+  compatible:
+    const: baikal,bt1-pvt
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: PVT reference clock
+      - description: APB3 interface clock
+
+  clock-names:
+    items:
+      - const: ref
+      - const: pclk
+
+  "#thermal-sensor-cells":
+    description: Baikal-T1 can be referenced as the CPU thermal-sensor
+    const: 0
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/mips-gic.h>
+
+    pvt@1f200000 {
+      compatible = "baikal,bt1-pvt";
+      reg = <0x1f200000 0x1000>;
+      #thermal-sensor-cells = <0>;
+
+      interrupts = <GIC_SHARED 31 IRQ_TYPE_LEVEL_HIGH>;
+
+      clocks = <&ccu_sys>, <&ccu_sys>;
+      clock-names = "ref", "pclk";
+    };
+...
-- 
2.25.1

