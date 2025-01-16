Return-Path: <linux-mips+bounces-7482-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E535A1386E
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2025 11:59:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A57523A78D6
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jan 2025 10:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D716F1DE3D5;
	Thu, 16 Jan 2025 10:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UqbuSol/"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02881DE3A6;
	Thu, 16 Jan 2025 10:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737025174; cv=none; b=palf8vbeR6CEd/eAQOxLhMUqcdNoB3jhL9lITGieQB3AblfCNRjP6PrgcwxpD2kfkGbjEKrk31AqPuS17RduURYaGUJTDs8OCZpOigByoTwZMZ8JV+OilSKkPs1NgYw0d0o8TNBMaAUrUyTKT1Y2L5aDwrkuTxFiwGKsidsPfJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737025174; c=relaxed/simple;
	bh=nhCncoiXCpwTrWom015P2Iz8k0vhJYOTBJz561wU5gU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sGChiSXtyjk3WMCU1ypp74PqC60nf1nYoxBOsnOrIi1oHGfmczSriU07XOwZPeLJWPbzstME9MisbvkopRWyKH2QOX8+gGbRdFmKiSOr7kujIRkgXJEeo7ToyMxsPTzemAeLzgx7ao5xnKO9XslTtP1oYBQKatTgYsV8YPTyRnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UqbuSol/; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68558FF808;
	Thu, 16 Jan 2025 10:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737025170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+3kfIi6k50bb/Q7oC3+JoYFu33V5i5ofievAcInGlvw=;
	b=UqbuSol/V8Ym8k1L9JI8f4ncj3beS9GPgG4KJM1ZVfVE2r8CPmXgRskiuwmiqa0aUCs7nk
	XnemJThFpV4iK0iVZmCjbGymxilTph8YR6fWQyeXNymX3FkeLzDH47I01/0Sj3IHGgHhGw
	ODokarijITZgLpIWvaduyZhuM/3Khjl9WKfuQnfd9r1j3/hyq5FaFpIVuV/ChFH2v36e9z
	be2dILV5PvPehFPifrPIMmixvYnH4ehEjNvlW8ig2o4PJoW05osA7wIr9s5ENL1EsDQyGz
	ntZHIxORHlOxjn3bcIfI1VJlyg06+LmWB1fsWRu+bNWADrrIEMxQrnIfL5B3Tw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Thu, 16 Jan 2025 11:59:20 +0100
Subject: [PATCH v2 2/5] dt-bindings: mips: mips-cm: Add a new compatible
 string for EyeQ6
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-cluster-hci-broken-v2-2-fc52cfb7a19e@bootlin.com>
References: <20250116-cluster-hci-broken-v2-0-fc52cfb7a19e@bootlin.com>
In-Reply-To: <20250116-cluster-hci-broken-v2-0-fc52cfb7a19e@bootlin.com>
To: Aleksandar Rikalo <arikalo@gmail.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: gregory.clement@bootlin.com

The CM3.5 used on EyeQ6 reports that Hardware Cache Initialization is
complete, but in reality it's not the case. It also incorrectly
indicates that Hardware Cache Initialization is supported. This new
compatible string allows warning about this broken feature that cannot
be detected at runtime.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 .../devicetree/bindings/mips/mti,mips-cm.yaml      | 24 ++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
index 9f500804737d23e19f50a9326168686c05d3a54e..4713673f0cfc7785bb183917ee382a815ebfe9e1 100644
--- a/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
+++ b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
@@ -14,7 +14,12 @@ maintainers:
 
 properties:
   compatible:
-    const: mti,mips-cm
+    oneOf:
+      - const: mti,mips-cm
+      - const: mti,eyeq6-cm
+        description:
+          On EyeQ6 the HCI (Hardware Cache Initialization) information for
+          the L2 cache in multi-cluster configuration is broken.
 
   reg:
     description:
@@ -25,14 +30,29 @@ properties:
 
 required:
   - compatible
-  - reg
 
 additionalProperties: false
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: mti,eyeq6-cm
+then:
+  properties:
+    reg: false
+else:
+  required:
+    - reg
+
 examples:
   - |
     coherency-manager@1fbf8000 {
       compatible = "mti,mips-cm";
       reg = <0x1bde8000 0x8000>;
     };
+
+    coherency-manager {
+      compatible = "mti,eyeq6-cm";
+    };
 ...

-- 
2.45.2


