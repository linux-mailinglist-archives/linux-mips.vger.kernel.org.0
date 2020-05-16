Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C7CD1D5FAF
	for <lists+linux-mips@lfdr.de>; Sat, 16 May 2020 10:30:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726999AbgEPI36 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 16 May 2020 04:29:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbgEPI35 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 16 May 2020 04:29:57 -0400
Received: from vultr.net.flygoat.com (vultr.net.flygoat.com [IPv6:2001:19f0:6001:3633:5400:2ff:fe8c:553])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD163C061A0C;
        Sat, 16 May 2020 01:29:57 -0700 (PDT)
Received: from localhost.localdomain (unknown [142.147.94.151])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 9366521015;
        Sat, 16 May 2020 08:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1589617797; bh=T/aRKioc+CrdVULJk3R3hF3HC6gDpa3I2SYjNCunjo0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AkGK26bhTMn3Xg+4xoqWDRkUyOZ5P9+DcHmGxaKRMfgABhTxDnGRTAsP/6HWxTdeW
         lVkTxZaJRUrgf4CEe06SySyhNxfOpfOHYzhrX2WyPPw+jSL+/hB3IV5HcEgIt3w+il
         KYDt1FZRnXSctF0ThBBzq25mdGebor/3PyvxWUY1WSWvjb0rcnaYZ3Glea9NISpKBH
         PKi+DnpxVgINAq4fM7IYt5KkViEDW29hKDda73dPZNz9efZ4TuuoySvc77fTaQ+cRD
         LxLDHfLlEBoJ2BUqWnGuHWYmXAcsDVJNE1k9u0EdNXVN4WDQUwFl0Om1Gm2aorv3F/
         Me9w2XkB1qifQ==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     maz@kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Subject: [PATCH v4 4/6] dt-bindings: interrupt-controller: Add Loongson PCH PIC
Date:   Sat, 16 May 2020 16:29:04 +0800
Message-Id: <20200516082912.3673033-4-jiaxun.yang@flygoat.com>
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

Add binding for Loongson PCH PIC Controller.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
--
v2:
	- Fix naming
	- Mark loongson,pic-base-vec as required
---
 .../loongson,pch-pic.yaml                     | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml
new file mode 100644
index 000000000000..9306741f7bec
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,pch-pic.yaml
@@ -0,0 +1,53 @@
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
+description:
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
2.26.2

