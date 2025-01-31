Return-Path: <linux-mips+bounces-7647-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE35BA23867
	for <lists+linux-mips@lfdr.de>; Fri, 31 Jan 2025 02:02:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 698C43A74F4
	for <lists+linux-mips@lfdr.de>; Fri, 31 Jan 2025 01:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 558281CA81;
	Fri, 31 Jan 2025 01:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="oHqO6Af+"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C614409
	for <linux-mips@vger.kernel.org>; Fri, 31 Jan 2025 01:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738285335; cv=none; b=W0Vl5hoVj3/1Qj6+yx8ANsD7f2rF2ZE1iZYo8hkW8mP7CK3y7mlT/09mRXh6F6ZTSB2wLrsERGvZ6GHk++Bgrf7jmx8lX2XwgczmrDxGuL4K3XeDmHxhEwDvntl+1bAooNN41YMyHYa07CWUNuyhEVTrLnueu60deiHzmFTGUWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738285335; c=relaxed/simple;
	bh=KlcHGccGevK9NQFx61KDGxauWBmDVaGltURMM6rmh30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AJl0EGQj01psASKaLJVwAq36YrNrFlcfi/xZu8fdvxoJNVEbyLhwwCsrlENWTl9Oavtsqtwbi7CzE+Rlw92S78GScwHfg+UONHjq08rdS/y2OSucpCK2FYdw2iTqaxoNVkvauwo04SgVkg92vx7psxSD3SaHKyoIXGvMgMsCz1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=oHqO6Af+; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 595E42C019A;
	Fri, 31 Jan 2025 14:02:10 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1738285330;
	bh=EdfF2PMQKfdZHx4FmLRkWBmB9Uv4yrzjsA4+2UFsnRA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oHqO6Af+g+KA39MpbhqcU+a/CauohUe6jaUnNHRQPXqW0u4WHRC7LtB9aGgUErQox
	 zG6yoQh/qpGRsWu2GawdVEEs9DAORgsiZZNXzFbH0thr1lNU9yfHrUkqJtzHda3H3t
	 W0p6Xyev987mjkfF1K/USJwzXf2ag22MrVMHoUzj+QQcRVBdvkoVMMkbKUcDymzt76
	 0i2tM1uuWwKFOkxjDHw4YDXNO0WDqUOkBBLrsyoqoE/XG1f44XcfLymf+Ed8T+Qy0A
	 hk0d+PrRY21b3ZN8+jaUE8eb5ROyiXg9ODgpVi7+bopdoBVCnTUfcq01/mG4mclGhZ
	 YMKy/+HqHAKpA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B679c21110000>; Fri, 31 Jan 2025 14:02:09 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id DEDF613EE2B;
	Fri, 31 Jan 2025 14:02:09 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id DDBA62809C0; Fri, 31 Jan 2025 14:02:09 +1300 (NZDT)
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
Subject: [PATCH v5 1/4] dt-bindings: net: Add Realtek MDIO controller
Date: Fri, 31 Jan 2025 14:01:48 +1300
Message-ID: <20250131010151.2527688-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250131010151.2527688-1-chris.packham@alliedtelesis.co.nz>
References: <20250131010151.2527688-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=QNvLRRLL c=1 sm=1 tr=0 ts=679c2111 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=VdSt8ZQiCzkA:10 a=gEfo2CItAAAA:8 a=uUkUPOp6VOHUeHtzUs0A:9 a=3ZKOabzyN94A:10 a=vS_ywuodlF3WoELfi4UP:22 a=sptkURWiP4Gy88Gu7hUp:22
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
    Changes in v5:
    - Add back reg property to mdio-controller node
    - Make unit address in the node name required
    - Andrew suggested perhaps doing away with the realtek,port property =
and
      providing the overall mapping via an array of phandles. I've explor=
ed
      this a little, it is doable but I'm not sure it actually makes thin=
gs
      any clearer when the portmap has gaps so I haven't made this change=
.
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

 .../bindings/net/realtek,rtl9301-mdio.yaml    | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/realtek,rtl9301=
-mdio.yaml

diff --git a/Documentation/devicetree/bindings/net/realtek,rtl9301-mdio.y=
aml b/Documentation/devicetree/bindings/net/realtek,rtl9301-mdio.yaml
new file mode 100644
index 000000000000..80456dc791eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/realtek,rtl9301-mdio.yaml
@@ -0,0 +1,98 @@
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
+      '^ethernet-phy@[a-f0-9]+$':
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
2.48.1


