Return-Path: <linux-mips+bounces-7583-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACAFA1A271
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2025 12:02:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D350C188DF88
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2025 11:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89DC020E6FB;
	Thu, 23 Jan 2025 11:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NByx9zpL"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF07E20E028;
	Thu, 23 Jan 2025 11:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737630130; cv=none; b=AjkV3RnJ87wuLTcjoq3djw0nMizIh75igky5KKKgABp5tLdzhaaRgJb47eqojsU6BVZ9iJ2WYvx1sQdQiulROx/S1KDOaYAymIMVCKU+TZg285SaZJlRyqMIf1YvUBfvId9/Dq9RvOzmr8zBGKwW2q/BSWuJaufg9bHAOeQy2aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737630130; c=relaxed/simple;
	bh=eCZcvNDqgRHWn+DEZZL59YOltlZjMrfu5yAU2RkOUHM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qggRfq7YE0S1IZdJzbhpCH3DNw7Vivc2ocFD6C8G3gPBvWmppjlY7+3rEzsVBKWqtFz8E+kcN7phFOG7zBcQlJrlPOcps0t5b8AtO52YaX2Tun+4TwsQeznGST/bzj+LnFkAheC3v9Hesp/dTBTUs3r3zpkvkoztp+HZ6ViAMV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NByx9zpL; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 632CA240003;
	Thu, 23 Jan 2025 11:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737630125;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Agaud90VoME8ZewXzuNqT14dIsUTegKa0Q3Nwf0CwVc=;
	b=NByx9zpLp8b3fVUc/6pKNAMD9hFS9sIEKZeMnbjjNXLuRzSqbvXHON8m0BImYG3+wSgK/k
	1fSnxBOLgopAqc4Svp1gtSCcrKN5E1YI8Y7/g0cvgGz0IrNDocwWVBgeqMgKZBnKkOuQQd
	jSOKVpaxY9ecCx1JVJ1Wcxmcq5U0xIev1VeZ7yKZzD48O46xp7UZFJ4iir9JvpK8XMVCHt
	efAruvrbIHW1gXNYI3K5UpxDofR3iJQYXwYVzHzcsR9voz3bSVcGj1Y21go7AVtwsBE7t8
	P17Xsm3VgaKM1qyk7JR999XCHmPcde49i8JYYAzkyNpT24UJjhvEFOQxDt/q4A==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Thu, 23 Jan 2025 12:01:55 +0100
Subject: [PATCH v3 2/5] dt-bindings: mips: mips-cm: Add a new compatible
 string for EyeQ6
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250123-cluster-hci-broken-v3-2-8a7ec57cbf68@bootlin.com>
References: <20250123-cluster-hci-broken-v3-0-8a7ec57cbf68@bootlin.com>
In-Reply-To: <20250123-cluster-hci-broken-v3-0-8a7ec57cbf68@bootlin.com>
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
 Documentation/devicetree/bindings/mips/mti,mips-cm.yaml | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
index 4324b2306535f1bf66c44b1f96be9094ee282041..d129d6382847768dc026336d8d2c7328b6b81f9b 100644
--- a/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
+++ b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
@@ -19,7 +19,12 @@ maintainers:
 
 properties:
   compatible:
-    const: mti,mips-cm
+    oneOf:
+      - const: mti,mips-cm
+      - const: mobileye,eyeq6-cm
+        description:
+          On EyeQ6 the HCI (Hardware Cache Initialization) information for
+          the L2 cache in multi-cluster configuration is broken.
 
   reg:
     description:
@@ -44,4 +49,9 @@ examples:
       compatible = "mti,mips-cm";
       reg = <0x1bde8000 0x8000>;
     };
+
+  - |
+    coherency-manager {
+      compatible = "mobileye,eyeq6-cm";
+    };
 ...

-- 
2.45.2


