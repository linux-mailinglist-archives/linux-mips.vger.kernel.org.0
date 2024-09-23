Return-Path: <linux-mips+bounces-5613-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 966239839DF
	for <lists+linux-mips@lfdr.de>; Tue, 24 Sep 2024 01:04:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F3F11F22111
	for <lists+linux-mips@lfdr.de>; Mon, 23 Sep 2024 22:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0909126BE7;
	Mon, 23 Sep 2024 22:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="tI8gOPsJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF5C2E419
	for <linux-mips@vger.kernel.org>; Mon, 23 Sep 2024 22:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727132248; cv=none; b=dEUQT0SPKwd0jNEvIXyouSLGN45hDT3T7aPcPQdcAJ/dT8hzyiNnZ6WIjsNgNisAyPwEG624GMggkAbuRZFiX/DyaNm2PBwNIK/d1WiHMyJbLgaEY9pYJrvsOgrj4vT6AFOadmJbtxVBb+Du/yT/CuECgzhB2OCz681FjZ1QP8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727132248; c=relaxed/simple;
	bh=alzAKM7GjraxAKGNRQzzS1bm3jhDdeY2QlPPbu54nE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k8B+1ss3ra4WLsOKvFpJMshqMSJbVgZUPufxu7bNQ1sQTf30j4AWJzusEau5+KSrahfCQk0lXcY5X5lJ38eMjUuXZK/mDhwsTB/6Vetx0Admw+UsMSEQGCgTusHGhTNv8JnXqJjHQuVSKA1aMSU6f1liu6kpZ2eMs3eVhscLnqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=tI8gOPsJ; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 2D04D2C05DB;
	Tue, 24 Sep 2024 10:57:23 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1727132243;
	bh=r/SysA06cz+g/+g/douOrBfp/O7mBxLIyC8pNuisR9c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tI8gOPsJidq0wIziJrA1sxJzUzeY83ihXOQeYS4W3W4GbMrazm+X9Q25tlX3bpalL
	 Vh/rVcuJVkDcy4bALEloXRQii0oei+/Tp4lIyJtJNT9koXzKVvxlmhiMTprlCAPNEV
	 1E4+Oukoqb3wDfKjDHpVua3uxUx1AZBjnmdTrVzgwdHMASIbPiNjqkqo6XKqZQ81Bh
	 o2nvWGz6ETtrTNFSl7W/pJE+M47JfHpkOKlUJxboxn/ll/FxNxYHlIuvD/wQIZP8ve
	 4kFeJFuna9Uw3wzksFaHhuPqO/+VFwDtCh2B55zul0g0I1yu/PXfEc+KzH7rw3sprd
	 fcIIzCOZBd3vQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66f1f2520001>; Tue, 24 Sep 2024 10:57:22 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id F378513EE56;
	Tue, 24 Sep 2024 10:57:22 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id EE053280960; Tue, 24 Sep 2024 10:57:22 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v4 1/3] dt-bindings: mfd: Add Realtek switch
Date: Tue, 24 Sep 2024 10:57:17 +1200
Message-ID: <20240923225719.2999821-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240923225719.2999821-1-chris.packham@alliedtelesis.co.nz>
References: <20240923225719.2999821-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66f1f252 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=EaEq8P2WXUwA:10 a=gEfo2CItAAAA:8 a=RqFMS8Kk0ItR_bseB4sA:9 a=3ZKOabzyN94A:10 a=lodiqALd0UDFbPdo5Gsx:22 a=sptkURWiP4Gy88Gu7hUp:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add device tree schema for the Realtek switch. Currently the only
supported feature is the syscon-reboot which is needed to be able to
reboot the board.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v3:
    - fix schema id to match filename
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
index 000000000000..2d20dd07a7e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/realtek,rtl9302c-switch.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/realtek,rtl9302c-switch.yaml#
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
2.46.1


