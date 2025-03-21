Return-Path: <linux-mips+bounces-8264-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BE6A6BC22
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 14:54:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2391C16C150
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 13:53:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D327D19F117;
	Fri, 21 Mar 2025 13:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="dho3f9un"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BC08634D;
	Fri, 21 Mar 2025 13:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742565184; cv=none; b=pwgY/qTQ29eaW4TXnd1HDz8KrXiOz7eXXOR6gmoEEcSORVbfCLFkOa5JT7/Zxnfx1OMK+lbM/BFkKAd2P0G+FZzk/witvrAIo+04UsvbbiVJEFo3boRGZGTg22UlAw6SD3QJGB2tWQldVypXMF29QaAsJlE3a4L8dazNpulO4S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742565184; c=relaxed/simple;
	bh=+aiL+p2ov4+pM1i5cwWRqtp2MYNr8iqYSe9B38Y548Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SJzv1438uIUV2YVNd2STBoRgIcuIq25GmRHFUrXpK5iC4szpdmvDnalz0JWh7KljOfy1pRVXrdp71m523hBxTZ68vgcWh5yN2nEeIAGWCgkkoYhUX7D37da8iftiWTVhHGanEeiUNc+pqNysJaMeFz0AFiGIEoyBqYB3NTIGLFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=none smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=dho3f9un; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 750A02A3CDB;
	Fri, 21 Mar 2025 14:47:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1742564821; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=5ECQIt5LS+npnSHmGqlA157ZkVUis+o/etFccNszfYc=;
	b=dho3f9unQ4s5ZwqD4ojoNLIsXfxT02syVtWFJ9qekB+OYaz6vH0WfvrICgIEZ0g9phaiJp
	aPKqvXTdWqa/bm9J6t4Ur8Oe13CTwERNgSELHoeid3SlvcgZvJYDBBrGy6teplMMexf6Cs
	txmxhRwMyIJNlXOjeF8WL9w1opM967UuP19d1KCDeMraJ/4DaHvJWDuCkbq9s5n/BM0bMk
	dOt359YVwQZgb5x3eHRwm0wg6luhwQ9nYMOMEa5shrWijF5PvDchhVE0QKYZEppsEAwAkX
	fL9nVZ3BbYuRrliHKLGUgEiyYVfQX4Kf7R53fXOTvyhuLLzwjVkid7W59EmzeA==
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
Subject: [PATCH v1 4/8] dt-bindings: timer: Add EcoNet HPT CPU Timer
Date: Fri, 21 Mar 2025 13:46:29 +0000
Message-Id: <20250321134633.2155141-5-cjd@cjdns.fr>
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

Add device tree binding documentation for the high-precision timer (HPT)
in the EcoNet EN751221 SoC.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 .../bindings/timer/econet,timer-hpt.yaml      | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/econet,timer-hpt.yaml

diff --git a/Documentation/devicetree/bindings/timer/econet,timer-hpt.yaml b/Documentation/devicetree/bindings/timer/econet,timer-hpt.yaml
new file mode 100644
index 000000000000..8b7ff9bce947
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/econet,timer-hpt.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/econet,timer-hpt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: EcoNet High Precision Timer (HPT)
+
+maintainers:
+  - Calev James DeLisle <cjd@cjdns.fr>
+
+description: |
+  The EcoNet High Precision Timer (HPT) is a timer peripheral found in various
+  EcoNet SoCs, including the EN751221 and EN751627 families. It provides per-VPE
+  count/compare registers and a per-CPU control register, with a single interrupt
+  line using a percpu-devid interrupt mechanism.
+
+properties:
+  compatible:
+    const: econet,timer-hpt
+
+  reg:
+    minItems: 1
+    maxItems: 2
+    description: |
+      Physical base address and size of the timer's register space. On 34Kc
+      processors, a single region is used. On 1004Kc processors, two regions are
+      used, one for each core.
+
+  interrupts:
+    maxItems: 1
+    description: |
+      The interrupt number for the timer. This is a percpu-devid interrupt shared
+      across CPUs.
+
+  clocks:
+    maxItems: 1
+    description: |
+      A clock to get the frequency of the timer.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    timer_hpt@1fbf0400 {
+        compatible = "econet,timer-hpt";
+        reg = <0x1fbf0400 0x100>;
+        interrupt-parent = <&intc>;
+        interrupts = <30>;
+        clocks = <&hpt_clock>;
+    };
+...
-- 
2.30.2


