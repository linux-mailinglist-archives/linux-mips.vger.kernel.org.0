Return-Path: <linux-mips+bounces-8414-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3140A75B36
	for <lists+linux-mips@lfdr.de>; Sun, 30 Mar 2025 19:05:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DD0B188BE4F
	for <lists+linux-mips@lfdr.de>; Sun, 30 Mar 2025 17:05:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 414171DFDAB;
	Sun, 30 Mar 2025 17:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="OB0u1IAH"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A938F1DF968;
	Sun, 30 Mar 2025 17:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743354236; cv=none; b=QcEEpZxRCjN4jK6Wd8yAJhw6UiqVUrbYlDOi5857cBsjd+J2QM2wBwL7XYUNihDiWq3m/59bB/W/Zdzk2cOP534+q8T2GlVNANIw7e3rP4aBnw8skuOfnKFBmb6joxU4TyRhtheLh0754UWsLRm/JKAyUQxRaKRG1LhRuA578Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743354236; c=relaxed/simple;
	bh=TNbIQ/bE9Xtc3nLg1NT5uvoNkhBzNOkffUoj76ygi6g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OatxrMpFb4fH3YDBXlczImC7Zejd+dqAiENQ3bnh73/8h+ATQAsOlOqLkOY0yjfgwncI7Er8PXb9nJzQs2w2Eb2UzAPDgOV1IMC/bA3Hk8A+zYpb017AGOagwcp1mWxdK7yrYKaDIVpwJwp6ZOVA2RM9N0jtfIY0lwqyqTloNzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=OB0u1IAH; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A461B2FB965;
	Sun, 30 Mar 2025 19:03:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1743354232; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=LsD3ZRTwsDqOrQWq1NMrHzNWOBquSOL3Gwmcst8cUJY=;
	b=OB0u1IAHApexO1FJ4tl4F5FilVUkDoIZLPe7KPInEZLjlh4Jq4seF94rkWe/utfPSUnLS+
	kwaZYi4wTxpqa6xUMrjHRPwN6Hkoj51FWAyvnwqQrXboqLRN+GWX6dcgTyUkY7kUsDShsW
	lRiMszH/ehGhaksCBQy9VdG/CqfiyPSkITx/I3OB8GPib4ZwYRfG3yRcgm9lTamNMmWf4X
	Yv2bwkJcTF+o5vsokTC6CqGLrQXT4Zzb9S9niK7CSbOyqWXogWpaW8QlIlhto1TQo9MjPq
	OGH7JGonW+srmYaY+wjEPjzkar5xdnOyn3C7vJOHOMBdnD3x9cjiSnTpbEhW4A==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benjamin.larsson@genexis.eu,
	linux-mediatek@lists.infradead.org,
	Caleb James DeLisle <cjd@cjdns.fr>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 08/10] dt-bindings: vendor-prefixes: Add SmartFiber
Date: Sun, 30 Mar 2025 17:03:04 +0000
Message-Id: <20250330170306.2584136-9-cjd@cjdns.fr>
In-Reply-To: <20250330170306.2584136-1-cjd@cjdns.fr>
References: <20250330170306.2584136-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add "smartfiber" vendor prefix for manufactorer of EcoNet based boards.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 371f6bb81f81..dc064e6acf4b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1388,6 +1388,8 @@ patternProperties:
     description: SKOV A/S
   "^skyworks,.*":
     description: Skyworks Solutions, Inc.
+  "^smartfiber,.*":
+    description: ShenZhen Smartfiber Technology Co, Ltd.
   "^smartlabs,.*":
     description: SmartLabs LLC
   "^smartrg,.*":
-- 
2.39.5


