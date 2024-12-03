Return-Path: <linux-mips+bounces-6844-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 594C09E1E57
	for <lists+linux-mips@lfdr.de>; Tue,  3 Dec 2024 14:56:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3701B166C13
	for <lists+linux-mips@lfdr.de>; Tue,  3 Dec 2024 13:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE681F4277;
	Tue,  3 Dec 2024 13:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HSqCII8a"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F591F12E0;
	Tue,  3 Dec 2024 13:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733234159; cv=none; b=Ll9UCL4yDIcNaQ/qFjC82iVyIPO2UXKly8GOOQeepO91QYt2J9n9I4jpIKpq2B6CP3W134k1JfAFr8IvyYx8bonUxuXSwaS+Y4oHLtGaIluYu3pLk3DOkeca9Nl62w6TxB9WszZmUAxhEc689LNEQyZov94feX2021HUMma0gCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733234159; c=relaxed/simple;
	bh=WD2pcUsyR0upLOY68yPUH/zihPiSwjXCHeCuOd7afPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P9i0wg37daxLkFDefd+ifEBJr1wXKyfIDdLlXFBWX1/KwO6g9MmldtsK3vGdoGQHY6u6jcf2s35ZhOQA5Y+OpWDmoukRUcUD1VD0WQu8lVW7GoJ1676XQ3ED5O//FphZfKZ/er2raM54KHJoRuM8GIYpKJDYxE7+JTWiRBF1LrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HSqCII8a; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 32EE260002;
	Tue,  3 Dec 2024 13:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733234148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RSAkpiI3SH9b1GWZEbN5u/HHHSzZvKkCgjFgcbGhZsk=;
	b=HSqCII8aaLodB5Kcmh20iVxBXp78ebeJAeo4oCwNM4j/JH+NOVHmyPSYNE50uCDB2SrR2+
	8zFu1bfVNxyOJVnzcX2IPGPYzksHFOWtD9ccsAOQYjyDfMnO69auMAMO7/jTA0Mg3vLldr
	oDwsSYLSuU77FTfBrObq5lsqwSmYAG0jtCczQKEBcWSS3fLnUxEaAqaReDJLZkJmt0rGpF
	IwpGUO6HLTcOQinXV8mlYjcJPd9JVwMGDMJFnQBesHtCdd/V5K3eTSVcWvXhZ0Plytcu+T
	/CAjqWL6/QzLBQSuSBGwH4cXNpkxEbWff0s2y2X5x1fh2xjCbOADQBllAvY/kg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Tue, 03 Dec 2024 14:55:44 +0100
Subject: [PATCH 1/6] dt-bindings: nvmem: rmem: Add
 mobileye,eyeq5-bootloader-config
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241203-rmem-v1-1-24f4970cf14e@bootlin.com>
References: <20241203-rmem-v1-0-24f4970cf14e@bootlin.com>
In-Reply-To: <20241203-rmem-v1-0-24f4970cf14e@bootlin.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: theo.lebrun@bootlin.com

On Mobileye EyeQ5, the bootloader will put MAC addresses into memory.
Declare that as reserved memory to be used by the kernel, exposing
nvmem cells. That region has a 12-byte header and a 4-byte trailing CRC.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 Documentation/devicetree/bindings/nvmem/rmem.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/rmem.yaml b/Documentation/devicetree/bindings/nvmem/rmem.yaml
index 1ec0d09bcafa857c05ae722834c9e13bf63ee851..85f9f5de3906d2f1afce74ce001cf5db06e50806 100644
--- a/Documentation/devicetree/bindings/nvmem/rmem.yaml
+++ b/Documentation/devicetree/bindings/nvmem/rmem.yaml
@@ -16,6 +16,7 @@ properties:
   compatible:
     items:
       - enum:
+          - mobileye,eyeq5-bootloader-config
           - raspberrypi,bootloader-config
           - raspberrypi,bootloader-public-key
       - const: nvmem-rmem

-- 
2.47.1


