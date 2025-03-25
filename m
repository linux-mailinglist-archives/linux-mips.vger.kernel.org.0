Return-Path: <linux-mips+bounces-8348-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9D5A702C2
	for <lists+linux-mips@lfdr.de>; Tue, 25 Mar 2025 14:51:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F4B43BF42C
	for <lists+linux-mips@lfdr.de>; Tue, 25 Mar 2025 13:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E6A0258CD8;
	Tue, 25 Mar 2025 13:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="mWgLd5hl"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E672571CD;
	Tue, 25 Mar 2025 13:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742910268; cv=none; b=fHgEnnpr4Q7Sg37/inMDngenD+RltCGtPzrsMWCA0z93Sd9mR7R3+jVpqA1cTiq54TKGurtTtcMzKkTV/ijYcLRwTSP3luCk2s2c5dTx6EQD3tBwiNZxp/qmi7iRcK08u/v8PIRa9hg3q5Can7ZKzjosUb7EgYPUg5OQX2k41VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742910268; c=relaxed/simple;
	bh=eo26+lNjm30JchJHMhtCgmQD8PuV/0cJ0NZTeci9Wh0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rUaKEHn7R7uc8M15UY4VROCRTV1vTZ17dHADVltWl588bK4z3wBWQ9ffYhehsGnHKkxsMaUcw8kE3GHx0jRDD72p3x4tBp5P6PCKrFa9Qvsv93G3a7SiMaM4uvrTuIiaFxuCvtZub86Pg+UKbG9iyvmQj7Ykvb0QBGsqxTAN5ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=mWgLd5hl; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 68ED72CD9AA;
	Tue, 25 Mar 2025 14:44:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1742910264; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=f0b41uiUdPdQPYyBOZFXDF2cGL1WfkMqfk3isWB7T8w=;
	b=mWgLd5hlcaFDsNI7NoQSdMtMegj9j3GKkGZYqxaFKBRg5n59IO6tVzb9xuZhJP9olXqNYz
	iLGIZIVQZPjaVHXIiGNaH8QCVkyRtTGp+To+nfk0RLyGHKHlIYVq3yxpxFC1UNHXxBEdGc
	mhFSO7Apkh+OZJ1SanO9wDObnqmPjApWJ6No6qeu2m2eAnzH2gkqhFl6KovnOyBsyFxIba
	9/7Poh7roU+Sxxsc8zJbKQ9V+a2eD/5ircBhcjDjKtqT9GhT/uxV4wXp/Vpa/1nZmDZiYP
	LabPp7CSs6J5dxYqz+nVUU6cHxSmnDxDPGAPxrMoQOLBaB5cPwBkzkgW2XhT3Q==
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
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v2 06/10] dt-bindings: mips: Add EcoNet platform binding
Date: Tue, 25 Mar 2025 13:43:45 +0000
Message-Id: <20250325134349.2476458-7-cjd@cjdns.fr>
In-Reply-To: <20250325134349.2476458-1-cjd@cjdns.fr>
References: <20250325134349.2476458-1-cjd@cjdns.fr>
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


