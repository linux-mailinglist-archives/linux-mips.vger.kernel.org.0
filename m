Return-Path: <linux-mips+bounces-4149-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 494E092803F
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 04:16:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F92BB21189
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 02:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AECB013790F;
	Fri,  5 Jul 2024 02:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="Kj7LJRyn"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D70673D55D
	for <linux-mips@vger.kernel.org>; Fri,  5 Jul 2024 02:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720145742; cv=none; b=bBzagWhBp68zi/AZPCJU126vX27FRDDNaFW/ZSUIYLwHNjhrtlCuKXxZlWLfOma8xwM8jeP6Clcf5tuPjTsyrtuKZPuNbtcIxKaRWqrVFNn31ICBLE0SJ5zegQBRvLboNk3TH5kQYEMzhQktjEV5dTdc9dqYaJk3qLCjbd40VaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720145742; c=relaxed/simple;
	bh=ljU6sRcs7sQuHTpD9/5+A8t80/9OARDwl6j8aTgrIpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fd/44RhXCYYM/Ce3S+MQ+UcZ7o9PyvxoiHI5x09VlXfZbNXs0ortcjRHzzhGWsY2iWRuaDQI9stEKE3lI0+1d5JzViLTuIxSSP+gD3tYs57O2ABidwlSZHNVKZlLemCnkeKz/JriD/Y6U33rrPPvwiGI9IH8/bXj4iK5CIriyp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=Kj7LJRyn; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 0B1AD2C0C3E;
	Fri,  5 Jul 2024 14:15:28 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1720145728;
	bh=adwuxCP0b2iJnp5YoKfId4BXKuJvpUjFFbukitvRfSg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kj7LJRynW0OKdN3cy9AewJ1zWDtpQmmyygowmRfwLvYlaSjeCuHllpNBI5WFGyoLf
	 WUI7TVx8819fbMlBo2JeLJYead2GUeYk25Xvr2U5fYvelMxUF0l3HmjQhWMplQL35+
	 XgRWATrVgIxTA3jYxDYcyDbXzsgGkgnaRHsHjyM9V3fKjhLYmtS9wodLBI+iEg0R9z
	 SxyfrZHve5yjrnQV04b2mAz+SR7CmpUFWPERcmEGVaPcXzCnRTby37W5AgI1G7SWpv
	 eP6tHyKJBuQ/tZ5wplMCWMhaE7eKM2k3v8DQjVnAbD0syft2eE5lYGPvhyiwkBgiOp
	 a7KvY/AjCptHA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6687573e0006>; Fri, 05 Jul 2024 14:15:26 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 8C28813ED5B;
	Fri,  5 Jul 2024 14:15:26 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 896AC280930; Fri,  5 Jul 2024 14:15:26 +1200 (NZST)
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
Subject: [PATCH v4 6/9] dt-bindings: interrupt-controller: realtek,rtl-intc: Add rtl9300-intc
Date: Fri,  5 Jul 2024 14:15:17 +1200
Message-ID: <20240705021520.2737568-7-chris.packham@alliedtelesis.co.nz>
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
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=6687573e a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=4kmOji7k6h8A:10 a=RxOWC8M5BiJtX5JSj5EA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add a compatible string for the interrupt controller found on the
rtl930x SoCs. The interrupt controller has registers for VPE1 so these
are added as a second reg cell.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v3:
    - Add reg::minItems where required
    Changes in v3:
    - Use items to describe the regs property
    Changes in v2:
    - Set reg:maxItems to 2 to allow for VPE1 registers on the rtl9300. A=
dd
      a condition to enforce the old limit on other SoCs.
    - Connor and Krzysztof offered acks on v1 but I think the changes her=
e
      are big enough to void those.

 .../realtek,rtl-intc.yaml                     | 20 ++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/realt=
ek,rtl-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller=
/realtek,rtl-intc.yaml
index fb5593724059..f36aaab73c01 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/realtek,rtl-=
intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/realtek,rtl-=
intc.yaml
@@ -25,6 +25,7 @@ properties:
       - items:
           - enum:
               - realtek,rtl8380-intc
+              - realtek,rtl9300-intc
           - const: realtek,rtl-intc
       - const: realtek,rtl-intc
         deprecated: true
@@ -35,7 +36,10 @@ properties:
     const: 1
=20
   reg:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: vpe0 registers
+      - description: vpe1 registers
=20
   interrupts:
     minItems: 1
@@ -71,6 +75,20 @@ allOf:
     else:
       required:
         - interrupts
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: realtek,rtl9300-intc
+    then:
+      properties:
+        reg:
+          minItems: 1
+          maxItems: 2
+    else:
+      properties:
+        reg:
+          maxItems: 1
=20
 additionalProperties: false
=20
--=20
2.45.2


