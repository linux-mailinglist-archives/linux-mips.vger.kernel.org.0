Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C26A1EA4AA
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jun 2020 15:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728361AbgFANNW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Jun 2020 09:13:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726327AbgFANLn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Jun 2020 09:11:43 -0400
Received: from Galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9536CC08C5CB;
        Mon,  1 Jun 2020 06:11:42 -0700 (PDT)
Received: from [5.158.153.53] (helo=tip-bot2.lab.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tip-bot2@linutronix.de>)
        id 1jfkE6-00071q-Tx; Mon, 01 Jun 2020 15:11:39 +0200
Received: from [127.0.1.1] (localhost [IPv6:::1])
        by tip-bot2.lab.linutronix.de (Postfix) with ESMTP id 8F9571C0481;
        Mon,  1 Jun 2020 15:11:38 +0200 (CEST)
Date:   Mon, 01 Jun 2020 13:11:38 -0000
From:   "tip-bot2 for Serge Semin" <tip-bot2@linutronix.de>
Reply-to: linux-kernel@vger.kernel.org
To:     linux-tip-commits@vger.kernel.org
Subject: [tip: timers/core] dt-bindings: timer: Move snps,dw-apb-timer DT
 schema from rtc
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        x86 <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <20200521204818.25436-3-Sergey.Semin@baikalelectronics.ru>
References: <20200521204818.25436-3-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Message-ID: <159101709835.17951.3106594572515576976.tip-bot2@tip-bot2>
X-Mailer: tip-git-log-daemon
Robot-ID: <tip-bot2.linutronix.de>
Robot-Unsubscribe: Contact <mailto:tglx@linutronix.de> to get blacklisted from these emails
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required,  ALL_TRUSTED=-1,SHORTCIRCUIT=-0.0001
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     e69bc8999662a3fa6d856820dd09717afff1cbb0
Gitweb:        https://git.kernel.org/tip/e69bc8999662a3fa6d856820dd09717afff1cbb0
Author:        Serge Semin <Sergey.Semin@baikalelectronics.ru>
AuthorDate:    Thu, 21 May 2020 23:48:11 +03:00
Committer:     Daniel Lezcano <daniel.lezcano@linaro.org>
CommitterDate: Sat, 23 May 2020 00:02:33 +02:00

dt-bindings: timer: Move snps,dw-apb-timer DT schema from rtc

This binding file doesn't belong to the rtc seeing it's a pure timer
with no rtc facilities like days/months/years counting and alarms.
So move the YAML-file to the Documentation/devicetree/bindings/timer/
directory.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Acked-by: Rob Herring <robh@kernel.org>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-mips@vger.kernel.org
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Link: https://lore.kernel.org/r/20200521204818.25436-3-Sergey.Semin@baikalelectronics.ru
---
 Documentation/devicetree/bindings/rtc/snps,dw-apb-timer.yaml   | 88 +-------
 Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml | 88 +++++++-
 2 files changed, 88 insertions(+), 88 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/snps,dw-apb-timer.yaml
 create mode 100644 Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml

diff --git a/Documentation/devicetree/bindings/rtc/snps,dw-apb-timer.yaml b/Documentation/devicetree/bindings/rtc/snps,dw-apb-timer.yaml
deleted file mode 100644
index 002fe1e..0000000
--- a/Documentation/devicetree/bindings/rtc/snps,dw-apb-timer.yaml
+++ /dev/null
@@ -1,88 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/rtc/snps,dw-apb-timer.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Synopsys DesignWare APB Timer
-
-maintainers:
-  - Daniel Lezcano <daniel.lezcano@linaro.org>
-
-properties:
-  compatible:
-    oneOf:
-      - const: snps,dw-apb-timer
-      - enum:
-          - snps,dw-apb-timer-sp
-          - snps,dw-apb-timer-osc
-        deprecated: true
-
-  reg:
-    maxItems: 1
-
-  interrupts:
-    maxItems: 1
-
-  clocks:
-    minItems: 1
-    items:
-       - description: Timer ticks reference clock source
-       - description: APB interface clock source
-
-  clock-names:
-    minItems: 1
-    items:
-      - const: timer
-      - const: pclk
-
-  clock-frequency: true
-
-  clock-freq:
-    $ref: "/schemas/types.yaml#/definitions/uint32"
-    description: |
-      Has the same meaning as the 'clock-frequency' property - timer clock
-      frequency in HZ, but is defined only for the backwards compatibility
-      with the picoxcell platform.
-
-unevaluatedProperties: false
-
-required:
-  - compatible
-  - reg
-  - interrupts
-
-oneOf:
-  - required:
-      - clocks
-      - clock-names
-  - required:
-      - clock-frequency
-  - required:
-      - clock-freq
-
-examples:
-  - |
-    timer@ffe00000 {
-      compatible = "snps,dw-apb-timer";
-      interrupts = <0 170 4>;
-      reg = <0xffe00000 0x1000>;
-      clocks = <&timer_clk>, <&timer_pclk>;
-      clock-names = "timer", "pclk";
-    };
-  - |
-    timer@ffe00000 {
-      compatible = "snps,dw-apb-timer";
-      interrupts = <0 170 4>;
-      reg = <0xffe00000 0x1000>;
-      clocks = <&timer_clk>;
-      clock-names = "timer";
-    };
-  - |
-    timer@ffe00000 {
-      compatible = "snps,dw-apb-timer";
-      interrupts = <0 170 4>;
-      reg = <0xffe00000 0x1000>;
-      clock-frequency = <25000000>;
-    };
-...
diff --git a/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml b/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
new file mode 100644
index 0000000..5d300ef
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/snps,dw-apb-timer.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/snps,dw-apb-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys DesignWare APB Timer
+
+maintainers:
+  - Daniel Lezcano <daniel.lezcano@linaro.org>
+
+properties:
+  compatible:
+    oneOf:
+      - const: snps,dw-apb-timer
+      - enum:
+          - snps,dw-apb-timer-sp
+          - snps,dw-apb-timer-osc
+        deprecated: true
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    items:
+       - description: Timer ticks reference clock source
+       - description: APB interface clock source
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: timer
+      - const: pclk
+
+  clock-frequency: true
+
+  clock-freq:
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    description: |
+      Has the same meaning as the 'clock-frequency' property - timer clock
+      frequency in HZ, but is defined only for the backwards compatibility
+      with the picoxcell platform.
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+oneOf:
+  - required:
+      - clocks
+      - clock-names
+  - required:
+      - clock-frequency
+  - required:
+      - clock-freq
+
+examples:
+  - |
+    timer@ffe00000 {
+      compatible = "snps,dw-apb-timer";
+      interrupts = <0 170 4>;
+      reg = <0xffe00000 0x1000>;
+      clocks = <&timer_clk>, <&timer_pclk>;
+      clock-names = "timer", "pclk";
+    };
+  - |
+    timer@ffe00000 {
+      compatible = "snps,dw-apb-timer";
+      interrupts = <0 170 4>;
+      reg = <0xffe00000 0x1000>;
+      clocks = <&timer_clk>;
+      clock-names = "timer";
+    };
+  - |
+    timer@ffe00000 {
+      compatible = "snps,dw-apb-timer";
+      interrupts = <0 170 4>;
+      reg = <0xffe00000 0x1000>;
+      clock-frequency = <25000000>;
+    };
+...
