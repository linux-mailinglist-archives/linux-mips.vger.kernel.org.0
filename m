Return-Path: <linux-mips+bounces-7028-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1089F28AF
	for <lists+linux-mips@lfdr.de>; Mon, 16 Dec 2024 04:14:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D23ED7A142F
	for <lists+linux-mips@lfdr.de>; Mon, 16 Dec 2024 03:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09C7A160884;
	Mon, 16 Dec 2024 03:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="IKjPTUtm"
X-Original-To: linux-mips@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BD31514DC
	for <linux-mips@vger.kernel.org>; Mon, 16 Dec 2024 03:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734318834; cv=none; b=sGzcCyamvbfWu77MH807zFChbTcmyNlO12Syi1UdCF6mUCr+ZrmprT74y2+8HtjykmfHbnTuH6ejOHnpCEGvcPijs/TU9CDy+bmtePyjhAP9qLJP/xqlWi1yTwVknNV48V6btamRA+5zF1TD48aecOf/wDfQ2wPsIOlwz+7rp0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734318834; c=relaxed/simple;
	bh=t3UDuB/k/6gJH28l6NNeiKh5cTQaX1PP5+VSQRwTTrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D0/5mGprtnnolL4M1A5iZtFny4xfTldDwJlfrMhwYPx5lYXvDeGUUc50Lr0AQ6Keo+AxokCYeis5tqNE7d7euVasE7Lzo26QtHi//euNHN+KwCaMFQn6X4vUygHoOTTSkm7zHvbYt9zu5RYpHUqoUmDGk681faMmXad9FbwNzks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=IKjPTUtm; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 400842C02A8;
	Mon, 16 Dec 2024 16:13:49 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1734318829;
	bh=u8A0pZjwNNzs8FNwLXJeDrO2LOMmvwLBf+tlQXB1tAo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IKjPTUtmcaVuMWRp0gpiwPCYUOqm/afvUCZl2cKmfxL2d2o7rcVmsHid3RWUF9DTc
	 igtbdS6jwqPeNca43Kr03Pf2Zu76wxNTK6xrlADGWq4+R3kNuuJyIcKkzWZz4QXPCI
	 cOEEulvbVPB7RE67Ofy2dsTedkSrKW2PkPBOHtIgLANbSUwnhD9kf5vMo8vrsusZtH
	 hgYNYM62tjJaZWLMLO48UaomVtTj5jzqcL+qYu/86omDhRX2lXF/dFqIWzHobsQBRQ
	 T1+ql6ee/3WExZtw0oRx2YIT8lU0VJURA10kH0+lF187oAdJLZOn9Z2hMuGlqcitx5
	 VTr4sIWqqNvEQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B675f9aec0001>; Mon, 16 Dec 2024 16:13:48 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id E56D413EE7B;
	Mon, 16 Dec 2024 16:13:48 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id DF4332803EA; Mon, 16 Dec 2024 16:13:48 +1300 (NZDT)
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
	markus.stockhausen@gmx.de
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 1/4] dt-bindings: net: Add Realtek MDIO controller
Date: Mon, 16 Dec 2024 16:13:43 +1300
Message-ID: <20241216031346.2626805-2-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241216031346.2626805-1-chris.packham@alliedtelesis.co.nz>
References: <20241216031346.2626805-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BNQQr0QG c=1 sm=1 tr=0 ts=675f9aed a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=RZcAm9yDv7YA:10 a=gEfo2CItAAAA:8 a=G3VztrOQQWe42Su9FKoA:9 a=3ZKOabzyN94A:10 a=d8afv_qLQQFTBC2_4BOH:22 a=sptkURWiP4Gy88Gu7hUp:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add dtschema for the MDIO controller found in the RTL9300 SoCs. The
controller is slightly unusual in that direct MDIO communication is not
possible. Instead, the SMI bus and PHY address are associated with a
switch port and the port number is used when talking to the PHY.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v2:
    - None

 .../bindings/net/realtek,rtl9301-mdio.yaml    | 82 +++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/realtek,rtl9301=
-mdio.yaml

diff --git a/Documentation/devicetree/bindings/net/realtek,rtl9301-mdio.y=
aml b/Documentation/devicetree/bindings/net/realtek,rtl9301-mdio.yaml
new file mode 100644
index 000000000000..95ed77ff8dcc
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/realtek,rtl9301-mdio.yaml
@@ -0,0 +1,82 @@
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
+allOf:
+  - $ref: mdio.yaml#
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
+  '^ethernet-phy(@[a-f0-9]+)?':
+    type: object
+    $ref: ethernet-phy.yaml#
+
+    properties:
+      reg:
+        description:
+          The MDIO communication on the RTL9300 is abstracted by the swi=
tch. At
+          the software level communication uses the switch port to addre=
ss the
+          PHY with the actual MDIO bus and address having been setup via=
 the
+          realtek,smi-address property.
+
+      realtek,smi-address:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description: SMI interface and address for the connected PHY
+        items:
+          - description: SMI interface number associated with the port.
+          - description: SMI address of the PHY for the port.
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
+    mdio@ca00 {
+        compatible =3D "realtek,rtl9301-mdio";
+        reg =3D <0xca00 0x200>;
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+
+        ethernet-phy@0 {
+            compatible =3D "ethernet-phy-ieee802.3-c45";
+            reg =3D <0>;
+            realtek,smi-address =3D <0 1>;
+        };
+
+        ethernet-phy@8 {
+            compatible =3D "ethernet-phy-ieee802.3-c45";
+            reg =3D <8>;
+            realtek,smi-address =3D <1 1>;
+        };
+    };
--=20
2.47.1


