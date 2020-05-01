Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 307731C1050
	for <lists+linux-mips@lfdr.de>; Fri,  1 May 2020 11:23:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728540AbgEAJXM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 1 May 2020 05:23:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728236AbgEAJXL (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 1 May 2020 05:23:11 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 967BDC035495;
        Fri,  1 May 2020 02:23:11 -0700 (PDT)
Received: from localhost.localdomain (unknown [103.125.232.133])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 45CB320EE4;
        Fri,  1 May 2020 09:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1588324991; bh=GFn3tLYEcmzd/L7zYYKa9VLN4d+R7mYnKJ2CLoxhCiQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nF1DlM+M2jk0Esmd2mVFPvIbRWyzk5+EujtB6c0fkPWyrz6Rrct7VvJDTTZvc7lSl
         hzoS51J/gFC3//y2v2hcY/Ue1iWT2yzgrgkN95G3bnyBgwMejjFs/ZgQxs+CQvBZo2
         yKmSuYR/ccfbAcC7cVic6cyXFB5itMscEu7XG/jTkWPgMYbCPpOBnQk8H0vnD7c0Ux
         ODzMtZag5F8SHVFrz6ZcgR2F8L1Qo4r0mfAtGlb6/ylEHyXrGkMYgl+XZvtOV+xBBx
         FHvUS0DJfQuqOi1lacR8BMleg8mx9z4dlsPH0rm1oZi0KryRZBqBfVmkmZOM6LYRkl
         cxXL9QhJyDMhw==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     maz@kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [PATCH v3 4/6] dt-bindings: interrupt-controller: Add Loongson PCH PIC
Date:   Fri,  1 May 2020 17:21:35 +0800
Message-Id: <20200501092139.2988670-4-jiaxun.yang@flygoat.com>
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

