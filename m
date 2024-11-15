Return-Path: <linux-mips+bounces-6758-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 903399CEFF2
	for <lists+linux-mips@lfdr.de>; Fri, 15 Nov 2024 16:32:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55717288AFF
	for <lists+linux-mips@lfdr.de>; Fri, 15 Nov 2024 15:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B33E21D5CEE;
	Fri, 15 Nov 2024 15:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="A/fk73Y5"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659AB1D5AC6;
	Fri, 15 Nov 2024 15:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731684619; cv=none; b=tRzumOsxfNaJL4RFBVECPU+mY175CQ0d/ugAB8Mr7R5a/aDgqmoOb5ThHYqhF3ruptAWujrhIP+wCG/bzTIOUtv4vitRRYcM8IocZwqGquGVFGMtUSe4n2gK57lZVg1k+P2k6aRL1MUnipJpVMM1ekHazOf1Ihw6PgusTvhdj6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731684619; c=relaxed/simple;
	bh=kS6DOja/4ELW/nUhIstcM/vOr39mWgDpFzL1QVfznyA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SfsSpZjzUTmhIMqf1yfw8gG5UxFpNjgl8Ykmm4xWl/4k0FN0TOzINlAeACWzEhZAjuhqYKmaxDJbNvNH6MXBvX/P+3x0ZYwX/yp21HY4h/aaxTMEovlzN6+2qM+MBIX7mWBPNyhGhhnyqOuU28xmvePOrlh1ZdQQhdT1/g2JGno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=A/fk73Y5; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0CA5520003;
	Fri, 15 Nov 2024 15:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731684610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G6MVqAwHyuCR7GxoWX3UQdg+1GAIfRhIWW5eEMXkd5s=;
	b=A/fk73Y5+ir8yNfy5zRpPSwtCpphGFXToySIOIa0BL8lv4RoITNDaZrxkAAi/+ppLEFXa+
	N6ZcJgKkTore/Qz/fLeU4Awfq4sgFTidQCZOyb+DDfK4wffyJS05Uqsx91Sp22cYfFuiVa
	KqQEVEAVoTI96Dybfi+nLgAKhxPusuGdHHRm3n8XF8X+BCxj7k3RR4IBg3RGVoV9bq3dTG
	9MpGb5KiVtdD89ePLlyrRObIj06YhPsgaz91c214IvF1gPNiTlvNvC+7lsEDgAejTwfWMR
	LeXtZaz/X30rnssecXW6jqKQrl9CyUMDTDroR+6laWGIQQHZgvEIL3Kak8YF7Q==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 15 Nov 2024 16:29:55 +0100
Subject: [PATCH 2/5] dt-bindings: mips: mips-cm: Add property for broken
 HCI information
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241115-cluster-hci-broken-v1-2-00636800611d@bootlin.com>
References: <20241115-cluster-hci-broken-v1-0-00636800611d@bootlin.com>
In-Reply-To: <20241115-cluster-hci-broken-v1-0-00636800611d@bootlin.com>
To: Aleksandar Rikalo <arikalo@gmail.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gregory CLEMENT <gregory.clement@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: gregory.clement@bootlin.com

Some CM3.5 reports show that Hardware Cache Initialization is
complete, but in reality it's not the case. They also incorrectly
indicate that Hardware Cache Initialization is supported. This
optional property allows warning about this broken feature that cannot
be detected at runtime.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 Documentation/devicetree/bindings/mips/mti,mips-cm.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
index 03a5ba5624a429c428ee2afca73b3e29127e02f9..eab31a1022c8cbdee86081110516579ebe99e640 100644
--- a/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
+++ b/Documentation/devicetree/bindings/mips/mti,mips-cm.yaml
@@ -23,6 +23,12 @@ properties:
       block. It is conventionally decided by the system integrator.
     maxItems: 1
 
+  cm3-l2-config-hci-broken:
+    type: boolean
+    description:
+      If present, indicates that the HCI (Hardware Cache Initialization)
+      information for the L2 cache in multi-cluster configuration is broken.
+
 required:
   - compatible
 

-- 
2.45.2


