Return-Path: <linux-mips+bounces-10995-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5000CB41FA9
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 14:48:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA8661BA24B9
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 12:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22BFE302759;
	Wed,  3 Sep 2025 12:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="raYVsq3B"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43E1301038;
	Wed,  3 Sep 2025 12:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756903665; cv=none; b=hmnYIIdwgfjnjru4XOeqCoxHFVwZtHF91uYfnXayvbH3uoaTVqTgb7ujOB3GaoACoXpuTuLh3Nzd4OAKa6D1+nLLPwGcB4wwqHDnkjCWbwTRacPCjC+CIcc5bo9z1yphG2WxMnRCobYyfh1R/4tPR+wlN0CoD8e6TPOIxMqIw2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756903665; c=relaxed/simple;
	bh=0saqy2ank/kQSz4Ww8r9z1PPHZuOJXL00GI6uyCUJ88=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ohUDVP19ODOnrr/SOFEPob5wCJn4WKS5U8VYxDY7YC3iZVpswJbuvJBe77LPXQ1zq5NDPftmZUl9evfusXPSwI1SbkCa+U0/JFxnlEsDVH30IwPJvfYFbFUy6s2ZVIjVAuLr7eu4ULb4YozpfGQtDzesuQ/fK2+ou1iTTMWFk5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=raYVsq3B; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4F31CC8EC51;
	Wed,  3 Sep 2025 12:47:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5F022606C3;
	Wed,  3 Sep 2025 12:47:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9BE171C22D526;
	Wed,  3 Sep 2025 14:47:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756903660; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+pP4bWwzyG5YF07Boql4xgFZkgldjwexeze/csRTuZ4=;
	b=raYVsq3BQY6IYcs3JlCSSFm4gJbadYGrSCQHOD3EEfGy/cVhb5/puDc3cYuwMzDzCVXxXi
	E01+aTiXFfBrU4DHtIT+4aMlOcqe/TiuDb4q7FCf7AxmCRX/Evy/NXf8DzJwIzp46nqk7i
	E/syakBZwMrSGRnkjmNk+JTRGaO2qnsu4JAdCPxTDo7rQPcVA4FMq8cce7gJOkLQ/2IJ+C
	MlS46y1fYw5N8qCoCuCwgOOb7Z7gPBYsg7mG/fRhaFssuWdTcr5oLo2Gs/ExZW3B+jETNG
	Z1R5vb/SseIcVFUk7kXLym7hRo3Qmo4ThNWmIJWeoIVvJnezoRyw3yN8blHG3A==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 03 Sep 2025 14:47:10 +0200
Subject: [PATCH 03/19] dt-bindings: soc: mobileye: add eyeQ7H compatibles
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250903-clk-eyeq7-v1-3-3f5024b5d6e2@bootlin.com>
References: <20250903-clk-eyeq7-v1-0-3f5024b5d6e2@bootlin.com>
In-Reply-To: <20250903-clk-eyeq7-v1-0-3f5024b5d6e2@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Sari Khoury <sari.khoury@mobileye.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3

The eyeQ7H features 14 OLB. The main differences with the previous
generation of SoC is that some blocks have two clock sources instead
of one and that the clock source can be the one of the clock output of
another OLB instead of the main oscillator.

For the blocks with a single parent clock, the name if that clock is
"ref", similar to what is done for the OLB of the previous SoC. The
blocks with two parent clocks use the names of the reference clocks
generated by the other OLB or the main oscillator.

Some OLB also contain a reset controller with one or more reset domain,
like the blocks found in the eyeQ6H.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 .../bindings/soc/mobileye/mobileye,eyeq-olb.yaml   | 135 ++++++++++++++++++++-
 1 file changed, 130 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq-olb.yaml b/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq-olb.yaml
index a1fb33ab4399cca52fad1e589beede54e09e5512..5800396d39f050c11fa5a4013297f756b97a2b02 100644
--- a/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq-olb.yaml
+++ b/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq-olb.yaml
@@ -14,7 +14,7 @@ maintainers:
 description:
   OLB ("Other Logic Block") is a hardware block grouping smaller blocks. Clocks,
   resets, pinctrl are being handled from here. EyeQ5 and EyeQ6L host a single
-  instance. EyeQ6H hosts seven instances.
+  instance. EyeQ6H hosts seven instances. EyeQ7H hosts 14 instances.
 
 properties:
   compatible:
@@ -29,6 +29,20 @@ properties:
           - mobileye,eyeq6h-south-olb
           - mobileye,eyeq6h-ddr0-olb
           - mobileye,eyeq6h-ddr1-olb
