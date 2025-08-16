Return-Path: <linux-mips+bounces-10343-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87002B28E16
	for <lists+linux-mips@lfdr.de>; Sat, 16 Aug 2025 15:20:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA55BB010EA
	for <lists+linux-mips@lfdr.de>; Sat, 16 Aug 2025 13:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5458D2E6128;
	Sat, 16 Aug 2025 13:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="swI3jef0"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6022E5B3B
	for <linux-mips@vger.kernel.org>; Sat, 16 Aug 2025 13:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755350412; cv=none; b=AtoOeDRXDbifItGkmsJ8i1malLJ7FQ77oDlI7IdifH7m/sGyzQYJLL/ogPZA2igwd+k2Fm5VsN+QqXhZQvclKeMOpq3GG4mV4tLKaNr9iOWI10KI5tYoBsGtNIdaaOd01wtbmtBEOGDiOjU5nKcKai9ZJB8qZw69e9AwnD0Get4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755350412; c=relaxed/simple;
	bh=MdkvusHD3UIMg4HamLtJwrp0gShI+hicyimSjQSdKwE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lmA6/pHOos3RP1GXdCuq4CjCb3+uYFqo6NFyuYgza5B17FZSGvOvOFRRZRKG3uFQd0f4s0Z6wX1Ql0jvW4GKJTV7UqkLoXVptEkPfElw3vNk+gbljya+AqBOnH/oDYHJDQdHRucU0Ctg7YtIRErKXjn2hIlO0ap3c6R2AJwTbnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=swI3jef0; arc=none smtp.client-ip=212.77.101.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 14292 invoked from network); 16 Aug 2025 15:20:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1755350406; bh=0XEqsmMq5hrMgacB8KUDiYmfK9MEHEC/pUrzmlgLZ+s=;
          h=From:To:Subject;
          b=swI3jef05aCBQCB5jMpxpl4HuLTk5MWoV6PoVYgW4a/WXcabVLMS0CpY9Rtszxz0z
           vXPRpwu/uFe/SvgXeUvkPVq5td7JEXS5kG1JkV/YA3LSIGisb0fVBKRomKFTw0lGIJ
           /GlZcfto4+mjUKAqI1ezd6XYuVmvyl0K+VpCLXWysRL5qzLGPVURcmudQq7Q8nD7hJ
           5lFhN3Ls58X5uaKBcbYYYpSKDrd2OHDFLTT0FOI66iZ6BcCrMBsX0L/mHlNLn+Uqzi
           I6yKSQ8E5RxVanhBNREiF4RzuviDCJ0JoaII+1lPJ31/nNOvJwbraIbndEc+Oi1bPs
           R0GKlBZe46NSA==
Received: from 83.24.134.210.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.134.210])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <robh@kernel.org>; 16 Aug 2025 15:20:06 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	olek2@wp.pl,
	john@phrozen.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: mips: lantiq: Document Lantiq Xway GPTU
Date: Sat, 16 Aug 2025 15:16:22 +0200
Message-ID: <20250816132002.3632343-2-olek2@wp.pl>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250816132002.3632343-1-olek2@wp.pl>
References: <20250816132002.3632343-1-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-MailID: 9d1687f224e8f74fbdc8cc8c204753f7
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [EYPB]                               

The Lantiq SoC has six built-in 16-bit general purpose timers (GPTU).

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 .../mips/lantiq/lantiq,gptu-xway.yaml         | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/lantiq/lantiq,gptu-xway.yaml

diff --git a/Documentation/devicetree/bindings/mips/lantiq/lantiq,gptu-xway.yaml b/Documentation/devicetree/bindings/mips/lantiq/lantiq,gptu-xway.yaml
new file mode 100644
index 000000000000..fcbcd98def46
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/lantiq/lantiq,gptu-xway.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mips/lantiq/lantiq,gptu-xway.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lantiq Xway SoC series General Purpose Timer Unit (GPTU)
+
+maintainers:
+  - Aleksander Jan Bajkowski <olek2@wp.pl>
+
+description:
+  The Lantiq SoC has six built-in 16-bit general purpose timers. The voice
+  firmware needs these timers as a reference.
+
+properties:
+  $nodename:
+    pattern: "^gptu@[0-9a-f]+$"
+
+  compatible:
+    items:
+      - enum:
+          - lantiq,ase-gptu
+          - lantiq,danube-gptu
+          - lantiq,xrx100-gptu
+          - lantiq,xrx200-gptu
+      - const: lantiq,gptu-xway
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: timer1a interrupt
+      - description: timer1b interrupt
+      - description: timer2a interrupt
+      - description: timer2b interrupt
+      - description: timer3a interrupt
+      - description: timer3b interrupt
+
+  interrupt-names:
+    items:
+      - const: timer1a
+      - const: timer1b
+      - const: timer2a
+      - const: timer2b
+      - const: timer3a
+      - const: timer3b
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    gptu@e100a00 {
+        compatible = "lantiq,ase-gptu", "lantiq,gptu-xway";
+        reg = <0xe100a00 0x100>;
+        interrupt-parent = <&icu0>;
+        interrupts = <126>, <127>, <128>, <129> ,<130>, <131>;
+        interrupt-names = "timer1a", "timer1b", "timer2a", "timer2b",
+                "timer3a", "timer3b";
+    };
-- 
2.47.2


