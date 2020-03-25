Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 282D3191FF2
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2020 04:59:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727174AbgCYD7r (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Mar 2020 23:59:47 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17894 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726842AbgCYD7r (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 24 Mar 2020 23:59:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585108715;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=HjVIeCBzllp+e4PnPI42dOjiNjtH6Uspoay0E7xupSU=;
        b=bydMAF1Slx97hJpJnOzb+yLWyt70Rlc7NpH2tnBx8WN7FsitP5nH0UGuhanbXmWa
        jFz3Q7hNXDBgTc49mUi1qtMhwLBdDlAYb/yHeLbOtbL6heFkYFTnbtbi6cHBdK4NVy0
        0IQhCPoMDPTru/KzDkj0WkMJsDkXkZkY5cZT6GUQ=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1585108712968682.7866305460943; Wed, 25 Mar 2020 11:58:32 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Rob Herring <robh@kernel.org>, Huacai Chen <chenhc@lemote.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Allison Randal <allison@lohutok.net>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Message-ID: <20200325035537.156911-6-jiaxun.yang@flygoat.com>
Subject: [PATCH v8 05/11] dt-bindings: interrupt-controller: Add Loongson-3 HTPIC
Date:   Wed, 25 Mar 2020 11:54:58 +0800
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200325035537.156911-1-jiaxun.yang@flygoat.com>
References: <20200325035537.156911-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Document Loongson-3 HyperTransport PIC controller.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Co-developed-by: Huacai Chen <chenhc@lemote.com>
Signed-off-by: Huacai Chen <chenhc@lemote.com>
---
 .../interrupt-controller/loongson,htpic.yaml  | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/=
loongson,htpic.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/loongso=
n,htpic.yaml b/Documentation/devicetree/bindings/interrupt-controller/loong=
son,htpic.yaml
new file mode 100644
index 000000000000..c8861cbbb8b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/loongson,htpic=
.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/interrupt-controller/loongson,htpic.ya=
ml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Loongson-3 HyperTransport Interrupt Controller
+
+maintainers:
+  - Jiaxun Yang <jiaxun.yang@flygoat.com>
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+description: |
+  This interrupt controller is found in the Loongson-3 family of chips to =
transmit
+  interrupts from PCH PIC connected on HyperTransport bus.
+
+properties:
+  compatible:
+    const: loongson,htpic-1.0
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
+    htintc: interrupt-controller@1fb000080 {
+      compatible =3D "loongson,htintc-1.0";
+      reg =3D <0xfb000080 0x40>;
+      interrupt-controller;
+      #interrupt-cells =3D <1>;
+
+      interrupt-parent =3D <&liointc>;
+      interrupts =3D <24 IRQ_TYPE_LEVEL_HIGH>,
+                    <25 IRQ_TYPE_LEVEL_HIGH>,
+                    <26 IRQ_TYPE_LEVEL_HIGH>,
+                    <27 IRQ_TYPE_LEVEL_HIGH>;
+    };
+...
--=20
2.26.0.rc2


