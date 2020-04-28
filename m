Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C118D1BB6B9
	for <lists+linux-mips@lfdr.de>; Tue, 28 Apr 2020 08:34:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726645AbgD1Gdp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 Apr 2020 02:33:45 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:60594 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726303AbgD1Gdo (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 28 Apr 2020 02:33:44 -0400
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 7CDC320CDC;
        Tue, 28 Apr 2020 06:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1588055624; bh=GFn3tLYEcmzd/L7zYYKa9VLN4d+R7mYnKJ2CLoxhCiQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=m/PmyQfB/W3OsIIyZlfjB52uoj+N/DTglrBnLsdDjwR4YSF4w6VFL6mRG0uh7JLrz
         nFKnmEp1MFuKxcT/cz8aGDH7CRRPZT/c6gh2RjhWyAb0MZ4NiTHY7tKXJ4c0JyK6Sm
         dXAqzuWu1u3rj8QNT2KOXhUy84OKFHhS8CUdBHCX9C/RAoSWoPNq7VJCbZxQKMv4Mt
         nZrPX50CaGMv1lJOerkHY0es/UnFvH+6zU652+2UMOQ1JSMUtUeZROz022zZIQ0rjL
         RBW6K6rzsyH79Kn2ywsnYyYifcFoBiCH0asPeJ2w4Wi8Ng3mWMA0joAee26MPuh16m
         q3kvBaiUHkwlA==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     maz@kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [PATCH v2 4/6] dt-bindings: interrupt-controller: Add Loongson PCH PIC
Date:   Tue, 28 Apr 2020 14:32:43 +0800
Message-Id: <20200428063247.2223499-4-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200428063247.2223499-1-jiaxun.yang@flygoat.com>
References: <20200422142428.1249684-1-jiaxun.yang@flygoat.com>
 <20200428063247.2223499-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add binding for Loongson PCH PIC Controller.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
--
v2:
	- Fix naming
	- Mark loongson,pic-base-vec as required
---
 .../loongson,pch-pic.yaml                     | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml
new file mode 100644
index 000000000000..92a8cd0ce23b
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/interrupt-controller/loongson,pch-pic.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Loongson PCH PIC Controller
+
+maintainers:
+  - Jiaxun Yang <jiaxun.yang@flygoat.com>
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+description: |
+  This interrupt controller is found in the Loongson LS7A family of PCH for
+  transforming interrupts from on-chip devices into HyperTransport vectorized
+  interrupts.
+
+properties:
+  compatible:
+    const: loongson,pch-pic-1.0
+
+  reg:
+    maxItems: 1
+
+  loongson,pic-base-vec:
+    $ref: '/schemas/types.yaml#/definitions/uint32'
+    description: |
+      u32 value of the base of parent HyperTransport vector allocated
+      to PCH PIC.
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - loongson,pic-base-vec
+  - interrupt-controller
+  - '#interrupt-cells'
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    pic: interrupt-controller@10000000 {
+      compatible = "loongson,pch-pic-1.0";
+      reg = <0x10000000 0x400>;
+      interrupt-controller;
+      #interrupt-cells = <2>;
+      loongson,pic-base-vec = <64>;
+      interrupt-parent = <&htvec>;
+    };
+...
-- 
2.26.0.rc2

