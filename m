Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A87C51EA49D
	for <lists+linux-mips@lfdr.de>; Mon,  1 Jun 2020 15:13:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725935AbgFANLp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Jun 2020 09:11:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726667AbgFANLn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 1 Jun 2020 09:11:43 -0400
Received: from Galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34CEAC061A0E;
        Mon,  1 Jun 2020 06:11:43 -0700 (PDT)
Received: from [5.158.153.53] (helo=tip-bot2.lab.linutronix.de)
        by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
        (Exim 4.80)
        (envelope-from <tip-bot2@linutronix.de>)
        id 1jfkE7-00072b-Fp; Mon, 01 Jun 2020 15:11:39 +0200
Received: from [127.0.1.1] (localhost [IPv6:::1])
        by tip-bot2.lab.linutronix.de (Postfix) with ESMTP id 1D7A41C0244;
        Mon,  1 Jun 2020 15:11:39 +0200 (CEST)
Date:   Mon, 01 Jun 2020 13:11:38 -0000
From:   "tip-bot2 for Serge Semin" <tip-bot2@linutronix.de>
Reply-to: linux-kernel@vger.kernel.org
To:     linux-tip-commits@vger.kernel.org
Subject: [tip: timers/core] dt-bindings: rtc: Convert snps,dw-apb-timer to DT schema
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Rob Herring <robh@kernel.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-mips@vger.kernel.org,
        x86 <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <20200521204818.25436-2-Sergey.Semin@baikalelectronics.ru>
References: <20200521204818.25436-2-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Message-ID: <159101709894.17951.7137516285557950085.tip-bot2@tip-bot2>
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

Commit-ID:     b33aaf5cd68d0fa0f0d6aa15831a1e82e2ef98e1
Gitweb:        https://git.kernel.org/tip/b33aaf5cd68d0fa0f0d6aa15831a1e82e2ef98e1
Author:        Serge Semin <Sergey.Semin@baikalelectronics.ru>
AuthorDate:    Thu, 21 May 2020 23:48:10 +03:00
Committer:     Daniel Lezcano <daniel.lezcano@linaro.org>
CommitterDate: Sat, 23 May 2020 00:02:26 +02:00

dt-bindings: rtc: Convert snps,dw-apb-timer to DT schema

Modern device tree bindings are supposed to be created as YAML-files
in accordance with DT schema. This commit replaces Synopsys DW Timer
legacy bare text binding with YAML file. As before the binding file
states that the corresponding dts node is supposed to be compatible
with generic DW APB Timer indicated by the "snps,dw-apb-timer"
compatible string and to provide a mandatory registers memory range,
one timer interrupt, either reference clock source or a fixed clock
rate value. It may also have an optional APB bus reference clock
phandle specified.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Reviewed-by: Rob Herring <robh@kernel.org>
Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-mips@vger.kernel.org
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Link: https://lore.kernel.org/r/20200521204818.25436-2-Sergey.Semin@baikalelectronics.ru
---
 Documentation/devicetree/bindings/rtc/dw-apb.txt             | 32 +---
 Documentation/devicetree/bindings/rtc/snps,dw-apb-timer.yaml | 88 +++++++-
 2 files changed, 88 insertions(+), 32 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/dw-apb.txt
 create mode 100644 Documentation/devicetree/bindings/rtc/snps,dw-apb-timer.yaml

diff --git a/Documentation/devicetree/bindings/rtc/dw-apb.txt b/Documentation/devicetree/bindings/rtc/dw-apb.txt
deleted file mode 100644
index c703d51..0000000
--- a/Documentation/devicetree/bindings/rtc/dw-apb.txt
+++ /dev/null
@@ -1,32 +0,0 @@
-* Designware APB timer
-
-Required properties:
-- compatible: One of:
- 	"snps,dw-apb-timer"
-	"snps,dw-apb-timer-sp" <DEPRECATED>
-	"snps,dw-apb-timer-osc" <DEPRECATED>
-- reg: physical base address of the controller and length of memory mapped
-  region.
-- interrupts: IRQ line for the timer.
-- either clocks+clock-names or clock-frequency properties
-
-Optional properties:
-- clocks	: list of clock specifiers, corresponding to entries in
-		  the clock-names property;
-- clock-names	: should contain "timer" and "pclk" entries, matching entries
-		  in the clocks property.
-- clock-frequency: The frequency in HZ of the timer.
-- clock-freq: For backwards compatibility with picoxcell
-
-If using the clock specifiers, the pclk clock is optional, as not all
-systems may use one.
-
-
-Example:
-	timer@ffe00000 {
-		compatible = "snps,dw-apb-timer";
-		interrupts = <0 170 4>;
-		reg = <0xffe00000 0x1000>;
-		clocks = <&timer_clk>, <&timer_pclk>;
-		clock-names = "timer", "pclk";
-	};
diff --git a/Documentation/devicetree/bindings/rtc/snps,dw-apb-timer.yaml b/Documentation/devicetree/bindings/rtc/snps,dw-apb-timer.yaml
new file mode 100644
index 0000000..002fe1e
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/snps,dw-apb-timer.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/snps,dw-apb-timer.yaml#
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
