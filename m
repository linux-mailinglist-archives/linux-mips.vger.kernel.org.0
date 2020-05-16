Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A39811D5FB4
	for <lists+linux-mips@lfdr.de>; Sat, 16 May 2020 10:30:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727034AbgEPIaH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 16 May 2020 04:30:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbgEPIaG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 16 May 2020 04:30:06 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4A44C05BD09;
        Sat, 16 May 2020 01:30:06 -0700 (PDT)
Received: from localhost.localdomain (unknown [142.147.94.151])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 5D87A21015;
        Sat, 16 May 2020 08:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1589617806; bh=GSXVIXGRxApFj/PKoaIpLWYhWEtm2iFDCNfRjCDcMts=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QXh90bHGGVg2O//dvO/lxguDQUlCFXYKroviBll/mt9uwvnJ9lpm1TQrCA5DoE+sS
         RRQfZ7E90+9PxpnVlmXoc/kruWY+yrQ5XxGWxm1yxBsaG4cug5DEE5Tr1OVbcCWvCc
         sSdz02Or4Aruw14Om63ZVpREVD2RL18C/LVhDZensnpU7EEwHXHkWlm6xZa7Fe8tWM
         sPNi//hZQt0YJSh/fIm5yQ5XVR3Pu03f+cl0kEs3IrmFO6LYDULuTx2L8rsvD0CePi
         XgvS1w3VLvvbJBxqvvQsegNdMH5FuLIdhMI7HVFliOaSyVQDRHZ6+ZZqKaElB9d9bN
         5AD5RvBOI5eYw==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     maz@kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Rob Herring <robh@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [PATCH v4 6/6] dt-bindings: interrupt-controller: Add Loongson PCH MSI
Date:   Sat, 16 May 2020 16:29:06 +0800
Message-Id: <20200516082912.3673033-6-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200516082912.3673033-1-jiaxun.yang@flygoat.com>
References: <20200427060551.1372591-1-jiaxun.yang@flygoat.com>
 <20200516082912.3673033-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Add binding for Loongson PCH MSI controller.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Rob Herring <robh@kernel.org>
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
2.26.2

