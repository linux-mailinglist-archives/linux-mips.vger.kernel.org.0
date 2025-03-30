Return-Path: <linux-mips+bounces-8408-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7831A75B24
	for <lists+linux-mips@lfdr.de>; Sun, 30 Mar 2025 19:04:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5700E18889C8
	for <lists+linux-mips@lfdr.de>; Sun, 30 Mar 2025 17:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF63C1DC046;
	Sun, 30 Mar 2025 17:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="ophRaC/H"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66731581F0;
	Sun, 30 Mar 2025 17:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743354228; cv=none; b=VuzTD6a83hVz2UrET1LflFCVRdmQUdRbgiV6XUIN8lUDgNUL3TlJ4CV2YFCKSX1mGBMl43uJKnml9kOFCJw0PLwN7Q7JCmGUOLAuHCW6Q5EM77I8qDDKs+5y30UE6IBNS5U2QvPJ6tXnMVEeUxqGzpGg8C1/QzqCTFc6t5q0FpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743354228; c=relaxed/simple;
	bh=iuH8/R83wXjbtd5UQ8lDR5xT+6EitQJGTKDHv5Nic4Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j+muvdDXHu5Gwgs43c0s92wUAWLagYzLL21txyYzNZaHMgw0kw/at3TokMviGwxfU1ooyjri2s1QuzE4OnDnbcOyFRbH8zqd0E+DzsJA/g5L1xQmIGt8XspYR/ZIZWn/AXCtgoCd23ca3GztntFiocr/sxmjq+BYTDQtJ3xzB7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=ophRaC/H; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 53B122FA7DD;
	Sun, 30 Mar 2025 19:03:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1743354223; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=MV6qZJAKG2VQUeEH0tVEEYSEdZK/Zf4FCnYQtlW5yeE=;
	b=ophRaC/HRk/QwKMhVaTxmg0RKR3dV9QQx5S8Fj/PoCov6BPbtee4yO5DXffiNTLh06HbQl
	8BAYlkNk/X+jxw+FJGIDCF/Fy6cJ1HT15Hmd1GiK5r2czG7kfihJNc6t+/OEwmeMRi32kJ
	ydue1m0INYdujeAVe8SQB4kKP4saGsD1oKJ+cFSe2UefnQQ5iIDNNS2Eu4pTvkTYeKw2eX
	Cb1OtUvJqs+6GFMQ4geZBFkJwLeKXB4wIbaiOYU/5+z8+JIUNsMcEPqIgWKgTHod04EaVS
	6OuRojVAGMswtAhUDY8Sc4KGwxvJ10F34XkFXulInJOdFeUdYJLcs/4HPvb/7Q==
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
Subject: [PATCH v3 04/10] dt-bindings: timer: Add EcoNet EN751221 "HPT" CPU Timer
Date: Sun, 30 Mar 2025 17:03:00 +0000
Message-Id: <20250330170306.2584136-5-cjd@cjdns.fr>
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

Add device tree bindings for the so-called high-precision timer (HPT)
in the EcoNet EN751221 SoC.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
HPT is a name commonly used in vendor and 3rd party out-of-tree sources.
---
 .../bindings/timer/econet,en751221-timer.yaml | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml

diff --git a/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml b/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
new file mode 100644
index 000000000000..c1e7c2b6afde
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/econet,en751221-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: EcoNet EN751221 High Precision Timer (HPT)
+
+maintainers:
+  - Caleb James DeLisle <cjd@cjdns.fr>
+
+description:
+  The EcoNet High Precision Timer (HPT) is a timer peripheral found in various
+  EcoNet SoCs, including the EN751221 and EN751627 families. It provides per-VPE
+  count/compare registers and a per-CPU control register, with a single interrupt
+  line using a percpu-devid interrupt mechanism.
+
+properties:
+  compatible:
+    oneOf:
+      - const: econet,en751221-timer
+      - items:
+          - const: econet,en751627-timer
+          - const: econet,en751221-timer
+
+  reg:
+    minItems: 1
+    maxItems: 2
+
+  interrupts:
+    maxItems: 1
+    description: A percpu-devid timer interrupt shared across CPUs.
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: econet,en751627-timer
+    then:
+      properties:
+        reg:
+          items:
+            - description: VPE timers 0 and 1
+            - description: VPE timers 2 and 3
+    else:
+      properties:
+        reg:
+          items:
+            - description: VPE timers 0 and 1
+
+additionalProperties: false
+
+examples:
+  - |
+    timer@1fbf0400 {
+        compatible = "econet,en751627-timer", "econet,en751221-timer";
+        reg = <0x1fbf0400 0x100>, <0x1fbe0000 0x100>;
+        interrupt-parent = <&intc>;
+        interrupts = <30>;
+        clocks = <&hpt_clock>;
+    };
+  - |
+    timer@1fbf0400 {
+        compatible = "econet,en751221-timer";
+        reg = <0x1fbe0400 0x100>;
+        interrupt-parent = <&intc>;
+        interrupts = <30>;
+        clocks = <&hpt_clock>;
+    };
+...
-- 
2.39.5


