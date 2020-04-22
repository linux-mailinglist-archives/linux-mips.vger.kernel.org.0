Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E3CF1B473C
	for <lists+linux-mips@lfdr.de>; Wed, 22 Apr 2020 16:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727879AbgDVO0Y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Apr 2020 10:26:24 -0400
Received: from vultr.net.flygoat.com ([149.28.68.211]:59282 "EHLO
        vultr.net.flygoat.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727876AbgDVO0X (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 Apr 2020 10:26:23 -0400
Received: from localhost.localdomain (unknown [IPv6:2001:da8:20f:4430:250:56ff:fe9a:7470])
        by vultr.net.flygoat.com (Postfix) with ESMTPSA id 2354D20CDD;
        Wed, 22 Apr 2020 14:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=flygoat.com; s=vultr;
        t=1587565571; bh=tM9mU9m/7GbgevvpCla3WmP7vNgLDezA1ofrTasUkjQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mzeMyuWei9ItHJ8IJsuBBUvTjxZroCC4Gg7Xf67IYSRA6Ddilwn4mK5unjPI4p3ZB
         67tQtoyAgeF/X7zLGgAWmoXEL8TyUfstlQjr9diKRp0uMmmiTVOP9iNF7GFiyALntM
         OGnfAYgUoSCxU2oYlGY2LMT8YsA8rRUol99K558SbQy5HrUp1mQH445q/hgFLtuCcD
         UDVbFshUGXnSFH6RKH+YAoemcDSIltpqutWFeb7l6/+Vfg3YsVwuihgxK7I3htl4K0
         nIbljcHuAv6B4MzUUqZaMHH2gSiV9WjXroF1gUjmBpPdFSaJfe/NfFi4ZgAOwAkc1/
         8H4Lmzz9u1Dpg==
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org, maz@kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Rob Herring <robh+dt@kernel.org>,
        Huacai Chen <chenhc@lemote.com>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 2/6] dt-bindings: interrupt-controller: Add Loongson HTVEC
Date:   Wed, 22 Apr 2020 22:24:22 +0800
Message-Id: <20200422142428.1249684-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200422142428.1249684-1-jiaxun.yang@flygoat.com>
References: <20200422142428.1249684-1-jiaxun.yang@flygoat.com>
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

