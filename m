Return-Path: <linux-mips+bounces-5802-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4489943FA
	for <lists+linux-mips@lfdr.de>; Tue,  8 Oct 2024 11:19:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB4B61F237E1
	for <lists+linux-mips@lfdr.de>; Tue,  8 Oct 2024 09:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBDAC155A24;
	Tue,  8 Oct 2024 09:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RDe4Sn0G"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADEA2566;
	Tue,  8 Oct 2024 09:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728379134; cv=none; b=oKSoyA2vJMvLg6kJ3y92KgSmizlIFZAugqu2n4fC0NeZHoVyQ8NeDX6cylNs/wN2Tr8ZzjsXxXr5qDESUkP9Q2pMtLp2uuSCcxvY5zCYPf9BPQLaoPx83XYnnZ8WyYLCcf8bfRCcMStWPjVva0QB2rHjuGCiiLDB9bQAQDs+B+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728379134; c=relaxed/simple;
	bh=1uuS+o2Bi8i8FNt4QFdD4TDaUBm3Ls6QgMw52ALb/98=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=O5ccfcABNT3qGs/9ONDb3GXA71vGaYvq4D0rMVWgNsUgEpptRoieX1hxz8wboCZ68DuZuz89eYwFMm+iFMvA641qtyL1FbPsOfj0JpUlYo+Cec4wRYlkpz4ijSx9e7VrQKzV9SYkwiB4rnRGHJGmkU4it41qPMP9H7maSkY6gik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RDe4Sn0G; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BB02220007;
	Tue,  8 Oct 2024 09:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1728379130;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PPKxm5YC1UuW/8wlM8YYafZe/cla9CadeGrH4tXFgRY=;
	b=RDe4Sn0GUpN2rD/J0hi22cW20BlQtRK4rzmw0DwiwJtT033w3QkfkdPPq0PXerRhQCWoSA
	qHfjMmcEXC2PFb3RBqsr3RmFjAKtiIXAGH8FXmO4KBSxDS0JJWAFR6xPcog0AdK5bBEggn
	jiJ4tg+UEBh5Lx26WEVPlhRCvWz0h6RJgtTlIMPeuz4LGJOo/Sa+zxM0aqdVJjW7dwc+eJ
	Rkh9kqH3mpU1UZ0RyVLrRBCXIPzD42gXPdNkVCLQlYr4ked2Lj+zGoVb7kO34gFahk8GTJ
	vlYub+B9PUNtXF5OB7Iax7AHRM+Eg6zCviKLFMl1yRjIVkoF0o5VhNZbK0mKjw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Tue, 08 Oct 2024 11:18:47 +0200
Subject: [PATCH] MIPS: mobileye: eyeq6h-epm6: Use eyeq6h in the board
 device tree
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-eyq6h-dt-v1-1-b8a4df1e6a6c@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAPb4BGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDAwML3dTKQrMM3ZQSXaNkk8RUw9RkQ0NTcyWg8oKi1LTMCrBR0bG1tQA
 z5LLoWgAAAA==
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-Sasl: gregory.clement@bootlin.com

There is currently no eyeq6 compatible string defined in the binding
documentation. Only eyeq6h version is defined, so let's use it.

Note that there are actually no codes relying on eyeq6h; the purpose
of this patch is mainly to be coherent with the documentation.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts b/arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts
index ebc0d363fbf82..59a3e95050eb9 100644
--- a/arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts
+++ b/arch/mips/boot/dts/mobileye/eyeq6h-epm6.dts
@@ -8,7 +8,7 @@
 #include "eyeq6h.dtsi"
 
 / {
-	compatible = "mobileye,eyeq6-epm6", "mobileye,eyeq6";
+	compatible = "mobileye,eyeq6h-epm6", "mobileye,eyeq6h";
 	model = "Mobile EyeQ6H MP6 Evaluation board";
 
 	chosen {

---
base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
change-id: 20241008-eyq6h-dt-2c4ae1ec1157

Best regards,
-- 
Gregory CLEMENT <gregory.clement@bootlin.com>


