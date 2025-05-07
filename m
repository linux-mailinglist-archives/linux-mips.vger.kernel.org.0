Return-Path: <linux-mips+bounces-8960-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A34EAAE162
	for <lists+linux-mips@lfdr.de>; Wed,  7 May 2025 15:53:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E02298648D
	for <lists+linux-mips@lfdr.de>; Wed,  7 May 2025 13:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A4028CF7B;
	Wed,  7 May 2025 13:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="ogUM7LJP"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942E728C2A9;
	Wed,  7 May 2025 13:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746625534; cv=none; b=eTKaeKCQuBqdCFk8Yk3eFk0XcHxspiXQjJL0nbOhwlfksRRfYNbv4HQYWCaV76uHMAvyfTwsGDhQynPlwdjI8M11sJ7MyBGLCtiwJneMQpBpGmISUs8r4Q0apOsLFtIcaJAawS3T90pW6nkGZeDyabSQq60MVYqotfhO6PpLyHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746625534; c=relaxed/simple;
	bh=0HU07G/vQo7GSFXf2skFbVjtV/6lx73rneWLukW0Ny8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rjACDkcHLYwZEvPwQ9nkYyd7s60arYD4xH7FnAhXrsBSYMOgOFV2Agz6uJP1BqSKvpN+KvCeULApmxNajjX77HRDpdTIDWYyYgMGrmJWnU5ZPXTZSyKmapjDXB17fXZtnI3u0mVFKegzCiT6tYKsTw4AXmIKfOeV3aPs/NNh1Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=ogUM7LJP; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 59ECADCD09;
	Wed,  7 May 2025 15:45:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1746625523; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=WFuKeZ2Mgo5yTqNGhX/kKLsejXNkpw0wnwsa5YPEGN4=;
	b=ogUM7LJPbnLQIHnxka/HXJbvFDi0SF9Q5Umf+kSJ3t0HLkOvFZiVQ9CHNP94Z3KwdOQ9yJ
	IciAPUvVkgyQOKgmP0ndh2yyBQQqaI8jx/auNc77qJn8EGQOAcrnQ/qCLAEBp1thUlqz7e
	wVXt2YUbVAZSzX62q6AzxjBPsr2yAJQyguRPNgtIeksOyl4Bltehn0JSnbxWPF+ZFlSrDf
	kkzeQ14mcpoA/ghOt/wewUe9Wg27tcRUReI9BMMMgMsyqIHr/y22keNGCgxt1KUQOAbeWX
	L8wBpThMihowkLaduDvnW8Ieu4urdaMygJvdtLqmrfZbNWKPa2EurWCSWCQk2Q==
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
Subject: [PATCH v5 3/7] dt-bindings: mips: Add EcoNet platform binding
Date: Wed,  7 May 2025 13:44:56 +0000
Message-Id: <20250507134500.390547-4-cjd@cjdns.fr>
In-Reply-To: <20250507134500.390547-1-cjd@cjdns.fr>
References: <20250507134500.390547-1-cjd@cjdns.fr>
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


