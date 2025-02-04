Return-Path: <linux-mips+bounces-7673-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 590A3A26A6C
	for <lists+linux-mips@lfdr.de>; Tue,  4 Feb 2025 04:03:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F4B33A61FA
	for <lists+linux-mips@lfdr.de>; Tue,  4 Feb 2025 03:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58BA314AD20;
	Tue,  4 Feb 2025 03:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="2uZfn7td"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC95D4085D
	for <linux-mips@vger.kernel.org>; Tue,  4 Feb 2025 03:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738638192; cv=none; b=eRZ0jaspRLAxsXm12yEMEsA1gsN2+VQKh1nR0+uKy19x9HeGxf+QiFutVY+AAzxXcSIJ1tt3mSFrjkHXmx6ivF9R+D36qrcCzo9+3lOVoa9iYfRfGZxENn3ygOkbvNe6iOJ+jUGhWPD+SkSLfl9T1AnvFpQGIt+07v7VKgZ7UXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738638192; c=relaxed/simple;
	bh=VJrFUmicDNq1FSMCfrXKd+XEUvG35Vndia3CKOxt9ks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EE+Yl5GUHLdtNLQ0Gea+ecSHOz55Xy4L3ay9CLNCCMOc2+trK8D7WrbREiBKHzlP77jVMBmEHjPSdcnZ6Le2SNsl/942lRD4NQBuwiO5RhfWyblSHW8PrO8te1Otl9fU9P5r7p7stvDLtAiQeorzHxD4eU/gfsOvhGhXktwjqyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=2uZfn7td; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 76FD02C0477;
	Tue,  4 Feb 2025 16:03:09 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1738638189;
	bh=MOrA0n6MqVeIkJa6qf2corfGZHZBrFT3MtdqsxEWvrs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=2uZfn7tdfZjA5HeIcGr2Zc0e1n8oT3EHdPqK0wi0SY0/I9TP5u4LBUKqIV6SaHFBP
	 hiEGY3lsa1/6PjCEujpticDFnTje/alb9d6fO7qg2xFCvrYuUg63ChR66ivY070D75
	 bMFEYAQDIwAj8VG1L9DE3hZyhZmfvenFJWbBvpbqJoQt5qfstNO/b1mnFdMXIUijPJ
	 DAkmECcw4KDNxOEfTYGNcJL/4mdakhyAhDMs0Xq4Z7Xp8xzd9zSH14pltK616ZfCwM
	 wABX8GqEEUyx1Xkg/tqC96ZpsLDWli2hLmLpLcB8Q5UWBGD/rDyA4wsEjnNObn9sy2
	 KuIHHGOTLu0Tw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67a1836d0000>; Tue, 04 Feb 2025 16:03:09 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 213A613EE36;
	Tue,  4 Feb 2025 16:03:09 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 1C8332804B6; Tue,  4 Feb 2025 16:03:09 +1300 (NZDT)
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
	daniel@makrotopia.org,
	markus.stockhausen@gmx.de
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH net-next v6 2/6] dt-bindings: net: Add Realtek MDIO controller
Date: Tue,  4 Feb 2025 16:02:45 +1300
Message-ID: <20250204030249.1965444-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250204030249.1965444-1-chris.packham@alliedtelesis.co.nz>
References: <20250204030249.1965444-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=QNvLRRLL c=1 sm=1 tr=0 ts=67a1836d a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T2h4t0Lz3GQA:10 a=gEfo2CItAAAA:8 a=h0k0zCsF0n2ckjRL4XMA:9 a=3ZKOabzyN94A:10 a=k4rVKtLH5ZiPiG3jzTle:22 a=sptkURWiP4Gy88Gu7hUp:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add dtschema for the MDIO controller found in the RTL9300 SoCs. The
controller is slightly unusual in that direct MDIO communication is not
possible. We model the MDIO controller with the MDIO buses as child
nodes and the PHYs as children of the buses. The mapping of switch port
number to MDIO bus/addr requires the ethernet-ports sibling to provide
the mapping via the phy-handle property.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v6:
    - Remove realtek,port property. The driver will parse the ethernet-po=
rts
      sibling node to figure out the mapping (do I need to mention that
      somewhere in this binding?).
    - Correct number of mdio buses. 4 possible buses numbered 0-3.
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

 .../bindings/net/realtek,rtl9301-mdio.yaml    | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
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
--=20
2.48.1


