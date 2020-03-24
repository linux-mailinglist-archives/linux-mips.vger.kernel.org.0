Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4871F191504
	for <lists+linux-mips@lfdr.de>; Tue, 24 Mar 2020 16:42:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728368AbgCXPjd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 24 Mar 2020 11:39:33 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17898 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728940AbgCXPjd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Tue, 24 Mar 2020 11:39:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585064281;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=From:To:Cc:Message-ID:Subject:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type;
        bh=xZKLAkmJ3p4vaTmh3kFSXV3wDhQH3iUKqe9BfCmhbuk=;
        b=DssRYctyLDc6coGjtrxpUhL6V4aJdXR8WsqGH6B4IM2tY61QYHpT3ZfzPx8NaADP
        xDx6dyC0/hUGFJPU8WyUaErg4jCo+vAsx0rWpraiG6wDkICbRC8QqaU+P0hr0+Xkp+4
        PiB3/5yCUhOvU1LQc1VRleW2s+KPBamlW1p0aAh8=
Received: from localhost.localdomain (39.155.141.144 [39.155.141.144]) by mx.zoho.com.cn
        with SMTPS id 1585064279398694.8568644949094; Tue, 24 Mar 2020 23:37:59 +0800 (CST)
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
To:     linux-mips@vger.kernel.org
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>, Rob Herring <robh@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Message-ID: <20200324153624.23109-6-jiaxun.yang@flygoat.com>
Subject: [PATCH v6 05/11] dt-bindings: interrupt-controller: Add Loongson-3 HTPIC
Date:   Tue, 24 Mar 2020 23:36:02 +0800
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200324153624.23109-1-jiaxun.yang@flygoat.com>
References: <20200324153624.23109-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-ZohoCNMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Document Loongson-3 HyperTransport PIC controller.

Co-developed-by: Huacai Chen <chenhc@lemote.com>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Rob Herring <robh@kernel.org>
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


