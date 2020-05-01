Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FC851C1054
	for <lists+linux-mips@lfdr.de>; Fri,  1 May 2020 11:23:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728387AbgEAJX3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 1 May 2020 05:23:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728236AbgEAJX3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 1 May 2020 05:23:29 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64A28C035495;
        Fri,  1 May 2020 02:23:29 -0700 (PDT)
Received: from localhost.localdomain (unknown [103.125.232.133])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 1AF1320EE0;
        Fri,  1 May 2020 09:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1588325009; bh=UBb6voEXnZVtEz2ml1YRi2CB/X7gUz26bvIQSCyUKX0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cVcH5151IpXgmLyWu6QFGlBwg0ezQBRp9ZvbKk+2q5PATvtVH7/Emjkggq8BofAEq
         i1BdRI6FiUEDkLiD2i0upX1YX6ntnr1A2Ex7UmlcOGXkSPHL5IqlbQkHIseE6jzN85
         9srlwFtwZAKPyYj8z6R2Z0KxAW61q4e+UnS+oujtUlROOmD8bZJhEd9LPzpv0KgDfU
         jpHLqvd+ho5Hp7w43ZloKom2m2tf6ZoloTzkbBQG5V87YlZWLWsRBqBMtSrezNCmW8
         yyN0O0llkZHSxoab/6kHoKr3wAxYkT1ondl53JpTg/dTc1UL1HsVGwRvqAvSucwJFa
         BTTuxoF78y+dw==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     maz@kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [PATCH v3 6/6] dt-bindings: interrupt-controller: Add Loongson PCH MSI
Date:   Fri,  1 May 2020 17:21:37 +0800
Message-Id: <20200501092139.2988670-6-jiaxun.yang@flygoat.com>
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

Add binding for Loongson PCH MSI controller.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 .../loongson,pch-msi.yaml                     | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,pch-msi.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-msi.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-msi.yaml
new file mode 100644
index 000000000000..513ed1933035
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-msi.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/interrupt-controller/loongson,pch-msi.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Loongson PCH MSI Controller
+
+maintainers:
+  - Jiaxun Yang <jiaxun.yang@flygoat.com>
+
+description: |
+  This interrupt controller is found in the Loongson LS7A family of PCH for
+  transforming interrupts from PCIe MSI into HyperTransport vectorized
+  interrupts.
+
+properties:
+  compatible:
+    const: loongson,pch-msi-1.0
+
+  reg:
+    maxItems: 1
+
+  loongson,msi-base-vec:
+    $ref: '/schemas/types.yaml#/definitions/uint32'
+    description: |
+      u32 value of the base of parent HyperTransport vector allocated
+      to PCH MSI.
+
+  loongson,msi-num-vecs:
+    $ref: '/schemas/types.yaml#/definitions/uint32'
+    description: |
+      u32 value of the number of parent HyperTransport vectors allocated
+      to PCH MSI.
+
+  msi-controller: true
+
+required:
+  - compatible
+  - reg
+  - msi-controller
+  - loongson,msi-base-vec
+  - loongson,msi-num-vecs
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    msi: msi-controller@2ff00000 {
+      compatible = "loongson,pch-msi-1.0";
+      reg = <0x2ff00000 0x4>;
+      msi-controller;
+      loongson,msi-base-vec = <64>;
+      loongson,msi-num-vecs = <64>;
+      interrupt-parent = <&htvec>;
+    };
+...
-- 
2.26.0.rc2

