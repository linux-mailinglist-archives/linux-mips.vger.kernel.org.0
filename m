Return-Path: <linux-mips+bounces-10365-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0348CB2B390
	for <lists+linux-mips@lfdr.de>; Mon, 18 Aug 2025 23:42:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 067F55602F3
	for <lists+linux-mips@lfdr.de>; Mon, 18 Aug 2025 21:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02BB3224B1B;
	Mon, 18 Aug 2025 21:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="NAf3VkSl"
X-Original-To: linux-mips@vger.kernel.org
Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7610218E91
	for <linux-mips@vger.kernel.org>; Mon, 18 Aug 2025 21:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755553326; cv=none; b=LxroDwN2TzpO9kOmpCB2WKvSrvC6cS7B6TF2gjU5bSKeMztVGWQa5nFE6LEJd524/hgvUpZXMIlwKjbxRyeLbzPqV+Hx8pjauE6C+jsOVgDmqLgKPJDCmamGEd/OexwRTGlc+x4jSKIrXZgjwhqnuHRv371OIpHMWtnnxTapRIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755553326; c=relaxed/simple;
	bh=LfMTzHrgXvJH1WzVBSPQTxWPwCFFoMLIhKpt6VyIHlQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=O0UW1lsrYvVgSTsyr6DToPEH23ybMHIUFh/TrMK66I6NXLDQuGohf524UHjLW/OPWzTczgJLudN21A3Mb8PCd3UW1z5pnBJKVFMX+AFTuK47MYxKhI3/myyJGUvKw1MiHnTaSZmTkNa79a2jEuHAo6PaFSvwCW9mENib6ppLo5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=NAf3VkSl; arc=none smtp.client-ip=212.77.101.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Received: (wp-smtpd smtp.wp.pl 28773 invoked from network); 18 Aug 2025 23:41:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1755553315; bh=b++cVNitR7MJz4F2QuWH0QsXKvZh6qHTONJSyY8D1eU=;
          h=From:To:Subject;
          b=NAf3VkSltT0Q7PaF4RItKbn5ppPxIUcykV8kPJKCEerIBK84UvIH7FbpV6yheOMnN
           ubCRJHksWBwiyrCox2RsbcprsMtmFAFNsjAPfxSizv4zQpeKRTRzXjaspfR1ajGTC5
           OBqcyq95N2DeepMEFenN1nVB3QmEaRJVpW7zsLBtdF9YDKdUq7NwqTOJ69Da0PNXcX
           /djJg/aeEen8eqIf5PAXAiVduzwKU2j0QffQA5137XKEF6gsN7vOf1lKIp+QbnTKHa
           HsZhAGxj18qNjWo53t4eRfO4zje2HjsaLZpqGmJatXtxN3A3DWwDgp/lwPzHPtWFtg
           Ka03aAlSUg8zg==
Received: from 83.24.134.210.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.134.210])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <tsbogend@alpha.franken.de>; 18 Aug 2025 23:41:55 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: tsbogend@alpha.franken.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	olek2@wp.pl,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] dt-bindings: mips: lantiq: Document lantiq dcdc binding
Date: Mon, 18 Aug 2025 23:37:28 +0200
Message-ID: <20250818214153.1084844-1-olek2@wp.pl>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-WP-MailID: 7d74713a7ee91f2f150aa2096ca6e0c0
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000A [UTNE]                               

Lantiq DCDC is a voltage converter with a voltage sensor. The converter
is inside the SoC. This driver only reads the voltage and prints it at
startup. The voltage supplied by this converter powers one of the power
domains. It powers the CPU core and probably other peripherals as well.
The voltage is programmed by the bootloader and Linux never touches it.

Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
---
v3:
- extended commit description
v2:
- added missing commit description
---
 .../mips/lantiq/lantiq,dcdc-xrx200.yaml       | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/lantiq/lantiq,dcdc-xrx200.yaml

diff --git a/Documentation/devicetree/bindings/mips/lantiq/lantiq,dcdc-xrx200.yaml b/Documentation/devicetree/bindings/mips/lantiq/lantiq,dcdc-xrx200.yaml
new file mode 100644
index 000000000000..d951012392bf
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/lantiq/lantiq,dcdc-xrx200.yaml
@@ -0,0 +1,38 @@
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
+description:
+  Lantiq DCDC is a voltage converter with a voltage sensor. The converter is
+  inside the xRX200 SoC. This driver only reads the voltage and prints it at
+  startup. The voltage supplied by this converter powers one of the power
+  domains. It powers the CPU core and probably other peripherals as well.
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


