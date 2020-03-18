Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A17671895A8
	for <lists+linux-mips@lfdr.de>; Wed, 18 Mar 2020 07:24:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726933AbgCRGY2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 18 Mar 2020 02:24:28 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17879 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726553AbgCRGY2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 18 Mar 2020 02:24:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1584512602;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=lqxLmQ9H2IRyfO54vBbJaAbVkunOdiQogdl3xWHjoWY=;
        b=YAwbhbFk042/uNjBfn1Yn863yLk21s23wCnztqpQz4wViY3n53p6aZ4AjTBGms7U
        XAqt1ySDuJQD5qH07jIIW68lqA4RPeQ0/jQm+ZmX3Qykz4rr7YN6dnnit1v52rq2Di+
        S7sE+/X4BkUYAEYiWVQPN8DB+BHqae8MCATKaqOc=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1584512599214438.5675020621534; Wed, 18 Mar 2020 14:23:19 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>, Rob Herring <robh@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Allison Randal <allison@lohutok.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Message-ID: <20200318062102.8145-4-jiaxun.yang@flygoat.com>
Subject: [PATCH v5 03/11] dt-bindings: interrupt-controller: Add Loongson LIOINTC
Date:   Wed, 18 Mar 2020 14:20:31 +0800
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200318062102.8145-1-jiaxun.yang@flygoat.com>
References: <20200318062102.8145-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Document Loongson I/O Interrupt controller.

Co-developed-by: Huacai Chen <chenhc@lemote.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../loongson,liointc.yaml                     | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/=
loongson,liointc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongso=
n,liointc.yaml b/Documentation/devicetree/bindings/interrupt-controller/loo=
ngson,liointc.yaml
new file mode 100644
index 000000000000..9c6b91fee477
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,lioin=
tc.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/interrupt-controller/loongson,liointc.=
yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Loongson Local I/O Interrupt Controller
+
+maintainers:
+  - Jiaxun Yang <jiaxun.yang@flygoat.com>
+
+description: |
+  This interrupt controller is found in the Loongson-3 family of chips as =
the primary
+  package interrupt controller which can route local I/O interrupt to inte=
rrupt lines
+  of cores.
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: loongson,liointc-1.0
+      - const: loongson,liointc-1.0a
+
+  reg:
+    maxItems: 1
+
+  interrupt-controller: true
+
+  interrupts:
+    description:
+      Interrupt source of the CPU interrupts.
+    minItems: 1
+    maxItems: 4
+
+  interrupt-names:
+    description: List of names for the parent interrupts.
+    items:
+      - const: int0
+      - const: int1
+      - const: int2
+      - const: int3
+    minItems: 1
+    maxItems: 4
+
+  '#interrupt-cells':
+    const: 2
+
+  'loongson,parent_int_map':
+    description: |
+      This property points how the children interrupts will be mapped into=
 CPU
+      interrupt lines. Each cell refers to a parent interrupt line from 0 =
to 3
+      and each bit in the cell refers to a children interrupt fron 0 to 31=
.
+      If a CPU interrupt line didn't connected with liointc, then keep it'=
s
+      cell with zero.
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/uint32-array
+      - items:
+          minItems: 4
+          maxItems: 4
+
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+  - '#interrupt-cells'
+  - 'loongson,parent_int_map'
+
+
+examples:
+  - |
+    iointc: interrupt-controller@3ff01400 {
+      compatible =3D "loongson,liointc-1.0";
+      reg =3D <0x3ff01400 0x64>;
+
+      interrupt-controller;
+      #interrupt-cells =3D <2>;
+
+      interrupt-parent =3D <&cpuintc>;
+      interrupts =3D <2>, <3>;
+      interrupt-names =3D "int0", "int1";
+
+      loongson,parent_int_map =3D <0xf0ffffff>, /* int0 */
+                                <0x0f000000>, /* int1 */
+                                <0x00000000>, /* int2 */
+                                <0x00000000>; /* int3 */
+
+    };
+
+...
--=20
2.26.0.rc2


