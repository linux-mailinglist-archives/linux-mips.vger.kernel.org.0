Return-Path: <linux-mips+bounces-6693-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E03159BF287
	for <lists+linux-mips@lfdr.de>; Wed,  6 Nov 2024 17:05:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F91F285561
	for <lists+linux-mips@lfdr.de>; Wed,  6 Nov 2024 16:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43510206970;
	Wed,  6 Nov 2024 16:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bqCjkOeO"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D1A204948;
	Wed,  6 Nov 2024 16:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730909043; cv=none; b=Li0pNoPjx+8zR/Zq+AeAD99ba/IfdtdFUFUcXFnf5Ge0rJJXgjF75LUjE7L4rLq5aOIhhBprOEMGwEOQgB30QgFnZbprqB4AyU/YXrtPQIyR5cUBgN6Rztibm3vGwu7qyNEgEmMGy520b4k6QLkHNsTnf5IQDrNPEhKCyv6ZW68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730909043; c=relaxed/simple;
	bh=n0O22ogoVo6OZXgADqeoCHWd9EUR5G2fGF+bLVlYGTA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kxpiIz2oikt9veBGF5cb6CZkfqET8VFJO8csqaU/6E6XjUhUnKPbFQuuy62Y+/Z8mVg/hA/RTf2FW+2N5jMGm7X79ReMfd57sMfYtM6tDzwsB8Q9KYlaimtYPdVQKUMLunE73HWcBo7jEcBbfBfrgHy2vRjnqn/tXMfdT0P01lU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bqCjkOeO; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5EEC4000C;
	Wed,  6 Nov 2024 16:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730909038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w0h0STs8I6iL7FEbvTaex0RoYlDDG69yp2h2qtyDFI4=;
	b=bqCjkOeOTmbg6o34HMblXg+UIczqzp8EpjQc5cA002RhOOccz3hjwm41UNPcf+IbrAZc2+
	mT4uALzCzA/zKyO9kY84zmAIsccp+I/1/aCf+HsnRYAlDieEs+Rd9jE9RjlrJKlXOrKo7X
	Lyl4jGM2LDpc7qaPT1qh8UDQvoF3pAWZZX+qeNm0W29bglpCYZAO5lYUUJDU8rcyTRwcOj
	/k31gB8zi366G/kb3A21EFe0dXWg1AOnXlp5BMu8UNxNJyaiv+UTB63UWdyMkx50pvnYv8
	NReSAsPLN5oBIK+FNDXP8y7clAelYbuLiLFQSd6U83D1rYPmo3xSAQmj1ccNdw==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Wed, 06 Nov 2024 17:03:52 +0100
Subject: [PATCH v2 01/10] dt-bindings: soc: mobileye: set `#clock-cells =
 <1>` for all compatibles
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241106-mbly-clk-v2-1-84cfefb3f485@bootlin.com>
References: <20241106-mbly-clk-v2-0-84cfefb3f485@bootlin.com>
In-Reply-To: <20241106-mbly-clk-v2-0-84cfefb3f485@bootlin.com>
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
goes from exposing a single clock to multiple ones. Also, dt-bindings
get simpler.

*This is an ABI break*. Change it while EyeQ5 platform support is at its
infancy, without any user. More clocks might hide in each OLB as some
registers are still unknown.

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


