Return-Path: <linux-mips+bounces-8257-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FC7A6BBF3
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 14:47:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E61B11891D54
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 13:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B636078F32;
	Fri, 21 Mar 2025 13:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="d0PxIvHZ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14ED11EA80;
	Fri, 21 Mar 2025 13:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742564828; cv=none; b=QHugW3T4BciN2qpQtW6/lA+r4zgTIyzh2KdgspJPel6uSpaGtCUGs+qFMyiwNEG1ow4LJQmCeBDOLBPPrrdgORIRrilSmm17RQTI8gw56wnqvjdBFng6AKgbm70yVEQQD6ltk11L7QvSbDYc9oUAGgmyUwI8H6Vw912vuF8LnGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742564828; c=relaxed/simple;
	bh=nAVxGezQZ8FogENvoEt4BgkhdNqjdTKCW6NAglff/Fw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fMJGf8FpXQgu5IiHBr8zzAtVY4BdDCFIsl7IYZDxAivgq0HraQq92+QVrkEgiVpv+UvL1vzDn9krcN85hZT7LUKlkghXxRxrN6Vx/5I+8HjtH2tQrXXdK4bPA5qzDuL1qkUhT/NnLPWrVOV59evWnJ5bY6LUeljCXjmNlGNZcew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=d0PxIvHZ; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A6A782A406E;
	Fri, 21 Mar 2025 14:47:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1742564824; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=cBr/AN+Dmtl1pCcesD8ZmV7b9FGEZvfEmYXFEbydOBE=;
	b=d0PxIvHZ8tL+JyFiShYmhEaoIBNno1UWX++Elx+egOXJ8AC+niiMIxpSTyDeL37y6s/WD3
	2Q9gLeiu1NBklb1px2/Dv+eM8ZnfG6cLPsd0jw5nw4IVqt+74xd+iEkq0BwR93pjyx/T/C
	RtKQ2YGH6JSEHHxrJZgcPHseLYxtTtytze0vuF2KdsLvgPRhMgxc+aZd89WxWNKZf6jtH8
	CuCs2Fa7eYq6MBe6o9bNbK2vaRZgZA4/DaUbuQ2GDxc+w6yDqjUk3JnaxASld6pfqJMPwE
	WFb/YA/ZflETh0hkJyqeEsLD39jihREZB4g7pJzrVkWmzeKD5iqpy2tT1UnnqQ==
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
Subject: [PATCH v1 6/8] dt-bindings: mips: Add EcoNet platform binding
Date: Fri, 21 Mar 2025 13:46:31 +0000
Message-Id: <20250321134633.2155141-7-cjd@cjdns.fr>
In-Reply-To: <20250321134633.2155141-1-cjd@cjdns.fr>
References: <20250321134633.2155141-1-cjd@cjdns.fr>
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
 .../devicetree/bindings/mips/econet.yaml      | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/econet.yaml

diff --git a/Documentation/devicetree/bindings/mips/econet.yaml b/Documentation/devicetree/bindings/mips/econet.yaml
new file mode 100644
index 000000000000..44da78dc1e29
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/econet.yaml
@@ -0,0 +1,27 @@
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
+description:
+  Boards with an EcoNet SoC shall have the following properties.
+
+properties:
+  $nodename:
+    const: '/'
+
+  compatible:
+    oneOf:
+      - description: Boards with EcoNet EN751221 family SoC
+        items:
+          - const: econet,en751221
+
+additionalProperties: true
+
+...
-- 
2.30.2