+          - mobileye,eyeq7h-south-olb
+          - mobileye,eyeq7h-east-olb
+          - mobileye,eyeq7h-west-olb
+          - mobileye,eyeq7h-periph-east-olb
+          - mobileye,eyeq7h-periph-west-olb
+          - mobileye,eyeq7h-ddr0-olb
+          - mobileye,eyeq7h-ddr1-olb
+          - mobileye,eyeq7h-mips0-olb
+          - mobileye,eyeq7h-mips1-olb
+          - mobileye,eyeq7h-mips2-olb
+          - mobileye,eyeq7h-acc0-olb
+          - mobileye,eyeq7h-acc1-olb
+          - mobileye,eyeq7h-xnn0-olb
+          - mobileye,eyeq7h-xnn1-olb
       - const: syscon
 
   reg:
@@ -44,12 +58,12 @@ properties:
     const: 1
 
   clocks:
-    maxItems: 1
-    description:
-      Input parent clock to all PLLs. Expected to be the main crystal.
+    minItems: 1
+    maxItems: 2
 
   clock-names:
-    const: ref
+    minItems: 1
+    maxItems: 2
 
 patternProperties:
   '-pins?$':
@@ -265,6 +279,88 @@ required:
 additionalProperties: false
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mobileye,eyeq5-olb
+              - mobileye,eyeq6l-olb
+              - mobileye,eyeq6h-acc-olb
+              - mobileye,eyeq6h-central-olb
+              - mobileye,eyeq6h-east-olb
+              - mobileye,eyeq6h-west-olb
+              - mobileye,eyeq6h-south-olb
+              - mobileye,eyeq6h-ddr0-olb
+              - mobileye,eyeq6h-ddr1-olb
+              - mobileye,eyeq7h-south-olb
+              - mobileye,eyeq7h-periph-east-olb
+              - mobileye,eyeq7h-ddr0-olb
+              - mobileye,eyeq7h-ddr1-olb
+              - mobileye,eyeq7h-mips0-olb
+              - mobileye,eyeq7h-mips1-olb
+              - mobileye,eyeq7h-mips2-olb
+    then:
+      properties:
+        clocks:
+          minItems: 1
+          maxItems: 1
+        clock-names:
+          items:
+            - const: ref
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mobileye,eyeq7h-east-olb
+              - mobileye,eyeq7h-west-olb
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: ref
+            - const: ref_100p0
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mobileye,eyeq7h-periph-west-olb
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: ref_100p0
+            - const: ref_106p6_w
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mobileye,eyeq7h-acc0-olb
+              - mobileye,eyeq7h-acc1-olb
+              - mobileye,eyeq7h-xnn0-olb
+              - mobileye,eyeq7h-xnn1-olb
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: ref_100p0
+            - const: ref_106p6_e
+
     # Compatibles exposing a single reset domain.
   - if:
       properties:
@@ -274,6 +370,12 @@ allOf:
               - mobileye,eyeq6h-acc-olb
               - mobileye,eyeq6h-east-olb
               - mobileye,eyeq6h-west-olb
+              - mobileye,eyeq7h-east-olb
+              - mobileye,eyeq7h-west-olb
+              - mobileye,eyeq7h-periph-east-olb
+              - mobileye,eyeq7h-periph-west-olb
+              - mobileye,eyeq7h-ddr0-olb
+              - mobileye,eyeq7h-ddr1-olb
     then:
       properties:
         '#reset-cells':
@@ -289,6 +391,11 @@ allOf:
             enum:
               - mobileye,eyeq5-olb
               - mobileye,eyeq6l-olb
+              - mobileye,eyeq7h-south-olb
+              - mobileye,eyeq7h-acc0-olb
+              - mobileye,eyeq7h-acc1-olb
+              - mobileye,eyeq7h-xnn0-olb
+              - mobileye,eyeq7h-xnn1-olb
     then:
       properties:
         '#reset-cells':
@@ -306,6 +413,9 @@ allOf:
               - mobileye,eyeq6h-south-olb
               - mobileye,eyeq6h-ddr0-olb
               - mobileye,eyeq6h-ddr1-olb
+              - mobileye,eyeq7h-mips0-olb
+              - mobileye,eyeq7h-mips1-olb
+              - mobileye,eyeq7h-mips2-olb
     then:
       properties:
         '#reset-cells': false
@@ -350,3 +460,18 @@ examples:
         clock-names = "ref";
       };
     };
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      system-controller0@45000000 {
+        compatible = "mobileye,eyeq7h-acc0-olb", "syscon";
+        reg = <0x0 0x45000000 0x0 0x1000>;
+        #reset-cells = <2>;
+        #clock-cells = <1>;
+        clocks = <&olb_south 7>,
+                 <&olb_east 5>;
+        clock-names = "ref_100p0", "ref_106p6_e";
+      };
+    };

-- 
2.51.0


