Return-Path: <linux-mips+bounces-5558-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 206F8977709
	for <lists+linux-mips@lfdr.de>; Fri, 13 Sep 2024 04:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C718C1F21B62
	for <lists+linux-mips@lfdr.de>; Fri, 13 Sep 2024 02:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25A261BD503;
	Fri, 13 Sep 2024 02:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="2ZF7RX+J"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC1E1369BB
	for <linux-mips@vger.kernel.org>; Fri, 13 Sep 2024 02:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726195803; cv=none; b=JyxO1CGa/8FczUTfgpuiWhFr6pPAiqdmuUDNEXC9U40AVcmzgCKdGSDhjIdWRhKCeoPh7cZexBDT8az+O+LfTOCZxYa0mOHtv7EMMm01u/J8SsXb+ndyHyrIv+DxDGngzpZHAKyQgeJsW/BXrF6gIHZwK6eYFw3cCV+JY4I80Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726195803; c=relaxed/simple;
	bh=MAxk5/rNjtB0efMRVv2nC/zD7O6Ba9bj9xINGPkBhWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eXYupsXYy1DSyaXSE0PWfh2qbd7UsyiNZGPRejrlfsNIPpd83WMUL4KahT9ruwMupFavnnq+vtmDzUEzkDPeJcgj82fQX6BPrNkuAKRTkRh1rYC5FSOHfgoDRZeMh5NVwlxYbXmbJlvDnXYO4VZliLplbqDHN4b5YvXPN/kIvPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=2ZF7RX+J; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id B55F22C00C1;
	Fri, 13 Sep 2024 14:49:51 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1726195791;
	bh=IyjS3TH4E3uhWYtLj484J7j57LwV+XVgHbxsmgxta6g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=2ZF7RX+JJTZhkySdzb/QV5IvXswewHGhhH3fyJcBn0znkpb5Aj18WZxws3xrD9USo
	 KCHy4cO/8AXXjv/jebc9JMBa3GWgECxMLDpUHLn/n+RAgdI1WtdfWuYxza6fPBFnqz
	 Z258kSHYjITAop8H13ow/7PP7+ukHdXUJvxLfk2I4sU693/vfjqqvoHWMQv9o+WWhC
	 Y6IE+SnqKB7Rqh1BDlOo1HzqsniYEqUJe/VoV6M/YT9Fdq2TZ4gTsOLuDNk3jn/6JI
	 759sFQCn66Uj02sOyNFHIyNABkUps0x8x2rQr9BWLditY06zQZavggxI97jgWt1a/8
	 SZtZAP0/H66Eg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66e3a84f0001>; Fri, 13 Sep 2024 14:49:51 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 9260313EE4F;
	Fri, 13 Sep 2024 14:49:51 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 9029528005C; Fri, 13 Sep 2024 14:49:51 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 1/2] dt-bindings: mfd: Add Realtek switch
Date: Fri, 13 Sep 2024 14:49:47 +1200
Message-ID: <20240913024948.1317786-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240913024948.1317786-1-chris.packham@alliedtelesis.co.nz>
References: <20240913024948.1317786-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66e3a84f a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=EaEq8P2WXUwA:10 a=gEfo2CItAAAA:8 a=RqFMS8Kk0ItR_bseB4sA:9 a=3ZKOabzyN94A:10 a=lodiqALd0UDFbPdo5Gsx:22 a=sptkURWiP4Gy88Gu7hUp:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add device tree schema for the Realtek switch. Currently the only
supported feature is the syscon-reboot which is needed to be able to
reboot the board.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v2:
    - use filename that matches the compatible
    - put maintainers after title
    - remove unnecessary label in example
    - Rework description to focus on what is implemented rather than what
      may be implemented in the future.

 .../bindings/mfd/realtek,rtl9302c-switch.yaml | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/realtek,rtl9302=
c-switch.yaml

diff --git a/Documentation/devicetree/bindings/mfd/realtek,rtl9302c-switc=
h.yaml b/Documentation/devicetree/bindings/mfd/realtek,rtl9302c-switch.ya=
ml
new file mode 100644
index 000000000000..902750d33bea
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/realtek,rtl9302c-switch.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/realtek,switch.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek Switch with Internal CPU
+
+maintainers:
+  - Chris Packham <chris.packham@alliedtelesis.co.nz>
+
+description:
+  The RTL9302 is an Ethernet switch with an integrated CPU. A number of
+  different peripherals are accessed through a common register block,
+  represented here as a syscon node.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - realtek,rtl9302c-switch
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  reboot:
+    $ref: /schemas/power/reset/syscon-reboot.yaml#
+
+required:
+  - compatible
+  - reg
+  - reboot
+
+additionalProperties: false
+
+examples:
+  - |
+    ethernet-switch@1b000000 {
+      compatible =3D "realtek,rtl9302c-switch", "syscon", "simple-mfd";
+      reg =3D <0x1b000000 0x10000>;
+
+      reboot {
+        compatible =3D "syscon-reboot";
+        offset =3D <0x0c>;
+        value =3D <0x01>;
+      };
+    };
+
--=20
2.46.0


