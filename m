Return-Path: <linux-mips+bounces-7843-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD41A3A815
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 20:53:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F09416A653
	for <lists+linux-mips@lfdr.de>; Tue, 18 Feb 2025 19:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11B6E26E622;
	Tue, 18 Feb 2025 19:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="wfOaJxKs"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DD81EB5DC
	for <linux-mips@vger.kernel.org>; Tue, 18 Feb 2025 19:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739908354; cv=none; b=AXKlKn+Bj1MHm0cHzV9DfFIKv5fRwzpcbLJglEDs7H0JP2XnAV66Cr7H/MYZLx+/zLBY28yngmqC8UbV98fer3jmRXFApmnNLPcH3gGPUMaHqMfEoWWY2yW4nM/79bRyclzLTKxwgTE7kueh4cCL4sQ7zG2It8eI0AtozpVtT8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739908354; c=relaxed/simple;
	bh=vRCgLpcUVx0wKULsadSL0xFdXjndGNJOD53CNfruH70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jgZAGTPzHDFoiwg7vgSIp5x1o33hA2F1WAzakAUWZh6zAT8QckvKW+gfQ2nY7piPIwgDRXlzPRcgRpJLoN1/OtmVhX8imx5EO7kPAtE1r5+bICQBgq09TPQ+qL1WtS0GyAcjpaXbZRykSwH8P7ucybUFvWTHeSwqUJmh4FTRJag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=wfOaJxKs; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id F1A312C00BE;
	Wed, 19 Feb 2025 08:52:30 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1739908350;
	bh=xOKn8zxK8enZbzoMFVOYM1tSF7siyAiiWT9kTl1Kl4w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wfOaJxKsPD8fHgVQ5ZjVvgHqfv7x4oQGz7HezFj64EHn4sfKvnDJg7ySkOMSieFnm
	 2+KglFe86AW5rBr1T2zZ2lnM5HQnklpM9p6K8G0BdHdy4WxQJOZXITlQTWdp4mi+2o
	 tldzfOyvuD5eA8tczKlnzIGBeRRWstupDcepMjEDtVFnWDor0Pp88szKll65dVU1Or
	 5ZArfFhqUqs1EkWmmkgMWb/5XL6grLixAx3Ez5XWwpwaCYont09Dw3N70XTcy9SNNX
	 kA3cf1eyZzjQ3Jmky6aPlWlO4GmRlxo//ingS0uAJoEBCX5orle963iaGpRpLYKSMN
	 dU3Gmzp7QexTg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67b4e4fe0000>; Wed, 19 Feb 2025 08:52:30 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 7FD2713EE36;
	Wed, 19 Feb 2025 08:52:30 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 7CAFC2804FB; Wed, 19 Feb 2025 08:52:30 +1300 (NZDT)
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
	tsbogend@alpha.franken.de
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [RESEND PATCH net-next 3/5] dt-bindings: net: Add Realtek MDIO controller
Date: Wed, 19 Feb 2025 08:52:14 +1300
Message-ID: <20250218195216.1034220-4-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218195216.1034220-1-chris.packham@alliedtelesis.co.nz>
References: <20250218195216.1034220-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ccpxrWDM c=1 sm=1 tr=0 ts=67b4e4fe a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T2h4t0Lz3GQA:10 a=VwQbUJbxAAAA:8 a=gEfo2CItAAAA:8 a=c9Y0P7eFa9iVWmZcgD4A:9 a=3ZKOabzyN94A:10 a=sptkURWiP4Gy88Gu7hUp:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add dtschema for the MDIO controller found in the RTL9300 Ethernet
switch. The controller is slightly unusual in that direct MDIO
communication is not possible. We model the MDIO controller with the
MDIO buses as child nodes and the PHYs as children of the buses. The
mapping of switch port number to MDIO bus/addr requires the
ethernet-ports sibling to provide the mapping via the phy-handle
property.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    This is technically v7 of [1] and [2] which are combined now that
    rtl9301-switch.yaml under net/ the only change from those is that the
    $ref: in rtl9301-switch.yaml can now use a relative path
   =20
    I could technically do away with the reg property on the mdio-control=
ler
    node. I don't currently need to use it in my driver and it looks like
    the register offsets are the same between the RTL9300 and RTL9310.
   =20
    [1] - https://lore.kernel.org/lkml/20250204030249.1965444-6-chris.pac=
kham@alliedtelesis.co.nz/
    [2] - https://lore.kernel.org/lkml/20250204030249.1965444-4-chris.pac=
kham@alliedtelesis.co.nz/

 .../bindings/net/realtek,rtl9301-mdio.yaml    | 86 +++++++++++++++++++
 .../bindings/net/realtek,rtl9301-switch.yaml  | 31 +++++++
 2 files changed, 117 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/realtek,rtl9301=
-mdio.yaml

diff --git a/Documentation/devicetree/bindings/net/realtek,rtl9301-mdio.y=
aml b/Documentation/devicetree/bindings/net/realtek,rtl9301-mdio.yaml
new file mode 100644
index 000000000000..02e4e33e9969
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/realtek,rtl9301-mdio.yaml
@@ -0,0 +1,86 @@
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
+  reg:
+    maxItems: 1
+
+patternProperties:
+  '^mdio-bus@[0-3]$':
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
+      '^ethernet-phy@[a-f0-9]+$':
+        type: object
+        $ref: ethernet-phy.yaml#
+        unevaluatedProperties: false
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    mdio-controller@ca00 {
+      compatible =3D "realtek,rtl9301-mdio";
+      reg =3D <0xca00 0x200>;
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
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/net/realtek,rtl9301-switch=
.yaml b/Documentation/devicetree/bindings/net/realtek,rtl9301-switch.yaml
index 5d29647bea2d..80eabc170669 100644
--- a/Documentation/devicetree/bindings/net/realtek,rtl9301-switch.yaml
+++ b/Documentation/devicetree/bindings/net/realtek,rtl9301-switch.yaml
@@ -54,6 +54,9 @@ patternProperties:
   'i2c@[0-9a-f]+$':
     $ref: /schemas/i2c/realtek,rtl9301-i2c.yaml#
=20
+  'mdio-controller@[0-9a-f]+$':
+    $ref: realtek,rtl9301-mdio.yaml#
+
 required:
   - compatible
   - reg
@@ -129,15 +132,43 @@ examples:
         };
       };
=20
+      mdio-controller@ca00 {
+        compatible =3D "realtek,rtl9301-mdio";
+        reg =3D <0xca00 0x200>;
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        mdio-bus@0 {
+          reg =3D <0>;
+          #address-cells =3D <1>;
+          #size-cells =3D <0>;
+
+          phy1: ethernet-phy@0 {
+            reg =3D <0>;
+          };
+        };
+        mdio-bus@1 {
+          reg =3D <1>;
+          #address-cells =3D <1>;
+          #size-cells =3D <0>;
+
+          phy2: ethernet-phy@0 {
+            reg =3D <0>;
+          };
+        };
+      };
+
       ethernet-ports {
         #address-cells =3D <1>;
         #size-cells =3D <0>;
=20
         port@0 {
           reg =3D <0>;
+          phy-handle =3D <&phy1>;
         };
         port@1 {
           reg =3D <1>;
+          phy-handle =3D <&phy2>;
         };
       };
     };
--=20
2.48.1


