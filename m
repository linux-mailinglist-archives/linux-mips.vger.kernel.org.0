Return-Path: <linux-mips+bounces-8880-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3632AA4D9B
	for <lists+linux-mips@lfdr.de>; Wed, 30 Apr 2025 15:35:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F1B31881B67
	for <lists+linux-mips@lfdr.de>; Wed, 30 Apr 2025 13:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2EBF25A2CF;
	Wed, 30 Apr 2025 13:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="hgr9kemb"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500E51DFE09;
	Wed, 30 Apr 2025 13:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746020100; cv=none; b=LkrTl74PIyIaeRO0kya7wDuDvLxG6M78lXJ5w1KnFa0x241zU6F8tUkSOzdD9vtbp//7ofd6hXAzKAZQc+Fkfx33iYx5+jyCf/0LaWcFv7WiySQepJm0/PjS/6nt8RlCVJzXDZNvbZ+QIK8A0nfDi4LQwTuedacNhKYpG35tsPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746020100; c=relaxed/simple;
	bh=r7NvDks6ELgi2c6U2lIug5G06wiLW1NwgDnt/KAOYA4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rQGHj5Rsrgk/0/9u/AnkK872r9y6vLzTgLLATgx0xMmEktTc6msnfmymD4katK32HTXU/zbabeBZTvK9NdqtYeqXFpTRn5mA3W+RqvdOujbD9L5YvVSA/YuE8euHDK2COyHdOzq+7QOFBQF1vOYTqd6NdxLDvypA+OnE2vidYDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=hgr9kemb; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A6A378F1FF;
	Wed, 30 Apr 2025 15:34:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1746020097; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Bb5rET0brVSsp0jg4oH2Anac6dKr9y457nVDZGrKmSI=;
	b=hgr9kembuYgr71mIkhMUmW/+Y7uRPlEbThQPAAEGVn2Tuf3VfPqTePdK2Df2q7iZKbxaEX
	HuiHmggkB80JICd/7gaFV0WnXT4ugOpxQHb1CWW2Tlyk5iZP93icg67uuTRUEfjzOhou2F
	+8S7j0qYTZ54shODhuAqQOlHoBsE4y5mxA6yFf2UcwONFlOw9kdRngOz7dsKSv7KR0sk2E
	dlKSMUp2rcYlKNM6KKd+pLzzgoX9OteGVBNkPyk6F0tW3zbdg2ORcYMvfwnFeddH/EnK79
	HJCpCFr102uSaDOj056ec2cfeL9z6p25lgPkYgXegerOIIC/nkVDgdDDQziIxA==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: tglx@linutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	daniel.lezcano@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	benjamin.larsson@genexis.eu,
	linux-mediatek@lists.infradead.org,
	cjd@cjdns.fr,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 5/7] dt-bindings: vendor-prefixes: Add SmartFiber
Date: Wed, 30 Apr 2025 13:34:31 +0000
Message-Id: <20250430133433.22222-6-cjd@cjdns.fr>
In-Reply-To: <20250430133433.22222-1-cjd@cjdns.fr>
References: <20250430133433.22222-1-cjd@cjdns.fr>
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
index 86f6a19b28ae..421fd5c2e41c 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1396,6 +1396,8 @@ patternProperties:
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


