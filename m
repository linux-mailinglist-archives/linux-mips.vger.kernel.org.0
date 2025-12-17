Return-Path: <linux-mips+bounces-12499-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 269DFCC7F21
	for <lists+linux-mips@lfdr.de>; Wed, 17 Dec 2025 14:47:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A212B304B4C7
	for <lists+linux-mips@lfdr.de>; Wed, 17 Dec 2025 13:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E59F53451D1;
	Wed, 17 Dec 2025 13:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0YQ95MaX"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758009463
	for <linux-mips@vger.kernel.org>; Wed, 17 Dec 2025 13:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765978582; cv=none; b=NHA9ycHBHNhiKeuaZ49DCrNZ4ciPm67/C1pFbPbo61dpvYkGTtSMGKlnhWva+N/smS1mIg9HW1Qy+eAVhgC+/fGuVRPBrMz214T9WwGaAkzS4ptY8oXsFNJxSjhEHMUrhNgM6sjXsOeyq00jCos5AM9XHsFJt/9mHh3/eU9JSPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765978582; c=relaxed/simple;
	bh=RjMDAIaDZZXP0m69JmuMYA2wJkoaodzqTtRvkH1EhWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ThnrjTsmvmIb4RgpjN8oaH0IjeufwZWp8LKCwtht8+2/5wP/L7reYpY6B4zb23zkWmr0hDFFS0hgpUBx2DbvcFi4nRvdi7t978M2b/aN53xAag1XbthSYDuLiONmgh+r2yFHL3D//yuZ7n7qe4afLsbLm9nJZGwqFDovqgX3HSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0YQ95MaX; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7AC0CC1A59E;
	Wed, 17 Dec 2025 13:35:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 09F2B6072F;
	Wed, 17 Dec 2025 13:36:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 742CD102F0ACB;
	Wed, 17 Dec 2025 14:36:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765978572; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=U4ar0yUQMVr14k9hAUEwpKo0B6UIyAl6YboOIyhFLEw=;
	b=0YQ95MaXlGAQspbAdi5tpeW0np7znMlqW0fFEMREaF5Q9BqxvzRlltUMB6dmxJIklYcEoc
	uoHDfb9fGntiCpkZeN5vDEWJXjv/2HUpOPMyaPg7pX5KRTEmLnfYTqFEvS0c6IMS//Ls6G
	Ms/qj5p57XJro4Zcm/0Xq1wQl+jttxcwzrobFhjemUnkdVTDm7vM6FkEbJr8a1ZQ7ppUI6
	28LIzniBBDj/EibVknuHGnqcBD0/1/aC4jaUHUU0Mq1l1x3zf66VUWSai3G9TzQBnx/9r/
	PkPiawQLJ52cEvQor3XPx4UEBo9slPr9aRrMpit6h1x+z/Pz5BGOCbi9hKwhTw==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Wed, 17 Dec 2025 14:35:51 +0100
Subject: [PATCH 01/13] dt-bindings: mips: Add Mobileye EyeQ6Lplus SoC
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251217-eyeq6lplus-v1-1-e9cdbd3af4c2@bootlin.com>
References: <20251217-eyeq6lplus-v1-0-e9cdbd3af4c2@bootlin.com>
In-Reply-To: <20251217-eyeq6lplus-v1-0-e9cdbd3af4c2@bootlin.com>
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


