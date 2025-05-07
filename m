Return-Path: <linux-mips+bounces-8956-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 37DF7AAE1A0
	for <lists+linux-mips@lfdr.de>; Wed,  7 May 2025 15:56:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D945AB218AE
	for <lists+linux-mips@lfdr.de>; Wed,  7 May 2025 13:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93BE6289E0F;
	Wed,  7 May 2025 13:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="lxqmvzjo"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D79F280A57;
	Wed,  7 May 2025 13:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746625530; cv=none; b=S7EyKZTZ/Sb3Z/XKb4k9SqYA9nzzpJlGvLxSPT4FkwjmI9UNeUG2ZmHHkFJ+cfhosdkC62g3LwvQmEZAVvC50fFQm8jpZvDcNk/RWm8z5+OvyhUWMdAqbis/zCG6yNMJVEk7hSfTUYFTQNUBCHw/RISRHWP+IqTx3TxjE2v2XIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746625530; c=relaxed/simple;
	bh=f2oLBUqEKwI8nm4Ixf3s6Ljc+BL+7kIYtFBoN6/s6Zc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DRgkSNbcKovsFv/H38oq15OAOScoEcTc1DwHv54TaTW+I7SH+Chuga2sPpAlnkkawAM1tdz6NTvgsQmLz+u1SZWQjNSFeD0gVj4ypARZrp8P70t6HVIl7N2An7wqF2z5CltzmQYkMCq1g6vTh+Plus/ROM4Y/0Rk+nHkrindCDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=lxqmvzjo; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9B862DBBF0;
	Wed,  7 May 2025 15:45:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1746625519; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=8xUpIOJ31WmrvP6c37F2pwlE8Ac11OcAayqXYM/2Q9s=;
	b=lxqmvzjoFgZLMi822BVsm9RiDf5rQRpnWcGwXR0/wTbx3RI3y+g2muifdAnNxGypE90F5i
	a+8LQQ6ueobNUJEULWGWyvW+pwz96QXShkASCtikjaArtC0utAd7R8xM2tGCMZ2dEjAsVn
	qL00emLbzpeh3XuE9H1d04aRdJieyvZf75+j66h5uCwhWuyttS6XUxWC0FChOc5q1NxMaH
	ONcEjHCRCZxwiglcOQEuSv0YE/kjpYfpZGGZzxJdNXjffGCmxNLFC6KPf0tgFFBvMsgZI6
	+vIZLPoMAcfIxz6ckWJB7NCoZlLlNOA9j2JNwwrATQShIqJhs2xIzgvR542/WQ==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: tglx@linutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	daniel.lezcano@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benjamin.larsson@genexis.eu,
	linux-mediatek@lists.infradead.org,
	cjd@cjdns.fr,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/7] dt-bindings: timer: Add EcoNet EN751221 "HPT" CPU Timer
Date: Wed,  7 May 2025 13:44:54 +0000
Message-Id: <20250507134500.390547-2-cjd@cjdns.fr>
In-Reply-To: <20250507134500.390547-1-cjd@cjdns.fr>
References: <20250507134500.390547-1-cjd@cjdns.fr>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


