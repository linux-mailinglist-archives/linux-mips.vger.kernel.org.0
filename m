Return-Path: <linux-mips+bounces-3111-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DDC8BD260
	for <lists+linux-mips@lfdr.de>; Mon,  6 May 2024 18:18:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 173EBB24354
	for <lists+linux-mips@lfdr.de>; Mon,  6 May 2024 16:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC693156885;
	Mon,  6 May 2024 16:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fagDC5Ws"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7531A156642;
	Mon,  6 May 2024 16:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715012207; cv=none; b=tflp3f7oa0kJgoInNTxYn0oPxqucQHvn6/Q9hDi7ueluqU9b1VMYwWkSYXFRl5EaPOKM1rFObAJWrFdReESGv4l2GgGkgBc+dcU1gt8oAUMsIGDBNVj3zRTRKhJ8IiV8wFH8fhB9cgsi75jVeI2EnhsQg6p1IDRtkjIiC5wYwOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715012207; c=relaxed/simple;
	bh=jNzjFHwuZOa0k+BeBhpH1REqmnBk4LeQdC8qn+eFxtA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N14uaM6yuRmGZH21sG1XyZzXg8fYnz2TN67f2lk7RTgXV5gp0oMdPf7hJEX7IaRdLKvsRLwRw+GjOo8qaYyCN6k2QnRIR7s6BtG3/YbHANTTdmSK5wjXoON0KT6d9/aggf3KUVokHRLENupvl2YJhu2tl2OzvRi1zNLhjcMsOsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fagDC5Ws; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3F6F6240007;
	Mon,  6 May 2024 16:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715012203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MtkU8ulaRyANNJ3DFHdYTh05NSfYT6+fSTvcm7oypUc=;
	b=fagDC5WstxKQcQyaYTwBxF+B4XZucKnX7q9dNBd0wAs5ateSsv6u92K6xo7SO8TAaINCwj
	Mvgi5WAqHsIC3fBNNAasM6ADObFB8VoYTiKAzfuOdURLuXYclQZamcxPUiCZ9cIumE7/oc
	yD/MT8osUo6D4PMfGsz+alSm+8BjxoArh2zP6EDiFPSl/6U46V64kzMUpBZjnOT+fcv1KE
	qHJQunosezXuLcDg6clTmAcs9wf9W10+nQrVguMruybp62IvPJD6FwoAJ+gSwhZ/EJfHW3
	jEjYarx9Wx6BP6jq8CF1A6gqfhHBDx7kJxVeSu8KV6Y5vZ6g8hrgKPoYFQhGkg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Mon, 06 May 2024 18:16:10 +0200
Subject: [PATCH 1/3] dt-bindings: mips: Add bindings for a new Mobileye SoC
 EyeQ6H
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-eyeq6h-v1-1-f29b5269cc43@bootlin.com>
References: <20240506-eyeq6h-v1-0-f29b5269cc43@bootlin.com>
In-Reply-To: <20240506-eyeq6h-v1-0-f29b5269cc43@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=850;
 i=gregory.clement@bootlin.com; h=from:subject:message-id;
 bh=jNzjFHwuZOa0k+BeBhpH1REqmnBk4LeQdC8qn+eFxtA=;
 b=owGbwMvMwCTIzSbRJ1JkfZXxtFoSQ5olU+Y529mWaZyGDU5ORx3+JwYG5sYkWy+Z2xgTq8U3f
 fdu2YkdsSwMgkwMsmKKLBIrC86Il+t7bLNrvg4zh5UJZAgDF6cATCR0OsM8o1/ps5/tXfZjR83O
 4EwD1m3nlSffZJgftS05z/2/rcw939+rZr5YcPxW84HrAA==
X-Developer-Key: i=gregory.clement@bootlin.com; a=openpgp;
 fpr=18A970CC17772F48B63E83D70B06188E14723BD5
X-GND-Sasl: gregory.clement@bootlin.com

Add the yaml bindings for a new Mobileye SoC: EyeQ6H.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 Documentation/devicetree/bindings/mips/mobileye.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mips/mobileye.yaml b/Documentation/devicetree/bindings/mips/mobileye.yaml
index 831975f6b479..909ac9fe0b4b 100644
--- a/Documentation/devicetree/bindings/mips/mobileye.yaml
+++ b/Documentation/devicetree/bindings/mips/mobileye.yaml
@@ -26,6 +26,11 @@ properties:
           - enum:
               - mobileye,eyeq5-epm5
           - const: mobileye,eyeq5
+      - description: Boards with Mobileye EyeQ6H SoC
+        items:
+          - enum:
+              - mobileye,eyeq6-epm6
+          - const: mobileye,eyeq6
 
 additionalProperties: true
 

-- 
2.43.0


