Return-Path: <linux-mips+bounces-4239-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A8692C9E0
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jul 2024 06:37:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B285FB22B1C
	for <lists+linux-mips@lfdr.de>; Wed, 10 Jul 2024 04:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C605382D89;
	Wed, 10 Jul 2024 04:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="NwTBQZou"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435235EE8D
	for <linux-mips@vger.kernel.org>; Wed, 10 Jul 2024 04:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720586146; cv=none; b=JkYt3nykDj6U2VAjjPpxjD1OHWwEwuhBQxu43nWLJA38AIphwRxUHnsbJbKiAyAoay0Q+4XPwsqW44aLoxNLhSUwZlSYjM0Ih2GIOGXilOhZGVcotea7cG7NY4HSf/PCeQz8g+sL9Lv9t9rgxt7JL4i1r8H9kKadt43eV5/k/mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720586146; c=relaxed/simple;
	bh=/QscuPu7+Ecjty+6eNRa0yLXTwTF9fu5uMF9Y+sBNm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uaMBAm5t1QdnziElm/YG1ouhsMwr/IGoIFuUpZ7jSc/p2MADeC3aeCZRoPgcXmf0iQTYJvFPRgt1F55j/hpUrRkM6yy8ZVIDisot87V5c2Qogtlrzwx9Zd9dWZIbaFjS45FRutSwawR/lHHrH9FHNQYHp4BlauxrPNjD66Fb1y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=NwTBQZou; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id EF3522C0C2E;
	Wed, 10 Jul 2024 16:35:30 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1720586130;
	bh=oMCL0+2Zo5SbiAWoeP73zxYN9D8jHqDiGNWNoW3oKI8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NwTBQZoulL+LKFP4iqztXwEN1vrls29n+AWC6GLq7TmrtKAluq9un1Uj6KaZqVorT
	 3F8Q5miRv/Z/6gtqrSoGgp3BcAWQxpykqDuztjRtdXf8oOZ4goG/MsuM13yenLPm7j
	 RdO3/cg6N/+fGQ/2GmnTEh+Ywj0qdbv0YXegeVNrZ/F5g9xhNV1sY8BHUWFNCXRyvE
	 LHiIAN1cBGYbhWxs3Df4IZ2QvjgRkDa84kNvGhojuBuoSj0ycVPQ8M3X613B5ptXxF
	 am0Uqt0zRSJY9K2zQFFMJZYX92Wgl9P7FXiyQKICyEsPjK+xNugvkB+XGse8xj1PgF
	 HJuXp5JU9Y58g==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B668e0f920006>; Wed, 10 Jul 2024 16:35:30 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 1A1DA13EE8E;
	Wed, 10 Jul 2024 16:35:30 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 174CF28206C; Wed, 10 Jul 2024 16:35:30 +1200 (NZST)
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
Subject: [PATCH v5 06/10] dt-bindings: interrupt-controller: realtek,rtl-intc: Add rtl9300-intc
Date: Wed, 10 Jul 2024 16:35:20 +1200
Message-ID: <20240710043524.1535151-7-chris.packham@alliedtelesis.co.nz>
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
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=668e0f92 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=4kmOji7k6h8A:10 a=lV5s-A3J1nGhCCvx9HwA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add a compatible string for the interrupt controller found on the
rtl930x SoCs. The interrupt controller has registers for VPE1 so these
are added as a second reg cell.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v5:
    - set reg::minItems =3D 2 when compatible =3D=3D "rtl9300-intc"
    Changes in v4:
    - None
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
index fb5593724059..833a01cdd1b1 100644
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
+          minItems: 2
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


