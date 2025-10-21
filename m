Return-Path: <linux-mips+bounces-11821-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEA5BF7AE8
	for <lists+linux-mips@lfdr.de>; Tue, 21 Oct 2025 18:34:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 234FB189C085
	for <lists+linux-mips@lfdr.de>; Tue, 21 Oct 2025 16:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13EAC34F46B;
	Tue, 21 Oct 2025 16:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YPQNlRFF"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA7F34EEF0;
	Tue, 21 Oct 2025 16:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761064397; cv=none; b=OaUgKDStEch3bM/vVfUpjE9WzahnjOF8lWwOZ17z1woLENhUU4e3DCKfGw9FY0gGQkCj8/RalMrZoOATMJfV5yB0jFQeM5Qn70fmiek1UummVUaNY63a+Y22RW2pEju8fnevmMQDKg1xyx8CXocVmqRDUVgdLYyTONqHQ4sEGO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761064397; c=relaxed/simple;
	bh=rZcNBy0W96w3tKwJAsBNWor77WT+oJZEXtI0CDHM2Yw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BbVPm79ZQSlff5Mhgo1fUMUbcHmskHbedsw3BeXVzGT/Ida1W+96clf+ULV7tbUAl7OsGXZpayqBZiOrK+sNf39i4TYb7f2o/kpY8YznsJN2+V7F4ffl48RhCPgz77q8AZjwpI/+Uj7CN8BBsdFf0Is4T8LFLcoiC6W9DFZVKN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YPQNlRFF; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4A3911A1594;
	Tue, 21 Oct 2025 16:33:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1E9F560680;
	Tue, 21 Oct 2025 16:33:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1D458102F241A;
	Tue, 21 Oct 2025 18:33:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761064391; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yPUyMjKAjZ0F5FN4IZiPv/08Pn+WpcjonUV7I71eTcw=;
	b=YPQNlRFFGaxd7DgH6344wSqBklEVwYtRxmrrNu8c+Jx1J8Q9y7ai+wKAGVd9JO7zN3LrTY
	S44S1/arFyXU+J8mePfOwyQa7Pmw21IzG3YiLu8WQHBEnwQvZtlznzrV0ue1yEAgXFxb9r
	r9gOR+HTk98SAsK1D75jX2CPWSEt1cwxh6GPepiqc4ELYq1oq5BHJ48yebCzvXIWKLZHN5
	ItW3JwTD9V0rncRjpTGBwVaopxVeHo/NsEK3ukSor3HLrDTZLEb4mYpl/69kEWVWtzqbbK
	lk6WPGtMS3sZ4BRE3tgsJvOHUkOwC7KdQQiJI61/Bg9/k/MSV2v5zJIcYio4CA==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Tue, 21 Oct 2025 18:32:43 +0200
Subject: [PATCH net-next 02/12] dt-bindings: soc: mobileye: OLB is an
 Ethernet PHY provider on EyeQ5
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251021-macb-eyeq5-v1-2-3b0b5a9d2f85@bootlin.com>
References: <20251021-macb-eyeq5-v1-0-3b0b5a9d2f85@bootlin.com>
In-Reply-To: <20251021-macb-eyeq5-v1-0-3b0b5a9d2f85@bootlin.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Russell King <linux@armlinux.org.uk>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
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


