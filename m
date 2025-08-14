Return-Path: <linux-mips+bounces-10290-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF060B25ECE
	for <lists+linux-mips@lfdr.de>; Thu, 14 Aug 2025 10:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 054FE18984AB
	for <lists+linux-mips@lfdr.de>; Thu, 14 Aug 2025 08:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB712E765D;
	Thu, 14 Aug 2025 08:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="FTl6uR42"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403F12E7659
	for <linux-mips@vger.kernel.org>; Thu, 14 Aug 2025 08:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755160039; cv=none; b=dOBoXxGMznTu72pUqPUcjZzJaL3vjT768UVcU2mswZiEwKUd7z8Rv0pqfZ0LHLibCk0QscxVtiB39fnnIC8NToR0FqSSyev4eA0WN91rwxniMMF0u7DW7IIG5EQQ97WUtRZymlKMO4b4Sb6KhNc7FuAgHfMmgo743pacmWdYPiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755160039; c=relaxed/simple;
	bh=1KDDCtMP5rn2S+bWZv8aHe43udyp20+1Xfy9+tbLosc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=AR4oaeKwpUFeTAcIayRuZDSUdpV37AsAHEOy22HalIAgiIcaeBBEwk+pBAWO7b6MTB6YdM0AkcYRS0L5cvaLxHza0Pm5wyU5BLnSgyNqAsDyioQvHjNGfe1+sH+MYyHQP4Gpd+SopZ4mLO7/44AE7rHiJBJvtx5YhjNi9nE7FFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=FTl6uR42; arc=none smtp.client-ip=212.77.101.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 26832 invoked from network); 14 Aug 2025 10:27:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1755160032; bh=WXs3BxbiT7j5x5jkHN7EEuuUOr7la7ajmzr15IXcVzI=;
          h=From:To:Subject;
          b=FTl6uR425f8Njkn8OmAXW1RdSSlBExWi6rsXhSy3cvrtk9xvPDP7/VKAI/t4o0Egf
           LyjqcZJ4oQ8lzb9466kMDKWvIYbl/GAjhOOL+/tE6VhrYGw1w947khFlJ7JBnEiTO0
           c7jlQhllkTHZyxv0uNNhC9mHHkbSKM8qqraP6g8YrQX+y1PCgrpFhfflTXOzHpriow
           deYrYFwx7rOxqdAYpS5IYpSKyvEHqfoh+lq5FipWBmU099Q7RKz8b3OAXuUms+Yw9S
           y1uyg7Pw0GGYYxxoxaKTMNeq92dfEoLIURAF2+vQfua/ZazmB4BAjshev/DK0XB97z
           DO9XMi+pRI3/Q==
Received: from 83.24.134.210.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.134.210])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <tsbogend@alpha.franken.de>; 14 Aug 2025 10:27:12 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: tsbogend@alpha.franken.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	olek2@wp.pl,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: mips: lantiq: Document lantiq dcdc binding
Date: Thu, 14 Aug 2025 10:26:56 +0200
Message-ID: <20250814082705.3183231-1-olek2@wp.pl>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-MailID: 71d407e100f7fde7e78cbb4499c72f21
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000A [USNU]                               

Lantiq DCDC is a voltage converter with a voltage sensor.

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


