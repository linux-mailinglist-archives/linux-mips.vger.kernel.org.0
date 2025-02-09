Return-Path: <linux-mips+bounces-7715-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4454A2E19E
	for <lists+linux-mips@lfdr.de>; Mon, 10 Feb 2025 00:49:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 497583A5EB0
	for <lists+linux-mips@lfdr.de>; Sun,  9 Feb 2025 23:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A79111AF0C3;
	Sun,  9 Feb 2025 23:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="ffV6HIhR"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2F11B0F16
	for <linux-mips@vger.kernel.org>; Sun,  9 Feb 2025 23:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739144894; cv=none; b=KNR8uCtJQsSUi7Eggnt6AQI627bD2QmCJnJ6JjWbkjSagyNITfbjET4fvuzF6r9N6UsCafmBPEjUWniFYEUk5VJE/UmLWVu8B8C1f5xbgra/YK70tnScnHJ3Aw2gSI2R8q/Ob5m5HVCH4t5ODX//mRbQFjYbgQRxp7fwuvAcCjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739144894; c=relaxed/simple;
	bh=vRCgLpcUVx0wKULsadSL0xFdXjndGNJOD53CNfruH70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CMXxuTjtxwTN8VqekRnmTan6/lwBMFva7tuV4MjyaLEKpK3NtFt9/HRhBXjT/Vjhc+AJiPrgzEZp5AJHmmvpX4wSGjd6q4oXa1V3lPSHFOFjUKxpvgTTAabWdjZBbWq3psLMAFnG9OHesQZikNNOHobUhYCv3Fue5pPFP2vWzbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=ffV6HIhR; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 2E9BF2C047F;
	Mon, 10 Feb 2025 12:48:11 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1739144891;
	bh=xOKn8zxK8enZbzoMFVOYM1tSF7siyAiiWT9kTl1Kl4w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ffV6HIhRnMQGuHostvhfLE2ta89z9W6K09pbkmj+IEvs5xvKMdKh1ja0xpbYaoptu
	 3fKIt2/Y/t71PktSQ0B6VRgsW2mp09TyfV/3Te3SJivaKkGihm53HCoF63NqhqJJGv
	 v3wxad93oz6EeQ1TVpIVheTuYI06GCbkOpMaHFvEaCIIxEXmhgA+458qRW1zJ9Y2gd
	 tDO4hl1acFonNwry1UTqPvCOWBAD/G4/Ub/6mggPX6+3IdWJlaNygqOM/FSG0R+CVs
	 rwPPbxZwMClkg5XXDOnzgwX6ZUwNdentfKehEjAO/2xmxV8Nh87slYIzI5ziRU8yyQ
	 gYtJDdXtWNF+A==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67a93eba0000>; Mon, 10 Feb 2025 12:48:10 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id BD6A613ED4A;
	Mon, 10 Feb 2025 12:48:10 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id ABECB280789; Mon, 10 Feb 2025 12:48:10 +1300 (NZDT)
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
Cc: linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH net-next 3/5] dt-bindings: net: Add Realtek MDIO controller
Date: Mon, 10 Feb 2025 12:47:49 +1300
Message-ID: <20250209234751.460404-4-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250209234751.460404-1-chris.packham@alliedtelesis.co.nz>
References: <20250209234751.460404-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=QNvLRRLL c=1 sm=1 tr=0 ts=67a93eba a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T2h4t0Lz3GQA:10 a=VwQbUJbxAAAA:8 a=gEfo2CItAAAA:8 a=c9Y0P7eFa9iVWmZcgD4A:9 a=3ZKOabzyN94A:10 a=sptkURWiP4Gy88Gu7hUp:22
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


