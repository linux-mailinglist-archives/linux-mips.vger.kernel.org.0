Return-Path: <linux-mips+bounces-6584-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BADE29B7F1B
	for <lists+linux-mips@lfdr.de>; Thu, 31 Oct 2024 16:53:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B774281B79
	for <lists+linux-mips@lfdr.de>; Thu, 31 Oct 2024 15:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAC0A1A3BDE;
	Thu, 31 Oct 2024 15:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LRc8xeRq"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E09A16BE1C;
	Thu, 31 Oct 2024 15:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730389986; cv=none; b=E6n1ml74cE/FAGQO3WQcl/HTMVeSgNH5p+vuZP0LzAWpYDr7JLmfkV4zbt8SG1NMdsk2gBb5e/O5Ak/6Cs84WiUOzJiVR38X8T2E2f0IHUdPyS3RbAvG8F5+ZZ5QZhImJRBYrOWhuPSBCGsNVyTguIVDT6zt0tt9DniX7hkyNvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730389986; c=relaxed/simple;
	bh=UQOZleKN0I47pFewlLdn4eNH5eyQYywz80j7YTDBrs4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=okn39Kp4MAwHzrgSXlQLjwx/a6ibIvD/3alGZnIbP9Ku0gVsiBnGl1M1gtbhkDBQyHFXijFBA/HQQ/+2Rq7bfQdQDAv+gJhdaBhhNQsbB1+JEBRzpmHCozfRGhqc9FxGPTOWQsLx3YIyBGJYM4XMUj26SWSSoXRsALAm8Sq4Um8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LRc8xeRq; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B7891C0002;
	Thu, 31 Oct 2024 15:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730389976;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w3qxyX3xIUtfm2MBeQ9m7antb8YArMnqEhCwuO3QGyQ=;
	b=LRc8xeRqGEg4/VRLFYNNMBGnGUO12SjJXBqznuAmBTJ1t5N0eIZawgubIXOBVGgnleOmHs
	gzYnhs0GJIDhhuUXEXOIOy0cg/SHPbBgiMk9W/oNlWwzvx21vPwB1Nm8kzpQ88Qs3ZiSHW
	kt57tM3as3Sw7gaQLVLZCYNjjm3A8HSUECweQnL3il96x5kABOeU1iEqiZU8/e1c6FB0+8
	z7QbjD7VoAKhDrWSh9494Nk07QLKLnKLjV1MfL8E5veLtAcERfkoXwunU4jRw1P39e+T4h
	M4l5FUozOvkcXkGQEUWdhmkW95BhErGUZJRyyD+EcnqFS2tjJlgp97tGlcucKg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Thu, 31 Oct 2024 16:52:51 +0100
Subject: [PATCH 01/13] dt-bindings: soc: mobileye: set `#clock-cells = <1>`
 for all compatibles
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241031-mbly-clk-v1-1-89d8b28e3006@bootlin.com>
References: <20241031-mbly-clk-v1-0-89d8b28e3006@bootlin.com>
In-Reply-To: <20241031-mbly-clk-v1-0-89d8b28e3006@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: theo.lebrun@bootlin.com

Some compatibles expose a single clock. For those, we used to let them
using `#clock-cells = <0>` (ie <&olb> reference rather than <&olb 0>).

Switch away from that: enforce a cell for all compatibles. This is more
straight forward, and avoids devicetree changes whenever a compatible
goes from exposing a single clock to multiple ones.

Side benefit: dt-bindings is simpler.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 .../bindings/soc/mobileye/mobileye,eyeq5-olb.yaml  | 24 +---------------------
 1 file changed, 1 insertion(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq5-olb.yaml b/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq5-olb.yaml
index f7e606d45ebcfc46ffe076e23a2ed514bfff9b8f..6d11472ba5a704d5d20f43776e5867f507a39242 100644
--- a/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq5-olb.yaml
+++ b/Documentation/devicetree/bindings/soc/mobileye/mobileye,eyeq5-olb.yaml
@@ -41,9 +41,7 @@ properties:
     enum: [ 1, 2 ]
 
   '#clock-cells':
-    description:
-      Cell is clock index. Optional if compatible has a single clock.
-    enum: [ 0, 1 ]
+    const: 1
 
   clocks:
     maxItems: 1
@@ -312,26 +310,6 @@ allOf:
       properties:
         '#reset-cells': false
 
-    # Compatibles exposing a single clock.
-  - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - mobileye,eyeq6h-central-olb
-              - mobileye,eyeq6h-east-olb
-              - mobileye,eyeq6h-west-olb
-              - mobileye,eyeq6h-ddr0-olb
-              - mobileye,eyeq6h-ddr1-olb
-    then:
-      properties:
-        '#clock-cells':
-          const: 0
-    else:
-      properties:
-        '#clock-cells':
-          const: 1
-
     # Only EyeQ5 has pinctrl in OLB.
   - if:
       not:

-- 
2.47.0


