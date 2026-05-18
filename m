Return-Path: <linux-mips+bounces-14632-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJYPI78eC2q8DgUAu9opvQ
	(envelope-from <linux-mips+bounces-14632-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2026 16:14:23 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0C356E7B4
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2026 16:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 19410302FE8C
	for <lists+linux-mips@lfdr.de>; Mon, 18 May 2026 14:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E9BF48AE01;
	Mon, 18 May 2026 14:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b="RVSj/0dU"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.cjdns.fr (mail.cjdns.fr [5.135.140.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F1E1A3165;
	Mon, 18 May 2026 14:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.135.140.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779113643; cv=none; b=nhwo3ZhataImu9LyL94e3X75IaRzQy3s0Nz5fXlYarLNfHL0M7Gz13zFNz5JQNcnlBwidBVOu8Z65lTN/kU9mEKCBrFB/xyAzamTuhykh4nKw+Nf1wFGLtsIylDGm3U+OzxXfORr0j722CmLUaEmkSDFuwIyBr9ikhOf6C3eLU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779113643; c=relaxed/simple;
	bh=SIYEAqjr2zmbJF5H0zuQNww2SC9zebWfATS+/XXLDY4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V8w3M6AysGrqTgipG0oAU0Hf5vH51haurDqrMMFWFjFDhI2z2jWsmFLmeUos9yyemLKFot3wsqfevFjSYEoJCWAuMpdsH0QefL83qxt0Dkd6VkAfrzB5gQis1c8rDrFSNuM5u6YxJclevbbudUwyXR7KhcOTa8wNHhzDP1c8jEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr; spf=pass smtp.mailfrom=cjdns.fr; dkim=pass (2048-bit key) header.d=cjdns.fr header.i=@cjdns.fr header.b=RVSj/0dU; arc=none smtp.client-ip=5.135.140.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cjdns.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cjdns.fr
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E99FB412ECA;
	Mon, 18 May 2026 16:13:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1779113633; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=k6pdOU+b4KLB22qUcje1fbtGobrJHihoy0yvfUJmdr4=;
	b=RVSj/0dU2KqbYXIfQMFQcRTJOK+ScyAxGT9VFYUcT3KtEpQbk3KL7AT5r0AZh6aal5k4ay
	0o1gHALxFKAXt0Fy+lKDrRGZttSVevlSvOQnw3zB5mMVoWeGKsXA0h8XeNxgrhJnt3tWaq
	Np6hNVQQ9oLLP6vg/0E7/Icu1xrQW1aKxA1DhDl+LOO4B2SuQ2muomdSTBS9Gn2h/4Hmfl
	R1jjc7ya+A3jcA5gkAtmNPaU3S+i7ZnLXVIBft5Wy4NFlWbcnzh+Kf1giCFl/bBY0gpadE
	bUKr3MWEYzB7bAFsH6VsNHas9TVMuUIjLuGDX3l1IPxyZAb5yLwb2ZmcOTCC0A==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-mips@vger.kernel.org
Cc: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH 1/2] dt-bindings: phy: econet: Document EN751221 USB PHY
Date: Mon, 18 May 2026 14:13:42 +0000
Message-Id: <20260518141343.401555-2-cjd@cjdns.fr>
In-Reply-To: <20260518141343.401555-1-cjd@cjdns.fr>
References: <20260518141343.401555-1-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[cjdns.fr,none];
	R_DKIM_ALLOW(-0.20)[cjdns.fr:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-14632-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cjd@cjdns.fr,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[cjdns.fr:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,devicetree.org:url,cjdns.fr:email,cjdns.fr:mid,cjdns.fr:dkim,1fa80900:email]
X-Rspamd-Queue-Id: 2B0C356E7B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the USB PHY devices which appear in EcoNet EN751221, EN751627,
and EN7528 based SoCs.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 .../bindings/phy/econet,en751221-usb-phy.yaml | 128 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 134 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/econet,en751221-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/econet,en751221-usb-phy.yaml b/Documentation/devicetree/bindings/phy/econet,en751221-usb-phy.yaml
new file mode 100644
index 000000000000..a44f59601747
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/econet,en751221-usb-phy.yaml
@@ -0,0 +1,128 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+# Copyright (C) 2024 EcoNet
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/econet,en751221-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: EcoNet EN751221 USB PHY
+
+maintainers:
+  - Caleb James DeLisle <cjd@cjdns.fr>
+
+description: |
+  USB PHY controller found on EcoNet EN751221 SoCs as well as on EN751627 and
+  EN7528. These devices generally have two ports, one of which is a USB 3.0,
+  and the other is USB 2.0. The USB 3.0 port is driven by one of two PHY
+  blocks, depending on whether the connected device has negotiated USB 3.0 or
+  2.0. These PHYs are also used on other EcoNet silicon in varying
+  configurations, such as only port 0 (the USB 3.0 port), or only port 1 (the
+  USB 2.0 port).
+
+properties:
+  compatible:
+    enum:
+      - econet,en751221-usb-phy
+      - econet,en751627-usb-phy
+      - econet,en7528-usb-phy
+
+  reg:
+    maxItems: 1
+
+  "#address-cells": true
+  "#size-cells": true
+  ranges: true
+
+  clocks:
+    maxItems: 1
+    description: |
+      Crystal oscillator clock source. EcoNet devices run at either 20Mhz or
+      25Mhz. 25Mhz devices require additional tuning in the USB 3.0 PHY.
+
+  clock-names:
+    items:
+      - const: xtal
+
+patternProperties:
+  "^usb-phy@[0-9a-f]+$":
+    type: object
+    description: USB 2.0 or 3.0 PHY sub-node.
+
+    properties:
+      compatible:
+        enum:
+          - econet,usb2-phy
+          - econet,usb3-phy
+
+      reg:
+        maxItems: 1
+
+      resets:
+        maxItems: 1
+
+      econet,usb-port-id:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1]
+        description: |
+          Physical port number. Since USB 3.0 requires a second PHY for the 2.0
+          fallback, multiple PHYs can map to the same physical port.
+
+      "#phy-cells":
+        const: 0
+
+    required:
+      - compatible
+      - reg
+      - econet,usb-port-id
+      - "#phy-cells"
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/reset/econet,en751221-scu.h>
+
+    usb-phy@1fa80000 {
+      compatible = "econet,en751221-usb-phy";
+      reg = <0x1fa80000 0x700>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+      clocks = <&xtalclk>;
+      clock-names = "xtal";
+
+      usb-phy@1fa80800 {
+          compatible = "econet,usb2-phy";
+          reg = <0x1fa80800 0x100>;
+          resets = <&scuclk EN751221_USB_PHY_P0_RST>;
+          econet,usb-port-id = <0>;
+          #phy-cells = <0>;
+      };
+
+      usb-phy@1fa80900 {
+          compatible = "econet,usb3-phy";
+          reg = <0x1fa80900 0x700>;
+          resets = <&scuclk EN751221_USB_PHY_P0_RST>;
+          econet,usb-port-id = <0>;
+          #phy-cells = <0>;
+      };
+
+      usb-phy@1fa81000 {
+          compatible = "econet,usb2-phy";
+          reg = <0x1fa81000 0x100>;
+          resets = <&scuclk EN751221_USB_PHY_P1_RST>;
+          econet,usb-port-id = <1>;
+          #phy-cells = <0>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index f877e5aaf2c7..1a90a1736294 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9204,6 +9204,12 @@ F:	drivers/irqchip/irq-econet-en751221.c
 F:	include/dt-bindings/clock/econet,en751221-scu.h
 F:	include/dt-bindings/reset/econet,en751221-scu.h
 
+ECONET USB PHY DRIVER
+M:	Caleb James DeLisle <cjd@cjdns.fr>
+L:	linux-mips@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/econet,en751221-usb-phy.yaml
+
 ECRYPT FILE SYSTEM
 M:	Tyler Hicks <code@tyhicks.com>
 L:	ecryptfs@vger.kernel.org
-- 
2.39.5


