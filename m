Return-Path: <linux-mips+bounces-7535-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 748BDA165F4
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 05:02:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5856188844D
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 04:02:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57E0C15DBB3;
	Mon, 20 Jan 2025 04:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="q3flvuP5"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF92634
	for <linux-mips@vger.kernel.org>; Mon, 20 Jan 2025 04:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737345751; cv=none; b=Pg4X0SCedcS1sD87q1/cQY+gidVAigxD3f3C/j3Nzrvpf/6IBTNOTIjJsGIJDvJffRa2XgqRuCVAMCmcqUNzpJtK4u81Lw5GUCsfxbQmuL/GYTzmmIU1sLCVjpJHUHR9R8GZZ8xlz/j7rluV79RBmj8UvmTuStLiJzfFkrRJk0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737345751; c=relaxed/simple;
	bh=JHvR34/INB0m0LMcfy+OsiEitRZfQI0lHhy500u7Shc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OhiMDsMiWckS7Qf/1Q2kpDnHOPpjYGFibqoeUOVUKoW/5UtNUk46st7iuCQwGY1ZbIjfWY+o8htvojGkIXKVsyFfzJcJJIGKmS0LMwo+S360wWbYT12NPUOMF8cPE0lPXpafBKwEliKEWDs6AMXxyt1Nv85vTRFAy8oARYu6YR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=q3flvuP5; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id EACDB2C08E5;
	Mon, 20 Jan 2025 17:02:24 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1737345744;
	bh=WEIiDpdcVqO8l0L5AH3sdNmNVJ47ClM0ALRjjxOMV0g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q3flvuP5l5ZSuaUMaad5nRFU1VL0kvPYa2dX5RVFIuLAb/WZbchr9eKFroAKXnUhN
	 m66BVFl1GW5usBdBDKjc1lbCsYuVLNS37YNVPMO3gYWq8lNpW/ft/dg01SRHzTY0V7
	 y41ws4sbwYEX8atBrZjjroOcY5COHp+UBtbl/bWUws/UhHblcI3Iec0Y5KFvakxU9T
	 J0sbUqaPc12GiPl+mQrBSHEy6+EeGGOnCz6mdB6YAxfxIBI/n08q+KSKDr775dcyTL
	 7YPQVISu34JgRPaJeTpdMPo1GtoXqzw+fRQfzR+dRK3xKX8Ir0YsPGLRrVJe/9Uy/T
	 qn6eBe9Us9deQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B678dcac80002>; Mon, 20 Jan 2025 17:02:16 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 87BCE13EE56;
	Mon, 20 Jan 2025 17:02:16 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 815032801B2; Mon, 20 Jan 2025 17:02:16 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	tsbogend@alpha.franken.de,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	sander@svanheule.net,
	markus.stockhausen@gmx.de
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v4 1/4] dt-bindings: net: Add Realtek MDIO controller
Date: Mon, 20 Jan 2025 17:02:11 +1300
Message-ID: <20250120040214.2538839-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250120040214.2538839-1-chris.packham@alliedtelesis.co.nz>
References: <20250120040214.2538839-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BNQQr0QG c=1 sm=1 tr=0 ts=678dcac8 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=VdSt8ZQiCzkA:10 a=gEfo2CItAAAA:8 a=h0k0zCsF0n2ckjRL4XMA:9 a=3ZKOabzyN94A:10 a=B5yxFNDaAi3NZn3IPzhQ:22 a=sptkURWiP4Gy88Gu7hUp:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add dtschema for the MDIO controller found in the RTL9300 SoCs. The
controller is slightly unusual in that direct MDIO communication is not
possible. We model the MDIO controller with the MDIO buses as child
nodes and the PHYs as children of the buses. Because we do need the
switch port number to actually communicate over the MDIO bus this needs
to be supplied via the "realtek,port" property.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v4:
    - Model the MDIO controller with the buses as child nodes. We still n=
eed
      to deal with the switch port number so this is represented with the
      "realtek,port" property which needs to be added to the MDIO bus
      children (i.e. the PHYs)
    - Because the above is quite a departure from earlier I've dropped th=
e
      r-by
    Changes in v3:
    - Add r-by from Connor
    Changes in v2:
    - None

 .../bindings/net/realtek,rtl9301-mdio.yaml    | 93 +++++++++++++++++++
 1 file changed, 93 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/realtek,rtl9301=
-mdio.yaml

diff --git a/Documentation/devicetree/bindings/net/realtek,rtl9301-mdio.y=
aml b/Documentation/devicetree/bindings/net/realtek,rtl9301-mdio.yaml
new file mode 100644
index 000000000000..e3ecb1b4afd3
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/realtek,rtl9301-mdio.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/realtek,rtl9301-mdio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek RTL9300 MDIO Controller
+
+maintainers:
+  - Chris Packham <chris.packham@alliedtelesis.co.nz>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - realtek,rtl9302b-mdio
+              - realtek,rtl9302c-mdio
+              - realtek,rtl9303-mdio
+          - const: realtek,rtl9301-mdio
+      - const: realtek,rtl9301-mdio
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  '^mdio-bus@[0-4]$':
+    $ref: mdio.yaml#
+
+    properties:
+      reg:
+        maxItems: 1
+
+    required:
+      - reg
+
+    patternProperties:
+      '^ethernet-phy(@[a-f0-9]+)?':
+        type: object
+        $ref: ethernet-phy.yaml#
+
+        properties:
+          realtek,port:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              The MDIO communication on the RTL9300 is abstracted by the=
 switch. At
+              the software level communication uses the switch port to a=
ddress the
+              PHY with the actual MDIO bus and address having been setup=
 via the
+              parent mdio-bus and reg property.
+
+        unevaluatedProperties: false
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mdio-controller {
+      compatible =3D "realtek,rtl9301-mdio";
+      #address-cells =3D <1>;
+      #size-cells =3D <0>;
+
+      mdio-bus@0 {
+        reg =3D <0>;
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        ethernet-phy@0 {
+          compatible =3D "ethernet-phy-ieee802.3-c45";
+          reg =3D <0>;
+          realtek,port =3D <0>;
+        };
+      };
+
+      mdio-bus@1 {
+        reg =3D <1>;
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        ethernet-phy@0 {
+          compatible =3D "ethernet-phy-ieee802.3-c45";
+          reg =3D <0>;
+          realtek,port =3D <8>;
+        };
+      };
+    };
--=20
2.47.1


