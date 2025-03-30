Return-Path: <linux-mips+bounces-8412-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6C6A75B2F
	for <lists+linux-mips@lfdr.de>; Sun, 30 Mar 2025 19:04:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 042477A3F3A
	for <lists+linux-mips@lfdr.de>; Sun, 30 Mar 2025 17:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D90F1DE8BF;
	Sun, 30 Mar 2025 17:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="c5Fxsc8Q"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEE11DE2CE;
	Sun, 30 Mar 2025 17:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743354231; cv=none; b=W5eUyPZtudFBfERTqAsdsW5AmeE99Je7BJdpk6zi2uNIVzyeh1xZ4ckrLY4Cu1XDlQCb1wyR0kcErBeInw9vBX0e0DfdQbsQnLdZhF3ETQ1nD8n2jYK87sKOtoRGD3+9GmEh5m+NYDddoFwgEVnt9uqnWhr4U37+sTO0nEodVbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743354231; c=relaxed/simple;
	bh=0HU07G/vQo7GSFXf2skFbVjtV/6lx73rneWLukW0Ny8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fPatTLILE+h0w+p4+oeAxpIooWgpm9kjsG4ksyshnaageJ5KVDi97U3hWyA16kDsQ7SEH4WHZFLflh+tIKOwoH+yh6Qgrj6s3rzu6oDT0TgTxauxrdHFBD9EXx34dmGdpBeBDT8+g/Wc1grjR0em1uRIdEYxPBC1dHxGRjerMos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=c5Fxsc8Q; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 695112FBEBA;
	Sun, 30 Mar 2025 19:03:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1743354228; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=WFuKeZ2Mgo5yTqNGhX/kKLsejXNkpw0wnwsa5YPEGN4=;
	b=c5Fxsc8Qjq+xXMQ3KJfuXIyTa5NAWGu+Obv/NHUXY2Id2ztmg2FxM7jyYG+PMcNN64krvt
	WZsaQz0zz74RbBOthui+6gTiWGvoOY34R4xQAXCKEsDYUA1+wSQdE4MeCWudtBArEL03fr
	Crjl1BGm0gjLtxytkyB5wlfL6UTV7kuwX3FR/XznWt2zGex3VBa5+PSzm1jQnxgNv5gkmL
	GWO7bQEfqUBU1D0k13UFsj9FNtORgm6YUgxEOwPB2tqRBl04avqzjzmYUhtzWJvgZxNQ7D
	c+kVJythVKg88n8DPza/TuByJEKDD3RBY4iDW1yBMke9Bs0xwJygx96aZ9yGKg==
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
Subject: [PATCH v3 06/10] dt-bindings: mips: Add EcoNet platform binding
Date: Sun, 30 Mar 2025 17:03:02 +0000
Message-Id: <20250330170306.2584136-7-cjd@cjdns.fr>
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

Document the top-level device tree binding for EcoNet MIPS-based SoCs.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/mips/econet.yaml      | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/econet.yaml

diff --git a/Documentation/devicetree/bindings/mips/econet.yaml b/Documentation/devicetree/bindings/mips/econet.yaml
new file mode 100644
index 000000000000..d8181b58c781
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/econet.yaml
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mips/econet.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: EcoNet MIPS SoCs
+
+maintainers:
+  - Caleb James DeLisle <cjd@cjdns.fr>
+
+properties:
+  $nodename:
+    const: '/'
+
+  compatible:
+    oneOf:
+      - description: Boards with EcoNet EN751221 family SoC
+        items:
+          - enum:
+              - smartfiber,xp8421-b
+          - const: econet,en751221
+
+additionalProperties: true
+
+...
-- 
2.39.5


