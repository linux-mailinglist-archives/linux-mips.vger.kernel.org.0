Return-Path: <linux-mips+bounces-8347-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 05677A702B9
	for <lists+linux-mips@lfdr.de>; Tue, 25 Mar 2025 14:50:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40D0F1880599
	for <lists+linux-mips@lfdr.de>; Tue, 25 Mar 2025 13:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E28C1EEA36;
	Tue, 25 Mar 2025 13:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="U0mGMImL"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DC32571A7;
	Tue, 25 Mar 2025 13:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742910268; cv=none; b=ls1af3T2ReAvnVAO2mqFCiwSnq6SQr94HQgB/32cPLsefs/RtfFybu9cD4Gj0s93/XwLAQpgUTNty0WiWa5N+PNev36gtp1k/kzgDET2o5bGhuDJV76Dn+Y3/F4YLdrZUYDC5QjRGwJcNLzL6C+jt8uj9kmjv+VYOsqGsGZNx0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742910268; c=relaxed/simple;
	bh=uSGNFfrY8jE3xI1OgQ83dSjuEaq2r2kZyy8PLCCNpFA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BVsH/z0KfFQFvI+hEEGXb4+GjR6IRJfl5qsJCGIXN7PHTlOEcI1Vza9LxfB8aeXw1Aturl+nRdzZLMxcgZbJgSDqSZv2y9NeifJg4SqpJNiKMSCXhFVC29aIxpYzQP2K5+r3v75jd7m4uaPS7SR+gtfAq/bDfr8jTUw8/GSd2z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=U0mGMImL; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F15002CF216;
	Tue, 25 Mar 2025 14:44:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1742910258; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=CfwmhzuwDu9s111Mr4QP7njA8+Zmh9UN8wUq+4xS+p8=;
	b=U0mGMImLWlSzGk2XQcZn3HUr3X2Xd/XO4WJlH6BCr4D8qX8phhECy/9j1N4lZuNRw37WqX
	9/Can7GGZSkWggpGcqRYJjf7WbDgGhcb1PMHGRUnw2mkbg7xIfsU9HHO/s1f08gk+xz6th
	ChhsOjH0dfV1jEik8HvOnz/gPMgX5XDtZ7rMOZ5noZnekDj2KyFdq34wWspWVJQvNWBnHo
	0dYg0kcFMHXUuWmdtIjHCR8MXBBkgtfN9CltJE90M0ZU1A5bFpyahSqrznGUypicSNa1YV
	DhK3RSoqq1tBzfRB6pdlCl7/s1BD484fcJKMmy85fG47d/pyYbuZyNQTgD3v3g==
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
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v2 02/10] dt-bindings: interrupt-controller: Add EcoNet EN751221 INTC
Date: Tue, 25 Mar 2025 13:43:41 +0000
Message-Id: <20250325134349.2476458-3-cjd@cjdns.fr>
In-Reply-To: <20250325134349.2476458-1-cjd@cjdns.fr>
References: <20250325134349.2476458-1-cjd@cjdns.fr>
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
If anyone is aware of a standard name for this "shadow interrupt" pattern,
please let me know and I will re-send with updated naming.
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


