Return-Path: <linux-mips+bounces-10289-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAD0B25E87
	for <lists+linux-mips@lfdr.de>; Thu, 14 Aug 2025 10:15:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2D7E17D0AF
	for <lists+linux-mips@lfdr.de>; Thu, 14 Aug 2025 08:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 453A683CD1;
	Thu, 14 Aug 2025 08:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="SS3K9Ijq"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D612E7633
	for <linux-mips@vger.kernel.org>; Thu, 14 Aug 2025 08:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755159341; cv=none; b=aDQfUVGbwQZx7ugasylbnjAdn0cX68bUoR/qG3surs7VkvL+Jqgcl+qtFqEJQqavJQ/Xj3COxuLIsnP4DKZ97DfjWrPpPOXRLAwk5azo4HNI+/WWLY0nDAQjNB978TFrZCjbmCzUl4c5kTsmbtL9GGmR7PTKa1RByY3NjXNlUJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755159341; c=relaxed/simple;
	bh=vyBNpa/h0nKYr0F+MWJtAcla1gioP/9iiUzs4ZKIUgk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=utHl219W5aLqUCe6U8rzXvI8Ya9KJva6ryhFJxL6+KmNB80z7bn93Tu3FwMoyB8tujMEF9r0ysGjas8ueSzqZyX7sWhbAYWKFOXApuJc7RmamT/Y1jB6Jf3IemcGDs55A/y7C4IGE96R3fd1KbYjcH6QhmH6FvZfkwu3o+t1DWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=SS3K9Ijq; arc=none smtp.client-ip=212.77.101.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 8117 invoked from network); 14 Aug 2025 10:15:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1755159334; bh=siCawFjKEYaGDYTl/uHnk23Bcm/PTLCbRpO7IOPBWQQ=;
          h=From:To:Subject;
          b=SS3K9IjqiSkBYSBWV0NU1PfY+/BXJRIlHlQCq6ppBotafgtbBKibQygFfrjFpleEU
           VTTWj7FmR2jAYttry3byzTi+Pvriv7Qo4k7E1uuJYQ/eeL+C2iAjR8CLGvplFdKO74
           Ole95/xAgi9OSrGgn5B+qmglrqsqG3nCwxskxCg+hAOues9+cjrbmDBESSslihhwQe
           P5eWAno+hqy68owIy780i9XLc9uuaW1DFQV9V0RlSGMcJvFhLU+r4gbgnIsn7ncUo6
           2W3e6kTCJUJE1oQrSCccwUL+U6+ws7KFZXwOc0Hu1IkDTwLlA+68JnihZUob83MIWw
           1oDuNBTWAMf2Q==
Received: from 83.24.134.210.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.134.210])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <tsbogend@alpha.franken.de>; 14 Aug 2025 10:15:34 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: tsbogend@alpha.franken.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	olek2@wp.pl,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: mips: lantiq: Document lantiq dcdc binding
Date: Thu, 14 Aug 2025 10:15:21 +0200
Message-ID: <20250814081525.3058069-1-olek2@wp.pl>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-MailID: 74f88ab005c4f5654f7aaf5d4b4f85a5
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000A [0QN0]                               

TODO: Description

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
 .../mips/lantiq/lantiq,dcdc-xrx200.yaml       | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/lantiq/lantiq,dcdc-xrx200.yaml

diff --git a/Documentation/devicetree/bindings/mips/lantiq/lantiq,dcdc-xrx200.yaml b/Documentation/devicetree/bindings/mips/lantiq/lantiq,dcdc-xrx200.yaml
new file mode 100644
index 000000000000..5648b9676b3c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/lantiq/lantiq,dcdc-xrx200.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mips/lantiq/lantiq,dcdc-xrx200.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lantiq DCDC (DC-DC converter with voltage sensor)
+
+maintainers:
+  - Aleksander Jan Bajkowski <olek2@wp.pl>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - lantiq,dcdc-xrx200
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    dcdc@106a00 {
+        compatible = "lantiq,dcdc-xrx200";
+        reg = <0x106a00 0x200>;
+    };
-- 
2.47.2


