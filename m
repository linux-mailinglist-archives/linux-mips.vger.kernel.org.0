Return-Path: <linux-mips+bounces-3812-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 099EB911955
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 06:27:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B98662835DB
	for <lists+linux-mips@lfdr.de>; Fri, 21 Jun 2024 04:27:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A547B12C7F9;
	Fri, 21 Jun 2024 04:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="v8uw59F8"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273FB12C475
	for <linux-mips@vger.kernel.org>; Fri, 21 Jun 2024 04:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718944075; cv=none; b=Yq/VRm0nORJh8ood6xGOVWG/y76sV4Nhtfo55Hhf9KcKCDR3j8ew5JGooh+M6zdDlVO10IiPhkV/7qhysNWKPhFU1ARwvFTBAedT9D+Ee5Lk1UMQ4xnLK/PqyT7YbVk81gqdjfFUgDIUv4R3MKu1zdtH4K5Dzm5Y2PraRg9aWaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718944075; c=relaxed/simple;
	bh=+oU+DEZI0B6EKIcE4wdNt7df75AzkxYpi/IZIH32jog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F9qr2R4ze5boCB50+m3BW2/OXNNdqdKamDhLLYxd//L3lNop4uzIDQRJoAI0RhMvof2IzBLen3WFoxcJDjHJQnxsNQUo9F6igph+x0sxAEvrwiGviDMcv7XYvGTWp3gd/+eTI4ohLKfDKVBLUdHa8JOVX4wFmtfShlKPlTkE054=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=v8uw59F8; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id C6C502C03CB;
	Fri, 21 Jun 2024 16:27:44 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1718944064;
	bh=B4udn6ozOdQHTpD6L6MTO+8afBfxICz46dbXpmmA708=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=v8uw59F8pRPC+iOXvlyTwL0gbKUT5schW65daisnsXCMnIpGnccJmQakLq6RqCcPT
	 aBZR5RV27TYsWIZh5h588EkT32yaLp/hG5vT5DDeGLC7ZEzWp9HHqbNDLkErukeF79
	 pfLjMnNnuNqtMqeGB7liEzE/Pd68+cBZoom0DPPE3CChc0J1sBgLsLsp2xAJu1nUiU
	 fDWlWspKOTAo9WrxZ1ARd7Oq0eikXYzQiu+343RshRx1AKnlxQi5ZDKAbDWZJzns9x
	 JhXhI7e6VuN3xgZdlX4DVmRnemmAAO+pf9z6hQytp/vzYmWvNsLLLtc3L5TDZvj9v+
	 +3aR1OlvTnx2Q==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B667501400002>; Fri, 21 Jun 2024 16:27:44 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 4A00F13EE84;
	Fri, 21 Jun 2024 16:27:44 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 4692B280C0C; Fri, 21 Jun 2024 16:27:44 +1200 (NZST)
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
Subject: [PATCH 2/6] dt-bindings: timer: Add schema for realtek,otto-timer
Date: Fri, 21 Jun 2024 16:27:33 +1200
Message-ID: <20240621042737.674128-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240621042737.674128-1-chris.packham@alliedtelesis.co.nz>
References: <20240621042737.674128-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=66750140 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T1WGqf2p2xoA:10 a=gEfo2CItAAAA:8 a=gAKjGDGbJ80CxQtUxh0A:9 a=3ZKOabzyN94A:10 a=TRDAMGBw1lysTYkqMS0v:22 a=sptkURWiP4Gy88Gu7hUp:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add the devicetree schema for the realtek,otto-timer present on a number
of Realtek SoCs.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 .../bindings/timer/realtek,otto-timer.yaml    | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/realtek,otto-=
timer.yaml

diff --git a/Documentation/devicetree/bindings/timer/realtek,otto-timer.y=
aml b/Documentation/devicetree/bindings/timer/realtek,otto-timer.yaml
new file mode 100644
index 000000000000..b6e85aadbc99
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/realtek,otto-timer.yaml
@@ -0,0 +1,54 @@
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
+          - realtek,rtl930x-timer
+      - const: realtek,otto-timer
+  reg:
+    minItems: 5
+    maxItems: 5
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    minItems: 5
+    maxItems: 5
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
+    timer0: timer@3200 {
+      compatible =3D "realtek,rtl930x-timer", "realtek,otto-timer";
+      reg =3D <0x3200 0x10>, <0x3210 0x10>, <0x3220 0x10>,
+            <0x3230 0x10>, <0x3240 0x10>;
+
+      interrupt-parent =3D <&intc>;
+      interrupts =3D <7 4>, <8 4>, <9 4>, <10 4>, <11 4>;
+      clocks =3D <&lx_clk>;
+    };
--=20
2.45.2


