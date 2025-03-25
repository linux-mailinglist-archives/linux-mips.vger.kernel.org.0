Return-Path: <linux-mips+bounces-8345-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2815A702B2
	for <lists+linux-mips@lfdr.de>; Tue, 25 Mar 2025 14:50:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81C80188B69D
	for <lists+linux-mips@lfdr.de>; Tue, 25 Mar 2025 13:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6F0625522E;
	Tue, 25 Mar 2025 13:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="gjn1jOba"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DDE1A317A;
	Tue, 25 Mar 2025 13:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742910265; cv=none; b=oRyEaPNNK7bgacrTW0BFC3l98CiNxKott+DHCSYrm6IY+1ajTfbtkYE2Gwg8bz3wMGdiep98ivXtca2n8l41F25AxIj9zztydtxPemqkK2GqBHoNYn2UBsTtoTa28GDJYnYLlgZfM60vJWZOH7OeEjrW+FluIaWVKQ6Ah01srw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742910265; c=relaxed/simple;
	bh=FXo7iTuG0L9p39dIJH7lCTeYuYq3qLQ4zvqgweNQ/5U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FnuZtvOjYQqZLTEEE0pYWnIgb0hqfRMqseECokp6dkNPYoVBsUvrvQIPhPvoR/W5lRkYgAZx/rv7anqWhHqWVyANbcg+bSRBj+c0A+3AAzKOgzGJZXQByWq6jwfBS1k6I8cWtmxQ2mMrBOx1v4lEqGrSP4BYt+XLWzkkXyBGxtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=gjn1jOba; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 572E62CEA4B;
	Tue, 25 Mar 2025 14:44:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1742910261; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=GC4R2IHyPDOMtrK2VYUSVQdQziavZvcz3UAB+00rqeQ=;
	b=gjn1jObaURXhfOTgerD6xqn3nVjb05sjd6qEKgoCvw89OvAUgZkMDXgpUMn1S2P9FFv0Gq
	1QPD4h7/ceY8sHypJ5rIiChDpTjLdBo3F5MARZL6MwudO43Jb/utTDUIYL9OvtMg3VujSr
	pudFb8JEsvB/XpdMgFlv4FiXHi5q0lbhXlkiz2Gxpm6X5HKsd1yjuek5nJKTTqyRNm6uTI
	B1X1DdBe/S7DrYTTiJuLVLR2qq2KHsMSPVrCvv4FgziCr33VL1fGYaeOUVrrN1ZBljRdRK
	M5INBYkKQU2KGD7pTHOxHz9FsQaAdMg3uUZXJGMwnosi3ykuRUtTBtMX4h5+wQ==
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
Subject: [PATCH v2 04/10] dt-bindings: timer: Add EcoNet EN751221 "HPT" CPU Timer
Date: Tue, 25 Mar 2025 13:43:43 +0000
Message-Id: <20250325134349.2476458-5-cjd@cjdns.fr>
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

Add device tree bindings for the so-called high-precision timer (HPT)
in the EcoNet EN751221 SoC.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
HPT is a name commonly used in vendor and 3rd party out-of-tree sources.
---
 .../bindings/timer/econet,en751221-timer.yaml | 78 +++++++++++++++++++
 1 file changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml

diff --git a/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml b/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
new file mode 100644
index 000000000000..a897af322135
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/econet,en751221-timer.yaml
@@ -0,0 +1,78 @@
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
+      - items:
+          - const: econet,en751221-timer
+      - items:
+          - const: econet,en751627-timer
+          - const: econet,en751221-timer
+
+  reg: true
+
+  interrupts:
+    maxItems: 1
+    description: A percpu-devid timer interrupt shared across CPUs.
+
+  clocks:
+    maxItems: 1
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: econet,en751627-timer
+then:
+  properties:
+    reg:
+      items:
+        - description: Base address for VPE timers 0 and 1
+        - description: Base address for VPE timers 2 and 3
+else:
+  properties:
+    reg:
+      items:
+        - description: Base address for VPE timers 0 and 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
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


