Return-Path: <linux-mips+bounces-11854-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AFDBFCF16
	for <lists+linux-mips@lfdr.de>; Wed, 22 Oct 2025 17:40:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E87E3A8E99
	for <lists+linux-mips@lfdr.de>; Wed, 22 Oct 2025 15:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F318B34D4F4;
	Wed, 22 Oct 2025 15:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bF9xAQqS"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD8734C155;
	Wed, 22 Oct 2025 15:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761147573; cv=none; b=VdHA8Dycq/aJ+uSSgqkqHlJ1OdHDmjHeTv1VKMFAWVMOrA8IZBc105FXO2vfpSMImy1tRuDdqCOETCm9Illa/f3ehuMxIWwqFxawoDvM/MsN+5EFG54YVN90jI76BDFeIg30Y7OQ8LPDR2xsnFhnu3/nZu9iY91rzB6mmOKVatE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761147573; c=relaxed/simple;
	bh=rZcNBy0W96w3tKwJAsBNWor77WT+oJZEXtI0CDHM2Yw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gkknhar/MDCwOpYTTxNPCPPYGaBfHsvohaXJfK5jAW49fcvWCS3RTvA0WdIe28D3ISPiNuKtW9q8PEdxd/Q0SjJGm/S5QBUQlr1YmO0bII7OX3z+Kwops4MMlWAJwXcrspoaNqd+dW+QOhtnKYYtHx97h2mP7MKzgVwOWycHIlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bF9xAQqS; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2256DC09FA8;
	Wed, 22 Oct 2025 15:39:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E0DB8606DC;
	Wed, 22 Oct 2025 15:39:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B78D4102F243E;
	Wed, 22 Oct 2025 17:39:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761147564; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yPUyMjKAjZ0F5FN4IZiPv/08Pn+WpcjonUV7I71eTcw=;
	b=bF9xAQqSk/wsiyQgLIcBPzrPYRljKRNXzE286dDrH++HEGBo5IP4h2oav/XJPAdSXmuJG5
	rha2VQnBkSE+ArJRDV5kwhMFdn9aZ8cO/6ljoCQelyYbgaefDp4dcGbtGqshL7RRM2gUH+
	sskpX+/7nNSS0P+ItL/ZenQt7524lCyN6VUrUylrNdxkEhO7FZakg1sqILB8mvM9oGSoW5
	DUUfmCeNW2It7wPYsgYd6ZocDUm01VJYsIQkR/X3oTQQRlpwDv3GmvGdCngXXPor42Ayy9
	xXg2QvrWCz44w787ehEOkh0Pp7mJWdWyi7DxD5YcM4sbNh/fYfpw/TWhOrAC/w==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 22 Oct 2025 17:39:03 +0200
Subject: [PATCH 1/7] dt-bindings: soc: mobileye: OLB is an Ethernet PHY
 provider on EyeQ5
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251022-macb-phy-v1-1-f29f28fae721@bootlin.com>
References: <20251022-macb-phy-v1-0-f29f28fae721@bootlin.com>
In-Reply-To: <20251022-macb-phy-v1-0-f29f28fae721@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

OLB on EyeQ5 ("mobileye,eyeq5-olb" compatible) is now declared as a
generic PHY provider. Under the hood, it provides Ethernet RGMII/SGMII
PHY support for both MAC instances.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 .../devicetree/bindings/soc/mobileye/mobileye,eyeq5-olb.yaml       | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq5-olb.yaml b/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq5-olb.yaml
index 6d11472ba5a7..56401d76a9b5 100644
--- a/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq5-olb.yaml
+++ b/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq5-olb.yaml
@@ -51,6 +51,9 @@ properties:
   clock-names:
     const: ref
 
+  '#phy-cells':
+    const: 1
+
 patternProperties:
   '-pins?$':
     type: object
@@ -310,7 +313,7 @@ allOf:
       properties:
         '#reset-cells': false
 
-    # Only EyeQ5 has pinctrl in OLB.
+    # Only EyeQ5 has pinctrl and PHY in OLB.
   - if:
       not:
         properties:
@@ -320,6 +323,8 @@ allOf:
     then:
       patternProperties:
         '-pins?$': false
+      properties:
+        '#phy-cells': false
 
 examples:
   - |

-- 
2.51.1


