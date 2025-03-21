Return-Path: <linux-mips+bounces-8262-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D74C4A6BC17
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 14:53:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6580B1895C43
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 13:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74FD1165F13;
	Fri, 21 Mar 2025 13:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="gLIB9Txd"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEF014F117;
	Fri, 21 Mar 2025 13:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742565183; cv=none; b=QTbE2INfFBgPrtDNZ61og+ociMJYoSFAu18o5ZW6PfHuExnHyBFS9APh31Sl9AaGWAYSpKQuFrgvsHx4+e/3GcN1csgZUkFJxrNiDBWoddaxp8uWpc7ZUZ2mCxwigMwokjH5gRVyE4TZWG/KZCpqSvmxpBoMWO7Uc1nLNtcJNkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742565183; c=relaxed/simple;
	bh=FrkGkbafNVVQ5VlfcNrmmi6yR64NW4tC8cjY+bGy+Jg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Xpal8sH202NEorcyRNM57XQcpqxOVpj+p+eezaz8s2BvUYxON3IS5g7H7BZPBUZpTk/tGbNmEyzjQY7BaUFc4D9OoNLMRXruskIHEFroZqdgRFVCnqcvs9XMvAsE6uOEPuahSbsp0wW4ifNCpSrcp/HPPCzQKwFN1qyWvbBAGGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=gLIB9Txd; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2487D2A4019;
	Fri, 21 Mar 2025 14:46:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1742564818; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=EoOOrMmp/Q6BDztUeD0REz7b6REoGXkazpSywa1RF54=;
	b=gLIB9TxdZInwzdzhVWTMz97BwbeMud4u+ItDrNk2XOWU7hr4xxcfkXffx8Qx26VhS+CAo+
	nz39TTVLg4UI92rTQ/+62IeUy9rI6noCwLrVc2Z2X4uVbM9vOiP4mDgmQUchdAA7ApZhm7
	HLoaFEKzERv3Cd28Qstn/TjJVhCrjUVTp5DB7sLmCrbjPORVmW5Clx1MwogyxVhYdy8mqK
	e1wCj2r2YMq+IUrMGq0/g0tNl2N4WZn498HQAXcGJnWJhGcNyc+8efZQ9NDwm5JQYt2Njh
	fwBkVW27Yazig3x7gfPf8ncmsYDf5ZfDxGkwuOHawBgjNf/ZfTJ+I27tHjb90w==
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
Subject: [PATCH v1 2/8] dt-bindings: interrupt-controller: Add EcoNet EN751221 INTC
Date: Fri, 21 Mar 2025 13:46:27 +0000
Message-Id: <20250321134633.2155141-3-cjd@cjdns.fr>
In-Reply-To: <20250321134633.2155141-1-cjd@cjdns.fr>
References: <20250321134633.2155141-1-cjd@cjdns.fr>
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
 .../econet,en751221-intc.yaml                 | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml
new file mode 100644
index 000000000000..1b0f262c9630
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/econet,en751221-intc.yaml
@@ -0,0 +1,77 @@
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
+description: |
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
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: |
+      An array of interrupt number pairs where each pair represents a shadow
+      interrupt relationship. The first number in each pair is the primary IRQ,
+      and the second is its shadow IRQ used for VPE#1 control. For example,
+      <8 3> means IRQ 8 is shadowed by IRQ 3, so IRQ 3 cannot be mapped, but
+      when VPE#1 requests IRQ 8, it will use manipulate the IRQ 3 mask bit.
+    maxItems: 40
+    items:
+      minimum: 0
+      maximum: 40
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - "#interrupt-cells"
+  - interrupt-parent
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    intc: interrupt-controller@1fb40000 {
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
2.30.2


