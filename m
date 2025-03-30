Return-Path: <linux-mips+bounces-8409-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF456A75B27
	for <lists+linux-mips@lfdr.de>; Sun, 30 Mar 2025 19:04:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 464B03A8520
	for <lists+linux-mips@lfdr.de>; Sun, 30 Mar 2025 17:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36C21DDA0E;
	Sun, 30 Mar 2025 17:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="ArjQQDOp"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263381DB12C;
	Sun, 30 Mar 2025 17:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743354229; cv=none; b=no8+vHZUlIgSVhp9oompni48BQqF5G4YNYIMu9j/1LAgqKwBmXlMO6DpA/l387cc6HXoeLsKxKNs7EG2LVwh0iJ2hFx0gERQfbg+oiJ2wQVQYMwjN/xwxfmQoOpmuthOi+sjzmTteSTawHn0eRHe6ezivCfe7AHX0+V7HjMQICo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743354229; c=relaxed/simple;
	bh=NQYPQlZwrqeifTXs8+iVOuDOXR+okHgaLPjKiDDnNQg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Er9zWuvdzkRezrw9tpCj0Wav9p8d3oP9HH2tE1JllRneLk3nMsDfop1ohECPVoxB5jk/TfLzmcT6iH40OuCEAl4uinOASkDiHKs/gRZLdZAYE7tehFNnwQD9uzYCCVhLDMj7W183jr96ptTVvjg4/cUl+Jbn4G5G9/kImCNbLNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=ArjQQDOp; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B65982FABEE;
	Sun, 30 Mar 2025 19:03:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1743354220; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=T3nc0PQV6vj26zXMitxB1YPCrHRA8WdHjebHRj+ekXo=;
	b=ArjQQDOpQ6apaD+6oXA4DGmnUThte+9c3s7f0vi2EVMXzh5MdeSYubJMzqvyG2Z+U7uSpM
	gkAdMbqk1BsLoYrs6odxKq57T7rUUpP3nWZzaDJgiyjGr717ZXp+QCXQOkZHcJJLeK9lw6
	nsYd7Mk+Z2qhjNqQG6DWnrhF/q9BG6sB6k9M7Nd9g9ssN9Ss+aJQ0/ialWN0aFmskZsrK0
	cJs96AW4PDJf/MMY0D8xkgC4LExRf79EYFANx6CCPFeFQyPUii9IhbARaKZY1vTK3sgNpL
	Jhx8fLStKJNl1nF4HqcGRd7FDgCXBYvFzpA2rt30F+aP1YscJIsg/JL6kfa65A==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benjamin.larsson@genexis.eu,
	linux-mediatek@lists.infradead.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v3 02/10] dt-bindings: interrupt-controller: Add EcoNet EN751221 INTC
Date: Sun, 30 Mar 2025 17:02:58 +0000
Message-Id: <20250330170306.2584136-3-cjd@cjdns.fr>
In-Reply-To: <20250330170306.2584136-1-cjd@cjdns.fr>
References: <20250330170306.2584136-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Document the device tree binding for the interrupt controller in the
EcoNet EN751221 MIPS SoC.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 .../econet,en751221-intc.yaml                 | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml
new file mode 100644
index 000000000000..5536319c49c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/econet,en751221-intc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: EcoNet EN751221 Interrupt Controller
+
+maintainers:
+  - Caleb James DeLisle <cjd@cjdns.fr>
+
+description:
+  The EcoNet EN751221 Interrupt Controller is a simple interrupt controller
+  designed for the MIPS 34Kc MT SMP processor with 2 VPEs. Each interrupt can
+  be routed to either VPE but not both, so to support per-CPU interrupts, a
+  secondary IRQ number is allocated to control masking/unmasking on VPE#1. For
+  lack of a better term we call these "shadow interrupts". The assignment of
+  shadow interrupts is defined by the SoC integrator when wiring the interrupt
+  lines, so they are configurable in the device tree.
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+properties:
+  compatible:
+    const: econet,en751221-intc
+
+  reg:
+    maxItems: 1
+
+  "#interrupt-cells":
+    const: 1
+
+  interrupt-controller: true
+
+  interrupts:
+    maxItems: 1
+    description: Interrupt line connecting this controller to its parent.
+
+  econet,shadow-interrupts:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    description:
+      An array of interrupt number pairs where each pair represents a shadow
+      interrupt relationship. The first number in each pair is the primary IRQ,
+      and the second is its shadow IRQ used for VPE#1 control. For example,
+      <8 3> means IRQ 8 is shadowed by IRQ 3, so IRQ 3 cannot be mapped, but
+      when VPE#1 requests IRQ 8, it will manipulate the IRQ 3 mask bit.
+    minItems: 1
+    maxItems: 20
+    items:
+      items:
+        - description: primary per-CPU IRQ
+        - description: shadow IRQ number
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - "#interrupt-cells"
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    interrupt-controller@1fb40000 {
+        compatible = "econet,en751221-intc";
+        reg = <0x1fb40000 0x100>;
+
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        interrupt-parent = <&cpuintc>;
+        interrupts = <2>;
+
+        econet,shadow-interrupts = <7 2>, <8 3>, <13 12>, <30 29>;
+    };
+...
-- 
2.39.5


