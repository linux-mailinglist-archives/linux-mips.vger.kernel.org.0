Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5091C1048
	for <lists+linux-mips@lfdr.de>; Fri,  1 May 2020 11:22:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728503AbgEAJWz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 1 May 2020 05:22:55 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:60842 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728236AbgEAJWz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 1 May 2020 05:22:55 -0400
Received: from localhost.localdomain (unknown [103.125.232.133])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id C524620EE4;
        Fri,  1 May 2020 09:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1588324974; bh=tM9mU9m/7GbgevvpCla3WmP7vNgLDezA1ofrTasUkjQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BZK+D3L1ow8m+rmK6rVeXm9tvbtgTMot6N1cSMv4xuaSrYlCwHFIeZ9BULgasFGpC
         TiYMT23MxeDxTYoVOt2O9fVWefkTCN8yYEDHyQ7rnM7CzqDIJh/PxYaImFd8pcx9w7
         73C28ZLHpuK9a1ZcRwDkbetzS+2c8dhhTwRRfaQr/43NHIGzWqNXjGx6F1g9a1O1zV
         o1MWrZ/se/APGPI8BaX82u7mqgZGaK5xQ1jibmqss1Cps+Lq3oL1z/AJi8gmaErVcI
         kCeJmFHM3GXKr5GcQP/Ya5SuUD/VDbYtrkSYc4hcWkp26ShTFYIfc128HTlFr37dBp
         UUhmQj+Bjj8UQ==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     maz@kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [PATCH v3 2/6] dt-bindings: interrupt-controller: Add Loongson HTVEC
Date:   Fri,  1 May 2020 17:21:33 +0800
Message-Id: <20200501092139.2988670-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200501092139.2988670-1-jiaxun.yang@flygoat.com>
References: <20200422142428.1249684-1-jiaxun.yang@flygoat.com>
 <20200501092139.2988670-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add binding for Loongson-3 HyperTransport Interrupt Vector Controller.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 .../interrupt-controller/loongson,htvec.yaml  | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,htvec.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,htvec.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,htvec.yaml
new file mode 100644
index 000000000000..547a80c89eba
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,htvec.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/interrupt-controller/loongson,htvec.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Loongson-3 HyperTransport Interrupt Vector Controller
+
+maintainers:
+  - Jiaxun Yang <jiaxun.yang@flygoat.com>
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+description: |
+  This interrupt controller is found in the Loongson-3 family of chips for
+  receiving vectorized interrupts from PCH's interrupt controller.
+
+properties:
+  compatible:
+    const: loongson,htvec-1.0
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 4
+    description: |
+      Four parent interrupts that receive chained interrupts.
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    htvec: interrupt-controller@1fb000080 {
+      compatible = "loongson,htvec-1.0";
+      reg = <0xfb000080 0x40>;
+      interrupt-controller;
+      #interrupt-cells = <1>;
+
+      interrupt-parent = <&liointc>;
+      interrupts = <24 IRQ_TYPE_LEVEL_HIGH>,
+                    <25 IRQ_TYPE_LEVEL_HIGH>,
+                    <26 IRQ_TYPE_LEVEL_HIGH>,
+                    <27 IRQ_TYPE_LEVEL_HIGH>;
+    };
+...
-- 
2.26.0.rc2

