Return-Path: <linux-mips+bounces-8883-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5EEAA4DB5
	for <lists+linux-mips@lfdr.de>; Wed, 30 Apr 2025 15:42:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4265C189C5B7
	for <lists+linux-mips@lfdr.de>; Wed, 30 Apr 2025 13:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 718A425CC52;
	Wed, 30 Apr 2025 13:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="Ypy/vWKj"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04907E107;
	Wed, 30 Apr 2025 13:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746020506; cv=none; b=QQvysyOZlXA+rxrPYOMB+HAFW2TFJkp+iIE961K9bwaYsDtOHF3QtWDNGK72U77xiABf0kigmbX6FoArBk+w0OP4Uts1mxskgydllg5vDYJKzJcyek9yDlo9zq+UpJBv9peL4glbxkW2vnvQ9q2AYpGxaDAfjzXUSuxFCglojr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746020506; c=relaxed/simple;
	bh=0HU07G/vQo7GSFXf2skFbVjtV/6lx73rneWLukW0Ny8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cBGTUd1T6t53bqGIQ1t9rX0uKirYi51q99wXQpIjwAZDKfKYtLDRDXI6VU6Ta4MI47VFhn1eeO48gGM7LtodPt66he3/C4uw9Npf7hYBABYqZ9ktBKqh4Zj3wdqE9/ujG2pM2NSEPy6BREBEet690yuiyLeh3q2sk8UEe3GFX6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=Ypy/vWKj; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CF8CD8F1B9;
	Wed, 30 Apr 2025 15:34:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1746020093; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=WFuKeZ2Mgo5yTqNGhX/kKLsejXNkpw0wnwsa5YPEGN4=;
	b=Ypy/vWKjlwN7oipP2cKMMTlMYLqMyOmNjxxbnn2Yp28xPds7KfwZYKNcuHhP06gLH9e4nr
	sGXXyNCRZVtzLzamt0II0jQrcMtV6jNT5b/54FQxdAoCLykkR/O5Y+4L/TxZxFhoykoz34
	EtPzwrZHQovwuPzZk4pqK0SoSOAjqjSN11+IWZCDQH0Vdf4m7TDSrQAFJ6WMrgXiA5Ai6D
	3dnLavCOshi8nFgrq8+9Czl/NhblebqsiCNrdtwG+fF7XbonbQ+drm6b+tlxJ+kWZfb3px
	Ve0aqjuX70XCN9gdj9RbYD+H+qcQXK98EpCHTVLivO5u6MyQ6IofZSuh6AsGJA==
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
Subject: [PATCH v4 3/7] dt-bindings: mips: Add EcoNet platform binding
Date: Wed, 30 Apr 2025 13:34:29 +0000
Message-Id: <20250430133433.22222-4-cjd@cjdns.fr>
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


