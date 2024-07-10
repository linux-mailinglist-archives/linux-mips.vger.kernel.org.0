Return-Path: <linux-mips+bounces-4235-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C47C92C9D6
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jul 2024 06:36:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0622BB22C9D
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jul 2024 04:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06B5257CBA;
	Wed, 10 Jul 2024 04:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="xGlJmOiY"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A955A7AA
	for <linux-mips@vger.kernel.org>; Wed, 10 Jul 2024 04:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720586144; cv=none; b=q50TZyYwN9QhiraNt9hBXftoZLx7nlnWsCeHQz2dvbISc+IsF5pMUVcW9FlK2FSp1C3ZQv3VLaAf7XGoG1uMzQgR0ef1U++Z2/kDsD85/n8ZJhYoKauk8xhzay1KDeEgo6MEjIxhfDvuKVVxk4alB5yPSAgr1KXS1np3KMvhrSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720586144; c=relaxed/simple;
	bh=ywhfUg1LfxGyjMcm2us0tnAvIxhdwl829nV9zCKdACE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sFmJ49zo6iNa6C+fl0X/Ya6SQDnkNtlM22AXplVOg7vrMQkZ2AaLHpm7SzoqWRg0a0Okz7qGBnOR/k74p/fQtPGY1tl76kkdeYBVA675/9vhTcTu5n6tYa337CnxjXP9HXKbIJ8ajCX6gKuLaTgr/V5CrOKq4ICL8cEIYZzsjx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=xGlJmOiY; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id DC8B32C0BEC;
	Wed, 10 Jul 2024 16:35:30 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1720586130;
	bh=4tiII8VWo/Wdd2FWXLgrweWDhGx/+ysIc0yDRS45118=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=xGlJmOiYxw+4YzOP+IsDDSnSXLRuTJW/tHvjFeSMwNv9lZp9KKHVp0pm156WE38rK
	 OgaeI3uEeD8klZXzzktRXMjjE3ykMIpvDn3xEIXnKgonxYkFhqhiProSJBNv2kvyMo
	 TEy5SNbtjWT3vzRH+rvQZdaB/YIszp0cXkG8WrYP2UlDO5X37C5ev6bJuqpVCIsSwP
	 EgWAQbxwuQS5rmj2t0HkYG0ePwdzJuXzIj5ZXsdmpwGS44Dj5o5bR5B/LlhgWTm0zm
	 J0P1EOJHbZ/g0k0blz9gD/wD+V3X6d7enXbPn6FrjOEQHoPVDmorwBCcahZJwzLQ8q
	 fa4S5q6IU7i1Q==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B668e0f920005>; Wed, 10 Jul 2024 16:35:30 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 14F4413EE5B;
	Wed, 10 Jul 2024 16:35:30 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 12AFC28206C; Wed, 10 Jul 2024 16:35:30 +1200 (NZST)
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
Subject: [PATCH v5 05/10] dt-bindings: timer: Add schema for realtek,otto-timer
Date: Wed, 10 Jul 2024 16:35:19 +1200
Message-ID: <20240710043524.1535151-6-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240710043524.1535151-1-chris.packham@alliedtelesis.co.nz>
References: <20240710043524.1535151-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=668e0f92 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=4kmOji7k6h8A:10 a=KKAkSRfTAAAA:8 a=gEfo2CItAAAA:8 a=2AJCWd3gv_sDiQv9-YsA:9 a=3ZKOabzyN94A:10 a=cvBusfyB2V15izCimMoJ:22 a=sptkURWiP4Gy88Gu7hUp:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add the devicetree schema for the realtek,otto-timer present on a number
of Realtek SoCs.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Notes:
    Changes in v5:
    - None
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


