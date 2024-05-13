Return-Path: <linux-mips+bounces-3260-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6408C46ED
	for <lists+linux-mips@lfdr.de>; Mon, 13 May 2024 20:35:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83FF91F216C1
	for <lists+linux-mips@lfdr.de>; Mon, 13 May 2024 18:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 962A73D0A4;
	Mon, 13 May 2024 18:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CVsohI0M"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3133D39FDA;
	Mon, 13 May 2024 18:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715625293; cv=none; b=SxHYDqJmBqcfYW9RYhMsLHFEhWt6ZIjGxJY7jemaE+F/AAgTfZp4vlutnwnlYi3tlPMzRTgtBjDUoVIyDFynxQQTFIFmhWbbaQuqED9w9M1C0qEhqlzRwhl2P8m6UAZC/hKwOioS8y91LOTtunBcAs5XdV9baV4c6SRezqKpfmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715625293; c=relaxed/simple;
	bh=KqQPNppvpsU995OPOshxNkbcP7N8eLdA5LFYesXRmM8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FoIp2axVx1Fj1oJWeJFQrIA036kjadr9rm56QCYEcu9RvqkaXlbXVtNimHDvodl6tcAQkdEfvYMwv8MTkBOsUXvYu6DHdKmx2iGA93dLSfwWTtAucH3vf/Tl9Eps9od/ltHKCbaqG1dUnLReMRlr6f16Lxec4olVpVylGRumXJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CVsohI0M; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF1461C0006;
	Mon, 13 May 2024 18:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715625283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LjHxiGwEneE5uTpr514NpD7Z2HOF5k6gTq1OQGQ/GBI=;
	b=CVsohI0M3iecJjsysG39eaoJmMbKL85+g7Vy4ZNCuW9uhdXh/Pw19B9V3oC4g2hR+zWNKw
	2+aq91fPEKpynP1dzHPMiwLIr4c1j2Q6I/vY74At6kWmTzrNje01Liv6BK+vt7aQZ8J2SH
	qAabMiUmSvSo+dlgSBFnPW/k2hMpJTAlxttZRN+zQISwKbv8tbc+v2YiPOfY8SnSiDTwBm
	BYSGSlEMnyUfItaLY/sd0kfMEiW0Gv38309FweHHHlUkUN+K3ZzRa078lgPK9yzJXl+UMK
	8cwzGlJ2B4zOwfLXXBjhJiL6WXTu7kSt/cOPViMGOtJZ5AiPno3ZGF71W+tsxg==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Mon, 13 May 2024 20:34:15 +0200
Subject: [PATCH v2 1/3] dt-bindings: mips: Add bindings for a new Mobileye
 SoC EyeQ6H
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240513-eyeq6h-v2-1-ae8c1974b52b@bootlin.com>
References: <20240513-eyeq6h-v2-0-ae8c1974b52b@bootlin.com>
In-Reply-To: <20240513-eyeq6h-v2-0-ae8c1974b52b@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=905;
 i=gregory.clement@bootlin.com; h=from:subject:message-id;
 bh=KqQPNppvpsU995OPOshxNkbcP7N8eLdA5LFYesXRmM8=;
 b=owGbwMvMwCTIzSbRJ1JkfZXxtFoSQ5pTrD3HyjTZuY4qB5cVXn7qIsM4tdj6Go/+pJk8u7/KB
 Z+1V/7eEcvCIMjEICumyCKxsuCMeLm+xza75uswc1iZQIYwcHEKwEQidjIsWMfGwlzdwGpmuSvD
 q2ZmWEfdiT2BDPNsd4pK2T6Su5znPMvld6zOaj1xmxsA
X-Developer-Key: i=gregory.clement@bootlin.com; a=openpgp;
 fpr=18A970CC17772F48B63E83D70B06188E14723BD5
X-GND-Sasl: gregory.clement@bootlin.com

Add the yaml bindings for a new Mobileye SoC: EyeQ6H.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 Documentation/devicetree/bindings/mips/mobileye.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/mips/mobileye.yaml b/Documentation/devicetree/bindings/mips/mobileye.yaml
index 831975f6b479..d60744550e46 100644
--- a/Documentation/devicetree/bindings/mips/mobileye.yaml
+++ b/Documentation/devicetree/bindings/mips/mobileye.yaml
@@ -26,6 +26,11 @@ properties:
           - enum:
               - mobileye,eyeq5-epm5
           - const: mobileye,eyeq5
+      - description: Boards with Mobileye EyeQ6H SoC
+        items:
+          - enum:
+              - mobileye,eyeq6h-epm6
+          - const: mobileye,eyeq6h
 
 additionalProperties: true
 

-- 
2.43.0


