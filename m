Return-Path: <linux-mips+bounces-6903-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 629C89E9B10
	for <lists+linux-mips@lfdr.de>; Mon,  9 Dec 2024 16:59:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEEAD28298B
	for <lists+linux-mips@lfdr.de>; Mon,  9 Dec 2024 15:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64CD713AD3F;
	Mon,  9 Dec 2024 15:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MUr01IBH"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977DB136358;
	Mon,  9 Dec 2024 15:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733759981; cv=none; b=gtcOghAEnAt7vTd9PXMrvkpZFz3bVYBXkCQW2ZfOOvQs5MsBpZeAeDmRvsDddcsywTAgmQOUcneeRvLf+4e7tCpwvHEj91j7z3cHpAcqy96LBLQEfR7iD1kOVzUIbrTm4QEebk4u0aNLTf0NKCUgrOheboNo5d0n618MtDNgff8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733759981; c=relaxed/simple;
	bh=xQCMhd6sNmqzoVJsu+DPTvtqg8ej/py6WlhJVntLvWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DjCbaxDXCvCJHWv7iO58VtRdXUBoNWtlC55gZEBoZZJHttPPZXWq6Sn4/GtzUDtTumcI3okarnC9CtH5WwJ74t9CmAX7Y1e3AzDbbp/XBPDdyL+VjovKHhd0S/PWVQYNKDc0aREC1VE5keVN8kN7bQfOcXssWKTu5jvJSk0F1z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=MUr01IBH; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 866F720002;
	Mon,  9 Dec 2024 15:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733759977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=633wi9jbGbmh5aHGKOl+TzK8t9Yq9KUEmvEFtmIsafs=;
	b=MUr01IBHsv8gjJuGOuFTUSwYBjE0+sIKC6cmCq29uAbAk1m+uBGGUtOgoWFz2GBPhvXWyN
	SZJIW+dAJAXUR0gA01hsOU75SwKP3q2kYNposElmgs73H8LpYdM9BkA6gMVt+tZm/bauXj
	PBTbtWxYJuK/7Ucwvbah/B9rQB55Cs1AFgqOpV8G/Tiw9961Nrn0xMjKzRRJjX3nEU5ifA
	RkHjyHrQTjpTjuuUs9/+zNqTvz9gdOHCNdDoHVuxvR9VuoToTWd5FYKPTVkEUtT+Ipymsc
	mYpANezYbI19JI9/wQao4/dYtC+D4sZWIkguOAiONddy/mjt4hiaCCL7higtFg==
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Date: Mon, 09 Dec 2024 16:59:35 +0100
Subject: [PATCH v2 1/6] dt-bindings: nvmem: rmem: Add
 mobileye,eyeq5-bootloader-config
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241209-rmem-v2-1-cbc0e8c08a21@bootlin.com>
References: <20241209-rmem-v2-0-cbc0e8c08a21@bootlin.com>
In-Reply-To: <20241209-rmem-v2-0-cbc0e8c08a21@bootlin.com>
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

Acked-by: Rob Herring (Arm) <robh@kernel.org>
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


