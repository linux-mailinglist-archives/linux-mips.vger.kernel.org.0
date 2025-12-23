Return-Path: <linux-mips+bounces-12561-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB47CD8B19
	for <lists+linux-mips@lfdr.de>; Tue, 23 Dec 2025 11:03:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 90C6C3036CB2
	for <lists+linux-mips@lfdr.de>; Tue, 23 Dec 2025 10:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F54B329C4D;
	Tue, 23 Dec 2025 10:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IQuLIEpX"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605D830AAB0
	for <linux-mips@vger.kernel.org>; Tue, 23 Dec 2025 10:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484159; cv=none; b=fnJ99C1WdBGViU35ND3zz4MPYBsEHkSL+tVnJcDWN0xcjX6a4g6WGB2f3Mf++wh/MNuGbMPsDeWBOd/8sSUTkp00G1+RuU6uD0DGl++CxuSm0M8TOO2M3pYHQZ91OR0h9Eelu5x85nf6vKiEmUOAzqF+pHLYA1D1gp9XVpOXkNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484159; c=relaxed/simple;
	bh=OijirU4m1uXRmnu70c07MBMqY03OYLLLAuIA23xDWRs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tAPBVVqxO9tkgdn1r1ZGHfYvCVaW5FIJvi844Ww8jPwYBpi+eVKL3AryOrt8/jfBfRZDWcoB7SSRcevPhuWwzKEr80cMotIaVrEGlnw2spDfzUtgRAvz30U408+rwgbiA1u9Eh5NtRvIwKOl2r7QcKpHvZsmIrbLdozcFkNRtbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IQuLIEpX; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2F3B2C1AE1E;
	Tue, 23 Dec 2025 10:02:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 41ABD60716;
	Tue, 23 Dec 2025 10:02:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E23AE10AB09B9;
	Tue, 23 Dec 2025 11:02:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766484149; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mSiecC1LXjrSrYjsMhtmeIeYH+a4Lg55QvabvwoUcoI=;
	b=IQuLIEpXv44nTOuqQPveCJd3VcktDrjW+Uzn/PUVPrfEypi6zB56W7Fu6oUJCN+MWxoLBP
	Y8xcRp/4gX4Y3cBTerX4UAxw4pCqD1oPHW86CWTlbBF9KJofGLpS8NP+seK2nfyC/ZkguI
	qpkQn4ujB2FxWqADV3uHdBSsknbKw72okHm2cKrZy9xYIbIpZYcv/CWReVRDA17izHCjGt
	97DQ3xgbe1bG3YGeoFWrWWFgF1yc/hffmVILJqoONkpswEwOxTyVRE2v2Ty/kETq2kR5yY
	O6+ToRJjPWTThfrY5y6gtI/zVLaXbVZu2V5zmU9vafnXVJRF2f/JCwnW/1WcQQ==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Tue, 23 Dec 2025 11:02:16 +0100
Subject: [PATCH v2 01/13] dt-bindings: mips: Add Mobileye EyeQ6Lplus SoC
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251223-eyeq6lplus-v2-1-cd1fd21d182c@bootlin.com>
References: <20251223-eyeq6lplus-v2-0-cd1fd21d182c@bootlin.com>
In-Reply-To: <20251223-eyeq6lplus-v2-0-cd1fd21d182c@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linusw@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Add an entry to the mobileye bindings for the EyeQ6Lplus
which is part of the EyeQ family of system-on-chip.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 Documentation/devicetree/bindings/mips/mobileye.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mips/mobileye.yaml b/Documentation/devicetree/bindings/mips/mobileye.yaml
index d60744550e46..83abe268e96b 100644
--- a/Documentation/devicetree/bindings/mips/mobileye.yaml
+++ b/Documentation/devicetree/bindings/mips/mobileye.yaml
@@ -31,6 +31,11 @@ properties:
           - enum:
               - mobileye,eyeq6h-epm6
           - const: mobileye,eyeq6h
+      - description: Boards with Mobileye EyeQ6Lplus SoC
+        items:
+          - enum:
+              - mobileye,eyeq6lplus-epm6
+          - const: mobileye,eyeq6lplus
 
 additionalProperties: true
 

-- 
2.52.0


