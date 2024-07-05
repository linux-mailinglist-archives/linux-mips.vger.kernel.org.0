Return-Path: <linux-mips+bounces-4146-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 64DBE928037
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 04:16:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B1021F258BD
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 02:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757BD171B0;
	Fri,  5 Jul 2024 02:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="xZtP//cR"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AE726AD3
	for <linux-mips@vger.kernel.org>; Fri,  5 Jul 2024 02:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720145741; cv=none; b=jWFXcSQLUK4t9U9R0eFzEdV460MRcBMFSs2UQwjKc83cODERECp4QY4BAMlG/PXdWGovdaNCOxBSHXTyPLaCcdU7DRDelWsxqqYPeywuyT0l54s2uWtIUvYkWI+WVMdCtUv58bmQ+tPXALVr0HfTgDigQdznhRWzrlcR4wPsbqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720145741; c=relaxed/simple;
	bh=jpgEhqoiJLFt4eKeu2jNU/GRvW96hmqCQ8VpTR6L5hI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=giIaHF2ditX9uUP1O0p4ZEkD+nNQAxeoESsLrhiberl7WrzWAu56PIcpp/9yzIwowwSvIZs5oeEvd/7IIVz3rvJTMGL8BUvBbLmpjB4H/IS8KX4BkghAnXzPFCnlOVb8S9A+4H/66CppekrwHo8NV33KRSFK70xOOfhAQmvScg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=xZtP//cR; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id DF87A2C0BEC;
	Fri,  5 Jul 2024 14:15:27 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1720145727;
	bh=0C+q9xo0SRant1J/cPVKZrZxM7tdjJdasqObpEK8TGo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=xZtP//cRmUJtA+oJtwM7afSCZRLtf25Di1aXC4Tcw1KP579lrNIK3HN/1voZWK/Bg
	 qFVmZx/og8YojiDIys+SEkov1VZsrV9yftD6TuJwk3tXiCilv8sQlJJnWrRR+GB++e
	 rZlncm0h2Pqzj8nN6e82hThGUIoliJRT4GVma7dHioRnqPIiP4eKHwG6CLtAmNL0QU
	 12zgLejRvdwUaiZu1aqltxOCygmf3c6gxf4QoAepqOugrzaARrNbhUwQYWwkHw3alR
	 t7JwxwyWZ+H26vgwuX9x295h/AwUSVXrH3p7wcRQ1o5SQl+pw7S3MA8nQyUcnos/hv
	 K1RTC+w/ZrNoQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6687573e0007>; Fri, 05 Jul 2024 14:15:26 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 879FA13EE9C;
	Fri,  5 Jul 2024 14:15:26 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 84D13280930; Fri,  5 Jul 2024 14:15:26 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: tglx@linutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	daniel.lezcano@linaro.org,
	paulburton@kernel.org,
	peterz@infradead.org,
	mail@birger-koblitz.de,
	bert@biot.com,
	john@phrozen.org,
	sander@svanheule.net
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	kabel@kernel.org,
	ericwouds@gmail.com,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v4 5/9] dt-bindings: timer: Add schema for realtek,otto-timer
Date: Fri,  5 Jul 2024 14:15:16 +1200
Message-ID: <20240705021520.2737568-6-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240705021520.2737568-1-chris.packham@alliedtelesis.co.nz>
References: <20240705021520.2737568-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=6687573e a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=4kmOji7k6h8A:10 a=KKAkSRfTAAAA:8 a=gEfo2CItAAAA:8 a=2AJCWd3gv_sDiQv9-YsA:9 a=3ZKOabzyN94A:10 a=cvBusfyB2V15izCimMoJ:22 a=sptkURWiP4Gy88Gu7hUp:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add the devicetree schema for the realtek,otto-timer present on a number
of Realtek SoCs.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Notes:
    Changes in v4:
    - Add r-by from Krzysztof
    Changes in v3:
    - Use items to describe regs and interrupt properties
    - Remove minItems condition
    Changes in v2:
    - Use specific compatible (rtl9302-timer instead of rtl930x-timer)
    - Remove unnecessary label
    - Remove unused irq flags (interrupt controller is one-cell)
    - Set minItems for reg and interrupts based on compatible

 .../bindings/timer/realtek,otto-timer.yaml    | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/realtek,otto-=
timer.yaml

diff --git a/Documentation/devicetree/bindings/timer/realtek,otto-timer.y=
aml b/Documentation/devicetree/bindings/timer/realtek,otto-timer.yaml
new file mode 100644
index 000000000000..7b6ec2c69484
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/realtek,otto-timer.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/realtek,otto-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek Otto SoCs Timer/Counter
+
+description:
+  Realtek SoCs support a number of timers/counters. These are used
+  as a per CPU clock event generator and an overall CPU clocksource.
+
+maintainers:
+  - Chris Packham <chris.packham@alliedtelesis.co.nz>
+
+properties:
+  $nodename:
+    pattern: "^timer@[0-9a-f]+$"
+
+  compatible:
+    items:
+      - enum:
+          - realtek,rtl9302-timer
+      - const: realtek,otto-timer
+
+  reg:
+    items:
+      - description: timer0 registers
+      - description: timer1 registers
+      - description: timer2 registers
+      - description: timer3 registers
+      - description: timer4 registers
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: timer0 interrupt
+      - description: timer1 interrupt
+      - description: timer2 interrupt
+      - description: timer3 interrupt
+      - description: timer4 interrupt
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    timer@3200 {
+      compatible =3D "realtek,rtl9302-timer", "realtek,otto-timer";
+      reg =3D <0x3200 0x10>, <0x3210 0x10>, <0x3220 0x10>,
+            <0x3230 0x10>, <0x3240 0x10>;
+
+      interrupt-parent =3D <&intc>;
+      interrupts =3D <7>, <8>, <9>, <10>, <11>;
+      clocks =3D <&lx_clk>;
+    };
--=20
2.45.2


